# Haskell Dev Container

Includes: GHC 9.8, Stack, Cabal

## Build

```bash
docker build -t dev-haskell .
```

> ⚠️ First build is large (~1.5 GB) because GHC is big. Use a named volume
> to avoid re-downloading Stack's package index on every run.

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-haskell

# Persist Stack's downloaded packages (recommended)
docker run --rm -it \
  -v "$PWD":/code \
  -v haskell-stack:/root/.stack \
  dev-haskell
```

## Common commands inside the container

```bash
ghci                          # interactive REPL
ghc hello.hs -o hello         # compile a single file
runghc hello.hs               # run without compiling

stack new my-project          # create a new project
stack build                   # build project
stack run                     # run project
stack test                    # run tests
stack ghci                    # REPL with project loaded

cabal update                  # update package index
cabal init                    # create a new project
cabal build                   # build
cabal run                     # run
cabal repl                    # REPL
```

See `packages.md` for common libraries.
