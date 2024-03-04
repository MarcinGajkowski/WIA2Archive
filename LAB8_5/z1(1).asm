org 0x100

;(a * b) / (2 * c) = a b * 2 c * /

mov ah, 0Ah
mov dx, onp
int 21h

mov bp, onp
main_loop:
	mov al, [bp]
	cmp byte [bp], '$'
	je koniec
	
	cmp byte [bp], 30h
	jge to_stack
	
	push return
	
	cmp byte [bp], '+'
	je dodawanie
	
	cmp byte [bp], '-'
	je odejmowanie
	
	cmp byte [bp], '*'
	je mnozenie
	
	cmp byte [bp], '/'
	je dzielenie
	
	return:
	add bp, 2
jmp main_loop

koniec:
mov AX, 4c00h
int 21h

to_stack:
	mov al, [bp]
	sub al, 30h
	mov ah, 00h
	push ax
jmp return

a dw 02h
b dw 04h
c dw 06h

%include "operacje.asm"
onp db 28h