org 100h

mov ah, 02h
mov dh, 12
mov dl, 32
mov bh, 0
int 10h

mov dx, tekst
mov ah, 9
int 21h

mov ah, 02h
mov dh, 0
mov dl, 0
mov bh, 0
int 10h

mov ax, 4C00h
int 21h

tekst db "Marcin Gajkowski",0Ah,0Dh,"$"