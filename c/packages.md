# C — Common Libraries

C has no package manager. Libraries are installed via apt or vendored manually.

Install with `apt-get install -y <package>` inside the container, or add to the Dockerfile.

## Data Structures
| apt package       | Library      | Description                        |
|-------------------|--------------|------------------------------------|
| `libglib2.0-dev`  | GLib         | Hash tables, linked lists, strings |

## Networking
| apt package         | Library    | Description                      |
|---------------------|------------|----------------------------------|
| `libcurl4-openssl-dev` | libcurl | HTTP client (curl)              |
| `libuv1-dev`        | libuv      | Async I/O (used by Node.js)     |

## JSON / Parsing
| apt package       | Library      | Description                        |
|-------------------|--------------|------------------------------------|
| `libjansson-dev`  | Jansson      | JSON encoding/decoding             |
| `libjson-c-dev`   | json-c       | Alternative JSON library           |
| `libpcre2-dev`    | PCRE2        | Regular expressions                |

## Database
| apt package            | Library     | Description                    |
|------------------------|-------------|--------------------------------|
| `libsqlite3-dev`       | SQLite      | Embedded SQL database          |
| `libpq-dev`            | libpq       | PostgreSQL client              |
| `libmysqlclient-dev`   | MySQL       | MySQL client                   |

## Cryptography / Security
| apt package       | Library      | Description                        |
|-------------------|--------------|------------------------------------|
| `libssl-dev`      | OpenSSL      | TLS/SSL, hashing, crypto           |
| `libsodium-dev`   | libsodium    | Modern crypto (NaCl-based)         |

## Testing
| Vendored           | Description                                      |
|--------------------|--------------------------------------------------|
| `unity`            | github.com/ThrowTheSwitch/Unity — lightweight test framework |
| `criterion`        | github.com/Snaipe/Criterion — modern test framework |
| `cmocka`           | apt: `libcmocka-dev` — mock-friendly testing     |

## How to add a library to the Dockerfile

```dockerfile
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libjansson-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*
```

Then link it when compiling:
```bash
gcc hello.c -o hello -lcurl -ljansson -lsqlite3
```
