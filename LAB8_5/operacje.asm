dodawanie:
pop word [tmp]
pop BX
pop AX
add AX, BX
push AX
push word [tmp]
ret

mnozenie:
pop word [tmp]
pop BX
pop AX
mul BX
push AX
push word [tmp]
ret

odejmowanie:
pop word [tmp]
pop BX
pop AX
sub AX, BX
push AX
push word [tmp]
ret

dzielenie:
pop word [tmp]
pop BX
pop AX
mov DX, 00h
div BX
push AX
push word [tmp]
ret

tmp dw 0