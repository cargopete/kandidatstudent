-- Historical minimum балове per program / year / quota / ranking round
CREATE TABLE min_bal_history (
    id                     BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    program_offering_id    BIGINT NOT NULL REFERENCES program_offering(id) ON DELETE CASCADE,
    academic_year          TEXT NOT NULL,
    quota                  quota_kind NOT NULL,
    ranking_round          SMALLINT NOT NULL CHECK (ranking_round BETWEEN 1 AND 5),
    min_bal                NUMERIC(6, 3) NOT NULL,
    max_bal                NUMERIC(6, 3),
    seats_filled           INTEGER,
    source_url             TEXT,
    raw_source_snapshot_id BIGINT,
    created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (program_offering_id, academic_year, quota, ranking_round)
);

CREATE INDEX min_bal_hist_prog_idx  ON min_bal_history (program_offering_id, academic_year DESC);
CREATE INDEX min_bal_hist_quota_idx ON min_bal_history (quota, academic_year DESC);
