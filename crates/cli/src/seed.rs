//! Seed the database with the 51 institutions, 52 professional fields, and
//! 10 MVP scrape jobs.
//!
//! This runs against the `seeds/` SQL files which are loaded via
//! `sqlx migrate run --source seeds` or by the CLI directly.

use sqlx::PgPool;

pub async fn run(db: &PgPool) -> anyhow::Result<()> {
    // Professional fields seeded from SQL file
    seed_professional_fields(db).await?;
    seed_institutions(db).await?;
    seed_scrape_jobs(db).await?;
    Ok(())
}

async fn seed_professional_fields(db: &PgPool) -> anyhow::Result<()> {
    // Sample subset — full 52-row seed is in seeds/professional_fields.sql
    let fields = vec![
        ("1.1", "1", "Педагогически науки", "Теория и управление на образованието", Some("Education and Management")),
        ("4.6", "4", "Природни науки, математика и информатика", "Информатика и компютърни науки", Some("Informatics and Computer Science")),
        ("5.3", "5", "Технически науки", "Комуникационна и компютърна техника", Some("Communication and Computer Engineering")),
    ];

    for (code, area_code, area_name_bg, name_bg, name_en) in fields {
        sqlx::query!(
            r#"
            INSERT INTO professional_field (code, area_code, area_name_bg, name_bg, name_en)
            VALUES ($1,$2,$3,$4,$5)
            ON CONFLICT (code) DO NOTHING
            "#,
            code, area_code, area_name_bg, name_bg, name_en,
        )
        .execute(db)
        .await?;
    }
    Ok(())
}

async fn seed_institutions(db: &PgPool) -> anyhow::Result<()> {
    // MVP: SU only — full 51-row seed is in seeds/institutions.sql
    sqlx::query!(
        r#"
        INSERT INTO institution (slug, name_bg, name_en, short_name_bg, ownership, city, website_url, admissions_url)
        VALUES (
            'su-kliment-ohridski',
            'Софийски университет „Св. Климент Охридски"',
            'Sofia University "St. Kliment Ohridski"',
            'СУ',
            'state',
            'София',
            'https://www.uni-sofia.bg',
            'https://www.uni-sofia.bg/index.php/bul/universitett/struktura/priem'
        )
        ON CONFLICT (slug) DO NOTHING
        "#,
    )
    .execute(db)
    .await?;
    Ok(())
}

async fn seed_scrape_jobs(db: &PgPool) -> anyhow::Result<()> {
    let su_id: i64 = sqlx::query_scalar!(
        "SELECT id FROM institution WHERE slug = 'su-kliment-ohridski'"
    )
    .fetch_one(db)
    .await?;

    sqlx::query!(
        r#"
        INSERT INTO scrape_job (kind, target_url, institution_id, cron_expr, runner)
        VALUES ('program_list', 'https://www.uni-sofia.bg', $1, '30 2 * * *', 'rust')
        ON CONFLICT (kind, target_url) DO NOTHING
        "#,
        su_id,
    )
    .execute(db)
    .await?;

    Ok(())
}
