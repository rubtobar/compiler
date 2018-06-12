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
	;A6 to index variables
	move.l SP, A6
	;A5 to index global variables
	move.l SP, A5

	;t11 save space in Stack
	sub.l #32, SP
	;t12 save space in Stack
	sub.l #4, SP
	;t13 save space in Stack
	sub.l #32, SP
	;t14 save space in Stack
	sub.l #4, SP
	;t15 save space in Stack
	sub.l #32, SP
	;t16 save space in Stack
	sub.l #4, SP
	;t17 save space in Stack
	sub.l #4, SP
	;t18 save space in Stack
	sub.l #32, SP
	;mySentence save space in Stack
	sub.l #32, SP
	;t1 save space in Stack
	sub.l #4, SP
	;a save space in Stack
	sub.l #4, SP
	;b save space in Stack
	sub.l #4, SP
	;t2 save space in Stack
	sub.l #32, SP
	;t3 save space in Stack
	sub.l #32, SP
	;t4 save space in Stack
	sub.l #32, SP
	;t5 save space in Stack
	sub.l #4, SP
	;t6 save space in Stack
	sub.l #2, SP
	;t7 save space in Stack
	sub.l #32, SP
	;t8 save space in Stack
	sub.l #4, SP
	;t9 save space in Stack
	sub.l #4, SP
	;t10 save space in Stack
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
	sub.l #4, SP

	;t0 = a + b
	move.l 8(A6), D0
	add.l 12(A6), D0
	move.l D0,-4(A6)

	;return t0
	;send return value
	move.l -4(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;t1 = 1
	move.l #1, -36(A5)

	;a = t1
	move.l -36(A5), -40(A5)

	;t2 = "Programa sumador."
	move.l #'Prog', -76(A5)
	move.l #'rama', -72(A5)
	move.l #' sum', -68(A5)
	move.l #'ador', -64(A5)
	move.b #'.', -60(A5)
	move.b #0, -59(A5)

	;param t2
	sub.l #32, SP
	move.l -76(A5), 0(SP)
	move.l -72(A5), 4(SP)
	move.l -68(A5), 8(SP)
	move.l -64(A5), 12(SP)
	move.l -60(A5), 16(SP)
	move.l -56(A5), 20(SP)
	move.l -52(A5), 24(SP)
	move.l -48(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t3 = "introdueix frase finalitzacio"
	move.l #'intr', -108(A5)
	move.l #'odue', -104(A5)
	move.l #'ix f', -100(A5)
	move.l #'rase', -96(A5)
	move.l #' fin', -92(A5)
	move.l #'alit', -88(A5)
	move.l #'zaci', -84(A5)
	move.b #'o', -80(A5)
	move.b #0, -79(A5)

	;param t3
	sub.l #32, SP
	move.l -108(A5), 0(SP)
	move.l -104(A5), 4(SP)
	move.l -100(A5), 8(SP)
	move.l -96(A5), 12(SP)
	move.l -92(A5), 16(SP)
	move.l -88(A5), 20(SP)
	move.l -84(A5), 24(SP)
	move.l -80(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READSTRING return space
	sub.l #32, SP

	;t4 = call READSTRING
	bsr.l READSTRING
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -140(A5)
	move.l (SP)+, -136(A5)
	move.l (SP)+, -132(A5)
	move.l (SP)+, -128(A5)
	move.l (SP)+, -124(A5)
	move.l (SP)+, -120(A5)
	move.l (SP)+, -116(A5)
	move.l (SP)+, -112(A5)

	;mySentence = t4
	move.l -140(A5), -32(A5)
	move.l -136(A5), -28(A5)
	move.l -132(A5), -24(A5)
	move.l -128(A5), -20(A5)
	move.l -124(A5), -16(A5)
	move.l -120(A5), -12(A5)
	move.l -116(A5), -8(A5)
	move.l -112(A5), -4(A5)

;L1: skip
L1:
	;t5 = 0
	move.l #0, -144(A5)

	;if a != t5 goto L3
	move.l -40(A5), D0
	cmp.l -144(A5), D0
	bne.l L3

	;t6 = FALSE
	move.w #FALSE, -146(A5)

	;goto: L4
	BRA L4
;L3: skip
L3:
	;t6 = TRUE
	move.w #TRUE, -146(A5)

;L4: skip
L4:
	;if t6 = FALSE goto L2
	move.l -146(A5), D0
	cmp.l #FALSE, D0
	beq.l L2

	;t7 = "0->sortir, !0->continuar"
	move.l #'0->s', -178(A5)
	move.l #'orti', -174(A5)
	move.l #'r, !', -170(A5)
	move.l #'0->c', -166(A5)
	move.l #'onti', -162(A5)
	move.l #'nuar', -158(A5)
	move.b #0, -154(A5)

	;param t7
	sub.l #32, SP
	move.l -178(A5), 0(SP)
	move.l -174(A5), 4(SP)
	move.l -170(A5), 8(SP)
	move.l -166(A5), 12(SP)
	move.l -162(A5), 16(SP)
	move.l -158(A5), 20(SP)
	move.l -154(A5), 24(SP)
	move.l -150(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t8 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -182(A5)

	;a = t8
	move.l -182(A5), -40(A5)

	;t9 = 0
	move.l #0, -186(A5)

	;if a != t9 goto L5
	move.l -40(A5), D0
	cmp.l -186(A5), D0
	bne.l L5

	;t10 = FALSE
	move.w #FALSE, -188(A5)

	;goto: L6
	BRA L6
;L5: skip
L5:
	;t10 = TRUE
	move.w #TRUE, -188(A5)

;L6: skip
L6:
	;if t10 = FALSE goto L7
	move.l -188(A5), D0
	cmp.l #FALSE, D0
	beq.l L7

	;t11 = "Introdueix el primer numero"
	move.l #'Intr', -220(A5)
	move.l #'odue', -216(A5)
	move.l #'ix e', -212(A5)
	move.l #'l pr', -208(A5)
	move.l #'imer', -204(A5)
	move.l #' num', -200(A5)
	move.b #'e', -196(A5)
	move.b #'r', -195(A5)
	move.b #'o', -194(A5)
	move.b #0, -193(A5)

	;param t11
	sub.l #32, SP
	move.l -220(A5), 0(SP)
	move.l -216(A5), 4(SP)
	move.l -212(A5), 8(SP)
	move.l -208(A5), 12(SP)
	move.l -204(A5), 16(SP)
	move.l -200(A5), 20(SP)
	move.l -196(A5), 24(SP)
	move.l -192(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t12 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -224(A5)

	;a = t12
	move.l -224(A5), -40(A5)

	;t13 = "Introdueix el segon numero"
	move.l #'Intr', -256(A5)
	move.l #'odue', -252(A5)
	move.l #'ix e', -248(A5)
	move.l #'l se', -244(A5)
	move.l #'gon ', -240(A5)
	move.l #'nume', -236(A5)
	move.b #'r', -232(A5)
	move.b #'o', -231(A5)
	move.b #0, -230(A5)

	;param t13
	sub.l #32, SP
	move.l -256(A5), 0(SP)
	move.l -252(A5), 4(SP)
	move.l -248(A5), 8(SP)
	move.l -244(A5), 12(SP)
	move.l -240(A5), 16(SP)
	move.l -236(A5), 20(SP)
	move.l -232(A5), 24(SP)
	move.l -228(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t14 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -260(A5)

	;b = t14
	move.l -260(A5), -44(A5)

	;t15 = "La suma dona:"
	move.l #'La s', -292(A5)
	move.l #'uma ', -288(A5)
	move.l #'dona', -284(A5)
	move.b #':', -280(A5)
	move.b #0, -279(A5)

	;param t15
	sub.l #32, SP
	move.l -292(A5), 0(SP)
	move.l -288(A5), 4(SP)
	move.l -284(A5), 8(SP)
	move.l -280(A5), 12(SP)
	move.l -276(A5), 16(SP)
	move.l -272(A5), 20(SP)
	move.l -268(A5), 24(SP)
	move.l -264(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L0 return space
	sub.l #4, SP

	;param b
	move.l -44(A5), -(SP)

	;param a
	move.l -40(A5), -(SP)

	;t16 = call L0
	bsr.l L0
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -296(A5)

	;param t16
	move.l -296(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

	;t17 = 1
	move.l #1, -300(A5)

	;a = t17
	move.l -300(A5), -40(A5)

;L7: skip
L7:
	;goto: L1
	BRA L1
;L2: skip
L2:
	;t18 = "Programa finalitzat."
	move.l #'Prog', -332(A5)
	move.l #'rama', -328(A5)
	move.l #' fin', -324(A5)
	move.l #'alit', -320(A5)
	move.l #'zat.', -316(A5)
	move.b #0, -312(A5)

	;param t18
	sub.l #32, SP
	move.l -332(A5), 0(SP)
	move.l -328(A5), 4(SP)
	move.l -324(A5), 8(SP)
	move.l -320(A5), 12(SP)
	move.l -316(A5), 16(SP)
	move.l -312(A5), 20(SP)
	move.l -308(A5), 24(SP)
	move.l -304(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;param mySentence
	sub.l #32, SP
	move.l -32(A5), 0(SP)
	move.l -28(A5), 4(SP)
	move.l -24(A5), 8(SP)
	move.l -20(A5), 12(SP)
	move.l -16(A5), 16(SP)
	move.l -12(A5), 20(SP)
	move.l -8(A5), 24(SP)
	move.l -4(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START