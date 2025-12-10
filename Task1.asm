%include "asm_io.inc"

section .data
    num1 dd 40        ; dd allocates 4 bytes per character
    num2 dd 24

section .text
    global asm_main
    extern print_int

asm_main:
    ; Load num1 into eax
    mov eax, [num1]

    ; Add num2 to eax
    add eax, [num2]

    ; Print result using print_int
    push eax
    call print_int
    add esp, 4 ;this bit cleans the stack

    ret
