use axum::{
    extract::{Path, State},
    response::IntoResponse,
    Json,
};
use persistence::professional_field::ProfessionalFieldRepo;

use crate::{error::ApiError, state::AppState};

#[utoipa::path(get, path = "/api/v1/professional-fields", tag = "professional-fields",
    responses((status = 200, description = "All 52 professional fields")))]
pub async fn list_professional_fields(
    State(s): State<AppState>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = ProfessionalFieldRepo(&s.db);
    let items = repo.list().await.map_err(ApiError::from)?;
    Ok(Json(items))
}

#[utoipa::path(get, path = "/api/v1/professional-fields/{code}", tag = "professional-fields",
    params(("code" = String, Path, description = "e.g. 4.6")),
    responses((status = 200, description = "Professional field detail"), (status = 404, description = "Not found")))]
pub async fn get_professional_field(
    State(s): State<AppState>,
    Path(code): Path<String>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = ProfessionalFieldRepo(&s.db);
    let pf = repo.get_by_code(&code).await.map_err(ApiError::from)?;
    Ok(Json(pf))
}
