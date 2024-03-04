org 100h

mov bx, [b]			
mov cx, [c]			
add bx, cx	
mov ax, [a]			
div bx			
mov [y], ax

mov ax, 4C00h
int 21h

a dw 0x05
b dw 0x0f			;| b = 15
c dw 0x04
y dw 0x0