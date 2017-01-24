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
        BRA $F828	    ;F828, wait for interrupt
                      ;
        TAB			      ;F82A, SYNTH1(boot), transfer accums
        ASLA		      ;shift left A
        ASLA		      ;shift left A
        ASLA		      ;A x 8
        ABA			      ;add accums, A x 8 + A = 9A
        LDX #$0013	  ;load 19 in X
        STX <$0f	    ;store in zero page
        LDX #$FD76	  ;load table addr
        JSR CALCOS	  ;FD21,calcs X + A -> X
        LDAB #$09	    ;put 9 in B
        JMP $FB0A	    ;jumps below
                      ;
                      ;SUBRTN, Variable Duty Cycle Square Wave Routine
VARI    LDAA <$1B	    ;VAMP -amplitude, F83F
        STAA >$0400	  ;SOUND, DAC output
VAR0    LDAA <$13	    ;LOPER -low period, F844 
        STAA <$1C	    ;LOCNT -lo period counter
        LDAA <$14	    ;HIPER -hi period
        STAA <$1D	    ;HICNT -hi period counter
V0      LDX <$18	    ;SWPDT -sweep period, F84C, load index 
V0LP    LDAA <$1C	    ;LOCNT -lo cycle, F84E, load accum A
        COM >$0400	  ;SOUND, complement DAC, invert
V1      DEX			      ;F853, decrement index
        BEQ $F866	    ;branch VSWEEP below if = 0
        DECA		      ;decr A
        BNE $F853	    ;branch V1 above if != 0
        COM >$0400	  ;SOUND, complement DAC, invert
        LDAA <$1D	    ;HICNT - hi cycle, load accum A
V2      DEX			      ;decrement index
        BEQ $F866	    ;branch VSWEEP below if = 0
        DECA		      ;decr A
        BNE $F85E	    ;branch V2 above != 0
        BRA $F84E	    ;branch V0LP above always, loop back
VSWEEP  LDAA >$0400	  ;SOUND, F866, load accum DAC
        BMI $F86C	    ;branch VS1 below if minus
        COMA		      ;complement A
VS1     ADDA #$00	    ;F86C, add A
        STAA >$0400	  ;SOUND, OUTPUT
        LDAA <$1C	    ;LOCNT, load accum A
        ADDA <$15	    ;LODT -lo period deltas, add A
        STAA <$1C	    ;LOCNT, store accum A
        LDAA <$1D	    ;HICNT, load accum A
        ADDA <$16	    ;HIDT -hi period deltas, add A
        STAA <$1D	    ;HICNT, store accum A
        CMPA <$17	    ;HIEN -end period, compare A
        BNE $F84C	    ;branch V0 above if != 0
        LDAA <$1A	    ;LOMOD -lo base freq mod, load accum A
        BEQ $F88B	    ;branch VARX below if = 0
        ADDA <$13	    ;LOPER -lo period, add A
        STAA <$13	    ;LOPER -lo period, store A
        BNE $F844	    ;branch VAR0 above if != 0
