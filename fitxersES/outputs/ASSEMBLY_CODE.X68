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
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5

	;aux save space in Stack
	sub.l #4, SP
	;t6 save space in Stack
	sub.l #2, SP
	;t7 save space in Stack
	sub.l #4, SP
	;t8 save space in Stack
	sub.l #32, SP
	;t9 save space in Stack
	sub.l #4, SP
	;goto: MAIN
	BRA MAIN
;L0: skip
L0:
	;preambulo funcion
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #56, SP

	;t0 = 33
	move.l #33, -4(A6)

	;a = t0
	move.l -4(A6), -8(A6)

	;t1 = 16
	move.l #16, -12(A6)

	;b = t1
	move.l -12(A6), -16(A6)

;L1: skip
L1:
	;if a != b goto L3
	move.l -8(A6), D0
	cmp.l -16(A6), D0
	bne.l L3

	;t2 = FALSE
	move.w #FALSE, -18(A6)

	;goto: L4
	BRA L4
;L3: skip
L3:
	;t2 = TRUE
	move.w #TRUE, -18(A6)

;L4: skip
L4:
	;if t2 = FALSE goto L2
	move.l -18(A6), D0
	cmp.l #FALSE, D0
	beq.l L2

	;aux = a
	move.l -8(A6), -4(A5)

	;if aux > b goto L5
	move.l -4(A5), D0
	cmp.l -16(A6), D0
	bgt.l L5

	;t3 = FALSE
	move.w #FALSE, -20(A6)

	;goto: L6
	BRA L6
;L5: skip
L5:
	;t3 = TRUE
	move.w #TRUE, -20(A6)

;L6: skip
L6:
	;if t3 = FALSE goto L7
	move.l -20(A6), D0
	cmp.l #FALSE, D0
	beq.l L7

	;t4 = a - b
	move.l -8(A6), D0
	sub.l -16(A6), D0
	move.l D0,-24(A6)

	;a = t4
	move.l -24(A6), -8(A6)

	;t5 = "a -> "
	move.l #'a ->', -56(A6)
	move.b #' ', -52(A6)
	move.b #0, -51(A6)

	;param t5
	sub.l #32, SP
	move.l -56(A6), 0(SP)
	move.l -52(A6), 4(SP)
	move.l -48(A6), 8(SP)
	move.l -44(A6), 12(SP)
	move.l -40(A6), 16(SP)
	move.l -36(A6), 20(SP)
	move.l -32(A6), 24(SP)
	move.l -28(A6), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;param a
	move.l -8(A6), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L7: skip
L7:
	;if aux <= b goto L8
	move.l -4(A5), D0
	cmp.l -16(A6), D0
	ble.l L8

	;t6 = FALSE
	move.w #FALSE, -6(A5)

	;goto: L9
	BRA L9
;L8: skip
L8:
	;t6 = TRUE
	move.w #TRUE, -6(A5)

;L9: skip
L9:
	;if t6 = FALSE goto L10
	move.l -6(A5), D0
	cmp.l #FALSE, D0
	beq.l L10

	;t7 = b - a
	move.l -16(A6), D0
	sub.l -8(A6), D0
	move.l D0,-10(A5)

	;b = t7
	move.l -10(A5), -16(A6)

	;t8 = "b -> "
	move.l #'b ->', -42(A5)
	move.b #' ', -38(A5)
	move.b #0, -37(A5)

	;param t8
	sub.l #32, SP
	move.l -42(A5), 0(SP)
	move.l -38(A5), 4(SP)
	move.l -34(A5), 8(SP)
	move.l -30(A5), 12(SP)
	move.l -26(A5), 16(SP)
	move.l -22(A5), 20(SP)
	move.l -18(A5), 24(SP)
	move.l -14(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;param b
	move.l -16(A6), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L10: skip
L10:
	;goto: L1
	BRA L1
;L2: skip
L2:
	;return a
	;send return value
	move.l -8(A6), 8(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;L0 return space
	sub.l #4, SP

	;t9 = call L0
	bsr.l L0
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -46(A5)

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START