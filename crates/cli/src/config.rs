use std::env;

#[derive(Debug)]
pub struct CliConfig {
    pub database_url: String,
    pub meili_url:    String,
    pub meili_key:    String,
}

impl CliConfig {
    pub fn from_env() -> anyhow::Result<Self> {
        Ok(Self {
            database_url: env::var("DATABASE_URL")
                .unwrap_or_else(|_| "postgres://kandidatstudent:kandidatstudent@localhost:5432/kandidatstudent".into()),
            meili_url: env::var("MEILI_URL")
                .unwrap_or_else(|_| "http://localhost:7700".into()),
            meili_key: env::var("MEILI_MASTER_KEY")
                .unwrap_or_else(|_| "changeme".into()),
        })
    }
}
