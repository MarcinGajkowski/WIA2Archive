org 100h

	mov AH, 0x00	;
	mov AL, 12h	;
	int 10h		;set graphic mode 640x480 16 colors VGA
	
	mov AH, 00h			; przyjmij keystroke
	int 16h	;
	sub AL, 30h			; odejmij od kodu ASCII -> wartość cyfry
	mov [counter], AL
	
	mov AH, 0
	mov BL, 2
	div BL
	sub [screen_height], AL		; odejmij początek linii od środka okna
	
	mov AH, 0Ch		;
	mov CX, [screen_width]		;
	mov DX, [screen_height]	
	mov AL, 2					; zielony
	loop:		
		int 10h
		INC DX					; powiększenie kolumny (w dół)
		DEC byte [counter]
		cmp byte [counter], 0
		je end
		jmp loop

	
	end:
		mov AX, 4C00h	;
		int 21h		;end prog
		

counter db 2h
screen_width DW 320
screen_height DW 240