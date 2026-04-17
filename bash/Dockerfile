FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    bash \
    shellcheck \
    bats \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
CMD ["bash"]
