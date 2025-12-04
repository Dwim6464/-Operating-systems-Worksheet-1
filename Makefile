Alphabet: driver.c asm_io.asm
	nasm -f elf Alphabet.asm -o Alphabet.o
	nasm -f elf asm_io.asm -o asm_io.o
	gcc -m32 -c driver.c -o driver.o
	gcc -m32 driver.o Alphabet.o asm_io.o -o Alphabet
	./Alphabet

Task2: driver.c asm_io.asm
	nasm -f elf Task2.asm -o Task2.o
	nasm -f elf asm_io.asm -o asm_io.o
	gcc -m32 -c driver.c -o driver.o
	gcc -m32 driver.o Task2.o asm_io.o -o Task2
	./Task2
