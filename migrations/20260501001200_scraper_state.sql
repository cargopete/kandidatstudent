CREATE TABLE scrape_job (
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kind           scrape_job_kind NOT NULL,
    target_url     TEXT NOT NULL,
    institution_id BIGINT REFERENCES institution(id) ON DELETE CASCADE,
    cron_expr      TEXT NOT NULL,
    runner         TEXT NOT NULL,
    priority       SMALLINT NOT NULL DEFAULT 100,
    is_enabled     BOOLEAN NOT NULL DEFAULT TRUE,
    last_run_at    TIMESTAMPTZ,
    next_run_at    TIMESTAMPTZ,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (kind, target_url)
);

CREATE INDEX scrape_job_next_run_idx ON scrape_job (next_run_at) WHERE is_enabled;

CREATE TABLE scrape_run (
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    scrape_job_id BIGINT NOT NULL REFERENCES scrape_job(id) ON DELETE CASCADE,
    status        scrape_status NOT NULL DEFAULT 'pending',
    started_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
    finished_at   TIMESTAMPTZ,
    rows_found    INTEGER,
    rows_upserted INTEGER,
    rows_deleted  INTEGER,
    error_message TEXT,
    log_s3_key    TEXT,
    snapshot_id   BIGINT REFERENCES raw_source_snapshot(id) ON DELETE SET NULL
);

CREATE INDEX scrape_run_job_started_idx ON scrape_run (scrape_job_id, started_at DESC);
CREATE INDEX scrape_run_status_idx      ON scrape_run (status) WHERE status IN ('running', 'failed');

-- Back-populate FK on raw_source_snapshot
ALTER TABLE raw_source_snapshot
    ADD CONSTRAINT fk_snapshot_run FOREIGN KEY (scrape_run_id)
    REFERENCES scrape_run(id) ON DELETE SET NULL;
