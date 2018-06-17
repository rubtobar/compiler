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

	;continuar save space in Stack
	sub.l #2, SP
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
	;t#24 save space in Stack
	sub.l #4, SP
	;t#34 save space in Stack
	sub.l #4, SP
	;t#35 save space in Stack
	sub.l #2, SP
	;t#36 save space in Stack
	sub.l #4, SP
	;t#37 save space in Stack
	sub.l #4, SP
	;t#38 save space in Stack
	sub.l #4, SP
	;t#39 save space in Stack
	sub.l #4, SP
	;t#40 save space in Stack
	sub.l #2, SP
	;t#41 save space in Stack
	sub.l #4, SP
	;t#42 save space in Stack
	sub.l #2, SP
	;t#43 save space in Stack
	sub.l #2, SP
	;t#44 save space in Stack
	sub.l #4, SP
	;t#45 save space in Stack
	sub.l #4, SP
	;t#46 save space in Stack
	sub.l #4, SP
	;t#47 save space in Stack
	sub.l #4, SP
	;t#48 save space in Stack
	sub.l #2, SP
	;t#49 save space in Stack
	sub.l #4, SP
	;t#50 save space in Stack
	sub.l #2, SP
	;t#51 save space in Stack
	sub.l #2, SP
	;t#52 save space in Stack
	sub.l #4, SP
	;t#53 save space in Stack
	sub.l #32, SP
	;t#54 save space in Stack
	sub.l #32, SP
	;t#55 save space in Stack
	sub.l #32, SP
	;t#56 save space in Stack
	sub.l #32, SP
	;t#57 save space in Stack
	sub.l #32, SP
	;t#58 save space in Stack
	sub.l #4, SP
	;opcion save space in Stack
	sub.l #4, SP
	;t#59 save space in Stack
	sub.l #4, SP
	;t#60 save space in Stack
	sub.l #2, SP
	;t#61 save space in Stack
	sub.l #32, SP
	;t#62 save space in Stack
	sub.l #32, SP
	;t#63 save space in Stack
	sub.l #4, SP
	;t#64 save space in Stack
	sub.l #4, SP
	;t#65 save space in Stack
	sub.l #4, SP
	;t#66 save space in Stack
	sub.l #2, SP
	;t#67 save space in Stack
	sub.l #32, SP
	;t#68 save space in Stack
	sub.l #32, SP
	;t#69 save space in Stack
	sub.l #4, SP
	;val1 save space in Stack
	sub.l #4, SP
	;t#70 save space in Stack
	sub.l #32, SP
	;t#71 save space in Stack
	sub.l #4, SP
	;val2 save space in Stack
	sub.l #4, SP
	;t#72 save space in Stack
	sub.l #32, SP
	;t#73 save space in Stack
	sub.l #4, SP
	;t#74 save space in Stack
	sub.l #4, SP
	;t#75 save space in Stack
	sub.l #2, SP
	;t#76 save space in Stack
	sub.l #32, SP
	;t#77 save space in Stack
	sub.l #32, SP
	;t#78 save space in Stack
	sub.l #4, SP
	;val1 save space in Stack
	sub.l #4, SP
	;t#79 save space in Stack
	sub.l #32, SP
	;t#80 save space in Stack
	sub.l #4, SP
	;val2 save space in Stack
	sub.l #4, SP
	;t#81 save space in Stack
	sub.l #32, SP
	;t#82 save space in Stack
	sub.l #4, SP
	;t#83 save space in Stack
	sub.l #4, SP
	;t#84 save space in Stack
	sub.l #2, SP
	;t#86 save space in Stack
	sub.l #32, SP
	;continuar = TRUE
	move.w #TRUE, -2(A5)

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
	sub.l #10, SP

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

	;t#5 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -10(A6)

	;val = t#5
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
	sub.l #30, SP

	;result = 0
	move.l #0, -4(A6)

	;count = 0
	move.l #0, -8(A6)

	;L1 return space
	sub.l #4, SP

	;param a
	move.l 8(A6), -(SP)

	;t#8 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -12(A6)

	;ax = t#8
	move.l -12(A6), -16(A6)

	;L1 return space
	sub.l #4, SP

	;param b
	move.l 12(A6), -(SP)

	;t#9 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -20(A6)

	;bx = t#9
	move.l -20(A6), -24(A6)

