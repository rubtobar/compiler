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

	;t0 save space in Stack
	sub.l #4, SP
	;t14 save space in Stack
	sub.l #4, SP
	;t15 save space in Stack
	sub.l #2, SP
	;t16 save space in Stack
	sub.l #4, SP
	;t17 save space in Stack
	sub.l #2, SP
	;t18 save space in Stack
	sub.l #2, SP
	;t19 save space in Stack
	sub.l #4, SP
	;t20 save space in Stack
	sub.l #2, SP
	;t21 save space in Stack
	sub.l #4, SP
	;t22 save space in Stack
	sub.l #2, SP
	;t23 save space in Stack
	sub.l #2, SP
	;t24 save space in Stack
	sub.l #4, SP
	;t28 save space in Stack
	sub.l #4, SP
	;t29 save space in Stack
	sub.l #2, SP
	;t30 save space in Stack
	sub.l #4, SP
	;t31 save space in Stack
	sub.l #4, SP
	;t32 save space in Stack
	sub.l #4, SP
	;t33 save space in Stack
	sub.l #4, SP
	;t34 save space in Stack
	sub.l #32, SP
	;t35 save space in Stack
	sub.l #32, SP
	;t36 save space in Stack
	sub.l #4, SP
	;valor save space in Stack
	sub.l #4, SP
	;t37 save space in Stack
	sub.l #4, SP
	;t38 save space in Stack
	sub.l #2, SP
	;t39 save space in Stack
	sub.l #4, SP
	;t40 save space in Stack
	sub.l #4, SP
	;t41 save space in Stack
	sub.l #2, SP
	;t42 save space in Stack
	sub.l #32, SP
	;t0 = 20
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

	;t1 = 0
	move.l #0, -4(A6)

	;t2 = t1 - val
	move.l -4(A6), D0
	sub.l 8(A6), D0
	move.l D0,-8(A6)

	;return t2
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
	sub.l #10, SP

	;t3 = 0
	move.l #0, -4(A6)

	;if val < t3 goto L2
	move.l 8(A6), D0
	cmp.l -4(A6), D0
	blt.l L2

	;t4 = FALSE
	move.w #FALSE, -6(A6)

	;goto: L3
	BRA L3
;L2: skip
L2:
	;t4 = TRUE
	move.w #TRUE, -6(A6)

;L3: skip
L3:
	;if t4 = FALSE goto L4
	move.w -6(A6), D0
	cmp.w #FALSE, D0
	beq.l L4

	;L0 return space
	sub.l #4, SP

	;param val
	move.l 8(A6), -(SP)

	;t5 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -10(A6)

	;val = t5
	move.l -10(A6), 8(A6)

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
	sub.l #46, SP

	;t6 = 0
	move.l #0, -4(A6)

	;result = t6
	move.l -4(A6), -8(A6)

	;t7 = 0
	move.l #0, -12(A6)

	;count = t7
	move.l -12(A6), -16(A6)

	;L1 return space
	sub.l #4, SP

	;param a
	move.l 8(A6), -(SP)

	;t8 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -20(A6)

	;ax = t8
	move.l -20(A6), -24(A6)

	;L1 return space
	sub.l #4, SP

	;param b
	move.l 12(A6), -(SP)

	;t9 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -28(A6)

	;bx = t9
	move.l -28(A6), -32(A6)

;L6: skip
L6:
	;if count < ax goto L8
	move.l -16(A6), D0
	cmp.l -24(A6), D0
	blt.l L8

	;t10 = FALSE
	move.w #FALSE, -34(A6)

	;goto: L9
	BRA L9
;L8: skip
L8:
	;t10 = TRUE
	move.w #TRUE, -34(A6)

