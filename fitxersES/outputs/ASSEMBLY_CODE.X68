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
	;t#35 save space in Stack
	sub.l #4, SP
	;t#36 save space in Stack
	sub.l #2, SP
	;t#37 save space in Stack
	sub.l #4, SP
	;t#38 save space in Stack
	sub.l #4, SP
	;t#39 save space in Stack
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
	;t#46 save space in Stack
	sub.l #4, SP
	;t#47 save space in Stack
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
	;t#53 save space in Stack
	sub.l #4, SP
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
	;t#73 save space in Stack
	sub.l #2, SP
	;t#74 save space in Stack
	sub.l #4, SP
	;i save space in Stack
	sub.l #4, SP
	;t#75 save space in Stack
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
	;t#81 save space in Stack
	sub.l #2, SP
	;t#82 save space in Stack
	sub.l #4, SP
	;t#83 save space in Stack
	sub.l #4, SP
	;t#84 save space in Stack
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
	;t#93 save space in Stack
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
	;t#101 save space in Stack
	sub.l #4, SP
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
	;t#112 save space in Stack
	sub.l #4, SP
	;val1 save space in Stack
	sub.l #4, SP
	;t#113 save space in Stack
	sub.l #32, SP
	;t#114 save space in Stack
	sub.l #4, SP
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
	;t#121 save space in Stack
	sub.l #4, SP
	;val1 save space in Stack
	sub.l #4, SP
	;t#122 save space in Stack
	sub.l #32, SP
	;t#123 save space in Stack
	sub.l #4, SP
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
	;t#131 save space in Stack
	sub.l #2, SP
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
	;t#143 save space in Stack
	sub.l #4, SP
	;entrada save space in Stack
	sub.l #4, SP
	;t#144 save space in Stack
	sub.l #4, SP
	;t#145 save space in Stack
	sub.l #2, SP
	;t#146 save space in Stack
	sub.l #4, SP
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
	;t#153 save space in Stack
	sub.l #2, SP
	;t#154 save space in Stack
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
	sub.l #26, SP

	;t#26 = 0
	move.l #0, -4(A6)

	;Q = t#26
	move.l -4(A6), -8(A6)

	;R = N
	move.l 8(A6), -12(A6)

;L22: skip
L22:
	;if R >= D goto L24
	move.l -12(A6), D0
	cmp.l 12(A6), D0
	bge.l L24

	;t#27 = FALSE
	move.w #FALSE, -14(A6)

	;goto: L25
	BRA L25
;L24: skip
L24:
	;t#27 = TRUE
	move.w #TRUE, -14(A6)

;L25: skip
L25:
	;if t#27 = FALSE goto L23
	move.w -14(A6), D0
	cmp.w #FALSE, D0
	beq.l L23

	;t#28 = 1
	move.l #1, -18(A6)

	;t#29 = Q + t#28
	move.l -8(A6), D0
	add.l -18(A6), D0
	move.l D0,-22(A6)

	;Q = t#29
	move.l -22(A6), -8(A6)

	;t#30 = R - D
	move.l -12(A6), D0
	sub.l 12(A6), D0
	move.l D0,-26(A6)

	;R = t#30
	move.l -26(A6), -12(A6)

	;goto: L22
	BRA L22
;L23: skip
L23:
	;return Q
	;send return value
	move.l -8(A6), 16(A6)
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
	sub.l #50, SP

	;t#31 = 0
	move.l #0, -8(A6)

	;RESULT = t#31
	move.l -8(A6), -12(A6)

	;t#32 = 0
	move.l #0, -16(A6)

	;if D = t#32 goto L27
	move.l 12(A6), D0
	cmp.l -16(A6), D0
	beq.l L27

	;t#33 = FALSE
	move.w #FALSE, -18(A6)

	;goto: L28
	BRA L28
;L27: skip
L27:
	;t#33 = TRUE
	move.w #TRUE, -18(A6)

;L28: skip
L28:
	;if t#33 = FALSE goto L29
	move.w -18(A6), D0
	cmp.w #FALSE, D0
	beq.l L29

	;t#34 = "Division by 0"
	move.l #'Divi', -50(A6)
	move.l #'sion', -46(A6)
	move.l #' by ', -42(A6)
	move.b #'0', -38(A6)
	move.b #0, -37(A6)

	;param t#34
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

;L29: skip
L29:
	;t#35 = 0
	move.l #0, -40(A5)

	;if D < t#35 goto L30
	move.l 12(A6), D0
	cmp.l -40(A5), D0
	blt.l L30

	;t#36 = FALSE
	move.w #FALSE, -42(A5)

	;goto: L31
	BRA L31
;L30: skip
L30:
	;t#36 = TRUE
	move.w #TRUE, -42(A5)

;L31: skip
L31:
	;if t#36 = FALSE goto L32
	move.w -42(A5), D0
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
	move.l (SP)+, -46(A5)

	;param t#37
	move.l -46(A5), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;t#38 = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -50(A5)

	;Q = t#38
	move.l -50(A5), -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;t#39 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -54(A5)

	;RESULT = t#39
	move.l -54(A5), -12(A6)

