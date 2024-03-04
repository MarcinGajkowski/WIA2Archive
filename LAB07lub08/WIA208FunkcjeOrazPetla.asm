org 100h

mov dx, teskt
call print

call enterek

mov dx, tekst1
call print

mov cx, 10
petla:
	; cośtam
loop petla
						;| cx --
						;| jeśli cx == 0, to kończy pętlę
mov ax, 4C00h
int 21h

tekst db "YAY"
tekst1 db "Day"
print_text dw 0
						;| pop BP - { 	dla działania
						;| push BP - } 	na stosach

						;| %include "nazwa_pliku.asm"
						;| wkleja zawartość (funkcje) pliku
						;| (działanie tylko dla nasm-a!)
print:
mov ah, 09h
int 21h
ret

enterek:
mov ah, 02h
mov dl, 0Ah
int 21h
mov dh, 0Dh
int 21h
ret