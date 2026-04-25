use axum::{extract::State, response::IntoResponse, Json};
use serde::Deserialize;
use serde_json::json;

use crate::{error::AdminError, state::AdminState};

#[derive(Deserialize)]
pub struct RevalidateBody {
    pub tag: String,
}

pub async fn revalidate(
    State(s): State<AdminState>,
    Json(body): Json<RevalidateBody>,
) -> Result<impl IntoResponse, AdminError> {
    let client = reqwest::Client::new();
    let resp = client
        .post(&s.cfg.vercel_revalidate_url)
        .bearer_auth(&s.cfg.vercel_revalidate_secret)
        .json(&json!({"tag": body.tag}))
        .send()
        .await
        .map_err(|e| AdminError::internal(e.to_string()))?;

    Ok(Json(json!({
        "accepted": true,
        "vercel_status": resp.status().as_u16(),
    })))
}
