use axum::{
    extract::{Path, State},
    response::IntoResponse,
    Json,
};
use serde::Deserialize;
use serde_json::json;

use crate::{error::AdminError, state::AdminState};

#[derive(Deserialize)]
pub struct OverrideBody {
    pub field_name:      String,
    pub override_value:  Option<String>,
    pub reason:          Option<String>,
}

pub async fn apply_override(
    State(s): State<AdminState>,
    Path(program_id): Path<i64>,
    Json(body): Json<OverrideBody>,
) -> Result<impl IntoResponse, AdminError> {
    sqlx::query!(
        r#"
        INSERT INTO program_override (program_offering_id, field_name, override_value, reason)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (program_offering_id, field_name) DO UPDATE SET
            override_value = EXCLUDED.override_value,
            reason         = EXCLUDED.reason,
            applied_at     = now()
        "#,
        program_id,
        body.field_name,
        body.override_value,
        body.reason,
    )
    .execute(&s.db)
    .await?;

    Ok(Json(json!({"ok": true})))
}

pub async fn delete_override(
    State(s): State<AdminState>,
    Path((program_id, field_name)): Path<(i64, String)>,
) -> Result<impl IntoResponse, AdminError> {
    sqlx::query!(
        "DELETE FROM program_override WHERE program_offering_id = $1 AND field_name = $2",
        program_id,
        field_name,
    )
    .execute(&s.db)
    .await?;

    Ok(Json(json!({"ok": true})))
}
