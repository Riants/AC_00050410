org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$"
	je	mostrar
	sub	al, 30h		;convertir ASCII a numeros decimales
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

mostrar:mov	ax, 0000h	;limpiamos para calcular promedio
	mov	di, 0d
	mov	cx, 5d

suma:	mov	bl, 00h		;sumamos todos los numeros
	mov	bl, [300h+di]
	add	al, bl
	inc	di
	loop	suma

	mov	dx, 0000h	;Dividimos la suma
	mov	bx, 5d
	div	bx

	cmp	al, 1d
	je	strng1

	cmp	al, 2d
	je	strng2

	cmp	al, 3d
	je	strng3

	cmp	al, 4d
	je	strng4

	cmp	al, 5d
	je	strng5

	cmp	al, 6d
	je	strng6

	cmp	al, 7d
	je	strng7

	cmp	al, 8d
	je	strng8

	cmp	al, 9d
	je	strng9

	cmp	al, 10d
	je	strng10

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

strng1:	mov	dx, msg1
	call 	w_strng
	jmp	fin

strng2:	mov	dx, msg2
	call 	w_strng
	jmp	fin

strng3:	mov	dx, msg3
	call 	w_strng
	jmp	fin

strng4:	mov	dx, msg4
	call 	w_strng
	jmp	fin

strng5:	mov	dx, msg5
	call 	w_strng
	jmp	fin

strng6:	mov	dx, msg6
	call 	w_strng
	jmp	fin

strng7:	mov	dx, msg7
	call 	w_strng
	jmp	fin

strng8:	mov	dx, msg8
	call 	w_strng
	jmp	fin

strng9:	mov	dx, msg9
	call 	w_strng
	jmp	fin

strng10:mov	dx, msg10
	call 	w_strng
	jmp	fin

fin:	call 	kb	; solo detenemos la ejecución
	int 	20h

section .data

msg 	db 	"Ingrese los ultimos cinco digitos del carnet: $"
msg1	db	" Solo necesito 0$"
msg2	db	" Aun se pasa$"
msg3	db	" Hay salud$"
msg4	db	" Me recupero$"
msg5	db	" En el segundo$"
msg6	db	" Peor es nada$"
msg7	db	" Muy bien$"
msg8	db	" Colocho$"
msg9	db	" Siempre me esfierzo$"
msg10	db	" Perfecto solo Dios$"