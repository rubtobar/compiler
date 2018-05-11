	ORG	$1000
START:
	;t0 to Stack
	add.l #4, SP
	;a to Stack
	add.l #4, SP
	;t1 to Stack
	add.l #4, SP
	;t4 to Stack
	add.l #4, SP
	;t5 to Stack
	add.l #4, SP
	;variabledelmain to Stack
	add.l #4, SP
	;SAVED_STATE to Stack
	movem D0-D7/A0-A7,-(A7) 
	;A6 to index variables
	move.l SP, A6
	;t0 = 5
	move.l #5, -68(A6)

	;a = t0
	move.l -68(A6), -72(A6)

	;t1 = 10
	move.l #10, -76(A6)

;L0: skip
L0:
	;t2 = 4
	move.l #4, -68(A6)

	;asd = t2
	move.l -68(A6), -72(A6)

	;t3 = 34
	move.l #34, -76(A6)

	;a = t3
	move.l -76(A6), -72(A6)

	;return a

	;t4 = 1
	move.l #1, -80(A6)

	;t5 = a + t4

	;variabledelmain = t5
	move.l -84(A6), -88(A6)

	SIMHALT



	END	START