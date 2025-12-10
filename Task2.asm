%include "asm_io.inc"

section .data
    hello:      db 'Hello world!', 10' ;Hello world!' plus a linefeed character, which happens to be the decimal number 10
    ; a linefeed character is like an enter which moves onto the next line
    ; although it looks like the best way to get more spaces is to go , 100 you should actually do , 10, 10 as , 100 provides the letter d
    helloLen:   equ $ - hello

    askName:    db 'What is your name? ', 10 ;db means define byte and saves one byte in memory for each character
    askNameLen: equ $ - askName

    askNum:     db 'Enter a number between 50 and 100: ', 10
    askNumLen:  equ $ - askNum

    tooSmall:   db 'Error: number too small.', 10
    tooSmallLen: equ $ - tooSmall

    tooLarge:   db 'Error: number too large.', 10
    tooLargeLen: equ $ - tooLarge

    hey:        db 'Hey there ', 0
    heyLen:     equ $ - hey

    exclaim:    db '!', 10
    exclaimLen: equ $ - exclaim

section .bss
    nameInput:  resb 64  ; a buffer of 64 bytes to store user's name (max 63 chars + newline)
    numInput:   resb 16

section .text
        global asm_main
    asm_main:
        mov eax,0 ;initialize registers
        mov ebx,0
        mov ecx,0
        mov edx,0
        pusha

        ; print "Hello world!"
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

        ; Read user name
        mov eax, 3
        mov ebx, 0
        mov ecx, nameInput
        mov edx, 64
        int 0x80
        mov esi, eax

        ; ask for a number
        mov eax, 4
        mov ebx, 1
        mov ecx, askNum
        mov edx, askNumLen
        int 0x80

        ; read the number input
        mov eax, 3
        mov ebx, 0
        mov ecx, numInput
        mov edx, 16
        int 0x80

        ; convert ASCII to a normal number
        mov ecx, numInput
        xor eax, eax
    convert_loop:
        mov bl, [ecx]
        cmp bl, 10
        je convert_done
        sub bl, '0'
        imul eax, eax, 10
        add eax, ebx
        inc ecx
        jmp convert_loop
    convert_done:
        mov edi, eax ; store number in the registe edi

        cmp edi, 50 ; check that the number is more than 50
        jle number_small
        cmp edi, 100 ; check that the number is less than 100
        jge number_large

        ; Print welcome line edi times
        mov ebx, edi
    print_loop:
        ; Print "Hey there "
        mov eax, 4
        mov ebx, 1
        mov ecx, hey
        mov edx, heyLen
        int 0x80

        ; Print name
        mov eax, 4
        mov ebx, 1
        mov ecx, nameInput
        mov edx, esi
        int 0x80

        ; Print '!'
        mov eax, 4
        mov ebx, 1
        mov ecx, exclaim
        mov edx, exclaimLen
        int 0x80

        dec edi
        jnz print_loop
        jmp end_prog

    number_small:
        mov eax, 4
        mov ebx, 1
        mov ecx, tooSmall
        mov edx, tooSmallLen
        int 0x80
        jmp end_prog

    number_large:
        mov eax, 4
        mov ebx, 1
        mov ecx, tooLarge
        mov edx, tooLargeLen
        int 0x80

    end_prog:
        popa ;this pushes all the registers onto the stack then pops. ask max if the code below counteracts that since it was his idea
        mov eax,0
        mov ebx,0
        mov ecx,0
        mov edx,0
        leave ;initially this was done with an interrupt but I was told to avoid using interrupts where possible as 
        ;it is less efficient for the CPU and slows down the program
        ret ;short for return

