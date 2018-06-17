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
	sub.l #2, SP
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
	;t#85 save space in Stack
	sub.l #2, SP
	;t#86 save space in Stack
	sub.l #32, SP
	;t#0 = TRUE
	move.w #TRUE, -2(A5)

	;continuar = t#0
	move.w -2(A5), -4(A5)

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
	sub.l #46, SP

	;t#6 = 0
	move.l #0, -4(A6)

	;result = t#6
	move.l -4(A6), -8(A6)

	;t#7 = 0
	move.l #0, -12(A6)

	;count = t#7
	move.l -12(A6), -16(A6)

	;L1 return space
	sub.l #4, SP

	;param a
	move.l 8(A6), -(SP)

	;t#8 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -20(A6)

	;ax = t#8
	move.l -20(A6), -24(A6)

	;L1 return space
	sub.l #4, SP

	;param b
	move.l 12(A6), -(SP)

	;t#9 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -28(A6)

	;bx = t#9
	move.l -28(A6), -32(A6)

;L6: skip
L6:
	;if count < ax goto L8
	move.l -16(A6), D0
	cmp.l -24(A6), D0
	blt.l L8

	;t#10 = FALSE
	move.w #FALSE, -34(A6)

	;goto: L9
	BRA L9
;L8: skip
L8:
	;t#10 = TRUE
	move.w #TRUE, -34(A6)

;L9: skip
L9:
	;if t#10 = FALSE goto L7
	move.w -34(A6), D0
	cmp.w #FALSE, D0
	beq.l L7

	;t#11 = result + bx
	move.l -8(A6), D0
	add.l -32(A6), D0
	move.l D0,-38(A6)

	;result = t#11
	move.l -38(A6), -8(A6)

	;t#12 = 1
	move.l #1, -42(A6)

	;t#13 = count + t#12
	move.l -16(A6), D0
	add.l -42(A6), D0
	move.l D0,-46(A6)

	;count = t#13
	move.l -46(A6), -16(A6)

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
	move.l -8(A6), -(SP)

	;t#24 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -36(A5)

	;result = t#24
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
	sub.l #26, SP

	;t#25 = 0
	move.l #0, -4(A6)

	;Q = t#25
	move.l -4(A6), -8(A6)

	;R = N
	move.l 8(A6), -12(A6)

;L21: skip
L21:
	;if R >= D goto L23
	move.l -12(A6), D0
	cmp.l 12(A6), D0
	bge.l L23

	;t#26 = FALSE
	move.w #FALSE, -14(A6)

	;goto: L24
	BRA L24
;L23: skip
L23:
	;t#26 = TRUE
	move.w #TRUE, -14(A6)

;L24: skip
L24:
	;if t#26 = FALSE goto L22
	move.w -14(A6), D0
	cmp.w #FALSE, D0
	beq.l L22

	;t#27 = 1
	move.l #1, -18(A6)

	;t#28 = Q + t#27
	move.l -8(A6), D0
	add.l -18(A6), D0
	move.l D0,-22(A6)

	;Q = t#28
	move.l -22(A6), -8(A6)

	;t#29 = R - D
	move.l -12(A6), D0
	sub.l 12(A6), D0
	move.l D0,-26(A6)

	;R = t#29
	move.l -26(A6), -12(A6)

	;goto: L21
	BRA L21
;L22: skip
L22:
	;return Q
	;send return value
	move.l -8(A6), 16(A6)
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
	sub.l #50, SP

	;t#30 = 0
	move.l #0, -8(A6)

	;RESULT = t#30
	move.l -8(A6), -12(A6)

	;t#31 = 0
	move.l #0, -16(A6)

	;if D = t#31 goto L26
	move.l 12(A6), D0
	cmp.l -16(A6), D0
	beq.l L26

	;t#32 = FALSE
	move.w #FALSE, -18(A6)

	;goto: L27
	BRA L27
;L26: skip
L26:
	;t#32 = TRUE
	move.w #TRUE, -18(A6)

;L27: skip
L27:
	;if t#32 = FALSE goto L28
	move.w -18(A6), D0
	cmp.w #FALSE, D0
	beq.l L28

	;t#33 = "Division by 0"
	move.l #'Divi', -50(A6)
	move.l #'sion', -46(A6)
	move.l #' by ', -42(A6)
	move.b #'0', -38(A6)
	move.b #0, -37(A6)

	;param t#33
	sub.l #32, SP
	move.l -50(A6), 0(SP)
	move.l -46(A6), 4(SP)
	move.l -42(A6), 8(SP)
	move.l -38(A6), 12(SP)
	move.l -34(A6), 16(SP)
	move.l -30(A6), 20(SP)
	move.l -26(A6), 24(SP)
	move.l -22(A6), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L28: skip
