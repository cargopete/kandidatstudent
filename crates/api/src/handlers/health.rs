use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use serde_json::json;

use crate::state::AppState;

#[utoipa::path(get, path = "/healthz", tag = "meta",
    responses((status = 200, description = "Alive")))]
pub async fn healthz() -> impl IntoResponse {
    StatusCode::OK
}

#[utoipa::path(get, path = "/readyz", tag = "meta",
    responses((status = 200, description = "Ready"), (status = 503, description = "Not ready")))]
pub async fn readyz(State(s): State<AppState>) -> impl IntoResponse {
    // Cheap ping — just checks the pool can acquire a connection
    match sqlx::query("SELECT 1").fetch_one(&s.db).await {
        Ok(_) => (StatusCode::OK, Json(json!({"status":"ok"}))).into_response(),
        Err(e) => (
            StatusCode::SERVICE_UNAVAILABLE,
            Json(json!({"status":"error","detail":e.to_string()})),
        )
            .into_response(),
    }
}
