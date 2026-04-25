-- Annual admission cycle (one row per program_offering per academic year)
CREATE TABLE admission_cycle (
    id                     BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    program_offering_id    BIGINT NOT NULL REFERENCES program_offering(id) ON DELETE CASCADE,
    academic_year          TEXT NOT NULL,
    seats_total            INTEGER CHECK (seats_total >= 0),
    seats_state_subsidised INTEGER,
    seats_paid             INTEGER,
    seats_foreign_eu       INTEGER,
    seats_foreign_non_eu   INTEGER,
    application_opens      DATE,
    application_closes     DATE,
    exam_session_start     DATE,
    exam_session_end       DATE,
    ranking_rounds         SMALLINT DEFAULT 3,
    tuition_bgn            NUMERIC(12, 2),
    tuition_currency       CHAR(3) DEFAULT 'BGN',
    formula_bg             TEXT,
    source_url             TEXT,
    raw_source_snapshot_id BIGINT,
    created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (program_offering_id, academic_year)
);

CREATE INDEX adm_cycle_prog_year_idx ON admission_cycle (program_offering_id, academic_year DESC);

-- Entry exams attached to an admission cycle
CREATE TABLE entry_exam (
    id                 BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admission_cycle_id BIGINT NOT NULL REFERENCES admission_cycle(id) ON DELETE CASCADE,
    exam_kind          exam_kind NOT NULL,
    subject_bg         TEXT NOT NULL,
    weight             NUMERIC(5, 3) NOT NULL CHECK (weight >= 0 AND weight <= 10),
    is_mandatory       BOOLEAN NOT NULL DEFAULT TRUE,
    is_alternative     BOOLEAN NOT NULL DEFAULT FALSE,
    alternative_group  SMALLINT,
    min_score          NUMERIC(5, 2),
    notes_bg           TEXT,
    created_at         TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX entry_exam_cycle_idx ON entry_exam (admission_cycle_id);
