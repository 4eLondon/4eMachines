# C++ Dev Container

Includes: G++, Clang, GDB, Make, CMake, Valgrind

## Build

```bash
docker build -t dev-cpp .
```

## Run

```bash
docker run --rm -it -v "$PWD":/code dev-cpp
```

## Common commands inside the container

```bash
g++ hello.cpp -o hello                    # compile (C++17 default on GCC 12+)
g++ -std=c++23 hello.cpp -o hello         # explicit standard
g++ -Wall -Wextra -g hello.cpp -o hello   # with warnings + debug info
g++ -O2 -std=c++20 hello.cpp -o hello     # optimised

clang++ hello.cpp -o hello                # compile with Clang

# CMake project
mkdir build && cd build
cmake ..
cmake --build .
./my_program

# Run / debug
./hello
gdb ./hello
valgrind ./hello
```

## Minimal CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.20)
project(MyProject)

set(CMAKE_CXX_STANDARD 20)

add_executable(hello hello.cpp)
```

See `packages.md` for common libraries.
