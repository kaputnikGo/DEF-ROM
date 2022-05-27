        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Thunderball.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  A229
        ;  CRC-32:    CC70AF52
        ;
        ;  Date:    Sun May 02 11:01:54 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; May 1982, 10 made, no production run, has 4 speech ROMS, unknown Sound ROM number
        ; DAC sound 0400
        ;
        ;Speech entry ROM IC4 
        ;
        ; updated 09 June 2021
        ;
        ;
;*
;*SYSTEM CONSTANTS
;*
ROM      EQU  $F000
SOUND    SET  $400
CKORG    EQU  $EF00     ;CHECKSUM PROG ORG
ENDRAM   SET  $7F
VECTOR   EQU  $FFF8     ;RESET,INT VECTORS
WVELEN   EQU  72
BG2MAX   EQU  29
SP1SND   EQU  $0E      ;SPINNER SOUND #1 CODE
B2SND    EQU  $12      ;BONUS SOUND #2 CODE
SP1MAX   EQU  32
;*
;* TALKING EQUATES
;*
TALK     EQU  $EFFD    ;ENTRY TO TALKING         : SPEECH ROM ADDR
TALKD    EQU  $EFFA    ;ENTRY FOR DIAGNOSTICS    :  "      "    "
;*
;*GLOBALS (not properly sorted yet, TLKGL is probs)
;*
         ORG  0        ;DESCRIPTION              : ADDR
TLKGL    RMB  4        ;TALKING GLOBALS          : 0000-0003
BG1FLG   RMB  1        ;BACKGROUND SOUND 1       : 0004
SP1FLG   RMB  1        ;SPINNER FLAG             : 0005
BG2FLG   RMB  1        ;BACKGROUND SOUND 2       : 0006
B2FLG    RMB  1        ;BONUS #2 FLAG            : 0007
ORGFLG   RMB  1        ;ORGAN FLAG               : 0008 <-- not used
HI       RMB  1        ;RANDOM SEED              : 0009
LO       RMB  1        ;RANDOM SEED              : 000A
 ??                    ;                         : 000B <-- for WSM?
;*
;*TEMPORARIES
;*
TMPRAM   EQU  *        ;TEMPORARY RAM
TEMPX    RMB  2        ;X TEMPS                  : 000C-000D
XPLAY    RMB  2        ;                         : 000E-000F
XPTR     RMB  2        ;                         : 0010-0011
TEMPA    RMB  1        ;ACCA TEMP                : 0012
TEMPB    RMB  1        ;                         : 0013
LOCRAM   EQU  *
;*
;*GWAVE PARAMETERS
;*
         ORG  LOCRAM
GECHO    RMB  1        ;ECHO FLAG                : 0014
GCCNT    RMB  1        ;CYCLE COUNT              : 0015
GECDEC   RMB  1        ;# OF DECAYS PER ECHO     : 0016
GDFINC   RMB  1        ;DELTA FREQ INC           : 0017
GDCNT    RMB  1        ;DELTA FREQ COUNT         : 0018
GWFRM    RMB  2        ;WAVEFORM ADDRESS         : 0019-001A
;*TEMPORARY OR COMPUTED PARAMETERS
PRDECA   RMB  1        ;PRE-DECAY FACTOR         : 001B
GWFRQ    RMB  2        ;FREQ TABLE ADDR          : 001C-001D
FRQEND   RMB  2        ;END ADDR FREQ TABLE      : 001E-001F
WVEND    RMB  2        ;WAVE END ADDR            : 0020-0021
GPER     RMB  1        ;PERIOD                   : 0022
GECNT    RMB  1        ;# OF ECHOES COUNTER      : 0023
FOFSET   RMB  1        ;FREQUENCY OFFSET         : 0024
;*
;*GWAVE TABLES
;*
GWTAB    RMB  WVELEN   ;WAVE TABLE               : 0024-006C (32d+72d=104d)
;*
;*VARIWAVE PARAMETERS
;*
         ORG  LOCRAM
LOPER    RMB  1        ;LO PERIOD                : 0014
HIPER    RMB  1        ;HIPERIOD                 : 0015
LODT     RMB  1        ;PERIOD DELTAS            : 0016
HIDT     RMB  1        ;                         : 0017
HIEN     RMB  1        ;END PERIOD               : 0018
SWPDT    RMB  2        ;SWEEP PERIOD             : 0019-001A
LOMOD    RMB  1        ;BASE FREQ MOD            : 001B
VAMP     RMB  1        ;AMPLITUDE                : 001C
LOCNT    RMB  1        ;PERIOD COUNTERS          : 001D
HICNT    RMB  1        ;                         : 001E
;*
;* KNOCKER RAM
;*
        ORG  LOCRAM
PERIOD  RMB  1       ;                           : 0014
AMP     RMB  1       ;                           : 0015
SNDTMP  RMB  2       ;INDEX TMEP                 : 0016-0017
;*
;*FILTERED NOISE ROUTINE PARAMETERS
;*
         ORG  LOCRAM
FMAX     RMB  1        ;MAXIMUM_FREQUENCY        : 0014
FHI      RMB  1        ;FREQUENCY                : 0015
FLO      RMB  1        ;                         : 0016
SAMPC    RMB  2        ;SAMPLE COUNT             : 0017-0018
FDFLG    RMB  1        ;FREQUENCY DECREMENT FLAG : 0019
DSFLG    RMB  1        ;DISTORTION FLAG          : 001A
;*
;*
;*
;*NOISE/CROWD ROAR ROUTINE PARAMETERS
;*
        ORG  LOCRAM
