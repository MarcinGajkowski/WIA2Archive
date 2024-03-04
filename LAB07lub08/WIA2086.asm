org 100h

; a^2 + 2b + c -> aa*2b*+c+

push word [a]
push word [a]
pop ax
pop bx
mul bx
push ax

push word 02h
push word [b]
pop ax
pop bx
mul bx
push ax

pop ax
pop bx
add ax, bx
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