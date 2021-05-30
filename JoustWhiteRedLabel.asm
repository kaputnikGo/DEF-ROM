        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    JoustWhiteRedLabel.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  AF34
        ;  CRC-32:    F1835BDD
        ;
        ;  Date:    Sun May 30 11:06:07 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;  Video ROM 4 - Joust (arcade video game version)
        ; different checksums from Joust pinball version video rom 4
        ;
        ; updated 30 May 2021
        ;
org  $F000
        ;
F000 : 74                             ;checksum
;*************************************;
;Reset and setup power on
;*************************************;
;RESET
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
;
F01D : 20 FE      bra  LF01D          ;(*) WAIT FOR INTERRUPT
;*************************************;
;* THREE OSCILLATOR SOUND GENERATOR
;*************************************;
;PLAY:
F01F : DF 07      stx  X0007
F021 : CE F0 C4   ldx  #$F0C4
F024 : DF 02      stx  X0002
F026 : 86 80      ldaa  #$80
;PLAY1:
F028 : D6 10      ldab  X0010
F02A : 2A 09      bpl  LF035
F02C : D6 01      ldab  X0001
F02E : 54         lsrb
F02F : 54         lsrb
F030 : 54         lsrb
F031 : 5C         incb
;PLAY2:
F032 : 5A         decb
F033 : 26 FD      bne  LF032
;PLAY3:
F035 : 7A 00 15   dec  X0015
F038 : 27 4C      beq  LF086
F03A : 7A 00 16   dec  X0016
F03D : 27 4C      beq  LF08B
F03F : 7A 00 17   dec  X0017
F042 : 27 4C      beq  LF090
F044 : 7A 00 18   dec  X0018
F047 : 26 DF      bne  LF028
F049 : D6 10      ldab  X0010
F04B : 27 DB      beq  LF028
F04D : C4 7F      andb  #$7F
F04F : D7 18      stab  X0018
F051 : D6 01      ldab  X0001
F053 : 58         aslb
F054 : DB 01      addb  X0001
F056 : CB 0B      addb  #$0B
F058 : D7 01      stab  X0001
F05A : 7A 00 28   dec  X0028
F05D : 26 0E      bne  LF06D
F05F : D6 1C      ldab  X001C
F061 : D7 28      stab  X0028
F063 : DE 02      ldx  X0002
F065 : 09         dex
F066 : 8C F0 BD   cpx  #$F0BD
F069 : 27 4E      beq  LF0B9
F06B : DF 02      stx  X0002
;PLAY6:
F06D : D6 01      ldab  X0001
F06F : 2B 06      bmi  LF077
F071 : D4 14      andb  X0014
F073 : C4 7F      andb  #$7F
F075 : 20 05      bra  LF07C
;PLAY6A:
F077 : D4 14      andb  X0014
F079 : C4 7F      andb  #$7F
F07B : 50         negb
;PLAY6B:
F07C : 36         psha
F07D : 1B         aba
F07E : 16         tab
F07F : 32         pula
F080 : DE 02      ldx  X0002
F082 : AD 00      jsr  $00,x            ;INFO: index jump
F084 : 20 A2      bra  LF028
;PLAY7:
F086 : CE 00 0D   ldx  #$000D
F089 : 20 08      bra  LF093
;PLAY8:
F08B : CE 00 0E   ldx  #$000E
F08E : 20 03      bra  LF093
;PLAY9:
F090 : CE 00 0F   ldx  #$000F
;PLAY10:
F093 : 6D 18      tst  $18,x
F095 : 27 12      beq  LF0A9
F097 : 6A 18      dec  $18,x
F099 : 26 0E      bne  LF0A9
F09B : E6 0C      ldab  $0C,x
F09D : E7 18      stab  $18,x
F09F : E6 00      ldab  $00,x
F0A1 : EB 10      addb  $10,x
F0A3 : E1 14      cmpb  $14,x
F0A5 : 27 12      beq  LF0B9
F0A7 : E7 00      stab  $00,x
;PLAY11:
F0A9 : E6 00      ldab  $00,x
F0AB : E7 08      stab  $08,x
F0AD : AB 04      adda  $04,x
F0AF : 60 04      neg  $04,x
F0B1 : 16         tab
F0B2 : DE 02      ldx  X0002
F0B4 : AD 00      jsr  $00,x            ;INFO: index jump
F0B6 : 7E F0 28   jmp  LF028
;PLAY12:
F0B9 : DE 07      ldx  X0007
F0BB : 39         rts
;*************************************;
;* ECHO AND DECAY ROUTINE
;*************************************;
;RDECAY
F0BC : 54         lsrb
F0BD : 54         lsrb
F0BE : 54         lsrb
F0BF : 54         lsrb
F0C0 : 54         lsrb
F0C1 : 54         lsrb
F0C2 : 54         lsrb
F0C3 : 54         lsrb
F0C4 : F7 04 00   stab  $0400
F0C7 : 39         rts
;*************************************;
;* 3 OSCILLATOR CALLING ROUTINES
;*************************************;
;THNDR
F0C8 : CE F2 9C   ldx  #$F29C
;THNDR1:
F0CB : C6 1C      ldab  #$1C
F0CD : BD F6 62   jsr  LF662
F0D0 : BD F0 1F   jsr  LF01F
F0D3 : 39         rts
;SND4
F0D4 : CE F2 F0   ldx  #$F2F0
F0D7 : 20 F2      bra  LF0CB
;SND5
F0D9 : CE F3 0C   ldx  #$F30C
F0DC : 20 ED      bra  LF0CB
;*************************************;
;* THE BOMB OOOOOH NOOOOO!
;*************************************;
;WHIST
F0DE : 86 80      ldaa  #$80
F0E0 : 97 10      staa  X0010
F0E2 : 86 F1      ldaa  #$F1
F0E4 : 97 0E      staa  X000E
;WHIST0:
F0E6 : 86 80      ldaa  #$80
F0E8 : 97 0B      staa  X000B
;WHIST1:
F0EA : 86 12      ldaa  #$12
;WHIST2:
F0EC : 4A         deca
F0ED : 26 FD      bne  LF0EC
F0EF : 96 0D      ldaa  X000D
F0F1 : 9B 10      adda  X0010
F0F3 : 97 0D      staa  X000D
F0F5 : 44         lsra
F0F6 : 44         lsra
F0F7 : 44         lsra
F0F8 : 8B 12      adda  #$12
F0FA : 97 0F      staa  X000F
F0FC : DE 0E      ldx  X000E
F0FE : A6 00      ldaa  $00,x
F100 : B7 04 00   staa  X0400
F103 : 7A 00 0B   dec  X000B
F106 : 26 E2      bne  LF0EA
F108 : 7A 00 10   dec  X0010
F10B : 96 10      ldaa  X0010
F10D : 81 20      cmpa  #$20
F10F : 26 D5      bne  LF0E6
F111 : 39         rts
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
F152 : 7F 04 02   clr  $0402
F155 : CE F1 99   ldx  #$F199
F158 : DF 0F      stx  X000F
;SQLP:
F15A : DE 0F      ldx  X000F
F15C : A6 00      ldaa  $00,x
F15E : 27 33      beq  LF193
F160 : E6 01      ldab  $01,x
F162 : C4 F0      andb  #$F0
F164 : D7 0E      stab  X000E
F166 : E6 01      ldab  $01,x
F168 : 08         inx
F169 : 08         inx
F16A : DF 0F      stx  X000F
F16C : 97 0D      staa  X000D
F16E : C4 0F      andb  #$0F
;LP0:
F170 : 96 0E      ldaa  X000E
F172 : B7 04 00   staa  X0400
F175 : 96 0D      ldaa  X000D
;LP1:
F177 : CE 00 05   ldx  #$0005
;LP11
F17A : 09         dex
F17B : 26 FD      bne  LF17A
F17D : 4A         deca
F17E : 26 F7      bne  LF177
F180 : 7F 04 00   clr  X0400
F183 : 96 0D      ldaa  X000D
;LP2:
F185 : CE 00 05   ldx  #$0005
;LP22:
F188 : 09         dex
F189 : 26 FD      bne  LF188
F18B : 4A         deca
F18C : 26 F7      bne  LF185
F18E : 5A         decb
F18F : 26 DF      bne  LF170
F191 : 20 C7      bra  LF15A
;END:
F193 : 86 80      ldaa  #$80
F195 : B7 04 02   staa  X0402
F198 : 39         rts
;*************************************;
;* KNOCKER PATTERN
;*************************************;
F199 : 01FC 02FC 03F8 04F8 06F8 08F4  ;
F1A5 : 0CF4 10F4 20F2 40F1 60F1 80F1  ;
F1B1 : A0F1 C0F1 0000                 ;
;*************************************;
;* SINGLE OSCILLATOR SOUND CALLS
;*************************************;
;PERK1:
F1B7 : BD F1 FA   jsr  LF1FA
F1BA : BD F2 13   jsr  LF213
F1BD : 39         rts
;ATARI
F1BE : CE F3 82   ldx  #$F382
F1C1 : 20 F4      bra  LF1B7
;PERK$1:
F1C3 : 8D F2      bsr  LF1B7
F1C5 : 8D 27      bsr  LF1EE
F1C7 : 20 FA      bra  LF1C3
;PERK$$
F1C9 : 86 FF      ldaa  #$FF
F1CB : 97 04      staa  X0004
F1CD : CE F3 9A   ldx  #$F39A
F1D0 : 20 F1      bra  LF1C3
;*************************************;
;* RANDOM SQUIRTS
;*************************************;
;SQRT
F1D2 : C6 30      ldab  #$30
F1D4 : CE F3 AC   ldx  #$F3AC
F1D7 : 8D 21      bsr  LF1FA
;SQRT2:
F1D9 : 96 01      ldaa  X0001
F1DB : 48         asla
F1DC : 9B 01      adda  X0001
F1DE : 8B 0B      adda  #$0B
F1E0 : 97 01      staa  X0001
F1E2 : 44         lsra
F1E3 : 44         lsra
F1E4 : 8B 0C      adda  #$0C
F1E6 : 97 0E      staa  X000E
F1E8 : 8D 29      bsr  LF213
F1EA : 5A         decb
F1EB : 26 EC      bne  LF1D9
F1ED : 39         rts
;*************************************;
;* ECHO FUNCTION
;*************************************;
;ECHO
F1EE : 96 04      ldaa  X0004
F1F0 : 80 08      suba  #$08
F1F2 : 2A 03      bpl  LF1F7
F1F4 : 97 04      staa  X0004
F1F6 : 39         rts
;ECHO1:
F1F7 : 32         pula
F1F8 : 32         pula
F1F9 : 39         rts
;*************************************;
;* MOVE PARAMETERS
;*************************************;
;MOVE:
F1FA : A6 00      ldaa  $00,x
F1FC : 97 0E      staa  X000E
F1FE : A6 01      ldaa  $01,x
F200 : 97 0F      staa  X000F
F202 : A6 02      ldaa  $02,x
F204 : 97 10      staa  X0010
F206 : A6 03      ldaa  $03,x
F208 : 97 11      staa  X0011
F20A : A6 04      ldaa  $04,x
F20C : 97 12      staa  X0012
F20E : A6 05      ldaa  $05,x
F210 : 97 13      staa  X0013
F212 : 39         rts
;*************************************;
;* DELTA F, DELTA A ROUTINE
;*************************************;
;SING:
F213 : 96 04      ldaa  X0004
;SING$
F215 : 37         pshb
F216 : D6 12      ldab  X0012
F218 : D7 14      stab  X0014
F21A : D6 0F      ldab  X000F
F21C : D7 15      stab  X0015
;SING1:
F21E : 43         coma
F21F : D6 0E      ldab  X000E
F221 : B7 04 00   staa  X0400
;SING2:
F224 : 5A         decb
F225 : 26 FD      bne  LF224
F227 : 43         coma
F228 : D6 0E      ldab  X000E
F22A : 20 00      bra  LF22C
F22C : 08         inx
F22D : 09         dex
F22E : 08         inx
F22F : 09         dex
F230 : B7 04 00   staa  X0400
;SING3:
F233 : 5A         decb
F234 : 26 FD      bne  LF233
F236 : 7A 00 15   dec  X0015
F239 : 27 16      beq  LF251
F23B : 7A 00 14   dec  X0014
F23E : 26 DE      bne  LF21E
F240 : 43         coma
F241 : D6 12      ldab  X0012
F243 : B7 04 00   staa  X0400
F246 : D7 14      stab  X0014
F248 : D6 0E      ldab  X000E
F24A : 9B 13      adda  X0013
F24C : 2B 1E      bmi  LF26C
F24E : 01         nop
F24F : 20 15      bra  LF266
;SING4:
F251 : 08         inx
F252 : 09         dex
F253 : 01         nop
F254 : 43         coma
F255 : D6 0F      ldab  X000F
F257 : B7 04 00   staa  X0400
F25A : D7 15      stab  X0015
F25C : D6 0E      ldab  X000E
F25E : D0 10      subb  X0010
F260 : D1 11      cmpb  X0011
F262 : D1 11      cmpb  X0011
F264 : 27 06      beq  LF26C
;SING5:
F266 : D7 0E      stab  X000E
F268 : C0 05      subb  #$05
F26A : 20 B8      bra  LF224
;SING6:
F26C : 33         pulb
F26D : 39         rts
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
F382 : 0103 FF80 FF00                 ;VEC02X
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
F3B8 : 16         stx  X0016
F3B9 : 48         asla
F3BA : 48         asla
F3BB : 48         asla
F3BC : 1B         aba
F3BD : CE 00 0D   ldx  #$000D
F3C0 : DF 09      stx  X0009
F3C2 : CE F8 38   ldx  #$F838
F3C5 : BD F7 FA   jsr  LF7FA
F3C8 : C6 09      ldab  #$09
F3CA : 7E F6 62   jmp  LF662
;*************************************;
;*VARIABLE DUTY CYCLE SQUARE WAVE ROUTINE
;*************************************;
;VARI
F3CD : 96 15      ldaa  X0015
F3CF : B7 04 00   staa  X0400
;VAR0:
F3D2 : 96 0D      ldaa  X000D
F3D4 : 97 16      staa  X0016
F3D6 : 96 0E      ldaa  X000E
F3D8 : 97 17      staa  X0017
;V0:
F3DA : DE 12      ldx  X0012
;V0LP:
F3DC : 96 16      ldaa  X0016
F3DE : 73 04 00   com  X0400
;V1:
F3E1 : 09         dex
F3E2 : 27 10      beq  LF3F4
F3E4 : 4A         deca
F3E5 : 26 FA      bne  LF3E1
F3E7 : 73 04 00   com  X0400
F3EA : 96 17      ldaa  X0017
;V2:
F3EC : 09         dex
F3ED : 27 05      beq  LF3F4
F3EF : 4A         deca
F3F0 : 26 FA      bne  LF3EC
F3F2 : 20 E8      bra  LF3DC
;VSWEEP:
F3F4 : B6 04 00   ldaa  X0400
F3F7 : 2B 01      bmi  LF3FA
F3F9 : 43         coma
;VS1:
F3FA : 8B 00      adda  #$00
F3FC : B7 04 00   staa  X0400
F3FF : 96 16      ldaa  X0016
F401 : 9B 0F      adda  X000F
F403 : 97 16      staa  X0016
F405 : 96 17      ldaa  X0017
F407 : 9B 10      adda  X0010
F409 : 97 17      staa  X0017
F40B : 91 11      cmpa  X0011
F40D : 26 CB      bne  LF3DA
F40F : 96 14      ldaa  X0014
F411 : 27 06      beq  LF419
F413 : 9B 0D      adda  X000D
F415 : 97 0D      staa  X000D
F417 : 26 B9      bne  LF3D2
;VARX:
F419 : 39         rts
;*************************************;
;
;*************************************;
F41A : CE F4 20   ldx  #$F420         ;load X with F420h
F41D : 7E F4 CA   jmp  LF4CA          ;jump NOISLG
;
F420 : 10 FF 01 01 01                 ;NSTAB1
;*************************************;
;CROWD ROAR
;*************************************;
;CDR
F425 : CE F4 44   ldx  #$F444         ;load X with F444h (#WS1)(1ST WHISTLE PARAMS)
F428 : DF 1E      stx  $1E            ;store X in addr 1E (PTRHI)
F42A : BD F5 AC   jsr  LF5AC          ;jump sub WISLD
F42D : CE A5 00   ldx  #$A500         ;load X with A500h (SEED)
F430 : DF 00      stx  $00            ;store X in addr 00
F432 : CE F4 6D   ldx  #$F46D         ;load X with F46Dh (#CR1)(1ST CROWD ROAR NOISE PARAMS)
F435 : BD F4 B5   jsr  LF4B5          ;jump sub NOISLD
F438 : BD F5 50   jsr  LF550          ;jump sub NINIT
F43B : CE F4 72   ldx  #$F472         ;load X with F472h (#CR2)
F43E : BD F4 B5   jsr  LF4B5          ;jump sub NOISLD
F441 : 7E F5 5D   jmp  LF55D          ;jump NINIT2
;*************************************;
;WHISTLE tables
;*************************************;
F444 : 90 10 02 14 40                 ;WS1
F449 : B4 40 FF 14 30                 ;
F44E : D0 32 02 10 60                 ;
F453 : EE 20 02 08 54                 ;
F458 : E9 54 FF 20 28                 ;
F45D : C0 30 02 14 58                 ;
F462 : AC 20 02 08 58                 ;
F467 : A6 58 FF 18 22                 ;
F46C : 00                             ;
F46D : 30 10 FC 00 01                 ;CR1
F472 : 30 FC 01 00 01                 ;CR2
;*************************************;
;
;*************************************;
F477 : 10 F0 F0 01 30                 ;
;LF47C
F47C : CE F4 77   ldx  #$F477         ;load X with F477h 
F47F : 8D 34      bsr  LF4B5          ;branch sub NOISLD
;LF481:
F481 : 8D 14      bsr  LF497          ;branch sub 
F483 : 8D 12      bsr  LF497          ;branch sub 
F485 : 86 28      ldaa  #$28          ;load A with 28h
F487 : 97 2A      staa  $2A           ;store A in addr 2A
F489 : 73 00 12   com  $0012          ;complement 1s in addr 0012
F48C : 8D 3E      bsr  LF4CC          ;branch sub NOIN
F48E : 73 00 12   com  $0012          ;complement 1s addr 0012
F491 : 86 1E      ldaa  #$1E          ;load A with 1Eh
F493 : 8D 0D      bsr  LF4A2          ;branch sub 
F495 : 20 EA      bra  LF481          ;branch always 
;*************************************;
;
;*************************************;
;LF497:
F497 : 86 30      ldaa  #$30          ;load A with 30h
F499 : 97 2A      staa  $2A           ;store A in addr 2A
F49B : 8D 2F      bsr  LF4CC          ;branch sub NOIN
F49D : 86 02      ldaa  #$02          ;load A with 02h
F49F : 8D 01      bsr  LF4A2          ;branch sub 
F4A1 : 39         rts                 ;return subroutine
;*************************************;
;
;*************************************;
;LF4A2:
F4A2 : 16         tab                 ;transfer A to B
F4A3 : CE 04 00   ldx  #$0400         ;load X with 0400h
;LF4A6:
F4A6 : 17         tba                 ;transfer A to B
;LF4A7:
F4A7 : 4A         deca                ;decr A
F4A8 : 26 FD      bne  LF4A7          ;branch Z=0
F4AA : 09         dex                 ;decr X
F4AB : 8C 00 00   cpx  #$0000         ;compare X with 0000h
F4AE : 26 F6      bne  LF4A6          ;branch Z=0
F4B0 : 86 F0      ldaa  #$F0          ;load A with F0h
F4B2 : 97 0E      staa  $0E           ;store A in addr 0E
F4B4 : 39         rts                 ;return subroutine
;*************************************;
;Noise with Whistle Routine
;*************************************;
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA
;NOISLD
F4B5 : A6 00      ldaa  $00,x
F4B7 : 97 25      staa  $25
F4B9 : A6 01      ldaa  $01,x
F4BB : 97 0E      staa  $0E
F4BD : A6 02      ldaa  $02,x
F4BF : 97 0D      staa  $0D
F4C1 : A6 03      ldaa  $03,x
F4C3 : 97 12      staa  $12
F4C5 : A6 04      ldaa  $04,x
F4C7 : 97 2A      staa  $2A
;NEND
F4C9 : 39         rts
;*************************************;
;*LOAD NOISE AND GO
;*************************************;
;NOISLG:
F4CA : 8D E9    "  "    bsr  LF4B5
;*************************************;
;*NOISE INIT
;*************************************;
;NOIN
F4CC : 8D 30    " 0"    bsr  LF4FE
;*************************************;
;*NOISE LOOP
;*************************************;
;NO1
F4CE : 8D 58    " X"    bsr  LF528
F4D0 : 96 29    " )"    ldaa  X0029
F4D2 : 91 2A    " *"    cmpa  X002A
F4D4 : 26 F8    "& "    bne  LF4CE
F4D6 : 59    "Y"    rolb
F4D7 : F7 04 00    "   "    stab  X0400
F4DA : 8D 2D    " -"    bsr  LF509
F4DC : 8D 38    " 8"    bsr  LF516
F4DE : 8D 5C    " \"    bsr  LF53C
F4E0 : 7D 00 0E    "}  "    tst  X000E
F4E3 : 27 E4    "' "    beq  LF4C9
F4E5 : 7D 00 0F    "}  "    tst  X000F
F4E8 : 26 E4    "& "    bne  LF4CE
F4EA : 7D 00 12    "}  "    tst  X0012
F4ED : 27 DF    "' "    beq  LF4CE
F4EF : 2B 05    "+ "    bmi  LF4F6
F4F1 : 7C 00 2A    "| *"    inc  X002A
F4F4 : 20 D8    "  "    bra  LF4CE
;NO3:
F4F6 : 7A 00 2A    "z *"    dec  X002A
F4F9 : 7A 00 29    "z )"    dec  X0029
F4FC : 20 D0    "  "    bra  LF4CE
;NSUB:
F4FE : 7F 00 0F    "   "    clr  X000F
F501 : 96 2A    " *"    ldaa  X002A
F503 : 97 29    " )"    staa  X0029
F505 : 7F 00 28    "  ("    clr  X0028
F508 : 39    "9"    rts
;*************************************;
;* 23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD
;*
;*
;NOISE1:
F509 : 96 01    "  "    ldaa  X0001
F50B : 44         lsra
F50C : 44         lsra
F50D : 44         lsra
F50E : 98 01    "  "    eora  X0001
F510 : 97 23    " #"    staa  X0023
F512 : 08    " "    inx
F513 : 84 07    "  "    anda  #$07
F515 : 39    "9"    rts
;*
;NOISE2:
F516 : 96 23    " #"    ldaa  X0023
F518 : 44         lsra
F519 : 76 00 00    "v  "    ror  X0000
F51C : 76 00 01    "v  "    ror  X0001
F51F : 86 00    "  "    ldaa  #$00
F521 : 24 02    "$ "    bcc  LF525
F523 : 96 0E    "  "    ldaa  X000E
;NOISE3:
F525 : 97 28    " ("    staa  X0028
F527 : 39    "9"    rts
;*
;RNT:
F528 : 96 2A    " *"    ldaa  X002A
F52A : 7A 00 29    "z )"    dec  X0029
F52D : 27 04    "' "    beq  LF533
F52F : 08    " "    inx
F530 : 09    " "    dex
F531 : 20 08    "  "    bra  LF53B
;NW0:
F533 : 97 29    " )"    staa  X0029
F535 : D6 28    " ("    ldab  X0028
F537 : 54         lsrb
F538 : 7C 00 0F    "|  "    inc  X000F
;NNW1:
F53B : 39    "9"    rts
;*
;RNA:
F53C : 96 25    " %"    ldaa  X0025
F53E : 91 0F    "  "    cmpa  X000F
F540 : 27 04    "' "    beq  LF546
F542 : 08    " "    inx
F543 : 09    " "    dex
F544 : 20 09    "  "    bra  LF54F
;NW2:
F546 : 7F 00 0F    "   "    clr  X000F
F549 : 96 0E    "  "    ldaa  X000E
F54B : 90 0D    "  "    suba  X000D
F54D : 97 0E    "  "    staa  X000E
;NW3:
F54F : 39    "9"    rts
;*************************************;
;* NOISE WITH WHISTLE MAIN LOOP
;*************************************;
;NINIT
F550 : 7F 00 1C    "   "    clr  X001C
F553 : 7F 00 26    "  &"    clr  X0026
F556 : 86 0E    "  "    ldaa  #$0E
F558 : 97 1D    "  "    staa  X001D
F55A : 7F 00 22    "  ""    clr  X0022
;NINIT2
F55D : 8D 9F    "  "    bsr  LF4FE
;WIN:
F55F : 8D A8    "  "    bsr  LF509
F561 : BD F5 E6    "   "    jsr  LF5E6
F564 : 8D B0    "  "    bsr  LF516
F566 : BD F5 E6    "   "    jsr  LF5E6
F569 : 8D BD    "  "    bsr  LF528
F56B : 8D 79    " y"    bsr  LF5E6
F56D : 8D CD    "  "    bsr  LF53C
F56F : 8D 75    " u"    bsr  LF5E6
F571 : 8D 0A    "  "    bsr  LF57D
F573 : 8D 71    " q"    bsr  LF5E6
F575 : 8D 1D    "  "    bsr  LF594
F577 : 8D 6D    " m"    bsr  LF5E6
F579 : 8D 52    " R"    bsr  LF5CD
F57B : 20 E2    "  "    bra  LF55F
;*************************************;
;TRICNT:
F57D : 96 21    " !"    ldaa  X0021
F57F : 7A 00 1D    "z  "    dec  X001D
F582 : 27 07    "' "    beq  LF58B
F584 : B6 00 0E    "   "    ldaa  X000E
F587 : 26 0A    "& "    bne  LF593
F589 : 20 68    " h"    bra  LF5F3
;NW4:
F58B : 97 1D    "  "    staa  X001D
F58D : 96 1C    "  "    ldaa  X001C
F58F : 9B 26    " &"    adda  X0026
F591 : 97 1C    "  "    staa  X001C
F593        LF593:
F593 : 39    "9"    rts
;*
;TRIFRQ:
F594 : 96 1C    "  "    ldaa  X001C
F596 : 91 24    " $"    cmpa  X0024
F598 : 27 07    "' "    beq  LF5A1
F59A : 08    " "    inx
F59B : 96 0E    "  "    ldaa  X000E
F59D : 26 2A    "&*"    bne  LF5C9
F59F : 20 29    " )"    bra  LF5CA
;NW6:
F5A1 : 7F 00 1C    "   "    clr  X001C
F5A4 : 7F 00 26    "  &"    clr  X0026
F5A7 : 7F 00 22    "  ""    clr  X0022
F5AA : DE 1E    "  "    ldx  X001E
;WISLD
F5AC : A6 00    "  "    ldaa  $00,x
F5AE : 97 1B    "  "    staa  X001B
F5B0 : 27 17    "' "    beq  LF5C9
F5B2 : A6 01    "  "    ldaa  $01,x
F5B4 : 97 20    "  "    staa  X0020
F5B6 : A6 02    "  "    ldaa  $02,x
F5B8 : 97 27    " '"    staa  X0027
F5BA : A6 03    "  "    ldaa  $03,x
F5BC : 97 21    " !"    staa  X0021
F5BE : A6 04    "  "    ldaa  $04,x
F5C0 : 97 24    " $"    staa  X0024
F5C2 : 86 05    "  "    ldaa  #$05
F5C4 : BD F7 FA    "   "    jsr  LF7FA
F5C7 : DF 1E    "  "    stx  X001E
;NW7:
F5C9 : 39    "9"    rts
;
;PEND:
F5CA : 32    "2"    pula
F5CB : 32    "2"    pula
F5CC : 39    "9"    rts
;*
;NNW:
F5CD : 96 1B    "  "    ldaa  X001B
F5CF : 27 06    "' "    beq  LF5D7
F5D1 : 91 0E    "  "    cmpa  X000E
F5D3 : 26 04    "& "    bne  LF5D9
F5D5 : 20 03    "  "    bra  LF5DA
;*
;NW8:
F5D7 : 08    " "    inx
F5D8 : 09    " "    dex
;NW9:
F5D9 : 39    "9"    rts
;
;WINIT:
F5DA : 7F 00 1B    "   "    clr  X001B
F5DD : 96 20    "  "    ldaa  X0020
F5DF : 97 1C    "  "    staa  X001C
F5E1 : 96 27    " '"    ldaa  X0027
F5E3 : 97 26    " &"    staa  X0026
F5E5 : 39    "9"    rts
;******************
;TRIDR:
F5E6 : 96 22    " ""    ldaa  X0022
F5E8 : 9B 1C    "  "    adda  X001C
F5EA : 97 22    " ""    staa  X0022
F5EC : 2A 01    "* "    bpl  LF5EF
F5EE : 43    "C"    coma
;GO:
F5EF : 1B    " "    aba
F5F0 : B7 04 00    "   "    staa  X0400
;NSEND
F5F3 : 39    "9"    rts
;*************************************;
;*LIGHTNING
;*************************************;
;LITE
F5F4 : 86 01    "  "    ldaa  #$01
F5F6 : 97 14    "  "    staa  X0014
F5F8 : C6 03    "  "    ldab  #$03
F5FA : 20 00    "  "    bra  LF5FC
;*************************************;
;*LIGHTNING+APPEAR NOISE ROUTINE
;*************************************;
;LITEN
F5FC : 97 13    "  "    staa  X0013
F5FE : 86 FF    "  "    ldaa  #$FF
F600 : B7 04 00    "   "    staa  X0400
F603 : D7 0F    "  "    stab  X000F
;LITE0:
F605 : D6 0F    "  "    ldab  X000F
;LITE1:
F607 : 96 01    "  "    ldaa  X0001
F609 : 44         lsra
F60A : 44         lsra
F60B : 44         lsra
F60C : 98 01    "  "    eora  X0001
F60E : 44         lsra
F60F : 76 00 00    "v  "    ror  X0000
F612 : 76 00 01    "v  "    ror  X0001
F615 : 24 03    "$ "    bcc  LF61A
F617 : 73 04 00    "s  "    com  X0400
;LITE2:
F61A : 96 13    "  "    ldaa  X0013
;LITE3:
F61C : 4A    "J"    deca
F61D : 26 FD    "& "    bne  LF61C
F61F : 5A    "Z"    decb
F620 : 26 E5    "& "    bne  LF607
F622 : 96 13    "  "    ldaa  X0013
F624 : 9B 14    "  "    adda  X0014
F626 : 97 13    "  "    staa  X0013
F628 : 26 DB    "& "    bne  LF605
F62A : 39    "9"    rts
;*************************************;
;White Noise Routine 
;*************************************;
;X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;NOISE:
F62B : 97 0D    "  "    staa  X000D
F62D        LF62D:
F62D : DF 10    "  "    stx  X0010
F62F        LF62F:
F62F : D7 0E    "  "    stab  X000E
F631 : D6 0F    "  "    ldab  X000F
F633        LF633:
F633 : 96 01    "  "    ldaa  X0001
F635 : 44         lsra
F636 : 44         lsra
F637 : 44         lsra
F638 : 98 01    "  "    eora  X0001
F63A : 44         lsra
F63B : 76 00 00    "v  "    ror  X0000
F63E : 76 00 01    "v  "    ror  X0001
F641 : 86 00    "  "    ldaa  #$00
F643 : 24 02    "$ "    bcc  LF647
F645 : 96 0E    "  "    ldaa  X000E
F647        LF647:
F647 : B7 04 00    "   "    staa  X0400
F64A : DE 10    "  "    ldx  X0010
F64C        LF64C:
F64C : 09    " "    dex
F64D : 26 FD    "& "    bne  LF64C
F64F : 5A    "Z"    decb
F650 : 26 E1    "& "    bne  LF633
F652 : D6 0E    "  "    ldab  X000E
F654 : D0 0D    "  "    subb  X000D
F656 : 27 09    "' "    beq  LF661
F658 : DE 10    "  "    ldx  X0010
F65A : 08    " "    inx
F65B : 96 12    "  "    ldaa  X0012
F65D : 27 D0    "' "    beq  LF62F
F65F : 20 CC    "  "    bra  LF62D
F661        LF661:
F661 : 39    "9"    rts
;*************************************;
;*PARAMETER TRANSFER
;*************************************;
;TRANS:
F662 : 36    "6"    psha
F663        LF663:
F663 : A6 00    "  "    ldaa  $00,x
F665 : DF 07    "  "    stx  X0007
F667 : DE 09    "  "    ldx  X0009
F669 : A7 00    "  "    staa  $00,x
F66B : 08    " "    inx
F66C : DF 09    "  "    stx  X0009
F66E : DE 07    "  "    ldx  X0007
F670 : 08    " "    inx
F671 : 5A    "Z"    decb
F672 : 26 EF    "& "    bne  LF663
F674 : 32    "2"    pula
F675 : 39    "9"    rts
;*************************************;
;*GWAVE LOADER
;*************************************;
;GWLD:
F676 : 16    " "    tab
F677 : 58    "X"    aslb
F678 : 1B    " "    aba
F679 : 1B    " "    aba
F67A : 1B    " "    aba
F67B : CE F9 27    "  '"    ldx  #$F927
F67E : BD F7 FA    "   "    jsr  LF7FA
F681 : A6 00    "  "    ldaa  $00,x
F683 : 16    " "    tab
F684 : 84 0F    "  "    anda  #$0F
F686 : 97 0E    "  "    staa  X000E
F688 : 54         lsrb
F689 : 54         lsrb
F68A : 54         lsrb
F68B : 54         lsrb
F68C : D7 0D    "  "    stab  X000D
F68E : A6 01    "  "    ldaa  $01,x
F690 : 16    " "    tab
F691 : 54         lsrb
F692 : 54         lsrb
F693 : 54         lsrb
F694 : 54         lsrb
F695 : D7 0F    "  "    stab  X000F
F697 : 84 0F    "  "    anda  #$0F
F699 : 97 0B    "  "    staa  X000B
F69B : DF 05    "  "    stx  X0005
F69D : CE F8 38    "  8"    ldx  #$F838
F6A0        LF6A0:
F6A0 : 7A 00 0B    "z  "    dec  X000B
F6A3 : 2B 08    "+ "    bmi  LF6AD
F6A5 : A6 00    "  "    ldaa  $00,x
F6A7 : 4C    "L"    inca
F6A8 : BD F7 FA    "   "    jsr  LF7FA
F6AB : 20 F3    "  "    bra  LF6A0
;
F6AD : DF 12    "  "    stx  X0012
F6AF : BD F7 68    "  h"    jsr  LF768
F6B2 : DE 05    "  "    ldx  X0005
F6B4 : A6 02    "  "    ldaa  $02,x
F6B6 : 97 14    "  "    staa  X0014
F6B8 : BD F7 7A    "  z"    jsr  LF77A
F6BB : DE 05    "  "    ldx  X0005
F6BD : A6 03    "  "    ldaa  $03,x
F6BF : 97 10    "  "    staa  X0010
F6C1 : A6 04    "  "    ldaa  $04,x
F6C3 : 97 11    "  "    staa  X0011
F6C5 : A6 05    "  "    ldaa  $05,x
F6C7 : 16    " "    tab
F6C8 : A6 06    "  "    ldaa  $06,x
F6CA : CE F9 BA    "   "    ldx  #$F9BA
F6CD : BD F7 FA    "   "    jsr  LF7FA
F6D0 : 17    " "    tba
F6D1 : DF 15    "  "    stx  X0015
F6D3 : 7F 00 1D    "   "    clr  X001D
F6D6 : BD F7 FA    "   "    jsr  LF7FA
F6D9 : DF 17    "  "    stx  X0017
F6DB : 39    "9"    rts
;*************************************;
;*GWAVE ROUTINE
;*************************************;
;*ACCA= FREQ PATTERN LENGTH, X= FREQ PAT ADDR
;GWAVE:
F6DC : 96 0D    "  "    ldaa  X000D
F6DE : 97 1C    "  "    staa  X001C
F6E0        LF6E0:
F6E0 : DE 15    "  "    ldx  X0015
F6E2 : DF 07    "  "    stx  X0007
F6E4        LF6E4:
F6E4 : DE 07    "  "    ldx  X0007
F6E6 : A6 00    "  "    ldaa  $00,x
F6E8 : 9B 1D    "  "    adda  X001D
F6EA : 97 1B    "  "    staa  X001B
F6EC : 9C 17    "  "    cpx  X0017
F6EE : 27 26    "'&"    beq  LF716
F6F0 : D6 0E    "  "    ldab  X000E
F6F2 : 08    " "    inx
F6F3 : DF 07    "  "    stx  X0007
F6F5        LF6F5:
F6F5 : CE 00 1E    "   "    ldx  #$001E
F6F8        LF6F8:
F6F8 : 96 1B    "  "    ldaa  X001B
F6FA        LF6FA:
F6FA : 4A    "J"    deca
F6FB : 26 FD    "& "    bne  LF6FA
F6FD : A6 00    "  "    ldaa  $00,x
F6FF : B7 04 00    "   "    staa  X0400
F702 : 08    " "    inx
F703 : 9C 19    "  "    cpx  X0019
F705 : 26 F1    "& "    bne  LF6F8
F707 : 5A    "Z"    decb
F708 : 27 DA    "' "    beq  LF6E4
F70A : 08    " "    inx
F70B : 09    " "    dex
F70C : 08    " "    inx
F70D : 09    " "    dex
F70E : 08    " "    inx
F70F : 09    " "    dex
F710 : 08    " "    inx
F711 : 09    " "    dex
F712 : 01    " "    nop
F713 : 01    " "    nop
F714 : 20 DF    "  "    bra  LF6F5
;
F716 : 96 0F    "  "    ldaa  X000F
F718 : 8D 60    " `"    bsr  LF77A
F71A : 7A 00 1C    "z  "    dec  X001C
F71D : 26 C1    "& "    bne  LF6E0
F71F : 26 46    "&F"    bne  LF767
F721 : 96 10    "  "    ldaa  X0010
F723 : 27 42    "'B"    beq  LF767
F725 : 7A 00 11    "z  "    dec  X0011
F728 : 27 3D    "'="    beq  LF767
F72A : 9B 1D    "  "    adda  X001D
F72C : 97 1D    "  "    staa  X001D
F72E : DE 15    "  "    ldx  X0015
F730 : 5F    "_"    clrb
F731        LF731:
F731 : 96 1D    "  "    ldaa  X001D
F733 : 7D 00 10    "}  "    tst  X0010
F736 : 2B 06    "+ "    bmi  LF73E
F738 : AB 00    "  "    adda  $00,x
F73A : 25 08    "% "    bcs  LF744
F73C : 20 0B    "  "    bra  LF749
        ;
