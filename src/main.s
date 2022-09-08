  // Linux System Call Table:
  // https://thog.github.io/syscalls-table-aarch64/latest.html  
  
  .cpu cortex-a53

  .text
  .p2align 2


  .global _start
_start:
  // write(hello_str)
  mov x0, #0
  adr x1, hello_str
  mov x2, #14
  mov x8, #0x40
  svc 0

  // exit
  mov x0, #0
  mov x8, #0x5D
  svc 0


  .data
  .p2align 2

hello_str:      .ascii  "Hello, world!\n"
