        ORG $F800     ;origin
        FCB $FF		    ;form constant byte
RESET	  SEI           ;disable interrupts,set interrupt mask
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
        CLI			      ;enable interrupts
STDBY   BRA STDBY	    ;F828, wait here (F828) for interrupt 
                      ;
PARAM1  TAB			      ;F82A, PARAM 1, transfer accums
        ASLA		      ;shift left A
        ASLA		      ;shift left A
        ASLA		      ;A x 8
        ABA			      ;add accums, A x 8 + A = 9A
        LDX #$0013	  ;load 19 in X
        STX <$0f	    ;store in zero page
        LDX #$FD76	  ;load table addr
        JSR CALCOS	  ;FD21,calcs X + A -> X
        LDAB #$09	    ;put 9 in B
        JMP UTIL1	    ;jumps below, FB0A
                      ;
SYNTH1  LDAA <$1B	    ;F83F, SYNTH1 (boot), vol (always $FF)
DAC1    STAA >$0400	  ;DAC output
LOOP1   LDAA <$13	    ;F844, load accum A, MAIN LOOP START
        STAA <$1C	    ;store accum A
        LDAA <$14	    ;load accum A
        STAA <$1D	    ;store accum A
        LDX <$18	    ;F84C, load index, SUB LOOP 1
        LDAA <$1C	    ;F84E, load accum A, alt 0-255, variable delay, SUB LOOP 2
DAC2    COM >$0400	  ;complement DAC, invert
        DEX			      ;F853, decrement index, SUB LOOP 3
        BEQ $F866	    ;branch below if = 0, goto SUB LOOP 5
        DECA		      ;decr A
        BNE $F853	    ;branch above if != 0, goto SUB LOOP 3
DAC3    COM >$0400	  ;complement DAC, invert
        LDAA <$1D	    ;F85E, load accum A, SUB LOOP 4
        DEX			      ;decrement index
        BEQ $F866	    ;branch below if = 0, goto SUB LOOP
        DECA		      ;decr A
        BNE $F85E	    ;branch above != 0, goto SUB LOOP 4
        BRA $F84E	    ;branch above always, goto SUB LOOP 2
DAC4    LDAA >$0400	  ;F866, load accum DAC, SUB LOOP 5
        BMI $F86C	    ;branch below if minus
        COMA		      ;complement A
        ADDA #$00	    ;F86C, add A
        STAA >$0400	  ;DAC invert
        LDAA <$1C	    ;load accum A
        ADDA <$15	    ;add A
        STAA <$1C	    ;store accum A
        LDAA <$1D	    ;load accum A
        ADDA <$16	    ;add A
        STAA <$1D	    ;store accum A
        CMPA <$17	    ;compare A
        BNE $F84C	    ;branch above if != 0, goto SUB LOOP 1
        LDAA <$1A	    ;load accum A
        BEQ EXIT1	    ;branch below if = 0, goto EXIT1, F88B
        ADDA <$13	    ;add A
        STAA <$13	    ;store A
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
        BNE LOOP2	  ;branch to F8A7 above if != 0, MAIN LOOP END
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
        STX <$16	    ;F8DE,store index, MAIN LOOP START
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
        BRA $F8DE	    ;branch above always, goto MAIN LOOP
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
        LDAA #$01	    ;
        LDAB #$FF	    ;
        BRA SYNTH4	  ;branch below always, F930 SYNTH 4
                      ;
SYNTH4  STAA <$18	    ;F930, W vector, SYNTH 4
        STAB <$13	    ;
        STX <$16	    ;store index
        CLR >$0015	  ;clear
        LDX <$16	    ;F939,load index, MAIN LOOP START
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
        TST >$0019	  ;test for 0 or negative
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
        BNE $F939	    ;branch above if != 0, goto MAIN LOOP
        CMPB #$07	    ;
        BNE $F939   	;branch above if != 0, goto MAIN LOOP
