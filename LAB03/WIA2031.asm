org 100h			;| !!

mov ah, 39h
mov dx, jajco
int 21h

mov ax, 4C00h		;| !!
int 21h				;| !!

jajco db "MG40",00h,"$" ;| napis do pokazania