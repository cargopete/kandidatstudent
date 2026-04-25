use domain::{DomainError, InstitutionId, ProfessionalFieldId, SalaryOutcome};
use sqlx::PgPool;

pub struct SalaryOutcomeRepo<'a>(pub &'a PgPool);

impl<'a> SalaryOutcomeRepo<'a> {
    pub async fn list(
        &self,
        institution_id: Option<InstitutionId>,
        professional_field_id: Option<ProfessionalFieldId>,
    ) -> Result<Vec<SalaryOutcome>, DomainError> {
        let rows = sqlx::query_as!(
            SalaryOutcome,
            r#"
            SELECT id, institution_id, professional_field_id, academic_year,
                   avg_monthly_income_bgn, unemployment_pct,
                   employed_in_field_pct, higher_ed_job_pct,
                   source, source_url, created_at
            FROM salary_outcome
            WHERE ($1::bigint IS NULL OR institution_id = $1)
              AND ($2::bigint IS NULL OR professional_field_id = $2)
            ORDER BY academic_year DESC
            "#,
            institution_id,
            professional_field_id,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn upsert(&self, so: &SalaryOutcome) -> Result<i64, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO salary_outcome
                (institution_id, professional_field_id, academic_year,
                 avg_monthly_income_bgn, unemployment_pct,
                 employed_in_field_pct, higher_ed_job_pct, source, source_url)
            VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
            ON CONFLICT (institution_id, professional_field_id, academic_year, source)
            DO UPDATE SET
                avg_monthly_income_bgn = EXCLUDED.avg_monthly_income_bgn,
                unemployment_pct       = EXCLUDED.unemployment_pct,
                employed_in_field_pct  = EXCLUDED.employed_in_field_pct,
                higher_ed_job_pct      = EXCLUDED.higher_ed_job_pct,
                source_url             = EXCLUDED.source_url
            RETURNING id
            "#,
            so.institution_id,
            so.professional_field_id,
            so.academic_year,
            so.avg_monthly_income_bgn,
            so.unemployment_pct,
            so.employed_in_field_pct,
            so.higher_ed_job_pct,
            so.source,
            so.source_url,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
