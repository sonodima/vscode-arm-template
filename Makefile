CONFIG = build.config
include $(CONFIG)

OUTPUT_NAME := binary
CFLAGS := -Wall -O0

SRC := src
OUT := out
OBJ := obj

SOURCES := $(wildcard $(SRC)/*.s)
OBJECTS := $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(SOURCES))

# ------------------------------------------------------------------------------

# Check if the CPU variable is set and not empty [see build.config]
ifeq ($(strip $(CPU)),)
$(error Missing CPU value in build.config)
endif

# Check if the TARGET variable is set and not empty [see build.config]
ifeq ($(strip $(TARGET)),)
$(error Missing TARGET value in build.config)
endif

# ------------------------------------------------------------------------------

all: verify clean build

# Compiles each source file into an object file.
$(OBJ)/%.o: $(SRC)/%.s
	@mkdir -p $(@D)
	@echo "🔩 Compiling: $<"
	@clang $(CFLAGS) -g --target=$(TARGET) -mcpu=$(CPU) -c $< -o $@

# Links all the compiled object files into a binary.
.SILENT: build
build: $(OBJECTS)
	mkdir -p $(OUT)
	ld.lld -nostdlib $^ -o $(OUT)/$(OUTPUT_NAME)
	echo "✅ \033[1;32mCompilation succeeded\033[1;39m"

# Check if the required binaries are installed and prints the configuration.
# If the required binaries are not installed, the script will exit with an error.
.SILENT: verify
verify:
	which clang		>/dev/null 2>&1 || (echo "🚫 clang is not installed"; exit 1)
	which ld.lld	>/dev/null 2>&1 || (echo "🚫 ld.lld is not installed"; exit 1)
	echo "🔧 Target: $(TARGET)"
	echo "🔧 CPU: $(CPU)"

# Removes the output binary and all the object files.
.PHONY: clean
.SILENT: clean
clean:
	echo "🧴 Removing object and output files"
	rm -rf $(OUT)/$(OUTPUT_NAME) $(OBJ)/*
	echo "🧴 Clean completed"

# Runs all the build steps and executes the compiled binary.
.SILENT: run
run: all
	echo "🍀 Launching $(OUTPUT_NAME)\n"
	$(OUT)/$(OUTPUT_NAME)
	echo "\n👌 Execution completed"
