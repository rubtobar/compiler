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
	;t1 save space in Stack
	sub.l #4, SP
	;b save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #4, SP
	;t3 save space in Stack
	sub.l #4, SP
	;t4 save space in Stack
	sub.l #4, SP
	;c save space in Stack
	sub.l #4, SP
	;t5 save space in Stack
	sub.l #4, SP
	;d save space in Stack
	sub.l #4, SP
	;t6 save space in Stack
	sub.l #4, SP
	;t7 save space in Stack
	sub.l #2, SP
	;t8 save space in Stack
	sub.l #4, SP
	;t9 save space in Stack
	sub.l #4, SP
	;t10 save space in Stack
	sub.l #4, SP
	;e save space in Stack
	sub.l #4, SP
	;t11 save space in Stack
	sub.l #4, SP
	;f save space in Stack
	sub.l #4, SP
	;t0 = 1
	move.l #1, -4(A5)

	;a = t0
	move.l -4(A5), -8(A5)

	;t1 = 2
	move.l #2, -12(A5)

	;b = t1
	move.l -12(A5), -16(A5)

	;t2 = a + b
	move.l -8(A5), D0
	add.l -16(A5), D0
	move.l D0,-20(A5)

	;t3 = 4
	move.l #4, -24(A5)

	;t4 = t2 - t3
	move.l -20(A5), D0
	sub.l -24(A5), D0
	move.l D0,-28(A5)

	;c = t4
	move.l -28(A5), -32(A5)

	;t5 = 3
	move.l #3, -36(A5)

	;d = t5
	move.l -36(A5), -40(A5)

;L0: skip
L0:
	;t6 = 10
	move.l #10, -44(A5)

	;if a <= t6 goto L2
	move.l -8(A5), D0
	cmp.l -44(A5), D0
	ble.l L2

	;t7 = FALSE
	move.w #FALSE, -46(A5)

	;goto: L3
	BRA L3
;L2: skip
L2:
	;t7 = TRUE
	move.w #TRUE, -46(A5)

;L3: skip
L3:
	;if t7 = FALSE goto L1
	move.w -46(A5), D0
	cmp.w #FALSE, D0
	beq.l L1

	;param a
	move.l -8(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;t8 = 1
	move.l #1, -50(A5)

	;t9 = a + t8
	move.l -8(A5), D0
	add.l -50(A5), D0
	move.l D0,-54(A5)

	;a = t9
	move.l -54(A5), -8(A5)

	;goto: L0
	BRA L0
;L1: skip
L1:
	;t10 = 4
	move.l #4, -58(A5)

	;e = t10
	move.l -58(A5), -62(A5)

	;t11 = 5
	move.l #5, -66(A5)

	;f = t11
	move.l -66(A5), -70(A5)

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START