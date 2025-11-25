# -Operating-systems-Worksheet-1
## Notes for use
Initially I told my program to end using the interrupt

int 0x80
mov eax, 1
mov ebx, 0
int 0x80

however on the 24th of november I was instructed by my lecturer Ben not to use interupts


The Alphabet.asm file is not directly related to our course, but I made it to test around with things while I was stuck on something else

When you see the output you may see that it mentions a URL in the code. This is simply a link to an online compiler I have used due to complications with the C driver and such.

## Definitions
**Kernel** - the core, central part of an operating system. It is the piece of software that sits between your programs and the computer’s hardware, making everything work together safely, efficiently, and predictably.
## Notes for me
so it seems like whenever i run a program on Visual Studio Code it leaves a text file (so far I've only used c programs so I can't comment on anything else)

The asm_io.asm is the assembly code but the asm_io.inc is the macro code. I am not sure what macro code is.

the comparison_tests.asm file exists so that I can make branches and see differences in code without threatening asm_io.asm
