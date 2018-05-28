	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5
	;w save space in Stack
	sub.l #4, SP
	;t1 save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #4, SP
	;goto: MAIN
	BRA MAIN
;L0: skip
L0:
	;preambulo funcion
	move.l A6, -(SP)
	move.l SP, A6
	sub.l #4, SP

	;t0 = 5
	move.l #5, -4(A6)
	;return t0
	move.l -4(A6), 12(A6)
	move.l A6, SP
	move.l (SP)+, A6
	rts

;MAIN: skip
MAIN:
	;return space
	sub.l #4, SP

	;t1 = 3
	move.l #3, -4(A5)
	;param t1
	move.l -4(A5), -(SP)

	;call L0
	bsr.l L0
	add.l #4, SP

	t2 = L0
	;w = t2
	move.l -8(A5), -12(A5)

	SIMHALT



	END	START