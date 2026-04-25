use domain::{DomainError, ProgramOffering, ProgramOfferingId};
use sqlx::PgPool;

pub struct ProgramOfferingRepo<'a>(pub &'a PgPool);

impl<'a> ProgramOfferingRepo<'a> {
    pub async fn get_by_slug(&self, slug: &str) -> Result<ProgramOffering, DomainError> {
        sqlx::query_as!(
            ProgramOffering,
            r#"
            SELECT
                id, slug, institution_id, branch_id, academic_unit_id,
                specialty_id, professional_field_id,
                oks_level       AS "oks_level: _",
                study_form      AS "study_form: _",
                language        AS "language: _",
                duration_semesters, ects_credits,
                tuition_bgn_per_year, tuition_currency,
                funding         AS "funding: _",
                is_joint, has_internship,
                title_bg, title_en, description_bg,
                learning_outcomes_bg, career_prospects_bg,
                curriculum_url, program_page_url, accreditation_until,
                is_active, first_seen_at, last_verified_at, created_at, updated_at
            FROM program_offering
            WHERE slug = $1
            "#,
            slug,
        )
        .fetch_optional(self.0)
        .await?
        .ok_or_else(|| DomainError::NotFound(format!("program '{slug}'")))
    }

    pub async fn list_by_institution(
        &self,
        institution_id: i64,
        page: i64,
        page_size: i64,
    ) -> Result<Vec<ProgramOffering>, DomainError> {
        let offset = (page - 1) * page_size;
        let rows = sqlx::query_as!(
            ProgramOffering,
            r#"
            SELECT
                id, slug, institution_id, branch_id, academic_unit_id,
                specialty_id, professional_field_id,
                oks_level       AS "oks_level: _",
                study_form      AS "study_form: _",
                language        AS "language: _",
                duration_semesters, ects_credits,
                tuition_bgn_per_year, tuition_currency,
                funding         AS "funding: _",
                is_joint, has_internship,
                title_bg, title_en, description_bg,
                learning_outcomes_bg, career_prospects_bg,
                curriculum_url, program_page_url, accreditation_until,
                is_active, first_seen_at, last_verified_at, created_at, updated_at
            FROM program_offering
            WHERE institution_id = $1 AND is_active
            ORDER BY oks_level, title_bg
            LIMIT $2 OFFSET $3
            "#,
            institution_id,
            page_size,
            offset,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn upsert(&self, p: &ProgramOffering) -> Result<ProgramOfferingId, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO program_offering (
                slug, institution_id, branch_id, academic_unit_id,
                specialty_id, professional_field_id,
                oks_level, study_form, language,
                duration_semesters, ects_credits,
                tuition_bgn_per_year, tuition_currency, funding,
                is_joint, has_internship,
                title_bg, title_en, description_bg,
                learning_outcomes_bg, career_prospects_bg,
                curriculum_url, program_page_url, accreditation_until,
                is_active, last_verified_at
            ) VALUES (
                $1,$2,$3,$4,$5,$6,
                $7::oks_level, $8::study_form, $9::language_code,
                $10,$11,$12,$13,$14::funding_source,
                $15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26
            )
            ON CONFLICT (slug) DO UPDATE SET
                branch_id             = EXCLUDED.branch_id,
                academic_unit_id      = EXCLUDED.academic_unit_id,
                oks_level             = EXCLUDED.oks_level,
                study_form            = EXCLUDED.study_form,
                language              = EXCLUDED.language,
                duration_semesters    = EXCLUDED.duration_semesters,
                ects_credits          = EXCLUDED.ects_credits,
                tuition_bgn_per_year  = EXCLUDED.tuition_bgn_per_year,
                funding               = EXCLUDED.funding,
                is_joint              = EXCLUDED.is_joint,
                has_internship        = EXCLUDED.has_internship,
                title_bg              = EXCLUDED.title_bg,
                title_en              = EXCLUDED.title_en,
                description_bg        = EXCLUDED.description_bg,
                learning_outcomes_bg  = EXCLUDED.learning_outcomes_bg,
                career_prospects_bg   = EXCLUDED.career_prospects_bg,
                curriculum_url        = EXCLUDED.curriculum_url,
                program_page_url      = EXCLUDED.program_page_url,
                accreditation_until   = EXCLUDED.accreditation_until,
                is_active             = EXCLUDED.is_active,
                last_verified_at      = EXCLUDED.last_verified_at,
                updated_at            = now()
            RETURNING id
            "#,
            p.slug,
            p.institution_id,
            p.branch_id,
            p.academic_unit_id,
            p.specialty_id,
            p.professional_field_id,
            p.oks_level as _,
            p.study_form as _,
            p.language as _,
            p.duration_semesters,
            p.ects_credits,
            p.tuition_bgn_per_year,
            p.tuition_currency,
            p.funding as _,
            p.is_joint,
            p.has_internship,
            p.title_bg,
            p.title_en,
            p.description_bg,
            p.learning_outcomes_bg,
            p.career_prospects_bg,
            p.curriculum_url,
            p.program_page_url,
            p.accreditation_until,
            p.is_active,
            p.last_verified_at,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
