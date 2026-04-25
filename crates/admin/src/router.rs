use axum::{
    middleware,
    routing::{delete, get, post},
    Router,
};

use crate::{
    auth::require_admin,
    handlers::{
        health::healthz,
        overrides::{apply_override, delete_override},
        revalidate::revalidate,
        scrape::{list_jobs, list_runs, stats, trigger_job},
        search::reindex,
    },
    state::AdminState,
};

pub fn build(state: AdminState) -> Router {
    let protected = Router::new()
        .route("/admin/healthz",                      get(healthz))
        .route("/admin/scrape/jobs",                  get(list_jobs))
        .route("/admin/scrape/trigger",               post(trigger_job))
        .route("/admin/scrape/runs",                  get(list_runs))
        .route("/admin/programs/{id}/override",       post(apply_override))
        .route("/admin/programs/{id}/override/{field}", delete(delete_override))
        .route("/admin/search/reindex",               post(reindex))
        .route("/admin/revalidate",                   post(revalidate))
        .route("/admin/stats",                        get(stats))
        .layer(middleware::from_fn_with_state(state.clone(), require_admin))
        .with_state(state);

    protected
}
