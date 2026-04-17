# Rust — Common Crates

Add with `cargo add <crate>` or edit `Cargo.toml` manually.

## Async Runtime
| Crate        | Description                                       |
|--------------|---------------------------------------------------|
| `tokio`      | The standard async runtime (use `features = ["full"]`) |
| `async-std`  | Alternative async runtime                         |
| `futures`    | Core async/await primitives and combinators       |

## Web / HTTP
| Crate        | Description                                       |
|--------------|---------------------------------------------------|
| `axum`       | Web framework built on Tokio (most popular)       |
| `actix-web`  | High-performance web framework                    |
| `warp`       | Lightweight filter-based web framework            |
| `reqwest`    | Async HTTP client                                 |
| `hyper`      | Low-level HTTP (used by axum/reqwest internally)  |
| `tower`      | Middleware and service abstractions               |

## Database
| Crate           | Description                                    |
|-----------------|------------------------------------------------|
| `sqlx`          | Async SQL (compile-time query checking)        |
| `diesel`        | ORM with strong type safety                    |
| `rusqlite`      | SQLite bindings                                |
| `sea-orm`       | Async ORM built on SQLx                        |

## Serialisation / Data
| Crate           | Description                                    |
|-----------------|------------------------------------------------|
| `serde`         | Serialisation framework (nearly universal)     |
| `serde_json`    | JSON via Serde                                 |
| `toml`          | TOML parsing via Serde                         |
| `serde_yaml`    | YAML via Serde                                 |
| `csv`           | CSV reading and writing                        |

## Error Handling
| Crate        | Description                                       |
|--------------|---------------------------------------------------|
| `anyhow`     | Flexible error handling for applications          |
| `thiserror`  | Derive macros for custom error types (libraries)  |
| `color-eyre` | Pretty error reports with backtraces              |

## CLI
| Crate        | Description                                       |
|--------------|---------------------------------------------------|
| `clap`       | CLI argument parser (most popular, derive API)    |
| `indicatif`  | Progress bars and spinners                        |
| `console`    | Terminal styling                                  |
| `dialoguer`  | Interactive terminal prompts                      |

## Logging / Tracing
| Crate        | Description                                       |
|--------------|---------------------------------------------------|
| `tracing`    | Structured async-aware logging/tracing            |
| `tracing-subscriber` | Output formatting for tracing             |
| `log`        | Simple logging facade (older, widely used)        |
| `env_logger` | Log output controlled by `RUST_LOG` env var       |

## Utilities
| Crate        | Description                                       |
|--------------|---------------------------------------------------|
| `rayon`      | Data parallelism (parallel iterators)             |
| `itertools`  | Extra iterator adapters                           |
| `regex`      | Regular expressions                               |
| `uuid`       | UUID generation and parsing                       |
| `chrono`     | Date and time                                     |
| `rand`       | Random number generation                          |
| `dashmap`    | Concurrent HashMap                                |

## Example Cargo.toml

```toml
[package]
name = "my_project"
version = "0.1.0"
edition = "2021"

[dependencies]
tokio = { version = "1", features = ["full"] }
axum = "0.8"
serde = { version = "1", features = ["derive"] }
serde_json = "1"
anyhow = "1"
tracing = "0.1"
tracing-subscriber = "0.3"
```
