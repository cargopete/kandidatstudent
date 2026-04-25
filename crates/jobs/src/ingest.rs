use anyhow::Context;
use chrono::Utc;
use scraper_core::{validate::validate, ProgramExtract};
use sqlx::PgPool;

/// Ingest a validated `ProgramExtract` into Postgres.
/// All writes for one extract happen in a single transaction.
pub async fn ingest(db: &PgPool, extract: &ProgramExtract) -> anyhow::Result<IngestStats> {
    validate(extract).context("extract failed schema validation")?;

    let mut stats = IngestStats::default();
    let mut tx = db.begin().await?;

    // Resolve institution id
    let institution_id: i64 = sqlx::query_scalar!(
        "SELECT id FROM institution WHERE slug = $1",
        extract.institution_slug
    )
    .fetch_optional(&mut *tx)
    .await?
    .ok_or_else(|| {
        anyhow::anyhow!("unknown institution slug: {}", extract.institution_slug)
    })?;

    for item in &extract.items {
        stats.found += 1;

        // Resolve or create specialty (by hint)
        let specialty_id: Option<i64> = if let Some(hint) = &item.specialty_hint_bg {
            sqlx::query_scalar!(
                "SELECT id FROM specialty WHERE canonical_name_bg ILIKE $1 LIMIT 1",
                hint
            )
            .fetch_optional(&mut *tx)
            .await?
        } else {
            None
        };
        let Some(specialty_id) = specialty_id else {
            tracing::warn!(
                title = item.title_bg,
                "could not resolve specialty, skipping"
            );
            continue;
        };

        // Resolve professional field
        let pf_id: Option<i64> = if let Some(code) = &item.professional_field_code {
            sqlx::query_scalar!(
                "SELECT id FROM professional_field WHERE code = $1",
                code
            )
            .fetch_optional(&mut *tx)
            .await?
        } else {
            sqlx::query_scalar!(
                "SELECT professional_field_id FROM specialty WHERE id = $1",
                specialty_id
            )
            .fetch_optional(&mut *tx)
            .await?
        };
        let Some(pf_id) = pf_id else {
            tracing::warn!(title = item.title_bg, "could not resolve pf, skipping");
            continue;
        };

        // Build slug
        let raw_slug = format!(
            "{}-{}-{}-{}",
            extract.institution_slug,
            slug::slugify(&item.title_bg),
            item.oks_level,
            item.study_form,
        );
        let slug = raw_slug.to_lowercase();

        let duration = item.duration_semesters.unwrap_or(8) as i16;

        // Upsert program_offering
        let prog_id: i64 = sqlx::query_scalar!(
            r#"
            INSERT INTO program_offering (
                slug, institution_id, specialty_id, professional_field_id,
                oks_level, study_form, language,
                duration_semesters, ects_credits, tuition_bgn_per_year,
                funding, is_joint, title_bg, title_en, description_bg,
                curriculum_url, program_page_url, is_active, last_verified_at
            ) VALUES (
                $1,$2,$3,$4,
                $5::text::oks_level, $6::text::study_form, $7::text::language_code,
                $8,$9,$10,
                $11::text::funding_source, $12, $13,$14,$15,
                $16,$17, TRUE, $18
            )
            ON CONFLICT (slug) DO UPDATE SET
                last_verified_at     = EXCLUDED.last_verified_at,
                tuition_bgn_per_year = EXCLUDED.tuition_bgn_per_year,
                title_en             = EXCLUDED.title_en,
                description_bg       = EXCLUDED.description_bg,
                curriculum_url       = EXCLUDED.curriculum_url,
                program_page_url     = EXCLUDED.program_page_url,
                is_active            = TRUE,
                updated_at           = now()
            RETURNING id
            "#,
            slug,
            institution_id,
            specialty_id,
            pf_id,
            item.oks_level,
            item.study_form,
            item.language,
            duration,
            item.ects_credits.map(|c| c as i16),
            item.tuition_bgn_per_year.map(|t| rust_decimal::Decimal::try_from(t).unwrap()),
            item.funding.as_deref().unwrap_or("both"),
            item.is_joint.unwrap_or(false),
            item.title_bg,
            item.title_en,
            item.description_bg,
            item.curriculum_url,
            item.program_page_url,
            Utc::now(),
        )
        .fetch_one(&mut *tx)
        .await?;

        stats.upserted += 1;

        // Upsert admission cycle if present
        if let Some(adm) = &item.admission {
            if let Some(year) = &adm.academic_year {
                sqlx::query!(
                    r#"
                    INSERT INTO admission_cycle
                        (program_offering_id, academic_year, seats_total,
                         seats_state_subsidised, seats_paid)
                    VALUES ($1,$2,$3,$4,$5)
                    ON CONFLICT (program_offering_id, academic_year) DO UPDATE SET
                        seats_total            = EXCLUDED.seats_total,
                        seats_state_subsidised = EXCLUDED.seats_state_subsidised,
                        seats_paid             = EXCLUDED.seats_paid,
                        updated_at             = now()
                    "#,
                    prog_id,
                    year,
                    adm.seats_total,
                    adm.seats_state_subsidised,
                    adm.seats_paid,
                )
                .execute(&mut *tx)
                .await?;
            }
        }
    }

    tx.commit().await?;
    Ok(stats)
}

#[derive(Debug, Default)]
pub struct IngestStats {
    pub found:    usize,
    pub upserted: usize,
}
