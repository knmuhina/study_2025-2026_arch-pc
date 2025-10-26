; lab4.asm
SECTION .data ; Начало секции данных
    lab4: DB 'Мухина Ксения',10
    
    lab4Len: EQU $-lab4
SECTION .text ; Начало секции кода
    GLOBAL _start
_start: ; Точка входа в программу
    mov eax,4
    mov ebx,1
    mov ecx,lab4
    mov edx,lab4Len
    int 80h
    mov eax,1
    mov ebx,0
    int 80h
