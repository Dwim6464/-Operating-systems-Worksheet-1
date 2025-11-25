%include "asm_io.inc"

section .data
    hello:      db 'Hello world!', 10 ; 'Hello world!' plus a linefeed character, which happens to be the decimal number 10
    ; a linefeed character is like an enter which moves onto the next line
    ; although it looks like the best way to get more spaces is to go , 100 you should actually do , 10, 10 as , 100 provides the letter d
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
        global asm_main
    asm_main:
        mov eax,0
        mov ebx,0
        mov ecx,0
        mov edx,0
        pusha

        ; Print "Hello world!"
        mov eax, 4
        mov ebx, 1
        mov ecx, hello
        mov edx, helloLen

        ; Ask for user's name
        mov eax, 4
        mov ebx, 1
        mov ecx, askName
        mov edx, askNameLen

        ; Read user input
        mov eax, 3
        mov ebx, 0
        mov ecx, nameInput
        mov edx, 64
        mov esi, eax             ; save number of bytes read

        ; Print "Hey there "
        mov eax, 4
        mov ebx, 1
        mov ecx, hey
        mov edx, heyLen


        ; Print the name (user input contains the newline from pressing Enter)
        mov eax, 4
        mov ebx, 1
        mov ecx, nameInput
        mov edx, esi

        ; Print "!"
        mov eax, 4
        mov ebx, 1
        mov ecx, exclaim
        mov edx, exclaimLen
        
        popa
        mov eax,0
        mov ebx,0
        mov ecx,0
        mov edx,0
        leave
        ret
    
    ;This is my int 80h; to say this is the end of the code, make sure this is here so you know you got everything