VARX    RTS			      ;F88B, return
                      ;
        LDAA #$01	    ;F88C, SYNTH2(PWM?),W vector
        STAA <$1A	    ;
        LDAB #$03	    ;
        BRA $F89E	    ;branch below
                      ;
        LDAA #$FE	    ;F894, W vector
        STAA <$1a	    ;
        LDAA #$C0	    ;
        LDAB #$10	    ;
                      ;
        BRA $F89E	    ;branch below
        STAA <$19	    ;F89E
        LDAA #$FF	    ;
        STAA >$0400	  ;store A to DAC
        STAB <$15	    ;
        LDAB <$15	    ;F8A7
        LDAA <$0A	    ;F8A9
        LSRA		      ;logical shift right
        LSRA		      ;
        LSRA		      ;
        EORA <$0A	    ;exclusive OR A
        LSRA		      ;
        ROR >$0009	  ;rotate right
        ROR >$000A	  ;
        BCC $F8BC	    ;branch below if Carry clear
        COM >$0400	  ;DAC invert
        LDAA <$19	    ;F8BC
        DECA		      ;F8BE,decrement A
        BNE $F8BE	    ;branch above if != 0
        DECB		      ;decrement B
        BNE $F8A9	    ;branch above if != 0
        LDAA <$19	    ;
        ADDA <$1A	    ;
        STAA <$19	    ;
        BNE $F8A7	    ;branch above if != 0
        RTS			      ;return
                      ;
        LDAA #$20	    ;F8CD, SYNTH3(?), W vector
        STAA <$15	    ;
        STAA <$18	    ;
        LDAA #$01	    ;
                      ;
        LDX #$0001	  ;load index
        LDAB #$FF	    ;
        BRA $F8DC	    ;branch below
        STAA <$13	    ;F8DC
        STX <$16	    ;F8DE,store index
        STAB <$14	    ;F8E0
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
        STAA >$0400	  ;F8F8,DAC output
        LDX <$16	    ;load index
        DEX			      ;F8FD,decrement index
        BNE $F8FD	    ;branch above if != 0
        DECB		      ;
        BNE $F8E4	    ;branch above if != 0
        LDAB <$14	    ;
        SUBB <$13	    ;subtract B
        BEQ $F912	    ;branch below if = 0
        LDX <$16	    ;load index
        INX			      ;increment index
        LDAA <$18	    ;
        BEQ $F8E0	    ;branch above if = 0
        BRA $F8DE	    ;branch above always
        RTS			      ;F912, return
                      ;
        LDAB #$01	    ;F913, SYNTH4(?), W vector
        STAB <$04   	;
        CLRA		      ;clear A
        STAA <$19	    ;
                      ;
        BRA $F930	    ;branch below always
        CLRA		      ;F91C, W vector
        STAA <$19	    ;
        LDAB #$03	    ;
        BRA $F930	    ;branch below always
                      ;
        LDAA #$01	    ;F923, W vector
        STAA <$19	    ;
        LDX #$03E8	  ;load index
        LDAA #$01	    ;
                      ;
        LDAB #$FF	    ;
        BRA $F930	    ;branch below always
        STAA <$18	    ;F930
        STAB <$13	    ;
        STX <$16	    ;store index
        CLR >$0015	  ;clear
        LDX <$16	    ;F939,load index
        LDAA >$0400	  ;DAC
        TAB			      ;F93E,transfer accums
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
        BHI $F96E	    ;branch below if higher
        DEX			      ;F95C, decr index
        BEQ $F985	    ;
        STAA >$0400	  ;DAC output
        ADDB <$15	    ;
        ADCA <$14	    ;add with Carry
        BCS $F97E	    ;branch below if Carry set
        CMPA <$0A	    ;compare A
        BLS $F95C	    ;branch above if lower or same
        BRA $F97E	    ;branch below always
        DEX			      ;F96E
        BEQ $F985	    ;branch below if = 0
        STAA >$0400	  ;DAC output
        SUBB <$15	    ;
        SBCA <$14	    ;subtract with Carry
        BCS $F97E	    ;branch below if carry
        CMPA <$0A	    ;
        BHI $F96E	    ;branch above if higher
        LDAA <$0A	    ;F97E
        STAA >$0400	  ;DAC output
        BRA $F93E	    ;branch above always
        LDAB <$18	    ;F985
        BEQ $F93E	    ;branch above if = 0
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
        BNE $F939	    ;branch above if != 0
        CMPB #$07	    ;
        BNE $F939   	;branch above if != 0
        RTS			      ;return 
                      ;
        LDAA #$FD	    ;F9A6, SYNTH5(?),W vector
        STAA <$0F	    ;
        LDX #$0064	  ;
        STX <$0B	    ;
                      ;
        ADDB <$0C	    ;F9AF
        LDAA <$11	    ;
        ADCA <$0B	    ;
        STAA <$11	    ;
        LDX <$0B	    ;
        BCS $F9BF	    ;branch below if Carry set
        BRA $F9BD	    ;branch below
        BRA $F9C2	    ;F9BD, branch below
        INX			      ;F9BF
        BEQ $F9D3	    ;branch below if = 0
        STX <$0B	    ;F9C2
        ANDA #$0F	    ;
        ADDA #$9A	    ;
        STAA <$10   	;
        LDX <$0F	    ;
        LDAA $00,X	  ;
        STAA >$0400	  ;DAC output
        BRA $F9AF	    ;branch above
        RTS			      ;F9D3, return
                      ;
        CLRA		      ;F9D4, SYNTH6(PWM?),W vector
        STAA >$0400	  ;DAC output
        STAA <$11	    ;
        CLRA		      ;F9DA
                      ;
        CMPA <$11	    ;F9DB
        BNE $F9E2	    ;branch below if != 0
        COM >$0400	  ;DAC invert
        LDAB #$12	    ;F9E2
        DECB		      ;F9E4
        BNE $F9E4	    ;branch above if != 0
        INCA		      ;
        BPL $F9DB   	;branch above if plus
        COM >$0400	  ;DAC invert
        INC >$0011	  ;
        BPL $F9DA	    ;branch above if plus
        RTS			      ;F9F2, return
                      ;
        LDX #$0013	  ;F9F3, SYNTH7(?),W vector
        CLR $00,X	    ;F9F6,clear
        INX			      ;
        CPX #$001B	  ;compare index
                      ;
        BNE $F9F6	    ;branch above if != 0
        LDAA #$40	    ;
        STAA <$13	    ;
        LDX #$0013	  ;FA02
        LDAA #$80	    ;
        STAA <$11	    ;
        CLRB		      ;
        LDAA $01,X	  ;FA0A
        ADDA $00,X	  ;
        STAA $01,X	  ;
        BPL $FA14	    ;branch below if plus
        ADDB <$11	    ;
        LSR >$0011	  ;FA14,logical shift right
        INX			      ;
        INX			      ;
        CPX #$001B	  ;compare index 
        BNE $FA0A	    ;branch above if != 0
        STAB >$0400	  ;DAC output
        INC >$0012	  ;
        BNE $FA02	    ;branch above if != 0
        LDX #$0013	  ;
        CLRB		      ;
        LDAA $00,X	  ;FA2A
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
        BNE $FA2A	    ;branch above if != 0
        TSTB		      ;test if 0 or minus
        BNE $FA02	    ;branch above if != 0
        RTS			      ;return 
                      ;
        DEC >$0008	  ;FA44, W vector
        RTS			      ;return
                      ;
        CLR >$0008	  ;FA48, SUBRTN
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
        JMP $FD0E	    ;FA81, jump below to IRQ
        LDAA #$03	    ;FA84, W vector
        STAA <$08	    ;init count?
        RTS			      ;return
                      ;
        DEC >$0008	  ;FA89
        BEQ $FA9A	    ;
        LDAB <$15	    ;
        ASLB		      ;arithmetic shift left
        ASLB		      ;
        ASLB		      ;
        ASLB		      ;
        ABA			      ;add accums
        STAA <$15	    ;
        CLRA		      ;
        BRA $FA98	    ;FA98, branch to here
        DECA		      ;
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
                      ;ORGAN ROUTINE
