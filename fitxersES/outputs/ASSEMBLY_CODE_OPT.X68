	ORG	$1000
	TRUE:	EQU	1
	FALSE:	EQU	0
START:
	;A6 to index variables
	move.l SP, A6
	;t0 save space in Stack
	sub.l #4, SP
	;a save space in Stack
	sub.l #4, SP
	;t1 save space in Stack
	sub.l #32, SP
	;t3 save space in Stack
	sub.l #2, SP
	;t4 save space in Stack
	sub.l #4, SP
	;t5 save space in Stack
	sub.l #2, SP
	;t6 save space in Stack
	sub.l #32, SP
	;t7 save space in Stack
	sub.l #4, SP
	;z save space in Stack
	sub.l #4, SP
	jmp MAIN
	;t0 = #5
	move.l ##5, -4(A6)

	;a = -4(A6)
	move.l #-4(A6), -8(A6)

	;t1 = #######stringde31digitos#######
	move.b #'#', -40(A6)
	move.b #'#', -39(A6)
	move.b #'#', -38(A6)
	move.b #'#', -37(A6)
	move.b #'#', -36(A6)
	move.b #'#', -35(A6)
	move.b #'#', -34(A6)
	move.b #'#', -33(A6)
	move.b #'s', -32(A6)
	move.b #'t', -31(A6)
	move.b #'r', -30(A6)
	move.b #'i', -29(A6)
	move.b #'n', -28(A6)
	move.b #'g', -27(A6)
	move.b #'d', -26(A6)
	move.b #'e', -25(A6)
	move.b #'3', -24(A6)
	move.b #'1', -23(A6)
	move.b #'d', -22(A6)
	move.b #'i', -21(A6)
	move.b #'g', -20(A6)
	move.b #'i', -19(A6)
	move.b #'t', -18(A6)
	move.b #'o', -17(A6)
	move.b #'s', -16(A6)
	move.b #'#', -15(A6)
	move.b #'#', -14(A6)
	move.b #'#', -13(A6)
	move.b #'#', -12(A6)
	move.b #'#', -11(A6)
	move.b #'#', -10(A6)
	move.b #'#', -9(A6)
	move.b #0, -8(A6)

;L0: skip
L0:
	;asd = 68(A6)
	move.l #68(A6), -4(A6)

	;t2 = #34
	move.l ##34, -8(A6)

	;a = -8(A6)
	move.l #-8(A6), -8(A6)

	;return a

	;t6 = t1
	move.b -40(A6), -80(A6)
	move.b -39(A6), -79(A6)
	move.b -38(A6), -78(A6)
	move.b -37(A6), -77(A6)
	move.b -36(A6), -76(A6)
	move.b -35(A6), -75(A6)
	move.b -34(A6), -74(A6)
	move.b -33(A6), -73(A6)
	move.b -32(A6), -72(A6)
	move.b -31(A6), -71(A6)
	move.b -30(A6), -70(A6)
	move.b -29(A6), -69(A6)
	move.b -28(A6), -68(A6)
	move.b -27(A6), -67(A6)
	move.b -26(A6), -66(A6)
	move.b -25(A6), -65(A6)
	move.b -24(A6), -64(A6)
	move.b -23(A6), -63(A6)
	move.b -22(A6), -62(A6)
	move.b -21(A6), -61(A6)
	move.b -20(A6), -60(A6)
	move.b -19(A6), -59(A6)
	move.b -18(A6), -58(A6)
	move.b -17(A6), -57(A6)
	move.b -16(A6), -56(A6)
	move.b -15(A6), -55(A6)
	move.b -14(A6), -54(A6)
	move.b -13(A6), -53(A6)
	move.b -12(A6), -52(A6)
	move.b -11(A6), -51(A6)
	move.b -10(A6), -50(A6)
	move.b -9(A6), -49(A6)

	;t5 = #FALSE
	move.w ##FALSE, -48(A6)

	;t4 = #2
	move.l ##2, -46(A6)

	;t3 = #TRUE
	move.w ##TRUE, -42(A6)

	;param t3

	;param t4

	;param t5

	;param t6

	;call L0

	;z = -84(A6)
	move.l #-84(A6), -88(A6)

	SIMHALT



	END	START