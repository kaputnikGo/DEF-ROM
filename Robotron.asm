        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Robotron.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  6780
        ;  CRC-32:    C56C1D28
        ;
        ;  Date:    Thu May 20 11:01:16 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Video ROM 3 Robotron 2048
        ; 
        ;
        ;redo, merge with source - source comments and notes are in CAPS
        ;
        ;updated 3 June 2021
        ;
        ;
;  NAM  ROBOTRON SOUNDS VERSION 1.0  3-8-82 
;*COPYRIGHT WILLIAMS ELECTRONICS INC. 2084
;*PROGRAMMERS: EUGENE P. JARVIS, SAM DICKER,RANDY PFEIFFER,JOHN KOTLARIK
;*    PAUL G. DUSSAULT,CARY W. KOLKER,TIM  MURPHY
;*      AND A CAST OF THOUSANDS......
;*
        ;
;NOGEN
;
;*
;*SYSTEM CONSTANTS
;*
ROM      EQU  $F000
SOUND    EQU  $400
CKORG    EQU  $EF00     ;CHECKSUM PROG ORG
ENDRAM   EQU  $7F
VECTOR   EQU  $FFF8     ;RESET,INT VECTORS
WVELEN   EQU  72
BG1MAX   EQU  29        ;MAX BACKGROUND INCREMENT
HBLEN    EQU  72
BG2MAX   EQU  29  
SP1SND   EQU  $0E       ;SPINNER SOUND #1 CODE
B2SND    EQU  $12       ;BONUS SOUND #2 CODE
SP1MAX   EQU  32
NIN      EQU  5
FIF      EQU  6
TAF      EQU  34715!>1  ;NOTE TIMES
TA       EQU  36780!>1
TBF      EQU  38967!>1
TB       EQU  41284!>1
TC       EQU  43739!>1
TCS      EQU  46340!>1
TD       EQU  49096!>1
TEF      EQU  52015!>1
TE       EQU  55108!>1
TF       EQU  58385!>1
TFS      EQU  61857!>1
TG       EQU  65535!>1
;*
;*
;* SCREAM EQUATES
;*
ECHOS    EQU  4
FREQ     EQU  0 
TIMER    EQU  1
;*
;*GLOBALS
;*
        ORG  0
BG1FLG  RMB  1          ;BACKGROUND SOUND 1
BG2FLG  RMB  1          ;BACKGROUND SOUND 2
SP1FLG  RMB  1          ;SPINNER FLAG
B2FLG   RMB  1          ;BONUS #2 FLAG
ORGFLG  RMB  1          ;ORGAN FLAG
HI      RMB  1          ;RANDOM SEED
LO      RMB  1          ;RANDOM SEED
XDECAY  RMB  2
AMP0    RMB  1
;*
;*
;*TEMPORARIES
;*
TMPRAM  EQU  *          ;TEMPORARY RAM
TEMPX   RMB  2          ;X TEMPS
XPLAY   RMB  2
XPTR    RMB  2
TEMPA   RMB  1          ;ACCA TEMP
TEMPB   RMB  1
LOCRAM  EQU  *
;*
;*GWAVE PARAMETERS
;*
        ORG  LOCRAM
GECHO   RMB  1          ;ECHO FLAG
GCCNT   RMB  1          ;CYCLE COUNT
GECDEC  RMB  1          ;# OF DECAYS PER ECHO
GDFINC  RMB  1          ;DELTA FREQ INC
GDCNT   RMB  1          ;DELTA FREQ COUNT
GWFRM   RMB  2          ;WAVEFORM ADDRESS
;*TEMPORARY OR COMPUTED PARAMETERS
PRDECA  RMB  1          ;PRE-DECAY FACTOR
GWFRQ   RMB  2          ;FREQ TABLE ADDR
FRQEND  RMB  2          ;END ADDR FREQ TABLE
WVEND   RMB  2          ;WAVE END ADDR
GPER    RMB  1          ;PERIOD
GECNT   RMB  1          ;# OF ECHOES COUNTER
FOFSET  RMB  1          ;FREQUENCY OFFSET
;*
;*GWAVE TABLES
;*
GWTAB   RMB  WVELEN     ;WAVE TABLE
;*
;*VARIWAVE PARAMETERS
;*
        ORG  LOCRAM
LOPER   RMB  1          ;LO PERIOD
HIPER   RMB  1          ;HIPERIOD
LODT    RMB  1          ;PERIOD DELTAS
HIDT    RMB  1
HIEN    RMB  1          ;END PERIOD
SWPDT   RMB  2          ;SWEEP PERIOD
LOMOD   RMB  1          ;BASE FREQ MOD
VAMP    RMB  1          ;AMPLITUDE
LOCNT   RMB  1          ;PERIOD COUNTERS
HICNT   RMB  1
;* SIREN AND BOMB RAM
        ORG  LOCRAM
TOP     RMB  2
SWEEP   RMB  2
SLOPE   RMB  1
END2    RMB  2
TIME    RMB  1
TABLE   RMB  2
FREQZ   RMB  1
;*
;* KNOCKER RAM
;*
        ORG  LOCRAM
PERIOD  RMB  1
AMP     RMB  1
SNDTMP  RMB  2          ;INDEX TMEP
;*
;* FLASH LOCAL RAM
        ORG  LOCRAM
FREQ1   RMB  1          ;FREQUENCY CONSTANT 1
FREQ2   RMB  1          ;FREQUENCY CONSTANT 2
FREQ3   RMB  1          ;FREQUENCY CONSTANT 3
FREQ4   RMB  1          ;FREQUENCY CONSTANT 4
DELTA1  RMB  1          ;DELTA AMPLITUDE 1
DELTA2  RMB  1          ;DELTA AMPLITUDE 2
DELTA3  RMB  1          ;DELTA AMPLITUDE 3
DELTA4  RMB  1          ;DELTA AMPLITUDE 4
FREQ1$  RMB  1          ;FREQUENCY COUNTER 1
FREQ2$  RMB  1          ;FREQUENCY COUNTER 2
FREQ3$  RMB  1          ;FREQUENCY COUNTER 3
FREQ4$  RMB  1          ;FREQUENCY COUNTER 4
CYCLE1  RMB  1          ;CYCLE CONSTANT 1
CYCLE2  RMB  1          ;CYCLE CONSTANT 2
CYCLE3  RMB  1          ;CYCLE CONSTANT 3
CYCLE4  RMB  1          ;CYCLE CONSTANT 4
DFREQ1  RMB  1          ;DELTA FREQUENCY 1
DFREQ2  RMB  1          ;DELTA FREQUENCY 2
DFREQ3  RMB  1          ;DELTA FREQUENCY 3
DFREQ4  RMB  1          ;DELTA FREQUENCY 4
EFREQ1  RMB  1          ;END FREQUENCY 1
EFREQ2  RMB  1          ;END FREQUENCY 2
EFREQ3  RMB  1          ;END FREQUENCY 3
EFREQ4  RMB  1          ;END FREQUENCY 4
CYCL1$  RMB  1          ;CYCLE COUNTER 1
CYCL2$  RMB  1          ;CYCLE COUNTER 2
CYCL3$  RMB  1          ;CYCLE COUNTER 3
CYCL4$  RMB  1          ;CYCLE COUNTER 4
SNDX1   RMB  1

RANDOM  EQU  LO         ;SINGLE BYTE RANDOM
        ORG  LOCRAM+1
FREQ$   RMB  1          ;START FREQUENCY
C$FRQ   RMB  1          ;CYCLES AT FREQUENCY
D$FRQ   RMB  1          ;DELTA FREQUENCY
E$FRQ   RMB  1          ;END FREQUENCY
C$AMP   RMB  1          ;CYCLES AT AMPLITUDE
D$AMP   RMB  1          ;DELTA AMPLITUDE
C$AMP$  RMB  1          ;CYCLE COUNTER
C$FRQ$  RMB  1          ;CYCLE COUNTER
;*
;*NOISE/CROWD ROAR ROUTINE PARAMETERS
;*
        ORG  LOCRAM
DECAY   RMB  1
NAMP    RMB  1
CYCNT   RMB  1
NFRQ1   RMB  2
NFFLG   RMB  1
LFREQ   RMB  1
DFREQ   RMB  1
GALPAM  EQU  *
CYCNT2  RMB  1
NAMP2   RMB  1
DECAY2  RMB  1
NFFLG2  RMB  1
NFR2    RMB  1
GALCNT  RMB  1
WHIS    RMB  1          ;CROWD ROAR AMP
WFRQ    RMB  1          ;CROWD WHISTLE FREQ
WCNT    RMB  1          ;WHISTLE PASSCOUNTER
PTRHI   RMB  2          ;WHIS ADR PTR
WFRQ2   RMB  1
WCNT2   RMB  1
CURVAL  RMB  1          ;WHISTLING NOISE OUTPUT
ATP     RMB  1          ;INTERM NOISE VAL
MINWIS  RMB  1          ;MIN WHISTLE FREQ
CY2     RMB  1          ;NOISE CYCLE COUNTER
DFRQ    RMB  1          ;WHISTLE FREQ CHANGE
DFRQ2   RMB  1          ;INIT WHISTLE FREQ CHANGE
NNOIS   RMB  1          ;NEXT NOISE VALUE
NFRQ    RMB  1          ;NOISE FREQ
NFRQ2   RMB  1          ;INIT NOISE FREQ
RCNT2   RMB  1
;*
;*FILTERED NOISE ROUTINE PARAMETERS
;*
        ORG  LOCRAM
FMAX    RMB  1          ;MAXIMUM_FREQUENCY
FHI     RMB  1          ;FREQUENCY
FLO     RMB  1 
LOFRQ   RMB  1
SAMPC   RMB  2          ;SAMPLE COUNT
FDFLG   RMB  1          ;FREQUENCY DECREMENT FLAG
DSFLG   RMB  1          ;DISTORTION FLAG
;*
;*SCREAM TABLES
;*
        ORG  LOCRAM
STABLE  RMB  2*ECHOS    ;SCREAM TABLE
SRMEND  EQU  *
;*
;*ORGAN PARAMETERS
;*
        ORG  LOCRAM
DUR     RMB  2          ;NOTE DURATION
OSCIL   RMB  1          ;OSCILLATORS
RDELAY  RMB  60         ;RAM DELAY LOAD
;*
;* CHECKSUM CALCULATOR & RELOCATOR
;*
        ORG  CKORG
CKSUM   LDX  #$FFFF     ;INDEX TO END OF ROM
        CLRB            ;ZERO CHECKSUM
CKSUM1  ADCB  0,X       ;ADD IN PROGRAM BYTE
        DEX             ;TO NEXT BYTE
        CPX  #$F000     ;DONE YET?
        BNE  CKSUM1     ;NOPE...
        STAB  0,X       ;SAVE CHECKSUM AT BEGINNING
        WAI             ;TURN OFF LEDS
FROM    RMB  2          ;FOR POINTER
TO      RMB  2          ;FOR POINTER
;*
;* MAIN PROGRAM
;*
        ;
org  $F000
        ;
