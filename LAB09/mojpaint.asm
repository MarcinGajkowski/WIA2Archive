org 100h

mov ax, 0001h
int 33h				;| włączenie kursora

mov ah, 00h			;| tryb graficzny
mov al, 13h			;| ustawia okno na 320x200 (chyba)
int 10h

main_loop:
	mov ah, 01h				;| sprawdza keystroke http://www.ctyme.com/intr/rb-1755.htm
	int 16h					;| ah = BIOS scan code wcisniętego klawisza
	cmp ah, 11h				;| sprawdż, czy w
	je change_color
	
	cmp ah, 10h				;| sprawdż, czy q
	je koniec

	mov ax, 0003h			;| zwraca wartość kursora http://www.ctyme.com/intr/rb-5959.htm
	int 33h
	cmp bx, 0001h			;| sprawdź, czy Lewy Przycisk Myszy
	je write_pixel
jmp main_loop

koniec:
mov ah, 00h
int 16h					;| opróżnia bufor klawiszy po porównaniu
mov ah, 00h
mov al, 02h				;| powraca do 640x360
int 10h
mov ax, 4C00h
int 21h

write_pixel:
mov ah, 0Ch					;| wczytywanie piksela http://www.ctyme.com/intr/rb-0104.htm
mov al, [color]				;| kolor piksela
int 10h
dec cx						;| malowanie większej ilości pikselów
int 10h						;| poprzez przerywanie po przesunięciu kolumny/rzędu
dec cx						;| dec/inc cx - cofnij/przesuń o jedną kolumnę [ <-/-> ]
int 10h
dec dx						;| dec/inc dx - cofnij/przesuń o jeden rząd [ ^/v ]
int 10h
inc cx
int 10h
inc cx
int 10h
dec dx
int 10h						;| [ ]	<- [ ] 	<- [ ]
dec cx						;| 					^
int 10h						;| [ ]	-> [ ]	-> [ ]
dec cx						;| 	^
int 10h						;| [ ]	<- [ ]	<- [ ]
jmp main_loop

change_color:
mov ah, 00h
int 16h				;| opróżnić bufor klawiszy
inc byte [color]	;| zmienia kolor po kolei
mov cx, 10h			
mov dx, 10h			;| pokazuje kolor w pikselu w danej pozycji
jmp write_pixel

color db 01h		;| dark blue