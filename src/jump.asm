section .data
    msgOne db "Nachricht aus _start Methode", 0x0A
    msgOneLen equ $ - msgOne

    msgTwo db "Nachricht aus _other Methode", 0x0A
    msgTwoLen equ $ - msgTwo

section .text
    global _start

_start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgOne
    mov edx, msgOneLen
    int 0x80

    jmp _other

_other:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgTwo
    mov edx, msgTwoLen
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
