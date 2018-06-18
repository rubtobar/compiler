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
	;c save space in Stack
	sub.l #4, SP
	;rep save space in Stack
	sub.l #4, SP
	;d save space in Stack
	sub.l #4, SP
	;t#4 save space in Stack
	sub.l #2, SP
	;t#7 save space in Stack
	sub.l #4, SP
	;t#8 save space in Stack
	sub.l #2, SP
	;e save space in Stack
	sub.l #4, SP
	;t#10 save space in Stack
	sub.l #4, SP
;MAIN: skip
MAIN:
	;a = 1
	move.l #1, -4(A5)

	;b = 2
	move.l #2, -8(A5)

	;a = b
	move.l -8(A5), -4(A5)

	;c = a + b
	move.l -4(A5), D0
	add.l -8(A5), D0
	move.l D0,-12(A5)

	;rep = c
	move.l -12(A5), -16(A5)

	;t#4 = TRUE
	move.w #TRUE, -22(A5)

	;if t#4 = FALSE goto L0
	move.w -22(A5), D0
	cmp.w #FALSE, D0
	beq.l L0

	;d = c
	move.l -12(A5), -20(A5)

	;a = 3
	move.l #3, -4(A5)

;L0: skip
L0:
;L1: skip
L1:
	;t#7 = 0
	move.l #0, -26(A5)

	;if d > t#7 goto L3
	move.l -20(A5), D0
	cmp.l -26(A5), D0
	bgt.l L3

	;t#8 = FALSE
	move.w #FALSE, -28(A5)

	;goto: L4
	BRA L4
;L3: skip
L3:
	;t#8 = TRUE
	move.w #TRUE, -28(A5)

;L4: skip
L4:
	;if t#8 = FALSE goto L2
	move.w -28(A5), D0
	cmp.w #FALSE, D0
	beq.l L2

	;e = a + b
	move.l -4(A5), D0
	add.l -8(A5), D0
	move.l D0,-32(A5)

	;t#10 = 1
	move.l #1, -36(A5)

	;d = d - t#10
	move.l -20(A5), D0
	sub.l -36(A5), D0
	move.l D0,-20(A5)

	;param d
	move.l -20(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;goto: L1
	BRA L1
;L2: skip
L2:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START