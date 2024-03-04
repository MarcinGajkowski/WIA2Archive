org 100h

mov ah, 00h
int 16h

mov ah, 02h
mov dl, al
int 21h

cmp al, 40h
jle end

cmp al, 7Ah
jg end

cmp al, 5Ah
jg pomiedzy
jmp duza

duza:
add al, 05h
jmp print

pomiedzy:
cmp al, 61h
jge mala
jmp end

mala:
sub al, 05h
jmp print


print:
mov ah, 02h
mov dl, al
int 21h

end:
mov ax, 4c00h
int 21h