F000 : 76                             ;checksum byte
;*************************************;
; Copyright Message - FCC
;*************************************;
F001 : 28 43    "(C"                  ;(C)
F003 : 29 31    ")1"                  ;1982
F005 : 39    "9"
F006 : 38    "8"
F007 : 32    "2"
F008 : 20 57    " W"                  ;WILLIAMS
F00A : 49    "I"
F00B : 4C    "L"
F00C : 4C    "L"
F00D : 49    "I"
F00E : 41    "A"
F00F : 4D    "M"
F010 : 53    "S"
F011 : 20 45    " E"                  ;ELECTRONICS
F013 : 4C    "L"
F014 : 45    "E"
F015 : 43    "C"
F016 : 54    "T"
F017 : 52    "R"
F018 : 4F    "O"
F019 : 4E    "N"
F01A : 49    "I"
F01B : 43    "C"
F01C : 53    "S"
;*************************************;
;RESET power on
;*************************************;
;SETUP
F01D : 0F         sei                 ;set interrupt mask 
F01E : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh (#ENDRAM) INITIALIZE STACK POINTER
F021 : CE 04 00   ldx  #$0400         ;load X with 0400h (#SOUND ) INDEX TO PIA
F024 : 6F 01      clr  $01,x          ;clear X+00h (ACCESS DDRA)
F026 : 6F 03      clr  $03,x          ;clear X+00h (ACCESS DDRB)
F028 : 86 FF      ldaa  #$FF          ;load A with FFh (PA0-PA7)
F02A : A7 00      staa  $00,x         ;store A in X+00h (SET SIDE A AS OUTPUTS)
F02C : 6F 02      clr  $02,x          ;clear X+02h (SET B SIDE AS INPUTS)
F02E : 86 37      ldaa  #$37          ;load A with 37h (CB2 LOW, IRQ ALLOWED)
F030 : A7 03      staa  $03,x         ;store A in X+03h (PROGRAM B CONTROL REG)
F032 : 86 3C      ldaa  #$3C          ;load A with 3Ch (CA2 SET INIT HIGH, NO IRQS)
F034 : A7 01      staa  $01,x         ;store A in X+01h (PROGRAM A SIDE)
F036 : 97 05      staa  $05           ;store A in addr 05 (HI) START RANDOM GENERATOR
F038 : 4F         clra                ;clear A 
F039 : 97 03      staa  $03           ;store A in addr 03 (B2FLG)
F03B : 97 00      staa  $00           ;store A in addr 00 (BG1FLG)
F03D : 97 01      staa  $01           ;store A in addr 01 (BG2FLG)
F03F : 97 02      staa  $02           ;store A in addr 02 (SP1FLG)
F041 : 97 04      staa  $04           ;store A in addr 04 (ORGFLG)
F043 : 0E         cli                 ;clear interrupts 
F044 : 20 FE      bra  LF044          ;branch always here (*) WAIT FOR INTERRUPT
;*************************************;
;* THREE OSCILLATOR SOUND GENERATOR
;*************************************;
;PLAY
F046 : DF 0C      stx  $0C            ;store X in addr 0C (XPLAY) SAVE CURRENT INDEX
F048 : CE F0 EB   ldx  #$F0EB         ;load X with F0EBh (#DECAYZ) SET TO MAXIMUM AMPLITUDE
F04B : DF 07      stx  $07            ;store X in addr 07 (XDECAY) AND SAVE
F04D : 86 80      ldaa  #$80          ;load A with 80h (LOAD ZERO AMPLITUDE)
;PLAY1
F04F : D6 15      ldab  $15           ;load B with addr 15 (FREQ4) CHECK WHITE NOISE COUNTER
F051 : 2A 09      bpl  LF05C          ;branch N=0 PLAY3 (NOT IN WHITE MODE)
F053 : D6 06      ldab  $06           ;load B with addr 06 (RANDOM) GET RANDOM NUMBER
F055 : 54         lsrb                ;logic shift right B (REDUCE IT)
F056 : 54         lsrb                ;logic shift right B
F057 : 54         lsrb                ;logic shift right B
F058 : 5C         incb                ;logic shift right B (NOW NON-ZERO)
;PLAY2
F059 : 5A         decb                ;decr B (TIME OUT COUNT)
F05A : 26 FD      bne  LF059          ;branch Z=0 PLAY2
;PLAY3
F05C : 7A 00 1A   dec  $001A          ;decr addr 001A (FREQ1$) COUNT DOWN OSC. 1
F05F : 27 4C      beq  LF0AD          ;branch Z=1 PLAY7 (DO AN UPDATE)
F061 : 7A 00 1B   dec  $001B          ;decr addr 001B (FREQ2$) COUNT DOWN OSC. 2
F064 : 27 4C      beq  LF0B2          ;branch Z=1 PLAY8 (DO AN UPDATE)
F066 : 7A 00 1C   dec  $001C          ;decr addr 001C (FREQ3$) COUNT DOWN OSC. 3
F069 : 27 4C      beq  LF0B7          ;branch Z=1 PLAY9 (DO AN UPDATE)
F06B : 7A 00 1D   dec  $001D          ;decr addr 001D (FREQ4$) COUNT DOWN WHITE NOISE
F06E : 26 DF      bne  LF04F          ;branch Z=0 PLAY1 (DO THEM AGAIN)
F070 : D6 15      ldab  $15           ;load B with addr 15 (FREQ4) CHECK WHITE NOISE CONSTANT
F072 : 27 DB      beq  LF04F          ;branch Z=1 PLAY1 (FORGET IT)
F074 : C4 7F      andb  #$7F          ;and A with 7Fh (STRIP FLAG BIT)
F076 : D7 1D      stab  $1D           ;store B in addr 1D (FREQ4$) SAVE WHITE NOISE COUNT
F078 : D6 06      ldab  $06           ;load B with addr 06 (RANDOM) GET CURRENT RANDOM
F07A : 58         aslb                ;arith shift left B (DOUBLE)
F07B : DB 06      addb  $06           ;add B with addr 06 (RANDOM) TRIPLE
F07D : CB 0B      addb  #$0B          ;add B with 0Bh (ADD IN 11)
F07F : D7 06      stab  $06           ;store B in addr 06 (RANDOM) VOILA...NEW RANDOM NUMBER
F081 : 7A 00 2D   dec  $002D          ;decr addr 002D (CYCL4$) COUNT DOWN DECAY
F084 : 26 0E      bne  LF094          ;branch Z=0 PLAY6 (DON'T DECAY)
F086 : D6 21      ldab  $21           ;load B with addr 21 (CYCLE4) RELOAD COUNT
F088 : D7 2D      stab  $2D           ;store B in addr 2D (CYCL4$) AND SAVE
F08A : DE 07      ldx  $07            ;load X with addr 07 (XDECAY) GET DECAY JUMP POINTER
F08C : 09         dex                 ;decr X (MOVE TO LESS AMPLITUDE)
F08D : 8C F0 E4   cpx  #$F0E4         ;compare X with F0E4h (#RDECAY+1) DONE?
F090 : 27 4E      beq  LF0E0          ;branch Z=1 PLAY12 (YUP...BYE BYE)
F092 : DF 07      stx  $07            ;store X in addr 07 (XDECAY) SAVE NEW POINTER
;PLAY6
F094 : D6 06      ldab  $06           ;load B with addr 06 (RANDOM) GET RANDOM AMPLITUDE
F096 : 2B 06      bmi  LF09E          ;branch N=1 PLAY6A (SKIP IF NEGATIVE)
F098 : D4 19      andb  $19           ;and B with addr 19 (DELTA4) REDUCE AMPLITUDE
F09A : C4 7F      andb  #$7F          ;and B with 7Fh (STRIP SIGN BIT)
F09C : 20 05      bra  LF0A3          ;branch always PLAY6B
;PLAY6A
F09E : D4 19      andb  $19           ;andB with addr 19 (DELTA4) REDUCE AMPLITUDE
F0A0 : C4 7F      andb  #$7F          ;and B with 7Fh (REMOVE SIGN BIT)
F0A2 : 50         negb                ;negate B 
;PLAY6B
F0A3 : 36         psha                ;push A into stack then SP-1
F0A4 : 1B         aba                 ;add B to A (ADD WHITE NOISE)
F0A5 : 16         tab                 ;transfer A to B
F0A6 : 32         pula                ;SP+1 pull stack into A
F0A7 : DE 07      ldx  $07            ;load X with addr 07 (XDECAY) GET DECAY POINTER
F0A9 : AD 00      jsr  $00,x          ;jump sub addr X+00h (OUTPUT NOISE)
F0AB : 20 A2      bra  LF04F          ;branch always PLAY1 (DO SOME MORE)
;PLAY7
F0AD : CE 00 12   ldx  #$0012         ;load X with 0012h (#FREQ1) INDEX TO SET 1
F0B0 : 20 08      bra  LF0BA          ;branch always PLAY10
;PLAY8
F0B2 : CE 00 13   ldx  #$0013         ;load X with 0013h (#FREQ2) INDEX TO SET 2
F0B5 : 20 03      bra  LF0BA          ;branch always PLAY10
;PLAY9
F0B7 : CE 00 14   ldx  #$0014         ;load X with 0014h (#FREQ3) INDEX TO SET 3
;PLAY10
F0BA : 6D 18      tst  $18,x          ;test addr X+18h (#24) CHECK CYCLES AT FREQUENCY
F0BC : 27 12      beq  LF0D0          ;branch Z=1 PLAY11 (ZERO, DON'T CHANGE)
F0BE : 6A 18      dec  $18,x          ;decr X+18h (#24) COUNT DOWN 
F0C0 : 26 0E      bne  LF0D0          ;branch Z=0 PLAY11 (NOT TIME TO CHANGE...)
F0C2 : E6 0C      ldab  $0C,x         ;load B with X+0Ch (#12) LOAD CYCLES AT FREQUENCY
F0C4 : E7 18      stab  $18,x         ;store B in X+18h (#24) SAVE IN COUNTER
F0C6 : E6 00      ldab  $00,x         ;load B with X+00h (GET CURRENT FRQUENCY)
F0C8 : EB 10      addb  $10,x         ;add B with X+10h (#16) ADD DELTA
F0CA : E1 14      cmpb  $14,x         ;compare B with X+14h (#20) COMPARE TO END
F0CC : 27 12      beq  LF0E0          ;branch Z=1 PLAY12 (DONE...)
F0CE : E7 00      stab  $00,x         ;store B in addr X+00h (SAVE NEW CURRENT FREQUENCY)
;PLAY11
F0D0 : E6 00      ldab  $00,x         ;load B with X+00h (GET CURRENT FREQUENCY)
F0D2 : E7 08      stab  $08,x         ;store B in addr X+08h (SAVE IN FREQUENCY COUNTER)
F0D4 : AB 04      adda  $04,x         ;add A with X+04h (ADD IN AMPLITUDE)
F0D6 : 60 04      neg  $04,x          ;negate addr X+04h (NEGATE AMPLITUDE)
F0D8 : 16         tab                 ;transfer A to B (SAVE DATA)
F0D9 : DE 07      ldx  $07            ;load X with addr 07 (XDECAY) INDEX TO DECAY
F0DB : AD 00      jsr  $00,x          ;jump sub addr X+00h (OUTPUT SOUND)
F0DD : 7E F0 4F   jmp  LF04F          ;jump PLAY1 (REPEAT)
;PLAY12
F0E0 : DE 0C      ldx  $0C            ;load X with addr 0C (XPLAY) RESTORE INDEX
F0E2 : 39         rts                 ;return subroutine
;*************************************;
;* ECHO AND DECAY ROUTINE
;*************************************;
;RDECAY
F0E3 : 54         lsrb                ;logic shift right B
F0E4 : 54         lsrb                ;logic shift right B
F0E5 : 54         lsrb                ;logic shift right B
F0E6 : 54         lsrb                ;logic shift right B
F0E7 : 54         lsrb                ;logic shift right B
F0E8 : 54         lsrb                ;logic shift right B
F0E9 : 54         lsrb                ;logic shift right B
F0EA : 54         lsrb                ;logic shift right B
;DECAYZ
F0EB : F7 04 00   stab  $0400         ;store B in DAC output SOUND
F0EE : 39         rts                 ;return subroutine
;*************************************;
;* 3 OSCILLATOR CALLING ROUTINES
;*************************************;
;THNDR
F0EF : CE F3 D2   ldx  #$F3D2         ;load X with F3D2h (#VEC01) THUNDER SOUND
;THNDR1
F0F2 : C6 1C      ldab  #$1C          ;load B with 1Ch (#28) NEED TO TRANSFER
F0F4 : BD F9 65   jsr  LF965          ;jump sub TRANS (28 BYTES FOR PLAY)
F0F7 : BD F0 46   jsr  LF046          ;jump sub PLAY (NOW PLAY IT)
F0FA : 39         rts                 ;return subroutine
;SND2
F0FB : CE F3 EE   ldx  #$F3EE         ;load X with F3EEh (#VEC02) SOUND 2
F0FE : 20 F2      bra  LF0F2          ;branch always THNDR1
;SND3
F100 : CE F4 0A   ldx  #$F40A         ;load X with F40Ah (#VEC03) SOUND 3
F103 : 20 ED      bra  LF0F2          ;branch always THNDR1
;SND4
F105 : CE F4 26   ldx  #$F426         ;load X with F426h (#VEC04) SOUND 4
F108 : 20 E8      bra  LF0F2          ;branch always THNDR1
;SND5
F10A : CE F4 42   ldx  #$F442         ;load X with F442h (#VEC05) SOUND 5
F10D : 20 E3      bra  LF0F2          ;branch always THNDR1
;SND16
F10F : CE F4 7A   ldx  #$F47A         ;load X with F47Ah (#VEC016)
F112 : 20 DE      bra  LF0F2          ;branch always THNDR1
;SND17
F114 : CE F4 96   ldx  #$F496         ;load X with F496h (#VEC017)
F117 : 20 D9      bra  LF0F2          ;branch always THNDR1
;*************************************;
;* PROGRESSIVE PITCH BONUS COUNTDOWN
;*************************************;
;BONUS$
F119 : CE 00 60   ldx  #$0060         ;load X with 0060h (PROGRESSIVE SINGLE FREQUENCY)
F11C : A6 00      ldaa  $00,x         ;load A with X+00h (GET CURRENT FREQUENCY)
F11E : 80 02      suba  #$02          ;sub A with 02h (NOW HIGHER)
F120 : A7 00      staa  $00,x         ;store A in addr X+00h (SAVE NEW FREQUENCY)
F122 : BD F3 30   jsr  LF330          ;jump sub MOVE (SET UP FOR SING)
F125 : 7E F3 49   jmp  LF349          ;jump SING (PLAY IT)
;*************************************;
;* DIVING PLANE SOUND
;*************************************;
;PLANE
F128 : CE 00 01   ldx  #$0001         ;load X with 0001h (SET FOR SHORT HALF CYCLE)
F12B : DF 12      stx  $12            ;store X in addr 12 (FREQ1) SAVE VALUE
F12D : CE 03 80   ldx  #$0380         ;load X with 0380h (SET FOR LONG HALF CYCLE)
F130 : DF 14      stx  $14            ;store X in addr 14 (FREQ3) SAVE VALUE
;PLANE1
F132 : 7F 04 00   clr  $0400          ;clear DAC output SOUND (SEND OUT ZEROES)
F135 : DE 12      ldx  $12            ;load X with addr 12 (FREQ1) GET LOW HALF CYCLE DATA
F137 : 08         inx                 ;incr X (INCREASE HALF CYCLE)
F138 : DF 12      stx  $12            ;store X in addr 12 (FREQ1) SAVE NEW VALUE
;PLANE2
F13A : 09         dex                 ;decr X (COUNT DOWN)
F13B : 26 FD      bne  LF13A          ;branch Z=0 PLANE2
F13D : 73 04 00   com  $0400          ;complement 1s DAC output SOUND (SEND OUT ONES)
F140 : DE 14      ldx  $14            ;load X with addr 14 (FREQ3) GET HIGH HALF CYCLE DATA
;PLANE3
F142 : 09         dex                 ;decr X (COUNT DOWN)
F143 : 26 FD      bne  LF142          ;branch Z=0 PLANE3
F145 : 20 EB      bra  LF132          ;branch always PLANE1
;*************************************;
;*  SIREN   AIR RAID
;*************************************;
;ZIREN
F147 : 86 FF      ldaa  #$FF          ;load A with FFh
F149 : 97 12      staa  $12           ;store A in addr 12 (TOP)
F14B : CE FE C0   ldx  #$FEC0         ;load X with FEC0h
F14E : DF 14      stx  $14            ;store X in addr 14 (SWEEP)
F150 : 86 20      ldaa  #$20          ;load A with 20h
F152 : CE FF E0   ldx  #$FFE0         ;load X with FFE0h
F155 : 8D 05      bsr  LF15C          ;branch sub ZIREN0
F157 : 86 01      ldaa  #$01          ;load A with 01h
F159 : CE 00 44   ldx  #$0044         ;load X with 0044h
;ZIREN0
F15C : 97 16      staa  $16           ;store A in addr 16 (SLOPE)
F15E : DF 17      stx  $17            ;store X in addr 17 (END2)
;ZIREN1
F160 : CE 00 10   ldx  #$0010         ;load X with 0010h
;ZIREN2
F163 : 8D 21      bsr  LF186          ;branch sub ZIRLOP
F165 : 96 13      ldaa  $13           ;load A with addr 13 (TOP+1)
F167 : 9B 15      adda  $15           ;add A with addr 15 (SWEEP+1)
F169 : 97 13      staa  $13           ;store A with addr 13 (TOP+1
F16B : 96 12      ldaa  $12           ;load A with addr 12 (TOP)
F16D : 99 14      adca  $14           ;add C+A with addr 14 (SWEEP)
F16F : 97 12      staa  $12           ;store A with addr 12 (TOP)
F171 : 09         dex                 ;decr X
F172 : 26 EF      bne  LF163          ;branch Z=0 ZIREN2
F174 : 96 15      ldaa  $15           ;load A with addr 15 (SWEEP+1)
F176 : 9B 16      adda  $16           ;add A with addr 16 (SLOPE)
F178 : 97 15      staa  $15           ;store A with addr 15 (SWEEP+1)
F17A : 24 03      bcc  LF17F          ;branch C=0 ZIREN5
F17C : 7C 00 14   inc  $0014          ;incr addr 0014 (SWEEP)
;ZIREN5
F17F : DE 14      ldx  $14            ;load X with addr 14 (SWEEP)
F181 : 9C 17      cpx  $17            ;compare X with addr 17 (END2)
F183 : 26 DB      bne  LF160          ;branch Z=0 ZIREN1
F185 : 39         rts                 ;return subroutine
;*FLAT TRIANGLE LOOP
;ZIRLOP
F186 : 4F         clra                ;clear A
;ZIRLP1
F187 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F18A : 8B 20      adda  #$20          ;add A with 20h
F18C : 24 F9      bcc  LF187          ;branch C=0 ZIRLP1
F18E : 8D 09      bsr  LF199          ;branch sub ZIRT
F190 : 86 E0      ldaa  #$E0          ;load A with EOh
;ZIRLP4
F192 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F195 : 80 20      suba  #$20          ;sub A with 20h
F197 : 24 F9      bcc  LF192          ;branch C=0 ZIRLP4
;ZIRT
F199 : D6 12      ldab  $12           ;load B with addr 12 (TOP)
;ZIRLP2
F19B : 86 02      ldaa  #$02          ;load A with 02h
;ZIRLP3
F19D : 4A         deca                ;decr A
F19E : 26 FD      bne  LF19D          ;branch Z=0 ZIRLP3
F1A0 : 5A         decb                ;decr B
F1A1 : 26 F8      bne  LF19B          ;branch Z=0 ZIRLP2
F1A3 : 39         rts                 ;return subroutine
;*************************************;
;* THE BOMB OOOOOH NOOOOO!
;*************************************;
;WHIST
F1A4 : 86 80      ldaa  #$80          ;load A with 80h
F1A6 : 97 1C      staa  $1C           ;store A in addr 1C (FREQZ)
F1A8 : 86 F1      ldaa  #$F1          ;load A with F1h (#SINTBL/$100)
F1AA : 97 1A      staa  $1A           ;store A in addr 1A (TABLE)
;WHIST0
F1AC : 86 80      ldaa  #$80          ;load A with 80h
F1AE : 97 10      staa  $10           ;store A in addr 10 (TEMPA)
;WHIST1
F1B0 : 86 12      ldaa  #$12          ;load A with 12h
;WHIST2
F1B2 : 4A         deca                ;decr A
F1B3 : 26 FD      bne  LF1B2          ;branch Z=0 WHIST2
F1B5 : 96 19      ldaa  $19           ;load A with addr 19 (TIME)
F1B7 : 9B 1C      adda  $1C           ;add A with 1C (FREQZ)
F1B9 : 97 19      staa  $19           ;store A in addr 19 (TIME)
F1BB : 44         lsra                ;logic shift right A
F1BC : 44         lsra                ;logic shift right A
F1BD : 44         lsra                ;logic shift right A
F1BE : 8B D8      adda  #$D8          ;add A with D8h (#SINTBL!.$FF)
F1C0 : 97 1B      staa  $1B           ;store A in addr 1B (TABLE+1)
F1C2 : DE 1A      ldx  $1A            ;load X with addr 1A (TABLE)
F1C4 : A6 00      ldaa  $00,x         ;load A with addr X+00h
F1C6 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F1C9 : 7A 00 10   dec  $0010          ;decr addr 0010 (TEMPA)
F1CC : 26 E2      bne  LF1B0          ;branch Z=0 WHIST1
F1CE : 7A 00 1C   dec  $001C          ;decr addr 001C (FREQZ)
F1D1 : 96 1C      ldaa  $1C           ;load A with addr 1C (FREQZ)
F1D3 : 81 20      cmpa  #$20          ;compare A with 20h
F1D5 : 26 D5      bne  LF1AC          ;branch Z=0 WHIST0
F1D7 : 39         rts                 ;return subroutine
;*************************************;
;*     SINE TABLE - FCB
;*************************************;
;SINTBL
F1D8 : 80 8C 98 A5 B0 BC C6 D0        ;
F1E0 : DA E2 EA F0 F5 FA FD FE        ;
F1E8 : FF FE FD FA F5 F0 EA E2        ;
F1F0 : DA D0 C6 BC B0 A5 98 8C        ;
F1F8 : 80 73 67 5A 4F 43 39 2F        ;
F200 : 25 1D 15 0F 0A 05 02 01        ;
F208 : 00 01 02 05 0A 0F 15 1D        ;
F210 : 25 2F 39 43 4F 5A 67 73        ;
;*************************************;
;* KNOCKER ROUTINE
;*************************************;
;KNOCK
F218 : 7F 04 02   clr  $0402          ;clear addr PIA (SOUND+2) FULL BLAST
F21B : CE F2 5F   ldx  #$F25F         ;load X with F25Fh (#KNKTAB)
F21E : DF 14      stx  $14            ;store X in addr 14 (SNDTMP)
;SQLP
F220 : DE 14      ldx  $14            ;load x with addr 14 (SNDTMP) RESTORE X REG
F222 : A6 00      ldaa  $00,x         ;load A with X+00h (GET PERIOD)
F224 : 27 33      beq  LF259          ;branch Z=1 END (END ON ZERO)
F226 : E6 01      ldab  $01,x         ;load B with X+01h (GET AMP)
F228 : C4 F0      andb  #$F0          ;and B with F0h 
F22A : D7 13      stab  $13           ;store B in addr 13 (AMP)
F22C : E6 01      ldab  $01,x         ;load B with X+01h
F22E : 08         inx                 ;incr X
F22F : 08         inx                 ;incr X
F230 : DF 14      stx  $14            ;store X in addr 14 (SNDTMP) SAVE X
F232 : 97 12      staa  $12           ;store A in addr 12 (PERIOD)
F234 : C4 0F      andb  #$0F          ;and B with 0Fh
;LP0
F236 : 96 13      ldaa  $13           ;load A with addr 13 (AMP)
F238 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F23B : 96 12      ldaa  $12           ;load A with addr 12 (PERIOD)
;LP1
F23D : CE 00 05   ldx  #$0005         ;load X with 0005h (#5) DELAY
;LP11
F240 : 09         dex                 ;decr X
F241 : 26 FD      bne  LF240          ;branch Z=0 LP11
F243 : 4A         deca                ;decr A
F244 : 26 F7      bne  LF23D          ;branch Z=0 LP1
F246 : 7F 04 00   clr  $0400          ;clear DAC output SOUND
F249 : 96 12      ldaa  $12           ;load A with addr 12 (PERIOD)
;LP2
F24B : CE 00 05   ldx  #$0005         ;load X with 0005h (#5) DELAY
;LP22
F24E : 09         dex                 ;decr X
F24F : 26 FD      bne  LF24E          ;branch Z=0 LP22
F251 : 4A         deca                ;decr A
F252 : 26 F7      bne  LF24B          ;branch Z=0 LP2
F254 : 5A         decb                ;decr B
F255 : 26 DF      bne  LF236          ;branch Z=0 LP0
F257 : 20 C7      bra  LF220          ;branch always SQLP
;END
F259 : 86 80      ldaa  #$80          ;load A with 80h (OVERRIDE OFF)
F25B : B7 04 02   staa  $0402         ;store A in PIA (SOUND+2)
F25E : 39         rts                 ;return subroutine
;*************************************;
;* KNOCKER PATTERN - FDB
;*************************************;
;KNKTAB
F25F : 01FC 02FC 03F8 04F8            ;
F267 : 06F8 08F4 0CF4 10F4            ;
F26F : 20F2 40F1 60F1 80F1            ;
F277 : A0F1 C0F1 0000                 ;
;*************************************;
;* FUNNY "ELECTRIC SOUND"
;*************************************;
;* SUPPOSED TO GENERATE A PHASED OUTPUT AT
;* A CHANGING FREQUENCY.  IT DOESN'T, AND
;* I'M NOT SURE EXACTLY WHAT IT DOES DO.
;* BEST LEAVE THIS ALONE.
;*
;BONUS
F27D : 7A 00 2E   dec  $002E          ;decr addr 002E (SNDX1)
F280 : 20 04      bra  LF286          ;branch always SND1$
;SND1
F282 : C6 A0      ldab  #$A0          ;load B with A0h
F284 : D7 2E      stab  $2E           ;store B in addr 2E (SNDX1)
;SND1$
F286 : 86 04      ldaa  #$04          ;load A with 04h
F288 : 97 13      staa  $13           ;store A in addr 13 (FREQ2)
;SND1$$
F28A : 86 9F      ldaa  #$9F          ;load A with 9Fh
F28C : D6 2E      ldab  $2E           ;load B with addr 2E (SNDX1)
;SND1A
F28E : CE 01 C0   ldx  #$01C0         ;load X with 01C0h
;SND1B
F291 : 09         dex                 ;decr X
F292 : 27 20      beq  LF2B4          ;branch Z=1 SND1E
F294 : F7 00 12   stab  $0012         ;store B in addr 0012 (FREQ1)
F297 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
;SND1C
F29A : 09         dex                 ;decr X
F29B : 27 17      beq  LF2B4          ;branch Z=1 SND1E
F29D : 7A 00 12   dec  $0012          ;decr addr 0012 (FREQ1)
F2A0 : 26 F8      bne  LF29A          ;branch Z=0 SND1C
F2A2 : 09         dex                 ;decr X
F2A3 : 27 0F      beq  LF2B4          ;branch Z=1 SND1E
F2A5 : D7 12      stab  $12           ;store B in addr 12 (FREQ1)
F2A7 : 73 04 00   com  $0400          ;complement 1s in DAC output SOUND
;SND1D
F2AA : 09         dex                 ;decr X
F2AB : 27 07      beq  LF2B4          ;branch Z=1 SND1E
F2AD : 7A 00 12   dec  $0012          ;decr addr 0012 (FREQ1)
F2B0 : 26 F8      bne  LF2AA          ;branch Z=0 SND1D
F2B2 : 20 DD      bra  LF291          ;branch always SND1B
;SND1E
F2B4 : D0 13      subb  $13           ;sub B with addr 13 (FREQ2)
F2B6 : C1 10      cmpb  #$10          ;compare B with 10h
F2B8 : 22 D4      bhi  LF28E          ;branch C+Z=0 SND1A
F2BA : 39         rts                 ;return subroutine
;START
F2BB : C6 11      ldab  #$11          ;load B with 11h
F2BD : D7 2E      stab  $2E           ;store B in addr 2E (SNDX1)
F2BF : 86 FE      ldaa  #$FE          ;load A with FEh
F2C1 : 97 13      staa  $13           ;store A in addr 13 (FREQ2)
F2C3 : 20 C5      bra  LF28A          ;branch always SND1$$
;*************************************;
;* SINGLE OSCILLATOR SOUND CALLS
;*************************************;
;PERK
F2C5 : CE F4 B2   ldx  #$F4B2         ;load X with F4B2h (#VEC01X)
F2C8 : 20 26      bra  LF2F0          ;branch always PERK$1
;PERK1
F2CA : BD F3 30   jsr  LF330          ;jump sub MOVE
F2CD : BD F3 49   jsr  LF349          ;jump sub SING
F2D0 : 39         rts                 ;return subroutine
;ATARI
F2D1 : CE F4 B8   ldx  #$F4B8         ;load X with F4B8h (#VEC02X)
F2D4 : 20 F4      bra  LF2CA          ;branch always PERK1
;SIREN
F2D6 : C6 FF      ldab  #$FF          ;load B with FFh
F2D8 : D7 09      stab  $09           ;store B in addr 09 (AMP0)
;SIREN1
F2DA : CE F4 BE   ldx  #$F4BE         ;load X with F4BEh (#VEC03X)
F2DD : 8D EB      bsr  LF2CA          ;branch sub PERK1
F2DF : CE F4 C4   ldx  #$F4C4         ;load X with F4C4h (#VEC04X)
F2E2 : 8D E6      bsr  LF2CA          ;branch sub PERK1
F2E4 : 5A         decb                ;decr B 
F2E5 : 26 F3      bne  LF2DA          ;branch Z=0 SIREN1
F2E7 : 39         rts                 ;return subroutine
;ORRRR
F2E8 : CE F4 CA   ldx  #$F4CA         ;load X with F4CAh (#VEC05X)
F2EB : 20 DD      bra  LF2CA          ;branch always PERK1
;PERK$
F2ED : CE F4 D6   ldx  #$F4D6         ;load X with F4D6h (#VEC07X)
;PERK$1
F2F0 : 8D D8      bsr  LF2CA          ;branch sub PERK1
F2F2 : 8D 30      bsr  LF324          ;branch sub ECHO
F2F4 : 20 FA      bra  LF2F0          ;branch always PERK$1
;HSTD
F2F6 : 86 FF      ldaa  #$FF          ;load A with FFh
F2F8 : 97 09      staa  $09           ;store A in addr 09 (AMP0)
F2FA : CE F4 DC   ldx  #$F4DC         ;load X with F4DCh (#VEC08X)
F2FD : 20 F1      bra  LF2F0          ;branch always PERK$1
;PERK$$
F2FF : 86 FF      ldaa  #$FF          ;load A with FFh
F301 : 97 09      staa  $09           ;store A in addr 09 (AMP0)
F303 : CE F4 D0   ldx  #$F4D0         ;load X with F4D0h (#VEC06X)
F306 : 20 E8      bra  LF2F0          ;branch always PERK$1
;*************************************;
;*  RANDOM SQUIRTS
;*************************************;
;SQRT
F308 : C6 30      ldab  #$30          ;load B with 30h
;SQRT1
F30A : CE F4 E2   ldx  #$F4E2         ;load X with F4E2h (#VEC09X)
F30D : 8D 21      bsr  LF330          ;branch sub MOVE
;SQRT2
F30F : 96 06      ldaa  $06           ;load A with addr 06 (RANDOM)
F311 : 48         asla                ;arith shift left A
F312 : 9B 06      adda  $06           ;add A with addr 06 (RANDOM)
F314 : 8B 0B      adda  #$0B          ;add A with 0Bh
F316 : 97 06      staa  $06           ;store A in addr 06 (RANDOM)
F318 : 44         lsra                ;logic shift right A
F319 : 44         lsra                ;logic shift right A
F31A : 8B 0C      adda  #$0C          ;add A with 0Ch
F31C : 97 13      staa  $13           ;store A in addr 13 (FREQ$)
F31E : 8D 29      bsr  LF349          ;branch sub SING
F320 : 5A         decb                ;decr B
F321 : 26 EC      bne  LF30F          ;branch Z=0 SQRT2
F323 : 39         rts                 ;return subroutine
;*************************************;
;*  ECHO FUNCTION
;*************************************;
;ECHO
F324 : 96 09      ldaa  $09           ;load A with addr 09 (AMP0)
F326 : 80 08      suba  #$08          ;sub A with 08h
F328 : 2A 03      bpl  LF32D          ;branch N=0 ECHO1
F32A : 97 09      staa  $09           ;store A in addr 09 (AMP0)
F32C : 39         rts                 ;return subroutine
;ECHO1
F32D : 32         pula                ;SP+1 pull stack into A
F32E : 32         pula                ;SP+1 pull stack into A
F32F : 39         rts                 ;return subroutine
;*************************************;
;*  MOVE PARAMETERS
;*************************************;
;MOVE
F330 : A6 00      ldaa  $00,x         ;load A with X+00h 
F332 : 97 13      staa  $13           ;store A in addr 13 (FREQ$)
F334 : A6 01      ldaa  $01,x         ;load A with X+01h
F336 : 97 14      staa  $14           ;store A in addr 14 (C$FRQ)
F338 : A6 02      ldaa  $02,x         ;load A with X+02h
F33A : 97 15      staa  $15           ;store A in addr 15 (D$FRQ)
F33C : A6 03      ldaa  $03,x         ;load A with X+03h
F33E : 97 16      staa  $16           ;store A in addr 16 (E$FRQ)
F340 : A6 04      ldaa  $04,x         ;load A with X+04h
F342 : 97 17      staa  $17           ;store A in addr 17 (C$AMP)
F344 : A6 05      ldaa  $05,x         ;load A with X+05h
F346 : 97 18      staa  $18           ;store A in addr 18 (D$AMP)
F348 : 39         rts                 ;return subroutine
;*************************************;
;*  DELTA F, DELTA A ROUTINE
;*************************************;
;SING
F349 : 96 09      ldaa  $09           ;load A with addr 09 (AMP0) GET STARTING AMPLITUDE
;SING$
F34B : 37         pshb                ;push B into stack then SP-1 (SAVE B)
F34C : D6 17      ldab  $17           ;load B with addr 17 (C$AMP) GET CYCLES AT AMPLITUDE
F34E : D7 19      stab  $19           ;store B in addr 19 (C$AMP$) SAVE AS COUNTER
F350 : D6 14      ldab  $14           ;load B with addr 14 (C$FRQ) GET CYCLES AT FREQUENCY
F352 : D7 1A      stab  $1A           ;store B in addr 1A (C$FRQ$) SAVE AS COUNTER
;SING1
F354 : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F355 : D6 13      ldab  $13           ;load B with addr 13 (FREQ$) GET FREQUENCY COUNTER
F357 : B7 04 00   staa  $0400         ;store A in DAC output SOUND (OUTPUT TO D/A)
;SING2
F35A : 5A         decb                ;decr B 
F35B : 26 FD      bne  LF35A          ;branch Z=0 SING2
F35D : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F35E : D6 13      ldab  $13           ;load B with addr 13 (FREQ$) GET FREQUENCY COUNTER
F360 : 20 00      bra  LF362          ;branch always (*+2) -I
F362 : 08         inx                 ;incr X (-I)
F363 : 09         dex                 ;decr X (-I---) SYNC, 20 CYCLES
F364 : 08         inx                 ;incr X (-I)
F365 : 09         dex                 ;decr X (-I)
F366 : B7 04 00   staa  $0400         ;store A in DAC output SOUND (OUTPUT TO D/A)
;SING3
F369 : 5A         decb                ;decr B
F36A : 26 FD      bne  LF369          ;branch Z=0 SING3
F36C : 7A 00 1A   dec  $001A          ;decr addr 001A (C$FRQ$) CHECK CYCLES AT FREQUENCY
F36F : 27 16      beq  LF387          ;branch Z=1 SING4 (GO CHANGE FREQUENCY)
F371 : 7A 00 19   dec  $0019          ;decr addr 0019 (C$AMP$) CHECK CYCLES AT AMPLITUDE
F374 : 26 DE      bne  LF354          ;branch Z=0 SING1 (ALL OK, GO OUTPUT)
F376 : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F377 : D6 17      ldab  $17           ;load B with addr 17 (C$AMP) GET CYCLES AT AMPLITUDE
F379 : B7 04 00   staa  $0400         ;store A in DAC output SOUND (OUTPUT TO D/A)
F37C : D7 19      stab  $19           ;store B in addr 19 (C$AMP$) SAVE AS COUNTER
F37E : D6 13      ldab  $13           ;load B with addr 13 (FREQ$)GET FREQUENCY COUNT
F380 : 9B 18      adda  $18           ;add A with addr 18 (D$AMP) ADD AMPLITUDE DELTA
F382 : 2B 1E      bmi  LF3A2          ;branch N=1 SING6 (RETURN FROM SUBROUTINE)
F384 : 01         nop                 ;(SYNC, 2 CYCLES)
F385 : 20 15      bra  LF39C          ;branch always SING5 
;SING4
F387 : 08         inx                 ;incr X (-I)
F388 : 09         dex                 ;decr X (-I---) SYNC, 10 CYCLES
F389 : 01         nop                 ;(-I)
F38A : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F38B : D6 14      ldab  $14           ;load B with addr 14 (C$FRQ) GET CYCLES AT FREQUENCY
F38D : B7 04 00   staa  $0400         ;store A in DAC output SOUND (OUTPUT TO D/A)
F390 : D7 1A      stab  $1A           ;store B in addr 1A (C$FRQ$) SAVE AS COUNTER
F392 : D6 13      ldab  $13           ;load B with addr 13 (FREQ$) GET FREQUENCY COUNT
F394 : D0 15      subb  $15           ;sub B with addr 15 (D$FRQ) SUBTRACT FREQUENCY DELTA
F396 : D1 16      cmpb  $16           ;compare B with addr 16 (E$FRQ) COMPARE TO END FREQUENCY
F398 : D1 16      cmpb  $16           ;compare B with addr 16 (E$FRQ) SYNC, 3 CYCLES
F39A : 27 06      beq  LF3A2          ;branch Z=1 SING6 (RETURN FROM SUBROUTINE)
;SING5
F39C : D7 13      stab  $13           ;store B in addr 13 (FREQ$) SAVE FREQUENCY COUNT
F39E : C0 05      subb  #$05          ;sub B with 05h (SYNC TO FREQUENCY COUNTDOWN)
F3A0 : 20 B8      bra  LF35A          ;branch always SING2 (JUMP INTO COUNTDOWN LOOP)
;SING6
F3A2 : 33         pulb                ;SP+1 pull stack into B (RESTORE B)
F3A3 : 39         rts                 ;return subroutine
;*************************************;
;* tables for PULSE - not included in ROM?
;*************************************;
;SNDTBL - FCB 
F3A4 : DA FF DA 80 26 01 26 80        ;
F3AC : 07 0A 07 00 F9 F6 F9 00        ;
;NOTTBL - FCB
F3B4 : 3A 3E 50 46 33 2C 27 20        ;
F3BC : 25 1C 1A 17 14 11 10 33        ;
;WAVFRM - FCB
F3C4 : 08 03 02 01 02 03 04 05        ;
F3CC : 06 0A 1E 32 70 00              ;
;*************************************;
;* tables for PLAY
;*************************************;
;VEC01 - FDB
F3D1 : FFFF FF90 FFFF FFFF            ;
F3DA : FFFF FF90 FFFF FFFF            ;
F3E2 : FFFF FFFF 0000 0000            ;
F3EA : 0000 0000                      ;
;VEC02 - FDB
F3EE : 4801 0000 3F3F 0000            ;
F3F6 : 4801 0000 0108 0000            ;
F3FE : 8101 0000 01FF 0000            ;
F406 : 0108 0000                      ;
;VEC03 - FDB
F40A : 0110 0000 3F3F 0000            ;
F412 : 0110 0000 0505 0000            ;
F41A : 0101 0000 31FF 0000            ;
F422 : 0505 0000                      ;
;VEC04 - FDB
F426 : 3000 0000 7F00 0000            ;
F42E : 3000 0000 0100 0000            ;
F436 : 7F00 0000 0200 0000            ;
F43E : 0100 0000                      ;
;VEC05 - FDB
F442 : 0400 0004 7F00 007F            ;
F44A : 0400 0004 FF00 00A0            ;
F452 : 0000 0000 0000 0000            ;
F45A : FF00 00A0                      ;
;VEC06 - FDB
F45E : 0C68 6800 071F 0F00            ;
F466 : 0C80 8000 FFFF FF00            ;
F46E : 0000 0000 0000 0000            ;
F476 : FFFF FF00                      ;
;VEC016 - FDB
F47A : 0104 0000 3F7F 0000            ;
F482 : 0104 0000 05FF 0000            ;
F48A : 0100 0000 4800 0000            ;
F492 : 05FF 0000                      ;
;VEC017 - FDB
F496 : 0280 0030 0A7F 007F            ;
F49E : 0280 0030 C080 0020            ;
F4A6 : 0110 0015 C010 0000            ;
F4AE : C080 0000                      ;
;*************************************;
;* tables for SING
;*************************************;
;VEC01X - FDB
F4B2 : FF01 02C3 FF00                 ;
;VEC02X - FDB
F4B8 : 0103 FF80 FF00                 ;
;VEC03X - FDB
F4BE : 2003 FF50 FF00                 ;
;VEC04X - FDB
F4C4 : 5003 0120 FF00                 ;
;VEC05X - FDB
F4CA : FE04 0204 FF00                 ;
;VEC06X - FDB
F4D0 : 4803 010C FF00                 ;
;VEC07X - FDB
F4D6 : 4802 010C FF00                 ;
;VEC08X - FDB
F4DC : E001 0210 FF00                 ;
;VEC09X - FDB
F4E2 : 50FF 0000 6080                 ;
;VEC10X - FDB
F4E8 : FF02 0106 FF00                 ;
;*************************************;
;*VARI LOADER
;*************************************;
;VARILD
F4EE : 16         tab                 ;transfer A to B
F4EF : 48         asla                ;arith shift left A (X2)
F4F0 : 48         asla                ;arith shift left A (X4)
F4F1 : 48         asla                ;arith shift left A (X8)
F4F2 : 1B         aba                 ;add B to A (X9)
F4F3 : CE 00 12   ldx  #$0012         ;load X with 0012h (#LOCRAM)
F4F6 : DF 0E      stx  $0E            ;store X in addr 0E (XPTR) SET XSFER
F4F8 : CE FC 08   ldx  #$FC08         ;load X with FC08h (#VVECT)
F4FB : BD FB 92   jsr  LFB92          ;jump sub ADDX 
F4FE : C6 09      ldab  #$09          ;load B with 09h (#9) GET COUNT
;VTRAN
F500 : 7E F9 65   jmp  LF965          ;jump TRANS
;*************************************;
;*VARIABLE DUTY CYCLE SQUARE WAVE ROUTINE
;*************************************;
;VARI
F503 : 96 1A      ldaa  $1A           ;load A with addr 1A (VAMP)
F505 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
;VAR0
F508 : 96 12      ldaa  $12           ;load A with addr 12 (LOPER)
F50A : 97 1B      staa  $1B           ;store A in addr 1B (LOCNT)
F50C : 96 13      ldaa  $13           ;load A with addr 13 (HIPER)
F50E : 97 1C      staa  $1C           ;store A with addr 1C (HICNT)
;V0
F510 : DE 17      ldx  $17            ;load X with addr 17 (SWPDT)
;V0LP
F512 : 96 1B      ldaa  $1B           ;load A with addr 1B (LOCNT) LO CYCLE
F514 : 73 04 00   com  $0400          ;complement 1s DAC output SOUND
;V1
F517 : 09         dex                 ;decr X
F518 : 27 10      beq  LF52A          ;branch Z=1 VSWEEP
F51A : 4A         deca                ;decr A
F51B : 26 FA      bne  LF517          ;branch Z=0 V1
F51D : 73 04 00   com  $0400          ;complement 1s in DAC output SOUND
F520 : 96 1C      ldaa  $1C           ;load A with addr 1C (HICNT) HI CYCLE
;V2
F522 : 09         dex                 ;decr X
F523 : 27 05      beq  LF52A          ;branch Z=1 VSWEEP
F525 : 4A         deca                ;decr A
F526 : 26 FA      bne  LF522          ;branch Z=0 V2
F528 : 20 E8      bra  LF512          ;branch always V0LP (LOOP BACK)
;VSWEEP
F52A : B6 04 00   ldaa  $0400         ;load A with addr DAC 
F52D : 2B 01      bmi  LF530          ;branch N=1 VS1
F52F : 43         coma                ;compement 1s A
;VS1
F530 : 8B 00      adda  #$00          ;add A with 00h
F532 : B7 04 00   staa  $0400         ;store A in DAC output SOUND (OUTPUT)
F535 : 96 1B      ldaa  $1B           ;load A with addr 1B (LOCNT)
F537 : 9B 14      adda  $14           ;add A with addr 14 (LODT)
F539 : 97 1B      staa  $1B           ;store A in addr 1B (LOCNT)
F53B : 96 1C      ldaa  $1C           ;load A with addr 1C (HICNT)
F53D : 9B 15      adda  $15           ;add A with addr 15 (HIDT)
F53F : 97 1C      staa  $1C           ;store A in addr 1C (HICNT)
F541 : 91 16      cmpa  $16           ;compare A with addr 16 (HIEN)
F543 : 26 CB      bne  LF510          ;branch Z=0 V0
F545 : 96 19      ldaa  $19           ;load A with addr 19 (LOMOD)
F547 : 27 06      beq  LF54F          ;branch Z=1 VARX
F549 : 9B 12      adda  $12           ;add A with addr 12 (LOPER)
F54B : 97 12      staa  $12           ;store A in addr 12 (LOPER)
F54D : 26 B9      bne  LF508          ;branch Z=0 VAR0
;VARX
F54F : 39         rts                 ;return subroutine
;*************************************;
;*LAUNCH
;*************************************;
;LAUNCH
F550 : 86 FF      ldaa  #$FF          ;load A with FFh
F552 : 97 19      staa  $19           ;store A in addr 19 (DFREQ)
F554 : 86 60      ldaa  #$60          ;load A with 60h
F556 : C6 FF      ldab  #$FF          ;load B with FFh
F558 : 20 12      bra  LF56C          ;branch always LITEN
;*************************************;
;*LIGHTNING
;*************************************;
;LITE
F55A : 86 01      ldaa  #$01          ;load A with 01h
F55C : 97 19      staa  $19           ;store A in addr 19 (DFREQ)
F55E : C6 03      ldab  #$03          ;load B with 03h
F560 : 20 0A      bra  LF56C          ;branch always LITEN
;*************************************;
;*APPEAR
;*************************************;
;APPEAR
F562 : 86 FE      ldaa  #$FE          ;load A with FEh
F564 : 97 19      staa  $19           ;store A in addr 19 (DFREQ)
F566 : 86 C0      ldaa  #$C0          ;load A with C0h
F568 : C6 10      ldab  #$10          ;load B with 10h
F56A : 20 00      bra  LF56C          ;branch always LITEN
;*************************************;
;*LIGHTNING+APPEAR NOISE ROUTINE
;*************************************;
;LITEN
F56C : 97 18      staa  $18           ;store A in addr 18 (LFREQ)
F56E : 86 FF      ldaa  #$FF          ;load A with FFh (HIGHEST AMP)
F570 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F573 : D7 14      stab  $14           ;store B in addr 14 (CYCNT)
;LITE0
F575 : D6 14      ldab  $14           ;load B with addr 14 (CYCNT)
;LITE1
F577 : 96 06      ldaa  $06           ;load A with addr 06 (LO) GET RANDOM
F579 : 44         lsra                ;logic shift right A
F57A : 44         lsra                ;logic shift right A
F57B : 44         lsra                ;logic shift right A
F57C : 98 06      eora  $06           ;exclusive or A with addr 06 (LO)
F57E : 44         lsra                ;logic shift right A
F57F : 76 00 05   ror  $0005          ;rotate right addr 0005 (HI)
F582 : 76 00 06   ror  $0006          ;rotate right addr 0006 (LO)
F585 : 24 03      bcc  LF58A          ;branch C=0 LITE2
F587 : 73 04 00   com  $0400          ;complement 1s in DAC output SOUND
;LITE2
F58A : 96 18      ldaa  $18           ;load A with addr 18 (LFREQ) COUNT FREQ
;LITE3
F58C : 4A         deca                ;decr A
F58D : 26 FD      bne  LF58C          ;branch Z=0 LITE3
F58F : 5A         decb                ;decr B (COUNT CYCLES)
F590 : 26 E5      bne  LF577          ;branch Z=0 LITE1
F592 : 96 18      ldaa  $18           ;load A with addr 18 (LFREQ)
F594 : 9B 19      adda  $19           ;add A with addr 19 (DFREQ)
F596 : 97 18      staa  $18           ;store A in addr 18 (LFREQ)
F598 : 26 DB      bne  LF575          ;branch Z=0 LITE0
F59A : 39         rts                 ;return subroutine
;*************************************;
;*TURBO
;*************************************;
;TURBO
F59B : 86 20      ldaa  #$20          ;load A with 20h
F59D : 97 14      staa  $14           ;store A in addr 14 (CYCNT)
F59F : 97 17      staa  $17           ;store A in addr 17 (NFFLG)
F5A1 : 86 01      ldaa  #$01          ;load A with 01h
F5A3 : CE 00 01   ldx  #$0001         ;load X with 0001h
F5A6 : C6 FF      ldab  #$FF          ;load B with FFh
F5A8 : 20 00      bra  LF5AA          ;branch always MOISE
;*************************************;
;*WHITE NOISE ROUTINE
;*************************************;
;*X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*
; (label MOISE instead of NOISE - white noise routine)
;MOISE
F5AA : 97 12      staa  $12           ;store A in addr 12 (DECAY)
;MOISE0
F5AC : DF 15      stx  $15            ;store X in addr 15 (NFRQ1)
;MOIS00
F5AE : D7 13      stab  $13           ;store B in addr 13 (NAMP)
F5B0 : D6 14      ldab  $14           ;load B with addr 14 (CYCNT)
;MOISE1
F5B2 : 96 06      ldaa  $06           ;load A with addr 06 (LO) GET RANDOM BIT
F5B4 : 44         lsra                ;logic shift right A
F5B5 : 44         lsra                ;logic shift right A
F5B6 : 44         lsra                ;logic shift right A
F5B7 : 98 06      eora  $06           ;exclusive or A with addr 06 (LO)
F5B9 : 44         lsra                ;logic shift right A
F5BA : 76 00 05   ror  $0005          ;rotate right addr 0005 (HI)
F5BD : 76 00 06   ror  $0006          ;rotate right addr 0006 (LO)
F5C0 : 86 00      ldaa  #$00          ;load A with 00h
F5C2 : 24 02      bcc  LF5C6          ;branch C=0 MOISE2
F5C4 : 96 13      ldaa  $13           ;load A with addr 13 (NAMP)
;MOISE2
F5C6 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F5C9 : DE 15      ldx  $15            ;load X with addr 15 (NFRQ1) INCREASING DELAY
;MOISE3
F5CB : 09         dex                 ;decr X
F5CC : 26 FD      bne  LF5CB          ;branch Z=0 MOISE3
F5CE : 5A         decb                ;decr B (FINISH CYCLE COUNT?)
F5CF : 26 E1      bne  LF5B2          ;branch Z=0 MOISE1 (NO)
F5D1 : D6 13      ldab  $13           ;load B with addr 13 (NAMP) DECAY AMP
F5D3 : D0 12      subb  $12           ;sub B with addr 12 (DECAY)
F5D5 : 27 09      beq  LF5E0          ;branch Z=1 MSEND
F5D7 : DE 15      ldx  $15            ;load X with addr 15 (NFRQ1) INC FREQ
F5D9 : 08         inx                 ;incr X
F5DA : 96 17      ldaa  $17           ;load A with addr 17 (NFFLG) DECAY FREQ?
F5DC : 27 D0      beq  LF5AE          ;branch Z=1 MOIS00 (NO)
F5DE : 20 CC      bra  LF5AC          ;branch always MOISE0
;MSEND 
F5E0 : 39         rts                 ;return subroutine
;*************************************;
;*CROWD ROAR
;*************************************;
;CDR
F5E1 : CE F6 00   ldx  #$F600         ;load X with F600h (#WS1) 1ST WHISTLE PARAMS
F5E4 : DF 23      stx  $23            ;store X in addr 23 (PTRHI)
F5E6 : BD F7 2A   jsr  LF72A          ;jump sub WISLD
F5E9 : CE A5 00   ldx  #$A500         ;load X with A500h (SEED)
F5EC : DF 05      stx  $05            ;store X in addr 05 (HI)
F5EE : CE F6 29   ldx  #$F629         ;load X with F629h (#CR1) 1ST CROWD ROAR NOISE PARAMS
F5F1 : BD F6 33   jsr  LF633          ;jump sub NOISLD
F5F4 : BD F6 CE   jsr  LF6CE          ;jump sub NINIT
F5F7 : CE F6 2E   ldx  #$F62E         ;load X with F62Eh (#CR2)
F5FA : BD F6 33   jsr  LF633          ;jump sub NOISLD
F5FD : 7E F6 DB   jmp  LF6DB          ;jump NINIT2
;*************************************;
;*WHISTLE PARAMS - FCB
;*************************************;
;WS1
F600 : 90 10 02 14 40                 ;
F605 : B4 40 FF 14 30                 ;
F60A : D0 32 02 10 60                 ;
F60F : EE 20 02 08 54                 ;
F614 : E9 54 FF 20 28                 ;
F619 : C0 30 02 14 58                 ;
F61E : AC 20 02 08 58                 ;
F623 : A6 58 FF 18 22                 ;
F628 : 00                             ;
;CR1
F629 : 30 10 FC 00 01                 ;
;CR2
F62E : 30 FC 01 00 01                 ;
;*************************************;
;*WHITE NOISE ROUTINE - noise with whistle routine (full)
;*************************************;
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA
;*
;NOISLD
F633 : A6 00      ldaa  $00,x         ;load A with X+00h
F635 : 97 2A      staa  $2A           ;store A in addr 2A
F637 : A6 01      ldaa  $01,x         ;load A with X+01h
F639 : 97 13      staa  $13           ;store A in addr 13
F63B : A6 02      ldaa  $02,x         ;load A with X+02h
F63D : 97 12      staa  $12           ;store A in addr 12
F63F : A6 03      ldaa  $03,x         ;load A with X+03h
F641 : 97 17      staa  $17           ;store A in addr 17
F643 : A6 04      ldaa  $04,x         ;load A with X+04h
F645 : 97 2F      staa  $2F           ;store A in addr 2F
;NEND
F647 : 39         rts                 ;return subroutine
;*************************************;
;*LOAD NOISE AND GO
;*************************************;
;NOISLG
F648 : 8D E9      bsr  LF633          ;branch sub NOISLD
;*************************************;
;*NOISE INIT
;*************************************;
;NOIN
F64A : 8D 30      bsr  LF67C          ;branch sub NSUB (CY2&NFRQ2 TO CYCNT&NFRQ)
;*************************************;
;*NOISE LOOP
;*************************************;
;NO1
F64C : 8D 58      bsr  LF6A6
F64E : 96 2E      ldaa  X002E
F650 : 91 2F      cmpa  X002F
F652 : 26 F8      bne  LF64C
F654 : 59         rolb
F655 : F7 04 00   stab  X0400
F658 : 8D 2D      bsr  LF687
F65A : 8D 38      bsr  LF694
F65C : 8D 5C      bsr  LF6BA
F65E : 7D 00 13   tst  X0013
F661 : 27 E4      beq  LF647
F663 : 7D 00 14   tst  X0014
F666 : 26 E4      bne  LF64C
F668 : 7D 00 17   tst  X0017
F66B : 27 DF      beq  LF64C
F66D : 2B 05      bmi  LF674
F66F : 7C 00 2F   inc  X002F
F672 : 20 D8      bra  LF64C
;NO3
F674 : 7A 00 2F   dec  X002F
F677 : 7A 00 2E   dec  X002E
F67A : 20 D0      bra  LF64C
;NSUB
F67C : 7F 00 14   clr  X0014
F67F : 96 2F      ldaa  X002F
F681 : 97 2E      staa  X002E
F683 : 7F 00 2D   clr  X002D
F686 : 39         rts
;*************************************;
;* 23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD
;*************************************;
;*
;NOISE1
F687 : 96 06    "  "    ldaa  X0006
F689 : 44    "D"    lsra
F68A : 44    "D"    lsra
F68B : 44    "D"    lsra
F68C : 98 06    "  "    eora  X0006
F68E : 97 28    " ("    staa  X0028
F690 : 08    " "    inx
F691 : 84 07    "  "    anda  #$07
;*
F693 : 39    "9"    rts
;*
;NOISE2
F694 : 96 28    " ("    ldaa  X0028
F696 : 44    "D"    lsra
F697 : 76 00 05    "v  "    ror  X0005
F69A : 76 00 06    "v  "    ror  X0006
F69D : 86 00    "  "    ldaa  #$00
F69F : 24 02    "$ "    bcc  LF6A3
F6A1 : 96 13    "  "    ldaa  X0013
;NOISE3
F6A3 : 97 2D    " -"    staa  X002D
;*
F6A5 : 39    "9"    rts
;*
;RNT
F6A6 : 96 2F    " /"    ldaa  X002F
F6A8 : 7A 00 2E    "z ."    dec  X002E
F6AB : 27 04    "' "    beq  LF6B1
F6AD : 08    " "    inx
F6AE : 09    " "    dex
F6AF : 20 08    "  "    bra  LF6B9
;NW0
F6B1 : 97 2E    " ."    staa  X002E
F6B3 : D6 2D    " -"    ldab  X002D
F6B5 : 54    "T"    lsrb
F6B6 : 7C 00 14    "|  "    inc  X0014
;*
;NW1
F6B9 : 39    "9"    rts
;*
;RNA
F6BA : 96 2A    " *"    ldaa  X002A
F6BC : 91 14    "  "    cmpa  X0014
F6BE : 27 04    "' "    beq  LF6C4
F6C0 : 08    " "    inx
F6C1 : 09    " "    dex
F6C2 : 20 09    "  "    bra  LF6CD
;NW2
F6C4 : 7F 00 14    "   "    clr  X0014
F6C7 : 96 13    "  "    ldaa  X0013
F6C9 : 90 12    "  "    suba  X0012
F6CB : 97 13    "  "    staa  X0013
;*
;NW3
F6CD : 39    "9"    rts
;*
;*************************************;
;* NOISE WITH WHISTLE MAIN LOOP
;*************************************;
;NINIT
F6CE : 7F 00 21    "  !"    clr  X0021
F6D1 : 7F 00 2B    "  +"    clr  X002B
F6D4 : 86 0E    "  "    ldaa  #$0E
F6D6 : 97 22    " ""    staa  X0022
F6D8 : 7F 00 27    "  '"    clr  X0027
;NINIT2
F6DB : 8D 9F    "  "    bsr  LF67C
;WIN
F6DD : 8D A8    "  "    bsr  LF687
F6DF : BD F7 64    "  d"    jsr  LF764
F6E2 : 8D B0    "  "    bsr  LF694
F6E4 : BD F7 64    "  d"    jsr  LF764
F6E7 : 8D BD    "  "    bsr  LF6A6
F6E9 : 8D 79    " y"    bsr  LF764
F6EB : 8D CD    "  "    bsr  LF6BA
F6ED : 8D 75    " u"    bsr  LF764
F6EF : 8D 0A    "  "    bsr  LF6FB
F6F1 : 8D 71    " q"    bsr  LF764
F6F3 : 8D 1D    "  "    bsr  LF712
F6F5 : 8D 6D    " m"    bsr  LF764
F6F7 : 8D 52    " R"    bsr  LF74B
F6F9        XF6F9:
F6F9 : 20 E2    "  "    bra  LF6DD
;*
;TRICNT
F6FB : 96 26    " &"    ldaa  X0026
F6FD : 7A 00 22    "z ""    dec  X0022
F700 : 27 07    "' "    beq  LF709
F702 : B6 00 13    "   "    ldaa  X0013
F705 : 26 0A    "& "    bne  LF711
F707 : 20 68    " h"    bra  LF771
;NW4
F709 : 97 22    " ""    staa  X0022
F70B : 96 21    " !"    ldaa  X0021
F70D : 9B 2B    " +"    adda  X002B
F70F : 97 21    " !"    staa  X0021
;*
;NW5
F711 : 39    "9"    rts
;*
;TRIFRQ
F712 : 96 21    " !"    ldaa  X0021
F714 : 91 29    " )"    cmpa  X0029
F716 : 27 07    "' "    beq  LF71F
F718 : 08    " "    inx
F719 : 96 13    "  "    ldaa  X0013
F71B : 26 2A    "&*"    bne  LF747
F71D : 20 29    " )"    bra  LF748
;NW6
F71F : 7F 00 21    "  !"    clr  X0021
F722 : 7F 00 2B    "  +"    clr  X002B
F725 : 7F 00 27    "  '"    clr  X0027
F728 : DE 23    " #"    ldx  X0023
;WISLD
F72A : A6 00    "  "    ldaa  $00,x
F72C : 97 20    "  "    staa  X0020
F72E : 27 17    "' "    beq  LF747
F730 : A6 01    "  "    ldaa  $01,x
F732 : 97 25    " %"    staa  X0025
F734 : A6 02    "  "    ldaa  $02,x
F736 : 97 2C    " ,"    staa  X002C
F738 : A6 03    "  "    ldaa  $03,x
F73A : 97 26    " &"    staa  X0026
F73C : A6 04    "  "    ldaa  $04,x
F73E : 97 29    " )"    staa  X0029
F740 : 86 05    "  "    ldaa  #$05
F742 : BD FB 92    "   "    jsr  LFB92
F745 : DF 23    " #"    stx  X0023
;*
;NW7
F747 : 39    "9"    rts
;PEND
F748 : 32    "2"    pula
F749 : 32    "2"    pula
F74A : 39    "9"    rts
;*
;NNW
F74B : 96 20    "  "    ldaa  X0020
F74D : 27 06    "' "    beq  LF755
F74F : 91 13    "  "    cmpa  X0013
F751 : 26 04    "& "    bne  LF757
F753 : 20 03    "  "    bra  LF758
;NW8
F755 : 08    " "    inx
F756 : 09    " "    dex
;NW9
F757 : 39    "9"    rts
;WINIT
F758 : 7F 00 20    "   "    clr  X0020
F75B : 96 25    " %"    ldaa  X0025
F75D : 97 21    " !"    staa  X0021
F75F : 96 2C    " ,"    ldaa  X002C
F761 : 97 2B    " +"    staa  X002B
F763 : 39    "9"    rts
;******************
;TRIDR
F764 : 96 27    " '"    ldaa  X0027
F766 : 9B 21    " !"    adda  X0021
F768 : 97 27    " '"    staa  X0027
F76A : 2A 01    "* "    bpl  LF76D
F76C : 43    "C"    coma
;GO
F76D : 1B    " "    aba
F76E : B7 04 00    "   "    staa  X0400
NSEND
F771 : 39    "9"    rts
;*************************************;
;*BACKGROUND 1 ROUTINE
;*************************************;
;BG1
F772 : C6 01    "  "    ldab  #$01
F774 : D7 00    "  "    stab  X0000
F776 : CE F7 85    "   "    ldx  #$F785
F779 : 20 2A    " *"    bra  LF7A5
;*************************************;
;*THRUST
;*************************************;
;THRUST
F77B : CE F7 8B    "   "    ldx  #$F78B
F77E : 20 25    " %"    bra  LF7A5
;*************************************;
;*CANNON
;*************************************;
;CANNON
F780 : CE F7 91    "   "    ldx  #$F791
F783 : 20 20    "  "    bra  LF7A5
;*************************************;
;FNTAB  EQU  *
;*************************************;
F785 : 00 00 00    "   "    db  $00, $00, $00
        ;
F788 : 01    " "    nop
        ;
F789 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F78D : 00 03 00 00  "    "    db  $00, $03, $00, $00
        ;
F791 : 01    " "    nop
        ;
F792 : 00    " "    db  $00
        ;
F793 : 01    " "    nop
F794 : FF 03 E8    "   "    stx  X03E8
F797 : 01    " "    nop
F798 : 01    " "    nop
F799 : 01    " "    nop
F79A : 40    "@"    nega
F79B : 10    " "    sba
        ;
F79C : 00    " "    db  $00
        ;
F79D : 01    " "    nop
F79E : 80 01    "  "    suba  #$01
F7A0 : 40    "@"    nega
F7A1 : FF CE F7    "   "    stx  XCEF7
F7A4 : 97 A6    "  "    staa  X00A6
        ;
F7A6 : 00    " "    db  $00
;*************************************;
;*LOADER
;*************************************;
;FNLOAD
F7A7 : 97 19    "  "    staa  X0019
F7A9 : A6 01    "  "    ldaa  $01,x
F7AB : 97 15    "  "    staa  X0015
F7AD : A6 02    "  "    ldaa  $02,x
F7AF : E6 03    "  "    ldab  $03,x
F7B1 : EE 04    "  "    ldx  $04,x
;*************************************;
;*FILTERED NOISE ROUTINE
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;*
;FNOISE
F7B3 : 97 18    "  "    staa  X0018
F7B5 : D7 12    "  "    stab  X0012
F7B7 : DF 16    "  "    stx  X0016
F7B9 : 7F 00 14    "   "    clr  X0014
F7BC        LF7BC:
F7BC : DE 16    "  "    ldx  X0016
F7BE : B6 04 00    "   "    ldaa  X0400
F7C1        LF7C1:
F7C1 : 16    " "    tab
F7C2 : 54    "T"    lsrb
F7C3 : 54    "T"    lsrb
F7C4 : 54    "T"    lsrb
F7C5 : D8 06    "  "    eorb  X0006
F7C7 : 54    "T"    lsrb
F7C8 : 76 00 05    "v  "    ror  X0005
F7CB : 76 00 06    "v  "    ror  X0006
F7CE : D6 12    "  "    ldab  X0012
F7D0 : 7D 00 19    "}  "    tst  X0019
F7D3 : 27 04    "' "    beq  LF7D9
F7D5 : D4 05    "  "    andb  X0005
F7D7 : DB 15    "  "    addb  X0015
F7D9        LF7D9:
F7D9 : D7 13    "  "    stab  X0013
F7DB : D6 14    "  "    ldab  X0014
F7DD : 91 06    "  "    cmpa  X0006
F7DF : 22 12    "" "    bhi  LF7F3
F7E1        LF7E1:
F7E1 : 09    " "    dex
F7E2 : 27 26    "'&"    beq  LF80A
F7E4 : B7 04 00    "   "    staa  X0400
F7E7 : DB 14    "  "    addb  X0014
F7E9 : 99 13    "  "    adca  X0013
F7EB : 25 16    "% "    bcs  LF803
F7ED : 91 06    "  "    cmpa  X0006
F7EF : 23 F0    "# "    bls  LF7E1
F7F1 : 20 10    "  "    bra  LF803
        ;
F7F3        LF7F3:
F7F3        XF7F3:
F7F3 : 09    " "    dex
F7F4 : 27 14    "' "    beq  LF80A
F7F6 : B7 04 00    "   "    staa  X0400
F7F9 : D0 14    "  "    subb  X0014
F7FB : 92 13    "  "    sbca  X0013
F7FD : 25 04    "% "    bcs  LF803
F7FF : 91 06    "  "    cmpa  X0006
F801 : 22 F0    "" "    bhi  LF7F3
F803        LF803:
F803 : 96 06    "  "    ldaa  X0006
F805 : B7 04 00    "   "    staa  X0400
F808 : 20 B7    "  "    bra  LF7C1
        ;
F80A        LF80A:
F80A : D6 18    "  "    ldab  X0018
F80C : 27 B3    "' "    beq  LF7C1
F80E : 96 12    "  "    ldaa  X0012
F810 : D6 14    "  "    ldab  X0014
F812 : 44    "D"    lsra
F813 : 56    "V"    rorb
F814 : 44    "D"    lsra
F815 : 56    "V"    rorb
F816 : 44    "D"    lsra
F817 : 56    "V"    rorb
F818 : 43    "C"    coma
F819 : 50    "P"    negb
F81A : 82 FF    "  "    sbca  #$FF
F81C : DB 14    "  "    addb  X0014
F81E : 99 12    "  "    adca  X0012
F820 : D7 14    "  "    stab  X0014
F822 : 97 12    "  "    staa  X0012
F824 : 26 96    "& "    bne  LF7BC
F826 : C1 07    "  "    cmpb  #$07
F828 : 26 92    "& "    bne  LF7BC
F82A : 39    "9"    rts
;*************************************;
;*RADIO
;*************************************;
;RADIO
F82B : 86 FC    "  "    ldaa  #$FC
F82D : 97 0E    "  "    staa  X000E
F82F : CE 00 64    "  d"    ldx  #$0064
F832 : DF 0A    "  "    stx  X000A
F834        LF834:
F834 : DB 0B    "  "    addb  X000B
F836 : 96 10    "  "    ldaa  X0010
F838 : 99 0A    "  "    adca  X000A
F83A : 97 10    "  "    staa  X0010
F83C : DE 0A    "  "    ldx  X000A
F83E : 25 04    "% "    bcs  LF844
F840 : 20 00    "  "    bra  LF842
F842        LF842:
F842 : 20 03    "  "    bra  LF847
        ;
F844        LF844:
F844 : 08    " "    inx
F845 : 27 11    "' "    beq  LF858
F847        LF847:
F847 : DF 0A    "  "    stx  X000A
F849 : 84 0F    "  "    anda  #$0F
F84B : 8B 47    " G"    adda  #$47
F84D : 97 0F    "  "    staa  X000F
F84F : DE 0E    "  "    ldx  X000E
F851 : A6 00    "  "    ldaa  $00,x
F853 : B7 04 00    "   "    staa  X0400
F856 : 20 DC    "  "    bra  LF834
F858        LF858:
F858 : 39    "9"    rts
;*************************************;
;*HYPER
;*************************************;
;HYPER
F859 : 4F    "O"    clra
F85A : B7 04 00    "   "    staa  X0400
F85D : 97 10    "  "    staa  X0010
F85F        LF85F:
F85F : 4F    "O"    clra
F860        LF860:
F860 : 91 10    "  "    cmpa  X0010
F862 : 26 03    "& "    bne  LF867
F864 : 73 04 00    "s  "    com  X0400
F867        LF867:
F867 : C6 12    "  "    ldab  #$12
F869        LF869:
F869 : 5A    "Z"    decb
F86A : 26 FD    "& "    bne  LF869
F86C : 4C    "L"    inca
F86D : 2A F1    "* "    bpl  LF860
F86F : 73 04 00    "s  "    com  X0400
F872 : 7C 00 10    "|  "    inc  X0010
F875 : 2A E8    "* "    bpl  LF85F
F877 : 39    "9"    rts
;*************************************;
;*SCREAM
;*************************************;
;SCREAM
F878 : CE 00 12    "   "    ldx  #$0012
F87B        LF87B:
F87B : 6F 00    "o "    clr  $00,x
F87D : 08    " "    inx
F87E : 8C 00 1A    "   "    cpx  #$001A
F881 : 26 F8    "& "    bne  LF87B
F883 : 86 40    " @"    ldaa  #$40
F885 : 97 12    "  "    staa  X0012
F887        LF887:
F887 : CE 00 12    "   "    ldx  #$0012
F88A : 86 80    "  "    ldaa  #$80
F88C : 97 10    "  "    staa  X0010
F88E : 5F    "_"    clrb
F88F        LF88F:
F88F : A6 01    "  "    ldaa  $01,x
F891 : AB 00    "  "    adda  $00,x
F893 : A7 01    "  "    staa  $01,x
F895 : 2A 02    "* "    bpl  LF899
F897 : DB 10    "  "    addb  X0010
F899        LF899:
F899 : 74 00 10    "t  "    lsr  X0010
F89C : 08    " "    inx
F89D : 08    " "    inx
F89E : 8C 00 1A    "   "    cpx  #$001A
F8A1 : 26 EC    "& "    bne  LF88F
F8A3 : F7 04 00    "   "    stab  X0400
F8A6 : 7C 00 11    "|  "    inc  X0011
F8A9 : 26 DC    "& "    bne  LF887
F8AB : CE 00 12    "   "    ldx  #$0012
F8AE : 5F    "_"    clrb
F8AF        LF8AF:
F8AF : A6 00    "  "    ldaa  $00,x
F8B1 : 27 0B    "' "    beq  LF8BE
F8B3 : 81 37    " 7"    cmpa  #$37
F8B5 : 26 04    "& "    bne  LF8BB
F8B7 : C6 41    " A"    ldab  #$41
F8B9 : E7 02    "  "    stab  $02,x
F8BB        LF8BB:
F8BB : 6A 00    "j "    dec  $00,x
F8BD : 5C    "\"    incb
F8BE        LF8BE:
F8BE : 08    " "    inx
F8BF : 08    " "    inx
F8C0 : 8C 00 1A    "   "    cpx  #$001A
F8C3 : 26 EA    "& "    bne  LF8AF
F8C5 : 5D    "]"    tstb
F8C6 : 26 BF    "& "    bne  LF887
F8C8 : 39    "9"    rts
;*************************************;
;*ORGAN TUNE
;*************************************;
;ORGANT
F8C9 : 7A 00 04    "z  "    dec  X0004
F8CC : 39    "9"    rts
;ORGNT1
F8CD : 8D 03    "  "    bsr  LF8D2
F8CF : 7E FB 7F    "~  "    jmp  LFB7F
;ORGASM
F8D2 : 7F 00 04    "   "    clr  X0004
F8D5 : 97 10    "  "    staa  X0010
F8D7 : CE FC 57    "  W"    ldx  #$FC57
;ORGNT2
F8DA : A6 00    "  "    ldaa  $00,x
F8DC : 27 2D    "'-"    beq  LF90B
F8DE : 7A 00 10    "z  "    dec  X0010
F8E1 : 27 06    "' "    beq  LF8E9
F8E3 : 4C    "L"    inca
F8E4 : BD FB 92    "   "    jsr  LFB92
F8E7 : 20 F1    "  "    bra  LF8DA
;ORGNT3
F8E9 : 08    " "    inx
F8EA : DF 0E    "  "    stx  X000E
F8EC : BD FB 92    "   "    jsr  LFB92
F8EF : DF 0C    "  "    stx  X000C
F8F1 : DE 0E    "  "    ldx  X000E
;ORGNT4
F8F3 : A6 00    "  "    ldaa  $00,x
F8F5 : 97 14    "  "    staa  X0014
F8F7 : A6 01    "  "    ldaa  $01,x
F8F9 : EE 02    "  "    ldx  $02,x
F8FB : DF 12    "  "    stx  X0012
F8FD : 8D 0E    "  "    bsr  LF90D
F8FF : DE 0E    "  "    ldx  X000E
F901 : 08    " "    inx
F902 : 08    " "    inx
F903 : 08    " "    inx
F904 : 08    " "    inx
F905 : DF 0E    "  "    stx  X000E
F907 : 9C 0C    "  "    cpx  X000C
F909 : 26 E8    "& "    bne  LF8F3
;ORGNT5
F90B : 39    "9"    rts
;*************************************;
;*ORGAN NOTE
;*************************************;
;*4 BYTES(MODE,OSCILLATOR MASK HI+1,LO+1,NOTE#)
;ORGANN
F90C : 39    "9"    rts
;*************************************;
;*ORGAN LOADER
;*************************************;
;*OSCIL=OSCILLATOR MASK, ACCA=DELAY, DUR=DURATION
;*
;ORGANL
F90D : CE 00 15    "   "    ldx  #$0015
F910 : 80 02    "  "    suba  #$02
F912        LF912:
F912 : 23 15    "# "    bls  LF929
F914 : 81 03    "  "    cmpa  #$03
F916 : 27 09    "' "    beq  LF921
F918 : C6 01    "  "    ldab  #$01
F91A : E7 00    "  "    stab  $00,x
F91C : 08    " "    inx
F91D : 80 02    "  "    suba  #$02
F91F : 20 F1    "  "    bra  LF912
        ;
F921        LF921:
F921 : C6 91    "  "    ldab  #$91
F923 : E7 00    "  "    stab  $00,x
F925 : 6F 01    "o "    clr  $01,x
F927 : 08    " "    inx
F928 : 08    " "    inx
;LD1
F929 : C6 7E    " ~"    ldab  #$7E
F92B : E7 00    "  "    stab  $00,x
F92D : C6 F9    "  "    ldab  #$F9
F92F : E7 01    "  "    stab  $01,x
F931 : C6 37    " 7"    ldab  #$37
F933 : E7 02    "  "    stab  $02,x
;*************************************;
;*ORGAN ROUTINE
;*************************************;
;*DUR=DURATION, OSCILLATOR MASK
;*
;ORGAN
F935 : DE 12    "  "    ldx  X0012
F937 : 4F    "O"    clra
F938 : F6 00 11    "   "    ldab  X0011
F93B : 5C    "\"    incb
F93C : D7 11    "  "    stab  X0011
F93E : D4 14    "  "    andb  X0014
F940 : 54    "T"    lsrb
F941 : 89 00    "  "    adca  #$00
F943 : 54    "T"    lsrb
F944 : 89 00    "  "    adca  #$00
F946 : 54    "T"    lsrb
F947 : 89 00    "  "    adca  #$00
F949 : 54    "T"    lsrb
F94A : 89 00    "  "    adca  #$00
F94C : 54    "T"    lsrb
F94D : 89 00    "  "    adca  #$00
F94F : 54    "T"    lsrb
F950 : 89 00    "  "    adca  #$00
F952 : 54    "T"    lsrb
F953 : 89 00    "  "    adca  #$00
F955 : 1B    " "    aba
F956 : 48    "H"    asla
F957 : 48    "H"    asla
F958 : 48    "H"    asla
F959 : 48    "H"    asla
F95A : 48    "H"    asla
F95B : B7 04 00    "   "    staa  X0400
F95E : 09    " "    dex
F95F : 27 03    "' "    beq  LF964
F961 : 7E 00 15    "~  "    jmp  L0015
;ORGAN2
F964 : 39    "9"    rts
;*************************************;
;*PARAMETER TRANSFER
;*************************************;
;TRANS
F965 : 36    "6"    psha
F966        LF966:
F966 : A6 00    "  "    ldaa  $00,x
F968 : DF 0C    "  "    stx  X000C
F96A : DE 0E    "  "    ldx  X000E
F96C : A7 00    "  "    staa  $00,x
F96E : 08    " "    inx
F96F : DF 0E    "  "    stx  X000E
F971 : DE 0C    "  "    ldx  X000C
F973 : 08    " "    inx
F974 : 5A    "Z"    decb
F975 : 26 EF    "& "    bne  LF966
F977 : 32    "2"    pula
F978 : 39    "9"    rts
;*************************************;
;*BACKGROUND END ROUTINE
;*************************************;
;BGEND
F979 : 4F    "O"    clra
F97A : 97 00    "  "    staa  X0000
F97C : 97 01    "  "    staa  X0001
F97E : 39    "9"    rts
;*************************************;
;*BACKGROUND SOUND #2 INCREMENT
;*************************************;
;BG2INC
F97F : 7F 00 00    "   "    clr  X0000
F982 : 96 01    "  "    ldaa  X0001
F984 : 84 7F    "  "    anda  #$7F
F986 : 81 1D    "  "    cmpa  #$1D
F988 : 26 01    "& "    bne  LF98B
F98A : 4F    "O"    clra
F98B        LF98B:
F98B : 4C    "L"    inca
F98C : 97 01    "  "    staa  X0001
F98E : 39    "9"    rts
;*************************************;
;*BACKGROUND 2 ROUTINE
;*************************************;
;BG2
F98F : 86 0E    "  "    ldaa  #$0E
F991 : BD F9 DC    "   "    jsr  LF9DC
F994 : 96 01    "  "    ldaa  X0001
F996 : 48    "H"    asla
F997 : 48    "H"    asla
F998 : 43    "C"    coma
F999 : BD FA 94    "   "    jsr  LFA94
F99C        LF99C:
F99C : 7C 00 16    "|  "    inc  X0016
F99F : BD FA 96    "   "    jsr  LFA96
F9A2 : 20 F8    "  "    bra  LF99C
;*
;*
;*
;*************************************;
;*SPINNER #1 SOUND
;*************************************;
;SP1
F9A4 : 86 03    "  "    ldaa  #$03
F9A6 : BD F4 EE    "   "    jsr  LF4EE
F9A9 : D6 02    "  "    ldab  X0002
F9AB : C1 1F    "  "    cmpb  #$1F
F9AD : 26 01    "& "    bne  LF9B0
F9AF : 5F    "_"    clrb
F9B0        LF9B0:
F9B0 : 5C    "\"    incb
F9B1 : D7 02    "  "    stab  X0002
F9B3 : 86 20    "  "    ldaa  #$20
F9B5 : 10    " "    sba
F9B6 : 5F    "_"    clrb
F9B7        LF9B7:
F9B7 : 81 14    "  "    cmpa  #$14
F9B9 : 23 05    "# "    bls  LF9C0
F9BB : CB 0E    "  "    addb  #$0E
F9BD : 4A    "J"    deca
F9BE : 20 F7    "  "    bra  LF9B7
        ;
F9C0        LF9C0:
F9C0 : CB 05    "  "    addb  #$05
F9C2 : 4A    "J"    deca
F9C3 : 26 FB    "& "    bne  LF9C0
F9C5 : D7 12    "  "    stab  X0012
F9C7        LF9C7:
F9C7 : BD F5 03    "   "    jsr  LF503
F9CA : 20 FB    "  "    bra  LF9C7
;*************************************;
;*LASER BALL BONUS #2
;*************************************;
;BON2
F9CC : 96 03    "  "    ldaa  X0003
F9CE : 26 09    "& "    bne  LF9D9
F9D0 : 7C 00 03    "|  "    inc  X0003
F9D3 : 86 0D    "  "    ldaa  #$0D
F9D5 : 8D 05    "  "    bsr  LF9DC
F9D7 : 20 69    " i"    bra  LFA42
F9D9        LF9D9:
F9D9 : 7E FA 89    "~  "    jmp  LFA89
;*************************************;
;*GWAVE LOADER
;*************************************;
F9DC : 16    " "    tab
F9DD : 58    "X"    aslb
F9DE : 1B    " "    aba
F9DF : 1B    " "    aba
F9E0 : 1B    " "    aba
F9E1 : CE FE 45    "  E"    ldx  #$FE45
F9E4 : BD FB 92    "   "    jsr  LFB92
F9E7 : A6 00    "  "    ldaa  $00,x
F9E9 : 16    " "    tab
F9EA : 84 0F    "  "    anda  #$0F
F9EC : 97 13    "  "    staa  X0013
F9EE : 54    "T"    lsrb
F9EF : 54    "T"    lsrb
F9F0 : 54    "T"    lsrb
F9F1 : 54    "T"    lsrb
F9F2 : D7 12    "  "    stab  X0012
F9F4 : A6 01    "  "    ldaa  $01,x
F9F6 : 16    " "    tab
F9F7 : 54    "T"    lsrb
F9F8 : 54    "T"    lsrb
F9F9 : 54    "T"    lsrb
F9FA : 54    "T"    lsrb
F9FB : D7 14    "  "    stab  X0014
F9FD : 84 0F    "  "    anda  #$0F
F9FF : 97 10    "  "    staa  X0010
FA01 : DF 0A    "  "    stx  X000A
FA03 : CE FD 32    "  2"    ldx  #$FD32
FA06        LFA06:
FA06 : 7A 00 10    "z  "    dec  X0010
FA09 : 2B 08    "+ "    bmi  LFA13
FA0B : A6 00    "  "    ldaa  $00,x
FA0D : 4C    "L"    inca
FA0E : BD FB 92    "   "    jsr  LFB92
FA11 : 20 F3    "  "    bra  LFA06
        ;
FA13        LFA13:
FA13 : DF 17    "  "    stx  X0017
FA15 : BD FA D0    "   "    jsr  LFAD0
FA18 : DE 0A    "  "    ldx  X000A
FA1A : A6 02    "  "    ldaa  $02,x
FA1C : 97 19    "  "    staa  X0019
FA1E : BD FA E2    "   "    jsr  LFAE2
FA21 : DE 0A    "  "    ldx  X000A
FA23 : A6 03    "  "    ldaa  $03,x
FA25 : 97 15    "  "    staa  X0015
FA27 : A6 04    "  "    ldaa  $04,x
FA29 : 97 16    "  "    staa  X0016
FA2B : A6 05    "  "    ldaa  $05,x
FA2D : 16    " "    tab
FA2E : A6 06    "  "    ldaa  $06,x
FA30 : CE FF 02    "   "    ldx  #$FF02
FA33 : BD FB 92    "   "    jsr  LFB92
FA36 : 17    " "    tba
FA37 : DF 1A    "  "    stx  X001A
FA39 : 7F 00 22    "  ""    clr  X0022
FA3C : BD FB 92    "   "    jsr  LFB92
FA3F : DF 1C    "  "    stx  X001C
FA41 : 39    "9"    rts
;*************************************;
;*GWAVE ROUTINE
;*************************************;
;*ACCA= FREQ PATTERN LENGTH, X= FREQ PAT ADDR
;*
;GWAVE
FA42 : 96 12    "  "    ldaa  X0012
FA44 : 97 21    " !"    staa  X0021
FA46        LFA46:
FA46 : DE 1A    "  "    ldx  X001A
FA48 : DF 0C    "  "    stx  X000C
FA4A        LFA4A:
FA4A : DE 0C    "  "    ldx  X000C
FA4C : A6 00    "  "    ldaa  $00,x
FA4E : 9B 22    " ""    adda  X0022
FA50 : 97 20    "  "    staa  X0020
FA52 : 9C 1C    "  "    cpx  X001C
FA54 : 27 26    "'&"    beq  LFA7C
FA56 : D6 13    "  "    ldab  X0013
FA58 : 08    " "    inx
FA59 : DF 0C    "  "    stx  X000C
FA5B        LFA5B:
FA5B : CE 00 23    "  #"    ldx  #$0023
FA5E        LFA5E:
FA5E : 96 20    "  "    ldaa  X0020
FA60        LFA60:
FA60 : 4A    "J"    deca
FA61 : 26 FD    "& "    bne  LFA60
FA63 : A6 00    "  "    ldaa  $00,x
FA65 : B7 04 00    "   "    staa  X0400
FA68 : 08    " "    inx
FA69 : 9C 1E    "  "    cpx  X001E
FA6B : 26 F1    "& "    bne  LFA5E
FA6D : 5A    "Z"    decb
FA6E : 27 DA    "' "    beq  LFA4A
FA70 : 08    " "    inx
FA71 : 09    " "    dex
FA72 : 08    " "    inx
FA73 : 09    " "    dex
FA74 : 08    " "    inx
FA75 : 09    " "    dex
FA76 : 08    " "    inx
FA77 : 09    " "    dex
FA78 : 01    " "    nop
FA79 : 01    " "    nop
FA7A : 20 DF    "  "    bra  LFA5B
        ;
FA7C        LFA7C:
FA7C : 96 14    "  "    ldaa  X0014
FA7E : 8D 62    " b"    bsr  LFAE2
FA80 : 7A 00 21    "z !"    dec  X0021
FA83 : 26 C1    "& "    bne  LFA46
FA85 : 96 03    "  "    ldaa  X0003
FA87 : 26 46    "&F"    bne  LFACF
FA89        LFA89:
FA89 : 96 15    "  "    ldaa  X0015
FA8B : 27 42    "'B"    beq  LFACF
FA8D : 7A 00 16    "z  "    dec  X0016
FA90 : 27 3D    "'="    beq  LFACF
FA92 : 9B 22    " ""    adda  X0022
FA94        LFA94:
FA94 : 97 22    " ""    staa  X0022
FA96        LFA96:
FA96 : DE 1A    "  "    ldx  X001A
FA98 : 5F    "_"    clrb
FA99        LFA99:
FA99 : 96 22    " ""    ldaa  X0022
FA9B : 7D 00 15    "}  "    tst  X0015
FA9E : 2B 06    "+ "    bmi  LFAA6
FAA0 : AB 00    "  "    adda  $00,x
FAA2 : 25 08    "% "    bcs  LFAAC
FAA4 : 20 0B    "  "    bra  LFAB1
        ;
FAA6        LFAA6:
FAA6 : AB 00    "  "    adda  $00,x
FAA8 : 27 02    "' "    beq  LFAAC
FAAA : 25 05    "% "    bcs  LFAB1
FAAC        LFAAC:
FAAC : 5D    "]"    tstb
FAAD : 27 08    "' "    beq  LFAB7
FAAF : 20 0F    "  "    bra  LFAC0
        ;
FAB1        LFAB1:
FAB1 : 5D    "]"    tstb
FAB2 : 26 03    "& "    bne  LFAB7
FAB4 : DF 1A    "  "    stx  X001A
FAB6 : 5C    "\"    incb
FAB7        LFAB7:
FAB7 : 08    " "    inx
FAB8 : 9C 1C    "  "    cpx  X001C
FABA : 26 DD    "& "    bne  LFA99
FABC : 5D    "]"    tstb
FABD : 26 01    "& "    bne  LFAC0
FABF : 39    "9"    rts
        ;
FAC0        LFAC0:
FAC0 : DF 1C    "  "    stx  X001C
FAC2 : 96 14    "  "    ldaa  X0014
FAC4 : 27 06    "' "    beq  LFACC
FAC6 : 8D 08    "  "    bsr  LFAD0
FAC8 : 96 19    "  "    ldaa  X0019
FACA : 8D 16    "  "    bsr  LFAE2
FACC        LFACC:
FACC : 7E FA 42    "~ B"    jmp  LFA42
FACF        LFACF:
FACF : 39    "9"    rts
;*************************************;
;*WAVE TRANSFER ROUTINE
;*************************************;
;WVTRAN
FAD0 : CE 00 23    "  #"    ldx  #$0023
FAD3 : DF 0E    "  "    stx  X000E
FAD5 : DE 17    "  "    ldx  X0017
FAD7 : E6 00    "  "    ldab  $00,x
FAD9 : 08    " "    inx
FADA : BD F9 65    "  e"    jsr  LF965
FADD : DE 0E    "  "    ldx  X000E
FADF : DF 1E    "  "    stx  X001E
FAE1 : 39    "9"    rts
;*************************************;
;*WAVE DECAY ROUTINE/ DECAY AMOUNT IN ACCA(1/16 PER DECAY)
;*************************************;
;WVDECA
FAE2 : 4D    "M"    tsta
FAE3 : 27 2B    "'+"    beq  LFB10
FAE5 : DE 17    "  "    ldx  X0017
FAE7 : DF 0C    "  "    stx  X000C
FAE9 : CE 00 23    "  #"    ldx  #$0023
FAEC : 97 11    "  "    staa  X0011
FAEE        LFAEE:
FAEE : DF 0E    "  "    stx  X000E
FAF0 : DE 0C    "  "    ldx  X000C
FAF2 : D6 11    "  "    ldab  X0011
FAF4 : D7 10    "  "    stab  X0010
FAF6 : E6 01    "  "    ldab  $01,x
FAF8 : 54    "T"    lsrb
FAF9 : 54    "T"    lsrb
FAFA : 54    "T"    lsrb
FAFB : 54    "T"    lsrb
FAFC : 08    " "    inx
FAFD : DF 0C    "  "    stx  X000C
FAFF : DE 0E    "  "    ldx  X000E
FB01 : A6 00    "  "    ldaa  $00,x
FB03        LFB03:
FB03 : 10    " "    sba
FB04 : 7A 00 10    "z  "    dec  X0010
FB07 : 26 FA    "& "    bne  LFB03
FB09 : A7 00    "  "    staa  $00,x
FB0B : 08    " "    inx
FB0C : 9C 1E    "  "    cpx  X001E
FB0E : 26 DE    "& "    bne  LFAEE
FB10        LFB10:
FB10 : 39    "9"    rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FB11 : 8E 00 7F    "   "    lds  #$007F
FB14 : B6 04 02    "   "    ldaa  X0402
FB17 : CE F0 EB    "   "    ldx  #$F0EB
FB1A : DF 07    "  "    stx  X0007
FB1C : CE 00 12    "   "    ldx  #$0012
FB1F : DF 0E    "  "    stx  X000E
FB21 : C6 AF    "  "    ldab  #$AF
FB23 : D7 09    "  "    stab  X0009
FB25 : 0E    " "    cli
FB26 : 43    "C"    coma
FB27 : 84 3F    " ?"    anda  #$3F
FB29 : D6 04    "  "    ldab  X0004
FB2B : 27 03    "' "    beq  LFB30
FB2D : BD F8 CD    "   "    jsr  LF8CD
FB30        LFB30:
FB30 : 5F    "_"    clrb
FB31 : 81 0E    "  "    cmpa  #$0E
FB33 : 27 02    "' "    beq  LFB37
FB35 : D7 02    "  "    stab  X0002
FB37        LFB37:
FB37 : 81 12    "  "    cmpa  #$12
FB39 : 27 02    "' "    beq  LFB3D
FB3B : D7 03    "  "    stab  X0003
FB3D        LFB3D:
FB3D : 4D    "M"    tsta
FB3E : 27 3F    "'?"    beq  LFB7F
FB40 : 4A    "J"    deca
FB41 : 81 1F    "  "    cmpa  #$1F
FB43 : 2D 14    "- "    blt  LFB59
FB45 : 81 3D    " ="    cmpa  #$3D
FB47 : 2E 08    ". "    bgt  LFB51
FB49 : 81 2A    " *"    cmpa  #$2A
FB4B : 22 08    "" "    bhi  LFB55
FB4D : 80 10    "  "    suba  #$10
FB4F : 20 0C    "  "    bra  LFB5D
        ;
FB51        LFB51:
FB51 : 80 39    " 9"    suba  #$39
FB53 : 20 24    " $"    bra  LFB79
        ;
FB55        LFB55:
FB55 : 80 1C    "  "    suba  #$1C
FB57 : 20 12    "  "    bra  LFB6B
        ;
FB59        LFB59:
FB59 : 81 0C    "  "    cmpa  #$0C
FB5B : 22 08    "" "    bhi  LFB65
FB5D        LFB5D:
FB5D : BD F9 DC    "   "    jsr  LF9DC
FB60 : BD FA 42    "  B"    jsr  LFA42
FB63 : 20 1A    "  "    bra  LFB7F
        ;
FB65        LFB65:
FB65 : 81 1B    "  "    cmpa  #$1B
FB67 : 22 0E    "" "    bhi  LFB77
FB69 : 80 0D    "  "    suba  #$0D
FB6B        LFB6B:
FB6B : 48    "H"    asla
FB6C : CE FB C4    "   "    ldx  #$FBC4
FB6F : 8D 21    " !"    bsr  LFB92
FB71 : EE 00    "  "    ldx  $00,x
FB73 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
FB75 : 20 08    "  "    bra  LFB7F
        ;
FB77        LFB77:
FB77 : 80 1C    "  "    suba  #$1C
FB79        LFB79:
FB79 : BD F4 EE    "   "    jsr  LF4EE
FB7C : BD F5 03    "   "    jsr  LF503
FB7F        LFB7F:
FB7F : 96 00    "  "    ldaa  X0000
FB81 : 9A 01    "  "    oraa  X0001
FB83        LFB83:
FB83 : 27 FE    "' "    beq  LFB83
FB85 : 4F    "O"    clra
FB86 : 97 03    "  "    staa  X0003
FB88 : 96 00    "  "    ldaa  X0000
FB8A : 27 03    "' "    beq  LFB8F
FB8C : 7E F7 72    "~ r"    jmp  LF772
FB8F        LFB8F:
FB8F : 7E F9 8F    "~  "    jmp  LF98F
;*************************************;
;* ADD A TO INDEX REGISTER
;*************************************;
;ADDX
FB92 : DF 0C    "  "    stx  X000C
FB94 : 9B 0D    "  "    adda  X000D
FB96 : 97 0D    "  "    staa  X000D
FB98 : 24 03    "$ "    bcc  LFB9D
FB9A : 7C 00 0C    "|  "    inc  X000C
FB9D        LFB9D:
FB9D : DE 0C    "  "    ldx  X000C
FB9F : 39    "9"    rts
;*************************************;
;Diagnostic Processing Here 
;*************************************;
;NMI
FBA0 : 0F    " "    sei
FBA1 : 8E 00 7F    "   "    lds  #$007F
FBA4 : CE FF FF    "   "    ldx  #$FFFF
FBA7 : 5F    "_"    clrb
FBA8        LFBA8:
FBA8 : E9 00    "  "    adcb  $00,x
FBAA : 09    " "    dex
FBAB : 8C F0 00    "   "    cpx  #$F000
FBAE : 26 F8    "& "    bne  LFBA8
FBB0 : E1 00    "  "    cmpb  $00,x
FBB2 : 27 01    "' "    beq  LFBB5
FBB4 : 3E    ">"    wai
FBB5        LFBB5:
FBB5 : BD F7 A2    "   "    jsr  LF7A2
FBB8 : 86 02    "  "    ldaa  #$02
FBBA : BD F8 D2    "   "    jsr  LF8D2
FBBD : 86 01    "  "    ldaa  #$01
FBBF : BD F8 D2    "   "    jsr  LF8D2
FBC2 : 20 DC    "  "    bra  LFBA0
;*************************************;
;*SPECIAL ROUTINE JUMP TABLE
;*************************************;
;JMPTBL
FBC4 : F9 A4 F7    "   "    adcb  XA4F7
        ;
FBC7 : 72    "r"    db  $72
        ;
FBC8 : F9 7F F5    "   "    adcb  X7FF5
FBCB : 5A    "Z"    decb
FBCC : F9 CC F9    "   "    adcb  XCCF9
FBCF : 79 F5 9B    "y  "    rol  XF59B
FBD2 : F5 62 F7    " b "    bitb  X62F7
        ;
FBD5 : 7B    "{"    db  $7B
        ;
FBD6 : F7 80 F8    "   "    stab  X80F8
FBD9 : 2B F8    "+ "    bmi  LFBD3
FBDB : 59    "Y"    rolb
FBDC : F8 78 F8    " x "    eorb  X78F8
FBDF : C9 F9    "  "    adcb  #$F9
FBE1 : 0C    " "    clc
;*
;JMPTB1
FBE2 : F0 FB F1    "   "    subb  XFBF1
FBE5 : 0A    " "    clv
FBE6 : F0 EF F2    "   "    subb  XEFF2
FBE9 : F6 F2 D1    "   "    ldab  XF2D1
FBEC : F2 D6 F2    "   "    sbcb  XD6F2
FBEF : E8 F2    "  "    eorb  $F2,x
FBF1        XFBF1:
FBF1 : FF F3 08    "   "    stx  XF308
FBF4 : F2 BB F1    "   "    sbcb  XBBF1
FBF7 : 28 F1    "( "    bvc  LFBEA
FBF9 : 0F    " "    sei
FBFA : F1 14 F5    "   "    cmpb  X14F5
FBFD        XFBFD:
FBFD : 50    "P"    negb
FBFE : F5 E1 F2    "   "    bitb  XE1F2
        ;
FC01 : 18    " "    db  $18
        ;
FC02 : F1 47 F1    " G "    cmpb  X47F1
FC05 : A4 F7    "  "    anda  $F7,x
FC07 : A2 
;*************************************;
;*VARI VECTORS
;*************************************;
;VVECT  EQU  *
FC08 : 40    " @"    sbca  $40,x
FC09 : 01    " "    nop
        ;
FC0A : 00    " "    db  $00
        ;
FC0B : 10    " "    sba
FC0C : E1 00    "  "    cmpb  $00,x
FC0E : 80 FF    "  "    suba  #$FF
FC10 : FF 28 01    " ( "    stx  X2801
        ;
FC13 : 00    " "    db  $00
        ;
FC14 : 08    " "    inx
FC15 : 81 02    "  "    cmpa  #$02
        ;
FC17 : 00    " "    db  $00
        ;
FC18 : FF FF 28    "  ("    stx  XFF28
FC1B : 81 00    "  "    cmpa  #$00
        ;
FC1D : FC    " "    db  $FC
        ;
FC1E : 01    " "    nop
        ;
FC1F : 02 00 FC    "   "    db  $02, $00, $FC
        ;
FC22 : FF FF 01    "   "    stx  XFF01
        ;
FC25 : 00 18 41 04  "  A "    db  $00, $18, $41, $04
        ;
FC29 : 80 00    "  "    suba  #$00
FC2B : FF 00 FF    "   "    stx  X00FF
FC2E : 08    " "    inx
FC2F : FF 68 04    " h "    stx  X6804
FC32 : 80 00    "  "    suba  #$00
FC34 : FF 28 81    " ( "    stx  X2881
        ;
FC37 : 00 FC    "  "    db  $00, $FC
        ;
FC39 : 01    " "    nop
        ;
FC3A : 02 00 FC    "   "    db  $02, $00, $FC
        ;
FC3D : FF 60 01    " ` "    stx  X6001
FC40 : 57    "W"    asrb
FC41 : 08    " "    inx
FC42 : E1 02    "  "    cmpb  $02,x
        ;
FC44 : 00    " "    db  $00
        ;
FC45 : FE 80 
;*************************************;
;*RADIO SOUND WAVEFORM
;*************************************;
;RADSND
FC46 : 8C    "   "    ldx  X808C
        ;
FC48 : 5B    "["    db  $5B
        ;
FC49 : B6 40 BF    " @ "    ldaa  X40BF
FC4C : 49    "I"    rola
FC4D : A4 73    " s"    anda  $73,x
FC4F : 73 A4 49    "s I"    com  XA449
FC52 : BF 40 B6    " @ "    sts  X40B6
        ;
FC55 : 5B    "["    db  $5B
        ;
FC56 : 8C 
;*************************************;
;* NOTE DEFINITIONS AND ALL THAT JAZZ
;*************************************;
AF1  EQU  $F847
A1   EQU  $F83F
BF1  EQU  $F837
B1   EQU  $F830
C1   EQU  $F829
CS1  EQU  $F823
D1   EQU  $F81D
EF1  EQU  $F817
E1   EQU  $F812
F1   EQU  $F80D
FS1  EQU  $F808
G2   EQU  $F804
AF2  EQU  $7C47
A2   EQU  $7C3F
BF2  EQU  $7C37
B2   EQU  $7C30
C2   EQU  $7C29
CS2  EQU  $7C23
D2   EQU  $7C1D
EF2  EQU  $7C17
E2   EQU  $7C12
F2   EQU  $7C0D
FS2  EQU  $7C08
G3   EQU  $7C04
AF3  EQU  $3E47
A3   EQU  $3E3F
BF3  EQU  $3E37
B3   EQU  $3E30
C3   EQU  $3E29
CS3  EQU  $3E23
D3   EQU  $3E1D
EF3  EQU  $3E17
E3   EQU  $3E12
F3   EQU  $3E0D
FS3  EQU  $3E08
G4   EQU  $3E04
AF4  EQU  $1F47
A4   EQU  $1F3F
BF4  EQU  $1F37
B4   EQU  $1F30
C4   EQU  $1F29
CS4  EQU  $1F23
D4   EQU  $1F1D
EF4  EQU  $1F17
E4   EQU  $1F12
F4   EQU  $1F0D
FS4  EQU  $1F08
RS   EQU  $0004
TR   EQU  TG
;*************************************;
;*ORGAN TUNE TABLE
;*************************************;
;*OSCILLATOR MASK(1),DELAY(1),DURATION(2)
;*
;ORGTAB  EQU  *
FC57 : 1C 
;FIFTH  EQU  *
FC58 : F8    "   "    cpx  #$1CF8
FC59 : 04 05 55 00  "  U "    db  $04, $05, $55, $00
FC5D : 04 05 55    "  U"    db  $04, $05, $55
        ;
FC60 : F8 04 05    "   "    eorb  X0405
        ;
FC63 : 55 00 04 05  "U   "    db  $55, $00, $04, $05
FC67 : 55    "U"    db  $55
        ;
FC68 : F8 04 05    "   "    eorb  X0405
        ;
FC6B : 55 00 04 05  "U   "    db  $55, $00, $04, $05
FC6F : 55    "U"    db  $55
        ;
FC70 : F8 17 3B    "  ;"    eorb  X173B
        ;
FC73 : 41    "A"    db  $41
        ;TUNEND-NINTH
;NINTH  EQU  *
FC74 : B0 

FC75 : 1F 1D    "   "    suba  X1F1D
        ;
FC77 : 04    " "    db  $04
        ;
FC78 : CB 00    "  "    addb  #$00
        ;
FC7A : 04    " "    db  $04
        ;
FC7B : 06    " "    tap
FC7C : 66 3E    "f>"    ror  $3E,x
        ;
FC7E : 1D 04    "  "    db  $1D, $04
        ;
FC80 : CB 00    "  "    addb  #$00
        ;
FC82 : 04 1F    "  "    db  $04, $1F
        ;
FC84 : FE 3E 3F    " >?"    ldx  X3E3F
        ;
FC87 : 03    " "    db  $03
        ;
FC88 : 97 00    "  "    staa  X0000
        ;
FC8A : 04    " "    db  $04
        ;
FC8B : 06    " "    tap
FC8C : 66 7C    "f|"    ror  $7C,x
FC8E : 3F    "?"    swi
        ;
FC8F : 03    " "    db  $03
        ;
FC90 : 97 00    "  "    staa  X0000
        ;
FC92 : 04 1F    "  "    db  $04, $1F
        ;
FC94 : FE 7C 1D    " | "    ldx  X7C1D
        ;
FC97 : 04    " "    db  $04
        ;
FC98 : CB 00    "  "    addb  #$00
        ;
FC9A : 04    " "    db  $04
        ;
FC9B : 06    " "    tap
FC9C : 66 F8    "f "    ror  $F8,x
        ;
FC9E : 1D 04    "  "    db  $1D, $04
        ;
FCA0 : CB 00    "  "    addb  #$00
        ;
FCA2 : 04    " "    db  $04
        ;
FCA3 : 06    " "    tap
FCA4 : 66 7C    "f|"    ror  $7C,x
FCA6 : 3F    "?"    swi
        ;
FCA7 : 03    " "    db  $03
        ;
FCA8 : 97 00    "  "    staa  X0000
        ;
FCAA : 04    " "    db  $04
        ;
FCAB : 06    " "    tap
FCAC : 66 F8    "f "    ror  $F8,x
FCAE : 3F    "?"    swi
        ;
FCAF : 03    " "    db  $03
        ;
FCB0 : 97 00    "  "    staa  X0000
        ;
FCB2 : 04    " "    db  $04
        ;
FCB3 : 2C CA    ", "    bge  LFC7F
FCB5 : 7C 3F 03    "|? "    inc  X3F03
FCB8 : 97 7C    " |"    staa  X007C
        ;
FCBA : 1D 04    "  "    db  $1D, $04
        ;
FCBC : CB 7C    " |"    addb  #$7C
        ;
FCBE : 12 05 61    "  a"    db  $12, $05, $61
        ;
FCC1 : 7C 0D 05    "|  "    inc  X0D05
        ;
FCC4 : B3    " "    db  $B3
        ;
FCC5 : 7C 12 05    "|  "    inc  X1205
        ;
FCC8 : 61    "a"    db  $61
        ;
FCC9 : 7C 0D 05    "|  "    inc  X0D05
        ;
FCCC : B3    " "    db  $B3
        ;
FCCD : 7C 04 06    "|  "    inc  X0406
FCD0 : 66 7C    "f|"    ror  $7C,x
FCD2 : 0D    " "    sec
        ;
FCD3 : 05 B3    "  "    db  $05, $B3
        ;
FCD5 : 7C 12 05    "|  "    inc  X1205
        ;
FCD8 : 61    "a"    db  $61
        ;
FCD9 : 7C 1D 04    "|  "    inc  X1D04
FCDC : CB 3E    " >"    addb  #$3E
FCDE : 37    "7"    pshb
        ;
FCDF : 03    " "    db  $03
        ;
FCE0 : CE 3E 3F    " >?"    ldx  #$3E3F
        ;
FCE3 : 03    " "    db  $03
        ;
FCE4 : 97 7C    " |"    staa  X007C
        ;
FCE6 : 04    " "    db  $04
        ;
FCE7 : 06    " "    tap
FCE8 : 66 7C    "f|"    ror  $7C,x
FCEA : 0D    " "    sec
        ;
FCEB : 05 B3    "  "    db  $05, $B3
        ;
FCED : 7C 12 05    "|  "    inc  X1205
        ;
FCF0 : 61    "a"    db  $61
        ;
FCF1 : 7C 1D 04    "|  "    inc  X1D04
FCF4 : CB 7C    " |"    addb  #$7C
FCF6 : 23 04    "# "    bls  LFCFC
FCF8 : 86 7C    " |"    ldaa  #$7C
        ;
FCFA : 1D 04    "  "    db  $1D, $04
        ;
FCFC        LFCFC:
FCFC : CB 7C    " |"    addb  #$7C
        ;
FCFE : 12 05 61    "  a"    db  $12, $05, $61
        ;
FD01 : 3E    ">"    wai
        ;
FD02 : 1D 04    "  "    db  $1D, $04
        ;
FD04 : CB 00    "  "    addb  #$00
        ;
FD06 : 04    " "    db  $04
        ;
FD07 : 06    " "    tap
FD08 : 66 7C    "f|"    ror  $7C,x
        ;
FD0A : 1D 04    "  "    db  $1D, $04
        ;
FD0C : CB 00    "  "    addb  #$00
        ;
FD0E : 04    " "    db  $04
        ;
FD0F : 06    " "    tap
FD10 : 66 3E    "f>"    ror  $3E,x
FD12 : 3F    "?"    swi
        ;
FD13        LFD13:
FD13 : 03    " "    db  $03
        ;
FD14 : 97 00    "  "    staa  X0000
        ;
FD16 : 04    " "    db  $04
        ;
FD17 : 06    " "    tap
FD18 : 66 7C    "f|"    ror  $7C,x
FD1A : 3F    "?"    swi
        ;
FD1B : 03    " "    db  $03
        ;
FD1C : 97 00    "  "    staa  X0000
        ;
FD1E : 04 1F    "  "    db  $04, $1F
        ;
FD20 : FE F8 1D    "   "    ldx  XF81D
FD23 : 2F EE    "/ "    ble  LFD13
;TUNEND
FD25 : 00    " "    db  $00
;*************************************;
;*ORGAN NOTE TABLE
;*************************************;
;NOTTAB
;*SCALE    AF  A  BF  B  C  CS
FD26 : 47    "G"    asra
FD27 : 3F    "?"    swi
FD28 : 37    "7"    pshb
FD29 : 30    "0"    tsx
FD2A : 29 23    ")#"    bvs  LFD4F
;*    D  EF  E  F  FS  G
FD2C : 1D    " "    db  $1D
        ;
FD2D : 17    " "    tba
        ;
FD2E : 12    " "    db  $12
        ;
FD2F : 0D    " "    sec
FD30 : 08    " "    inx
        ;
FD31 : 04    " "    db  $04
;*************************************;
;*WAVE TABLE
;*************************************;
;*1ST BYTE= WAVELENGTH
;*
;GWVTAB  EQU  *
FD32 : 08                             ;GS2
FD33 : 7F D9 FF D9 7F 24 00 24        ;
;
FD3B : 08                             ;GSSQ2
FD3C : 00 40 80 00 FF 00 80 40        ;
;
FD44 : 10                             ;GS1
FD45 : 7F B0 D9 F5 FF F5 D9 B0        ;
FD4D : 7F 4E 24 09 00 09 24 4E        ;
;
FD55 : 10                             ;GS12
FD56 : 7F C5 EC E7 BF 8D 6D 6A        ;
FD5E : 7F 94 92 71 40 17 12 39        ;
;
FD66 : 10                             ;GSQ22
FD67 : FF FF FF FF 00 00 00 00        ;
FD6F : FF FF FF FF 00 00 00 00        ;
;
FD77 : 48                             ;GS72
FD78 : 8A 95 A0 AB B5 BF C8 D1        ;
FD80 : DA E1 E8 EE F3 F7 FB FD        ;
FD88 : FE FF FE FD FB F7 F3 EE        ;
FD90 : E8 E1 DA D1 C8 BF B5 AB        ;
FD98 : A0 95 8A 7F 75 6A 5F 54        ;
FDA0 : 4A 40 37 2E 25 1E 17 11        ;
FDA8 : 0C 08 04 02 01 00 01 02        ;
FDB0 : 04 08 0C 11 17 1E 25 2E        ;
FDB8 : 37 40 4A 54 5F 6A 75 7F        ;
;
FDC0 : 10                             ;GS1.7
FDC1 : 59 7B 98 AC B3 AC 98 7B        ;
FDC9 : 59 37 19 06 00 06 19 37        ;
;*****************************************************
FDD1 : 08                             ;GSQ2
FDD2 : FF FF FF FF 00 00 00 00        ;
;
FDDA : 10                             ;GS1234
FDDB : 76 FF B8 D0 9D E6 6A 82        ;
FDE3 : 76 EA 81 86 4E 9C 32 63        ;
;
FDEB : 10                             ;MW1
FDEC : 00 F4 00 E8 00 DC 00 E2        ;
FDF4 : 00 DC 00 E8 00 F4 00 00        ;
;
FDFC : 48                             ;HBPAT2
FDFD : 45 4B 50 56 5B 60 64 69        ;
FE05 : 6D 71 74 77 7A 7C 7E 7F        ;
FE0D : 7F 80 7F 7F 7E 7C 7A 77        ;
FE15 : 74 71 6D 69 64 60 5B 56        ;
FE1D : 50 4B 45 40 3B 35 30 2A        ;
FE25 : 25 20 1C 17 13 0F 0C 09        ;
FE2D : 06 04 02 01 01 00 01 01        ;
FE35 : 02 04 06 09 0C 0F 13 17        ;
FE3D : 1C 20 25 2A 30 35 3B 40        ;
;*************************************;
;*GWAVE SOUND VECTOR TABLE
;*************************************;
;*VECTOR FORMAT
;*BYTE 0: GECHO,GCCNT
;*BYTE 1: GECDEC,WAVE#
;*BYTE 2: PREDECAY FACTOR
;*BYTE 3: GDFINC
;*BYTE 4: VARIABLE FREQ COUNT
;*BYTE 5: FREQ PATTERN LENGTH
;*BYTE 6: FREQ PATTERN OFFSET
;*
;SVTAB  EQU  *
FE45 : 81 24 00 00 00 16 31           ;HBDV
FE4C : 12 05 1A FF 00 27 6D           ;STDV
FE53 : 11 05 11 01 0F 01 47           ;
FE5A : 11 31 00 01 00 0D 1B           ;
FE61 : F4 12 00 00 00 14 47           ;
FE68 : 41 45 00 00 00 0F 5B           ;
FE6F : 21 35 11 FF 00 0D 1B           ;
FE76 : 15 00 00 FD 00 01 69           ;
FE7D : 31 11 00 01 00 03 6A           ;
FE84 : 01 15 01 01 01 01 47           ;SV3
FE8B : F6 53 03 00 02 06 94           ;ED10
FE92 : 6A 10 02 00 02 06 9A           ;ED12
FE99 : 1F 12 00 FF 10 04 69           ;ED17
FEA0 : 31 11 00 FF 00 0D 00           ;BONV
FEA7 : 12 06 00 FF 01 09 28           ;TRBV
;****************************************************
FEAE : 14 17 00 00 00 0E 0D           ;
FEB5 : F4 11 00 00 00 0E 0D           ;
FEBC : 21 30 00 01 00 0D 1B           ;
FEC3 : 13 10 00 FF 00 09 A4           ;
FECA : F4 18 00 00 00 12 B3           ;
FED1 : 82 22 00 00 00 18 C6           ;
FED8 : F2 19 00 00 00 16 DF           ;
FEDF : 21 30 00 FF 00 1B 0D           ;
FEE6 : F1 19 00 00 00 0E A4           ;
FEED : 31 19 00 01 00 03 6A           ;
FEF4 : 41 02 D0 00 00 27 6D           ;
FEFB : 03 15 11 FF 00 0D 1B           ;
;*************************************;
;*GWAVE FREQ PATTERN TABLE
;*************************************;
;GFRTAB  EQU  *
;
;*BONUS  SOUND
FF02 : A0 98    "  "    suba  $98,x
FF04 : 90 88    "  "    suba  X0088
FF06 : 80 78    " x"    suba  #$78
FF08 : 70 68 60    "ph`"    neg  X6860
FF0B : 58    "X"    aslb
FF0C : 50    "P"    negb
FF0D : 44    "D"    lsra
FF0E : 40    "@"    nega
;*HUNDRED POINT SOUND
FF0F : 01    " "    nop
FF10 : 01    " "    nop
        ;
FF11 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FF15 : 08    " "    inx
FF16 : 08    " "    inx
FF17 : 10    " "    sba
FF18 : 10    " "    sba
FF19 : 30    "0"    tsx
FF1A : 60 C0    "` "    neg  $C0,x
FF1C : E0 
;*SPINNER SOUND
FF1D : 01    "  "    subb  $01,x
FF1E : 01    " "    nop
        ;
FF1F : 02 02 03 04  "    "    db  $02, $02, $03, $04
FF23 : 05    " "    db  $05
        ;
FF24 : 06    " "    tap
FF25 : 07    " "    tpa
FF26 : 08    " "    inx
FF27 : 09    " "    dex
FF28        XFF28:
FF28 : 0A    " "    clv
FF29 : 0C    " "    clc
;*TURBINE START UP
FF2A : 80 7C    " |"    suba  #$7C
FF2C : 78 74 70    "xtp"    asl  X7470
FF2F : 74 78 7C    "tx|"    lsr  X787C
FF32 : 80 
;*HEARTBEAT DISTORTO
FF33 : 01    "  "    suba  #$01
FF34 : 01    " "    nop
        ;
FF35 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FF39 : 08    " "    inx
FF3A : 08    " "    inx
FF3B : 10    " "    sba
FF3C : 20 28    " ("    bra  LFF66
        ;
FF3E : 30    "0"    tsx
        ;
FF3F : 38    "8"    db  $38
        ;
FF40 : 40    "@"    nega
FF41 : 48    "H"    asla
FF42 : 50    "P"    negb
FF43 : 60 70    "`p"    neg  $70,x
FF45 : 80 A0    "  "    suba  #$A0
FF47 : B0 C0 
;*SWEEP PATTERN
;SWPAT  EQU  *
;*BIGBEN SOUNDS
FF48 : 08    "   "    suba  XC008
FF4A : 40    "@"    nega
FF4B : 08    " "    inx
FF4C : 40    "@"    nega
FF4D : 08    " "    inx
FF4E : 40    "@"    nega
FF4F : 08    " "    inx
FF50 : 40    "@"    nega
FF51 : 08    " "    inx
FF52 : 40    "@"    nega
FF53 : 08    " "    inx
FF54 : 40    "@"    nega
FF55 : 08    " "    inx
FF56 : 40    "@"    nega
FF57 : 08    " "    inx
FF58 : 40    "@"    nega
FF59 : 08    " "    inx
FF5A : 40    "@"    nega
FF5B : 08    " "    inx
FF5C : 40    "@"    nega
;*HEARTBEAT ECHO
FF5D : 01    " "    nop
        ;
FF5E : 02 04    "  "    db  $02, $04
        ;
FF60 : 08    " "    inx
FF61 : 09    " "    dex
FF62 : 0A    " "    clv
FF63 : 0B    " "    sev
FF64 : 0C    " "    clc
FF65 : 0E    " "    cli
FF66        LFF66:
FF66 : 0F    " "    sei
FF67 : 10    " "    sba
        ;
FF68        LFF68:
FF68 : 12 14    "  "    db  $12, $14
        ;
FF6A : 16    " "    tab
;*SPINNER SOUND "DRIP"
FF6B : 40    "@"    nega
;*COOL DOWNER
FF6C : 10    " "    sba
FF6D : 08    " "    inx
FF6E : 01    " "    nop
;*START DISTORTO SOUND
FF6F : 01    " "    nop
FF70 : 01    " "    nop
FF71 : 01    " "    nop
FF72 : 01    " "    nop
        ;
FF73 : 02 02 03 03  "    "    db  $02, $02, $03, $03
FF77 : 04 04 05    "   "    db  $04, $04, $05
        ;
FF7A : 06    " "    tap
FF7B : 08    " "    inx
FF7C : 0A    " "    clv
FF7D : 0C    " "    clc
FF7E : 10    " "    sba
        ;
FF7F : 14 18    "  "    db  $14, $18
        ;
FF81 : 20 30    " 0"    bra  LFFB3
        ;
FF83 : 40    "@"    nega
FF84 : 50    "P"    negb
FF85 : 40    "@"    nega
FF86 : 30    "0"    tsx
FF87 : 20 10    "  "    bra  LFF99
        ;
FF89 : 0C    " "    clc
FF8A : 0A    " "    clv
FF8B : 08    " "    inx
FF8C : 07    " "    tpa
FF8D : 06    " "    tap
        ;
FF8E : 05 04    "  "    db  $05, $04
FF90        XFF90:
FF90 : 03 02 02    "   "    db  $03, $02, $02
        ;
FF93 : 01    " "    nop
FF94 : 01    " "    nop
FF95 : 01    " "    nop
;*ED'S SOUND 10
FF96 : 07    " "    tpa
FF97 : 08    " "    inx
FF98 : 09    " "    dex
FF99        LFF99:
FF99 : 0A    " "    clv
FF9A : 0C    " "    clc
FF9B : 08    " "    inx
;*ED'S SOUND 13
FF9C : 17    " "    tba
        ;
FF9D : 18    " "    db  $18
        ;
FF9E : 19    " "    daa
        ;
FF9F : 1A    " "    db  $1A
        ;
FFA0 : 1B    " "    aba
        ;
FFA1 : 1C 
;FILLER
FFA2 : 00 00 00  "    "    db  $1C, $00, $00, $00
FFA5 : 00    " "    db  $00
;****************************************************
FFA6 : 08    " "    inx
FFA7 : 80 10    "  "    suba  #$10
FFA9 : 78 18 70    "x p"    asl  X1870
FFAC : 20 60    " `"    bra  L000E
        ;
FFAE : 28 58    "(X"    bvc  L0008
FFB0 : 30    "0"    tsx
FFB1 : 50    "P"    negb
FFB2 : 40    "@"    nega
FFB3        LFFB3:
FFB3 : 48    "H"    asla
        ;
FFB4 : 00    " "    db  $00
        ;
FFB5 : 01    " "    nop
FFB6 : 08    " "    inx
FFB7 : 10    " "    sba
FFB8        XFFB8:
FFB8 : 01    " "    nop
FFB9 : 08    " "    inx
FFBA : 10    " "    sba
FFBB : 01    " "    nop
FFBC : 08    " "    inx
FFBD : 10    " "    sba
FFBE : 01    " "    nop
FFBF : 08    " "    inx
FFC0 : 10    " "    sba
FFC1 : 01    " "    nop
FFC2 : 08    " "    inx
FFC3 : 10    " "    sba
FFC4 : 01    " "    nop
FFC5 : 08    " "    inx
FFC6 : 10    " "    sba
        ;
FFC7 : 00    " "    db  $00
        ;
FFC8 : 10    " "    sba
FFC9 : 20 40    " @"    bra  L000B
        ;
FFCB : 10    " "    sba
FFCC : 20 40    " @"    bra  L000E
        ;
FFCE : 10    " "    sba
FFCF : 20 40    " @"    bra  L0011
        ;
FFD1 : 10    " "    sba
FFD2 : 20 40    " @"    bra  L0014
        ;
FFD4 : 10    " "    sba
FFD5 : 20 40    " @"    bra  L0017
        ;
FFD7 : 10    " "    sba
FFD8 : 20 40    " @"    bra  L001A
        ;
FFDA : 10    " "    sba
FFDB : 20 40    " @"    bra  L001D
        ;
FFDD : 10    " "    sba
FFDE : 20 40    " @"    bra  L0020
        ;
FFE0 : 00    " "    db  $00
        ;
FFE1 : 01    " "    nop
FFE2 : 40    "@"    nega
        ;
FFE3 : 02 42 03    " B "    db  $02, $42, $03
        ;
FFE6 : 43    "C"    coma
        ;
FFE7 : 04    " "    db  $04
        ;
FFE8 : 44    "D"    lsra
        ;
FFE9 : 05 45    " E"    db  $05, $45
        ;
FFEB : 06    " "    tap
FFEC : 46    "F"    rora
FFED : 07    " "    tpa
FFEE : 47    "G"    asra
FFEF : 08    " "    inx
FFF0 : 48    "H"    asla
FFF1 : 09    " "    dex
FFF2 : 49    "I"    rola
FFF3 : 0A    " "    clv
FFF4 : 4A    "J"    deca
FFF5        XFFF5:
FFF5 : 0B    " "    sev
        ;
FFF6 : 4B 00    "K "    db  $4B, $00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FB 11                          ;IRQ 
FFFA : F0 1D                          ;RESET SWI (software) 
FFFC : FB A0                          ;NMI 
FFFE : F0 1D                          ;RESET (hardware) 

;--------------------------------------------------------------




