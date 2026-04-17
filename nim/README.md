# Nim Dev Container

Includes: Nim 2.2.2, nimble (package manager)

## Build

```bash
docker build -t dev-nim .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-nim

# Persist nimble packages between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v nim-pkgs:/root/.nimble \
  dev-nim
```

## Common commands inside the container

```bash
nim c hello.nim               # compile to C backend (default)
nim c -r hello.nim            # compile and run immediately
nim js hello.nim              # compile to JavaScript
nim cpp hello.nim             # compile via C++ backend

nimble init                   # create a new project
nimble build                  # build project
nimble run                    # run project
nimble test                   # run tests
nimble install <package>      # install a package
nimble search <query>         # search packages
```

## Compile flags worth knowing

```bash
nim c -d:release hello.nim    # optimised build
nim c -d:debug hello.nim      # debug build (default)
nim c --gc:orc hello.nim      # use ORC garbage collector (recommended)
nim c -d:ssl hello.nim        # enable SSL support
```

See `packages.md` for common libraries.
