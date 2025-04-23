; call and return

section .data
    msgOne db "Message from _start Method", 0x0A
    msgOneLen equ $ - msgOne

    msgTwo db "Message from _other Method", 0x0A
    msgTwoLen equ $ - msgTwo

    msgThree db "Message from _start Method again", 0x0A
    msgThreeLen equ $ - msgThree

section .text
    global _start

_start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgOne
    mov edx, msgOneLen
    int 0x80

    call _other

    mov eax, 4
    mov ebx, 1
    mov ecx, msgThree
    mov edx, msgThreeLen
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

_other:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgTwo
    mov edx, msgTwoLen
    int 0x80

    ret
