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
	mov	[di+220h], di
	cmp	di, 6d
	jb	sal1
	cmp	di, 6d
	jae	sal2

	;Ejercicio 3

	mov	ax, 0000h
	mov	bx, 0000h
	mov	cx, 0000h
	mov	DX, 0000h

sal1:	inc	di
	loop	lup3

sal2: 	inc	di
	inc	di
	loop	lup3

	int	20h

section .data
;Data ejercicio 1
comnt1 	db 	"Solo necesito 0"
comnt2 	db 	"Aun se pasa"

;Data ejercicio 2

;Data ejercicio 3