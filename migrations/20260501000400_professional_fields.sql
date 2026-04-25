-- 52 professional fields from ПМС 125/2002, as amended.
CREATE TABLE professional_field (
    id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code         TEXT NOT NULL UNIQUE,
    area_code    TEXT NOT NULL,
    area_name_bg TEXT NOT NULL,
    name_bg      TEXT NOT NULL,
    name_en      TEXT,
    is_priority  BOOLEAN NOT NULL DEFAULT FALSE,
    is_protected BOOLEAN NOT NULL DEFAULT FALSE,
    is_regulated BOOLEAN NOT NULL DEFAULT FALSE,
    created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX professional_field_area_idx ON professional_field (area_code);
