# Zig — Common Packages

Zig uses `build.zig.zon` for dependencies (added in 0.12+). Packages are
fetched by URL + hash — no central registry, similar to Go modules.

## How to add a dependency

```bash
# 1. Add to build.zig.zon
zig fetch --save https://github.com/user/repo/archive/<commit>.tar.gz

# 2. Wire it up in build.zig
const dep = b.dependency("dep_name", .{ .target = target, .optimize = optimize });
exe.root_module.addImport("dep_name", dep.module("dep_name"));
```

## Common Libraries

### Networking / Web
| Library       | URL                                          | Description             |
|---------------|----------------------------------------------|-------------------------|
| `zap`         | github.com/zigzap/zap                        | Fast HTTP server        |
| `httpz`       | github.com/karlseguin/http.zig               | HTTP server             |
| `zig-network` | github.com/MasterQ32/zig-network             | Cross-platform sockets  |

### Data / Parsing
| Library        | URL                                         | Description             |
|----------------|---------------------------------------------|-------------------------|
| `json`         | (stdlib: `std.json`)                        | Built-in JSON           |
| `zig-toml`     | github.com/sam701/zig-toml                  | TOML parser             |
| `yazap`        | github.com/prajwalch/yazap                  | CLI arg parser          |

### Data Structures
| Library        | URL                                         | Description             |
|----------------|---------------------------------------------|-------------------------|
| (stdlib)       | `std.ArrayList`, `std.HashMap`, etc.        | Built-in containers     |

### Graphics / Games
| Library       | URL                                          | Description             |
|---------------|----------------------------------------------|-------------------------|
| `mach`        | github.com/hexops/mach                       | Game engine             |
| `raylib-zig`  | github.com/Not-Nik/raylib-zig                | Raylib bindings         |
| `zgl`         | github.com/ziglibs/zgl                       | OpenGL bindings         |

### Testing (built-in)
```zig
test "addition" {
    try std.testing.expectEqual(2, 1 + 1);
}
```
Run with: `zig build test` or `zig test src/main.zig`

## Useful stdlib imports

```zig
const std = @import("std");

// Commonly used
std.debug.print()        // print to stderr
std.io.getStdOut()       // stdout writer
std.mem.Allocator        // allocator interface
std.ArrayList            // dynamic array
std.StringHashMap        // hash map
std.json.parseFromSlice  // JSON parsing
std.fs                   // filesystem
std.process              // process/env
```
