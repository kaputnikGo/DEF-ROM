        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Joust.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  9A11
        ;  CRC-32:    3BBC90BF
        ;
        ;  Date:    Tue Apr 20 15:17:08 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; merged with Joust source
        ; Video Sound ROM 4 (System 7, 1983)(video and pinball)
        ; this pinball ROM code is different from video arcade game ROM version
        ;
        ;TODO figure out the Walsh Function Sound Machine V2 source to 6800 machine code
        ;
        ; 22 April 2021
        ;
;NAM  JOUST SOUND ROM STARTED 06/15/1982
;SUBTTL   
;*COPYRIGHT WILLIAMS ELECTRONICS INC. 1982
;*PROGRAMMERS: EUGENE P. JARVIS, SAM DICKER,RANDY PFEIFFER,JOHN KOTLARIK
;*    PAUL G. DUSSAULT,CARY W. KOLKER,TIM  MURPHY
;*      AND A CAST OF THOUSANDS......
;*
;
;*************************************;
;*SYSTEM CONSTANTS
;*************************************;
ROM     EQU  $F000
SOUND   SET  $400
CKORG   EQU  $EF00   ;CHECKSUM PROG ORG
ENDRAM  SET  $7F
VECTOR  EQU  $FFF8   ;RESET,INT VECTORS
WVELEN  EQU  72
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
HI      RMB  1       ;RANDOM SEED
LO      RMB  1       ;RANDOM SEED
XDECAY  RMB  2
AMP0    RMB  1
;*
;*
;*TEMPORARIES
;*
TMPRAM  EQU  *       ;TEMPORARY RAM
TEMPX   RMB  2       ;X TEMPS
XPLAY   RMB  2
XPTR    RMB  2
TEMPA   RMB  1       ;ACCA TEMP
TEMPB   RMB  1
LOCRAM  EQU  *
;*
;*GWAVE PARAMETERS
;*
        ORG  LOCRAM
GECHO   RMB  1       ;ECHO FLAG
GCCNT   RMB  1       ;CYCLE COUNT
GECDEC  RMB  1       ;# OF DECAYS PER ECHO
GDFINC  RMB  1       ;DELTA FREQ INC
GDCNT   RMB  1       ;DELTA FREQ COUNT
GWFRM   RMB  2       ;WAVEFORM ADDRESS
;*TEMPORARY OR COMPUTED PARAMETERS
PRDECA  RMB  1       ;PRE-DECAY FACTOR
GWFRQ   RMB  2       ;FREQ TABLE ADDR
FRQEND  RMB  2       ;END ADDR FREQ TABLE
WVEND   RMB  2       ;WAVE END ADDR
GPER    RMB  1       ;PERIOD
GECNT   RMB  1       ;# OF ECHOES COUNTER
FOFSET  RMB  1       ;FREQUENCY OFFSET
;*
;*GWAVE TABLES
;*
GWTAB   RMB  WVELEN  ;WAVE TABLE
;*
;*VARIWAVE PARAMETERS
;*
        ORG  LOCRAM
LOPER   RMB  1       ;LO PERIOD
HIPER   RMB  1       ;HIPERIOD
LODT    RMB  1       ;PERIOD DELTAS
HIDT    RMB  1
HIEN    RMB  1       ;END PERIOD
SWPDT   RMB  2       ;SWEEP PERIOD
LOMOD   RMB  1       ;BASE FREQ MOD
VAMP    RMB  1       ;AMPLITUDE
LOCNT   RMB  1       ;PERIOD COUNTERS
HICNT   RMB  1
;* BOMB RAM
        ORG  LOCRAM
TIME    RMB  1
TABLE   RMB  2
FREQZ   RMB  1
;*
;* KNOCKER RAM
;*
        ORG  LOCRAM
PERIOD  RMB  1
AMP     RMB  1
SNDTMP  RMB  2       ;INDEX TMEP
;*
;* FLASH LOCAL RAM
        ORG  LOCRAM
FREQ1   RMB  1       ;FREQUENCY CONSTANT 1
FREQ2   RMB  1       ;FREQUENCY CONSTANT 2
FREQ3   RMB  1       ;FREQUENCY CONSTANT 3
FREQ4   RMB  1       ;FREQUENCY CONSTANT 4
DELTA1  RMB  1       ;DELTA AMPLITUDE 1
DELTA2  RMB  1       ;DELTA AMPLITUDE 2
DELTA3  RMB  1       ;DELTA AMPLITUDE 3
DELTA4  RMB  1       ;DELTA AMPLITUDE 4
FREQ1$  RMB  1       ;FREQUENCY COUNTER 1
FREQ2$  RMB  1       ;FREQUENCY COUNTER 2
FREQ3$  RMB  1       ;FREQUENCY COUNTER 3
FREQ4$  RMB  1       ;FREQUENCY COUNTER 4
CYCLE1  RMB  1       ;CYCLE CONSTANT 1
CYCLE2  RMB  1       ;CYCLE CONSTANT 2
CYCLE3  RMB  1       ;CYCLE CONSTANT 3
CYCLE4  RMB  1       ;CYCLE CONSTANT 4
DFREQ1  RMB  1       ;DELTA FREQUENCY 1
DFREQ2  RMB  1       ;DELTA FREQUENCY 2
DFREQ3  RMB  1       ;DELTA FREQUENCY 3
DFREQ4  RMB  1       ;DELTA FREQUENCY 4
EFREQ1  RMB  1       ;END FREQUENCY 1
EFREQ2  RMB  1       ;END FREQUENCY 2
EFREQ3  RMB  1       ;END FREQUENCY 3
EFREQ4  RMB  1       ;END FREQUENCY 4
CYCL1$  RMB  1       ;CYCLE COUNTER 1
CYCL2$  RMB  1       ;CYCLE COUNTER 2
CYCL3$  RMB  1       ;CYCLE COUNTER 3
CYCL4$  RMB  1       ;CYCLE COUNTER 4
SNDX1   RMB  1

RANDOM  EQU  LO      ;SINGLE BYTE RANDOM
        ORG  LOCRAM+1
FREQ$   RMB  1       ;START FREQUENCY
C$FRQ   RMB  1       ;CYCLES AT FREQUENCY
D$FRQ   RMB  1       ;DELTA FREQUENCY
E$FRQ   RMB  1       ;END FREQUENCY
C$AMP   RMB  1       ;CYCLES AT AMPLITUDE
D$AMP   RMB  1       ;DELTA AMPLITUDE
C$AMP$  RMB  1       ;CYCLE COUNTER
C$FRQ$  RMB  1       ;CYCLE COUNTER
;*
;*
;*FILTERED NOISE ROUTINE PARAMETERS
;*
        ORG  LOCRAM
FMAX    RMB  1       ;MAXIMUM_FREQUENCY
FHI     RMB  1       ;FREQUENCY
FLO     RMB  1 
LOFRQ   RMB  1
SAMPC   RMB  2       ;SAMPLE COUNT
FDFLG   RMB  1       ;FREQUENCY DECREMENT FLAG
DSFLG   RMB  1       ;DISTORTION FLAG
;*
;*
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
WHIS    RMB  1       ;CROWD ROAR AMP
WFRQ    RMB  1       ;CROWD WHISTLE FREQ
WCNT    RMB  1       ;WHISTLE PASSCOUNTER
PTRHI   RMB  2       ;WHIS ADR PTR
WFRQ2   RMB  1
WCNT2   RMB  1
CURVAL  RMB  1       ;WHISTLING NOISE OUTPUT
ATP     RMB  1       ;INTERM NOISE VAL
MINWIS  RMB  1       ;MIN WHISTLE FREQ
CY2     RMB  1       ;NOISE CYCLE COUNTER
DFRQ    RMB  1       ;WHISTLE FREQ CHANGE
DFRQ2   RMB  1       ;INIT WHISTLE FREQ CHANGE
NNOIS   RMB  1       ;NEXT NOISE VALUE
NFRQ    RMB  1       ;NOISE FREQ
NFRQ2   RMB  1       ;INIT NOISE FREQ
RCNT2   RMB  1
;*************************************;
;* CHECKSUM CALCULATOR (& RELOCATOR)
;*************************************;
        ORG  CKORG
CKSUM   LDX  #$FFFF  ;INDEX TO END OF ROM
        CLRB         ;ZERO CHECKSUM
CKSUM1  ADCB  0,X    ;ADD IN PROGRAM BYTE
        DEX          ;TO NEXT BYTE
        CPX  #$F000  ;DONE YET?
        BNE  CKSUM1  ;NOPE...
        STAB  0,X    ;SAVE CHECKSUM AT BEGINNING
        WAI          ;TURN OFF LEDS
;*************************************;
FROM    RMB  2
TO      RMB  2       ;FOR POINTER
;*************************************;
;* MAIN PROGRAM
;*************************************;
org  $F000
        ;
