section .data
    msgStart db "Guess a number between 1 and 9!"
    msgStartLen equ $ - msgStart

    msgInput db 0x0A, "Enter youre guess:"
    msgInputLen equ $ - msgInput

    msgFound db 0x0A, "GG you found the number!"
    msgFoundLen equ $ - msgFound

    msgNotFound db 0x0A, "Thats the wrong number... Try again!"
    msgNotFoundLen equ $ - msgNotFound

    numberToFind db '3'

section .bss
    inputNumber resb 1

section .text
    global _start

_start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgStart
    mov edx, msgStartLen
    int 0x80

    jmp _input

_input:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msgInput
    mov edx, msgInputLen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, inputNumber
    mov edx, 1
    int 0x80
    mov esi, eax

    jmp _compare

_compare:
    
    mov al, [inputNumber]
    cmp al, [numberToFind]
    je _foundNumber

    jmp _notFound

_foundNumber:

    mov eax, 4
    mov ebx, 1
    mov ecx, msgFound
    mov edx, msgFoundLen
    int 0x80

    jmp _endGame

_notFound:

    mov eax, 4
    mov ebx, 1
    mov ecx, msgNotFound
    mov edx, msgNotFoundLen
    int 0x80

    jmp _input

_endGame:

    mov eax, 1
    mov ebx, 0
    int 0x80
