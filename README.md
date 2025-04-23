# 🧠 x86 Assembly Learning Repository

This repository contains small, focused x86 assembly programs written in **NASM**, created as part of my learning journey.

Each `.asm` file demonstrates a specific concept or instruction, such as `jump.asm` for basic jumps or `call.asm` for function-like calls. The goal is to build up a solid understanding of low-level programming through simple, hands-on examples.

> 💡 This is a beginner-friendly repo — feel free to clone it, run the examples, and modify them as you learn!


## 📦 Requirements

### Install NASM

#### Linux (Debian/Ubuntu)

```bash
sudo apt update
sudo apt install nasm build-essential
```

#### macOS (via Homebrew)

```bash
brew install nasm
```

#### Windows

Download NASM from the official website: [https://www.nasm.us](https://www.nasm.us)  
You can also explore alternatives like [FASM](https://flatassembler.net) or MASM (included in Visual Studio).


## 🚀 Compile & Run (Manual)

### 32-bit example

```bash
nasm -f elf32 -o program.o program.asm
ld -m elf_i386 -o program program.o
./program
```

### 64-bit example

```bash
nasm -f elf64 -o program.o program.asm
ld -o program program.o
./program
```

> ✅ Make sure your code matches the target architecture (32-bit or 64-bit).  
> 💡 On Linux, you might need to install 32-bit libraries:  
> `sudo apt install gcc-multilib`


## ⚙️ Build with Makefile (Recommended)

This repo includes a flexible `Makefile` to save time and reduce repetition.

### Example usage:

```bash
make run FILENAME=jump
```

This builds and runs `src/jump.asm`.

### Project structure:

```
.
├── Makefile
├── src/
│   ├── jump.asm
│   ├── call.asm
│   └── ...
└── out/
```

### Clean the build output:

```bash
make clean
```


## 📚 Learning Topics

Some of the topics covered in this repository:

- `write.asm` – basic output using Linux syscalls
- `read.asm` – reading input from the terminal
- `jump.asm` – unconditional and conditional jumps
- `call.asm` – function calls and return flow
- More to come as I keep learning!

---

## 📄 License

This project is open source under the [MIT License](LICENSE).