F73E        LF73E:
F73E : AB 00    "  "    adda  $00,x
F740 : 27 02    "' "    beq  LF744
F742 : 25 05    "% "    bcs  LF749
F744        LF744:
F744 : 5D    "]"    tstb
F745 : 27 08    "' "    beq  LF74F
F747 : 20 0F    "  "    bra  LF758
        ;
F749        LF749:
F749 : 5D    "]"    tstb
F74A : 26 03    "& "    bne  LF74F
F74C : DF 15    "  "    stx  X0015
F74E : 5C    "\"    incb
F74F        LF74F:
F74F : 08    " "    inx
F750 : 9C 17    "  "    cpx  X0017
F752 : 26 DD    "& "    bne  LF731
F754 : 5D    "]"    tstb
F755 : 26 01    "& "    bne  LF758
F757 : 39    "9"    rts
        ;
F758        LF758:
F758 : DF 17    "  "    stx  X0017
F75A : 96 0F    "  "    ldaa  X000F
F75C : 27 06    "' "    beq  LF764
F75E : 8D 08    "  "    bsr  LF768
F760 : 96 14    "  "    ldaa  X0014
F762 : 8D 16    "  "    bsr  LF77A
F764        LF764:
F764 : 7E F6 DC    "~  "    jmp  LF6DC
F767        LF767:
F767 : 39    "9"    rts
;*************************************;
;*WAVE TRANSFER ROUTINE
;*************************************;
;WVTRAN:
F768 : CE 00 1E    "   "    ldx  #$001E
F76B : DF 09    "  "    stx  X0009
F76D : DE 12    "  "    ldx  X0012
F76F : E6 00    "  "    ldab  $00,x
F771 : 08    " "    inx
F772 : BD F6 62    "  b"    jsr  LF662
F775 : DE 09    "  "    ldx  X0009
F777 : DF 19    "  "    stx  X0019
F779 : 39    "9"    rts
;*************************************;
;*WAVE DECAY ROUTINE/ DECAY AMOUNT IN ACCA(1/16 PER DECAY)
;*************************************;
;WVDECA:
F77A : 4D    "M"    tsta
F77B : 27 2B    "'+"    beq  LF7A8
F77D : DE 12    "  "    ldx  X0012
F77F : DF 07    "  "    stx  X0007
F781 : CE 00 1E    "   "    ldx  #$001E
F784 : 97 0C    "  "    staa  X000C
F786        LF786:
F786 : DF 09    "  "    stx  X0009
F788 : DE 07    "  "    ldx  X0007
F78A : D6 0C    "  "    ldab  X000C
F78C : D7 0B    "  "    stab  X000B
F78E : E6 01    "  "    ldab  $01,x
F790 : 54         lsrb
F791 : 54         lsrb
F792 : 54         lsrb
F793 : 54         lsrb
F794 : 08    " "    inx
F795 : DF 07    "  "    stx  X0007
F797 : DE 09    "  "    ldx  X0009
F799 : A6 00    "  "    ldaa  $00,x
F79B        LF79B:
F79B : 10    " "    sba
F79C : 7A 00 0B    "z  "    dec  X000B
F79F : 26 FA    "& "    bne  LF79B
F7A1 : A7 00    "  "    staa  $00,x
F7A3 : 08    " "    inx
F7A4 : 9C 19    "  "    cpx  X0019
F7A6 : 26 DE    "& "    bne  LF786
F7A8        LF7A8:
F7A8 : 39    "9"    rts
;*************************************;
;* INTERRUPT PROCESSING
;*************************************;
;IRQ
F7A9 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM) RE-INITIALIZE STACK
F7AC : B6 04 02   ldaa  $0402         ;load A with addr 0402 (PIA) (SOUND+2) GET INPUT TRIGGER
F7AF : CE F0 C4   ldx  #$F0C4         ;load X with FoC4h (#DECAYZ) RANDY'S BRAIN DAMAGE
F7B2 : DF 02      stx  $02            ;store X in addr 02 (XDECAY)
F7B4 : CE 00 0D   ldx  #$000D         ;load X with 000Dh (#FREQ1)
F7B7 : DF 09      stx  $09            ;store X in addr 09 (XPTR)
F7B9 : C6 AF      ldab  #$AF          ;load B with AFh (#$AF)
F7BB : D7 04      stab  $04           ;store B in addr 04 (AMP0)
F7BD : 0E         cli                 ;clear interrupts I=0 (NOW ALLOW IRS)
F7BE : 43         coma                ;complement 1s A INVERT INPUT
F7BF : 84 3F      anda  #$3F          ;and A with 3Fh (#$3F) MASK GARB
F7C1 : 4D         tsta                ;test A
F7C2 : 27 34      beq  LF7F8          ;branch Z=1 IRQX
F7C4 : 4A         deca                ;decr A
F7C5 : 81 14      cmpa  #$14          ;compare A with 14h (#$12+2)
F7C7 : 22 08      bhi  LF7D1          ;branch C+Z=0 IRQ1$
F7C9 : BD F6 76   jsr  LF676          ;jump sub GWLD
F7CC : BD F6 DC   jsr  LF6DC          ;jump sub GWAVE
F7CF : 20 27      bra  LF7F8          ;branch always IRQX
;IRQ1$
F7D1 : 81 1F      cmpa  #$1F          ;compare A with 1Fh
F7D3 : 22 0F      bhi  LF7E4          ;branch C+Z=0 IRQ3$
F7D5 : 80 15      suba  #$15          ;sub A with 15h (SUB OFFSET)
F7D7 : CE F8 22   ldx  #$F822         ;load X with F822h (#JMPTBL)
F7DA : 48         asla                ;arith shift left A (DOUBLE FOR ADDRESSING)
F7DB : BD F7 FA   jsr  LF7FA          ;jump sub ADDX
F7DE : EE 00      ldx  $00,x          ;load X with addr X+00h
F7E0 : AD 00      jsr  $00,x          ;jump addr X+00h
F7E2 : 20 14      bra  LF7F8          ;branch always IRQX
;IRQ3$:
F7E4 : 81 22      cmpa  #$22          ;compare A with 22h
F7E6 : 22 07      bhi  LF7EF          ;branch C+Z=0 IRQ4$
F7E8 : 80 20      suba  #$20          ;sub A with 20h (SUB OFFSET)
F7EA : BD FF 4A   jsr  LFF4A          ;jump sub JKNOIS
F7ED : 20 09      bra  LF7F8          ;branch always IRQX
;IRQ4$:
F7EF : 81 26      cmpa  #$26          ;compare A with 26h
F7F1 : 22 05      bhi  LF7F8          ;branch C+Z=0 IRQX
F7F3 : 80 23      suba  #$23          ;sub A with 23h (SUB OFFSET)
F7F5 : BD FF 6C   jsr  LFF6C          ;jump sub WALSH
;IRQX
F7F8 : 20 FE      bra  LF7F8          ;branch always here(*)
;*************************************;
;* ADD A TO INDEX REGISTER
;*************************************;
;ADDX:
F7FA : DF 07      stx  $07
F7FC : 9B 08      adda  $08
F7FE : 97 08      staa  $08
F800 : 24 03      bcc  LF805
F802 : 7C 00 07   inc  $0007
;LF805:
F805 : DE 07      ldx  $07
F807 : 39         rts
;*************************************;
;* DIAGNOSTIC PROCESSING HERE
;*************************************;
;NMI:
F808 : 0F         sei                 ;set interrupt mask
F809 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM) RESET THE STACK
F80C : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
F80F : 5F         clrb                ;clear B
;NMI1:
F810 : E9 00      adcb  $00,x         ;add C+B with X+00h
F812 : 09         dex                 ;decr X
F813 : 8C F0 00   cpx  #$F000         ;compare X with F000h
F816 : 26 F8      bne  LF810          ;branch Z=0 NMI1
F818 : E1 00      cmpb  $00,x         ;compare B with X+00h
F81A : 27 01      beq  LF81D          ;branch Z=1 NMI2
F81C : 3E         wai                 ;wait interrupts, PC+1
;NMI2:
F81D : BD F1 52   jsr  LF152          ;jump sub KNOCK
F820 : 20 E6      bra  LF808          ;branch always NMI (KEEP LOOPING)
;*************************************;
;*SPECIAL ROUTINE JUMP TABLE
;*************************************;
;JMPTBL
F822 : F5 F4                          ;LITE
F824 : F0 D4                          ;SND4
F826 : F0 D9                          ;SND5
F828 : F0 C8                          ;THUNDR
F92A : F1 BE                          ;ATARI
F82C : F1 C9                          ;PERK$$
F82E : F1 D2                          ;SQRT
F830 : F1 52                          ;KNOCK
F832 : F0 DE                          ;WHIST
F834 : F0 01                          ;RESET
F836 : FF 44                          ;WINGDN
;*************************************;
;*GWAVE TABLE
;*************************************;
;*1ST BYTE= WAVELENGTH
;GWVTAB  EQU  *
F838 : 08    " D "    stx  X4408
F839 : 7F D9 FF    "   "    clr  XD9FF
F83C : D9 7F    "  "    adcb  X007F
F83E : 24 00    "$ "    bcc  LF840
F840        LF840:
F840 : 24 08    "$ "    bcc  LF84A
        ;
