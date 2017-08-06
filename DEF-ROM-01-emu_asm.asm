START	LDS 	#$007F
		LDX 	#$0400
		CLR 	$01,X
		CLR 	$03,X
		LDAA	#$FF
		STAA	$00,X
		CLR		$02,X
		LDAA 	#$37
		STAA	$03,X
		CLR		$02,X
		LDAA	#$37
		STAA	$03,X
		LDAA	#$3C
		STAA	$01,X
		STAA	$09
		CLRA
		STAA	$07
		STAA	$04
		STAA	$05
		STAA	$06
		STAA	$08
		CLI
;STDBY	BRA 	STDBY
;
PARAM1	TAB
		ASLA
		ASLA
		ASLA
		ABA
		LDX		#$0013
		STX		$0F
		LDX		#$FD76
		JSR		CALCOS
		LDAB	#$09
		JMP		UTIL1
;
SYNTH1	LDAA	$1B
DAC1	STAA	$0400
LOOP1	LDAA	$13
		STAA	$1C
		LDAA	$14
		STAA	$1D
S1LP1	LDX		$18
S1LP2	LDAA	$1C
DAC2	COM		$0400
S1LP3	DEX
		BEQ		DAC4
		DECA
		BNE		S1LP3
DAC3	COM		$0400
S1LP4	LDAA	$1D
		DEX
		BEQ		S1LP5
		DECA
		BNE		S1LP4
		BRA		S1LP2
DAC4	LDAA	$0400
		BMI		S1LP5
		COMA
S1LP5	ADDA	#$00
		STAA	$0400
		LDAA	$1C
		ADDA	$15
		STAA	$1C
		LDAA	$1D
		ADDA	$16
		STAA	$1D
		CMPA	$17
		BNE		S1LP1
		LDAA	$1A
		BEQ		EXIT1
		ADDA	$13
		STAA	$13
		BNE		LOOP1
EXIT1	RTS
;
PARAM2	LDAA	#$01
		STAA	$1A
		LDAB	#$03
		BRA		S2LP2
;
SYNTH2	LDAA	#$FE
		STAA	$1A
		LDAA	#$C0
		LDAB	#$10
		BRA		S2LP2
S2LP2	STAA	$19
		LDAA	#$FF
DAC5	STAA	$0400
		STAB	$15
LOOP2	LDAB	$15
S2LP1	LDAA	$0A
		LSRA
		LSRA
		LSRA
		EORA	$0A
		LSRA
		ROR		$0009
		ROR		$000A
		BCC		S2LP3
DAC6	COM		$0400
S2LP3	LDAA	$19
S2LP4	DECA
		BNE		S2LP4
		DECB
		BNE		S2LP1
		LDAA	$19
		ADDA	$1A
		STAA	$19
		BNE		LOOP2
EXIT2	RTS
;
SYNTH3	LDAA	#$20
		STAA	$15
		STAA	$18
		LDAA	#$01
		LDX		#$0001
		LDAB	#$FF
		BRA		S3LP2
S3LP2	STAA	$13
LOOP3	STX		$16
S3LP1	STAB	$14
		LDAB	$15
S3LP3	LDAA	$0A
		LSRA
		LSRA
		LSRA
		EORA	$0A
		LSRA
		ROR		$0009
		ROR		$000A
		LDAA	#$00
		BCC		DAC7
		LDAA	$14
DAC7	STAA	$0400
		LDX		$16
S3LP4	DEX
		BNE		S3LP4
		DECB
		BNE		S3LP3
		LDAB	$14
		SUBB	$13
		BEQ		EXIT3
		LDX		$16
		INX
		LDAA	$18
		BEQ		S3LP1
		BRA		LOOP3
EXIT3	RTS
;
PARAM3	LDAB	#$01
		STAB	$04
		CLRA
		STAA	$19
		BRA		SYNTH4
;
PARAM4	CLRA
		STAA	$19
		LDAB	#$03
		BRA		SYNTH4
;
PARAM5	LDAA	#$01
		STAA	$19
		LDX		#$03E8
		LDAA	#$01
		LDAB	#$FF
		BRA		SYNTH4
;
SYNTH4	STAA	$18
		STAB	$13
		STX		$16
		CLR		$0015
LOOP4	LDX		$16
DAC8	LDAA	$0400
S4LP1	TAB
		LSRB
		LSRB
		LSRB
		EORB	$0A
		LSRB
		ROR		$0009
		ROR		$000A
		LDAB	$13
		TST		$0019
		BEQ		S4LP6
		ANDB	$09
S4LP6	STAB	$14
		LDAB	$15
		CMPA	$0A
		BHI		S4LP3
S4LP2	DEX
		BEQ		S4LP5
