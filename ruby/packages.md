# Ruby — Common Gems

Install with `gem install <gem>` or add to your `Gemfile` and run `bundle install`.

## Web
| Gem          | Description                                       |
|--------------|---------------------------------------------------|
| `rails`      | Full-stack web framework                          |
| `sinatra`    | Lightweight web framework                         |
| `roda`       | Fast, minimal routing framework                   |
| `rack`       | Web server interface (used by most frameworks)    |
| `puma`       | Web server (used by Rails by default)             |
| `faraday`    | HTTP client with middleware                       |
| `httparty`   | Simple HTTP client                                |

## Database
| Gem            | Description                                     |
|----------------|-------------------------------------------------|
| `activerecord` | ORM (comes with Rails, usable standalone)       |
| `sequel`       | Flexible ORM / SQL toolkit                      |
| `sqlite3`      | SQLite driver                                   |
| `pg`           | PostgreSQL driver                               |
| `mysql2`       | MySQL driver                                    |

## Data / Parsing
| Gem          | Description                                       |
|--------------|---------------------------------------------------|
| `json`       | JSON (built-in stdlib)                            |
| `oj`         | Fast JSON parser (C extension)                    |
| `psych`      | YAML (built-in stdlib)                            |
| `nokogiri`   | HTML/XML parsing                                  |
| `csv`        | CSV parsing (built-in stdlib)                     |
| `dry-schema` | Data validation and coercion                      |

## CLI
| Gem          | Description                                       |
|--------------|---------------------------------------------------|
| `thor`       | CLI framework (used by Rails generators)          |
| `gli`        | Git-like CLI interface                            |
| `optparse`   | CLI parsing (built-in stdlib)                     |
| `tty-prompt` | Interactive terminal prompts                      |
| `pastel`     | Terminal color output                             |

## Testing
| Gem           | Description                                      |
|---------------|--------------------------------------------------|
| `rspec`       | BDD test framework (most popular)                |
| `minitest`    | Lightweight test framework (in stdlib)           |
| `factory_bot` | Test data / fixtures                             |
| `faker`       | Generate fake data for tests                     |
| `webmock`     | Stub HTTP requests in tests                      |
| `vcr`         | Record and replay HTTP interactions              |

## Dev Tools
| Gem          | Description                                       |
|--------------|---------------------------------------------------|
| `pry`        | Enhanced interactive REPL                         |
| `rubocop`    | Linter and formatter                              |
| `solargraph` | Language server (autocomplete in editors)         |
| `byebug`     | Debugger                                          |
| `reek`       | Code smell detector                               |

## Example Gemfile

```ruby
source "https://rubygems.org"

gem "sinatra"
gem "oj"
gem "pg"

group :development, :test do
  gem "rspec"
  gem "rubocop", require: false
end
```
