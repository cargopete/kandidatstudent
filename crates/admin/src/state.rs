use meilisearch_sdk::client::Client;
use sqlx::PgPool;
use std::sync::Arc;

use crate::config::AdminConfig;

#[derive(Clone)]
pub struct AdminState {
    pub db:    PgPool,
    pub meili: Client,
    pub cfg:   Arc<AdminConfig>,
}
