# Go — Common Packages

Install with `go get <module>` inside your project.

## Web / HTTP
| Module                              | Description                        |
|-------------------------------------|------------------------------------|
| `github.com/gin-gonic/gin`          | Fast HTTP web framework            |
| `github.com/go-chi/chi/v5`          | Lightweight router                 |
| `github.com/labstack/echo/v4`       | Minimalist web framework           |
| `golang.org/x/net`                  | Extended networking stdlib         |

## Database
| Module                              | Description                        |
|-------------------------------------|------------------------------------|
| `github.com/mattn/go-sqlite3`       | SQLite driver                      |
| `github.com/lib/pq`                 | PostgreSQL driver                  |
| `github.com/go-sql-driver/mysql`    | MySQL driver                       |
| `github.com/jmoiern/sqlx`           | Extensions to `database/sql`       |
| `gorm.io/gorm`                      | ORM                                |
| `gorm.io/driver/sqlite`             | GORM SQLite driver                 |

## JSON / Data
| Module                              | Description                        |
|-------------------------------------|------------------------------------|
| `encoding/json`                     | Built-in JSON (no install needed)  |
| `github.com/tidwall/gjson`          | Fast JSON path queries             |
| `gopkg.in/yaml.v3`                  | YAML parsing                       |
| `github.com/BurntSushi/toml`        | TOML parsing                       |

## CLI
| Module                              | Description                        |
|-------------------------------------|------------------------------------|
| `github.com/spf13/cobra`            | CLI framework (used by kubectl etc)|
| `github.com/urfave/cli/v2`          | Lightweight CLI framework          |
| `github.com/spf13/viper`            | Config file + env management       |

## Utilities
| Module                              | Description                        |
|-------------------------------------|------------------------------------|
| `github.com/rs/zerolog`             | Fast structured logging            |
| `go.uber.org/zap`                   | High-performance logging           |
| `github.com/stretchr/testify`       | Test assertions and mocks          |
| `golang.org/x/sync`                 | errgroup, semaphore, singleflight  |

## Example go.mod

```
module github.com/yourname/myproject

go 1.24

require (
    github.com/gin-gonic/gin v1.10.0
    github.com/stretchr/testify v1.9.0
)
```
