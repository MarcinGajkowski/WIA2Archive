org 100h

mov ax, 0012h				;| ustawianie trybu (graficznego)			
int 10h						;| 13h ma więcej kolorów, mniejsza rozdzielczość; 12h na odwrót

mov ax, 1h					;| pokazanie kursora
int 33h

main_loop:
	mov ah, 01h				;| sprawdzanie buforu klawiatury z CHECK FOR KEYSTROKE
	int 16h
	
	cmp ah, 10h				;| sprawdza, czy Q - quit program
	je end
	
	cmp ah, 11h				;| sprawdza, czy W - zmiana koloru
	je change_color
	
	mov ax, 0003h			;| sprawdzanie pozycji i statusu przycisków myszy
	int 33h
	cmp bx, 0001h			;| sprawdza, czy LPM jest wciśnięty
	je write_pixel
	
jmp main_loop

write_pixel:
	mov ah, 0Ch				;| maluje piksela
	mov al, [color]			;| niebieski
	int 10h
	dec cx					;| powiększanie pędzla w lewo (2x1)
	int 10h
	dec cx					;| 3x1
	int 10h
	dec dx					;| powiększanie pędzla w górę (1 + 3x1) (1 po lewej)
	int 10h
	inc cx					;| powiększanie pędzla w prawo (2 + 3x1) (2 po lewej)
	int 10h
	inc cx					;| 3x2
	int 10h
	dec dx					;| 1 + 3x2 (1 po prawej)
	int 10h
	dec cx					;| 2 + 3x2 (2 po prawej)
	int 10h
	dec cx					;| 3x3
	int 10h
jmp main_loop


change_color:
	inc byte [color]		;| zmiana koloru po kolei
	mov ah, 00h				;| czyszczenie buforu
	int 16h
	mov cx, 10h				;| pokazuje kolor w lewym górnym rogu 
	mov dx, 10h				;| koordynaty (10,10) dla środka w lewym górnym rogu
jmp write_pixel

end:
mov ah, 00h					;| flushowanie buforu klawiatury z GET KEYSTROKE
int 16h
mov ax, 0002h				;| zmiana na tryb tekstowy
int 10h
mov ax, 4c00h				;| koniec programu :]
int 21h

color db 01h