
run: build
	./hello_world
	@echo "Return code: $$?" 

build:
	nasm -f elf64 hello_world.s -o hello_world.o
	ld hello_world.o -o hello_world
	
.PHONY: clean
clean:
	rm hello_world hello_world.o