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
	
	cmp ah, 20h				;| sprawdza, czy D - zwiększenie pędzla
	je inc_brush_size
	
	cmp ah, 1Eh				;| sprawdza, czy A - zmniejszenie pędzla
	je dec_brush_size
	
	mov ax, 0003h			;| sprawdzanie pozycji i statusu przycisków myszy
	int 33h
	cmp bx, 0001h			;| sprawdza, czy LPM jest wciśnięty
	je write_pixel
	
jmp main_loop

mov [brush_height], al

write_pixel:
	mov ah, 0Ch
	mov bl, [brush_length]
	mov al, [color]
	petla_zew:
		petla_wew:
			int 10h
			dec cx			;| zwiększanie ilości kolumn kolorowanych (w lewo)
			dec bl
			cmp bl, 0h
		jne petla_wew
	dec dx					;| zwiększenie ilości wierszy kolorowanych (w górę)
	dec byte [brush_height]
	cmp byte [brush_height], 0 ;| ???????
	jne petla_zew
jmp main_loop


change_color:
	inc byte [color]		;| zmiana koloru po kolei
	mov ah, 00h				;| czyszczenie buforu klawiatury
	int 16h
	mov cx, 10h				;| pokazuje kolor w lewym górnym rogu 
	mov dx, 10h				;| koordynaty (10,10) dla środka w lewym górnym rogu
jmp write_pixel

inc_brush_size:
	inc byte [brush_length]	;| zwiększa brush_size :O
	mov ah, 00h				;| czyszczenie buforu klawiatury
	int 16h
jmp main_loop

dec_brush_size:
	dec byte [brush_length]	;| zmniejsza brush_size :U
	mov ah, 00h				;| czyszczenie buforu klawiatury
	int 16h
jmp main_loop

end:
mov ah, 00h					;| flushowanie buforu klawiatury z GET KEYSTROKE
int 16h
mov ax, 0002h				;| zmiana na tryb tekstowy
int 10h
mov ax, 4c00h				;| koniec programu :]
int 21h

color db 01h
brush_length db 03h			;| db do adresowania bl, dw do adresowania bx
brush_height db 03h