ORG  ROM
;*
F000 : 58                             ;CHECKSUM BYTE
;*************************************;
;SETUP
;*************************************;
;SETUP
F001 : 0F         sei                 ;SET INTERRUPT MASK
F002 : 8E 00 7F   lds  #$007F         ;(#ENDRAM) INITIALIZE STACK POINTER
F005 : CE 04 00   ldx  #$0400         ;(#SOUND) INDEX TO PIA
F008 : 6F 01      clr  $01,x          ;ACCESS DDRA
F00A : 6F 03      clr  $03,x          ;ACCESS DDRB
F00C : 86 FF      ldaa  #$FF          ;PA0-PA7
F00E : A7 00      staa  $00,x         ;SET SIDE A AS OUTPUTS
F010 : 6F 02      clr  $02,x          ;SET B SIDE AS INPUTS
F012 : 86 37      ldaa  #$37          ;CB2 LOW, IRQ ALLOWED
F014 : A7 03      staa  $03,x         ;PROGRAM B CONTROL REG
F016 : 86 3C      ldaa  #$3C          ;CA2 SET INIT HIGH, NO IRQS
F018 : A7 01      staa  $01,x         ;PROGRAM A SIDE
F01A : 97 00      staa  $00           ;(HI) START RANDOM GENERATOR
F01C : 0E         cli                 ;CLEAR INTERRUPTS
F01D : 20 FE      bra  LF01D          ;(*) WAIT FOR INTERRUPT
;*************************************;
;* THREE OSCILLATOR SOUND GENERATOR
;*************************************;
;PLAY:
F01F : DF 07      stx  $07            ;(XPLAY) SAVE CURRENT INDEX
F021 : CE F0 C4   ldx  #$F0C4         ;(#XDECAYZ) SET TO MAXIMUM AMPLITUDE
F024 : DF 02      stx  $02            ;(XDECAY) AND SAVE
F026 : 86 80      ldaa  #$80          ;LOAD ZERO AMPLITUDE
;PLAY1:
F028 : D6 10      ldab  $10           ;(FREQ4) CHECK WHITE NOISE COUNTER
F02A : 2A 09      bpl  LF035          ;(PLAY3) NOT IN WHITE MODE
F02C : D6 01      ldab  $01           ;(RANDOM) GET RANDOM NUMBER
F02E : 54         lsrb                ;REDUCE IT
F02F : 54         lsrb                ;
F030 : 54         lsrb                ;
F031 : 5C         incb                ;NOW NON-ZERO
;PLAY2:
F032 : 5A         decb                ;TIME OUT COUNT
F033 : 26 FD      bne  LF032          ;(PLAY2)
;PLAY3:
F035 : 7A 00 15   dec  $0015          ;(FREQ1$) COUNT DOWN OSC. 1
F038 : 27 4C      beq  LF086          ;(PLAY7) DO AN UPDATE
F03A : 7A 00 16   dec  $0016          ;(FREQ2$) COUNT DOWN OSC. 2
F03D : 27 4C      beq  LF08B          ;(PLAY8) DO AN UPDATE
F03F : 7A 00 17   dec  $0017          ;(FREQ3$) COUNT DOWN OSC. 3
F042 : 27 4C      beq  LF090          ;(PLAY9) DO AN UPDATE
F044 : 7A 00 18   dec  $0018          ;(FREQ4$) COUNT DOWN WHITE NOISE
F047 : 26 DF      bne  LF028          ;(PLAY1) DO THEM AGAIN
F049 : D6 10      ldab  $10           ;(FREQ4) CHECK WHITE NOISE CONSTANT
F04B : 27 DB      beq  LF028          ;(PLAY1) FORGET IT
F04D : C4 7F      andb  #$7F          ;STRIP FLAG BIT
F04F : D7 18      stab  $18           ;(FREQ4$) SAVE WHITE NOISE COUNT
F051 : D6 01      ldab  $01           ;(RANDOM) GET CURRENT RANDOM
F053 : 58         aslb                ;DOUBLE
F054 : DB 01      addb  $01           ;(RANDOM) TRIPLE
F056 : CB 0B      addb  #$0B          ;ADD IN 11
F058 : D7 01      stab  $01           ;(RANSOM) VOILA...NEW RANDOM NUMBER
F05A : 7A 00 28   dec  $0028          ;(CYCL4$) COUNT DOWN DECAY
F05D : 26 0E      bne  LF06D          ;(PLAY6) DON'T DECAY
F05F : D6 1C      ldab  $1C           ;(CYCLE4) RELOAD COUNT
F061 : D7 28      stab  $28           ;(CYCL4$) AND SAVE
F063 : DE 02      ldx  $02            ;(XDECAY) GET DECAY JUMP POINTER
F065 : 09         dex                 ;MOVE TO LESS AMPLITUDE
F066 : 8C F0 BD   cpx  #$F0BD         ;(#RDECAY+1) DONE?
F069 : 27 4E      beq  LF0B9          ;(PLAY12) YUP..BYE BYE
F06B : DF 02      stx  $02            ;(XDECAY)SAVE NEW POINTER
;PLAY6:
F06D : D6 01      ldab  $01           ;(RANDOM) GET RANDOM AMPLITUDE
F06F : 2B 06      bmi  LF077          ;(PLAY6A) SKIP IF NEGATIVE
F071 : D4 14      andb  $14           ;(DELTA4) REDUCE AMPLITUDE
F073 : C4 7F      andb  #$7F          ;STRIP SIGN BIT
F075 : 20 05      bra  LF07C          ;(PLAY6B)
;PLAY6A:
F077 : D4 14      andb  $14           ;(DELTA4) REDUCE AMPLITUDE
F079 : C4 7F      andb  #$7F          ;REMOVE SIGN BIT
F07B : 50         negb                ;NEGATE
;PLAY6B:
F07C : 36         psha                ;
F07D : 1B         aba                 ;ADD WHITE NOISE
F07E : 16         tab                 ;
F07F : 32         pula                ;
F080 : DE 02      ldx  $02            ;(XDECAY) GET DECAY POINTER
F082 : AD 00      jsr  $00,x          ;(0,X) OUTPUT NOISE
F084 : 20 A2      bra  LF028          ;(PLAY1) DO SOME MORE
;PLAY7:
F086 : CE 00 0D   ldx  #$000D         ;(#FREQ1) INDEX SET TO 1
F089 : 20 08      bra  LF093          ;(PLAY10)
;PLAY8:
F08B : CE 00 0E   ldx  #$000E         ;(#FREQ2) INDEX SET TO 2
F08E : 20 03      bra  LF093          ;(PLAY10)
;PLAY9:
F090 : CE 00 0F   ldx  #$000F         ;(#FREQ3) INDEX SET TO 3
;PLAY10:
F093 : 6D 18      tst  $18,x          ;(24,X) CHECK CYCLES AT FREQUENCY
F095 : 27 12      beq  LF0A9          ;(PLAY11) ZERO, DON'T CHANGE
F097 : 6A 18      dec  $18,x          ;(24,X) COUNT DOWN
F099 : 26 0E      bne  LF0A9          ;(PLAY11) NOT TIME TO CHANGE...
F09B : E6 0C      ldab  $0C,x         ;(12,X) LOAD CYCLES AT FREQUENCY
F09D : E7 18      stab  $18,x         ;(24,X) SAVE IN COUNTER
F09F : E6 00      ldab  $00,x         ;(00,X) GET CURRENT FREQUENCY
F0A1 : EB 10      addb  $10,x         ;(16,X) ADD DELTA
F0A3 : E1 14      cmpb  $14,x         ;(20,X) COMPARE END
F0A5 : 27 12      beq  LF0B9          ;(PLAY12) DONE...
F0A7 : E7 00      stab  $00,x         ;SAVE IN NEW CURRENT FREQUENCY
;PLAY11:
F0A9 : E6 00      ldab  $00,x         ;(0,X) GET CURRENT FREQUENCY
F0AB : E7 08      stab  $08,x         ;(8,X) SAVE IN FREQUENCY COUNTER
F0AD : AB 04      adda  $04,x         ;(4,X) ADD IN AMPLITUDE
F0AF : 60 04      neg  $04,x          ;(4,X) NEGATE AMPLITUDE
F0B1 : 16         tab                 ;SAVE DATA
F0B2 : DE 02      ldx  $02            ;(XDECAY) INDEX TO DECAY
F0B4 : AD 00      jsr  $00,x          ;(0,X) OUTPUT SOUND
F0B6 : 7E F0 28   jmp  LF028          ;(PLAY1) REPEAT
;PLAY12:
F0B9 : DE 07      ldx  $07            ;(XPLAY) RESTORE INDEX
F0BB : 39         rts
;*************************************;
;* ECHO AND DECAY ROUTINE
;*************************************;
;RDECAY
F0BC : 54         lsrb                ;
F0BD : 54         lsrb                ;
F0BE : 54         lsrb                ;
F0BF : 54         lsrb                ;
F0C0 : 54         lsrb                ;
F0C1 : 54         lsrb                ;
F0C2 : 54         lsrb                ;
F0C3 : 54         lsrb                ;
F0C4 : F7 04 00   stab  $0400         ;(DECAYZ) SOUND
F0C7 : 39         rts                 ;
;*************************************;
;* 3 OSCILLATOR CALLING ROUTINES
;*************************************;
;THNDR
F0C8 : CE F2 9C   ldx  #$F29C         ;(#VEC01) THUNDER SOUND
;THNDR1:
F0CB : C6 1C      ldab  #$1C          ;(#28) NEED TO TRANSFER
F0CD : BD F6 2E   jsr  LF62E          ;(TRANS) 28 BYTES FOR PLAY
F0D0 : BD F0 1F   jsr  LF01F          ;(PLAY) NOW PLAY IT
F0D3 : 39         rts                 ;
;SND4
F0D4 : CE F2 F0   ldx  #$F2F0         ;(#VEC04) SOUND 4
F0D7 : 20 F2      bra  LF0CB          ;(THNDR1)
;SND5
F0D9 : CE F3 0C   ldx  #$F30C         ;(#VEC05) SOUND 5
F0DC : 20 ED      bra  LF0CB          ;(THNDR1)
;*************************************;
;* THE BOMB OOOOOH NOOOOO!
;*************************************;
;WHIST
F0DE : 86 80      ldaa  #$80          ;
F0E0 : 97 10      staa  $10           ;(FREQZ)
F0E2 : 86 F1      ldaa  #$F1          ;(#SINTBL/$100)
F0E4 : 97 0E      staa  $0E           ;(TABLE)
;WHIST0:
F0E6 : 86 80      ldaa  #$80          ;
F0E8 : 97 0B      staa  $0B           ;(TEMPA)
;WHIST1:
F0EA : 86 12      ldaa  #$12          ;(#18)
;WHIST2:
F0EC : 4A         deca                ;
F0ED : 26 FD      bne  LF0EC          ;(WHIST2)
F0EF : 96 0D      ldaa  $0D           ;(TIME)
F0F1 : 9B 10      adda  $10           ;(FREQZ)
F0F3 : 97 0D      staa  $0D           ;(TIME)
F0F5 : 44         lsra                ;
F0F6 : 44         lsra                ;
F0F7 : 44         lsra                ;
F0F8 : 8B 12      adda  #$12          ;(#SINTBL!.$FF)
F0FA : 97 0F      staa  $0F           ;(TABLE+1)
F0FC : DE 0E      ldx  $0E            ;(TABLE)
F0FE : A6 00      ldaa  $00,x         ;(,X)
F100 : B7 04 00   staa  $0400         ;(SOUND)
F103 : 7A 00 0B   dec  $000B          ;(TEMPA)
F106 : 26 E2      bne  LF0EA          ;(WHIST1)
F108 : 7A 00 10   dec  $0010          ;(FREQZ)
F10B : 96 10      ldaa  $10           ;(FREQZ)
F10D : 81 20      cmpa  #$20          ;
F10F : 26 D5      bne  LF0E6          ;(WHIST0)
F111 : 39         rts                 ;
;*************************************;
;*     SINE TABLE
;*************************************;
F112 : 80 8C 98 A5 B0 BC C6 D0        ;SINTBL
F11A : DA E2 EA F0 F5 FA FD FE        ;
F122 : FF FE FD FA F5 F0 EA E2        ;
F12A : DA D0 C6 BC B0 A5 98 8C        ;
F132 : 80 73 67 5A 4F 43 39 2F        ;
F13A : 25 1D 15 0F 0A 05 02 01        ;
F142 : 00 01 02 05 0A 0F 15 1D        ;
F14A : 25 2F 39 43 4F 5A 67 73        ;
;*************************************;
;* KNOCKER ROUTINE
;*************************************;
;KNOCK:
F152 : 7F 04 02   clr  $0402          ;(SOUND+2) FULL BLAST
F155 : CE F1 99   ldx  #$F199         ;(#KNKTAB)
F158 : DF 0F      stx  $0F            ;(SNDTMP)
;SQLP:
F15A : DE 0F      ldx  $0F            ;(SNDTMP) RESTORE X REG
F15C : A6 00      ldaa  $00,x         ;(,X) GET PERIOD
F15E : 27 33      beq  LF193          ;(END) END ON ZERO
F160 : E6 01      ldab  $01,x         ;(1,X) GET AMP
F162 : C4 F0      andb  #$F0          ;
F164 : D7 0E      stab  $0E           ;(AMP)
F166 : E6 01      ldab  $01,x         ;(1,X)
F168 : 08         inx                 ;
F169 : 08         inx                 ;
F16A : DF 0F      stx  $0F            ;(SNDTMP) SAVE X
F16C : 97 0D      staa  $0D           ;(PERIOD)
F16E : C4 0F      andb  #$0F          ;(#$F)
;LP0:
F170 : 96 0E      ldaa  $0E           ;(AMP)
F172 : B7 04 00   staa  $0400         ;(SOUND)
F175 : 96 0D      ldaa  $0D           ;(PERIOD)
;LP1:
F177 : CE 00 05   ldx  #$0005         ;(#5) DELAY
;LP11:
F17A : 09         dex                 ;
F17B : 26 FD      bne  LF17A          ;(LP11)
F17D : 4A         deca                ;
F17E : 26 F7      bne  LF177          ;(LP1)
F180 : 7F 04 00   clr  $0400          ;(SOUND)
F183 : 96 0D      ldaa  $0D           ;(PERIOD)
;LP2:
F185 : CE 00 05   ldx  #$0005         ;(#5) DELAY
;LP22:
F188 : 09         dex                 ;
F189 : 26 FD      bne  LF188          ;(LP22)
F18B : 4A         deca                ;
F18C : 26 F7      bne  LF185          ;(LP2)
F18E : 5A         decb                ;
F18F : 26 DF      bne  LF170          ;(LP0)
F191 : 20 C7      bra  LF15A          ;(SQLP)
;END:
F193 : 86 80      ldaa  #$80          ;OVERRIDE OFF
F195 : B7 04 02   staa  $0402         ;(SOUND+2)
F198 : 39         rts                 ;
;*************************************;
;* KNOCKER PATTERN
;*************************************;
F199 : 01FC 02FC 03F8 04F8 06F8 08F4  ;KNKTAB
F1A5 : 0CF4 10F4 20F2 40F1 60F1 80F1  ;
F1B1 : A0F1 C0F1 0000                 ;
;*************************************;
;* SINGLE OSCILLATOR SOUND CALLS
;*************************************;
;PERK1:
F1B7 : BD F1 FA   jsr  LF1FA          ;(MOVE)
F1BA : BD F2 13   jsr  LF213          ;(SING)
F1BD : 39         rts
;ATARI
F1BE : CE F3 82   ldx  #$F382         ;(#VEC02X)
F1C1 : 20 F4      bra  LF1B7          ;(PERK1)
;PERK$1:
F1C3 : 8D F2      bsr  LF1B7          ;(PERK1)
F1C5 : 8D 27      bsr  LF1EE          ;(ECHO)
F1C7 : 20 FA      bra  LF1C3          ;(PERK$1)
;PERK$$
F1C9 : 86 FF      ldaa  #$FF          ;
F1CB : 97 04      staa  $04           ;(AMP0)
F1CD : CE F3 9A   ldx  #$F39A         ;(#VEC06X)
F1D0 : 20 F1      bra  LF1C3          ;(PERK$1)
;*************************************;
;* RANDOM SQUIRTS
;*************************************;
;SQRT
F1D2 : C6 30      ldab  #$30          ;
F1D4 : CE F3 AC   ldx  #$F3AC         ;(#VEC09X)
F1D7 : 8D 21      bsr  LF1FA          ;(MOVE)
;SQRT2:
F1D9 : 96 01      ldaa  $01           ;(RANDOM)
F1DB : 48         asla                ;
F1DC : 9B 01      adda  $01           ;(RANDOM)
F1DE : 8B 0B      adda  #$0B          ;
F1E0 : 97 01      staa  $01           ;(RANDOM)
F1E2 : 44         lsra                ;
F1E3 : 44         lsra                ;
F1E4 : 8B 0C      adda  #$0C          ;
F1E6 : 97 0E      staa  $0E           ;(FREQ$)
F1E8 : 8D 29      bsr  LF213          ;(SING)
F1EA : 5A         decb                ;
F1EB : 26 EC      bne  LF1D9          ;(SQRT2)
F1ED : 39         rts                 ;
;*************************************;
;* ECHO FUNCTION
;*************************************;
;ECHO
F1EE : 96 04      ldaa  $04           ;(AMP0)
F1F0 : 80 08      suba  #$08          ;
F1F2 : 2A 03      bpl  LF1F7          ;(ECHO1)
F1F4 : 97 04      staa  $04           ;(AMP0)
F1F6 : 39         rts                 ;
;ECHO1:
F1F7 : 32         pula                ;
F1F8 : 32         pula                ;
F1F9 : 39         rts                 ;
;*************************************;
;* MOVE PARAMETERS
;*************************************;
;MOVE:
F1FA : A6 00      ldaa  $00,x         ;(0,X)
F1FC : 97 0E      staa  $0E           ;(FREQ$)
F1FE : A6 01      ldaa  $01,x         ;(1,X)
F200 : 97 0F      staa  $0F           ;(C$FRQ)
F202 : A6 02      ldaa  $02,x         ;(2,X)
F204 : 97 10      staa  $10           ;(D$FRQ)
F206 : A6 03      ldaa  $03,x         ;(3,X)
F208 : 97 11      staa  $11           ;(E$FRQ)
F20A : A6 04      ldaa  $04,x         ;(4,X)
F20C : 97 12      staa  $12           ;(C$AMP)
F20E : A6 05      ldaa  $05,x         ;(5,X)
F210 : 97 13      staa  $13           ;(D$AMP)
F212 : 39         rts
;*************************************;
;* DELTA F, DELTA A ROUTINE
;*************************************;
;SING:
F213 : 96 04      ldaa  $04           ;(AMP0) GET STARTING AMPLITUDE
;SING$
F215 : 37         pshb                ;SAVE B
F216 : D6 12      ldab  $12           ;(C$AMP) GET CYCLES AT AMPLITUDE
F218 : D7 14      stab  $14           ;(C$AMP$) SAVE AS COUNTER
F21A : D6 0F      ldab  $0F           ;(C$FRQ) GET CYCLES AT FREQUENCY
F21C : D7 15      stab  $15           ;(C$FRQ$) SAVE AS COUNTER
;SING1:
F21E : 43         coma                ;INVERT AMPLITUDE
F21F : D6 0E      ldab  $0E           ;(FREQ$) GET FREQUENCY COUNTER
F221 : B7 04 00   staa  $0400         ;(SOUND) OUTPUT TO D/A
;SING2:
F224 : 5A         decb                ;
F225 : 26 FD      bne  LF224          ;(SING2)
F227 : 43         coma                ;INVERT AMPLITUDE
F228 : D6 0E      ldab  $0E           ;(FREQ$) GET FREQUENCY COUNTER
F22A : 20 00      bra  LF22C          ;(*+2) -I
F22C : 08         inx                 ;-I
F22D : 09         dex                 ;-I--- SYNC, 20 CYCLES
F22E : 08         inx                 ;-I
F22F : 09         dex                 ;-I
F230 : B7 04 00   staa  $0400         ;(SOUND) OUTPUT TO D/A
;SING3:
F233 : 5A         decb                ;
F234 : 26 FD      bne  LF233          ;(SING3)
F236 : 7A 00 15   dec  $0015          ;(C$FRQ$) CHECK CYCLES AT FREQUENCY
F239 : 27 16      beq  LF251          ;(SING4) GO CHANGE FREQUENCY
F23B : 7A 00 14   dec  $0014          ;(C$AMP$) CHECK CYCLES AT AMPLITUDE
F23E : 26 DE      bne  LF21E          ;(SING1) ALL OK, GO OUTPUT
F240 : 43         coma                ;INVERT AMPLITUDE
F241 : D6 12      ldab  $12           ;(C$AMP) GET CYCLES AT AMPLITUDE
F243 : B7 04 00   staa  $0400         ;(SOUND) OUTPUT TO D/A
F246 : D7 14      stab  $14           ;(C$AMP$) SAVVE AS COUNTER
F248 : D6 0E      ldab  $0E           ;(FREQ$) GET FREQUENCY COUNT
F24A : 9B 13      adda  $13           ;(D$AMP) ADD AMPLITUDE DELTA
F24C : 2B 1E      bmi  LF26C          ;(SING6) RETURN FROM SUBROUTINE
F24E : 01         nop                 ;SYNC, 2 CYCLES
F24F : 20 15      bra  LF266          ;(SING5)
;SING4:
F251 : 08         inx                 ;-I
F252 : 09         dex                 ;-I--- SYNC, 10 CYCLES
F253 : 01         nop                 ;-I
F254 : 43         coma                ;INVERT AMPLITUDE
F255 : D6 0F      ldab  $0F           ;(C$FRQ) GET CYCLES AT FREQUENCY
F257 : B7 04 00   staa  $0400         ;(SOUND) OUTPUT TO D/A
F25A : D7 15      stab  $15           ;(C$FRQ$) SAVE AS COUNTER
F25C : D6 0E      ldab  $0E           ;(FREQ$) GET FREQUENCY COUNT
F25E : D0 10      subb  $10           ;(D$FRQ) SUBTRACT FREQUENCY DELTA
F260 : D1 11      cmpb  $11           ;(E$FRQ) COMPARE TO END FREQUENCY
F262 : D1 11      cmpb  $11           ;(E$FRQ) SYNC, 3 CYCLES
F264 : 27 06      beq  LF26C          ;(SING6) RETURN FROM SUBROUTINE
;SING5:
F266 : D7 0E      stab  $0E           ;(FREQ$) SAVE FREQUENCY COUNT
F268 : C0 05      subb  #$05          ;SYNC TO FREQUENCY COUNTDOWN
F26A : 20 B8      bra  LF224          ;(SING2) JUMP INTO COUNTDOWN LOOP
;SING6:
F26C : 33         pulb                ;RESTORE B
F26D : 39         rts                 ;
;*************************************;
;data tables for PULSE
;*************************************;
F26E : DA FF DA 80 26 01 26 80        ;SNDTBL
F276 : 07 0A 07 00 F9 F6 F9 00        ;
;
F27E : 3A 3E 50 46 33 2C 27 20        ;NOTTBL
F286 : 25 1C 1A 17 14 11 10 33        ;
;
F28E : 08 03 02 01 02 03 04 05        ;WAVFRM
F296 : 06 0A 1E 32 70 00              ;
;*************************************;
;data tables for PLAY (Three Osc) - 28 bytes
;*************************************;
F29C : FFFF FF90 FFFF FFFF FFFF       ;VEC01
F2A6 : FF90 FFFF FFFF FFFF FFFF       ;
F2B0 : 0000 0000 0000 0000            ;
;
F2B8 : 4801 0000 3F3F 0000 4801       ;VEC02
F2C2 : 0000 0108 0000 8101 0000       ;
F2CC : 01FF 0000 0108 0000            ;
;
F2D4 : 0110 0000 3F3F 0000 0110       ;VEC03
F2DE : 0000 0505 0000 0101 0000       ;
F2E8 : 31FF 0000 0505 0000            ;
;
F2F0 : 3000 0000 7F00 0000 3000       ;VEC04
F2FA : 0000 0100 0000 7F00 0000       ;
F304 : 0200 0000 0100 0000            ;
;
F30C : 0400 0004 7F00 007F 0400       ;VEC05
F316 : 0004 FF00 00A0 0000 0000       ;
F320 : 0000 0000 FF00 00A0            ;
;
F328 : 0C68 6800 071F 0F00 0C80       ;VEC06
F332 : 8000 FFFF FF00 0000 0000       ;
F33C : 0000 0000 FFFF FF00            ;
;
F344 : 0104 0000 3F7F 0000 0104       ;VEC016
F34E : 0000 05FF 0000 0100 0000       ;
F358 : 4800 0000 05FF 0000            ;
;
F360 : 0280 0030 0A7F 007F 0280       ;VEC017
F36A : 0030 C080 0020 0110 0015       ;
F374 : C010 0000 C080 0000            ;
;*************************************;
; data tables for SING (Single Osc)
;*************************************;
F37C : FF01 02C3 FF00                 ;VEC01X
;
F381 : 0103 FF80 FF00                 ;VEC02X
;
F388 : 2003 FF50 FF00                 ;VEC03X
;
F38E : 5003 0120 FF00                 ;VEC04X
;
F394 : FE04 0204 FF00                 ;VEC05X
;
F39A : 4803 010C FF00                 ;VEC06X
;
F3A0 : 4802 010C FF00                 ;VEC07X
;
F3A6 : E001 0210 FF00                 ;VEC08X
;
F3AC : 50FF 0000 6080                 ;VEC09X
;
F3B2 : FF02 0106 FF00                 ;VEC10X
;*************************************;
;*VARI LOADER
;*************************************;
;VARILD
F3B8 : 16         tab                 ;
F3B9 : 48         asla                ;X2
F3BA : 48         asla                ;X4
F3BB : 48         asla                ;X8
F3BC : 1B         aba                 ;X9
F3BD : CE 00 0D   ldx  #$000D         ;(#LOCRAM)
F3C0 : DF 09      stx  $09            ;(XPTR) SET XSFER
F3C2 : CE F8 1F   ldx  #$F81F         ;(#VVECT)
F3C5 : BD F7 E1   jsr  LF7E1          ;(ADDX)
F3C8 : C6 09      ldab  #$09          ;(#9) GET COUNT
;VTRAN
F3CA : BD F6 2E   jsr  LF62E          ;(TRANS)
;*************************************;
;*VARIABLE DUTY CYCLE SQUARE WAVE ROUTINE
;*************************************;
;VARI
F3CD : 96 15      ldaa  $15           ;(VAMP)
F3CF : B7 04 00   staa  $0400         ;(SOUND)
;VAR0:
F3D2 : 96 0D      ldaa  $0D           ;(LOPER)
F3D4 : 97 16      staa  $16           ;(LOCNT)
F3D6 : 96 0E      ldaa  $0E           ;(HIPER)
F3D8 : 97 17      staa  $17           ;(HICNT)
;V0:
F3DA : DE 12      ldx  $12            ;(SWPDT)
;V0LP:
F3DC : 96 16      ldaa  $16           ;(LOCNT) LO CYCLE
F3DE : 73 04 00   com  $0400          ;(SOUND)
;V1:
F3E1 : 09         dex                 ;
F3E2 : 27 10      beq  LF3F4          ;(VSWEEP)
F3E4 : 4A         deca                ;
F3E5 : 26 FA      bne  LF3E1          ;(V1)
F3E7 : 73 04 00   com  $0400          ;(SOUND)
F3EA : 96 17      ldaa  $17           ;(HICNT) HI CYCLE
;V2:
F3EC : 09         dex                 ;
F3ED : 27 05      beq  LF3F4          ;(VSWEEP)
F3EF : 4A         deca                ;
F3F0 : 26 FA      bne  LF3EC          ;(V2)
F3F2 : 20 E8      bra  LF3DC          ;(V0LP) LOOP BACK
;VSWEEP:
F3F4 : B6 04 00   ldaa  $0400         ;(SOUND)
F3F7 : 2B 01      bmi  LF3FA          ;(VS1)
F3F9 : 43         coma                ;
;VS1:
F3FA : 8B 00      adda  #$00          ;
F3FC : B7 04 00   staa  $0400         ;(SOUND) OUTPUT
F3FF : 96 16      ldaa  $16           ;(LOCNT)
F401 : 9B 0F      adda  $0F           ;(LODT)
F403 : 97 16      staa  $16           ;(LOCNT)
F405 : 96 17      ldaa  $17           ;(HICNT)
F407 : 9B 10      adda  $10           ;(HIDT)
F409 : 97 17      staa  $17           ;(HICNT)
F40B : 91 11      cmpa  $11           ;(HIEN)
F40D : 26 CB      bne  LF3DA          ;(V0)
F40F : 96 14      ldaa  $14           ;(LOMOD)
F411 : 27 06      beq  LF419          ;(VARX)
F413 : 9B 0D      adda  $0D           ;(LOPER)
F415 : 97 0D      staa  $0D           ;(LOPER)
F417 : 26 B9      bne  LF3D2          ;(VAR0)
;VARX:
F419 : 39         rts                 ;
;*************************************;
;*LIGHTNING
;*************************************;
;LITE
F41A : 86 01      ldaa  #$01          ;(#1)
F41C : 97 14      staa  $14           ;(DFREQ)
F41E : C6 03      ldab  #$03          ;(#3)
;*************************************;
;*LIGHTNING+APPEAR NOISE ROUTINE
;*************************************;
;LITEN
F420 : 97 13      staa  $13           ;(LFREQ)
F422 : 86 FF      ldaa  #$FF          ;HIGHEST AMP
F424 : B7 04 00   staa  $0400         ;(SOUND)
F427 : D7 0F      stab  $0F           ;(CYCNT)
;LITE0:
F429 : D6 0F      ldab  $0F           ;(CYCNT)
;LITE1:
F42B : 96 01      ldaa  $01           ;(LO) GET RANDOM
F42D : 44         lsra
F42E : 44         lsra
F42F : 44         lsra
F430 : 98 01      eora  $01           ;(LO)
F432 : 44         lsra
F433 : 76 00 00   ror  $0000          ;(HI)
F436 : 76 00 01   ror  $0001          ;(LO)
F439 : 24 03      bcc  LF43E          ;(LITE2)
F43B : 73 04 00   com  $0400          ;(SOUND)
;LITE2:
F43E : 96 13      ldaa  $0013         ;(LFREQ) COUNT FREQ
;LITE3:
F440 : 4A         deca                ;
F441 : 26 FD      bne  LF440          ;(LITE3)
F443 : 5A         decb                ;COUNT CYCLES
F444 : 26 E5      bne  LF42B          ;(LITE1)
F446 : 96 13      ldaa  $13           ;(LFREQ)
F448 : 9B 14      adda  $14           ;(DFREQ)
F44A : 97 13      staa  $13           ;(LFREQ)
F44C : 26 DB      bne  LF429          ;(LITE0)
F44E : 39         rts
;*************************************;
;*WHITE NOISE ROUTINE
;*************************************;
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA
;NOISLD LF44F:
F44F : A6 00      ldaa  $00,x         ;(X)
F451 : 97 25      staa  $25           ;(CY2)
F453 : A6 01      ldaa  $01,x         ;(1,X)
F455 : 97 0E      staa  $0E           ;(NAMP)
F457 : A6 02      ldaa  $02,x         ;(2,X)
F459 : 97 0D      staa  $0D           ;(DECAY)
F45B : A6 03      ldaa  $03,x         ;(3,X)
F45D : 97 12      staa  $12           ;(NFFLG)
F45F : A6 04      ldaa  $04,x         ;(4,X)
F461 : 97 2A      staa  $2A           ;(NFRQ2)
;NEND:
F463 : 39         rts                 ;
;*************************************;
;*LOAD NOISE AND GO
;*************************************;
;NOISLG:
F464 : 8D E9      bsr  LF44F          ;(NOISLD)
;*************************************;
;*NOISE INIT
;*************************************;
;NOIN
F466 : 8D 30      bsr  LF498          ;(NSUB) CY2&NFRQ2 TO CYCNT&NFRQ
;*************************************;
;*NOISE LOOP
;*************************************;
;NO1
F468 : 8D 58      bsr  LF4C2          ;(RNT) FREQ CHECK
F46A : 96 29      ldaa  $29           ;(NFRQ) FREQ REINITED
F46C : 91 2A      cmpa  $2A           ;(NFRQ2)
F46E : 26 F8      bne  LF468          ;(NO1) IF NOT KEEP DELAYING
F470 : 59         rolb                ; RESTORE MAX AMPLITUDE TO NOISE
F471 : F7 04 00   stab  $0400         ;(SOUND) OUTPUT TO DAC
F474 : 8D 2D      bsr  LF4A3          ;(NOISE1) PREPARE NEXT RAND NO
F476 : 8D 38      bsr  LF4B0          ;(NOISE2)
F478 : 8D 5C      bsr  LF4D6          ;(RNA) AMPLITUDE &CYCL3 COUNT CECK (sic)
F47A : 7D 00 0E   tst  $000E          ;(NAMP) SEE IF DONE
F47D : 27 E4      beq  LF463          ;(NEND) RTS IF FINSHED
F47F : 7D 00 0F   tst  $000F          ;(CYCNT) SEE IF NEXT FREQ
F482 : 26 E4      bne  LF468          ;(NO1) IF NO SWEEP GO DELAY
F484 : 7D 00 12   tst  $0012          ;(NFFLG) SEE IF SWEEP MODE
F487 : 27 DF      beq  LF468          ;(NO1) IF NO SWEEP GO DELAY
F489 : 2B 05      bmi  LF490          ;(NO3) SWEEP DOWN
F48B : 7C 00 2A   inc  $002A          ;(NFRQ2)
F48E : 20 D8      bra  LF468          ;(NO1)
;NO3:
F490 : 7A 00 2A   dec  $002A          ;(NFRQ2)
F493 : 7A 00 29   dec  $0029          ;(NFRQ)
F496 : 20 D0      bra  LF468          ;(NO1)
;NSUB:
F498 : 7F 00 0F   clr  $000F          ;(CYCNT)
F49B : 96 2A      ldaa  $2A           ;(NFRQ2)
F49D : 97 29      staa  $29           ;(NFRQ) NOISE FREQ
F49F : 7F 00 28   clr  $0028          ;(NNOIS)
F4A2 : 39         rts
;*************************************;
;* 23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD
;*
;*
;NOISE1:
F4A3 : 96 01      ldaa  $01           ;LO GET RANDOM BIT
F4A5 : 44         lsra                ;
F4A6 : 44         lsra                ;
F4A7 : 44         lsra                ;
F4A8 : 98 01      eora  $01           ;(LO)
F4AA : 97 23      staa  $23           ;(ATP) INTERMED RAND NO
F4AC : 08         inx                 ;
F4AD : 84 07      anda  #$07          ;FOR 3 BIT RANDOM NO
;*
F4AF : 39         rts                 ;
;*
;NOISE2:
F4B0 : 96 23      ldaa  $23           ;(ATP)
F4B2 : 44         lsra                ;
F4B3 : 76 00 00   ror  $0000          ;(HI)
F4B6 : 76 00 01   ror  $0001          ;(LO)
F4B9 : 86 00      ldaa  #$00          ;(#$0)
F4BB : 24 02      bcc  LF4BF          ;NOISE3
F4BD : 96 0E      ldaa  $0E           ;(NAMP)
;NOISE3:
F4BF : 97 28      staa  $28           ;(NNOIS) NEXT NOISE VALUE
;*
F4C1 : 39         rts                 ;
;*
;RNT:
F4C2 : 96 2A      ldaa  $2A           ;(NFRQ2) NOISE FREQ
F4C4 : 7A 00 29   dec  $0029          ;(NFRQ)
F4C7 : 27 04      beq  LF4CD          ;(NW0)
F4C9 : 08         inx                 ;
F4CA : 09         dex                 ;(TEQ)
F4CB : 20 08      bra  LF4D5          ;(NNW1)
;NW0:
F4CD : 97 29      staa  $29           ;(NFRQ) REINIT FREQ
F4CF : D6 28      ldab  $28           ;(NNOIS) SAVE NEXT NOISE VAL IN B REG
F4D1 : 54         lsrb                ;HALF AMPLITUDE
F4D2 : 7C 00 0F   inc  $000F          ;(CYCNT) NOISE CYCLE COUNT AT NAMP
;*
;NNW1:
F4D5 : 39         rts                 ;
;*
;RNA:
F4D6 : 96 25      ldaa  $25           ;(CY2) NOISE AMPL CHANGE
F4D8 : 91 0F      cmpa  $0F           ;(CYCNT)
F4DA : 27 04      beq  LF4E0          ;(NW2)
F4DC : 08         inx                 ;
F4DD : 09         dex                 ;
F4DE : 20 09      bra  LF4E9          ;(NW3) TEQ
;NW2:
F4E0 : 7F 00 0F   clr  $000F          ;(NW2) CYCNT
F4E3 : 96 0E      ldaa  $0E           ;(NAMP)
F4E5 : 90 0D      suba  $0D           ;(DECAY)
F4E7 : 97 0E      staa  $0E           ;(NAMP)
;*
;NW3:
F4E9 : 39         rts
;*************************************;
;* NOISE WITH WHISTLE MAIN LOOP
;*************************************;
;NINIT
F4EA : 7F 00 1C   clr  $001C          ;(WFRQ)
F4ED : 7F 00 26   clr  $0026          ;(DFRQ)
F4F0 : 86 0E      ldaa  #$0E          ;(#$E) CYCLE OFFSET FOR WHISTLE
F4F2 : 97 1D      staa  $1D           ;(WCNT)
F4F4 : 7F 00 22   clr  $0022          ;(CURVAL) CLR WHISTLE VALUES
;NINIT2
F4F7 : 8D 9F      bsr  LF498          ;(NSUB) CLR CYCNT AND INIT FREQ
;WIN:
F4F9 : 8D A8      bsr  LF4A3          ;(NOISE1)
F4FB : BD F5 80   jsr  LF580          ;(TRIDR)
F4FE : 8D B0      bsr  LF4B0          ;(NOISE2)
F500 : BD F5 80   jsr  LF580          ;(TRIDR)
F503 : 8D BD      bsr  LF4C2          ;(RNT)
F505 : 8D 79      bsr  LF580          ;(TRIDR)
F507 : 8D CD      bsr  LF4D6          ;(RNA)
F509 : 8D 75      bsr  LF580          ;(TRIDR)
F50B : 8D 0A      bsr  LF517          ;(TRICNT)
F50D : 8D 71      bsr  LF580          ;(TRIDR)
F50F : 8D 1D      bsr  LF52E          ;(TRIFRQ)
F511 : 8D 6D      bsr  LF580          ;(TRIDR)
F513 : 8D 52      bsr  LF567          ;(NNW)
F515 : 20 E2      bra  LF4F9          ;(WIN)
;*************************************;
;TRICNT:
F517 : 96 21      ldaa  $21           ;(WCNT2) #CYCLES AT WHISTLE FREQ
F519 : 7A 00 1D   dec  $001D          ;(WCNT)
F51C : 27 07      beq  LF525          ;(NW4)
;F51E : B6 00 0E   ldaa  X000E        ; <- disasm error (FCB $B6 LDAA EXTENDED NAMP)
F51E : B6                             ;B6
F51F : 00                             ;00
F520 : 0E                             ;NAMP
F521 : 26 0A      bne  LF52D          ;(NW5) TEQ
F523 : 20 68      bra  LF58D          ;(NSEND) END NOISE
;NW4:
F525 : 97 1D      staa  $1D           ;(WCNT)
F527 : 96 1C      ldaa  $1C           ;(WFRQ)
F529 : 9B 26      adda  $26           ;(DFRQ)
F52B : 97 1C      staa  $1C           ;(WFRQ)
;NW5:
F52D : 39         rts                 ;
;*
;TRIFRQ:
F52E : 96 1C      ldaa  $1C           ;(WFRQ) WHISTLE END TEST
F530 : 91 24      cmpa  $24           ;(MINWIS)
F532 : 27 07      beq  LF53B          ;(NW6)
F534 : 08         inx                 ;(TEQ)
F535 : 96 0E      ldaa  $0E           ;(NAMP) END TEST
F537 : 26 2A      bne  LF563          ;(NW7) TEQ
F539 : 20 29      bra  LF564          ;(PEND) END NOISE
;NW6:
F53B : 7F 00 1C   clr  $001C          ;(WFRQ)
F53E : 7F 00 26   clr  $0026          ;(DFRQ)
F541 : 7F 00 22   clr  $0022          ;(CURVAL)
F544 : DE 1E      ldx  $1E            ;(PTRHI) SET UP FOR NEXT WHISTLE
;WISLD
F546 : A6 00      ldaa  $00,x         ;(X)
F548 : 97 1B      staa  $1B           ;(WHIS)
F54A : 27 17      beq  LF563          ;(NW7)
F54C : A6 01      ldaa  $01,x         ;(1,X)
F54E : 97 20      staa  $20           ;(WFRQ2)
F550 : A6 02      ldaa  $02,x         ;(2,X)
F552 : 97 27      staa  $27           ;(DFRQ2)
F554 : A6 03      ldaa  $03,x         ;(3,X)
F556 : 97 21      staa  $21           ;(WCNT2)
F558 : A6 04      ldaa  $04,x         ;(4,X)
F55A : 97 24      staa  $24           ;(MINWIS)
F55C : 86 05      ldaa  #$05          ;(#5)
F55E : BD F7 E1   jsr  LF7E1          ;(ADDX)
F561 : DF 1E      stx  $1E            ;(PTRHI)
;NW7:
F563 : 39         rts                 ;
;
;PEND:
F564 : 32         pula                ;
F565 : 32         pula                ;STACK ADJ
F566 : 39         rts
;*
;NNW:
F567 : 96 1B      ldaa  $1B           ;(WHIS) WHISTLE INIT
F569 : 27 06      beq  LF571          ;(NW8) ALREADY INITED
F56B : 91 0E      cmpa  $0E           ;(NAMP)
F56D : 26 04      bne  LF573          ;(NW9)
F56F : 20 03      bra  LF574          ;(WINIT) GO INIT WHISTLE
;
;NW8:
F571 : 08         inx                 ;
F572 : 09         dex                 ;(TEQ)
;NW9:
F573 : 39         rts                 ;
;
;WINIT:
F574 : 7F 00 1B   clr  $001B          ;(WHIS)
F577 : 96 20      ldaa  $20           ;(WFRQ2)
F579 : 97 1C      staa  $01C          ;(WFRQ)
F57B : 96 27      ldaa  $27           ;(DFRQ2)
F57D : 97 26      staa  $26           ;(DFRQ)
F57F : 39         rts                 ;
;******************
;TRIDR:
F580 : 96 22      ldaa  $22           ;(CURVAL)
F582 : 9B 1C      adda  $1C           ;(WFRQ)
F584 : 97 22      staa  $22           ;(CURVAL)
F586 : 2A 01      bpl  LF589          ;(GO)
F588 : 43         coma                ;
;GO:
F589 : 1B         aba                 ;
F58A : B7 04 00   staa  $0400         ;(SOUND)
;NSEND LF58D:
F58D : 39         rts                 ;
;*************************************;
; Tilt, buzz saw down 
;*************************************;
;TILT
F58E : 0E         cli                 ;
F58F : CE 00 E0   ldx  #$00E0         ;
;TILT1
F592 : 86 20      ldaa  #$20          ;
F594 : BD F7 E1   jsr  LF7E1          ;
;TILT2
F597 : 09         dex                 ;
F598 : 26 FD      bne  LF597          ;
F59A : 7F 04 00   clr  $0400          ;
;TILT3
F59D : 5A         decb                ;
F59E : 26 FD      bne  LF59D          ;
F5A0 : 73 04 00   com  $0400          ;
F5A3 : DE 07      ldx  $07            ;
F5A5 : 8C 10 00   cpx  #$1000         ;
F5A8 : 26 E8      bne  LF592          ;
F5AA : 39         rts                 ;
;*************************************;
;*CANNON
;*************************************;
;CANNON:
F5AB : 86 01      ldaa  #$01          ;(#1)
F5AD : 97 14      staa  $14           ;(DSFLG)
F5AF : CE 03 E8   ldx  #$03E8         ;(#1000)
F5B2 : 86 01      ldaa  #$01          ;(#1)
F5B4 : C6 FF      ldab  #$FF          ;(#$FF)
F5B6 : 20 00      bra  LF5B8          ;(FNOISE)
;*************************************;
;*FILTERED NOISE ROUTINE
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE:
F5B8 : 97 13      staa  $13           ;(FDFLG)
F5BA : D7 0D      stab  $0D           ;(FMAX)
F5BC : DF 11      stx  $11            ;(SAMPC)
F5BE : 7F 00 0F   clr  $000F          ;(FLO)
;FNOIS0:
F5C1 : DE 11      ldx  $11            ;(SAMPC)
F5C3 : B6 04 00   ldaa  $0400         ;(SOUND)
;FNOIS1:
F5C6 : 16         tab                 ;NEXT RANDOM NUMBER
F5C7 : 54         lsrb                ;
F5C8 : 54         lsrb                ;
F5C9 : 54         lsrb                ;
F5CA : D8 01      eorb  $01           ;(LO)
F5CC : 54         lsrb                ;
F5CD : 76 00 00   ror  $0000          ;(HI)
F5D0 : 76 00 01   ror  $0001          ;(LO)
F5D3 : D6 0D      ldab  $0D           ;(FMAX) SET FREQ
F5D5 : 7D 00 14   tst  $0014          ;(DSFLG)
F5D8 : 27 02      beq  LF5DC          ;(FNOIS2)
F5DA : D4 00      andb  $00           ;(HI) DISTORT FREQUENCY
;FNOIS2:
F5DC : D7 0E      stab  $0E           ;(FHI)
F5DE : D6 0F      ldab  $0F           ;(FLO)
F5E0 : 91 01      cmpa  $01           ;(LO)
F5E2 : 22 12      bhi  LF5F6          ;(FNOIS4)
;FNOIS3:
F5E4 : 09         dex                 ;SLOPE UP
F5E5 : 27 26      beq  LF60D          ;(FNOIS6)
F5E7 : B7 04 00   staa  $0400         ;(SOUND)
F5EA : DB 0F      addb  $0F           ;(FLO)
F5EC : 99 0E      adca  $0E           ;(FHI)
F5EE : 25 16      bcs  LF606          ;(FNOIS5)
F5F0 : 91 01      cmpa  $01           ;(LO)
F5F2 : 23 F0      bls  LF5E4          ;(FNOIS3)
F5F4 : 20 10      bra  LF606          ;(FNOIS5)
;FNOIS4:
F5F6 : 09         dex                 ;SLOPE DOWN
F5F7 : 27 14      beq  LF60D          ;(FNOIS6)
F5F9 : B7 04 00   staa  $0400         ;(SOUND)
F5FC : D0 0F      subb  $0F           ;(FLO)
F5FE : 92 0E      sbca  $0E           ;(FHI)
F600 : 25 04      bcs  LF606          ;(FNOIS5)
F602 : 91 01      cmpa  $01           ;(LO)
F604 : 22 F0      bhi  LF5F6          ;(FNOIS4)
;FNOIS5:
F606 : 96 01      ldaa  $01           ;(LO)
F608 : B7 04 00   staa  $0400         ;(SOUND)
F60B : 20 B9      bra  LF5C6          ;(FNOIS1)
 ;FNOIS6:
F60D : D6 13      ldab  $13           ;(FDFLG)
F60F : 27 B5      beq  LF5C6          ;(FNOIS1)
F611 : 96 0D      ldaa  $0D           ;(FMAX) DECAY MAX FREQ
F613 : D6 0F      ldab  $0F           ;(FLO)
F615 : 44         lsra                ;
F616 : 56         rorb                ;
F617 : 44         lsra                ;
F618 : 56         rorb                ;
F619 : 44         lsra                ;
F61A : 56         rorb                ;
F61B : 43         coma                ;
F61C : 50         negb                ;
F61D : 82 FF      sbca  #$FF          ;(#-1)
F61F : DB 0F      addb  $0F           ;(FLO)
F621 : 99 0D      adca  $0D           ;(FMAX)
F623 : D7 0F      stab  $0F           ;(FLO)
F625 : 97 0D      staa  $0D           ;(FMAX)
F627 : 26 98      bne  LF5C1          ;(FNOIS0)
F629 : C1 07      cmpb  #$07          ;(#7)
F62B : 26 94      bne  LF5C1          ;(FNOIS0)
F62D : 39         rts                 ;
;*************************************;
;*PARAMETER TRANSFER
;*************************************;
;TRANS:
F62E : 36         psha                ;
;TRANS1:
F62F : A6 00      ldaa  $00,x         ;(0,X)
F631 : DF 07      stx  $07            ;(XPLAY)
F633 : DE 09      ldx  $09            ;(XPTR)
F635 : A7 00      staa  $00,x         ;(0,X)
F637 : 08         inx                 ;
F638 : DF 09      stx  $09            ;(XPTR)
F63A : DE 07      ldx  $07            ;(XPLAY)
F63C : 08         inx                 ;
F63D : 5A         decb                ;
F63E : 26 EF      bne  LF62F          ;(TRANS1)
F640 : 32         pula                ;
F641 : 39         rts                 ;
;*************************************;
;*GWAVE LOADER
;*************************************;
;GWLD:
F642 : 16         tab                 ;MULKT BY 7
F643 : 58         aslb                ;
F644 : 1B         aba                 ;
F645 : 1B         aba                 ;
F646 : 1B         aba                 ;
F647 : CE F9 17   ldx  #$F917         ;(#SVTAB) SOUND VVECTOR TABLE
F64A : BD F7 E1   jsr  LF7E1          ;(ADDX)
F64D : A6 00      ldaa  $00,x         ;(,X)
F64F : 16         tab                 ;
F650 : 84 0F      anda  #$0F          ;(#$F)
F652 : 97 0E      staa  $0E           ;(GCCNT) GET CYCLE COUNT
F654 : 54         lsrb                ;
F655 : 54         lsrb                ;
F656 : 54         lsrb                ;
F657 : 54         lsrb                ;
F658 : D7 0D      stab  $0D           ;(GECHO) GET #ECHOS
F65A : A6 01      ldaa  $01,x         ;(1,X)
F65C : 16         tab                 ;
F65D : 54         lsrb                ;
F65E : 54         lsrb                ;
F65F : 54         lsrb                ;
F660 : 54         lsrb                ;
F661 : D7 0F      stab  $0F           ;(GECDEC)
F663 : 84 0F      anda  #$0F          ;(#$F) WAVE #
F665 : 97 0B      staa  $0B           ;(TEMPA) SAVE
F667 : DF 05      stx  $05            ;(TEMPX) SAVE INDEX
F669 : CE F8 28   ldx  #$F828         ;(#GWVTAB) CALC WAVEFORM ADDR
;GWLD2:
F66C : 7A 00 0B   dec  $000B          ;(TEMPA) WAVE FORM #
F66F : 2B 08      bmi  LF679          ;(GWLD3) FINIS
F671 : A6 00      ldaa  $00,x         ;(,X)
F673 : 4C         inca                ;
F674 : BD F7 E1   jsr  LF7E1          ;(ADDX)
F677 : 20 F3      bra  LF66C          ;(GWLD2)
;GWLD3:
F679 : DF 12      stx  $12            ;(GWFRM)
F67B : BD F7 34   jsr  LF734          ;(WVTRAN) XSFER WAVE TO RAM
F67E : DE 05      ldx  $05            ;(TEMPX) RESTORE INDEX
F680 : A6 02      ldaa  $02,x         ;(2,X) GET PREDECAY
F682 : 97 14      staa  $14           ;(PRDECA)
F684 : BD F7 46   jsr  LF746          ;(WVDECA) DECAY IT
F687 : DE 05      ldx  $05            ;(TEMPX)
F689 : A6 03      ldaa  $03,x         ;(3,X) GET FREQ INC
F68B : 97 10      staa  $10           ;(GDFINC)
F68D : A6 04      ldaa  $04,x         ;(4,X) GET DELTA FREQ COUNT
F68F : 97 11      staa  $11           ;(GDCNT)
F691 : A6 05      ldaa  $05,x         ;(5,X) GET PATTERN COUNT
F693 : 16         tab                 ;SAVE
F694 : A6 06      ldaa  $06,x         ;(6,X) PATTERN OFFSET
F696 : CE F9 AA   ldx  #$F9AA         ;(#GFRTAB)
F699 : BD F7 E1   jsr  LF7E1          ;(ADDX)
F69C : 17         tba                 ;GET PATTERN LENGTH
F69D : DF 15      stx  $15            ;(GWFRQ) FREQ TABLE ADDR
F69F : 7F 00 1D   clr  $001D          ;(FOFSET)
F6A2 : BD F7 E1   jsr  LF7E1          ;(ADDX)
F6A5 : DF 17      stx  $17            ;(FRQEND)
F6A7 : 39         rts                 ;
;*************************************;
;*GWAVE ROUTINE
;*************************************;
;*ACCA= FREQ PATTERN LENGTH, X= FREQ PAT ADDR
;GWAVE:
F6A8 : 96 0D      ldaa  $0D           ;(GECHO)
F6AA : 97 1C      staa  $1C           ;(GECNT)
;GWT4:
F6AC : DE 15      ldx  $15            ;(GWFRQ)
F6AE : DF 07      stx  $07            ;(XPLAY)
;GPLAY:
F6B0 : DE 07      ldx  $07            ;(XPLAY) GET NEW PERIOD
F6B2 : A6 00      ldaa  $00,x         ;(,X)
F6B4 : 9B 1D      adda  $1D           ;(FOFSET)
F6B6 : 97 1B      staa  $1B           ;(GPER)
F6B8 : 9C 17      cpx  $17            ;(FRQEND)
F6BA : 27 26      beq  LF6E2          ;(GEND) FINISH ON ZERO
F6BC : D6 0E      ldab  $0E           ;(GCCNT) CYCLE COUNT
F6BE : 08         inx                 ;
F6BF : DF 07      stx  $07            ;(XPLAY)
;GOUT:
F6C1 : CE 00 1E   ldx  #$001E         ;(#GWTAB) SETUP WAVEFORM POINTER
;GOUTLP:
F6C4 : 96 1B      ldaa  $1B           ;(GPER)
;GPRLP:
F6C6 : 4A         deca                ;WAIT FOR PERIOD
F6C7 : 26 FD      bne  LF6C6          ;(GPRLP)
F6C9 : A6 00      ldaa  $00,x         ;(,X) OUTPUT SOUND
F6CB : B7 04 00   staa  $0400         ;(SOUND)
;GPR1:
F6CE : 08         inx                 ;
F6CF : 9C 19      cpx  $19            ;(WVEND) END OF WAVE?
F6D1 : 26 F1      bne  LF6C4          ;(GOUTLP)
F6D3 : 5A         decb                ;
F6D4 : 27 DA      beq  LF6B0          ;(GPLAY)
F6D6 : 08         inx                 ;
F6D7 : 09         dex                 ;
F6D8 : 08         inx                 ;
F6D9 : 09         dex                 ;
F6DA : 08         inx                 ;
F6DB : 09         dex                 ;
F6DC : 08         inx                 ;
F6DD : 09         dex                 ;
F6DE : 01         nop                 ;
F6DF : 01         nop                 ;
F6E0 : 20 DF      bra  LF6C1          ;(GOUT) SYNC 36
;GEND:
F6E2 : 96 0F      ldaa  $0F           ;(GECDEC)
F6E4 : 8D 60      bsr  LF746          ;(WVDECA)
;GEND40:
F6E6 : 7A 00 1C   dec  $1C            ;(GECNT) ECHO ON?
F6E9 : 26 C1      bne  LF6AC          ;(GWT4) YES
F6EB : 26 46      bne  LF733          ;(GEND1)
;GEND50
F6ED : 96 10      ldaa  $10           ;(GDFINC) CONTINUE FOR FREQ MOD SOUNDS
F6EF : 27 42      beq  LF733          ;(GEND1) NO
F6F1 : 7A 00 11   dec  $0011          ;(GDCNT) DELTA FREQ OVER?
F6F4 : 27 3D      beq  LF733          ;(GEND1) YES...
F6F6 : 9B 1D      adda  $1D           ;(FOFSET) UPDATE FREQ OFFSET
;GEND60
F6F8 : 97 1D      staa  $1D           ;(FOFSET)
;GEND61
F6FA : DE 15      ldx  $15            ;(GWFRQ) GET INDEX
F6FC : 5F         clrb                ;START FOUND FLAG INIT CLEAR
;GW0:
F6FD : 96 1D      ldaa  $1D           ;(FOFSET) INC OR DEC?
F6FF : 7D 00 10   tst  $0010          ;(GDFINC)
F702 : 2B 06      bmi  LF70A          ;(GW1) DEC
F704 : AB 00      adda  $00,x         ;(,X) INC
F706 : 25 08      bcs  LF710          ;(GW2) CARRY=OVERFLOW
F708 : 20 0B      bra  LF715          ;(GW2A)
;GW1:
F70A : AB 00      adda  $00,x         ;(,X) DEC
F70C : 27 02      beq  LF710          ;(GW2) OVERFLOW ON EQ
F70E : 25 05      bcs  LF715          ;(GW2A) OVERFLOW IF CARRY CLEAR
;GW2:
F710 : 5D         tstb                ;FOUND START YET?
F711 : 27 08      beq  LF71B          ;(GW2B) NO
F713 : 20 0F      bra  LF724          ;(GW3) YES, THIS IS THE END
;GW2A:
F715 : 5D         tstb                ;
F716 : 26 03      bne  LF71B          ;(GW2B) ALREADY FOUND START
F718 : DF 15      stx  $15            ;(GWFRQ) FOUND START
F71A : 5C         incb                ;
;GW2B:
F71B : 08         inx                 ;
F71C : 9C 17      cpx  $17            ;(FRQEND)
F71E : 26 DD      bne  LF6FD          ;(GW0) NOT OVER YET
F720 : 5D         tstb                ;FOUND START?
F721 : 26 01      bne  LF724          ;(GW3) YES
F723 : 39         rts                 ;ALL OVER
;GW3:
F724 : DF 17      stx  $17            ;(FRQEND)
F726 : 96 0F      ldaa  $0F           ;(GECDEC) RE:XSFER WAVE?
F728 : 27 06      beq  LF730          ;(GEND0) NO
F72A : 8D 08      bsr  LF734          ;(WVTRAN) XSFER WAVE
F72C : 96 14      ldaa  $14           ;(PRDECA)
F72E : 8D 16      bsr  LF746          ;(WVDECA)
;GEND0:
F730 : 7E F6 A8   jmp  LF6A8          ;(GWAVE)
;GEND1:
F733 : 39         rts                 ;TERMINATE
;*************************************;
;*WAVE TRANSFER ROUTINE
;*************************************;
;WVTRAN:
F734 : CE 00 1E   ldx  #$001E         ;(#GWTAB)
F737 : DF 09      stx  $09            ;(XPTR)
F739 : DE 12      ldx  $12            ;(GWFRM)
F73B : E6 00      ldab  $00,x         ;(,X) GET WAVE LENGTH
F73D : 08         inx                 ;
F73E : BD F6 2E   jsr  LF62E          ;(TRANS)
F741 : DE 09      ldx  $09            ;(XPTR)
F743 : DF 19      stx  $19            ;(WVEND) GET END ADDR
F745 : 39         rts                 ;
;*************************************;
;*WAVE DECAY ROUTINE/ DECAY AMOUNT IN ACCA(1/16 PER DECAY)
;*************************************;
;WVDECA:
F746 : 4D         tsta                ;
F747 : 27 2B      beq  LF774          ;(WVDCX) NO DECAY
F749 : DE 12      ldx  $12            ;(GWFRM) ROM WAVE INDEX
F74B : DF 07      stx  $07            ;(XPLAY)
F74D : CE 00 1E   ldx  #$001E         ;(#GWTAB)
F750 : 97 0C      staa  $0C           ;(TEMPB) DECAY FACTOR
;WVDLP:
F752 : DF 09      stx  $09            ;(XPTR)
F754 : DE 07      ldx  $07            ;(XPLAY)
F756 : D6 0C      ldab  $0C           ;(TEMPB)
F758 : D7 0B      stab  $0B           ;(TEMPA) DECAY FACTOR TEMP
F75A : E6 01      ldab  $01,x         ;(1,X) OFFSET FOR WAVE LENGTH
F75C : 54         lsrb                ;
F75D : 54         lsrb                ;
F75E : 54         lsrb                ;
F75F : 54         lsrb                ;CALC 1/16TH
F760 : 08         inx                 ;
F761 : DF 07      stx  $07            ;(XPLAY)
F763 : DE 09      ldx  $09            ;(XPTR)
F765 : A6 00      ldaa  $00,x         ;(,X)
;WVDLP:
F767 : 10         sba                 ;(DECAY)
F768 : 7A 00 0B   dec  $000B          ;(TEMPA)
F76B : 26 FA      bne  LF767          ;(WVDLP1)
F76D : A7 00      staa  $00,x         ;(,X)
F76F : 08         inx                 ;
F770 : 9C 19      cpx  $19            ;(WVEND) END OF WAVE?
F772 : 26 DE      bne  LF752          ;(WVDLP) NO
;WVDCX:
F774 : 39         rts                 ;
;*************************************;
;* INTERRUPT PROCESSING
;*************************************;
;IRQ
F775 : 8E 00 7F   lds  #$007F         ;(#ENDRAM) RE-INITIALIZE STACK
F778 : B6 04 02   ldaa  $0402         ;(SOUND+2) GET INPUT TRIGGER
F77B : CE F0 C4   ldx  #$F0C4         ;(#DECAYZ) RANDY'S BRAIN DAMAGE
F77E : DF 02      stx  $02            ;(XDECAY)
F780 : CE 00 0D   ldx  #$000D         ;(#FREQ1)
F783 : DF 09      stx  $09            ;(XPTR)
F785 : C6 AF      ldab  #$AF          ;(#$AF)
F787 : D7 04      stab  $04           ;(AMP0)
F789 : 0E         cli                 ;NOW ALLOW IRS
F78A : 43         coma                ;INVERT INPUT
F78B : 84 3F      anda  #$3F          ;(#$3F) MASK GARB
F78D : 4D         tsta                ;
F78E : 27 4F      beq  LF7DF          ;(IRQ3)
F790 : 4A         deca                ;
F791 : 81 14      cmpa  #$14          ;(#$12+2)
F793 : 22 08      bhi  LF79D          ;(1$)
F795 : BD F6 42   jsr  LF642          ;(GWLD)
F798 : BD F6 A8   jsr  LF6A8          ;(GWAVE)
F79B : 20 42      bra  LF7DF          ;(IRQ3)
;*
;1$:
F79D : 81 1F      cmpa  #$1F          ;(#$1D+2)
F79F : 22 0F      bhi  LF7B0          ;(3$)
F7A1 : 80 15      suba  #$15          ;(#$13+2)
F7A3 : CE F8 09   ldx  #$F809         ;(#JMPTBL)
F7A6 : 48         asla                ;
F7A7 : BD F7 E1   jsr  LF7E1          ;(ADDX)
F7AA : EE 00      ldx  $00,x          ;(,X)
F7AC : AD 00      jsr  $00,x          ;(,X)
F7AE : 20 2F      bra  LF7DF          ;(IRQ3)
;
;3$:
F7B0 : 81 22      cmpa  #$22          ;(#$20+2)
F7B2 : 22 07      bhi  LF7BB          ;(4$)
F7B4 : 80 20      suba  #$20          ;(#$1E+2) NOISE REQUEST
F7B6 : BD FF 3A   jsr  LFF3A          ;(JKNOIS)
F7B9 : 20 24      bra  LF7DF          ;(IRQ3)
;4$:
F7BB : 81 26      cmpa  #$26          ;(#$24+2)
F7BD : 22 05      bhi  LF7C4          ;(IRQ3)
F7BF : 80 23      suba  #$23          ;(#$21+2)
F7C1 : BD FF 5C   jsr  LFF5C          ;(WALSH)
;5$:
F7C4 : 81 27      cmpa  #$27          ;(#$25+2)
F7C6 : 22 05      bhi  LF7CD          ;(6$)
F7C8 : BD F5 8E   jsr  LF58E          ;
F7CB : 20 12      bra  LF7DF          ;(IRQ3)
;6$:
F7CD : 81 28      cmpa  #$28          ;(#$26+2)
F7CF : 22 05      bhi  LF7D6          ;(7$)
F7D1 : BD F5 AB   jsr  LF5AB          ;
F7D4 : 20 09      bra  LF7DF          ;(IRQ3)
;7$:
F7D6 : 81 29      cmpa  #$29          ;(#$27+2)
F7D8 : 22 05      bhi  LF7DF          ;(IRQ3)
F7DA : 86 00      ldaa  #$00          ;
F7DC : BD F3 B8   jsr  LF3B8          ;(VARILD)
;IRQ3:
F7DF : 20 FE      bra  LF7DF          ;(*)
;*************************************;
;* ADD A TO INDEX REGISTER
;*************************************;
;ADDX:
F7E1 : DF 07      stx  $07            ;(XPLAY)
F7E3 : 9B 08      adda  $08           ;(XPLAY+1)
F7E5 : 97 08      staa  $08           ;(XPLAY+1)
F7E7 : 24 03      bcc  LF7EC          ;(ADDX1)
F7E9 : 7C 00 07   inc  $0007          ;(XPLAY)
;ADDX1:
F7EC : DE 07      ldx  $07            ;(XPLAY)
F7EE : 39         rts                 ;
;*************************************;
;* DIAGNOSTIC PROCESSING HERE
;*************************************;
;NMI:
F7EF : 0F         sei                 ;
F7F0 : 8E 00 7F   lds  #$007F         ;(#ENDRAM) RESET THE STACK
F7F3 : CE FF FF   ldx  #$FFFF         ;
F7F6 : 5F         clrb                ;
;NMI1:
F7F7 : E9 00      adcb  $00,x         ;(0,X)
F7F9 : 09         dex                 ;
F7FA : 8C F0 00   cpx  #$F000         ;
F7FD : 26 F8      bne  LF7F7          ;(NMI1)
F7FF : E1 00      cmpb  $00,x         ;(0,X)
F801 : 27 01      beq  LF804          ;(NMI2)
F803 : 3E         wai                 ;
;NMI2:
F804 : BD F1 52   jsr  LF152          ;(KNOCK)
F807 : 20 E6      bra  LF7EF          ;(NMI) KEEP LOOPING
;*************************************;
;*SPECIAL ROUTINE JUMP TABLE
;*************************************;
;JMPTBL
F809 : F4 1A                          ;(LITE) $14
F80B : F0 D4                          ;(SND4) 15
F80D : F0 D9                          ;(SND5) 16
F80F : F0 C8                          ;(THNDR) 17
F811 : F1 BE                          ;(ATARI) 18
F813 : F1 C9                          ;(PERK$$) 19
F815 : F1 D2                          ;(SQRT) 1A
F817 : F1 52                          ;(KNOCK) 1B
F819 : F0 DE                          ;(WHIST) 1C
F81B : F0 01                          ;(SETUP) 1D
F81D : FF 34                          ;(WINGDN) 1E
;*************************************;
;*VARI VECTORS
;*************************************;
;VVECT   EQU  *
F81F : 28 01 00 08 81 02 00 FF FF     ;FOSHIT
;*************************************;
;*WAVE TABLE
;*************************************;
;*1ST BYTE= WAVELENGTH
;GWVTAB  EQU  *
F828 : 08                             ;GS2
F829 : 7F D9 FF D9 7F 24 00 24        ;
;
F831 : 08                             ;GSSQ2
F832 : 00 40 80 00 FF 00 80 40        ;
;
F83A : 10                             ;GS1:
F83B : 7F B0 D9 F5 FF F5 D9 B0        ;
F843 : 7F 4E 24 09 00 09 24 4E        ;
;
F84B : 10                             ;GS12
F84C : 7F C5 EC E7 BF 8D 6D 6A        ;
F854 : 7F 94 92 71 40 17 12 39        ;
;
F85C : 10                             ;GSQ22
F85D : FF FF FF FF 00 00 00 00        ;
F865 : FF FF FF FF 00 00 00 00        ;
;
F86D : 48                             ;GS72
F86E : 8A 95 A0 AB B5 BF C8 D1        ;
F876 : DA E1 E8 EE F3 F7 FB FD        ;
F87E : FE FF FE FD FB F7 F3 EE        ;
F886 : E8 E1 DA D1 C8 BF B5 AB        ;
F88E : A0 95 8A 7F 75 6A 5F 54        ;
F896 : 4A 40 37 2E 25 1E 17 11        ;
F89E : 0C 08 04 02 01 00 01 02        ;
F8A6 : 04 08 0C 11 17 1E 25 2E        ;
F8AE : 37 40 4A 54 5F 6A 75 7F        ;
;
F8B6 : 10                             ;GS1.7
F8B7 : 59 7B 98 AC B3 AC 98 7B        ;
F8BF : 59 37 19 06 00 06 19 37        ;
;
F8C7 : 08                             ;GSQ2
F8C8 : FF FF FF FF 00 00 00 00        ;
;
F8D0 : 10                             ;GS1234
F8D1 : 76 FF B8 D0 9D E6 6A 82        ;
F8D9 : 76 EA 81 86 4E 9C 32 63        ;
;
F8E1 : 10                             ;MW1
F8E2 : 00 F4 00 E8 00 DC 00 E2        ;
F8EA : 00 DC 00 E8 00 F4 00 00        ;
;
F8F2 : 24                             ;SIN3.CR
F8F3 : 7F B0 D6 E8 E3 C9 A3 7B        ;WAVE C
F8FB : 5E 54 5E 7B A3 C9 E3 E8        ;
F803 : D6 B0 7F 4C 26 14 19 33        ;
F90B : 5A 81 9E A8 9E 81 5A 33        ;
F913 : 19 14 26 4C                    ;
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
;SVTAB   EQU  *
;DP1V
F917 : 11 05 11 01 0F 01 3A           ;1
;PROTV
F91E : 21 35 11 FF 00 0D 0E           ;2
;SPNRV
F925 : 15 00 00 FD 00 01 4E           ;3
;CLDWNV
F92C : 31 11 00 01 00 03 4F           ;4
;ED10
F933 : F6 53 03 00 02 06 79           ;5
;HUNV
F93A : 14 17 00 00 00 0E 00           ;6
;STRT
F941 : 13 10 00 FF 00 09 80           ;7
;BMPV
F948 : F2 19 00 00 00 16 8F           ;8
;SF10
F94F : 41 02 D0 00 00 27 52           ;9
;SV0
F956 : 52 36 00 00 00 10 24           ;A
;SV1
F95D : 73 29 03 00 00 10 A6           ;B
;SV2
F964 : 11 40 03 ED 09 09 1B           ;C
;SVA
F96B : 16 82 03 0E 01 0E 7F           ;D
;SVB
F972 : 11 29 00 F0 05 08 B6           ;E
;SVF
F979 : 63 26 06 00 00 10 A6           ;F
F980 : 21 25 00 03 0A 03 4F           ;10
F987 : 43 0A 00 04 02 0D 0E           ;11
;ED17
F98E : 1F 12 00 FF 10 04 4E           ;12
;CYNEW
F995 : 11 10 00 0A 00 01 80           ;13
;WIRDV
F99C : 21 30 00 FF 00 1B 00           ;14
;WIRDV2
F9A3 : 22 21 00 FE 00 1B 00           ;15
;*************************************;
;*GWAVE FREQ PATTERN TABLE
;*************************************;
;GFRTAB  EQU  *
;*HUNDRED POINT SOUND
F9AA : 01 01 02 02 04 04 08 08        ;HBTSND
F9B2 : 10 10 30 60 C0 E0              ;
;*SPINNER SOUND
F9B8 : 01 01 02 02 03 04 05 06        ;SPNSND
F9C0 : 07 08 09 0A 0C                 ;
;*TURBINE START UP
F9C5 : 80 7C 78 74 70 74 78 7C        ;TRBPAT
F9CD : 80                             ;
;*HEARTBEAT DISTORTO
F9CE : 01 01 02 02 04 04 08 08        ;HBDSND
F9D6 : 10 20 28 30 38 40 48 50        ;
F9DE : 60 70 80 A0 B0 C0              ;
;*SWEEP PATTERN
;SWPAT  EQU  *
;*BIGBEN SOUNDS
F9E4 : 08 40 08 40 08 40 08 40        ;BBSND
F9EC : 08 40 08 40 08 40 08 40        ;
F9F4 : 08 40 08 40                    ;
;*SPINNER SOUND "DRIP"
F9F8 : 40                             ;SPNR
;*COOL DOWNER
F9F9 : 10 08 01                       ;COOLDN
;*START DISTORTO SOUND
F9FC : 01 01 01 01 02 02 03 03        ;STDSND
F904 : 04 04 05 06 08 0A 0C 10        ;
FA0C : 14 18 20 30 40 50 40 30        ;
FA14 : 20 10 0C 0A 08 07 06 05        ;
FA1C : 04 03 02 02 01 01 01           ;
;*ED'S SOUND 10
FA23 : 07 08 09 0A 0C 08              ;ED10FP
;
FA29 : 0C                             ;GV27
;
FA2A : 08 80 10 78 18 70 20 60        ;YUKSND
FA32 : 28 58 30 50 40 48 00           ;
;
FA39 : 01 40 02 42 03 43 04 44        ;BWSSND
FA41 : 05 45 06 46 07 47 08 48        ;
FA49 : 09 49 0A 4A 0B 4B 00           ;
;
FA50 : 14 18 20 30 40 50 40 30        ;GVA1
FA58 : 20 10 0C 0A 08 07 06 05        ;
;
FA60 : CC BB 60 10 EE AA 50 00        ;GVB1
;*************************************;
;*  AND THE EVER POPULAR COPYRIGHT MESSAGE
;*************************************;
FA68 : 28 43    "(C"                  ;(C)
FA6A : 29 31    ")1"                  ;1982
FA6C : 39    "9"                      ;
FA6D : 38    "8"                      ;
FA6E : 32    "2"                      ;
FA6F : 20 57    " W"                  ;WILLIAMS
FA71 : 49    "I"                      ;
FA72 : 4C    "L"                      ;
FA73 : 4C    "L"                      ;
FA74 : 49    "I"                      ;
FA75 : 41    "A"                      ;
FA76 : 4D    "M"                      ;
FA77 : 53    "S"                      ;
FA78 : 20 45    " E"                  ;ELECTRONICS
FA7A : 4C    "L"                      ;
FA7B : 45    "E"                      ;
FA7C : 43    "C"                      ;
FA7D : 54    "T"                      ;
FA7E : 52    "R"                      ;
FA7F : 4F    "O"                      ;
FA80 : 4E    "N"                      ;
FA81 : 49    "I"                      ;
FA82 : 43    "C"                      ;
FA83 : 53    "S"                      ;
;*************************************;
;* NAM WALSH FUNCTION SOUND MACHINE V2
;*************************************;
;* T. MURPHY  11/10/81
;
MINPER  EQU  25      ;6*25 = 150 MICROSECS IS MIN SAMPLE PERIOD
SOUND   SET  $400
;
WORG
        ORG  0