ORGAN   LDX <$13	    ;DUR -duration, FADB, SUBRTN
ORGAN1  CLRA		      ;
        FCB $F6   	  ;LOAD B EXTND TEMPB
        FDB TEMPB     ;
        INCB		      ;
        STAB <$12	    ;TEMPB
        ANDB <$15	    ;OSCIL -mask oscillators
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
        ASLA          ;
        STAA >$0400	  ;SOUND, DAC output
        DEX			      ;decr index
        BEQ $FB09	    ;branch ORGAN2 below if = 0, NOTE OVER?
        JMP $0016   	;RDELAY, jump above ?
ORGAN2  RTS			      ;FB09,return
                      ;
        PSHA		      ;FB0A, SUBRTN, push data
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
        CLRA		      ;FB1E, SYNTH8(?),W vector
        STAA <$04	    ;
        STAA <$05   	;
        RTS			      ;FB23, return subroutine
                      ;
        CLR >$0004	  ;FB24, W vector
        LDAA <$05	    ;
        ANDA #$7F	    ;
        CMPA #$1D	    ;
                      ;
        BNE $FB30	    ;branch below if != 0
        CLRA		      ;
        INCA		      ;FB30
        STAA <$05	    ;
        RTS			      ;FB33, return
                      ;
        LDAA #$0E	    ;FB34
        JSR $FB81	    ;jump sub below
        LDAA <$05	    ;
        ASLA		      ;
        ASLA		      ;
        COMA		      ;
        JSR $FC39	    ;jump sub below
        INC >$0017	  ;FB41
        JSR $FC3B	    ;jump sub below
        BRA $FB41	    ;branch above
                      ;
        LDAA #$03	    ;FB49, W vector, get 3rd set from table
        JSR $F82A	    ;jump sub to SYNTH1
        LDAB <$06	    ;
        CMPB #$1F	    ;compare B, is it 31?
                      ;
        BNE $FB55	    ;branch below if != 0, if not, branch
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
        JSR $F83F	    ;FB6C, jump sub above to below SYNTH1
        BRA $FB6C	    ;branch above
                      ;
        LDAA <$07	    ;FB71, SYNTH9(?)W vector, last in table
        BNE $FB7E	    ;
        INC >$0007	  ;
        LDAA #$0D	    ;
                      ;
        BSR $FB81	    ;branch below to subrtn
        BRA $FBE7	    ;branch below
        JMP $FC2E	    ;jump below
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
        LDAA <$13	    ;FBE7
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
        STAA >$0400	  ;DAC output
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
                      ;
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
                      ;
        ADDA $00,X	  ;FC4B
        BEQ $FC51	    ;branch below if = 0
        BCS $FC56	    ;branch below if carry
        TSTB		      ;FC51
        BEQ $FC5C	    ;branch below if = 0
        BRA $FC65	    ;branch below
                      ;
        TSTB		      ;FC56
        BNE $FC5C	    ;branch below if != 0
        STX <$1B	    ;
        INCB		      ;
        INX			      ;FC5C
        CPX <$1D	    ;
        BNE $FC3E	    ;branch above if != 0
        TSTB		      ;
        BNE $FC65	    ;branch below if != 0
        RTS			      ;return
                      ;
        STX <$1D	    ;FC65
        LDAA <$15	    ;
        BEQ $FC71	    ;branch below if = 0
        BSR $FC75	    ;branch sub below
        LDAA <$1A	    ;
        BSR $FC87	    ;branch sub below
        JMP $FBE7	    ;FC71, jump above
        RTS			      ;FC74, return
                      ;
        LDX #$0024	  ;FC75
        STX <$0F	    ;
        LDX <$18	    ;
        LDAB $00,X	  ;
        INX			      ;
        JSR $FB0A	    ;jump sub above
        LDX <$0F	    ;
        STX <$1F	    ;
        RTS			      ;return
                      ;
        TSTA		      ;FC87, SUBRTN, test A
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
        RTS			      ;FCB5, return
                      ;
