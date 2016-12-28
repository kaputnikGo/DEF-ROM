		ORG $F800   ;origin
		ASL $0F8E   ;arithmetic shift left, clear vars
RESET	SEI         ;disable interrupts,set interrupt mask
		LDS #$007F  ;init stack pointer
		LDX #$0400  ;load PIA (DAC) addr
		CLR $01,X   ;switch to DDR
		CLR $03,X   ;and for 2nd port
		LDAA #$FF
		STAA $00,X  ; all outputs on chn A
		CLR $02,X	;all inputs on chn B
		LDAA #$37	;CB2 is output, output reg selected
		STAA $03,X	;IRQB on low to hi, enabled
		LDAA #$3C	;CA2 is output, output reg selected
		STAA $01,X	;IRQA on hi to low, disabled
		STAA <$09	;store that setting
		CLRA		;clear A
		STAA <$07	;next clears some mem locations
		STAA <$04
		STAA <$05
		STAA <$06
		STAA <$08
		CLI			;enable interrupts
		BRA $F828	;$F828,wait for interrupt
		TAB			;$F82A,synth1(boot)
 		ASLA		;shift left A
		ASLA		;shift left A
		ASLA		;A x 8
		ABA			;A x 8 + A = 9A
		LDX #$0013	;load 19 in X reg
		STX <$0f	;store in zero page
		LDX #$FD76	;load table addr
		JSR CalOfSt	;($FD21)calcs X + A -> X
		LDAB #$09	;put 9 in B reg
		JMP $FB0A	;jumps to...
		LDAA <$1B	;subrtn, vol (always $FF)
		STAA >$0400	;DAC output
		LDAA <$13	;load accum A
		STAA <$1C	;store accum A
		LDAA <$14	;load accum A
		STAA <$1D	;store accum A
		LDX <$18	;load index reg
		LDAA <$1C	;load accum A, loop, alt 0-255, variable delay
		COM >$0400	;DAC invert
		DEX			;decrement index reg
		BEQ $F866	;branch if equal to zero
		DECA		;decrement A
		BNE $F853	;branch if not equal to zero
		COM >$0400	;DAC invert
		LDAA <$1D	;load accum A
		DEX			;decrement index reg
		BEQ $F866	;as above
		DECA		;as above
		BNE $F85E	;branch != 0
		BRA $F84E	;branch always, end loop
		LDAA >$0400	;load accum DAC
		BMI $F86C	;branch if minus
		COMA		;complement A
		ADDA #$00	;dummy?
		STAA >$0400	;DAC invert
		LDAA <$1C	;load accum A
		ADDA <$15	;add A
		STAA <$1C	;store accum A
		LDAA <$1D	;load accum A
		ADDA <$16	;add A
		STAA <$1D	;store accum A
		CMPA <$17	;compare A
		BNE $F84C	;branch if != 0
		LDAA <$1A	;load accum A
		BEQ $F88B	;branch if = 0
		ADDA <$13	;add A
		STAA <$13	;store A
		BNE $F844	;branch if != 0
		RTS			;return from subroutine
		LDAA #$01	;Synth2(PWM?),W vector
		STAA <$1A	;
		LDAB #$03	;
		BRA $F89E	;branch always
		LDAA #$FE	;W vector
		STAA <$1a	;
		LDAA #$C0	;
		LDAB #$10	;
		BRA $F89E	;branch always, why?
		STAA <$19	;$F89E
		LDAA #$FF	;
		STAA >$0400	;store A to DAC
		STAB <$15	;
		LDAB <$15	;$F8A7
		LDAA <$0A	;$F8A9
		LSRA		;logical shift right
		LSRA		;
		LSRA		;
		EORA <$0A	;exclusive OR A
		LSRA		;
		ROR >$0009	;rotate right
		ROR >$000A	;
		BCC $F8BC	;branch if Carry clear
		COM >$0400	;DAC invert
		LDAA <$19	;$F8BC
		DECA		;$F8BE,decrement A
		BNE $F8BE	;branch if != 0
		DECB		;decrement B
		BNE $F8A9	;branch if != 0
		LDAA <$19	;
		ADDA <$1A	;
		STAA <$19	;
		BNE $F8A7	;
		RTS			;return subroutine
		LDAA #$20	;Synth3(?), W vector
		STAA <$15	;
		STAA <$18	;
		LDAA #$01	;
		LDX #$0001	;load index register
		LDAB #$FF	;
		BRA $F8DC	;for timing?
		STAA <$13	;$F8DC
		STX <$16	;$F8DE,store index reg
		STAB <$14	;$F8E0
		LDAB <$15	;
		LDAA <$0A	;$F8E4
		LSRA		;logical shift right
		LSRA		;
		LSRA		;
		EORA <$0A	;exclusive OR
		LSRA		;
		ROR >$0009	;rotate right
		ROR >$000A	;
		LDAA #$00	;
		BCC $F8F8	;branch if Carry clear
		LDAA <$14	;
		STAA >$0400	;$F8F8,DAC output
		LDX <$16	;load index reg
		DEX			;$F8FD,decrement index reg
		BNE $F8FD	;branch if != 0
		DECB		;
		BNE $F8E4	;
		LDAB <$14	;
		SUBB <$13	;subtract B
		BEQ $F912	;branch if = 0
		LDX <$16	;load index reg
		INX			;increment index reg
		LDAA <$18	;
		BEQ $F8E0	;branch if = 0
		BRA $F8DE	;branch always
		RTS			;return subroutine
		LDAB #$01	;Synth4(?),W vector
		STAB <$04	;
		CLRA		;clear A
		STAA <$19	;
		BRA $F930	;branch always
		CLRA		;W vector
		STAA <$19	;
		LDAB #$03	;
		BRA $F930	;branch always
		LDAA #$01	;W vector
		STAA <$19	;
		LDX #$03E8	;load index reg
		LDAA #$01	;
		LDAB #$FF	;
		BRA $F930	;branch always
		STAA <$18	;$F930
		STAB <$13	;
		STX <$16	;store index register
		CLR >$0015	;clear
		LDX <$16	;$F939,load index reg
		LDAA >$0400	;DAC
		TAB			;$F93E,transfer accums
		LSRB		;logical shift right
		LSRB		;
		LSRB		;
		EORB <$0A	;exclusive OR
		LSRB		;
		ROR >$0009	;rotate right
		ROR >$000A	;
		LDAB <$13	;
		TST >$0019	;test for 0 or negative
		BEQ $F954	;branch if = 0
		ANDB <$09	;logical and
		STAB <$14	;$F954
		LDAB <$15	;
		CMPA <$0A	;compare
		BHI $F96E	;branch if higher
		DEX			;$F95C,decr index reg
		BEQ $F985	;
		STAA >$0400	;DAC output
		ADDB <$15	;
		ADCA <$14	;add with Carry
		BCS $F97E	;branch if Carry set
		CMPA <$0A	;
		BLS $F95C	;branch if lower or same
		BRA $F97E	;
		DEX			;$F96E
		BEQ $F985	;
		STAA >$0400	;DAC output
		SUBB <$15	;
		SBCA <$14	;subtract with Carry
		BCS $F97E	;
		CMPA <$0A	;
		BHI $F96E	;branch if higher
		LDAA <$0A	;$F97E
		STAA >$0400	;DAC output
		BRA $F93E	;
		LDAB <$18	;$F985
		BEQ $F93E	;
		LDAA <$13	;
		LDAB <$15	;
		LSRA		;logical shift right
		RORB		;rotate right
		LSRA		;
		RORB		;
		LSRA		;
		RORB		;
		COMA		;complement
		NEGB		;negate
		SBCA #$FF	;subtract with Carry
		ADDB <$15	;
		ADCA <$13	;add with Carry
		STAB <$15	;
		STAA <$13	;
		BNE $F939	;
		CMPB #$07	;
		BNE $F939	;
		RTS			;return subroutine
		LDAA #$FD	;Synth5(?),W vector
		STAA <$0F	;
		LDX #$0064	;
		STX <$0B	;
		ADDB <$0C	;$F9AF
		LDAA <$11	;
		ADCA <$0B	;
		STAA <$11	;
		LDX <$0B	;
		BCS $F9BF	;branch if Carry set
		BRA $F9BD	;
		BRA $F9C2	;$F9BD
		INX			;$F9BF
		BEQ $F9D3	;branch if = 0
		STX <$0B	;$F9C2
		ANDA #$0F	;
		ADDA #$9A	;
		STAA <$10	;
		LDX <$0F	;
		LDAA $00,X	;
		STAA >$0400	;DAC output
		BRA $F9AF	;
		RTS			;return subroutine
		CLRA		;Synth6(PWM?),W vector
		STAA >$0400	;DAC output
		STAA <$11	;
		CLRA		;$F9DA
		CMPA <$11	;$F9DB
		BNE $F9E2	;
		COM >$0400	;DAC invert
		LDAB #$12	;$F9E2
		DECB		;$F9E4
		BNE $F9E4	;
		INCA		;
		BPL $F9DB	;branch if plus
		COM >$0400	;DAC invert
		INC >$0011	;
		BPL $F9DA	;branch if plus
		RTS			;return subroutine
		LDX #$0013	;Synth7(?),W vector
		CLR $00,X	;$F9F6,clear
		INX			;
		CPX #$001B	;compare index reg
		BNE $F9F6	;branch if != 0
		LDAA #$40	;
		STAA <$13	;
		LDX #$0013	;$FA02
		LDAA #$80	;
		STAA <$11	;
		CLRB		;
		LDAA $01,X	;$FA0A,expr,X = index
		ADDA $00,X	;
		STAA $01,X	;
		BPL $FA14	;branch if plus
		ADDB <$11	;
		LSR >$0011	;$FA14,logical shift right
		INX			;
		INX			;
		CPX #$001B	;compare index reg
		BNE $FA0A	;
		STAB >$0400	;DAC output
		INC >$0012	;
		BNE $FA02	;
		LDX #$0013	;
		CLRB		;
		LDAA $00,X	;$FA2A
		BEQ $FA39	;
		CMPA #$37	;
		BNE $FA36	;
		LDAB #$41	;
		STAB $02,X	;
		DEC $00,X	;$FA36
		INCB		;
		INX			;$FA39
		INX			;
		CPX #$00Ib	;
		BNE $FA2A	;
		TSTB		;test if 0 or minus
		BNE $FA02	;
		RTS			;return subroutine
		DEC >$0008	;$FA44,Support,W vector?
		RTS			;return subroutine
		CLR >$0008	;$FA48,Support?
		STAA <$11	;store coutdown value
		LDX #$FDAA	;start point
		LDAA $00,X	;$FA50
		BEQ $FA81	;
		DEC >$0011	;
		BEQ $FA5F	;if countdown reach 0
		INCA		;
		JSR CalOfSt	;adjust X by A
		BRA $FA50	;
		INX			;$FA5F
		STX <$0F	;
		JSR CalOfSt	;adjust X by A
		STX <$0D	;
		LDX <$0F	;
		LDAA $00,X	;$FA69
		STAA <$15	;
		LDAA $01,X	;
		LDX $02,X	;
		STX <$13	;
		BSR $FAB3	;branch to subroutine
		LDX <$0F	;
		INX			;
		INX			;
		INX			;
		INX			;
		STX <$0F	;
		CPX <$0D	;compare index reg
		BNE $FA69	;
		JMP $FD0E	;jump from here
		LDAA #$03	;$FA84,W vector
		STAA <$08	;init count?
		RTS			;return subroutine
		DEC >$0008	;$FA89
		BEQ $FA9A	;
		LDAB <$15	;
		ASLB		;arithmetic shift left
		ASLB		;
		ASLB		;
		ASLB		;
		ABA			;add accums
		STAA <$15	;
		CLRA		;
		BRA $FA98	;$FA98
		DECA		;
		CMPA #$0B	;
		BLS $FAA0	;branch if lower or same
		CLRA		;
		LDX #$FE41	;
		JSR CalOfSt	;
		LDAA $00,X	;
		LDX #$FFFF	;
		STX <$13	;
		BSR $FAB3	;branch to subroutine
		BSR $FADB	;$FAAF,branch to subroutine
		BRA $FAAF	;
		LDX #$0016	;$FAB3,subroutine
		CMPA #$00	;$FAB6
		BEQ $FACF	;
		CMPA #$03	;
		BEQ $FAC7	;
		LDAB #$01	;
		STAB $00,X	;
		INX			;
		SUBA #$02	;
		BRA $FAB6	;
		LDAB #$91	;$FAC7
		STAB $00,X	;
		CLR $01,X	;
		INX			;
		INX			;
		LDAB #$7E	;$FACF
		STAB $00,X	;
		LDAB #$FA	;
		STAB $00,X	;
		LDAB #$DD	;
		STAB $02,X	;
		LDX <$13	;$FADB,subroutine
		CLRA		;
		LDAB >$0012	;
		INCB		;
		STAB <$12	;
		ANDB <$15	;
		LSRB		;logical shift right
		ADCA #$00	;add with Carry
		LSRB		;
		ADCA #$00	;
		LSRB		;
		ADCA #$00	;
		LSRB		;
		ADCA #$00	;
		LSRB		;
		ADCA #$00	;
		LSRB		;
		ADCA #$00	;
		LSRB		;
		ADCA #$00	;
		ABA			;add accums
		ASLA		;
		ASLA		;
		ASLA		;
		ASLA		;
		STAA >$0400	;DAC output
		DEX			;decr index reg
		BEQ $FB09	;
		JMP $0016	;
		RTS			;$FB09,return subroutine
		PSHA		;push data,sub routine
		LDAA $00,X	;$FB0B,load from X
		STX <$0D	;store index reg
		LDX <$0F	;
		STAA $00,X	;
		INX			;
		STX <$0F	;
		LDX <$0D	;
		INX			;
		DECB		;
		BNE $FB0B	;
		PULA		;pull data
		RTS			;return subroutine
		CLRA		;W vector
		STAA <$04	;
		STAA <$05	;
		RTS			;return subroutine
		CLR >$0004	;W vector
		LDAA <$05	;
		ANDA #$7F	;
		CMPA #$1D	;
		BNE $FB30	;
		CLRA		;
		INCA		;$FB30
		STAA <$05	;
		RTS			;return subroutine
		LDAA #$0E	;
		JSR $FB81	;
		LDAA <$05	;
		ASLA		;
		ASLA		;
		COMA		;
		JSR $FC39	;jump subrtn
		INC >$0017	;$FB41
		JSR $FC3B	;jump subrtn
		BRA $FB41	;
		LDAA #$03	;W vector,get 3rd set from table
		JSR $F82A	;get from boot area
		LDAB <$06	;
		CMPB #$1F	;is it 31?
		BNE $FB55	;if not, branch
		CLRB		;if is, set to 0
		INCB		;$FB55, increment it
		STAB <$06	;
		LDAA #$20	;
		SBA			;subtract accums
		CLRB		;
		CMPA #$14	;$FB5C
		BLS $FB65	;branch if lower or same
		ADDB #$0E	;
		DECA		;
		BRA $FB5C	;
		ADDB #$05	;$FB65
		DECA		;
		BNE $FB65	;
		STAB <$13	;
		JSR $F83F	;$FB6C
		BRA $FB6C	;
		LDAA <$07	;W vector
		BNE $FB7E	;
		INC >$0007	;
		LDAA #$0D	;
		BSR $FB81	;branch to subrtn
		BRA $FBE7	;
		JMP $FC2E	;
		TAB			;$FB81, transfer accums
		ASLB		;
		ABA			;add accums
		ABA			;
		ABA			;
		LDX #$FEEC	;
		JSR CalOfSt	;
		LDAA $00,X	;
		TAB			;
		ANDA #$0F	;
		STAA <$14	;
		LSRB		;logical shift right
		LSRB		;
		LSRB		;
		LSRB		;
		STAB <$13	;
		LDAA $01,X	;
		TAB			;
		LSRB		;
		LSRB		;
		LSRB		;
		LSRB		;
		STAB <$15	;
		ANDA #$0F	;
		STAA <$11	;
		STX <$0B	;
		LDX #$FE4D	;
		DEC >$0011	;$FBAB
		BMI $FBB8	;branch if minus
		LDAA $00,X	;
		INCA		;
		JSR CalOfSt	;
		BRA $FBAB	;
		STX <$18	;
		JSR $FC75	;
		LDX <$0B	;
		LDAA $02,X	;
		STAA <$1A	;
		JSR $FC87	;
		LDX <$0B	;
		LDAA $03,X	;
		STAA <$16	;
		LDAA $04,X	;
		STAA <$17	;
		LDAA $05,X	;
		TAB			;
		LDAA $06,X	;
		LDX #$FF55	;
		JSR CalOfSt	;
		TBA			;transfer accums
		STX <$1B	;
		CLR >$0023	;
		JSR CalOfSt	;
		STX	<$1D	;
		RTS			;return subroutine
		LDAA <$13	;
		STAA <$22	;
		LDX <$1B	;$FBEB
		STX <$0D	;
		LDX <$0D	;$FBEF
		LDAA $00,X	;
		ADDA <$23	;
		STAA <$21	;
		CPX <$1D	;
		BEQ $FC21	;
		LDAB <$14	;
		INX			;
		STX <$0D	;
		LDX #$0024	;$FC00
		LDAA <$21	;$FC03
		DECA		;$FC05
		BNE $FC05	;
		LDAA $00,X	;
		STAA >$0400	;DAC output
		INX			;
		CPX <$1F	;
		BNE $FC03	;
		DECB		;
		INX			;
		DEX			;
		INX			;
		DEX			;
		INX			;
		DEX			;
		INX			;
		DEX			;
		NOP			;no operation
		NOP			;
		BRA $FC00	;
		LDAA <$15	;
		BSR $FC87	;branch to subrtn
		DEC >$0022	;
		BNE $FBEB	;
		LDAA <$07	;
		BNE $FC74	;
		LDAA <$16	;
		BEQ $FC74	;
		DEC >$0017	;
		BEQ $FC74	;
		ADDA <$23	;
		STAA <$23	;
		LDX <$1B	;
		CLRB		;
		LDAA <$23	;$FC3E
		TST >$0016	;test for zero or negative
		BMI $FC4B	;branch if minus
		ADDA $00,X	;
		BCS $FC51	;branch if Carry set
		BRA $FC56	;
		ADDA $00,X	;
		BEQ $FC51	;
		BCS $FC56	;
		TSTB		;$FC51
		BEQ $FC5C	;
		BRA $FC65	;
		TSTB		;$FC56
		BNE $FC5C	;
		STX <$1B	;
		INCB		;
		INX			;$FC5C
		CPX <$1D	;
		BNE $FC3E	;
		TSTB		;
		BNE $FC65	;
		RTS			;return subroutine
		STX <$1D	;$FC65
		LDAA <$15	;
		BEQ $FC71	;
		BSR $FC75	;
		LDAA <$1A	;
		BSR $FC87	;
		JMP $FBE7	;$FC71
		RTS			;return subroutine
		LDX #$0024	;$FC75
		STX <$0F	;
		LDX <$18	;
		LDAB $00,X	;
		INX			;
		JSR $FB0A	;
		LDX <$0F	;
		STX <$1F	;
		RTS			;return subroutine
		TSTA		;test A
		BEQ $FCB5	;
		LDX <$18	;
		STX <$0D	;
		LDX #$0024	;
		STAA <$12	;
		STX <$0F	;
		LDX <$0D	;
		LDAB <$12	;
		STAB <$11	;
		LDAB $01,X	;
		LSRB		;
		LSRB		;
		LSRB		;
		LSRB		;
		INX			;
		STX <$0D	;
		LDX <$0F	;
		LDAA $00,X	;
		SBA			;subtract accums
		DEC >$0011	;
		BNE $FCA8	;
		STAA $00,x	;
		INX			;
		CPX <$1F	;
		BNE $FC93	;
		RTS			;return subroutine
