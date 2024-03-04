org 100h

mov ax, [b]			
mov cx, [a]
add ax, cx
		
mov bl, [c]		
div bl	

mov cl, [a]
mul cl
	
mov word [y], ax

mov ax, 4C00h
int 21h

a dw 0x05
b dw 0x0f			;| b = 15
c dw 0x04
y dw 0x0