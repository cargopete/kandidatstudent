use axum::{extract::{Query, State}, response::IntoResponse, Json};
use persistence::salary_outcome::SalaryOutcomeRepo;
use serde::Deserialize;

use crate::{error::ApiError, state::AppState};

#[derive(Deserialize, utoipa::IntoParams)]
pub struct OutcomesQuery {
    pub institution_id:        Option<i64>,
    pub professional_field_id: Option<i64>,
}

#[utoipa::path(get, path = "/api/v1/outcomes", tag = "outcomes",
    params(OutcomesQuery),
    responses((status = 200, description = "Salary outcome data")))]
pub async fn list_salary_outcomes(
    State(s): State<AppState>,
    Query(q): Query<OutcomesQuery>,
) -> Result<impl IntoResponse, ApiError> {
    let repo = SalaryOutcomeRepo(&s.db);
    let items = repo
        .list(q.institution_id, q.professional_field_id)
        .await
        .map_err(ApiError::from)?;
    Ok(Json(items))
}
