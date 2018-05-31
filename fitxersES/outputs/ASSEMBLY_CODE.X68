	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
WRITE:
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
READ:
	;Do the read
	move #2, D0
	movea.l SP, A1
	add.l #4,A1
	trap #15
	addq.b #1, D7
	;give control to caller
	rts
START:
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5

	;t2 save space in Stack
	sub.l #4, SP
	;i save space in Stack
	sub.l #4, SP
	;t3 save space in Stack
	sub.l #4, SP
	;t4 save space in Stack
	sub.l #2, SP
	;t5 save space in Stack
	sub.l #32, SP
	;t6 save space in Stack
	sub.l #4, SP
	;t7 save space in Stack
	sub.l #4, SP
	;t0 save space in Stack
	sub.l #32, SP
	;str save space in Stack
	sub.l #32, SP
	;t1 save space in Stack
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
	sub.l #0, SP

	;return var
	;send return value
	move.l 8(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;READ return space
	sub.l #32, SP

	;t0 = call READ
	bsr.l READ
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -32(A5)
	move.l (SP)+, -28(A5)
	move.l (SP)+, -24(A5)
	move.l (SP)+, -20(A5)
	move.l (SP)+, -16(A5)
	move.l (SP)+, -12(A5)
	move.l (SP)+, -8(A5)
	move.l (SP)+, -4(A5)

	;str = t0
	move.l -32(A5), -64(A5)
	move.l -28(A5), -60(A5)
	move.l -24(A5), -56(A5)
	move.l -20(A5), -52(A5)
	move.l -16(A5), -48(A5)
	move.l -12(A5), -44(A5)
	move.l -8(A5), -40(A5)
	move.l -4(A5), -36(A5)

	;L0 return space
	sub.l #4, SP

	;t1 = 0
	move.l #0, -68(A5)

	;param t1
	move.l -68(A5), -(SP)

	;t2 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -72(A5)

	;i = t2
	move.l -72(A5), -76(A5)

;L1: skip
L1:
	;t3 = 5
	move.l #5, -80(A5)

	;if i < t3 goto L3
	move.l -76(A5), D0
	cmp.l -80(A5), D0
	blt.l L3

	;t4 = FALSE
	move.w #FALSE, -82(A5)

	;goto: L4
	BRA L4
;L3: skip
L3:
	;t4 = TRUE
	move.w #TRUE, -82(A5)

;L4: skip
L4:
	;if t4 = FALSE goto L2
	move.l -82(A5), D0
	cmp.l #FALSE, D0
	beq.l L2

<<<<<<< Updated upstream
	;param str
=======
	;space for return
	sub.l #0, SP

	;t5 = "str");
		write("str"
	move.l #'str"', -114(A5)
	move.l #');
', -110(A5)
	move.l #'		wr', -106(A5)
	move.l #'ite(', -102(A5)
	move.l #'"str', -98(A5)
	move.b #0, -94(A5)

	;param t5
>>>>>>> Stashed changes
	sub.l #32, SP
	move.l -114(A5), 0(SP)
	move.l -110(A5), 4(SP)
	move.l -106(A5), 8(SP)
	move.l -102(A5), 12(SP)
	move.l -98(A5), 16(SP)
	move.l -94(A5), 20(SP)
	move.l -90(A5), 24(SP)
	move.l -86(A5), 28(SP)

	;call WRITE
	bsr.l WRITE
	;clean parameters
	add.l #32, SP

	;t6 = 1
	move.l #1, -118(A5)

	;t7 = i + t6
	move.l -76(A5), D0
	add.l -118(A5), D0
	move.l D0,-122(A5)

	;i = t7
	move.l -122(A5), -76(A5)

	;goto: L1
	BRA L1
;L2: skip
L2:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START