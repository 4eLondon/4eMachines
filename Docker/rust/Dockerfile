FROM rust:1.87-slim

# clippy = linter, rustfmt = formatter — both are essential
RUN rustup component add clippy rustfmt

WORKDIR /code
CMD ["bash"]
