org 100h

mov ah, 0Ah
mov dx, stung
int 21h

mov ah, 0Eh
mov al, 0Ah
int 10h

mov al, 0Dh
int 10h

mov ah, 02h
mov dh, 12
mov dl, 22
mov bh, 0
int 10h

mov bx, stung+2
mov al, [stung+1]
mov ah, 00h
add bx, ax
mov byte [bx], "$"

mov ah, 09h
mov dx, stung+2
int 21h

mov ax, 4C00h
int 21h

stung db 6h