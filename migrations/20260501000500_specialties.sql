-- Canonical specialty taxonomy (deduplicated across HEIs)
CREATE TABLE specialty (
    id                    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    slug                  CITEXT NOT NULL UNIQUE,
    canonical_name_bg     TEXT NOT NULL,
    canonical_name_en     TEXT,
    professional_field_id BIGINT NOT NULL REFERENCES professional_field(id),
    description_bg        TEXT,
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    search_tsv            tsvector GENERATED ALWAYS AS (
        setweight(bg_tsv(canonical_name_bg), 'A') ||
        setweight(bg_tsv(coalesce(canonical_name_en, '')), 'B') ||
        setweight(bg_tsv(coalesce(description_bg, '')), 'D')
    ) STORED
);

CREATE INDEX specialty_pf_idx         ON specialty (professional_field_id);
CREATE INDEX specialty_search_tsv_idx ON specialty USING GIN (search_tsv);
CREATE INDEX specialty_name_trgm_idx  ON specialty USING GIN (canonical_name_bg gin_trgm_ops);