;L9: skip
L9:
	;if t10 = FALSE goto L7
	move.w -34(A6), D0
	cmp.w #FALSE, D0
	beq.l L7

	;t11 = result + bx
	move.l -8(A6), D0
	add.l -32(A6), D0
	move.l D0,-38(A6)

	;result = t11
	move.l -38(A6), -8(A6)

	;t12 = 1
	move.l #1, -42(A6)

	;t13 = count + t12
	move.l -16(A6), D0
	add.l -42(A6), D0
	move.l D0,-46(A6)

	;count = t13
	move.l -46(A6), -16(A6)

	;goto: L6
	BRA L6
;L7: skip
L7:
	;t14 = 0
	move.l #0, -8(A5)

	;if a < t14 goto L10
	move.l 8(A6), D0
	cmp.l -8(A5), D0
	blt.l L10

	;t15 = FALSE
	move.w #FALSE, -10(A5)

	;goto: L11
	BRA L11
;L10: skip
L10:
	;t15 = TRUE
	move.w #TRUE, -10(A5)

;L11: skip
L11:
	;t16 = 0
	move.l #0, -14(A5)

	;if b < t16 goto L12
	move.l 12(A6), D0
	cmp.l -14(A5), D0
	blt.l L12

	;t17 = FALSE
	move.w #FALSE, -16(A5)

	;goto: L13
	BRA L13
;L12: skip
L12:
	;t17 = TRUE
	move.w #TRUE, -16(A5)

;L13: skip
L13:
	;t18 = t15 | t17
	move.w -10(A5), D0
	or.w -16(A5), D0
	move.w D0,-18(A5)

	;if t18 = FALSE goto L14
	move.w -18(A5), D0
	cmp.w #FALSE, D0
	beq.l L14

	;t19 = 0
	move.l #0, -22(A5)

	;if a > t19 goto L15
	move.l 8(A6), D0
	cmp.l -22(A5), D0
	bgt.l L15

	;t20 = FALSE
	move.w #FALSE, -24(A5)

	;goto: L16
	BRA L16
;L15: skip
L15:
	;t20 = TRUE
	move.w #TRUE, -24(A5)

;L16: skip
L16:
	;t21 = 0
	move.l #0, -28(A5)

	;if b > t21 goto L17
	move.l 12(A6), D0
	cmp.l -28(A5), D0
	bgt.l L17

	;t22 = FALSE
	move.w #FALSE, -30(A5)

	;goto: L18
	BRA L18
;L17: skip
L17:
	;t22 = TRUE
	move.w #TRUE, -30(A5)

;L18: skip
L18:
	;t23 = t20 | t22
	move.w -24(A5), D0
	or.w -30(A5), D0
	move.w D0,-32(A5)

	;if t23 = FALSE goto L19
	move.w -32(A5), D0
	cmp.w #FALSE, D0
	beq.l L19

	;L0 return space
	sub.l #4, SP

	;param result
	move.l -8(A6), -(SP)

	;t24 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -36(A5)

	;result = t24
	move.l -36(A5), -8(A6)

;L19: skip
L19:
;L14: skip
L14:
	;return result
	;send return value
	move.l -8(A6), 16(A6)
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
	sub.l #14, SP

	;t25 = 0
	move.l #0, -8(A6)

	;if i = t25 goto L21
	move.l 8(A6), D0
	cmp.l -8(A6), D0
	beq.l L21

	;t26 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L22
	BRA L22
;L21: skip
L21:
	;t26 = TRUE
	move.w #TRUE, -10(A6)

;L22: skip
L22:
	;if t26 = FALSE goto L23
	move.w -10(A6), D0
	cmp.w #FALSE, D0
	beq.l L23

	;t27 = 1
	move.l #1, -14(A6)

	;result = t27
	move.l -14(A6), -4(A6)

;L23: skip
L23:
	;t28 = 0
	move.l #0, -40(A5)

	;if i > t28 goto L24
	move.l 8(A6), D0
	cmp.l -40(A5), D0
	bgt.l L24

	;t29 = FALSE
	move.w #FALSE, -42(A5)

	;goto: L25
	BRA L25
;L24: skip
L24:
	;t29 = TRUE
	move.w #TRUE, -42(A5)

