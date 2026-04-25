use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};

/// Top-level envelope produced by every scraper (Rust or Python).
/// Must validate against schemas/program_extract.v1.json.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProgramExtract {
    pub source_url:       String,
    pub scraped_at:       DateTime<Utc>,
    pub scraper:          Option<ScraperKind>,
    pub institution_slug: String,
    pub snapshot_sha256:  Option<String>,
    pub items:            Vec<ProgramItem>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum ScraperKind {
    Reqwest,
    Playwright,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProgramItem {
    pub external_id:             Option<String>,
    pub title_bg:                String,
    pub title_en:                Option<String>,
    pub specialty_hint_bg:       Option<String>,
    pub professional_field_code: Option<String>,
    pub academic_unit:           Option<String>,
    pub branch_city:             Option<String>,
    pub oks_level:               String,
    pub study_form:              String,
    pub language:                String,
    pub duration_semesters:      Option<i32>,
    pub ects_credits:            Option<i32>,
    pub tuition_bgn_per_year:    Option<f64>,
    pub funding:                 Option<String>,
    pub description_bg:          Option<String>,
    pub curriculum_url:          Option<String>,
    pub program_page_url:        Option<String>,
    pub is_joint:                Option<bool>,
    pub joint_partner:           Option<JointPartner>,
    pub admission:               Option<AdmissionExtract>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct JointPartner {
    pub name:         Option<String>,
    pub country_iso2: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AdmissionExtract {
    pub academic_year:          Option<String>,
    pub seats_total:            Option<i32>,
    pub seats_state_subsidised: Option<i32>,
    pub seats_paid:             Option<i32>,
    pub exams:                  Option<Vec<ExamExtract>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ExamExtract {
    pub subject_bg:   String,
    pub kind:         Option<String>,
    pub weight:       f64,
    pub is_mandatory: Option<bool>,
}

/// Contract that every HEI-specific Rust scraper must implement.
#[async_trait::async_trait]
pub trait SiteAdapter: Send + Sync {
    /// Human-readable name for logging.
    fn name(&self) -> &'static str;

    /// The institution slug this adapter handles.
    fn institution_slug(&self) -> &'static str;

    /// Entry-point URL to start scraping from.
    fn entry_url(&self) -> &'static str;

    /// Fetch and parse pages, returning a list of `ProgramExtract` documents
    /// (usually one per faculty/catalogue page).
    async fn scrape(&self, client: &reqwest::Client) -> anyhow::Result<Vec<ProgramExtract>>;
}

// async_trait re-export so adapters don't need the dep directly
pub use async_trait::async_trait;
