use axum::{
    extract::Request,
    http::{header, StatusCode},
    middleware::Next,
    response::Response,
};
use constant_time_eq::constant_time_eq;

use crate::state::AdminState;

pub async fn require_admin(
    axum::extract::State(state): axum::extract::State<AdminState>,
    req: Request,
    next: Next,
) -> Result<Response, StatusCode> {
    let expected = state.cfg.admin_bearer_token.as_bytes();

    let got = req
        .headers()
        .get(header::AUTHORIZATION)
        .and_then(|v| v.to_str().ok())
        .and_then(|s| s.strip_prefix("Bearer "))
        .ok_or(StatusCode::UNAUTHORIZED)?;

    if constant_time_eq(got.as_bytes(), expected) {
        Ok(next.run(req).await)
    } else {
        Err(StatusCode::UNAUTHORIZED)
    }
}
