; Defender Sound ROM
; updated 13 April 2021
; mix of source and disassembled rom  
; source remarks and labels are capitalised
;
;example line :
;label   opcode(s)      ;var    comment    - notes
;V0LP    LDAA <$1C      ;LOCNT  LO CYCLE   - F84E, load accum A, alt 0-255, variable delay, SUB LOOP 2
;
  
  
;  NOGEN
;  NAM  DEFENDER SOUNDS REV. 1.0 BY SAM D 10/80
;*COPYRIGHT WILLIAMS ELECTRONICS 1980
;*PROGRAM ORIGINATION DATE 10/24/80
;*PROGRAM RELEASE 10/31/80
;*PROGRAMMER: SAM DICKER
;
;*
;*SYSTEM CONSTANTS
;*
ROM     EQU  $F800
SOUND   EQU  $400
CKORG   EQU  $F700    ;CHECKSUM PROG ORG
ENDRAM  EQU  $7F
VECTOR  EQU  $FFF8    ;RESET,INT VECTORS
WVELEN  EQU  72
BG2MAX  EQU  29
SP1SND  EQU  $0E      ;SPINNER SOUND #1 CODE
B2SND   EQU  $12      ;BONUS SOUND #2 CODE
SP1MAX  EQU  32
TACC    EQU  4        ;TACCATA TEMPO CONSTANT
PHANC   EQU  3        ;PHANTOM TEMPO CONTANT
TAF     EQU  34715!>1 ;NOTE TIMES
TA      EQU  36780!>1
TBF     EQU  38967!>1
TB      EQU  41284!>1
TC      EQU  43739!>1
TCS     EQU  46340!>1
TD      EQU  49096!>1
TEF     EQU  52015!>1
TE      EQU  55108!>1
TF      EQU  58385!>1
TFS     EQU  61857!>1
TG      EQU  65535!>1
;*
;* TALKING EQUATES
;*
TALK    EQU  $EFFD    ;ENTRY TO TALKING  <-- addr of speech ROM
TALKD   EQU  $EFFA    ;ENTRY FOR DIAGNOSTICS  <-- addr of speech ROM
;*
;* SCREAM EQUATES
;*
ECHOS   EQU  4
FREQ    EQU  0
TIMER   EQU  1
;*
;*GLOBALS
;*
        ORG  0
TLKGL   RMB  4        ;TALKING GLOBALS
BG1FLG  RMB  1        ;BACKGROUND SOUND 1
BG2FLG  RMB  1        ;BACKGROUND SOUND 2
SP1FLG  RMB  1        ;SPINNER FLAG
B2FLG   RMB  1        ;BONUS #2 FLAG
ORGFLG  RMB  1        ;ORGAN FLAG
HI      RMB  1        ;RANDOM SEED
LO      RMB  1        ;RANDOM SEED
;*
;*TEMPORARIES
;*
TMPRAM  EQU  *        ;TEMPORARY RAM
TEMPX   RMB  2        ;X TEMPS
XPLAY   RMB  2
XPTR    RMB  2
TEMPA   RMB  1        ;ACCA TEMP
TEMPB   RMB  1
LOCRAM  EQU  *
;*
;*GWAVE PARAMETERS
;*
        ORG  LOCRAM
GECHO   RMB  1        ;ECHO FLAG
GCCNT   RMB  1        ;CYCLE COUNT
GECDEC  RMB  1        ;# OF DECAYS PER ECHO
GDFINC  RMB  1        ;DELTA FREQ INC
GDCNT   RMB  1        ;DELTA FREQ COUNT
GWFRM   RMB  2        ;WAVEFORM ADDRESS
;*TEMPORARY OR COMPUTED PARAMETERS
PRDECA  RMB  1        ;PRE-DECAY FACTOR
GWFRQ   RMB  2        ;FREQ TABLE ADDR
FRQEND  RMB  2        ;END ADDR FREQ TABLE
WVEND   RMB  2        ;WAVE END ADDR
GPER    RMB  1        ;PERIOD
GECNT   RMB  1        ;# OF ECHOES COUNTER
FOFSET  RMB  1        ;FREQUENCY OFFSET
;*
;*GWAVE TABLES
;*
GWTAB   RMB  WVELEN   ;WAVE TABLE
;*
;*VARIWAVE PARAMETERS
;*
        ORG  LOCRAM
LOPER   RMB  1        ;LO PERIOD
HIPER   RMB  1        ;HIPERIOD
LODT    RMB  1        ;PERIOD DELTAS
HIDT    RMB  1
HIEN    RMB  1        ;END PERIOD
SWPDT   RMB  2        ;SWEEP PERIOD
LOMOD   RMB  1        ;BASE FREQ MOD
VAMP    RMB  1        ;AMPLITUDE
LOCNT   RMB  1        ;PERIOD COUNTERS
HICNT   RMB  1
;*
;*NOISE ROUTINE PARAMETERS
;*
        ORG  LOCRAM
DECAY   RMB  1
NAMP    RMB  1
CYCNT   RMB  1
NFRQ1   RMB  2
NFFLG   RMB  1
LFREQ   RMB  1
DFREQ   RMB  1
;*
;*FILTERED NOISE ROUTINE PARAMETERS
;*
        ORG  LOCRAM
FMAX    RMB  1        ;MAXIMUM_FREQUENCY
FHI     RMB  1        ;FREQUENCY
FLO     RMB  1 
SAMPC   RMB  2        ;SAMPLE COUNT
FDFLG   RMB  1        ;FREQUENCY DECREMENT FLAG
DSFLG   RMB  1        ;DISTORTION FLAG
;*
;*SCREAM TABLES
;*
        ORG  LOCRAM
STABLE  RMB  2*ECHOS  ;SCREAM TABLE
SRMEND  EQU  *
;*
;*ORGAN PARAMETERS
;*
        ORG  LOCRAM
DUR     RMB  2        ;NOTE DURATION
OSCIL   RMB  1        ;OSCILLATORS
RDELAY  RMB  60       ;RAM DELAY LOAD
;*
;* CHECKSUM CALCULATOR & RELOCATOR
;*
        ORG  CKORG
CKSUM   LDS  #$F7FF   ;SET STACK POINTER
        LDX  #$FFFF   ;INDEX TO END OF ROM
        CLRB          ;ZERO CHECKSUM
CKSUM1  ADCB  0,X     ;ADD IN PROGRAM BYTE
        DEX           ;TO NEXT BYTE
        CPX  #$F800   ;DONE YET?
        BNE  CKSUM1   ;NOPE...
        STAB  0,X     ;SAVE CHECKSUM AT BEGINNING
        STX  FROM     ;SAVE FOR RELO
        LDX  #$6800   ;DESTINATION
        STX  TO       ;SAVE FOR LATER
RELO    LDX  FROM     ;GET SOURCE
        LDAA  0,X     ;GRAB THE BYTE
        INX           ;UPDATE
        STX  FROM     ;UPDATE SOURCE ADDRESS
        LDX  TO       ;GET DESTINATION ADDRESS
        STAA  0,X     ;SAVE IT IN NEW LOCATION
        INX           ;UPDATE
        STX  TO       ;UPDATE DESTINATION ADDRESS
        LDX  FROM     ;GET THE SOURCE
        BNE  RELO     ;KEEP MOVING
        WAI           ;TURN OFF LEDS
FROM    RMB  2        ;FOR POINTER
TO      RMB  2        ;FOR POINTER
;
;*
;* MAIN PROGRAM
;*
        ORG $F800      ;ROM
        FCB $FF        ;CHECKSUM BYTE
;*************************************;
;RESET power on
;*************************************;
SETUP   SEI            ;SET INTERRUPT MASK
        LDS #$007F     ;#ENDRAM INITIALIZE STACK POINTER
        LDX #$0400     ;#SOUND INDEX TO PIA       - load index reg with PIA (DAC)
        CLR $01,X      ;ACCESS DDRA               - clear, index x, switch to DDR
        CLR $03,X      ;ACCESS DDRB               - clear, index x, and for 2nd port
        LDAA #$FF      ;PA0-PA7                   - load A with data
        STAA $00,X     ;SET SIDE A AS OUTPUTS     - all outputs on chn A
        CLR $02,X      ;SET B SIDE AS INPUTS      - all inputs on chn B
        LDAA #$37      ;CB2 LOW, IRQ ALLOWED      - CB2 is output, output reg selected
        STAA $03,X     ;PROGRAM B CONTROL REG     - IRQB on low to hi, enabled
        LDAA #$3C      ;CA2 SET INIT HIGH, NO IRQS - CA2 is output, output reg selected
        STAA $01,X     ;PROGRAM A SIDE            - IRQA on hi to low, disabled
        STAA <$09      ;HI START RANDOM GENERATOR - store accum A
        CLRA           ;clear accum A
        STAA <$07      ;B2FLG                     - store accum A into addr
        STAA <$04      ;BG1FLG
        STAA <$05      ;BG2FLG
        STAA <$06      ;SP1FLG
        STAA <$08      ;ORGFLG
        CLI            ;CLEAR INTERRUPTS          - clear interrupt mask, enable interrupts