DECAY   RMB  1       ;                           : 0014
NAMP    RMB  1       ;                           : 0015
CYCNT   RMB  1       ;                           : 0016
NFRQ1   RMB  2       ;                           : 0017-0018
NFFLG   RMB  1       ;                           : 0019
LFREQ   RMB  1       ;                           : 001A
DFREQ   RMB  1       ;                           : 001B
GALPAM  EQU  *
CYCNT2  RMB  1       ;                           : 001C
NAMP2   RMB  1       ;                           : 001D
DECAY2  RMB  1       ;                           : 001E
NFFLG2  RMB  1       ;                           : 001F
NFR2    RMB  1       ;                           : 0020
GALCNT  RMB  1       ;                           : 0021
WHIS    RMB  1       ;CROWD ROAR AMP             : 0022
WFRQ    RMB  1       ;CROWD WHISTLE FREQ         : 0023
WCNT    RMB  1       ;WHISTLE PASSCOUNTER        : 0024
PTRHI   RMB  2       ;WHIS ADR PTR               : 0025-0026
WFRQ2   RMB  1       ;                           : 0027
WCNT2   RMB  1       ;                           : 0028
CURVAL  RMB  1       ;WHISTLING NOISE OUTPUT     : 0029
ATP     RMB  1       ;INTERM NOISE VAL           : 002A
MINWIS  RMB  1       ;MIN WHISTLE FREQ           : 002B
CY2     RMB  1       ;NOISE CYCLE COUNTER        : 002C
DFRQ    RMB  1       ;WHISTLE FREQ CHANGE        : 002D
DFRQ2   RMB  1       ;INIT WHISTLE FREQ CHANGE   : 002E
NNOIS   RMB  1       ;NEXT NOISE VALUE           : 002F
NFRQ    RMB  1       ;NOISE FREQ                 : 0030
NFRQ2   RMB  1       ;INIT NOISE FREQ            : 0031
RCNT2   RMB  1       ;                           : 0032
;
;
;
F000 : 68                             ;checksum byte
;*************************************;
;RESET power on
;*************************************;
;RESET 
F001 : 0F         sei                 ;set interrupt mask   
F002 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
F005 : CE 04 00   ldx  #$0400         ;load X with 0400h (PIA addr)
F008 : 6F 01      clr  $01,x          ;clear addr X + 01h (0401 PIA1 CR port A)
F00A : 6F 03      clr  $03,x          ;clear addr X + 03h (0403 PIA1 CR port B)
F00C : 86 FF      ldaa  #$FF          ;load A with FFh
F00E : A7 00      staa  $00,x         ;store A in addr X + 00h (0400 PIA1 PR/DDR port A out)
F010 : C6 80      ldab  #$80          ;load B with 80h
F012 : E7 02      stab  $02,x         ;store B in addr X + 02h (0402 PIA1 PR/DDR port B in)
F014 : 86 37      ldaa  #$37          ;load A with value 37h (CB2 low, IRQ allowed)
F016 : A7 03      staa  $03,x         ;store A in addr X + 03h (0403 PIA1 CR port B)
F018 : 86 3C      ldaa  #$3C          ;load A with 3Ch (CA2 set init high, no IRQs)
F01A : A7 01      staa  $01,x         ;store A in addr X + 01h (0401 PIA1 CR port A)
F01C : 97 09      staa  $09           ;store A in addr 08 (HI, start Random Generator)
F01E : E7 02      stab  $02,x         ;store B in addr X + 02h (0402 PIA1 PR/DDR port B in)
F020 : 97 01      staa  $01           ;store A in TLKGL+1
F022 : 4F         clra                ;clear A 00h
F023 : 97 06      staa  $06           ;store A in SP1FLG
F025 : 97 07      staa  $07           ;store A in B2FLG
F027 : 97 03      staa  $03           ;store A in TLKGL+3
F029 : 97 04      staa  $04           ;store A in BG1FLG
F02B : 97 05      staa  $05           ;store A in BG2FLG
F02D : 97 02      staa  $02           ;store A in TLKGL+2
F02F : 97 00      staa  $00           ;store A in TLKGL
F031 : 0E         cli                 ;clear interrupts I=0
;STDBY
F032 : 20 FE      bra  LF032          ;branch always STDNY (*)
;*************************************;
;Vari Loader 
;*************************************;
;VARILD
F034 : 16         tab                 ;
F035 : 48         asla                ;
F036 : 48         asla                ;
F037 : 48         asla                ;
F038 : 1B         aba                 ;
F039 : CE 00 14   ldx  #$0014         ;load X with value 0014h (#LOCRAM)
F03C : DF 10      stx  $10            ;store X in addr 10 (10:XPTR)(SET XSFER)
F03E : CE FC A2   ldx  #$FCA2         ;vvect
F041 : BD FC 42   jsr  LFC42          ;calcos
F044 : C6 09      ldab  #$09          ;load B with value 09h (COUNT)
F046 : 7E F2 80   jmp  LF280          ;util1
;*************************************;
;Variable Duty Cycle Square Wave Routine
;*************************************;
;VARI
F049 : 96 1C      ldaa  $1C           ;load A with value in addr 17 (VAMP)
F04B : B7 04 00   staa  $0400         ;store A in DAC output SOUND
;VAR0
F04E : 96 14      ldaa  $14           ;load A with value in addr 14 (LOPER)
F050 : 97 1D      staa  $1D           ;store A in addr 1D (LOCNT)
F052 : 96 15      ldaa  $15           ;load A with value in addr 15 (HIPER)
F054 : 97 1E      staa  $1E           ;store A in addr 1E (HICNT)
;V0 
F056 : DE 19      ldx  $19            ;load X with value in addr 19 (SWPDT)
;V0LP
F058 : 96 1D      ldaa  $1D           ;load A with value in addr 1D (LOCNT) (LO CYCLE)
F05A : 73 04 00   com  $0400          ;DAC output SOUND
;V1 
F05D : 09         dex                 ;decr X
F05E : 27 10      beq  LF070
F060 : 4A         deca
F061 : 26 FA      bne  LF05D
F063 : 73 04 00   com  $0400          ;DAC output SOUND
F066 : 96 1E      ldaa  $1E           ;load A with value in addr 1E (HICNT) (HI CYCLE)
;V2 
F068 : 09         dex
F069 : 27 05      beq  LF070
F06B : 4A         deca
F06C : 26 FA      bne  LF068
F06E : 20 E8      bra  LF058
;VSWEEP 
F070 : B6 04 00   ldaa  $0400         ;load A with DAC output SOUND
F073 : 2B 01      bmi  LF076
F075 : 43         coma
;VS1 
F076 : 8B 00      adda  #$00          ;add A with 00h
F078 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F07B : 96 1D      ldaa  $1D           ;load A with value in addr 1D (LOCNT)
F07D : 9B 16      adda  $16           ;add A with value in addr 16 (LODT)
F07F : 97 1D      staa  $1D
F081 : 96 1E      ldaa  $1E
F083 : 9B 17      adda  $17
F085 : 97 1E      staa  $1E
F087 : 91 18      cmpa  $18
F089 : 26 CB      bne  LF056
F08B : 96 1B      ldaa  $1B
F08D : 27 06      beq  LF095
F08F : 9B 14      adda  $14
F091 : 97 14      staa  $14
F093 : 26 B9      bne  LF04E
;VARX 
F095 : 39         rts                 ;return subroutine
;*************************************;
;NSPRM1
;*************************************;
F096 : CE F0 9C   ldx  #$F09C         ;load X with F09Ch (NSTBL1)
F099 : 7E F1 56   jmp  LF156          ;jump NOISLG
;
F09C : 10 FF 01 01 01                 ;NSTBL1
;*************************************;
;NSPRM2
;*************************************;
F0A1 : CE F0 A7   ldx  #$F0A7         ;load X with F0A7h (NSTBL2)
F0A4 : 7E F1 56   jmp  LF156          ;jump NOISLG
;
F0A7 : C0 FF 01 01 01                 ;NSTBL2
;*************************************;
;WINPRM
;*************************************;
F0AC : CE A5 00   ldx  #$A500         ;load X with A500h (SEED)
F0AF : DF 09      stx  $09            ;store X in addr 09
F0B1 : CE F0 C6   ldx  #$F0C6         ;load X with F0C6h (#WS1)(1ST WHISTLE PARAMS)
F0B4 : BD F2 38   jsr  LF238          ;jump sub WISLD
F0B7 : CE F0 F9   ldx  #$F0F9         ;load X with F0F9h (#CR2)(2ND CROWD ROAR NOISE PARAMS)
F0BA : BD F1 41   jsr  LF141          ;jump sub NOISLD
F0BD : 7E F1 DC   jmp  LF1DC          ;jump NINIT
;*************************************;
;NSPRM3
;*************************************;
F0C0 : CE F1 03   ldx  #$F103         ;load X with F103h (NSTBL4)
F0C3 : 7E F1 56   jmp  LF156          ;jump NOISLG
;*************************************;
;WHISTLE PARAMS
;*************************************;
F0C6 : E0 34 02 16 60                 ;WS1
F0CB : D6 6E FF 08 28                 ;
F0D0 : C8 2A 02 10 60                 ;
F0D5 : B6 3A 02 18 64                 ;
F0DA : AC 64 FE 18 38                 ;
F0DF : A1 38 02 14 68                 ;
F0E4 : 90 34 02 12 60                 ;
F0E9 : 7E 20 02 08 78                 ;
F0EE : 76 58 FF 18 22                 ;
F0F3 : 00                             ;
;
F0F4 : 30 10 FC 00 01                 ;CR1
;
F0F9 : 30 FC 01 00 01                 ;CR2
;*************************************;
;NOISE tables
;*************************************;
F0FE : 18 F0 10 01 30                 ;NSTBL3
F103 : 04 80 04 FE 30                 ;NSTBL4
;*************************************;
; White Noise routine loader (NO LINK YET)
;*************************************;
;NSLDR4
F108 : CE F0 FE   ldx  #$F0FE         ;load X with F0FEh (NSTBL3)
F10B : 8D 34      bsr  LF141          ;branch sub NOISLD
;NSLD41
F10D : 8D 14      bsr  LF123          ;branch sub NSLD42
F10F : 8D 12      bsr  LF123          ;branch sub NSLD42
F111 : 86 28      ldaa  #$28          ;load A with 28h
F113 : 97 31      staa  $31           ;store A in addr 31 (NFRQ2)
F115 : 73 00 19   com  $0019          ;complement 1s addr 0019 (NFFLG)
F118 : 8D 3E      bsr  LF158          ;branch sub NOIN
F11A : 73 00 19   com  $0019          ;complement 1s addr 0019 (NFFLG)
F11D : 86 1E      ldaa  #$1E          ;load A with 1Eh
F11F : 8D 0D      bsr  LF12E          ;branch sub NSLD43
F121 : 20 EA      bra  LF10D          ;branch always NSLD41
;NSLD42
F123 : 86 30      ldaa  #$30          ;load A with 30h
F125 : 97 31      staa  $31           ;store A in addr 31 (NFRQ2)
F127 : 8D 2F      bsr  LF158          ;branch sub NOIN
F129 : 86 02      ldaa  #$02          ;load A with 02h
F12B : 8D 01      bsr  LF12E          ;branch sub NSLD43
F12D : 39         rts                 ;return subroutine
;NSLD43
F12E : 16         tab                 ;transfer A to B
F12F : CE 04 00   ldx  #$0400         ;load X with 0400h
;NSLD44
F132 : 17         tba                 ;transfer B to A
;NSLD45
F133 : 4A         deca                ;decr A
F134 : 26 FD      bne  LF133          ;branch Z=0 NSLD45
F136 : 09         dex                 ;decr X
F137 : 8C 00 00   cpx  #$0000         ;compare X with 1000h
F13A : 26 F6      bne  LF132          ;branch Z=0 NSLD44
F13C : 86 F0      ldaa  #$F0          ;load A with F0h
F13E : 97 15      staa  $15           ;store A in addr 15 (NAMP)
F140 : 39         rts                 ;return subroutine
;*************************************;
;*WHITE NOISE ROUTINE
;*************************************;
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA
;*
;NOISLD
F141 : A6 00      ldaa  $00,x
F143 : 97 2C      staa  $2C
F145 : A6 01      ldaa  $01,x
F147 : 97 15      staa  $15
F149 : A6 02      ldaa  $02,x
F14B : 97 14      staa  $14
F14D : A6 03      ldaa  $03,x
F14F : 97 19      staa  $19
F151 : A6 04      ldaa  $04,x
F153 : 97 31      staa  $31
;NEND LF155:
F155 : 39         rts                 ;return subroutine
;*************************************;
;*
;*LOAD NOISE AND GO
;*
;NOISLG:
F156 : 8D E9      bsr  LF141          ; branch sub NOISLD
;*
;*NOISE INIT
;*
;NOIN
F158 : 8D 30      bsr  LF18A          ;branch sub NSUB
;*
;*NOISE LOOP
;*
;NO1
F15A : 8D 58      bsr  LF1B4
F15C : 96 30      ldaa  $30           ;(NFRQ) FREQ REINITED
F15E : 91 31      cmpa  $31           ;(NFRQ2)
F160 : 26 F8      bne  LF15A
F162 : 59         rolb
F163 : F7 04 00   stab  $0400
F166 : 8D 2D      bsr  LF195
F168 : 8D 38      bsr  LF1A2
F16A : 8D 5C      bsr  LF1C8
F16C : 7D 00 15   tst  $0015
F16F : 27 E4      beq  LF155
F171 : 7D 00 16   tst  $0016
F174 : 26 E4      bne  LF15A
F176 : 7D 00 19   tst  $0019
F179 : 27 DF      beq  LF15A
F17B : 2B 05      bmi  LF182
F17D : 7C 00 31   inc  $0031
F180 : 20 D8      bra  LF15A
;NO3 LF182:
F182 : 7A 00 31   dec  $0031
F185 : 7A 00 30   dec  $0030
F188 : 20 D0      bra  LF15A
;NSUB LF18A:
F18A : 7F 00 16   clr  $0016
F18D : 96 31      ldaa  $31
F18F : 97 30      staa  $30
F191 : 7F 00 2F   clr  $002F
F194 : 39         rts                 ;return subroutine
;* 23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD
;*
;*
;NOISE1:
F195 : 96 0A      ldaa  $0A
F197 : 44         lsra
F198 : 44         lsra
F199 : 44         lsra
F19A : 98 0A      eora  $0A
F19C : 97 2A      staa  $2A
F19E : 08         inx
F19F : 84 07      anda  #$07
F1A1 : 39         rts                 ;return subroutine
;*
;NOISE2:
F1A2 : 96 2A      ldaa  $2A
F1A4 : 44         lsra
F1A5 : 76 00 09   ror  $0009
F1A8 : 76 00 0A   ror  $000A
F1AB : 86 00      ldaa  #$00
F1AD : 24 02      bcc  LF1B1
F1AF : 96 15      ldaa  $15
;NOISE3
F1B1 : 97 2F      staa  $2F
F1B3 : 39         rts                 ;return subroutine
;*
;RNT:
F1B4 : 96 31      ldaa  $31
F1B6 : 7A 00 30   dec  $0030
F1B9 : 27 04      beq  LF1BF
F1BB : 08         inx
F1BC : 09         dex
F1BD : 20 08      bra  LF1C7
;NW0 LF1BF:
F1BF : 97 30      staa  $30
F1C1 : D6 2F      ldab  $2F
F1C3 : 54         lsrb
F1C4 : 7C 00 16   inc  $0016
;NNW1
F1C7 : 39         rts                 ;return subroutine
;*
;RNA:
F1C8 : 96 2C      ldaa  $2C
F1CA : 91 16      cmpa  $16
F1CC : 27 04      beq  LF1D2
F1CE : 08         inx
F1CF : 09         dex
F1D0 : 20 09      bra  LF1DB
;NW2
F1D2 : 7F 00 16   clr  $0016
F1D5 : 96 15      ldaa  $15
F1D7 : 90 14      suba  $14
F1D9 : 97 15      staa  $15
;*
;NW3:
F1DB : 39         rts                 ;return subroutine
;*************************************;
;*
;* NOISE WITH WHISTLE MAIN LOOP
;NINIT
;LF1DC:
F1DC : 7F 00 23   clr  $0023          ;(WFRQ)
F1DF : 7F 00 2D   clr  $002D
F1E2 : 86 0E      ldaa  #$0E
F1E4 : 97 24      staa  $24
F1E6 : 7F 00 29   clr  $0029
F1E9 : 8D 9F      bsr  LF18A
;LF1EB:
F1EB : 8D A8      bsr  LF195
F1ED : BD F2 72   jsr  LF272
F1F0 : 8D B0      bsr  LF1A2
F1F2 : BD F2 72   jsr  LF272
F1F5 : 8D BD      bsr  LF1B4
F1F7 : 8D 79      bsr  LF272
F1F9 : 8D CD      bsr  LF1C8
F1FB : 8D 75      bsr  LF272
F1FD : 8D 0A      bsr  LF209
F1FF : 8D 71      bsr  LF272
F201 : 8D 1D      bsr  LF220
F203 : 8D 6D      bsr  LF272
F205 : 8D 52      bsr  LF259
F207 : 20 E2      bra  LF1EB
;*
;TRICNT:
F209 : 96 28      ldaa  $28
F20B : 7A 00 24   dec  $0024
F20E : 27 07      beq  LF217
F210 : B6 00 15   ldaa  $0015
F213 : 26 0A      bne  LF21F
F215 : 20 68      bra  LF27F
;NW4:
F217 : 97 24      staa  $24
F219 : 96 23      ldaa  $23
F21B : 9B 2D      adda  $2D
F21D : 97 23      staa  $23
;*
;NW5:
F21F : 39         rts                 ;return subroutine
;*
;TRIFRQ:
F220 : 96 23      ldaa  $23
F222 : 91 2B      cmpa  $2B
F224 : 27 07      beq  LF22D
F226 : 08         inx
F227 : 96 15      ldaa  $15
F229 : 26 2A      bne  LF255
F22B : 20 29      bra  LF256
;NW6:
F22D : 7F 00 23   clr  $0023
F230 : 7F 00 2D   clr  $002D
F233 : 7F 00 29   clr  $0029
F236 : DE 25      ldx  $25
;WISLD
F238 : A6 00      ldaa  $00,x
F23A : 97 22      staa  $22
F23C : 27 17      beq  LF255
F23E : A6 01      ldaa  $01,x
F240 : 97 27      staa  $27
F242 : A6 02      ldaa  $02,x
F244 : 97 2E      staa  $2E
F246 : A6 03      ldaa  $03,x
F248 : 97 28      staa  $28
F24A : A6 04      ldaa  $04,x
F24C : 97 2B      staa  $2B
F24E : 86 05      ldaa  #$05
F250 : BD FC 42   jsr  LFC42
F253 : DF 25      stx  $25
;*
;NW7:
F255 : 39         rts                 ;return subroutine
;PEND:
F256 : 32         pula
F257 : 32         pula
F258 : 39         rts                 ;return subroutine
;*
;NNW:
F259 : 96 22      ldaa  $22
F25B : 27 06      beq  LF263
F25D : 91 15      cmpa  $15
F25F : 26 04      bne  LF265
F261 : 20 03      bra  LF266
;NW8:
F263 : 08         inx
F264 : 09         dex
;NW9:
F265 : 39         rts                 ;return subroutine
;WINIT:
F266 : 7F 00 22   clr  $0022
F269 : 96 27      ldaa  $27
F26B : 97 23      staa  $23
F26D : 96 2E      ldaa  $2E
F26F : 97 2D      staa  $2D
F271 : 39         rts                 ;return subroutine
;******************
;TRIDR:
F272 : 96 29      ldaa  $29
F274 : 9B 23      adda  $23
F276 : 97 29      staa  $29
F278 : 2A 01      bpl  LF27B
F27A : 43         coma
;GO:
F27B : 1B         aba
F27C : B7 04 00   staa  $0400
;NSEND
F27F : 39         rts                 ;return subroutine
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
F280 : 36         psha                ;push A into stack then SP - 1
;TRANS1 LF281:
F281 : A6 00      ldaa  $00,x
F283 : DF 0E      stx  $0E
F285 : DE 10      ldx  $10
F287 : A7 00      staa  $00,x
F289 : 08         inx
F28A : DF 10      stx  $10
F28C : DE 0E      ldx  $0E
F28E : 08         inx
F28F : 5A         decb
F290 : 26 EF      bne  LF281
F292 : 32         pula
F293 : 39         rts                 ;return subroutine
;*************************************;
;*
;* KNOCKER ROUTINE
;*
;KNOCK:
F294 : CE FC E2   ldx  #$FCE2         ;(#KNKTAB)
F297 : DF 16      stx  $16
;SQLP LF299:
F299 : DE 16      ldx  $16
F29B : A6 00      ldaa  $00,x
F29D : 27 33      beq  LF2D2
F29F : E6 01      ldab  $01,x
F2A1 : C4 F0      andb  #$F0
F2A3 : D7 15      stab  $15
F2A5 : E6 01      ldab  $01,x
F2A7 : 08         inx
F2A8 : 08         inx
F2A9 : DF 16      stx  $16
F2AB : 97 14      staa  $14
F2AD : C4 0F      andb  #$0F
;LP0 LF2AF:
F2AF : 96 15      ldaa  $15
F2B1 : B7 04 00   staa  $0400
F2B4 : 96 14      ldaa  $14
;LP1 LF2B6:
F2B6 : CE 00 05   ldx  #$0005         ;(#5) DELAY
;LP11 LF2B9:
F2B9 : 09         dex
F2BA : 26 FD      bne  LF2B9
F2BC : 4A         deca
F2BD : 26 F7      bne  LF2B6
F2BF : 7F 04 00   clr  $0400
F2C2 : 96 14      ldaa  $14
;LP2 LF2C4:
F2C4 : CE 00 05   ldx  #$0005         ;(#5) DELAY
;LP22 LF2C7:
F2C7 : 09         dex
F2C8 : 26 FD      bne  LF2C7
F2CA : 4A         deca
F2CB : 26 F7      bne  LF2C4
F2CD : 5A         decb
F2CE : 26 DF      bne  LF2AF
F2D0 : 20 C7      bra  LF299
;END LF2D2:
F2D2 : 39         rts                 ;return subroutine
;*************************************;
;Background End Routine
;*************************************;
;BGEND
F2D3 : 7F 00 03   clr  $0003          ;clear addr 0003 (BG1FLG)
F2D6 : 7F 00 04   clr  $0004          ;clear addr 0004 (BG2FLG)
F2D9 : 39         rts                 ;return subroutine
;*************************************;
;Background Sound #2 increment
;*************************************;
;BG2INC
F2DA : 96 03      ldaa  $03           ;load A with addr 03 (TALKGL+3)
F2DC : 8A 80      oraa  #$80          ;Or A with 80h
F2DE : 97 03      staa  $03           ;store A in addr 03 (TALKGL+3)
F2E0 : 96 04      ldaa  $04           ;load A with addr 04 (BG1FLG)
F2E2 : 84 7F      anda  #$7F          ;And A with 7Fh (REMOVE OVERRIDE)
F2E4 : 81 1D      cmpa  #$1D          ;compare A with 1Dh (#BG2MAX)
F2E6 : 26 01      bne  LF2E9          ;branch Z=0 BG2IO
F2E8 : 4F         clra                ;clear A
;BG2IO
F2E9 : 4C         inca                ;incr A
F2EA : 97 04      staa  $04           ;store A in addr 04 (BG1FLG)
F2EC : 39         rts                 ;return subroutine
;*************************************;
;Background 2 Routine 
;*************************************;
;BG2
F2ED : 86 07      ldaa  #$07          ;(#(TRBV-SVTAB)/7) (GET SOUND)
F2EF : BD F3 41   jsr  LF341          ;jump sub GWLD
F2F2 : 96 04      ldaa  $04           ;load A with addr 04 (BG1FLG)
F2F4 : 48         asla                ;arith shift left A
F2F5 : 43         coma                ;complement 1s A
F2F6 : BD F3 FB   jsr  LF3FB          ;jump sub GEND60
;BG2LP 
F2F9 : 7C 00 18   inc  $0018          ;incr addr 0018 (GDCNT)
F2FC : BD F3 FD   jsr  LF3FD          ;jump sub GEND61
F2FF : 20 F8      bra  LF2F9          ;branch always BG2LP
;*************************************;
;Spinner #1 Sound
;*************************************;
;SP1
F301 : 86 04      ldaa  #$04          ;load A with value 04h (#(CABSHK-VVECT)/9)
F303 : BD F0 34   jsr  LF034          ;jump sub VARILD
F306 : D6 05      ldab  $05           ;load B with addr 05 (SP1FLG)
F308 : C1 1F      cmpb  #$1F          ;compare B with value 01h (#SP1MAX-1)
F30A : 26 01      bne  LF30D          ;branch Z=0 SP1A
F30C : 5F         clrb                ;clear B
;SP1A:
F30D : 5C         incb                ;incr B
F30E : D7 05      stab  $05           ;store B in addr 05 (SP1FLG)
F310 : 86 20      ldaa  #$20          ;load A with 20h
F312 : 10         sba                 ;sub B from A
F313 : 5F         clrb                ;clear B
;SP11:
F314 : 81 14      cmpa  #$14          ;compare A with 14h
F316 : 23 05      bls  LF31D          ;branch C+Z=1 SP12
F318 : CB 0E      addb  #$0E          ;add B with 0Eh
F31A : 4A         deca                ;decr A
F31B : 20 F7      bra  LF314          ;branch always SP11
;SP12:
F31D : CB 05      addb  #$05          ;add B with 05h
F31F : 4A         deca                ;decr A
F320 : 26 FB      bne  LF31D          ;branch Z=0 SP12
F322 : D7 14      stab  $14           ;store B in addr 14 (LOPER)
;SP1LP
F324 : BD F0 49   jsr  LF049          ;jump sub VARI
F327 : 20 FB      bra  LF324          ;branch always SP1LP
;*************************************;
;Laser Ball Bonus #2
;*************************************;
;BON2
F329 : 96 06      ldaa  $06           ;load A addr 06 (B2FLG)
F32B : 26 0B      bne  LF338          ;branch Z=0 BON21 GWPRM2
F32D : 7C 00 06   inc  $0006          ;incr addr 0006 (B2FLG)
;LF330:
F330 : 86 08      ldaa  #$08          ;load A with 08h (#(BONV-SVTAB)/7)
F332 : BD F3 41   jsr  LF341          ;jump sub GWLD
F335 : 7E F3 A7   jmp  LF3A7          ;jump GWAVE
;BON21
F338 : 96 18      ldaa  $18           ;load A addr 18
F33A : 81 41      cmpa  #$41          ;compare A with 41h
F33C : 27 F2      beq  LF330          ;branch Z=1 LF330
F33E : 7E F3 F0   jmp  LF3F0          ;jump GEND50
;*************************************;
;GWAVE Loader
;*************************************;
;GWLD:
F341 : 16         tab
F342 : 58         aslb
F343 : 1B         aba
F344 : 1B         aba
F345 : 1B         aba
F346 : CE FE 1B   ldx  #$FE1B         ;load X with FE1Bh (SVTAB)(SOUND VECTOR TABLE)
F349 : BD FC 42   jsr  LFC42          ;ADDX
F34C : A6 00      ldaa  $00,x
F34E : 16         tab
F34F : 84 0F      anda  #$0F
F351 : 97 15      staa  $15
F353 : 54         lsrb
F354 : 54         lsrb
F355 : 54         lsrb
F356 : 54         lsrb
F357 : D7 14      stab  $14
F359 : A6 01      ldaa  $01,x
F35B : 16         tab
F35C : 54         lsrb
F35D : 54         lsrb
F35E : 54         lsrb
F35F : 54         lsrb
F360 : D7 16      stab  $16
F362 : 84 0F      anda  #$0F
F364 : 97 12      staa  $12
F366 : DF 0C      stx  $0C            ;(TEMPX) SAVE INDEX
F368 : CE FD 40   ldx  #$FD40         ;(#GWVTAB) CALC WAVEFORM ADDR
;LF36B:
F36B : 7A 00 12   dec  $0012
F36E : 2B 08      bmi  LF378
F370 : A6 00      ldaa  $00,x
F372 : 4C         inca
F373 : BD FC 42   jsr  LFC42          ;ADDX
F376 : 20 F3      bra  LF36B
;LF378:
F378 : DF 19      stx  $19
F37A : BD F4 37   jsr  LF437          ;WVTRAN
F37D : DE 0C      ldx  $0C
F37F : A6 02      ldaa  $02,x
F381 : 97 1B      staa  $1B
F383 : BD F4 49   jsr  LF449          ;WVDECA
F386 : DE 0C      ldx  $0C
F388 : A6 03      ldaa  $03,x
F38A : 97 17      staa  $17
F38C : A6 04      ldaa  $04,x
F38E : 97 18      staa  $18
F390 : A6 05      ldaa  $05,x
F392 : 16         tab
F393 : A6 06      ldaa  $06,x
F395 : CE FF 00   ldx  #$FF00         ;(#GFRTAB)
F398 : BD FC 42   jsr  LFC42          ;ADDX
F39B : 17         tba
F39C : DF 1C      stx  $1C
F39E : 7F 00 24   clr  $0024
F3A1 : BD FC 42   jsr  LFC42          ;ADDX
F3A4 : DF 1E      stx  $1E
F3A6 : 39         rts                 ;return subroutine
;*************************************;
;GWAVE routine
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
F3A7 : 96 14      ldaa  $14           ;load A in addr 14 (GECHO)
F3A9 : 97 23      staa  $23           ;store A in addr 23 (GECNT)
;GWT4 LF3AB:
F3AB : DE 1C      ldx  $1C            ;load X with value at addr 1C (GWFRQ)
F3AD : DF 0E      stx  $0E            ;store X in addr 0E (XPLAY)
;GPLAY LF3AF:
F3AF : DE 0E      ldx  $0E            ;load X with value at addr 0E (XPLAY)(GET NEW PERIOD)
F3B1 : A6 00      ldaa  $00,x
F3B3 : 9B 24      adda  $24           ;add A with value at addr 24 (FOFSET)
F3B5 : 97 22      staa  $22           ;store A in addr 22 (GPER)
F3B7 : 9C 1E      cpx  $1E            ;compare X with value at addr 1E (FRQEND)
F3B9 : 27 26      beq  LF3E1
F3BB : D6 15      ldab  $15           ;load B with value at addr 15 (GCCNT)(CYCLE COUNT)
F3BD : 08         inx
F3BE : DF 0E      stx  $0E
;GOUT LF3C0:
F3C0 : CE 00 25   ldx  #$0025
;GOUTLP LF3C3:
F3C3 : 96 22      ldaa  $22
;GPRLP LF3C5:
F3C5 : 4A         deca
F3C6 : 26 FD      bne  LF3C5
F3C8 : A6 00      ldaa  $00,x
F3CA : B7 04 00   staa  $0400
;GPR1
F3CD : 08         inx
F3CE : 9C 20      cpx  $20
F3D0 : 26 F1      bne  LF3C3
F3D2 : 5A         decb
F3D3 : 27 DA      beq  LF3AF
F3D5 : 08         inx
F3D6 : 09         dex
F3D7 : 08         inx
F3D8 : 09         dex
F3D9 : 08         inx
F3DA : 09         dex
F3DB : 08         inx
F3DC : 09         dex
F3DD : 01         nop
F3DE : 01         nop
F3DF : 20 DF      bra  LF3C0
;GEND LF3E1:
F3E1 : 96 16      ldaa  $16
F3E3 : 8D 64      bsr  LF449
;GEND40
F3E5 : 7A 00 23   dec  $0023
F3E8 : 26 C1      bne  LF3AB
F3EA : 96 06      ldaa  $06
F3EC : 9A 07      oraa  $07
F3EE : 26 46      bne  LF436
;GEND50 LF3F0:
F3F0 : 96 17      ldaa  $17
F3F2 : 27 42      beq  LF436
F3F4 : 7A 00 18   dec  $0018
F3F7 : 27 3D      beq  LF436
F3F9 : 9B 24      adda  $24
;GEND60 LF3FB:
F3FB : 97 24      staa  $24
;GEND61 LF3FD:
F3FD : DE 1C      ldx  $1C
F3FF : 5F         clrb
;GW0 LF400:
F400 : 96 24      ldaa  $24
F402 : 7D 00 17   tst  $0017
F405 : 2B 06      bmi  LF40D
F407 : AB 00      adda  $00,x
F409 : 25 08      bcs  LF413
F40B : 20 0B      bra  LF418
;GW1 LF40D:
F40D : AB 00      adda  $00,x
F40F : 27 02      beq  LF413
F411 : 25 05      bcs  LF418
;GW2 LF413:
F413 : 5D         tstb
F414 : 27 08      beq  LF41E
F416 : 20 0F      bra  LF427
;GW2A LF418:
F418 : 5D         tstb
F419 : 26 03      bne  LF41E
F41B : DF 1C      stx  $1C
F41D : 5C         incb
;GW2B LF41E:
F41E : 08         inx
F41F : 9C 1E      cpx  $1E
F421 : 26 DD      bne  LF400
F423 : 5D         tstb
F424 : 26 01      bne  LF427
F426 : 39         rts                 ;return subroutine
;GW3
F427 : DF 1E      stx  $1E
F429 : 96 16      ldaa  $16
F42B : 27 06      beq  LF433
F42D : 8D 08      bsr  LF437
F42F : 96 1B      ldaa  $1B
F431 : 8D 16      bsr  LF449
;GEND0 LF433:
F433 : 7E F3 A7   jmp  LF3A7
;GEND1 LF436:
F436 : 39         rts                 ;return subroutine
;*************************************;
;Wave Transfer Routine (PARAM18)
;*************************************;
;WVTRAN
F437 : CE 00 25   ldx  #$0025
F43A : DF 10      stx  $10
F43C : DE 19      ldx  $19
F43E : E6 00      ldab  $00,x
F440 : 08         inx
F441 : BD F2 80   jsr  LF280
F444 : DE 10      ldx  $10
F446 : DF 20      stx  $20
F448 : 39         rts                 ;return subroutine
;*************************************;
;Wave Decay Routinue (PARAM19)
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
F449 : 4D         tsta
F44A : 27 2B      beq  LF477
F44C : DE 19      ldx  $19
F44E : DF 0E      stx  $0E
F450 : CE 00 25   ldx  #$0025
F453 : 97 13      staa  $13
;LF455:
F455 : DF 10      stx  $10
F457 : DE 0E      ldx  $0E
F459 : D6 13      ldab  $13
F45B : D7 12      stab  $12
F45D : E6 01      ldab  $01,x
F45F : 54         lsrb
F460 : 54         lsrb
F461 : 54         lsrb
F462 : 54         lsrb
F463 : 08         inx
F464 : DF 0E      stx  $0E
F466 : DE 10      ldx  $10
F468 : A6 00      ldaa  $00,x
;LF46A:
F46A : 10         sba
F46B : 7A 00 12   dec  $0012
F46E : 26 FA      bne  LF46A
F470 : A7 00      staa  $00,x
F472 : 08         inx
F473 : 9C 20      cpx  $20
F475 : 26 DE      bne  LF455
;LF477:
F477 : 39         rts                 ;return subroutine
;*************************************;
;Appear 
;*************************************;
;APPEAR
F478 : 86 FE      ldaa  #$FE
F47A : 97 1B      staa  $1B
F47C : 86 C0      ldaa  #$C0
F47E : C6 10      ldab  #$10
F480 : 20 00      bra  LF482
;*************************************;
;*LIGHTNING+APPEAR NOISE ROUTINE
;*************************************;
;LITEN
F482 : 97 1A      staa  X001A
F484 : 86 FF      ldaa  #$FF
F486 : B7 04 00   staa  X0400
F489 : D7 16      stab  X0016
;LF48B:
F48B : D6 16      ldab  X0016
;LF48D:
F48D : 96 0A      ldaa  X000A
F48F : 44         lsra
F490 : 44         lsra
F491 : 44         lsra
F492 : 98 0A      eora  X000A
F494 : 44         lsra
F495 : 76 00 09   ror  X0009
F498 : 76 00 0A   ror  X000A
F49B : 24 03      bcc  LF4A0
F49D : 73 04 00   com  X0400
F;LF4A0:
F4A0 : 96 1A      ldaa  X001A
;LF4A2:
F4A2 : 4A         deca
F4A3 : 26 FD      bne  LF4A2
F4A5 : 5A         decb
F4A6 : 26 E5      bne  LF48D
F4A8 : 96 1A      ldaa  X001A
F4AA : 9B 1B      adda  X001B
F4AC : 97 1A      staa  X001A
F4AE : 26 DB      bne  LF48B
F4B0 : 39         rts
F4B1 : 39         rts                 ;return subroutine
;*************************************;
;fnoise tables
;*************************************;
F4B2 : 01 00 01 FF 03 E8              ;FCB
;
F4B8 : 01 80 01 40 03 FF              ;FCB
;*************************************;
;*FNOSLD (Filtered Noise Loader)
;*************************************;
;LF4BE
F4BE : CE F4 B2   ldx #$F4B2          ;load X with F4B2h
F4C1 : 44         lsra                ;logic shift right A
F4C2 : 80 09      suba #$09           ;sub A with 09h
F4C4 : 16         tab                 ;transfer A to B
F4C5 : 58         aslb                ;arith shift left B
F4C6 : 1B         aba                 ;add B to A
F4C7 : BD FC 42   jsr  LFC42          ;jump sub ADDX
F4CA : A6 00      ldaa  $00,x         ;load A with X+00h
F4CC : 97 1B      staa  $1B           ;store A in addr 1B
F4CE : A6 01      ldaa  $01,x         ;load A with X+01h
F4D0 : 97 17      staa  $17           ;store A in addr 17
F4D2 : A6 02      ldaa  $02,x         ;load A with X+02h
F4D4 : E6 03      ldab  $03,x         ;load B with X+03h
F4D6 : EE 04      ldx  $04,x          ;load X with X+04h
F4D8 : BD F4 DC   jsr  LF4DC          ;jump sub FNOISE
F4DB : 39         rts                 ;return subroutine
;*************************************;
;Filtered Noise Routine
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
F4DC : 97 1A      staa  $1A           ;store A in addr 1A (FDFLG)
F4DE : D7 14      stab  $14           ;store B in addr 14 (FMAX)
F4E0 : DF 18      stx  $18            ;store X in addr 18 (SAMPC)
F4E2 : 7F 00 16   clr  $0016          ;clear addr 0016 (FLO)
;FNOIS0:
F4E5 : DE 18      ldx  $18            ;load X with addr 18 (SAMPC)
F4E7 : B6 04 00   ldaa  $0400         ;load A with addr 0400
;FNOIS1:
F4EA : 16         tab                 ;transfer A to B
F4EB : 54         lsrb                ;logic shift right B
F4EC : 54         lsrb                ;logic shift right B
F4ED : 54         lsrb                ;logic shift right B
F4EE : D8 0A      eorb  $0A           ;Exclusive Or B with addr 0A (LO)
F4F0 : 54         lsrb                ;logic shift right B
F4F1 : 76 00 09   ror  $0009          ;rotate right addr 0009 (HI)
F4F4 : 76 00 0A   ror  $000A          ;rotate right addr 000A (LO)
F4F7 : D6 14      ldab  $14           ;load B with addr 14 (FMAX) SET FREQ
F4F9 : 7D 00 1B   tst  $001B          ;test addr 1B (DSFLG)
F4FC : 27 04      beq  LF502          ;branch Z=1 FNOIS2
F4FE : D4 09      andb  $09           ;and B with addr 09 (HI) DISTORT FREQUENCY
F500 : DB 17      addb  $17           ;add B iwth addr 17 (SAMPC)
;FNOIS2:
F502 : D7 15      stab  $15           ;store B in addr 15 (FHI)
F504 : D6 16      ldab  $16           ;load B with addr 16 (FLO)
F506 : 91 0A      cmpa  $0A           ;compare A with addr 0A (LO)
F508 : 22 12      bhi  LF51C          ;branch FNOIS4
;FNOIS3:
F50A : 09         dex                 ;decr X
F50B : 27 26      beq  LF533
F50D : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F510 : DB 16      addb  $16
F512 : 99 15      adca  $15
F514 : 25 16      bcs  LF52C
F516 : 91 0A      cmpa  $0A
F518 : 23 F0      bls  LF50A
F51A : 20 10      bra  LF52C
;FNOIS4:
F51C : 09         dex
F51D : 27 14      beq  LF533
F51F : B7 04 00   staa  $0400
F522 : D0 16      subb  $16
F524 : 92 15      sbca  $15
F526 : 25 04      bcs  LF52C
F528 : 91 0A      cmpa  $0A
F52A : 22 F0      bhi  LF51C
;FNOIS5:
F52C : 96 0A      ldaa  $0A
F52E : B7 04 00   staa  $0400
F531 : 20 B7      bra  LF4EA
;FNOIS6:
F533 : D6 1A      ldab  $1A
F535 : 27 B3      beq  LF4EA
F537 : 96 14      ldaa  $14
F539 : D6 16      ldab  $16
F53B : 44         lsra
F53C : 56         rorb
F53D : 44         lsra
F53E : 56         rorb
F53F : 44         lsra
F540 : 56         rorb
F541 : 43         coma
F542 : 50         negb
F543 : 82 FF      sbca  #$FF
F545 : DB 16      addb  $16
F547 : 99 14      adca  $14
F549 : D7 16      stab  $16
F54B : 97 14      staa  $14
F54D : 26 96      bne  LF4E5
F54F : C1 07      cmpb  #$07
F551 : 26 92      bne  LF4E5
F553 : 39         rts                 ;return subroutine
;*************************************;
;IRQ (speech ROM and Walsh processing)
;*************************************;
F554 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
F557 : B6 04 02   ldaa  $0402         ;load A with PIA sound select
F55A : C6 80      ldab  #$80          ;load B with 80h
F55C : F7 04 02   stab  $0402         ;store B in PIA sound select
F55F : 7C 00 08   inc  $0008          ;incr addr 0008
F562 : 43         coma                ;complement 1s A
F563 : 84 3F      anda  #$3F          ;And A with 3Fh
F565 : 81 20      cmpa  #$20          ;compare A with 20h
F567 : 25 32      bcs  LF59B          ;branch C=1 IRQ6
F569 : 84 1F      anda  #$1F          ;And A with 1Fh
F56B : 81 05      cmpa  #$05          ;compare A with 05h
F56D : 2F 19      ble  LF588          ;branch Z+(N+V)=1 IRQ3
;CHECK FOR PRESENCE OF TALKING PROGRAM
F56F : F6 EF FD   ldab  $EFFD         ;load B with TALK - speech ROM
F572 : C1 7E      cmpb  #$7E          ;compare B with 7Eh
F574 : 27 04      beq  LF57A          ;branch Z=1 IRQ1
F576 : 86 12      ldaa  #$12          ;load A with 12h
F578 : 20 21      bra  LF59B          ;branch always IRQ6
;IRQ1 LF57A:
F57A : 80 04      suba  #$04          ;sub A with 04h
F57C : 81 15      cmpa  #$15          ;compare A with 15h
F57E : 2E 05      bgt  LF585          ;Z+(N+V)=0 IRQ2
F580 : BD EF FD   jsr  LEFFD          ;jump sub TALK - speech ROM
F583 : 20 13      bra  LF598          ;branch always IRQ5
;IRQ2 LF585:
F585 : 4F         clra                ;clear A
F586 : 20 10      bra  LF598          ;branch always IRQ5
;IRQ3 LF588:
F588 : CE FD 36   ldx  #$FD36         ;load X with FD36h IRQTB2 
;IRQ4 LF58B:
F58B : 4A         deca                ;decr A
F58C : 48         asla                ;arith shift left A
F58D : BD FC 42   jsr  LFC42          ;jump sub ADDX
F590 : A6 00      ldaa  $00,x         ;load A with X
F592 : E6 01      ldab  $01,x         ;load B with X+01h
F594 : 0E         cli                 ;clear interrupts I=0
F595 : BD FA 0F   jsr  LFA0F          ;jump sub WALSH
;IRQ5 LF598:
F598 : 7E F6 00   jmp  LF600          ;jump IRQ13
;IRQ6 LF59B:
F59B : 81 1F      cmpa  #$1F          ;compare A with 1Fh
F59D : 26 1E      bne  LF5BD          ;branch Z=0 IRQ7
F59F : 0E         cli                 ;clear interrupt C=0
;*************************************;
;Tilt sound, buzz saw down
;*************************************;
;TILT 
F5A0 : CE 00 E0   ldx  #$00E0         ;load X with 00E0h
;TILT1
F5A3 : 86 20      ldaa  #$20
F5A5 : BD FC 42   jsr  LFC42          ;jump sub ADDX
;TILT2
F5A8 : 09         dex
F5A9 : 26 FD      bne  LF5A8
F5AB : 7F 04 00   clr  $0400
;TILT3
F5AE : 5A         decb
F5AF : 26 FD      bne  LF5AE
F5B1 : 73 04 00   com  $0400
F5B4 : DE 0E      ldx  $0E            ;load X with 0E (XPLAY)
F5B6 : 8C 10 00   cpx  #$1000
F5B9 : 26 E8      bne  LF5A3
F5BB : 20 DB      bra  LF598
;*************************************;
;IRQ7 (GWave, Vari and BG2 processing)
;*************************************;
;IRQ7
F5BD : 36         psha                ;push A into stack then SP - 1
F5BE : 84 1F      anda  #$1F          ;And A with 1Fh
F5C0 : 81 10      cmpa  #$10          ;compare A with 10h
F5C2 : 27 03      beq  LF5C7          ;branch Z=1 IRQ8
F5C4 : 7F 00 06   clr  $0006          ;clear addr 0006
;IRQ8 LF5C7:
F5C7 : 81 10      cmpa  #$10          ;compare A with 10h
F5C9 : 27 03      beq  LF5CE          ;branch Z=1 IRQ9
F5CB : 7F 00 07   clr  $0007          ;clear addr 0007
;IRQ9 LF5CE:
F5CE : 32         pula                ;SP + 1 pull stack into A
F5CF : 0E         cli                 ;clear interrupts I=0
F5D0 : 84 1F      anda  #$1F          ;And A with 1Fh
F5D2 : 27 2C      beq  LF600          ;branch Z=1 IRQ13
F5D4 : CE FD 00   ldx  #$FD00         ;load X with FD00h IRQTB1
F5D7 : 81 10      cmpa  #$10          ;compare A with 10h
F5D9 : 24 03      bcc  LF5DE          ;branch C=0 IRQ10
F5DB : 7E F5 8B   jmp  LF58B          ;jump IRQ4
;IRQ10 LF5DE:
F5DE : 4A         deca                ;decr A
F5DF : 81 1B      cmpa  #$1B          ;compare A with 1Bh
F5E1 : 2D 10      blt  LF5F3          ;branch N+V=1 IRQ12
F5E3 : 80 18      suba  #$18          ;sub A with 18h
F5E5 : 81 05      cmpa  #$05          ;compare A with 05h
F5E7 : 26 02      bne  LF5EB          ;branch Z=0 IRQ11
F5E9 : 86 05      ldaa  #$05          ;load A with 05h
;IRQ11 LF5EB:
F5EB : BD F3 41   jsr  LF341          ;jump sub GWLD
F5EE : BD F3 A7   jsr  LF3A7          ;jump sub GWAVE
F5F1 : 20 0D      bra  LF600          ;branch always IRQ13
;IRQ12 LF5F3:
F5F3 : 80 0F      suba  #$0F          ;sub A with 0Fh
F5F5 : 48         asla                ;arith shift left A
F5F6 : CE FD 1E   ldx  #$FD1E         ;load X with JMPTBL
F5F9 : BD FC 42   jsr  LFC42          ;jump sub ADDX
F5FC : EE 00      ldx  $00,x          ;load X with X+00h
F5FE : AD 00      jsr  $00,x          ;jump sub X
;IRQ13 LF600:
F600 : 0E         cli                 ;clear interrupt I=0
F601 : 96 03      ldaa  $03           ;load A with addr 03 (BG1FLG)(BGROUND ACTIVE)
F603 : 9A 04      oraa  $04           ;Or A with addr 04 
;IRQ14 LF605:
F605 : 27 FE      beq  LF605          ;branch Z=1 here IRQ14 
F607 : 96 06      ldaa  $06           ;load A with addr 06 (B2FLG)
;IRQ15 LF609:
F609 : 26 FE      bne  LF609          ;branch Z=0 here IRQ15
F60B : 96 03      ldaa  $03           ;load A with addr 03 (BG1FLG)
F60D : 27 02      beq  LF611          ;branch Z=1 IRQ16
F60F : 2B 00      bmi  LF611          ;branch N=1 IRQ16
;IRQ16 LF611:
F611 : 7E F2 ED   jmp  LF2ED          ;BG2
;*************************************;
;VARPRM (Vari param)
;*************************************;
F614 : 86 00      ldaa  #$00          ;load A with 00h
F616 : BD F0 34   jsr  LF034          ;jump sub VARILD
F619 : BD F0 49   jsr  LF049          ;jump sub VARI
F61C : 20 E2      bra  LF600          ;branch always IRQ13
;*************************************;
;
;* NAM WALSH FUNCTION SOUND MACHINE V2
;
;* T. MURPHY  11/10/81
;
MINPER  EQU  25      ;6*25 = 150 MICROSECS IS MIN SAMPLE PERIOD
SOUND   SET  $400
;
WORG
        ORG  0       ;DESCRIPTION                                          : ADDR(S) 
