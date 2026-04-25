use std::env;

#[derive(Debug, Clone)]
pub struct AdminConfig {
    pub database_url:       String,
    pub meili_url:          String,
    pub meili_key:          String,
    pub admin_bearer_token: String,
    pub vercel_revalidate_url:    String,
    pub vercel_revalidate_secret: String,
}

impl AdminConfig {
    pub fn from_env() -> anyhow::Result<Self> {
        Ok(Self {
            database_url: env::var("DATABASE_URL")
                .unwrap_or_else(|_| "postgres://kandidatstudent:kandidatstudent@postgres:5432/kandidatstudent".into()),
            meili_url: env::var("MEILI_URL")
                .unwrap_or_else(|_| "http://meili:7700".into()),
            meili_key: env::var("MEILI_MASTER_KEY")
                .unwrap_or_else(|_| "changeme".into()),
            admin_bearer_token: env::var("ADMIN_BEARER_TOKEN")
                .unwrap_or_else(|_| "change-me-in-production".into()),
            vercel_revalidate_url: env::var("VERCEL_REVALIDATE_URL")
                .unwrap_or_else(|_| "https://kandidatstudent.bg/api/revalidate".into()),
            vercel_revalidate_secret: env::var("VERCEL_REVALIDATE_SECRET")
                .unwrap_or_else(|_| "change-me".into()),
        })
    }
}
