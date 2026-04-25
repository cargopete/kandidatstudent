mod auth;
mod config;
mod error;
mod handlers;
mod router;
mod state;

use anyhow::Context;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    dotenvy::dotenv().ok();
    tracing_subscriber::fmt()
        .json()
        .with_env_filter(tracing_subscriber::EnvFilter::from_default_env())
        .init();

    let cfg = config::AdminConfig::from_env().context("loading admin config")?;
    let db = persistence::pool::connect(&cfg.database_url).await?;
    let meili = meilisearch_sdk::client::Client::new(&cfg.meili_url, Some(&cfg.meili_key))?;

    let state = state::AdminState {
        db,
        meili,
        cfg: std::sync::Arc::new(cfg),
    };

    let app = router::build(state);
    let listener = tokio::net::TcpListener::bind(("0.0.0.0", 8081)).await?;
    tracing::info!("kandidatstudent-admin listening on :8081");
    axum::serve(
        listener,
        app.into_make_service_with_connect_info::<std::net::SocketAddr>(),
    )
    .await?;
    Ok(())
}
