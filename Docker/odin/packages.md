# Odin — Common Packages

Odin has no centralised package manager. Libraries are typically vendored
(copied into your project) or added as Git submodules.

## Standard Library (built-in, no install needed)

The Odin stdlib is extensive. Key packages:

| Package         | Description                              |
|-----------------|------------------------------------------|
| `core:fmt`      | Formatted I/O (println, printf, etc.)    |
| `core:os`       | OS operations, file I/O                  |
| `core:strings`  | String utilities                         |
| `core:strconv`  | Number/string conversions                |
| `core:math`     | Math functions                           |
| `core:mem`      | Memory allocation, arenas                |
| `core:slice`    | Slice utilities (sort, search, etc.)     |
| `core:encoding/json` | JSON encoding/decoding              |
| `core:net`      | Networking (TCP, UDP, HTTP basics)       |
| `core:sync`     | Mutexes, atomics, channels               |
| `core:thread`   | Threading                                |
| `core:time`     | Date and time                            |
| `core:log`      | Structured logging                       |
| `core:testing`  | Testing framework                        |

## Third-Party Libraries (vendor manually)

| Library         | URL                                          | Description              |
|-----------------|----------------------------------------------|--------------------------|
| `Odin-HTTP`     | github.com/laytan/odin-http                  | HTTP server/client       |
| `json`          | (use core:encoding/json)                     | Built-in                 |
| `cgltf`         | github.com/laytan/odin-cgltf                 | glTF loader              |
| `Raylib binding`| github.com/Caedo/raylib-odin                 | Raylib graphics (you have raylib installed!) |
| `Sokol binding` | github.com/floooh/sokol-odin                 | Cross-platform graphics  |
| `SDL2 binding`  | github.com/Platin21/odin-sdl2                | SDL2 graphics            |

## How to vendor a library

```bash
# Inside your project directory
git submodule add https://github.com/laytan/odin-http vendor/odin-http

# Then in your .odin file:
import http "vendor/odin-http"
```

## How to write a test

```odin
package my_package

import "core:testing"

@(test)
test_addition :: proc(t: ^testing.T) {
    testing.expect_value(t, 1 + 1, 2)
}
```

Run with: `odin test .`
