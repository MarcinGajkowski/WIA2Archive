org 100h

; a * b + c -> ab*c+

push word [a]
push word [b]
pop ax
pop bx
mul bx
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

; 2A + 4B -> 2A*4B*+
; 7 + 3 + AB + 1 -> 73+AB*+1+
; 3,4,22,2,+,-,/ -> 3/(4 - (22 + 2)) = -3/20 = -0.15