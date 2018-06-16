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

	;a save space in Stack
	sub.l #4, SP
	;b save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #4, SP
	;t3 save space in Stack
	sub.l #4, SP
	;c save space in Stack
	sub.l #4, SP
	;d save space in Stack
	sub.l #4, SP
	;t6 save space in Stack
	sub.l #4, SP
	;t7 save space in Stack
	sub.l #2, SP
	;t8 save space in Stack
	sub.l #4, SP
	;e save space in Stack
	sub.l #4, SP
	;f save space in Stack
	sub.l #4, SP
	;a = 1
	move.l #1, -4(A5)

	;b = 2
	move.l #2, -8(A5)

	;t2 = a + b
	move.l -4(A5), D0
	add.l -8(A5), D0
	move.l D0,-12(A5)

	;t3 = 4
	move.l #4, -16(A5)

	;c = t2 - t3
	move.l -12(A5), D0
	sub.l -16(A5), D0
	move.l D0,-20(A5)

	;d = 3
	move.l #3, -24(A5)

;L0: skip
L0:
	;t6 = 10
	move.l #10, -28(A5)

	;if a <= t6 goto L2
	move.l -4(A5), D0
	cmp.l -28(A5), D0
	ble.l L2

	;t7 = FALSE
	move.w #FALSE, -30(A5)

	;goto: L3
	BRA L3
;L2: skip
L2:
	;t7 = TRUE
	move.w #TRUE, -30(A5)

;L3: skip
L3:
	;if t7 = FALSE goto L1
	move.w -30(A5), D0
	cmp.w #FALSE, D0
	beq.l L1

	;param a
	move.l -4(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;t8 = 1
	move.l #1, -34(A5)

	;a = a + t8
	move.l -4(A5), D0
	add.l -34(A5), D0
	move.l D0,-4(A5)

	;goto: L0
	BRA L0
;L1: skip
L1:
	;e = 4
	move.l #4, -38(A5)

	;f = 5
	move.l #5, -42(A5)

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START