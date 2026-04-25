use anyhow::Context;
use std::env;

mod config;
mod seed;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    dotenvy::dotenv().ok();
    tracing_subscriber::fmt()
        .with_env_filter(tracing_subscriber::EnvFilter::from_default_env())
        .init();

    let args: Vec<String> = env::args().collect();
    let cmd = args.get(1).map(String::as_str).unwrap_or("help");

    let cfg = config::CliConfig::from_env()?;
    let db = persistence::pool::connect(&cfg.database_url)
        .await
        .context("connecting to database")?;

    match cmd {
        "seed" => {
            tracing::info!("seeding database");
            seed::run(&db).await?;
            tracing::info!("seed complete");
        }
        "reindex" => {
            let meili = meilisearch_sdk::client::Client::new(&cfg.meili_url, Some(&cfg.meili_key))?;
            tracing::info!("reindexing Meilisearch");
            let n = search::reindex_all(&db, &meili).await?;
            tracing::info!(indexed = n, "reindex complete");
        }
        "migrate" => {
            sqlx::migrate!("../../migrations").run(&db).await?;
            tracing::info!("migrations applied");
        }
        _ => {
            eprintln!("kandidatstudent-cli <command>");
            eprintln!("  seed     — load seed data (institutions, professional fields)");
            eprintln!("  reindex  — rebuild Meilisearch index from Postgres");
            eprintln!("  migrate  — apply pending SQL migrations");
        }
    }

    Ok(())
}