F842 : 00    " "    db  $00
        ;
F843 : 40    "@"    nega
F844 : 80 00    "  "    suba  #$00
F846 : FF 00 80    "   "    stx  X0080
F849 : 40    "@"    nega
F84A        LF84A:
F84A : 10    " "    sba
F84B : 7F B0 D9    "   "    clr  XB0D9
F84E : F5 FF F5    "   "    bitb  XFFF5
F851 : D9 B0    "  "    adcb  X00B0
F853 : 7F 4E 24    " N$"    clr  X4E24
F856 : 09    " "    dex
        ;
F857 : 00    " "    db  $00
        ;
F858 : 09    " "    dex
F859 : 24 4E    "$N"    bcc  LF8A9
F85B : 10    " "    sba
F85C : 7F C5 EC    "   "    clr  XC5EC
F85F : E7 BF    "  "    stab  $BF,x
F861 : 8D 6D    " m"    bsr  LF8D0
F863 : 6A 7F    "j "    dec  $7F,x
F865 : 94 92    "  "    anda  X0092
        ;
F867 : 71    "q"    db  $71
        ;
F868 : 40    "@"    nega
F869 : 17    " "    tba
        ;
F86A : 12    " "    db  $12
        ;
F86B : 39    "9"    rts
        ;
F86C : 10    " "    sba
F86D : FF FF FF    "   "    stx  XFFFF
F870 : FF 00 00    "   "    stx  X0000
        ;
