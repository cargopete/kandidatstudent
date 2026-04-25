use axum::{extract::{Query, State}, response::IntoResponse, Json};
use serde::Deserialize;
use serde_json::json;

use crate::{error::ApiError, state::AppState};

#[derive(Deserialize, utoipa::IntoParams)]
pub struct SearchQuery {
    pub q: String,
    #[serde(default = "default_page_size")]
    pub page_size: i64,
}
fn default_page_size() -> i64 { 20 }

#[utoipa::path(get, path = "/api/v1/search", tag = "search",
    params(SearchQuery),
    responses((status = 200, description = "Cross-entity search results")))]
pub async fn search_programs(
    State(s): State<AppState>,
    Query(q): Query<SearchQuery>,
) -> Result<impl IntoResponse, ApiError> {
    use search::indexes::programs::PROGRAMS_INDEX_UID;

    let index = s.meili.index(PROGRAMS_INDEX_UID);
    let result = index
        .search()
        .with_query(&q.q)
        .with_limit(q.page_size as usize)
        .execute::<serde_json::Value>()
        .await
        .map_err(|e| ApiError::internal(e.to_string()))?;

    Ok(Json(json!({
        "query": q.q,
        "total": result.estimated_total_hits.unwrap_or(0),
        "hits":  result.hits.iter().map(|h| &h.result).collect::<Vec<_>>(),
    })))
}
