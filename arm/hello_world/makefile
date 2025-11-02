OBJ = hello_world
BUILD_DIR = build

run: build
	qemu-arm ./$(BUILD_DIR)/$(OBJ)
#         @echo "Return code: $$?" 

build:
	mkdir -p $(BUILD_DIR)
	arm-linux-gnueabihf-as $(OBJ).s -o ./$(BUILD_DIR)/$(OBJ).o
	arm-linux-gnueabihf-ld ./$(BUILD_DIR)/$(OBJ).o -o ./$(BUILD_DIR)/$(OBJ)

.PHONY: clean
clean:
	rm -r ./$(BUILD_DIR)