L28:
	;t#34 = 0
	move.l #0, -40(A5)

	;if D < t#34 goto L29
	move.l 12(A6), D0
	cmp.l -40(A5), D0
	blt.l L29

	;t#35 = FALSE
	move.w #FALSE, -42(A5)

	;goto: L30
	BRA L30
;L29: skip
L29:
	;t#35 = TRUE
	move.w #TRUE, -42(A5)

;L30: skip
L30:
	;if t#35 = FALSE goto L31
	move.w -42(A5), D0
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
	move.l (SP)+, -46(A5)

	;param t#36
	move.l -46(A5), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;t#37 = call L25
	bsr.l L25
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -50(A5)

	;Q = t#37
	move.l -50(A5), -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;t#38 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -54(A5)

	;RESULT = t#38
	move.l -54(A5), -12(A6)

;L31: skip
L31:
	;t#39 = 0
	move.l #0, -58(A5)

	;if N < t#39 goto L32
	move.l 8(A6), D0
	cmp.l -58(A5), D0
	blt.l L32

	;t#40 = FALSE
	move.w #FALSE, -60(A5)

	;goto: L33
	BRA L33
;L32: skip
L32:
	;t#40 = TRUE
	move.w #TRUE, -60(A5)

;L33: skip
L33:
	;t#41 = 0
	move.l #0, -64(A5)

	;if D > t#41 goto L34
	move.l 12(A6), D0
	cmp.l -64(A5), D0
	bgt.l L34

	;t#42 = FALSE
	move.w #FALSE, -66(A5)

	;goto: L35
	BRA L35
;L34: skip
L34:
	;t#42 = TRUE
	move.w #TRUE, -66(A5)

;L35: skip
L35:
	;t#43 = t#40 & t#42
	move.w -60(A5), D0
	and.w -66(A5), D0
	move.w D0,-68(A5)

	;if t#43 = FALSE goto L36
	move.w -68(A5), D0
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
	move.l (SP)+, -72(A5)

	;param D
	move.l 12(A6), -(SP)

	;param t#44
	move.l -72(A5), -(SP)

	;t#45 = call L25
	bsr.l L25
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -76(A5)

	;Q = t#45
	move.l -76(A5), -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;t#46 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -80(A5)

	;RESULT = t#46
	move.l -80(A5), -12(A6)

;L36: skip
L36:
	;t#47 = 0
	move.l #0, -84(A5)

	;if N >= t#47 goto L37
	move.l 8(A6), D0
	cmp.l -84(A5), D0
	bge.l L37

	;t#48 = FALSE
	move.w #FALSE, -86(A5)

	;goto: L38
	BRA L38
;L37: skip
L37:
	;t#48 = TRUE
	move.w #TRUE, -86(A5)

;L38: skip
L38:
	;t#49 = 0
	move.l #0, -90(A5)

	;if D > t#49 goto L39
	move.l 12(A6), D0
	cmp.l -90(A5), D0
	bgt.l L39

	;t#50 = FALSE
	move.w #FALSE, -92(A5)

	;goto: L40
	BRA L40
;L39: skip
L39:
	;t#50 = TRUE
	move.w #TRUE, -92(A5)

;L40: skip
L40:
	;t#51 = t#48 & t#50
	move.w -86(A5), D0
	and.w -92(A5), D0
	move.w D0,-94(A5)

	;if t#51 = FALSE goto L41
	move.w -94(A5), D0
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
	move.l (SP)+, -98(A5)

	;RESULT = t#52
	move.l -98(A5), -12(A6)

