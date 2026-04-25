use domain::{DomainError, Specialty, SpecialtyId};
use sqlx::PgPool;

pub struct SpecialtyRepo<'a>(pub &'a PgPool);

impl<'a> SpecialtyRepo<'a> {
    pub async fn list(
        &self,
        professional_field_id: Option<i64>,
        page: i64,
        page_size: i64,
    ) -> Result<Vec<Specialty>, DomainError> {
        let offset = (page - 1) * page_size;
        let rows = sqlx::query_as!(
            Specialty,
            r#"
            SELECT id, slug, canonical_name_bg, canonical_name_en,
                   professional_field_id, description_bg, created_at, updated_at
            FROM specialty
            WHERE ($1::bigint IS NULL OR professional_field_id = $1)
            ORDER BY canonical_name_bg ASC
            LIMIT $2 OFFSET $3
            "#,
            professional_field_id,
            page_size,
            offset,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn get_by_slug(&self, slug: &str) -> Result<Specialty, DomainError> {
        sqlx::query_as!(
            Specialty,
            r#"
            SELECT id, slug, canonical_name_bg, canonical_name_en,
                   professional_field_id, description_bg, created_at, updated_at
            FROM specialty WHERE slug = $1
            "#,
            slug,
        )
        .fetch_optional(self.0)
        .await?
        .ok_or_else(|| DomainError::NotFound(format!("specialty '{slug}'")))
    }

    pub async fn upsert(&self, s: &Specialty) -> Result<SpecialtyId, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id, description_bg)
            VALUES ($1,$2,$3,$4,$5)
            ON CONFLICT (slug) DO UPDATE SET
                canonical_name_bg = EXCLUDED.canonical_name_bg,
                canonical_name_en = EXCLUDED.canonical_name_en,
                professional_field_id = EXCLUDED.professional_field_id,
                description_bg = EXCLUDED.description_bg,
                updated_at = now()
            RETURNING id
            "#,
            s.slug,
            s.canonical_name_bg,
            s.canonical_name_en,
            s.professional_field_id,
            s.description_bg,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
