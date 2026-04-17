FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    git \
    clang \
    llvm \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/odin-lang/Odin /opt/odin && \
    cd /opt/odin && \
    make release && \
    rm -rf /opt/odin/.git

ENV PATH="/opt/odin:$PATH"

WORKDIR /code
CMD ["bash"]
