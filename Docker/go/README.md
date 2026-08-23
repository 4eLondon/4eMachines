# Go Dev Container

Includes: Go 1.24

## Build

```bash
docker build -t dev-go .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-go

# Persist downloaded modules between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v go-mod-cache:/root/go/pkg/mod \
  dev-go
```

## Common commands inside the container

```bash
go run hello.go               # compile and run a single file
go run .                      # run the current package

go build -o hello .           # compile to binary
go build ./...                # build all packages

go test ./...                 # run all tests
go test -v ./...              # verbose
go test -run TestName ./...   # run specific test

go mod init my/module         # initialise a module
go mod tidy                   # sync go.sum with go.mod
go get github.com/user/pkg    # add a dependency
go get github.com/user/pkg@v1.2.3  # specific version

go fmt ./...                  # format all code
go vet ./...                  # static analysis
```

## Project layout

```
my_project/
├── go.mod
├── go.sum
├── main.go
└── internal/
    └── mypackage/
        └── mypackage.go
```

See `packages.md` for common libraries.
