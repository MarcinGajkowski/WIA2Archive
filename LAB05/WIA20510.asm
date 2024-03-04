org 100h				;| przerobić !!

mov ax, [a]
imul ax, 0x0C	
mov bx, [b]
imul bx, 0x08
mov cx, [c]
imul cx, 0x06
		
add bx, cx	
add ax, bx		

idiv 0x0C
idiv 0x02
	
mov word [y], ax

mov ax, 4C00h
int 21h

a dw 0x05
b dw 0x0f			;| b = 15
c dw 0x04
y dw 0x0