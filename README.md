
# 🧠 Assembly Code Repository

Dieses Repository enthält Assembly-Programme für die x86-Architektur, hauptsächlich geschrieben mit NASM.

## 📦 Voraussetzungen

### NASM installieren

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

Lade NASM von der offiziellen Website: [https://www.nasm.us](https://www.nasm.us)  
MASM (Microsoft Macro Assembler) ist in Visual Studio enthalten. Alternativ: [FASM](https://flatassembler.net/)

---

## 🚀 Assembly-Dateien kompilieren & ausführen

### Mit NASM (Linux/macOS/WSL)

#### 32-bit Beispiel

```bash
nasm -f elf32 -o program.o program.asm
ld -m elf_i386 -o program program.o
./program
```

#### 64-bit Beispiel

```bash
nasm -f elf64 -o program.o program.asm
ld -o program program.o
./program
```

> ✅ Tipp: Stelle sicher, dass dein Code zur Zielarchitektur passt (32-bit oder 64-bit).  
> 💡 Für 32-bit-Programme musst du ggf. 32-bit Libraries installieren:  
> `sudo apt install gcc-multilib`

---

## ⚙️ Dynamisches Build-Skript (empfohlen)

Du kannst dir das wiederholte Tippen sparen, indem du dieses Skript verwendest:

### `build.sh`

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Bitte gib den Dateinamen ohne Endung an, z. B.: ./build.sh hello"
    exit 1
fi

FILENAME="$1"

if [ ! -f "$FILENAME.asm" ]; then
    echo "❌ Datei '$FILENAME.asm' nicht gefunden."
    exit 1
fi

# Assemblieren (32-bit)
nasm -f elf32 "$FILENAME.asm" -o "$FILENAME.o" || exit 1

# Linken
ld -m elf_i386 "$FILENAME.o" -o "$FILENAME" || exit 1

# Ausführen
echo "🚀 Starte $FILENAME:"
echo "----------------------"
./"$FILENAME"
```

### Nutzung:

```bash
chmod +x build.sh
./build.sh hello
```

---

## 🪟 MASM (nur Windows)

```cmd
ml /Fo program.obj /c program.asm
link /SUBSYSTEM:CONSOLE program.obj
program.exe
```

---

## 🐉 FASM (plattformunabhängig)

```bash
fasm program.asm program
./program
```

---

## 📄 Lizenz

Dieses Projekt steht unter der MIT-Lizenz – siehe [LICENSE](LICENSE) für Details.
```

---

Wenn du willst, kann ich dir auch gleich die deutsche und englische Version kombinieren – oder auf Englisch umstellen, falls du das Repo z. B. auf GitHub öffentlich machen willst.