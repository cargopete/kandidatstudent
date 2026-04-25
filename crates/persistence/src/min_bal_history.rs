use domain::{DomainError, MinBalHistory, ProgramOfferingId};
use sqlx::PgPool;

pub struct MinBalHistoryRepo<'a>(pub &'a PgPool);

impl<'a> MinBalHistoryRepo<'a> {
    pub async fn list_for_program(
        &self,
        program_offering_id: ProgramOfferingId,
    ) -> Result<Vec<MinBalHistory>, DomainError> {
        let rows = sqlx::query_as!(
            MinBalHistory,
            r#"
            SELECT id, program_offering_id, academic_year,
                   quota AS "quota: _",
                   ranking_round, min_bal, max_bal, seats_filled,
                   source_url, created_at
            FROM min_bal_history
            WHERE program_offering_id = $1
            ORDER BY academic_year DESC, ranking_round ASC
            "#,
            program_offering_id,
        )
        .fetch_all(self.0)
        .await?;
        Ok(rows)
    }

    pub async fn upsert(&self, h: &MinBalHistory) -> Result<i64, DomainError> {
        let id = sqlx::query_scalar!(
            r#"
            INSERT INTO min_bal_history
                (program_offering_id, academic_year, quota, ranking_round,
                 min_bal, max_bal, seats_filled, source_url)
            VALUES ($1,$2,$3::quota_kind,$4,$5,$6,$7,$8)
            ON CONFLICT (program_offering_id, academic_year, quota, ranking_round)
            DO UPDATE SET
                min_bal      = EXCLUDED.min_bal,
                max_bal      = EXCLUDED.max_bal,
                seats_filled = EXCLUDED.seats_filled,
                source_url   = EXCLUDED.source_url
            RETURNING id
            "#,
            h.program_offering_id,
            h.academic_year,
            h.quota as _,
            h.ranking_round,
            h.min_bal,
            h.max_bal,
            h.seats_filled,
            h.source_url,
        )
        .fetch_one(self.0)
        .await?;
        Ok(id)
    }
}
