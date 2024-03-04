org 100h

mov ah, 01h
jmp koniec			;| przeskoczy do etykiety koniec
					;| uważać, żeby nie zrobić śmiesznego loopa
mov bx, 2137h

cmp ax, 7			;| działa tak samo jak sub, tyle że nie pokazuje wyniku
					;| tylko nie da się zrobić cmp [a], [b] 
					;| (tylko jeden paluszek na rejestr)

mov ax, 10h
cmp ax, 07h
jg koniec			;| jump if greater

mov bx, 2137h

koniec:
mov ax, 4C00h
int 21h