STDBY   BRA STDBY      ;WAIT FOR INTERRUPT        - F828, wait here (F828) for interrupt 
;
;*
;*VARI LOADER
;*
VARILD  TAB            ;                  - F82A, PARAM 1, transfer accums
        ASLA           ;X2                - shift left A
        ASLA           ;X4                - shift left A
        ASLA           ;X8                - A x 8
        ABA            ;X9                - add accums, A x 8 + A = 9A
        LDX #$0013     ;#LOCRAM           - load in X
        STX <$0f       ;XPTR  SET XSFER   - store in zero page
        LDX #$FD76     ;#VVECT            - load waveform from table? SAW
        JSR CALCOS     ;ADDX              - FD21,calcs X + A -> X
        LDAB #$09      ;GET COUNT
VTRAN   JMP UTIL1      ;TRANS             - jumps below, FB0A
;
;*
;*VARIABLE DUTY CYCLE SQUARE WAVE ROUTINE
;*
VARI    LDAA <$1B      ;VAMP              - F83F, SYNTH1 (boot)
        STAA >$0400    ;SOUND             - DAC output
VAR0    LDAA <$13      ;LOPER             - F844, load accum A, MAIN LOOP START
        STAA <$1C      ;LOCNT             - store accum A
        LDAA <$14      ;HIPER             - load accum A
        STAA <$1D      ;HICNT             - store accum A
V0      LDX <$18       ;SWPDT             - F84C, load index, SUB LOOP 1
V0LP    LDAA <$1C      ;LOCNT  LO CYCLE   - F84E, load accum A, alt 0-255, variable delay, SUB LOOP 2
        COM >$0400     ;SOUND             - complement DAC, invert
V1      DEX            ;                  - F853, decrement index, SUB LOOP 3
        BEQ $F866      ;VSWEEP            - branch below if = 0, goto SUB LOOP 5
        DECA           ;                  - decr A
        BNE $F853      ;V1                - branch above if != 0, goto SUB LOOP 3
        COM >$0400     ;SOUND             - complement DAC, invert
        LDAA <$1D      ;HICNT  HI CYCLE   - F85E, load accum A, SUB LOOP 4
V2      DEX            ;                  - decrement index
        BEQ $F866      ;VSWEEP            - branch below if - 0, goto SUB LOOP
        DECA           ;decr A
        BNE $F85E      ;V2                - branch above != 0, goto SUB LOOP 4
        BRA $F84E      ;V0LP  LOOP BACK   - branch above always, goto SUB LOOP 2
VSWEEP  LDAA >$0400    ;SOUND             - F866, load accum DAC, SUB LOOP 5
        BMI $F86C      ;VS1               - branch below if minus
        COMA           ;                  - complement A
        ADDA #$00      ;                  - F86C, add 0 to A
        STAA >$0400    ;SOUND  OUTPUT     - DAC output
        LDAA <$1C      ;LOCNT             - load accum A with value at location 1C
        ADDA <$15      ;LODT              - add A
        STAA <$1C      ;LOCNT             - store accum A
        LDAA <$1D      ;HICNT             - load accum A
        ADDA <$16      ;HIDT              - add A
        STAA <$1D      ;HICNT             - store accum A
        CMPA <$17      ;HIEN              - compare A
        BNE $F84C      ;V0                - branch above if != 0, goto SUB LOOP 1
        LDAA <$1A      ;LOMOD             - load accum A
        BEQ EXIT1      ;VARX              - branch below if = 0, goto EXIT1, F88B
        ADDA <$13      ;LOPER             - add A
        STAA <$13      ;LOPER             - store A
        BNE LOOP1      ;VAR0              - branch above, F844, if != 0, goto MAIN LOOP
VARX    RTS            ;                  - F88B, return, EXIT1
;
;*
;*LIGHTNING
;*
LITE    LDAA #$01      ;                  - F88C, PARAM2
        STAA <$1A      ;DFREQ             - 
        LDAB #$03      ;
        BRA $F89E      ;LITEN             - branch below
;
;*
;*APPEAR
;*
APPEAR  LDAA #$FE      ;                  - F894, W vector, SYNTH 2
        STAA <$1a      ;DFREQ
        LDAA #$C0      ;
        LDAB #$10      ;
        BRA $F89E      ;LITEN             - branch below
;
;*
;*LIGHTNING+APPEAR NOISE ROUTINE
;*
LITEN   STAA <$19      ;LFREQ             - F89E
        LDAA #$FF      ;HIGHEST AMP
        STAA >$0400    ;SOUND             - store A to DAC
        STAB <$15      ;CYCNT
LITE0   LDAB <$15      ;CYCNT             - F8A7, MAIN LOOP START
LITE1   LDAA <$0A      ;LO  GET RANDOM    - F8A9, SUB LOOP 1
        LSRA           ;                  - logical shift right
        LSRA           ;
        LSRA           ;
        EORA <$0A      ;LO                - exclusive OR A
        LSRA           ;
        ROR >$0009     ;HI                - rotate right
        ROR >$000A     ;LO
        BCC $F8BC      ;LITE2             - branch below if Carry clear
        COM >$0400     ;SOUND             - DAC invert
LITE2   LDAA <$19      ;LFREQ  COUNT FREQ - F8BC
LITE3   DECA           ;                  - F8BE,decrement A
        BNE $F8BE      ;LITE3             - branch above if != 0
        DECB           ;COUNT CYCLES      - decrement B
        BNE $F8A9      ;LITE1             - branch above if != 0, goto SUB LOOP 1
        LDAA <$19      ;LFREQ
        ADDA <$1A      ;DFREQ
        STAA <$19      ;LFREQ
        BNE LOOP2      ;LITE0             - branch to F8A7 above if != 0, MAIN LOOP END
        RTS            ;                  - F8CC, return, EXIT2
;
;*
;*TURBO
;*
TURBO   LDAA #$20      ;                  - F8CD, W vector, SYNTH3
        STAA <$15      ;CYCNT
        STAA <$18      ;NFFLG
        LDAA #$01      ;
        LDX #$0001     ;                  - load index
        LDAB #$FF      ;
        BRA $F8DC      ;NOISE             - branch below
;
;*
;*WHITE NOISE ROUTINE
;*
;*X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*
NOISE   STAA <$13      ;DECAY             - F8DC
NOISE0  STX <$16       ;NFRQ1             - F8DE,store index, MAIN LOOP START
NOIS00  STAB <$14      ;NAMP              - F8E0, SUB LOOP 1
        LDAB <$15      ;CYCNT
        LDAA <$0A      ;LO  GET RANDOM BIT - F8E4
        LSRA           ;                  - logical shift right
        LSRA           ;
        LSRA           ;
        EORA <$0A      ;LO                - exclusive OR
        LSRA           ;
        ROR >$0009     ;HI                - rotate right
        ROR >$000A     ;LO
        LDAA #$00      ;
        BCC $F8F8      ;NOISE2            - branch below if Carry clear
        LDAA <$14      ;NAMP
NOISE2  STAA >$0400    ;SOUND             - F8F8,DAC output
        LDX <$16       ;NFRQ1 INCREASING DELAY - load index
NOISE3  DEX            ;                  - F8FD,decrement index
        BNE $F8FD      ;NOISE3            - branch above if != 0
        DECB           ;FINISH CYCLE COUNT
        BNE $F8E4      ;NOISE1  NO        - branch above if != 0
        LDAB <$14      ;NAMP  DECAY AMP
        SUBB <$13      ;DECAY             - subtract B
        BEQ EXIT3      ;NSEND             - branch below if = 0, goto EXIT3, F912
        LDX <$16       ;NFRQ1  INC FREQ   - load index
        INX            ;                  - increment index
        LDAA <$18      ;NFFLG  DECAY FREQ?
        BEQ $F8E0      ;NOIS00  NO        - branch above if = 0, goto SUB LOOP 1
        BRA LOOP3      ;NOISE0            - branch above always F8DE, goto MAIN LOOP
