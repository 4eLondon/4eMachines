# C Dev Container

Includes: GCC, Clang, GDB, Make, Valgrind

## Build

```bash
docker build -t dev-c .
```

## Run

```bash
docker run --rm -it -v "$PWD":/code dev-c
```

## Common commands inside the container

```bash
gcc hello.c -o hello              # compile
gcc -Wall -Wextra hello.c -o hello  # compile with warnings
gcc -g hello.c -o hello           # compile with debug info
gcc -O2 hello.c -o hello          # optimised build
./hello                           # run

clang hello.c -o hello            # compile with Clang instead

make                              # run Makefile
make clean                        # clean build artifacts

gdb ./hello                       # debug
valgrind ./hello                  # check for memory leaks
valgrind --leak-check=full ./hello
```

## Minimal Makefile template

```makefile
CC = gcc
CFLAGS = -Wall -Wextra -g

TARGET = hello
SRC = hello.c

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(TARGET)
```

See `packages.md` for common libraries.
