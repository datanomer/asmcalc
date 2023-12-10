.PHONY all: main.o main.out clean

main.o: $(wildcard *.asm)
	nasm $? -f elf64 -o $@

main.out: $(wildcard *.o)
	gcc -o $@ main.o

.PHONY clean: $(wildcard *.o, *.out)
	rm -f *.o
