section .data
    msg db "Test!", 0x0A
    msglen equ $ - msg

    msgin db "In:", 0x0A
    msginlen equ $ - msgin

section .bss
    eingabe resb 10         ; Platz für 10 Zeichen

section .text
    global _start

_start:
    ; "Test!" ausgeben
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen
    int 0x80

    ; "In:" ausgeben
    mov eax, 4
    mov ebx, 1
    mov ecx, msgin
    mov edx, msginlen
    int 0x80

    ; Eingabe lesen
    mov eax, 3
    mov ebx, 0
    mov ecx, eingabe
    mov edx, 10
    int 0x80
    mov esi, eax        ; Anzahl gelesener Bytes merken

    ; Eingabe ausgeben
    mov eax, 4
    mov ebx, 1
    mov ecx, eingabe
    mov edx, esi        ; exakt so viele Zeichen wie gelesen
    int 0x80

    ; Exit
    mov eax, 1
    mov ebx, 0
    int 0x80

