%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0h
msg db 'Как Вас зовут? ', 0h
msg1 db 'Меня зовут ', 0h

SECTION .bss
name resb 255

SECTION .text
GLOBAL _start
_start:
 mov eax, msg
 call sprint

 mov ecx, name
 mov edx, 255
 call sread

 mov ecx, 0777o
 mov ebx, filename
 mov eax, 8
 int 80h

 mov esi, eax

 mov eax, msg1
 call slen

 mov edx, eax
 mov ecx, msg1
 mov ebx, esi
 mov eax, 4
 int 80h

 mov eax, name
 call slen

 mov edx, eax
 mov ecx, name
 mov ebx, esi
 mov eax, 4
 int 80h

 mov ebx, esi
 mov eax, 6
 int 80h

 call quit
