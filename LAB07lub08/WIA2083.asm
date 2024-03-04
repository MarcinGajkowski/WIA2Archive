org 100h

; a/b + c -> 

push word [a]
push word [b]
pop ax
pop bx
mov dx, 00h				;| wyzerować rejestr przed dzieleniem!
div bx
push ax

push word [c]
pop ax
pop bx
add ax, bx
push ax

mov ax, 4C00h
int 21h

a dw 02h
b dw 04h
c dw 06h
wynik dw 0