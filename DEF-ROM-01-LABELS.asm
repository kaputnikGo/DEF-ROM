        ORG $F800     ;origin
        FCB $FF		    ;form constant byte <- should not be here ?
RESET	  SEI           ;disable interrupts, set interrupt mask
        LDS #$007F    ;load stack pointer to top of RAM
        LDX #$0400    ;load index reg with PIA (DAC)
        CLR $01,X     ;clear, index x, switch to DDR
        CLR $03,X     ;clear, index x, and for 2nd port
        LDAA #$FF	    ;load A with data
        STAA $00,X    ;all outputs on chn A
        CLR $02,X	    ;all inputs on chn B
        LDAA #$37	    ;CB2 is output, output reg selected
        STAA $03,X	  ;IRQB on low to hi, enabled
        LDAA #$3C	    ;CA2 is output, output reg selected
        STAA $01,X	  ;IRQA on hi to low, disabled
        STAA <$09	    ;store accum A
        CLRA		      ;clear accum A
        STAA <$07	    ;store accum A into addr
        STAA <$04
        STAA <$05
        STAA <$06
        STAA <$08
        CLI			      ;clear interrupt mask, enable interrupts
STDBY   BRA STDBY	    ;F828, wait here (F828) for interrupt 
                      ;
PARAM1  TAB			      ;F82A, PARAM 1, transfer accums
        ASLA		      ;shift left A
        ASLA		      ;shift left A
        ASLA		      ;A x 8
        ABA			      ;add accums, A x 8 + A = 9A
        LDX #$0013	  ;load in X
        STX <$0f	    ;store in zero page
        LDX #$FD76	  ;load waveform from table? SAW
        JSR CALCOS	  ;FD21,calcs X + A -> X
        LDAB #$09	    ;
        JMP UTIL1	    ;jumps below, FB0A
                      ;
SYNTH1  LDAA <$1B	    ;F83F, SYNTH1 (boot), vol (always $FF), VARI, VAMP, Variable Duty Cycle Square Wave Routine
DAC1    STAA >$0400	  ;DAC output, SOUND
LOOP1   LDAA <$13	    ;F844, load accum A, MAIN LOOP START, LOPER
        STAA <$1C	    ;store accum A, LOCNT
        LDAA <$14	    ;load accum A, HIPER
        STAA <$1D	    ;store accum A, HICNT
        LDX <$18	    ;F84C, load index, SUB LOOP 1, SWPDT
        LDAA <$1C	    ;F84E, load accum A, alt 0-255, variable delay, SUB LOOP 2, LOCNT, LO CYCLE
DAC2    COM >$0400	  ;complement DAC, invert, SOUND
        DEX			      ;F853, decrement index, SUB LOOP 3
        BEQ $F866	    ;branch below if = 0, goto SUB LOOP 5, VSWEEP
        DECA		      ;decr A
        BNE $F853	    ;branch above if != 0, goto SUB LOOP 3
DAC3    COM >$0400	  ;complement DAC, invert, SOUND
        LDAA <$1D	    ;F85E, load accum A, SUB LOOP 4, HICNT, HI CYCLE
        DEX			      ;decrement index
        BEQ $F866	    ;branch below if = 0, goto SUB LOOP, VSWEEP
        DECA		      ;decr A
        BNE $F85E	    ;branch above != 0, goto SUB LOOP 4
        BRA $F84E	    ;branch above always, goto SUB LOOP 2
DAC4    LDAA >$0400	  ;F866, load accum DAC, SUB LOOP 5, SOUND
        BMI $F86C	    ;branch below if minus
        COMA		      ;complement A
        ADDA #$00	    ;F86C, add 0 to A
        STAA >$0400	  ;DAC invert, SOUND, OUTPUT
        LDAA <$1C	    ;load accum A with value at location 1C, LOCNT
        ADDA <$15	    ;add A, LODT
        STAA <$1C	    ;store accum A, LOCNT
        LDAA <$1D	    ;load accum A, HICNT
        ADDA <$16	    ;add A, HIDT
        STAA <$1D	    ;store accum A, HICNT
        CMPA <$17	    ;compare A, HIEN
        BNE $F84C	    ;branch above if != 0, goto SUB LOOP 1
        LDAA <$1A	    ;load accum A, LOMOD
        BEQ EXIT1	    ;branch below if = 0, goto EXIT1, F88B, VARX
        ADDA <$13	    ;add A, LOPER
        STAA <$13	    ;store A, LOPER
        BNE LOOP1	    ;branch above, F844, if != 0, goto MAIN LOOP
EXIT1   RTS			      ;F88B, return, EXIT1
                      ;
PARAM2  LDAA #$01	    ;F88C, PARAM2
        STAA <$1A	    ;
        LDAB #$03	    ;
        BRA $F89E	    ;branch below
                      ;
SYNTH2 LDAA #$FE	    ;F894, W vector, SYNTH 2 (pwm?) cont
        STAA <$1a	    ;
        LDAA #$C0	    ;
        LDAB #$10	    ;
        BRA $F89E	    ;branch below
        STAA <$19	    ;F89E
        LDAA #$FF	    ;
DAC5    STAA >$0400	  ;store A to DAC
        STAB <$15	    ;
