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
	;t2 save space in Stack
	sub.l #1, SP
	;varDemainBol save space in Stack
	sub.l #1, SP
	;t0 = #5
	move.l ##5, -4(A6)

	;a = -4(A6)
	move.l #-4(A6), -8(A6)

	;t1 = -------stringde31digitos-------
	move.b #'#', -40(A6)
	move.b #'-', -39(A6)
	move.b #'-', -38(A6)
	move.b #'-', -37(A6)
	move.b #'-', -36(A6)
	move.b #'-', -35(A6)
	move.b #'-', -34(A6)
	move.b #'-', -33(A6)
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
	move.b #'-', -15(A6)
	move.b #'-', -14(A6)
	move.b #'-', -13(A6)
	move.b #'-', -12(A6)
	move.b #'-', -11(A6)
	move.b #'-', -10(A6)
	move.b #'-', -9(A6)
	move.b #0, -8(A6)

	;t2 = #FALSE
	move.b ##FALSE, -41(A6)

	;varDemainBol = -41(A6)
	move.b #-41(A6), -42(A6)

	SIMHALT



	END	START