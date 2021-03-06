org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 100d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	mov 	bx, 175d ; final
	call 	linea_h

	mov 	si, 125d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	mov 	bx, 150d ; final
	call 	linea_h

	mov 	si, 125d ; X -> Columna
	mov 	di, 75d ; Y -> Fila
	mov 	bx, 150d ; final
	call 	linea_h

	mov 	si, 150d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
	mov 	bx, 175d ; final
	call 	linea_h

	mov 	si, 100d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	mov 	bx, 125d ; final
	call 	linea_h

	mov	si, 100d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	mov 	bx, 150d ; final
	call 	linea_v

	mov	si, 125d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	mov 	bx, 75d ; final
	call 	linea_v

	mov	si, 125d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
	mov 	bx, 150d ; final
	call 	linea_v

	mov	si, 150d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	mov 	bx, 75d ; final
	call 	linea_v

	mov	si, 175d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	mov 	bx, 100d ; final
	call 	linea_v

	mov	si, 175d ; X -> Columna
	mov 	di, 125d ; Y -> Fila
	mov 	bx, 150d ; final
	call 	linea_v

	mov	si, 150d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
	mov 	bx, 125d ; final
	call 	linea_d

	mov	si, 125d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
	mov 	bx, 150d ; final
	call 	linea_d

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, bx ; final
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx ; final
	jne 	lupi_v
	ret

linea_d:
lupi_d:	mov 	cx, 0d ; Columna 
	add	cx, si
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc	si
	inc 	di
	cmp 	di, bx ; final
	jne 	lupi_d
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data