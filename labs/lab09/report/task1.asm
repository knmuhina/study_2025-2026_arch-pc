%include 'in_out.asm'

SECTION .data
msg db 'Функция: f(x) = 15x - 9', 0h
msgR db 'Результат: ', 0h

SECTION .text
global _start
_start:
 pop ecx
 pop edx
 sub ecx, 1
 mov esi, 0

next:
 cmp ecx, 0
 jz _end
 pop eax
 call atoi
 call _calc
 loop next

_end:
 mov eax, msg
 call sprintLF
 mov eax, msgR
 call sprint
 mov eax, esi
 call iprintLF
 call quit

_calc:
 mov ebx, 15
 mul ebx
 sub eax, 9
 add esi, eax

 ret