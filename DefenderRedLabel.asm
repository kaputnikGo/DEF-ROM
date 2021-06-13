        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    DefenderRedLabel.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  BC41
        ;  CRC-32:    FEFD5B48
        ;
        ;  Date:    Mon May 24 21:30:52 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;Defender, Video Sound ROM 1, September 1980, Red Label
        ;
        ; Video Games sound boards have W4 jumpered to allow PB5 Status (input sound select #6)
        ; so IOJ3 pin 1 key, 2-7 sound select, 8 not used, 9 N/C
        ; IRQ mask 1Fh is 0001 1111
        ;
        ;
;
;NOGEN
;NAM  DEFENDER SOUNDS REV. 1.0 BY SAM D 10/80
;*COPYRIGHT WILLIAMS ELECTRONICS 1980
;*PROGRAM ORIGINATION DATE 10/24/80
;*PROGRAM RELEASE 10/31/80
;*PROGRAMMER: SAM DICKER
;
;*
;*SYSTEM CONSTANTS
;*
ROM      EQU  $F800
SOUND    EQU  $400
CKORG    EQU  $F700    ;CHECKSUM PROG ORG
ENDRAM   EQU  $7F
VECTOR   EQU  $FFF8    ;RESET,INT VECTORS
WVELEN   EQU  72
BG2MAX   EQU  29
SP1SND   EQU  $0E      ;SPINNER SOUND #1 CODE
B2SND    EQU  $12      ;BONUS SOUND #2 CODE
SP1MAX   EQU  32
TACC     EQU  4        ;TACCATA TEMPO CONSTANT
PHANC    EQU  3        ;PHANTOM TEMPO CONTANT
TAF      EQU  34715!>1 ;NOTE TIMES
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
;* SCREAM EQUATES
;*
ECHOS    EQU  4
FREQ     EQU  0
TIMER    EQU  1
;*
;*GLOBALS
;*
         ORG  0        ;DESCRIPTION              : ADDR
;
;??                    ;??                       : 0000-0001
;??                    ;??                       : 0002-0003
BG1FLG   RMB  1        ;BACKGROUND SOUND 1       : 0004
BG2FLG   RMB  1        ;BACKGROUND SOUND 2       : 0005
SP1FLG   RMB  1        ;SPINNER FLAG             : 0006
B2FLG    RMB  1        ;BONUS #2 FLAG            : 0007
ORGFLG   RMB  1        ;ORGAN FLAG               : 0008
HI       RMB  1        ;RANDOM SEED              : 0009
LO       RMB  1        ;RANDOM SEED              : 000A
;*
;*TEMPORARIES
;*
TMPRAM   EQU  *        ;TEMPORARY RAM
TEMPX    RMB  2        ;X TEMPS                  : 000B-000C
XPLAY    RMB  2        ;                         : 000D-000E
XPTR     RMB  2        ;                         : 000F-0010
TEMPA    RMB  1        ;ACCA TEMP                : 0011
TEMPB    RMB  1        ;                         : 0012
LOCRAM   EQU  *        ;                         : 0013
;*
;*GWAVE PARAMETERS
;*
         ORG  LOCRAM
GECHO    RMB  1        ;ECHO FLAG                : 0013
GCCNT    RMB  1        ;CYCLE COUNT              : 0014
GECDEC   RMB  1        ;# OF DECAYS PER ECHO     : 0015
GDFINC   RMB  1        ;DELTA FREQ INC           : 0016
GDCNT    RMB  1        ;DELTA FREQ COUNT         : 0017
GWFRM    RMB  2        ;WAVEFORM ADDRESS         : 0018-0019
;*TEMPORARY OR COMPUTED PARAMETERS
PRDECA   RMB  1        ;PRE-DECAY FACTOR         : 001A
GWFRQ    RMB  2        ;FREQ TABLE ADDR          : 001B-001C
FRQEND   RMB  2        ;END ADDR FREQ TABLE      : 001D-001E
WVEND    RMB  2        ;WAVE END ADDR            : 001F-0020
GPER     RMB  1        ;PERIOD                   : 0021
GECNT    RMB  1        ;# OF ECHOES COUNTER      : 0022
FOFSET   RMB  1        ;FREQUENCY OFFSET         : 0023
;*
;*GWAVE TABLES
;*
GWTAB    RMB  WVELEN   ;WAVE TABLE               : 0024-006C
;*
;*VARIWAVE PARAMETERS
;*
         ORG  LOCRAM
LOPER    RMB  1        ;LO PERIOD                : 0013
HIPER    RMB  1        ;HIPERIOD                 : 0014
LODT     RMB  1        ;PERIOD DELTAS            : 0015
HIDT     RMB  1        ;                         : 0016
HIEN     RMB  1        ;END PERIOD               : 0017
SWPDT    RMB  2        ;SWEEP PERIOD             : 0018-0019
LOMOD    RMB  1        ;BASE FREQ MOD            : 001A
VAMP     RMB  1        ;AMPLITUDE                : 001B
LOCNT    RMB  1        ;PERIOD COUNTERS          : 001C
HICNT    RMB  1        ;                         : 001D
;*
;*NOISE ROUTINE PARAMETERS
;*
         ORG  LOCRAM
DECAY    RMB  1        ;                         : 0013
NAMP     RMB  1        ;                         : 0014
CYCNT    RMB  1        ;                         : 0015
NFRQ1    RMB  2        ;                         : 0016-0017
NFFLG    RMB  1        ;                         : 0018
LFREQ    RMB  1        ;                         : 0019
DFREQ    RMB  1        ;                         : 001A
;*
;*FILTERED NOISE ROUTINE PARAMETERS
;*
         ORG  LOCRAM
FMAX     RMB  1        ;MAXIMUM_FREQUENCY        : 0013
FHI      RMB  1        ;FREQUENCY                : 0014
FLO      RMB  1        ;                         : 0015
SAMPC    RMB  2        ;SAMPLE COUNT             : 0016-0017
FDFLG    RMB  1        ;FREQUENCY DECREMENT FLAG : 0018
DSFLG    RMB  1        ;DISTORTION FLAG          : 0019
;*
;*SCREAM TABLES
;*
        ORG  LOCRAM
STABLE  RMB  2*ECHOS   ;SCREAM TABLE             : 0013-001B
SRMEND  EQU  *         ;                         : 001C
;*
;*ORGAN PARAMETERS
;*
         ORG  LOCRAM
DUR      RMB  2        ;NOTE DURATION            : 0013-0014
OSCIL    RMB  1        ;OSCILLATORS              : 0015
RDELAY   RMB  60       ;RAM DELAY LOAD           : 0016-0076
;
;
;
;
org  $F800
;
F800 : FF                             ;checksum byte
;*************************************;
;RESET power on
;*************************************;
;SETUP
F801 : 0F         sei                 ;set interrupt mask   
F802 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
F805 : CE 04 00   ldx  #$0400         ;load X with 0400h (PIA addr)
F808 : 6F 01      clr  $01,x          ;clear addr X + 01h (0401 PIA1 CR port A)
F80A : 6F 03      clr  $03,x          ;clear addr X + 03h (0403 PIA1 CR port B)
F80C : 86 FF      ldaa  #$FF          ;load A with FFh
F80E : A7 00      staa  $00,x         ;store A in addr X + 00h (0400 PIA1 PR/DDR port A out)
F810 : 6F 02      clr  $02,x          ;clear addr X + 02h (0402 PIA1 PR/DDR port B in)
F812 : 86 37      ldaa  #$37          ;load A with 37h (CB2 low, IRQ allowed)
F814 : A7 03      staa  $03,x         ;store A in addr X + 03h (0403 PIA1 CR port B)
F816 : 86 3C      ldaa  #$3C          ;load A with 3Ch (CA2 set init high, no IRQs)
F818 : A7 01      staa  $01,x         ;store A in addr X + 01h (0401 PIA1 CR port A)
F81A : 97 09      staa  $09           ;store A in addr 09 (HI, start Random Generator)
F81C : 4F         clra                ;clear A
F81D : 97 07      staa  $07           ;store A in addr 07 (B2FLG)
F81F : 97 04      staa  $04           ;store A in addr 04 (BG1FLG)
F821 : 97 05      staa  $05           ;store A in addr 05 (BG2FLG)
F823 : 97 06      staa  $06           ;store A in addr 06 (SP1FLG)
F825 : 97 08      staa  $08           ;store A in addr 08 (ORGFLG)
F827 : 0E         cli                 ;clear interrupt
;STDBY
F828 : 20 FE      bra  LF828          ;branch always (STDBY)
;*************************************;
;Vari Loader 
;*************************************;
;VARILD
F82A : 16         tab                 ;transfer A to B
F82B : 48         asla                ;arith shift left A (x2)
F82C : 48         asla                ;arith shift left A (x4)
F82D : 48         asla                ;arith shift left A (x8)
F82E : 1B         aba                 ;add B to A (x9)
F82F : CE 00 13   ldx  #$0013         ;load X with 000Fh (#LOCRAM)
F832 : DF 0F      stx  $0F            ;store X in addr 0F (XPTR)(SET XSFER)
F834 : CE FD 76   ldx  #$FD76         ;load X with FD60h (VVECT SAW)
F837 : BD FD 21   jsr  LFD21          ;jump sub ADDX
F83A : C6 09      ldab  #$09          ;load B with 09h (COUNT)
F83C : 7E FB 0A   jmp  LFB0A          ;jump TRANS 
;*************************************;
;Variable Duty Cycle Square Wave Routine 
;*************************************;
;VARI
F83F : 96 1B      ldaa  $1B           ;load A with addr 1B (VAMP)
F841 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
;VAR0:
F844 : 96 13      ldaa  $13           ;load A with addr 13 (LOPER)
F846 : 97 1C      staa  $1C           ;store A in addr 1C (LOCNT)
F848 : 96 14      ldaa  $14           ;load A with addr 14 (HIPER)
F84A : 97 1D      staa  $1D           ;store A in addr 1D (HICNT)
;V0:
F84C : DE 18      ldx  $18            ;load X with addr 18 (SWPDT)
;V0LP:
F84E : 96 1C      ldaa  $1C           ;load A with addr 1C (LOCNT) (LO CYCLE)
F850 : 73 04 00   com  $0400          ;complement 1s in DAC output SOUND
;V1:
F853 : 09         dex                 ;decr X
F854 : 27 10      beq  LF866          ;branch Z=1 (VSWEEP)
F856 : 4A         deca                ;decr A
F857 : 26 FA      bne  LF853          ;branch Z=0 (V1)
F859 : 73 04 00   com  $0400          ;complement 1s in DAC output SOUND
F85C : 96 1D      ldaa  $1D           ;load A with addr 1D (HICNT) (HI CYCLE)
;V2:
F85E : 09         dex                 ;decr X
F85F : 27 05      beq  LF866          ;branch Z=1 (VSWEEP)
F861 : 4A         deca                ;decr A
F862 : 26 FA      bne  LF85E          ;branch Z=0 (V2)
F864 : 20 E8      bra  LF84E          ;branch always (V0LP) (LOOP BACK)
;VSWEEP:
F866 : B6 04 00   ldaa  $0400         ;load A with DAC
F869 : 2B 01      bmi  LF86C          ;branch N=1 (VS1)
F86B : 43         coma                ;complement 1s in A
;VS1:
F86C : 8B 00      adda  #$00          ;add A with 00h
F86E : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F871 : 96 1C      ldaa  $1C           ;load A with addr 1C (LOCNT)
F873 : 9B 15      adda  $15           ;add A with addr 15 (LODT)
F875 : 97 1C      staa  $1C           ;store A in addr 1C(LOCNT)
F877 : 96 1D      ldaa  $1D           ;load A with addr 1D (HICNT)
F879 : 9B 16      adda  $16           ;add A with addr 16 (HIDT)
F87B : 97 1D      staa  $1D           ;store A in addr 1D (HICNT)
F87D : 91 17      cmpa  $17           ;compare A with addr 17 (HIEN)
F87F : 26 CB      bne  LF84C          ;branch Z=0 (V0)
F881 : 96 1A      ldaa  $1A           ;load A with addr 1A (LOMOD)
F883 : 27 06      beq  LF88B          ;branch Z=1 (VARX)
F885 : 9B 13      adda  $13           ;add A with addr 13 (LOPER)
F887 : 97 13      staa  $13           ;store A in addr 13 (LOPER)
F889 : 26 B9      bne  LF844          ;branch Z=0 (VAR0)
;VARX:
F88B : 39         rts                 ;return subroutine
;*************************************;
;Lightning 
;*************************************;
;LITE
F88C : 86 01      ldaa  #$01          ;load A with 01h
F88E : 97 1A      staa  $1A           ;store A in addr 1A (DFREQ)
F890 : C6 03      ldab  #$03          ;load B with 03h
F892 : 20 0A      bra  LF89E          ;branch always (LITEN)
;*************************************;
;Appear 
;*************************************;
;APPEAR
F894 : 86 FE      ldaa  #$FE          ;load A with FEh
F896 : 97 1A      staa  $1A           ;store A in addr 1A (DFREQ)
F898 : 86 C0      ldaa  #$C0          ;load A with C0h
F89A : C6 10      ldab  #$10          ;load B with 10h
F89C : 20 00      bra  LF89E          ;branch always (LITEN)
;*************************************;
;Lightning+Appear Noise Routine 
;*************************************;
;LITEN:
F89E : 97 19      staa  $19           ;store A in addr 19 (LFREQ)
F8A0 : 86 FF      ldaa  #$FF          ;load A with FFh (HIGHEST AMP)
F8A2 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F8A5 : D7 15      stab  $15           ;store B in addr 15 (CYCNT)
;LITE0:
F8A7 : D6 15      ldab  $15           ;load B with addr 15 (CYCNT)
;LITE1:
F8A9 : 96 0A      ldaa  $0A           ;load A with addr 0A (LO) (GET RANDOM)
F8AB : 44         lsra                ;logic shift right A
F8AC : 44         lsra                ;logic shift right A
F8AD : 44         lsra                ;logic shift right A
F8AE : 98 0A      eora  $0A           ;exclusive OR with addr 0A (LO)
F8B0 : 44         lsra                ;logic shift right A
F8B1 : 76 00 09   ror  $0009          ;rotate right in addr 0009 (HI)
F8B4 : 76 00 0A   ror  $000A          ;rotate right in addr 000A  (LO)
F8B7 : 24 03      bcc  LF8BC          ;branch C=0 (LITE2)
F8B9 : 73 04 00   com  $0400          ;complement 1s in DAC output SOUND
;LITE2:
F8BC : 96 19      ldaa  $19           ;load A in addr 19 (LFREQ)(COUNT FREQ)
;LITE3:
F8BE : 4A         deca                ;decr A
F8BF : 26 FD      bne  LF8BE          ;branch Z=0 (LITE3)
F8C1 : 5A         decb                ;decr B (COUNT CYCLES)
F8C2 : 26 E5      bne  LF8A9          ;branch Z=0 (LITE1)
F8C4 : 96 19      ldaa  $19           ;load A with addr 19 (LFREQ)
F8C6 : 9B 1A      adda  $1A           ;add A with addr 1A (DFREQ)
F8C8 : 97 19      staa  $19           ;store A in addr 19 (LFREQ)
F8CA : 26 DB      bne  LF8A7          ;branch Z=0 (LITE0)
F8CC : 39         rts                 ;return subroutine
;*************************************;
;Turbo 
;*************************************;
;TURBO
F8CD : 86 20      ldaa  #$20          ;load A with value 20h
F8CF : 97 15      staa  $15           ;store A in addr 15 (CYCNT)
F8D1 : 97 18      staa  $18           ;store A in addr 18 (NFFLG)
F8D3 : 86 01      ldaa  #$01          ;load A with value 01h
F8D5 : CE 00 01   ldx  #$0001         ;load X with value 0001h
F8D8 : C6 FF      ldab  #$FF          ;load B with value FFh
F8DA : 20 00      bra  LF8DC          ;branch always (NOISE)
;*************************************;
;White Noise Routine 
;*************************************;
;X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;NOISE:
F8DC : 97 13      staa  $13           ;store A in addr 13 (DECAY)
;NOISE0:
F8DE : DF 16      stx  $16            ;store X in addr 16 (NFRQ1)
;NOIS00:
F8E0 : D7 14      stab  $14           ;store B in addr 14 (NAMP)
F8E2 : D6 15      ldab  $15           ;load B with addr 15 (CYCNT)
;NOISE1:
F8E4 : 96 0A      ldaa  $0A           ;load A with addr 0A (LO)(GET RANDOM BIT)
F8E6 : 44         lsra                ;logic shift right A 
F8E7 : 44         lsra                ;logic shift right A 
F8E8 : 44         lsra                ;logic shift right A 
F8E9 : 98 0A      eora  $0A           ;exclusive OR with addr 0A (LO)
F8EB : 44         lsra                ;logic shift right A 
F8EC : 76 00 09   ror  $0009          ;rotate right in addr 0009 (HI)
F8EF : 76 00 0A   ror  $000A          ;rotate right in addr 000A (LO)
F8F2 : 86 00      ldaa  #$00          ;load A with value 00h
F8F4 : 24 02      bcc  LF8F8          ;branch C=0 (NOISE2)
F8F6 : 96 14      ldaa  $14           ;load A with addr 14 (NAMP)
;NOISE2:
F8F8 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F8FB : DE 16      ldx  $16            ;load X with addr 16 (NFRQ1)(INCREASING DELAY)
;NOISE3:
F8FD : 09         dex                 ;decr X
F8FE : 26 FD      bne  LF8FD          ;branch Z=0 (NOISE3)
F900 : 5A         decb                ;decr B (FIN CYCLE COUNT?)
F901 : 26 E1      bne  LF8E4          ;branch Z=0 (NOISE1)(NO)
F903 : D6 14      ldab  $14           ;load B with addr 14 (NAMP)(DECAY AMP)
F905 : D0 13      subb  $13           ;B = B - addr 13 (DECAY) 
F907 : 27 09      beq  LF912          ;branch Z=1 (NSEND)
F909 : DE 16      ldx  $16            ;load X with addr 16 (NFRQ1)(INC FREQ)
F90B : 08         inx                 ;incr X 
F90C : 96 18      ldaa  $18           ;load A with addr 18 (NFFLG)(DECAY FREQ?)
F90E : 27 D0      beq  LF8E0          ;branch Z=1 (NOIS00)(NO)
F910 : 20 CC      bra  LF8DE          ;branch always (NOISE0)
;NSEND:
F912 : 39         rts                 ;return subroutine
;*************************************;
;Background 1 Routine 
;*************************************;
;BG1:
F913 : C6 01    "  "    ldab  #$01
F915 : D7 04    "  "    stab  X0004
F917 : 4F    "O"    clra
F918 : 97 19    "  "    staa  X0019
F91A : 20 14    "  "    bra  LF930
;*************************************;
;Thrust 
;*************************************;
;THRUST
F91C : 4F    "O"    clra
F91D : 97 19    "  "    staa  X0019
F91F : C6 03    "  "    ldab  #$03
F921 : 20 0D    "  "    bra  LF930
;*************************************;
;Cannon 
;*************************************;
;CANNON
F923 : 86 01    "  "    ldaa  #$01
F925 : 97 19    "  "    staa  X0019
F927 : CE 03 E8    "   "    ldx  #$03E8
F92A : 86 01    "  "    ldaa  #$01
F92C : C6 FF    "  "    ldab  #$FF
F92E : 20 00    "  "    bra  LF930
;*************************************;
;Filtered Noise Routine 
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
F930 : 97 18    "  "    staa  X0018
F932 : D7 13    "  "    stab  X0013
F934 : DF 16    "  "    stx  X0016
F936 : 7F 00 15    "   "    clr  X0015
;FNOIS0:
F939 : DE 16    "  "    ldx  X0016
F93B : B6 04 00    "   "    ldaa  X0400
;FNOIS1:
F93E : 16    " "    tab
F93F : 54    "T"    lsrb
F940 : 54    "T"    lsrb
F941 : 54    "T"    lsrb
F942 : D8 0A    "  "    eorb  X000A
F944 : 54    "T"    lsrb
F945 : 76 00 09    "v  "    ror  X0009
F948 : 76 00 0A    "v  "    ror  X000A
F94B : D6 13    "  "    ldab  X0013
F94D : 7D 00 19    "}  "    tst  X0019
F950 : 27 02    "' "    beq  LF954
F952 : D4 09    "  "    andb  X0009
;FNOIS2:
F954 : D7 14    "  "    stab  X0014
F956 : D6 15    "  "    ldab  X0015
F958 : 91 0A    "  "    cmpa  X000A
F95A : 22 12    "" "    bhi  LF96E
;FNOIS3:
F95C : 09    " "    dex
F95D : 27 26    "'&"    beq  LF985
F95F : B7 04 00    "   "    staa  X0400
F962 : DB 15    "  "    addb  X0015
F964 : 99 14    "  "    adca  X0014
F966 : 25 16    "% "    bcs  LF97E
F968 : 91 0A    "  "    cmpa  X000A
F96A : 23 F0    "# "    bls  LF95C
F96C : 20 10    "  "    bra  LF97E
;FNOIS4:
F96E : 09    " "    dex
F96F : 27 14    "' "    beq  LF985
F971 : B7 04 00    "   "    staa  X0400
F974 : D0 15    "  "    subb  X0015
F976 : 92 14    "  "    sbca  X0014
F978 : 25 04    "% "    bcs  LF97E
F97A : 91 0A    "  "    cmpa  X000A
F97C : 22 F0    "" "    bhi  LF96E
;FNOIS5:
F97E : 96 0A    "  "    ldaa  X000A
F980 : B7 04 00    "   "    staa  X0400
F983 : 20 B9    "  "    bra  LF93E
;FNOIS6:
F985 : D6 18    "  "    ldab  X0018
F987 : 27 B5    "' "    beq  LF93E
F989 : 96 13    "  "    ldaa  X0013
F98B : D6 15    "  "    ldab  X0015
F98D : 44    "D"    lsra
F98E : 56    "V"    rorb
F98F : 44    "D"    lsra
F990 : 56    "V"    rorb
F991 : 44    "D"    lsra
F992 : 56    "V"    rorb
F993 : 43    "C"    coma
F994 : 50    "P"    negb
F995 : 82 FF    "  "    sbca  #$FF
F997 : DB 15    "  "    addb  X0015
F999 : 99 13    "  "    adca  X0013
F99B : D7 15    "  "    stab  X0015
F99D : 97 13    "  "    staa  X0013
F99F : 26 98    "& "    bne  LF939
F9A1 : C1 07    "  "    cmpb  #$07
F9A3 : 26 94    "& "    bne  LF939
F9A5 : 39    "9"    rts
;*************************************;
;Radio 
;*************************************;
;RADIO
F9A6 : 86 FD    "  "    ldaa  #$FD
F9A8 : 97 0F    "  "    staa  X000F
F9AA : CE 00 64    "  d"    ldx  #$0064
F9AD : DF 0B    "  "    stx  X000B
;RADIO1:
F9AF : DB 0C    "  "    addb  X000C
F9B1 : 96 11    "  "    ldaa  X0011
F9B3 : 99 0B    "  "    adca  X000B
F9B5 : 97 11    "  "    staa  X0011
F9B7 : DE 0B    "  "    ldx  X000B
F9B9 : 25 04    "% "    bcs  LF9BF
F9BB : 20 00    "  "    bra  LF9BD
;RADIO2:
F9BD : 20 03    "  "    bra  LF9C2
F9BF : 08    " "    inx
F9C0 : 27 11    "' "    beq  LF9D3
;RADIO3:
F9C2 : DF 0B    "  "    stx  X000B
F9C4 : 84 0F    "  "    anda  #$0F
F9C6 : 8B 9A    "  "    adda  #$9A
F9C8 : 97 10    "  "    staa  X0010
F9CA : DE 0F    "  "    ldx  X000F
F9CC : A6 00    "  "    ldaa  $00,x
F9CE : B7 04 00    "   "    staa  X0400
F9D1 : 20 DC    "  "    bra  LF9AF
;RADIO4:
F9D3 : 39    "9"    rts
;*************************************;
;Hyper 
;*************************************;
;HYPER
F9D4 : 4F    "O"    clra
F9D5 : B7 04 00    "   "    staa  X0400
F9D8 : 97 11    "  "    staa  X0011
;HYPER1:
F9DA : 4F    "O"    clra
;HYPER2:
F9DB : 91 11    "  "    cmpa  X0011
F9DD : 26 03    "& "    bne  LF9E2
F9DF : 73 04 00    "s  "    com  X0400
;HYPER3:
F9E2 : C6 12    "  "    ldab  #$12
;HYPER4:
F9E4 : 5A    "Z"    decb
F9E5 : 26 FD    "& "    bne  LF9E4
F9E7 : 4C    "L"    inca
F9E8 : 2A F1    "* "    bpl  LF9DB
F9EA : 73 04 00    "s  "    com  X0400
F9ED : 7C 00 11    "|  "    inc  X0011
F9F0 : 2A E8    "* "    bpl  LF9DA
F9F2 : 39    "9"    rts
;*************************************;
;Scream 
;*************************************;
;SCREAM
F9F3 : CE 00 13    "   "    ldx  #$0013
;SCREM1:
F9F6 : 6F 00    "o "    clr  $00,x
F9F8 : 08    " "    inx
F9F9 : 8C 00 1B    "   "    cpx  #$001B
F9FC : 26 F8    "& "    bne  LF9F6
F9FE : 86 40    " @"    ldaa  #$40
FA00 : 97 13    "  "    staa  X0013
;SCREM2:
FA02 : CE 00 13    "   "    ldx  #$0013
FA05 : 86 80    "  "    ldaa  #$80
FA07 : 97 11    "  "    staa  X0011
FA09 : 5F    "_"    clrb
;SCREM3:
FA0A : A6 01    "  "    ldaa  $01,x
FA0C : AB 00    "  "    adda  $00,x
FA0E : A7 01    "  "    staa  $01,x
FA10 : 2A 02    "* "    bpl  LFA14
FA12 : DB 11    "  "    addb  X0011
;SCREM4:
FA14 : 74 00 11    "t  "    lsr  X0011
FA17 : 08    " "    inx
FA18 : 08    " "    inx
FA19 : 8C 00 1B    "   "    cpx  #$001B
FA1C : 26 EC    "& "    bne  LFA0A
FA1E : F7 04 00    "   "    stab  X0400
FA21 : 7C 00 12    "|  "    inc  X0012
FA24 : 26 DC    "& "    bne  LFA02
FA26 : CE 00 13    "   "    ldx  #$0013
FA29 : 5F    "_"    clrb
;SCREM5:
FA2A : A6 00    "  "    ldaa  $00,x
FA2C : 27 0B    "' "    beq  LFA39
FA2E : 81 37    " 7"    cmpa  #$37
FA30 : 26 04    "& "    bne  LFA36
FA32 : C6 41    " A"    ldab  #$41
FA34 : E7 02    "  "    stab  $02,x
;SCREM6:
FA36 : 6A 00    "j "    dec  $00,x
FA38 : 5C    "\"    incb
;SCREM7:
FA39 : 08    " "    inx
FA3A : 08    " "    inx
FA3B : 8C 00 1B    "   "    cpx  #$001B
FA3E : 26 EA    "& "    bne  LFA2A
FA40 : 5D    "]"    tstb
FA41 : 26 BF    "& "    bne  LFA02
FA43 : 39    "9"    rts
;*************************************;
;Organ Tune 
;*************************************;
;ORGANT
FA44 : 7A 00 08    "z  "    dec  X0008
FA47 : 39    "9"    rts
;ORGNT1:
FA48 : 7F 00 08    "   "    clr  X0008
FA4B : 97 11    "  "    staa  X0011
FA4D : CE FD AA    "   "    ldx  #$FDAA
;ORGNT2:
FA50 : A6 00    "  "    ldaa  $00,x
FA52 : 27 2D    "'-"    beq  LFA81
FA54 : 7A 00 11    "z  "    dec  X0011
FA57 : 27 06    "' "    beq  LFA5F
FA59 : 4C    "L"    inca
FA5A : BD FD 21    "  !"    jsr  LFD21
FA5D : 20 F1    "  "    bra  LFA50
;ORGNT3:
FA5F : 08    " "    inx
FA60 : DF 0F    "  "    stx  X000F
FA62 : BD FD 21    "  !"    jsr  LFD21
FA65 : DF 0D    "  "    stx  X000D
FA67 : DE 0F    "  "    ldx  X000F
;ORGNT4:
FA69 : A6 00    "  "    ldaa  $00,x
FA6B : 97 15    "  "    staa  X0015
FA6D : A6 01    "  "    ldaa  $01,x
FA6F : EE 02    "  "    ldx  $02,x
FA71 : DF 13    "  "    stx  X0013
FA73 : 8D 3E    " >"    bsr  LFAB3
FA75 : DE 0F    "  "    ldx  X000F
FA77 : 08    " "    inx
FA78 : 08    " "    inx
FA79 : 08    " "    inx
FA7A : 08    " "    inx
FA7B : DF 0F    "  "    stx  X000F
FA7D : 9C 0D    "  "    cpx  X000D
FA7F : 26 E8    "& "    bne  LFA69
;ORGNT5:
FA81 : 7E FD 0E    "~  "    jmp  LFD0E
;*************************************;
;*ORGAN NOTE loader - check this and ORGAN NOTE
;*************************************;
;ORGNLD
FA84 : 86 03    "  "    ldaa  #$03
FA86 : 97 08    "  "    staa  X0008
FA88 : 39         rts
;*************************************;
;*ORGAN NOTE
;*************************************;
;*4 BYTES(MODE,OSCILLATOR MASK HI+1,LO+1,NOTE#)
;ORGANN
FA89 : 7A 00 08   dec  $0008          ;decr addr 0008 (ORGFLG)
FA8C : 27 0C      beq  LFA9A          ;branch Z=1 ORGNN2
FA8E : D6 15      ldab  $15           ;load B with addr 15
FA90 : 58         aslb                ;arith shift left B
FA91 : 58         aslb                ;arith shift left B
FA92 : 58         aslb                ;arith shift left B
FA93 : 58         aslb                ;arith shift left B
FA94 : 1B         aba                 ;add B to A
FA95 : 97 15      staa  $15           ;store A in addr 15
FA97 : 4F         clra                ;clear A
;ORGNN1
FA98 : 20 FE      bra  LFA98          ;branch always ORGNN1
;ORGNN2
FA9A : 4A         deca                ;decr A
FA9B : 81 0B      cmpa  #$0B          ;compare B with 0Bh
FA9D : 23 01      bls  LFAA0          ;branch C+Z=1 ORGNN3
FA9F : 4F         clra                ;clear A
;ORGNN3
FAA0 : CE FE 41   ldx  #$FE41         ;load X with FE41h (NOTTAB)
FAA3 : BD FD 21   jsr  LFD21          ;jump sub ADDX
FAA6 : A6 00      ldaa  $00,x         ;load A with X+00h
FAA8 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
FAAB : DF 13      stx  $13            ;store X in addr 13
FAAD : 8D 04      bsr  LFAB3          ;branch sub ORGANL
;ORGNNX
FAAF : 8D 2A      bsr  LFADB          ;branch sub ORGAN
FAB1 : 20 FC      bra  LFAAF          ;branch always ORGNXX
;*************************************;
;Organ Loader
;*************************************;
;ORGANL
FAB3 : CE 00 16    "   "    ldx  #$0016
;LDLP:
FAB6 : 81 00    "  "    cmpa  #$00
FAB8 : 27 15    "' "    beq  LFACF
FABA : 81 03    "  "    cmpa  #$03
FABC : 27 09    "' "    beq  LFAC7
FABE : C6 01    "  "    ldab  #$01
FAC0 : E7 00    "  "    stab  $00,x
FAC2 : 08    " "    inx
FAC3 : 80 02    "  "    suba  #$02
FAC5 : 20 EF    "  "    bra  LFAB6
;LD2:
FAC7 : C6 91    "  "    ldab  #$91
FAC9 : E7 00    "  "    stab  $00,x
FACB : 6F 01    "o "    clr  $01,x
FACD : 08    " "    inx
FACE : 08    " "    inx
;LD1 - (stores 7E FADD jmp $FADD)
FACF : C6 7E    " ~"    ldab  #$7E
FAD1 : E7 00    "  "    stab  $00,x
FAD3 : C6 FA    "  "    ldab  #$FA
FAD5 : E7 01    "  "    stab  $01,x
FAD7 : C6 DD    "  "    ldab  #$DD
FAD9 : E7 02    "  "    stab  $02,x
;*************************************;
;Organ Routine 
;*************************************;
;DUR=DURATION, OSCILLATOR MASK
;ORGAN
FADB : DE 13    "  "    ldx  X0013
;ORGAN1 
FADD : 4F    "O"    clra
FADE : F6 00 12    "   "    ldab  X0012
FAE1 : 5C    "\"    incb
FAE2 : D7 12    "  "    stab  X0012
FAE4 : D4 15    "  "    andb  X0015
FAE6 : 54    "T"    lsrb
FAE7 : 89 00    "  "    adca  #$00
FAE9 : 54    "T"    lsrb
FAEA : 89 00    "  "    adca  #$00
FAEC : 54    "T"    lsrb
FAED : 89 00    "  "    adca  #$00
FAEF : 54    "T"    lsrb
FAF0 : 89 00    "  "    adca  #$00
FAF2 : 54    "T"    lsrb
FAF3 : 89 00    "  "    adca  #$00
FAF5 : 54    "T"    lsrb
FAF6 : 89 00    "  "    adca  #$00
FAF8 : 54    "T"    lsrb
FAF9 : 89 00    "  "    adca  #$00
FAFB : 1B    " "    aba
FAFC : 48    "H"    asla
FAFD : 48    "H"    asla
FAFE : 48    "H"    asla
FAFF : 48    "H"    asla
FB00 : B7 04 00    "   "    staa  X0400
FB03 : 09    " "    dex
FB04 : 27 03    "' "    beq  LFB09
FB06 : 7E 00 16    "~  "    jmp  L0016
;ORGAN2:
FB09 : 39    "9"    rts
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
FB0A : 36    "6"    psha
FB0B        LFB0B:
FB0B : A6 00    "  "    ldaa  $00,x
FB0D : DF 0D    "  "    stx  X000D
FB0F : DE 0F    "  "    ldx  X000F
FB11 : A7 00    "  "    staa  $00,x
FB13 : 08    " "    inx
FB14 : DF 0F    "  "    stx  X000F
FB16 : DE 0D    "  "    ldx  X000D
FB18 : 08    " "    inx
FB19 : 5A    "Z"    decb
FB1A : 26 EF    "& "    bne  LFB0B
FB1C : 32    "2"    pula
FB1D : 39    "9"    rts
;*************************************;
;Background End Routine 
;*************************************;
;BGEND
FB1E : 4F    "O"    clra
FB1F : 97 04    "  "    staa  X0004
FB21 : 97 05    "  "    staa  X0005
FB23 : 39    "9"    rts
;*************************************;
;Background Sound #2 increment 
;*************************************;
;BG2INC
FB24 : 7F 00 04    "   "    clr  X0004
FB27 : 96 05    "  "    ldaa  X0005
FB29 : 84 7F    "  "    anda  #$7F
FB2B : 81 1D    "  "    cmpa  #$1D
FB2D : 26 01    "& "    bne  LFB30
FB2F : 4F    "O"    clra
FB30        LFB30:
FB30 : 4C    "L"    inca
FB31 : 97 05    "  "    staa  X0005
FB33 : 39    "9"    rts
;*************************************;
;Background 2 Routine 
;*************************************;
;BG2
FB34 : 86 0E    "  "    ldaa  #$0E
FB36 : BD FB 81    "   "    jsr  LFB81
FB39 : 96 05    "  "    ldaa  X0005
FB3B : 48    "H"    asla
FB3C : 48    "H"    asla
FB3D : 43    "C"    coma
FB3E : BD FC 39    "  9"    jsr  LFC39
FB41        LFB41:
FB41 : 7C 00 17    "|  "    inc  X0017
FB44 : BD FC 3B    "  ;"    jsr  LFC3B
FB47 : 20 F8    "  "    bra  LFB41
;*************************************;
;Spinner #1 Sound 
;*************************************;
;SP1
FB49 : 86 03    "  "    ldaa  #$03
FB4B : BD F8 2A    "  *"    jsr  LF82A
FB4E : D6 06    "  "    ldab  X0006
FB50 : C1 1F    "  "    cmpb  #$1F
FB52 : 26 01    "& "    bne  LFB55
FB54 : 5F    "_"    clrb
;SP1A:
FB55 : 5C    "\"    incb
FB56 : D7 06    "  "    stab  X0006
FB58 : 86 20    "  "    ldaa  #$20
FB5A : 10    " "    sba
FB5B : 5F    "_"    clrb
;SP11:
FB5C : 81 14    "  "    cmpa  #$14
FB5E : 23 05    "# "    bls  LFB65
FB60 : CB 0E    "  "    addb  #$0E
FB62 : 4A    "J"    deca
FB63 : 20 F7    "  "    bra  LFB5C
;SP12:
FB65 : CB 05    "  "    addb  #$05
FB67 : 4A    "J"    deca
FB68 : 26 FB    "& "    bne  LFB65
FB6A : D7 13    "  "    stab  X0013
;SP1LP:
FB6C : BD F8 3F    "  ?"    jsr  LF83F
FB6F : 20 FB    "  "    bra  LFB6C
;*************************************;
;Laser Ball Bonus #2 
;*************************************;
;BON2
FB71 : 96 07    "  "    ldaa  X0007
FB73 : 26 09    "& "    bne  LFB7E
FB75 : 7C 00 07    "|  "    inc  X0007
FB78 : 86 0D    "  "    ldaa  #$0D
FB7A : 8D 05    "  "    bsr  LFB81
FB7C : 20 69    " i"    bra  LFBE7
;BON21:
FB7E : 7E FC 2E    "~ ."    jmp  LFC2E
;*************************************;
;GWAVE Loader 
;*************************************;
;GWLD:
FB81 : 16    " "    tab
FB82 : 58    "X"    aslb
FB83 : 1B    " "    aba
FB84 : 1B    " "    aba
FB85 : 1B    " "    aba
FB86 : CE FE EC    "   "    ldx  #$FEEC
FB89 : BD FD 21    "  !"    jsr  LFD21
FB8C : A6 00    "  "    ldaa  $00,x
FB8E : 16    " "    tab
FB8F : 84 0F    "  "    anda  #$0F
FB91 : 97 14    "  "    staa  X0014
FB93 : 54    "T"    lsrb
FB94 : 54    "T"    lsrb
FB95 : 54    "T"    lsrb
FB96 : 54    "T"    lsrb
FB97 : D7 13    "  "    stab  X0013
FB99 : A6 01    "  "    ldaa  $01,x
FB9B : 16    " "    tab
FB9C : 54    "T"    lsrb
FB9D : 54    "T"    lsrb
FB9E : 54    "T"    lsrb
FB9F : 54    "T"    lsrb
FBA0 : D7 15    "  "    stab  X0015
FBA2 : 84 0F    "  "    anda  #$0F
FBA4 : 97 11    "  "    staa  X0011
FBA6 : DF 0B    "  "    stx  X000B
FBA8 : CE FE 4D    "  M"    ldx  #$FE4D
;GWLD2:
FBAB : 7A 00 11    "z  "    dec  X0011
FBAE : 2B 08    "+ "    bmi  LFBB8
FBB0 : A6 00    "  "    ldaa  $00,x
FBB2 : 4C    "L"    inca
FBB3 : BD FD 21    "  !"    jsr  LFD21
FBB6 : 20 F3    "  "    bra  LFBAB
;GWLD3:
FBB8 : DF 18    "  "    stx  X0018
FBBA : BD FC 75    "  u"    jsr  LFC75
FBBD : DE 0B    "  "    ldx  X000B
FBBF : A6 02    "  "    ldaa  $02,x
FBC1 : 97 1A    "  "    staa  X001A
FBC3 : BD FC 87    "   "    jsr  LFC87
FBC6 : DE 0B    "  "    ldx  X000B
FBC8 : A6 03    "  "    ldaa  $03,x
FBCA : 97 16    "  "    staa  X0016
FBCC : A6 04    "  "    ldaa  $04,x
FBCE : 97 17    "  "    staa  X0017
FBD0 : A6 05    "  "    ldaa  $05,x
FBD2 : 16    " "    tab
FBD3 : A6 06    "  "    ldaa  $06,x
FBD5 : CE FF 55    "  U"    ldx  #$FF55
FBD8 : BD FD 21    "  !"    jsr  LFD21
FBDB : 17    " "    tba
FBDC : DF 1B    "  "    stx  X001B
FBDE : 7F 00 23    "  #"    clr  X0023
FBE1 : BD FD 21    "  !"    jsr  LFD21
FBE4 : DF 1D    "  "    stx  X001D
FBE6 : 39    "9"    rts
;*************************************;
;GWAVE routine 
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
FBE7 : 96 13    "  "    ldaa  X0013
FBE9 : 97 22    " ""    staa  X0022
;GWT4:
FBEB : DE 1B    "  "    ldx  X001B
FBED : DF 0D    "  "    stx  X000D
;GPLAY:
FBEF : DE 0D    "  "    ldx  X000D
FBF1 : A6 00    "  "    ldaa  $00,x
FBF3 : 9B 23    " #"    adda  X0023
FBF5 : 97 21    " !"    staa  X0021
FBF7 : 9C 1D    "  "    cpx  X001D
FBF9 : 27 26    "'&"    beq  LFC21
FBFB : D6 14    "  "    ldab  X0014
FBFD : 08    " "    inx
FBFE : DF 0D    "  "    stx  X000D
;GOUT:
FC00 : CE 00 24    "  $"    ldx  #$0024
;GOUTLP:
FC03 : 96 21    " !"    ldaa  X0021
;GPRLP:
FC05 : 4A    "J"    deca
FC06 : 26 FD    "& "    bne  LFC05
FC08 : A6 00    "  "    ldaa  $00,x
FC0A : B7 04 00    "   "    staa  X0400
;GPR1
FC0D : 08    " "    inx
FC0E : 9C 1F    "  "    cpx  X001F
FC10 : 26 F1    "& "    bne  LFC03
FC12 : 5A    "Z"    decb
FC13 : 27 DA    "' "    beq  LFBEF
FC15 : 08    " "    inx
FC16 : 09    " "    dex
FC17 : 08    " "    inx
FC18 : 09    " "    dex
FC19 : 08    " "    inx
FC1A : 09    " "    dex
FC1B : 08    " "    inx
FC1C : 09    " "    dex
FC1D : 01    " "    nop
FC1E : 01    " "    nop
FC1F : 20 DF    "  "    bra  LFC00
;GEND
FC21 : 96 15    "  "    ldaa  X0015
FC23 : 8D 62    " b"    bsr  LFC87
FC25 : 7A 00 22    "z ""    dec  X0022
FC28 : 26 C1    "& "    bne  LFBEB
FC2A : 96 07    "  "    ldaa  X0007
FC2C : 26 46    "&F"    bne  LFC74
;GEND50:
FC2E : 96 16    "  "    ldaa  X0016
FC30 : 27 42    "'B"    beq  LFC74
FC32 : 7A 00 17    "z  "    dec  X0017
FC35 : 27 3D    "'="    beq  LFC74
FC37 : 9B 23    " #"    adda  X0023
;GEND60:
FC39 : 97 23    " #"    staa  X0023
;GEND61:
FC3B : DE 1B    "  "    ldx  X001B
FC3D : 5F    "_"    clrb
;GW0:
FC3E : 96 23    " #"    ldaa  X0023
FC40 : 7D 00 16    "}  "    tst  X0016
FC43 : 2B 06    "+ "    bmi  LFC4B
FC45 : AB 00    "  "    adda  $00,x
FC47 : 25 08    "% "    bcs  LFC51
FC49 : 20 0B    "  "    bra  LFC56
;GW1
FC4B : AB 00    "  "    adda  $00,x
FC4D : 27 02    "' "    beq  LFC51
FC4F : 25 05    "% "    bcs  LFC56
;GW2:
FC51 : 5D    "]"    tstb
FC52 : 27 08    "' "    beq  LFC5C
FC54 : 20 0F    "  "    bra  LFC65
;GW2A:
FC56 : 5D    "]"    tstb
FC57 : 26 03    "& "    bne  LFC5C
FC59 : DF 1B    "  "    stx  X001B
FC5B : 5C    "\"    incb
;GW2B:
FC5C : 08    " "    inx
FC5D : 9C 1D    "  "    cpx  X001D
FC5F : 26 DD    "& "    bne  LFC3E
FC61 : 5D    "]"    tstb
FC62 : 26 01    "& "    bne  LFC65
FC64 : 39    "9"    rts
;GW3
FC65 : DF 1D    "  "    stx  X001D
FC67 : 96 15    "  "    ldaa  X0015
FC69 : 27 06    "' "    beq  LFC71
FC6B : 8D 08    "  "    bsr  LFC75
FC6D : 96 1A    "  "    ldaa  X001A
FC6F : 8D 16    "  "    bsr  LFC87
;GEND0:
FC71 : 7E FB E7    "~  "    jmp  LFBE7
;GEND1:
FC74 : 39    "9"    rts
;*************************************;
;Wave Transfer Routine 
;*************************************;
;WVTRAN
FC75 : CE 00 24    "  $"    ldx  #$0024
FC78 : DF 0F    "  "    stx  X000F
FC7A : DE 18    "  "    ldx  X0018
FC7C : E6 00    "  "    ldab  $00,x
FC7E : 08    " "    inx
FC7F : BD FB 0A    "   "    jsr  LFB0A
FC82 : DE 0F    "  "    ldx  X000F
FC84 : DF 1F    "  "    stx  X001F
FC86 : 39    "9"    rts
;*************************************;
;Wave Decay Routinue 
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
FC87 : 4D    "M"    tsta
FC88 : 27 2B    "'+"    beq  LFCB5
FC8A : DE 18    "  "    ldx  X0018
FC8C : DF 0D    "  "    stx  X000D
FC8E : CE 00 24    "  $"    ldx  #$0024
FC91 : 97 12    "  "    staa  X0012
;WVDLP:
FC93 : DF 0F    "  "    stx  X000F
FC95 : DE 0D    "  "    ldx  X000D
FC97 : D6 12    "  "    ldab  X0012
FC99 : D7 11    "  "    stab  X0011
FC9B : E6 01    "  "    ldab  $01,x
FC9D : 54    "T"    lsrb
FC9E : 54    "T"    lsrb
FC9F : 54    "T"    lsrb
FCA0 : 54    "T"    lsrb
FCA1 : 08    " "    inx
FCA2 : DF 0D    "  "    stx  X000D
FCA4 : DE 0F    "  "    ldx  X000F
FCA6 : A6 00    "  "    ldaa  $00,x
;WVDLP1:
FCA8 : 10    " "    sba
FCA9 : 7A 00 11    "z  "    dec  X0011
FCAC : 26 FA    "& "    bne  LFCA8
FCAE : A7 00    "  "    staa  $00,x
FCB0 : 08    " "    inx
FCB1 : 9C 1F    "  "    cpx  X001F
FCB3 : 26 DE    "& "    bne  LFC93
;WVDCX:
FCB5 : 39         rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FCB6 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
FCB9 : B6 04 02   ldaa  $0402         ;load A with addr 0402 (PIA sound select)(
FCBC : 0E         cli                 ;clear interrupt (I=0) (NOW ALLOW IRQS)
FCBD : 43         coma                ;complement 1s A (INVERT INPUT)
FCBE : 84 1F      anda  #$1F          ;and A with 1F (MASK GARB) (0001 1111)
FCC0 : D6 08      ldab  $08           ;load B with at addr 08(ORGFLG)
FCC2 : 27 09      beq  LFCCD          ;branch Z=1 IRQ2
FCC4 : 2A 03      bpl  LFCC9          ;branch N=0 IRQ1
FCC6 : BD FA 48   jsr  LFA48          ;jump sub ORGNT1 (ORGAN TUNE)
;IRQ1
FCC9 : 4A         deca                ;decr A
FCCA : BD FA 89   jsr  LFA89          ;jump sub ORGANN
;IRQ2
FCCD : 5F         clrb                ;clear B
FCCE : 81 0E      cmpa  #$0E          ;compare A with 0Eh (#SP1SND)
FCD0 : 27 02      beq  LFCD4          ;branch Z=1 IRQ3
FCD2 : D7 06      stab  $06           ;store B in addr 06 (SP1FLG)
;IRQ3
FCD4 : 81 12      cmpa  #$12          ;compare A with 12h (#B2SND)
FCD6 : 27 02      beq  LFCDA          ;branch Z=1 IRQ4
FCD8 : D7 07      stab  $07           ;store B in addr 07 (B2FLG)
;IRQ4 - check for Speech ROM (erroneously, or at one time considered?)
FCDA : F6 EF FD   ldab  $EFFD         ;load B with EFFDh (Speech ROM)
FCDD : C1 7E      cmpb  #$7E          ;compare B with 7Eh (7E jmp opcode)
FCDF : 26 03      bne  LFCE4          ;branch Z=0 IRQ5
FCE1 : BD EF FD   jsr  LEFFD          ;jump sub TALK (Speech ROM)
;IRQ5
FCE4 : 4D         tsta                ;test A 
FCE5 : 27 27      beq  LFD0E          ;branch Z=1 IRQ8(INVALID INPUT)
FCE7 : 4A         deca                ;decr A (REMOVE OFFSET)
FCE8 : 81 0C      cmpa  #$0C          ;compare A with 0Ch
FCEA : 22 08      bhi  LFCF4          ;branch C+Z=0 IRQ6
FCEC : BD FB 81   jsr  LFB81          ;jump sub GWLD
FCEF : BD FB E7   jsr  LFBE7          ;jump sub GWAVE
FCF2 : 20 1A      bra  LFD0E          ;branch always IRQ8
;IRQ6
FCF4 : 81 1B      cmpa  #$1B          ;compare A with 1Bh (SPECIAL SOUND?)
FCF6 : 22 0E      bhi  LFD06          ;branch C+Z=0 IRQ7 (VARI SOUND)
FCF8 : 80 0D      suba  #$0D          ;sub A with 0Dh (SUB OFFSET)
FCFA : 48         asla                ;arith shift left A (DOUBLE FOR ADDRESSING)
FCFB : CE FD 58   ldx  #$FD58         ;load X with FD58h (#JMPTBL)(INDEX TO JUMP TABLE)
FCFE : 8D 21      bsr  LFD21          ;branch sub ADDX (GET CORRECT INDEX)
FD00 : EE 00      ldx  $00,x          ;load X with X+00h (GET ADDRESS TO INDEX)
FD02 : AD 00      jsr  $00,x          ;jump sub X+00h (PERFORM IT)
FD04 : 20 08      bra  LFD0E          ;branch always IRQ8
;IRQ7
FD06 : 80 1C      suba  #$1C          ;sub A with 1Ch
FD08 : BD F8 2A   jsr  LF82A          ;jump sub VARILD
FD0B : BD F8 3F   jsr  LF83F          ;jump sub VARI
;IRQ8
FD0E : 96 04      ldaa  $04           ;load A with addr 04 (BG1FLG)(BGROUND ACTIVE)
FD10 : 9A 05      oraa  $05           ;or A with addr 05 (B2FLG)
;IRQ9
FD12 : 27 FE      beq  LFD12          ;branch Z=1 IRQ9 (NOPE)
FD14 : 4F         clra                ;clear A 
FD15 : 97 07      staa  $07           ;store A in addr 07 (B2FLG)(KILL BONUSES)
FD17 : 96 04      ldaa  $04           ;load A with addr 04(BG1FLG)
FD19 : 27 03      beq  LFD1E          ;branch Z=1 IRQX
FD1B : 7E F9 13   jmp  LF913          ;jump BG1
;IRQX
FD1E : 7E FB 34   jmp  LFB34          ;jump BG2
;*************************************;
;Add A to Index Register 
;*************************************;
;ADDX
FD21 : DF 0D      stx  $0D            ;store X in addr 0D (XPLAY)
FD23 : 9B 0E      adda  $0E           ;add A with addr 0E (XPLAY+1)
FD25 : 97 0E      staa  $0E           ;store A in addr 0E (XPLAY+1)
FD27 : 24 03      bcc  LFD2C          ;branch C=0 ADDX1
FD29 : 7C 00 0D   inc  $000D          ;incr addr 000D (XPLAY)
;ADDX1
FD2C : DE 0D      ldx  $0D            ;load X with addr 0D (XPLAY)
FD2E : 39         rts                 ;return subroutine
;*************************************;
;Diagnostic Processing Here 
;*************************************;
;NMI
FD2F : 0F         sei                 ;set interrupt mask
FD30 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
FD33 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
FD36 : 5F         clrb                ;clear B
;NMI1
FD37 : E9 00      adcb  $00,x         ;add C+B + X+00h
FD39 : 09         dex                 ;decr X
FD3A : 8C F8 00   cpx  #$F800         ;compare X with F800h 
FD3D : 26 F8      bne  LFD37          ;branch Z=0 NMI1
FD3F : E1 00      cmpb  $00,x         ;compare B with addr X+00h
FD41 : 27 01      beq  LFD44          ;branch Z=1 NMI2
FD43 : 3E         wai                 ;wait interrupts, PC+1
;NMI2
FD44 : 86 01      ldaa  #$01          ;load A with 01h 
FD46 : BD F8 2A   jsr  LF82A          ;jump sub VARILD
FD49 : BD F8 3F   jsr  LF83F          ;jump sub VARI
; looking for Speech ROM
FD4C : F6 EF FA   ldab  $EFFA         ;load B with addr EFFA (Speech ROM)
FD4F : C1 7E      cmpb  #$7E          ;compare B with 7Eh (7E jmp opcode)
FD51 : 26 DC      bne  LFD2F          ;branch Z=0 NMI
FD53 : BD EF FA   jsr  LEFFA          ;jump sub TALK (Speech ROM)
FD56 : 20 D7      bra  LFD2F          ;branch always NMI
;*************************************;
;Special Routine Jump Table
;*************************************;
;JMPTBL
FD58 : FB 49                          ;SP1
FD5A : F9 13                          ;BG1
FD5C : FB 24                          ;BG2INC
FD5E : F8 8C                          ;LITE
FD60 : FB 71                          ;BON2
FD62 : FB 1E                          ;BGEND
FD64 : F8 CD                          ;TURBO
FD66 : F8 94                          ;APPEAR
FD68 : F9 1C                          ;THRUST
FD6A : F9 23                          ;CANNON
FD6C : F9 A6                          ;RADIO
FD6E : F9 D4                          ;HYPER
FD70 : F9 F3                          ;SCREAM
FD72 : FA 44                          ;ORGANT
FD74 : FA 84                          ;ORGNLD
;*************************************;
;VARI VECTORS
;*************************************;
;VVECT EQU *
FD76 : 40 01 00 10 E1 00 80 FF FF     ;SAW
FD7F : 28 01 00 08 81 02 00 FF FF     ;FOSHIT 
FD88 : 28 81 00 FC 01 02 00 FC FF     ;QUASAR
FD91 : FF 01 00 18 41 04 80 00 FF     ;CABSHK 
;*************************************;
;Radio Sound Waveform
;*************************************;
FD9A : 8C 5B B6 40 BF 49 A4 73        ;RADSND
FDA2 : 73 A4 49 BF 40 B6 5B 8C        ;
;*************************************;
;Organ Tune Table
;*************************************;
; Oscillator Mask(1), Delay(1), Duration(2)
;ORGTAB
;PHANTOM
FDAA : 0C                             ;FCB 3*4
;
FDAB : 7F 1D 0F FB                    ;$7F1D,TD/PHANC/2*1       D2  1/4 NOTE
FDAF : 7F 23 0F 15                    ;$7F23,TCS/PHANC/2*1      CS2 1/4 NOTE 
FDB3 : FE 08 50 8B                    ;$FE08,(TFS/PHANC/1*1)*2  FS1 1   NOTE
;
;TACCATA
FDB7 : 88                             ;FCB 34*4
FDB8 : 3E 3F 02 3E                    ;$3E3F,TA/TACC/8*1      A3  1/16 NOTE
FDBC : 7C 04 03 FF                    ;$7C04,TG/TACC/8*1      G2  1/16 NOTE 
FDC0 : 3E 3F 2C E2                    ;$3E3F,TA/TACC/2*5      A3  5/4  NOTE 
FDC4 : 7C 12 0D 74                    ;$7C12,TE/TACC/2*1      E2  1/4  NOTE 
FDC8 : 7C 0D 0E 41                    ;$7C0D,TF/TACC/2*1      F2  1/4  NOTE 
FDCC : 7C 23 0B 50                    ;$7C23,TCS/TACC/2*1     CS2 1/4  NOTE 
FDD0 : 7C 1D 29 F2                    ;$7C1D,TD/TACC/4*7      D2  7/8  NOTE 
FDD4 : 7C 3F 02 3E                    ;$7C3F,TA/TACC/8*1      A2  1/16 NOTE
FDD8 : F8 04 03 FF                    ;$F804,TG/TACC/8*1      G1  1/16 NOTE
FDDC : 7C 3F 2C E2                    ;$7C3F,TA/TACC/2*5      A2  5/4  NOTE
FDE0 : F8 12 0D 74                    ;$F812,TE/TACC/2*1      E1  1/4  NOTE 
FDE4 : F8 0D 0E 41                    ;$F80D,TF/TACC/2*1      F1  1/4  NOTE 
FDE8 : F8 23 0B 50                    ;$F823,TCS/TACC/2*1     CS1 1/4  NOTE 
FDEC : F8 1D 2F F2                    ;$F81D,(TD/TACC/1*1)*2  D1  1    NOTE 
FDF0 : F8 23 05 A8                    ;$F823,TCS/TACC/4*1     CS1 1/8  NOTE
FDF4 : F8 12 06 BA                    ;$F812,TE/TACC/4*1      E1  1/8  NOTE
FDF8 : F8 04 07 FF                    ;$F804,TG/TACC/4*1      G1  1/8  NOTE
FDFC : 7C 37 04 C1                    ;$7C37,TBF/TACC/4*1     BF2 1/8  NOTE 
FE00 : 7C 23 05 A8                    ;$7C23,TCS/TACC/4*1     CS2 1/8  NOTE 
FE04 : 7C 12 06 BA                    ;$7C12,TE/TACC/4*1      E2  1/8  NOTE 
FE08 : 3E 04 07 FF                    ;$3E04,TG/TACC/4*1      G3  1/8  NOTE
FE0C : 3E 37 04 C1                    ;$3E37,TBF/TACC/4*1     BF3 1/8  NOTE 
FE10 : 3E 23 05 A8                    ;$3E23,TCS/TACC/4*1     CS3 1/8  NOTE 
FE14 : 1F 12 06 BA                    ;$1F12,TE/TACC/4*1      E4  1/8  NOTE
FE18 : 1F 04 07 FF                    ;$1F04,TG/TACC/4*1      G4  1/8  NOTE 
FE1C : 1F 37 04 C1                    ;$1F37,TBF/TACC/4*1     BF4 1/8  NOTE 
FE20 : 1F 23 16 A0                    ;$1F23,TCS/TACC/1*1     CS4 1/2  NOTE 
FE24 : FE 1D 17 F9                    ;$FE1D,TD/TACC/1*1      D1  1/2  NOTE 
FE28 : 7F 37 13 06                    ;$7F37,TBF/TACC/1*1     BF2 1/2  NOTE 
FE2C : 7F 3F 08 FA                    ;$7F3F,TA/TACC/2*1      A2  1/4  NOTE
FE30 : FE 04 0F FF                    ;$FE04,TG/TACC/2*1      G1  1/4  NOTE
FE34 : FE 0D 0E 41                    ;$FE0D,TF/TACC/2*1      F1  1/4  NOTE
FE38 : FE 23 0B 50                    ;$FE23,TCS/TACC/2*1     CS1 1/4  NOTE 
FE3C : FE 1D 5F E4                    ;$FE1D,(TD/TACC/1*2)*2  D1  2    NOTE 
FE40 : 00                             ;LAST TUNE 
;*************************************;
;Organ Note Table
;*************************************;
;NOTTAB
FE41 : 47 3F 37 30 29 23              ;
;note  AF A  BF B  C  CS
FE47 : 1D 17 12 0D 08 04              ;
;note  D  E  FE F  FS G
;*************************************;
;GWVTAB - Wave table, 1st byte wavelength
;*************************************;
FE4D : 08                             ;GS2
FE4E : 7F D9 FF D9 7F 24 00 24        ;
;
FE56 : 08                             ;GSSQR2
FE57 : 00 40 80 00 FF 00 80 40        ;
;
FE5F : 10                             ;GS1
FE60 : 7F B0 D9 F5 FF F5 D9 B0        ;
FE68 : 7F 4E 24 09 00 09 24 4E        ;
;
FE70 : 10                             ;GS12
FE71 : 7F C5 EC E7 BF 8D 6D 6A        ;
FE79 : 7F 94 92 71 40 17 12 39        ;
;
FE81 : 10                             ;GSQ22
FE82 : FF FF FF FF 00 00 00 00        ;
FE8A : FF FF FF FF 00 00 00 00        ;
;
FE92 : 48                             ;GS72
FE93 : 8A 95 A0 AB B5 BF C8 D1        ;
FE9B : DA E1 E8 EE F3 F7 FB FD        ;
FEA3 : FE FF FE FD FB F7 F3 EE        ;
FEAB : E8 E1 DA D1 C8 BF B5 AB        ;
FEB3 : A0 95 8A 7F 75 6A 5F 54        ;
FEBB : 4A 40 37 2E 25 1E 17 11        ;
FEC3 : 0C 08 04 02 01 00 01 02        ;
FECB : 04 08 0C 11 17 1E 25 2E        ;
FED3 : 37 40 4A 54 5F 6A 75 7F        ;
;
FEDB : 10                             ;GS1.7
FEDC : 59 7B 98 AC B3 AC 98 7B        ;
FEE4 : 59 37 19 06 00 06 19 37        ;
;*************************************;
;GWAVE SOUND VECTOR TABLE
;*************************************;
;b0 GECHO,GCCNT
;b1 GECDEC,WAVE#
;b2 PREDECAY FACTOR
;b3 GDFINC
;b4 VARIABLE FREQ COUNTER
;b5 FREQ PATTERN LENGTH
;b6 FREQ PATTERN OFFSET
;SVTAB *
;HBDSND-GFRTAB 1
FEEC : 81 24 00 00 00 16 31           ;HBDV 
;STDSND-GFRTAB 2
FEF3 : 12 05 1A FF 00 27 6D           ;STDV 
;SWPAT-GFRTAB 3
FEFA : 11 05 11 01 0F 01 47           ;DP1V
;SPNSND-GFRTAB 4
FF01 : 11 31 00 01 00 0D 1B           ;XBV
;BBSND-GFRTAB 5
FF08 : F4 12 00 00 00 14 47           ;BBSV
;HBESND-GFRTAB 6
FF0F : 41 45 00 00 00 0F 5B           ;HBEV
;SPNSND-GFRTAB 7
FF16 : 21 35 11 FF 00 0D 1B           ;PROTV
;SPNR-GFRTAB 8
FF1D : 15 00 00 FD 00 01 69           ;SPNRV
;COOLDN-GFRTAB 9
FF24 : 31 11 00 01 00 03 6A           ;CLDWNV
;BBSND-GFRTAB 10
FF2B : 01 15 01 01 01 01 47           ;SV3
;ED10FP-GFRTAB 11 
FF32 : F6 53 03 00 02 06 94           ;ED10
;ED13FP-GFRTAB 12
FF39 : 6A 10 02 00 02 06 9A           ;ED12
;SPNR-GFRTAB 13
FF40 : 1F 12 00 FF 10 04 69           ;ED17
;BONSND-GFRTAB
FF47 : 31 11 00 FF 00 0D 00           ;BONV
;TRBPAT-GFRTAB
FF4E : 12 06 00 FF 01 09 28           ;TRBV
;*************************************;
;GFRTAB - GWAVE FREQ PATTERN TABLE
;*************************************; 
;Bonus Sound
FF55 : A0 98 90 88 80 78 70 68        ;BONSND
FF5D : 60 58 50 44 40                 ;
;Hundred Point Sound
FF62 : 01 01 02 02 04 04 08 08        ;HBTSND
FF6A : 10 10 30 60 C0 E0              ;
;Spinner Sound
FF70 : 01 01 02 02 03 04 05 06        ;SPNSND
FF78 : 07 08 09 0A 0C                 ;
;Turbine Start Up
FF7D : 80 7C 78 74 70 74 78 7C        ;TRBPAT
FF85 : 80                             ;
;Heartbeat Distorto 
FF86 : 01 01 02 02 04 04 08 08        ;HBDSND
FF8E : 10 20 28 30 38 40 48 50        ;
FF96 : 60 70 80 A0 B0 C0              ;
;*
;SWPAT - SWEEP PATTERN
;*
;BigBen Sounds
FF9B : 08 40 08 40 08 40 08 40        ;BBSND
FFA4 : 08 40 08 40 08 40 08 40        ;
FFAC : 08 40 08 40                    ;
;Heartbeat Echo
FFB0 : 01 02 04 08 09 0A 0B 0C        ;HBESND
FFB8 : 0E 0F 10 12 14 16              ;
;Spinner Sound "Drip"
FFBE : 40                             ;SPNR
;Cool Downer
FFBF : 10 08 01                       ;COOLDN 
;Start Distorto Sound
FFC2 : 01 01 01 01 02 02 03 03        ;STDSND 
FFCA : 04 04 05 06 08 0A 0C 10        ;
FFD2 : 14 18 20 30 40 50 40 30        ;
FFDA : 20 10 0C 0A 08 07 06 05        ;
FFE2 : 04 03 02 02 01 01 01           ;
;Ed's Sound 10
FFE9 : 07 08 09 0A 0C 08              ;ED10FP
;Ed's Sound 13
FFEF : 17 18 19 1A 1B 1C              ;ED13FP
;zero padding
FFF5 : 00 00 00                       ;MATCH THE PROMS
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FC B6                          ;IRQ 
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FD 2F                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------




