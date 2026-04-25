use domain::{DomainError, ScrapeJob, ScrapeJobId, ScrapeRun, ScrapeRunId};
use sqlx::PgPool;

pub struct ScrapeJobRepo<'a>(pub &'a PgPool);

impl<'a> ScrapeJobRepo<'a> {
    pub async fn list_enabled(&self) -> Result<Vec<ScrapeJob>, DomainError> {
        let rows = sqlx::query_as!(
            ScrapeJob,
            r#"
            SELECT id, kind AS "kind: _", target_url, institution_id,
                   cron_expr, runner, priority, is_enabled,
                   last_run_at, next_run_at, created_at, updated_at
            FROM scrape_job
            WHERE is_enabled = TRUE
            ORDER BY priority ASC, id ASC
            "#,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn mark_run_start(&self, job_id: ScrapeJobId) -> Result<ScrapeRunId, DomainError> {
        let run_id = sqlx::query_scalar!(
            r#"
            INSERT INTO scrape_run (scrape_job_id, status, started_at)
            VALUES ($1, 'running', now())
            RETURNING id
            "#,
            job_id,
        )
        .fetch_one(self.0)
        .await?;
        sqlx::query!(
            "UPDATE scrape_job SET last_run_at = now(), updated_at = now() WHERE id = $1",
            job_id,
        )
        .execute(self.0)
        .await?;
        Ok(run_id)
    }

    pub async fn list_recent_runs(
        &self,
        status_filter: Option<&str>,
        limit: i64,
    ) -> Result<Vec<ScrapeRun>, DomainError> {
        let rows = sqlx::query_as!(
            ScrapeRun,
            r#"
            SELECT id, scrape_job_id, status AS "status: _",
                   started_at, finished_at, rows_found, rows_upserted, rows_deleted,
                   error_message, log_s3_key, snapshot_id
            FROM scrape_run
            WHERE ($1::text IS NULL OR status::text = $1)
            ORDER BY started_at DESC
            LIMIT $2
            "#,
            status_filter,
            limit,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }
}
