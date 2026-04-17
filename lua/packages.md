# Lua — Common Packages

Install with `luarocks install <package>`.

## Web
| Package     | Description                                      |
|-------------|--------------------------------------------------|
| `lapis`     | Web framework built on OpenResty/nginx            |
| `sailor`    | MVC web framework                                |
| `pegasus`   | Simple HTTP server                               |

## Data / Parsing
| Package       | Description                                    |
|---------------|------------------------------------------------|
| `dkjson`      | JSON encoding/decoding                         |
| `lua-cjson`   | Fast JSON (C extension)                        |
| `lyaml`       | YAML parser                                    |
| `lua-toml`    | TOML parser                                    |
| `luacsv`      | CSV parser                                     |

## Database
| Package        | Description                                   |
|----------------|-----------------------------------------------|
| `luasql-sqlite3` | SQLite driver                               |
| `luasql-postgres`| PostgreSQL driver                           |
| `luasql-mysql` | MySQL driver                                 |

## Utilities
| Package      | Description                                    |
|--------------|------------------------------------------------|
| `luasocket`  | TCP/UDP networking, HTTP client                |
| `luafilesystem` | Filesystem operations                       |
| `penlight`   | Extended stdlib (strings, tables, files, etc.) |
| `lustache`   | Mustache templates                             |
| `argparse`   | CLI argument parser                            |
| `inspect`    | Human-readable table printing (like print_r)  |
| `luaunit`    | Unit testing framework                         |

## Example: install and use penlight

```bash
luarocks install penlight
```

```lua
local pl = require("pl.import_into")()
pl.pretty.dump({ key = "value", nums = {1, 2, 3} })
```