;L32: skip
L32:
	;t#40 = 0
	move.l #0, -58(A5)

	;if N < t#40 goto L33
	move.l 8(A6), D0
	cmp.l -58(A5), D0
	blt.l L33

	;t#41 = FALSE
	move.w #FALSE, -60(A5)

	;goto: L34
	BRA L34
;L33: skip
L33:
	;t#41 = TRUE
	move.w #TRUE, -60(A5)

;L34: skip
L34:
	;t#42 = 0
	move.l #0, -64(A5)

	;if D > t#42 goto L35
	move.l 12(A6), D0
	cmp.l -64(A5), D0
	bgt.l L35

	;t#43 = FALSE
	move.w #FALSE, -66(A5)

	;goto: L36
	BRA L36
;L35: skip
L35:
	;t#43 = TRUE
	move.w #TRUE, -66(A5)

;L36: skip
L36:
	;t#44 = t#41 & t#43
	move.w -60(A5), D0
	and.w -66(A5), D0
	move.w D0,-68(A5)

	;if t#44 = FALSE goto L37
	move.w -68(A5), D0
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
	move.l (SP)+, -72(A5)

	;param D
	move.l 12(A6), -(SP)

	;param t#45
	move.l -72(A5), -(SP)

	;t#46 = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -76(A5)

	;Q = t#46
	move.l -76(A5), -4(A6)

	;L0 return space
	sub.l #4, SP

	;param Q
	move.l -4(A6), -(SP)

	;t#47 = call L0
	bsr.l L0
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -80(A5)

	;RESULT = t#47
	move.l -80(A5), -12(A6)

;L37: skip
L37:
	;t#48 = 0
	move.l #0, -84(A5)

	;if N >= t#48 goto L38
	move.l 8(A6), D0
	cmp.l -84(A5), D0
	bge.l L38

	;t#49 = FALSE
	move.w #FALSE, -86(A5)

	;goto: L39
	BRA L39
;L38: skip
L38:
	;t#49 = TRUE
	move.w #TRUE, -86(A5)

;L39: skip
L39:
	;t#50 = 0
	move.l #0, -90(A5)

	;if D > t#50 goto L40
	move.l 12(A6), D0
	cmp.l -90(A5), D0
	bgt.l L40

	;t#51 = FALSE
	move.w #FALSE, -92(A5)

	;goto: L41
	BRA L41
;L40: skip
L40:
	;t#51 = TRUE
	move.w #TRUE, -92(A5)

;L41: skip
L41:
	;t#52 = t#49 & t#51
	move.w -86(A5), D0
	and.w -92(A5), D0
	move.w D0,-94(A5)

	;if t#52 = FALSE goto L42
	move.w -94(A5), D0
	cmp.w #FALSE, D0
	beq.l L42

	;L21 return space
	sub.l #4, SP

	;param D
	move.l 12(A6), -(SP)

	;param N
	move.l 8(A6), -(SP)

	;t#53 = call L21
	bsr.l L21
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -98(A5)

	;RESULT = t#53
	move.l -98(A5), -12(A6)

;L42: skip
L42:
	;return RESULT
	;send return value
	move.l -12(A6), 16(A6)
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
	sub.l #20, SP

	;t#57 = TRUE
	move.w #TRUE, -2(A6)

	;result = t#57
	move.w -2(A6), -4(A6)

	;t#58 = 2
	move.l #2, -8(A6)

	;if n = t#58 goto L45
	move.l 8(A6), D0
	cmp.l -8(A6), D0
	beq.l L45

	;t#59 = FALSE
	move.w #FALSE, -10(A6)

	;goto: L46
	BRA L46
;L45: skip
L45:
	;t#59 = TRUE
	move.w #TRUE, -10(A6)

;L46: skip
L46:
	;t#60 = 3
	move.l #3, -14(A6)

	;if n = t#60 goto L47
	move.l 8(A6), D0
	cmp.l -14(A6), D0
	beq.l L47

	;t#61 = FALSE
	move.w #FALSE, -16(A6)

	;goto: L48
	BRA L48
;L47: skip
L47:
	;t#61 = TRUE
	move.w #TRUE, -16(A6)

;L48: skip
L48:
	;t#62 = t#59 | t#61
	move.w -10(A6), D0
	or.w -16(A6), D0
	move.w D0,-18(A6)

	;if t#62 = FALSE goto L49
	move.w -18(A6), D0
	cmp.w #FALSE, D0
	beq.l L49

	;t#63 = TRUE
	move.w #TRUE, -20(A6)

	;result = t#63
	move.w -20(A6), -4(A6)

;L49: skip
L49:
	;t#66 = 0
	move.l #0, -110(A5)

	;L43 return space
	sub.l #4, SP

	;t#64 = 2
	move.l #2, -102(A5)

	;param t#64
	move.l -102(A5), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#65 = call L43
	bsr.l L43
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -106(A5)

	;if t#65 = t#66 goto L50
	move.l -106(A5), D0
	cmp.l -110(A5), D0
	beq.l L50

	;t#67 = FALSE
	move.w #FALSE, -112(A5)

	;goto: L51
	BRA L51