;
        RMB  8       ;GLOBALS
;
FCMDPT  RMB  2       ;PTR TO CURRENT FILTER COMMAND (USER INITIALIZED)
PCMDPT  RMB  2       ;SAME FOR PITCH PROGRAM
SMPPER  RMB  2       ;HI BYTE * 6 IS SAMPLE DELAY
HRMTBL  RMB  2       ;PTR TO HARMONIC FN VALUE TABLE
;
WAVSRT  RMB  16      ;WAVEFORM
;
PERVEL  RMB  2       ;ADDED TO SMPPER EACH WAVE (PITCH CONTROL)
GLBPRO  RMB  1       ;GLOBAL PERIOD OFFSET
TMPPER  RMB  1       ;= SMPPER + GLBPRO
PERACM  RMB  1       ;USED TO CALCULATE SMALL PITCH ADJUSTS
;
PWVCNT  EQU  *       ;#OF WAVES TO PLAY BEFORE NEXT PITCH CMD (P PROGRAM)
PSTK    RMB  2       ;TOP OF PITCH RETURN/COUNT STACK
PWAVPT  RMB  2       ;PTR TO CURRENT SAMPLE BEING PLAYED
PCMD    RMB  1       ;CURRENT PITCH CMD
PTEMP   RMB  2
;
FVECT   RMB  3       ;JUMP TO CURRENT FILTER STATE (FILTER PGM CONTROL)
FCNT    EQU  *       ;MISC CTR, WAVE DELAY IF <0
FSTK    RMB  2       ;TOP OF FILTER RETURN/COUNT STACK
HAPTR   RMB  2       ;PTR TO AMPLITUDE OF CURRENT HARMONIC
;
FWVPTR  RMB  2       ;PTS TO WAVE PT BEING ALTERED (FILTER GUTS)
HAMP    RMB  1       ;CURRENT HARMONIC AMPLITUDE
FMSK    RMB  1       ;BIT MASK SELECTS HARMONIC FN VALUE
*                    ;NEXT 3 MUST BE IN ORDER
FNHI    RMB  1       ;HOLDS CURRENT HARMONIC FN VALUES AS BITS
FNLO    RMB  1       ;ALSO USED AS TEMPORARIES
FCMD    RMB  1       ;CURRENT INSTRUCTION BEING EXECUTED
;
FBTM    EQU  *-3     ;FILTER STACK GROWS UP
        ORG  95
