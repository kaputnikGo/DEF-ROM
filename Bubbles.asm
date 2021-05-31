        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Bubbles.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  30A7
        ;  CRC-32:    689CE2AA
        ;
        ;  Date:    Sun May 16 11:02:19 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; redo...
        ; Video Sound ROM 8 Bubbles 
        ;
        ;
org  $F000
        ;
F000 : AA                             ;checksum byte
;*************************************;
;RESET power on
;*************************************;
;SETUP
F001 : 0F         sei                 ;SET INTERRUPT MASK
F002 : 8E 00 7F   lds  #$007F
F005 : CE 04 00   ldx  #$0400
F008 : 6F 01      clr  $01,x
F00A : 6F 03      clr  $03,x
F00C : 86 FF      ldaa  #$FF
F00E : A7 00      staa  $00,x
F010 : C6 80      ldab  #$80
F012 : E7 02      stab  $02,x
F014 : 86 37      ldaa  #$37
F016 : A7 03      staa  $03,x
F018 : 86 3C      ldaa  #$3C
F01A : A7 01      staa  $01,x
F01C : E7 02      stab  $02,x
F01E : CE 00 7F   ldx  #$007F
;SETUP1
F021 : 6F 00      clr  $00,x
F023 : 09         dex
F024 : 26 FB      bne  LF021
F026 : 86 3C      ldaa  #$3C
F028 : 97 16      staa  X0016
F02A : 0E         cli
;
F02B : 20 FE      bra  LF02B          ;branch always here 
;*************************************;
;White Noise Calls
;*************************************;
;LF02D
F02D : CE F0 33   ldx  #$F033         ;load X with F033h (TBL1)
F030 : 7E F0 ED   jmp  LF0ED          ;jump NOISLG
;
F033 : 10 FF 01 01 01                 ;TBL1
;LF038
F038 : CE F0 3E   ldx  #$F03E         ;load X with F03Eh (TBL2)
F03B : 7E F0 ED   jmp  LF0ED          ;jump NOISLG
;
F03E : C0 FF 01 01 01                 ;TBL2
;*************************************;
;CROWD ROAR
;*************************************;
;CDR
F043 : CE A5 00   ldx  #$A500         ;load X with A500h (SEED)
F046 : DF 16      stx  $16            ;store X in addr 16
F048 : CE F0 5D   ldx  #$F05D         ;load X with F05Dh (#WS1)(1ST WHISTLE PARAMS)
F04B : BD F1 CF   jsr  LF1CF          ;jump sub WISLD
F04E : CE F0 8B   ldx  #$F08B         ;load X with F08Bh (#CR1)(1ST CROWD ROAR NOISE PARAMS)
F051 : BD F0 D8   jsr  LF0D8          ;jump sub NOISLD
F054 : BD F1 73   jsr  LF173          ;jump sub NINIT
;CDR2
F057 : CE F0 90   ldx  #$F090         ;load X with F090h (#CR2)
F05A : 7E F0 ED   jmp  LF0ED          ;jump NOISLG
;*************************************;
;Whistle tables
;*************************************;
F05D : FE 34 02 16 60                 ;WS1
F062 : D6 6E FF 08 28                 ;
F067 : C8 2A 02 10 60                 ;
F06C : B6 3A 02 18 64                 ;
F071 : AC 64 FE 18 38                 ;
F076 : A1 38 02 14 68                 ;
F07B : 90 34 02 12 60                 ;
F080 : 7E 20 02 08 78                 ;
F085 : 76 58 FF 18 22                 ;
F08A : 00                             ;
F08B : C0 60 FC 01 01                 ;CR1
F090 : FF A0 FC FF 08                 ;CR2
;*************************************;
;White Noise Calling routine
;*************************************;
F095 : 18 F0 10 01 30                 ;TBL3
F09A : 04 80 04 FE 30                 ;TBL4
;WNCLL
F09F : CE F0 95   ldx  #$F095         ;load X with F095h (TBL3)
F0A2 : 8D 34      bsr  LF0D8          ;branch sub NOISLD
;WNCLP1
F0A4 : 8D 14      bsr  LF0BA          ;branch sub WNCLL2
F0A6 : 8D 12      bsr  LF0BA          ;branch sub WNCLL2
F0A8 : 86 28      ldaa  #$28          ;load A with 28h
F0AA : 97 3D      staa  $3D           ;store A in addr 3D
F0AC : 73 00 25   com  $0025          ;complement 1s addr 0025
F0AF : 8D 3E      bsr  LF0EF          ;branch sub NOIN
F0B1 : 73 00 25   com  $0025          ;complement 1s addr 0025
F0B4 : 86 1E      ldaa  #$1E          ;load A with 1Eh
F0B6 : 8D 0D      bsr  LF0C5          ;branch sub WNCLL3
F0B8 : 20 EA      bra  LF0A4          ;branch always WNCLP1
;WNCLL2
F0BA : 86 30      ldaa  #$30          ;load A with 30h
F0BC : 97 3D      staa  $3D           ;store A in addr 3D
F0BE : 8D 2F      bsr  LF0EF          ;branch sub NOIN
F0C0 : 86 02      ldaa  #$02          ;load A with 02h
F0C2 : 8D 01      bsr  LF0C5          ;branch sub WNCLL3
F0C4 : 39         rts                 ;return subroutine
;WNCLL3
F0C5 : 16         tab                 ;transfer A to B
F0C6 : CE 04 00   ldx  #$0400         ;load X with 0400h
;WNCLL4
F0C9 : 17         tba                 ;transfer B to A
;WNCLP2
F0CA : 4A         deca                ;decr A
F0CB : 26 FD      bne  LF0CA          ;branch Z=0 WNCLP2
F0CD : 09         dex                 ;decr X
F0CE : 8C 00 00   cpx  #$0000         ;compare X to 1000h
F0D1 : 26 F6      bne  LF0C9          ;branch Z=0 WNCLL4
F0D3 : 86 F0      ldaa  #$F0          ;load A with F0h
F0D5 : 97 21      staa  $21           ;store A in addr 21
F0D7 : 39         rts                 ;return subroutine
;*************************************;
;*Noise with Whistle Routine
;*************************************;
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA
;*************************************;
;NOISLD
F0D8 : A6 00    "  "    ldaa  $00,x
F0DA : 97 38    " 8"    staa  X0038
F0DC : A6 01    "  "    ldaa  $01,x
F0DE : 97 21    " !"    staa  X0021
F0E0 : A6 02    "  "    ldaa  $02,x
F0E2 : 97 20    "  "    staa  X0020
F0E4 : A6 03    "  "    ldaa  $03,x
F0E6 : 97 25    " %"    staa  X0025
F0E8 : A6 04    "  "    ldaa  $04,x
F0EA : 97 3D    " ="    staa  X003D
F0EC        LF0EC:
F0EC : 39    "9"    rts
;*
;*LOAD NOISE AND GO 
;*
;NOISLG
F0ED : 8D E9    "  "    bsr  LF0D8
;*
;*NOISE INIT
;*
;NOIN
F0EF : 8D 30    " 0"    bsr  LF121
;*
;*NOISE LOOP
;*
;NO1:
F0F1 : 8D 58    " X"    bsr  LF14B
F0F3 : 96 3C    " <"    ldaa  X003C
F0F5 : 91 3D    " ="    cmpa  X003D
F0F7 : 26 F8    "& "    bne  LF0F1
F0F9 : 59    "Y"    rolb
F0FA : F7 04 00    "   "    stab  X0400
F0FD : 8D 2D    " -"    bsr  LF12C
F0FF : 8D 38    " 8"    bsr  LF139
F101 : 8D 5C    " \"    bsr  LF15F
F103 : 7D 00 21    "} !"    tst  X0021
F106 : 27 E4    "' "    beq  LF0EC
F108 : 7D 00 22    "} ""    tst  X0022
F10B : 26 E4    "& "    bne  LF0F1
F10D : 7D 00 25    "} %"    tst  X0025
F110 : 27 DF    "' "    beq  LF0F1
F112 : 2B 05    "+ "    bmi  LF119
F114 : 7C 00 3D    "| ="    inc  X003D
F117 : 20 D8    "  "    bra  LF0F1
;NO3:
F119 : 7A 00 3D    "z ="    dec  X003D
F11C : 7A 00 3C    "z <"    dec  X003C
F11F : 20 D0    "  "    bra  LF0F1
;NSUB
F121 : 7F 00 22    "  ""    clr  X0022
F124 : 96 3D    " ="    ldaa  X003D
F126 : 97 3C    " <"    staa  X003C
F128 : 7F 00 3B    "  ;"    clr  X003B
F12B : 39    "9"    rts
;*23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD
;*
;*
;NOISE1
F12C : 96 17    "  "    ldaa  X0017
F12E : 44    "D"    lsra
F12F : 44    "D"    lsra
F130 : 44    "D"    lsra
F131 : 98 17    "  "    eora  X0017
F133 : 97 36    " 6"    staa  X0036
F135 : 08    " "    inx
F136 : 84 07    "  "    anda  #$07
F138 : 39    "9"    rts
;*
;NOISE2
F139 : 96 36    " 6"    ldaa  X0036
F13B : 44    "D"    lsra
F13C : 76 00 16    "v  "    ror  X0016
F13F : 76 00 17    "v  "    ror  X0017
F142 : 86 00    "  "    ldaa  #$00
F144 : 24 02    "$ "    bcc  LF148
F146 : 96 21    " !"    ldaa  X0021
;NOISE3:
F148 : 97 3B    " ;"    staa  X003B
F14A : 39    "9"    rts
;*
;RNT
F14B : 96 3D    " ="    ldaa  X003D
F14D : 7A 00 3C    "z <"    dec  X003C
F150 : 27 04    "' "    beq  LF156
F152 : 08    " "    inx
F153 : 09    " "    dex
F154 : 20 08    "  "    bra  LF15E
;NW0:
F156 : 97 3C    " <"    staa  X003C
F158 : D6 3B    " ;"    ldab  X003B
F15A : 54    "T"    lsrb
F15B : 7C 00 22    "| ""    inc  X0022
;NNW1:
F15E : 39    "9"    rts
;*
;RNA
F15F : 96 38    " 8"    ldaa  X0038
F161 : 91 22    " ""    cmpa  X0022
F163 : 27 04    "' "    beq  LF169
F165 : 08    " "    inx
F166 : 09    " "    dex
F167 : 20 09    "  "    bra  LF172
;NW2:
F169 : 7F 00 22    "  ""    clr  X0022
F16C : 96 21    " !"    ldaa  X0021
F16E : 90 20    "  "    suba  X0020
F170 : 97 21    " !"    staa  X0021
;NW3:
F172 : 39    "9"    rts
;*
;NOISE WITH WHISTLE MAIN LOOP
;*
;NINIT
F173 : 7F 00 2F    "  /"    clr  X002F
F176 : 7F 00 39    "  9"    clr  X0039
F179 : 86 0E    "  "    ldaa  #$0E
F17B : 97 30    " 0"    staa  X0030
F17D : 7F 00 35    "  5"    clr  X0035
;NINIT2
F180 : 8D 9F    "  "    bsr  LF121
;WIN:
F182 : 8D A8    "  "    bsr  LF12C
F184 : BD F2 09    "   "    jsr  LF209
F187 : 8D B0    "  "    bsr  LF139
F189 : BD F2 09    "   "    jsr  LF209
F18C : 8D BD    "  "    bsr  LF14B
F18E : 8D 79    " y"    bsr  LF209
F190 : 8D CD    "  "    bsr  LF15F
F192 : 8D 75    " u"    bsr  LF209
F194 : 8D 0A    "  "    bsr  LF1A0
F196 : 8D 71    " q"    bsr  LF209
F198 : 8D 1D    "  "    bsr  LF1B7
F19A : 8D 6D    " m"    bsr  LF209
F19C : 8D 52    " R"    bsr  LF1F0
F19E : 20 E2    "  "    bra  LF182
;*
;TRICNT
F1A0 : 96 34    " 4"    ldaa  X0034
F1A2 : 7A 00 30    "z 0"    dec  X0030
F1A5 : 27 07    "' "    beq  LF1AE
F1A7 : B6 00 21    "  !"    ldaa  X0021
F1AA : 26 0A    "& "    bne  LF1B6
F1AC : 20 68    " h"    bra  LF216
;NW4:
F1AE : 97 30    " 0"    staa  X0030
F1B0 : 96 2F    " /"    ldaa  X002F
F1B2 : 9B 39    " 9"    adda  X0039
F1B4 : 97 2F    " /"    staa  X002F
;NW5:
F1B6 : 39    "9"    rts
;*
;TRIFRQ
F1B7 : 96 2F    " /"    ldaa  X002F
F1B9 : 91 37    " 7"    cmpa  X0037
F1BB : 27 07    "' "    beq  LF1C4
F1BD : 08    " "    inx
F1BE : 96 21    " !"    ldaa  X0021
F1C0 : 26 2A    "&*"    bne  LF1EC
F1C2 : 20 29    " )"    bra  LF1ED
;NW6:
F1C4 : 7F 00 2F    "  /"    clr  X002F
F1C7 : 7F 00 39    "  9"    clr  X0039
F1CA : 7F 00 35    "  5"    clr  X0035
F1CD : DE 31    " 1"    ldx  X0031
;WISLD
F1CF : A6 00    "  "    ldaa  $00,x
F1D1 : 97 2E    " ."    staa  X002E
F1D3 : 27 17    "' "    beq  LF1EC
F1D5 : A6 01    "  "    ldaa  $01,x
F1D7 : 97 33    " 3"    staa  X0033
F1D9 : A6 02    "  "    ldaa  $02,x
F1DB : 97 3A    " :"    staa  X003A
F1DD : A6 03    "  "    ldaa  $03,x
F1DF : 97 34    " 4"    staa  X0034
F1E1 : A6 04    "  "    ldaa  $04,x
F1E3 : 97 37    " 7"    staa  X0037
F1E5 : 86 05    "  "    ldaa  #$05
F1E7 : BD F5 74    "  t"    jsr  LF574
F1EA : DF 31    " 1"    stx  X0031
;NW7:
F1EC : 39    "9"    rts
;PEND
F1ED : 32    "2"    pula
F1EE : 32    "2"    pula
F1EF : 39    "9"    rts
;*
;NNW
F1F0 : 96 2E    " ."    ldaa  X002E
F1F2 : 27 06    "' "    beq  LF1FA
F1F4 : 91 21    " !"    cmpa  X0021
F1F6 : 26 04    "& "    bne  LF1FC
F1F8 : 20 03    "  "    bra  LF1FD
;NW8:
F1FA : 08    " "    inx
F1FB : 09    " "    dex
;NW9:
F1FC : 39    "9"    rts
;WINIT
F1FD : 7F 00 2E    "  ."    clr  X002E
F200 : 96 33    " 3"    ldaa  X0033
F202 : 97 2F    " /"    staa  X002F
F204 : 96 3A    " :"    ldaa  X003A
F206 : 97 39    " 9"    staa  X0039
F208 : 39    "9"    rts
;*************************************;
;TRIDR
F209 : 96 35    " 5"    ldaa  X0035
F20B : 9B 2F    " /"    adda  X002F
F20D : 97 35    " 5"    staa  X0035
F20F : 2A 01    "* "    bpl  LF212
F211 : 43    "C"    coma
;GO:
F212 : 1B    " "    aba
F213 : B7 04 00    "   "    staa  X0400
;NSEND:
F216 : 39    "9"    rts
;*************************************;
;Vari Loader
;*************************************;
;VARILD
F217 : 16    " "    tab
F218 : 48    "H"    asla
F219 : 48    "H"    asla
F21A : 48    "H"    asla
F21B : 1B         aba
F21C : CE 00 20   ldx  #$0020         ;load X with value 0020h (#LOCRAM)
F21F : DF 1C      stx  X001C
F221 : CE F5 FD   ldx  #$F5FD         ;load X with value F5FDh (VVECT SAW)
F224 : BD F5 74   jsr  LF574          ;jump sub ADDX
F227 : C6 09      ldab  #$09          ;load B with 09h(COUNT)
F229 : 7E F3 16   jmp  LF316          ;jump TRANS
;*************************************;
;Variable Duty Cycle Square Wave Routine
;*************************************;
;VARI
F22C : 96 28    " ("    ldaa  X0028
F22E : B7 04 00    "   "    staa  X0400
F231        LF231:
F231 : DE 20    "  "    ldx  X0020
F233 : DF 29    " )"    stx  X0029
F235        LF235:
F235 : DE 25    " %"    ldx  X0025
F237        LF237:
F237 : 96 29    " )"    ldaa  X0029
F239 : 73 04 00    "s  "    com  X0400
F23C        LF23C:
F23C : 09    " "    dex
F23D : 27 10    "' "    beq  LF24F
F23F : 4A    "J"    deca
F240 : 26 FA    "& "    bne  LF23C
F242 : 96 2A    " *"    ldaa  X002A
F244 : 73 04 00    "s  "    com  X0400
F247        LF247:
F247 : 09    " "    dex
F248 : 27 05    "' "    beq  LF24F
F24A : 4A    "J"    deca
F24B : 26 FA    "& "    bne  LF247
F24D : 20 E8    "  "    bra  LF237
        ;
