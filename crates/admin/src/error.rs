use axum::{http::StatusCode, response::{IntoResponse, Response}, Json};
use domain::DomainError;
use serde_json::json;

pub struct AdminError {
    pub status:  StatusCode,
    pub message: String,
}

impl AdminError {
    pub fn not_found(msg: impl Into<String>) -> Self {
        Self { status: StatusCode::NOT_FOUND, message: msg.into() }
    }
    pub fn bad_request(msg: impl Into<String>) -> Self {
        Self { status: StatusCode::BAD_REQUEST, message: msg.into() }
    }
    pub fn internal(msg: impl Into<String>) -> Self {
        Self { status: StatusCode::INTERNAL_SERVER_ERROR, message: msg.into() }
    }
}

impl IntoResponse for AdminError {
    fn into_response(self) -> Response {
        (self.status, Json(json!({"error": self.message}))).into_response()
    }
}

impl From<sqlx::Error> for AdminError {
    fn from(e: sqlx::Error) -> Self {
        Self::internal(e.to_string())
    }
}

impl From<anyhow::Error> for AdminError {
    fn from(e: anyhow::Error) -> Self {
        Self::internal(e.to_string())
    }
}

impl From<DomainError> for AdminError {
    fn from(e: DomainError) -> Self {
        match e {
            DomainError::NotFound(msg) => Self::not_found(msg),
            other => Self::internal(other.to_string()),
        }
    }
}
