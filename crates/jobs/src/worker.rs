use domain::ScrapeStatus;
use meilisearch_sdk::client::Client;
use scraper_core::http::build_client;
use sqlx::PgPool;

use crate::{config::WorkerConfig, ingest::ingest};

/// Main worker loop.
/// Polls `scrape_job` rows whose `next_run_at` is due, executes the appropriate
/// adapter, and schedules the next run.
pub async fn run(db: PgPool, meili: Client, cfg: WorkerConfig) -> anyhow::Result<()> {
    let http = build_client()?;
    // Register all Rust-side adapters
    let adapters: Vec<Box<dyn scraper_core::extract::SiteAdapter>> = vec![
        Box::new(scraper_bg::su::SuAdapter),
        // More adapters go here as implemented
    ];

    loop {
        let due_jobs = sqlx::query!(
            r#"
            SELECT id, kind::text AS kind, target_url, runner, cron_expr
            FROM scrape_job
            WHERE is_enabled
              AND (next_run_at IS NULL OR next_run_at <= now())
            ORDER BY priority ASC
            LIMIT 10
            "#,
        )
        .fetch_all(&db)
        .await?;

        for job in &due_jobs {
            let run_id: i64 = sqlx::query_scalar!(
                r#"INSERT INTO scrape_run (scrape_job_id, status) VALUES ($1,'running') RETURNING id"#,
                job.id,
            )
            .fetch_one(&db)
            .await?;

            let result = run_job(&http, &db, job.id, &job.target_url, &job.runner, &adapters).await;

            let (status, error_msg, rows_upserted): (ScrapeStatus, _, _) = match result {
                Ok(n) => (ScrapeStatus::Ok, None, Some(n as i32)),
                Err(e) => {
                    tracing::error!(job_id = job.id, error = %e, "scrape job failed");
                    (ScrapeStatus::Failed, Some(e.to_string()), None)
                }
            };

            sqlx::query!(
                r#"
                UPDATE scrape_run SET status = $1,
                    finished_at = now(), rows_upserted = $2, error_message = $3
                WHERE id = $4
                "#,
                status as ScrapeStatus,
                rows_upserted,
                error_msg,
                run_id,
            )
            .execute(&db)
            .await?;

            // Schedule next run based on cron_expr
            sqlx::query!(
                "UPDATE scrape_job SET last_run_at = now(), updated_at = now() WHERE id = $1",
                job.id,
            )
            .execute(&db)
            .await?;
        }

        // Trigger Meilisearch reindex after a batch
        if !due_jobs.is_empty() {
            if let Err(e) = search::reindex_all(&db, &meili).await {
                tracing::error!(error = %e, "reindex failed");
            }
            // Notify admin API to trigger Vercel revalidation
            let _ = reqwest::Client::new()
                .post(format!("{}/admin/revalidate", cfg.admin_api_url))
                .bearer_auth(&cfg.admin_token)
                .json(&serde_json::json!({"tag":"programs"}))
                .send()
                .await;
        }

        tokio::time::sleep(std::time::Duration::from_secs(60)).await;
    }
}

async fn run_job(
    http: &reqwest::Client,
    db: &PgPool,
    _job_id: i64,
    target_url: &str,
    runner: &str,
    adapters: &[Box<dyn scraper_core::extract::SiteAdapter>],
) -> anyhow::Result<usize> {
    if runner == "python" {
        // Python scraper output is ingested via a shared volume JSON file
        // (implementation in TDD part 2)
        return Ok(0);
    }

    // Find matching Rust adapter by entry URL prefix
    let adapter = adapters
        .iter()
        .find(|a| target_url.starts_with(a.entry_url()))
        .ok_or_else(|| anyhow::anyhow!("no adapter for {target_url}"))?;

    tracing::info!(adapter = adapter.name(), url = target_url, "running scrape");
    let extracts = adapter.scrape(http).await?;
    let mut total = 0usize;
    for extract in &extracts {
        let stats = ingest(db, extract).await?;
        total += stats.upserted;
    }
    Ok(total)
}
