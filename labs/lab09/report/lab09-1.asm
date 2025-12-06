%include 'in_out.asm'

SECTION .data
msg: db 'Введите x: ', 0
result: db '2x + 7 = ', 0

SECTION .bss
x: resb 80
res: resb 80

SECTION .text
GLOBAL _start
_start:
; ------------------------------
; Основная программа
; ------------------------------

 mov eax, msg
 call sprint

 mov ecx, x
 mov edx, 80
 call sread

 mov eax, x
 call atoi

 call _calcul ; Вызов подпрограммы _calcul

 mov eax, result
 call sprint
 mov eax, [res]
 call iprintLF

 call quit

; ------------------------------
; Подпрограмма вычисления
; выражения "2x + 7", x = g(x)
; ------------------------------

_calcul:
 call _subcalcul
 mov ebx, 2
 mul ebx
 add eax, 7
 mov [res], eax

 ret ; выход из подпрограммы

; ------------------------------
; Подпрограмма вычисления
; выражения "3x - 1"
; ------------------------------

_subcalcul:
 mov ebx, 3
 mul ebx
 sub eax, 1

 ret
