FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    lua5.4 \
    luarocks \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
CMD ["bash"]
