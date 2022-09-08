# vscode-arm-template

Simple template for ARM64 assembly development with Visual Studio Code.

The default target is the `cortex-a53`, but it can be changed in the CFLAGS variable in the Makefile.

## Features:

- Visual Studio Code debugging with <b>lldb</b> _(with working breakpoints, stepping, etc.)_
- Separated compilation steps
- Remote development (through SSH)

## Build Commands:

- `make:` builds all the `.s` files in the `src` directory to a binary in the `out` directory.
- `run:` same as `make` but also runs the generated binary.
- `clean:` removes the content of the `out` and `obj` directories.

### Debugging:

Launch the debugger by pressing <kbd>F5</kbd> in Visual Studio Code.
<b>NOTE:</b> By default, the debugger will not stop the execution after the program launches.

Some Visual Studio Code extensions are required for this template.<br>
These are listed in the `extensions.json` file and will be automatically installed when opening the project.

## Requirements:

- llvm
- lldb
- clang
- make