F873 : 00 00    "  "    db  $00, $00
        ;
F875 : FF FF FF    "   "    stx  XFFFF
F878 : FF 00 00    "   "    stx  X0000
        ;
F87B : 00 00    "  "    db  $00, $00
        ;
F87D : 48    "H"    asla
F87E : 8A 95    "  "    oraa  #$95
F880 : A0 AB    "  "    suba  $AB,x
F882 : B5 BF C8    "   "    bita  XBFC8
F885 : D1 DA    "  "    cmpb  X00DA
F887 : E1 E8    "  "    cmpb  $E8,x
F889 : EE F3    "  "    ldx  $F3,x
F88B : F7 FB FD    "   "    stab  XFBFD
F88E : FE FF FE    "   "    ldx  XFFFE
        ;
F891 : FD    " "    db  $FD
        ;
F892 : FB F7 F3    "   "    addb  XF7F3
F895 : EE E8    "  "    ldx  $E8,x
F897 : E1 DA    "  "    cmpb  $DA,x
F899 : D1 C8    "  "    cmpb  X00C8
F89B : BF B5 AB    "   "    sts  XB5AB
F89E : A0 95    "  "    suba  $95,x
F8A0 : 8A 7F    "  "    oraa  #$7F
        ;
F8A2 : 75    "u"    db  $75
        ;
F8A3 : 6A 5F    "j_"    dec  $5F,x
F8A5 : 54         lsrb
F8A6 : 4A    "J"    deca
F8A7 : 40    "@"    nega
F8A8 : 37    "7"    pshb
F8A9        LF8A9:
F8A9 : 2E 25    ".%"    bgt  LF8D0
        ;
F8AB : 1E    " "    db  $1E
        ;
F8AC : 17    " "    tba
F8AD : 11    " "    cba
F8AE : 0C    " "    clc
F8AF : 08    " "    inx
        ;
F8B0 : 04 02    "  "    db  $04, $02
        ;
F8B2 : 01    " "    nop
        ;
F8B3 : 00    " "    db  $00
        ;
F8B4 : 01    " "    nop
        ;
F8B5 : 02 04    "  "    db  $02, $04
        ;
F8B7 : 08    " "    inx
F8B8 : 0C    " "    clc
F8B9 : 11    " "    cba
F8BA : 17    " "    tba
        ;
F8BB : 1E    " "    db  $1E
        ;
F8BC : 25 2E    "%."    bcs  LF8EC
F8BE : 37    "7"    pshb
F8BF : 40    "@"    nega
F8C0 : 4A    "J"    deca
F8C1 : 54         lsrb
F8C2 : 5F    "_"    clrb
F8C3 : 6A 75    "ju"    dec  $75,x
F8C5 : 7F 10 59    "  Y"    clr  X1059
        ;
F8C8 : 7B    "{"    db  $7B
        ;
F8C9 : 98 AC    "  "    eora  X00AC
        ;
F8CB : B3    " "    db  $B3
        ;
F8CC : AC 98    "  "    cpx  $98,x
        ;
F8CE : 7B    "{"    db  $7B
        ;
F8CF : 59    "Y"    rolb
F8D0        LF8D0:
F8D0 : 37    "7"    pshb
F8D1 : 19    " "    daa
F8D2 : 06    " "    tap
        ;
F8D3 : 00    " "    db  $00
        ;
F8D4 : 06    " "    tap
F8D5 : 19    " "    daa
F8D6 : 37    "7"    pshb
F8D7 : 08    " "    inx
F8D8 : FF FF FF    "   "    stx  XFFFF
F8DB : FF 00 00    "   "    stx  X0000
        ;
F8DE : 00 00    "  "    db  $00, $00
        ;
