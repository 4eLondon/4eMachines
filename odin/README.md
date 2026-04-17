# Odin Dev Container

Includes: Odin compiler (latest, built from source), LLVM/Clang (backend)

> ⚠️ No official Docker image exists for Odin — this builds the compiler
> from source. First build takes a few minutes. Subsequent builds use
> Docker's layer cache so they're instant unless the Dockerfile changes.

## Build

```bash
docker build -t dev-odin .
```

## Run

```bash
docker run --rm -it -v "$PWD":/code dev-odin
```

## Common commands inside the container

```bash
odin version                        # confirm compiler is working

odin run hello.odin -file           # compile and run a single file
odin build hello.odin -file         # compile only (produces ./hello)

odin run .                          # build and run the current package
odin build .                        # build the current package
odin check .                        # type-check without compiling

odin run . -debug                   # debug build
odin build . -o:speed               # optimised build
odin build . -target:linux_amd64    # cross-compile
```

## Project layout convention

```
my_project/
├── main.odin       # package main, entry point
└── utils.odin      # same package, split across files
```

All `.odin` files in the same directory belong to the same package.

See `packages.md` for common libraries.
