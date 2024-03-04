org 100h

mov ax, [a]			;| ax = 5h
mov cx, [b]			;| cx = 3Bh
add ax, cx			;| ax = ax + cx = 40h   nie można add [a], [b] 
					;| (inaczej już tak)
					;| trzeba podać rodzaj pamięci (byte, word), 
					;| jesli chcemy bezpośrednio dodać np. 21h / 2137h
mov cx, [c]			;| cx = 4Ch
add ax, cx			;| ax = ax + cx = 8Ch
mov [y], ax

mov ax, 5h			;| ax = 5h
mov cx, 5h			;| cx = 5h
mul cx				;| ax = ax * cx => ax = 5h * 5h = 19h
					;| 0xFFFF * 0xFFFFh = 0xFFFE (w dx) 0x0001 (w ax)
			
mov ax, 3Bh			;|
mov bl, 5h			;| bl = 5h		
div bl				;| ax = ax / bl => wynik = al, reszta = ah
div bx				;| ax = ax / bx => dx:ax / bx => wynik = ax, reszta = dx
					;| FFFF FFFF / np. 02h = crash 
					;| (wynik nie zmieści się w ax)

mov ax, 4C00h
int 21h

a dw 0x05
b dw 0x3B
c dw 0x4C
y dw 0x0