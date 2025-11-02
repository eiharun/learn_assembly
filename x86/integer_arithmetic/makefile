
run: build
	./arithmetic
	@echo "Return code: $$?" 

build:
	nasm -f elf64 arithmetic.s -o arithmetic.o
	ld arithmetic.o -o arithmetic
	
.PHONY: clean
clean:
	rm arithmetic arithmetic.o