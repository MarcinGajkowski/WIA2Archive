org 100h

; a * b / c -> ab*c/

push word [a]
push word [b]
pop ax
pop bx
mul bx
push ax

push word [c]
pop ax
pop bx
mov dx, 00h
div bx
push ax

mov ax, 4C00h
int 21h

a dw 02h
b dw 04h
c dw 06h
wynik dw 0