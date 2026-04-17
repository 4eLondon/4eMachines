# 4eLibrary Dev Environments

Isolated, self-contained Docker dev environments — one per language.  
Each folder is **fully independent**: you can clone just the one you need.

---

## Grab everything

```bash
git clone https://github.com/4eLondon/4eLibrary-devenv
cd 4eLibrary-devenv/elixir
docker build -t dev-elixir .
docker run --rm -it -v "$PWD":/code dev-elixir
```

---

## Grab just one language (sparse checkout)

You don't need to clone the whole repo. Use Git sparse checkout:

```bash
git clone --no-checkout --depth=1 https://github.com/4eLondon/4eLibrary-devenv
cd 4eLibrary-devenv
git sparse-checkout init --cone
git sparse-checkout set zig        # or elixir, haskell, nim, etc.
git checkout main
```

Then build and run:

```bash
cd zig
docker build -t dev-zig .
docker run --rm -it -v /path/to/your/code:/code dev-zig
```

---

## Usage pattern

Every container follows the same convention:

| What                          | How                                                  |
|-------------------------------|------------------------------------------------------|
| Mount your code               | `-v /path/to/your/project:/code`                     |
| Start a shell                 | `docker run --rm -it -v "$PWD":/code dev-<lang>`     |
| Run a one-off command         | `docker run --rm -v "$PWD":/code dev-<lang> zig build` |
| Persist packages between runs | Add a named volume (see each language's README)      |

The `-v "$PWD":/code` flag mounts your current directory into the container at `/code`.  
Your files live on your machine — the container only provides the toolchain.

---

## Languages

| Folder      | Toolchain                          | Unusual? |
|-------------|-------------------------------------|----------|
| `assembly/` | nasm, yasm, gcc (linker), gdb       | ✓        |
| `bash/`     | bash, shellcheck, bats              |          |
| `c/`        | gcc, clang, gdb, make               |          |
| `cpp/`      | g++, clang, gdb, cmake              |          |
| `csharp/`   | .NET SDK 8                          |          |
| `elixir/`   | Elixir + Erlang/OTP, mix, hex       | ✓        |
| `go/`       | Go toolchain                        |          |
| `haskell/`  | GHC, Stack, Cabal                   | ✓        |
| `java/`     | JDK 21 (Temurin), maven             |          |
| `lua/`      | Lua 5.4, luarocks                   | ✓        |
| `nim/`      | Nim compiler, nimble                | ✓        |
| `ocaml/`    | OCaml, opam, dune, utop             | ✓        |
| `odin/`     | Odin compiler (built from source)   | ✓        |
| `python/`   | Python 3, pip                       |          |
| `ruby/`     | Ruby, bundler, gem                  |          |
| `rust/`     | rustup, cargo, clippy, rustfmt      |          |
| `zig/`      | Zig compiler                        | ✓        |

Each folder contains:
- `Dockerfile` — the container definition
- `README.md` — how to build/run + common commands
- `packages.md` — curated list of common packages to install when you need them