F8E0 : 10    " "    sba
F8E1 : 76 FF B8    "v  "    ror  XFFB8
F8E4 : D0 9D    "  "    subb  X009D
F8E6 : E6 6A    " j"    ldab  $6A,x
F8E8 : 82 76    " v"    sbca  #$76
F8EA : EA 81    "  "    orab  $81,x
F8EC        LF8EC:
F8EC : 86 4E    " N"    ldaa  #$4E
F8EE : 9C 32    " 2"    cpx  X0032
F8F0 : 63 10    "c "    com  $10,x
        ;
F8F2 : 00    " "    db  $00
        ;
F8F3 : F4 00 E8    "   "    andb  X00E8
        ;
F8F6 : 00 DC 00    "   "    db  $00, $DC, $00
        ;
F8F9 : E2 00    "  "    sbcb  $00,x
        ;
F8FB : DC 00    "  "    db  $DC, $00
        ;
F8FD : E8 00    "  "    eorb  $00,x
F8FF : F4 00 00    "   "    andb  X0000
F902 : 24 7F    "$ "    bcc  LF983
F904 : B0 D6 E8    "   "    suba  XD6E8
        ;
F907 : E3    " "    db  $E3
        ;
F908 : C9 A3    "  "    adcb  #$A3
        ;
F90A : 7B 5E    "{^"    db  $7B, $5E
        ;
F90C : 54         lsrb
        ;
F90D : 5E 7B A3    "^{ "    db  $5E, $7B, $A3
        ;
F910 : C9 E3    "  "    adcb  #$E3
F912 : E8 D6    "  "    eorb  $D6,x
F914 : B0 7F 4C    "  L"    suba  X7F4C
F917 : 26 14    "& "    bne  LF92D
F919 : 19    " "    daa
F91A : 33    "3"    pulb
F91B : 5A    "Z"    decb
F91C : 81 9E    "  "    cmpa  #$9E
F91E : A8 9E    "  "    eora  $9E,x
F920 : 81 5A    " Z"    cmpa  #$5A
F922 : 33    "3"    pulb
F923 : 19    " "    daa
        ;
F924 : 14    " "    db  $14
        ;
F925 : 26 4C    "&L"    bne  LF973
F927 : 11    " "    cba
        ;
F928 : 05    " "    db  $05
        ;
F929 : 11    " "    cba
F92A : 01    " "    nop
F92B : 0F    " "    sei
F92C : 01    " "    nop
        ;
F92D        LF92D:
F92D : 3A 21    ":!"    db  $3A, $21
        ;
F92F : 35    "5"    txs
F930 : 11    " "    cba
F931 : FF 00 0D    "   "    stx  X000D
F934 : 0E    " "    cli
        ;
F935 : 15 00 00 FD  "    "    db  $15, $00, $00, $FD
F939 : 00    " "    db  $00
        ;
F93A : 01    " "    nop
        ;
F93B : 4E    "N"    db  $4E
        ;
F93C : 31    "1"    ins
F93D : 11    " "    cba
        ;
F93E : 00    " "    db  $00
        ;
F93F : 01    " "    nop
        ;
F940 : 00 03    "  "    db  $00, $03
        ;
F942 : 4F    "O"    clra
F943 : F6 53 03    " S "    ldab  X5303
        ;
F946 : 00 02    "  "    db  $00, $02
        ;
F948 : 06    " "    tap
F949 : 79 14 17    "y  "    rol  X1417
        ;
F94C : 00 00 00    "   "    db  $00, $00, $00
        ;
F94F : 0E    " "    cli
        ;
F950 : 00 13    "  "    db  $00, $13
        ;
F952 : 10    " "    sba
        ;
F953 : 00    " "    db  $00
        ;
F954 : FF 00 09    "   "    stx  X0009
F957 : 80 F2    "  "    suba  #$F2
F959 : 19    " "    daa
        ;
F95A : 00 00 00    "   "    db  $00, $00, $00
        ;
F95D : 16    " "    tab
        ;
F95E : 8F 41 02    " A "    db  $8F, $41, $02
        ;
F961 : D0 00    "  "    subb  X0000
        ;
F963 : 00    " "    db  $00
        ;
F964 : 27 52    "'R"    beq  LF9B8
        ;
F966 : 52    "R"    db  $52
        ;
F967 : 36    "6"    psha
        ;
F968 : 00 00 00    "   "    db  $00, $00, $00
        ;
F96B : 10    " "    sba
F96C : 24 73    "$s"    bcc  LF9E1
F96E : 29 03    ") "    bvs  LF973
        ;
F970 : 00 00    "  "    db  $00, $00
        ;
F972 : 10    " "    sba
F973        LF973:
F973 : A6 11    "  "    ldaa  $11,x
F975 : 40    "@"    nega
        ;
F976 : 03 ED    "  "    db  $03, $ED
        ;
F978 : 09    " "    dex
F979 : 09    " "    dex
F97A : 1B    " "    aba
F97B : 16    " "    tab
F97C : 82 03    "  "    sbca  #$03
F97E : 0E    " "    cli
F97F : 01    " "    nop
F980 : 0E    " "    cli
F981 : 7F 11 29    "  )"    clr  X1129
        ;
F984 : 00    " "    db  $00
        ;
F985 : F0 05 08    "   "    subb  X0508
F988 : B6 63 26    " c&"    ldaa  X6326
F98B : 06    " "    tap
        ;
F98C : 00 00    "  "    db  $00, $00
        ;
F98E : 10    " "    sba
F98F : A6 21    " !"    ldaa  $21,x
F991 : 25 00    "% "    bcs  LF993
        ;
F993        LF993:
F993 : 03    " "    db  $03
        ;
F994 : 0A    " "    clv
        ;
F995 : 03    " "    db  $03
        ;
F996 : 4F    "O"    clra
F997 : 43    "C"    coma
F998 : 0A    " "    clv
        ;
F999 : 00 04 02    "   "    db  $00, $04, $02
        ;
F99C : 0D    " "    sec
F99D : 0E    " "    cli
        ;
F99E : 1F 12 00    "   "    db  $1F, $12, $00
        ;
F9A1 : FF 10 04    "   "    stx  X1004
        ;
F9A4 : 4E    "N"    db  $4E
        ;
F9A5 : 11    " "    cba
F9A6 : 10    " "    sba
        ;
F9A7 : 00    " "    db  $00
        ;
F9A8 : 0A    " "    clv
        ;
F9A9 : 00    " "    db  $00
        ;
F9AA : 01    " "    nop
F9AB : 80 21    " !"    suba  #$21
F9AD : 30    "0"    tsx
        ;
F9AE : 00    " "    db  $00
        ;
F9AF : FF 00 1B    "   "    stx  X001B
        ;
F9B2 : 00    " "    db  $00
        ;
F9B3 : 22 21    ""!"    bhi  LF9D6
        ;
F9B5 : 00    " "    db  $00
        ;
F9B6 : FE 00 1B    "   "    ldx  X001B
        ;
F9B9 : 00    " "    db  $00
        ;
F9BA : 01    " "    nop
F9BB : 01    " "    nop
        ;
F9BC : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
F9C0 : 08    " "    inx
F9C1 : 08    " "    inx
F9C2 : 10    " "    sba
F9C3 : 10    " "    sba
F9C4 : 30    "0"    tsx
F9C5 : 60 C0    "` "    neg  $C0,x
F9C7 : E0 01    "  "    subb  $01,x
F9C9 : 01    " "    nop
        ;
F9CA : 02 02 03 04  "    "    db  $02, $02, $03, $04
F9CE : 05    " "    db  $05
        ;
F9CF : 06    " "    tap
F9D0 : 07    " "    tpa
F9D1 : 08    " "    inx
F9D2 : 09    " "    dex
F9D3 : 0A    " "    clv
F9D4 : 0C    " "    clc
F9D5 : 80 7C    " |"    suba  #$7C
F9D7 : 78 74 70    "xtp"    asl  X7470
F9DA : 74 78 7C    "tx|"    lsr  X787C
F9DD : 80 01    "  "    suba  #$01
F9DF : 01    " "    nop
        ;
F9E0 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
F9E4 : 08    " "    inx
F9E5 : 08    " "    inx
F9E6 : 10    " "    sba
F9E7 : 20 28    " ("    bra  LFA11
        ;
F9E9 : 30    "0"    tsx
        ;
F9EA : 38    "8"    db  $38
        ;
F9EB : 40    "@"    nega
F9EC : 48    "H"    asla
F9ED : 50    "P"    negb
F9EE : 60 70    "`p"    neg  $70,x
F9F0 : 80 A0    "  "    suba  #$A0
F9F2 : B0 C0 08    "   "    suba  XC008
F9F5 : 40    "@"    nega
F9F6 : 08    " "    inx
F9F7 : 40    "@"    nega
F9F8 : 08    " "    inx
F9F9 : 40    "@"    nega
F9FA : 08    " "    inx
F9FB : 40    "@"    nega
F9FC : 08    " "    inx
F9FD : 40    "@"    nega
F9FE : 08    " "    inx
F9FF : 40    "@"    nega
FA00 : 08    " "    inx
FA01 : 40    "@"    nega
FA02 : 08    " "    inx
FA03 : 40    "@"    nega
FA04 : 08    " "    inx
FA05 : 40    "@"    nega
FA06 : 08    " "    inx
FA07 : 40    "@"    nega
FA08 : 40    "@"    nega
FA09 : 10    " "    sba
FA0A : 08    " "    inx
FA0B : 01    " "    nop
FA0C : 01    " "    nop
FA0D : 01    " "    nop
FA0E : 01    " "    nop
FA0F : 01    " "    nop
        ;
FA10 : 02 02 03 03  "    "    db  $02, $02, $03, $03
FA14 : 04 04 05    "   "    db  $04, $04, $05
        ;
FA17 : 06    " "    tap
FA18 : 08    " "    inx
FA19 : 0A    " "    clv
FA1A : 0C    " "    clc
FA1B : 10    " "    sba
        ;
FA1C : 14 18    "  "    db  $14, $18
        ;
FA1E : 20 30    " 0"    bra  LFA50
        ;
FA20 : 40    "@"    nega
FA21 : 50    "P"    negb
FA22 : 40    "@"    nega
FA23 : 30    "0"    tsx
FA24 : 20 10    "  "    bra  LFA36
        ;
FA26 : 0C    " "    clc
FA27 : 0A    " "    clv
FA28 : 08    " "    inx
FA29 : 07    " "    tpa
FA2A : 06    " "    tap
        ;
FA2B : 05 04 03 02  "    "    db  $05, $04, $03, $02
FA2F : 02    " "    db  $02
        ;
FA30 : 01    " "    nop
FA31 : 01    " "    nop
FA32 : 01    " "    nop
FA33 : 07    " "    tpa
FA34 : 08    " "    inx
FA35 : 09    " "    dex
FA36        LFA36:
FA36 : 0A    " "    clv
FA37 : 0C    " "    clc
FA38 : 08    " "    inx
FA39 : 0C    " "    clc
FA3A : 08    " "    inx
FA3B : 80 10    "  "    suba  #$10
FA3D : 78 18 70    "x p"    asl  X1870
FA40 : 20 60    " `"    bra  LFAA2
        ;
FA42 : 28 58    "(X"    bvc  LFA9C
FA44 : 30    "0"    tsx
FA45 : 50    "P"    negb
FA46 : 40    "@"    nega
FA47 : 48    "H"    asla
        ;
FA48 : 00    " "    db  $00
        ;
FA49 : 01    " "    nop
FA4A : 40    "@"    nega
        ;
FA4B : 02 42 03    " B "    db  $02, $42, $03
        ;
FA4E : 43    "C"    coma
        ;
FA4F : 04    " "    db  $04
        ;
FA50        LFA50:
FA50 : 44         lsra
        ;
FA51 : 05 45    " E"    db  $05, $45
        ;
FA53 : 06    " "    tap
FA54 : 46    "F"    rora
FA55 : 07    " "    tpa
FA56 : 47    "G"    asra
FA57 : 08    " "    inx
FA58 : 48    "H"    asla
FA59 : 09    " "    dex
FA5A : 49    "I"    rola
FA5B : 0A    " "    clv
FA5C : 4A    "J"    deca
FA5D : 0B    " "    sev
        ;
FA5E : 4B 00 14 18  "K   "    db  $4B, $00, $14, $18
        ;
FA62 : 20 30    " 0"    bra  LFA94
        ;
FA64 : 40    "@"    nega
FA65 : 50    "P"    negb
FA66 : 40    "@"    nega
FA67 : 30    "0"    tsx
FA68 : 20 10    "  "    bra  LFA7A
        ;
FA6A : 0C    " "    clc
FA6B : 0A    " "    clv
FA6C : 08    " "    inx
FA6D : 07    " "    tpa
FA6E : 06    " "    tap
        ;
FA6F : 05 CC    "  "    db  $05, $CC
        ;
FA71 : BB 60 10    " ` "    adda  X6010
FA74 : EE AA    "  "    ldx  $AA,x
FA76 : 50    "P"    negb
        ;
