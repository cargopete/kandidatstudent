use axum::{
    extract::{Path, Query, State},
    response::IntoResponse,
    Json,
};
use persistence::{admission_cycle::AdmissionCycleRepo, program_offering::ProgramOfferingRepo};
use serde::Deserialize;
use serde_json::json;

use crate::{error::ApiError, state::AppState};

#[derive(Deserialize, utoipa::IntoParams)]
pub struct ProgramListQuery {
    pub q:                     Option<String>,
    pub institution_slug:      Option<String>,
    pub professional_field_code: Option<String>,
    pub oks_level:             Option<String>,
    pub study_form:            Option<String>,
    pub language:              Option<String>,
    pub city:                  Option<String>,
    pub ownership:             Option<String>,
    pub is_joint:              Option<bool>,
    pub has_internship:        Option<bool>,
    pub funding:               Option<String>,
    #[serde(default = "default_page")]
    pub page:                  i64,
    #[serde(default = "default_page_size")]
    pub page_size:             i64,
}
fn default_page() -> i64 { 1 }
fn default_page_size() -> i64 { 20 }

#[utoipa::path(get, path = "/api/v1/programs", tag = "programs",
    params(ProgramListQuery),
    responses((status = 200, description = "Faceted program search results")))]
pub async fn list_programs(
    State(s): State<AppState>,
    Query(q): Query<ProgramListQuery>,
) -> Result<impl IntoResponse, ApiError> {
    use search::indexes::programs::PROGRAMS_INDEX_UID;

    let index = s.meili.index(PROGRAMS_INDEX_UID);
    let mut filter_parts: Vec<String> = Vec::new();

    if let Some(ref slug) = q.institution_slug {
        filter_parts.push(format!("institution_slug = \"{slug}\""));
    }
    if let Some(ref code) = q.professional_field_code {
        filter_parts.push(format!("professional_field_code = \"{code}\""));
    }
    if let Some(ref level) = q.oks_level {
        filter_parts.push(format!("oks_level = \"{level}\""));
    }
    if let Some(ref form) = q.study_form {
        filter_parts.push(format!("study_form = \"{form}\""));
    }
    if let Some(ref lang) = q.language {
        filter_parts.push(format!("language = \"{lang}\""));
    }
    if let Some(ref city) = q.city {
        filter_parts.push(format!("city = \"{city}\""));
    }
    if let Some(ref own) = q.ownership {
        filter_parts.push(format!("ownership = \"{own}\""));
    }
    if let Some(joint) = q.is_joint {
        filter_parts.push(format!("is_joint = {joint}"));
    }
    if let Some(intern) = q.has_internship {
        filter_parts.push(format!("has_internship = {intern}"));
    }
    if let Some(ref fund) = q.funding {
        filter_parts.push(format!("funding = \"{fund}\""));
    }

    let filter = if filter_parts.is_empty() {
        None
    } else {
        Some(filter_parts.join(" AND "))
    };

    let facets = vec![
        "institution_slug",
        "professional_field_code",
        "study_form",
        "language",
        "oks_level",
    ];

    let start = std::time::Instant::now();
    let mut search = index.search();
    if let Some(ref query) = q.q {
        search.with_query(query);
    }
    if let Some(ref f) = filter {
        search.with_filter(f);
    }
    search.with_facets(meilisearch_sdk::search::Selectors::Some(&facets));
    search.with_limit(q.page_size as usize);
    search.with_offset(((q.page - 1) * q.page_size) as usize);

    let result = search
        .execute::<serde_json::Value>()
        .await
        .map_err(|e| ApiError::internal(e.to_string()))?;

    let took_ms = start.elapsed().as_millis();

    Ok(Json(json!({
        "query":     q.q,
        "total":     result.estimated_total_hits.unwrap_or(0),
        "page":      q.page,
        "page_size": q.page_size,
        "took_ms":   took_ms,
        "facets":    result.facet_distribution,
        "hits":      result.hits.iter().map(|h| &h.result).collect::<Vec<_>>(),
    })))
}

#[utoipa::path(get, path = "/api/v1/programs/{slug}", tag = "programs",
    params(("slug" = String, Path, description = "Program slug")),
    responses((status = 200, description = "Program detail"), (status = 404, description = "Not found")))]
pub async fn get_program(
    State(s): State<AppState>,
    Path(slug): Path<String>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = ProgramOfferingRepo(&s.db);
    let program = repo.get_by_slug(&slug).await.map_err(ApiError::from)?;
    Ok(Json(program))
}

#[utoipa::path(get, path = "/api/v1/programs/{slug}/admissions", tag = "programs",
    params(("slug" = String, Path, description = "Program slug")),
    responses((status = 200, description = "Admission cycles"), (status = 404, description = "Not found")))]
pub async fn get_program_admissions(
    State(s): State<AppState>,
    Path(slug): Path<String>,
) -> Result<impl IntoResponse, ApiError> {
    let prog_repo = ProgramOfferingRepo(&s.db);
    let program = prog_repo.get_by_slug(&slug).await.map_err(ApiError::from)?;
    let cycle_repo = AdmissionCycleRepo(&s.db);
    let cycles = cycle_repo
        .list_for_program(program.id)
        .await
        .map_err(ApiError::from)?;
    Ok(Json(cycles))
}