EXIT4   RTS			      ;F9A5, return , EXIT
                      ;
SYNTH5  LDAA #$FD	    ;F9A6, W vector, SYNTH5
        STAA <$0F	    ;
        LDX #$0064	  ;
        STX <$0B	    ;
        ADDB <$0C	    ;F9AF, MAIN LOOP start
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
        ANDA #$0F	    ;
        ADDA #$9A	    ;
        STAA <$10   	;
        LDX <$0F	    ;
        LDAA $00,X	  ;
DAC12   STAA >$0400	  ;DAC output
        BRA $F9AF	    ;branch above, goto MAIN LOOP
EXIT5   RTS			      ;F9D3, return, EXIT5
                      ;
SYNTH6  CLRA		      ;F9D4, W vector, SYNTH6(PWM?)
DAC13   STAA >$0400	  ;DAC output
        STAA <$11	    ;
        CLRA		      ;F9DA, MAIN LOOP start
        CMPA <$11	    ;F9DB, SUB LOOP 1
        BNE $F9E2	    ;branch below if != 0
DAC14   COM >$0400	  ;DAC invert
        LDAB #$12	    ;F9E2
        DECB		      ;F9E4
        BNE $F9E4	    ;branch above if != 0
        INCA		      ;
        BPL $F9DB   	;branch above if plus, goto SUB LOOP 1
DAC15   COM >$0400	  ;DAC invert
        INC >$0011	  ;
        BPL $F9DA	    ;branch above if plus, goto MAIN LOOP
EXIT6   RTS			      ;F9F2, return, EXIT
                      ;
SYNTH7  LDX #$0013	  ;F9F3,W vector, SYNTH 7
        CLR $00,X	    ;F9F6,clear
        INX			      ;
        CPX #$001B	  ;compare index
        BNE $F9F6	    ;branch above if != 0
        LDAA #$40	    ;
        STAA <$13	    ;
        LDX #$0013	  ;FA02, MAIN LOOP start
        LDAA #$80	    ;
        STAA <$11	    ;
        CLRB		      ;
        LDAA $01,X	  ;FA0A, SUB LOOP 1
        ADDA $00,X	  ;
        STAA $01,X	  ;
        BPL $FA14	    ;branch below if plus
        ADDB <$11	    ;
        LSR >$0011	  ;FA14,logical shift right
        INX			      ;
        INX			      ;
        CPX #$001B	  ;compare index 
        BNE $FA0A	    ;branch above if != 0, goto SUB LOOP 1
DAC16   STAB >$0400	  ;DAC output
        INC >$0012	  ;
        BNE $FA02	    ;branch above if != 0, goto MAIN LOOP
        LDX #$0013	  ;
        CLRB		      ;
        LDAA $00,X	  ;FA2A, SUB LOOP 2
        BEQ $FA39	    ;branch below if = 0
        CMPA #$37	    ;
        BNE $FA36	    ;branch below if != 0
        LDAB #$41	    ;
        STAB $02,X	  ;
        DEC $00,X	    ;FA36
        INCB		      ;
        INX			      ;FA39
        INX			      ;
        CPX #$001B	  ;
        BNE $FA2A	    ;branch above if != 0, goto SUB LOOP 2
        TSTB		      ;test if 0 or minus
        BNE $FA02	    ;branch above if != 0, goto MAIN LOOP
EXIT7   RTS			      ;FA43, return, EXIT
                      ;
PARAM6  DEC >$0008	  ;FA44  
        RTS			      ;return
                      ;
PARAM7  CLR >$0008	  ;FA48, param 7
        STAA <$11	    ;store countdown value
        LDX #$FDAA	  ;load index, start point
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
        LDX #$FE41	  ;FAA0
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
        STAB <$12	    ;
        ANDB <$15	    ;
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
DAC17   STAA >$0400	  ;DAC output
        DEX			      ;decr index
        BEQ $FB09	    ;branch below if = 0
        JMP $0016   	;jump above ??
