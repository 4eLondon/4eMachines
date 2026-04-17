# OCaml — Common Packages

Install with `opam install <package>`, then add to your `dune` build file.

## Essential
| Package     | Description                                  |
|-------------|----------------------------------------------|
| `utop`      | Improved interactive toplevel (REPL)         |
| `ocamlformat` | Code formatter                             |
| `merlin`    | IDE support (autocomplete, types in editor)  |
| `ocp-indent`| Indentation tool                             |

## Data Structures & Algorithms
| Package       | Description                                |
|---------------|--------------------------------------------|
| `core`        | Jane Street's extended stdlib              |
| `base`        | Jane Street's alternative stdlib           |
| `containers`  | More data structures (lightweight)         |
| `seq`         | Lazy sequences                             |

## Web
| Package      | Description                                 |
|--------------|---------------------------------------------|
| `dream`      | Web framework (modern, recommended)         |
| `cohttp`     | HTTP client and server                      |
| `piaf`       | HTTP/2 client                               |

## Data / Parsing
| Package      | Description                                 |
|--------------|---------------------------------------------|
| `yojson`     | JSON parsing/generation                     |
| `ezjsonm`    | Simpler JSON interface                      |
| `csv`        | CSV parsing                                 |
| `menhir`     | Parser generator                            |
| `angstrom`   | Parser combinator library                   |

## Database
| Package       | Description                                |
|---------------|--------------------------------------------|
| `caqti`       | Unified DB interface (postgres, sqlite)    |
| `caqti-driver-postgresql` | PostgreSQL backend            |
| `caqti-driver-sqlite3`    | SQLite backend                |

## Testing
| Package    | Description                                   |
|------------|-----------------------------------------------|
| `alcotest` | Lightweight testing framework                 |
| `qcheck`   | Property-based testing                        |
| `ounit2`   | Classic xUnit-style testing                   |

## Example dune file snippet
```scheme
(executable
 (name main)
 (libraries yojson dream))
```
