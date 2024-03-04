org 100h

mov ah, 00h
int 16h

cmp al, 5Fh
mov ah, 02h

je equal
jg greater

mov dl, '<'
jmp koniec

equal:
mov dl, '='
int 21h
jmp koniec

greater:
mov dl, '>'

koniec:
int 21h
mov ax, 4C00h
int 21h
