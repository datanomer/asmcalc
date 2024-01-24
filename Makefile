#.PHONY all: main.o main.out clean

#main.o: $(wildcard *.asm)
#	nasm $? -f elf64 -o $@

#main.out: $(wildcard *.o)
#	gcc -o $@ main.o

#.PHONY clean: $(wildcard *.o, *.out)
#	rm -f *.o
#just in case ^

.PHONY all: main.o funcs.o main.out funcs clean

main.o:main.asm
	nasm $? -f elf64 -o $@

funcs.o:funcs.asm
	nasm $? -f elf64 -o $@

main.out :main.o funcs.o
	gcc $? -no-pie -o $@

.PHONY clean:
	rm -f *.o
