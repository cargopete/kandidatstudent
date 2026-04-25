use robotstxt::DefaultMatcher;
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::Mutex;

/// Simple robots.txt cache: fetch once per host per process lifetime.
#[derive(Default)]
pub struct RobotsCache {
    inner: Arc<Mutex<HashMap<String, String>>>,
}

impl RobotsCache {
    pub fn new() -> Self {
        Self::default()
    }

    /// Returns `true` if the given URL is allowed for our bot.
    pub async fn is_allowed(
        &self,
        client: &reqwest::Client,
        url: &str,
    ) -> anyhow::Result<bool> {
        let parsed = url::Url::parse(url)?;
        let host = format!(
            "{}://{}",
            parsed.scheme(),
            parsed.host_str().unwrap_or("unknown")
        );
        let robots_url = format!("{host}/robots.txt");

        let txt = {
            let mut cache = self.inner.lock().await;
            if let Some(t) = cache.get(&host) {
                t.clone()
            } else {
                let text = match client.get(&robots_url).send().await {
                    Ok(r) if r.status().is_success() => r.text().await.unwrap_or_default(),
                    _ => String::new(), // no robots.txt = allow all
                };
                cache.insert(host.clone(), text.clone());
                text
            }
        };

        let agent = "KandidatstudentBot";
        let allowed = DefaultMatcher::default().one_agent_allowed_by_robots(&txt, agent, url);
        Ok(allowed)
    }
}
