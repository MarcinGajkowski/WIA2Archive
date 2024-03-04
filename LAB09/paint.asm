org 100h
mov AH,00h		;
mov AL,12h		;
int 10h			; - Tryb graficzny

mov AX, 0001h	;
int 33h			; - wlaczenie kursora

main_loop:
mov AH, 01h			;	
int 16h				;
cmp AH, 10h			;
je koniec			; - wyjscie po klawiszu Q

cmp AH, 11h			;
je inc_color		; - zwiekszenie koloru - 'w'

cmp AH, 1Fh			;
je dec_color		; - zmniejszenie koloru - 's'

cmp AH, 1Eh			;
je dec_brush_size	; - zmniejszenie pedzla - 'a'

cmp AH, 20h			;
je inc_brush_size	; - zwiekszenie koloru - 'd'

mov AX, 0003h		;
int 33h				;
cmp BX, 0001h		;	
je write_pixel		; - sprawdzenie wcisniecia LPM

jmp main_loop

koniec:
mov AH, 00h
int 16h
mov AH,00h
mov AL,02h
int 10h
mov AX, 4C00h
int 21h

dec_brush_size:
mov AH, 00h
int 16h
dec byte [brush_size]
jmp main_loop

inc_brush_size:
mov AH, 00h
int 16h
inc byte [brush_size]
jmp main_loop

inc_color:
mov AH, 00h
int 16h
inc byte [color]
mov DX, 10h
mov CX, 10h
jmp write_pixel

dec_color:
mov AH, 00h
int 16h
dec byte [color]
mov DX, 10h
mov CX, 10h
jmp write_pixel

write_pixel:
mov AH, 0Ch
mov AL, [color]
mov BL, [brush_size]
vertical_draw:
int 10h
dec CX
dec BL
cmp BL, 0
jg vertical_draw
jmp main_loop

brush_size db 3h
color db 2h