use axum::{
    extract::{Path, Query, State},
    response::IntoResponse,
    Json,
};
use persistence::institution::InstitutionRepo;
use serde::Deserialize;

use crate::{error::ApiError, state::AppState};

#[derive(Deserialize, utoipa::IntoParams)]
pub struct ListQuery {
    pub city:      Option<String>,
    pub ownership: Option<String>,
    pub q:         Option<String>,
    #[serde(default = "default_page")]
    pub page:      i64,
    #[serde(default = "default_page_size")]
    pub page_size: i64,
}
fn default_page() -> i64 { 1 }
fn default_page_size() -> i64 { 20 }

#[utoipa::path(get, path = "/api/v1/institutions", tag = "institutions",
    params(ListQuery),
    responses((status = 200, description = "List institutions")))]
pub async fn list_institutions(
    State(s): State<AppState>,
    Query(q): Query<ListQuery>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = InstitutionRepo(&s.db);
    let items = repo
        .list(
            q.city.as_deref(),
            q.ownership.as_deref(),
            q.q.as_deref(),
            q.page,
            q.page_size,
        )
        .await
        .map_err(ApiError::from)?;
    Ok(Json(items))
}

#[utoipa::path(get, path = "/api/v1/institutions/{slug}", tag = "institutions",
    params(("slug" = String, Path, description = "Institution slug")),
    responses((status = 200, description = "Institution detail"), (status = 404, description = "Not found")))]
pub async fn get_institution(
    State(s): State<AppState>,
    Path(slug): Path<String>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = InstitutionRepo(&s.db);
    let inst = repo.get_by_slug(&slug).await.map_err(ApiError::from)?;
    Ok(Json(inst))
}
