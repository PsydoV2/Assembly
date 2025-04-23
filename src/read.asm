; reading from the console 

section .data
    msgIn db "Enter: "
    msgInLen equ $ - msgIn

    msgOut db 0x0A, "You entered: "
    msgOutLen equ $ - msgOut

    newLine db 0x0A
    newLineLen equ $ - newLine

section .bss
    input resb 10

section .text
    global _start

_start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgIn
    mov edx, msgInLen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 10
    mov esi, eax
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msgOut
    mov edx, msgOutLen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, input
    int 0x80
    mov edx, esi

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, newLineLen
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