F24F        LF24F:
F24F : B6 04 00    "   "    ldaa  X0400
F252 : 2B 01    "+ "    bmi  LF255
F254 : 43    "C"    coma
F255        LF255:
F255 : 8B 00    "  "    adda  #$00
F257 : B7 04 00    "   "    staa  X0400
F25A : 96 29    " )"    ldaa  X0029
F25C : 9B 22    " ""    adda  X0022
F25E : 97 29    " )"    staa  X0029
F260 : 96 2A    " *"    ldaa  X002A
F262 : 9B 23    " #"    adda  X0023
F264 : 97 2A    " *"    staa  X002A
F266 : 91 24    " $"    cmpa  X0024
F268 : 26 CB    "& "    bne  LF235
F26A : 96 27    " '"    ldaa  X0027
F26C : 27 06    "' "    beq  LF274
F26E : 9B 20    "  "    adda  X0020
F270 : 97 20    "  "    staa  X0020
F272 : 26 BD    "& "    bne  LF231
F274        LF274:
F274 : 39         rts
;*************************************;
;Organ Tune Selector
;*************************************;
;ORGTS1
F275 : 86 01      ldaa  #$01          ;load A with 01h
F277 : 20 0A      bra  LF283          ;branch always ORGANT
;ORGTS2
F279 : 86 02      ldaa  #$02          ;load A with 02h
F27B : 20 06      bra  LF283          ;branch always ORGANT
;ORGTS3
F27D : 86 03      ldaa  #$03          ;load A with 03h
F27F : 20 02      bra  LF283          ;branch always ORGANT
;ORGTS4
F281 : 86 04      ldaa  #$04          ;load A with 04h
;*************************************;
;Organ Tune 
;*************************************;
;ORGANT
F283 : 7F 00 20   clr  $0020          ;clear addr 0020 (ORGFLG)
F286 : 97 1E      staa  $1E           ;store A in addr 1E (TEMPA) (TUNE NUMBER)
F288 : CE FE BA   ldx  #$FEBA         ;load X with FEBA (ORGTAB)
;ORGNT2:
F28B : A6 00      ldaa  $00,x
F28D : 27 2D    "'-"    beq  LF2BC
F28F : 7A 00 1E    "z  "    dec  X001E
F292 : 27 06    "' "    beq  LF29A
F294 : 4C    "L"    inca
F295 : BD F5 74    "  t"    jsr  LF574
F298 : 20 F1    "  "    bra  LF28B
;ORGNT3:
F29A : 08    " "    inx
F29B : DF 1C    "  "    stx  X001C
F29D : BD F5 74    "  t"    jsr  LF574
F2A0 : DF 1A    "  "    stx  X001A
F2A2 : DE 1C    "  "    ldx  X001C
;ORGNT4:
F2A4 : A6 00    "  "    ldaa  $00,x
F2A6 : 97 23    " #"    staa  X0023
F2A8 : A6 01    "  "    ldaa  $01,x
F2AA : EE 02    "  "    ldx  $02,x
F2AC : DF 21    " !"    stx  X0021
F2AE : 8D 0F    "  "    bsr  LF2BF
F2B0 : DE 1C    "  "    ldx  X001C
F2B2 : 08    " "    inx
F2B3 : 08    " "    inx
F2B4 : 08    " "    inx
F2B5 : 08    " "    inx
F2B6 : DF 1C    "  "    stx  X001C
F2B8 : 9C 1A    "  "    cpx  X001A
F2BA : 26 E8    "& "    bne  LF2A4
;ORGNT5:
F2BC : 7E F5 18    "~  "    jmp  LF518
;*************************************;
;Organ Loader
;*************************************;
;ORGANL
F2BF : CE 00 24    "  $"    ldx  #$0024
;LDLP:
F2C2 : 81 00    "  "    cmpa  #$00
F2C4 : 27 15    "' "    beq  LF2DB
F2C6 : 81 03    "  "    cmpa  #$03
F2C8 : 27 09    "' "    beq  LF2D3
F2CA : C6 01    "  "    ldab  #$01
F2CC : E7 00    "  "    stab  $00,x
F2CE : 08    " "    inx
F2CF : 80 02    "  "    suba  #$02
F2D1 : 20 EF    "  "    bra  LF2C2
;LD2:
F2D3 : C6 91    "  "    ldab  #$91
F2D5 : E7 00    "  "    stab  $00,x
F2D7 : 6F 01    "o "    clr  $01,x
F2D9 : 08    " "    inx
F2DA : 08    " "    inx
;LD1 - (stores 7E F2E9 jmp $F2E9)
F2DB : C6 7E    " ~"    ldab  #$7E
F2DD : E7 00    "  "    stab  $00,x
F2DF : C6 F2    "  "    ldab  #$F2
F2E1 : E7 01    "  "    stab  $01,x
F2E3 : C6 E9    "  "    ldab  #$E9
F2E5 : E7 02    "  "    stab  $02,x
;*************************************;
;Organ Routine 
;*************************************;
;DUR=DURATION, OSCILLATOR MASK
;ORGAN
F2E7 : DE 21    " !"    ldx  X0021
;ORGAN1
F2E9 : 4F    "O"    clra
F2EA : F6 00 1F    "   "    ldab  X001F
F2ED : 5C    "\"    incb
F2EE : D7 1F    "  "    stab  X001F
F2F0 : D4 23    " #"    andb  X0023
F2F2 : 54    "T"    lsrb
F2F3 : 89 00    "  "    adca  #$00
F2F5 : 54    "T"    lsrb
F2F6 : 89 00    "  "    adca  #$00
F2F8 : 54    "T"    lsrb
F2F9 : 89 00    "  "    adca  #$00
F2FB : 54    "T"    lsrb
F2FC : 89 00    "  "    adca  #$00
F2FE : 54    "T"    lsrb
F2FF : 89 00    "  "    adca  #$00
F301 : 54    "T"    lsrb
F302 : 89 00    "  "    adca  #$00
F304 : 54    "T"    lsrb
F305 : 89 00    "  "    adca  #$00
F307 : 48    "H"    asla
F308 : 48    "H"    asla
F309 : 48    "H"    asla
F30A : 48    "H"    asla
F30B : 48    "H"    asla
F30C : B7 04 00    "   "    staa  X0400
F30F : 09    " "    dex
F310 : 27 03    "' "    beq  LF315
F312 : 7E 00 24    "~ $"    jmp  L0024
;ORGAN2:
F315 : 39    "9"    rts
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
F316 : 36    "6"    psha
F317        LF317:
F317 : A6 00    "  "    ldaa  $00,x
F319 : DF 1A    "  "    stx  X001A
F31B : DE 1C    "  "    ldx  X001C
F31D : A7 00    "  "    staa  $00,x
F31F : 08    " "    inx
F320 : DF 1C    "  "    stx  X001C
F322 : DE 1A    "  "    ldx  X001A
F324 : 08    " "    inx
F325 : 5A    "Z"    decb
F326 : 26 EF    "& "    bne  LF317
F328 : 32    "2"    pula
F329 : 39    "9"    rts
;*************************************;
;Knocker Routine
;*************************************;
;KNOCK:
F32A : CE F6 57    "  W"    ldx  #$F657
F32D : DF 22    " ""    stx  X0022
;SQLP
F32F : DE 22    " ""    ldx  X0022
F331 : A6 00    "  "    ldaa  $00,x
F333 : 27 33    "'3"    beq  LF368
F335 : E6 01    "  "    ldab  $01,x
F337 : C4 F0    "  "    andb  #$F0
F339 : D7 21    " !"    stab  X0021
F33B : E6 01    "  "    ldab  $01,x
F33D : 08    " "    inx
F33E : 08    " "    inx
F33F : DF 22    " ""    stx  X0022
F341 : 97 20    "  "    staa  X0020
F343 : C4 0F    "  "    andb  #$0F
F345        LF345:
F345 : 96 21    " !"    ldaa  X0021
F347 : B7 04 00    "   "    staa  X0400
F34A : 96 20    "  "    ldaa  X0020
F34C        LF34C:
F34C : CE 00 05    "   "    ldx  #$0005
F34F        LF34F:
F34F : 09    " "    dex
F350 : 26 FD    "& "    bne  LF34F
F352 : 4A    "J"    deca
F353 : 26 F7    "& "    bne  LF34C
F355 : 7F 04 00    "   "    clr  X0400
F358 : 96 20    "  "    ldaa  X0020
F35A        LF35A:
F35A : CE 00 05    "   "    ldx  #$0005
F35D        LF35D:
F35D : 09    " "    dex
F35E : 26 FD    "& "    bne  LF35D
F360 : 4A    "J"    deca
F361 : 26 F7    "& "    bne  LF35A
F363 : 5A    "Z"    decb
F364 : 26 DF    "& "    bne  LF345
F366 : 20 C7    "  "    bra  LF32F
F368        LF368:
F368 : 39    "9"    rts
;*************************************;
;Background End Routine
;*************************************;
;BGEND
F369 : 7F 00 10    "   "    clr  X0010
F36C : 7F 00 11    "   "    clr  X0011
F36F : 39    "9"    rts
;*************************************;
;Background Sound #2 increment
;*************************************;
;BG2INC
F370 : 96 10    "  "    ldaa  X0010
F372 : 8A 80    "  "    oraa  #$80
F374 : 97 10    "  "    staa  X0010
F376 : 86 3C    " <"    ldaa  #$3C
F378 : 97 11    "  "    staa  X0011
F37A : 39    "9"    rts
;*************************************;
;Background 2 Routine
;*************************************;
;BG2
F37B : 86 04    "  "    ldaa  #$04
F37D : BD F3 90    "   "    jsr  LF390
F380 : 96 11    "  "    ldaa  X0011
F382 : 48    "H"    asla
F383 : 48    "H"    asla
F384 : 43    "C"    coma
F385 : BD F4 4A    "  J"    jsr  LF44A
;BG2LP
F388 : 7C 00 24    "| $"    inc  X0024
F38B : BD F4 4C    "  L"    jsr  LF44C
F38E : 20 F8    "  "    bra  LF388
;*************************************;
;GWAVE Loader
;*************************************;
;GWLD:
F390 : 16    " "    tab
F391 : 58    "X"    aslb
F392 : 1B    " "    aba
F393 : 1B    " "    aba
F394 : 1B         aba
F395 : CE F7 34   ldx  #$F734         ;load X with F734h (SVTAB)(SOUND VECTOR TABLE)
F398 : BD F5 74    "  t"    jsr  LF574
F39B : A6 00    "  "    ldaa  $00,x
F39D : 16    " "    tab
F39E : 84 0F    "  "    anda  #$0F
F3A0 : 97 21    " !"    staa  X0021
F3A2 : 54    "T"    lsrb
F3A3 : 54    "T"    lsrb
F3A4 : 54    "T"    lsrb
F3A5 : 54    "T"    lsrb
F3A6 : D7 20    "  "    stab  X0020
F3A8 : A6 01    "  "    ldaa  $01,x
F3AA : 16    " "    tab
F3AB : 54    "T"    lsrb
F3AC : 54    "T"    lsrb
F3AD : 54    "T"    lsrb
F3AE : 54         lsrb
F3AF : D7 22    " ""    stab  X0022
F3B1 : 84 0F    "  "    anda  #$0F
F3B3 : 97 1E    "  "    staa  X001E
F3B5 : DF 18    "  "    stx  X0018
F3B7 : CE F6 75   ldx  #$F675         ;load X with F675h (GWVTAB)(CALC WAVEFORM ADDR)
;GWLD2
F3BA : 7A 00 1E    "z  "    dec  X001E
F3BD : 2B 08    "+ "    bmi  LF3C7
F3BF : A6 00    "  "    ldaa  $00,x
F3C1 : 4C    "L"    inca
F3C2 : BD F5 74    "  t"    jsr  LF574
F3C5 : 20 F3    "  "    bra  LF3BA
;GWLD3
F3C7 : DF 25    " %"    stx  X0025
F3C9 : BD F4 86    "   "    jsr  LF486
F3CC : DE 18    "  "    ldx  X0018
F3CE : A6 02    "  "    ldaa  $02,x
F3D0 : 97 27    " '"    staa  X0027
F3D2 : BD F4 98    "   "    jsr  LF498
F3D5 : DE 18    "  "    ldx  X0018
F3D7 : A6 03    "  "    ldaa  $03,x
F3D9 : 97 23    " #"    staa  X0023
F3DB : A6 04    "  "    ldaa  $04,x
F3DD : 97 24    " $"    staa  X0024
F3DF : A6 05    "  "    ldaa  $05,x
F3E1 : 16         tab
F3E2 : A6 06      ldaa  $06,x
F3E4 : CE FE 00   ldx  #$FE00         ;load X with FE00h (#GFRTAB)
F3E7 : BD F5 74   jsr  LF574          ;jump sub ADDX
F3EA : 17         tba
F3EB : DF 28    " ("    stx  X0028
F3ED : 7F 00 30    "  0"    clr  X0030
F3F0 : BD F5 74    "  t"    jsr  LF574
F3F3 : DF 2A    " *"    stx  X002A
F3F5 : 39    "9"    rts
;*************************************;
;GWAVE routine
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
F3F6 : 96 20    "  "    ldaa  X0020
F3F8 : 97 2F    " /"    staa  X002F
F3FA        LF3FA:
F3FA : DE 28    " ("    ldx  X0028
F3FC : DF 1A    "  "    stx  X001A
F3FE        LF3FE:
F3FE : DE 1A    "  "    ldx  X001A
F400 : A6 00    "  "    ldaa  $00,x
F402 : 9B 30    " 0"    adda  X0030
F404 : 97 2E    " ."    staa  X002E
F406 : 9C 2A    " *"    cpx  X002A
F408 : 27 26    "'&"    beq  LF430
F40A : D6 21    " !"    ldab  X0021
F40C : 08    " "    inx
F40D : DF 1A    "  "    stx  X001A
F40F        LF40F:
F40F : CE 00 31    "  1"    ldx  #$0031
F412        LF412:
F412 : 96 2E    " ."    ldaa  X002E
F414        LF414:
F414 : 4A    "J"    deca
F415 : 26 FD    "& "    bne  LF414
F417 : A6 00    "  "    ldaa  $00,x
F419 : B7 04 00    "   "    staa  X0400
F41C : 08    " "    inx
F41D : 9C 2C    " ,"    cpx  X002C
F41F : 26 F1    "& "    bne  LF412
F421 : 5A    "Z"    decb
F422 : 27 DA    "' "    beq  LF3FE
F424 : 08    " "    inx
F425 : 09    " "    dex
F426 : 08    " "    inx
F427 : 09    " "    dex
F428 : 08    " "    inx
F429 : 09    " "    dex
F42A : 08    " "    inx
F42B : 09    " "    dex
F42C : 01    " "    nop
F42D : 01    " "    nop
F42E : 20 DF    "  "    bra  LF40F
        ;
