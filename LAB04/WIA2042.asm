org 100h

mov byte [strong+3], "$"		;|mov bx (lub bp), strong
								;|mov byte [bx+3], "$"
mov ah, 09h
mov dx, strong
int 21h

mov ax, 4C00h
int 21h

strong db "epicki rap batel"