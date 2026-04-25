CREATE TABLE institution (
    id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    slug            CITEXT NOT NULL UNIQUE,
    nacid_id        TEXT UNIQUE,
    name_bg         TEXT NOT NULL,
    name_en         TEXT,
    short_name_bg   TEXT NOT NULL,
    ownership       ownership NOT NULL,
    city            TEXT NOT NULL,
    address         TEXT,
    lat             NUMERIC(9, 6),
    lon             NUMERIC(9, 6),
    website_url     TEXT,
    admissions_url  TEXT,
    logo_url        TEXT,
    founded_year    INTEGER CHECK (founded_year BETWEEN 1800 AND 2100),
    rsvu_rank       INTEGER,
    description_bg  TEXT,
    description_en  TEXT,
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    search_tsv      tsvector GENERATED ALWAYS AS (
        setweight(bg_tsv(name_bg), 'A') ||
        setweight(bg_tsv(short_name_bg), 'A') ||
        setweight(bg_tsv(coalesce(name_en, '')), 'B') ||
        setweight(bg_tsv(coalesce(description_bg, '')), 'D')
    ) STORED
);

CREATE INDEX institution_city_idx       ON institution (city);
CREATE INDEX institution_ownership_idx  ON institution (ownership);
CREATE INDEX institution_active_idx     ON institution (is_active) WHERE is_active;
CREATE INDEX institution_search_tsv_idx ON institution USING GIN (search_tsv);
CREATE INDEX institution_name_trgm_idx  ON institution USING GIN (name_bg gin_trgm_ops);
