use axum::{extract::State, response::IntoResponse, Json};
use persistence::scrape_job::ScrapeJobRepo;
use serde::Deserialize;
use serde_json::json;

use crate::{error::AdminError, state::AdminState};

pub async fn list_jobs(State(s): State<AdminState>) -> Result<impl IntoResponse, AdminError> {
    let repo = ScrapeJobRepo(&s.db);
    let jobs = repo.list_enabled().await?;
    Ok(Json(jobs))
}

#[derive(Deserialize)]
pub struct TriggerBody {
    pub job_id: Option<i64>,
}

pub async fn trigger_job(
    State(s): State<AdminState>,
    Json(body): Json<TriggerBody>,
) -> Result<impl IntoResponse, AdminError> {
    let job_id = body
        .job_id
        .ok_or_else(|| AdminError::bad_request("job_id is required"))?;

    // Mark a run as started — the actual worker picks it up via its own loop
    sqlx::query!(
        "UPDATE scrape_job SET next_run_at = now() WHERE id = $1",
        job_id,
    )
    .execute(&s.db)
    .await?;

    Ok(Json(json!({"accepted": true, "job_id": job_id})))
}

pub async fn list_runs(State(s): State<AdminState>) -> Result<impl IntoResponse, AdminError> {
    let repo = ScrapeJobRepo(&s.db);
    let runs = repo.list_recent_runs(None, 50).await?;
    Ok(Json(runs))
}

pub async fn stats(State(s): State<AdminState>) -> Result<impl IntoResponse, AdminError> {
    let row = sqlx::query!(
        r#"
        SELECT
            (SELECT count(*) FROM institution)      AS institutions,
            (SELECT count(*) FROM professional_field) AS professional_fields,
            (SELECT count(*) FROM specialty)        AS specialties,
            (SELECT count(*) FROM program_offering WHERE is_active) AS programs,
            (SELECT max(last_run_at) FROM scrape_job) AS last_scrape_at
        "#,
    )
    .fetch_one(&s.db)
    .await?;

    Ok(Json(json!({
        "institutions":        row.institutions,
        "professional_fields": row.professional_fields,
        "specialties":         row.specialties,
        "programs":            row.programs,
        "last_scrape_at":      row.last_scrape_at,
    })))
}
