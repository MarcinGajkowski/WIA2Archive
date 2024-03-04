org 100h

poczatek:
mov ah, 00h
int 16h

mov ah, 02h
mov dl, al
int 21h
cmp al, 51h				;| 'Q'
jne poczatek

koniec:
mov ax, 4C00h
int 21h