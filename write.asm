section .data
    msg db 'Hello World!', 0 ; Legt den Text fest
    len equ $ - msg          ; Berechnet die Länge der Nachricht

section .text
    global _start

_start:
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout (file descriptor 1)
    mov ecx, msg    ; Adresse der Nachricht
    mov edx, len    ; Länge der Nachricht
    int 0x80        ; Systemaufruf (write)

    mov eax, 1      ; sys_exit
    xor ebx, ebx    ; Rückgabewert 0
    int 0x80        ; Systemaufruf (exit)