FA77 : 00    " "    db  $00
;*************************************;
;*  AND THE EVER POPULAR COPYRIGHT MESSAGE
;*************************************;
FA78 : 28 43    "(C"                  ;(C)
FA7A : 29 31    ")1"                  ;1982
FA7C : 39    "9"                      ;
FA7D : 38    "8"                      ;
FA7E : 32    "2"                      ;
FA7F : 20 57    " W"                  ;WILLIAMS
FA81 : 49    "I"                      ;
FA82 : 4C    "L"                      ;
FA83 : 4C    "L"                      ;
FA84 : 49    "I"                      ;
FA85 : 41    "A"                      ;
FA86 : 4D    "M"                      ;
FA87 : 53    "S"                      ;
FA88 : 20 45    " E"                  ;ELECTRONICS
FA8A : 4C    "L"                      ;
FA8B : 45    "E"                      ;
FA8C : 43    "C"                      ;
FA8D : 54    "T"                      ;
FA8E : 52    "R"                      ;
FA8F : 4F    "O"                      ;
FA90 : 4E    "N"                      ;
FA91 : 49    "I"                      ;
FA92 : 43    "C"                      ;
FA93 : 53    "S"                      ;
;*************************************;
; SUBTTL WAVE PLAYER AND PITCH MODIFICATION
;*************************************;
;* PLAY A SAMPLE, REMAINING DELAY IN B.  TOTAL DELAY = MIN (60,B*6) MICS.
;
;NTHRVC
FA94 : C0 0D    "  "    subb  #$0D
FA96 : 37    "7"    pshb
FA97 : BD 00 2C    "  ,"    jsr  L002C
FA9A : 33    "3"    pulb
FA9B        LFA9B:
FA9B : C1 14    "  "    cmpb  #$14
FA9D : 22 F5    "" "    bhi  LFA94
FA9F : 01    " "    nop
FAA0 : 96 24    " $"    ldaa  X0024
FAA2        LFAA2:
FAA2 : 9B 21    " !"    adda  X0021
FAA4 : 97 24    " $"    staa  X0024
FAA6 : C9 F6    "  "    adcb  #$F6
FAA8        LFAA8:
FAA8 : 5A    "Z"    decb
FAA9 : 2A FD    "* "    bpl  LFAA8
FAAB : 96 28    " ("    ldaa  X0028
FAAD        LFAAD:
FAAD : 4C    "L"    inca
FAAE : 84 0F    "  "    anda  #$0F
FAB0 : 8A 10    "  "    oraa  #$10
FAB2 : 97 28    " ("    staa  X0028
FAB4 : DE 27    " '"    ldx  X0027
FAB6 : E6 00    "  "    ldab  $00,x
FAB8 : F7 04 00    "   "    stab  X0400
FABB : 84 0F    "  "    anda  #$0F
FABD        LFABD:
FABD : 39    "9"    rts
;*************************************;
; Walsh Machine
;*************************************;
;* PLAYS WAVE AND ALTERS PITCH ACCORDING TO PITCH CMDS.
;* SMPPER IS INITIAL PITCH,  PCMDPT IS START PITCH PROGRAM,
;* FCMDPT IS START WAVE MODIFIER (FILTER) PROGRAM.
;
;WSM
FABE : 4F    "O"    clra
FABF : CE 00 10    "   "    ldx  #$0010
FAC2 : C6 61    " a"    ldab  #$61
FAC4        LFAC4:
FAC4 : A7 00    "  "    staa  $00,x
FAC6 : 08    " "    inx
FAC7 : 5A    "Z"    decb
FAC8 : 26 FA    "& "    bne  LFAC4
FACA : C6 5F    " _"    ldab  #$5F
FACC : D7 26    " &"    stab  X0026
FACE : C6 37    " 7"    ldab  #$37
FAD0 : D7 30    " 0"    stab  X0030
FAD2 : C6 7E    " ~"    ldab  #$7E
FAD4 : D7 2C    " ,"    stab  X002C
FAD6 : CE FC A9    "   "    ldx  #$FCA9
FAD9 : DF 2D    " -"    stx  X002D
FADB : D6 0C    "  "    ldab  X000C
FADD : D7 23    " #"    stab  X0023
FADF        LFADF:
FADF : C0 03    "  "    subb  #$03
FAE1        LFAE1:
FAE1 : BD FA 9B    "   "    jsr  LFA9B
FAE4 : 08    " "    inx
FAE5        LFAE5:
FAE5 : D6 23    " #"    ldab  X0023
FAE7 : C0 02    "  "    subb  #$02
FAE9 : BD FA 94    "   "    jsr  LFA94
FAEC : 26 F7    "& "    bne  LFAE5
FAEE : D6 20    "  "    ldab  X0020
FAF0 : 96 21    " !"    ldaa  X0021
FAF2 : 9B 0D    "  "    adda  X000D
FAF4 : D9 0C    "  "    adcb  X000C
FAF6 : 97 0D    "  "    staa  X000D
FAF8 : D7 0C    "  "    stab  X000C
FAFA : DB 22    " ""    addb  X0022
FAFC : 86 19    "  "    ldaa  #$19
FAFE : 11    " "    cba
FAFF : 24 01    "$ "    bcc  LFB02
FB01 : 81 16    "  "    cmpa  #$16
FB03 : D7 23    " #"    stab  X0023
FB05 : 01    " "    nop
FB06 : C0 09    "  "    subb  #$09
FB08 : BD FA 9B    "   "    jsr  LFA9B
FB0B : 96 2F    " /"    ldaa  X002F
FB0D : 16    " "    tab
FB0E : 48    "H"    asla
FB0F : C9 00    "  "    adcb  #$00
FB11 : D7 2F    " /"    stab  X002F
FB13 : D6 23    " #"    ldab  X0023
FB15 : C0 05    "  "    subb  #$05
FB17 : 96 25    " %"    ldaa  X0025
FB19 : 2A 06    "* "    bpl  LFB21
FB1B : 7C 00 25    "| %"    inc  X0025
FB1E : 01    " "    nop
FB1F : 20 BE    "  "    bra  LFADF
        ;
FB21        LFB21:
FB21 : 5A    "Z"    decb
FB22 : BD FA 9B    "   "    jsr  LFA9B
FB25 : DE 0A    "  "    ldx  X000A
FB27 : A6 00    "  "    ldaa  $00,x
FB29 : 2A 12    "* "    bpl  LFB3D
FB2B : 81 80    "  "    cmpa  #$80
FB2D : 27 5F    "'_"    beq  LFB8E
FB2F : 4C    "L"    inca
FB30 : 97 25    " %"    staa  X0025
FB32 : 08    " "    inx
FB33 : FF 00 0A    "   "    stx  X000A
FB36 : D6 23    " #"    ldab  X0023
FB38 : C0 06    "  "    subb  #$06
FB3A : 7E FA DF    "~  "    jmp  LFADF
        ;
FB3D        LFB3D:
FB3D : 08    " "    inx
FB3E : E6 00    "  "    ldab  $00,x
FB40 : 37    "7"    pshb
FB41 : 08    " "    inx
FB42 : DF 0A    "  "    stx  X000A
FB44 : 97 29    " )"    staa  X0029
FB46 : 84 70    " p"    anda  #$70
FB48 : 44         lsra
FB49 : 44         lsra
FB4A : 44         lsra
FB4B : 5F    "_"    clrb
FB4C : 8B 22    " ""    adda  #$22
FB4E : C9 FC    "  "    adcb  #$FC
FB50 : 97 2B    " +"    staa  X002B
FB52 : D7 2A    " *"    stab  X002A
FB54 : D6 23    " #"    ldab  X0023
FB56 : D6 23    " #"    ldab  X0023
FB58 : C0 0D    "  "    subb  #$0D
FB5A : BD FA 9B    "   "    jsr  LFA9B
FB5D : 5F    "_"    clrb
FB5E : DE 2A    " *"    ldx  X002A
FB60 : EE 00    "  "    ldx  $00,x
FB62 : 6E 00    "n "    jmp  $00,x            ;INFO: index jump
        ;
FB64 : 96 29    " )"    ldaa  X0029
FB66 : 47    "G"    asra
FB67 : C2 00    "  "    sbcb  #$00
FB69 : D4 0C    "  "    andb  X000C
FB6B : 32    "2"    pula
FB6C : 10    " "    sba
FB6D : 9B 0C    "  "    adda  X000C
FB6F : 97 0C    "  "    staa  X000C
FB71 : 08    " "    inx
FB72        LFB72:
FB72 : D6 23    " #"    ldab  X0023
FB74 : C0 0A    "  "    subb  #$0A
FB76 : 7E FA E1    "~  "    jmp  LFAE1
        ;
FB79 : 96 29    " )"    ldaa  X0029
FB7B : 47    "G"    asra
FB7C : C2 00    "  "    sbcb  #$00
FB7E : D4 22    " ""    andb  X0022
FB80 : 32    "2"    pula
FB81 : 10    " "    sba
FB82 : 9B 22    " ""    adda  X0022
FB84 : 97 22    " ""    staa  X0022
FB86 : 20 EA    "  "    bra  LFB72
        ;
FB88 : 32    "2"    pula
FB89 : DE 0A    "  "    ldx  X000A
FB8B : 09    " "    dex
FB8C : 6E 00    "n "    jmp  $00,x            ;INFO: index jump
        ;
FB8E        LFB8E:
FB8E : 96 26    " &"    ldaa  X0026
FB90 : 81 5F    " _"    cmpa  #$5F
FB92 : 2B 01    "+ "    bmi  LFB95
FB94 : 39    "9"    rts
        ;
FB95        LFB95:
FB95 : D6 23    " #"    ldab  X0023
FB97 : C0 07    "  "    subb  #$07
FB99 : BD FA 9B    "   "    jsr  LFA9B
FB9C : DE 25    " %"    ldx  X0025
FB9E : 6A 02    "j "    dec  $02,x
FBA0 : 2B 12    "+ "    bmi  LFBB4
FBA2 : EE 00    "  "    ldx  $00,x
FBA4 : A6 00    "  "    ldaa  $00,x
FBA6 : 36    "6"    psha
FBA7 : 08    " "    inx
FBA8 : DF 0A    "  "    stx  X000A
FBAA : F6 00 23    "  #"    ldab  X0023
FBAD : C0 09    "  "    subb  #$09
FBAF : BD FA 9B    "   "    jsr  LFA9B
FBB2 : 20 55    " U"    bra  LFC09
        ;
FBB4        LFBB4:
FBB4 : EE 00    "  "    ldx  $00,x
FBB6 : 08    " "    inx
FBB7 : DF 0A    "  "    stx  X000A
FBB9 : 96 26    " &"    ldaa  X0026
FBBB : 8B 03    "  "    adda  #$03
FBBD : 97 26    " &"    staa  X0026
FBBF : D6 23    " #"    ldab  X0023
FBC1 : C0 07    "  "    subb  #$07
FBC3 : 01    " "    nop
FBC4 : 7E FA DF    "~  "    jmp  LFADF
        ;
FBC7 : 08    " "    inx
FBC8 : 20 04    "  "    bra  LFBCE
        ;
FBCA        XFBCA:
FBCA : D7 20    "  "    stab  X0020
FBCC : D7 21    " !"    stab  X0021
FBCE        LFBCE:
FBCE : D6 29    " )"    ldab  X0029
FBD0 : C4 0F    "  "    andb  #$0F
FBD2 : CB F8    "  "    addb  #$F8
FBD4 : C8 F8    "  "    eorb  #$F8
FBD6 : 32    "2"    pula
FBD7 : 9B 21    " !"    adda  X0021
FBD9 : D9 20    "  "    adcb  X0020
FBDB : 97 21    " !"    staa  X0021
FBDD : D7 20    "  "    stab  X0020
FBDF : F6 00 23    "  #"    ldab  X0023
FBE2 : C0 09    "  "    subb  #$09
FBE4 : 7E FA DF    "~  "    jmp  LFADF
        ;
FBE7 : 96 26    " &"    ldaa  X0026
FBE9 : 80 03    "  "    suba  #$03
FBEB : 97 26    " &"    staa  X0026
FBED : DE 25    " %"    ldx  X0025
FBEF : 96 0B    "  "    ldaa  X000B
FBF1 : D6 0A    "  "    ldab  X000A
FBF3 : 8B FF    "  "    adda  #$FF
FBF5 : C9 FF    "  "    adcb  #$FF
FBF7 : E7 00    "  "    stab  $00,x
FBF9 : A7 01    "  "    staa  $01,x
FBFB : D6 29    " )"    ldab  X0029
FBFD        XFBFD:
FBFD : C4 0F    "  "    andb  #$0F
FBFF : E7 02    "  "    stab  $02,x
FC01 : D6 23    " #"    ldab  X0023
FC03 : C0 0C    "  "    subb  #$0C
FC05 : BD FA 9B    "   "    jsr  LFA9B
FC08 : 08    " "    inx
FC09        LFC09:
FC09 : 08    " "    inx
FC0A : 08    " "    inx
FC0B : 5F    "_"    clrb
FC0C : 01    " "    nop
FC0D : 32    "2"    pula
FC0E : 47    "G"    asra
FC0F : 49    "I"    rola
FC10 : C2 00    "  "    sbcb  #$00
FC12 : 9B 0B    "  "    adda  X000B
FC14 : D9 0A    "  "    adcb  X000A
FC16 : 97 0B    "  "    staa  X000B
FC18 : F7 00 0A    "   "    stab  X000A
FC1B : D6 23    " #"    ldab  X0023
FC1D : C0 07    "  "    subb  #$07
FC1F : 7E FA DF    "~  "    jmp  LFADF
        ;
FC22 : FB 64 FB    " d "    addb  X64FB
FC25 : 79 FB CA    "y  "    rol  XFBCA
FC28 : FB C7 FB    "   "    addb  XC7FB
FC2B : 64 FB    "d "    lsr  $FB,x
FC2D : 88 FB    "  "    eora  #$FB
FC2F : E7 FC    "  "    stab  $FC,x
FC31 : 0D    " "    sec
        ;