LOOP2   LDAB <$15	    ;F8A7, MAIN LOOP START
        LDAA <$0A	    ;F8A9, SUB LOOP 1
        LSRA		      ;logical shift right
        LSRA		      ;
        LSRA		      ;
        EORA <$0A	    ;exclusive OR A
        LSRA		      ;
        ROR >$0009	  ;rotate right
        ROR >$000A	  ;
        BCC $F8BC	    ;branch below if Carry clear
DAC6    COM >$0400	  ;DAC invert
        LDAA <$19	    ;F8BC
        DECA		      ;F8BE,decrement A
        BNE $F8BE	    ;branch above if != 0
        DECB		      ;decrement B
        BNE $F8A9	    ;branch above if != 0, goto SUB LOOP 1
        LDAA <$19	    ;
        ADDA <$1A	    ;
        STAA <$19	    ;
        BNE LOOP2	    ;branch to F8A7 above if != 0, MAIN LOOP END
EXIT2   RTS			      ;F8CC, return, EXIT2
                      ;
SYNTH3  LDAA #$20	    ;F8CD, W vector, SYNTH3
        STAA <$15	    ;
        STAA <$18	    ;
        LDAA #$01	    ;
        LDX #$0001	  ;load index
        LDAB #$FF	    ;
        BRA $F8DC	    ;branch below
        STAA <$13	    ;F8DC
LOOP3   STX <$16	    ;F8DE,store index, MAIN LOOP START
        STAB <$14	    ;F8E0, SUB LOOP 1
        LDAB <$15	    ;
        LDAA <$0A	    ;F8E4
        LSRA		      ;logical shift right
        LSRA		      ;
        LSRA		      ;
        EORA <$0A	    ;exclusive OR
        LSRA		      ;
        ROR >$0009	  ;rotate right
        ROR >$000A	  ;
        LDAA #$00	    ;
        BCC $F8F8	    ;branch below if Carry clear
        LDAA <$14	    ;
DAC7    STAA >$0400	  ;F8F8,DAC output
        LDX <$16	    ;load index
        DEX			      ;F8FD,decrement index
        BNE $F8FD	    ;branch above if != 0
        DECB		      ;
        BNE $F8E4	    ;branch above if != 0
        LDAB <$14	    ;
        SUBB <$13	    ;subtract B
        BEQ EXIT3	    ;branch below if = 0, goto EXIT3, F912
        LDX <$16	    ;load index
        INX			      ;increment index
        LDAA <$18	    ;
        BEQ $F8E0	    ;branch above if = 0, goto SUB LOOP 1
        BRA LOOP3	    ;branch above always F8DE, goto MAIN LOOP
EXIT3   RTS			      ;F912, return, EXIT3
                      ;
PARAM3  LDAB #$01	    ;F913, parameters
        STAB <$04   	;
        CLRA		      ;clear A
        STAA <$19	    ;
        BRA SYNTH4	  ;branch below always, F930 SYNTH 4
                      ;
PARAM4  CLRA		      ;F91C, parameters
        STAA <$19	    ;
        LDAB #$03	    ;
        BRA SYNTH4	  ;branch below always, F930 SYNTH 4
                      ;
PARAM5  LDAA #$01	    ;F923, parameters
        STAA <$19	    ;
        LDX #$03E8	  ;load index
        LDAA #$01	    ;load accum A
        LDAB #$FF	    ;load accum B 
        BRA SYNTH4	  ;branch below always, F930 SYNTH 4
                      ;
SYNTH4  STAA <$18	    ;F930, W vector, SYNTH 4
        STAB <$13	    ;
        STX <$16	    ;store index
        CLR >$0015	  ;clear
LOOP4   LDX <$16	    ;F939,load index, MAIN LOOP START
DAC8    LDAA >$0400	  ;F93B, DAC
        TAB			      ;F93E,transfer accums, SUB LOOP 1
        LSRB		      ;logical shift right
        LSRB		      ;
        LSRB		      ;
        EORB <$0A	    ;exclusive OR
        LSRB		      ;
        ROR >$0009	  ;rotate right
        ROR >$000A	  ;
        LDAB <$13	    ;
        TST >$0019	  ;test for 0 or negative at location
        BEQ $F954	    ;branch below if = 0
        ANDB <$09	    ;logical and
        STAB <$14	    ;F954
        LDAB <$15	    ;
        CMPA <$0A	    ;compare
        BHI $F96E	    ;branch below if higher, goto SUB LOOP 3
        DEX			      ;F95C, decr index, SUB LOOP 2
        BEQ $F985	    ;branch below if = 0
DAC9    STAA >$0400	  ;F95F, DAC output
        ADDB <$15	    ;
        ADCA <$14	    ;add with Carry
        BCS $F97E	    ;branch below if Carry set, goto SUB LOOP 4
        CMPA <$0A	    ;compare A
        BLS $F95C	    ;branch above if lower or same, goto SUB LOOP 2
        BRA $F97E	    ;branch below always, goto SUB LOOP 4
        DEX			      ;F96E, SUB LOOP 3
        BEQ $F985	    ;branch below if = 0, goto SUB LOOP 5
DAC10   STAA >$0400	  ;F971, DAC output
        SUBB <$15	    ;
        SBCA <$14	    ;subtract with Carry
        BCS $F97E	    ;branch below if carry, goto SUB LOOP 4
        CMPA <$0A	    ;
        BHI $F96E	    ;branch above if higher, goto SUB LOOP 3
        LDAA <$0A	    ;F97E, SUB LOOP 4
