CREATE TABLE institution_branch (
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    institution_id BIGINT NOT NULL REFERENCES institution(id) ON DELETE CASCADE,
    slug           CITEXT NOT NULL,
    name_bg        TEXT NOT NULL,
    city           TEXT NOT NULL,
    address        TEXT,
    lat            NUMERIC(9, 6),
    lon            NUMERIC(9, 6),
    is_active      BOOLEAN NOT NULL DEFAULT TRUE,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (institution_id, slug)
);

CREATE INDEX institution_branch_inst_idx ON institution_branch (institution_id);

CREATE TABLE academic_unit (
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    institution_id BIGINT NOT NULL REFERENCES institution(id) ON DELETE CASCADE,
    parent_id      BIGINT REFERENCES academic_unit(id) ON DELETE SET NULL,
    branch_id      BIGINT REFERENCES institution_branch(id) ON DELETE SET NULL,
    kind           unit_kind NOT NULL,
    slug           CITEXT NOT NULL,
    name_bg        TEXT NOT NULL,
    name_en        TEXT,
    website_url    TEXT,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (institution_id, slug)
);

CREATE INDEX academic_unit_inst_idx   ON academic_unit (institution_id);
CREATE INDEX academic_unit_parent_idx ON academic_unit (parent_id);
