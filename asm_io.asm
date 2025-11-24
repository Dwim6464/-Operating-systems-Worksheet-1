; This is a comment in assembly, hello
; use the online compiler https://onecompiler.com/assembly/3uccjrhsa

section .data
    hello:      db 'Hello world!', 10 ; 'Hello world!' plus a linefeed character, which happens to be the decimal number 10
    ;a linefeed character is like an enter which moves onto the next line
    helloLen:   equ $ - hello

    askName:    db 'What is your name? ', 10
    askNameLen: equ $ - askName

    hey:        db 'Hey there ', 0
    heyLen:     equ $ - hey

    exclaim:    db '!', 10
    exclaimLen: equ $ - exclaim

section .bss
    nameInput:  resb 64        ; buffer to store user's name (max 63 chars + newline)

section .text
    global _start

_start:
    ; Print "Hello world!"
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, helloLen
    int 0x80

    ; Ask for user's name
    mov eax, 4
    mov ebx, 1
    mov ecx, askName
    mov edx, askNameLen
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, nameInput
    mov edx, 64
    int 0x80
    mov esi, eax             ; save number of bytes read

    ; Print "Hey there "
    mov eax, 4
    mov ebx, 1
    mov ecx, hey
    mov edx, heyLen
    int 0x80

    ; Print the name (user input contains the newline from pressing Enter)
    mov eax, 4
    mov ebx, 1
    mov ecx, nameInput
    mov edx, esi
    int 0x80

    ; Print "!"
    mov eax, 4
    mov ebx, 1
    mov ecx, exclaim
    mov edx, exclaimLen
    
    ; Exit
    int 0x80 ; Call the kernel
    mov eax, 1 ; The system call for exit (sys_exit)
    mov ebx, 0 ; Exit with return code of 0 (no error)
    int 0x80 ; This is an interrupt that tells the kernel to perform the system call it just described
    
    ;This is my int 80h; to say this is the end of the code, make sure this is here so you know you got everything
