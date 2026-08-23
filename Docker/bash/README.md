# Bash Dev Container

Includes: Bash, ShellCheck (linter), BATS (test framework), curl, jq

Useful for testing scripts in a clean, isolated environment — no host
tools leaking in, and a predictable Debian base.

## Build

```bash
docker build -t dev-bash .
```

## Run

```bash
docker run --rm -it -v "$PWD":/code dev-bash
```

## Common commands inside the container

```bash
bash hello.sh                       # run a script
bash -n hello.sh                    # syntax check without running
bash -x hello.sh                    # trace execution (prints each command)

shellcheck hello.sh                 # lint — catches common mistakes
shellcheck -S warning hello.sh      # only show warnings and above
shellcheck -e SC2086 hello.sh       # ignore specific rule

# BATS testing
bats tests/                         # run all .bats test files
bats tests/hello.bats               # run one file
bats --tap tests/                   # TAP output format

jq '.' data.json                    # pretty-print JSON
jq '.name' data.json                # extract a field
jq '.[] | select(.age > 30)' data.json  # filter
```

## Minimal BATS test example

```bash
# tests/hello.bats
#!/usr/bin/env bats

@test "script prints hello" {
  run bash hello.sh
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, World!" ]
}
```

```bash
bats tests/hello.bats
```

See `packages.md` for common tools.
