; if else

section .data
    msgIn db "Enter a number 1-3: "
    msgInLen equ $ - msgIn

    isOne db 0x0A, "The number is one", 0x0A
    isOneLen equ $ - isOne

    isTwo db 0x0A, "The number is two", 0x0A
    isTwoLen equ $ - isTwo

    isThree db 0x0A, "The number is three", 0x0A
    isThreeLen equ $ - isThree

    elseMsg db 0x0A, "The number is not between 1 and 3 :(", 0x0A
    elseMsgLen equ $ - elseMsg

    endMsg db "End reached", 0x0A
    endMsgLen equ $ - endMsg

section .bss
    inputNumber resb 1

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
    mov ecx, inputNumber
    mov edx, 1
    int 0x80

    mov al, [inputNumber]

    cmp al, '1'
    je _isOne

    cmp al, '2'
    je _isTwo

    cmp al, '3'
    je _isThree

    jmp _else

_isOne:

    mov eax, 4
    mov ebx, 1
    mov ecx, isOne
    mov edx, isOneLen
    int 0x80

    jmp _endif

_isTwo:

    mov eax, 4
    mov ebx, 1
    mov ecx, isTwo
    mov edx, isTwoLen
    int 0x80

    jmp _endif

_isThree:

    mov eax, 4
    mov ebx, 1
    mov ecx, isThree
    mov edx, isThreeLen
    int 0x80

    jmp _endif

_else:

    mov eax, 4
    mov ebx, 1
    mov ecx, elseMsg
    mov edx, elseMsgLen
    int 0x80

    jmp _endif

_endif:

    mov eax, 4
    mov ebx, 1
    mov ecx, endMsg
    mov edx, endMsgLen
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
