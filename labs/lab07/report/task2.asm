%include 'in_out.asm'

SECTION .data
var DB 'Вычисление функции.', 0h
msg1 DB 'Введите x: ', 0h
msg2 DB 'Введите a: ', 0h
msgR DB 'Результат: ', 0h
C dd 5

SECTION .bss
X resb 10
A resb 10
res resb 40

SECTION .text
GLOBAL _start
 _start:
 mov eax, var
 call sprintLF

 mov eax, msg1
 call sprint

 mov ecx, X
 mov edx, 10
 call sread

 mov eax, X
 call atoi
 mov [X], eax

 mov eax, msg2
 call sprint

 mov ecx, A
 mov edx, 10
 call sread

 mov eax, A
 call atoi
 mov [A], eax

 mov ecx, [C]
 cmp ecx, [X]
 jg func

 mov eax, [X]
 sub eax, [C]
 mov [res], eax
 jmp _res

 func:
  mov ebx, [X]
  mov eax, [A]
  mul ebx
  mov [res], eax

 _res:
  mov eax, msgR
  call sprint
  mov eax, [res]
  call iprintLF
  call quit