-- Extensions required by kandidatstudent schema
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS unaccent;
CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS btree_gin;

-- Bulgarian full-text search configuration.
-- Relies on quasoft/postgres-tsearch-bulgarian ispell files
-- (bulgarian.affix, bulgarian.dict, bulgarian.stop) placed in
-- $SHAREDIR/tsearch_data/ by the Docker image build step.
-- Source: https://github.com/quasoft/postgres-tsearch-bulgarian
CREATE TEXT SEARCH DICTIONARY bulgarian_ispell (
    TEMPLATE  = ispell,
    DictFile  = bulgarian,
    AffFile   = bulgarian,
    StopWords = bulgarian
);
CREATE TEXT SEARCH DICTIONARY bulgarian_simple (
    TEMPLATE  = pg_catalog.simple,
    STOPWORDS = bulgarian
);
CREATE TEXT SEARCH CONFIGURATION bulgarian ( COPY = simple );
ALTER TEXT SEARCH CONFIGURATION bulgarian
    ALTER MAPPING FOR asciiword, asciihword, hword, hword_part, word
    WITH bulgarian_ispell, bulgarian_simple;

-- Immutable helper used in generated tsvector columns
CREATE OR REPLACE FUNCTION bg_tsv(txt text) RETURNS tsvector
    LANGUAGE sql IMMUTABLE PARALLEL SAFE AS
    $$ SELECT to_tsvector('bulgarian'::regconfig, coalesce(txt, '')) $$;
