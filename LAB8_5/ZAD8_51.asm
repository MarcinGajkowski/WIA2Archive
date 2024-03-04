org 0x100

;(a * b) / (2 * c) = a b * 2 c * /
; tutaj tylko dajemy cyfry :)
; zakładamy, że kończymy zapis dolarem :))

mov ah, 0Ah
mov dx, onp					;| 
int 21h

mov bp, onp					;| wsadzamy tekst do base pointera
main_loop:
	mov al, [bp]			;| uzywamy wartości w bp
	cmp byte [bp], '$'
	je koniec
	
	cmp byte [bp], 30h		;| sprawdza, czy jest cyfrą
	jge to_stack
	
	push return				;| adres powrotu na początku stosu
							;| zostanie usunięty wg pliku operacje.asm
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

to_stack:					;| dodawanie do stosu
	mov al, [bp]
	sub al, 30h				;| ; -30 od kodu ASCII cyfr
	mov ah, 00h				;| czyszczenie rejestru
	push ax
jmp return

a dw 02h
b dw 04h
c dw 06h

%include "operacje.asm"
onp db 28h