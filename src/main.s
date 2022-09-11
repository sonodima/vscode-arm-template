  .cpu cortex-a53

  // Linux System Call Table:
  // https://thog.github.io/syscalls-table-aarch64/latest.html    

  .text
  .p2align 2


  // Entry Point
  .global _start
_start:
  adr x0, hello_str
  bl print_nt

  mov x0, #0            // x0 = 0 (exit code)
  mov x8, #0x5D         // x8 = 93 (sys_exit)
  svc 0


  .data
  .p2align 2

hello_str:      .asciz  "this is a null-terminated ascii string!\n"
