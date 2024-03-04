org 100h

mov ah, 0Ah
mov dx, string
int 21h

mov ah, 0Eh
mov al, 0Ah
int 10h

mov al, 0Dh
int 10h

mov ah, 0Eh			;|mov ah, 02h
mov al, [string+4]	;|mov dl, 0Ah - CR		mov dl, 0Dh - LF
int 10h				;|int 21h				int 21h
					;|mov dl, [strong+4]
					;|int 21h
mov ax, 4C00h
int 21h

string db 6h
times 8 db 0
string1 db "jajco"