;
        RMB  8       ;GLOBALS                                              : 0000-0007
;
FCMDPT  RMB  2       ;PTR TO CURRENT FILTER COMMAND (USER INITIALIZED)     : 0008-0009
PCMDPT  RMB  2       ;SAME FOR PITCH PROGRAM                               : 000A-000B
SMPPER  RMB  2       ;HI BYTE * 6 IS SAMPLE DELAY                          : 000C-000D
HRMTBL  RMB  2       ;PTR TO HARMONIC FN VALUE TABLE                       : 000E-000F
;
WAVSRT  RMB  16      ;WAVEFORM                                             : 0010-001F
;
PERVEL  RMB  2       ;ADDED TO SMPPER EACH WAVE (PITCH CONTROL)            : 0020-0021
GLBPRO  RMB  1       ;GLOBAL PERIOD OFFSET                                 : 0022
TMPPER  RMB  1       ;= SMPPER + GLBPRO                                    : 0023
PERACM  RMB  1       ;USED TO CALCULATE SMALL PITCH ADJUSTS                : 0024
;
PWVCNT  EQU  *       ;#OF WAVES TO PLAY BEFORE NEXT PITCH CMD (P PROGRAM)  :
PSTK    RMB  2       ;TOP OF PITCH RETURN/COUNT STACK                      : 0025-0026
PWAVPT  RMB  2       ;PTR TO CURRENT SAMPLE BEING PLAYED                   : 0027-0028
PCMD    RMB  1       ;CURRENT PITCH CMD                                    : 0029
PTEMP   RMB  2       ;                                                     : 002A-002B
;
FVECT   RMB  3       ;JUMP TO CURRENT FILTER STATE (FILTER PGM CONTROL)    : 002C-002E
FCNT    EQU  *       ;MISC CTR, WAVE DELAY IF <0
FSTK    RMB  2       ;TOP OF FILTER RETURN/COUNT STACK                     : 002F-0030
HAPTR   RMB  2       ;PTR TO AMPLITUDE OF CURRENT HARMONIC                 : 0031-0032
;
FWVPTR  RMB  2       ;PTS TO WAVE PT BEING ALTERED (FILTER GUTS)           : 0033-0034
HAMP    RMB  1       ;CURRENT HARMONIC AMPLITUDE                           : 0035
FMSK    RMB  1       ;BIT MASK SELECTS HARMONIC FN VALUE                   : 0036
*                    ;NEXT 3 MUST BE IN ORDER
FNHI    RMB  1       ;HOLDS CURRENT HARMONIC FN VALUES AS BITS             : 0037
FNLO    RMB  1       ;ALSO USED AS TEMPORARIES                             : 0038
FCMD    RMB  1       ;CURRENT INSTRUCTION BEING EXECUTED                   : 0039
;
FBTM    EQU  *-3     ;FILTER STACK GROWS UP
        ORG  95      ;                                                     : 005F
