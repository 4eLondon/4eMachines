# Bash — Common Tools

These are `apt` packages you can add to the Dockerfile or install on demand.

## Text Processing
| apt package  | Tool    | Description                                      |
|--------------|---------|--------------------------------------------------|
| `gawk`       | awk     | Pattern scanning and text processing             |
| `sed`        | sed     | Stream editor (already in slim image)            |
| `grep`       | grep    | Pattern matching (already in slim image)         |
| `ripgrep`    | rg      | Fast recursive grep                              |
| `miller`     | mlr     | awk/sed for CSV, TSV, JSON                       |

## File / Archive
| apt package  | Tool    | Description                                      |
|--------------|---------|--------------------------------------------------|
| `rsync`      | rsync   | File sync / copy with delta transfer             |
| `zip`        | zip     | Zip archives                                     |
| `unzip`      | unzip   | Unzip archives                                   |
| `tar`        | tar     | Tarball archives (already present)               |
| `fd-find`    | fd      | Fast find replacement (`fd` command)             |

## Networking
| apt package       | Tool    | Description                                 |
|-------------------|---------|---------------------------------------------|
| `curl`            | curl    | HTTP client (already in image)              |
| `wget`            | wget    | Download files                              |
| `netcat-openbsd`  | nc      | TCP/UDP swiss army knife                    |
| `dnsutils`        | dig     | DNS lookups                                 |
| `iproute2`        | ip, ss  | Network interface and socket info           |

## JSON / YAML / TOML
| apt package  | Tool    | Description                                      |
|--------------|---------|--------------------------------------------------|
| `jq`         | jq      | JSON processing (already in image)               |
| `yq`         | yq      | YAML/TOML/JSON processing (install via binary)   |

Installing `yq` (not in apt, grab the binary):
```bash
curl -fsSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
  -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
```

## Dev / Testing
| apt / source | Tool        | Description                                  |
|--------------|-------------|----------------------------------------------|
| `bats`       | bats        | Bash Automated Testing System (in image)     |
| `shellcheck` | shellcheck  | Shell script linter (in image)               |
| `shfmt`      | shfmt       | Shell script formatter (install via binary)  |

Installing `shfmt`:
```bash
curl -fsSL https://github.com/mvdan/sh/releases/latest/download/shfmt_v3.8.0_linux_amd64 \
  -o /usr/local/bin/shfmt && chmod +x /usr/local/bin/shfmt
```

## Adding tools to the Dockerfile

```dockerfile
RUN apt-get update && apt-get install -y \
    gawk \
    rsync \
    wget \
    fd-find \
    && rm -rf /var/lib/apt/lists/*
```
