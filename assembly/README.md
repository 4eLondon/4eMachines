# Assembly Dev Container

Includes: NASM, YASM, GCC (linker), GDB (debugger), GNU Binutils

| Tool       | Purpose                                           |
|------------|---------------------------------------------------|
| `nasm`     | Netwide Assembler — Intel syntax, x86/x64         |
| `yasm`     | Alternative assembler, supports more syntax modes |
| `gcc`      | Used as a linker to produce the final executable  |
| `gdb`      | Debugger — step through instructions, inspect registers |
| `objdump`  | Disassemble binaries, inspect sections            |
| `readelf`  | Inspect ELF binary headers                        |
| `ld`       | GNU linker (lower-level than gcc for linking)     |

## Build

```bash
docker build -t dev-assembly .
```

## Run

```bash
docker run --rm -it -v "$PWD":/code dev-assembly
```

## Compile and run (x86-64 Linux, Intel syntax)

```bash
# Assemble → object file
nasm -f elf64 hello.asm -o hello.o

# Link → executable
gcc hello.o -o hello -nostartfiles   # if you defined _start manually
gcc hello.o -o hello                 # if you used a C main entry point

# Run
./hello
```

## Minimal hello world (Linux syscall, no libc)

```nasm
; hello.asm
section .data
    msg db "Hello, World!", 10
    len equ $ - msg

section .text
    global _start

_start:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60         ; sys_exit
    xor rdi, rdi
    syscall
```

```bash
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
./hello
```

## Debugging with GDB

```bash
nasm -f elf64 -g -F dwarf hello.asm -o hello.o   # include debug info
gcc -g hello.o -o hello
gdb ./hello

# Inside gdb:
(gdb) break _start
(gdb) run
(gdb) info registers      # show all registers
(gdb) x/10i $rip          # show next 10 instructions
(gdb) stepi               # step one instruction
```

## Inspect a binary

```bash
objdump -d hello          # disassemble
readelf -h hello          # ELF header
readelf -S hello          # section table
nm hello                  # symbol table
```
