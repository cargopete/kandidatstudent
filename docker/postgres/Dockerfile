FROM postgres:16-bookworm

# Install Bulgarian ispell dictionary for full-text search.
# Source: https://github.com/quasoft/postgres-tsearch-bulgarian
#
# The three files (bulgarian.affix, bulgarian.dict, bulgarian.stop) must be placed
# in $SHAREDIR/tsearch_data/ which Postgres finds at runtime.
RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates \
    && SHAREDIR=$(pg_config --sharedir) \
    && wget -qO "$SHAREDIR/tsearch_data/bulgarian.affix" \
        "https://raw.githubusercontent.com/quasoft/postgres-tsearch-bulgarian/master/bulgarian.affix" \
    && wget -qO "$SHAREDIR/tsearch_data/bulgarian.dict" \
        "https://raw.githubusercontent.com/quasoft/postgres-tsearch-bulgarian/master/bulgarian.dict" \
    && wget -qO "$SHAREDIR/tsearch_data/bulgarian.stop" \
        "https://raw.githubusercontent.com/quasoft/postgres-tsearch-bulgarian/master/bulgarian.stop" \
    && apt-get purge -y wget \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
