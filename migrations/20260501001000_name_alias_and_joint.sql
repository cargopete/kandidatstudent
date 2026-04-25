-- Name aliases for institutions, specialties, and program offerings
CREATE TABLE name_alias (
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    target_kind alias_target NOT NULL,
    target_id   BIGINT NOT NULL,
    alias_bg    TEXT NOT NULL,
    alias_en    TEXT,
    valid_from  DATE,
    valid_to    DATE,
    note        TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (target_kind, target_id, alias_bg)
);

CREATE INDEX name_alias_target_idx ON name_alias (target_kind, target_id);
CREATE INDEX name_alias_alias_trgm ON name_alias USING GIN (alias_bg gin_trgm_ops);

-- Joint programmes with foreign HEIs
CREATE TABLE joint_program (
    id                   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    program_offering_id  BIGINT NOT NULL REFERENCES program_offering(id) ON DELETE CASCADE,
    partner_name         TEXT NOT NULL,
    partner_country_iso2 CHAR(2) NOT NULL,
    partner_website_url  TEXT,
    agreement_type       TEXT,
    created_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX joint_program_prog_idx ON joint_program (program_offering_id);
