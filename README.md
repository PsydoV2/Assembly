
# Assembly Code Repository

This repository contains Assembly language programs written in x86. Below are the instructions for assembling, linking, and running these `.asm` files on different platforms.

## Prerequisites

### Assembler Installation

Ensure that you have a working assembler installed on your system. Here are instructions for some common assemblers:

- **NASM (Netwide Assembler)**  
  NASM is a popular assembler for x86 architecture. You can install it using the following commands:
  
  - On Linux (Debian/Ubuntu):
    ```bash
    sudo apt-get update
    sudo apt-get install nasm
    ```
  - On macOS (via Homebrew):
    ```bash
    brew install nasm
    ```
  - On Windows, download it from the [NASM website](https://www.nasm.us/) and follow the installation instructions.

- **MASM (Microsoft Macro Assembler)** (Windows only)  
  MASM is used on Windows systems. It is included in Visual Studio or can be run from the Developer Command Prompt.

- **FASM (Flat Assembler)**  
  Another assembler available for multiple platforms. Download it from [FASM](https://flatassembler.net/).

## How to Assemble and Run `.asm` Files

### Using NASM (Linux/macOS/Windows)

1. **Assemble the `.asm` file:**

   Use `nasm` to convert the assembly file into an object file:
   ```bash
   nasm -f elf32 -o program.o program.asm
   ```
   On a 64-bit system:
   ```bash
   nasm -f elf64 -o program.o program.asm
   ```

2. **Link the object file:**

   Link the object file to create an executable:
   ```bash
   ld -m elf_i386 -o program program.o
   ```
   For 64-bit systems:
   ```bash
   ld -o program program.o
   ```

3. **Run the executable:**

   Once linked, run the program:
   ```bash
   ./program
   ```

### Using MASM (Windows)

1. **Assemble and link the `.asm` file:**

   Open the Developer Command Prompt (or Visual Studio Command Prompt) and run:
   ```bash
   ml /Fo program.obj /c program.asm
   link /SUBSYSTEM:CONSOLE program.obj
   ```

2. **Run the executable:**

   After linking, run the executable:
   ```bash
   program.exe
   ```

### Using FASM (Linux/macOS/Windows)

1. **Assemble and link the `.asm` file in one step:**
   ```bash
   fasm program.asm program
   ```

2. **Run the executable:**
   ```bash
   ./program
   ```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
