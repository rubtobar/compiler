	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5
	;num save space in Stack
	sub.l #2, SP
	;t1 save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #2, SP
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
	sub.l #2, SP

	;t0 = TRUE
	move.w #TRUE, -2(A6)

	;return t0
	;send return value
	move.w -2(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;space for return
	sub.l #2, SP

	;t1 = 3
	move.l #3, -4(A5)

	;param t1
	move.l -4(A5), -(SP)

	;t2 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.w (SP)+, -6(A5)

	;num = t2
	move.w -6(A5), -8(A5)


	SIMHALT



	END	START