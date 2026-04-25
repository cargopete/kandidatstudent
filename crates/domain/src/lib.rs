use chrono::{DateTime, NaiveDate, Utc};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};

// ---------------------------------------------------------------------------
// Type aliases
// ---------------------------------------------------------------------------

pub type InstitutionId       = i64;
pub type ProgramOfferingId   = i64;
pub type SpecialtyId         = i64;
pub type ProfessionalFieldId = i64;
pub type AdmissionCycleId    = i64;
pub type AcademicUnitId      = i64;
pub type BranchId            = i64;
pub type ScrapeJobId         = i64;
pub type ScrapeRunId         = i64;
pub type SnapshotId          = i64;

// ---------------------------------------------------------------------------
// Enumerations
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "oks_level", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum OksLevel {
    ProfessionalBachelor,
    Bachelor,
    Master,
    Doctor,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "study_form", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum StudyForm {
    FullTime,
    PartTime,
    Distance,
    Evening,
    Hybrid,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "ownership", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum Ownership {
    State,
    Private,
    Military,
    Ecclesiastical,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "funding_source", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum FundingSource {
    StateSubsidy,
    Paid,
    Both,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "language_code", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum LanguageCode {
    Bg,
    En,
    De,
    Fr,
    Ru,
    Es,
    It,
    Tr,
    Other,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "quota_kind", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum QuotaKind {
    RegularMale,
    RegularFemale,
    RegularUnisex,
    Paid,
    ForeignEu,
    ForeignNonEu,
    Disadvantaged,
    TeacherProgramme,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "unit_kind", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum UnitKind {
    Faculty,
    Department,
    College,
    Institute,
    Chair,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "exam_kind", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum ExamKind {
    Dze,
    EntryExam,
    DiplomaGrade,
    Portfolio,
    Interview,
    Other,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "scrape_status", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum ScrapeStatus {
    Pending,
    Running,
    Ok,
    Failed,
    Partial,
    Skipped,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, sqlx::Type, utoipa::ToSchema)]
#[sqlx(type_name = "scrape_job_kind", rename_all = "snake_case")]
#[serde(rename_all = "snake_case")]
pub enum ScrapeJobKind {
    InstitutionList,
    InstitutionDetail,
    FacultyList,
    ProgramList,
    ProgramDetail,
    AdmissionCycle,
    MinBalHistory,
    RsvuOutcomes,
    NacidDataset,
}

// ---------------------------------------------------------------------------
// Core domain structs
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct Institution {
    pub id:            InstitutionId,
    pub slug:          String,
    pub nacid_id:      Option<String>,
    pub name_bg:       String,
    pub name_en:       Option<String>,
    pub short_name_bg: String,
    pub ownership:     Ownership,
    pub city:          String,
    pub address:       Option<String>,
    pub lat:           Option<Decimal>,
    pub lon:           Option<Decimal>,
    pub website_url:   Option<String>,
    pub admissions_url: Option<String>,
    pub logo_url:      Option<String>,
    pub founded_year:  Option<i32>,
    pub rsvu_rank:     Option<i32>,
    pub description_bg: Option<String>,
    pub description_en: Option<String>,
    pub is_active:     bool,
    pub created_at:    DateTime<Utc>,
    pub updated_at:    DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct InstitutionBranch {
    pub id:             BranchId,
    pub institution_id: InstitutionId,
    pub slug:           String,
    pub name_bg:        String,
    pub city:           String,
    pub address:        Option<String>,
    pub lat:            Option<Decimal>,
    pub lon:            Option<Decimal>,
    pub is_active:      bool,
    pub created_at:     DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct AcademicUnit {
    pub id:             AcademicUnitId,
    pub institution_id: InstitutionId,
    pub parent_id:      Option<AcademicUnitId>,
    pub branch_id:      Option<BranchId>,
    pub kind:           UnitKind,
    pub slug:           String,
    pub name_bg:        String,
    pub name_en:        Option<String>,
    pub website_url:    Option<String>,
    pub created_at:     DateTime<Utc>,
    pub updated_at:     DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct ProfessionalField {
    pub id:           ProfessionalFieldId,
    pub code:         String,
    pub area_code:    String,
    pub area_name_bg: String,
    pub name_bg:      String,
    pub name_en:      Option<String>,
    pub is_priority:  bool,
    pub is_protected: bool,
    pub is_regulated: bool,
    pub created_at:   DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct Specialty {
    pub id:                    SpecialtyId,
    pub slug:                  String,
    pub canonical_name_bg:     String,
    pub canonical_name_en:     Option<String>,
    pub professional_field_id: ProfessionalFieldId,
    pub description_bg:        Option<String>,
    pub created_at:            DateTime<Utc>,
    pub updated_at:            DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct ProgramOffering {
    pub id:                    ProgramOfferingId,
    pub slug:                  String,
    pub institution_id:        InstitutionId,
    pub branch_id:             Option<BranchId>,
    pub academic_unit_id:      Option<AcademicUnitId>,
    pub specialty_id:          SpecialtyId,
    pub professional_field_id: ProfessionalFieldId,
    pub oks_level:             OksLevel,
    pub study_form:            StudyForm,
    pub language:              LanguageCode,
    pub duration_semesters:    i16,
    pub ects_credits:          Option<i16>,
    pub tuition_bgn_per_year:  Option<Decimal>,
    pub tuition_currency:      String,
    pub funding:               FundingSource,
    pub is_joint:              bool,
    pub has_internship:        bool,
    pub title_bg:              String,
    pub title_en:              Option<String>,
    pub description_bg:        Option<String>,
    pub learning_outcomes_bg:  Option<String>,
    pub career_prospects_bg:   Option<String>,
    pub curriculum_url:        Option<String>,
    pub program_page_url:      Option<String>,
    pub accreditation_until:   Option<NaiveDate>,
    pub is_active:             bool,
    pub first_seen_at:         DateTime<Utc>,
    pub last_verified_at:      DateTime<Utc>,
    pub created_at:            DateTime<Utc>,
    pub updated_at:            DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct AdmissionCycle {
    pub id:                     AdmissionCycleId,
    pub program_offering_id:    ProgramOfferingId,
    pub academic_year:          String,
    pub seats_total:            Option<i32>,
    pub seats_state_subsidised: Option<i32>,
    pub seats_paid:             Option<i32>,
    pub seats_foreign_eu:       Option<i32>,
    pub seats_foreign_non_eu:   Option<i32>,
    pub application_opens:      Option<NaiveDate>,
    pub application_closes:     Option<NaiveDate>,
    pub exam_session_start:     Option<NaiveDate>,
    pub exam_session_end:       Option<NaiveDate>,
    pub ranking_rounds:         Option<i16>,
    pub tuition_bgn:            Option<Decimal>,
    pub tuition_currency:       Option<String>,
    pub formula_bg:             Option<String>,
    pub source_url:             Option<String>,
    pub created_at:             DateTime<Utc>,
    pub updated_at:             DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct EntryExam {
    pub id:                 i64,
    pub admission_cycle_id: AdmissionCycleId,
    pub exam_kind:          ExamKind,
    pub subject_bg:         String,
    pub weight:             Decimal,
    pub is_mandatory:       bool,
    pub is_alternative:     bool,
    pub alternative_group:  Option<i16>,
    pub min_score:          Option<Decimal>,
    pub notes_bg:           Option<String>,
    pub created_at:         DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct MinBalHistory {
    pub id:                  i64,
    pub program_offering_id: ProgramOfferingId,
    pub academic_year:       String,
    pub quota:               QuotaKind,
    pub ranking_round:       i16,
    pub min_bal:             Decimal,
    pub max_bal:             Option<Decimal>,
    pub seats_filled:        Option<i32>,
    pub source_url:          Option<String>,
    pub created_at:          DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct SalaryOutcome {
    pub id:                     i64,
    pub institution_id:         InstitutionId,
    pub professional_field_id:  ProfessionalFieldId,
    pub academic_year:          String,
    pub avg_monthly_income_bgn: Option<Decimal>,
    pub unemployment_pct:       Option<Decimal>,
    pub employed_in_field_pct:  Option<Decimal>,
    pub higher_ed_job_pct:      Option<Decimal>,
    pub source:                 String,
    pub source_url:             Option<String>,
    pub created_at:             DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct ScrapeJob {
    pub id:             ScrapeJobId,
    pub kind:           ScrapeJobKind,
    pub target_url:     String,
    pub institution_id: Option<InstitutionId>,
    pub cron_expr:      String,
    pub runner:         String,
    pub priority:       i16,
    pub is_enabled:     bool,
    pub last_run_at:    Option<DateTime<Utc>>,
    pub next_run_at:    Option<DateTime<Utc>>,
    pub created_at:     DateTime<Utc>,
    pub updated_at:     DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow, utoipa::ToSchema)]
pub struct ScrapeRun {
    pub id:            ScrapeRunId,
    pub scrape_job_id: ScrapeJobId,
    pub status:        ScrapeStatus,
    pub started_at:    DateTime<Utc>,
    pub finished_at:   Option<DateTime<Utc>>,
    pub rows_found:    Option<i32>,
    pub rows_upserted: Option<i32>,
    pub rows_deleted:  Option<i32>,
    pub error_message: Option<String>,
    pub log_s3_key:    Option<String>,
    pub snapshot_id:   Option<SnapshotId>,
}

// ---------------------------------------------------------------------------
// Error type
// ---------------------------------------------------------------------------

#[derive(Debug, thiserror::Error)]
pub enum DomainError {
    #[error("not found: {0}")]
    NotFound(String),
    #[error("invalid input: {0}")]
    InvalidInput(String),
    #[error("conflict: {0}")]
    Conflict(String),
    #[error(transparent)]
    Db(#[from] sqlx::Error),
    #[error(transparent)]
    Search(#[from] meilisearch_sdk::errors::Error),
    #[error(transparent)]
    Other(#[from] anyhow::Error),
}

pub type DomainResult<T> = Result<T, DomainError>;