IRQ		LDS #$007F	;IRQ handler,select sound,load stack pointer
		LDAA >$0402 ;PIA channel B
		CLI			;clear interrupt mask
		COMA		;complement,flip bits
		ANDA #$1F	;mask upper 3 bits
		LDAB <$08	;
		BEQ $FCCD	;branch if = 0
		BPL $FCC9	;branch if plus
		JSR $FA48	;
		DECA		;start > 0
		JSR $FA89	;
		CLRB		;
		CMPA #$0E	;
		BEQ $FCD4	;
		STAB <$06	;
		CMPA #$12	;
		BEQ $FCDA	;
		STAB <$07	;
		LDAB >$EFFD	;$FCDA, ?
		CMPB #$7E	;
		BNE $FCE4	;
		JSR $EFFD	;?
		TSTA		;
		BEQ $FD0E	;
		DECA		;
		CMPA #$0C	;
		BHI $FCF4	;branch if higher
		JSR $FB81	;
		JSR $FBE7	;
		BRA $FD0E	;
		CMPA #$1B	;
		BHI $FD06	;
		SUBA #$0D	;
		ASLA		;x 2 for offset in table
		LDX #$FD58	;addr VectorW table
		BSR CalOfSt	;calc offset into table
		LDX $00,X	;load vector addr
		JSR $00,X	;
		BRA $FD0E	;
		SUBA #$1C	;
		JSR $F82A	;
		JSR $F83F	;
		LDAA <$04	;$FD0E
		ORAA <$05	;inclusive OR accum
		BEQ $FD12	;
		CLRA		;
		STAA <$07	;
		LDAA <$04	;
		BEQ $FD1E	;
		JMP $F913	;
		JMP $FB34	;
CalOfSt	STX <$0D	;subrtn, unsigned offset of A + X, val in X
		ADDA <$0E	;add A to LSB of index base value
		STAA <$0E	;store it
		BCC $FD2C	;branch if Carry clear
		INC >$000D	;inc MSB of index base value
		LDX <$0D	;load value
		RTS			;return subroutine
NMI		SEI			;set interrupt mask, vector at $FFFC
		LDS #$007F	;load stack pointer
		LDX #$FFFF	;load index reg
		CLRB		;
		ADCB $00,X	;$FD37,add with Carry
		DEX			;
		CPX #$F800	;
		BNE $FD37	;
		CMPB $00,X	;
		BEQ $FD44	;
		WAI			; wait for interrupt
		LDAA #$01	;
		JSR $F82A	;
		JSR $F83F	;
		LDAB >$EFFA	;
		CMPB #$7E	;
		BNE NMI		;branch if != 0 to NMI
		JSR $EFFA	;
		BRA NMI		;