# C++ — Common Libraries

## Via apt (add to Dockerfile)

### Networking
| apt package              | Library   | Description                    |
|--------------------------|-----------|--------------------------------|
| `libcurl4-openssl-dev`   | libcurl   | HTTP client                    |
| `libboost-asio-dev`      | Boost.Asio| Async networking               |

### JSON / Parsing
| apt package       | Library       | Description                       |
|-------------------|---------------|-----------------------------------|
| `nlohmann-json3-dev` | nlohmann/json | Header-only JSON (most popular) |

### Database
| apt package       | Library   | Description                       |
|-------------------|-----------|-----------------------------------|
| `libsqlite3-dev`  | SQLite    | Embedded SQL                      |
| `libpq-dev`       | libpq     | PostgreSQL client                 |

### Testing
| apt package       | Library   | Description                       |
|-------------------|-----------|-----------------------------------|
| `libgtest-dev`    | GoogleTest| Google's C++ test framework       |
| `catch2`          | Catch2    | Header-only test framework        |

## Via CMake FetchContent (no apt needed)

These are fetched at configure time — no apt install required.

### nlohmann/json (recommended approach)
```cmake
include(FetchContent)
FetchContent_Declare(json
    URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz)
FetchContent_MakeAvailable(json)
target_link_libraries(my_target PRIVATE nlohmann_json::nlohmann_json)
```

### fmt (std::format before C++20)
```cmake
FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG 10.2.1)
FetchContent_MakeAvailable(fmt)
target_link_libraries(my_target PRIVATE fmt::fmt)
```

### Catch2 (testing)
```cmake
FetchContent_Declare(Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v3.6.0)
FetchContent_MakeAvailable(Catch2)
target_link_libraries(tests PRIVATE Catch2::Catch2WithMain)
```

## Popular header-only libraries (just drop in your project)

| Library     | URL                                     | Description               |
|-------------|-----------------------------------------|---------------------------|
| `stb`       | github.com/nothings/stb                 | Image load/write, fonts   |
| `glm`       | github.com/g-truc/glm                   | Math for graphics (GLSL-like) |
| `spdlog`    | github.com/gabime/spdlog                | Fast logging              |
| `CLI11`     | github.com/CLIUtils/CLI11               | CLI argument parsing      |