DAC11   STAA >$0400	  ;F980, DAC output
        BRA $F93E	    ;branch above always, goto SUB LOOP 1
        LDAB <$18	    ;F985, SUB LOOP 5
        BEQ $F93E	    ;branch above if = 0, goto SUB LOOP 1
        LDAA <$13	    ;
        LDAB <$15	    ;
        LSRA		      ;logical shift right
        RORB		      ;rotate right
        LSRA		      ;
        RORB		      ;
        LSRA		      ;
        RORB	      	;
        COMA	      	;complement
        NEGB		      ;negate
        SBCA #$FF	    ;subtract with Carry
        ADDB <$15	    ;
        ADCA <$13	    ;add with Carry
        STAB <$15	    ;
        STAA <$13	    ;
        BNE LOOP4	    ;branch above if != 0, F939, goto MAIN LOOP
        CMPB #$07	    ;
        BNE LOOP4   	;branch above if != 0,F939, goto MAIN LOOP
EXIT4   RTS			      ;F9A5, return , EXIT
                      ;
SYNTH5  LDAA #$FD	    ;F9A6, W vector, SYNTH5
        STAA <$0F	    ;
        LDX #$0064	  ;load index
        STX <$0B	    ;
LOOP5   ADDB <$0C	    ;F9AF, MAIN LOOP start
        LDAA <$11	    ;
        ADCA <$0B	    ;
        STAA <$11	    ;
        LDX <$0B	    ;
        BCS $F9BF	    ;branch below if Carry set
        BRA $F9BD	    ;branch below
        BRA $F9C2	    ;F9BD, branch below, goto SUB LOOP 1
        INX			      ;F9BF
        BEQ EXIT5	    ;branch below if = 0, F9D3
        STX <$0B	    ;F9C2, SUB LOOP 1
        ANDA #$0F	    ;and A 
        ADDA #$9A	    ;add A 
        STAA <$10   	;
        LDX <$0F	    ;
        LDAA $00,X	  ;load accum A with value at $00 added with index
DAC12   STAA >$0400	  ;DAC output
        BRA LOOP5	    ;branch above, F9AF, goto MAIN LOOP
EXIT5   RTS			      ;F9D3, return, EXIT5
                      ;
SYNTH6  CLRA		      ;F9D4, W vector, SYNTH6(PWM?)
DAC13   STAA >$0400	  ;DAC output
        STAA <$11	    ;
LOOP6   CLRA		      ;F9DA, MAIN LOOP start
        CMPA <$11	    ;F9DB, SUB LOOP 1
        BNE $F9E2	    ;branch below if != 0
DAC14   COM >$0400	  ;DAC invert
        LDAB #$12	    ;F9E2, load B 
        DECB		      ;F9E4
        BNE $F9E4	    ;branch above if != 0
        INCA		      ;
        BPL $F9DB   	;branch above if plus, goto SUB LOOP 1
DAC15   COM >$0400	  ;DAC invert
        INC >$0011	  ;
        BPL LOOP6	    ;branch above if plus, F9DA, goto MAIN LOOP
EXIT6   RTS			      ;F9F2, return, EXIT
                      ;
SYNTH7  LDX #$0013	  ;F9F3,W vector, SYNTH 7
        CLR $00,X	    ;F9F6,clear
        INX			      ;
        CPX #$001B	  ;compare index 
        BNE $F9F6	    ;branch above if != 0
        LDAA #$40	    ;load A 
        STAA <$13	    ;
LOOP7   LDX #$0013	  ;FA02, MAIN LOOP start
        LDAA #$80	    ;load A
        STAA <$11	    ;
        CLRB		      ;
        LDAA $01,X	  ;FA0A, SUB LOOP 1, $01 value plus index
        ADDA $00,X	  ;$00 value plus index
        STAA $01,X	  ;$01 value plus index
        BPL $FA14	    ;branch below if plus
        ADDB <$11	    ;
        LSR >$0011	  ;FA14,logical shift right
        INX			      ;
        INX			      ;
        CPX #$001B	  ;compare index 
        BNE $FA0A	    ;branch above if != 0, goto SUB LOOP 1
DAC16   STAB >$0400	  ;DAC output
        INC >$0012	  ;
        BNE LOOP7	    ;branch above if != 0, FA02, goto MAIN LOOP
        LDX #$0013	  ;
        CLRB		      ;
        LDAA $00,X	  ;FA2A, SUB LOOP 2
        BEQ $FA39	    ;branch below if = 0
        CMPA #$37	    ;compare 
        BNE $FA36	    ;branch below if != 0
        LDAB #$41	    ;load B
        STAB $02,X	  ;
        DEC $00,X	    ;FA36
        INCB		      ;
        INX			      ;FA39
        INX			      ;
        CPX #$001B	  ;
        BNE $FA2A	    ;branch above if != 0, goto SUB LOOP 2
        TSTB		      ;test if 0 or minus
        BNE LOOP7	    ;branch above if != 0, FA02, goto MAIN LOOP
EXIT7   RTS			      ;FA43, return, EXIT
                      ;
PARAM6  DEC >$0008	  ;FA44  
        RTS			      ;return
                      ;
