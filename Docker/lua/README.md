# Lua Dev Container

Includes: Lua 5.4, LuaRocks (package manager)

## Build

```bash
docker build -t dev-lua .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-lua

# Persist luarocks packages between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v lua-rocks:/usr/local/lib/lua \
  dev-lua
```

## Common commands inside the container

```bash
lua hello.lua               # run a script
lua -e "print('hello')"    # run inline

luarocks install <pkg>      # install a package
luarocks list               # list installed packages
luarocks search <query>     # search packages
luarocks remove <pkg>       # uninstall

# Interactive REPL
lua
```

See `packages.md` for common libraries.
