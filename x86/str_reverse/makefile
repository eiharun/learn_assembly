
run: build
	./reverse
	@echo "Return code: $$?" 

build:
	nasm -f elf64 reverse.s -o reverse.o
	ld reverse.o -o reverse
	
.PHONY: clean
clean:
	rm reverse reverse.o