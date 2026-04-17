# OCaml Dev Container

Includes: OCaml 5.2, opam (package manager), dune (build system)

## Build

```bash
docker build -t dev-ocaml .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-ocaml

# Persist opam packages between sessions (recommended)
docker run --rm -it \
  -v "$PWD":/code \
  -v ocaml-opam:/home/opam/.opam \
  dev-ocaml
```

## Common commands inside the container

```bash
ocaml                           # interactive toplevel (REPL)
ocamlc hello.ml -o hello        # compile bytecode
ocamlopt hello.ml -o hello      # compile native binary (faster)

dune init project my_project    # create new project
dune build                      # build
dune exec ./bin/main.exe        # run
dune test                       # run tests
dune utop                       # REPL with project loaded (if utop installed)

opam install <package>          # install a package
opam list                       # list installed packages
opam update && opam upgrade     # update everything
```

See `packages.md` for common libraries.
