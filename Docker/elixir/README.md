# Elixir Dev Container

Includes: Elixir 1.18, Erlang/OTP, `mix`, `hex`, `rebar3`

## Build

```bash
docker build -t dev-elixir .
```

## Run

```bash
# Interactive shell with your code mounted
docker run --rm -it -v "$PWD":/code dev-elixir

# Persist downloaded hex packages between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v elixir-hex:/root/.hex \
  -v elixir-mix:/root/.mix \
  dev-elixir
```

## Common commands inside the container

```bash
iex                        # interactive Elixir shell
mix new my_project         # create a new project
mix deps.get               # install dependencies
mix compile                # compile
mix test                   # run tests
mix run lib/main.exs       # run a file
elixir hello.exs           # run a single script
```

See `packages.md` for common libraries.
