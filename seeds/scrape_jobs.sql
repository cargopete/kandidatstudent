-- Seed: initial scrape jobs for implemented Rust adapters
-- Add one row per (kind, target_url) — worker matches by target_url prefix

INSERT INTO scrape_job (kind, target_url, institution_id, cron_expr, runner, priority)
SELECT
    'program_list'::scrape_job_kind,
    'https://www.uni-sofia.bg',
    i.id,
    '0 3 * * 0',  -- weekly, Sunday 03:00 UTC
    'rust',
    10
FROM institution i WHERE i.slug = 'su-sofia'
ON CONFLICT (kind, target_url) DO NOTHING;

SELECT id, kind, runner, cron_expr FROM scrape_job;
