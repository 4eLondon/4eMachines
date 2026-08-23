# Zig Dev Container

Includes: Zig 0.14.1

To use a different version, pass a build arg:
```bash
docker build --build-arg ZIG_VERSION=0.13.0 -t dev-zig .
```

## Build

```bash
docker build -t dev-zig .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-zig

# Persist the global package cache between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v zig-cache:/root/.cache/zig \
  dev-zig
```

## Common commands inside the container

```bash
zig version                         # confirm version

# Single file
zig run hello.zig                   # compile and run
zig build-exe hello.zig             # compile to binary

# Project (has build.zig)
zig build                           # build
zig build run                       # build and run
zig build test                      # run tests
zig build -Doptimize=ReleaseFast    # optimised build

# Translate C headers to Zig
zig translate-c header.h

# Use Zig as a C compiler
zig cc -o hello hello.c
```

## Project layout

```
my_project/
├── build.zig         # build script
├── build.zig.zon     # package manifest (dependencies)
└── src/
    └── main.zig      # entry point
```

Create with: `zig init` (inside an empty directory)

See `packages.md` for common libraries.
