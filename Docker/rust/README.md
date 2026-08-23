# Rust Dev Container

Includes: Rust 1.87, Cargo, Clippy, Rustfmt

## Build

```bash
docker build -t dev-rust .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-rust

# Persist the Cargo registry (avoid re-downloading crates every time)
docker run --rm -it \
  -v "$PWD":/code \
  -v rust-cargo:/usr/local/cargo/registry \
  dev-rust
```

## Common commands inside the container

```bash
cargo new my_project          # create a new binary project
cargo new --lib my_lib        # create a new library project

cargo build                   # debug build
cargo build --release         # optimised build
cargo run                     # build and run
cargo run --release           # optimised run

cargo test                    # run all tests
cargo test test_name          # run a specific test
cargo test -- --nocapture     # show println! output during tests

cargo add <crate>             # add a dependency to Cargo.toml
cargo remove <crate>          # remove a dependency
cargo update                  # update all dependencies

cargo clippy                  # lint
cargo fmt                     # format code
cargo doc --open              # build and open documentation
cargo check                   # type-check without compiling (fast)
```

See `packages.md` for common crates.
