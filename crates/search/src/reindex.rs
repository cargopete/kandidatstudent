use crate::indexes::programs::{apply_settings, ProgramDoc, PROGRAMS_INDEX_UID};
use meilisearch_sdk::client::Client;
use sqlx::PgPool;

const BATCH_SIZE: i64 = 500;

/// Re-build the Meilisearch programs index from the Postgres source of truth.
pub async fn reindex_all(db: &PgPool, meili: &Client) -> anyhow::Result<usize> {
    apply_settings(meili).await?;

    let index = meili.index(PROGRAMS_INDEX_UID);
    let mut offset: i64 = 0;
    let mut total = 0usize;

    loop {
        let rows = sqlx::query!(
            r#"
            SELECT
                po.id,
                po.slug,
                po.title_bg,
                po.title_en,
                po.description_bg,
                po.career_prospects_bg,
                po.oks_level::text            AS oks_level,
                po.study_form::text           AS study_form,
                po.language::text             AS language,
                po.is_joint,
                po.has_internship,
                po.funding::text              AS funding,
                po.tuition_bgn_per_year,
                po.duration_semesters,
                EXTRACT(EPOCH FROM po.last_verified_at)::bigint AS last_verified_at,
                s.slug                        AS specialty_slug,
                s.canonical_name_bg           AS specialty_name_bg,
                i.slug                        AS institution_slug,
                i.name_bg                     AS institution_name_bg,
                i.short_name_bg               AS institution_short_name_bg,
                i.city,
                i.ownership::text             AS ownership,
                pf.code                       AS professional_field_code,
                COALESCE(
                    ARRAY_AGG(na.alias_bg) FILTER (WHERE na.alias_bg IS NOT NULL),
                    '{}'
                )                             AS aliases
            FROM program_offering po
            JOIN institution i    ON i.id = po.institution_id
            JOIN specialty s      ON s.id = po.specialty_id
            JOIN professional_field pf ON pf.id = po.professional_field_id
            LEFT JOIN name_alias na ON na.target_kind = 'program_offering'
                                   AND na.target_id = po.id
            WHERE po.is_active
            GROUP BY po.id, s.canonical_name_bg, i.slug, i.name_bg, i.short_name_bg,
                     i.city, i.ownership, pf.code
            ORDER BY po.id
            LIMIT $1 OFFSET $2
            "#,
            BATCH_SIZE,
            offset,
        )
        .fetch_all(db)
        .await?;

        if rows.is_empty() {
            break;
        }

        let docs: Vec<ProgramDoc> = rows
            .into_iter()
            .map(|r| ProgramDoc {
                id:                        r.id,
                slug:                      r.slug,
                title_bg:                  r.title_bg,
                title_en:                  r.title_en,
                description_bg:            r.description_bg,
                career_prospects_bg:       r.career_prospects_bg,
                specialty_slug:            r.specialty_slug,
                specialty_name_bg:         r.specialty_name_bg,
                institution_slug:          r.institution_slug,
                institution_name_bg:       r.institution_name_bg,
                institution_short_name_bg: r.institution_short_name_bg,
                professional_field_code:   r.professional_field_code,
                oks_level:                 r.oks_level.unwrap_or_default(),
                study_form:                r.study_form.unwrap_or_default(),
                language:                  r.language.unwrap_or_default(),
                city:                      r.city,
                ownership:                 r.ownership.unwrap_or_default(),
                is_joint:                  r.is_joint,
                has_internship:            r.has_internship,
                funding:                   r.funding.unwrap_or_default(),
                tuition_bgn_per_year:      r.tuition_bgn_per_year
                    .map(|d| d.to_string().parse::<f64>().unwrap_or(0.0)),
                duration_semesters:        r.duration_semesters,
                last_verified_at:          r.last_verified_at.unwrap_or(0),
                aliases:                   r.aliases.unwrap_or_default(),
            })
            .collect();

        let count = docs.len();
        let task = index.add_or_replace(&docs, Some("id")).await?;
        task.wait_for_completion(meili, None, None).await?;

        total += count;
        offset += BATCH_SIZE;
        tracing::info!(offset, total, "reindex batch done");
    }

    tracing::info!(total, "reindex_all complete");
    Ok(total)
}
