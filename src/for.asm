; for loop

section .data
    index equ 5
    msg db "One loop round", 0x0A
    msgLen equ $ - msg

section .text
    global _start

_start:
    
    mov esi, index

    jmp _forLoop

_forLoop:

    cmp esi, 0
    je _endLoop

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

    dec esi
    jmp _forLoop

_endLoop:

    mov eax, 1
    xor ebx, ebx
    int 0x80
