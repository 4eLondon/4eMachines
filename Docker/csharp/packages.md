# C# / .NET — Common NuGet Packages

Install with `dotnet add package <PackageName>`.

## Web / HTTP
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `Microsoft.AspNetCore.App`     | ASP.NET Core (included in SDK)           |
| `Carter`                       | Minimal API routing (Nancy successor)    |
| `FastEndpoints`                | REPR pattern web endpoints               |
| `RestSharp`                    | HTTP client                              |
| `Refit`                        | Type-safe REST client (interface-based)  |
| `Flurl.Http`                   | Fluent HTTP client                       |

## Database
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `Microsoft.EntityFrameworkCore`| EF Core ORM                             |
| `Microsoft.EntityFrameworkCore.Sqlite` | SQLite provider for EF Core    |
| `Npgsql.EntityFrameworkCore.PostgreSQL` | PostgreSQL provider for EF Core|
| `Dapper`                       | Lightweight micro-ORM                    |
| `SqlKata`                      | SQL query builder                        |

## JSON / Data
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `System.Text.Json`             | Built-in JSON (no install needed)        |
| `Newtonsoft.Json`              | Classic JSON library (more features)     |
| `YamlDotNet`                   | YAML parsing and serialisation           |
| `CsvHelper`                    | CSV reading and writing                  |

## Testing
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `xunit`                        | Test framework (most popular)            |
| `NUnit`                        | Alternative test framework               |
| `Moq`                          | Mocking framework                        |
| `FluentAssertions`             | Readable assertion library               |
| `Bogus`                        | Fake data generator for tests            |

## Logging
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `Microsoft.Extensions.Logging` | Built-in logging (no install needed)     |
| `Serilog`                      | Structured logging                       |
| `Serilog.Sinks.Console`        | Console output for Serilog               |
| `NLog`                         | Alternative logging framework            |

## CLI
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `System.CommandLine`           | Microsoft's CLI parsing library          |
| `Spectre.Console`              | Rich terminal output, tables, prompts    |
| `CliFx`                        | Declarative CLI framework                |

## Utilities
| Package                        | Description                              |
|--------------------------------|------------------------------------------|
| `AutoMapper`                   | Object-to-object mapping                 |
| `MediatR`                      | Mediator pattern / CQRS                  |
| `Polly`                        | Retry, circuit breaker, resilience       |
| `FluentValidation`             | Validation rules with fluent API         |
| `Humanizer`                    | Strings, dates, numbers → human readable |

## Example .csproj snippet

```xml
<ItemGroup>
  <PackageReference Include="Dapper" Version="2.1.28" />
  <PackageReference Include="Serilog" Version="4.0.0" />
  <PackageReference Include="Serilog.Sinks.Console" Version="6.0.0" />
  <PackageReference Include="FluentValidation" Version="11.9.2" />
</ItemGroup>
```
