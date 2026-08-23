# Nim — Common Packages

Install with `nimble install <package>` or add to your `.nimble` file.

## Web
| Package      | Description                                  |
|--------------|----------------------------------------------|
| `jester`     | Sinatra-like web framework                   |
| `prologue`   | Full-featured web framework                  |
| `httpbeast`  | High-performance async HTTP server           |
| `karax`      | Single-page app framework (compiles to JS)   |

## Data / Parsing
| Package      | Description                                  |
|--------------|----------------------------------------------|
| `jsony`      | Fast JSON serialization                      |
| `json`       | Standard library JSON (built-in)             |
| `parsetoml`  | TOML parser                                  |
| `yaml`       | YAML parser                                  |
| `csvtools`   | CSV parsing                                  |

## Database
| Package      | Description                                  |
|--------------|----------------------------------------------|
| `db_sqlite`  | SQLite (standard library, built-in)          |
| `db_postgres`| PostgreSQL (standard library, built-in)      |
| `norm`       | ORM for SQLite and PostgreSQL                |

## Utilities
| Package      | Description                                  |
|--------------|----------------------------------------------|
| `chronicles` | Structured logging                           |
| `regex`      | PCRE regex                                   |
| `cligen`     | CLI argument parser                          |
| `puppy`      | Simple HTTP client                           |
| `asynctools` | Async utilities                              |

## GUI
| Package      | Description                                  |
|--------------|----------------------------------------------|
| `nigui`      | Cross-platform GUI toolkit                   |
| `nimx`       | Game/GUI framework                           |

## Example .nimble snippet
```nim
requires "nim >= 2.0.0"
requires "jsony >= 1.1.5"
requires "cligen >= 1.6.0"
```
