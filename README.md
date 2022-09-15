<h1 align="center">VSCode ARM Template 🤖</h1>

<div align="center">
  <img src="https://badgen.net/badge/arch/ARMv8/pink"/>
  <img src="https://badgen.net/badge/platform/Linux/orange"/>
  <br>
  <br>
</div>
 
> Simple template for ARM assembly development with Visual Studio Code.

The default target is the `cortex-a53;aarch64-elf`, but it can be changed in the `build.config` file.

## Features:

- Visual Studio Code debugging with <b>lldb</b> _(with working breakpoints, stepping, etc.)_
- Separated compilation steps
- Remote development _(through SSH)_

## Build Commands:

- `build` builds all the `.s` files in the `src` directory to a binary in the `out` directory.
- `run` same as `make` but also runs the generated binary.
- `verify` checks if <b>clang</b> and <b>ld.lld</b> are installed and prints the build configuration.
- `clean` removes the content of the `out` and `obj` directories.
- `all` executes all the above commands except `run`.

### Debugging:

Launch the debugger by pressing <kbd>F5</kbd> in Visual Studio Code.
<b>NOTE:</b> By default, the debugger will not stop the execution after the program launches.

Some Visual Studio Code extensions are required for this template.<br>
These are listed in the `extensions.json` file and will be automatically installed when opening the project.

## Requirements:

The llvm compiler infrastructure is required for this project.<br>
You can easily install it with the following command:

```bash
# Ubuntu / APT
apt install -y llvm clang lld lldb make

# Fedora / DNF
dnf -y install llvm clang lld lldb make
```