NSEND   RTS            ;                  - F912, return, EXIT3
;
;*
;*BACKGROUND 1 ROUTINE
;*
BG1     LDAB #$01      ;                  - F913, parameters
        STAB <$04      ;BG1FLG
        CLRA           ;                  - clear A
        STAA <$19      ;DSFLG
        BRA SYNTH4     ;FNOISE            - branch below always, F930 SYNTH 4
;
;*
;*THRUST
;*
THRUST  CLRA           ;                  - F91C, parameters
        STAA <$19      ;DSFLG
        LDAB #$03      ;
        BRA SYNTH4     ;FNOISE            - branch below always, F930 SYNTH 4
;
;*
;*CANNON
;*
CANNON  LDAA #$01      ;                  - F923, parameters
        STAA <$19      ;DSFLG
        LDX #$03E8     ;#1000             - load index (decimal val of hex is 1000)
        LDAA #$01      ;                  - load accum A
        LDAB #$FF      ;                  - load accum B 
        BRA SYNTH4     ;FNOISE            - branch below always, F930 SYNTH 4
;
;*
;*FILTERED NOISE ROUTINE
;*
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;*
FNOISE  STAA <$18      ;FDFLG             - F930, W vector, SYNTH 4
        STAB <$13      ;FMAX
        STX <$16       ;SAMPC             - store index
        CLR >$0015     ;FLO               - clear
FNOIS0  LDX <$16       ;SAMPC             - F939,load index, MAIN LOOP START
        LDAA >$0400    ;SOUND             - F93B, DAC
FNOIS1  TAB            ;NEXT RANDOM NUMBER - F93E,transfer accums, SUB LOOP 1
        LSRB           ;                  - logical shift right
        LSRB           ;
        LSRB           ;
        EORB <$0A      ;LO                - exclusive OR
        LSRB           ;
        ROR >$0009     ;HI                - rotate right
        ROR >$000A     ;LO
        LDAB <$13      ;FMAX  SET FREQ
        TST >$0019     ;DSFLG             - test for 0 or negative at location
        BEQ $F954      ;FNOIS2            - branch below if = 0
        ANDB <$09      ;HI DISTORT FREQUENCY - logical and
FNOIS2  STAB <$14      ;FHI               - F954
        LDAB <$15      ;FLO
        CMPA <$0A      ;LO                - compare
        BHI $F96E      ;FNOIS4            - branch below if higher, goto SUB LOOP 3
FNOIS3  DEX            ;SLOPE UP          - F95C, decr index, SUB LOOP 2
        BEQ $F985      ;FNOIS6            - branch below if = 0
        STAA >$0400    ;SOUND             - F95F, DAC output
        ADDB <$15      ;FLO
        ADCA <$14      ;FHI               - add with Carry
        BCS $F97E      ;FNOIS5            - branch below if Carry set, goto SUB LOOP 4
        CMPA <$0A      ;LO                - compare A
        BLS $F95C      ;FNOIS3            - branch above if lower or same, goto SUB LOOP 2
        BRA $F97E      ;FNOIS5            - branch below always, goto SUB LOOP 4
FNOIS4  DEX            ;SLOPE DOWN        - F96E, SUB LOOP 3
        BEQ $F985      ;FNOIS6            - branch below if = 0, goto SUB LOOP 5
        STAA >$0400    ;SOUND             - F971, DAC output
        SUBB <$15      ;FLO
        SBCA <$14      ;FHI               - subtract with Carry
        BCS $F97E      ;FNOIS5            - branch below if carry, goto SUB LOOP 4
        CMPA <$0A      ;LO
        BHI $F96E      ;FNOIS4            - branch above if higher, goto SUB LOOP 3
FNOIS5  LDAA <$0A      ;LO                - F97E, SUB LOOP 4
        STAA >$0400    ;SOUND             - F980, DAC output
        BRA $F93E      ;FNOIS1            - branch above always, goto SUB LOOP 1
FNOIS6  LDAB <$18      ;FDFLG             - F985, SUB LOOP 5
        BEQ $F93E      ;FNOIS1            - branch above if = 0, goto SUB LOOP 1
        LDAA <$13      ;FMAX  DECAY MAX FREQ
        LDAB <$15      ;FLO
        LSRA           ;                  - logical shift right A
        RORB           ;                  - rotate right B
        LSRA           ;
        RORB           ;
        LSRA           ;
        RORB           ;
        COMA           ;                  - complement 1s A
        NEGB           ;                  - complement 2s B (negate)
        SBCA #$FF      ;#-1               - subtract with Carry
        ADDB <$15      ;FLO
        ADCA <$13      ;FMAX              - add with Carry
        STAB <$15      ;FLO
        STAA <$13      ;FMAX
        BNE LOOP4      ;FNOIS0            - branch above if != 0, F939, goto MAIN LOOP
        CMPB #$07      ;
        BNE LOOP4      ;FNOIS0            - branch above if != 0,F939, goto MAIN LOOP
        RTS            ;                  - F9A5, return , EXIT
;
;*
;*RADIO
;*
RADIO   LDAA #$FD      ;#RADSND/$100 SOUND TABLE - F9A6, W vector, SYNTH5
        STAA <$0F      ;XPTR
        LDX #$0064     ;#100  STARTING FREQ - load index
        STX <$0B       ;TEMPX
RADIO1  ADDB <$0C      ;TEMPX+1 ADD FREQ TO TIMER - F9AF, MAIN LOOP start
        LDAA <$11      ;TEMPA
        ADCA <$0B      ;TEMPX
        STAA <$11      ;TEMPA
        LDX <$0B       ;TEMPX
        BCS $F9BF      ;RADIO2            - branch below if Carry set
        BRA $F9BD      ;*+2 EQUALIZE TIME - branch below
        BRA $F9C2      ;RADIO3            - F9BD, branch below, goto SUB LOOP 1
RADIO2  INX            ;CARRY?, RAISE FREQ - F9BF
        BEQ EXIT5      ;RADIO4  DONE?     - branch below if = 0, F9D3
RADIO3  STX <$0B       ;TEMPX             - F9C2, SUB LOOP 1
        ANDA #$0F      ;SET POINTER       - and A 
        ADDA #$9A      ;#RADSND!.$FF      - add A 
        STAA <$10      ;XPTR+1
        LDX <$0F       ;XPTR
        LDAA $00,X     ;                  - load accum A with value at $00 added with index
        STAA >$0400    ;SOUND PLAY SOUND  - DAC output
        BRA LOOP5      ;RADIO1            - branch above, F9AF, goto MAIN LOOP
RADIO4  RTS            ;                  - F9D3, return, EXIT5
;
;*
;*HYPER
;*
HYPER   CLRA           ;                  - F9D4, W vector, SYNTH6(PWM?)
DAC13   STAA >$0400    ;SOUND             - DAC output
        STAA <$11      ;TEMPA  ZERO PHASE
HYPER1  CLRA           ;ZERO TIME COUNTER - F9DA, MAIN LOOP start
        CMPA <$11      ;TEMPA             - F9DB, SUB LOOP 1
        BNE $F9E2      ;HYPER3            - branch below if != 0
        COM >$0400     ;SOUND PHASE EDGE?, COMPLEMENT SOUND  - DAC invert
HYPER3  LDAB #$12      ;DELAY             - F9E2, load B 
HYPER4  DECB           ;                  - F9E4
        BNE $F9E4      ;HYPER4            - branch above if != 0
        INCA           ;ADVANCE TIME COUNTER 
        BPL $F9DB      ;HYPER2            - branch above if plus, goto SUB LOOP 1
        COM >$0400     ;SOUND  CYCLE DONE?, CYCLE EDGE  - DAC invert
        INC >$0011     ;TEMPA  NEXT PHASE
        BPL LOOP6      ;HYPER1  DONE?     - branch above if plus, F9DA, goto MAIN LOOP
        RTS            ;                  - F9F2, return, EXIT
;
;*
;*SCREAM
;*
SCREAM  LDX #$0013     ;#STABLE ZERO FREQS AND TIMES  - F9F3,W vector, SYNTH 7
SCREM1  CLR $00,X      ;F9F6,clear
        INX            ;
        CPX #$001B     ;#SRMEND           - compare index 
        BNE $F9F6      ;SCREM1            - branch above if != 0
        LDAA #$40      ;START FIRST ECHO  - load A 
        STAA <$13      ;STABLE+FREQ
SCREM2  LDX #$0013     ;#STABLE  INITIALIZE COUNTER  - FA02, MAIN LOOP start
        LDAA #$80      ;INITIALIZE AMPLITUDE - load A
        STAA <$11      ;TEMPA
        CLRB           ;ZERO OUTPUT BUFFER
