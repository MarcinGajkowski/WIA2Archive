org 100h

mov ax, 0012h
int 10h

mov ah, 00h
int 16h
sub al, 30h
jmp gocompare

gocompare:
cmp al, 0h
jle jedynkuj
cmp al, 9h
jg koniec

mov [count], al

mov ah, 00h
mov bl, 2h
div bl
sub [wysokosc], al

mov ah, 0Ch
mov cx, [szerokosc]
mov dx, [wysokosc]
mov al, 02h

rysuj:
	int 10h
	inc dx
	dec byte [count]
	cmp byte [count], 0
	je koniec
jmp rysuj

jedynkuj:
mov al, 1h
jmp gocompare

koniec:
mov ax, 4C00h
int 21h

count db 01h
szerokosc dw 320
wysokosc dw 240