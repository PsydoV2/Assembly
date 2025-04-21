## 📄 Assembly Cheat Sheet (x86 NASM, Linux)

---

### 📌 **Sektionen**

```asm
section .data      ; Statische Daten (Strings, Zahlen, etc.)
section .bss       ; Reservierter Speicher (z. B. für Variablen)
section .text      ; Programmcode
```

---

### 🚀 **Programmstart (Linux, syscall über `int 0x80`)**

```asm
global _start

_start:
    ; ... hier kommt dein Code ...
```

---

### 🧠 **Wichtige Register**

| Register | Bedeutung             |
|----------|------------------------|
| `eax`    | Rückgabewert, Syscall-Nr |
| `ebx`    | 1. Parameter            |
| `ecx`    | 2. Parameter            |
| `edx`    | 3. Parameter            |
| `esi`, `edi`, `esp`, `ebp` | Weitere/indirekte Zugriffe, Stack |

---

### 📞 **Systemcalls (Linux 32-bit, `int 0x80`)**

```asm
mov eax, syscall_num
mov ebx, arg1
mov ecx, arg2
mov edx, arg3
int 0x80
```

| Zweck       | `eax` | `ebx` | `ecx` | `edx` |
|-------------|-------|-------|-------|-------|
| `write`     | 4     | fd    | buf   | len   |
| `read`      | 3     | fd    | buf   | len   |
| `exit`      | 1     | code  | –     | –     |

---

### ✍️ **Daten definieren**

```asm
msg db "Hallo Welt", 0xA     ; String mit Zeilenumbruch
len equ $ - msg              ; Länge des Strings

var1 db 10                   ; 8-bit Wert
var2 dw 1000                ; 16-bit
var3 dd 100000              ; 32-bit
```

---

### 🛠️ **Grundbefehle**

```asm
mov eax, 1        ; Wert in Register
add eax, 2        ; Addiere 2
sub eax, 1        ; Subtrahiere 1
inc eax           ; Inkrementiere
dec eax           ; Dekrementiere
xor eax, eax      ; Setzt Register auf 0
```

---

### 🔁 **Sprünge & Bedingungen**

```asm
cmp eax, ebx      ; Vergleiche
je gleich         ; Jump if Equal
jne ungleich      ; Jump if Not Equal
jg größer         ; Jump if Greater
jl kleiner        ; Jump if Less
jmp ziel          ; Unbedingter Sprung
```

```asm
loop:             ; Label
    ...           ; Code
    jmp loop      ; Endlosschleife
```

---

### 🧮 **Stack**

```asm
push eax          ; Auf Stack legen
pop ebx           ; Vom Stack holen
```

---

### 📦 **Speicher (direkt/indirekt)**

```asm
mov eax, [var1]         ; Wert aus Speicher lesen
mov [var1], eax         ; Wert in Speicher schreiben

mov eax, [ebx]          ; Indirekt über Zeiger
```

---

### 📚 **Strings und Eingabe**

```asm
; Lesen von STDIN
mov eax, 3         ; sys_read
mov ebx, 0         ; stdin
mov ecx, buffer
mov edx, 100       ; max. 100 Bytes
int 0x80
```

---

### 🧪 **Nützliche Tools**

| Tool             | Funktion                           |
|------------------|------------------------------------|
| `nasm -f elf32`  | Assemblieren                       |
| `ld -m elf_i386` | Linken                             |
| `gdb`            | Debuggen                           |
| `objdump -d`     | Disassemblieren                    |
| `nasm -l`        | Listing-Datei erzeugen             |

---

### ✅ **Beispiel: Hello World**

```asm
section .data
    msg db "Hello, world!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
```
