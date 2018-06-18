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

	;t#0 save space in Stack
	sub.l #4, SP
	;t#14 save space in Stack
	sub.l #4, SP
	;t#15 save space in Stack
	sub.l #2, SP
	;t#16 save space in Stack
	sub.l #4, SP
	;t#17 save space in Stack
	sub.l #2, SP
	;t#18 save space in Stack
	sub.l #2, SP
	;t#19 save space in Stack
	sub.l #4, SP
	;t#20 save space in Stack
	sub.l #2, SP
	;t#21 save space in Stack
	sub.l #4, SP
	;t#22 save space in Stack
	sub.l #2, SP
	;t#23 save space in Stack
	sub.l #2, SP
	;t#28 save space in Stack
	sub.l #4, SP
	;t#29 save space in Stack
	sub.l #2, SP
	;t#30 save space in Stack
	sub.l #4, SP
	;t#31 save space in Stack
	sub.l #4, SP
	;t#32 save space in Stack
	sub.l #4, SP
	;t#34 save space in Stack
	sub.l #32, SP
	;t#35 save space in Stack
	sub.l #32, SP
	;valor save space in Stack
	sub.l #4, SP
	;t#37 save space in Stack
	sub.l #4, SP
	;t#38 save space in Stack
	sub.l #2, SP
	;t#39 save space in Stack
	sub.l #4, SP
	;t#40 save space in Stack
	sub.l #4, SP
	;t#41 save space in Stack
	sub.l #2, SP
	;t#42 save space in Stack
	sub.l #32, SP
	;t#0 = 20
	move.l #20, -4(A5)

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
	sub.l #8, SP

	;t#1 = 0
	move.l #0, -4(A6)

	;t#2 = t#1 - val
	move.l -4(A6), D0
	sub.l 8(A6), D0
	move.l D0,-8(A6)

	;return t#2
	;send return value
	move.l -8(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L1: skip
L1:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #6, SP

	;t#3 = 0
	move.l #0, -4(A6)

	;if val < t#3 goto L2
	move.l 8(A6), D0
	cmp.l -4(A6), D0
	blt.l L2

	;t#4 = FALSE
	move.w #FALSE, -6(A6)

	;goto: L3
	BRA L3
;L2: skip
L2:
	;t#4 = TRUE
	move.w #TRUE, -6(A6)

;L3: skip
L3:
	;if t#4 = FALSE goto L4
	move.w -6(A6), D0
	cmp.w #FALSE, D0
	beq.l L4

	;L0 return space
	sub.l #4, SP

	;param val
	move.l 8(A6), -(SP)

	;val = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, 8(A6)

;L4: skip
L4:
	;return val
	;send return value
	move.l 8(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L5: skip
L5:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #22, SP

	;result = 0
	move.l #0, -4(A6)

	;count = 0
	move.l #0, -8(A6)

	;L1 return space
	sub.l #4, SP

	;param a
	move.l 8(A6), -(SP)

	;ax = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -12(A6)

	;L1 return space
	sub.l #4, SP

	;param b
	move.l 12(A6), -(SP)

	;bx = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -16(A6)

;L6: skip
L6:
	;if count < ax goto L8
	move.l -8(A6), D0
	cmp.l -12(A6), D0
	blt.l L8

	;t#10 = FALSE
	move.w #FALSE, -18(A6)

	;goto: L9
	BRA L9
;L8: skip
L8:
	;t#10 = TRUE
	move.w #TRUE, -18(A6)

;L9: skip
L9:
	;if t#10 = FALSE goto L7
	move.w -18(A6), D0
	cmp.w #FALSE, D0
	beq.l L7

	;result = result + bx
	move.l -4(A6), D0
	add.l -16(A6), D0
	move.l D0,-4(A6)

	;t#12 = 1
	move.l #1, -22(A6)

	;count = count + t#12
	move.l -8(A6), D0
	add.l -22(A6), D0
	move.l D0,-8(A6)

	;goto: L6
	BRA L6
;L7: skip
L7:
	;t#14 = 0
	move.l #0, -8(A5)

	;if a < t#14 goto L10
	move.l 8(A6), D0
	cmp.l -8(A5), D0
	blt.l L10

	;t#15 = FALSE
	move.w #FALSE, -10(A5)

	;goto: L11
	BRA L11
;L10: skip
L10:
	;t#15 = TRUE
	move.w #TRUE, -10(A5)

;L11: skip
L11:
	;t#16 = 0
	move.l #0, -14(A5)

	;if b < t#16 goto L12
	move.l 12(A6), D0
	cmp.l -14(A5), D0
	blt.l L12

	;t#17 = FALSE
	move.w #FALSE, -16(A5)

	;goto: L13
	BRA L13
;L12: skip
L12:
	;t#17 = TRUE
	move.w #TRUE, -16(A5)

;L13: skip
L13:
	;t#18 = t#15 | t#17
	move.w -10(A5), D0
	or.w -16(A5), D0
	move.w D0,-18(A5)

	;if t#18 = FALSE goto L14
	move.w -18(A5), D0
	cmp.w #FALSE, D0
	beq.l L14

	;t#19 = 0
	move.l #0, -22(A5)

	;if a > t#19 goto L15
	move.l 8(A6), D0
	cmp.l -22(A5), D0
	bgt.l L15

	;t#20 = FALSE
	move.w #FALSE, -24(A5)

	;goto: L16
	BRA L16
;L15: skip
L15:
	;t#20 = TRUE
	move.w #TRUE, -24(A5)

;L16: skip
L16:
	;t#21 = 0
	move.l #0, -28(A5)

	;if b > t#21 goto L17
	move.l 12(A6), D0
	cmp.l -28(A5), D0
	bgt.l L17

	;t#22 = FALSE
	move.w #FALSE, -30(A5)

	;goto: L18
	BRA L18
;L17: skip
L17:
	;t#22 = TRUE
	move.w #TRUE, -30(A5)

;L18: skip
L18:
	;t#23 = t#20 | t#22
	move.w -24(A5), D0
	or.w -30(A5), D0
	move.w D0,-32(A5)

	;if t#23 = FALSE goto L19
	move.w -32(A5), D0
	cmp.w #FALSE, D0
	beq.l L19

	;L0 return space
	sub.l #4, SP

	;param result
	move.l -4(A6), -(SP)

	;result = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -4(A6)

;L19: skip
L19:
;L14: skip
L14:
	;return result
	;send return value
	move.l -4(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L20: skip
L20:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #10, SP

	;t#25 = 0
	move.l #0, -8(A6)

	;if i = t#25 goto L21
	move.l 8(A6), D0
	cmp.l -8(A6), D0
	beq.l L21

	;t#26 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L22
	BRA L22
;L21: skip
L21:
	;t#26 = TRUE
	move.w #TRUE, -10(A6)

;L22: skip
L22:
	;if t#26 = FALSE goto L23
	move.w -10(A6), D0
	cmp.w #FALSE, D0
	beq.l L23

	;result = 1
	move.l #1, -4(A6)

;L23: skip
L23:
	;t#28 = 0
	move.l #0, -36(A5)

	;if i > t#28 goto L24
	move.l 8(A6), D0
	cmp.l -36(A5), D0
	bgt.l L24

	;t#29 = FALSE
	move.w #FALSE, -38(A5)

	;goto: L25
	BRA L25
;L24: skip
L24:
	;t#29 = TRUE
	move.w #TRUE, -38(A5)

;L25: skip
L25:
	;if t#29 = FALSE goto L26
	move.w -38(A5), D0
	cmp.w #FALSE, D0
	beq.l L26

	;L5 return space
	sub.l #4, SP

	;L20 return space
	sub.l #4, SP

	;t#30 = 1
	move.l #1, -42(A5)

	;t#31 = i - t#30
	move.l 8(A6), D0
	sub.l -42(A5), D0
	move.l D0,-46(A5)

	;param t#31
	move.l -46(A5), -(SP)

	;t#32 = call L20
	bsr.l L20
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -50(A5)

	;param t#32
	move.l -50(A5), -(SP)

	;param i
	move.l 8(A6), -(SP)

	;result = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -4(A6)

;L26: skip
L26:
	;return result
	;send return value
	move.l -4(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
	;t#34 = "---- Funcion factorial ----"
	move.l #'----', -82(A5)
	move.l #' Fun', -78(A5)
	move.l #'cion', -74(A5)
	move.l #' fac', -70(A5)
	move.l #'tori', -66(A5)
	move.l #'al -', -62(A5)
	move.b #'-', -58(A5)
	move.b #'-', -57(A5)
	move.b #'-', -56(A5)
	move.b #0, -55(A5)

	;param t#34
	sub.l #32, SP
	move.l -82(A5), 0(SP)
	move.l -78(A5), 4(SP)
	move.l -74(A5), 8(SP)
	move.l -70(A5), 12(SP)
	move.l -66(A5), 16(SP)
	move.l -62(A5), 20(SP)
	move.l -58(A5), 24(SP)
	move.l -54(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#35 = "Introduce el valor a calcular:"
	move.l #'Intr', -114(A5)
	move.l #'oduc', -110(A5)
	move.l #'e el', -106(A5)
	move.l #' val', -102(A5)
	move.l #'or a', -98(A5)
	move.l #' cal', -94(A5)
	move.l #'cula', -90(A5)
	move.b #'r', -86(A5)
	move.b #':', -85(A5)
	move.b #0, -84(A5)

	;param t#35
	sub.l #32, SP
	move.l -114(A5), 0(SP)
	move.l -110(A5), 4(SP)
	move.l -106(A5), 8(SP)
	move.l -102(A5), 12(SP)
	move.l -98(A5), 16(SP)
	move.l -94(A5), 20(SP)
	move.l -90(A5), 24(SP)
	move.l -86(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;valor = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -118(A5)

	;t#37 = t#0
	move.l -4(A5), -122(A5)

	;if valor < t#37 goto L27
	move.l -118(A5), D0
	cmp.l -122(A5), D0
	blt.l L27

	;t#38 = FALSE
	move.w #FALSE, -124(A5)

	;goto: L28
	BRA L28
;L27: skip
L27:
	;t#38 = TRUE
	move.w #TRUE, -124(A5)

;L28: skip
L28:
	;if t#38 = FALSE goto L29
	move.w -124(A5), D0
	cmp.w #FALSE, D0
	beq.l L29

	;L20 return space
	sub.l #4, SP

	;param valor
	move.l -118(A5), -(SP)

	;t#39 = call L20
	bsr.l L20
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -128(A5)

	;param t#39
	move.l -128(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L29: skip
L29:
	;t#40 = t#0
	move.l -4(A5), -132(A5)

	;if valor >= t#40 goto L30
	move.l -118(A5), D0
	cmp.l -132(A5), D0
	bge.l L30

	;t#41 = FALSE
	move.w #FALSE, -134(A5)

	;goto: L31
	BRA L31
;L30: skip
L30:
	;t#41 = TRUE
	move.w #TRUE, -134(A5)

;L31: skip
L31:
	;if t#41 = FALSE goto L32
	move.w -134(A5), D0
	cmp.w #FALSE, D0
	beq.l L32

	;t#42 = "Tas pasao"
	move.l #'Tas ', -166(A5)
	move.l #'pasa', -162(A5)
	move.b #'o', -158(A5)
	move.b #0, -157(A5)

	;param t#42
	sub.l #32, SP
	move.l -166(A5), 0(SP)
	move.l -162(A5), 4(SP)
	move.l -158(A5), 8(SP)
	move.l -154(A5), 12(SP)
	move.l -150(A5), 16(SP)
	move.l -146(A5), 20(SP)
	move.l -142(A5), 24(SP)
	move.l -138(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L32: skip
L32:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START