IRQ		  LDS #$007F	  ;FCB6, IRQ handler,select sound,load stack pointer, vector at $FFF8
        LDAA >$0402   ;PIA channel B
        CLI			      ;clear interrupt mask
        COMA		      ;complement,flip bits
        ANDA #$1F	    ;mask upper 3 bits
        LDAB <$08	    ;
        BEQ $FCCD	    ;branch below if = 0
        BPL $FCC9	    ;branch below if plus
        JSR $FA48	    ;jump sub above to below SYNTH7
        DECA		      ;FCC9, start > 0
        JSR $FA89	    ;jump sub above 
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
        BEQ $FD0E	    ;branch below if = 0
        DECA		      ;
        CMPA #$0C	    ;
        BHI $FCF4	    ;branch below if higher
        JSR $FB81	    ;jump sub above
        JSR $FBE7	    ;jump sub above
        BRA $FD0E	    ;branch below
                      ;
        CMPA #$1B	    ;FCF4
        BHI $FD06	    ;branch below if higher
        SUBA #$0D	    ;
        ASLA		      ;x 2 for offset in table
        LDX #$FD58	  ;addr VWTAB, W Vector table
        BSR CALCOS	  ;branch sub CALCOS, calc offset into table
        LDX $00,X	    ;load vector addr
        JSR $00,X	    ;jump sub ? W vector addr at index?
        BRA $FD0E	    ;branch below
                      ;
        SUBA #$1C	    ;FD06
        JSR $F82A	    ;jump sub to SYNTH1
        JSR $F83F	    ;jump sub to below SYNTH1
        LDAA <$04	    ;FD0E
        ORAA <$05	    ;inclusive OR accum
        BEQ $FD12	    ;FD12, branch here if = 0
        CLRA		      ;
        STAA <$07	    ;
        LDAA <$04	    ;
        BEQ $FD1E	    ;branch below if = 0
        JMP $F913	    ;jump to SYNTH4
        JMP $FB34	    ;FD1E, jump above to below SYNTH8
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
        JSR $F82A	    ;jump sub to SYNTH1
        JSR $F83F	    ;jump sub to below SYNTH1
        LDAB >$EFFA	  ;
        CMPB #$7E	    ;
        BNE NMI		    ;branch above if != 0
        JSR $EFFA	    ;jump sub ?
        BRA NMI		    ;branch above
                      ;
