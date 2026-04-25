//! Scraper adapter for Софийски университет „Св. Климент Охридски" (SU).
//!
//! Entry: https://www.uni-sofia.bg/index.php/bul/universitett/administrativna_struktura/
//!        (program catalogue pages per faculty)
//!
//! Implementation note: full CSS-selector map will be populated once the
//! live HTML structure is observed (TDD Part 2). This stub satisfies the
//! SiteAdapter contract and compiles cleanly.

use scraper_core::extract::{async_trait, ProgramExtract, SiteAdapter};
use chrono::Utc;

pub struct SuAdapter;

#[async_trait]
impl SiteAdapter for SuAdapter {
    fn name(&self) -> &'static str {
        "su-sofia"
    }

    fn institution_slug(&self) -> &'static str {
        "su-sofia"
    }

    fn entry_url(&self) -> &'static str {
        "https://www.uni-sofia.bg"
    }

    async fn scrape(&self, _client: &reqwest::Client) -> anyhow::Result<Vec<ProgramExtract>> {
        // TODO: implement per TDD Part 2 once CSS selectors mapped
        tracing::warn!("SU scraper not yet implemented — returning empty extract");
        Ok(vec![ProgramExtract {
            source_url:       self.entry_url().to_string(),
            scraped_at:       Utc::now(),
            scraper:          Some(scraper_core::extract::ScraperKind::Reqwest),
            institution_slug: self.institution_slug().to_string(),
            snapshot_sha256:  None,
            items:            vec![],
        }])
    }
}
