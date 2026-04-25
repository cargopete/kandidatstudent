-- Editorial overrides applied on top of scraped data.
-- The scraper merge routine never writes to fields whose override keys exist here.
CREATE TABLE program_override (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    program_offering_id BIGINT NOT NULL REFERENCES program_offering(id) ON DELETE CASCADE,
    field_name          TEXT NOT NULL,
    override_value      TEXT,
    reason              TEXT,
    applied_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    applied_by          TEXT NOT NULL DEFAULT 'admin',
    UNIQUE (program_offering_id, field_name)
);
