use meilisearch_sdk::client::Client;
use meilisearch_sdk::settings::Settings;

pub const PROGRAMS_INDEX_UID: &str = "programs";

/// Apply Meilisearch index settings for the programs index.
/// This is idempotent and safe to call on every boot.
pub async fn apply_settings(client: &Client) -> anyhow::Result<()> {
    let index = client.index(PROGRAMS_INDEX_UID);

    let settings = Settings::new()
        .with_searchable_attributes([
            "title_bg",
            "title_en",
            "description_bg",
            "career_prospects_bg",
            "specialty_name_bg",
            "institution_name_bg",
            "institution_short_name_bg",
            "aliases",
        ])
        .with_filterable_attributes([
            "institution_slug",
            "professional_field_code",
            "oks_level",
            "study_form",
            "language",
            "city",
            "ownership",
            "is_joint",
            "has_internship",
            "funding",
            "tuition_bgn_per_year",
        ])
        .with_sortable_attributes([
            "tuition_bgn_per_year",
            "duration_semesters",
            "last_verified_at",
            "title_bg",
        ])
        .with_ranking_rules([
            "words",
            "typo",
            "proximity",
            "attribute",
            "exactness",
            "last_verified_at:desc",
        ])
        .with_stop_words(["и", "или", "на", "за", "по", "със", "към", "от", "до", "в"]);

    let task = index.set_settings(&settings).await?;
    task.wait_for_completion(client, None, None).await?;
    Ok(())
}

/// Document shape sent to Meilisearch (denormalised, search-optimised).
#[derive(Debug, serde::Serialize, serde::Deserialize)]
pub struct ProgramDoc {
    pub id:                       i64,
    pub slug:                     String,
    pub title_bg:                 String,
    pub title_en:                 Option<String>,
    pub description_bg:           Option<String>,
    pub career_prospects_bg:      Option<String>,
    pub specialty_slug:           String,
    pub specialty_name_bg:        String,
    pub institution_slug:         String,
    pub institution_name_bg:      String,
    pub institution_short_name_bg: String,
    pub professional_field_code:  String,
    pub oks_level:                String,
    pub study_form:               String,
    pub language:                 String,
    pub city:                     String,
    pub ownership:                String,
    pub is_joint:                 bool,
    pub has_internship:           bool,
    pub funding:                  String,
    pub tuition_bgn_per_year:     Option<f64>,
    pub duration_semesters:       i16,
    pub last_verified_at:         i64, // Unix timestamp for sorting
    pub aliases:                  Vec<String>,
    pub program_page_url:         Option<String>,
}