VWTAB	  FDB $FB48	    ;FD58,form double byte -- FB49?
        FDB $F913	    ;FD5A, W vector SYNTH4
        FDB $FB24	    ;FD5C, W vector SYNTH8
        FDB $F88C   	;FD5E, W vector SYNTH2
        FDB $FB71	    ;FD60, W vector SYNTH9
        FDB $FB1E	    ;FD62, W vector SYNTH8
        FDB $F8CD	    ;FD64, W vector SYNTH3
        FDB $F894	    ;FD66, W vector SYNTH2
        FDB $F91C	    ;FD68, W vector SYNTH4
        FDB $F923	    ;FD6A. W vector SYNTH4
        FDB $F9A6	    ;FD6C, W vector SYNTH5
        FDB $F9D4	    ;FD6E, W vector SYNTH6
        FDB $F9F3   	;FD70, W vector SYNTH7
        FDB $FA44   	;FD72, W vector SYNTH7
        FDB $FA84	    ;FD74, W vector SYNTH7
        
                      ; VARI VECTORS, square wave pulse width modulator
VVECT   EQU *
SAW     FCB $40,$01,$00,$10,$E1,$00,$80,$FF,$FF
FOSHIT  FCB $28,$01,$00,$08,$81,$02,$00,$FF,$FF
QUASAR  FCB $28,$81,$00,$FC,$01,$02,$00,$FC,$FF
CABSHK  FCB $FF,$01,$00,$18,$41,$04,$80,$00,$FF
                      ;
CSCALE  FCB $00,$FF,$08,$FF,$68,$04,$80,$00,$FF
MOSQTO  FCB $28,$81,$00,$FC,$01,$02,$00,$FC,$FF ; dupe QUASAR
VARBG1  FCB $60,$01,$57,$08,$E1,$02,$00,$FE,$80


