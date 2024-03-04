org 100h

mov ah, 0Ah		;	
mov dx, dupa	;
int 21h					; get buffered input

mov ah, 0Eh	;
mov al, 0Ah	;
int 10h		;
mov al, 0Dh	;
int 10h					; break line

mov bp, dx
mov al, [dupa+1]		; długość stringa
mov ah, 00h				; zerujemy ah do dzielenia
mov bl, 2
div bl
jmp check_for_odd

back:
mov ah, 0
add bp, ax
mov byte [bp+2], 24h	; insert $ character at dupa[len]

mov ah, 09h
mov dx, dupa+2			; wczytywane litery
int 21h	; print dupa

mov ax, 4C00h
int 21h

check_for_odd:			; sprawdzamy resztę z dzielenia w ah
	cmp ah, 0h
	je back
	call odd
	jmp back

odd:					; jest reszta 1 - dodaj 1
	inc al
	ret

dupa db 50h  ;string