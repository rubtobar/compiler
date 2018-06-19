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

	;t#4 save space in Stack
	sub.l #2, SP
	;t#5 save space in Stack
	sub.l #2, SP
	;t#6 save space in Stack
	sub.l #32, SP
	;t#7 save space in Stack
	sub.l #4, SP
	;t#9 save space in Stack
	sub.l #32, SP
	;t#10 save space in Stack
	sub.l #4, SP
	;t#11 save space in Stack
	sub.l #2, SP
	;goto: MAIN
	BRA MAIN
;L0: skip
L0:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #10, SP

;L1: skip
L1:
	;t#0 = 0
	move.l #0, -4(A6)

	;if num > t#0 goto L3
	move.l 40(A6), D0
	cmp.l -4(A6), D0
	bgt.l L3

	;t#1 = FALSE
	move.w #FALSE, -6(A6)

	;goto: L4
	BRA L4
;L3: skip
L3:
	;t#1 = TRUE
	move.w #TRUE, -6(A6)

;L4: skip
L4:
	;if t#1 = FALSE goto L2
	move.w -6(A6), D0
	cmp.w #FALSE, D0
	beq.l L2

	;t#2 = TRUE
	move.w #TRUE, -8(A6)

	;if bol = t#2 goto L5
	move.w 44(A6), D0
	cmp.w -8(A6), D0
	beq.l L5

	;t#3 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L6
	BRA L6
;L5: skip
L5:
	;t#3 = TRUE
	move.w #TRUE, -10(A6)

;L6: skip
L6:
	;if t#3 = FALSE goto L7
	move.w -10(A6), D0
	cmp.w #FALSE, D0
	beq.l L7

	;param a
	sub.l #32, SP
	move.l 8(A6), 0(SP)
	move.l 12(A6), 4(SP)
	move.l 16(A6), 8(SP)
	move.l 20(A6), 12(SP)
	move.l 24(A6), 16(SP)
	move.l 28(A6), 20(SP)
	move.l 32(A6), 24(SP)
	move.l 36(A6), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L7: skip
L7:
	;t#4 = FALSE
	move.w #FALSE, -2(A5)

	;if bol = t#4 goto L8
	move.w 44(A6), D0
	cmp.w -2(A5), D0
	beq.l L8

	;t#5 = FALSE
	move.w #FALSE, -4(A5)

	;goto: L9
	BRA L9
;L8: skip
L8:
	;t#5 = TRUE
	move.w #TRUE, -4(A5)

;L9: skip
L9:
	;if t#5 = FALSE goto L10
	move.w -4(A5), D0
	cmp.w #FALSE, D0
	beq.l L10

	;t#6 = "nope"
	move.l #'nope', -36(A5)
	move.b #0, -32(A5)

	;param t#6
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

;L10: skip
L10:
	;t#7 = 1
	move.l #1, -40(A5)

	;num = num - t#7
	move.l 40(A6), D0
	sub.l -40(A5), D0
	move.l D0,40(A6)

	;goto: L1
	BRA L1
;L2: skip
L2:
	;return 
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;t#11 = TRUE
	move.w #TRUE, -78(A5)

	;t#10 = 3
	move.l #3, -76(A5)

	;t#9 = "hey"
	move.b #'h', -72(A5)
	move.b #'e', -71(A5)
	move.b #'y', -70(A5)
	move.b #0, -69(A5)

	;param t#11
	move.w -78(A5), -(SP)

	;param t#10
	move.l -76(A5), -(SP)

	;param t#9
	sub.l #32, SP
	move.l -72(A5), 0(SP)
	move.l -68(A5), 4(SP)
	move.l -64(A5), 8(SP)
	move.l -60(A5), 12(SP)
	move.l -56(A5), 16(SP)
	move.l -52(A5), 20(SP)
	move.l -48(A5), 24(SP)
	move.l -44(A5), 28(SP)

	;call L0
	bsr.l L0
	;clean parameters
	add.l #38, SP

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START