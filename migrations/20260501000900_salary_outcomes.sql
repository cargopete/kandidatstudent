-- One row per (institution × professional_field × academic_year).
-- Source: РСВУ (rsvu.mon.bg) and НОИ data.
CREATE TABLE salary_outcome (
    id                     BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    institution_id         BIGINT NOT NULL REFERENCES institution(id),
    professional_field_id  BIGINT NOT NULL REFERENCES professional_field(id),
    academic_year          TEXT NOT NULL,
    avg_monthly_income_bgn NUMERIC(10, 2),
    unemployment_pct       NUMERIC(5, 2),
    employed_in_field_pct  NUMERIC(5, 2),
    higher_ed_job_pct      NUMERIC(5, 2),
    source                 TEXT NOT NULL DEFAULT 'rsvu',
    source_url             TEXT,
    created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (institution_id, professional_field_id, academic_year, source)
);

CREATE INDEX salary_outcome_inst_pf_idx ON salary_outcome (institution_id, professional_field_id);
