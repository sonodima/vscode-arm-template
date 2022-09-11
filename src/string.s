  .text
  .p2align 2


  // Gets the length of a null-terminated string.
  // Parameters:
  //   x0: pointer to the string
  // Returns:
  //   x0: length of the string
  .global strlen
strlen:
  mov x1, #0          // x1 = 0 (counter)
  ldrb w2, [x0]       // w2 = *x0
  cmp w2, #0x0        // if (*x0 == 0x0)
  beq strlen_end      //   goto strlen_end
strlen_loop:
  add x1, x1, #1      // x1++
  ldrb w2, [x0, #1]!  // w2 = *++x0
  cmp w2, #0x0        // if (*x0 == 0x0)
  bne strlen_loop     //   goto strlen_loop
strlen_end:
  mov x0, x1          // return x1
  ret


  // Prints a string to the standard output.
  // Parameters:
  //   x0: pointer to the string to print
  //   x1: length of the string
  .global print
print:
  mov x2, x1        // x2 <= x1 = len
  mov x1, x0        // x1 <= x0 = &str
  mov x0, #0        // fd = 0 (stdout)
  mov x8, #0x40     // x8 = sys_write
  svc 0
  ret


  // Prints a null-terminated string to the standard output.
  // Parameters:
  //   x0: pointer to the string to print
  .global print_nt
print_nt:
  mov x4, lr        // x4 <= link_register
  mov x5, x0        // x5 <= x0 = &str
  bl strlen         // x0 = strlen(x0)
  mov x1, x0        // x1 <= x0 = len
  mov x0, x5        // x0 <= x5 = &str
  bl print          // print(x0, x1)
  mov lr, x4        // link_register <= x4
  ret
