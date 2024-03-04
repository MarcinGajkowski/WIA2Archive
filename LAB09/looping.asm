org 100h

mov ah, 02h
mov cx, 10				;| ustawienie ilości literek A do wydrukowania

petla:
	mov dl, "A"
	int 21h				;| do while (najpierw wykona, potem loopuje)
	call enterek
loop petla				;| dec CX -> cmp CX, 0 -> jne petla

enterek:
	mov ah, 02h
	mov dl, 0Ah
	int 21h
	mov dl, 0Dh
	int 21h
ret

koniec:
mov ax, 4C00h
int 21h