# kandidatstudent

Backend for [kandidatstudent.com](https://kandidatstudent.com) — an aggregator of all accredited university programmes in Bulgaria.

## What it does

Scrapes programme data from Bulgarian HEIs (universities), stores it in PostgreSQL, indexes it in Meilisearch, and exposes a read-only REST API consumed by the Next.js frontend.

## Stack

| Layer | Technology |
|-------|-----------|
| Language | Rust (edition 2024, MSRV 1.88) |
| Web framework | Axum 0.8 |
| Database | PostgreSQL 16 (via SQLx 0.8) |
| Search | Meilisearch v1.11 |
| Jobs | Apalis + tokio-cron-scheduler |
| Scraping | reqwest + scraper (HTML), Playwright/Python (JS-heavy sites) |
| Proxy / TLS | Caddy 2 (Cloudflare DNS-01) |
| Deployment | Docker Compose on Hetzner VPS (167.235.29.213) |

## Workspace Crates

```
crates/
├── domain          # shared types, enums, value objects (no I/O)
├── persistence     # SQLx repositories — all DB access goes here
├── search          # Meilisearch client wrapper + index management
├── api             # public read-only HTTP API (port 8080 / 8082 on VPS)
├── admin           # internal admin HTTP API (port 8081 / 8083 on VPS, localhost only)
├── scraper-core    # SiteAdapter trait + shared extraction types
├── scraper-bg      # adapters for Bulgarian HEIs (one module per institution)
├── jobs            # scheduled Apalis job definitions
└── cli             # one-off management commands (seed, re-index, etc.)
```

### API (`crates/api`)

Public, unauthenticated, read-only. Deployed on port 8082 on the VPS.

| Endpoint | Description |
|----------|-------------|
| `GET /api/v1/institutions` | List institutions (`page`, `page_size`, `city`, `ownership`, `q`) |
| `GET /api/v1/institutions/:slug` | Institution detail |
| `GET /api/v1/professional-fields` | All 52 professional fields |
| `GET /api/v1/specialties` | All specialties (`page_size`) |
| `GET /api/v1/programs` | Meilisearch-backed programme search (see below) |
| `GET /api/v1/programs/:slug` | Programme detail |
| `GET /api/v1/search` | Global full-text search |
| `GET /health` | Health check |

The `/programs` endpoint returns a Meilisearch envelope:
```json
{
  "query": null,
  "total": 0,
  "page": 1,
  "page_size": 20,
  "took_ms": 3,
  "facets": { "oks_level": {}, "study_form": {} },
  "hits": []
}
```
Supported filters: `institution_slug`, `professional_field_code`, `oks_level`, `study_form`, `language`, `city`, `ownership`, `funding`, `is_joint`, `has_internship`.

### Admin (`crates/admin`)

Internal API, bearer-token protected, bound to `127.0.0.1:8083` on the VPS. Used by the worker and for manual operations.

| Endpoint | Description |
|----------|-------------|
| `POST /admin/scrape/:institution_slug` | Trigger a scrape run for one institution |
| `POST /admin/search/reindex` | Re-index all programmes in Meilisearch |
| `POST /admin/revalidate` | Trigger Vercel ISR cache revalidation |
| `GET /admin/stats` | Database and index counts |

### Scraper (`crates/scraper-bg`)

One Rust module per institution, each implementing the `SiteAdapter` trait from `scraper-core`:

```rust
trait SiteAdapter {
    fn name(&self) -> &'static str;
    fn institution_slug(&self) -> &'static str;
    fn entry_url(&self) -> &'static str;
    async fn scrape(&self, client: &reqwest::Client) -> anyhow::Result<Vec<ProgramExtract>>;
}
```

Current adapters: `su` (SU Sofia — stub, CSS selectors TBD).

JS-heavy sites that reqwest can't handle are covered by `scraper-py` (Playwright/Python), configured as a Docker Compose profile.

## Database Schema

14 migrations, applied in order by `sqlx migrate run`:

| Migration | Table(s) |
|-----------|----------|
| 000 | Extensions (`uuid-ossp`, `pg_trgm`) |
| 100 | Core enums (ownership, oks_level, study_form, language, funding) |
| 200 | `institution` |
| 300 | `academic_unit` (faculties, departments) |
| 400 | `professional_field` |
| 500 | `specialty` |
| 600 | `program_offering` (main programmes table) |
| 700 | `admission_cycle`, `entrance_exam` |
| 800 | `min_bal_history` (minimum score history) |
| 900 | `salary_outcomes` |
| 1000 | `name_alias`, `joint_programme` |
| 1100 | `raw_source` (scrape snapshots) |
| 1200 | `scraper_state` (per-institution scrape metadata) |
| 1300 | `program_override` (manual data corrections) |

## Local Development

**Prerequisites:** Rust 1.88+, Docker, Docker Compose.

```bash
# Start Postgres + Meilisearch
docker compose up -d postgres meili

# Run migrations
cargo run -p cli -- migrate

# Seed institutions (51 Bulgarian HEIs)
docker cp seeds/institutions.sql kandidatstudent-postgres-1:/tmp/
docker exec -it kandidatstudent-postgres-1 psql -U kandidatstudent -d kandidatstudent -f /tmp/institutions.sql

# Start the public API
cargo run -p api

# Start the admin API (separate terminal)
cargo run -p admin
```

API is available at `http://localhost:8080`, admin at `http://localhost:8081`.

## Environment Variables

Create a `.env` file at the repo root (or set in the environment):

```bash
# Required by api, admin, worker
DATABASE_URL=postgres://kandidatstudent:yourpassword@localhost:5432/kandidatstudent
MEILI_URL=http://localhost:7700
MEILI_MASTER_KEY=your-meili-master-key

# Required by admin
ADMIN_BEARER_TOKEN=your-secret-token

# Required by worker (for ISR revalidation)
ADMIN_API_URL=http://localhost:8081
VERCEL_REVALIDATE_URL=https://kandidatstudent.com/api/revalidate
VERCEL_REVALIDATE_SECRET=your-revalidate-secret

# Required by worker (for S3 snapshot storage)
S3_BUCKET=your-bucket
S3_ENDPOINT=https://...
S3_REGION=eu-central-1
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...

# Required by Caddy (production only)
CF_API_TOKEN=your-cloudflare-token

# Required by postgres Docker image
POSTGRES_PASSWORD=yourpassword
```

## VPS Deployment

The VPS runs the full stack via Docker Compose. The `docker-compose.vps.yml` overlay disables the in-container Caddy (native system Caddy handles TLS), exposes the API on port 8082, and keeps admin on `127.0.0.1:8083`.

```bash
# On the VPS
docker compose -f docker-compose.yml -f docker-compose.vps.yml up -d

# Apply new migrations after a deploy
docker exec -it kandidatstudent-api-1 /app/cli migrate

# Re-seed institutions after schema changes
docker cp seeds/institutions.sql kandidatstudent-postgres-1:/tmp/
docker exec -it kandidatstudent-postgres-1 psql -U kandidatstudent -d kandidatstudent -f /tmp/institutions.sql
```

Backups: `pgbackup` container runs daily PostgreSQL dumps, kept for 7 days / 4 weeks / 6 months.

## Data Sources

- **НАОА** (neaa.government.bg) — institutional accreditation, validity, capacity
- **НАЦИД РВУ** (rvu.nacid.bg) — canonical register of programmes (~2 900 entries)
- **data.egov.bg** — machine-readable НАЦИД datasets
- **РМС 362/05.06.2025** — state-subsidised tuition fees for 2025/2026
- Individual HEI websites — paid tuition, admission details

The `seeds/institutions.sql` file contains all 51 accredited HEIs as of April 2026 (38 state + 4 military + 13 private), derived from the НАОА registry.