;L6: skip
L6:
	;if count < ax goto L8
	move.l -8(A6), D0
	cmp.l -16(A6), D0
	blt.l L8

	;t#10 = FALSE
	move.w #FALSE, -26(A6)

	;goto: L9
	BRA L9
;L8: skip
L8:
	;t#10 = TRUE
	move.w #TRUE, -26(A6)

;L9: skip
L9:
	;if t#10 = FALSE goto L7
	move.w -26(A6), D0
	cmp.w #FALSE, D0
	beq.l L7

	;result = result + bx
	move.l -4(A6), D0
	add.l -24(A6), D0
	move.l D0,-4(A6)

	;t#12 = 1
	move.l #1, -30(A6)

	;count = count + t#12
	move.l -8(A6), D0
	add.l -30(A6), D0
	move.l D0,-8(A6)

	;goto: L6
	BRA L6
;L7: skip
L7:
	;t#14 = 0
	move.l #0, -6(A5)

	;if a < t#14 goto L10
	move.l 8(A6), D0
	cmp.l -6(A5), D0
	blt.l L10

	;t#15 = FALSE
	move.w #FALSE, -8(A5)

	;goto: L11
	BRA L11
;L10: skip
L10:
	;t#15 = TRUE
	move.w #TRUE, -8(A5)

;L11: skip
L11:
	;t#16 = 0
	move.l #0, -12(A5)

	;if b < t#16 goto L12
	move.l 12(A6), D0
	cmp.l -12(A5), D0
	blt.l L12

	;t#17 = FALSE
	move.w #FALSE, -14(A5)

	;goto: L13
	BRA L13
;L12: skip
L12:
	;t#17 = TRUE
	move.w #TRUE, -14(A5)

;L13: skip
L13:
	;t#18 = t#15 | t#17
	move.w -8(A5), D0
	or.w -14(A5), D0
	move.w D0,-16(A5)

	;if t#18 = FALSE goto L14
	move.w -16(A5), D0
	cmp.w #FALSE, D0
	beq.l L14

	;t#19 = 0
	move.l #0, -20(A5)

	;if a > t#19 goto L15
	move.l 8(A6), D0
	cmp.l -20(A5), D0
	bgt.l L15

	;t#20 = FALSE
	move.w #FALSE, -22(A5)

	;goto: L16
	BRA L16
;L15: skip
L15:
	;t#20 = TRUE
	move.w #TRUE, -22(A5)

;L16: skip
L16:
	;t#21 = 0
	move.l #0, -26(A5)

	;if b > t#21 goto L17
	move.l 12(A6), D0
	cmp.l -26(A5), D0
	bgt.l L17

	;t#22 = FALSE
	move.w #FALSE, -28(A5)

	;goto: L18
	BRA L18
;L17: skip
L17:
	;t#22 = TRUE
	move.w #TRUE, -28(A5)

;L18: skip
L18:
	;t#23 = t#20 | t#22
	move.w -22(A5), D0
	or.w -28(A5), D0
	move.w D0,-30(A5)

	;if t#23 = FALSE goto L19
	move.w -30(A5), D0
	cmp.w #FALSE, D0
	beq.l L19

	;L0 return space
	sub.l #4, SP

	;param result
	move.l -4(A6), -(SP)

	;t#24 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -34(A5)

	;result = t#24
	move.l -34(A5), -4(A6)

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
	sub.l #14, SP

	;Q = 0
	move.l #0, -4(A6)

	;R = N
	move.l 8(A6), -8(A6)

;L21: skip
L21:
	;if R >= D goto L23
	move.l -8(A6), D0
	cmp.l 12(A6), D0
	bge.l L23

	;t#26 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L24
	BRA L24
