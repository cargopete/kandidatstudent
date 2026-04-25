use domain::{DomainError, Institution, InstitutionId};
use sqlx::PgPool;

pub struct InstitutionRepo<'a>(pub &'a PgPool);

impl<'a> InstitutionRepo<'a> {
    pub async fn list(
        &self,
        city: Option<&str>,
        ownership: Option<&str>,
        q: Option<&str>,
        page: i64,
        page_size: i64,
    ) -> Result<Vec<Institution>, DomainError> {
        let offset = (page - 1) * page_size;
        let rows = sqlx::query_as!(
            Institution,
            r#"
            SELECT
                id, slug, nacid_id, name_bg, name_en, short_name_bg,
                ownership AS "ownership: _",
                city, address,
                lat::numeric AS lat,
                lon::numeric AS lon,
                website_url, admissions_url, logo_url, founded_year, rsvu_rank,
                description_bg, description_en, is_active, created_at, updated_at
            FROM institution
            WHERE is_active
              AND ($1::text IS NULL OR city = $1)
              AND ($2::text IS NULL OR ownership::text = $2)
              AND ($3::text IS NULL OR search_tsv @@ plainto_tsquery('bulgarian', $3))
            ORDER BY rsvu_rank ASC NULLS LAST, name_bg ASC
            LIMIT $4 OFFSET $5
            "#,
            city,
            ownership,
            q,
            page_size,
            offset,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn get_by_slug(&self, slug: &str) -> Result<Institution, DomainError> {
        sqlx::query_as!(
            Institution,
            r#"
            SELECT
                id, slug, nacid_id, name_bg, name_en, short_name_bg,
                ownership AS "ownership: _",
                city, address,
                lat::numeric AS lat,
                lon::numeric AS lon,
                website_url, admissions_url, logo_url, founded_year, rsvu_rank,
                description_bg, description_en, is_active, created_at, updated_at
            FROM institution
            WHERE slug = $1
            "#,
            slug,
        )
        .fetch_optional(self.0)
        .await?
        .ok_or_else(|| DomainError::NotFound(format!("institution '{slug}'")))
    }

    pub async fn upsert(&self, inst: &Institution) -> Result<InstitutionId, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO institution (
                slug, nacid_id, name_bg, name_en, short_name_bg, ownership,
                city, address, lat, lon, website_url, admissions_url, logo_url,
                founded_year, rsvu_rank, description_bg, description_en, is_active
            ) VALUES ($1,$2,$3,$4,$5,$6::ownership,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18)
            ON CONFLICT (slug) DO UPDATE SET
                nacid_id = EXCLUDED.nacid_id,
                name_bg = EXCLUDED.name_bg,
                name_en = EXCLUDED.name_en,
                short_name_bg = EXCLUDED.short_name_bg,
                city = EXCLUDED.city,
                address = EXCLUDED.address,
                lat = EXCLUDED.lat,
                lon = EXCLUDED.lon,
                website_url = EXCLUDED.website_url,
                admissions_url = EXCLUDED.admissions_url,
                logo_url = EXCLUDED.logo_url,
                founded_year = EXCLUDED.founded_year,
                rsvu_rank = EXCLUDED.rsvu_rank,
                description_bg = EXCLUDED.description_bg,
                description_en = EXCLUDED.description_en,
                is_active = EXCLUDED.is_active,
                updated_at = now()
            RETURNING id
            "#,
            inst.slug,
            inst.nacid_id,
            inst.name_bg,
            inst.name_en,
            inst.short_name_bg,
            inst.ownership as _,
            inst.city,
            inst.address,
            inst.lat,
            inst.lon,
            inst.website_url,
            inst.admissions_url,
            inst.logo_url,
            inst.founded_year,
            inst.rsvu_rank,
            inst.description_bg,
            inst.description_en,
            inst.is_active,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
