use bytes::Bytes;
use meilisearch_sdk::client::Client;
use moka::future::Cache;
use sqlx::PgPool;
use std::sync::Arc;

use crate::config::Config;

#[derive(Clone)]
pub struct AppState {
    pub db:    PgPool,
    pub meili: Client,
    pub cache: Cache<String, Bytes>,
    pub cfg:   Arc<Config>,
}
