section .text
	global _start

section .data
	msg db "Hello World!"

_start:
	# write
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, 13
	

	# exit program
	mov eax, 1
	mov ebx, 65
	int 0x80