F430        LF430:
F430 : 96 22    " ""    ldaa  X0022
F432 : 8D 64    " d"    bsr  LF498
F434 : 7A 00 2F    "z /"    dec  X002F
F437 : 26 C1    "& "    bne  LF3FA
F439 : 96 13    "  "    ldaa  X0013
F43B : 9A 14    "  "    oraa  X0014
F43D : 26 46    "&F"    bne  LF485
F43F : 96 23    " #"    ldaa  X0023
F441 : 27 42    "'B"    beq  LF485
F443 : 7A 00 24    "z $"    dec  X0024
F446 : 27 3D    "'="    beq  LF485
F448 : 9B 30    " 0"    adda  X0030
F44A        LF44A:
F44A : 97 30    " 0"    staa  X0030
F44C        LF44C:
F44C : DE 28    " ("    ldx  X0028
F44E : 5F    "_"    clrb
F44F        LF44F:
F44F : 96 30    " 0"    ldaa  X0030
F451 : 7D 00 23    "} #"    tst  X0023
F454 : 2B 06    "+ "    bmi  LF45C
F456 : AB 00    "  "    adda  $00,x
F458 : 25 08    "% "    bcs  LF462
F45A : 20 0B    "  "    bra  LF467
        ;
F45C        LF45C:
F45C : AB 00    "  "    adda  $00,x
F45E : 27 02    "' "    beq  LF462
F460 : 25 05    "% "    bcs  LF467
F462        LF462:
F462 : 5D    "]"    tstb
F463 : 27 08    "' "    beq  LF46D
F465 : 20 0F    "  "    bra  LF476
        ;
