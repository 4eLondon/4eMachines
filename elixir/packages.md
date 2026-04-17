# Elixir — Common Packages

Add these to your `mix.exs` deps list, then run `mix deps.get`.

## Web
| Package     | Description                        |
|-------------|------------------------------------|
| `phoenix`   | Full-stack web framework           |
| `plug`      | HTTP middleware (lighter than Phoenix) |
| `bandit`    | Pure-Elixir HTTP server            |

## Data
| Package      | Description                       |
|--------------|-----------------------------------|
| `ecto`       | Database wrapper / query DSL      |
| `ecto_sql`   | SQL adapter for Ecto              |
| `postgrex`   | PostgreSQL driver                 |
| `myxql`      | MySQL/MariaDB driver              |
| `jason`      | Fast JSON encoding/decoding       |

## Utilities
| Package       | Description                      |
|---------------|----------------------------------|
| `tesla`       | HTTP client                      |
| `httpoison`   | Another HTTP client (older)      |
| `timex`       | Date/time library                |
| `ex_doc`      | Documentation generator          |
| `credo`       | Static analysis / linter         |
| `dialyxir`    | Dialyzer type checking wrapper   |

## Concurrency / OTP
| Package      | Description                       |
|--------------|-----------------------------------|
| `gen_stage`  | Producer/consumer pipeline        |
| `broadway`   | Data processing pipelines         |
| `oban`       | Background job processing         |

## Example mix.exs snippet
```elixir
defp deps do
  [
    {:jason, "~> 1.4"},
    {:tesla, "~> 1.9"},
    {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
  ]
end
```