PARAM7  CLR >$0008	  ;FA48, param 7
        STAA <$11	    ;store countdown value
        LDX #$FDAA	  ;load waveform from table?
        LDAA $00,X	  ;FA50
        BEQ $FA81	    ;branch below if = 0
        DEC >$0011	  ;
        BEQ $FA5F	    ;branch below if = 0
        INCA		      ;
        JSR CALCOS	  ;jump sub to CALCOS adjust X by A
        BRA $FA50	    ;branch above
        INX			      ;FA5F
        STX <$0F	    ;
        JSR CALCOS	  ;jump sub to CALCOS adjust X by A
        STX <$0D	    ;
        LDX <$0F	    ;
        LDAA $00,X	  ;FA69
        STAA <$15	    ;
        LDAA $01,X	  ;
        LDX $02,X	    ;
        STX <$13	    ;
        BSR $FAB3	    ;branch below
        LDX <$0F	    ;
        INX			      ;
        INX			      ;
        INX			      ;
        INX			      ;
        STX <$0F	    ;
        CPX <$0D	    ;compare index
        BNE $FA69	    ;branch above if != 0
        JMP IRQ2	    ;FA81, jump below to IRQ2 FD0E
                      ;
PARAM8  LDAA #$03	    ;FA84, param 8
        STAA <$08	    ;init count?
        RTS			      ;return
                      ;
PARAM9  DEC >$0008	  ;FA89, param 9
        BEQ SYNTH8	  ;branch if equal, FA9A
        LDAB <$15	    ;FA8E
        ASLB		      ;arithmetic shift left
        ASLB		      ;
        ASLB		      ;
        ASLB		      ;
        ABA			      ;add accums
        STAA <$15	    ;
        CLRA		      ;
STDBY2  BRA STDBY2	  ;FA98, branch to here FA98
                      ;
SYNTH8  DECA		      ;FA9A, SYNTH8
        CMPA #$0B     ;
        BLS $FAA0	    ;branch if lower or same
        CLRA		      ;
        LDX #$FE41	  ;FAA0, load waveform from table?
        JSR CALCOS	  ;jump sub to CALCOS
        LDAA $00,X	  ;
        LDX #$FFFF	  ;
        STX <$13	    ;
        BSR $FAB3	    ;branch below
        BSR $FADB	    ;FAAF,branch below
        BRA $FAAF	    ;
        LDX #$0016  	;FAB3,SUBRTN
        CMPA #$00	    ;FAB6
        BEQ $FACF	    ;branch below if = 0
        CMPA #$03	    ;
        BEQ $FAC7	    ;branch below if = 0
        LDAB #$01	    ;
        STAB $00,X	  ;
        INX			      ;
        SUBA #$02	    ;
        BRA $FAB6	    ;branch above always
        LDAB #$91	    ;FAC7
        STAB $00,X	  ;
        CLR $01,X	    ;
        INX			      ;
        INX			      ;
        LDAB #$7E	    ;FACF
        STAB $00,X	  ;
        LDAB #$FA	    ;
        STAB $00,X	  ;
        LDAB #$DD	    ;
        STAB $02,X	  ;
        LDX <$13	    ;FADB, SUBRTN
        CLRA		      ;
        LDAB >$0012	  ;
        INCB		      ;
        STAB <$12	    ; TEMPB
        ANDB <$15	    ; OSCIL, MASK OSCILLATORS
        LSRB		      ;logical shift right
        ADCA #$00	    ;add with Carry
        LSRB		      ;
        ADCA #$00	    ;add with carry
        LSRB		      ;
        ADCA #$00	    ;
        LSRB		      ;
        ADCA #$00	    ;
        LSRB		      ;
        ADCA #$00   	;
        LSRB		      ;
        ADCA #$00   	;
        LSRB		      ;
        ADCA #$00   	;
        ABA			      ;add accums
        ASLA		      ;arithmetic shift left
        ASLA		      ;
        ASLA		      ;
        ASLA		      ;
DAC17   STAA >$0400	  ;DAC output, SOUND
        DEX			      ;decr index
        BEQ $FB09	    ;branch below if = 0, ORGAN2
        JMP $0016   	;jump where?, FB06: 7E 00 16; (jmp 22 places in instructions...?), RDELAY
EXIT8   RTS			      ;FB09,return, exit 8, ORGAN2
                      ;
UTIL1   PSHA		      ;FB0A, SUBRTN, push accum A data onto stack, UTIL1, maybe servicing an interrupt
        LDAA $00,X	  ;FB0B,load from X
        STX <$0D	    ;store index
        LDX <$0F	    ;
        STAA $00,X	  ;
        INX			      ;
        STX <$0F	    ;
        LDX <$0D	    ;
        INX			      ;   
        DECB		      ;
        BNE $FB0B	    ;branch above if != 0
        PULA		      ;pull top byte from stack into accum A
        RTS			      ;FB1D, return
                      ;
PARAM10 CLRA		      ;FB1E, param 10
        STAA <$04	    ;
        STAA <$05   	;
        RTS			      ;FB23, return subroutine
                      ;
PARAM11 CLR >$0004	  ;FB24, param 11
        LDAA <$05	    ;
        ANDA #$7F	    ;
        CMPA #$1D	    ;
        BNE $FB30	    ;branch below if != 0
        CLRA		      ;
        INCA		      ;FB30
        STAA <$05	    ;
        RTS			      ;FB33, return
                      ;