F467        LF467:
F467 : 5D    "]"    tstb
F468 : 26 03    "& "    bne  LF46D
F46A : DF 28    " ("    stx  X0028
F46C : 5C    "\"    incb
F46D        LF46D:
F46D : 08    " "    inx
F46E : 9C 2A    " *"    cpx  X002A
F470 : 26 DD    "& "    bne  LF44F
F472 : 5D    "]"    tstb
F473 : 26 01    "& "    bne  LF476
F475 : 39    "9"    rts
        ;
F476        LF476:
F476 : DF 2A    " *"    stx  X002A
F478 : 96 22    " ""    ldaa  X0022
F47A : 27 06    "' "    beq  LF482
F47C : 8D 08    "  "    bsr  LF486
F47E : 96 27    " '"    ldaa  X0027
F480 : 8D 16    "  "    bsr  LF498
F482        LF482:
F482 : 7E F3 F6    "~  "    jmp  LF3F6
F485        LF485:
F485 : 39    "9"    rts
        ;
F486        LF486:
F486 : CE 00 31    "  1"    ldx  #$0031
F489 : DF 1C    "  "    stx  X001C
F48B : DE 25    " %"    ldx  X0025
F48D : E6 00    "  "    ldab  $00,x
F48F : 08    " "    inx
F490 : BD F3 16    "   "    jsr  LF316
F493 : DE 1C    "  "    ldx  X001C
F495 : DF 2C    " ,"    stx  X002C
F497 : 39    "9"    rts
        ;
