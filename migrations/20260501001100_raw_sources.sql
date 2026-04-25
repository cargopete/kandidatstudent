-- Raw HTML/PDF snapshot metadata; actual content lives in Hetzner Object Storage.
CREATE TABLE raw_source_snapshot (
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    url           TEXT NOT NULL,
    http_status   SMALLINT,
    content_type  TEXT,
    content_sha256 CHAR(64) NOT NULL,
    s3_bucket     TEXT NOT NULL,
    s3_key        TEXT NOT NULL,
    byte_size     BIGINT,
    fetched_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
    scraper       TEXT NOT NULL,
    scrape_run_id BIGINT,
    UNIQUE (content_sha256)
);

CREATE INDEX rss_url_idx ON raw_source_snapshot (url);

-- Back-populate FKs declared in earlier migrations
ALTER TABLE admission_cycle
    ADD CONSTRAINT fk_adm_cycle_raw FOREIGN KEY (raw_source_snapshot_id)
    REFERENCES raw_source_snapshot(id) ON DELETE SET NULL;

ALTER TABLE min_bal_history
    ADD CONSTRAINT fk_min_bal_raw FOREIGN KEY (raw_source_snapshot_id)
    REFERENCES raw_source_snapshot(id) ON DELETE SET NULL;
