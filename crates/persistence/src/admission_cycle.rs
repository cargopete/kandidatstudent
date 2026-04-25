use domain::{AdmissionCycle, AdmissionCycleId, DomainError, ProgramOfferingId};
use sqlx::PgPool;

pub struct AdmissionCycleRepo<'a>(pub &'a PgPool);

impl<'a> AdmissionCycleRepo<'a> {
    pub async fn list_for_program(
        &self,
        program_offering_id: ProgramOfferingId,
    ) -> Result<Vec<AdmissionCycle>, DomainError> {
        let rows = sqlx::query_as!(
            AdmissionCycle,
            r#"
            SELECT id, program_offering_id, academic_year,
                   seats_total, seats_state_subsidised, seats_paid,
                   seats_foreign_eu, seats_foreign_non_eu,
                   application_opens, application_closes,
                   exam_session_start, exam_session_end,
                   ranking_rounds, tuition_bgn, tuition_currency,
                   formula_bg, source_url, created_at, updated_at
            FROM admission_cycle
            WHERE program_offering_id = $1
            ORDER BY academic_year DESC
            "#,
            program_offering_id,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn upsert(&self, ac: &AdmissionCycle) -> Result<AdmissionCycleId, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO admission_cycle (
                program_offering_id, academic_year,
                seats_total, seats_state_subsidised, seats_paid,
                seats_foreign_eu, seats_foreign_non_eu,
                application_opens, application_closes,
                exam_session_start, exam_session_end,
                ranking_rounds, tuition_bgn, tuition_currency,
                formula_bg, source_url
            ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16)
            ON CONFLICT (program_offering_id, academic_year) DO UPDATE SET
                seats_total            = EXCLUDED.seats_total,
                seats_state_subsidised = EXCLUDED.seats_state_subsidised,
                seats_paid             = EXCLUDED.seats_paid,
                seats_foreign_eu       = EXCLUDED.seats_foreign_eu,
                seats_foreign_non_eu   = EXCLUDED.seats_foreign_non_eu,
                application_opens      = EXCLUDED.application_opens,
                application_closes     = EXCLUDED.application_closes,
                exam_session_start     = EXCLUDED.exam_session_start,
                exam_session_end       = EXCLUDED.exam_session_end,
                ranking_rounds         = EXCLUDED.ranking_rounds,
                tuition_bgn            = EXCLUDED.tuition_bgn,
                formula_bg             = EXCLUDED.formula_bg,
                source_url             = EXCLUDED.source_url,
                updated_at             = now()
            RETURNING id
            "#,
            ac.program_offering_id,
            ac.academic_year,
            ac.seats_total,
            ac.seats_state_subsidised,
            ac.seats_paid,
            ac.seats_foreign_eu,
            ac.seats_foreign_non_eu,
            ac.application_opens,
            ac.application_closes,
            ac.exam_session_start,
            ac.exam_session_end,
            ac.ranking_rounds,
            ac.tuition_bgn,
            ac.tuition_currency,
            ac.formula_bg,
            ac.source_url,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