;L25: skip
L25:
	;if t29 = FALSE goto L26
	move.w -42(A5), D0
	cmp.w #FALSE, D0
	beq.l L26

	;L5 return space
	sub.l #4, SP

	;L20 return space
	sub.l #4, SP

	;t30 = 1
	move.l #1, -46(A5)

	;t31 = i - t30
	move.l 8(A6), D0
	sub.l -46(A5), D0
	move.l D0,-50(A5)

	;param t31
	move.l -50(A5), -(SP)

	;t32 = call L20
	bsr.l L20
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -54(A5)

	;param t32
	move.l -54(A5), -(SP)

	;param i
	move.l 8(A6), -(SP)

	;t33 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -58(A5)

	;result = t33
	move.l -58(A5), -4(A6)

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
	;t34 = "---- Funcion factorial ----"
	move.l #'----', -90(A5)
	move.l #' Fun', -86(A5)
	move.l #'cion', -82(A5)
	move.l #' fac', -78(A5)
	move.l #'tori', -74(A5)
	move.l #'al -', -70(A5)
	move.b #'-', -66(A5)
	move.b #'-', -65(A5)
	move.b #'-', -64(A5)
	move.b #0, -63(A5)

	;param t34
	sub.l #32, SP
	move.l -90(A5), 0(SP)
	move.l -86(A5), 4(SP)
	move.l -82(A5), 8(SP)
	move.l -78(A5), 12(SP)
	move.l -74(A5), 16(SP)
	move.l -70(A5), 20(SP)
	move.l -66(A5), 24(SP)
	move.l -62(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t35 = "Introduce el valor a calcular:"
	move.l #'Intr', -122(A5)
	move.l #'oduc', -118(A5)
	move.l #'e el', -114(A5)
	move.l #' val', -110(A5)
	move.l #'or a', -106(A5)
	move.l #' cal', -102(A5)
	move.l #'cula', -98(A5)
	move.b #'r', -94(A5)
	move.b #':', -93(A5)
	move.b #0, -92(A5)

	;param t35
	sub.l #32, SP
	move.l -122(A5), 0(SP)
	move.l -118(A5), 4(SP)
	move.l -114(A5), 8(SP)
	move.l -110(A5), 12(SP)
	move.l -106(A5), 16(SP)
	move.l -102(A5), 20(SP)
	move.l -98(A5), 24(SP)
	move.l -94(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t36 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -126(A5)

	;valor = t36
	move.l -126(A5), -130(A5)

	;t37 = t0
	move.l -4(A5), -134(A5)

	;if valor < t37 goto L27
	move.l -130(A5), D0
	cmp.l -134(A5), D0
	blt.l L27

	;t38 = FALSE
	move.w #FALSE, -136(A5)

	;goto: L28
	BRA L28
;L27: skip
L27:
	;t38 = TRUE
	move.w #TRUE, -136(A5)

;L28: skip
L28:
	;if t38 = FALSE goto L29
	move.w -136(A5), D0
	cmp.w #FALSE, D0
	beq.l L29

	;L20 return space
	sub.l #4, SP

	;param valor
	move.l -130(A5), -(SP)

	;t39 = call L20
	bsr.l L20
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -140(A5)

	;param t39
	move.l -140(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L29: skip
L29:
	;t40 = t0
	move.l -4(A5), -144(A5)

	;if valor >= t40 goto L30
	move.l -130(A5), D0
	cmp.l -144(A5), D0
	bge.l L30

	;t41 = FALSE
	move.w #FALSE, -146(A5)

	;goto: L31
	BRA L31
;L30: skip
L30:
	;t41 = TRUE
	move.w #TRUE, -146(A5)

;L31: skip
L31:
	;if t41 = FALSE goto L32
	move.w -146(A5), D0
	cmp.w #FALSE, D0
	beq.l L32

	;t42 = "Tas pasao"
	move.l #'Tas ', -178(A5)
	move.l #'pasa', -174(A5)
	move.b #'o', -170(A5)
	move.b #0, -169(A5)

	;param t42
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

;L32: skip
L32:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START