SCREM3  LDAA $01,X     ;TIMER,X ADD FREQ TO TIMER  - FA0A, SUB LOOP 1, $01 value plus index
        ADDA $00,X     ;FREQ,X            - $00 value plus index
        STAA $01,X     ;TIMER,X           - $01 value plus index
        BPL $FA14      ;SCREM4  ADD AMPLITUDE IF MINUS  - branch below if plus
        ADDB <$11      ;TEMPA
SCREM4  LSR >$0011     ;TEMPA DECAY AMPLITUDE  - FA14,logical shift right
        INX            ;NEXT ECHO
        INX            ;
        CPX #$001B     ;#SRMEND LAST ECHO? - compare index 
        BNE $FA0A      ;SCREM3            - branch above if != 0, goto SUB LOOP 1
        STAB >$0400    ;SOUND  OUTPUT SOUNDDAC  - output
        INC >$0012     ;TEMPB  ADVANCE TIMER
        BNE LOOP7      ;SCREM2            - branch above if != 0, FA02, goto MAIN LOOP
        LDX #$0013     ;#STABLE  LOWER NON-ZERO FREQUENCIES
        CLRB           ;ALL ZERO NOT FLAG
SCREM5  LDAA $00,X     ;FREQ,X           - FA2A, SUB LOOP 2
        BEQ $FA39      ;SCREM7           - branch below if = 0
        CMPA #$37      ;                 - compare 
        BNE $FA36      ;SCREM6           - branch below if != 0
        LDAB #$41      ;START NEXT ECHO  - load B
        STAB $02,X     ;FREQ+2,X
SCREM6  DEC $00,X      ;FREQ,X           - FA36
        INCB           ;SET FLAG
SCREM7  INX            ;FA39
        INX            ;
        CPX #$001B     ;#SRMEND
        BNE $FA2A      ;SCREM5           - branch above if != 0, goto SUB LOOP 2
        TSTB           ;DONE?            - test if 0 or minus
        BNE LOOP7      ;SCREM2           - branch above if != 0, FA02, goto MAIN LOOP
        RTS            ;                 - FA43, return, EXIT
;
;*
;*ORGAN TUNE
;*
ORGANT  DEC >$0008     ;ORGFLG  MINUS ORGAN FLAG  - FA44
        RTS            ;return
ORGNT1  CLR >$0008     ;ORGFLG           - FA48, param 7
        STAA <$11      ;TEMPA  TUNE NUMBER - store countdown value
        LDX #$FDAA     ;#ORGTAB          - load waveform from table?
ORGNT2  LDAA $00,X     ;TUNE TABLE LENGTH - FA50
        BEQ $FA81      ;ORGNT5  INVALID TUNE - branch below if = 0
        DEC >$0011     ;TEMPA
        BEQ $FA5F      ;ORGNT3           - branch below if = 0
        INCA           ;
        JSR CALCOS     ;ADDX             - jump sub to CALCOS adjust X by A
        BRA $FA50      ;ORGNT2           - branch above
ORGNT3  INX            ;                 - FA5F
        STX <$0F       ;XPTR  NOTE POINTER
        JSR CALCOS     ;ADDX             - jump sub to CALCOS adjust X by A
        STX <$0D       ;XPLAY  TUNE END
        LDX <$0F       ;XPTR
ORGNT4  LDAA $00,X     ;TUNE LOOP        - FA69
        STAA <$15      ;OSCIL
        LDAA $01,X     ;
        LDX $02,X      ;
        STX <$13       ;DUR
        BSR $FAB3      ;ORGANL           - branch below to SYNTH8
        LDX <$0F       ;XPTR
        INX            ;
        INX            ;
        INX            ;
        INX            ;
        STX <$0F       ;XPTR
        CPX <$0D       ;XPLAY            - compare index
        BNE $FA69      ;ORGNT4           - branch above if != 0
