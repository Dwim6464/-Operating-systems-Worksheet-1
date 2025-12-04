; This is not actually relevant to my course but I thought I'd include it to show what I have been doing and further understanding of assembly

; Alphabet
; This is not everything, I just went through and collected things I thought would be useful
; 046 .
; 047 /
;      048 is 0 and 057 is 9. You can guess what is between that
; 061 =
; 063 ?
;      065 is A and 090 is Z. I'm not doing the ones between
; 094 ^
; 097 a
; 098 b
; 099 c
; 100 d
; 101 e
; 102 f
; 103 g
; 104 h
; 105 i
; 106 j
; 107 k
; 108 l
; 109 m
; 110 n
; 111 o 
; 112 p 
; 113 q
; 114 r
; 115 s
; 116 t
; 117 u
; 118 v
; 119 w
; 120 x
; 121 y
; 122 z

section .data
    msg db 072, 101, 108, 108, 111, 127, 073, 127, 097, 109,  127, 068, 097, 110, 105, 101, 108, 046
    msgLen equ $ - msg

section .text
    global asm_main

asm_main:
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    mov ecx, msg
    mov edx, msgLen
    int 80h
    mov eax, 1
    mov ebx, 0
    int 80h
