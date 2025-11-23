%include 'in_out.asm'

SECTION .data
msg DB 'Наименьшее число: ', 0h
A dd '99'
B dd '29'
C dd '26'

SECTION .bss
min resb 10

SECTION .text
GLOBAL _start
 _start:
  mov ecx, [A]
  mov [min], ecx

  mov eax, min
  call atoi
  mov [min], eax

  mov eax, B
  call atoi
  mov [B], eax

  cmp [B], ecx
  jg check_C
  mov ecx, [B]
  mov [min], ecx

  check_C:
   mov eax, C
   call atoi
   mov [C], eax

   mov ecx, [min]
   cmp [C], ecx
   jg fin
   mov ecx, [C]
   mov [min], ecx

  fin:
   mov eax, msg
   call sprint
   mov eax, [min]
   call iprintLF
   call quit