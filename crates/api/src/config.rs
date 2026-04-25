use std::env;

#[derive(Debug, Clone)]
pub struct Config {
    pub database_url: String,
    pub meili_url:    String,
    pub meili_key:    String,
    pub env:          String,
}

impl Config {
    pub fn from_env() -> anyhow::Result<Self> {
        Ok(Self {
            database_url: env::var("DATABASE_URL")
                .unwrap_or_else(|_| "postgres://kandidatstudent:kandidatstudent@postgres:5432/kandidatstudent".into()),
            meili_url: env::var("MEILI_URL")
                .unwrap_or_else(|_| "http://meili:7700".into()),
            meili_key: env::var("MEILI_MASTER_KEY")
                .unwrap_or_else(|_| "changeme".into()),
            env: env::var("APP_ENV").unwrap_or_else(|_| "production".into()),
        })
    }

    pub fn is_dev(&self) -> bool {
        self.env == "development"
    }
}