DAC9	STAA	$0400
		ADDB	$15
		ADCA	$14
		BCS		S4LP4
		CMPA	$0A
		BLS		S4LP2
		BRA		S4LP4
S4LP3	DEX
		BEQ		S4LP5
DAC10	STAA	$0400
		SUBB	$15
		SBCA	$14
		BCS		S4LP4
		CMPA	$0A
		BHI		S4LP3
		LDAA	$0A
DAC11	STAA	$0400
		BRA		S4LP1
S4LP5	LDAB	$18
		BEQ		S4LP1
		LDAA	$13
		LDAB	$15
		LSRA
		RORB
		LSRA
		RORB
		LSRA
		RORB
		COMA
		NEGB
		SBCA	#$FF
		ADDB	$15
		ADCA	$13
		STAB	$15
		STAA	$13
		BNE		LOOP4
		CMPB	#$07
		BNE		LOOP4
EXIT4	RTS
;
SYNTH5	LDAA	#$FD
		STAA	$0F
		LDX		#$0064
		STX		$0B
LOOP5	ADDB	$0C
		LDAA	$11
		ADCA	$0B
		STAA	$11
		LDX		$0B
		BCS		S5LP2
		BRA		S5LP1
S5LP1	BRA		S5LP3
S5LP2	INX
		BEQ		EXIT5
S5LP3	STX		$0B
		ANDA	#$0F
		ADDA	#$9A
		STAA	$10
		LDX		$0F
		LDAA	$00,X
DAC12	STAA	$0400
		BRA		LOOP5
EXIT5	RTS
;
SYNTH6	CLRA
DAC13	STAA	$0400
		STAA	$11
LOOP6	CLRA
S6LP1	CMPA	$11
		BNE		S6LP2
DAC14	COM		$0400
S6LP2	LDAB	#$12
S6LP3	DECB
		BNE		S6LP3
		INCA
		BPL		S6LP1
DAC15	COM		$0400
		INC		$0011
		BPL		LOOP6
EXIT6	RTS
;
SYNTH7	LDX		#$0013
S7LP1	CLR		$00,X
		INX
		CPX		#$001B
		BNE		S7LP1
		LDAA	#$40
		STAA	$13
LOOP7	LDX		#$0013
		LDAA	#$80
		STAA	$11
		CLRB
S7LP2	LDAA	$01,X
		ADDA	$00,X
		STAA	$01,X
		BPL		S7LP3
		ADDB	$11
S7LP3	LSR		$0011
		INX
		INX
		CPX		#$001B
		BNE		S7LP2
DAC16	STAB	$0400
		INC		$0012
		BNE		LOOP7
		LDX		#$0013
		CLRB
S7LP4	LDAA	$00,X
		BEQ		S7LP6
		CMPA	#$37
		BNE		S7LP5
		LDAB	#$41
		STAB	$02,X
S7LP5	DEC		$00,X
		INCB
S7LP6	INX
		INX
		CPX		#$001B
		BNE		S7LP4
		TSTB
		BNE		LOOP7
EXIT7	RTS
;
PARAM6	DEC		$0008
		RTS
;
PARAM7	CLR		$0008
		STAA	$11
		LDX		#$FDAA	;wave
P7LP1	LDAA	$00,X
		BEQ		P7LP4
		DEC		$0011
		BEQ		P7LP2
		INCA
		JSR		CALCOS
		BRA		P7LP1
P7LP2	INX
		STX		$0F
		JSR		CALCOS
		STX		$0D
		LDX		$0F
P7LP3	LDAA	$00,X
		STAA	$15
		LDAA	$01,X
		LDX		$02,X
		STX		$13
		BSR		S8LP3
		LDX		$0F
		INX
		INX
		INX
		INX
		STX		$0F
		CPX		$0D
		BNE		P7LP3
		JMP		IRQ2
;
PARAM8	LDAA	#$03
		STAA	$08
		RTS
;
PARAM9	DEC		$0008
		BEQ		SYNTH8
		LDAB	$15
		ASLB
		ASLB
		ASLB
		ASLB
		ABA
		STAA	$15
		CLRA
;STDBY2	BRA		STDBY2
;
SYNTH8	DECA
		CMPA	#$0B
		BLS		S8LP1
		CLRA
S8LP1	LDX		#$FE41	;wave?
		JSR		CALCOS
		LDAA	$00,X
		LDX		#$FFFF
		STX		$13
		BSR		S8LP3
S8LP2	BSR		S8LP7
		BRA		S8LP2
S8LP3	LDX		#$0016
S8LP4	CMPA	#$00
		BEQ		S8LP6
		CMPA	#$03
		BEQ		S8LP5
		LDAB	#$01
		STAB	$00,X
		INX
		SUBA	#$02
		BRA		S8LP4
