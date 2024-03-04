org 100h

; 2(a + b - c) -> ab+c-2*

push word [a]
push word [b]
pop ax
pop bx
add ax, bx
push ax

push word [c]
pop ax
pop bx
sub ax, bx
push ax

push word 02h
pop ax
pop bx
mul bx
push ax

mov ax, 4C00h
int 21h

a dw 02h
b dw 04h
c dw 06h
wynik dw 0