;L41: skip
L41:
	;return RESULT
	;send return value
	move.l -12(A6), 16(A6)
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
	move.w -4(A5), D0
	cmp.w #FALSE, D0
	beq.l L43

	;t#53 = "<------Calculadora------>"
	move.l #'<---', -130(A5)
	move.l #'---C', -126(A5)
	move.l #'alcu', -122(A5)
	move.l #'lado', -118(A5)
	move.l #'ra--', -114(A5)
	move.l #'----', -110(A5)
	move.b #'>', -106(A5)
	move.b #0, -105(A5)

	;param t#53
	sub.l #32, SP
	move.l -130(A5), 0(SP)
	move.l -126(A5), 4(SP)
	move.l -122(A5), 8(SP)
	move.l -118(A5), 12(SP)
	move.l -114(A5), 16(SP)
	move.l -110(A5), 20(SP)
	move.l -106(A5), 24(SP)
	move.l -102(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#54 = "0. Salir"
	move.l #'0. S', -162(A5)
	move.l #'alir', -158(A5)
	move.b #0, -154(A5)

	;param t#54
	sub.l #32, SP
	move.l -162(A5), 0(SP)
	move.l -158(A5), 4(SP)
	move.l -154(A5), 8(SP)
	move.l -150(A5), 12(SP)
	move.l -146(A5), 16(SP)
	move.l -142(A5), 20(SP)
	move.l -138(A5), 24(SP)
	move.l -134(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#55 = "1. Valor absoluto"
	move.l #'1. V', -194(A5)
	move.l #'alor', -190(A5)
	move.l #' abs', -186(A5)
	move.l #'olut', -182(A5)
	move.b #'o', -178(A5)
	move.b #0, -177(A5)

	;param t#55
	sub.l #32, SP
	move.l -194(A5), 0(SP)
	move.l -190(A5), 4(SP)
	move.l -186(A5), 8(SP)
	move.l -182(A5), 12(SP)
	move.l -178(A5), 16(SP)
	move.l -174(A5), 20(SP)
	move.l -170(A5), 24(SP)
	move.l -166(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#56 = "2. Multiplicar"
	move.l #'2. M', -226(A5)
	move.l #'ulti', -222(A5)
	move.l #'plic', -218(A5)
	move.b #'a', -214(A5)
	move.b #'r', -213(A5)
	move.b #0, -212(A5)

	;param t#56
	sub.l #32, SP
	move.l -226(A5), 0(SP)
	move.l -222(A5), 4(SP)
	move.l -218(A5), 8(SP)
	move.l -214(A5), 12(SP)
	move.l -210(A5), 16(SP)
	move.l -206(A5), 20(SP)
	move.l -202(A5), 24(SP)
	move.l -198(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#57 = "3. Dividir"
	move.l #'3. D', -258(A5)
	move.l #'ivid', -254(A5)
	move.b #'i', -250(A5)
	move.b #'r', -249(A5)
	move.b #0, -248(A5)

	;param t#57
	sub.l #32, SP
	move.l -258(A5), 0(SP)
	move.l -254(A5), 4(SP)
	move.l -250(A5), 8(SP)
	move.l -246(A5), 12(SP)
	move.l -242(A5), 16(SP)
	move.l -238(A5), 20(SP)
	move.l -234(A5), 24(SP)
	move.l -230(A5), 28(SP)

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
	move.l (SP)+, -262(A5)

	;opcion = t#58
	move.l -262(A5), -266(A5)

	;t#59 = 1
	move.l #1, -270(A5)

	;if opcion = t#59 goto L44
	move.l -266(A5), D0
	cmp.l -270(A5), D0
	beq.l L44

	;t#60 = FALSE
	move.w #FALSE, -272(A5)

	;goto: L45
	BRA L45
;L44: skip
L44:
	;t#60 = TRUE
	move.w #TRUE, -272(A5)

;L45: skip
L45:
	;if t#60 = FALSE goto L46
	move.w -272(A5), D0
	cmp.w #FALSE, D0
	beq.l L46

	;t#61 = "--Valor absoluto--"
	move.l #'--Va', -304(A5)
	move.l #'lor ', -300(A5)
	move.l #'abso', -296(A5)
	move.l #'luto', -292(A5)
	move.b #'-', -288(A5)
	move.b #'-', -287(A5)
	move.b #0, -286(A5)

	;param t#61
	sub.l #32, SP
	move.l -304(A5), 0(SP)
	move.l -300(A5), 4(SP)
	move.l -296(A5), 8(SP)
	move.l -292(A5), 12(SP)
	move.l -288(A5), 16(SP)
	move.l -284(A5), 20(SP)
	move.l -280(A5), 24(SP)
	move.l -276(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#62 = "Introduce valor:"
	move.l #'Intr', -336(A5)
	move.l #'oduc', -332(A5)
	move.l #'e va', -328(A5)
	move.l #'lor:', -324(A5)
	move.b #0, -320(A5)

	;param t#62
	sub.l #32, SP
	move.l -336(A5), 0(SP)
	move.l -332(A5), 4(SP)
	move.l -328(A5), 8(SP)
	move.l -324(A5), 12(SP)
	move.l -320(A5), 16(SP)
	move.l -316(A5), 20(SP)
	move.l -312(A5), 24(SP)
	move.l -308(A5), 28(SP)

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
	move.l (SP)+, -340(A5)

	;param t#63
	move.l -340(A5), -(SP)

	;t#64 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -344(A5)

	;param t#64
	move.l -344(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L46: skip
L46:
	;t#65 = 2
	move.l #2, -348(A5)

	;if opcion = t#65 goto L47
	move.l -266(A5), D0
	cmp.l -348(A5), D0
	beq.l L47

	;t#66 = FALSE
	move.w #FALSE, -350(A5)

	;goto: L48
	BRA L48
;L47: skip
L47:
	;t#66 = TRUE
	move.w #TRUE, -350(A5)

;L48: skip
L48:
	;if t#66 = FALSE goto L49
	move.w -350(A5), D0
	cmp.w #FALSE, D0
	beq.l L49

	;t#67 = "--Multiplicacion--"
	move.l #'--Mu', -382(A5)
	move.l #'ltip', -378(A5)
	move.l #'lica', -374(A5)
	move.l #'cion', -370(A5)
	move.b #'-', -366(A5)
	move.b #'-', -365(A5)
	move.b #0, -364(A5)

	;param t#67
	sub.l #32, SP
	move.l -382(A5), 0(SP)
	move.l -378(A5), 4(SP)
	move.l -374(A5), 8(SP)
	move.l -370(A5), 12(SP)
	move.l -366(A5), 16(SP)
	move.l -362(A5), 20(SP)
	move.l -358(A5), 24(SP)
	move.l -354(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#68 = "Introduce primer valor:"
	move.l #'Intr', -414(A5)
	move.l #'oduc', -410(A5)
	move.l #'e pr', -406(A5)
	move.l #'imer', -402(A5)
	move.l #' val', -398(A5)
	move.b #'o', -394(A5)
	move.b #'r', -393(A5)
	move.b #':', -392(A5)
	move.b #0, -391(A5)

	;param t#68
	sub.l #32, SP
	move.l -414(A5), 0(SP)
	move.l -410(A5), 4(SP)
	move.l -406(A5), 8(SP)
	move.l -402(A5), 12(SP)
	move.l -398(A5), 16(SP)
	move.l -394(A5), 20(SP)
	move.l -390(A5), 24(SP)
	move.l -386(A5), 28(SP)

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
	move.l (SP)+, -418(A5)

	;val1 = t#69
	move.l -418(A5), -422(A5)

	;t#70 = "Introduce segundo valor:"
	move.l #'Intr', -454(A5)
	move.l #'oduc', -450(A5)
	move.l #'e se', -446(A5)
	move.l #'gund', -442(A5)
	move.l #'o va', -438(A5)
	move.l #'lor:', -434(A5)
	move.b #0, -430(A5)

	;param t#70
	sub.l #32, SP
	move.l -454(A5), 0(SP)
	move.l -450(A5), 4(SP)
	move.l -446(A5), 8(SP)
	move.l -442(A5), 12(SP)
	move.l -438(A5), 16(SP)
	move.l -434(A5), 20(SP)
	move.l -430(A5), 24(SP)
	move.l -426(A5), 28(SP)

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
	move.l (SP)+, -458(A5)

	;val2 = t#71
	move.l -458(A5), -462(A5)

	;t#72 = "Resultado:"
	move.l #'Resu', -494(A5)
	move.l #'ltad', -490(A5)
	move.b #'o', -486(A5)
	move.b #':', -485(A5)
	move.b #0, -484(A5)

	;param t#72
	sub.l #32, SP
	move.l -494(A5), 0(SP)
	move.l -490(A5), 4(SP)
	move.l -486(A5), 8(SP)
	move.l -482(A5), 12(SP)
	move.l -478(A5), 16(SP)
	move.l -474(A5), 20(SP)
	move.l -470(A5), 24(SP)
	move.l -466(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L5 return space
	sub.l #4, SP

	;param val2
	move.l -462(A5), -(SP)

	;param val1
	move.l -422(A5), -(SP)

	;t#73 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -498(A5)

	;param t#73
	move.l -498(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L49: skip
L49:
	;t#74 = 3
	move.l #3, -502(A5)

	;if opcion = t#74 goto L50
	move.l -266(A5), D0
	cmp.l -502(A5), D0
	beq.l L50

	;t#75 = FALSE
	move.w #FALSE, -504(A5)

	;goto: L51
	BRA L51
;L50: skip
L50:
	;t#75 = TRUE
	move.w #TRUE, -504(A5)

;L51: skip
L51:
	;if t#75 = FALSE goto L52
	move.w -504(A5), D0
	cmp.w #FALSE, D0
	beq.l L52

	;t#76 = "--Division--"
	move.l #'--Di', -536(A5)
	move.l #'visi', -532(A5)
	move.l #'on--', -528(A5)
	move.b #0, -524(A5)

	;param t#76
	sub.l #32, SP
	move.l -536(A5), 0(SP)
	move.l -532(A5), 4(SP)
	move.l -528(A5), 8(SP)
	move.l -524(A5), 12(SP)
	move.l -520(A5), 16(SP)
	move.l -516(A5), 20(SP)
	move.l -512(A5), 24(SP)
	move.l -508(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#77 = "Introduce dividendo:"
	move.l #'Intr', -568(A5)
	move.l #'oduc', -564(A5)
	move.l #'e di', -560(A5)
	move.l #'vide', -556(A5)
	move.l #'ndo:', -552(A5)
	move.b #0, -548(A5)

	;param t#77
	sub.l #32, SP
	move.l -568(A5), 0(SP)
	move.l -564(A5), 4(SP)
	move.l -560(A5), 8(SP)
	move.l -556(A5), 12(SP)
	move.l -552(A5), 16(SP)
	move.l -548(A5), 20(SP)
	move.l -544(A5), 24(SP)
	move.l -540(A5), 28(SP)

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
	move.l (SP)+, -572(A5)

	;val1 = t#78
	move.l -572(A5), -576(A5)

	;t#79 = "Introduce divisor:"
	move.l #'Intr', -608(A5)
	move.l #'oduc', -604(A5)
	move.l #'e di', -600(A5)
	move.l #'viso', -596(A5)
	move.b #'r', -592(A5)
	move.b #':', -591(A5)
	move.b #0, -590(A5)

	;param t#79
	sub.l #32, SP
	move.l -608(A5), 0(SP)
	move.l -604(A5), 4(SP)
	move.l -600(A5), 8(SP)
	move.l -596(A5), 12(SP)
	move.l -592(A5), 16(SP)
	move.l -588(A5), 20(SP)
	move.l -584(A5), 24(SP)
	move.l -580(A5), 28(SP)

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
	move.l (SP)+, -612(A5)

	;val2 = t#80
	move.l -612(A5), -616(A5)

	;t#81 = "Resultado:"
	move.l #'Resu', -648(A5)
	move.l #'ltad', -644(A5)
	move.b #'o', -640(A5)
	move.b #':', -639(A5)
	move.b #0, -638(A5)

	;param t#81
	sub.l #32, SP
	move.l -648(A5), 0(SP)
	move.l -644(A5), 4(SP)
	move.l -640(A5), 8(SP)
	move.l -636(A5), 12(SP)
	move.l -632(A5), 16(SP)
	move.l -628(A5), 20(SP)
	move.l -624(A5), 24(SP)
	move.l -620(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L25 return space
	sub.l #4, SP

	;param val2
	move.l -616(A5), -(SP)

	;param val1
	move.l -576(A5), -(SP)

	;t#82 = call L25
	bsr.l L25
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -652(A5)

	;param t#82
	move.l -652(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L52: skip
L52:
	;t#83 = 0
	move.l #0, -656(A5)

	;if opcion = t#83 goto L53
	move.l -266(A5), D0
	cmp.l -656(A5), D0
	beq.l L53

	;t#84 = FALSE
	move.w #FALSE, -658(A5)

	;goto: L54
	BRA L54
;L53: skip
L53:
	;t#84 = TRUE
	move.w #TRUE, -658(A5)

;L54: skip
L54:
	;if t#84 = FALSE goto L55
	move.w -658(A5), D0
	cmp.w #FALSE, D0
	beq.l L55

	;t#85 = FALSE
	move.w #FALSE, -660(A5)

	;continuar = t#85
	move.w -660(A5), -4(A5)

	;t#86 = "Saliendo"
	move.l #'Sali', -692(A5)
	move.l #'endo', -688(A5)
	move.b #0, -684(A5)

	;param t#86
	sub.l #32, SP
	move.l -692(A5), 0(SP)
	move.l -688(A5), 4(SP)
	move.l -684(A5), 8(SP)
	move.l -680(A5), 12(SP)
	move.l -676(A5), 16(SP)
	move.l -672(A5), 20(SP)
	move.l -668(A5), 24(SP)
	move.l -664(A5), 28(SP)

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