;L23: skip
L23:
	;t#26 = TRUE
	move.w #TRUE, -10(A6)

;L24: skip
L24:
	;if t#26 = FALSE goto L22
	move.w -10(A6), D0
	cmp.w #FALSE, D0
	beq.l L22

	;t#27 = 1
	move.l #1, -14(A6)

	;Q = Q + t#27
	move.l -4(A6), D0
	add.l -14(A6), D0
	move.l D0,-4(A6)

	;R = R - D
	move.l -8(A6), D0
	sub.l 12(A6), D0
	move.l D0,-8(A6)

	;goto: L21
	BRA L21
;L22: skip
L22:
	;return Q
	;send return value
	move.l -4(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L25: skip
L25:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #46, SP

	;RESULT = 0
	move.l #0, -8(A6)

	;t#31 = 0
	move.l #0, -12(A6)

	;if D = t#31 goto L26
	move.l 12(A6), D0
	cmp.l -12(A6), D0
	beq.l L26

	;t#32 = FALSE
	move.w #FALSE, -14(A6)

	;goto: L27
	BRA L27
;L26: skip
L26:
	;t#32 = TRUE
	move.w #TRUE, -14(A6)

;L27: skip
L27:
	;if t#32 = FALSE goto L28
	move.w -14(A6), D0
	cmp.w #FALSE, D0
	beq.l L28

	;t#33 = "Division by 0"
	move.l #'Divi', -46(A6)
	move.l #'sion', -42(A6)
	move.l #' by ', -38(A6)
	move.b #'0', -34(A6)
	move.b #0, -33(A6)

	;param t#33
	sub.l #32, SP
	move.l -46(A6), 0(SP)
	move.l -42(A6), 4(SP)
	move.l -38(A6), 8(SP)
	move.l -34(A6), 12(SP)
	move.l -30(A6), 16(SP)
	move.l -26(A6), 20(SP)
	move.l -22(A6), 24(SP)
	move.l -18(A6), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L28: skip
L28:
	;t#34 = 0
	move.l #0, -38(A5)

	;if D < t#34 goto L29
	move.l 12(A6), D0
	cmp.l -38(A5), D0
	blt.l L29

	;t#35 = FALSE
	move.w #FALSE, -40(A5)

	;goto: L30
	BRA L30
;L29: skip
L29:
	;t#35 = TRUE
	move.w #TRUE, -40(A5)

;L30: skip
L30:
	;if t#35 = FALSE goto L31
	move.w -40(A5), D0
	cmp.w #FALSE, D0
	beq.l L31

	;L25 return space
	sub.l #4, SP

	;L0 return space
	sub.l #4, SP

	;param D
	move.l 12(A6), -(SP)

	;t#36 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -44(A5)

	;param t#36
	move.l -44(A5), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;t#37 = call L25
	bsr.l L25
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -48(A5)

	;Q = t#37
	move.l -48(A5), -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;t#38 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -52(A5)

	;RESULT = t#38
	move.l -52(A5), -8(A6)

;L31: skip
L31:
	;t#39 = 0
	move.l #0, -56(A5)

	;if N < t#39 goto L32
	move.l 8(A6), D0
	cmp.l -56(A5), D0
	blt.l L32

	;t#40 = FALSE
	move.w #FALSE, -58(A5)

	;goto: L33
	BRA L33
;L32: skip
L32:
	;t#40 = TRUE
	move.w #TRUE, -58(A5)

;L33: skip
L33:
	;t#41 = 0
	move.l #0, -62(A5)

	;if D > t#41 goto L34
	move.l 12(A6), D0
	cmp.l -62(A5), D0
	bgt.l L34

	;t#42 = FALSE
	move.w #FALSE, -64(A5)

	;goto: L35
	BRA L35
;L34: skip
L34:
	;t#42 = TRUE
	move.w #TRUE, -64(A5)

;L35: skip
L35:
	;t#43 = t#40 & t#42
	move.w -58(A5), D0
	and.w -64(A5), D0
	move.w D0,-66(A5)

	;if t#43 = FALSE goto L36
	move.w -66(A5), D0
	cmp.w #FALSE, D0
	beq.l L36

	;L25 return space
	sub.l #4, SP

	;L0 return space
	sub.l #4, SP

	;param N
	move.l 8(A6), -(SP)

	;t#44 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -70(A5)

	;param D
	move.l 12(A6), -(SP)

	;param t#44
	move.l -70(A5), -(SP)

	;t#45 = call L25
	bsr.l L25
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -74(A5)

	;Q = t#45
	move.l -74(A5), -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;t#46 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -78(A5)

	;RESULT = t#46
	move.l -78(A5), -8(A6)

;L36: skip
L36:
	;t#47 = 0
	move.l #0, -82(A5)

	;if N >= t#47 goto L37
	move.l 8(A6), D0
	cmp.l -82(A5), D0
	bge.l L37

	;t#48 = FALSE
	move.w #FALSE, -84(A5)

	;goto: L38
	BRA L38
;L37: skip
L37:
	;t#48 = TRUE
	move.w #TRUE, -84(A5)

;L38: skip
L38:
	;t#49 = 0
	move.l #0, -88(A5)

	;if D > t#49 goto L39
	move.l 12(A6), D0
	cmp.l -88(A5), D0
	bgt.l L39

	;t#50 = FALSE
	move.w #FALSE, -90(A5)

	;goto: L40
	BRA L40
;L39: skip
L39:
	;t#50 = TRUE
	move.w #TRUE, -90(A5)

;L40: skip
L40:
	;t#51 = t#48 & t#50
	move.w -84(A5), D0
	and.w -90(A5), D0
	move.w D0,-92(A5)

	;if t#51 = FALSE goto L41
	move.w -92(A5), D0
	cmp.w #FALSE, D0
	beq.l L41

	;L20 return space
	sub.l #4, SP

	;param D
	move.l 12(A6), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;t#52 = call L20
	bsr.l L20
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -96(A5)

	;RESULT = t#52
	move.l -96(A5), -8(A6)

;L41: skip
L41:
	;return RESULT
	;send return value
	move.l -8(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;MAIN: skip
MAIN:
;L42: skip
L42:
	;if continuar = FALSE goto L43
	move.w -2(A5), D0
	cmp.w #FALSE, D0
	beq.l L43

	;t#53 = "<------Calculadora------>"
	move.l #'<---', -128(A5)
	move.l #'---C', -124(A5)
	move.l #'alcu', -120(A5)
	move.l #'lado', -116(A5)
	move.l #'ra--', -112(A5)
	move.l #'----', -108(A5)
	move.b #'>', -104(A5)
	move.b #0, -103(A5)

	;param t#53
	sub.l #32, SP
	move.l -128(A5), 0(SP)
	move.l -124(A5), 4(SP)
	move.l -120(A5), 8(SP)
	move.l -116(A5), 12(SP)
	move.l -112(A5), 16(SP)
	move.l -108(A5), 20(SP)
	move.l -104(A5), 24(SP)
	move.l -100(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#54 = "0. Salir"
	move.l #'0. S', -160(A5)
	move.l #'alir', -156(A5)
	move.b #0, -152(A5)

	;param t#54
	sub.l #32, SP
	move.l -160(A5), 0(SP)
	move.l -156(A5), 4(SP)
	move.l -152(A5), 8(SP)
	move.l -148(A5), 12(SP)
	move.l -144(A5), 16(SP)
	move.l -140(A5), 20(SP)
	move.l -136(A5), 24(SP)
	move.l -132(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#55 = "1. Valor absoluto"
	move.l #'1. V', -192(A5)
	move.l #'alor', -188(A5)
	move.l #' abs', -184(A5)
	move.l #'olut', -180(A5)
	move.b #'o', -176(A5)
	move.b #0, -175(A5)

	;param t#55
	sub.l #32, SP
	move.l -192(A5), 0(SP)
	move.l -188(A5), 4(SP)
	move.l -184(A5), 8(SP)
	move.l -180(A5), 12(SP)
	move.l -176(A5), 16(SP)
	move.l -172(A5), 20(SP)
	move.l -168(A5), 24(SP)
	move.l -164(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#56 = "2. Multiplicar"
	move.l #'2. M', -224(A5)
	move.l #'ulti', -220(A5)
	move.l #'plic', -216(A5)
	move.b #'a', -212(A5)
	move.b #'r', -211(A5)
	move.b #0, -210(A5)

	;param t#56
	sub.l #32, SP
	move.l -224(A5), 0(SP)
	move.l -220(A5), 4(SP)
	move.l -216(A5), 8(SP)
	move.l -212(A5), 12(SP)
	move.l -208(A5), 16(SP)
	move.l -204(A5), 20(SP)
	move.l -200(A5), 24(SP)
	move.l -196(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#57 = "3. Dividir"
	move.l #'3. D', -256(A5)
	move.l #'ivid', -252(A5)
	move.b #'i', -248(A5)
	move.b #'r', -247(A5)
	move.b #0, -246(A5)

	;param t#57
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

	;t#58 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -260(A5)

	;opcion = t#58
	move.l -260(A5), -264(A5)

	;t#59 = 1
	move.l #1, -268(A5)

	;if opcion = t#59 goto L44
	move.l -264(A5), D0
	cmp.l -268(A5), D0
	beq.l L44

	;t#60 = FALSE
	move.w #FALSE, -270(A5)

	;goto: L45
	BRA L45
;L44: skip
L44:
	;t#60 = TRUE
	move.w #TRUE, -270(A5)

;L45: skip
L45:
	;if t#60 = FALSE goto L46
	move.w -270(A5), D0
	cmp.w #FALSE, D0
	beq.l L46

	;t#61 = "--Valor absoluto--"
	move.l #'--Va', -302(A5)
	move.l #'lor ', -298(A5)
	move.l #'abso', -294(A5)
	move.l #'luto', -290(A5)
	move.b #'-', -286(A5)
	move.b #'-', -285(A5)
	move.b #0, -284(A5)

	;param t#61
	sub.l #32, SP
	move.l -302(A5), 0(SP)
	move.l -298(A5), 4(SP)
	move.l -294(A5), 8(SP)
	move.l -290(A5), 12(SP)
	move.l -286(A5), 16(SP)
	move.l -282(A5), 20(SP)
	move.l -278(A5), 24(SP)
	move.l -274(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#62 = "Introduce valor:"
	move.l #'Intr', -334(A5)
	move.l #'oduc', -330(A5)
	move.l #'e va', -326(A5)
	move.l #'lor:', -322(A5)
	move.b #0, -318(A5)

	;param t#62
	sub.l #32, SP
	move.l -334(A5), 0(SP)
	move.l -330(A5), 4(SP)
	move.l -326(A5), 8(SP)
	move.l -322(A5), 12(SP)
	move.l -318(A5), 16(SP)
	move.l -314(A5), 20(SP)
	move.l -310(A5), 24(SP)
	move.l -306(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L1 return space
	sub.l #4, SP

	;READINT return space
	sub.l #4, SP

	;t#63 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -338(A5)

	;param t#63
	move.l -338(A5), -(SP)

	;t#64 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -342(A5)

	;param t#64
	move.l -342(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L46: skip
L46:
	;t#65 = 2
	move.l #2, -346(A5)

	;if opcion = t#65 goto L47
	move.l -264(A5), D0
	cmp.l -346(A5), D0
	beq.l L47

	;t#66 = FALSE
	move.w #FALSE, -348(A5)

	;goto: L48
	BRA L48
;L47: skip
L47:
	;t#66 = TRUE
	move.w #TRUE, -348(A5)

;L48: skip
L48:
	;if t#66 = FALSE goto L49
	move.w -348(A5), D0
	cmp.w #FALSE, D0
	beq.l L49

	;t#67 = "--Multiplicacion--"
	move.l #'--Mu', -380(A5)
	move.l #'ltip', -376(A5)
	move.l #'lica', -372(A5)
	move.l #'cion', -368(A5)
	move.b #'-', -364(A5)
	move.b #'-', -363(A5)
	move.b #0, -362(A5)

	;param t#67
	sub.l #32, SP
	move.l -380(A5), 0(SP)
	move.l -376(A5), 4(SP)
	move.l -372(A5), 8(SP)
	move.l -368(A5), 12(SP)
	move.l -364(A5), 16(SP)
	move.l -360(A5), 20(SP)
	move.l -356(A5), 24(SP)
	move.l -352(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#68 = "Introduce primer valor:"
	move.l #'Intr', -412(A5)
	move.l #'oduc', -408(A5)
	move.l #'e pr', -404(A5)
	move.l #'imer', -400(A5)
	move.l #' val', -396(A5)
	move.b #'o', -392(A5)
	move.b #'r', -391(A5)
	move.b #':', -390(A5)
	move.b #0, -389(A5)

	;param t#68
	sub.l #32, SP
	move.l -412(A5), 0(SP)
	move.l -408(A5), 4(SP)
	move.l -404(A5), 8(SP)
	move.l -400(A5), 12(SP)
	move.l -396(A5), 16(SP)
	move.l -392(A5), 20(SP)
	move.l -388(A5), 24(SP)
	move.l -384(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#69 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -416(A5)

	;val1 = t#69
	move.l -416(A5), -420(A5)

	;t#70 = "Introduce segundo valor:"
	move.l #'Intr', -452(A5)
	move.l #'oduc', -448(A5)
	move.l #'e se', -444(A5)
	move.l #'gund', -440(A5)
	move.l #'o va', -436(A5)
	move.l #'lor:', -432(A5)
	move.b #0, -428(A5)

	;param t#70
	sub.l #32, SP
	move.l -452(A5), 0(SP)
	move.l -448(A5), 4(SP)
	move.l -444(A5), 8(SP)
	move.l -440(A5), 12(SP)
	move.l -436(A5), 16(SP)
	move.l -432(A5), 20(SP)
	move.l -428(A5), 24(SP)
	move.l -424(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#71 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -456(A5)

	;val2 = t#71
	move.l -456(A5), -460(A5)

	;t#72 = "Resultado:"
	move.l #'Resu', -492(A5)
	move.l #'ltad', -488(A5)
	move.b #'o', -484(A5)
	move.b #':', -483(A5)
	move.b #0, -482(A5)

	;param t#72
	sub.l #32, SP
	move.l -492(A5), 0(SP)
	move.l -488(A5), 4(SP)
	move.l -484(A5), 8(SP)
	move.l -480(A5), 12(SP)
	move.l -476(A5), 16(SP)
	move.l -472(A5), 20(SP)
	move.l -468(A5), 24(SP)
	move.l -464(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L5 return space
	sub.l #4, SP

	;param val2
	move.l -460(A5), -(SP)

	;param val1
	move.l -420(A5), -(SP)

	;t#73 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -496(A5)

	;param t#73
	move.l -496(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L49: skip
L49:
	;t#74 = 3
	move.l #3, -500(A5)

	;if opcion = t#74 goto L50
	move.l -264(A5), D0
	cmp.l -500(A5), D0
	beq.l L50

	;t#75 = FALSE
	move.w #FALSE, -502(A5)

	;goto: L51
	BRA L51
;L50: skip
L50:
	;t#75 = TRUE
	move.w #TRUE, -502(A5)

;L51: skip
L51:
	;if t#75 = FALSE goto L52
	move.w -502(A5), D0
	cmp.w #FALSE, D0
	beq.l L52

	;t#76 = "--Division--"
	move.l #'--Di', -534(A5)
	move.l #'visi', -530(A5)
	move.l #'on--', -526(A5)
	move.b #0, -522(A5)

	;param t#76
	sub.l #32, SP
	move.l -534(A5), 0(SP)
	move.l -530(A5), 4(SP)
	move.l -526(A5), 8(SP)
	move.l -522(A5), 12(SP)
	move.l -518(A5), 16(SP)
	move.l -514(A5), 20(SP)
	move.l -510(A5), 24(SP)
	move.l -506(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#77 = "Introduce dividendo:"
	move.l #'Intr', -566(A5)
	move.l #'oduc', -562(A5)
	move.l #'e di', -558(A5)
	move.l #'vide', -554(A5)
	move.l #'ndo:', -550(A5)
	move.b #0, -546(A5)

	;param t#77
	sub.l #32, SP
	move.l -566(A5), 0(SP)
	move.l -562(A5), 4(SP)
	move.l -558(A5), 8(SP)
	move.l -554(A5), 12(SP)
	move.l -550(A5), 16(SP)
	move.l -546(A5), 20(SP)
	move.l -542(A5), 24(SP)
	move.l -538(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#78 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -570(A5)

	;val1 = t#78
	move.l -570(A5), -574(A5)

	;t#79 = "Introduce divisor:"
	move.l #'Intr', -606(A5)
	move.l #'oduc', -602(A5)
	move.l #'e di', -598(A5)
	move.l #'viso', -594(A5)
	move.b #'r', -590(A5)
	move.b #':', -589(A5)
	move.b #0, -588(A5)

	;param t#79
	sub.l #32, SP
	move.l -606(A5), 0(SP)
	move.l -602(A5), 4(SP)
	move.l -598(A5), 8(SP)
	move.l -594(A5), 12(SP)
	move.l -590(A5), 16(SP)
	move.l -586(A5), 20(SP)
	move.l -582(A5), 24(SP)
	move.l -578(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#80 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -610(A5)

	;val2 = t#80
	move.l -610(A5), -614(A5)

	;t#81 = "Resultado:"
	move.l #'Resu', -646(A5)
	move.l #'ltad', -642(A5)
	move.b #'o', -638(A5)
	move.b #':', -637(A5)
	move.b #0, -636(A5)

	;param t#81
	sub.l #32, SP
	move.l -646(A5), 0(SP)
	move.l -642(A5), 4(SP)
	move.l -638(A5), 8(SP)
	move.l -634(A5), 12(SP)
	move.l -630(A5), 16(SP)
	move.l -626(A5), 20(SP)
	move.l -622(A5), 24(SP)
	move.l -618(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L25 return space
	sub.l #4, SP

	;param val2
	move.l -614(A5), -(SP)

	;param val1
	move.l -574(A5), -(SP)

	;t#82 = call L25
	bsr.l L25
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -650(A5)

	;param t#82
	move.l -650(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L52: skip
L52:
	;t#83 = 0
	move.l #0, -654(A5)

	;if opcion = t#83 goto L53
	move.l -264(A5), D0
	cmp.l -654(A5), D0
	beq.l L53

	;t#84 = FALSE
	move.w #FALSE, -656(A5)

	;goto: L54
	BRA L54
;L53: skip
L53:
	;t#84 = TRUE
	move.w #TRUE, -656(A5)

;L54: skip
L54:
	;if t#84 = FALSE goto L55
	move.w -656(A5), D0
	cmp.w #FALSE, D0
	beq.l L55

	;continuar = FALSE
	move.w #FALSE, -2(A5)

	;t#86 = "Saliendo"
	move.l #'Sali', -688(A5)
	move.l #'endo', -684(A5)
	move.b #0, -680(A5)

	;param t#86
	sub.l #32, SP
	move.l -688(A5), 0(SP)
	move.l -684(A5), 4(SP)
	move.l -680(A5), 8(SP)
	move.l -676(A5), 12(SP)
	move.l -672(A5), 16(SP)
	move.l -668(A5), 20(SP)
	move.l -664(A5), 24(SP)
	move.l -660(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L55: skip
L55:
	;goto: L42
	BRA L42
;L43: skip
L43:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START