PBTM    EQU  *       ;PITCH STACK GROWS DOWN
;
        RMB  1       ;ADD2HA FOR CONST WAVE
ADD2HA  RMB  8       ;ADD ADD2HA(8-I)*HARM(I) TO WAVE
CNAMP   RMB  1       ;CURRENT AMP OF CONST FUNCTION
CURHA   RMB  8       ;CURHA(8-I) = <WAVE!HARM(I)>
;
ENDRAM  SET  127
;
        ORG  WORG
;*************************************;
; SUBTTL WAVE PLAYER AND PITCH MODIFICATION
;*************************************;
;* PLAY A SAMPLE, REMAINING DELAY IN B.  TOTAL DELAY = MIN (60,B*6) MICS.
;
;NTHRVC
FA84 : C0 0D      subb  #$0D          ;(#13) LOOP DELAY IS 78 CYCLES
FA86 : 37         pshb                ;
FA87 : BD 00 2C   jsr  L002C          ;(FVECT 62)
FA8A : 33         pulb                ;
;NXTSMP:
FA8B : C1 14      cmpb  #$14          ;(#20) CALL HERE
FA8D : 22 F5      bhi  LFA84          ;(NTHRVC) MODIFY WAVE IF WE HAVE ENOUGH TIME
;
FA8F : 01         nop                 ;
FA90 : 96 24      ldaa  $24           ;(PERACM)
FA92 : 9B 21      adda  $21           ;(PERVEL+1)
FA94 : 97 24      staa  $24           ;(PERACM)
FA96 : C9 F6      adcb  #$F6          ;(#-10) MINIMUM DELAY + FRACTION
;
FA98 : 5A         decb                ;WASTE SMALL TIME
FA99 : 2A FD      bpl  LFA98          ;(*-1)
;
FA9B : 96 28      ldaa  $28           ;(PWAVPT+1) PT TO NEXT BYTE OF 16 BYTE WAVE
FA9D : 4C         inca                ;
FA9E : 84 0F      anda  #$0F          ;(#15)
FAA0 : 8A 10      oraa  #$10          ;(#WAVSRT) ! WAVSRT MUST BE DIVISIBLE BY 16 !
FAA2 : 97 28      staa  $28           ;(PWAVPT+1)
;
FAA4 : DE 27      ldx  $27            ;(PWAVPT)
FAA6 : E6 00      ldab  $00,x         ;(,X)
FAA8 : F7 04 00   stab  $0400         ;(SOUND)
;
FAAB : 84 0F      anda  #$0F          ;(#15) 0 IFF RESTARTING WAVE
FAAD : 39         rts                 ;
;
;*************************************;
; Walsh Machine
;*************************************;
;* PLAYS WAVE AND ALTERS PITCH ACCORDING TO PITCH CMDS.
;* SMPPER IS INITIAL PITCH,  PCMDPT IS START PITCH PROGRAM,
;* FCMDPT IS START WAVE MODIFIER (FILTER) PROGRAM.
;
;WSM
FAAE : 4F         clra                ;
FAAF : CE 00 10   ldx  #$0010         ;(#WAVSRT)
FAB2 : C6 61      ldab  #$61          ;(#CURHA+8-WAVSRT)
;1$
FAB4 : A7 00      staa  $00,x         ;(,X)
FAB6 : 08         inx                 ;
FAB7 : 5A         decb                ;
FAB8 : 26 FA      bne  LFAB4          ;(1$)
FABA : C6 5F      ldab  #$5F          ;(#PBTM)
FABC : D7 26      stab  $26           ;(PSTK+1)
FABE : C6 37      ldab  #$37          ;(#FBTM)
FAC0 : D7 30      stab  $30           ;(FSTK+1)
FAC2 : C6 7E      ldab  #$7E          ;(#126)
FAC4 : D7 2C      stab  $2C           ;(FVECT)
FAC6 : CE FC 99   ldx  #$FC99         ;(#NXTFCM)
FAC9 : DF 2D      stx  $2D            ;(FVECT+1)
FACB : D6 0C      ldab  $0C           ;(SMPPER)
FACD : D7 23      stab  $23           ;(TMPPER)
;
;PPLPE1
FACF : C0 03      subb  #$03          ;(#3)
;PPLPE2
FAD1 : BD FA 8B   jsr  LFA8B          ;(NXTSMP)
FAD4 : 08         inx                 ;
;
;PPLP
FAD5 : D6 23      ldab  $23           ;(TMPPER)
FAD7 : C0 02      subb  #$02          ;(#2) LOOP DELAY IS 18-6 = 12
FAD9 : BD FA 84   jsr  LFA84          ;(NTHRVC)
FADC : 26 F7      bne  LFAD5          ;(PPLP) ESCAPE ON WAVE BOUNDARY
;
FADE : D6 20      ldab  $20           ;(PERVEL 7) (ALL TIMES ARE SINCE RTS FROM LAST NXTSMP)
FAE0 : 96 21      ldaa  $21           ;(PERVEL+1)
FAE2 : 9B 0D      adda  $0D           ;(SMPPER+1) UPDATE SAMPLE RATE ONCE EACH WAVE PLAY
FAE4 : D9 0C      adcb  $0C           ;(SMPPER)
FAE6 : 97 0D      staa  $0D           ;(SMPPER+1)
FAE8 : D7 0C      stab  $0C           ;(SMPPER 24)
;
FAEA : DB 22      addb  $22           ;(GLBPRO)
FAEC : 86 19      ldaa  #$19          ;(#MINPER) AVOID SYNC ERROS BY LIMITING PITCH.
FAEE : 11         cba                 ; MAX. PITCH ALLOWS AT LEAST 1 FILTER
FAEF : 24 01      bcc  LFAF2          ;(*+3) CALL PER SAMPLE
;FAF1 : 81 16      cmpa  #$16          ;<- disasm error (FCB 81 TAB)
FAF1 : 81                             ;FCB 129
FAF2 : 16         tab                 ;
FAF3 : D7 23      stab  $23           ;(TMPPER 41)
FAF5 : 01         nop                 ;
FAF6 : C0 09      subb  #$09          ;(#9)
FAF8 : BD FA 8B   jsr  LFA8B          ;(NXTSMP 54)
;
FAFB : 96 2F      ldaa  $2F           ;(FCNT) COUNT WAVE PLAYS FOR FILTER
FAFD : 16         tab                 ; (ONLY IF <0)
FAFE : 48         asla                ;
FAFF : C9 00      adcb  #$00          ;(#0)
FB01 : D7 2F      stab  $2F           ;(FCNT 13)
;
FB03 : D6 23      ldab  $23           ;(TMPPER)
FB05 : C0 05      subb  #$05          ;(#5)
FB07 : 96 25      ldaa  $25           ;(PWVCNT)
FB09 : 2A 06      bpl  LFB11          ;(PAWAKE)
;
FB0B : 7C 00 25   inc  $0025          ;(PWVCNT) UPDATE DELAY COUNT IF <0
FB0E : 01         nop                 ;
FB0F : 20 BE      bra  LFACF          ;(PPLPE1 37)
;
;PAWAKE
FB11 : 5A         decb                ;ELSE WE ARE ALIVE
FB12 : BD FA 8B   jsr  LFA8B          ;(NXTSMP 36)
;
FB15 : DE 0A      ldx  $0A            ;(PCMDPT)
FB17 : A6 00      ldaa  $00,x         ;(,X)
FB19 : 2A 12      bpl  LFB2D          ;(PPLP1) MOST CMDS ARE >0
;
FB1B : 81 80      cmpa  #$80          ;(#128)
FB1D : 27 5F      beq  LFB7E          ;(STOPR 19) EXCEPT FOR END = 128
;
FB1F : 4C         inca                ;
FB20 : 97 25      staa  $25           ;(PWVCNT) OR A NEGATIVE NUMBER -N
FB22 : 08         inx                 ; WHICH WAITS N WAVE PLAYS
;FB23 : FF 00 0A   stx  $000A          ;<- disasm error (FCB -1,0,PCMDPT)
FB23 : FF                             ;-1  BEFORE FETCHING THE NEXT COMMAND
FB24 : 00                             ;0
FB25 : 0A                             ;PCMDPT
;
;PPLP35
FB26 : D6 23      ldab  $23           ;(TMPPER)
FB28 : C0 06      subb  #$06          ;(#6)
FB2A : 7E FA CF   jmp  LFACF          ;(PPLPE1 43)
;
;PPLP1
FB2D : 08         inx                 ;
FB2E : E6 00      ldab  $00,x         ;(,X) GET NEXT COMMAND STRING BYTE ON STACK
FB30 : 37         pshb                ;
FB31 : 08         inx                 ;
FB32 : DF 0A      stx  $0A            ;(PCMDPT 35)
;
FB34 : 97 29      staa  $29           ;(PCMD)
FB36 : 84 70      anda  #$70          ;(#$70)
FB38 : 44         lsra                ;
FB39 : 44         lsra                ;
FB3A : 44         lsra                ;
FB3B : 5F         clrb                ;
;
FB3C : 8B 12      adda  #$12          ;(#PCMDJT!.255)
FB3E : C9 FC      adcb  #$FC          ;(#PCMDJT/256)
FB40 : 97 2B      staa  $2B           ;(PTEMP+1)
FB42 : D7 2A      stab  $2A           ;(PTEMP 61)
;
FB44 : D6 23      ldab  $23           ;(TMPPER)
FB46 : D6 23      ldab  $23           ;(TMPPER)
FB48 : C0 0D      subb  #$0D          ;(#13)
FB4A : BD FA 8B   jsr  LFA8B          ;(NXTSMP 78)
;
FB4D : 5F         clrb                ;
FB4E : DE 2A      ldx  $2A            ;(PTEMP) EXECUTE CMD
FB50 : EE 00      ldx  $00,x          ;(,X)
FB52 : 6E 00      jmp  $00,x          ;(,X 16)
;*************************************;
;* PITCH COMMAND ROUTINES. 
;*************************************;
;  UNLESS OTHERWISE STATED, N IS A SIGNED 8 BIT
;* NUMBER = BYTE FOLLOWING OPCODE.
;
;* LDP N  IS  SMPPER := N,  ADP N  IS SMPPER := SMPPER + N
;
;LDPR
FB54 : 96 29      ldaa  $29           ;(PCMD) BIT 0 = 1 FOR LOAD
FB56 : 47         asra                ;
FB57 : C2 00      sbcb  #$00          ;(#0)
FB59 : D4 0C      andb  $0C           ;(SMPPER)
FB5B : 32         pula                ;
FB5C : 10         sba                 ;
FB5D : 9B 0C      adda  $0C           ;(SMPPER)
FB5F : 97 0C      staa  $0C           ;(SMPPER 39)
FB61 : 08         inx                 ;
;LDPRE
FB62 : D6 23      ldab  $23           ;(TMPPER)
FB64 : C0 0A      subb  #$0A          ;(#10)
FB66 : 7E FA D1   jmp  LFAD1          ;(PPLPE2 51)
;*************************************;
;* LDO N IS  GLBPRO := N,  ADO N IS  GLBPRO := GLBPRO + N
;
;LDOR
FB69 : 96 29      ldaa  $29           ;(PCMD) BIT 0 = 1 FOR LOAD
FB6B : 47         asra                ;
FB6C : C2 00      sbcb  #$00          ;(#0)
FB6E : D4 22      andb  $22           ;(GLBPRO)
FB70 : 32         pula                ;
FB71 : 10         sba                 ;
FB72 : 9B 22      adda  $22           ;(GLBPRO)
FB74 : 97 22      staa  $22           ;(GLBPRO)
FB76 : 20 EA      bra  LFB62          ;(LDPRE)
;*************************************;
;* ESC EXECUTES MACHINE LANGUAGE IMMEDIATELY FOLLOWING
;
;ESCR
FB78 : 32         pula                ;
FB79 : DE 0A      ldx  $0A            ;(PCMDPT)
FB7B : 09         dex                 ;
FB7C : 6E 00      jmp  $00,x          ;(,X 32)
;*************************************;
;* STOP EITHER REPEATS A CALL, RETURNS FROM A CALL, OR ENDS SOUND.
;
;STOPR
FB7E : 96 26      ldaa  $26           ;(PSTK+1)
FB80 : 81 5F      cmpa  #$5F          ;(#PBTM)
FB82 : 2B 01      bmi  LFB85          ;(*+3 28)
FB84 : 39         rts                 ;
;
FB85 : D6 23      ldab  $23           ;(TMPPER)
FB87 : C0 07      subb  #$07          ;(#7)
FB89 : BD FA 8B   jsr  LFA8B          ;(NXTSMP 42)
;
FB8C : DE 25      ldx  $25            ;(PSTK)
FB8E : 6A 02      dec  $02,x          ;(2,X)
FB90 : 2B 12      bmi  LFBA4          ;(PRET 15) DONE
;
FB92 : EE 00      ldx  $00,x          ;(,X) ELSE REPEAT
FB94 : A6 00      ldaa  $00,x         ;(,X)
FB96 : 36         psha                ;
FB97 : 08         inx                 ;
FB98 : DF 0A      stx  $0A            ;(PCMDPT 39)
;
;FB9A : F6 00 23   ldab  X0023         ;<- disasm error (FCB -10,0,TMPPER)
F89A : F6                             ;-10
F89B : 00                             ;0
F89C : 23                             ;TMPPER
FB9D : C0 09      subb  #$09          ;(#9)
FB9F : BD FA 8B   jsr  LFA8B          ;(NXTSMP 54)
;
FBA2 : 20 55      bra  LFBF9          ;(PTORE1)
;
;PRET
FBA4 : EE 00      ldx  $00,x          ;(,X)
FBA6 : 08         inx                 ;
FBA7 : DF 0A      stx  $0A            ;(PCMDPT)
FBA9 : 96 26      ldaa  $26           ;(PSTK+1)
FBAB : 8B 03      adda  #$03          ;(#3)
FBAD : 97 26      staa  $26           ;(PSTK+1)
;
FBAF : D6 23      ldab  $23           ;(TMPPER)
FBB1 : C0 07      subb  #$07          ;(#7)
FBB3 : 01         nop                 ;
FBB4 : 7E FA CF   jmp  LFACF          ;(PPLPE1 49)
;*************************************;
;* LDV N IS  PERVEL := N,  ADV N IS  PERVEL := PERVEL + N
;* IN THIS CASE  N IS A 12 BIT NUMBER, THE UPPER 4 BITS OF WHICH
;* ARE LO 4 BITS OF THE OPCODE BYTE.
;
;ADVR
FBB7 : 08         inx                 ;
FBB8 : 20 04      bra  LFBBE          ;(*+6)
;
;LDVR
FBBA : D7 20      stab  $20           ;(PERVEL) CLEAR PERVEL FOR LOAD
FBBC : D7 21      stab  $21           ;(PERVEL+1 24)
;
FBBE : D6 29      ldab  $29           ;(PCMD)
FBC0 : C4 0F      andb  #$0F          ;(#15) SIGN EXTEND
FBC2 : CB F8      addb  #$F8          ;(#-8)
FBC4 : C8 F8      eorb  #$F8          ;(#-8 34)
;
FBC6 : 32         pula                ;
FBC7 : 9B 21      adda  $21           ;(PERVEL+1)
FBC9 : D9 20      adcb  $20           ;(PERVEL)
FBCB : 97 21      staa  $21           ;(PERVEL+1)
FBCD : D7 20      stab  $20           ;(PERVEL 52)
;
;FBCF : F6 00 23   ldab  X0023         ;<- disasm error (FCB -10,0,TMPPER)
FBCF : F6                             ;-10
FBD0 : 00                             ;0
FBD1 : 23                             ;TMPPER
FBD2 : C0 09      subb  #$09          ;(#9)
FBD4 : 7E FA CF   jmp  LFACF          ;(PPLPE1 61)
;*************************************;
;* DO R,N  CALLS RTN AT *+N  R TIMES.
;
;PDOR
FBD7 : 96 26      ldaa  $26           ;(PSTK+1)
FBD9 : 80 03      suba  #$03          ;(#3)
FBDB : 97 26      staa  $26           ;(PSTK+1 25)
;
FBDD : DE 25      ldx  $25            ;(PSTK)
FBDF : 96 0B      ldaa  $0B           ;(PCMDPT+1) STACK ENTRY TO DISPLACEMENT
FBE1 : D6 0A      ldab  $0A           ;(PCMDPT)
FBE3 : 8B FF      adda  #$FF          ;(#-1)
FBE5 : C9 FF      adcb  #$FF          ;(#-1)
FBE7 : E7 00      stab  $00,x         ;(,X)
FBE9 : A7 01      staa  $01,x         ;(1,X 53)
FBEB : D6 29      ldab  $29           ;(PCMD) LO OPCODE BITS ARE REPEAT CNT
FBED : C4 0F      andb  #$0F          ;(#15)
FBEF : E7 02      stab  $02,x         ;(2,X 64)
;
FBF1 : D6 23      ldab  $23           ;(TMPPER)
FBF3 : C0 0C      subb  #$0C          ;(#12)
FBF5 : BD FA 8B   jsr  LFA8B          ;(NXTSMP 78)
;
FBF8 : 08         inx                 ;SYNC W/NEXT RTN
;PTORE1
FBF9 : 08         inx                 ;
FBFA : 08         inx                 ;
FBFB : 5F         clrb                ;
FBFC : 01         nop                 ;
;
;* TO N  SETS LOC TO BE *+N.
;
;PTOR
FBFD : 32         pula                ;(20)
FBFE : 47         asra                ;
FBFF : 49         rola                ;
FC00 : C2 00      sbcb  #$00          ;(#0)
FC02 : 9B 0B      adda  $0B           ;(PCMDPT+1)
FC04 : D9 0A      adcb  $0A           ;(PCMDPT)
FC06 : 97 0B      staa  $0B           ;(PCMDPT+1)
;FC08 : F7 00 0A   stab  X000A         ;<- disasm error (FCB -9,0,PCMDPT 41)
FC08 : F7                             ;-9
FC09 : 00                             ;0
FC0A : 0A                             ;PCMDPT
;
FC0B : D6 23      ldab  $23           ;(TMPPER)
FC0D : C0 07      subb  #$07          ;(#7)
FC0F : 7E FA CF   jmp  LFACF          ;(PPLPE1 49)
;*************************************;
;jump table
;*************************************;
;PCMDJT FDB
FC12 : FB 54                          ;LDPR 0
FC14 : FB 69                          ;LDOR 1
FC16 : FB BA                          ;LDVR 2
FC18 : FB B7                          ;ADVR 3
FC1A : FB 54                          ;LDPR 4
FC1C : FB 78                          ;ESCR 5
FC1E : FB D7                          ;PDOR 6
FC20 : FB FD                          ;PTOR 7
;FCMDJT FDB
FC21 : FD 96                          ;ADHR 0
FC23 : FE 1F                          ;LDTR 1
FC25 : FC CE                          ;ETBR 2
FC27 : FD C7                          ;HIDR 3
FC2A : FC 49                          ;FINR 4
FC2C : FD D8                          ;ZTBR 5
FC2E : FC 74                          ;FDOR 6
FC30 : FD 0B                          ;FTOR 7
;
;*************************************;
;SUBTTL	WAVE MODIFICATION
;*************************************;
;* FENDR OVERLAY GETS RETURN ADDR FROM STACK.
;
;FRTURN
FC32 : DE 2F      ldx  $2F            ;(FSTK)
FC34 : EE 03      ldx  $03,x          ;(3,X)
FC36 : 08         inx                 ;NEXT INSTR IS AFTER DISPLACEMENT BYTE
FC37 : DF 08      stx  $08            ;(FCMDPT 49)
FC39 : BD FD 05   jsr  LFD05          ;(FCMDNX 41)
FC3C : 08         inx                 ;
FC3D : 39         rts                 ;
;*************************************;
;* REPEAT CALL.
;
;FDOAGN
FC3E : EE 00      ldx  $00,x          ;(,X) PT TO DISPLACEMENT BYTE
FC40 : DF 08      stx  $08            ;(FCMDPT 35)
FC42 : CE FD 0B   ldx  #$FD0B         ;(#FTOR) JUMP RTN IS NEXT
FC45 : DF 2D      stx  $2D            ;(FVECT+1)
FC47 : 01         nop                 ;
FC48 : 39         rts                 ;(50)
;*************************************;
;* FIN DOES  REPEAT CALL, RETURN TO CALLER, STOP RTN DEPENDING ON STACK.
;
;FINR
FC49 : 96 30      ldaa  $30           ;(FSTK+1)
FC4B : 81 37      cmpa  #$37          ;(#FBTM)
FC4D : 23 12      bls  LFC61          ;(ALLDON 9) LAST END STATEMENT
;
FC4F : DE 2F      ldx  $2F            ;(FSTK)
FC51 : 6A 02      dec  $02,x          ;(2,X) NO, CHECK TOP OF STACK
FC53 : 2A E9      bpl  LFC3E          ;(FDOAGN 24) STILL REPEATING
;
FC55 : 80 03      suba  #$03          ;(#3)
FC57 : 97 30      staa  $30           ;(FSTK+1)
FC59 : CE FC 32   ldx  #$FC32         ;(#FRTURN) ELSE RETURN
FC5C : DF 2D      stx  $2D            ;(FVECT+1 38)
FC5E : 6D 00      tst  $00,x          ;(,X)
FC60 : 39         rts                 ;
;*************************************;
;ALLDON
FC61 : CE FC 69   ldx  #$FC69         ;(#WAST50)
FC64 : DF 2D      stx  $2D            ;(FVECT+1)
FC66 : 01         nop                 ;(19)
FC67 : 20 05      bra  LFC6E          ;(WAST27)
;
;WAST50
FC69 : 08         inx                 ;
FC6A : 08         inx                 ;
FC6B : 01         nop                 ;
;WAST40
FC6C : 8D 05      bsr  LFC73          ;(WAST5)
;WAST27
FC6E : 8D 03      bsr  LFC73          ;(WAST5)
;WAST14
FC70 : 6D 00      tst  $00,x          ;(,X)
;WAST7
FC72 : 01         nop                 ;
;WAST5
FC73 : 39         rts                 ;
;*************************************;
;* CALL WITH REPEAT. REPEAT CNT 0(=1) TO 15 (=16) IS LO 4 BITS OF OPCODE.
;* NEXT BYTE IS DISPLACEMENT AS IN GO INSTRUCTION.  THE CTR AND RETURN
;* ADDRESS ARE SAVED ON A STACK.
;
;FDOR
FC74 : DE 2F      ldx  $2F            ;(FSTK)
FC76 : 96 08      ldaa  $08           ;(FCMDPT) SAVE ADDR OF DISPLACEMENT BYTE
FC78 : A7 03      staa  $03,x         ;(3,X)
FC7A : 96 09      ldaa  $09           ;(FCMDPT+1)
FC7C : A7 04      staa  $04,x         ;(4,X)
FC7E : 96 39      ldaa  $39           ;(FCMD)
FC80 : 84 0F      anda  #$0F          ;(#15)
FC82 : A7 05      staa  $05,x         ;(5,X 33)
;
FC84 : 08         inx                 ;
FC85 : CE FC 8B   ldx  #$FC8B         ;(#1$)
FC88 : DF 2D      stx  $2D            ;(FVECT+1)
FC8A : 39         rts                 ;(50)
;*************************************;
;* OVERLAY FOR CALL RTN.
;
;1$
FC8B : 96 30      ldaa  $30           ;(FSTK+1)
FC8D : 8B 03      adda  #$03          ;(#3)
FC8F : 97 30      staa  $30           ;(FSTK+1)
FC91 : CE FD 0B   ldx  #$FD0B         ;(#FTOR)
FC94 : DF 2D      stx  $2D            ;(FVECT+1 17) GET READY TO JUMP
FC96 : 01         nop                 ;
FC97 : 20 D5      bra  LFC6E          ;(WAST27)
FC97 : 20 D5      bra  LFC6E          ;(WAST27)
;*************************************;
;* GET NEXT FILTER COMMAND
;
;NXTFCM
FC99 : 7D 00 2F   tst  $002F          ;(FCNT)
FC9C : 26 CE      bne  LFC6C          ;(WAST40) IN A DELAY
;
FC9E : DE 08      ldx  $08            ;(FCMDPT)
FCA0 : A6 00      ldaa  $00,x         ;(,X)
FCA2 : 08         inx                 ;
FCA3 : DF 08      stx  $08            ;(FCMDPT)
FCA5 : 97 39      staa  $39           ;(FCMD)
FCA7 : 2A 05      bpl  LFCAE          ;(1$ 36)
;
FCA9 : 97 2F      staa  $2F           ;(FCNT) NEGATIVE CMD IS NEG OF WAVE DELAY
FCAB : A6 00      ldaa  $00,x         ;(,X)
FCAD : 39         rts                 ;(50)
;1$:
FCAE : CE FC B5   ldx  #$FCB5         ;(#EXFCMD) POSITIVE IS FROM TABLE
;FCB1 : FF 00 2D   stx  X002D          ;<- disasm error (FCB -1,0,FVECT+1)
FCB1 : FF                             ;-1
FCB2 : 00                             ;0
FCB3 : 2D                             ;FVECT+1
FCB4 : 39         rts                 ;
;*************************************;
;
;EXFCMD
FCB5 : 5F         clrb                ;
FCB6 : 96 39      ldaa  $39           ;(FCMD)
FCB8 : 84 70      anda  #$70          ;(#$70) B4 - B7 IS INSTRUCTION
FCBA : 44         lsra                ;
FCBB : 44         lsra                ;
FCBC : 44         lsra                ;
FCBD : 8B 22      adda  #$22          ;(#FCMDJT!.255)
FCBF : C9 FC      adcb  #$FC          ;(#FCMDJT/256)
FCC1 : D7 37      stab  $37           ;(FNHI)
FCC3 : 97 38      staa  $38           ;(FNLO)
;
FCC5 : DE 37      ldx  $37            ;(FNHI)
FCC7 : EE 00      ldx  $00,x          ;(,X)
FCC9 : DF 2D      stx  $2D            ;(FVECT+1)
FCCB : DF 2D      stx  $2D            ;(FVECT+1)
FCCD : 39         rts                 ;(50)
;*************************************;
;* SET UP FOR REPEATED TABLE ADD.
;
;ETBR
FCCE : 96 39      ldaa  $39           ;(FCMD)
FCD0 : 84 0F      anda  #$0F          ;(#15)
FCD2 : 4C         inca                ;
FCD3 : 4C         inca                ;
FCD4 : 97 2F      staa  $2F           ;(FCNT)
FCD6 : 20 1D      bra  LFCF5          ;(FHA1 17)
;*************************************;
;* LOOK FOR A NONZERO HARMONIC CHANGE AND PERFORM IT.  IF ENTIRE TABLE
;* IS ZERO WE HAVE FINISHED THE LAST COMMAND AND PICK UP THE NEXT ONE.
;
;FINDHA
FCD8 : 7C 00 32   inc  $0032          ;(HAPTR+1)
FCDB : DE 31      ldx  $31            ;(HAPTR)
FCDD : 8C 00 68   cpx  #$0068         ;(#CNAMP) END TABLE?
FCE0 : 27 13      beq  LFCF5          ;(FHA1 17)
;
FCE2 : A6 00      ldaa  $00,x         ;(,X) NO, LOOK AT CURRENT ENTRY
FCE4 : CE FD 1F   ldx  #$FD1F         ;(#ADDINI)
FCE7 : 97 35      staa  $35           ;(HAMP)
FCE9 : 27 03      beq  LFCEE          ;(*+5)
FCEB : 7E FC F1   jmp  LFCF1          ;(*+6)
FCEE : CE FC D8   ldx  #$FCD8         ;(#FINDHA) LOOK AGAIN IF 0
FCF1 : DF 2D      stx  $2D            ;(FVECT+1) SET FOR ADD IF <>0
FCF3 : 08         inx                 ;
FCF4 : 39         rts                 ;
;*************************************;
;FHA1:
FCF5 : 86 5E      ldaa  #$5E          ;(#ADD2HA-2) RESTART TABLE
;FCF7 : B7 00 32   staa  X0032         ;<- disasm error (FCB $B7,0,HAPTR+1)
FCF7 : B7                             ;$B7
FCF8 : 00                             ;0
FCF9 : 32                             ;HAPTR+1
FCFA : CE FC D8   ldx  #$FCD8         ;(#FINDHA) MAYBE REPEAT
FCFD : 7A 00 2F   dec  $002F          ;(FCNT)
FD00 : 27 03      beq  LFD05          ;(*+5)
FD02 : 7E FD 08   jmp  LFD08          ;(*+6)
;FCMDNX:
FD05 : CE FC 99   ldx  #$FC99         ;(#NXTFCM 40)
FD08 : DF 2D      stx  $2D            ;(FVECT+1)
FD0A : 39         rts                 ;
;*************************************;
;* RELATIVE JUMP.
;
;FTOR
FD0B : DE 08      ldx  $08            ;(FCMDPT)
FD0D : 5F         clrb                ;
FD0E : A6 00      ldaa  $00,x         ;(,X)
FD10 : 4C         inca                ;DISPLACEMENT IS FROM NEXT INSTRUCTION
FD11 : 47         asra                ;
FD12 : 49         rola                ;
FD13 : C2 00      sbcb  #$00          ;(#0)
FD15 : 9B 09      adda  $09           ;(FCMDPT+1)
FD17 : D9 08      adcb  $08           ;(FCMDPT)
FD19 : 97 09      staa  $09           ;(FCMDPT+1)
FD1B : D7 08      stab  $08           ;(FCMDPT)
;
FD1D : 20 E6      bra  LFD05          ;(FCMDNX 37)
;*************************************;
;* SET UP FOR ADD OF HAMP * HARMONIC TO WAVE.
;
;ADDINI
FD1F : 96 32      ldaa  $32           ;(HAPTR+1)
FD21 : 80 5F      suba  #$5F          ;(#ADD2HA-1)
FD23 : 48         asla                ;
FD24 : 5F         clrb                ;
FD25 : 9B 0F      adda  $0F           ;(HRMTBL+1) GET PTR TO HARMONIC IN FNHI, FNLO
FD27 : D9 0E      adcb  $0E           ;(HRMTBL)
FD29 : D7 37      stab  $37           ;(FNHI)
FD2B : 97 38      staa  $38           ;(FNLO 23)
;
FD2D : 86 80      ldaa  #$80          ;(#128)
FD2F : 97 36      staa  $36           ;(FMSK)
;
FD31 : CE FD 3C   ldx  #$FD3C         ;(#2$)
FD34 : DF 2D      stx  $2D            ;(FVECT+1 37)
FD36 : CE 00 10   ldx  #$0010         ;(#WAVSRT)
FD39 : DF 33      stx  $33            ;(FWVPTR)
FD3B : 39         rts                 ;
;
;2$
FD3C : DE 37      ldx  $37            ;(FNHI) GET HARMONIC FN TO FNHI,FNLO
FD3E : EE 00      ldx  $00,x          ;(,X)
FD40 : DF 37      stx  $37            ;(FNHI)
FD42 : CE FD 51   ldx  #$FD51         ;(#ADDLP)
FD45 : DF 2D      stx  $2D            ;(FVECT+1 23)
;
FD47 : DE 31      ldx  $31            ;(HAPTR)
FD49 : A6 09      ldaa  $09,x         ;(9,X)
FD4B : 9B 35      adda  $35           ;(HAMP)
FD4D : A7 09      staa  $09,x         ;(9,X 41) RECORD CHANGE
FD4F : 08         inx                 ;
FD50 : 39         rts                 ;
;*************************************;
;* ADD HAMP * HARMONIC FN TO WAVEFORM.
;
;ADDLP
FD51 : 96 36      ldaa  $36           ;(FMSK) MSK PTS TO CURRENT HARMONIC VALUE
FD53 : 27 1D      beq  LFD72          ;(1$)
;
FD55 : 74 00 36   lsr  $0036          ;(FMSK)
FD58 : DE 33      ldx  $33            ;(FWVPTR)
FD5A : E6 00      ldab  $00,x         ;(,X)
FD5C : 94 37      anda  $37           ;(FNHI) ADD/SUBTRACT HAMP FROM SAMPLE ON
FD5E : 26 09      bne  LFD69          ;(2$ 29) SIGN OF HARMONIC
;FD60 : FB 00 35   addb  X0035         ;<- disasm error (FCB -5,0,HAMP)
FD60 : FB                             ;-5
FD61 : 00                             ;0
FD62 : 35                             ;HAMP
FD63 : E7 00      stab  $00,x         ;(,x)
FD65 : 7C 00 34   inc  $0034          ;(FWVPTR+1)
FD68 : 39         rts                 ;
;2$:
;FD69 : F0 00 35   subb  X0035         ;<- disasm error (FCB -16,0,HAMP)
FD69 : F0                             ;-16
FD6A : 00                             ;0
FD6B : 35                             ;HAMP
FD6C : E7 00      stab  $00,x         ;(,X)
FD6E : 7C 00 34   inc  $0034          ;(FWVPTR+1)
FD71 : 39         rts                 ;
;1$:
FD72 : D6 34      ldab  $34           ;(FWVPTR+1)
FD74 : C1 20      cmpb  #$20          ;(#WAVSRT+16)
FD76 : 27 0B      beq  LFD83          ;(3$ 16) DONE
FD78 : D6 38      ldab  $38           ;(FNLO)
FD7A : D7 37      stab  $37           ;(FNHI) ELSE SET FOR NEXT 8 SAMPLES
FD7C : C6 80      ldab  #$80          ;(#128)
;FD7E : F7 00 36   stab  X0036         ;<- disasm error (FCB -9,0,FMSK)
FD7E : F7                             ;-9
FD7F : 00                             ;0
FD80 : 36                             ;FMSK
FD81 : 20 0F      bra  LFD92          ;(16$ 34)
;3$:
FD83 : CE FC 99   ldx  #$FC99         ;(#NXTFCM) RETURN TO THE RIGHT PLACE
FD86 : D6 2F      ldab  $2F           ;(FCNT)
FD88 : 26 03      bne  LFD8D          ;(*+5) FCNT <>0 MEANS IN TABLE LOOP
FD8A : 7E FD 90   jmp  LFD90          ;(*+6) FCNT =0 MEANS EXECUTING COMMANDS
FD8D : CE FC D8   ldx  #$FCD8         ;(#FINDHA)
FD90 : DF 2D      stx  $2D            ;(FVECT+1 34)
;16$:
FD92 : 6D 00      tst  $00,x          ;(,X)
FD94 : 08         inx                 ;
FD95 : 39         rts                 ;
;*************************************;
;* ADH H,N  LDH H,N  USE SAME RTN
;
;ADHR
;LDHR
FD96 : 96 39      ldaa  $39           ;(FCMD)
FD98 : 84 07      anda  #$07          ;(#7) HARMONIC #
FD9A : 8B 60      adda  #$60          ;(#ADD2HA)
FD9C : 97 32      staa  $32           ;(HAPTR+1)
;
FD9E : DE 08      ldx  $08            ;(FCMDPT)
FDA0 : A6 00      ldaa  $00,x         ;(,X)
FDA2 : 08         inx                 ;
FDA3 : DF 08      stx  $08            ;(FCMDPT)
FDA5 : 97 35      staa  $35           ;(HAMP 33) SAVE VALUE
;
FDA7 : CE FD AE   ldx  #$FDAE         ;(#1$)
FDAA : DF 2D      stx  $2D            ;(FVECT+1)
FDAC : 08         inx                 ;
FDAD : 39         rts                 ;
;1$
FDAE : DE 31      ldx  $31            ;(HAPTR)
FDB0 : 5F         clrb                ;
FDB1 : 96 39      ldaa  $39           ;(FCMD)
FDB3 : 8B F8      adda  #$F8          ;(#-8) CARRY IF LD
FDB5 : C2 00      sbcb  #$00          ;(#0)
FDB7 : E4 09      andb  $09,x         ;(9,X) LD = NEW SUB OLD + ADD NEW
FDB9 : 50         negb                ;
FDBA : DB 35      addb  $35           ;(HAMP)
;ADHRE:
FDBC : D7 35      stab  $35           ;(HAMP 27)
FDBE : CE FD 1F   ldx  #$FD1F         ;(#ADDINI)
FDC1 : DF 2D      stx  $2D            ;(FVECT+1)
FDC3 : 08         inx                 ;
FDC4 : 08         inx                 ;
FDC5 : 01         nop                 ;
FDC6 : 39         rts                 ;
;*************************************;
;* HARMONIC INCREMENT OR DECREMENT
;
;HIDR
FDC7 : D6 39      ldab  $39           ;(FCMD)
FDC9 : 54         lsrb                ;
FDCA : C4 07      andb  #$07          ;(#7)
FDCC : CA 60      orab  #$60          ;(#ADD2HA) ! ADD2HA MUST BE DIVISIBLE BY 8 !
FDCE : D7 32      stab  $32           ;(HAPTR+1) PT TO THIS HARMONIC
;
FDD0 : C6 FF      ldab  #$FF          ;(#-1) CARRY IF INCREMENT (BIT 0 OF FCMD = 1)
FDD2 : C9 00      adcb  #$00          ;(#0)
FDD4 : C9 00      adcb  #$00          ;(#0)
FDD6 : 20 E4      bra  LFDBC          ;(ADHRE 23)
;*************************************;
;* CLEAR ADD2HA OR ALTER 0TH AMPLITUDE.
;
;ZTBR
FDD8 : 96 39      ldaa  $39           ;(FCMD) LO BIT 0 IF ZT
FDDA : 47         asra                ;
FDDB : 25 13      bcs  LFDF0          ;(ADCR)
;
FDDD : CE 00 00   ldx  #$0000         ;(#0)
FDE0 : DF 60      stx  $60            ;(ADD2HA)
FDE2 : DF 62      stx  $62            ;(ADD2HA+2)
FDE4 : DF 64      stx  $64            ;(ADD2HA+4)
FDE6 : DF 66      stx  $66            ;(ADD2HA+6 32)
FDE8 : 08         inx                 ;
;
;ATBRE
FDE9 : CE FC 99   ldx  #$FC99         ;(#NXTFCM)
;FDEC : FF 00 2D   stx  X002D          ;<- disasm error (FCB -1,0,FVECT+1)
FDEC : FF                             ;-1
FDED : 00                             ;0
FDEE : 2D                             ;FVECT+1
;ATBRE1
FDEF : 39         rts                 ;
;
;ADCR:
FDF0 : 85 02      bita  #$02          ;(#2)
FDF2 : 26 0C      bne  LFE00          ;(ESC1 15) BIT 2 FCMD =1 FOR ESCAPE
FDF4 : C6 5F      ldab  #$5F          ;(#ADD2HA-1)
FDF6 : D7 32      stab  $32           ;(HAPTR+1 21)
FDF8 : CE FE 05   ldx  #$FE05         ;(#ADCRO)
;ADCRE:
FDFB : DF 2D      stx  $2D            ;(FVECT+1)
FDFD : 7E FC 70   jmp  LFC70          ;(WAST14)
;
;ESC1:
;FE00 : FE 00 08   ldx  X0008          ;<- disasm error (FCB -2,0,FCMDPT)
FE00 : FE                             ;-2
FE01 : 00                             ;0
FE02 : 08                             ;FCMDPT
FE03 : 20 F6      bra  LFDFB          ;(ADCRE 24)
;
;ADCRO
FE05 : 5F         clrb                ;
FE06 : 96 39      ldaa  $39           ;(FCMD)
FE08 : 8B AE      adda  #$AE          ;(#-82) CARRY IF LDH
FE0A : C2 00      sbcb  #$00          ;(#0)
FE0C : D4 68      andb  $68           ;(CNAMP)
FE0E : DE 08      ldx  $08            ;(FCMDPT)
FE10 : A6 00      ldaa  $00,x         ;(,X)
FE12 : 08         inx                 ;
FE13 : DF 08      stx  $08            ;(FCMDPT 30)
FE15 : 10         sba                 ;
FE16 : 97 35      staa  $35           ;(HAMP)
FE18 : CE FD 1F   ldx  #$FD1F         ;(#ADDINI)
;FE1B : FF 00 2D   stx  $002D          ;<- disasm error (FCB -1,0,FVECT+1)
FE1B : FF                             ;-1
FE1C : 00                             ;0
FE1D : 2D                             ;FVECT+1
FE1E : 39         rts                 ;
;*************************************;
;* CHANGE SOME ADD2HA ENTRIES.
;
;LDTR
FE1F : C6 60      ldab  #$60          ;(#ADD2HA) ASSUME FIRST ENTRY IS H #8
FE21 : D7 32      stab  $32           ;(HAPTR+1)
FE23 : DE 08      ldx  $08            ;(FCMDPT)
FE25 : E6 00      ldab  $00,x         ;(,X) EACH BIT INDICATES PRESENCE OF ENTRY
FE27 : D7 37      stab  $37           ;(FNHI)
FE29 : 08         inx                 ;
FE2A : DF 08      stx  $08            ;(FCMDPT 28)
FE2C : D6 39      ldab  $39           ;(FCMD) LO BIT 1 IF ENTRY FOR 0 IS PRESENT
FE2E : 54         lsrb                ;
FE2F : 24 18      bcc  LFE49          ;(5$)
FE31 : CE FE 63   ldx  #$FE63         ;(#6$)
FE34 : DF 2D      stx  $2D            ;(FVECT+1)
FE36 : 39         rts                 ;
;4$
FE37 : 5F         clrb                ;
FE38 : 96 38      ldaa  $38           ;(FNLO) LO BIT 0 IF REPLACE, 1 IF ADD TO CURRENT
FE3A : 47         asra                ;
FE3B : C2 00      sbcb  #$00          ;(#0)
FE3D : DE 31      ldx  $31            ;(HAPTR)
FE3F : E4 00      andb  $00,x         ;(,X)
FE41 : 1B         aba                 ;
FE42 : A7 00      staa  $00,x         ;(,X 26)
FE44 : 7C 00 32   inc  $0032          ;(HAPTR+1) PT TO NEXT GUY
FE47 : A6 00      ldaa  $00,x         ;(,X)
;5$:
FE49 : CE FE 4F   ldx  #$FE4F         ;(#1$)
FE4C : DF 2D      stx  $2D            ;(FVECT+1)
FE4E : 39         rts                 ;
;1$
FE4F : 78 00 37   asl  $0037          ;(FNHI)
FE52 : 25 13      bcs  LFE67          ;(2$)
FE54 : 27 06      beq  LFE5C          ;(3$) NO MORE IF 0
FE56 : 7C 00 32   inc  $0032          ;(HAPTR+1)
FE59 : 7E FC 6E   jmp  LFC6E          ;(WAST27)
;3$:
FE5C : BD FD 05   jsr  LFD05          ;(FCMDNX 36)
FE5F : 6D 00      tst  $00,x          ;(,X)
FE61 : 01         nop                 ;
FE62 : 39         rts                 ;
;6$:
FE63 : 7A 00 32   dec  $0032          ;(HAPTR+1) SET FOR 0TH ENTRY
FE66 : 08         inx                 ;
;2$:
FE67 : A6 00      ldaa  $00,x         ;(,X)
FE69 : DE 08      ldx  $08            ;(FCMDPT)
FE6B : A6 00      ldaa  $00,x         ;(,X)
FE6D : 08         inx                 ;
FE6E : DF 08      stx  $08            ;(FCMDPT 33)
FE70 : 97 38      staa  $38           ;(FNLO)
FE72 : CE FE 37   ldx  #$FE37         ;(#4$)
FE75 : DF 2D      stx  $2D            ;(FVECT+1)
FE77 : 39         rts                 ;
;*************************************;
;SUBTTL SOUND PROGRAMS
;*************************************;
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
;*************************************;
;ODDTBL
FE78 : 0000                           ;FDB %0000000000000000  0  CONSTANT IS WEIRDO FOR NOW
FE7A : 5555                           ;FDB %0101010101010101  8
FE7C : AA55                           ;FDB %1010101001010101  7
FE7E : 5A5A                           ;FDB %0101101001011010  6
FE80 : 9669                           ;FDB %1001011001101001  5
FE82 : 6666                           ;FDB %0110011001100110  4
FE84 : CC33                           ;FDB %1100110000110011  3
FE86 : 3C3C                           ;FDB %0011110000111100  2
FE88 : 0FF0                           ;FDB %0000111111110000  1
;*************************************;
;* WAVE PROGRAMS
;*************************************;
;NLIST
;
;LBL SCREMW,<FPF>
FE8A : 10 FF                          ;(LT 7)
FE8C : 02 02 02 02                    ;<8,1>,<7,1>,<6,1>,<5,1>,
FE90 : 02 02 02 02                    ;<4,1>,<3,1>,<2,1>,<1,1>
FE94 : 2F                             ;(DT 16)
FE95 : 2F                             ;(DT 16)
FE96 : 50                             ;(ZT)
FE97 : 10 80 FE                       ;(LT 0,<8,-1>)
FE9A : 2F                             ;(DT 16)
FE9B : 10 40 FE                       ;(LT 0,<7,-1>)
FE9E : 2F                             ;(DT 16)
FE9F : 10 A0 00 FE                    ;(LT 1,<8,0>,<6,-1>)
FEA3 : 2F                             ;(DT 16)
FEA4 : 10 50 00 FE                    ;(LT 1,<7,0>,<5,-1>)
FEA8 : 2F                             ;(DT 16)
FEA9 : 10 28 00 FE                    ;(LT 1,<6,0>,<4,-1>)
FEAD : 2F                             ;(DT 16)
FEAE : 10 14 00 FE                    ;(LT 1,<5,0>,<3,-1>)
FEB2 : 2F                             ;(DT 16)
FEB3 : 10 0A 00 FE                    ;(LT 1,<4,0>,<2,-1>)
FEB7 : 2F                             ;(DT 16)
FEB8 : 10 05 00 FE                    ;(LT 1,<3,0>,<1,-1>)
FEBC : 2F                             ;(DT 16)
FEBD : 10 02 00                       ;(LT 0,<2,0>)
FEC0 : 2F                             ;(DT 16)
FEC1 : 10 01 00                       ;(LT 0,<1,0>)
FEC4 : 2F                             ;(DT 16)
FEC5 : 70 C3                          ;(TO SCREMW)
;
;LBL PPLD
FEC7 : 00 01                          ;(ADP 1)
FEC9 : 00 FF                          ;(ADP -1)
FECB : 00 FF                          ;(ADP -1)
FECD : 00 01                          ;(ADP 1)
FECF : 80                             ;(STOP)
;LBL SCREMP
FED0 : 3C                             ;(NOT 60)
FED1 : 2E 00                          ;(LDV -512)
FED3 : F0                             ;(WAIT 16)
FED4 : 20 00                          ;(LDV 0)
FED6 : 9C                             ;(WAIT 100)
;LBL SCRMA
FED7 : 20 50                          ;(LDV 80)
FED9 : 6C EC                          ;(DO 13,PPLD)
FEDB : 20 40                          ;(LDV 64)
FEDD : 63 E8                          ;(DO 4,PPLP)
FEDF : 80                             ;(STOP)
;
;LBL SCDNP
FEE0 : 1C                             ;(NOT 28)
FEE1 : 70 F4                          ;(TO SCRMA)
;
;LBL SKIDW
FEE2 : 0D 20                          ;(LDH 3,32)
FEE5 : 0C 30                          ;(LDH 4,48)
FEE7 : 40                             ;(FIN)
;
;LBL PPVA
FEE8 : 00 02                          ;(ADP 2)
FEEA : FF                             ;(WAIT 1)
FEEB : 00 FE                          ;(ADP -2)
FEED : FE                             ;(WAIT 2)
FEEE : 80                             ;(STOP)
;
;LBL SKIDP
FEEF : 30                             ;(NOT 48)
FEF0 : 63 05                          ;(DO 4,PPVB)
;LBL PPVC
FEF2 : 2F E0                          ;(LDV -32)
FEF4 : 67 F2                          ;(DO 8,PPVA)
FEF6 : 80                             ;(STOP)
;
;LBL PPVB
FEF7 : 30 02                          ;(ADV 2)
FEF9 : FE                             ;(WAIT 2)
FEFA : 00 FE                          ;(ADP -2)
FEFC : FE                             ;(WAIT 2)
FEFD : 00 02                          ;(ADP 2)
FEFF : FE                             ;(WAIT 2)
FF00 : 00 FE                          ;(ADP -2)
FF02 : FE                             ;(WAIT 2)
FF03 : 00 02                          ;(ADP 2)
FF05 : FE                             ;(WAIT 2)
FF06 : 00 FE                          ;(ADP -2)
FF08 : FE                             ;(WAIT 2)
FF09 : 00 06                          ;(ADP 6)
FF0B : FD                             ;(WAIT 3)
FF0C : 3F 00                          ;(ADV -256)
FF0E : FB                             ;(WAIT 5)
FF0F : 31 00                          ;(ADV 256)
FF11 : 00 02                          ;(ADP 2)
FF13 : 80                             ;(STOP)
;
;LBL SKIDEP
FF14 : 31                             ;(NOT 49)
FF15 : 20 06                          ;(LDV 6)
FF17 : 60 DE                          ;(DO 1,PPVB)
FF19 : 70 D7                          ;(TO PPVC)
;*************************************;
;LIST
;*************************************;
;JNOIST
FF1B : 0D 40 F0 FF 12                 ;$1F WING UP
FF20 : 08 A8 18 01 08                 ; 20 CLIP
FF25 : 04 A8 18 01 10                 ; 21 CLOP
FF2A : 04 20 F8 FF 20                 ; 1E WING DOWN PART 1
FF2F : 10 F0 10 01 01                 ;  "            "   2
;*************************************;
;WINGDN
FF34 : 86 03      ldaa  #$03          ;(#3)
FF36 : 8D 02      bsr  LFF3A          ;(JKNOIS)
FF38 : 86 04      ldaa  #$04          ;(#4)
;*************************************;
;JKNOIS:
FF3A : CE D9 39   ldx  #$D939         ;(#$D939) GOOD SEED
FF3D : DF 00      stx  $00            ;(HI)
FF3F : 16         tab                 ;
FF40 : 48         asla                ;
FF41 : 48         asla                ;
FF42 : 1B         aba                 ;
FF43 : CE FF 1B   ldx  #$FF1B         ;(#JNOIST)
FF46 : BD F7 E1   jsr  LF7E1          ;(ADDX)
FF49 : 7E F4 64   jmp  LF464          ;(NOISLG)
;*************************************;
;WALSHT
FF4C : FE 8A                          ;(SCREMW) $22 PTERODACTYL SCREAM
FF4E : FE D0                          ;(SCREMP)

