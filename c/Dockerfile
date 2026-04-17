FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    gcc \
    clang \
    gdb \
    make \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
CMD ["bash"]
