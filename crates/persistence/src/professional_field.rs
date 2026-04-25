use domain::{DomainError, ProfessionalField, ProfessionalFieldId};
use sqlx::PgPool;

pub struct ProfessionalFieldRepo<'a>(pub &'a PgPool);

impl<'a> ProfessionalFieldRepo<'a> {
    pub async fn list(&self) -> Result<Vec<ProfessionalField>, DomainError> {
        let rows = sqlx::query_as!(
            ProfessionalField,
            r#"
            SELECT id, code, area_code, area_name_bg, name_bg, name_en,
                   is_priority, is_protected, is_regulated, created_at
            FROM professional_field
            ORDER BY code ASC
            "#,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn get_by_code(&self, code: &str) -> Result<ProfessionalField, DomainError> {
        sqlx::query_as!(
            ProfessionalField,
            r#"
            SELECT id, code, area_code, area_name_bg, name_bg, name_en,
                   is_priority, is_protected, is_regulated, created_at
            FROM professional_field
            WHERE code = $1
            "#,
            code,
        )
        .fetch_optional(self.0)
        .await?
        .ok_or_else(|| DomainError::NotFound(format!("professional field '{code}'")))
    }

    pub async fn upsert(&self, pf: &ProfessionalField) -> Result<ProfessionalFieldId, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO professional_field
                (code, area_code, area_name_bg, name_bg, name_en, is_priority, is_protected, is_regulated)
            VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
            ON CONFLICT (code) DO UPDATE SET
                area_code    = EXCLUDED.area_code,
                area_name_bg = EXCLUDED.area_name_bg,
                name_bg      = EXCLUDED.name_bg,
                name_en      = EXCLUDED.name_en,
                is_priority  = EXCLUDED.is_priority,
                is_protected = EXCLUDED.is_protected,
                is_regulated = EXCLUDED.is_regulated
            RETURNING id
            "#,
            pf.code,
            pf.area_code,
            pf.area_name_bg,
            pf.name_bg,
            pf.name_en,
            pf.is_priority,
            pf.is_protected,
            pf.is_regulated,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
