org 100h

; a/(b+c) -> abc+/

push word [a]
push word [b]
push word [c]
pop bx
pop cx
add bx, cx
push bx

pop ax
pop bx
div bx
push ax

mov ax, 4C00h
int 21h

a dw 02h
b dw 04h
c dw 06h
wynik dw 0