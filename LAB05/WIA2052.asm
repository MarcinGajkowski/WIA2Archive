org 100h

mov ax, [a]			
mov cx, [b]			
mul cx	
mov cx, [c]			
add ax, cx			
mov [y], ax

mov ax, 4C00h
int 21h

a dw 0x05
b dw 0x0f			;| b = 15
c dw 0x04
y dw 0x0