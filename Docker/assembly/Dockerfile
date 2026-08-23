FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    nasm \
    yasm \
    gcc \
    gdb \
    binutils \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
CMD ["bash"]
