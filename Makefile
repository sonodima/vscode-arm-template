OUTPUT_NAME := binary
SRC := src
OUT := out
OBJ := obj

CFLAGS := -Wall -O0 -mcpu=cortex-a53+nosimd

SOURCES := $(wildcard $(SRC)/*.s)
OBJECTS := $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(SOURCES))

all: clean build

$(OBJ)/%.o: $(SRC)/%.s
	@mkdir -p $(@D)
	@echo "👉 Compiling: $<"
	@clang --target=aarch64-elf $(CFLAGS) -g -c $< -o $@

.SILENT: build
build: $(OBJECTS)
	mkdir -p $(OUT)
	ld.lld -m aarch64elf -nostdlib $^ -o $(OUT)/$(OUTPUT_NAME)
	echo "✅ \033[1;32mCompilation succeeded\033[1;39m"

.PHONY: clean
.SILENT: clean
clean:
	echo "🧽 Removing object and output files"
	rm -f $(OUT)/* $(OBJ)/*
	echo "🧽 Clean completed"

.SILENT: run
run: all
	echo "🍀 Launching $(OUTPUT_NAME)\n"
	$(OUT)/$(OUTPUT_NAME)
	echo "\n👌 Execution completed"
