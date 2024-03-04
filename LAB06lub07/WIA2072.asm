org 100h

mov ah, 00h
int 16h

cmp al, 41h
mov ah, 09h
jl errorek

cmp al, 5Ah
jle wielka

cmp al, 61h
jl errorek

cmp al, 7Ah
jle mala
jmp errorek

errorek:			;| error - (..., 41h) + (5Ah, 61h) + (7Ah, ...)
mov dx, err
jmp koniec

mala:				;| <61h, 7Ah>
mov dx, nocap
jmp koniec

wielka:				;| <41h, 5Ah>
mov dx, cap

koniec:
int 21h
mov ax, 4C00h
int 21h

err db 'error$'
nocap db 'mala litera$'
cap db 'wielka litera$'