UTIL2   LDAA #$0E	    ;FB34, UTIL 2
        JSR $FB81	    ;jump sub below
        LDAA <$05	    ;
        ASLA		      ;
        ASLA		      ;
        COMA		      ;
        JSR $FC39	    ;jump sub below
        INC >$0017	  ;FB41
        JSR $FC3B	    ;jump sub below
        BRA $FB41	    ;FB47, branch above
                      ;
PARAM12 LDAA #$03	    ;FB49, params 12
        JSR PARAM1	  ;jump sub to F82A, PARAM1
        LDAB <$06	    ;
        CMPB #$1F	    ;compare B, is it 31?
        BNE $FB55	    ;branch below if != 0
        CLRB		      ;if is, set to 0
        INCB		      ;$FB55, increment it
        STAB <$06	    ;
        LDAA #$20	    ;
        SBA			      ;subtract accums
        CLRB		      ;
        CMPA #$14	    ;FB5C
        BLS $FB65	    ;branch below if lower or same
        ADDB #$0E	    ;
        DECA		      ;
        BRA $FB5C	    ;branch above
        ADDB #$05	    ;FB65
        DECA		      ;
        BNE $FB65	    ;branch above if != 0
        STAB <$13	    ;
        JSR SYNTH1	  ;FB6C, jump sub to F83F SYNTH1
        BRA $FB6C	    ;branch above
                      ;
PARAM13 LDAA <$07	    ;FB71, W vector, param 13
        BNE $FB7E	    ;
        INC >$0007	  ;
        LDAA #$0D	    ;
        BSR $FB81	    ;FB7A, branch below to subrtn
        BRA SYNTH9	  ;FB7C, branch below FBE7
        JMP $FC2E	    ;FB7E, jump below
                      ;
        TAB			      ;FB81, transfer accums
        ASLB		      ;
        ABA			      ;add accums
        ABA			      ;
        ABA			      ;
        LDX #$FEEC	  ;load waveform from table?
        JSR CALCOS	  ;jump sub
        LDAA $00,X	  ;
        TAB			      ;
        ANDA #$0F	    ;
        STAA <$14	    ;
        LSRB		      ;logical shift right
        LSRB		      ;
        LSRB		      ;
        LSRB		      ;
        STAB <$13	    ;
        LDAA $01,X	  ;
        TAB			      ;
        LSRB		      ;
        LSRB		      ;
        LSRB		      ;
        LSRB		      ;
        STAB <$15	    ;
        ANDA #$0F	    ;
        STAA <$11	    ;
        STX <$0B	    ;
        LDX #$FE4D	  ;load waveform from table?
        DEC >$0011	  ;FBAB
        BMI $FBB8	    ;branch below if minus
        LDAA $00,X	  ;
        INCA		      ;
        JSR CALCOS	  ;jump sub
        BRA $FBAB	    ;
                      ;
        STX <$18	    ;FBB8
        JSR $FC75	    ;jump sub below
        LDX <$0B	    ;
        LDAA $02,X	  ;
        STAA <$1A	    ;
        JSR $FC87	    ;jump sub below
        LDX <$0B	    ;
        LDAA $03,X	  ;
        STAA <$16	    ;
        LDAA $04,X	  ;
        STAA <$17	    ;
        LDAA $05,X	  ;
        TAB			      ;
        LDAA $06,X	  ;
        LDX #$FF55	  ;load waveform from table?
        JSR CALCOS	  ;jump sub
        TBA			      ;transfer accums
        STX <$1B	    ;
        CLR >$0023	  ;
        JSR CALCOS	  ;jump sub
        STX	<$1D	    ;
        RTS			      ;FBE6, return
                      ;
SYNTH9  LDAA <$13	    ;FBE7, SYNTH 9
        STAA <$22	    ;
        LDX <$1B	    ;FBEB
        STX <$0D	    ;
        LDX <$0D	    ;FBEF
        LDAA $00,X	  ;
        ADDA <$23	    ;
        STAA <$21	    ;
        CPX <$1D	    ;
        BEQ PARAM14	  ;branch below if = 0, FC21
        LDAB <$14	    ;
        INX		        ;
        STX <$0D	    ;
LOOP9   LDX #$0024	  ;FC00, LOOP9
        LDAA <$21	    ;FC03
        DECA		      ;FC05
        BNE $FC05	    ;branch above if != 0
        LDAA $00,X	  ;
DAC18   STAA >$0400	  ;DAC output
        INX			      ;
        CPX <$1F	    ;
        BNE $FC03	    ;branch above if != 0
        DECB		      ;
        INX			      ;
        DEX		      	;
        INX		      	;
        DEX		      	;
        INX		      	;
        DEX		       	;
        INX		      	;
        DEX		      	;
        NOP		      	;no operation
        NOP		      	;
        BRA LOOP9	    ;branch above, FC00, goto LOOP9
                      ;