EXIT8   RTS			      ;FB09,return, exit 8
                      ;
UTIL1   PSHA		      ;FB0A, SUBRTN, push data, UTIL1
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
        PULA		      ;pull data
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
        LDX #$FEEC	  ;
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
        LDX #$FE4D	  ;
        DEC >$0011	  ;FBAB
        BMI $FBB8	    ;branch below if minus
        LDAA $00,X	  ;
        INCA		      ;
        JSR CALCOS	  ;jump sub
        BRA $FBAB	    ;
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
        LDX #$FF55	  ;
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
        BEQ $FC21	    ;branch below if = 0
        LDAB <$14	    ;
        INX		        ;
        STX <$0D	    ;
        LDX #$0024	  ;FC00
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
        BRA $FC00	    ;branch above
        LDAA <$15	    ;FC21
        BSR $FC87	    ;branch below to subrtn
        DEC >$0022	  ;
        BNE $FBEB	    ;branch aobve if != 0
        LDAA <$07	    ;
        BNE $FC74	    ;
        LDAA <$16	    ;FC2E
        BEQ $FC74	    ;branch below if = 0
        DEC >$0017	  ;
        BEQ $FC74	    ;branch below if = 0
        ADDA <$23	    ;
        STAA <$23	    ;FC39
        LDX <$1B	    ;FC3B
        CLRB		      ;
        LDAA <$23	    ;FC3E
        TST >$0016	  ;test for zero or negative
        BMI $FC4B	    ;branch below if minus
        ADDA $00,X	  ;
        BCS $FC51	    ;branch below if Carry set
        BRA $FC56	    ;branch below
        ADDA $00,X	  ;FC4B
        BEQ $FC51	    ;branch below if = 0
        BCS $FC56	    ;branch below if carry
        TSTB		      ;FC51
        BEQ $FC5C	    ;branch below if = 0
        BRA $FC65	    ;branch below
        TSTB		      ;FC56, UTIL
        BNE $FC5C	    ;branch below if != 0
        STX <$1B	    ;
        INCB		      ;
        INX			      ;FC5C
        CPX <$1D	    ;
        BNE $FC3E	    ;branch above if != 0
        TSTB		      ;
        BNE $FC65	    ;branch below if != 0
        RTS			      ;return
        STX <$1D	    ;FC65, UTIL
        LDAA <$15	    ;
        BEQ $FC71	    ;branch below if = 0
        BSR $FC75	    ;branch sub below
        LDAA <$1A	    ;
        BSR $FC87	    ;branch sub below
        JMP SYNTH9	  ;FC71, jump above FBE7
        RTS			      ;FC74, return
        LDX #$0024	  ;FC75
        STX <$0F	    ;
        LDX <$18	    ;
        LDAB $00,X	  ;
        INX			      ;
        JSR UTIL1	    ;jump sub above FB0A
        LDX <$0F	    ;
        STX <$1F	    ;
        RTS			      ;return
        TSTA		      ;FC87, test A
        BEQ $FCB5	    ;branch below if = 0
        LDX <$18	    ;
        STX <$0D	    ;
        LDX #$0024	  ;
        STAA <$12	    ;
        STX <$0F	    ;FC93
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
        BNE $FC93	    ;branch above if != 0
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
        JSR $FB81	    ;jump sub above
        JSR SYNTH9	  ;jump sub above FBE7
        BRA IRQ2	    ;branch below FD0E
                      ;
        CMPA #$1B	    ;FCF4
        BHI $FD06	    ;branch below if higher
        SUBA #$0D	    ;
        ASLA		      ;x 2 for offset in table
        LDX #$FD58	  ;addr VWTAB, W Vector table
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
CALCOS	STX <$0D	    ;FD21, SUBRTN, unsigned offset of A + X, val in X
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
        CPX #$F800	  ;
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
        JSR $EFFA	    ;jump sub ?
        BRA NMI		    ;branch above
                      ;
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