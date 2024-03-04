org 100h

mov ah, 0Ah
mov dx, slowa
int 21h

mov ah, 0Eh
mov al, 0Ah
int 10h
mov al, 0Dh
int 10h

mov bp, dx
mov al, [slowa+1]
mov ah, 00h
mov bl, 2h
div bl
jmp czyparzy

print:
	mov ah, 00h
	add bp, ax
	mov byte [bp+2], 24h

	mov ah, 09h
	mov dx, slowa+2
	int 21h

mov ax, 4C00h
int 21h

czyparzy:
	cmp ah, 0h
	je print
	call dodna
	jmp print
	
dodna:
	dec ah
	jmp print

slowa db 55h