# Haskell — Common Packages

Add to your `package.yaml` (Stack) or `*.cabal` file, then `stack build` / `cabal build`.

## Essential
| Package       | Description                              |
|---------------|------------------------------------------|
| `text`        | Efficient Unicode text type              |
| `bytestring`  | Efficient byte string type               |
| `containers`  | Map, Set, Seq, etc.                      |
| `mtl`         | Monad transformer library                |
| `transformers`| Monad transformers (Reader, State, etc.) |

## Web
| Package      | Description                               |
|--------------|-------------------------------------------|
| `scotty`     | Lightweight web framework                 |
| `servant`    | Type-safe REST API framework              |
| `warp`       | High-performance HTTP server              |
| `http-client`| HTTP client                               |
| `wreq`       | Friendly HTTP client                      |

## Data / Parsing
| Package      | Description                               |
|--------------|-------------------------------------------|
| `aeson`      | JSON encoding/decoding                    |
| `parsec`     | Parser combinator library                 |
| `megaparsec` | Modern, powerful parser combinators       |
| `cassava`    | CSV parsing                               |
| `yaml`       | YAML parsing                              |

## Database
| Package         | Description                            |
|-----------------|----------------------------------------|
| `persistent`    | Type-safe database layer               |
| `esqueleto`     | SQL DSL on top of persistent           |
| `postgresql-simple` | Simple PostgreSQL bindings         |
| `sqlite-simple` | Simple SQLite bindings                 |

## Testing
| Package      | Description                               |
|--------------|-------------------------------------------|
| `hspec`      | RSpec-style testing framework             |
| `QuickCheck` | Property-based testing                    |
| `tasty`      | Test framework with multiple backends     |

## Dev Tools (install globally with Stack)
```bash
stack install hlint          # linter
stack install ormolu         # code formatter
stack install hoogle         # type-based documentation search
```
