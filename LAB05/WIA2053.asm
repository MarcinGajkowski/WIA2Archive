org 100h

mov ax, [a]	
mov cx, [b]			
add ax, cx	
		
mov cx, [c]	
sub ax, cx		
	
mul 0x02

mov [y], ax

mov ax, 4C00h
int 21h

a dw 0x05
b dw 0x0f			;| b = 15
c dw 0x04
y dw 0x0