PARAM14 LDAA <$15	    ;FC21, param 14
        BSR PARAM19	  ;branch below to subrtn, FC87
        DEC >$0022	  ;
        BNE $FBEB	    ;branch aobve if != 0
        LDAA <$07	    ;
        BNE P17EXIT	  ;branch not equal, FC74
        LDAA <$16	    ;FC2E
        BEQ P17EXIT	  ;branch below if = 0, FC74
        DEC >$0017	  ;
        BEQ P17EXIT	  ;branch below if = 0, FC74
        ADDA <$23	    ;
        STAA <$23	    ;FC39
        LDX <$1B	    ;FC3B
        CLRB		      ;
        LDAA <$23	    ;FC3E
        TST >$0016	  ;test for zero or negative
        BMI PARAM15	  ;branch below if minus, FC4B
        ADDA $00,X	  ;
        BCS $FC51	    ;branch below if Carry set
        BRA PARAM16	  ;branch below, FC56
                      ;
PARAM15 ADDA $00,X	  ;FC4B, param 15
        BEQ $FC51	    ;branch below if = 0
        BCS PARAM16	  ;branch below if carry, FC56
        TSTB		      ;FC51
        BEQ $FC5C	    ;branch below if = 0
        BRA PARAM17	  ;branch below, FC65
                      ;
PARAM16 TSTB		      ;FC56, param 16
        BNE $FC5C	    ;branch below if != 0
        STX <$1B	    ;
        INCB		      ;
        INX			      ;FC5C
        CPX <$1D	    ;
        BNE $FC3E	    ;branch above if != 0
        TSTB		      ;
        BNE PARAM17	  ;branch below if != 0, FC65
        RTS			      ;return
                      ;
PARAM17 STX <$1D	    ;FC65, param 17
        LDAA <$15	    ;
        BEQ $FC71	    ;branch below if = 0
        BSR PARAM18	  ;branch sub below, FC75
        LDAA <$1A	    ;
        BSR PARAM19	  ;branch sub below, FC87
        JMP SYNTH9	  ;FC71, jump above FBE7
P17EXIT RTS			      ;FC74, return
                      ;
PARAM18 LDX #$0024	  ;FC75, param 18
        STX <$0F	    ;
        LDX <$18	    ;
        LDAB $00,X	  ;
        INX			      ;
        JSR UTIL1	    ;jump sub above FB0A
        LDX <$0F	    ;
        STX <$1F	    ;
        RTS			      ;return
                      ;
PARAM19 TSTA		      ;FC87, test A, param 19
        BEQ EXIT9	    ;branch below if = 0, FCB5
        LDX <$18	    ;
        STX <$0D	    ;
        LDX #$0024	  ;load index
        STAA <$12	    ;
LOOP10  STX <$0F	    ;FC93 , LOOP10
        LDX <$0D	    ;
        LDAB <$12	    ;
        STAB <$11   	;
        LDAB $01,X	  ;
        LSRB		      ;
        LSRB		      ;
        LSRB		      ;
        LSRB		      ;
        INX			      ;
        STX <$0D	    ;
        LDX <$0F	    ;
        LDAA $00,X    ;
        SBA			      ;FCA8, subtract accums
        DEC >$0011	  ;
        BNE $FCA8	    ;branch above if != 0
        STAA $00,x	  ;
        INX			      ;
        CPX <$1F	    ;
        BNE LOOP10	  ;branch above if != 0, FC93, goto LOOP10
EXIT9   RTS			      ;FCB5, return, exit 9
                      ;
IRQ		  LDS #$007F	  ;FCB6, IRQ handler,select sound,load stack pointer, vector at $FFF8
        LDAA >$0402   ;PIA channel B
        CLI			      ;clear interrupt mask
        COMA		      ;complement,flip bits
        ANDA #$1F	    ;mask upper 3 bits
        LDAB <$08	    ;
        BEQ $FCCD	    ;branch below if = 0
        BPL $FCC9	    ;branch below if plus
        JSR PARAM7	  ;jump sub to FA48 PARAM 7
        DECA		      ;FCC9, start > 0
        JSR PARAM9	  ;jump sub above FA89 
        CLRB		      ;FCCD
        CMPA #$0E   	;
        BEQ $FCD4	    ;branch below if = 0
        STAB <$06	    ;
        CMPA #$12	    ;FCD4
        BEQ $FCDA	    ;branch below if = 0
        STAB <$07	    ;
        LDAB >$EFFD	  ;FCDA
        CMPB #$7E	    ;
        BNE $FCE4	    ;
        JSR $EFFD	    ;jump sub ?
        TSTA		      ;
        BEQ IRQ2	    ;branch below FD0E if = 0
        DECA		      ;
        CMPA #$0C	    ;
        BHI $FCF4	    ;branch below if higher
        JSR $FB81	    ;jump sub above to PARAM13 TAB
        JSR SYNTH9	  ;jump sub above FBE7
        BRA IRQ2	    ;branch below FD0E
                      ;
        CMPA #$1B	    ;FCF4
        BHI $FD06	    ;branch below if higher
        SUBA #$0D	    ;
        ASLA		      ;x 2 for offset in table
        LDX #$FD58	  ;load addr VWTAB, W Vector table, into index
        BSR CALCOS	  ;branch sub CALCOS, calc offset into table
        LDX $00,X	    ;load vector addr
        JSR $00,X	    ;jump sub ? W vector addr at index?
        BRA IRQ2	    ;branch below FD0E
                      ;
        SUBA #$1C	    ;FD06
        JSR PARAM1	  ;jump sub to F82A, PARAM1
        JSR SYNTH1	  ;jump sub to F83F, SYNTH1
                      ;
