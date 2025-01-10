ARG RUNNER_VERSION="2.321.0"
FROM ghcr.io/actions/actions-runner:$RUNNER_VERSION

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    git-lfs \
    gzip \
    jq \
    tar \
    unzip \
    zip \
    zstd \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*
COPY start.sh start.sh
RUN chmod +x start.sh

USER runner
ENTRYPOINT ["./start.sh"]
