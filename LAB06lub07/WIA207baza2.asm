org 100h

mov ax, 10h
cmp ax, 07h
jg wieksze
jl mniejsze

mov ah, 10h				;| tak jak je równe lub typowy else
jmp koniec

wieksze:
mov bx, 0xBEEF
jmp koniec

mniejsze:
mov ax, 2137h
jmp koniec

koniec:
mov ax, 4C00h
int 21h