%include 'in_out.asm'

SECTION .data
var: DB 'Вычисление (8x - 6)/2', 0
msg: DB 'Введите x: ', 0
res: DB 'Результат: ', 0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
 _start:

 mov eax, var
 call sprintLF

 mov eax, msg
 call sprint

 mov ecx, x
 mov edx, 80
 call sread

 mov eax, x
 call atoi

 mov ebx, 8
 mul ebx
 sub eax, 6

 xor edx, edx
 mov ebx, 2
 div ebx
 mov ebx, eax

 mov eax, res
 call sprint
 mov eax, ebx
 call iprintLF

 call quit