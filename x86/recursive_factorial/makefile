EXE = factorial

run: build
	./$(EXE)
	@echo "Return code: $$?" 

build:
	nasm -f elf64 $(EXE).s -o $(EXE).o
	ld $(EXE).o -o $(EXE)
	
.PHONY: clean
clean:
	rm $(EXE) $(EXE).o