ORGNT5  JMP IRQ2       ;IRQ3             - FA81, jump below to IRQ2 FD0E
;
;*
;*ORGAN NOTE
;*
;*4 BYTES(MODE,OSCILLATOR MASK HI+1,LO+1,NOTE#)
;*
ORGANN  LDAA #$03      ;SET ORGAN NOTE FLAG  - FA84, param 8
        STAA <$08      ;ORGFLG           - init count?
        RTS            ;                 - return
ORGNN1  DEC >$0008     ;ORGFLG           - FA89, param 9
        BEQ SYNTH8     ;ORGNN2           - branch if equal, FA9A
        LDAB <$15      ;OSCIL  OSCILLATOR MASK  - FA8E
        ASLB           ;                 - arithmetic shift left
        ASLB           ;
        ASLB           ;
        ASLB           ;
        ABA            ;                 - add accums
        STAA <$15      ;OSCIL
        CLRA           ;
        BRA *          ;WAIT FOR NEXT CODE  - FA98, branch to here FA98
ORGNN2  DECA           ;DELAY            - FA9A, SYNTH8
        CMPA #$0B      ;#11
        BLS $FAA0      ;ORGNN3           - branch if lower or same
        CLRA           ;
ORGNN3  LDX #$FE41     ;#NOTTAB          - FAA0, load waveform from table
        JSR CALCOS     ;ADDX             - jump sub to CALCOS
        LDAA $00,X     ;
        LDX #$FFFF     ;DURATION
        STX <$13       ;DUR
        BSR $FAB3      ;ORGANL           - branch below
        BSR $FADB      ;ORGAN  KEEP PLAYING  - FAAF,branch below
        BRA $FAAF      ;ORGNN4
;
;*
;*ORGAN LOADER
;*
;*OSCIL=OSCILLATOR MASK, ACCA=DELAY, DUR=DURATION
;*
ORGANL  LDX #$0016     ;#RDELAY          - FAB3,SUBRTN
LDLP    CMPA #$00      ;FAB6
        BEQ $FACF      ;LD1              - branch below if = 0
        CMPA #$03      ;
        BEQ $FAC7      ;LD2              - branch below if = 0
        LDAB #$01      ;NOP
        STAB $00,X     ;
        INX            ;
        SUBA #$02      ;
        BRA $FAB6      ;LDLP             - branch above always
LD2     LDAB #$91      ;CMPA 0           - FAC7
        STAB $00,X     ;
        CLR $01,X      ;
        INX            ;
        INX            ;
LD1     LDAB #$7E      ;JMP START2       - FACF
        STAB $00,X     ;
        LDAB #$FA      ;#ORGAN1!>8 MSB
        STAB $01,X     ;1,X
        LDAB #$DD      ;#ORGAN1!.$FF LSB
        STAB $02,X     ;2,X
;*
;*ORGAN ROUTINE
;*
;*DUR=DURATION, OSCILLATOR MASK
;*
ORGAN   LDX <$13       ;DUR              - FADB, SUBRTN
ORGAN1  CLRA           ;
;        LDAB >$0012   ;                 - load B with TEMPB is as next 2 lines
        FCB  $F6       ;$F6  LOAD B EXTND TEMPB
        FDB            ;TEMPB
        INCB           ;
        STAB <$12      ;TEMPB
        ANDB <$15      ;OSCIL, MASK OSCILLATORS
        LSRB           ;                 - logical shift right
        ADCA #$00      ;                 - add with Carry
        LSRB           ;
        ADCA #$00      ;                 - add with carry
        LSRB           ;
        ADCA #$00      ;
        LSRB           ;
        ADCA #$00      ;
        LSRB           ;
        ADCA #$00      ;
        LSRB           ;
        ADCA #$00      ;
        LSRB           ;
        ADCA #$00      ;
        ABA            ;                 - add accums
        ASLA            ;                - arithmetic shift left
        ASLA           ;
        ASLA           ;
        ASLA           ;
        STAA >$0400    ;SOUND            - DAC output
        DEX            ;                 - decr index
        BEQ $FB09      ;ORGAN2 NOTE OVER? - branch below if = 0, ORGAN2
        JMP $0016      ;RDELAY           - jump to location in scratch mem
ORGAN2  RTS            ;                 - FB09,return, exit 8, ORGAN2
;
;*
;*PARAMETER TRANSFER
;*
TRANS   PSHA           ;                 - FB0A, SUBRTN, push accum A data onto stack, UTIL1
TRANS1  LDAA $00,X     ;                 - FB0B,load from X
        STX <$0D       ;XPLAY            - store index
        LDX <$0F       ;XPTR
        STAA $00,X     ;
        INX            ;
        STX <$0F       ;XPTR
        LDX <$0D       ;XPLAY
        INX            ;
        DECB           ;
        BNE $FB0B      ;TRANS1           - branch above if != 0
        PULA           ;                 - pull top byte from stack into accum A
        RTS            ;                 - FB1D, return
;
;*
;*BACKGROUND END ROUTINE
;*
BGEND   CLRA           ;                 - FB1E, PARAM 10
        STAA <$04      ;BG1FLG
        STAA <$05      ;BG2FLG
        RTS            ;                 - FB23, return subroutine
;
;*
;*BACKGROUND SOUND #2 INCREMENT
;*
BG2INC  CLR >$0004     ;BG1FLG  KILL BG1 - FB24, PARAM 11
        LDAA <$05      ;BG2FLG  ACTIVATE BG2
        ANDA #$7F      ;REMOVE OVERRIDE
        CMPA #$1D      ;#BG2MAX
        BNE $FB30      ;BG2I0            - branch below if != 0
        CLRA           ;
BG2IO   INCA           ;                 - FB30
        STAA <$05      ;BG2FLG
        RTS            ;                 - FB33, return
;
;*
;*BACKGROUND 2 ROUTINE
;*
BG2     LDAA #$0E      ;#(TRBV-SVTAB)/7 GET SOUND#  - FB34, UTIL 2
        JSR $FB81      ;GWLD             - jump sub below
        LDAA <$05      ;BG2FLG
        ASLA           ;
        ASLA           ;
        COMA           ;
        JSR $FC39      ;GEND60           - jump sub below
BG2LP   INC >$0017     ;GDCNT            - FB41
        JSR $FC3B      ;GEND61           - jump sub below
        BRA $FB41      ;BG2LP            - FB47, branch above
;
;*
;*SPINNER #1 SOUND
;*
SP1     LDAA #$03      ;#(CABSHK-VVECT)/9  - FB49, PARAM 12
        JSR PARAM1     ;VARILD           - jump sub to F82A, PARAM1
        LDAB <$06      ;SP1FLG
        CMPB #$1F      ;#SP1MAX-1        - compare B
        BNE $FB55      ;SP1A             - branch below if != 0
        CLRB           ;                 - if is, set to 0
SP1A    INCB           ;                 - FB55, increment it
        STAB <$06      ;SP1FLG
        LDAA #$20      ;#SP1MAX
        SBA            ;                 - subtract accums
        CLRB           ;
SP11    CMPA #$14      ;#20              - FB5C
        BLS $FB65      ;SP12             - branch below if lower or same
        ADDB #$0E      ;#14
        DECA           ;
        BRA $FB5C      ;SP11             - branch above
SP12    ADDB #$05      ;                 - FB65
        DECA           ;
        BNE $FB65      ;SP12             - branch above if != 0
        STAB <$13      ;LOPER
SP1LP   JSR SYNTH1     ;VARI  DO IT      - FB6C, jump sub to F83F SYNTH1
        BRA $FB6C      ;SP1LP            - branch above
;
;*
;*LASER BALL BONUS #2
;*
;(a ref to the Pinball Laser Ball? 1979, System 6, Sound ROM2)
;
BON2    LDAA <$07      ;B2FLG            - FB71, W vector, param 13
        BNE $FB7E      ;BON21
        INC >$0007     ;B2FLG
        LDAA #$0D      ;#(BONV-SVTAB)/7
        BSR $FB81      ;GWLD             - FB7A, branch below to subrtn
        BRA SYNTH9     ;GWAVE            - FB7C, branch below FBE7
BON21   JMP $FC2E      ;GEND50           - FB7E, jump below
;
;*
;*GWAVE LOADER
;*
GWLD    TAB            ;MULKT BY 7       - FB81, transfer accums
        ASLB           ;
        ABA            ;                 - add accums
        ABA            ;
        ABA            ;
        LDX #$FEEC     ;#SVTAB  SOUND VECTOR TABLE  - load waveform from table
        JSR CALCOS     ;ADDX             - jump sub
        LDAA $00,X     ;
        TAB            ;
        ANDA #$0F      ;
        STAA <$14      ;GCCNT  GET CYCLE COUNT
        LSRB           ;                 - logical shift right
        LSRB           ;
        LSRB           ;
        LSRB           ;
        STAB <$13      ;GECHO  GET #ECHOS
        LDAA $01,X     ;1,X
        TAB            ;
        LSRB           ;
        LSRB           ;
        LSRB           ;
        LSRB           ;
        STAB <$15      ;GECDEC
        ANDA #$0F      ;WAVE #
        STAA <$11      ;TEMPA  SAVE
        STX <$0B       ;TEMPX  SAVE INDEX
        LDX #$FE4D     ;#GWVTAB  CALC WAVEFORM ADDR  - load waveform from table
GWLD2   DEC >$0011     ;TEMPA  WAVE FORM - FBAB
        BMI $FBB8      ;GWLD3  FINIS     - branch below if minus
        LDAA $00,X     ;
        INCA           ;
        JSR CALCOS     ;ADDX             - jump sub CALCOS
        BRA $FBAB      ;GWLD2
GWLD3   STX <$18       ;GWFRM            - FBB8
        JSR $FC75      ;WVTRAN  XSFER WAVE TO RAM  - jump sub below
        LDX <$0B       ;TEMPX  RESTORE INDEX
        LDAA $02,X     ;2,X  GET PREDECAY
        STAA <$1A      ;PRDECA
        JSR $FC87      ;WVDECA  DECAY IT - jump sub below
        LDX <$0B       ;TEMPX
        LDAA $03,X     ;3,X  GET FREQ INC
        STAA <$16      ;GDFINC
        LDAA $04,X     ;4,X  GET DELTA FREQ COUNT
        STAA <$17      ;GDCNT
        LDAA $05,X     ;5,X  GET PATTERN COUNT
        TAB            ;SAVE
        LDAA $06,X     ;6,X  PATTERN OFFSET
        LDX #$FF55     ;#GFRTAB          - load waveform from table
        JSR CALCOS     ;ADDX             - jump sub CALCOS
        TBA            ;GET PATTERN LENGTH  -  transfer accums
        STX <$1B       ;GWFRQ  FREQ TABLE ADDR
        CLR >$0023     ;FOFSET
        JSR CALCOS     ;ADDX             - jump sub CALCOS
        STX  <$1D      ;FRQEND
        RTS            ;                 - FBE6, return
;
;*
;*GWAVE ROUTINE
;*
;*ACCA= FREQ PATTERN LENGTH, X= FREQ PAT ADDR
;*
GWAVE   LDAA <$13      ;GECHO            - FBE7, SYNTH 9
        STAA <$22      ;GECNT
GWT4    LDX <$1B       ;GWFRQ            - FBEB
        STX <$0D       ;XPLAY
GPLAY   LDX <$0D       ;XPLAY  GET NEW PERIOD  - FBEF
        LDAA $00,X     ;
        ADDA <$23      ;FOFSET
        STAA <$21      ;GPER
        CPX <$1D       ;FRQEND
        BEQ PARAM14    ;GEND  FINISH ON ZERO  - branch below if = 0, FC21
        LDAB <$14      ;GCCNT  CYCLE COUNT
        INX            ;
        STX <$0D       ;XPLAY
GOUT    LDX #$0024     ;#GWTAB  SETUP WAVEFORM POINTER  - FC00, LOOP9
GOUTLP  LDAA <$21      ;GPER             - FC03
GPRLP   DECA           ;WAIT FOR PERIOD  - FC05
        BNE $FC05      ;GPRLP            - branch above if != 0
        LDAA $00,X     ;,X  OUTPUT SOUND
        STAA >$0400    ;SOUND            - DAC output
GPR1    INX            ;
        CPX <$1F       ;WVEND  END OF WAVE?
        BNE $FC03      ;GOUTLP           - branch above if != 0
        DECB           ;
;       BEQ GPLAY      ;line in source, not in this disasm
        INX            ;
        DEX            ;
        INX            ;
        DEX            ;
        INX            ;
        DEX            ;
        INX            ;
        DEX            ;
        NOP            ;                 - no operation
        NOP            ;
        BRA LOOP9      ;GOUT  SYNC 36    - branch above, FC00, goto LOOP9
GEND    LDAA <$15      ;GECDEC           - FC21, param 14
        BSR PARAM19    ;WVDECA           - branch below to subrtn, FC87
GEND40  DEC >$0022     ;GECNT  ECHO ON?
        BNE $FBEB      ;GWT4  YES        - branch aobve if != 0
        LDAA <$07      ;B2FLG  STOP BONUS
        BNE P17EXIT    ;GEND1            - branch not equal, FC74
GEND50  LDAA <$16      ;GDFINC  CONTINUE FOR FREQ MOD SOUNDS  - FC2E
        BEQ P17EXIT    ;GEND1  NO        - branch below if = 0, FC74
        DEC >$0017     ;GDCNT  DELTA FREQ OVER?
        BEQ P17EXIT    ;GEND1  YES...    - branch below if = 0, FC74
        ADDA <$23      ;FOFSET  UPDATE FREQ OFFSET
GEND60  STAA <$23      ;FOFSET           - FC39
GEND61  LDX <$1B       ;GWFRQ  GET INDEX - FC3B
        CLRB           ;START FOUND FLAG INIT CLEAR
GW0     LDAA <$23      ;FOFSET  INC OR DEC?  - FC3E
        TST >$0016     ;GDFINC           - test for zero or negative
        BMI PARAM15    ;GW1  DEC         - branch below if minus, FC4B
        ADDA $00,X     ;,X  INC
        BCS $FC51      ;GW2  CARRY=OVERFLOW  - branch below if Carry set
        BRA PARAM16    ;GW2A             - branch below, FC56
GW1     ADDA $00,X     ;DEC              - FC4B, param 15
        BEQ $FC51      ;GW2  OVERFLOW ON EQ  - branch below if = 0
        BCS PARAM16    ;GW2A  OVERFLOW IF CARRY CLEAR  - branch below if carry, FC56
GW2     TSTB           ;FOUND START YET? - FC51
        BEQ $FC5C      ;GW2B  NO         - branch below if = 0
        BRA PARAM17    ;GW3  YES, THIS IS THE END  - branch below, FC65
GW2A    TSTB           ;                 - FC56, param 16
        BNE $FC5C      ;GW2B  ALREADY FOUND START  - branch below if != 0
        STX <$1B       ;GWFRQ  FOUND START
        INCB           ;
GW2B    INX            ;                 - FC5C
        CPX <$1D       ;FRQEND
        BNE $FC3E      ;GW0  NOT OVER YET - branch above if != 0
        TSTB           ;FOUND START?
        BNE PARAM17    ;GW3  YES         - branch below if != 0, FC65
        RTS            ;ALL OVER         - return
GW3     STX <$1D       ;FRQEND           - FC65, param 17
        LDAA <$15      ;GECDEC  RE:XSFER WAVE?
        BEQ $FC71      ;GEND0  NO        - branch below if = 0
        BSR PARAM18    ;WVTRAN  XSFER WAVE - branch sub below, FC75
        LDAA <$1A      ;PRDECA
        BSR PARAM19    ;WVDECA           - branch sub below, FC87
GEND0   JMP SYNTH9     ;GWAVE            - FC71, jump above FBE7
GEND1   RTS            ;TERMINATE        - FC74, return
;
;*
;*WAVE TRANSFER ROUTINE
;*
WVTRAN  LDX #$0024     ;#GWTAB           - FC75, param 18
        STX <$0F       ;XPTR
        LDX <$18       ;GWFRM
        LDAB $00,X     ;,X  GET WAVE LENGTH
        INX            ;
        JSR UTIL1      ;TRANS            - jump sub above FB0A
        LDX <$0F       ;XPTR
        STX <$1F       ;WVEND  GET END ADDR
        RTS            ;                 - return
;
;*
;*WAVE DECAY ROUTINE
;*
;*DECAY AMOUNT IN ACCA(1/16 PER DECAY)
;*
WVDECA  TSTA           ;                 - FC87, test A, param 19
        BEQ EXIT9      ;WVDCX  NO DECAY  - branch below if = 0, FCB5
        LDX <$18       ;GWFRM  ROM WAVE INDEX
        STX <$0D       ;XPLAY
        LDX #$0024     ;#GWTAB           - load index
        STAA <$12      ;TEMPB  DECAY FACTOR
WVDLP   STX <$0F       ;XPTR             - FC93 , LOOP10
        LDX <$0D       ;XPLAY
        LDAB <$12      ;TEMPB
        STAB <$11      ;TEMPA  DECAY FACTOR TEMP
        LDAB $01,X     ;1,X  OFFSET FOR WAVE LENGTH
        LSRB           ;
        LSRB           ;
        LSRB           ;
        LSRB           ;CALC 1/16TH
        INX            ;
        STX <$0D       ;XPLAY
        LDX <$0F       ;XPTR
        LDAA $00,X     ;
WVDLP1  SBA            ;DECAY            - FCA8, subtract accums
        DEC >$0011     ;TEMPA
        BNE $FCA8      ;WVDLP1           - branch above if != 0
        STAA $00,x     ;
        INX            ;
        CPX <$1F       ;WVEND  END OF WAVE?
        BNE LOOP10     ;WVDLP  NO        - branch above if != 0, FC93, goto LOOP10
WVDCX   RTS            ;                 - FCB5, return, exit 9
;
;*
;* INTERRUPT PROCESSING
;*
IRQ     LDS #$007F     ;#ENDRAM  E-INITIALIZE STACK  - FCB6, IRQ handler,
        LDAA >$0402    ;SOUND+2  GET INPUT TRIGGER  - PIA channel B
        CLI            ;NOW ALLOW IRQS   - clear interrupt mask
        COMA           ;INVERT INPUT     - complement,flip bits
        ANDA #$1F      ;MASK GARB        - mask upper 3 bits
        LDAB <$08      ;ORGFLG
        BEQ $FCCD      ;IRQ00            - branch below if = 0
        BPL $FCC9      ;IRQ0             - branch below if plus
        JSR PARAM7     ;ORGNT1  ORGAN TUNE  - jump sub to FA48 PARAM 7
IRQ0    DECA           ;ORGAN NOTE       - FCC9, start > 0
        JSR PARAM9     ;ORGNN1           - jump sub above FA89 
IRQ00   CLRB           ;                 - FCCD
        CMPA #$0E      ;#SP1SND
        BEQ $FCD4      ;IRQ00A           - branch below if = 0
        STAB <$06      ;SP1FLG
IRQ00A  CMPA #$12      ;#B2SND           - FCD4
        BEQ $FCDA      ;IRQ000           - branch below if = 0
        STAB <$07      ;B2FLG
;
;*
;* CHECK FOR PRESENCE OF TALKING PROGRAM
;* (Speech ROM)
;*
IRQ000  LDAB >$EFFD    ;TALK  CHECK FOR PROGRAM TO BE THERE  - FCDA
        CMPB #$7E      ;IS IT?
        BNE $FCE4      ;IRQ1  NO, SKIP THE TALKING
        JSR $EFFD      ;TALK  GO PLAY OUT 1 PHRASE  - jump sub
IRQ1    TSTA           ;
        BEQ IRQ2       ;IRQ3  INVALID INPUT  - FCE3,branch below FD0E if = 0
        DECA           ;REMOVE OFFSET    - FCE5
        CMPA #$0C      ;
        BHI $FCF4      ;IRQ10            - branch below if higher
        JSR $FB81      ;GWLD  GWAVE SOUNDS - jump sub above to PARAM13 TAB
        JSR SYNTH9     ;GWAVE            - jump sub above FBE7
        BRA IRQ2       ;IRQ3             - branch below FD0E
IRQ10   CMPA #$1B      ;SPECIAL SOUND?   - FCF4
        BHI $FD06      ;IRQ20  VARI SOUND - branch below if higher
        SUBA #$0D      ;SUB OFFSET
        ASLA           ;DOUBLE FOR ADDRESSING - x 2 for offset in table
        LDX #$FD58     ;#JMPTBL  INDEX TO JUMP TABLE  - load addr VWTAB, W Vector table, into index
        BSR CALCOS     ;ADDX  GET CORRECT INDEX  - branch sub CALCOS, calc offset into table
        LDX $00,X      ;GET ADDRESS TO INDEX - load vector addr
        JSR $00,X      ;PERFORM IT       - jump sub W vector addr at index
        BRA IRQ2       ;IRQ3             - branch below FD0E
IRQ20   SUBA #$1C      ;                 - FD06
        JSR PARAM1     ;VARILD           - jump sub to F82A, PARAM1
        JSR SYNTH1     ;VARI             - jump sub to F83F, SYNTH1
IRQ3    LDAA <$04      ;BG1FLG  BGROUND ACTIVE? - FD0E, IRQ2, IRQ sub
        ORAA <$05      ;BG2FLG           - inclusive OR accum
        BEQ $FD12      ;*  NOPE          - FD12, branch here if = 0
        CLRA           ;
        STAA <$07      ;B2FLG  KILL BONUSES
        LDAA <$04      ;BG1FLG
        BEQ $FD1E      ;IRQXX            - branch below if = 0
        JMP SYNTH4     ;BG1              - jump to F913, SYNTH4
IRQXX   JMP UTIL2      ;BG2              - FD1E, jump above to FB34, UTIL2
;
;*
;* ADD A TO INDEX REGISTER
;*
ADDX    STX <$0D       ;XPLAY            - FD21, CALCOS, calculate unsigned offset of A + X, val in X
        ADDA <$0E      ;XPLAY+1          - add A to LSB of index base value
        STAA <$0E      ;XPLAY+1          - store it
        BCC $FD2C      ;ADDX1            - branch below if Carry clear
        INC >$000D     ;XPLAY            - inc MSB of index base value
ADDX1   LDX <$0D       ;XPLAY            - FD2C, load value
        RTS            ;return
;
;*
;* DIAGNOSTIC PROCESSING HERE
;*
NMI     SEI            ;                 - FD2F, set interrupt mask, vector at $FFFC
        LDS #$007F     ;#ENDRAM  RESET THE STACK  - load stack pointer
        LDX #$FFFF     ;                 - load index
        CLRB           ;
NMI1    ADCB $00,X     ;                 - FD37,add with Carry
        DEX            ;
        CPX #$F800     ;                 - compare index reg to origin
        BNE $FD37      ;NMI1             - branch above if != 0
        CMPB $00,X     ;
        BEQ $FD44      ;NMI2             - branch below if = 0
        WAI            ;                 - wait for interrupt
NMI2    LDAA #$01      ;                 - FD44
        JSR PARAM1     ;VARILD           - jump sub to F82A PARAM1
        JSR SYNTH1     ;VARI             - jump sub to F83F SYNTH1
        LDAB >$EFFA    ;TALKD  TALKING PRESENT?
        CMPB #$7E      ;
        BNE NMI        ;NMI              - branch above if != 0
        JSR $EFFA      ;TALKD            - jump sub 
        BRA NMI        ;NMI  KEEP LOOPING - branch above
;
;*
;*SPECIAL ROUTINE JUMP TABLE
;*
;Vector Table start FD58, form double byte
JMPTBL  FDB $FB49      ;FD58, vector FB49, SP1
        FDB $F913      ;FD5A, vector F913, BG1
        FDB $FB24      ;FD5C, vector FB24, BG2INC
        FDB $F88C      ;FD5E, vector F88C, LITE
        FDB $FB71      ;FD60, vector FB71, BON2
        FDB $FB1E      ;FD62, vector FB1E, BGEND
        FDB $F8CD      ;FD64, vector F8CD, TURBO
        FDB $F894      ;FD66, vector F894, APPEAR
        FDB $F91C      ;FD68, vector F91C, THRUST
        FDB $F923      ;FD6A, vector F923, CANNON
        FDB $F9A6      ;FD6C, vector F9A6, RADIO
        FDB $F9D4      ;FD6E, vector F9D4, HYPER
        FDB $F9F3      ;FD70, vector F9F3, SCREAM
        FDB $FA44      ;FD72, vector FA44, ORGANT
        FDB $FA84      ;FD74, vector FA84, ORGANN
;
;*
;*VARI VECTORS
;*
; VARI VECTORS, square wave pulse width modulator
; form constant byte, pseudo-op, single byte or word into object
;
VVECT   EQU *
SAW     FCB $40,$01,$00,$10,$E1,$00,$80,$FF,$FF ;  - FD76
FOSHIT  FCB $28,$01,$00,$08,$81,$02,$00,$FF,$FF ;  - FD7F, FD80
QUASAR  FCB $28,$81,$00,$FC,$01,$02,$00,$FC,$FF ;  - FD88
CABSHK  FCB $FF,$01,$00,$18,$41,$04,$80,$00,$FF ;  - FD91
; below are from a diff rom
CSCALE  FCB $00,$FF,$08,$FF,$68,$04,$80,$00,$FF ;  - FD9A
MOSQTO  FCB $28,$81,$00,$FC,$01,$02,$00,$FC,$FF ;  - FDA3, dupe QUASAR
VARBG1  FCB $60,$01,$57,$08,$E1,$02,$00,$FE,$80 ;  - FDAC
; end diff rom
;
;*
;*RADIO SOUND WAVEFORM
;*
RADSND  FCB $8C,$5B,$B6,$40,$BF,$49,$A4,$73 ;  - FD9A
        FCB $73,$A4,$49,$BF,$40,$B6,$5B,$8C ;  - FDA3
;*
;*ORGAN TUNE TABLE
;*
;*OSCILLATOR MASK(1),DELAY(1),DURATION(2)
;*
;*PHANTOM
ORGTAB  FCB 3*4                     ;FDAA
        FDB $7F1D,TD/PHANC/2*1      ;D2 1/4  NOTE  - FDAB
        FDB $7F23,TCS/PHANC/2*1     ;CS2 1/4 NOTE
        FDB $FE08,(TFS/PHANC/1*1)*2 ;FS1 1   NOTE
;*TACCATA                           ;JS Bach's Toccata and Fugue in D Minor
        FCB 34*4
        FDB $3E3F,TA/TACC/8*1       ;A3 1/16 NOTE  - FDB8
        FDB $7C04,TG/TACC/8*1       ;G2 1/16 NOTE
        FDB $3E3F,TA/TACC/2*5       ;A3 5/4 NOTE
        FDB $7C12,TE/TACC/2*1       ;E2 1/4 NOTE 
        FDB $7C0D,TF/TACC/2*1       ;F2 1/4 NOTE 
        FDB $7C23,TCS/TACC/2*1      ;CS2 1/4 NOTE
        FDB $7C1D,TD/TACC/4*7       ;D2 7/8 NOTE 
        FDB $7C3F,TA/TACC/8*1       ;A2 1/16 NOTE
        FDB $F804,TG/TACC/8*1       ;G1 1/16 NOTE
        FDB $7C3F,TA/TACC/2*5       ;A2 5/4 NOTE
        FDB $F812,TE/TACC/2*1       ;E1 1/4 NOTE 
        FDB $F80D,TF/TACC/2*1       ;F1 1/4 NOTE 
        FDB $F823,TCS/TACC/2*1      ;CS1 1/4 NOTE
        FDB $F81D,(TD/TACC/1*1)*2   ;D1 1 NOTE 
        FDB $F823,TCS/TACC/4*1      ;CS1 1/8 NOTE
        FDB $F812,TE/TACC/4*1       ;E1 1/8 NOTE
        FDB $F804,TG/TACC/4*1       ;G1 1/8 NOTE 
        FDB $7C37,TBF/TACC/4*1      ;BF2 1/8 NOTE 
        FDB $7C23,TCS/TACC/4*1      ;CS2 1/8 NOTE 
        FDB $7C12,TE/TACC/4*1       ;E2 1/8 NOTE 
        FDB $3E04,TG/TACC/4*1       ;G3 1/8 NOTE 
        FDB $3E37,TBF/TACC/4*1      ;BF3 1/8 NOTE 
        FDB $3E23,TCS/TACC/4*1      ;CS3 1/8 NOTE 
        FDB $1F12,TE/TACC/4*1       ;E4 1/8 NOTE 
        FDB $1F04,TG/TACC/4*1       ;G4 1/8 NOTE 
        FDB $1F37,TBF/TACC/4*1      ;BF4 1/8 NOTE 
        FDB $1F23,TCS/TACC/1*1      ;CS4 1/2 NOTE 
        FDB $FE1D,TD/TACC/1*1       ;D1 1/2 NOTE 
        FDB $7F37,TBF/TACC/1*1      ;BF2 1/2 NOTE 
        FDB $7F3F,TA/TACC/2*1       ;A2 1/4 NOTE 
        FDB $FE04,TG/TACC/2*1       ;G1 1/4 NOTE 
        FDB $FE0D,TF/TACC/2*1       ;F1 1/4 NOTE
        FDB $FE23,TCS/TACC/2*1      ;CS1 1/4 NOTE 
        FDB $FE1D,(TD/TACC/1*2)*2   ;D1 2 NOTE 
        FCB 0                       ;LAST TUNE   - FE40
;*
;*ORGAN NOTE TABLE
;*
;*SCALE      AF  A   BF  B   C   CS
NOTTAB  FCB $47,$3F,$37,$30,$29,$23 ;            - FE41
;*           D   EF  E   F   FS  G
        FCB $1D,$17,$12,$0D,$08,$04 ;            - FE47
;
;*
;*WAVE TABLE
;*
;*1ST BYTE= WAVELENGTH
;*
GWVTAB  EQU *
GS2     FCB 8,127,217,255,217,127,36,0,36
;FE4D:      08 7f d9 ff d9 7f 24 00 24
;
GSSQ2   FCB 8,0,64,128,0,255,0,128,64
;FE56:      08 00 40 80 00 ff 00 80 40
;
GS1     FCB 16,127,176,217,245,255,245,217,176
;FE5F:      10 7f b0 d9 f5 ff f5 d9 b0
        FCB 127,78,36,9,0,9,36,78
;FE68:      7f 4e 24 09 00 09 24 4e
;
GS12    FCB 16,127,197,236,231,191,141,109,106
;FE70:      10 7f c5 ec e7 bf 8d 6d 6a
        FCB 127,148,146,113,64,23,18,57
;FE79:      7f 94 92 71 40 17 12 39
;
GSQ22   FCB 16,$FF,$FF,$FF,$FF,0,0,0,0
;FE81:      10 ff ff ff ff 00 00 00 00
        FCB $FF,$FF,$FF,$FF,0,0,0,0
;FE8A:      ff ff ff ff 00 00 00 00
;
GS72    FCB 72,138,149,160,171,181,191,200,209
;FE92:      48 8a 95 a0 ab b5 bf c8 d1
        FCB 218,225,232,238,243,247,251,253,254,255
;FE9B:      da e1 e8 ee f3 f7 fb fd fe ff
        FCB 254,253,251,247,243,238,232,225,218
;FEA5:      fe fd fb  f7 f3 ee e8 e1 da
        FCB 209,200,191,181,171,160,149,138,127
;FEAE:      d1 c8 bf b5 ab a0 95 8a 7f
        FCB 117,106,95,84,74,64,55,46,37,30,23,17,12
;FEB7:      75 6a 5f 54 4a 40 37 2e 25 1e 17 11 0c
        FCB 8,4,2,1,0
;FEC4:      08 04 02 01 00
        FCB 1,2,4,8,12,17,23,30,37,46,55,64,74,84
;FEC9:      01 02 04 08 0c 11 17 1e 25 2e 37 40 4a 54
        FCB 95,106,117,127
;FED7:      5f 6a 75 7f
;
GS1.7   FCB 16,89,123,152,172,179,172,152,123
;FEDB:      10 59 7b 98 ac b3 ac 98 7b
        FCB 89,55,25,6,0,6,25,55
;FEE4:      59 37 19 06 00 06 19 37
;
;*
;*GWAVE SOUND VECTOR TABLE
;*
;*VECTOR FORMAT
;*BYTE 0: GECHO,GCCNT
;*BYTE 1: GECDEC,WAVE#
;*BYTE 2: PREDECAY FACTOR
;*BYTE 3: GDFINC
;*BYTE 4: VARIABLE FREQ COUNT
;*BYTE 5: FREQ PATTERN LENGTH
;*BYTE 6: FREQ PATTERN OFFSET
;*
SVTAB   EQU *
HBDV    FCB $81,$24,0  ,0  ,0  ,22,HBDSND-GFRTAB   ;1  - FEEC:  81 24 00 00 00 16 31
STDV    FCB $12,$05,$1A,$FF,0  ,39,STDSND-GFRTAB   ;2  - FEF3:  12 05 1a ff 00 27 6d
DP1V    FCB $11,$05,$11,1  ,15 ,1 ,SWPAT-GFRTAB    ;3  - FEFA:  11 05 11 01 0f 01 47
XBV     FCB $11,$31,0  ,1  ,0  ,13,SPNSND-GFRTAB   ;4  - FF01:  11 31 00 01 00 0d 1b
BBSV    FCB $F4,$12,$0 ,0  ,0  ,20,BBSND-GFRTAB    ;5  - FF08:  f4 12 00 00 00 14 47
HBEV    FCB $41,$45,0  ,0  ,0  ,15,HBESND-GFRTA    ;6  - FF0F:  41 45 00 00 00 0f 5b
PROTV   FCB $21,$35,$11,$FF,0  ,13,SPNSND-GFRTAB   ;7  - FF16:  21 35 11 ff 00 0d 1b
SPNRV   FCB $15,$00,0  ,$FD,0  ,1 ,SPNR-GFRTAB     ;8  - FF1D:  15 00 00 fd 00 01 69
CLDWNV  FCB $31,$11,0  ,1  ,0  ,3 ,COOLDN-GFRTAB   ;9  - FF24:  31 11 00 01 00 03 6a
SV3     FCB $01,$15,1  ,1  ,1  ,1 ,BBSND-GFRTAB    ;10 - FF2B:  01 15 01 01 01 01 47
ED10    FCB $F6,$53,3  ,0  ,2  ,6 ,ED10FP-GFRTAB   ;11 - FF32:  f6 53 03 00 02 06 94
ED12    FCB $6A,$10,2  ,0  ,2  ,6 ,ED13FP-GFRTAB   ;12 - FF39:  6a 10 02 00 02 06 9a
ED17    FCB $1F,$12,0  ,$FF,$10,4 ,SPNR-GFRTAB     ;13 - FF40:  1f 12 00 ff 10 04 69
BONV    FCB $31,$11,0  ,$FF,0  ,13,BONSND-GFRTAB   ;   - FF47:  31 11 00 ff 00 0d 00
TRBV    FCB $12,$06,$0 ,$FF,1  ,9 ,TRBPAT-GFRTAB   ;   - FF4E:  12 06 00 ff 01 09 28
;
;*
;*GWAVE FREQ PATTERN TABLE
;*
GFRTAB  EQU *
;*BONUS SOUND
BONSND  FCB $A0,$98,$90,$88,$80,$78,$70,$68              ;FF55
        FCB $60,$58,$50,$44,$40                          ;FF5D
;
;*HUNDRED POINT SOUND
HBTSND  FCB 1,1,2,2,4,4,8,8,$10,$10,$30,$60,$C0,$E0      ;FF62
;
;*SPINNER SOUND
SPNSND  FCB 1,1,2,2,3,4,5,6,7,8,9,$A,$C                  ;FF70
;
;*TURBINE START UP
TRBPAT  FCB $80,$7C,$78,$74,$70,$74,$78,$7C,$80          ;FF7D
;
;*HEARTBEAT DISTORTO
HBDSND  FCB 1,1,2,2,4,4,8,8,$10,$20,$28                  ;FF86
        FCB $30,$38,$40,$48,$50,$60,$70,$80,$A0,$B0,$C0  ;FF91
;
;*SWEEP PATTERN
SWPAT   EQU *
;*BIGBEN SOUNDS
BBSND   FCB 8,64,8,64,8,64,8,64,8,64                     ;FF9C
        FCB 8,64,8,64,8,64,8,64,8,64                     ;FFA6
;
;*HEARTBEAT ECHO
HBESND  FCB 1,2,4,8,9,$A,$B,$C,$E,$F,$10                 ;FFB0
        FCB $12,$14,$16                                  ;FFBB
;
;*SPINNER SOUND "DRIP"
SPNR    FCB $40                                          ;FFBE
;
;*COOL DOWNER
COOLDN  FCB $10,8,1                                      ;FFBF
;
;*START DISTORTO SOUND
STDSND  FCB 1,1,1,1,2,2,3,3,4,4,5,6,8,$A,$C,$10          ;FFC2
        FCB $14,$18,$20,$30,$40,$50,$40,$30              ;FFD2
        FCB $20,$10,$C,$A,8,7,6,5,4,3,2,2,1,1,1          ;FFDA
;
;*ED'S SOUND 10
ED10FP  FCB 7,8,9,$A,$C,8                                ;FFE9
;
;*ED'S SOUND 13
ED13FP  FCB $17,$18,$19,$1A,$1B,$1C                      ;FFEF
        FCB $0,$0,$0                                     ;FFF5  MATCH THE PROMS 
;
;*
;* VECTORS HERE
;*
;  Motorola Vector Table 
FFF8: FC B6                    ;IRQV     FDB   IRQ     
FFFA: F8 01                    ;SWIV     FDB   RESET (Software)
FFFC: FD 2F                    ;NMIV     FDB   NMI
FFFE: F8 01                    ;RESETV   FDB   RESET (Hardware)
END     CKSUM
;
;
;
 ;  ****** Hardware data ******
 ;  Sound 6802/6808 board
 ;  $0000 - $007F RAM 
 ;  $0400 - $0403 PIA 
 ;  $F800 - $FFFF ROM 
 ;  Writing to $400 puts values in the DAC
 
 ; Accumulator        A       8 bits
 ; Accumulator        B       8 bits
 ; Index Register     X       16 bits
 ; Program Counter    PC      16 bits
 ; Stack Pointer      SP      16 bits
 ; Status Register    COSZAc  8 bits (Carry, Overflow, Sign, Zero, Aux Carry)(|1|1|Ac|1|S|Z|O|C|)
;
;
;
;eof
