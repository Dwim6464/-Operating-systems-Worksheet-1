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
    msg db 104, 101, 108, 108, 111
    msgLen equ $ - msg

section .text
    global _start

_start:
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    mov ecx, msg
    mov edx, msgLen
    int 80h
    mov eax, 1
    mov ebx, 0
    int 80h
