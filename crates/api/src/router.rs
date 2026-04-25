use axum::http::{header, Method};
use tower_http::{
    compression::CompressionLayer,
    cors::CorsLayer,
    request_id::{MakeRequestUuid, PropagateRequestIdLayer, SetRequestIdLayer},
    trace::TraceLayer,
};
use utoipa::OpenApi;
use utoipa_axum::{router::OpenApiRouter, routes};

use crate::state::AppState;

#[derive(OpenApi)]
#[openapi(
    info(title = "kandidatstudent.bg API", version = "1.0.0",
         description = "Bulgarian university programs aggregator — public read-only API"),
    tags(
        (name = "meta",               description = "Health probes"),
        (name = "institutions",       description = "Bulgarian HEIs"),
        (name = "professional-fields",description = "52 ПН under ПМС 125/2002"),
        (name = "specialties",        description = "Canonical specialty taxonomy"),
        (name = "programs",           description = "Program offerings"),
        (name = "search",             description = "Cross-entity search"),
        (name = "outcomes",           description = "РСВУ salary outcome data"),
    )
)]
struct ApiDoc;

pub fn build(state: AppState) -> OpenApiRouter {
    let cors = CorsLayer::new()
        .allow_origin([
            "https://kandidatstudent.bg".parse().unwrap(),
            "https://www.kandidatstudent.bg".parse().unwrap(),
        ])
        .allow_methods([Method::GET])
        .allow_headers([header::ACCEPT, header::CONTENT_TYPE])
        .vary([header::ORIGIN]);

    OpenApiRouter::with_openapi(ApiDoc::openapi())
        .routes(routes!(crate::handlers::health::healthz))
        .routes(routes!(crate::handlers::health::readyz))
        .routes(routes!(crate::handlers::institutions::list_institutions))
        .routes(routes!(crate::handlers::institutions::get_institution))
        .routes(routes!(crate::handlers::professional_fields::list_professional_fields))
        .routes(routes!(crate::handlers::professional_fields::get_professional_field))
        .routes(routes!(crate::handlers::specialties::list_specialties))
        .routes(routes!(crate::handlers::specialties::get_specialty))
        .routes(routes!(crate::handlers::programs::list_programs))
        .routes(routes!(crate::handlers::programs::get_program))
        .routes(routes!(crate::handlers::programs::get_program_admissions))
        .routes(routes!(crate::handlers::search::search_programs))
        .routes(routes!(crate::handlers::outcomes::list_salary_outcomes))
        .layer(TraceLayer::new_for_http())
        .layer(CompressionLayer::new())
        .layer(cors)
        .layer(PropagateRequestIdLayer::x_request_id())
        .layer(SetRequestIdLayer::x_request_id(MakeRequestUuid))
        .with_state(state)
}
