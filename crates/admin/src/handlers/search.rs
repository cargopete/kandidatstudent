use axum::{extract::State, response::IntoResponse, Json};
use serde_json::json;

use crate::{error::AdminError, state::AdminState};

pub async fn reindex(State(s): State<AdminState>) -> Result<impl IntoResponse, AdminError> {
    let total = search::reindex_all(&s.db, &s.meili)
        .await
        .map_err(|e| AdminError::internal(e.to_string()))?;
    Ok(Json(json!({"accepted": true, "indexed": total})))
}
