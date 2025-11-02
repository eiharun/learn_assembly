OBJ = hello_world
BUILD_DIR = build

run: build
	./$(BUILD_DIR)/$(OBJ)
	@echo "Return code: $$?" 

build:
	mkdir -p $(BUILD_DIR)
	nasm -f elf64 $(OBJ).s -o ./$(BUILD_DIR)/$(OBJ).o
	ld ./$(BUILD_DIR)/$(OBJ).o -o ./$(BUILD_DIR)/$(OBJ)
	
.PHONY: clean
clean:
	rm -r ./$(BUILD_DIR)