	org	100h
section .text
	;Ejercicio 1
	mov	ax, 50410d
	mov	di, 0d
	mov	cx, 5d
	mov	bx, 10d

lup0:	mov	dx, 0000h
	div	bx
	mov	[di+200h], dx
	inc	di
	loop 	lup0

	mov	ax, 0000h
	mov	di, 0d
	mov	cx, 5d

suma:	mov	bl, 00h
	mov	bl, [200h+di]
	add	al, bl
	inc	di
	loop	suma

	mov	dx, 0000h
	mov	bx, 5d
	div	bx

	mov	di, 0d
	mov	cx, 11d

	cmp	al, 1d
	jz	lup1

	cmp	al, 2d
	jz	lup2

lup1:	mov	bl, [comnt1+di]
	mov	[di+200h], bl
	inc	di
	loop	lup1

lup2:	mov	bl, [comnt2+di]
	mov	[di+200h], bl
	inc	di
	loop	lup2

	;Ejercicio 2

	mov	ax, 0000h
	mov	bx, 0000h
	mov	cx, 11d
	mov	dx, 0000h
	mov	di, 0d

	mov	ax, 2d
	mov 	bx, 2d

lup3:	mul	bx
	mov	[di+210h], ax
	cmp	di, 6d
	jb	sal1
	cmp	di, 6d
	jae	sal2

sal1:	inc	di
	loop	lup3

sal2: 	inc	di
	inc	di
	loop	lup3

	;Ejercicio 3

	mov	ax, 0000h
	mov	bx, 0000h
	mov	cx, 0000h
	mov	dx, 0000h
	mov	di, 0d

	mov 	bx, 0d
	mov	[220h], bx
	mov	ax, 1d
	mov	[221h], ax
	mov 	cx, 15d
	mov	dx, 256d

frib:	mov	ax, [220h+di]
	mov	bx, [221h+di]
	add	ax, bx
	cmp	ax, dx
	jb	salf1
	cmp	ax, dx
	jae	salf2

salf1:	mov	[di+222h], ax
	inc	di
	loop	frib

salf2:	mov	[di+222h], ax
	inc	di
	loop	frib

	int	20h

section .data
;Data ejercicio 1
comnt1 	db 	"Solo necesito 0"
comnt2 	db 	"Aun se pasa"