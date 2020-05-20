	org	100h

section .text

	call	text
	call 	phrase1
	call 	phrase2
	call 	phrase3
	call	kbwait

	int	20h

text:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di
	mov	dh, ch
	mov 	bh, 0h
	int 	10h
	ret

phrase1:mov 	di, 15d
lup1:	mov 	ch, 5d
	mov 	cl, [msg1+di-15d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lup1
	ret

phrase2:mov 	di, 20d
lup2:	mov 	ch, 12d
	mov 	cl, [msg2+di-20d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lup2
	ret

phrase3:mov 	di, 40d
lup3:	mov 	ch, 19d
	mov 	cl, [msg3+di-40d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lup3
	ret

section .data

msg1	db 	"Link... You are the light"
len1 	equ	$-msg1+15d
msg2	db 	"Our light... That must shine upon Hyrule once again"
len2 	equ	$-msg2+20d
msg3	db 	"Now go"
len3 	equ	$-msg3+40d