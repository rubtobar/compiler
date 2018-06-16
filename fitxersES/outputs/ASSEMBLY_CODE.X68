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

	;t2 save space in Stack
	sub.l #2, SP
	;t3 save space in Stack
	sub.l #4, SP
	;t4 save space in Stack
	sub.l #4, SP
	;t0 save space in Stack
	sub.l #4, SP
	;a save space in Stack
	sub.l #4, SP
	;t1 save space in Stack
	sub.l #4, SP
	;t0 = 0
	move.l #0, -4(A5)

	;a = t0
	move.l -4(A5), -8(A5)

;L0: skip
L0:
	;t1 = 10
	move.l #10, -12(A5)

	;if a <= t1 goto L2
	move.l -8(A5), D0
	cmp.l -12(A5), D0
	ble.l L2

	;t2 = FALSE
	move.w #FALSE, -14(A5)

	;goto: L3
	BRA L3
;L2: skip
L2:
	;t2 = TRUE
	move.w #TRUE, -14(A5)

;L3: skip
L3:
	;if t2 = FALSE goto L1
	move.w -14(A5), D0
	cmp.w #FALSE, D0
	beq.l L1

	;param a
	move.l -8(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;t3 = 1
	move.l #1, -18(A5)

	;t4 = a + t3
	move.l -8(A5), D0
	add.l -18(A5), D0
	move.l D0,-22(A5)

	;a = t4
	move.l -22(A5), -8(A5)

	;goto: L0
	BRA L0
;L1: skip
L1:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START