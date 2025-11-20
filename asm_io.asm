; This is a comment in assembly, hello
; use the online compiler https://onecompiler.com/assembly/3uccjrhsa

section .data
	hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character, which happens to be the decimal number 10
    ;a linefeed character is like an enter which moves onto the next line
	helloLen:  equ $-hello             ; Length of the 'Hello world!' string

section .text
	global _start

_start:
	mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,hello        ; Put the offset of hello in ecx
	mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value

	int 80h              ; Call the kernel
	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return code of 0 (no error)
	int 80h;             ; This is an interrupt that tells the kernel to perform the system call it just described

;This is my int 80h; to say this is the end of the code, make sure this is here so you know you got everything