PBTM    EQU  *       ;PITCH STACK GROWS DOWN
;
        RMB  1       ;ADD2HA FOR CONST WAVE                                : 0060
ADD2HA  RMB  8       ;ADD ADD2HA(8-I)*HARM(I) TO WAVE                      : 0061-0068
CNAMP   RMB  1       ;CURRENT AMP OF CONST FUNCTION                        : 0069
CURHA   RMB  8       ;CURHA(8-I) = <WAVE!HARM(I)>                          : 006A-0071
;
ENDRAM  SET  127     ;                                                     : 007F
;
        ORG  WORG
;
;       SUBTTL WAVE PLAYER AND PITCH MODIFICATION
;
;* PLAY A SAMPLE, REMAINING DELAY IN B.  TOTAL DELAY = MIN (60,B*6) MICS.
;
;NTHRVC
F61E : C0 0D      subb  #$0D          ;
F620 : 37         pshb                ;
F621 : BD 00 2C   jsr  L002C
F624 : 33         pulb
;NXTSMP:
F625 : C1 14      cmpb  #$14
F627 : 22 F5      bhi  LF61E
F629 : 01         nop
F62A : 96 24      ldaa  $24
F62C : 9B 21      adda  $21
F62E : 97 24      staa  $24
F630 : C9 F6      adcb  #$F6
;
F632 : 5A         decb
F633 : 2A FD      bpl  LF632
;
F635 : 96 28      ldaa  $28
F637 : 4C         inca
F638 : 84 0F      anda  #$0F
F63A : 8A 10      oraa  #$10
F63C : 97 28      staa  $28
;
F63E : DE 27      ldx  $27
F640 : E6 00      ldab  $00,x
F642 : F7 04 00   stab  $0400
;
F645 : 84 0F      anda  #$0F
F647 : 39         rts                 ;return subroutine
;
;* PLAYS WAVE AND ALTERS PITCH ACCORDING TO PITCH CMDS.
;* SMPPER IS INITIAL PITCH,  PCMDPT IS START PITCH PROGRAM,
;* FCMDPT IS START WAVE MODIFIER (FILTER) PROGRAM.
;
;WSM
F648 : 4F         clra
F649 : CE 00 10   ldx  #$0010
F64C : C6 61      ldab  #$61
;1$
F64E : A7 00      staa  $00,x
F650 : 08         inx
F651 : 5A         decb
F652 : 26 FA      bne  LF64E
F654 : C6 5F      ldab  #$5F
F656 : D7 26      stab  $26
F658 : C6 37      ldab  #$37
F65A : D7 30      stab  $30
F65C : C6 7E      ldab  #$7E
F65E : D7 2C      stab  $2C
F660 : CE F8 33   ldx  #$F833
F663 : DF 2D      stx  $2D
F665 : D6 0C      ldab  $0C
F667 : D7 23      stab  $23
;
;PPLPE1
F669 : C0 03      subb  #$03
;PPLPE2
F66B : BD F6 25   jsr  LF625
F66E : 08         inx
;
;PPLP
F66F : D6 23      ldab  $23
F671 : C0 02      subb  #$02
F673 : BD F6 1E   jsr  LF61E
F676 : 26 F7      bne  LF66F
;
F678 : D6 20      ldab  $20
F67A : 96 21      ldaa  $21
F67C : 9B 0D      adda  $0D
F67E : D9 0C      adcb  $0C
F680 : 97 0D      staa  $0D
F682 : D7 0C      stab  $0C
;
F684 : DB 22      addb  X0022
F686 : 86 19      ldaa  #$19
F688 : 11         cba
F689 : 24 01      bcc  LF68C
;F68B : 81 16    "  "    cmpa  #$16   ;<- disasm error (FCB 81 TAB)
F68B : 81                             ;FCB 129
F68C : 16         tab                 ;
F68D : D7 23      stab  $23           ;
F68F : 01         nop
F690 : C0 09      subb  #$09
F692 : BD F6 25   jsr  LF625
;
F695 : 96 2F      ldaa  $2F
F697 : 16         tab
F698 : 48         asla
F699 : C9 00      adcb  #$00
F69B : D7 2F      stab  $2F
;
F69D : D6 23      ldab  $23
F69F : C0 05      subb  #$05
F6A1 : 96 25      ldaa  $25
F6A3 : 2A 06      bpl  LF6AB
;
F6A5 : 7C 00 25   inc  $0025
F6A8 : 01         nop
F6A9 : 20 BE      bra  LF669
;
;PAWAKE
F6AB : 5A         decb
F6AC : BD F6 25   jsr  LF625
;
F6AF : DE 0A      ldx  $0A
F6B1 : A6 00      ldaa  $00,x
F6B3 : 2A 12      bpl  LF6C7
;
F6B5 : 81 80      cmpa  #$80
F6B7 : 27 5F      beq  LF718
;
F6B9 : 4C         inca
F6BA : 97 25      staa  $25
F6BC : 08         inx
;F6BD : FF 00 0A    "   "    stx  X000A  ;<- disasm error (FCB -1,0,PCMDPT)
F6BD : FF                             ;-1  BEFORE FETCHING THE NEXT COMMAND
F6BE : 00                             ;0
F6BF : 0A                             ;PCMDPT
;
;PPLP35
F6C0 : D6 23      ldab  $23
F6C2 : C0 06      subb  #$06
F6C4 : 7E F6 69   jmp  LF669
;
;PPLP1
F6C7 : 08         inx
F6C8 : E6 00      ldab  $00,x
F6CA : 37         pshb
F6CB : 08         inx
F6CC : DF 0A      stx  $0A
;
F6CE : 97 29      staa  $29
F6D0 : 84 70      anda  #$70
F6D2 : 44         lsra
F6D3 : 44         lsra
F6D4 : 44         lsra
F6D5 : 5F         clrb
;
F6D6 : 8B AC      adda  #$AC
F6D8 : C9 F7      adcb  #$F7
F6DA : 97 2B      staa  $2B
F6DC : D7 2A      stab  $2A
;
F6DE : D6 23      ldab  $23
F6E0 : D6 23      ldab  $23
F6E2 : C0 0D      subb  #$0D
F6E4 : BD F6 25   jsr  LF625
;
F6E7 : 5F         clrb
F6E8 : DE 2A      ldx  $2A
F6EA : EE 00      ldx  $00,x
F6EC : 6E 00      jmp  $00,x            ;INFO: index jump
;
;* PITCH COMMAND ROUTINES.  UNLESS OTHERWISE STATED, N IS A SIGNED 8 BIT
;* NUMBER = BYTE FOLLOWING OPCODE.
;
;* LDP N  IS  SMPPER := N,  ADP N  IS SMPPER := SMPPER + N
;
;LDPR
F6EE : 96 29      ldaa  $29
F6F0 : 47         asra
F6F1 : C2 00      sbcb  #$00
F6F3 : D4 0C      andb  $0C
F6F5 : 32         pula
F6F6 : 10         sba
F6F7 : 9B 0C      adda  $0C
F6F9 : 97 0C      staa  $0C
F6FB : 08         inx
;LDPRE
F6FC : D6 23      ldab  $23
F6FE : C0 0A      subb  #$0A
F700 : 7E F6 6B   jmp  LF66B
;
;* LDO N IS  GLBPRO := N,  ADO N IS  GLBPRO := GLBPRO + N
;
;LDOR
F703 : 96 29      ldaa  $29
F705 : 47         asra
F706 : C2 00      sbcb  #$00
F708 : D4 22      andb  $22
F70A : 32         pula
F70B : 10         sba
F70C : 9B 22      adda  $22
F70E : 97 22      staa  $22
F710 : 20 EA      bra  LF6FC
;
;* ESC EXECUTES MACHINE LANGUAGE IMMEDIATELY FOLLOWING
;
;ESCR
F712 : 32         pula
F713 : DE 0A      ldx  $0A
F715 : 09         dex
F716 : 6E 00      jmp  $00,x            ;INFO: index jump
;
;* STOP EITHER REPEATS A CALL, RETURNS FROM A CALL, OR ENDS SOUND.
;
;STOPR
F718 : 96 26      ldaa  $26
F71A : 81 5F      cmpa  #$5F
F71C : 2B 01      bmi  LF71F
F71E : 39         rts
;
F71F : D6 23      ldab  $23
F721 : C0 07      subb  #$07
F723 : BD F6 25   jsr  LF625
;
F726 : DE 25      ldx  $25
F728 : 6A 02      dec  $02,x
F72A : 2B 12      bmi  LF73E
;
F72C : EE 00      ldx  $00,x
F72E : A6 00      ldaa  $00,x
F730 : 36         psha
F731 : 08         inx
F732 : DF 0A      stx  $0A
;
;F734 : F6 00 23    "  #"    ldab  X0023  ;<- disasm error (FCB -10,0,TMPPER)
F734 : F6                             ;-10
F735 : 00                             ;0
F736 : 23                             ;TMPPER
F737 : C0 09      subb  #$09
F739 : BD F6 25   jsr  LF625
;
F73C : 20 55      bra  LF793
;
;PRET
F73E : EE 00      ldx  $00,x
F740 : 08         inx
F741 : DF 0A      stx  $0A
F743 : 96 26      ldaa  $26
F745 : 8B 03      adda  #$03
F747 : 97 26      staa  $26
;
F749 : D6 23      ldab  $23
F74B : C0 07      subb  #$07
F74D : 01         nop
F74E : 7E F6 69   jmp  LF669
;
;* LDV N IS  PERVEL := N,  ADV N IS  PERVEL := PERVEL + N
;* IN THIS CASE  N IS A 12 BIT NUMBER, THE UPPER 4 BITS OF WHICH
;* ARE LO 4 BITS OF THE OPCODE BYTE.
;
;ADVR
F751 : 08         inx
F752 : 20 04      bra  LF758
;
;LDVR
F754 : D7 20      stab  $20
F756 : D7 21      stab  $21
;
F758 : D6 29      ldab  $29
F75A : C4 0F      andb  #$0F
F75C : CB F8      addb  #$F8
F75E : C8 F8      eorb  #$F8
;
F760 : 32         pula
F761 : 9B 21      adda  $21
F763 : D9 20      adcb  $20
F765 : 97 21      staa  $21
F767 : D7 20      stab  $20
;
;F769 : F6 00 23    "  #"    ldab  X0023   ;<- disasm error (FCB -10,0,TMPPER)
F769 : F6                             ;-10
F76A : 00                             ;0
F76B : 23                             ;TMPPER
F76C : C0 09      subb  #$09
F76E : 7E F6 69   jmp  LF669
;
;* DO R,N  CALLS RTN AT *+N  R TIMES.
;
;PDOR
F771 : 96 26      ldaa  $26
F773 : 80 03      suba  #$03
F775 : 97 26      staa  $26
;
F777 : DE 25      ldx  $25
F779 : 96 0B      ldaa  $0B ;(PCMDPT+1) STACK ENTRY TO DISPLACEMENT
F77B : D6 0A      ldab  $0A
F77D : 8B FF      adda  #$FF
F77F : C9 FF      adcb  #$FF
F781 : E7 00      stab  $00,x
F783 : A7 01      staa  $01,x
F785 : D6 29      ldab  $29
F787 : C4 0F      andb  #$0F
F789 : E7 02      stab  $02,x
;
F78B : D6 23      ldab  $23
F78D : C0 0C      subb  #$0C
F78F : BD F6 25   jsr  LF625
;
F792 : 08         inx
;PTORE1
F793 : 08         inx
F794 : 08         inx
F795 : 5F         clrb
F796 : 01         nop
;
;* TO N  SETS LOC TO BE *+N.
;
;PTOR
F797 : 32         pula
F798 : 47         asra
F799 : 49         rola
F79A : C2 00      sbcb  #$00
F79C : 9B 0B      adda  $0B
F79E : D9 0A      adcb  $0A
F7A0 : 97 0B      staa  $0B
;F7A2 : F7 00 0A    "   "    stab  X000A   ;<- disasm error (FCB -9,0,PCMDPT 41)
F7A2 : F7                             ;-9
F7A3 : 00                             ;0
F7A4 : 0A                             ;PCMDPT
F7A5 : D6 23      ldab  $23
F7A7 : C0 07      subb  #$07
F7A9 : 7E F6 69   jmp  LF669
;*************************************;
; JMPTBL1
;*************************************;
;PCMDJT FDB LDPR,LDOR,LDVR,ADVR,LDPR,ESCR,PDOR,PTOR
;*          0    1    2    3    4    5    6    7
;FCMDJT FDB ADHR,LDTR,ETBR,HIDR,FINR,ZTBR,FDOR,FTOR
;
;PCMDJT FDB (Pitch Command Jump Table)
F7AC : F6EE                           ;LDPR 0
F7AE : F703                           ;LDOR 1
F7B0 : F754                           ;LDVR 2
F7B1 : F751                           ;ADVR 3
F7B4 : F6EE                           ;LDPR 4
F7B6 : F712                           ;ESCR 5
F7B8 : F771                           ;PDOR 6
F7BA : F797                           ;PTOR 7
;FCMDJT FDB (Filter Command Jump Table)
F7BC : F92D                           ;ADHR 0
F7BE : F9B6                           ;LDTR 1
F7C0 : F868                           ;ETBR 2
F7C2 : F95E                           ;HIDR 3
F7C4 : F7E3                           ;FINR 4
F7C6 : F96F                           ;ZTBR 5
F7C8 : F80E                           ;FDOR 6
F7CA : F8A2                           ;FTOR 7
;
;
;SUBTTL WAVE MODIFICATION
;
;* FENDR OVERLAY GETS RETURN ADDR FROM STACK.
;
;FRTURN
F7CC : DE 2F      ldx  $2F            ;(FSTK)
F7CE : EE 03      ldx  $03,x          ;(3,X)
F7D0 : 08         inx
F7D1 : DF 08      stx  $08
F7D3 : BD F8 9C   jsr  LF89C
F7D6 : 08         inx
F7D7 : 39         rts
;
;* REPEAT CALL.
;
;FDOAGN
F7D8 : EE 00      ldx  $00,x
F7DA : DF 08      stx  $08
F7DC : CE F8 A2   ldx  #$F8A2
F7DF : DF 2D      stx  $2D
F7E1 : 01         nop
F7E2 : 39         rts
;
;* FIN DOES  REPEAT CALL, RETURN TO CALLER, STOP RTN DEPENDING ON STACK.
;
;FINR
F7E3 : 96 30      ldaa  $30
F7E5 : 81 37      cmpa  #$37
F7E7 : 23 12      bls  LF7FB
;
F7E9 : DE 2F      ldx  $2F
F7EB : 6A 02      dec  $02,x
F7ED : 2A E9      bpl  LF7D8
;
F7EF : 80 03      suba  #$03
F7F1 : 97 30      staa  $30
F7F3 : CE F7 CC   ldx  #$F7CC
F7F6 : DF 2D      stx  $2D
F7F8 : 6D 00      tst  $00,x
F7FA : 39         rts
;
;ALLDON
F7FB : CE F8 03   ldx  #$F803
F7FE : DF 2D      stx  $2D
F800 : 01         nop
F801 : 20 05      bra  LF808
;
;WAST50
F803 : 08         inx
F804 : 08         inx
F805 : 01         nop
;WAST40
F806 : 8D 05      bsr  LF80D
;WAST27
F808 : 8D 03      bsr  LF80D
;WAST14
F80A : 6D 00      tst  $00,x
;WAST7
F80C : 01         nop
;WAST5
F80D : 39         rts                 ;return subroutine
;
;* CALL WITH REPEAT. REPEAT CNT 0(=1) TO 15 (=16) IS LO 4 BITS OF OPCODE.
;* NEXT BYTE IS DISPLACEMENT AS IN GO INSTRUCTION.  THE CTR AND RETURN
;* ADDRESS ARE SAVED ON A STACK.
;
;FDOR
F80E : DE 2F      ldx  $2F
F810 : 96 08      ldaa  $08
F812 : A7 03      staa  $03,x
F814 : 96 09      ldaa  $09
F816 : A7 04      staa  $04,x
F818 : 96 39      ldaa  $39
F81A : 84 0F      anda  #$0F
F81C : A7 05      staa  $05,x
F81E : 08         inx
;
F81F : CE F8 25   ldx  #$F825
F822 : DF 2D      stx  $2D
F824 : 39         rts                 ;return subroutine
;
;* OVERLAY FOR CALL RTN.
;
;1$
F825 : 96 30      ldaa  $30
F827 : 8B 03      adda  #$03
F829 : 97 30      staa  $30
F82B : CE F8 A2   ldx  #$F8A2
F82E : DF 2D      stx  $2D
F830 : 01         nop
F831 : 20 D5      bra  LF808
;
;* GET NEXT FILTER COMMAND
;
;NXTFCM
F833 : 7D 00 2F   tst  $002F
F836 : 26 CE      bne  LF806
;
F838 : DE 08      ldx  $08
F83A : A6 00      ldaa  $00,x
F83C : 08         inx
F83D : DF 08      stx  $08
F83F : 97 39      staa  $39
F841 : 2A 05      bpl  LF848
;
F843 : 97 2F      staa  $2F
F845 : A6 00      ldaa  $00,x
F847 : 39         rts                 ;return subroutine
;1$:
;LF848:
F848 : CE F8 4F   ldx  #$F84F
;F84B : FF 00 2D    "  -"    stx  X002D   ;<- disasm error (FCB -1,0,FVECT+1)
F84B : FF                             ;-1
F84C : 00                             ;0
F84D : 2D                             ;FVECT+1
F84E : 39         rts                 ;return subroutine
;
;
;EXFCMD
F84F : 5F         clrb
F850 : 96 39      ldaa  $39
F852 : 84 70      anda  #$70
F854 : 44         lsra
F855 : 44         lsra
F856 : 44         lsra
F857 : 8B BC      adda  #$BC
F859 : C9 F7      adcb  #$F7
F85B : D7 37      stab  $37
F85D : 97 38      staa  $38
;
F85F : DE 37      ldx  $37
F861 : EE 00      ldx  $00,x
F863 : DF 2D      stx  $2D
F865 : DF 2D      stx  $2D
F867 : 39         rts                 ;return subroutine
;
;* SET UP FOR REPEATED TABLE ADD.
;
;ETBR
F868 : 96 39      ldaa  $39
F86A : 84 0F      anda  #$0F
F86C : 4C         inca
F86D : 4C         inca
F86E : 97 2F      staa  $2F
F870 : 20 1A      bra  LF88C
;
;* LOOK FOR A NONZERO HARMONIC CHANGE AND PERFORM IT.  IF ENTIRE TABLE
;* IS ZERO WE HAVE FINISHED THE LAST COMMAND AND PICK UP THE NEXT ONE.
;
;FINDHA
F872 : 7C 00 32   inc  $0032
F875 : DE 31      ldx  $31
F877 : 8C 00 68   cpx  #$0068
F87A : 27 10      beq  LF88C
;
F87C : A6 00      ldaa  $00,x
F87E : CE F8 B6   ldx  #$F8B6
F881 : 97 35      staa  $35
F883 : 26 03      bne  LF888
F885 : CE F8 72   ldx  #$F872
F888 : DF 2D      stx  $2D
F88A : 08         inx
F88B : 39         rts            ;return subroutine
;
;FHA1:
F88C : 86 5E      ldaa  #$5E
;F88E : B7 00 32    "  2"    staa  X0032   ;<- disasm error (FCB $B7,0,HAPTR+1)
F88E : B7                             ;$B7
F88F : 00                             ;0
F890 : 32                             ;HAPTR+1
F891 : CE F8 72   ldx  #$F872
F894 : 7A 00 2F   dec  $002F
F897 : 27 03      beq  LF89C
F899 : 7E F8 9F   jmp  LF89F
;FCMDNX:
F89C : CE F8 33   ldx  #$F833
F89F : DF 2D      stx  $2D
F8A1 : 39         rts                 ;return subroutine
;
;* RELATIVE JUMP.
;
;FTOR
F8A2 : DE 08      ldx  $08
F8A4 : 5F         clrb
F8A5 : A6 00      ldaa  $00,x
F8A7 : 4C         inca
F8A8 : 47         asra
F8A9 : 49         rola
F8AA : C2 00      sbcb  #$00
F8AC : 9B 09      adda  $09
F8AE : D9 08      adcb  $08
F8B0 : 97 09      staa  $09
F8B2 : D7 08      stab  $08
;
F8B4 : 20 E6      bra  LF89C
;
;* SET UP FOR ADD OF HAMP * HARMONIC TO WAVE.
;
;ADDINI
F8B6 : 96 32      ldaa  $32
F8B8 : 80 5F      suba  #$5F
F8BA : 48         asla
F8BB : 5F         clrb
F8BC : 9B 0F      adda  $0F
F8BE : D9 0E      adcb  $0E
F8C0 : D7 37      stab  $37
F8C2 : 97 38      staa  $38
;
F8C4 : 86 80      ldaa  #$80
F8C6 : 97 36      staa  $36
;
F8C8 : CE F8 D3   ldx  #$F8D3
F8CB : DF 2D      stx  $2D
F8CD : CE 00 10   ldx  #$0010
F8D0 : DF 33      stx  $33
F8D2 : 39         rts                 ;return subroutine
;
;2$
F8D3 : DE 37      ldx  $37
F8D5 : EE 00      ldx  $00,x
F8D7 : DF 37      stx  $37
F8D9 : CE F8 E8   ldx  #$F8E8
F8DC : DF 2D      stx  $2D
;
F8DE : DE 31      ldx  $31
F8E0 : A6 09      ldaa  $09,x
F8E2 : 9B 35      adda  $35
F8E4 : A7 09      staa  $09,x
F8E6 : 08         inx
F8E7 : 39         rts            ;return subroutine
;
;* ADD HAMP * HARMONIC FN TO WAVEFORM.
;
;ADDLP
F8E8 : 96 36      ldaa  $36
F8EA : 27 1D      beq  LF909
;
F8EC : 74 00 36   lsr  $0036
F8EF : DE 33      ldx  $33
F8F1 : E6 00      ldab  $00,x
F8F3 : 94 37      anda  $37
F8F5 : 26 09      bne  LF900
;F8F7 : FB 00 35    "  5"    addb  X0035   ;<- disasm error (FCB -5,0,HAMP)
F8F7 : FB                             ;-5
F8F8 : 00                             ;0
F8F9 : 35                             ;HAMP
F8FA : E7 00      stab  $00,x
F8FC : 7C 00 34   inc  $0034
F8FF : 39         rts            ;return subroutine
;2$:
;F900 : F0 00 35    "  5"    subb  X0035   ;<- disasm error (FCB -16,0,HAMP)
F900 : F0                             ;-16
F901 : 00                             ;0
F903 : 35                             ;HAMP
F903 : E7 00      stab  $00,x
F905 : 7C 00 34   inc  $0034
F908 : 39         rts            ;return subroutine
;1$:
F909 : D6 34      ldab  $34
F90B : C1 20      cmpb  #$20
F90D : 27 0B      beq  LF91A
F90F : D6 38      ldab  $38
F911 : D7 37      stab  $37
F913 : C6 80      ldab  #$80
;F915 : F7 00 36    "  6"    stab  X0036   ;<- disasm error (FCB -9,0,FMSK)
F915 : F7                             ;-9
F916 : 00                             ;0
F917 : 36                             ;FMSK
F918 : 20 0F      bra  LF929
;3$:
F91A : CE F8 33   ldx  #$F833
F91D : D6 2F      ldab  $2F
F91F : 26 03      bne  LF924
F921 : 7E F9 27   jmp  LF927
F924 : CE F8 72   ldx  #$F872
F927 : DF 2D      stx  $2D
;16$:
F929 : 6D 00      tst  $00,x
F92B : 08         inx
F92C : 39         rts                 ;return subroutine
;
;* ADH H,N  LDH H,N  USE SAME RTN
;
;ADHR
;LDHR
F92D : 96 39      ldaa  $39
F92F : 84 07      anda  #$07
F931 : 8B 60      adda  #$60
F933 : 97 32      staa  $32
;
F935 : DE 08      ldx  $08
F937 : A6 00      ldaa  $00,x
F939 : 08         inx
F93A : DF 08      stx  $08
F93C : 97 35      staa  $35
;
F93E : CE F9 45   ldx  #$F945
F941 : DF 2D      stx  $2D
F943 : 08         inx
F944 : 39         rts                 ;return subroutine
;1$
F945 : DE 31      ldx  $31
F947 : 5F         clrb
F948 : 96 39      ldaa  $39
F94A : 8B F8      adda  #$F8
F94C : C2 00      sbcb  #$00
F94E : E4 09      andb  $09,x
F950 : 50         negb
F951 : DB 35      addb  $35
;ADHRE:
F953 : D7 35      stab  $35
F955 : CE F8 B6   ldx  #$F8B6
F958 : DF 2D      stx  $2D
F95A : 08         inx
F95B : 08         inx
F95C : 01         nop
F95D : 39         rts                 ;return subroutine
;
;* HARMONIC INCREMENT OR DECREMENT
;
;HIDR
F95E : D6 39      ldab  $39
F960 : 54         lsrb
F961 : C4 07      andb  #$07
F963 : CA 60      orab  #$60
F965 : D7 32      stab  $32
;
F967 : C6 FF      ldab  #$FF
F969 : C9 00      adcb  #$00
F96B : C9 00      adcb  #$00
F96D : 20 E4      bra  LF953
;
;* CLEAR ADD2HA OR ALTER 0TH AMPLITUDE.
;
;ZTBR
F96F : 96 39      ldaa  $39
F971 : 47         asra
F972 : 25 13      bcs  LF987
;
F974 : CE 00 00   ldx  #$0000
F977 : DF 60      stx  $60
F979 : DF 62      stx  $62
F97B : DF 64      stx  $64
F97D : DF 66      stx  $66
F97F : 08         inx
;
;ATBRE
F980 : CE F8 33   ldx  #$F833
;F983 : FF 00 2D    "  -"    stx  X002D   ;<- disasm error (FCB -1,0,FVECT+1)
F983 : FF                             ;-1
F984 : 00                             ;0
F985 : 2D                             ;FVECT+1
;ATBRE1
F986 : 39         rts                 ;return subroutine
;
;ADCR:
F987 : 85 02      bita  #$02
F989 : 26 0C      bne  LF997
F98B : C6 5F      ldab  #$5F
F98D : D7 32      stab  $32
F98F : CE F9 9C   ldx  #$F99C
;ADCRE:
F992 : DF 2D      stx  $2D
F994 : 7E F8 0A   jmp  LF80A
;
;ESC1:
;F997 : FE 00 08    "   "    ldx  X0008   ;<- disasm error (FCB -2,0,FCMDPT)
F997 : FE                             ;-2
F998 : 00                             ;0
F999 : 08                             ;FCMDPT
F99A : 20 F6      bra  LF992
;
;ADCRO
F99C : 5F         clrb
F99D : 96 39      ldaa  $39
F99F : 8B AE      adda  #$AE
F9A1 : C2 00      sbcb  #$00
F9A3 : D4 68      andb  $68
F9A5 : DE 08      ldx  $08
F9A7 : A6 00      ldaa  $00,x
F9A9 : 08         inx
F9AA : DF 08      stx  $08
F9AC : 10         sba
F9AD : 97 35      staa  $35
F9AF : CE F8 B6   ldx  #$F8B6
;F9B2 : FF 00 2D    "  -"    stx  X002D   ;<- disasm error (FCB -1,0,FVECT+1)
F9B2 : FF                             ;-1
F9B3 : 00                             ;0
F9B4 : 2D                             ;FVECT+1
F9B5 : 39         rts                 ;return subroutine
;
;* CHANGE SOME ADD2HA ENTRIES.
;
;LDTR
F9B6 : C6 60      ldab  #$60
F9B8 : D7 32      stab  $32
F9BA : DE 08      ldx  $08
F9BC : E6 00      ldab  $00,x
F9BE : D7 37      stab  $37
F9C0 : 08         inx
F9C1 : DF 08      stx  $08
F9C3 : D6 39      ldab  $39
F9C5 : 54         lsrb
F9C6 : 24 18      bcc  LF9E0
F9C8 : CE F9 FA   ldx  #$F9FA
F9CB : DF 2D      stx  $2D
F9CD : 39         rts                 ;return subroutine
;4$
F9CE : 5F         clrb
F9CF : 96 38      ldaa  $38
F9D1 : 47         asra
F9D2 : C2 00      sbcb  #$00
F9D4 : DE 31      ldx  $31
F9D6 : E4 00      andb  $00,x
F9D8 : 1B         aba
F9D9 : A7 00      staa  $00,x
F9DB : 7C 00 32   inc  $0032
F9DE : A6 00      ldaa  $00,x
;5$:
F9E0 : CE F9 E6   ldx  #$F9E6
F9E3 : DF 2D      stx  $2D
F9E5 : 39         rts                 ;return subroutine
;1$
F9E6 : 78 00 37   asl  $0037
F9E9 : 25 13      bcs  LF9FE
F9EB : 27 06      beq  LF9F3
F9ED : 7C 00 32   inc  $0032
F9F0 : 7E F8 08   jmp  LF808
;3$:
F9F3 : BD F8 9C   jsr  LF89C
F9F6 : 6D 00      tst  $00,x
F9F8 : 01         nop
F9F9 : 39         rts                 ;return subroutine
;6$:
F9FA : 7A 00 32   dec  $0032
F9FD : 08         inx
;2$:
F9FE : A6 00      ldaa  $00,x
FA00 : DE 08      ldx  $08
FA02 : A6 00      ldaa  $00,x
FA04 : 08         inx
FA05 : DF 08      stx  $08
FA07 : 97 38      staa  $38
FA09 : CE F9 CE   ldx  #$F9CE
FA0C : DF 2D      stx  $2D
FA0E : 39         rts                 ;return subroutine
;*************************************;
;
;WALSH
;LFA0F:
FA0F : 48         asla                ;arith shift left A
FA10 : 8B 3D      adda  #$3D          ;(#WALSHT!.255)
FA12 : 97 09      staa  $09           ;(FCMDPT+1)
FA14 : 86 FA      ldaa  #$FA          ;(#WALSH/256)
FA16 : 89 00      adca  #$00          ;add Carry A and 00h
FA18 : 97 08      staa  $08           ;store A in addr 08 (FCMDPT)
FA1A : DE 08      ldx  $08            ;
FA1C : EE 00      ldx  $00,x
FA1E : DF 08      stx  $08
;
FA20 : 4F         clra
FA21 : 58         aslb
FA22 : CB 51      addb  #$51          ;(#WALSHT!.255)
FA24 : 89 FA      adca  #$FA          ;(#WALSH/256)
FA26 : 97 0A      staa  $0A           ;
FA28 : D7 0B      stab  $0B
FA2A : DE 0A      ldx  $0A
FA2C : EE 00      ldx  $00,x
FA2E : A6 00      ldaa  $00,x
FA30 : 97 0C      staa  $0C
FA32 : 08         inx
FA33 : DF 0A      stx  $0A
FA35 : CE FA 65   ldx  #$FA65         ;ODDTBL
FA38 : DF 0E      stx  $0E
FA3A : 7E F6 48   jmp  LF648          ;jump WSM
;*************************************;
; WALSHT 
;*************************************;
FA3D : FA77                           ;UNKNLB
FA3F : FA88                           ;LBL01
FA41 : FAAE                           ;
FA43 : FAC1                           ;
FA45 : FAEA                           ;
FA47 : FAFC                           ;
FA49 : FB39                           ;
FA4B : FB73                           ;
FA4D : FB7E                           ;
FA4F : FB7C                           ;
;
FA51 : FB96                           ;
FA53 : FB9A                           ;
FA55 : FBA8                           ;
FA57 : FBBC                           ;
FA59 : FBC4                           ;
FA5B : FBD2                           ;
FA5D : FBED                           ;
FA5F : FC0F                           ;
FA61 : FC27                           ;
FA63 : FC37                           ;
;*************************************;
;
;SUBTTL SOUND PROGRAMS
;
;* OPCODES ( ! SEPERATES NYBBLES  SPACES SEPERATE BYTES)
;
;* COMMON
;* WAIT N -N  ( 1<= N<= 127)
;* DO R,RTN $6!(R-1)  RTN - NEXT LOC
;* TO RTN $70   RTN - NEXT LOC
;* ESC  $55
;
;* FREQUENCY CONTROL
;* STOP          $80
;* LDP N         $01 N
;* ADP N         $00 N
;* LDV N         $2!(N&$F00) N&255
;* ADV N         $3!(N&$F00) N&255
;* LDO N         $11 N
;* ADO N         $10 N

