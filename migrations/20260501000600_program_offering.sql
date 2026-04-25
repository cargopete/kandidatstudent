-- Core entity: one row per (HEI × specialty × OKS × form × language × branch).
CREATE TABLE program_offering (
    id                    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    slug                  CITEXT NOT NULL UNIQUE,
    institution_id        BIGINT NOT NULL REFERENCES institution(id),
    branch_id             BIGINT REFERENCES institution_branch(id),
    academic_unit_id      BIGINT REFERENCES academic_unit(id),
    specialty_id          BIGINT NOT NULL REFERENCES specialty(id),
    professional_field_id BIGINT NOT NULL REFERENCES professional_field(id),
    oks_level             oks_level NOT NULL,
    study_form            study_form NOT NULL,
    language              language_code NOT NULL DEFAULT 'bg',
    duration_semesters    SMALLINT NOT NULL CHECK (duration_semesters BETWEEN 2 AND 16),
    ects_credits          SMALLINT CHECK (ects_credits BETWEEN 30 AND 480),
    tuition_bgn_per_year  NUMERIC(12, 2) CHECK (tuition_bgn_per_year >= 0),
    tuition_currency      CHAR(3) NOT NULL DEFAULT 'BGN',
    funding               funding_source NOT NULL DEFAULT 'both',
    is_joint              BOOLEAN NOT NULL DEFAULT FALSE,
    has_internship        BOOLEAN NOT NULL DEFAULT FALSE,
    title_bg              TEXT NOT NULL,
    title_en              TEXT,
    description_bg        TEXT,
    learning_outcomes_bg  TEXT,
    career_prospects_bg   TEXT,
    curriculum_url        TEXT,
    program_page_url      TEXT,
    accreditation_until   DATE,
    is_active             BOOLEAN NOT NULL DEFAULT TRUE,
    first_seen_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
    last_verified_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    search_tsv            tsvector GENERATED ALWAYS AS (
        setweight(bg_tsv(title_bg), 'A') ||
        setweight(bg_tsv(coalesce(title_en, '')), 'B') ||
        setweight(bg_tsv(coalesce(description_bg, '')), 'C') ||
        setweight(bg_tsv(coalesce(career_prospects_bg, '')), 'D')
    ) STORED
);

-- COALESCE in UNIQUE requires an index, not a table constraint
CREATE UNIQUE INDEX prog_unique_offering_idx ON program_offering
    (institution_id, specialty_id, oks_level, study_form, language, COALESCE(branch_id, 0));

CREATE INDEX prog_inst_idx      ON program_offering (institution_id);
CREATE INDEX prog_spec_idx      ON program_offering (specialty_id);
CREATE INDEX prog_pf_idx        ON program_offering (professional_field_id);
CREATE INDEX prog_oks_form_idx  ON program_offering (oks_level, study_form);
CREATE INDEX prog_lang_idx      ON program_offering (language);
CREATE INDEX prog_active_idx    ON program_offering (is_active) WHERE is_active;
CREATE INDEX prog_search_idx    ON program_offering USING GIN (search_tsv);
CREATE INDEX prog_title_trgm    ON program_offering USING GIN (title_bg gin_trgm_ops);
CREATE INDEX prog_facets_idx    ON program_offering (professional_field_id, oks_level, study_form)
    WHERE is_active;