;L50: skip
L50:
	;t#67 = TRUE
	move.w #TRUE, -112(A5)

;L51: skip
L51:
	;t#70 = 0
	move.l #0, -124(A5)

	;L43 return space
	sub.l #4, SP

	;t#68 = 3
	move.l #3, -116(A5)

	;param t#68
	move.l -116(A5), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#69 = call L43
	bsr.l L43
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -120(A5)

	;if t#69 = t#70 goto L52
	move.l -120(A5), D0
	cmp.l -124(A5), D0
	beq.l L52

	;t#71 = FALSE
	move.w #FALSE, -126(A5)

	;goto: L53
	BRA L53
;L52: skip
L52:
	;t#71 = TRUE
	move.w #TRUE, -126(A5)

;L53: skip
L53:
	;t#72 = t#67 | t#71
	move.w -112(A5), D0
	or.w -126(A5), D0
	move.w D0,-128(A5)

	;if t#72 = FALSE goto L54
	move.w -128(A5), D0
	cmp.w #FALSE, D0
	beq.l L54

	;t#73 = FALSE
	move.w #FALSE, -130(A5)

	;result = t#73
	move.w -130(A5), -4(A6)

;L54: skip
L54:
	;t#74 = 5
	move.l #5, -134(A5)

	;i = t#74
	move.l -134(A5), -138(A5)

	;t#75 = 2
	move.l #2, -142(A5)

	;w = t#75
	move.l -142(A5), -146(A5)

;L55: skip
L55:
	;L20 return space
	sub.l #4, SP

	;param i
	move.l -138(A5), -(SP)

	;t#76 = call L20
	bsr.l L20
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -150(A5)

	;if t#76 <= n goto L57
	move.l -150(A5), D0
	cmp.l 8(A6), D0
	ble.l L57

	;t#77 = FALSE
	move.w #FALSE, -152(A5)

	;goto: L58
	BRA L58
;L57: skip
L57:
	;t#77 = TRUE
	move.w #TRUE, -152(A5)

;L58: skip
L58:
	;if t#77 = FALSE goto L56
	move.w -152(A5), D0
	cmp.w #FALSE, D0
	beq.l L56

	;t#79 = 0
	move.l #0, -160(A5)

	;L43 return space
	sub.l #4, SP

	;param i
	move.l -138(A5), -(SP)

	;param n
	move.l 8(A6), -(SP)

	;t#78 = call L43
	bsr.l L43
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -156(A5)

	;if t#78 = t#79 goto L59
	move.l -156(A5), D0
	cmp.l -160(A5), D0
	beq.l L59

	;t#80 = FALSE
	move.w #FALSE, -162(A5)

	;goto: L60
	BRA L60
;L59: skip
L59:
	;t#80 = TRUE
	move.w #TRUE, -162(A5)

;L60: skip
L60:
	;if t#80 = FALSE goto L61
	move.w -162(A5), D0
	cmp.w #FALSE, D0
	beq.l L61

	;t#81 = FALSE
	move.w #FALSE, -164(A5)

	;result = t#81
	move.w -164(A5), -4(A6)

;L61: skip
L61:
	;t#82 = i + w
	move.l -138(A5), D0
	add.l -146(A5), D0
	move.l D0,-168(A5)

	;i = t#82
	move.l -168(A5), -138(A5)

	;t#83 = 6
	move.l #6, -172(A5)

	;t#84 = t#83 - w
	move.l -172(A5), D0
	sub.l -146(A5), D0
	move.l D0,-176(A5)

	;w = t#84
	move.l -176(A5), -146(A5)

	;goto: L55
	BRA L55
;L56: skip
L56:
	;return result
	;send return value
	move.w -4(A6), 12(A6)
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
	sub.l #14, SP

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

	;t#87 = 1
	move.l #1, -14(A6)

	;result = t#87
	move.l -14(A6), -4(A6)

;L65: skip
L65:
	;t#88 = 0
	move.l #0, -180(A5)

	;if i != t#88 goto L66
	move.l 8(A6), D0
	cmp.l -180(A5), D0
	bne.l L66

	;t#89 = FALSE
	move.w #FALSE, -182(A5)

	;goto: L67
	BRA L67
;L66: skip
L66:
	;t#89 = TRUE
	move.w #TRUE, -182(A5)