;* WAVE CONTROL
;* FIN           $40
;* ZT            $50
;* ADH 0,N       $51 N
;* LDH 0,N       $53 N
;*        ( IN WHAT FOLLOWS 1<=H<=8  HHH = 8-H, A 3 BIT NUMBER)
;* ADH H,N       $0!0HHH
;* LDH H,N       $0!1HHH
;* IH H          $3!HHH1
;* DH H          $3!HHH0
;* DT R          $2!(R-1)
;* LT A0,...,A8  $1!000C 8765!4321 B0,...,B8
;*               WHERE C=1 IF ENTRY 0 IS ALTERED
;*                     N=1 IF ENTRY N IS ALTERED (N=1,...,8)
;*               BN=AN+AN+P WHERE P=1 IF AN IS TO BE ADDED TO ENTRY N
;*                                P=0 IF AN REPLACES ENTRY N
;*               BN IS PRESENT ONLY IF ENTRY N IS TO BE ALTERED

;* HARMONIC FUNCTIONS.  EACH BIT POSITION CORRESPONDS TO A WAVEFORM
;* POSITION.  IF THE BIT = 0, THE VALUE IS +1  IF THE BIT = 1, THE
;* VALUE IS -1.
;
;* THE HARMONICS ARE TREATED IN ORDER OF DECREASING AVERAGE FREQUENCY.
;
;*************************************;
;ODDTBL
;*************************************; 
FA65 : 0000                           ;FDB %0000000000000000  0  CONSTANT IS WEIRDO FOR NOW
FA67 : 5555                           ;FDB %0101010101010101  8
FA69 : AA55                           ;FDB %1010101001010101  7
FA6B : 5A5A                           ;FDB %0101101001011010  6
FA6D : 9669                           ;FDB %1001011001101001  5
FA6F : 6666                           ;FDB %0110011001100110  4
FA71 : CC33                           ;FDB %1100110000110011  3
FA73 : 3C3C                           ;FDB %0011110000111100  2
FA75 : 0FF0                           ;FDB %0000111111110000  1
;*************************************;
; Unknown Label - is in Hyperball ROM too, no id yet
;*************************************;
;UNKNLB
FA77 : 0F 
FA78 : 28 0E
FA7A : 28 0D
FA7C : 28 0C
FA7E : 28 0B
FA80 : 28 0A
FA82 : 28 09
FA84 : 28 08
FA86 : 28 40
;*************************************;
;
;* WAVE PROGRAMS
;
;NLIST
;
;LBL01
FA88 : 10 
FA89 : 0F 
FA8A : 08 
FA8B : 06 
FA8C : 04 02 
FA8E : 29 10 
FA90 : 08 
FA91 : F8 22 10 
FA94 : 0C 
FA95 : 00 
FA96 : FA 23 10 
FA99 : 0C 
FA9A : FC 00 
FA9C : 23 10 
FA9E : 07 
FA9F : FC FC 
FAA1 : FE 29 10 
FAA4 : 0E 
FAA5 : 00 
FAA6 : FE FA 26 
FAA9 : 3C 
FAAA : 07 
FAAB : FC 
FAAC : 70 DA                          ;(TO LBL01)(#-38)
;*************************************;
;LBL02
FAAE : 0F 
FAAF : 08 
;LBL02A
FAB0 : 0B 
FAB1 : 28 0D 
FAB3 : 00 FD 
FAB5 : 0C 
FAB6 : 28 0B 
FAB8 : 00 FD 
FABA : 0D 
FABB : 28 0C 
FABD : 00 FD 
FABF : 70 EF                          ;(TO LBL02A)(#-17)
;*************************************;
;LBL03
FAC1 : 10 
FAC2 : 01 
FAC3 : 02 
FAC4 : 2F 10 
FAC6 : 02 02 
FAC8 : 2F 10 
FACA : 04 02 
FACC : 2F 10 
FACE : 09 
FACF : 02 
FAD0 : FE 2F 10 
FAD3 : 02 
FAD4 : FE 2F 10 
FAD7 : 04 
FAD8 : FE 2F 10 
FADB : 09 
FADC : FE 00 2F 
FADF : 10 
FAE0 : 02 00 
FAE2 : 2F 10 
FAE4 : 04 00 
FAE6 : 2F 50 
FAE8 : 70 D7                          ;(TO LBL03)(#-41)
;*************************************;
;LBL04
FAEA : 0C 
FAEB : 28 67 
FAED : 04 
FAEE : 67 07 
FAF0 : 70 FA 63 
FAF3 : 00 38 
FAF5 : 37 
FAF6 : 40 
FAF7 : 63 00 
FAF9 : 36 
FAFA : 39 
FAFB : 40                             ;(FIN)
;*************************************;
;LBL SCREMW,<FPF>
FAFC : 10 FF                          ;(LT 7)
FAFE : 02 02 02 02                    ;<8,1>,<7,1>,<6,1>,<5,1>,
FB02 : 02 02 02 02                    ;<4,1>,<3,1>,<2,1>,<1,1>
FB06 : 2F                             ;(DT 16)
FB07 : 2F                             ;(DT 16)
FB08 : 50                             ;(ZT)
FB09 : 10 80 FE                       ;(LT 0,<8,-1>)
FB0C : 2F                             ;(DT 16)
FB0D : 10 40 FE                       ;(LT 0,<7,-1>)
FB10 : 2F                             ;(DT 16)
FB11 : 10 A0 00 FE                    ;(LT 1,<8,0>,<6,-1>)
FB15 : 2F                             ;(DT 16)
FB16 : 10 50 00 FE                    ;(LT 1,<7,0>,<5,-1>)
FB1A : 2F                             ;(DT 16)
FB1B : 10 28 00 FE                    ;(LT 1,<6,0>,<4,-1>)
FB1F : 2F                             ;(DT 16)
FB20 : 10 14 00 FE                    ;(LT 1,<5,0>,<3,-1>)
FB24 : 2F                             ;(DT 16)
FB25 : 10 0A 00 FE                    ;(LT 1,<4,0>,<2,-1>)
FB29 : 2F                             ;(DT 16)
FB2A : 10 05 00 FE                    ;(LT 1,<3,0>,<1,-1>)
FB2E : 2F                             ;(DT 16)
FB2F : 10 02 00                       ;(LT 0,<2,0>)
FB32 : 2F                             ;(DT 16)
FB33 : 10 01 00                       ;(LT 0,<1,0>)
FB36 : 2F                             ;(DT 16)
FB37 : 70 C3                          ;(TO SCREMW)(#-61)
;*************************************;
;LBL05
FB39 : 53 
FB3A : 80 10 
FB3C : 8B 08 
FB3E : 06 
FB3F : 04 02 
FB41 : 69 28 
FB43 : 10 
FB44 : 80 F8 
FB46 : 62 
FB47 : 23 10 
FB49 : 88 00 
FB4B : FA 63 1D 
FB4E : 10 
FB4F : 88 FC 
FB51 : 00 
FB52 : 63 17 
FB54 : 10 
FB55 : 0B 
FB56 : FC FC 
FB58 : FE 69 10 
FB5B : 10 
FB5C : 8A 00 
FB5E : FE FA 66 
FB61 : 09 
FB62 : 3C 
FB63 : 07 
FB64 : FC 
FB65 : 70 D4 FF 
FB68 : FF FF FF 
FB6B : FF FF FF 
FB6E : FF FF FF 
FB71 : 20 
FB72 : 40                             ;(FIN)
;*************************************;
;LBL06
FB73 : 10 
FB74 : 0F 
FB75 : 02 
FB76 : FE 02 FE 
;LBL06A
FB79 : 2F 
FB7A : 70 FD                          ;(TO LBL06A)(#-3)
;*************************************;
;LBL07
FB7C : 0F 
FB7D : 28 
;****;
;LBL08
FB7E : 10 
FB7F : 74 02 02 
FB82 : 02 02 
FB84 : 2F 10 
FB86 : 24 FE 
FB88 : FE 2F 10 
FB8B : 50 
FB8C : FE FE 2F 
FB8F : 10 
FB90 : 24 02 
FB92 : 02 
FB93 : 2F 
FB94 : 70 E8                          ;(TO LBL08)(#-24)
;*************************************;
;LBL09
FB96 : 3C 
;LBL09A
FB97 : 81 
FB98 : 70 FD                          ;(TO LBL09A)(#-3)
;*************************************;
;LBL10
FB9A : 2A 
;LBL10A
FB9B : 21 
FB9C : 00 
FB9D : 01 
FB9E : 2A F0 
FBA0 : 01 
FBA1 : 1F 
FBA2 : EB 01 
FBA4 : 19 
FBA5 : F5 
FBA6 : 70 F3                          ;(TO LBL10A)(#-13)
;*************************************;
;LBL11
FBA8 : 23 6E 
FBAA : 03 
FBAB : 6E 01 
FBAD : 80 30 
FBAF : 10 
FBB0 : 10 
FBB1 : 01 
FBB2 : 01 
FBB3 : 23 FC 
FBB5 : 01 
FBB6 : 25 FA 
FBB8 : 01 
FBB9 : 27 FC 
FBBB : 80                             ;(STOP)
;*************************************;
;LBL12
FBBC : 3C 
FBBD : 20 28 
FBBF : 81 81 
FBC1 : 81 81 
FBC3 : 80                             ;(STOP)
;*************************************;
;LBL13
FBC4 : 37 
FBC5 : 2F 00 
;LBL13A
FBC7 : 01 
FBC8 : 37 
FBC9 : F5 01 2D 
FBCC : F5 01 46 
FBCF : FA 
FBD0 : 70 F5                          ;(TO LBL13A(#-11)
;*************************************;
;LBL14
FBD2 : 32 
;LBL14A
FBD3 : 20 0D 
FBD5 : EC 
FBD6 : 2F E6 
FBD8 : EC 
FBD9 : 20 34 
FBDB : EC 
FBDC : 2F 98 
FBDE : EC 
FBDF : 20 68 
FBE1 : EC 
FBE2 : 2F CC 
FBE4 : EC 
FBE5 : 20 1A 
FBE7 : EC 
FBE8 : 2F F3 
FBEA : EC 
FBEB : 70 E6                          ;(TO LBL14A)(#-26)
;*************************************;
FBED : 64 
FBEE : 67 05 
FBF0 : 69 05 
FBF2 : 6F 05 
FBF4 : 80 10 
FBF6 : FD 
FBF7 : 10 
FBF8 : FF 10 FF 
FBFB : 21 00 
FBFD : FA 2F 00 
FC00 : F4 21 00 
FC03 : FA 20 00 
FC06 : 80 00 
FC08 : FA 20 80 
FC0B : F4 20 00 
FC0E : 80                             ;(STOP)
;*************************************;
FC0F : 32 
FC10 : 60 08 
FC12 : 10 
FC13 : 06 
FC14 : 60 04 
FC16 : 10 
FC17 : FA 70 F6 
FC1A : 01 
FC1B : 32 
FC1C : 69 E9 
FC1E : 01 
FC1F : 28 6B 
FC21 : E5 01 
FC23 : 20 6E 3
FC25 : E1 
FC26 : 80                             ;(STOP)
;*************************************;
FC27 : 19 
FC28 : 69 00 
FC2A : 10 
FC2B : 04 
FC2C : 01 
FC2D : 19 
FC2E : 20 64 
FC30 : 88 01 
FC32 : 20 20 
FC34 : 96 B0 
FC36 : 80                             ;(STOP)
;*************************************;
FC37 : 32 
FC38 : 20 50 
FC3A : C7 
FC3B : 20 AA 
FC3D : D1 21 
FC3F : FE D0 
FC40 : 80                             ;(STOP)
;*************************************;
;Add A to Index Register 
;*************************************;
;ADDX
FC42 : DF 0E      stx  $0E            ;store X in addr 0E (XPLAY)
FC44 : 36         psha                ;push A into stack then SP-1
FC45 : 9B 0F      adda  $0F           ;add A addr 0F (XPLAY+1)
FC47 : 97 0F      staa  $0F           ;store A in addr 0F (XPLAY+1)
FC49 : 96 0E      ldaa  $0E           ;load A with addr 0E (XPLAY)
FC4B : 89 00      adca  #$00          ;add C+A + 00h
FC4D : 97 0E      staa  $0E           ;store A in addr 0E (XPLAY)
FC4F : DE 0E      ldx  $0E            ;load X with addr 0E (XPLAY)
FC51 : 32         pula                ;SP+1 pull stack into A
FC52 : 39         rts                 ;return subroutine
;*************************************;
;Diagnostic Processing
;*************************************;
;NMI
FC53 : 0F         sei                 ;set interrupt mask
FC54 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
FC57 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
FC5A : 5F         clrb                ;clear B
;NMI1:
FC5B : E9 00      adcb  $00,x         ;add C+B + X+00h
FC5D : 09         dex                 ;decr X
FC5E : 8C F0 00   cpx  #$F000         ;compare X with F000h
FC61 : 26 F8      bne  LFC5B          ;branch Z=0 NMI1
FC63 : E1 00      cmpb  $00,x         ;compare B with X+00h
FC65 : 27 01      beq  LFC68          ;branch Z=1 NMI2
FC67 : 3E         wai                 ;wait interrupt, PC+1
;NMI2 
FC68 : 7F 04 02   clr  $0402          ;clear PIA sound select
FC6B : CE 2E E0   ldx  #$2EE0         ;load X with value 2EE0h
;NMI3 
FC6E : 09         dex                 ;decr X
FC6F : 26 FD      bne  LFC6E          ;branch Z=0 NMI3
FC71 : BD F2 94   jsr  LF294          ;jump sub KNOCK
FC74 : BD F2 94   jsr  LF294          ;jump sub KNOCK
FC77 : BD F2 94   jsr  LF294          ;jump sub KNOCK
FC7A : 86 80      ldaa  #$80          ;load A with 80h
FC7C : B7 04 02   staa  $0402         ;store A in PIA sound select
FC7F : 86 01      ldaa  #$01          ;load A with 01h
FC81 : BD F3 41   jsr  LF341          ;jump sub GWLD
FC84 : BD F3 A7   jsr  LF3A7          ;jump sub GWAVE
FC87 : 86 03      ldaa  #$03          ;load A with 03h
FC89 : BD F3 41   jsr  LF341          ;jump sub GWLD
FC8C : BD F3 A7   jsr  LF3A7          ;jump sub GWAVE
FC8F : 4F         clra                ;clear A
FC90 : BD F0 34   jsr  LF034          ;jump sub VARILD
FC93 : BD F0 49   jsr  LF049          ;jump sub VARI
FC96 : F6 EF FA   ldab  $EFFA         ;TALKD Speech ROM
FC99 : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
FC9B : 26 B6      bne  LFC53          ;branch NMI
FC9D : BD EF FA   jsr  LEFFA          ;jump sub TALKD Speech ROM
FCA0 : 20 B1      bra  LFC53          ;branch always NMI
;*************************************;
;VARI VECTORS
;*************************************;
;VVECT EQU *
FCA2 : 00 FF 08 FF 68 04 80 00 FF     ;CSCALE
FCAB : 28 01 00 08 81 02 00 FF FF     ;FOSHIT
FCB4 : 20 01 00 08 E1 00 80 FF FF     ;
FCBD : 01 01 00 08 81 02 00 01 FF     ;
FCC6 : FF 01 00 18 41 04 80 00 FF     ;CABSHK 
;*************************************;
; ??
;LFCCF
FCCF : 02 03 0F 11 12 14 17 1B        ;
FCD7 : 14 1E 19 13 11 0E 0C 0A        ;
FCDF : 09 06 05                       ;
;*************************************;
;* KNOCKER PATTERN
;*************************************;
FCE2 : 01FC 02FC 03F8 04F8 06F8 08F4  ;KNKTAB
FCEE : 0CF4 10F4 20F2 40F1 60F1 80F1  ;
FCFA : A0F1 C0F1 0000                 ;
;*************************************;
;* IRQ data table #1
;*************************************;
FD00 : 08 09 08 01 05 00 05 04        ;IRQTB1
FD08 : 01 06 01 09 05 06 02 00        ;
FD0F : 03 09 05 03 03 00 03 05        ;
FD18 : 03 04 03 08 08 09              ;
;*************************************;
;JMPTBL
;*************************************;
FD1E : F3 29                          ;BON2
FD20 : F3 01                          ;SP1
FD22 : F2 DA                          ;BG2INC
FD24 : F2 D3                          ;BGEND
FD26 : F0 96                          ;NSPRM1 
FD28 : F0 A1                          ;NSPRM2 
FD2A : F0 AC                          ;WINPRM 
FD2C : F2 94                          ;KNOCK
FD2E : F4 78                          ;APPEAR
FD30 : F4 BE                          ;FNOSLD 
FD32 : F4 BE                          ;FNOSLD 
FD34 : F6 14                          ;VARPRM
;*************************************;
;IRQ data table #2
;*************************************;
FD36 : 03 03 01 00 03 02              ;IRQTB2
FD3C : 01 04 08 00                    ;
;*************************************;
;*
;*WAVE TABLE
;*1ST BYTE= WAVELENGTH
;*
;GWVTAB  EQU  *
FD40 : 08                             ;GS2
FD41 : 7F D9 FF D9 7F 24 00 24        ;
;
FD49 : 08                             ;GSQ2
FD4A : FF FF FF FF 00 00 00 00        ;
;
FD52 : 08                             ;GSSQ2
FD53 : 00 40 80 00 FF 00 80 40        ;
;
FD5B : 10                             ;GS1
FD5C : 7F B0 D9 F5 FF F5 D9 B0        ;
FD64 : 7F 4E 24 09 00 09 24 4E        ;
;
FD6C : 10                             ;GS12
FD6D : 7F C5 EC E7 BF 8D 6D 6A        ;
FD75 : 7F 94 92 71 40 17 12 39        ;
;
FD7D : 10                             ;GS1234
FD7E : 76 FF B8 D0 9D E6 6A 82        ;
FD86 : 76 EA 81 86 4E 9C 32 63        ;
;
FD8E : 10                             ;
FD8F : FF FF FF FF FF FF FF FF        ;
FD97 : 00 00 00 00 00 00 00 00        ;
;
FD9F : 10                             ;GSQ22
FDA0 : FF FF FF FF 00 00 00 00        ;
FDA8 : FF FF FF FF 00 00 00 00        ;
;
FDB0 : 10                             ;MW1
FDB1 : 00 F4 00 E8 00 DC 00 E2        ;
FDB9 : 00 DC 00 E8 00 F4 00 00        ;
;
FDC1 : 48                             ;GS72
FDC2 : 8A 95 A0 AB B5 BF C8 D1        ;
FDCA : DA E1 E8 EE F3 F7 FB FD        ;
FDD2 : FE FF FE FD FB F7 F3 EE        ;
FDDA : E8 E1 DA D1 C8 BF B5 AB        ;
FDE2 : A0 95 8A 7F 75 6A 5F 54        ;
FDEA : 4A 40 37 2E 25 1E 17 11        ;
FDF2 : 0C 08 04 02 01 00 01 02        ;
FDFA : 04 08 0C 11 17 1E 25 2E        ;
FE02 : 37 40 4A 54 5F 6A 75 7F        ;
;
FE0A : 10                             ;GS1.7
FE0B : 59 7B 98 AC B3 AC 98 7B        ;
FE13 : 59 37 19 06 00 06 19 37        ;
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
;
;SVTAB
FE1B : 14 10 00 01 00 01 6A           ;BBSND

FE22 : 81 27 00 00 00 16 54           ;HBDSND

FE29 : 11 09 11 01 0F 01 6A           ;BBSND

FE30 : 61 38 00 00 00 20 00           ;BONSND

FE37 : 15 00 11 00 00 13 54           ;HBDSND

FE3E : F2 17 03 00 00 0E 51           ;

FE45 : 31 18 00 01 00 03 8D           ;COOLDN

FE4C : 99 73 11 FF 01 04 5F           ;HBDSND(2nd half)

FE53 : 18 03 00 FF 00 16 54           ;HBDSND
;*************************************;
;zero Padding 
FE5A : 00 00 00 00 00 00 00 00  
FE62 : 00 00 00 00 00 00 00 00  
FE6A : 00 00 00 00 00 00 00 00  
FE72 : 00 00 00 00 00 00 00 00  
FE7A : 00 00 00 00 00 00 00 00  
FE82 : 00 00 00 00 00 00 00 00  
FE8A : 00 00 00 00 00 00 00  
FE91 : 00 00 00 00 00 00 00 00  
FE99 : 00 00 00 00 00 00 00 00  
FEA1 : 00 00 00 00 00 00 00 00  
FEA9 : 00 00 00 00 00 00 00 00  
FEB1 : 00 00 00 00 00 00 00 00  
FEB9 : 00 00 00 00 00 00 00 00  
FEC1 : 00 00 00 00 00 00 00 00  
FEC9 : 00 00 00 00 00 00 00 00  
FED1 : 00 00 00 00 00 00 00 00  
FED9 : 00 00 00 00 00 00 00 00  
FEE1 : 00 00 00 00 00 00 00 00  
FEE9 : 00 00 00 00 00 00 00 00  
FEF1 : 00 00 00 00 00 00 00 00  
FEF9 : 00 00 00 00 00 00 00
;*************************************;
;GWAVE FREQ PATTERN TABLE
;*************************************; 
;GFRTAB
;Bonus Sound
FF00 : A0 98 90 88 80 78 70 68        ;BONSND
FF08 : 60 58 50 44 40                 ;
;Hundred Point Sound
FF0D : 01 01 02 02 04 04 08 08        ;HBTSND
FF15 : 10 10 30 60 C0 E0              ;
;Spinner Sound
FF1B : 01 01 02 02 03 04 05 06        ;SPNSND
FF23 : 07 08 09 0A 0C                 ;
;YUKSND
FF28 : 08 80 10 78 18 70 20 60        ;YUKSND
FF30 : 28 58 30 50 40 48              ;
;Unknown
FF36 : 04 05 06 07 08 0A 0C 0E        ;UNKNWN
FF3E : 10 11 12 13 14 15 16 17        ;
FF46 : 18 19 1A 1B 1C                 ;
;*TURBINE START UP
;TRBPAT
FF4B : 80 7C 78 74 70 74 78 7C 80     ;TRBPAT
;*HEARTBEAT DISTORTO
;HBDSND
FF54 : 01 01 02 02 04 04 08 08        ;HBDSND
FF5C : 10 20 28 30 38 40 48 50        ;
FF64 : 60 70 80 A0 B0 C0              ;
;
;*SWEEP PATTERN
;SWPAT  EQU  *
;
;BigBen Sounds
FF6A : 08 40 08 40 08 40 08 40 08 40  ;BBSND
FF74 : 08 40 08 40 08 40 08 40 08 40  ;
;Heartbeat Echo
FF7E : 01 02 04 08 09 0A 0B 0C        ;HBESND
FF86 : 0E 0F 10 12 14 16              ;
;Spinner Sound "Drip"
FF8C : 40                             ;SPNR
;Cool Downer
FF8D : 10 08 01                       ;COOLDN 
;Unknown
FF90 : 92                             ;UNKN
;Start Distorto Sound
FF91 : 01 01 01 01 02 02 03 03        ;STDSND 
FF99 : 04 04 05 06 08 0A 0C 10        ;
FFA1 : 14 18 20 30 40 50 40 30        ;
FFA9 : 20 10 0C 0A 08 07 06 05        ;
FFB1 : 04 03 02 02 01 01 01           ;
;*************************************;
;zero Padding 
FFB8 : 00 00 00 00 00 00 00 00  
FFC0 : 00 00 00 00 00 00 00 00  
FFC8 : 00 00 00 00 00 00 00 00  
FFD0 : 00 00 00 00 00 00 00 00  
FFD8 : 00 00 00 00 00 00 00 00  
FFE0 : 00 00 00 00 00 00 00 00  
FFE8 : 00 00 00 00 00 00 00 00  
FFF0 : 00 00 00 
;*************************************;
;Speech ROM jump sub destination
;*************************************;
FFF3 : 7E FC 42   jmp  LFC42          ;jump ADDX
;
FFF6 : DF DA      stx  $DA            ;store X in addr DA
;*************************************;
;Motorola vector table
;*************************************; 
FFF8 : F5 54                          ;IRQ 
FFFA : F0 01                          ;RESET SWI (software)  
FFFC : FC 53                          ;NMI  
FFFE : F0 01                          ;RESET (hardware)

;--------------------------------------------------------------
