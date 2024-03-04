org 100h

mov ax, [b]			
mov cl, [c]			
div cl	
mov cl, [a]			
mul cl			
mov [y], ax

mov word ax, 4C00h
int 21h

a dw 0x05
b dw 0x0f			;| b = 15
c dw 0x04
y dw 0x0