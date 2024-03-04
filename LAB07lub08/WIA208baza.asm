org 100h

push 0xFFFF				;| można podać też rejestr (ax) 
push word [a]			;| lub word [a]
pop word [wynik]

pusha					;| po kolei umieszcza wszystkie rejestry na stosie
						;| w kolejności AX, CX, DX, BX, SP, BP, SI, DI
popa					;| zdejmuje wartości ze stosu i umieszcza je
						;| w rejestrach w odwrotnej kolejności
pusha
mov ax, 4C00h
mov bx, 2137h
mov cx, 10h
push 0x100
pop 0x100
popa

mov ax, 4C00h
int 21h

a dw 02h
b dw 04h
c dw 06h
wynik dw 0