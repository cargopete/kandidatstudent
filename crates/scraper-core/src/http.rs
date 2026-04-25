use std::time::Duration;

/// Build a well-behaved reqwest client with a realistic User-Agent,
/// gzip/brotli decompression, cookie jar, and generous timeouts.
pub fn build_client() -> anyhow::Result<reqwest::Client> {
    let client = reqwest::Client::builder()
        .user_agent(
            "Mozilla/5.0 (compatible; KandidatstudentBot/0.1; +https://kandidatstudent.bg/bot)"
        )
        .gzip(true)
        .brotli(true)
        .cookie_store(true)
        .timeout(Duration::from_secs(30))
        .connect_timeout(Duration::from_secs(10))
        .tcp_keepalive(Duration::from_secs(60))
        .build()?;
    Ok(client)
}

/// Fetch a URL with exponential backoff (up to 3 attempts).
pub async fn fetch_with_retry(
    client: &reqwest::Client,
    url: &str,
) -> anyhow::Result<reqwest::Response> {
    let mut last_err: anyhow::Error = anyhow::anyhow!("unreachable");
    for attempt in 0..3u32 {
        if attempt > 0 {
            let delay = Duration::from_millis(1_000 * 2u64.pow(attempt - 1));
            tokio::time::sleep(delay).await;
        }
        match client.get(url).send().await {
            Ok(resp) if resp.status().is_success() => return Ok(resp),
            Ok(resp) => {
                last_err = anyhow::anyhow!("HTTP {} from {url}", resp.status());
            }
            Err(e) => {
                last_err = e.into();
            }
        }
        tracing::warn!(attempt, url, "fetch failed, will retry");
    }
    Err(last_err)
}
