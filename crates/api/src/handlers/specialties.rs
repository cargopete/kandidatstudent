use axum::{
    extract::{Path, Query, State},
    response::IntoResponse,
    Json,
};
use persistence::specialty::SpecialtyRepo;
use serde::Deserialize;

use crate::{error::ApiError, state::AppState};

#[derive(Deserialize, utoipa::IntoParams)]
pub struct SpecialtyListQuery {
    pub professional_field_id: Option<i64>,
    #[serde(default = "default_page")]
    pub page:      i64,
    #[serde(default = "default_page_size")]
    pub page_size: i64,
}
fn default_page() -> i64 { 1 }
fn default_page_size() -> i64 { 20 }

#[utoipa::path(get, path = "/api/v1/specialties", tag = "specialties",
    params(SpecialtyListQuery),
    responses((status = 200, description = "Paginated specialties")))]
pub async fn list_specialties(
    State(s): State<AppState>,
    Query(q): Query<SpecialtyListQuery>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = SpecialtyRepo(&s.db);
    let items = repo
        .list(q.professional_field_id, q.page, q.page_size)
        .await
        .map_err(ApiError::from)?;
    Ok(Json(items))
}

#[utoipa::path(get, path = "/api/v1/specialties/{slug}", tag = "specialties",
    params(("slug" = String, Path, description = "Specialty slug")),
    responses((status = 200, description = "Specialty detail"), (status = 404, description = "Not found")))]
pub async fn get_specialty(
    State(s): State<AppState>,
    Path(slug): Path<String>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = SpecialtyRepo(&s.db);
    let s_ = repo.get_by_slug(&slug).await.map_err(ApiError::from)?;
    Ok(Json(s_))
}
