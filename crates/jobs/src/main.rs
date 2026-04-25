mod config;
mod ingest;
mod worker;

use anyhow::Context;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    dotenvy::dotenv().ok();
    tracing_subscriber::fmt()
        .json()
        .with_env_filter(tracing_subscriber::EnvFilter::from_default_env())
        .init();

    let cfg = config::WorkerConfig::from_env().context("loading worker config")?;
    let db = persistence::pool::connect(&cfg.database_url).await?;
    let meili = meilisearch_sdk::client::Client::new(&cfg.meili_url, Some(&cfg.meili_key))?;

    tracing::info!("kandidatstudent-worker starting");
    worker::run(db, meili, cfg).await
}