IRQ2    LDAA <$04	    ;FD0E, IRQ2, IRQ sub
        ORAA <$05	    ;inclusive OR accum
        BEQ $FD12	    ;FD12, branch here if = 0
        CLRA		      ;
        STAA <$07	    ;
        LDAA <$04	    ;
        BEQ $FD1E	    ;branch below if = 0
        JMP SYNTH4	  ;jump to F913, SYNTH4
        JMP UTIL2	    ;FD1E, jump above to FB34, UTIL2
                      ;
CALCOS	STX <$0D	    ;FD21, SUBRTN, calculate unsigned offset of A + X, val in X
        ADDA <$0E	    ;add A to LSB of index base value
        STAA <$0E	    ;store it
        BCC $FD2C	    ;branch below if Carry clear
        INC >$000D	  ;inc MSB of index base value
        LDX <$0D	    ;FD2C, load value
        RTS			      ;return
                      ;
NMI		  SEI			      ;FD2F, set interrupt mask, vector at $FFFC, Non Maskable Interrupt?
        LDS #$007F	  ;load stack pointer
        LDX #$FFFF	  ;load index
        CLRB		      ;
        ADCB $00,X	  ;FD37,add with Carry
        DEX			      ;
        CPX #$F800	  ;compare index reg to origin
        BNE $FD37	    ;branch above if != 0
        CMPB $00,X	  ;
        BEQ $FD44	    ;branch below if = 0
        WAI			      ;wait for interrupt
        LDAA #$01	    ;FD44
        JSR PARAM1	  ;jump sub to F82A PARAM1
        JSR SYNTH1	  ;jump sub to F83F SYNTH1
        LDAB >$EFFA	  ;
        CMPB #$7E	    ;
        BNE NMI		    ;branch above if != 0
        JSR $EFFA	    ;jump sub ?, was Label 79D0
        BRA NMI		    ;branch above
                      ;
                      ;Vector Table start FD58, form double byte
VWTAB	  FDB $FB49	    ;FD58, W vector FB49, PARAM12
        FDB $F913	    ;FD5A, W vector F913, PARAM3
        FDB $FB24	    ;FD5C, W vector FB24, PARAM11
        FDB $F88C   	;FD5E, W vector F88C, PARAM2
        FDB $FB71	    ;FD60, W vector FB71, PARAM13
        FDB $FB1E	    ;FD62, W vector FB1E, PARAM10
        FDB $F8CD	    ;FD64, W vector F8CD, SYNTH3
        FDB $F894	    ;FD66, W vector F894, SYNTH2
        FDB $F91C	    ;FD68, W vector F91C, PARAM4
        FDB $F923	    ;FD6A, W vector F923, PARAM5
        FDB $F9A6	    ;FD6C, W vector F9A6, SYNTH5
        FDB $F9D4	    ;FD6E, W vector F9D4, SYNTH6
        FDB $F9F3   	;FD70, W vector F9F3, SYNTH7
        FDB $FA44   	;FD72, W vector FA44, PARAM6
        FDB $FA84	    ;FD74, W vector FA84, PARAM8
        
                      ; VARI VECTORS, square wave pulse width modulator
                      ; form constant byte, pseudo-op, single byte or word into object
VVECT   EQU *
SAW     FCB $40,$01,$00,$10,$E1,$00,$80,$FF,$FF ; FD76
FOSHIT  FCB $28,$01,$00,$08,$81,$02,$00,$FF,$FF ; FD7F, FD80
QUASAR  FCB $28,$81,$00,$FC,$01,$02,$00,$FC,$FF ; FD88
CABSHK  FCB $FF,$01,$00,$18,$41,$04,$80,$00,$FF ; FD91
                      ;8c 5b b6 40 bf 49 a4 73 73
                      ;a4 49 bf 40 b6 5b 8c 0c 7f
                      ;1d 0f fb 7f 23 0f 15 fe 08
                      ; below are from diff rom
CSCALE  FCB $00,$FF,$08,$FF,$68,$04,$80,$00,$FF ; FD9A
MOSQTO  FCB $28,$81,$00,$FC,$01,$02,$00,$FC,$FF ; FDA3, dupe QUASAR
VARBG1  FCB $60,$01,$57,$08,$E1,$02,$00,$FE,$80 ; FDAC

