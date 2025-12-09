# -Operating-systems-Worksheet-1
## How to run
## Production log
### Task2
Task 2 was actually the first Task that I did. I heavily struggled with an error in my driver and so for much of its development I used an online compiler https://onecompiler.com/assembly so that I could keep coding and testing even while the error persisted. Eventually I reached the limits of what it could do, for example it seemed to be only able to accept one input.

Initially I told my program to end using the interrupt
```assembly
int 0x80

mov eax, 1

mov ebx, 0

int 0x80
```
On the 24th of november I was instructed by my lecturer Ben not to use interupts, however on the 27th James told me that the remaining interupts were fine as they helped to keep my code running effectively. Researching it further, I have found that while it's not efficient for the CPU however for the scale that I am working at it doesn't really matter.
### Task3
Initially I had errors each time i tried to run the Makefile <img width="819" height="92" alt="image" src="https://github.com/user-attachments/assets/c2cc0fa3-f1eb-463a-ba38-b7e411ad67aa" />
so instead I just copied the commands into the terminal to run my code. When I brought it up to a friend he reccomended that I remove the Task2.asm from the makefile's header, this worked.<img width="852" height="108" alt="image" src="https://github.com/user-attachments/assets/b35c921a-d2d8-4840-9e4a-74652e32b808" /> I did run into errors with my Alphabet file as it had been coded in a way that worked for the online compiler but  did not with the commands within my Makefile as I had named what later became my asm_main function something different, after changing that it allowed me to run my Alphabet file. I also found that i can add comments to a makefile with a hashtag.


### Task1
### Extras
The Alphabet.asm file is not directly related to our course, but I made it to test around with things while I was stuck on something else. It began when I was using the linefeed character 10 and thought I could get two lines but actually just had the enter replaced by a lowercase d. I then experimented with 101 which gave me e and continued getting letters and later symbols. I then wrote out a short message with these values. The file has been included in this repository to show my learning of coding in assembly. 

## Definitions and explanations
**Kernel** - the core, central part of an operating system. It is the piece of software that sits between your programs and the computer’s hardware, making everything work together safely, efficiently, and predictably.

**Buffer** - a bit of memory in ram. it is larger than Registers (which are on the CPU) but slower. 

**elf** - stands for Executable and Linkable Format and it is in binary. If it is elf or elf32 it is for 32bit architecture but if it says elf64 it is 64 bit.

**dot o files** - object files, they are made by the compiler
## Notes for me
the comparison_tests.asm file exists so that I can make branches and see differences in code without threatening the actual one.
