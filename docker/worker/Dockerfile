FROM rust:latest AS builder
WORKDIR /build
COPY . .
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/build/target \
    SQLX_OFFLINE=true cargo build --release --bin kandidatstudent-worker && \
    cp target/release/kandidatstudent-worker /usr/local/bin/kandidatstudent-worker

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates libssl3 \
    && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/bin/kandidatstudent-worker /usr/local/bin/kandidatstudent-worker
CMD ["kandidatstudent-worker"]
