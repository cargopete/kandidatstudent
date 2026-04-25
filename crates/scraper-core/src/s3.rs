use aws_sdk_s3::Client as S3Client;
use bytes::Bytes;
use sha2::{Digest, Sha256};

/// Upload raw HTML/PDF bytes to Hetzner Object Storage and return the sha256 hex.
pub async fn upload_snapshot(
    s3: &S3Client,
    bucket: &str,
    key: &str,
    content_type: &str,
    body: Bytes,
) -> anyhow::Result<String> {
    let sha256 = hex::encode(Sha256::digest(&body));

    s3.put_object()
        .bucket(bucket)
        .key(key)
        .content_type(content_type)
        .body(body.into())
        .send()
        .await?;

    Ok(sha256)
}

/// Build the S3 key for a raw snapshot.
/// Pattern: `raw-html/{year}/{month}/{institution_slug}/{slug}.html.gz`
pub fn snapshot_key(institution_slug: &str, page_slug: &str) -> String {
    let now = chrono::Utc::now();
    format!(
        "raw-html/{}/{:02}/{}/{}.html.gz",
        now.format("%Y"),
        now.format("%m"),
        institution_slug,
        page_slug,
    )
}
