#Horrible makefile dont look
.PHONY all: main.o main clean

main.o: $(wildcard *.asm)
	nasm $? -f elf64 -o $@

main: $(wildcard *.o)
	gcc -o $@ main.o

.PHONY clean: $(wildcard *.o)
	rm -f *.o
