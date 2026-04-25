use crate::extract::ProgramExtract;

static SCHEMA: std::sync::OnceLock<serde_json::Value> = std::sync::OnceLock::new();

fn schema() -> &'static serde_json::Value {
    SCHEMA.get_or_init(|| {
        serde_json::from_str(include_str!("../schemas/program_extract.v1.json"))
            .expect("program_extract.v1.json is not valid JSON")
    })
}

/// Validate a `ProgramExtract` against the JSON Schema.
pub fn validate(extract: &ProgramExtract) -> anyhow::Result<()> {
    let value = serde_json::to_value(extract)?;
    let compiled = jsonschema::validator_for(schema())
        .map_err(|e| anyhow::anyhow!("schema compile error: {e}"))?;
    let msgs: Vec<String> = compiled.iter_errors(&value)
        .map(|e| e.to_string())
        .collect();
    if !msgs.is_empty() {
        anyhow::bail!("ProgramExtract validation failed:\n{}", msgs.join("\n"));
    }
    Ok(())
}