;FD76:                    40 01  00 10 e1 00 80 ff ff 28  |...D..@........(|
;FD80:  01 00 08 81 02 00 ff ff  28 81 00 fc 01 02 00 fc  |........(.......|
;FD90:  ff ff 01 00 18 41 04 80  00 ff 8c 5b b6 40 bf 49  |.....A.....[.@.I|
;FDA0:  a4 73 73 a4 49 bf 40 b6  5b 8c 0c 7f 1d 0f fb 7f  |.ss.I.@.[.......|
;FDB0:  23 0f 15 fe 08 
; 50 8b 88 3e 3f 02 3e 7c 04 
; 03 ff 3e 3f 2c e2 7c 12 0d 
; 74 7c 0d 0e 41 7c 23 0b 50
;FDD0:  7c 1d 29 f2 7c 3f 02 3e f8 
; 04 03 ff 7c 3f 2c e2 f8 12 
; 0d 74 f8 0d 0e 41 f8 23 0b 
; 50 f8 1d 2f f2 f8 23 05 a8 
; f8 12 06 ba f8 04 07 ff 7c 
; 37 04 c1 7c 23 05 a8 7c 12 
; 06 ba 3e 04 07 ff 3e 37 04 
; c1 3e 23 05 a8 1f 12 06 ba  
; 1f 04 07 ff 1f 37 04 c1 1f 
; 23 16 a0 fe 1d 17 f9 7f 37 
; 13 06 7f 3f 08 fa fe 04 0f 
; ff fe 0d 0e 41 fe 23 0b 50 
; fe 1d 5f e4 00 47 3f 37 30 
; 29 23 1d 17 12 0d 08 04 08 
; 7f d9 ff d9 7f 24 00 24 08 
; 00 40 80 00 ff 00 80 40 10 ; checked to here
;FE60:  7f b0 d9 f5 ff f5 d9 b0  7f 4e 24 09 00 09 24 4e  |.........N$...$N|
;FE70:  10 7f c5 ec e7 bf 8d 6d  6a 7f 94 92 71 40 17 12  |.......mj...q@..|
;FE80:  39 10 ff ff ff ff 00 00  00 00 ff ff ff ff 00 00  |9...............|
;FE90:  00 00 48 8a 95 a0 ab b5  bf c8 d1 da e1 e8 ee f3  |..H.............|
;FEA0:  f7 fb fd fe ff fe fd fb  f7 f3 ee e8 e1 da d1 c8  |................|
;FEB0:  bf b5 ab a0 95 8a 7f 75  6a 5f 54 4a 40 37 2e 25  |.......uj_TJ@7.%|
;FEC0:  1e 17 11 0c 08 04 02 01  00 01 02 04 08 0c 11 17  |................|
;FED0:  1e 25 2e 37 40 4a 54 5f  6a 75 7f 10 59 7b 98 ac  |.%.7@JT_ju..Y{..|
;FEE0:  b3 ac 98 7b 59 37 19 06  00 06 19 37 81 24 00 00  |...{Y7.....7.$..|
;FEF0:  00 16 31 12 05 1a ff 00  27 6d 11 05 11 01 0f 01  |..1.....'m......|
;FF00:  47 11 31 00 01 00 0d 1b  f4 12 00 00 00 14 47 41  |G.1...........GA|
;FF10:  45 00 00 00 0f 5b 21 35  11 ff 00 0d 1b 15 00 00  |E....[!5........|
;FF20:  fd 00 01 69 31 11 00 01  00 03 6a 01 15 01 01 01  |...i1.....j.....|
;FF30:  01 47 f6 53 03 00 02 06  94 6a 10 02 00 02 06 9a  |.G.S.....j......|
;FF40:  1f 12 00 ff 10 04 69 31  11 00 ff 00 0d 00 12 06  |......i1........|
;FF50:  00 ff 01 09 28 a0 98 90  88 80 78 70 68 60 58 50  |....(.....xph`XP|
;FF60:  44 40 01 01 02 02 04 04  08 08 10 10 30 60 c0 e0  |D@..........0`..|
;FF70:  01 01 02 02 03 04 05 06  07 08 09 0a 0c 80 7c 78  |..............|x|
;FF80:  74 70 74 78 7c 80 01 01  02 02 04 04 08 08 10 20  |tptx|.......... |
;FF90:  28 30 38 40 48 50 60 70  80 a0 b0 c0 08 40 08 40  |(08@HP`p.....@.@|
;FFA0:  08 40 08 40 08 40 08 40  08 40 08 40 08 40 08 40  |.@.@.@.@.@.@.@.@|
;FFB0:  01 02 04 08 09 0a 0b 0c  0e 0f 10 12 14 16 40 10  |..............@.|
;FFC0:  08 01 01 01 01 01 02 02  03 03 04 04 05 06 08 0a  |................|
;FFD0:  0c 10 14 18 20 30 40 50  40 30 20 10 0c 0a 08 07  |.... 0@P@0 .....|
;FFE0:  06 05 04 03 02 02 01 01  01 07 08 09 0a 0c 08 17  |................|
;FFF0:  18 19 1a 1b 1c 00 00 00  


;	Motorola vector table settings, pointers
;       FDB   IRQ     ;FFF8: FC B6
;       FDB   RESET   ;FFFA: F8 01, Software Interrupt
;       FDB   NMI     ;FFFC: FD 2F
;       FDB   RESET   ;FFFE: F8 01, Hardware Interrupt

 ;	****** Hardware data ******
 ;	Sound 6802/6808 board
 ;	$0000 - $007F RAM 
 ;	$0400 - $0403 PIA 
 ;	$F800 - $FFFF ROM 
 ;	Writing to $400 puts values in the DAC
 
 ; Accumulator        A       8 bits
 ; Accumulator        B       8 bits
 ; Index Register     X       16 bits
 ; Program Counter    PC      16 bits
 ; Stack Pointer      SP      16 bits
 ; Status Register    COSZAc  8 bits (Carry, Overflow, Sign, Zero, Aux Carry)(|1|1|Ac|1|S|Z|O|C|)
 
 ; Memory Addressing
 ; Immediate  #   ADDA #$30   adds value 30(hex) to Accum A
 ; Direct     $   ADDA $30    adds value at location 0030 to accum A
 ; Indexed    ,X  ADDA $30,X  adds value at location 0030 with value of index to Accum A
 
 ; LDX #$FD58 is load the value held at location FD58(vector table) or the value of FD58 (64856 in dec)... ?