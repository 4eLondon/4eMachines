FROM debian:bookworm-slim

ARG ZIG_VERSION=0.14.1

RUN apt-get update && apt-get install -y curl xz-utils && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz" \
    | tar -xJ -C /opt && \
    ln -s /opt/zig-linux-x86_64-${ZIG_VERSION}/zig /usr/local/bin/zig

WORKDIR /code
CMD ["bash"]
