CREATE TYPE oks_level AS ENUM (
    'professional_bachelor',
    'bachelor',
    'master',
    'doctor'
);

CREATE TYPE study_form AS ENUM (
    'full_time',
    'part_time',
    'distance',
    'evening',
    'hybrid'
);

CREATE TYPE ownership AS ENUM ('state', 'private', 'military', 'ecclesiastical');

CREATE TYPE funding_source AS ENUM ('state_subsidy', 'paid', 'both');

CREATE TYPE language_code AS ENUM ('bg', 'en', 'de', 'fr', 'ru', 'es', 'it', 'tr', 'other');

CREATE TYPE quota_kind AS ENUM (
    'regular_male', 'regular_female',
    'regular_unisex',
    'paid',
    'foreign_eu', 'foreign_non_eu',
    'disadvantaged', 'teacher_programme'
);

CREATE TYPE unit_kind AS ENUM ('faculty', 'department', 'college', 'institute', 'chair');

CREATE TYPE alias_target AS ENUM ('institution', 'specialty', 'program_offering');

CREATE TYPE scrape_job_kind AS ENUM (
    'institution_list', 'institution_detail', 'faculty_list',
    'program_list', 'program_detail', 'admission_cycle',
    'min_bal_history', 'rsvu_outcomes', 'nacid_dataset'
);

CREATE TYPE scrape_status AS ENUM ('pending', 'running', 'ok', 'failed', 'partial', 'skipped');

CREATE TYPE exam_kind AS ENUM (
    'dze',
    'entry_exam',
    'diploma_grade',
    'portfolio',
    'interview',
    'other'
);
