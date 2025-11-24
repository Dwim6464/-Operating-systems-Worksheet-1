; Modified assembly code to ask for name and count, validate (50 < n < 100), then print welcome message n times.

section .data
    askName:        db 'What is your name? ', 10
    askNameLen:     equ $ - askName

    askCount:       db 'How many times should I print the welcome message (51-99)? ', 10
    askCountLen:    equ $ - askCount

    tooSmall:       db 'Error: number too small.',10
    tooSmallLen:    equ $ - tooSmall

    tooLarge:       db 'Error: number too large.',10
    tooLargeLen:    equ $ - tooLarge

    welcomeMsg:     db 'Welcome ',0
    welcomeMsgLen:  equ $ - welcomeMsg

    newline:        db 10
    newlineLen:     equ $ - newline

section .bss
    nameInput:  resb 64
    numInput:   resb 8

section .text
global _start

_start:
    ; Ask for name
    mov eax,4
    mov ebx,1
    mov ecx,askName
    mov edx,askNameLen
    int 0x80

    ; Read name
    mov eax,3
    mov ebx,0
    mov ecx,nameInput
    mov edx,64
    int 0x80
    mov edi,eax        ; length of name

    ; Ask for number
    mov eax,4
    mov ebx,1
    mov ecx,askCount
    mov edx,askCountLen
    int 0x80

    ; Read number input
    mov eax,3
    mov ebx,0
    mov ecx,numInput
    mov edx,8
    int 0x80

    ; Convert ASCII to integer
    mov esi,numInput
    xor eax,eax
    xor ebx,ebx
    mov bl,[esi]
    sub bl,'0'
    mov eax,ebx

    mov bl,[esi+1]
    cmp bl,10
    je .skipSecond
    sub bl,'0'
    imul eax,10
    add eax,ebx
.skipSecond:

    ; Validate number > 50
    cmp eax,50
    jle .tooSmall

    ; Validate number < 100
    cmp eax,100
    jge .tooLarge

    mov ecx,eax        ; loop counter
.printLoop:
    mov eax,4
    mov ebx,1
    mov edx,welcomeMsgLen
    mov ecx,welcomeMsg
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,nameInput
    mov edx,edi
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,newline
    mov edx,newlineLen
    int 0x80

    loop .printLoop
    jmp .exit

.tooSmall:
    mov eax,4
    mov ebx,1
    mov ecx,tooSmall
    mov edx,tooSmallLen
    int 0x80
    jmp .exit

.tooLarge:
    mov eax,4
    mov ebx,1
    mov ecx,tooLarge
    mov edx,tooLargeLen
    int 0x80

.exit:
    mov eax,1
    mov ebx,0
    int 0x80