FC32 : FD    " "    db  $FD
        ;
FC33        LFC33:
FC33 : A6 FE    "  "    ldaa  $FE,x
FC35 : 2F FC    "/ "    ble  LFC33
FC37 : DE FD    "  "    ldx  X00FD
FC39 : D7 FC    "  "    stab  X00FC
FC3B : 59    "Y"    rolb
        ;
FC3C : FD    " "    db  $FD
        ;
FC3D : E8 FC    "  "    eorb  $FC,x
FC3F : 84 FD    "  "    anda  #$FD
FC41 : 1B    " "    aba
FC42 : DE 2F    " /"    ldx  X002F
FC44 : EE 03    "  "    ldx  $03,x
FC46 : 08    " "    inx
FC47 : DF 08    "  "    stx  X0008
FC49 : BD FD 15    "   "    jsr  LFD15
FC4C : 08    " "    inx
FC4D : 39    "9"    rts
        ;
FC4E        LFC4E:
FC4E : EE 00    "  "    ldx  $00,x
FC50 : DF 08    "  "    stx  X0008
FC52 : CE FD 1B    "   "    ldx  #$FD1B
FC55 : DF 2D    " -"    stx  X002D
FC57 : 01    " "    nop
FC58 : 39    "9"    rts
        ;
FC59 : 96 30    " 0"    ldaa  X0030
FC5B : 81 37    " 7"    cmpa  #$37
FC5D : 23 12    "# "    bls  LFC71
FC5F : DE 2F    " /"    ldx  X002F
FC61 : 6A 02    "j "    dec  $02,x
FC63 : 2A E9    "* "    bpl  LFC4E
FC65 : 80 03    "  "    suba  #$03
FC67 : 97 30    " 0"    staa  X0030
FC69 : CE FC 42    "  B"    ldx  #$FC42
FC6C : DF 2D    " -"    stx  X002D
FC6E : 6D 00    "m "    tst  $00,x
FC70 : 39    "9"    rts
        ;
FC71        LFC71:
FC71 : CE FC 79    "  y"    ldx  #$FC79
FC74 : DF 2D    " -"    stx  X002D
FC76 : 01    " "    nop
FC77 : 20 05    "  "    bra  LFC7E
        ;
FC79 : 08    " "    inx
FC7A : 08    " "    inx
FC7B : 01    " "    nop
FC7C        LFC7C:
FC7C : 8D 05    "  "    bsr  LFC83
FC7E        LFC7E:
FC7E : 8D 03    "  "    bsr  LFC83
FC80        LFC80:
FC80 : 6D 00    "m "    tst  $00,x
FC82 : 01    " "    nop
FC83        LFC83:
FC83 : 39    "9"    rts
        ;
FC84 : DE 2F    " /"    ldx  X002F
FC86 : 96 08    "  "    ldaa  X0008
FC88 : A7 03    "  "    staa  $03,x
FC8A : 96 09    "  "    ldaa  X0009
FC8C : A7 04    "  "    staa  $04,x
FC8E : 96 39    " 9"    ldaa  X0039
FC90 : 84 0F    "  "    anda  #$0F
FC92 : A7 05    "  "    staa  $05,x
FC94 : 08    " "    inx
FC95 : CE FC 9B    "   "    ldx  #$FC9B
FC98 : DF 2D    " -"    stx  X002D
FC9A : 39    "9"    rts
        ;
FC9B : 96 30    " 0"    ldaa  X0030
FC9D : 8B 03    "  "    adda  #$03
FC9F : 97 30    " 0"    staa  X0030
FCA1 : CE FD 1B    "   "    ldx  #$FD1B
FCA4 : DF 2D    " -"    stx  X002D
FCA6 : 01    " "    nop
FCA7 : 20 D5    "  "    bra  LFC7E
        ;
FCA9 : 7D 00 2F    "} /"    tst  X002F
FCAC : 26 CE    "& "    bne  LFC7C
FCAE : DE 08    "  "    ldx  X0008
FCB0 : A6 00    "  "    ldaa  $00,x
FCB2 : 08    " "    inx
FCB3 : DF 08    "  "    stx  X0008
FCB5 : 97 39    " 9"    staa  X0039
FCB7 : 2A 05    "* "    bpl  LFCBE
FCB9 : 97 2F    " /"    staa  X002F
FCBB : A6 00    "  "    ldaa  $00,x
FCBD : 39    "9"    rts
        ;
FCBE        LFCBE:
FCBE : CE FC C5    "   "    ldx  #$FCC5
FCC1 : FF 00 2D    "  -"    stx  X002D
FCC4 : 39    "9"    rts
        ;
FCC5 : 5F    "_"    clrb
FCC6 : 96 39    " 9"    ldaa  X0039
FCC8 : 84 70    " p"    anda  #$70
FCCA : 44         lsra
FCCB : 44         lsra
FCCC : 44         lsra
FCCD : 8B 32    " 2"    adda  #$32
FCCF : C9 FC    "  "    adcb  #$FC
FCD1 : D7 37    " 7"    stab  X0037
FCD3 : 97 38    " 8"    staa  X0038
FCD5 : DE 37    " 7"    ldx  X0037
FCD7 : EE 00    "  "    ldx  $00,x
FCD9 : DF 2D    " -"    stx  X002D
FCDB : DF 2D    " -"    stx  X002D
FCDD : 39    "9"    rts
        ;
FCDE : 96 39    " 9"    ldaa  X0039
FCE0 : 84 0F    "  "    anda  #$0F
FCE2 : 4C    "L"    inca
FCE3 : 4C    "L"    inca
FCE4 : 97 2F    " /"    staa  X002F
FCE6 : 20 1D    "  "    bra  LFD05
        ;
FCE8 : 7C 00 32    "| 2"    inc  X0032
FCEB : DE 31    " 1"    ldx  X0031
FCED : 8C 00 68    "  h"    cpx  #$0068
FCF0 : 27 13    "' "    beq  LFD05
FCF2 : A6 00    "  "    ldaa  $00,x
FCF4 : CE FD 2F    "  /"    ldx  #$FD2F
FCF7 : 97 35    " 5"    staa  X0035
FCF9 : 27 03    "' "    beq  LFCFE
FCFB : 7E FD 01    "~  "    jmp  LFD01
        ;
FCFE        LFCFE:
FCFE : CE FC E8    "   "    ldx  #$FCE8
FD01        LFD01:
FD01 : DF 2D    " -"    stx  X002D
FD03 : 08    " "    inx
FD04 : 39    "9"    rts
        ;
FD05        LFD05:
FD05 : 86 5E    " ^"    ldaa  #$5E
FD07 : B7 00 32    "  2"    staa  X0032
FD0A : CE FC E8    "   "    ldx  #$FCE8
FD0D : 7A 00 2F    "z /"    dec  X002F
FD10 : 27 03    "' "    beq  LFD15
FD12 : 7E FD 18    "~  "    jmp  LFD18
        ;
FD15        LFD15:
FD15 : CE FC A9    "   "    ldx  #$FCA9
FD18        LFD18:
FD18 : DF 2D    " -"    stx  X002D
FD1A : 39    "9"    rts
        ;
FD1B : DE 08    "  "    ldx  X0008
FD1D : 5F    "_"    clrb
FD1E : A6 00    "  "    ldaa  $00,x
FD20 : 4C    "L"    inca
FD21 : 47    "G"    asra
FD22 : 49    "I"    rola
FD23 : C2 00    "  "    sbcb  #$00
FD25 : 9B 09    "  "    adda  X0009
FD27 : D9 08    "  "    adcb  X0008
FD29 : 97 09    "  "    staa  X0009
FD2B : D7 08    "  "    stab  X0008
FD2D : 20 E6    "  "    bra  LFD15
        ;
FD2F : 96 32    " 2"    ldaa  X0032
FD31 : 80 5F    " _"    suba  #$5F
FD33 : 48    "H"    asla
FD34 : 5F    "_"    clrb
FD35 : 9B 0F    "  "    adda  X000F
FD37 : D9 0E    "  "    adcb  X000E
FD39 : D7 37    " 7"    stab  X0037
FD3B : 97 38    " 8"    staa  X0038
FD3D : 86 80    "  "    ldaa  #$80
FD3F : 97 36    " 6"    staa  X0036
FD41 : CE FD 4C    "  L"    ldx  #$FD4C
FD44 : DF 2D    " -"    stx  X002D
FD46 : CE 00 10    "   "    ldx  #$0010
FD49 : DF 33    " 3"    stx  X0033
FD4B : 39    "9"    rts
        ;
FD4C : DE 37    " 7"    ldx  X0037
FD4E : EE 00    "  "    ldx  $00,x
FD50 : DF 37    " 7"    stx  X0037
FD52 : CE FD 61    "  a"    ldx  #$FD61
FD55 : DF 2D    " -"    stx  X002D
FD57 : DE 31    " 1"    ldx  X0031
FD59 : A6 09    "  "    ldaa  $09,x
FD5B : 9B 35    " 5"    adda  X0035
FD5D : A7 09    "  "    staa  $09,x
FD5F : 08    " "    inx
FD60 : 39    "9"    rts
        ;
FD61 : 96 36    " 6"    ldaa  X0036
FD63 : 27 1D    "' "    beq  LFD82
FD65 : 74 00 36    "t 6"    lsr  X0036
FD68 : DE 33    " 3"    ldx  X0033
FD6A : E6 00    "  "    ldab  $00,x
FD6C : 94 37    " 7"    anda  X0037
FD6E : 26 09    "& "    bne  LFD79
FD70 : FB 00 35    "  5"    addb  X0035
FD73 : E7 00    "  "    stab  $00,x
FD75 : 7C 00 34    "| 4"    inc  X0034
FD78 : 39    "9"    rts
        ;
FD79        LFD79:
FD79 : F0 00 35    "  5"    subb  X0035
FD7C : E7 00    "  "    stab  $00,x
FD7E : 7C 00 34    "| 4"    inc  X0034
FD81 : 39    "9"    rts
        ;
FD82        LFD82:
FD82 : D6 34    " 4"    ldab  X0034
FD84 : C1 20    "  "    cmpb  #$20
FD86 : 27 0B    "' "    beq  LFD93
FD88 : D6 38    " 8"    ldab  X0038
FD8A : D7 37    " 7"    stab  X0037
FD8C : C6 80    "  "    ldab  #$80
FD8E : F7 00 36    "  6"    stab  X0036
FD91 : 20 0F    "  "    bra  LFDA2
        ;
FD93        LFD93:
FD93 : CE FC A9    "   "    ldx  #$FCA9
FD96 : D6 2F    " /"    ldab  X002F
FD98 : 26 03    "& "    bne  LFD9D
FD9A : 7E FD A0    "~  "    jmp  LFDA0
        ;
FD9D        LFD9D:
FD9D : CE FC E8    "   "    ldx  #$FCE8
FDA0        LFDA0:
FDA0 : DF 2D    " -"    stx  X002D
FDA2        LFDA2:
FDA2 : 6D 00    "m "    tst  $00,x
FDA4 : 08    " "    inx
FDA5 : 39    "9"    rts
        ;
FDA6 : 96 39    " 9"    ldaa  X0039
FDA8 : 84 07    "  "    anda  #$07
FDAA : 8B 60    " `"    adda  #$60
FDAC : 97 32    " 2"    staa  X0032
FDAE : DE 08    "  "    ldx  X0008
FDB0 : A6 00    "  "    ldaa  $00,x
FDB2 : 08    " "    inx
FDB3 : DF 08    "  "    stx  X0008
FDB5 : 97 35    " 5"    staa  X0035
FDB7 : CE FD BE    "   "    ldx  #$FDBE
FDBA : DF 2D    " -"    stx  X002D
FDBC : 08    " "    inx
FDBD : 39    "9"    rts
        ;
FDBE : DE 31    " 1"    ldx  X0031
FDC0 : 5F    "_"    clrb
FDC1 : 96 39    " 9"    ldaa  X0039
FDC3 : 8B F8    "  "    adda  #$F8
FDC5 : C2 00    "  "    sbcb  #$00
FDC7 : E4 09    "  "    andb  $09,x
FDC9 : 50    "P"    negb
FDCA : DB 35    " 5"    addb  X0035
FDCC        LFDCC:
FDCC : D7 35    " 5"    stab  X0035
FDCE : CE FD 2F    "  /"    ldx  #$FD2F
FDD1 : DF 2D    " -"    stx  X002D
FDD3 : 08    " "    inx
FDD4 : 08    " "    inx
FDD5 : 01    " "    nop
FDD6 : 39    "9"    rts
        ;
FDD7 : D6 39    " 9"    ldab  X0039
FDD9 : 54         lsrb
FDDA : C4 07    "  "    andb  #$07
FDDC : CA 60    " `"    orab  #$60
FDDE : D7 32    " 2"    stab  X0032
FDE0 : C6 FF    "  "    ldab  #$FF
FDE2 : C9 00    "  "    adcb  #$00
FDE4 : C9 00    "  "    adcb  #$00
FDE6 : 20 E4    "  "    bra  LFDCC
        ;
