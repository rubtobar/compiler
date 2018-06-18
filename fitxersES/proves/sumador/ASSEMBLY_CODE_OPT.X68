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

	;t#0 save space in Stack
	sub.l #4, SP
	;t#1 save space in Stack
	sub.l #32, SP
	;loopCount save space in Stack
	sub.l #4, SP
	;counter save space in Stack
	sub.l #4, SP
	;n save space in Stack
	sub.l #4, SP
	;t#5 save space in Stack
	sub.l #4, SP
	;t#6 save space in Stack
	sub.l #2, SP
	;t#7 save space in Stack
	sub.l #4, SP
	;t#8 save space in Stack
	sub.l #4, SP
	;t#10 save space in Stack
	sub.l #4, SP
	;t#0 = 10
	move.l #10, -4(A5)

;MAIN: skip
MAIN:
	;t#1 = "Introdueix un numero:"
	move.l #'Intr', -36(A5)
	move.l #'odue', -32(A5)
	move.l #'ix u', -28(A5)
	move.l #'n nu', -24(A5)
	move.l #'mero', -20(A5)
	move.b #':', -16(A5)
	move.b #0, -15(A5)

	;param t#1
	sub.l #32, SP
	move.l -36(A5), 0(SP)
	move.l -32(A5), 4(SP)
	move.l -28(A5), 8(SP)
	move.l -24(A5), 12(SP)
	move.l -20(A5), 16(SP)
	move.l -16(A5), 20(SP)
	move.l -12(A5), 24(SP)
	move.l -8(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;loopCount = t#0
	move.l -4(A5), -40(A5)

	;counter = 0
	move.l #0, -44(A5)

	;READINT return space
	sub.l #4, SP

	;n = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -48(A5)

;L0: skip
L0:
	;t#5 = 0
	move.l #0, -52(A5)

	;if loopCount > t#5 goto L2
	move.l -40(A5), D0
	cmp.l -52(A5), D0
	bgt.l L2

	;t#6 = FALSE
	move.w #FALSE, -54(A5)

	;goto: L3
	BRA L3
;L2: skip
L2:
	;t#6 = TRUE
	move.w #TRUE, -54(A5)

;L3: skip
L3:
	;if t#6 = FALSE goto L1
	move.w -54(A5), D0
	cmp.w #FALSE, D0
	beq.l L1

	;t#7 = counter + n
	move.l -44(A5), D0
	add.l -48(A5), D0
	move.l D0,-58(A5)

	;param t#7
	move.l -58(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;t#8 = 1
	move.l #1, -62(A5)

	;loopCount = loopCount - t#8
	move.l -40(A5), D0
	sub.l -62(A5), D0
	move.l D0,-40(A5)

	;t#10 = 1
	move.l #1, -66(A5)

	;counter = counter + t#10
	move.l -44(A5), D0
	add.l -66(A5), D0
	move.l D0,-44(A5)

	;goto: L0
	BRA L0
;L1: skip
L1:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START