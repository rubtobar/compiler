	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5
	;t0 save space in Stack
	sub.l #32, SP
	;str save space in Stack
	sub.l #32, SP
	;t0 = "asd"

	;str = t0

	SIMHALT



	END	START