S8LP5	LDAB	#$91
		STAB	$00,X
		CLR		$01,X
		INX
		INX
S8LP6	LDAB	#$7E
		STAB	$00,X
		LDAB	#$FA
		STAB	$00,X
		LDAB	#$DD
		STAB	$02,X
S8LP7	LDX		$13
		CLRA
		LDAB	#$0012
		INCB
		STAB	$12
		ANDB	$15
		LSRB
		ADCA	#$00
		LSRB
		ADCA	#$00
		LSRB
		ADCA	#$00
		LSRB
		ADCA	#$00
		LSRB
		ADCA	#$00
		LSRB
		ADCA	#$00
		LSRB
		ADCA	#$00
		ABA
		ASLA
		ASLA
		ASLA
		ASLA
DAC17	STAA	$0400
		DEX
		BEQ		EXIT8
		JMP		$0016	;?
EXIT8	RTS
;
UTIL1	PSHA
ULP1	LDAA	$00,X
		STX		$0D
		LDX		$0F
		STAA	$00,X
		INX
		STX		$0F
		LDX		$0D
		INX
		DECB
		BNE		ULP1
		PULA
		RTS
;
PARAM10	CLRA
		STAA	$04
		STAA	$05
		RTS
;
PARAM11	CLR		$0004
		LDAA	$05
		ANDA	#$7F
		CMPA	#$1D
		BNE		P11LP1
		CLRA
P11LP1	INCA
		STAA	$05
		RTS
;
UTIL2	LDAA	#$0E
		JSR		P13LP2
		LDAA	$05
		ASLA
		ASLA
		COMA
		JSR		P14LP2
U2LP1	INC		$0017
		JSR		P14LP3
		BRA		U2LP1
;
PARAM12	LDAA	#$03
		JSR		PARAM1
		LDAB	$06
		CMPB	#$1F
		BNE		P12LP1
		CLRB
P12LP1	INCB
		STAB	$06
		LDAA	#$20
		SBA
		CLRB
P12LP2	CMPA	#$14
		BLS		P12LP3
		ADDB	#$0E
		DECA
		BRA		P12LP2
P12LP3	ADDB	#$05
		DECA
		BNE		P12LP3
		STAB	$13
P12LP4	JSR		SYNTH1
		BRA		P12LP4
;
PARAM13	LDAA	$07
		BNE		P13LP1
		INC		$0007
		LDAA	#$0D
		BSR		P13LP2
		BRA		SYNTH9
P13LP1	JMP		P14LP1
P13LP2	TAB
		ASLB
		ABA
		ABA
		ABA
		LDX		#$FEEC	;wave?
		JSR		CALCOS
		LDAA	$00,X
		TAB
		ANDA	#$0F
		STAA	$14
		LSRB
		LSRB
		LSRB
		LSRB
		STAB	$13
		LDAA	$01,X
		TAB
		LSRB
		LSRB
		LSRB
		LSRB
		STAB	$15
		ANDA	#$0F
		STAA	$11
		STX		$0B
		LDX		#$FE4D	;wave?
P13LP3	DEC		$0011
		BMI		P13LP4
		LDAA	$00,X
		INCA
		JSR		CALCOS
		BRA		P13LP3
P13LP4	STX		$18
		JSR		PARAM18
		LDX		$0B
		LDAA	$02,X
		STAA	$1A
		JSR		PARAM19
		LDX		$0B
		LDAA	$03,X
		STAA	$16
		LDAA	$04,X
		STAA	$17
		LDAA	$05,X
		TAB
		LDAA	$06,X
		LDX		#$FF55	;wave?
		JSR		CALCOS
		TBA
		STX		$1B
		CLR		$0023
		JSR		CALCOS
		STX		$1D
		RTS
;
SYNTH9	LDAA	$13
		STAA	$22
S9LP1	LDX		$1B
		STX		$0D
		LDX		$0D
		LDAA	$00,X
		ADDA	$23
		STAA	$21
		CPX		$1D
		BEQ		PARAM14
		LDAB	$14
		INX
		STX		$0D
LOOP9	LDX		#$0024
S9LP2	LDAA	$21
S9LP3	DECA
		BNE		S9LP3
		LDAA	$00,X
DAC18	STAA	$0400
		INX
		CPX		$1F
		BNE		S9LP2
		DECB
		INX
		DEX
		INX
		DEX
		INX
		DEX
		INX
		DEX
		NOP
		NOP
		BRA		LOOP9
;
PARAM14	LDAA	$15
		BSR		PARAM19
		DEC		$0022
		BNE		S9LP1
		LDAA	$07
		BNE		P17EXIT
