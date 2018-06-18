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
	;t#35 save space in Stack
	sub.l #4, SP
	;t#36 save space in Stack
	sub.l #2, SP
	;t#37 save space in Stack
	sub.l #4, SP
	;t#40 save space in Stack
	sub.l #4, SP
	;t#41 save space in Stack
	sub.l #2, SP
	;t#42 save space in Stack
	sub.l #4, SP
	;t#43 save space in Stack
	sub.l #2, SP
	;t#44 save space in Stack
	sub.l #2, SP
	;t#45 save space in Stack
	sub.l #4, SP
	;t#48 save space in Stack
	sub.l #4, SP
	;t#49 save space in Stack
	sub.l #2, SP
	;t#50 save space in Stack
	sub.l #4, SP
	;t#51 save space in Stack
	sub.l #2, SP
	;t#52 save space in Stack
	sub.l #2, SP
	;t#64 save space in Stack
	sub.l #4, SP
	;t#65 save space in Stack
	sub.l #4, SP
	;t#66 save space in Stack
	sub.l #4, SP
	;t#67 save space in Stack
	sub.l #2, SP
	;t#68 save space in Stack
	sub.l #4, SP
	;t#69 save space in Stack
	sub.l #4, SP
	;t#70 save space in Stack
	sub.l #4, SP
	;t#71 save space in Stack
	sub.l #2, SP
	;t#72 save space in Stack
	sub.l #2, SP
	;i save space in Stack
	sub.l #4, SP
	;w save space in Stack
	sub.l #4, SP
	;t#76 save space in Stack
	sub.l #4, SP
	;t#77 save space in Stack
	sub.l #2, SP
	;t#78 save space in Stack
	sub.l #4, SP
	;t#79 save space in Stack
	sub.l #4, SP
	;t#80 save space in Stack
	sub.l #2, SP
	;t#83 save space in Stack
	sub.l #4, SP
	;t#88 save space in Stack
	sub.l #4, SP
	;t#89 save space in Stack
	sub.l #2, SP
	;t#90 save space in Stack
	sub.l #4, SP
	;t#91 save space in Stack
	sub.l #4, SP
	;t#92 save space in Stack
	sub.l #4, SP
	;t#94 save space in Stack
	sub.l #32, SP
	;t#95 save space in Stack
	sub.l #32, SP
	;t#96 save space in Stack
	sub.l #32, SP
	;t#97 save space in Stack
	sub.l #32, SP
	;t#98 save space in Stack
	sub.l #32, SP
	;t#99 save space in Stack
	sub.l #32, SP
	;t#100 save space in Stack
	sub.l #32, SP
	;opcion save space in Stack
	sub.l #4, SP
	;t#102 save space in Stack
	sub.l #4, SP
	;t#103 save space in Stack
	sub.l #2, SP
	;t#104 save space in Stack
	sub.l #32, SP
	;t#105 save space in Stack
	sub.l #32, SP
	;t#106 save space in Stack
	sub.l #4, SP
	;t#107 save space in Stack
	sub.l #4, SP
	;t#108 save space in Stack
	sub.l #4, SP
	;t#109 save space in Stack
	sub.l #2, SP
	;t#110 save space in Stack
	sub.l #32, SP
	;t#111 save space in Stack
	sub.l #32, SP
	;val1 save space in Stack
	sub.l #4, SP
	;t#113 save space in Stack
	sub.l #32, SP
	;val2 save space in Stack
	sub.l #4, SP
	;t#115 save space in Stack
	sub.l #32, SP
	;t#116 save space in Stack
	sub.l #4, SP
	;t#117 save space in Stack
	sub.l #4, SP
	;t#118 save space in Stack
	sub.l #2, SP
	;t#119 save space in Stack
	sub.l #32, SP
	;t#120 save space in Stack
	sub.l #32, SP
	;val1 save space in Stack
	sub.l #4, SP
	;t#122 save space in Stack
	sub.l #32, SP
	;val2 save space in Stack
	sub.l #4, SP
	;t#124 save space in Stack
	sub.l #32, SP
	;t#125 save space in Stack
	sub.l #4, SP
	;t#126 save space in Stack
	sub.l #4, SP
	;t#127 save space in Stack
	sub.l #2, SP
	;t#128 save space in Stack
	sub.l #32, SP
	;t#129 save space in Stack
	sub.l #32, SP
	;t#130 save space in Stack
	sub.l #4, SP
	;esPrimo save space in Stack
	sub.l #2, SP
	;t#132 save space in Stack
	sub.l #32, SP
	;t#133 save space in Stack
	sub.l #2, SP
	;t#134 save space in Stack
	sub.l #2, SP
	;t#135 save space in Stack
	sub.l #32, SP
	;t#136 save space in Stack
	sub.l #2, SP
	;t#137 save space in Stack
	sub.l #2, SP
	;t#138 save space in Stack
	sub.l #32, SP
	;t#139 save space in Stack
	sub.l #4, SP
	;t#140 save space in Stack
	sub.l #2, SP
	;t#141 save space in Stack
	sub.l #32, SP
	;t#142 save space in Stack
	sub.l #32, SP
	;entrada save space in Stack
	sub.l #4, SP
	;t#144 save space in Stack
	sub.l #4, SP
	;t#145 save space in Stack
	sub.l #2, SP
	;result save space in Stack
	sub.l #4, SP
	;t#147 save space in Stack
	sub.l #32, SP
	;t#148 save space in Stack
	sub.l #4, SP
	;t#149 save space in Stack
	sub.l #2, SP
	;t#150 save space in Stack
	sub.l #32, SP
	;t#151 save space in Stack
	sub.l #4, SP
	;t#152 save space in Stack
	sub.l #2, SP
	;t#154 save space in Stack
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
	sub.l #4, SP

	;L5 return space
	sub.l #4, SP

	;param n
	move.l 8(A6), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#25 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -4(A6)

	;return t#25
	;send return value
	move.l -4(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L21: skip
L21:
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

;L22: skip
L22:
	;if R >= D goto L24
	move.l -8(A6), D0
	cmp.l 12(A6), D0
	bge.l L24

	;t#27 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L25
	BRA L25
;L24: skip
L24:
	;t#27 = TRUE
	move.w #TRUE, -10(A6)

;L25: skip
L25:
	;if t#27 = FALSE goto L23
	move.w -10(A6), D0
	cmp.w #FALSE, D0
	beq.l L23

	;t#28 = 1
	move.l #1, -14(A6)

	;Q = Q + t#28
	move.l -4(A6), D0
	add.l -14(A6), D0
	move.l D0,-4(A6)

	;R = R - D
	move.l -8(A6), D0
	sub.l 12(A6), D0
	move.l D0,-8(A6)

	;goto: L22
	BRA L22
;L23: skip
L23:
	;return Q
	;send return value
	move.l -4(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L26: skip
L26:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #46, SP

	;RESULT = 0
	move.l #0, -8(A6)

	;t#32 = 0
	move.l #0, -12(A6)

	;if D = t#32 goto L27
	move.l 12(A6), D0
	cmp.l -12(A6), D0
	beq.l L27

	;t#33 = FALSE
	move.w #FALSE, -14(A6)

	;goto: L28
	BRA L28
;L27: skip
L27:
	;t#33 = TRUE
	move.w #TRUE, -14(A6)

;L28: skip
L28:
	;if t#33 = FALSE goto L29
	move.w -14(A6), D0
	cmp.w #FALSE, D0
	beq.l L29

	;t#34 = "Division by 0"
	move.l #'Divi', -46(A6)
	move.l #'sion', -42(A6)
	move.l #' by ', -38(A6)
	move.b #'0', -34(A6)
	move.b #0, -33(A6)

	;param t#34
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

;L29: skip
L29:
	;t#35 = 0
	move.l #0, -34(A5)

	;if D < t#35 goto L30
	move.l 12(A6), D0
	cmp.l -34(A5), D0
	blt.l L30

	;t#36 = FALSE
	move.w #FALSE, -36(A5)

	;goto: L31
	BRA L31
;L30: skip
L30:
	;t#36 = TRUE
	move.w #TRUE, -36(A5)

;L31: skip
L31:
	;if t#36 = FALSE goto L32
	move.w -36(A5), D0
	cmp.w #FALSE, D0
	beq.l L32

	;L26 return space
	sub.l #4, SP

	;L0 return space
	sub.l #4, SP

	;param D
	move.l 12(A6), -(SP)

	;t#37 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -40(A5)

	;param t#37
	move.l -40(A5), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;Q = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;RESULT = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -8(A6)

;L32: skip
L32:
	;t#40 = 0
	move.l #0, -44(A5)

	;if N < t#40 goto L33
	move.l 8(A6), D0
	cmp.l -44(A5), D0
	blt.l L33

	;t#41 = FALSE
	move.w #FALSE, -46(A5)

	;goto: L34
	BRA L34
;L33: skip
L33:
	;t#41 = TRUE
	move.w #TRUE, -46(A5)

;L34: skip
L34:
	;t#42 = 0
	move.l #0, -50(A5)

	;if D > t#42 goto L35
	move.l 12(A6), D0
	cmp.l -50(A5), D0
	bgt.l L35

	;t#43 = FALSE
	move.w #FALSE, -52(A5)

	;goto: L36
	BRA L36
;L35: skip
L35:
	;t#43 = TRUE
	move.w #TRUE, -52(A5)

;L36: skip
L36:
	;t#44 = t#41 & t#43
	move.w -46(A5), D0
	and.w -52(A5), D0
	move.w D0,-54(A5)

	;if t#44 = FALSE goto L37
	move.w -54(A5), D0
	cmp.w #FALSE, D0
	beq.l L37

	;L26 return space
	sub.l #4, SP

	;L0 return space
	sub.l #4, SP

	;param N
	move.l 8(A6), -(SP)

	;t#45 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -58(A5)

	;param D
	move.l 12(A6), -(SP)

	;param t#45
	move.l -58(A5), -(SP)

	;Q = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;RESULT = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -8(A6)

;L37: skip
L37:
	;t#48 = 0
	move.l #0, -62(A5)

	;if N >= t#48 goto L38
	move.l 8(A6), D0
	cmp.l -62(A5), D0
	bge.l L38

	;t#49 = FALSE
	move.w #FALSE, -64(A5)

	;goto: L39
	BRA L39
;L38: skip
L38:
	;t#49 = TRUE
	move.w #TRUE, -64(A5)

;L39: skip
L39:
	;t#50 = 0
	move.l #0, -68(A5)

	;if D > t#50 goto L40
	move.l 12(A6), D0
	cmp.l -68(A5), D0
	bgt.l L40

	;t#51 = FALSE
	move.w #FALSE, -70(A5)

	;goto: L41
	BRA L41
;L40: skip
L40:
	;t#51 = TRUE
	move.w #TRUE, -70(A5)

;L41: skip
L41:
	;t#52 = t#49 & t#51
	move.w -64(A5), D0
	and.w -70(A5), D0
	move.w D0,-72(A5)

	;if t#52 = FALSE goto L42
	move.w -72(A5), D0
	cmp.w #FALSE, D0
	beq.l L42

	;L21 return space
	sub.l #4, SP

	;param D
	move.l 12(A6), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;RESULT = call L21
	bsr.l L21
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -8(A6)

;L42: skip
L42:
	;return RESULT
	;send return value
	move.l -8(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L43: skip
L43:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #12, SP

	;L5 return space
	sub.l #4, SP

	;L26 return space
	sub.l #4, SP

	;param b
	move.l 12(A6), -(SP)

	;param a
	move.l 8(A6), -(SP)

	;t#54 = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -4(A6)

	;param t#54
	move.l -4(A6), -(SP)

	;param b
	move.l 12(A6), -(SP)

	;t#55 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -8(A6)

	;t#56 = a - t#55
	move.l 8(A6), D0
	sub.l -8(A6), D0
	move.l D0,-12(A6)

	;return t#56
	;send return value
	move.l -12(A6), 16(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L44: skip
L44:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #16, SP

	;result = TRUE
	move.w #TRUE, -2(A6)

	;t#58 = 2
	move.l #2, -6(A6)

	;if n = t#58 goto L45
	move.l 8(A6), D0
	cmp.l -6(A6), D0
	beq.l L45

	;t#59 = FALSE
	move.w #FALSE, -8(A6)

	;goto: L46
	BRA L46
;L45: skip
L45:
	;t#59 = TRUE
	move.w #TRUE, -8(A6)

;L46: skip
L46:
	;t#60 = 3
	move.l #3, -12(A6)

	;if n = t#60 goto L47
	move.l 8(A6), D0
	cmp.l -12(A6), D0
	beq.l L47

	;t#61 = FALSE
	move.w #FALSE, -14(A6)

	;goto: L48
	BRA L48
;L47: skip
L47:
	;t#61 = TRUE
	move.w #TRUE, -14(A6)

;L48: skip
L48:
	;t#62 = t#59 | t#61
	move.w -8(A6), D0
	or.w -14(A6), D0
	move.w D0,-16(A6)

	;if t#62 = FALSE goto L49
	move.w -16(A6), D0
	cmp.w #FALSE, D0
	beq.l L49

	;result = TRUE
	move.w #TRUE, -2(A6)

;L49: skip
L49:
	;t#66 = 0
	move.l #0, -84(A5)

	;L43 return space
	sub.l #4, SP

	;t#64 = 2
	move.l #2, -76(A5)

	;param t#64
	move.l -76(A5), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#65 = call L43
	bsr.l L43
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -80(A5)

	;if t#65 = t#66 goto L50
	move.l -80(A5), D0
	cmp.l -84(A5), D0
	beq.l L50

	;t#67 = FALSE
	move.w #FALSE, -86(A5)

	;goto: L51
	BRA L51
;L50: skip
L50:
	;t#67 = TRUE
	move.w #TRUE, -86(A5)

;L51: skip
L51:
	;t#70 = 0
	move.l #0, -98(A5)

	;L43 return space
	sub.l #4, SP

	;t#68 = 3
	move.l #3, -90(A5)

	;param t#68
	move.l -90(A5), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#69 = call L43
	bsr.l L43
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -94(A5)

	;if t#69 = t#70 goto L52
	move.l -94(A5), D0
	cmp.l -98(A5), D0
	beq.l L52

	;t#71 = FALSE
	move.w #FALSE, -100(A5)

	;goto: L53
	BRA L53
;L52: skip
L52:
	;t#71 = TRUE
	move.w #TRUE, -100(A5)

;L53: skip
L53:
	;t#72 = t#67 | t#71
	move.w -86(A5), D0
	or.w -100(A5), D0
	move.w D0,-102(A5)

	;if t#72 = FALSE goto L54
	move.w -102(A5), D0
	cmp.w #FALSE, D0
	beq.l L54

	;result = FALSE
	move.w #FALSE, -2(A6)

;L54: skip
L54:
	;i = 5
	move.l #5, -106(A5)

	;w = 2
	move.l #2, -110(A5)

;L55: skip
L55:
	;L20 return space
	sub.l #4, SP

	;param i
	move.l -106(A5), -(SP)

	;t#76 = call L20
	bsr.l L20
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -114(A5)

	;if t#76 <= n goto L57
	move.l -114(A5), D0
	cmp.l 8(A6), D0
	ble.l L57

	;t#77 = FALSE
	move.w #FALSE, -116(A5)

	;goto: L58
	BRA L58
;L57: skip
L57:
	;t#77 = TRUE
	move.w #TRUE, -116(A5)

;L58: skip
L58:
	;if t#77 = FALSE goto L56
	move.w -116(A5), D0
	cmp.w #FALSE, D0
	beq.l L56

	;t#79 = 0
	move.l #0, -124(A5)

	;L43 return space
	sub.l #4, SP

	;param i
	move.l -106(A5), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#78 = call L43
	bsr.l L43
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -120(A5)

	;if t#78 = t#79 goto L59
	move.l -120(A5), D0
	cmp.l -124(A5), D0
	beq.l L59

	;t#80 = FALSE
	move.w #FALSE, -126(A5)

	;goto: L60
	BRA L60
;L59: skip
L59:
	;t#80 = TRUE
	move.w #TRUE, -126(A5)

;L60: skip
L60:
	;if t#80 = FALSE goto L61
	move.w -126(A5), D0
	cmp.w #FALSE, D0
	beq.l L61

	;result = FALSE
	move.w #FALSE, -2(A6)

;L61: skip
L61:
	;i = i + w
	move.l -106(A5), D0
	add.l -110(A5), D0
	move.l D0,-106(A5)

	;t#83 = 6
	move.l #6, -130(A5)

	;w = t#83 - w
	move.l -130(A5), D0
	sub.l -110(A5), D0
	move.l D0,-110(A5)

	;goto: L55
	BRA L55
;L56: skip
L56:
	;return result
	;send return value
	move.w -2(A6), 12(A6)
	;prepare SP
	move.l A6, SP
	;restore BP
	move.l (SP)+, A6
	;give control to caller
	rts

;L62: skip
L62:
	;preambulo
	;save BP
	move.l A6, -(SP)
	;set BP
	move.l SP, A6
	;save space for local vars
	sub.l #10, SP

	;t#85 = 0
	move.l #0, -8(A6)

	;if i = t#85 goto L63
	move.l 8(A6), D0
	cmp.l -8(A6), D0
	beq.l L63

	;t#86 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L64
	BRA L64
;L63: skip
L63:
	;t#86 = TRUE
	move.w #TRUE, -10(A6)

;L64: skip
L64:
	;if t#86 = FALSE goto L65
	move.w -10(A6), D0
	cmp.w #FALSE, D0
	beq.l L65

	;result = 1
	move.l #1, -4(A6)

;L65: skip
L65:
	;t#88 = 0
	move.l #0, -134(A5)

	;if i > t#88 goto L66
	move.l 8(A6), D0
	cmp.l -134(A5), D0
	bgt.l L66

	;t#89 = FALSE
	move.w #FALSE, -136(A5)

	;goto: L67
	BRA L67
;L66: skip
L66:
	;t#89 = TRUE
	move.w #TRUE, -136(A5)

;L67: skip
L67:
	;if t#89 = FALSE goto L68
	move.w -136(A5), D0
	cmp.w #FALSE, D0
	beq.l L68

	;L5 return space
	sub.l #4, SP

	;L62 return space
	sub.l #4, SP

	;t#90 = 1
	move.l #1, -140(A5)

	;t#91 = i - t#90
	move.l 8(A6), D0
	sub.l -140(A5), D0
	move.l D0,-144(A5)

	;param t#91
	move.l -144(A5), -(SP)

	;t#92 = call L62
	bsr.l L62
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -148(A5)

	;param t#92
	move.l -148(A5), -(SP)

	;param i
	move.l 8(A6), -(SP)

	;result = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -4(A6)

;L68: skip
L68:
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
;L69: skip
L69:
	;if continuar = FALSE goto L70
	move.w -2(A5), D0
	cmp.w #FALSE, D0
	beq.l L70

	;t#94 = "<------Calculadora------>"
	move.l #'<---', -180(A5)
	move.l #'---C', -176(A5)
	move.l #'alcu', -172(A5)
	move.l #'lado', -168(A5)
	move.l #'ra--', -164(A5)
	move.l #'----', -160(A5)
	move.b #'>', -156(A5)
	move.b #0, -155(A5)

	;param t#94
	sub.l #32, SP
	move.l -180(A5), 0(SP)
	move.l -176(A5), 4(SP)
	move.l -172(A5), 8(SP)
	move.l -168(A5), 12(SP)
	move.l -164(A5), 16(SP)
	move.l -160(A5), 20(SP)
	move.l -156(A5), 24(SP)
	move.l -152(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#95 = "0. Salir"
	move.l #'0. S', -212(A5)
	move.l #'alir', -208(A5)
	move.b #0, -204(A5)

	;param t#95
	sub.l #32, SP
	move.l -212(A5), 0(SP)
	move.l -208(A5), 4(SP)
	move.l -204(A5), 8(SP)
	move.l -200(A5), 12(SP)
	move.l -196(A5), 16(SP)
	move.l -192(A5), 20(SP)
	move.l -188(A5), 24(SP)
	move.l -184(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#96 = "1. Valor absoluto"
	move.l #'1. V', -244(A5)
	move.l #'alor', -240(A5)
	move.l #' abs', -236(A5)
	move.l #'olut', -232(A5)
	move.b #'o', -228(A5)
	move.b #0, -227(A5)

	;param t#96
	sub.l #32, SP
	move.l -244(A5), 0(SP)
	move.l -240(A5), 4(SP)
	move.l -236(A5), 8(SP)
	move.l -232(A5), 12(SP)
	move.l -228(A5), 16(SP)
	move.l -224(A5), 20(SP)
	move.l -220(A5), 24(SP)
	move.l -216(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#97 = "2. Multiplicar"
	move.l #'2. M', -276(A5)
	move.l #'ulti', -272(A5)
	move.l #'plic', -268(A5)
	move.b #'a', -264(A5)
	move.b #'r', -263(A5)
	move.b #0, -262(A5)

	;param t#97
	sub.l #32, SP
	move.l -276(A5), 0(SP)
	move.l -272(A5), 4(SP)
	move.l -268(A5), 8(SP)
	move.l -264(A5), 12(SP)
	move.l -260(A5), 16(SP)
	move.l -256(A5), 20(SP)
	move.l -252(A5), 24(SP)
	move.l -248(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#98 = "3. Dividir"
	move.l #'3. D', -308(A5)
	move.l #'ivid', -304(A5)
	move.b #'i', -300(A5)
	move.b #'r', -299(A5)
	move.b #0, -298(A5)

	;param t#98
	sub.l #32, SP
	move.l -308(A5), 0(SP)
	move.l -304(A5), 4(SP)
	move.l -300(A5), 8(SP)
	move.l -296(A5), 12(SP)
	move.l -292(A5), 16(SP)
	move.l -288(A5), 20(SP)
	move.l -284(A5), 24(SP)
	move.l -280(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#99 = "4. Es primo"
	move.l #'4. E', -340(A5)
	move.l #'s pr', -336(A5)
	move.b #'i', -332(A5)
	move.b #'m', -331(A5)
	move.b #'o', -330(A5)
	move.b #0, -329(A5)

	;param t#99
	sub.l #32, SP
	move.l -340(A5), 0(SP)
	move.l -336(A5), 4(SP)
	move.l -332(A5), 8(SP)
	move.l -328(A5), 12(SP)
	move.l -324(A5), 16(SP)
	move.l -320(A5), 20(SP)
	move.l -316(A5), 24(SP)
	move.l -312(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#100 = "5. Factorial"
	move.l #'5. F', -372(A5)
	move.l #'acto', -368(A5)
	move.l #'rial', -364(A5)
	move.b #0, -360(A5)

	;param t#100
	sub.l #32, SP
	move.l -372(A5), 0(SP)
	move.l -368(A5), 4(SP)
	move.l -364(A5), 8(SP)
	move.l -360(A5), 12(SP)
	move.l -356(A5), 16(SP)
	move.l -352(A5), 20(SP)
	move.l -348(A5), 24(SP)
	move.l -344(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;opcion = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -376(A5)

	;t#102 = 1
	move.l #1, -380(A5)

	;if opcion = t#102 goto L71
	move.l -376(A5), D0
	cmp.l -380(A5), D0
	beq.l L71

	;t#103 = FALSE
	move.w #FALSE, -382(A5)

	;goto: L72
	BRA L72
;L71: skip
L71:
	;t#103 = TRUE
	move.w #TRUE, -382(A5)

;L72: skip
L72:
	;if t#103 = FALSE goto L73
	move.w -382(A5), D0
	cmp.w #FALSE, D0
	beq.l L73

	;t#104 = "--Valor absoluto--"
	move.l #'--Va', -414(A5)
	move.l #'lor ', -410(A5)
	move.l #'abso', -406(A5)
	move.l #'luto', -402(A5)
	move.b #'-', -398(A5)
	move.b #'-', -397(A5)
	move.b #0, -396(A5)

	;param t#104
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

	;t#105 = "Introduce valor:"
	move.l #'Intr', -446(A5)
	move.l #'oduc', -442(A5)
	move.l #'e va', -438(A5)
	move.l #'lor:', -434(A5)
	move.b #0, -430(A5)

	;param t#105
	sub.l #32, SP
	move.l -446(A5), 0(SP)
	move.l -442(A5), 4(SP)
	move.l -438(A5), 8(SP)
	move.l -434(A5), 12(SP)
	move.l -430(A5), 16(SP)
	move.l -426(A5), 20(SP)
	move.l -422(A5), 24(SP)
	move.l -418(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L1 return space
	sub.l #4, SP

	;READINT return space
	sub.l #4, SP

	;t#106 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -450(A5)

	;param t#106
	move.l -450(A5), -(SP)

	;t#107 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -454(A5)

	;param t#107
	move.l -454(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L73: skip
L73:
	;t#108 = 2
	move.l #2, -458(A5)

	;if opcion = t#108 goto L74
	move.l -376(A5), D0
	cmp.l -458(A5), D0
	beq.l L74

	;t#109 = FALSE
	move.w #FALSE, -460(A5)

	;goto: L75
	BRA L75
;L74: skip
L74:
	;t#109 = TRUE
	move.w #TRUE, -460(A5)

;L75: skip
L75:
	;if t#109 = FALSE goto L76
	move.w -460(A5), D0
	cmp.w #FALSE, D0
	beq.l L76

	;t#110 = "--Multiplicacion--"
	move.l #'--Mu', -492(A5)
	move.l #'ltip', -488(A5)
	move.l #'lica', -484(A5)
	move.l #'cion', -480(A5)
	move.b #'-', -476(A5)
	move.b #'-', -475(A5)
	move.b #0, -474(A5)

	;param t#110
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

	;t#111 = "Introduce primer valor:"
	move.l #'Intr', -524(A5)
	move.l #'oduc', -520(A5)
	move.l #'e pr', -516(A5)
	move.l #'imer', -512(A5)
	move.l #' val', -508(A5)
	move.b #'o', -504(A5)
	move.b #'r', -503(A5)
	move.b #':', -502(A5)
	move.b #0, -501(A5)

	;param t#111
	sub.l #32, SP
	move.l -524(A5), 0(SP)
	move.l -520(A5), 4(SP)
	move.l -516(A5), 8(SP)
	move.l -512(A5), 12(SP)
	move.l -508(A5), 16(SP)
	move.l -504(A5), 20(SP)
	move.l -500(A5), 24(SP)
	move.l -496(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;val1 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -528(A5)

	;t#113 = "Introduce segundo valor:"
	move.l #'Intr', -560(A5)
	move.l #'oduc', -556(A5)
	move.l #'e se', -552(A5)
	move.l #'gund', -548(A5)
	move.l #'o va', -544(A5)
	move.l #'lor:', -540(A5)
	move.b #0, -536(A5)

	;param t#113
	sub.l #32, SP
	move.l -560(A5), 0(SP)
	move.l -556(A5), 4(SP)
	move.l -552(A5), 8(SP)
	move.l -548(A5), 12(SP)
	move.l -544(A5), 16(SP)
	move.l -540(A5), 20(SP)
	move.l -536(A5), 24(SP)
	move.l -532(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;val2 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -564(A5)

	;t#115 = "Resultado:"
	move.l #'Resu', -596(A5)
	move.l #'ltad', -592(A5)
	move.b #'o', -588(A5)
	move.b #':', -587(A5)
	move.b #0, -586(A5)

	;param t#115
	sub.l #32, SP
	move.l -596(A5), 0(SP)
	move.l -592(A5), 4(SP)
	move.l -588(A5), 8(SP)
	move.l -584(A5), 12(SP)
	move.l -580(A5), 16(SP)
	move.l -576(A5), 20(SP)
	move.l -572(A5), 24(SP)
	move.l -568(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L5 return space
	sub.l #4, SP

	;param val2
	move.l -564(A5), -(SP)

	;param val1
	move.l -528(A5), -(SP)

	;t#116 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -600(A5)

	;param t#116
	move.l -600(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L76: skip
L76:
	;t#117 = 3
	move.l #3, -604(A5)

	;if opcion = t#117 goto L77
	move.l -376(A5), D0
	cmp.l -604(A5), D0
	beq.l L77

	;t#118 = FALSE
	move.w #FALSE, -606(A5)

	;goto: L78
	BRA L78
;L77: skip
L77:
	;t#118 = TRUE
	move.w #TRUE, -606(A5)

;L78: skip
L78:
	;if t#118 = FALSE goto L79
	move.w -606(A5), D0
	cmp.w #FALSE, D0
	beq.l L79

	;t#119 = "--Division--"
	move.l #'--Di', -638(A5)
	move.l #'visi', -634(A5)
	move.l #'on--', -630(A5)
	move.b #0, -626(A5)

	;param t#119
	sub.l #32, SP
	move.l -638(A5), 0(SP)
	move.l -634(A5), 4(SP)
	move.l -630(A5), 8(SP)
	move.l -626(A5), 12(SP)
	move.l -622(A5), 16(SP)
	move.l -618(A5), 20(SP)
	move.l -614(A5), 24(SP)
	move.l -610(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#120 = "Introduce dividendo:"
	move.l #'Intr', -670(A5)
	move.l #'oduc', -666(A5)
	move.l #'e di', -662(A5)
	move.l #'vide', -658(A5)
	move.l #'ndo:', -654(A5)
	move.b #0, -650(A5)

	;param t#120
	sub.l #32, SP
	move.l -670(A5), 0(SP)
	move.l -666(A5), 4(SP)
	move.l -662(A5), 8(SP)
	move.l -658(A5), 12(SP)
	move.l -654(A5), 16(SP)
	move.l -650(A5), 20(SP)
	move.l -646(A5), 24(SP)
	move.l -642(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;val1 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -674(A5)

	;t#122 = "Introduce divisor:"
	move.l #'Intr', -706(A5)
	move.l #'oduc', -702(A5)
	move.l #'e di', -698(A5)
	move.l #'viso', -694(A5)
	move.b #'r', -690(A5)
	move.b #':', -689(A5)
	move.b #0, -688(A5)

	;param t#122
	sub.l #32, SP
	move.l -706(A5), 0(SP)
	move.l -702(A5), 4(SP)
	move.l -698(A5), 8(SP)
	move.l -694(A5), 12(SP)
	move.l -690(A5), 16(SP)
	move.l -686(A5), 20(SP)
	move.l -682(A5), 24(SP)
	move.l -678(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;val2 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -710(A5)

	;t#124 = "Resultado:"
	move.l #'Resu', -742(A5)
	move.l #'ltad', -738(A5)
	move.b #'o', -734(A5)
	move.b #':', -733(A5)
	move.b #0, -732(A5)

	;param t#124
	sub.l #32, SP
	move.l -742(A5), 0(SP)
	move.l -738(A5), 4(SP)
	move.l -734(A5), 8(SP)
	move.l -730(A5), 12(SP)
	move.l -726(A5), 16(SP)
	move.l -722(A5), 20(SP)
	move.l -718(A5), 24(SP)
	move.l -714(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L26 return space
	sub.l #4, SP

	;param val2
	move.l -710(A5), -(SP)

	;param val1
	move.l -674(A5), -(SP)

	;t#125 = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -746(A5)

	;param t#125
	move.l -746(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L79: skip
L79:
	;t#126 = 4
	move.l #4, -750(A5)

	;if opcion = t#126 goto L80
	move.l -376(A5), D0
	cmp.l -750(A5), D0
	beq.l L80

	;t#127 = FALSE
	move.w #FALSE, -752(A5)

	;goto: L81
	BRA L81
;L80: skip
L80:
	;t#127 = TRUE
	move.w #TRUE, -752(A5)

;L81: skip
L81:
	;if t#127 = FALSE goto L82
	move.w -752(A5), D0
	cmp.w #FALSE, D0
	beq.l L82

	;t#128 = "--Es primo--"
	move.l #'--Es', -784(A5)
	move.l #' pri', -780(A5)
	move.l #'mo--', -776(A5)
	move.b #0, -772(A5)

	;param t#128
	sub.l #32, SP
	move.l -784(A5), 0(SP)
	move.l -780(A5), 4(SP)
	move.l -776(A5), 8(SP)
	move.l -772(A5), 12(SP)
	move.l -768(A5), 16(SP)
	move.l -764(A5), 20(SP)
	move.l -760(A5), 24(SP)
	move.l -756(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#129 = "Introduce numero:"
	move.l #'Intr', -816(A5)
	move.l #'oduc', -812(A5)
	move.l #'e nu', -808(A5)
	move.l #'mero', -804(A5)
	move.b #':', -800(A5)
	move.b #0, -799(A5)

	;param t#129
	sub.l #32, SP
	move.l -816(A5), 0(SP)
	move.l -812(A5), 4(SP)
	move.l -808(A5), 8(SP)
	move.l -804(A5), 12(SP)
	move.l -800(A5), 16(SP)
	move.l -796(A5), 20(SP)
	move.l -792(A5), 24(SP)
	move.l -788(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L44 return space
	sub.l #2, SP

	;READINT return space
	sub.l #4, SP

	;t#130 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -820(A5)

	;param t#130
	move.l -820(A5), -(SP)

	;esPrimo = call L44
	bsr.l L44
	;clean parameters
	add.l #4, SP
	;fetch return
	move.w (SP)+, -822(A5)

	;t#132 = "Resultado:"
	move.l #'Resu', -854(A5)
	move.l #'ltad', -850(A5)
	move.b #'o', -846(A5)
	move.b #':', -845(A5)
	move.b #0, -844(A5)

	;param t#132
	sub.l #32, SP
	move.l -854(A5), 0(SP)
	move.l -850(A5), 4(SP)
	move.l -846(A5), 8(SP)
	move.l -842(A5), 12(SP)
	move.l -838(A5), 16(SP)
	move.l -834(A5), 20(SP)
	move.l -830(A5), 24(SP)
	move.l -826(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#133 = TRUE
	move.w #TRUE, -856(A5)

	;if esPrimo = t#133 goto L83
	move.w -822(A5), D0
	cmp.w -856(A5), D0
	beq.l L83

	;t#134 = FALSE
	move.w #FALSE, -858(A5)

	;goto: L84
	BRA L84
;L83: skip
L83:
	;t#134 = TRUE
	move.w #TRUE, -858(A5)

;L84: skip
L84:
	;if t#134 = FALSE goto L85
	move.w -858(A5), D0
	cmp.w #FALSE, D0
	beq.l L85

	;t#135 = "Es primo!"
	move.l #'Es p', -890(A5)
	move.l #'rimo', -886(A5)
	move.b #'!', -882(A5)
	move.b #0, -881(A5)

	;param t#135
	sub.l #32, SP
	move.l -890(A5), 0(SP)
	move.l -886(A5), 4(SP)
	move.l -882(A5), 8(SP)
	move.l -878(A5), 12(SP)
	move.l -874(A5), 16(SP)
	move.l -870(A5), 20(SP)
	move.l -866(A5), 24(SP)
	move.l -862(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L85: skip
L85:
	;t#136 = FALSE
	move.w #FALSE, -892(A5)

	;if esPrimo = t#136 goto L86
	move.w -822(A5), D0
	cmp.w -892(A5), D0
	beq.l L86

	;t#137 = FALSE
	move.w #FALSE, -894(A5)

	;goto: L87
	BRA L87
;L86: skip
L86:
	;t#137 = TRUE
	move.w #TRUE, -894(A5)

;L87: skip
L87:
	;if t#137 = FALSE goto L88
	move.w -894(A5), D0
	cmp.w #FALSE, D0
	beq.l L88

	;t#138 = "NO es primo!"
	move.l #'NO e', -926(A5)
	move.l #'s pr', -922(A5)
	move.l #'imo!', -918(A5)
	move.b #0, -914(A5)

	;param t#138
	sub.l #32, SP
	move.l -926(A5), 0(SP)
	move.l -922(A5), 4(SP)
	move.l -918(A5), 8(SP)
	move.l -914(A5), 12(SP)
	move.l -910(A5), 16(SP)
	move.l -906(A5), 20(SP)
	move.l -902(A5), 24(SP)
	move.l -898(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L88: skip
L88:
;L82: skip
L82:
	;t#139 = 5
	move.l #5, -930(A5)

	;if opcion = t#139 goto L89
	move.l -376(A5), D0
	cmp.l -930(A5), D0
	beq.l L89

	;t#140 = FALSE
	move.w #FALSE, -932(A5)

	;goto: L90
	BRA L90
;L89: skip
L89:
	;t#140 = TRUE
	move.w #TRUE, -932(A5)

;L90: skip
L90:
	;if t#140 = FALSE goto L91
	move.w -932(A5), D0
	cmp.w #FALSE, D0
	beq.l L91

	;t#141 = "--Factorial--"
	move.l #'--Fa', -964(A5)
	move.l #'ctor', -960(A5)
	move.l #'ial-', -956(A5)
	move.b #'-', -952(A5)
	move.b #0, -951(A5)

	;param t#141
	sub.l #32, SP
	move.l -964(A5), 0(SP)
	move.l -960(A5), 4(SP)
	move.l -956(A5), 8(SP)
	move.l -952(A5), 12(SP)
	move.l -948(A5), 16(SP)
	move.l -944(A5), 20(SP)
	move.l -940(A5), 24(SP)
	move.l -936(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#142 = "Introduce numero:"
	move.l #'Intr', -996(A5)
	move.l #'oduc', -992(A5)
	move.l #'e nu', -988(A5)
	move.l #'mero', -984(A5)
	move.b #':', -980(A5)
	move.b #0, -979(A5)

	;param t#142
	sub.l #32, SP
	move.l -996(A5), 0(SP)
	move.l -992(A5), 4(SP)
	move.l -988(A5), 8(SP)
	move.l -984(A5), 12(SP)
	move.l -980(A5), 16(SP)
	move.l -976(A5), 20(SP)
	move.l -972(A5), 24(SP)
	move.l -968(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;entrada = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -1000(A5)

	;t#144 = 20
	move.l #20, -1004(A5)

	;if entrada < t#144 goto L92
	move.l -1000(A5), D0
	cmp.l -1004(A5), D0
	blt.l L92

	;t#145 = FALSE
	move.w #FALSE, -1006(A5)

	;goto: L93
	BRA L93
;L92: skip
L92:
	;t#145 = TRUE
	move.w #TRUE, -1006(A5)

;L93: skip
L93:
	;if t#145 = FALSE goto L94
	move.w -1006(A5), D0
	cmp.w #FALSE, D0
	beq.l L94

	;L62 return space
	sub.l #4, SP

	;param entrada
	move.l -1000(A5), -(SP)

	;result = call L62
	bsr.l L62
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -1010(A5)

	;t#147 = "Resultado:"
	move.l #'Resu', -1042(A5)
	move.l #'ltad', -1038(A5)
	move.b #'o', -1034(A5)
	move.b #':', -1033(A5)
	move.b #0, -1032(A5)

	;param t#147
	sub.l #32, SP
	move.l -1042(A5), 0(SP)
	move.l -1038(A5), 4(SP)
	move.l -1034(A5), 8(SP)
	move.l -1030(A5), 12(SP)
	move.l -1026(A5), 16(SP)
	move.l -1022(A5), 20(SP)
	move.l -1018(A5), 24(SP)
	move.l -1014(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;param result
	move.l -1010(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L94: skip
L94:
	;t#148 = 20
	move.l #20, -1046(A5)

	;if entrada >= t#148 goto L95
	move.l -1000(A5), D0
	cmp.l -1046(A5), D0
	bge.l L95

	;t#149 = FALSE
	move.w #FALSE, -1048(A5)

	;goto: L96
	BRA L96
;L95: skip
L95:
	;t#149 = TRUE
	move.w #TRUE, -1048(A5)

;L96: skip
L96:
	;if t#149 = FALSE goto L97
	move.w -1048(A5), D0
	cmp.w #FALSE, D0
	beq.l L97

	;t#150 = "El numero es demasiado grande"
	move.l #'El n', -1080(A5)
	move.l #'umer', -1076(A5)
	move.l #'o es', -1072(A5)
	move.l #' dem', -1068(A5)
	move.l #'asia', -1064(A5)
	move.l #'do g', -1060(A5)
	move.l #'rand', -1056(A5)
	move.b #'e', -1052(A5)
	move.b #0, -1051(A5)

	;param t#150
	sub.l #32, SP
	move.l -1080(A5), 0(SP)
	move.l -1076(A5), 4(SP)
	move.l -1072(A5), 8(SP)
	move.l -1068(A5), 12(SP)
	move.l -1064(A5), 16(SP)
	move.l -1060(A5), 20(SP)
	move.l -1056(A5), 24(SP)
	move.l -1052(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L97: skip
L97:
;L91: skip
L91:
	;t#151 = 0
	move.l #0, -1084(A5)

	;if opcion = t#151 goto L98
	move.l -376(A5), D0
	cmp.l -1084(A5), D0
	beq.l L98

	;t#152 = FALSE
	move.w #FALSE, -1086(A5)

	;goto: L99
	BRA L99
;L98: skip
L98:
	;t#152 = TRUE
	move.w #TRUE, -1086(A5)

;L99: skip
L99:
	;if t#152 = FALSE goto L100
	move.w -1086(A5), D0
	cmp.w #FALSE, D0
	beq.l L100

	;continuar = FALSE
	move.w #FALSE, -2(A5)

	;t#154 = "Saliendo"
	move.l #'Sali', -1118(A5)
	move.l #'endo', -1114(A5)
	move.b #0, -1110(A5)

	;param t#154
	sub.l #32, SP
	move.l -1118(A5), 0(SP)
	move.l -1114(A5), 4(SP)
	move.l -1110(A5), 8(SP)
	move.l -1106(A5), 12(SP)
	move.l -1102(A5), 16(SP)
	move.l -1098(A5), 20(SP)
	move.l -1094(A5), 24(SP)
	move.l -1090(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L100: skip
L100:
	;goto: L69
	BRA L69
;L70: skip
L70:
	;Terminate program
	move #9,D0
	trap #15

	SIMHALT



	END	START