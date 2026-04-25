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

    let cfg = config::Config::from_env().context("loading config")?;
    let db = persistence::pool::connect(&cfg.database_url).await?;
    sqlx::migrate!("../../migrations").run(&db).await?;

    let meili = meilisearch_sdk::client::Client::new(&cfg.meili_url, Some(&cfg.meili_key))?;
    let cache = moka::future::Cache::builder()
        .max_capacity(10_000)
        .time_to_live(std::time::Duration::from_secs(300))
        .build();

    let state = state::AppState {
        db,
        meili,
        cache,
        cfg: std::sync::Arc::new(cfg),
    };

    let (app, api_doc) = router::build(state).split_for_parts();
    let openapi_json = serde_json::to_string(&api_doc)?;
    let app = app.route(
        "/openapi.json",
        axum::routing::get(move || async move {
            axum::response::Response::builder()
                .header("content-type", "application/json")
                .body(axum::body::Body::from(openapi_json))
                .unwrap()
        }),
    );

    let listener = tokio::net::TcpListener::bind(("0.0.0.0", 8080)).await?;
    tracing::info!("kandidatstudent-api listening on :8080");
    axum::serve(
        listener,
        app.into_make_service_with_connect_info::<std::net::SocketAddr>(),
    )
    .await?;
    Ok(())
}