F498        LF498:
F498 : 4D    "M"    tsta
F499 : 27 2B    "'+"    beq  LF4C6
F49B : DE 25    " %"    ldx  X0025
F49D : DF 1A    "  "    stx  X001A
F49F : CE 00 31    "  1"    ldx  #$0031
F4A2 : 97 1F    "  "    staa  X001F
F4A4        LF4A4:
F4A4 : DF 1C    "  "    stx  X001C
F4A6 : DE 1A    "  "    ldx  X001A
F4A8 : D6 1F    "  "    ldab  X001F
F4AA : D7 1E    "  "    stab  X001E
F4AC : E6 01    "  "    ldab  $01,x
F4AE : 54    "T"    lsrb
F4AF : 54    "T"    lsrb
F4B0 : 54    "T"    lsrb
F4B1 : 54    "T"    lsrb
F4B2 : 08    " "    inx
F4B3 : DF 1A    "  "    stx  X001A
F4B5 : DE 1C    "  "    ldx  X001C
F4B7 : A6 00    "  "    ldaa  $00,x
F4B9        LF4B9:
F4B9 : 10    " "    sba
F4BA : 7A 00 1E    "z  "    dec  X001E
F4BD : 26 FA    "& "    bne  LF4B9
F4BF : A7 00    "  "    staa  $00,x
F4C1 : 08    " "    inx
F4C2 : 9C 2C    " ,"    cpx  X002C
F4C4 : 26 DE    "& "    bne  LF4A4
F4C6        LF4C6:
F4C6 : 39         rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
F4C7 : 8E 00 7F   lds  #$007F         ;load SP with value 007Fh (#ENDRAM)
F4CA : 7F 00 00   clr  $0000          ;clear addr 0000
F4CD : B6 04 02   ldaa  $0402         ;load A with addr 0402 (PIA sound select)
F4D0 : C6 80      ldab  #$80          ;load B with 80h
F4D2 : F7 04 02   stab  $0402         ;store B in addr 0402 (PIA)
F4D5 : 7C 00 15   inc  $0015          ;incr addr 0015
F4D8 : 43         coma                ;complement 1s A (INVERT INPUT)
F4D9 : 84 7F      anda  #$7F          ;and A with 7Fh (MASK GARB) (0111 1111)
F4DB : 36         psha                ;push A into stack then SP-1
;(allow PIA B6->DS1-1 chimes or electronic switch?? below)
F4DC : 84 5F      anda  #$5F          ;and A with 5Fh (0101 1111)
F4DE : 81 16      cmpa  #$16          ;compare A with 16h
F4E0 : 27 03      beq  LF4E5          ;branch Z=1 IRQ1
F4E2 : 7F 00 13   clr  $0013          ;clear addr 0013
;IRQ1
F4E5 : 81 18      cmpa  #$18          ;compare A with 18h
F4E7 : 27 03      beq  LF4EC          ;branch Z=1 IRQ2
F4E9 : 7F 00 14   clr  $0014          ;clear addr 0014
;IRQ2
F4EC : 32         pula                ;SP+1 pull stack into A
F4ED : 85 20      bita  #$20          ;bit test A with 20h
F4EF : 27 18      beq  LF509          ;branch Z=1 IRQ6
;IRQ3 - check for TALK program
F4F1 : C6 7E      ldab  #$7E          ;load B with 7Eh (jmp opcode)
F4F3 : F1 EF FD   cmpb  $EFFD         ;compare B with addr EFFD (TALK) Speech ROM IC4
F4F6 : 26 05      bne  LF4FD          ;branch Z=0 IRQ4
F4F8 : BD EF FD   jsr  LEFFD          ;jump sub TALK
F4FB : 20 08      bra  LF505          ;branch always IRQ5
;IRQ4
F4FD : F1 DF FD   cmpb  $DFFD         ;compare B with DFFD (alt TALK addr) Speech ROM IC6
F500 : 26 07      bne  LF509          ;branch Z=0 IRQ6
F502 : BD DF FD   jsr  LDFFD          ;jump sub TALK (alt)
;IRQ5
F505 : 96 00      ldaa  $00           ;load A with addr 00
F507 : 20 04      bra  LF50D          ;branch always IRQ7
;IRQ6
F509 : 0E         cli                 ;clear interrupts I=0
F50A : F6 04 02   ldab  $0402         ;load B with addr 0402 PIA sound select
;IRQ7
F50D : 8D 20      bsr  LF52F          ;branch sub IRQADJ
F50F : 7D 00 00   tst  $0000          ;test addr 0000
F512 : 26 DD      bne  LF4F1          ;branch Z=0 IRQ3
F514 : 0E         cli                 ;clear interrupts I=0
F515 : F6 04 02   ldab  $0402         ;load B with PIA sound select
;IRQ8
F518 : 96 10      ldaa  $10           ;load A with addr 10
F51A : 9A 11      oraa  $11           ;or A with addr 11
;IRQ9
F51C : 27 FE      beq  LF51C          ;branch Z=1 here IRQ9
F51E : 4F         clra                ;clear A
F51F : 97 13      staa  $13           ;store A in addr 13
F521 : 97 14      staa  $14           ;store A in addr 14
F523 : 96 10      ldaa  $10           ;load A with addr 10
F525 : 27 05      beq  LF52C          ;branch Z=1 IRQ10
F527 : 2B 03      bmi  LF52C          ;branch N=1 IRQ10
F529 : 7E F3 69   jmp  LF369          ;jump BGEND
;IRQ10
F52C : 7E F3 7B   jmp  LF37B          ;jump BG2
;IRQADJ
F52F : 84 1F      anda  #$1F          ;and A with 1Fh
F531 : 26 01      bne  LF534          ;branch Z=0 IRQ12
F533 : 39         rts                 ;return subroutine
;IRQ12
F534 : 4A         deca                ;decr A
F535 : 27 4C      beq  LF583          ;branch Z=1 TILT
F537 : 81 0A      cmpa  #$0A          ;compare A with 0Ah
F539 : 26 03      bne  LF53E          ;branch Z=0 IRQ13
F53B : 7E F3 70   jmp  LF370          ;jump BG2INC
;IRQ13
F53E : 81 18      cmpa  #$18          ;compare A with 18h
F540 : 26 03      bne  LF545          ;branch Z=0 IRQ14
F542 : 7E F2 79   jmp  LF279          ;jump ORGTS2
;IRQ14
F545 : 81 0F      cmpa  #$0F          ;compare A with 0Fh
F547 : 22 0B      bhi  LF554          ;branch C+Z=0 IRQ17
;IRQ15
F549 : 4A         deca                ;decr A
F54A : BD F3 90   jsr  LF390          ;jump sub GWLD
F54D : 7E F3 F6   jmp  LF3F6          ;jump GWAVE
;IRQ16
F550 : 80 06      suba  #$06          ;sub A with 06h
F552 : 20 F5      bra  LF549          ;branch always IRQ15
;IRQ17
F554 : 81 16      cmpa  #$16          ;compare A with 16h
F556 : 27 F8      beq  LF550          ;branch Z=1 IRQ16
F558 : 81 17      cmpa  #$17          ;compare A with 17h
F55A : 27 F4      beq  LF550          ;branch Z=1 IRQ16
F55C : 81 18      cmpa  #$18          ;compare A with 18h
F55E : 22 0C      bhi  LF56C          ;branch C+Z=0 IRQX
F560 : 80 10      suba  #$10          ;sub A with 10h
F562 : 48         asla                ;arith shift left A
F563 : CE FE AE   ldx  #$FEAE         ;load X with FEAEh (JMPTBL)
F566 : 8D 0C      bsr  LF574          ;branch sub ADDX
F568 : EE 00      ldx  $00,x          ;load X with X+00h
F56A : 6E 00      jmp  $00,x          ;jump addr X+00h
;IRQX
F56C : 80 18      suba  #$18          ;sub A with 18h
F56E : BD F2 17   jsr  LF217          ;jump sub VARILD
F571 : 7E F2 2C   jmp  LF22C          ;jump VARI
;*************************************;
;Add A to Index Register
;*************************************;
;ADDX
F574 : DF 1A      stx  $1A
F576 : 9B 1B      adda  $1B
F578 : 97 1B      staa  $1B
F57A : 96 1A      ldaa  $1A
F57C : 89 00      adca  #$00
F57E : 97 1A      staa  $1A
F580 : DE 1A      ldx  $1A
F582 : 39         rts
;*************************************;
;Tilt sound, buzz saw down
;*************************************;
;TILT
F583 : CE 00 E0   ldx  #$00E0         ;load X with 00E0h
;TILT1
F586 : 86 20      ldaa  #$20          ;load A with 20h
F588 : 8D EA      bsr  LF574          ;branch sub ADDX
;TILT2
F58A : 09         dex                 ;decr X
F58B : 26 FD      bne  LF58A          ;branch Z=0 TILT2
F58D : 7F 04 00   clr  $0400          ;clear DAC output SOUND
;TILT
F590 : 5A         decb                ;decr B 
F591 : 26 FD      bne  LF590          ;branch Z=0 TILT3
F593 : 73 04 00   com  $0400          ;complement 1s DAC output SOUND
F596 : DE 1A      ldx  $1A            ;load X with 1Ah
F598 : 8C 10 00   cpx  #$1000         ;compare X with 1000h
F59B : 26 E9      bne  LF586          ;branch Z=0 TILT1
F59D : 39         rts                 ;return subroutine
;*************************************;
;Diagnostic Processing Here 
;*************************************;
;NMI
F59E : 0F         sei                 ;set interrupt mask
F59F : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
F5A2 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
F5A5 : 5F         clrb                ;clear B
;NMI1
F5A6 : E9 00      adcb  $00,x         ;add C + B + X+00h
F5A8 : 09         dex                 ;decr X
F5A9 : 8C F0 00   cpx  #$F000         ;compare X with F000h
F5AC : 26 F8      bne  LF5A6          ;branch Z=0 NMI1
F5AE : E1 00      cmpb  $00,x         ;compare B with X+00h
F5B0 : 27 01      beq  LF5B3          ;branch Z=1 NMI2
F5B2 : 3E         wai                 ;wait interrupt, PC+1
;NMI2
F5B3 : 7F 04 02   clr  $0402          ;clear addr 0402 PIA sound select
F5B6 : CE 2E E0   ldx  #$2EE0         ;load X with 2EE0h
;NMI3
F5B9 : 09         dex                 ;decr X
F5BA : 26 FD      bne  LF5B9          ;branch Z=0 NMI3
F5BC : BD F3 2A   jsr  LF32A          ;jump sub KNOCK
F5BF : BD F3 2A   jsr  LF32A          ;jump sub KNOCK
F5C2 : BD F3 2A   jsr  LF32A          ;jump sub KNOCK
F5C5 : 86 80      ldaa  #$80          ;load A with 80h
F5C7 : B7 04 02   staa  $0402         ;store A in addr 0402
F5CA : 86 01      ldaa  #$01          ;load A with 01h
F5CC : BD F3 90   jsr  LF390          ;jump sub GWLD
F5CF : BD F3 F6   jsr  LF3F6          ;jump sub GWAVE
F5D2 : 86 0B      ldaa  #$0B          ;load A with 0Bh
F5D4 : BD F3 90   jsr  LF390          ;jump sub GWLD
F5D7 : BD F3 F6   jsr  LF3F6          ;jump sub GWAVE
F5DA : 01         nop                 ;
F5DB : 01         nop                 ;
F5DC : 01         nop                 ;
F5DD : 86 02      ldaa  #$02          ;load A with 02h
F5DF : BD F2 17   jsr  LF217          ;jump sub VARILD
F5E2 : BD F2 2C   jsr  LF22C          ;jump sub VARI
F5E5 : F6 DF FA   ldab  $DFFA         ;load B with addr DFFA (TALKD) (ROM IC6)
F5E8 : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F5EA : 26 05      bne  LF5F1          ;branch Z=0 NMI4
F5EC : BD DF FA   jsr  LDFFA          ;jump sub DFFA (TALKD)
F5EF : 20 AD      bra  LF59E          ;branch always NMI
;NMI4
F5F1 : F6 EF FA   ldab  $EFFA         ;load B with addr EFFA (alt TALKD addr)(ROM IC4)
F5F4 : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F5F6 : 26 A6      bne  LF59E          ;branch Z=0 NMI
F5F8 : BD EF FA   jsr  LEFFA          ;jump sub EFFA (TALKD)
F5FB : 20 A1      bra  LF59E          ;branch always NMI
;*************************************;
;VARI VECTORS
;*************************************;
;VVECT EQU *
F5FD : 40 0F 00 99 09 02 00 F8 FF     ;
F606 : F0 0F 02 21 26 02 80 00 FF     ;
F60F : 05 01 01 01 20 01 08 FF FF     ;
F618 : FF 01 01 0F 02 01 80 00 FF     ;
F621 : 01 20 01 23 00 03 20 00 FF     ;
F62A : 0E E7 35 33 79 03 80 F2 FF     ;
F633 : 36 21 09 06 EF 03 C0 00 FF     ;
F63C : 20 11 07 07 04 00 D0 00 BB     ;
F645 : 01 08 00 47 01 01 22 00 DD     ;
F64E : 17 0B 0D 44 01 02 03 00 CC     ;
;*************************************;
;Knocker Pattern
;*************************************;
F657 : 01FC 02FC 03F8 04F8 06F8 08F4  ;KNKTAB
F663 : 0CF4 10F4 20F2 40F1 60F1 80F1  ;
F66F : A0F1 C0F1 0000                 ;
;*************************************;
;GWave table, 1st byte wavelength
;*************************************;
;GWVTAB
F675 : 04                             ;
F676 : FF FF 00 00                    ;
;
F67A : 08                             ;GS2
F67B : 7F D9 FF D9 7F 24 00 24        ;
;
F683 : 08                             ;GSQ2
F684 : FF FF FF FF 00 00 00 00        ;
;
F68C : 08                             ;GSSQ2
F68D : 00 40 80 00 FF 00 80 40        ;
;
F695 : 10                             ;GS1(1st)
F696 : 7F B0 D9 F5 FF F5 D9 B0        ;
F69E : 7F 4E 24 09 00 09 24 4E        ;
;
F6A6 : 10                             ;GSQ12
F6A7 : FF FF FF FF FF FF FF FF        ;
F6AF : 00 00 00 00 00 00 00 00        ;
;
F6B7 : 10                             ;MW1
F6B8 : 00 F4 00 E8 00 DC 00 E2        ;
F6C0 : 00 DC 00 E8 00 F4 00 00        ;
;
F6C8 : 10                             ;GS1.7
F6C9 : 59 7B 98 AC B3 AC 98 7B        ;
F6D1 : 59 37 19 06 00 06 19 37        ;
;
F6D9 : 18                             ;(24)
F6DA : FF FF FF BF FF FF FF 7F        ;
F6E2 : FF FF FF 3F FF FF FF 00        ;
F6EA : FF FF FF 3F FF FF FF BF        ;
;
F6F2 : 30                             ;(48)
F6F3 : 83 78 69 5B 4E 42 37 2D        ;
F6FB : 24 1C 15 0F 0A 06 03 01        ;
F703 : 00 01 03 06 0A 0F 15 1C        ;
F70B : 24 2D 37 42 4E 5B 69 78        ;
F713 : 88 99 AB BE D2 E7 FD E7        ;
F71B : D2 BE AB 99 95 90 8C 88        ;
;
F723 : 10                             ;GS1(2nd)
F724 : 7F B0 D9 F5 FF F5 D9 B0        ;
F72C : 7F 4E 24 09 00 09 24 4E        ;
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
;SVTAB
F734 : 52 37 00 00 00 10 54           ;
F73B : 73 26 03 00 00 10 95           ;
F742 : 11 41 03 ED 09 09 4B           ;
F749 : 14 0A 09 00 00 09 6A           ;
F750 : F2 24 02 00 00 10 36           ;
F757 : 26 A0 00 00 00 16 54           ;
F75E : 57 31 00 00 00 20 85           ;
F765 : 46 41 02 0E 01 0E 27           ;
F76C : 51 36 00 00 00 0C 00           ;
F773 : 33 60 01 01 01 20 36           ;
F77A : 16 84 03 0E 01 0E 27           ;
F781 : 11 26 00 F0 05 08 A5           ;
F788 : 51 32 01 00 00 10 00           ;
F78F : 46 56 00 00 00 08 6A           ;
F796 : 14 27 01 FE 10 10 54           ;
F79D : 63 27 06 00 00 10 95           ;
F7A4 : 52 32 04 00 00 20 84           ;
;*************************************;
;zero padding
F7AB : 00 00 00 00 00 00 00 00 
F7B3 : 00 00 00 00 00 00 00 00 
F7BB : 00 00 00 00 00 00 00 00 
F7C3 : 00 00 00 00 00 00 00 00 
F7CB : 00 00 00 00 00 00 00 00 
F7D3 : 00 00 00 00 00 00 00 00 
F7DB : 00 00 00 00 00 00 00 00 
F7E3 : 00 00 00 00 00 00 00 00 
F7EB : 00 00 00 00 00 00 00 00 
F7F3 : 00 00 00 00 00 00 00 00 
F7FB : 00 00 00 00 00 00 00 00 
F803 : 00 00 00 00 00 00 00 00 
F80B : 00 00 00 00 00 00 00 00 
F813 : 00 00 00 00 00 00 00 00 
F81B : 00 00 00 00 00 00 00 00 
F823 : 00 00 00 00 00 00 00 00 
F82B : 00 00 00 00 00 00 00 00 
F833 : 00 00 00 00 00 00 00 00 
F83B : 00 00 00 00 00 00 00 00 
F843 : 00 00 00 00 00 00 00 00 
F84B : 00 00 00 00 00 00 00 00 
F853 : 00 00 00 00 00 00 00 00 
F85B : 00 00 00 00 00 00 00 00 
F863 : 00 00 00 00 00 00 00 00 
F86B : 00 00 00 00 00 00 00 00 
F873 : 00 00 00 00 00 00 00 00 
F87B : 00 00 00 00 00 00 00 00 
F883 : 00 00 00 00 00 00 00 00 
F88B : 00 00 00 00 00 00 00 00 
F893 : 00 00 00 00 00 00 00 00 
F89B : 00 00 00 00 00 00 00 00 
F8A3 : 00 00 00 00 00 00 00 00 
F8AB : 00 00 00 00 00 00 00 00 
F8B3 : 00 00 00 00 00 00 00 00 
F8BB : 00 00 00 00 00 00 00 00 
F8C3 : 00 00 00 00 00 00 00 00 
F8CB : 00 00 00 00 00 00 00 00 
F8D3 : 00 00 00 00 00 00 00 00 
F8DB : 00 00 00 00 00 00 00 00 
F8E3 : 00 00 00 00 00 00 00 00 
F8EB : 00 00 00 00 00 00 00 00 
F8F3 : 00 00 00 00 00 00 00 00 
F8FB : 00 00 00 00 00 00 00 00 
F903 : 00 00 00 00 00 00 00 00 
F90B : 00 00 00 00 00 00 00 00 
F913 : 00 00 00 00 00 00 00 00 
F91B : 00 00 00 00 00 00 00 00 
F923 : 00 00 00 00 00 00 00 00 
F92B : 00 00 00 00 00 00 00 00 
F933 : 00 00 00 00 00 00 00 00 
F93B : 00 00 00 00 00 00 00 00 
F943 : 00 00 00 00 00 00 00 00 
F94B : 00 00 00 00 00 00 00 00 
F953 : 00 00 00 00 00 00 00 00 
F95B : 00 00 00 00 00 00 00 00 
F963 : 00 00 00 00 00 00 00 00 
F96B : 00 00 00 00 00 00 00 00 
F973 : 00 00 00 00 00 00 00 00 
F97B : 00 00 00 00 00 00 00 00 
F983 : 00 00 00 00 00 00 00 00 
F98B : 00 00 00 00 00 00 00 00 
F993 : 00 00 00 00 00 00 00 00 
F99B : 00 00 00 00 00 00 00 00 
F9A3 : 00 00 00 00 00 00 00 00 
F9AB : 00 00 00 00 00 00 00 00 
F9B3 : 00 00 00 00 00 00 00 00 
F9BB : 00 00 00 00 00 00 00 00 
F9C3 : 00 00 00 00 00 00 00 00 
F9CB : 00 00 00 00 00 00 00 00 
F9D3 : 00 00 00 00 00 00 00 00 
F9DB : 00 00 00 00 00 00 00 00 
F9E3 : 00 00 00 00 00 00 00 00 
F9EB : 00 00 00 00 00 00 00 00 
F9F3 : 00 00 00 00 00 00 00 00 
F9FB : 00 00 00 00 00 00 00 00 
FA03 : 00 00 00 00 00 00 00 00 
FA0B : 00 00 00 00 00 00 00 00 
FA13 : 00 00 00 00 00 00 00 00 
FA1B : 00 00 00 00 00 00 00 00 
FA23 : 00 00 00 00 00 00 00 00 
FA2B : 00 00 00 00 00 00 00 00 
FA33 : 00 00 00 00 00 00 00 00 
FA3B : 00 00 00 00 00 00 00 00 
FA43 : 00 00 00 00 00 00 00 00 
FA4B : 00 00 00 00 00 00 00 00 
FA53 : 00 00 00 00 00 00 00 00 
FA5B : 00 00 00 00 00 00 00 00 
FA63 : 00 00 00 00 00 00 00 00 
FA6B : 00 00 00 00 00 00 00 00 
FA73 : 00 00 00 00 00 00 00 00 
FA7B : 00 00 00 00 00 00 00 00 
FA83 : 00 00 00 00 00 00 00 00 
FA8B : 00 00 00 00 00 00 00 00 
FA93 : 00 00 00 00 00 00 00 00 
FA9B : 00 00 00 00 00 00 00 00 
FAA3 : 00 00 00 00 00 00 00 00 
FAAB : 00 00 00 00 00 00 00 00 
FAB3 : 00 00 00 00 00 00 00 00 
FABB : 00 00 00 00 00 00 00 00 
FAC3 : 00 00 00 00 00 00 00 00 
FACB : 00 00 00 00 00 00 00 00 
FAD3 : 00 00 00 00 00 00 00 00 
FADB : 00 00 00 00 00 00 00 00 
FAE3 : 00 00 00 00 00 00 00 00 
FAEB : 00 00 00 00 00 00 00 00 
FAF3 : 00 00 00 00 00 00 00 00 
FAFB : 00 00 00 00 00 00 00 00 
FB03 : 00 00 00 00 00 00 00 00 
FB0B : 00 00 00 00 00 00 00 00 
FB13 : 00 00 00 00 00 00 00 00 
FB1B : 00 00 00 00 00 00 00 00 
FB23 : 00 00 00 00 00 00 00 00 
FB2B : 00 00 00 00 00 00 00 00 
FB33 : 00 00 00 00 00 00 00 00 
FB3B : 00 00 00 00 00 00 00 00 
FB43 : 00 00 00 00 00 00 00 00 
FB4B : 00 00 00 00 00 00 00 00 
FB53 : 00 00 00 00 00 00 00 00 
FB5B : 00 00 00 00 00 00 00 00 
FB63 : 00 00 00 00 00 00 00 00 
FB6B : 00 00 00 00 00 00 00 00 
FB73 : 00 00 00 00 00 00 00 00 
FB7B : 00 00 00 00 00 00 00 00 
FB83 : 00 00 00 00 00 00 00 00 
FB8B : 00 00 00 00 00 00 00 00 
FB93 : 00 00 00 00 00 00 00 00 
FB9B : 00 00 00 00 00 00 00 00 
FBA3 : 00 00 00 00 00 00 00 00 
FBAB : 00 00 00 00 00 00 00 00 
FBB3 : 00 00 00 00 00 00 00 00 
FBBB : 00 00 00 00 00 00 00 00 
FBC3 : 00 00 00 00 00 00 00 00 
FBCB : 00 00 00 00 00 00 00 00 
FBD3 : 00 00 00 00 00 00 00 00 
FBDB : 00 00 00 00 00 00 00 00 
FBE3 : 00 00 00 00 00 00 00 00 
FBEB : 00 00 00 00 00 00 00 00 
FBF3 : 00 00 00 00 00 00 00 00 
FBFB : 00 00 00 00 00 00 00 00 
FC03 : 00 00 00 00 00 00 00 00 
FC0B : 00 00 00 00 00 00 00 00 
FC13 : 00 00 00 00 00 00 00 00 
FC1B : 00 00 00 00 00 00 00 00 
FC23 : 00 00 00 00 00 00 00 00 
FC2B : 00 00 00 00 00 00 00 00 
FC33 : 00 00 00 00 00 00 00 00 
FC3B : 00 00 00 00 00 00 00 00 
FC43 : 00 00 00 00 00 00 00 00 
FC4B : 00 00 00 00 00 00 00 00 
FC53 : 00 00 00 00 00 00 00 00 
FC5B : 00 00 00 00 00 00 00 00 
FC63 : 00 00 00 00 00 00 00 00 
FC6B : 00 00 00 00 00 00 00 00 
FC73 : 00 00 00 00 00 00 00 00 
FC7B : 00 00 00 00 00 00 00 00 
FC83 : 00 00 00 00 00 00 00 00 
FC8B : 00 00 00 00 00 00 00 00 
FC93 : 00 00 00 00 00 00 00 00 
FC9B : 00 00 00 00 00 00 00 00 
FCA3 : 00 00 00 00 00 00 00 00 
FCAB : 00 00 00 00 00 00 00 00 
FCB3 : 00 00 00 00 00 00 00 00 
FCBB : 00 00 00 00 00 00 00 00 
FCC3 : 00 00 00 00 00 00 00 00 
FCCB : 00 00 00 00 00 00 00 00 
FCD3 : 00 00 00 00 00 00 00 00 
FCDB : 00 00 00 00 00 00 00 00 
FCE3 : 00 00 00 00 00 00 00 00 
FCEB : 00 00 00 00 00 00 00 00 
FCF3 : 00 00 00 00 00 00 00 00 
FCFB : 00 00 00 00 00 00 00 00 
FD03 : 00 00 00 00 00 00 00 00 
FD0B : 00 00 00 00 00 00 00 00 
FD13 : 00 00 00 00 00 00 00 00 
FD1B : 00 00 00 00 00 00 00 00 
FD23 : 00 00 00 00 00 00 00 00 
FD2B : 00 00 00 00 00 00 00 00 
FD33 : 00 00 00 00 00 00 00 00 
FD3B : 00 00 00 00 00 00 00 00 
FD43 : 00 00 00 00 00 00 00 00 
FD4B : 00 00 00 00 00 00 00 00 
FD53 : 00 00 00 00 00 00 00 00 
FD5B : 00 00 00 00 00 00 00 00 
FD63 : 00 00 00 00 00 00 00 00 
FD6B : 00 00 00 00 00 00 00 00 
FD73 : 00 00 00 00 00 00 00 00 
FD7B : 00 00 00 00 00 00 00 00 
FD83 : 00 00 00 00 00 00 00 00 
FD8B : 00 00 00 00 00 00 00 00 
FD93 : 00 00 00 00 00 00 00 00 
FD9B : 00 00 00 00 00 00 00 00 
FDA3 : 00 00 00 00 00 00 00 00 
FDAB : 00 00 00 00 00 00 00 00 
FDB3 : 00 00 00 00 00 00 00 00 
FDBB : 00 00 00 00 00 00 00 00 
FDC3 : 00 00 00 00 00 00 00 00 
FDCB : 00 00 00 00 00 00 00 00 
FDD3 : 00 00 00 00 00 00 00 00 
FDDB : 00 00 00 00 00 00 00 00 
FDE3 : 00 00 00 00 00 00 00 00 
FDEB : 00 00 00 00 00 00 00 00 
FDF3 : 00 00 00 00 00 00 00 00 
FDFB : 00 00 00 00 00 
;*************************************;
;GWAVE FREQ PATTERN TABLE
;*************************************; 
;GFRTAB 
FE00 : 10 90 91 A2 3A B4 5B C6        ;UNKN5
FE08 : 7C D8 9D EA BE FC DF 0E        ;
;
FE10 : 01 01 02 02 04 88 40 08        ;UNKN6
FE18 : 08 40 88                       ;
;Spinner Sound
FE1B : 01 01 02 02 03 04 05 06        ;SPNSND
FE23 : 07 08 09 0A 0C                 ;
;
FE28 : 08 80 10 78 18 70 20 60        ;YUKSND
FE30 : 28 58 30 50 40 48              ;
;
FE36 : 01 02 02 03 03 03 06 06        ;UNKN1
FE3E : 06 06 0F 1F 36 55 74 91        ;
FE46 : A8 B9 CA DB EC                 ;
;Turbine Start Up
FE4B : 80 7C 78 74 70 74 78 7C 80     ;TRBPAT
;Heartbeat Distorto 
FE54 : 01 01 02 02 04 04 08 08        ;HBDSND
FE5C : 10 20 28 30 38 40 48 50        ;
FE64 : 60 70 80 A0 B0 C0              ;
;
FE6A : 20 10 0C 0A 08 07 06 05        ;UNKN3
FE72 : 04 01 02 04 08 09 0A           ;
;
FE79 : 3F 4F 5F 6F 7F 68 58 48        ;UNKN4
FE81 : 38 28 18 1F 2F                 ;
;Start Distorto Sound
FE86 : 01 01 01 01 02 02 03 03        ;STDSND
FE8E : 04 04 05 06 08 0A 0C 10        ;
FE96 : 14 18 20 30 40 50 40 30        ;
FE9E : 20 10 0C 0A 08 07 06 05        ;
;
FEA6 : CC BB 60 10 EE AA 50 00        ;UNKN2
;*************************************;
;Special Routine Jump Table
;*************************************;
;JMPTBL
FEAE : F0 43                          ;CDR
FEB0 : F0 57                          ;CDR2
FEB2 : F3 69                          ;BGEND
FEB4 : F2 7D                          ;ORGTS3
FEB6 : F2 81                          ;ORGTS4
FEB8 : F2 79                          ;ORGTS2
;
; taken from:
; Robotron 2084 tuning
;*ORGAN NOTE TABLE
;*SCALE        AF  A   BF  B   C   CS
;NOTTAB  FCB  $47,$3F,$37,$30,$29,$23
;*             D   EF  E   F   FS  G
;        FCB  $1D,$17,$12,$0D,$08,$04  
;*
;*************************************;
;Organ Tune Table
;*************************************;
; Oscillator Mask(1), Delay(1), Duration(2)
FEBA : 2C                             ;FCB 11*4
;tune #1
FEBB : 7C 12 0C 74                    ;E2  EQU  $7C12
FEBF : 7C 1D 06 FC                    ;D2  EQU  $7C1D
FEC3 : 7C 29 03 56                    ;C2  EQU  $7C29
FEC7 : F8 04 0E FF                    ;G2  EQU  $F804
FECB : 00 04 01 01                    ;RS  EQU  $0004
FECF : 7C 0D 0C 41                    ;F2  EQU  $7C0D
FED3 : 7C 12 06 74                    ;E2  EQU  $7C12
FED7 : 7C 1D 03 79                    ;D2  EQU  $7C1D
FEDB : 7C 3F 08 F5                    ;A2  EQU  $7C3F
FEDF : 7C 30 06 14                    ;B2  EQU  $7C30
FEE3 : 7C 29 05 5B                    ;C2  EQU  $7C29
;tune #2
FEE7 : 18                             ;FCB 6*4
FEE8 : F8 04 02 FF                    ;G2  EQU  $F804
FEEC : 00 23 06 01                    ;RS  EQU  $0023
FEF0 : F8 04 03 FF                    ;G2  EQU  $F804
FEF4 : 00 23 02 AB                    ;RS  EQU  $0023
FEF8 : F8 04 07 FF                    ;G2  EQU  $F804
FEFC : 7C 29 15 5B                    ;C2  EQU  $7C29
;tune #3 - different tunings here, no source
FF00 : 24                             ;FCB 9*4
FF01 : 7C 23 10 5B                    ;CS2  EQU  $7C23
FF05 : 7C 14 08 74                    ;2nd octave (EF $7C17 ?)
FF09 : 3E 40 04 FF                    ;3rd octave (A $3E3F ?)
FF0D : 3E 40 06 FF                    ;3rd octave (A $3E3F ?)
FF11 : 7C 30 07 FF                    ;B2  EQU  $7C30
FF15 : 7C 1D 10 F9                    ;D2  EQU  $7C1D
FF19 : 7C 0A 0C 41                    ;2nd octave (FS $7C08 ?)
FF1D : 3E 1E 08 7D                    ;3rd octave (D $3E1D ?)
FF21 : 3E 1E 08 7D                    ;3rd octave (D $3E1D ?)
;tune #4
FF25 : 18                             ;FCB 6*4
FF26 : 3E 1E 06 7D                    ;3rd octave (D $3E1D ?)
FF2A : 3E 1E 06 7D                    ;3rd octave (D $3E1D ?)
FF2E : 3E 33 05 0A                    ;3rd octave (B $3E30 ?)
FF32 : 3E 18 07 56                    ;3rd octave (EF $3E17 ?)
FF36 : 3E 1E 0D 0A                    ;3rd octave (D $3E1D ?)
FF3A : 3E 33 0F 7D                    ;3rd octave (B $3E30 ?)
FF3E : 00 00                          ;LAST TUNE 
;*************************************;
;zero padding
FF40 : 00 00 00 00 00 00 00 00 
FF48 : 00 00 00 00 00 00 00 00 
FF50 : 00 00 00 00 00 00 00 00 
FF58 : 00 00 00 00 00 00 00 00 
FF60 : 00 00 00 00 00 00 00 00 
FF68 : 00 00 00 00 00 00 00 00 
FF70 : 00 00 00 00 00 00 00 00 
FF78 : 00 00 00 00 00 00 00 00 
FF80 : 00 00 00 00 00 00 00 00 
FF88 : 00 00 00 00 00 00 00 00 
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
;*************************************;
;Speech ROM jump sub destination, not used in this ROM
;*************************************;
FFF0 : 7E F5 2F   jmp  LF52F          ;jump ADDX
FFF3 : 7E F5 74   jmp  LF574          ;jump 
;
FFF6 : F369                           ;FDB for BGEND
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F4 C7                          ;IRQ 
FFFA : F0 01                          ;RESET SWI (software) 
FFFC : F5 9E                          ;NMI 
FFFE : F0 01                          ;RESET (hardware) 

;--------------------------------------------------------------




