FROM rust:latest AS builder
WORKDIR /build
COPY . .
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/build/target \
    SQLX_OFFLINE=true cargo build --release --bin kandidatstudent-api && \
    cp target/release/kandidatstudent-api /usr/local/bin/kandidatstudent-api

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates libssl3 \
    && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/bin/kandidatstudent-api /usr/local/bin/kandidatstudent-api
EXPOSE 8080
CMD ["kandidatstudent-api"]
