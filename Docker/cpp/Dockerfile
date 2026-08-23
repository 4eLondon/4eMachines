FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    g++ \
    clang \
    gdb \
    make \
    cmake \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
CMD ["bash"]
