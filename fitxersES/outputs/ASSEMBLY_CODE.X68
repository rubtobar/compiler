	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5
	;t0 save space in Stack
	sub.l #4, SP
	;t1 save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #2, SP
	;t3 save space in Stack
	sub.l #32, SP
	;str save space in Stack
	sub.l #32, SP
	;t1 = 3
	move.l #3, -8(A5)
	;t0 = 2
	move.l #2, -4(A5)
	;if t0 > t1 goto L0
	move.l -4(A5), D0
	cmp.l -8(A5), D0
	bgt.l L0

	;t2 = FALSE
	move.w #FALSE, -10(A5)
	;goto: L1
	BRA L1
;L0: skip
L0:
	;t2 = TRUE
	move.w #TRUE, -10(A5)
;L1: skip
L1:
	;if t2 = FALSE goto L2
	move.l -10(A5), D0
	cmp.l #FALSE, D0
	beq.l L2

	;t3 = "asdf"
	move.l #'asdf', -42(A5)
	move.b #0, -38(A5)

	;str = t3
	move.l -42(A5), -74(A5)
	move.l -38(A5), -70(A5)
	move.l -34(A5), -66(A5)
	move.l -30(A5), -62(A5)
	move.l -26(A5), -58(A5)
	move.l -22(A5), -54(A5)
	move.l -18(A5), -50(A5)
	move.l -14(A5), -46(A5)

;L2: skip
L2:
	SIMHALT



	END	START