FD76:                    40 01  00 10 e1 00 80 ff ff 28  |...D..@........(|
FD80:  01 00 08 81 02 00 ff ff  28 81 00 fc 01 02 00 fc  |........(.......|
FD90:  ff ff 01 00 18 41 04 80  00 ff 8c 5b b6 40 bf 49  |.....A.....[.@.I|
FDA0:  a4 73 73 a4 49 bf 40 b6  5b 8c 0c 7f 1d 0f fb 7f  |.ss.I.@.[.......|
FDB0:  23 0f 15 fe 08 50 8b 88  3e 3f 02 3e 7c 04 03 ff  |#....P..>?.>|...|
FDC0:  3e 3f 2c e2 7c 12 0d 74  7c 0d 0e 41 7c 23 0b 50  |>?,.|..t|..A|#.P|
FDD0:  7c 1d 29 f2 7c 3f 02 3e  f8 04 03 ff 7c 3f 2c e2  ||.).|?.>....|?,.|
FDE0:  f8 12 0d 74 f8 0d 0e 41  f8 23 0b 50 f8 1d 2f f2  |...t...A.#.P../.|
FDF0:  f8 23 05 a8 f8 12 06 ba  f8 04 07 ff 7c 37 04 c1  |.#..........|7..|
FE00:  7c 23 05 a8 7c 12 06 ba  3e 04 07 ff 3e 37 04 c1  ||#..|...>...>7..|
FE10:  3e 23 05 a8 1f 12 06 ba  1f 04 07 ff 1f 37 04 c1  |>#...........7..|
FE20:  1f 23 16 a0 fe 1d 17 f9  7f 37 13 06 7f 3f 08 fa  |.#.......7...?..|
FE30:  fe 04 0f ff fe 0d 0e 41  fe 23 0b 50 fe 1d 5f e4  |.......A.#.P.._.|
FE40:  00 47 3f 37 30 29 23 1d  17 12 0d 08 04 08 7f d9  |.G?70)#.........|
FE50:  ff d9 7f 24 00 24 08 00  40 80 00 ff 00 80 40 10  |...$.$..@.....@.|
FE60:  7f b0 d9 f5 ff f5 d9 b0  7f 4e 24 09 00 09 24 4e  |.........N$...$N|
FE70:  10 7f c5 ec e7 bf 8d 6d  6a 7f 94 92 71 40 17 12  |.......mj...q@..|
FE80:  39 10 ff ff ff ff 00 00  00 00 ff ff ff ff 00 00  |9...............|
FE90:  00 00 48 8a 95 a0 ab b5  bf c8 d1 da e1 e8 ee f3  |..H.............|
FEA0:  f7 fb fd fe ff fe fd fb  f7 f3 ee e8 e1 da d1 c8  |................|
FEB0:  bf b5 ab a0 95 8a 7f 75  6a 5f 54 4a 40 37 2e 25  |.......uj_TJ@7.%|
FEC0:  1e 17 11 0c 08 04 02 01  00 01 02 04 08 0c 11 17  |................|
FED0:  1e 25 2e 37 40 4a 54 5f  6a 75 7f 10 59 7b 98 ac  |.%.7@JT_ju..Y{..|
FEE0:  b3 ac 98 7b 59 37 19 06  00 06 19 37 81 24 00 00  |...{Y7.....7.$..|
FEF0:  00 16 31 12 05 1a ff 00  27 6d 11 05 11 01 0f 01  |..1.....'m......|
FF00:  47 11 31 00 01 00 0d 1b  f4 12 00 00 00 14 47 41  |G.1...........GA|
FF10:  45 00 00 00 0f 5b 21 35  11 ff 00 0d 1b 15 00 00  |E....[!5........|
FF20:  fd 00 01 69 31 11 00 01  00 03 6a 01 15 01 01 01  |...i1.....j.....|
FF30:  01 47 f6 53 03 00 02 06  94 6a 10 02 00 02 06 9a  |.G.S.....j......|
FF40:  1f 12 00 ff 10 04 69 31  11 00 ff 00 0d 00 12 06  |......i1........|
FF50:  00 ff 01 09 28 a0 98 90  88 80 78 70 68 60 58 50  |....(.....xph`XP|
FF60:  44 40 01 01 02 02 04 04  08 08 10 10 30 60 c0 e0  |D@..........0`..|
FF70:  01 01 02 02 03 04 05 06  07 08 09 0a 0c 80 7c 78  |..............|x|
FF80:  74 70 74 78 7c 80 01 01  02 02 04 04 08 08 10 20  |tptx|.......... |
FF90:  28 30 38 40 48 50 60 70  80 a0 b0 c0 08 40 08 40  |(08@HP`p.....@.@|
FFA0:  08 40 08 40 08 40 08 40  08 40 08 40 08 40 08 40  |.@.@.@.@.@.@.@.@|
FFB0:  01 02 04 08 09 0a 0b 0c  0e 0f 10 12 14 16 40 10  |..............@.|
FFC0:  08 01 01 01 01 01 02 02  03 03 04 04 05 06 08 0a  |................|
FFD0:  0c 10 14 18 20 30 40 50  40 30 20 10 0c 0a 08 07  |.... 0@P@0 .....|
FFE0:  06 05 04 03 02 02 01 01  01 07 08 09 0a 0c 08 17  |................|
FFF0:  18 19 1a 1b 1c 00 00 00  


 ;	Motorola vector table settings

 ;	FFF8: FC B6    FDB   IRQ
 ;	FFFA: F8 01    FDB   RESET (SWI)
 ;	FFFC: FD 2F    FDB   NMI
 ;	FFFE: F8 01    FDB   RESET (ColdStart)


 ;	****** Hardware data ******


 ;	Sound 6802/6808 board

 ;	$0000 - $007F RAM 
 ;	$0400 - $0403 PIA 
 ;	$F800 - $FFFF ROM 

 ;	Writing to $400 puts values in the DAC