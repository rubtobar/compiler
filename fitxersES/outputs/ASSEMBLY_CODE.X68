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

	;t0 save space in Stack
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

	;return null
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;t0 = 2
	move.l #2, -4(A5)

	;param t0
	move.l -4(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START