;L67: skip
L67:
	;if t#89 = FALSE goto L68
	move.w -182(A5), D0
	cmp.w #FALSE, D0
	beq.l L68

	;L5 return space
	sub.l #4, SP

	;L62 return space
	sub.l #4, SP

	;t#90 = 1
	move.l #1, -186(A5)

	;t#91 = i - t#90
	move.l 8(A6), D0
	sub.l -186(A5), D0
	move.l D0,-190(A5)

	;param t#91
	move.l -190(A5), -(SP)

	;t#92 = call L62
	bsr.l L62
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -194(A5)

	;param t#92
	move.l -194(A5), -(SP)

	;param i
	move.l 8(A6), -(SP)

	;t#93 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -198(A5)

	;result = t#93
	move.l -198(A5), -4(A6)

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
	move.w -4(A5), D0
	cmp.w #FALSE, D0
	beq.l L70

	;t#94 = "<------Calculadora------>"
	move.l #'<---', -230(A5)
	move.l #'---C', -226(A5)
	move.l #'alcu', -222(A5)
	move.l #'lado', -218(A5)
	move.l #'ra--', -214(A5)
	move.l #'----', -210(A5)
	move.b #'>', -206(A5)
	move.b #0, -205(A5)

	;param t#94
	sub.l #32, SP
	move.l -230(A5), 0(SP)
	move.l -226(A5), 4(SP)
	move.l -222(A5), 8(SP)
	move.l -218(A5), 12(SP)
	move.l -214(A5), 16(SP)
	move.l -210(A5), 20(SP)
	move.l -206(A5), 24(SP)
	move.l -202(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#95 = "0. Salir"
	move.l #'0. S', -262(A5)
	move.l #'alir', -258(A5)
	move.b #0, -254(A5)

	;param t#95
	sub.l #32, SP
	move.l -262(A5), 0(SP)
	move.l -258(A5), 4(SP)
	move.l -254(A5), 8(SP)
	move.l -250(A5), 12(SP)
	move.l -246(A5), 16(SP)
	move.l -242(A5), 20(SP)
	move.l -238(A5), 24(SP)
	move.l -234(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#96 = "1. Valor absoluto"
	move.l #'1. V', -294(A5)
	move.l #'alor', -290(A5)
	move.l #' abs', -286(A5)
	move.l #'olut', -282(A5)
	move.b #'o', -278(A5)
	move.b #0, -277(A5)

	;param t#96
	sub.l #32, SP
	move.l -294(A5), 0(SP)
	move.l -290(A5), 4(SP)
	move.l -286(A5), 8(SP)
	move.l -282(A5), 12(SP)
	move.l -278(A5), 16(SP)
	move.l -274(A5), 20(SP)
	move.l -270(A5), 24(SP)
	move.l -266(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#97 = "2. Multiplicar"
	move.l #'2. M', -326(A5)
	move.l #'ulti', -322(A5)
	move.l #'plic', -318(A5)
	move.b #'a', -314(A5)
	move.b #'r', -313(A5)
	move.b #0, -312(A5)

	;param t#97
	sub.l #32, SP
	move.l -326(A5), 0(SP)
	move.l -322(A5), 4(SP)
	move.l -318(A5), 8(SP)
	move.l -314(A5), 12(SP)
	move.l -310(A5), 16(SP)
	move.l -306(A5), 20(SP)
	move.l -302(A5), 24(SP)
	move.l -298(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#98 = "3. Dividir"
	move.l #'3. D', -358(A5)
	move.l #'ivid', -354(A5)
	move.b #'i', -350(A5)
	move.b #'r', -349(A5)
	move.b #0, -348(A5)

	;param t#98
	sub.l #32, SP
	move.l -358(A5), 0(SP)
	move.l -354(A5), 4(SP)
	move.l -350(A5), 8(SP)
	move.l -346(A5), 12(SP)
	move.l -342(A5), 16(SP)
	move.l -338(A5), 20(SP)
	move.l -334(A5), 24(SP)
	move.l -330(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#99 = "4. Es primo"
	move.l #'4. E', -390(A5)
	move.l #'s pr', -386(A5)
	move.b #'i', -382(A5)
	move.b #'m', -381(A5)
	move.b #'o', -380(A5)
	move.b #0, -379(A5)

	;param t#99
	sub.l #32, SP
	move.l -390(A5), 0(SP)
	move.l -386(A5), 4(SP)
	move.l -382(A5), 8(SP)
	move.l -378(A5), 12(SP)
	move.l -374(A5), 16(SP)
	move.l -370(A5), 20(SP)
	move.l -366(A5), 24(SP)
	move.l -362(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#100 = "5. Factorial"
	move.l #'5. F', -422(A5)
	move.l #'acto', -418(A5)
	move.l #'rial', -414(A5)
	move.b #0, -410(A5)

	;param t#100
	sub.l #32, SP
	move.l -422(A5), 0(SP)
	move.l -418(A5), 4(SP)
	move.l -414(A5), 8(SP)
	move.l -410(A5), 12(SP)
	move.l -406(A5), 16(SP)
	move.l -402(A5), 20(SP)
	move.l -398(A5), 24(SP)
	move.l -394(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#101 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -426(A5)

	;opcion = t#101
	move.l -426(A5), -430(A5)

	;t#102 = 1
	move.l #1, -434(A5)

	;if opcion = t#102 goto L71
	move.l -430(A5), D0
	cmp.l -434(A5), D0
	beq.l L71

	;t#103 = FALSE
	move.w #FALSE, -436(A5)

	;goto: L72
	BRA L72
;L71: skip
L71:
	;t#103 = TRUE
	move.w #TRUE, -436(A5)

;L72: skip
L72:
	;if t#103 = FALSE goto L73
	move.w -436(A5), D0
	cmp.w #FALSE, D0
	beq.l L73

	;t#104 = "--Valor absoluto--"
	move.l #'--Va', -468(A5)
	move.l #'lor ', -464(A5)
	move.l #'abso', -460(A5)
	move.l #'luto', -456(A5)
	move.b #'-', -452(A5)
	move.b #'-', -451(A5)
	move.b #0, -450(A5)

	;param t#104
	sub.l #32, SP
	move.l -468(A5), 0(SP)
	move.l -464(A5), 4(SP)
	move.l -460(A5), 8(SP)
	move.l -456(A5), 12(SP)
	move.l -452(A5), 16(SP)
	move.l -448(A5), 20(SP)
	move.l -444(A5), 24(SP)
	move.l -440(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#105 = "Introduce valor:"
	move.l #'Intr', -500(A5)
	move.l #'oduc', -496(A5)
	move.l #'e va', -492(A5)
	move.l #'lor:', -488(A5)
	move.b #0, -484(A5)

	;param t#105
	sub.l #32, SP
	move.l -500(A5), 0(SP)
	move.l -496(A5), 4(SP)
	move.l -492(A5), 8(SP)
	move.l -488(A5), 12(SP)
	move.l -484(A5), 16(SP)
	move.l -480(A5), 20(SP)
	move.l -476(A5), 24(SP)
	move.l -472(A5), 28(SP)

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
	move.l (SP)+, -504(A5)

	;param t#106
	move.l -504(A5), -(SP)

	;t#107 = call L1
	bsr.l L1
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -508(A5)

	;param t#107
	move.l -508(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L73: skip
L73:
	;t#108 = 2
	move.l #2, -512(A5)

	;if opcion = t#108 goto L74
	move.l -430(A5), D0
	cmp.l -512(A5), D0
	beq.l L74

	;t#109 = FALSE
	move.w #FALSE, -514(A5)

	;goto: L75
	BRA L75
;L74: skip
L74:
	;t#109 = TRUE
	move.w #TRUE, -514(A5)

;L75: skip
L75:
	;if t#109 = FALSE goto L76
	move.w -514(A5), D0
	cmp.w #FALSE, D0
	beq.l L76

	;t#110 = "--Multiplicacion--"
	move.l #'--Mu', -546(A5)
	move.l #'ltip', -542(A5)
	move.l #'lica', -538(A5)
	move.l #'cion', -534(A5)
	move.b #'-', -530(A5)
	move.b #'-', -529(A5)
	move.b #0, -528(A5)

	;param t#110
	sub.l #32, SP
	move.l -546(A5), 0(SP)
	move.l -542(A5), 4(SP)
	move.l -538(A5), 8(SP)
	move.l -534(A5), 12(SP)
	move.l -530(A5), 16(SP)
	move.l -526(A5), 20(SP)
	move.l -522(A5), 24(SP)
	move.l -518(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#111 = "Introduce primer valor:"
	move.l #'Intr', -578(A5)
	move.l #'oduc', -574(A5)
	move.l #'e pr', -570(A5)
	move.l #'imer', -566(A5)
	move.l #' val', -562(A5)
	move.b #'o', -558(A5)
	move.b #'r', -557(A5)
	move.b #':', -556(A5)
	move.b #0, -555(A5)

	;param t#111
	sub.l #32, SP
	move.l -578(A5), 0(SP)
	move.l -574(A5), 4(SP)
	move.l -570(A5), 8(SP)
	move.l -566(A5), 12(SP)
	move.l -562(A5), 16(SP)
	move.l -558(A5), 20(SP)
	move.l -554(A5), 24(SP)
	move.l -550(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#112 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -582(A5)

	;val1 = t#112
	move.l -582(A5), -586(A5)

	;t#113 = "Introduce segundo valor:"
	move.l #'Intr', -618(A5)
	move.l #'oduc', -614(A5)
	move.l #'e se', -610(A5)
	move.l #'gund', -606(A5)
	move.l #'o va', -602(A5)
	move.l #'lor:', -598(A5)
	move.b #0, -594(A5)

	;param t#113
	sub.l #32, SP
	move.l -618(A5), 0(SP)
	move.l -614(A5), 4(SP)
	move.l -610(A5), 8(SP)
	move.l -606(A5), 12(SP)
	move.l -602(A5), 16(SP)
	move.l -598(A5), 20(SP)
	move.l -594(A5), 24(SP)
	move.l -590(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#114 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -622(A5)

	;val2 = t#114
	move.l -622(A5), -626(A5)

	;t#115 = "Resultado:"
	move.l #'Resu', -658(A5)
	move.l #'ltad', -654(A5)
	move.b #'o', -650(A5)
	move.b #':', -649(A5)
	move.b #0, -648(A5)

	;param t#115
	sub.l #32, SP
	move.l -658(A5), 0(SP)
	move.l -654(A5), 4(SP)
	move.l -650(A5), 8(SP)
	move.l -646(A5), 12(SP)
	move.l -642(A5), 16(SP)
	move.l -638(A5), 20(SP)
	move.l -634(A5), 24(SP)
	move.l -630(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L5 return space
	sub.l #4, SP

	;param val2
	move.l -626(A5), -(SP)

	;param val1
	move.l -586(A5), -(SP)

	;t#116 = call L5
	bsr.l L5
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -662(A5)

	;param t#116
	move.l -662(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L76: skip
L76:
	;t#117 = 3
	move.l #3, -666(A5)

	;if opcion = t#117 goto L77
	move.l -430(A5), D0
	cmp.l -666(A5), D0
	beq.l L77

	;t#118 = FALSE
	move.w #FALSE, -668(A5)

	;goto: L78
	BRA L78
;L77: skip
L77:
	;t#118 = TRUE
	move.w #TRUE, -668(A5)

;L78: skip
L78:
	;if t#118 = FALSE goto L79
	move.w -668(A5), D0
	cmp.w #FALSE, D0
	beq.l L79

	;t#119 = "--Division--"
	move.l #'--Di', -700(A5)
	move.l #'visi', -696(A5)
	move.l #'on--', -692(A5)
	move.b #0, -688(A5)

	;param t#119
	sub.l #32, SP
	move.l -700(A5), 0(SP)
	move.l -696(A5), 4(SP)
	move.l -692(A5), 8(SP)
	move.l -688(A5), 12(SP)
	move.l -684(A5), 16(SP)
	move.l -680(A5), 20(SP)
	move.l -676(A5), 24(SP)
	move.l -672(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#120 = "Introduce dividendo:"
	move.l #'Intr', -732(A5)
	move.l #'oduc', -728(A5)
	move.l #'e di', -724(A5)
	move.l #'vide', -720(A5)
	move.l #'ndo:', -716(A5)
	move.b #0, -712(A5)

	;param t#120
	sub.l #32, SP
	move.l -732(A5), 0(SP)
	move.l -728(A5), 4(SP)
	move.l -724(A5), 8(SP)
	move.l -720(A5), 12(SP)
	move.l -716(A5), 16(SP)
	move.l -712(A5), 20(SP)
	move.l -708(A5), 24(SP)
	move.l -704(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#121 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -736(A5)

	;val1 = t#121
	move.l -736(A5), -740(A5)

	;t#122 = "Introduce divisor:"
	move.l #'Intr', -772(A5)
	move.l #'oduc', -768(A5)
	move.l #'e di', -764(A5)
	move.l #'viso', -760(A5)
	move.b #'r', -756(A5)
	move.b #':', -755(A5)
	move.b #0, -754(A5)

	;param t#122
	sub.l #32, SP
	move.l -772(A5), 0(SP)
	move.l -768(A5), 4(SP)
	move.l -764(A5), 8(SP)
	move.l -760(A5), 12(SP)
	move.l -756(A5), 16(SP)
	move.l -752(A5), 20(SP)
	move.l -748(A5), 24(SP)
	move.l -744(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#123 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -776(A5)

	;val2 = t#123
	move.l -776(A5), -780(A5)

	;t#124 = "Resultado:"
	move.l #'Resu', -812(A5)
	move.l #'ltad', -808(A5)
	move.b #'o', -804(A5)
	move.b #':', -803(A5)
	move.b #0, -802(A5)

	;param t#124
	sub.l #32, SP
	move.l -812(A5), 0(SP)
	move.l -808(A5), 4(SP)
	move.l -804(A5), 8(SP)
	move.l -800(A5), 12(SP)
	move.l -796(A5), 16(SP)
	move.l -792(A5), 20(SP)
	move.l -788(A5), 24(SP)
	move.l -784(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;L26 return space
	sub.l #4, SP

	;param val2
	move.l -780(A5), -(SP)

	;param val1
	move.l -740(A5), -(SP)

	;t#125 = call L26
	bsr.l L26
	;clean parameters
	add.l #8, SP
	;fetch return
	move.l (SP)+, -816(A5)

	;param t#125
	move.l -816(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L79: skip
L79:
	;t#126 = 4
	move.l #4, -820(A5)

	;if opcion = t#126 goto L80
	move.l -430(A5), D0
	cmp.l -820(A5), D0
	beq.l L80

	;t#127 = FALSE
	move.w #FALSE, -822(A5)

	;goto: L81
	BRA L81
;L80: skip
L80:
	;t#127 = TRUE
	move.w #TRUE, -822(A5)

;L81: skip
L81:
	;if t#127 = FALSE goto L82
	move.w -822(A5), D0
	cmp.w #FALSE, D0
	beq.l L82

	;t#128 = "--Es primo--"
	move.l #'--Es', -854(A5)
	move.l #' pri', -850(A5)
	move.l #'mo--', -846(A5)
	move.b #0, -842(A5)

	;param t#128
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

	;t#129 = "Introduce numero:"
	move.l #'Intr', -886(A5)
	move.l #'oduc', -882(A5)
	move.l #'e nu', -878(A5)
	move.l #'mero', -874(A5)
	move.b #':', -870(A5)
	move.b #0, -869(A5)

	;param t#129
	sub.l #32, SP
	move.l -886(A5), 0(SP)
	move.l -882(A5), 4(SP)
	move.l -878(A5), 8(SP)
	move.l -874(A5), 12(SP)
	move.l -870(A5), 16(SP)
	move.l -866(A5), 20(SP)
	move.l -862(A5), 24(SP)
	move.l -858(A5), 28(SP)

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
	move.l (SP)+, -890(A5)

	;param t#130
	move.l -890(A5), -(SP)

	;t#131 = call L44
	bsr.l L44
	;clean parameters
	add.l #4, SP
	;fetch return
	move.w (SP)+, -892(A5)

	;esPrimo = t#131
	move.w -892(A5), -894(A5)

	;t#132 = "Resultado:"
	move.l #'Resu', -926(A5)
	move.l #'ltad', -922(A5)
	move.b #'o', -918(A5)
	move.b #':', -917(A5)
	move.b #0, -916(A5)

	;param t#132
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

	;t#133 = TRUE
	move.w #TRUE, -928(A5)

	;if esPrimo = t#133 goto L83
	move.w -894(A5), D0
	cmp.w -928(A5), D0
	beq.l L83

	;t#134 = FALSE
	move.w #FALSE, -930(A5)

	;goto: L84
	BRA L84
;L83: skip
L83:
	;t#134 = TRUE
	move.w #TRUE, -930(A5)

;L84: skip
L84:
	;if t#134 = FALSE goto L85
	move.w -930(A5), D0
	cmp.w #FALSE, D0
	beq.l L85

	;t#135 = "Es primo!"
	move.l #'Es p', -962(A5)
	move.l #'rimo', -958(A5)
	move.b #'!', -954(A5)
	move.b #0, -953(A5)

	;param t#135
	sub.l #32, SP
	move.l -962(A5), 0(SP)
	move.l -958(A5), 4(SP)
	move.l -954(A5), 8(SP)
	move.l -950(A5), 12(SP)
	move.l -946(A5), 16(SP)
	move.l -942(A5), 20(SP)
	move.l -938(A5), 24(SP)
	move.l -934(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L85: skip
L85:
	;t#136 = FALSE
	move.w #FALSE, -964(A5)

	;if esPrimo = t#136 goto L86
	move.w -894(A5), D0
	cmp.w -964(A5), D0
	beq.l L86

	;t#137 = FALSE
	move.w #FALSE, -966(A5)

	;goto: L87
	BRA L87
;L86: skip
L86:
	;t#137 = TRUE
	move.w #TRUE, -966(A5)

;L87: skip
L87:
	;if t#137 = FALSE goto L88
	move.w -966(A5), D0
	cmp.w #FALSE, D0
	beq.l L88

	;t#138 = "NO es primo!"
	move.l #'NO e', -998(A5)
	move.l #'s pr', -994(A5)
	move.l #'imo!', -990(A5)
	move.b #0, -986(A5)

	;param t#138
	sub.l #32, SP
	move.l -998(A5), 0(SP)
	move.l -994(A5), 4(SP)
	move.l -990(A5), 8(SP)
	move.l -986(A5), 12(SP)
	move.l -982(A5), 16(SP)
	move.l -978(A5), 20(SP)
	move.l -974(A5), 24(SP)
	move.l -970(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L88: skip
L88:
;L82: skip
L82:
	;t#139 = 5
	move.l #5, -1002(A5)

	;if opcion = t#139 goto L89
	move.l -430(A5), D0
	cmp.l -1002(A5), D0
	beq.l L89

	;t#140 = FALSE
	move.w #FALSE, -1004(A5)

	;goto: L90
	BRA L90
;L89: skip
L89:
	;t#140 = TRUE
	move.w #TRUE, -1004(A5)

;L90: skip
L90:
	;if t#140 = FALSE goto L91
	move.w -1004(A5), D0
	cmp.w #FALSE, D0
	beq.l L91

	;t#141 = "--Factorial--"
	move.l #'--Fa', -1036(A5)
	move.l #'ctor', -1032(A5)
	move.l #'ial-', -1028(A5)
	move.b #'-', -1024(A5)
	move.b #0, -1023(A5)

	;param t#141
	sub.l #32, SP
	move.l -1036(A5), 0(SP)
	move.l -1032(A5), 4(SP)
	move.l -1028(A5), 8(SP)
	move.l -1024(A5), 12(SP)
	move.l -1020(A5), 16(SP)
	move.l -1016(A5), 20(SP)
	move.l -1012(A5), 24(SP)
	move.l -1008(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;t#142 = "Introduce numero:"
	move.l #'Intr', -1068(A5)
	move.l #'oduc', -1064(A5)
	move.l #'e nu', -1060(A5)
	move.l #'mero', -1056(A5)
	move.b #':', -1052(A5)
	move.b #0, -1051(A5)

	;param t#142
	sub.l #32, SP
	move.l -1068(A5), 0(SP)
	move.l -1064(A5), 4(SP)
	move.l -1060(A5), 8(SP)
	move.l -1056(A5), 12(SP)
	move.l -1052(A5), 16(SP)
	move.l -1048(A5), 20(SP)
	move.l -1044(A5), 24(SP)
	move.l -1040(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;READINT return space
	sub.l #4, SP

	;t#143 = call READINT
	bsr.l READINT
	;clean parameters
	add.l #0, SP
	;fetch return
	move.l (SP)+, -1072(A5)

	;entrada = t#143
	move.l -1072(A5), -1076(A5)

	;t#144 = 20
	move.l #20, -1080(A5)

	;if entrada < t#144 goto L92
	move.l -1076(A5), D0
	cmp.l -1080(A5), D0
	blt.l L92

	;t#145 = FALSE
	move.w #FALSE, -1082(A5)

	;goto: L93
	BRA L93
;L92: skip
L92:
	;t#145 = TRUE
	move.w #TRUE, -1082(A5)

;L93: skip
L93:
	;if t#145 = FALSE goto L94
	move.w -1082(A5), D0
	cmp.w #FALSE, D0
	beq.l L94

	;L62 return space
	sub.l #4, SP

	;param entrada
	move.l -1076(A5), -(SP)

	;t#146 = call L62
	bsr.l L62
	;clean parameters
	add.l #4, SP
	;fetch return
	move.l (SP)+, -1086(A5)

	;result = t#146
	move.l -1086(A5), -1090(A5)

	;t#147 = "Resultado:"
	move.l #'Resu', -1122(A5)
	move.l #'ltad', -1118(A5)
	move.b #'o', -1114(A5)
	move.b #':', -1113(A5)
	move.b #0, -1112(A5)

	;param t#147
	sub.l #32, SP
	move.l -1122(A5), 0(SP)
	move.l -1118(A5), 4(SP)
	move.l -1114(A5), 8(SP)
	move.l -1110(A5), 12(SP)
	move.l -1106(A5), 16(SP)
	move.l -1102(A5), 20(SP)
	move.l -1098(A5), 24(SP)
	move.l -1094(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

	;param result
	move.l -1090(A5), -(SP)

	;call WRITE_INT
	bsr.l WRITE_INT
	;clean parameters
	add.l #4, SP

;L94: skip
L94:
	;t#148 = 20
	move.l #20, -1126(A5)

	;if entrada >= t#148 goto L95
	move.l -1076(A5), D0
	cmp.l -1126(A5), D0
	bge.l L95

	;t#149 = FALSE
	move.w #FALSE, -1128(A5)

	;goto: L96
	BRA L96
;L95: skip
L95:
	;t#149 = TRUE
	move.w #TRUE, -1128(A5)

;L96: skip
L96:
	;if t#149 = FALSE goto L97
	move.w -1128(A5), D0
	cmp.w #FALSE, D0
	beq.l L97

	;t#150 = "El numero es demasiado grande"
	move.l #'El n', -1160(A5)
	move.l #'umer', -1156(A5)
	move.l #'o es', -1152(A5)
	move.l #' dem', -1148(A5)
	move.l #'asia', -1144(A5)
	move.l #'do g', -1140(A5)
	move.l #'rand', -1136(A5)
	move.b #'e', -1132(A5)
	move.b #0, -1131(A5)

	;param t#150
	sub.l #32, SP
	move.l -1160(A5), 0(SP)
	move.l -1156(A5), 4(SP)
	move.l -1152(A5), 8(SP)
	move.l -1148(A5), 12(SP)
	move.l -1144(A5), 16(SP)
	move.l -1140(A5), 20(SP)
	move.l -1136(A5), 24(SP)
	move.l -1132(A5), 28(SP)

	;call WRITE_STRING
	bsr.l WRITE_STRING
	;clean parameters
	add.l #32, SP

;L97: skip
L97:
;L91: skip
L91:
	;t#151 = 0
	move.l #0, -1164(A5)

	;if opcion = t#151 goto L98
	move.l -430(A5), D0
	cmp.l -1164(A5), D0
	beq.l L98

	;t#152 = FALSE
	move.w #FALSE, -1166(A5)

	;goto: L99
	BRA L99
;L98: skip
L98:
	;t#152 = TRUE
	move.w #TRUE, -1166(A5)

;L99: skip
L99:
	;if t#152 = FALSE goto L100
	move.w -1166(A5), D0
	cmp.w #FALSE, D0
	beq.l L100

	;t#153 = FALSE
	move.w #FALSE, -1168(A5)

	;continuar = t#153
	move.w -1168(A5), -4(A5)

	;t#154 = "Saliendo"
	move.l #'Sali', -1200(A5)
	move.l #'endo', -1196(A5)
	move.b #0, -1192(A5)

	;param t#154
	sub.l #32, SP
	move.l -1200(A5), 0(SP)
	move.l -1196(A5), 4(SP)
	move.l -1192(A5), 8(SP)
	move.l -1188(A5), 12(SP)
	move.l -1184(A5), 16(SP)
	move.l -1180(A5), 20(SP)
	move.l -1176(A5), 24(SP)
	move.l -1172(A5), 28(SP)

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