FDE8 : 96 39    " 9"    ldaa  X0039
FDEA : 47    "G"    asra
FDEB : 25 13    "% "    bcs  LFE00
FDED : CE 00 00    "   "    ldx  #$0000
FDF0 : DF 60    " `"    stx  X0060
FDF2 : DF 62    " b"    stx  X0062
FDF4 : DF 64    " d"    stx  X0064
FDF6 : DF 66    " f"    stx  X0066
FDF8 : 08    " "    inx
FDF9 : CE FC A9    "   "    ldx  #$FCA9
FDFC : FF 00 2D    "  -"    stx  X002D
FDFF : 39    "9"    rts
        ;
FE00        LFE00:
FE00 : 85 02    "  "    bita  #$02
FE02 : 26 0C    "& "    bne  LFE10
FE04 : C6 5F    " _"    ldab  #$5F
FE06 : D7 32    " 2"    stab  X0032
FE08 : CE FE 15    "   "    ldx  #$FE15
FE0B        LFE0B:
FE0B : DF 2D    " -"    stx  X002D
FE0D : 7E FC 80    "~  "    jmp  LFC80
        ;
FE10        LFE10:
FE10 : FE 00 08    "   "    ldx  X0008
FE13 : 20 F6    "  "    bra  LFE0B
        ;
FE15 : 5F    "_"    clrb
FE16 : 96 39    " 9"    ldaa  X0039
FE18 : 8B AE    "  "    adda  #$AE
FE1A : C2 00    "  "    sbcb  #$00
FE1C : D4 68    " h"    andb  X0068
FE1E : DE 08    "  "    ldx  X0008
FE20 : A6 00    "  "    ldaa  $00,x
FE22 : 08    " "    inx
FE23 : DF 08    "  "    stx  X0008
FE25 : 10    " "    sba
FE26 : 97 35    " 5"    staa  X0035
FE28 : CE FD 2F    "  /"    ldx  #$FD2F
FE2B : FF 00 2D    "  -"    stx  X002D
FE2E : 39    "9"    rts
        ;
FE2F : C6 60    " `"    ldab  #$60
FE31 : D7 32    " 2"    stab  X0032
FE33 : DE 08    "  "    ldx  X0008
FE35 : E6 00    "  "    ldab  $00,x
FE37 : D7 37    " 7"    stab  X0037
FE39 : 08    " "    inx
FE3A : DF 08    "  "    stx  X0008
FE3C : D6 39    " 9"    ldab  X0039
FE3E : 54         lsrb
FE3F : 24 18    "$ "    bcc  LFE59
FE41 : CE FE 73    "  s"    ldx  #$FE73
FE44 : DF 2D    " -"    stx  X002D
FE46 : 39    "9"    rts
        ;
FE47 : 5F    "_"    clrb
FE48 : 96 38    " 8"    ldaa  X0038
FE4A : 47    "G"    asra
FE4B : C2 00    "  "    sbcb  #$00
FE4D : DE 31    " 1"    ldx  X0031
FE4F : E4 00    "  "    andb  $00,x
FE51 : 1B    " "    aba
FE52 : A7 00    "  "    staa  $00,x
FE54 : 7C 00 32    "| 2"    inc  X0032
FE57 : A6 00    "  "    ldaa  $00,x
FE59        LFE59:
FE59 : CE FE 5F    "  _"    ldx  #$FE5F
FE5C : DF 2D    " -"    stx  X002D
FE5E : 39    "9"    rts
        ;
FE5F : 78 00 37    "x 7"    asl  X0037
FE62 : 25 13    "% "    bcs  LFE77
FE64 : 27 06    "' "    beq  LFE6C
FE66 : 7C 00 32    "| 2"    inc  X0032
FE69 : 7E FC 7E    "~ ~"    jmp  LFC7E
        ;
FE6C        LFE6C:
FE6C : BD FD 15    "   "    jsr  LFD15
FE6F : 6D 00    "m "    tst  $00,x
FE71 : 01    " "    nop
FE72 : 39    "9"    rts
        ;
FE73 : 7A 00 32    "z 2"    dec  X0032
FE76 : 08    " "    inx
FE77        LFE77:
FE77 : A6 00    "  "    ldaa  $00,x
FE79 : DE 08    "  "    ldx  X0008
FE7B : A6 00    "  "    ldaa  $00,x
FE7D : 08    " "    inx
FE7E : DF 08    "  "    stx  X0008
FE80 : 97 38    " 8"    staa  X0038
FE82 : CE FE 47    "  G"    ldx  #$FE47
FE85 : DF 2D    " -"    stx  X002D
FE87 : 39    "9"    rts
        ;
FE88 : 00 00 55 55  "  UU"    db  $00, $00, $55, $55
        ;
FE8C : AA 55    " U"    oraa  $55,x
FE8E : 5A    "Z"    decb
FE8F : 5A    "Z"    decb
FE90 : 96 69    " i"    ldaa  X0069
FE92 : 66 66    "ff"    ror  $66,x
        ;
FE94 : CC    " "    db  $CC
        ;
FE95 : 33    "3"    pulb
        ;
FE96 : 3C 3C    "<<"    db  $3C, $3C
        ;
FE98 : 0F    " "    sei
FE99 : F0 10 FF    "   "    subb  X10FF
        ;
FE9C : 02 02 02 02  "    "    db  $02, $02, $02, $02
FEA0 : 02 02 02 02  "    "    db  $02, $02, $02, $02
        ;
FEA4 : 2F 2F    "//"    ble  LFED5
FEA6 : 50    "P"    negb
FEA7 : 10    " "    sba
FEA8 : 80 FE    "  "    suba  #$FE
FEAA : 2F 10    "/ "    ble  LFEBC
FEAC : 40    "@"    nega
FEAD : FE 2F 10    " / "    ldx  X2F10
FEB0 : A0 00    "  "    suba  $00,x
FEB2 : FE 2F 10    " / "    ldx  X2F10
FEB5 : 50    "P"    negb
        ;
FEB6 : 00    " "    db  $00
        ;
FEB7 : FE 2F 10    " / "    ldx  X2F10
FEBA : 28 00    "( "    bvc  LFEBC
FEBC        LFEBC:
FEBC : FE 2F 10    " / "    ldx  X2F10
        ;
FEBF : 14 00    "  "    db  $14, $00
        ;
FEC1 : FE 2F 10    " / "    ldx  X2F10
FEC4 : 0A    " "    clv
        ;
FEC5 : 00    " "    db  $00
        ;
FEC6 : FE 2F 10    " / "    ldx  X2F10
        ;
FEC9 : 05 00    "  "    db  $05, $00
        ;
FECB : FE 2F 10    " / "    ldx  X2F10
        ;
FECE : 02 00    "  "    db  $02, $00
        ;
FED0 : 2F 10    "/ "    ble  LFEE2
FED2 : 01    " "    nop
        ;
FED3 : 00    " "    db  $00
        ;
FED4 : 2F 70    "/p"    ble  LFF46
        ;
FED6 : C3 00    "  "    db  $C3, $00
        ;
FED8 : 01    " "    nop
        ;
FED9 : 00    " "    db  $00
        ;
FEDA : FF 00 FF    "   "    stx  X00FF
        ;
FEDD : 00    " "    db  $00
        ;
FEDE : 01    " "    nop
FEDF : 80 3C    " <"    suba  #$3C
FEE1 : 2E 00    ". "    bgt  LFEE3
FEE3        LFEE3:
FEE3 : F0 20 00    "   "    subb  X2000
FEE6 : 9C 20    "  "    cpx  X0020
FEE8 : 50    "P"    negb
FEE9 : 6C EC    "l "    inc  $EC,x
FEEB : 20 40    " @"    bra  LFF2D
        ;
FEED : 63 E8    "c "    com  $E8,x
FEEF : 80 1C    "  "    suba  #$1C
FEF1 : 70 F4 0D    "p  "    neg  XF40D
FEF4 : 20 0C    "  "    bra  LFF02
        ;
FEF6 : 30    "0"    tsx
FEF7 : 40    "@"    nega
        ;
FEF8 : 00 02    "  "    db  $00, $02
        ;
FEFA : FF 00 FE    "   "    stx  X00FE
FEFD : FE 80 30    "  0"    ldx  X8030
FF00 : 63 05    "c "    com  $05,x
FF02        LFF02:
FF02 : 2F E0    "/ "    ble  LFEE4
FF04 : 67 F2    "g "    asr  $F2,x
FF06 : 80 30    " 0"    suba  #$30
        ;
FF08 : 02    " "    db  $02
        ;
FF09 : FE 00 FE    "   "    ldx  X00FE
FF0C : FE 00 02    "   "    ldx  X0002
FF0F : FE 00 FE    "   "    ldx  X00FE
FF12        XFF12:
FF12 : FE 00 02    "   "    ldx  X0002
FF15 : FE 00 FE    "   "    ldx  X00FE
FF18 : FE 00 06    "   "    ldx  X0006
        ;
FF1B : FD    " "    db  $FD
        ;
FF1C : 3F    "?"    swi
        ;
FF1D : 00    " "    db  $00
        ;
FF1E : FB 31 00    " 1 "    addb  X3100
        ;
FF21 : 00 02    "  "    db  $00, $02
        ;
FF23 : 80 31    " 1"    suba  #$31
FF25 : 20 06    "  "    bra  LFF2D
        ;
FF27 : 60 DE    "` "    neg  $DE,x
FF29 : 70 D7 
;*************************************;
;Joust Noise table
;*************************************;
;JNOIST
FF2B : 0D 40 F0 FF 12                 ;$1F WING UP
FF30 : 08 A8 18 01 08                 ; 20 CLIP
FF35 : 04 A8 18 01 10                 ; 21 CLOP
FF3A : 04 20 F8 FF 20                 ; 1E WING DOWN PART 1
FF3F : 10 F0 10 01 01                 ;  "            "   2
;*************************************;
;WINGDN
FF44 : 86 03      ldaa  #$03          ;load A with 03h (#3)
FF46 : 8D 02      bsr  LFF4A          ;branch sub JKNOIS
FF48 : 86 04      ldaa  #$04          ;load A with 04h (#4)
;JKNOIS:
FF4A : CE D9 39   ldx  #$D939         ;load X with D939h (#$D939) GOOD SEED
FF4D : DF 00      stx  $00            ;store X in addr 00 (HI)
FF4F : 16         tab                 ;transfer A to B
FF50 : 48         asla                ;arith shift left A
FF51 : 48         asla                ;arith shift left A
FF52 : 1B         aba                 ;add B to A
FF53 : CE FF 2B   ldx  #$FF2B         ;load X with FF2Bh (#JNOIST)
FF56 : BD F7 FA   jsr  LF7FA          ;jump sub ADDX
FF59 : 7E F4 CA   jmp  LF4CA          ;jump NOISLG
;*************************************;
;Walsh jump table - pairs
;*************************************;
;WALSHT
FF5C : FE 9A                          ;(SCREMW) $22 PTERODACTYL SCREAM
FF5E : FE E0                          ;(SCREMP)
;
FF60 : FE 9A                          ;(SCREMW) 23 END OF ABOVE
FF62 : FE F0                          ;(SCDNP)
;
FF64 : FE F3                          ;(SKIDW) 24 OSTRICH STOP
FF66 : FE FF                          ;(SKIDP)
;
FF68 : FE F3                          ;(SKIDW) 25 END SKID FOR SHORT ONES
FF6A : FF 24                          ;(SKIDEP)
;*************************************;
;Walsh Sound Machine 
;*************************************;
;WALSH
FF6C : 5F         clrb                ;clear B
FF6D : D7 0D      stab  $0D           ;store B in addr 0D (SMPPER+1)
FF6F : 48         asla                ;arith shift left A
FF70 : 48         asla                ;arith shift left A
FF71 : 8B 5C      adda  #$5C          ;add A with 5Ch (#WALSHT!.255)
FF73 : C9 FF      adcb  #$FF          ;add C+B + FFh (#WALSH/256)
FF75 : D7 0A      stab  $0A           ;store B in addr 0A
FF77 : 97 0B      staa  $0B           ;store A in addr 0B
FF79 : DE 0A      ldx  $0A            ;load X with addr 0A (WALSHT)
FF7B : EE 00      ldx  $00,x          ;load X with X+00h (addr in WALSHT)
FF7D : DF 08      stx  $08            ;store X in addr 08
FF7F : DE 0A      ldx  $0A            ;load X with addr 0A
FF81 : EE 02      ldx  $02,x          ;load X with X+02h (next addr in WALSHT)
FF83 : E6 00      ldab  $00,x         ;load B with X+00h
FF85 : D7 0C      stab  $0C           ;store B in addr 0C
FF87 : 08         inx                 ;incr X
FF88 : DF 0A      stx  $0A            ;store X in addr 0A
FF8A : CE FE 88   ldx  #$FE88         ;load X with FE88h (#ODDTBL)
FF8D : DF 0E      stx  $0E            ;store X in addr 0E
FF8F : 7E FA BE   jmp  LFABE          ;jump WSM
;*************************************;
; zero padding
FF92 : 00 00 00 00 00 00 00 00 
FF9A : 00 00 00 00 00 00 00 00 
FFA2 : 00 00 00 00 00 00 00 00 
FFAA : 00 00 00 00 00 00 00 00 
FFB2 : 00 00 00 00 00 00 
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
FFF8 : F7 A9                          ;IRQ   
FFFA : F0 01                          ;RESET SWI (software)   
FFFC : F8 08                          ;NMI  
FFFE : F0 01                          ;RESET (hardware) 

;--------------------------------------------------------------





