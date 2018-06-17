	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
WRITE_STRING:
	;Do the print
	move.l #14, D0
	lea 4(SP), A1
	trap #15
	move.b #11, D0
	move.l D7, D1
	trap #15
	addq.b #1, D7
	;give control to caller
	rts
WRITE_INT:
	;Do the print
	move.l #3, D0
	move.l 4(SP), D1
	trap #15
	move.b #11, D0
	move.l D7, D1
	trap #15
	addq.b #1, D7
	;give control to caller
	rts
READSTRING:
	;Do the read
	move #2, D0
	movea.l SP, A1
	add.l #4,A1
	trap #15
	addq.b #1, D7
	;give control to caller
	rts
READINT:
	;Do the read
	move #4, D0
	trap #15
	move.l D1, 4(SP)
	addq.b #1, D7
	;give control to caller
	rts
START:
	;Initialize line number
	move.l #1, D7
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5

	;t0 save space in Stack
	sub.l #4, SP
	;a save space in Stack
	sub.l #4, SP
	;b save space in Stack
	sub.l #4, SP
	;t9 save space in Stack
	sub.l #4, SP
	;t10 save space in Stack
	sub.l #4, SP
	;c save space in Stack
	sub.l #4, SP
	;d save space in Stack
	sub.l #4, SP
	;t13 save space in Stack
	sub.l #4, SP
	;t14 save space in Stack
	sub.l #2, SP
	;t15 save space in Stack
	sub.l #4, SP
	;e save space in Stack
	sub.l #4, SP
	;f save space in Stack
	sub.l #4, SP
	;t0 = 4
	move.l #4, -4(A5)

	;goto: MAIN
	BRA MAIN
;MAIN: skip
MAIN:
	;a = 1
	move.l #1, -8(A5)

	;b = 2
	move.l #2, -12(A5)

	;t9 = a + b
	move.l -8(A5), D0
	add.l -12(A5), D0
	move.l D0,-16(A5)

	;t10 = 4
	move.l #4, -20(A5)

	;c = t9 - t10
	move.l -16(A5), D0
	sub.l -20(A5), D0
	move.l D0,-24(A5)

	;d = 3
	move.l #3, -28(A5)

;L2: skip
L2:
	;t13 = 10
	move.l #10, -32(A5)

	;if a <= t13 goto L4
	move.l -8(A5), D0
	cmp.l -32(A5), D0
	ble.l L4

	;t14 = FALSE
	move.w #FALSE, -34(A5)

	;goto: L5
	BRA L5
;L4: skip
L4:
	;t14 = TRUE
	move.w #TRUE, -34(A5)

;L5: skip
L5:
	;if t14 = FALSE goto L3
	move.w -34(A5), D0
	cmp.w #FALSE, D0
	beq.l L3

	;param a
	move.l -8(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;t15 = 1
	move.l #1, -38(A5)

	;a = a + t15
	move.l -8(A5), D0
	add.l -38(A5), D0
	move.l D0,-8(A5)

	;goto: L2
	BRA L2
;L3: skip
L3:
	;e = 4
	move.l #4, -42(A5)

	;f = 5
	move.l #5, -46(A5)

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START