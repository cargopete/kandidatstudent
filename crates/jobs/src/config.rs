use std::env;

#[derive(Debug, Clone)]
pub struct WorkerConfig {
    pub database_url:  String,
    pub meili_url:     String,
    pub meili_key:     String,
    pub s3_bucket:     String,
    pub s3_endpoint:   String,
    pub s3_region:     String,
    pub admin_api_url: String,
    pub admin_token:   String,
}

impl WorkerConfig {
    pub fn from_env() -> anyhow::Result<Self> {
        Ok(Self {
            database_url: env::var("DATABASE_URL")
                .unwrap_or_else(|_| "postgres://kandidatstudent:kandidatstudent@postgres:5432/kandidatstudent".into()),
            meili_url: env::var("MEILI_URL")
                .unwrap_or_else(|_| "http://meili:7700".into()),
            meili_key: env::var("MEILI_MASTER_KEY")
                .unwrap_or_else(|_| "changeme".into()),
            s3_bucket: env::var("S3_BUCKET")
                .unwrap_or_else(|_| "kandidatstudent-raw".into()),
            s3_endpoint: env::var("S3_ENDPOINT")
                .unwrap_or_else(|_| "https://fsn1.your-objectstorage.com".into()),
            s3_region: env::var("S3_REGION")
                .unwrap_or_else(|_| "fsn1".into()),
            admin_api_url: env::var("ADMIN_API_URL")
                .unwrap_or_else(|_| "http://admin:8081".into()),
            admin_token: env::var("ADMIN_BEARER_TOKEN")
                .unwrap_or_else(|_| "change-me".into()),
        })
    }
}
