	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5
	;t0 save space in Stack
	sub.l #2, SP
	;t1 save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #32, SP
	;goto: MAIN
	BRA MAIN
;L0: skip
L0:
	;preambulo funcion
	move.l A6, -(SP)
	move.l SP, A6
	sub.l #0, SP

	;return null
	move.l A6, SP
	move.l (SP)+, A6
	rts

;MAIN: skip
MAIN:
	;t2 = "!ESTOESUNESTRINGDE31POSICIONES!"
	move.l #'!EST', -38(A5)
	move.l #'OESU', -34(A5)
	move.l #'NEST', -30(A5)
	move.l #'RING', -26(A5)
	move.l #'DE31', -22(A5)
	move.l #'POSI', -18(A5)
	move.l #'CION', -14(A5)
	move.b #'E', -10(A5)
	move.b #'S', -9(A5)
	move.b #'!', -8(A5)
	move.b #0, -7(A5)

	;t1 = 3
	move.l #3, -6(A5)
	;t0 = TRUE
	move.w #TRUE, -2(A5)
	;param t2
	sub.l #32, SP
	move.l -38(A5), 0(SP)
	move.l -34(A5), 4(SP)
	move.l -30(A5), 8(SP)
	move.l -26(A5), 12(SP)
	move.l -22(A5), 16(SP)
	move.l -18(A5), 20(SP)
	move.l -14(A5), 24(SP)
	move.l -10(A5), 28(SP)

	;param t1
	move.l -6(A5), -(SP)

	;param t0
	move.w -2(A5), -(SP)

	;call L0
	bsr.l L0
	add.l 38, SP

	SIMHALT



	END	START