FF50 : FE 8A                          ;(SCREMW) 23 END OF ABOVE
FF52 : FE E0                          ;(SCDNP)

FF54 : FE E3                          ;(SKIDW) 24 OSTRICH STOP
FF56 : FE EF                          ;(SKIDP)
;
FF58 : FE E3                          ;(SKIDW) 25 END SKID FOR SHORT ONES
FF5A : FF 14                          ;(SKIDEP)
;*************************************;
;WALSH
FF5C : 5F         clrb                ;
FF5D : D7 0D      stab  $0D           ;(SMPPER+1)
FF5F : 48         asla                ;
FF60 : 48         asla                ;
FF61 : 8B 4C      adda  #$4C          ;(#WALSHT!.255)
FF63 : C9 FF      adcb  #$FF          ;(#WALSH/256)
FF65 : D7 0A      stab  $0A           ;(PCMDPT)
FF67 : 97 0B      staa  $0B           ;(PCMDPT+1)
FF69 : DE 0A      ldx  $0A            ;(PCMDPT)
FF6B : EE 00      ldx  $00,x          ;(X)
FF6D : DF 08      stx  $08            ;(FCMDPT)
FF6F : DE 0A      ldx  $0A            ;(PCMDPT)
FF71 : EE 02      ldx  $02,x          ;(2,X)
FF73 : E6 00      ldab  $00,x         ;(X)
FF75 : D7 0C      stab  $0C           ;(SMPPER)
FF77 : 08         inx                 ;
FF78 : DF 0A      stx  $0A            ;(PCMDPT)
FF7A : CE FE 78   ldx  #$FE78         ;(#ODDTBL)
FF7D : DF 0E      stx  $0E            ;(HRMTBL)
FF7F : 7E FA AE   jmp  LFAAE          ;(WSM)
;*************************************;
; zero padding
FF82 : 00 00 00 00 00 00 00 00 
FF8A : 00 00 00 00 00 00 
FF90 : 00 00 00 00 00 00 00 00 
FF98 : 00 00 00 00 00 00 00 00 
FFA0 : 00 00 00 00 00 00 00 00 
FFA8 : 00 00 00 00 00 00 00 00 
FFB0 : 00 00 00 00 00 00 00 00 
FFB8 : 00 00 00 00 00 00 00 00 
FFC0 : 00 00 00 00 00 00 00 00 
FFC8 : 00 00 00 00 00 00 00 00 
FFD0 : 00 00 00 00 00 00 00 00 
FFD8 : 00 00 00 00 00 00 00 00 
FFE0 : 00 00 00 00 00 00 00 00 
FFE8 : 00 00 00 00 00 00 00 00 
FFF0 : 00 00 00 00 00 00 00 00 
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F775                           ;IRQV
FFFA : F001                           ;SWIV 
FFFC : F7EF                           ;NMIV
FFFE : F001                           ;RESETV
;
END  CKSUM

;--------------------------------------------------------------