P14LP1	LDAA	$16
		BEQ		P17EXIT
		DEC		$0017
		BEQ		P17EXIT
		ADDA	$23
P14LP2	STAA	$23
P14LP3	LDX		$1B
		CLRB
P14LP4	LDAA	$23
		TST		$0016
		BMI		PARAM15
		ADDA	$00,X
		BCS		P15LP1
		BRA		PARAM16
;
PARAM15	ADDA	$00,X
		BEQ		P15LP1
		BCS		PARAM16
P15LP1	TSTB
		BEQ		P16LP1
		BRA		PARAM17
;
PARAM16	TSTB
		BNE		P16LP1
		STX		$1B
		INCB
P16LP1	INX
		CPX		$1D
		BNE		P14LP4
		TSTB
		BNE		PARAM17
		RTS
;
PARAM17	STX		$1D
		LDAA	$15
		BEQ		P17LP1
		BSR		PARAM18
		LDAA	$1A
		BSR		PARAM19
		JMP		SYNTH9
P17EXIT	RTS
;
PARAM18	LDX		$0024
		STX		$0F
		LDX		$18
		LDAB	$00,X
		INX
		JSR		UTIL1
		LDX		$0F
		STX		$1F
		RTS
;
PARAM19	TSTA
		BEQ		EXIT9
		LDX		$18
		STX		$0D
		LDX		#$0024
		STAA	$12
LOOP10	STX		$0F
		LDX		$0D
		LDAB	$12
		STAB	$11
		LDAB	$01,X
		LSRB
		LSRB
		LSRB
		LSRB
		INX
		STX		$0D
		LDX		$0F
		LDAA	$00,X
P19LP1	SBA
		DEC		$0011
		BNE		P19LP1
		STAA	$00,X
		INX
		CPX		$1F
		BNE		LOOP10
EXIT9	RTS
;
IRQ		LDS		#$007F
		LDAA	$0402
		CLI
		COMA
		ANDA	#$1F
		LDAB	$08
		BEQ		IR1LP2
		BPL		IR1LP1
		JSR		PARAM7
IR1LP1	DECA
		JSR		PARAM9
IR1LP2	CLRB
		CMPA	#$0E
		BEQ		IR1LP3
		STAB	$06
IR1LP3	CMPA	#$12
		BEQ		IR1LP4
		STAB	$07
IR1LP4	LDAB	$EFFD	;wave?
		CMPB	#$7E
		BNE		IR1LP7
		JSR		$EFFD	;?label
IR1LP7	TSTA
		BEQ		IRQ2
		DECA
		CMPA	#$0C
		BHI		IR1LP5
		JSR		P13LP2
		JSR		SYNTH9
		BRA		IRQ2
IR1LP5	CMPA	#$1B
		BHI		IR1LP6
		SUBA	#$0D
		ASLA
		LDX		#$FD58	;VWTAB
		BSR		CALCOS
		LDX		$00,X
		JSR		$00,X
		BRA		IRQ2
IR1LP6	SUBA	#$1C
		JSR		PARAM1
		JSR		SYNTH1
;
IRQ2	LDAA	$04
		ORAA	$05
IR2LP1	BEQ		IR2LP1
		CLRA
		STAA	$07
		LDAA	$04
		BEQ		IR2LP2
		JMP		SYNTH4
		JMP		UTIL2
;
CALCOS	STX		$0D
		ADDA	$0E
		STAA	$0E
		BCC		CLP1
		INC		$000D
CLP1	LDX		$0D
		RTS
;
NMI		SEI
		LDS		#$007F
		LDX		#$FFFF
		CLRB
N1LP1	ADCB	$00,X
		DEX
		CPX		#$F800
		BNE		N1LP1
		CMPB	$00,X
		BEQ		N1LP2
		WAI
N1LP2	LDAA	#$01
		JSR		PARAM1
		JSR		SYNTH1
		LDAB	$EFFA	;wave?
		CMPB	#$7E
		BNE		NMI
		JSR		$EFFA	;?label
		BRA		NMI
;
VWTAB	FDB		$FB49	;param12
		FDB		$F913	;param3
		FDB		$FB24	;param11
		FDB		$F88C	;param2
		FDB		$FB71	;param13
		FDB		$FB1E	;param10
		FDB		$F8CD	;synth3
		FDB		$F894	;synth2
		FDB		$F91C	;param4
		FDB		$F923	;param5
		FDB		$F9AC	;synth5
		FDB		$F9D4	;synth6
		FDB		$F9F3	;synth7
		FDB		$FA44	;param6
		FDB		$FA84	;param8
;
;VVECT	EQU *