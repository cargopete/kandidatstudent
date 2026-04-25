use axum::{
    http::StatusCode,
    response::{IntoResponse, Response},
    Json,
};
use domain::DomainError;
use serde_json::json;
use uuid::Uuid;

/// RFC 7807 Problem+JSON response.
pub struct ApiError {
    status:  StatusCode,
    type_:   &'static str,
    title:   &'static str,
    detail:  String,
    path:    String,
}

impl ApiError {
    pub fn not_found(detail: impl Into<String>, path: impl Into<String>) -> Self {
        Self {
            status:  StatusCode::NOT_FOUND,
            type_:   "https://kandidatstudent.bg/problems/not-found",
            title:   "Not Found",
            detail:  detail.into(),
            path:    path.into(),
        }
    }

    pub fn internal(detail: impl Into<String>) -> Self {
        Self {
            status:  StatusCode::INTERNAL_SERVER_ERROR,
            type_:   "https://kandidatstudent.bg/problems/internal",
            title:   "Internal Server Error",
            detail:  detail.into(),
            path:    String::new(),
        }
    }
}

impl IntoResponse for ApiError {
    fn into_response(self) -> Response {
        let trace_id = Uuid::now_v7().to_string();
        let body = json!({
            "type":     self.type_,
            "title":    self.title,
            "status":   self.status.as_u16(),
            "detail":   self.detail,
            "instance": self.path,
            "trace_id": trace_id,
        });
        (self.status, Json(body)).into_response()
    }
}

impl From<DomainError> for ApiError {
    fn from(e: DomainError) -> Self {
        match e {
            DomainError::NotFound(msg) => Self::not_found(msg, ""),
            other => {
                tracing::error!(error = %other, "unhandled domain error");
                Self::internal(other.to_string())
            }
        }
    }
}
