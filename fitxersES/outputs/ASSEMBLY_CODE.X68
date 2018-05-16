	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;t0 save space in Stack
	sub.l #4, SP
	;t1 save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #4, SP
	;a save space in Stack
	sub.l #4, SP
	;t0 = 2
	move.l #2, -4(A6)

	;t1 = 4
	move.l #4, -8(A6)

	;t2 = t0 - t1
	move.l -4(A6), D0
	sub.l -8(A6), D0
	move.l D0,-12(A6)

	;a = t2
	move.l -12(A6), -16(A6)

	SIMHALT



	END	START