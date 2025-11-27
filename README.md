# -Operating-systems-Worksheet-1
## Task2
Task 2 was actually the first Task that I did. I heavily struggled with an error in my driver and so for much of its development I used an online compiler https://onecompiler.com/assembly so that I could keep coding and testing even while the error persisted. Eventually I reached the limits of what it could do, for example it seemed to be only able to accept one input.

Initially I told my program to end using the interrupt

int 0x80

mov eax, 1

mov ebx, 0

int 0x80

however on the 24th of november I was instructed by my lecturer Ben not to use interupts
## Task1
## Other
The Alphabet.asm file is not directly related to our course, but I made it to test around with things while I was stuck on something else. It began when I was using the linefeed character 10 and thought I could get two lines but actually just had the enter replaced by a lowercase d. I then experimented with 101 which gave me e and continued getting letters and later symbols. I then wrote out a short message with these values. The file has been included in this repository to show my learning of coding in assembly. 

## Definitions
**Kernel** - the core, central part of an operating system. It is the piece of software that sits between your programs and the computer’s hardware, making everything work together safely, efficiently, and predictably.

**Buffer** - a bit of memory in ram. it is larger than Registers (which are on the CPU) but slower. 
## Notes for me
the comparison_tests.asm file exists so that I can make branches and see differences in code without threatening the actual one.
