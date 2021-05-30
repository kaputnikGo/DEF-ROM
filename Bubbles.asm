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
        ; Video ROM 8 Bubbles 
        ;
        ;
org  $F000
        ;
F000 : AA 0F    "  "    oraa  $0F,x
F002 : 8E 00 7F    "   "    lds  #$007F
F005 : CE 04 00    "   "    ldx  #$0400
F008 : 6F 01    "o "    clr  $01,x
F00A : 6F 03    "o "    clr  $03,x
F00C : 86 FF    "  "    ldaa  #$FF
F00E : A7 00    "  "    staa  $00,x
F010 : C6 80    "  "    ldab  #$80
F012 : E7 02    "  "    stab  $02,x
F014 : 86 37    " 7"    ldaa  #$37
F016 : A7 03    "  "    staa  $03,x
F018 : 86 3C    " <"    ldaa  #$3C
F01A : A7 01    "  "    staa  $01,x
F01C : E7 02    "  "    stab  $02,x
F01E : CE 00 7F    "   "    ldx  #$007F
F021        LF021:
F021 : 6F 00    "o "    clr  $00,x
F023 : 09    " "    dex
F024 : 26 FB    "& "    bne  LF021
F026 : 86 3C    " <"    ldaa  #$3C
F028 : 97 16    "  "    staa  X0016
F02A : 0E    " "    cli
F02B        LF02B:
F02B : 20 FE    "  "    bra  LF02B
        ;
F02D : CE F0 33    "  3"    ldx  #$F033
F030        LF030:
F030 : 7E F0 ED    "~  "    jmp  LF0ED
        ;
F033 : 10    " "    sba
F034 : FF 01 01    "   "    stx  X0101
F037 : 01    " "    nop
F038 : CE F0 3E    "  >"    ldx  #$F03E
F03B : 7E F0 ED    "~  "    jmp  LF0ED
        ;
F03E : C0 FF    "  "    subb  #$FF
F040 : 01    " "    nop
F041 : 01    " "    nop
F042 : 01    " "    nop
F043 : CE A5 00    "   "    ldx  #$A500
F046 : DF 16    "  "    stx  X0016
F048 : CE F0 5D    "  ]"    ldx  #$F05D
F04B : BD F1 CF    "   "    jsr  LF1CF
F04E : CE F0 8B    "   "    ldx  #$F08B
F051 : BD F0 D8    "   "    jsr  LF0D8
F054 : BD F1 73    "  s"    jsr  LF173
F057 : CE F0 90    "   "    ldx  #$F090
F05A : 7E F0 ED    "~  "    jmp  LF0ED
        ;
F05D : FE 34 02    " 4 "    ldx  X3402
F060 : 16    " "    tab
F061 : 60 D6    "` "    neg  $D6,x
F063 : 6E FF    "n "    jmp  $FF,x            ;INFO: index jump
        ;
F065 : 08    " "    inx
F066 : 28 C8    "( "    bvc  LF030
F068 : 2A 02    "* "    bpl  LF06C
F06A : 10    " "    sba
F06B : 60 B6    "` "    neg  $B6,x
        ;
F06D : 3A 02 18    ":  "    db  $3A, $02, $18
        ;
F070 : 64 AC    "d "    lsr  $AC,x
F072 : 64 FE    "d "    lsr  $FE,x
        ;
F074 : 18 38    " 8"    db  $18, $38
        ;
F076 : A1 38    " 8"    cmpa  $38,x
        ;
F078 : 02 14    "  "    db  $02, $14
        ;
F07A : 68 90    "h "    asl  $90,x
F07C : 34    "4"    des
        ;
F07D : 02 12    "  "    db  $02, $12
        ;
F07F : 60 7E    "`~"    neg  $7E,x
F081 : 20 02    "  "    bra  LF085
        ;
F083 : 08    " "    inx
F084 : 78 76 58    "xvX"    asl  X7658
F087 : FF 18 22    "  ""    stx  X1822
        ;
F08A : 00    " "    db  $00
        ;
F08B : C0 60    " `"    subb  #$60
        ;
F08D : FC    " "    db  $FC
        ;
F08E : 01    " "    nop
F08F : 01    " "    nop
F090 : FF A0 FC    "   "    stx  XA0FC
F093 : FF 08 18    "   "    stx  X0818
F096 : F0 10 01    "   "    subb  X1001
F099 : 30    "0"    tsx
        ;
F09A : 04    " "    db  $04
        ;
F09B : 80 04    "  "    suba  #$04
F09D : FE 30 CE    " 0 "    ldx  X30CE
F0A0 : F0 95 8D    "   "    subb  X958D
F0A3 : 34    "4"    des
F0A4        LF0A4:
F0A4 : 8D 14    "  "    bsr  LF0BA
F0A6 : 8D 12    "  "    bsr  LF0BA
F0A8 : 86 28    " ("    ldaa  #$28
F0AA : 97 3D    " ="    staa  X003D
F0AC : 73 00 25    "s %"    com  X0025
F0AF : 8D 3E    " >"    bsr  LF0EF
F0B1 : 73 00 25    "s %"    com  X0025
F0B4 : 86 1E    "  "    ldaa  #$1E
F0B6 : 8D 0D    "  "    bsr  LF0C5
F0B8 : 20 EA    "  "    bra  LF0A4
        ;
F0BA        LF0BA:
F0BA : 86 30    " 0"    ldaa  #$30
F0BC : 97 3D    " ="    staa  X003D
F0BE : 8D 2F    " /"    bsr  LF0EF
F0C0 : 86 02    "  "    ldaa  #$02
F0C2 : 8D 01    "  "    bsr  LF0C5
F0C4 : 39    "9"    rts
        ;
F0C5        LF0C5:
F0C5 : 16    " "    tab
F0C6 : CE 04 00    "   "    ldx  #$0400
F0C9        LF0C9:
F0C9 : 17    " "    tba
F0CA        LF0CA:
F0CA : 4A    "J"    deca
F0CB : 26 FD    "& "    bne  LF0CA
F0CD : 09    " "    dex
F0CE : 8C 00 00    "   "    cpx  #$0000
F0D1 : 26 F6    "& "    bne  LF0C9
F0D3 : 86 F0    "  "    ldaa  #$F0
F0D5 : 97 21    " !"    staa  X0021
F0D7 : 39    "9"    rts
        ;
F0D8        LF0D8:
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
        ;
F0ED        LF0ED:
F0ED : 8D E9    "  "    bsr  LF0D8
F0EF        LF0EF:
F0EF : 8D 30    " 0"    bsr  LF121
F0F1        LF0F1:
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
        ;
F119        LF119:
F119 : 7A 00 3D    "z ="    dec  X003D
F11C : 7A 00 3C    "z <"    dec  X003C
F11F : 20 D0    "  "    bra  LF0F1
        ;
F121        LF121:
F121 : 7F 00 22    "  ""    clr  X0022
F124 : 96 3D    " ="    ldaa  X003D
F126 : 97 3C    " <"    staa  X003C
F128 : 7F 00 3B    "  ;"    clr  X003B
F12B : 39    "9"    rts
        ;
F12C        LF12C:
F12C : 96 17    "  "    ldaa  X0017
F12E : 44    "D"    lsra
F12F : 44    "D"    lsra
F130 : 44    "D"    lsra
F131 : 98 17    "  "    eora  X0017
F133 : 97 36    " 6"    staa  X0036
F135 : 08    " "    inx
F136 : 84 07    "  "    anda  #$07
F138 : 39    "9"    rts
        ;
F139        LF139:
F139 : 96 36    " 6"    ldaa  X0036
F13B : 44    "D"    lsra
F13C : 76 00 16    "v  "    ror  X0016
F13F : 76 00 17    "v  "    ror  X0017
F142 : 86 00    "  "    ldaa  #$00
F144 : 24 02    "$ "    bcc  LF148
F146 : 96 21    " !"    ldaa  X0021
F148        LF148:
F148 : 97 3B    " ;"    staa  X003B
F14A : 39    "9"    rts
        ;
F14B        LF14B:
F14B : 96 3D    " ="    ldaa  X003D
F14D : 7A 00 3C    "z <"    dec  X003C
F150 : 27 04    "' "    beq  LF156
F152 : 08    " "    inx
F153 : 09    " "    dex
F154 : 20 08    "  "    bra  LF15E
        ;
F156        LF156:
F156 : 97 3C    " <"    staa  X003C
F158 : D6 3B    " ;"    ldab  X003B
F15A : 54    "T"    lsrb
F15B : 7C 00 22    "| ""    inc  X0022
F15E        LF15E:
F15E : 39    "9"    rts
        ;
F15F        LF15F:
F15F : 96 38    " 8"    ldaa  X0038
F161 : 91 22    " ""    cmpa  X0022
F163 : 27 04    "' "    beq  LF169
F165 : 08    " "    inx
F166 : 09    " "    dex
F167 : 20 09    "  "    bra  LF172
        ;
F169        LF169:
F169 : 7F 00 22    "  ""    clr  X0022
F16C : 96 21    " !"    ldaa  X0021
F16E : 90 20    "  "    suba  X0020
F170 : 97 21    " !"    staa  X0021
F172        LF172:
F172 : 39    "9"    rts
        ;
F173        LF173:
F173 : 7F 00 2F    "  /"    clr  X002F
F176 : 7F 00 39    "  9"    clr  X0039
F179 : 86 0E    "  "    ldaa  #$0E
F17B : 97 30    " 0"    staa  X0030
F17D : 7F 00 35    "  5"    clr  X0035
F180 : 8D 9F    "  "    bsr  LF121
F182        LF182:
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
        ;
F1A0        LF1A0:
F1A0 : 96 34    " 4"    ldaa  X0034
F1A2 : 7A 00 30    "z 0"    dec  X0030
F1A5 : 27 07    "' "    beq  LF1AE
F1A7 : B6 00 21    "  !"    ldaa  X0021
F1AA : 26 0A    "& "    bne  LF1B6
F1AC : 20 68    " h"    bra  LF216
        ;
F1AE        LF1AE:
F1AE : 97 30    " 0"    staa  X0030
F1B0 : 96 2F    " /"    ldaa  X002F
F1B2 : 9B 39    " 9"    adda  X0039
F1B4 : 97 2F    " /"    staa  X002F
F1B6        LF1B6:
F1B6 : 39    "9"    rts
        ;
F1B7        LF1B7:
F1B7 : 96 2F    " /"    ldaa  X002F
F1B9 : 91 37    " 7"    cmpa  X0037
F1BB : 27 07    "' "    beq  LF1C4
F1BD : 08    " "    inx
F1BE : 96 21    " !"    ldaa  X0021
F1C0 : 26 2A    "&*"    bne  LF1EC
F1C2 : 20 29    " )"    bra  LF1ED
        ;
F1C4        LF1C4:
F1C4 : 7F 00 2F    "  /"    clr  X002F
F1C7 : 7F 00 39    "  9"    clr  X0039
F1CA : 7F 00 35    "  5"    clr  X0035
F1CD : DE 31    " 1"    ldx  X0031
F1CF        LF1CF:
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
F1EC        LF1EC:
F1EC : 39    "9"    rts
        ;
F1ED        LF1ED:
F1ED : 32    "2"    pula
F1EE : 32    "2"    pula
F1EF : 39    "9"    rts
        ;
F1F0        LF1F0:
F1F0 : 96 2E    " ."    ldaa  X002E
F1F2 : 27 06    "' "    beq  LF1FA
F1F4 : 91 21    " !"    cmpa  X0021
F1F6 : 26 04    "& "    bne  LF1FC
F1F8 : 20 03    "  "    bra  LF1FD
        ;
F1FA        LF1FA:
F1FA : 08    " "    inx
F1FB : 09    " "    dex
F1FC        LF1FC:
F1FC : 39    "9"    rts
        ;
F1FD        LF1FD:
F1FD : 7F 00 2E    "  ."    clr  X002E
F200 : 96 33    " 3"    ldaa  X0033
F202 : 97 2F    " /"    staa  X002F
F204 : 96 3A    " :"    ldaa  X003A
F206 : 97 39    " 9"    staa  X0039
F208 : 39    "9"    rts
        ;
F209        LF209:
F209 : 96 35    " 5"    ldaa  X0035
F20B : 9B 2F    " /"    adda  X002F
F20D : 97 35    " 5"    staa  X0035
F20F : 2A 01    "* "    bpl  LF212
F211 : 43    "C"    coma
F212        LF212:
F212 : 1B    " "    aba
F213 : B7 04 00    "   "    staa  X0400
F216        LF216:
F216 : 39    "9"    rts
        ;
F217        LF217:
F217 : 16    " "    tab
F218 : 48    "H"    asla
F219 : 48    "H"    asla
F21A : 48    "H"    asla
F21B : 1B    " "    aba
F21C : CE 00 20    "   "    ldx  #$0020
F21F : DF 1C    "  "    stx  X001C
F221 : CE F5 FD    "   "    ldx  #$F5FD
F224 : BD F5 74    "  t"    jsr  LF574
F227 : C6 09    "  "    ldab  #$09
F229 : 7E F3 16    "~  "    jmp  LF316
        ;
F22C        LF22C:
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
F274 : 39    "9"    rts
        ;
F275 : 86 01    "  "    ldaa  #$01
F277 : 20 0A    "  "    bra  LF283
        ;
F279        LF279:
F279 : 86 02    "  "    ldaa  #$02
F27B : 20 06    "  "    bra  LF283
        ;
F27D : 86 03    "  "    ldaa  #$03
F27F : 20 02    "  "    bra  LF283
        ;
F281        XF281:
F281 : 86 04    "  "    ldaa  #$04
F283        LF283:
F283 : 7F 00 20    "   "    clr  X0020
F286 : 97 1E    "  "    staa  X001E
F288 : CE FE BA    "   "    ldx  #$FEBA
F28B        LF28B:
F28B : A6 00    "  "    ldaa  $00,x
F28D : 27 2D    "'-"    beq  LF2BC
F28F : 7A 00 1E    "z  "    dec  X001E
F292 : 27 06    "' "    beq  LF29A
F294 : 4C    "L"    inca
F295 : BD F5 74    "  t"    jsr  LF574
F298 : 20 F1    "  "    bra  LF28B
        ;
F29A        LF29A:
F29A : 08    " "    inx
F29B : DF 1C    "  "    stx  X001C
F29D : BD F5 74    "  t"    jsr  LF574
F2A0 : DF 1A    "  "    stx  X001A
F2A2 : DE 1C    "  "    ldx  X001C
F2A4        LF2A4:
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
F2BC        LF2BC:
F2BC : 7E F5 18    "~  "    jmp  LF518
        ;
F2BF        LF2BF:
F2BF : CE 00 24    "  $"    ldx  #$0024
F2C2        LF2C2:
F2C2 : 81 00    "  "    cmpa  #$00
F2C4 : 27 15    "' "    beq  LF2DB
F2C6 : 81 03    "  "    cmpa  #$03
F2C8 : 27 09    "' "    beq  LF2D3
F2CA : C6 01    "  "    ldab  #$01
F2CC : E7 00    "  "    stab  $00,x
F2CE : 08    " "    inx
F2CF : 80 02    "  "    suba  #$02
F2D1 : 20 EF    "  "    bra  LF2C2
        ;
F2D3        LF2D3:
F2D3 : C6 91    "  "    ldab  #$91
F2D5 : E7 00    "  "    stab  $00,x
F2D7 : 6F 01    "o "    clr  $01,x
F2D9 : 08    " "    inx
F2DA : 08    " "    inx
F2DB        LF2DB:
F2DB : C6 7E    " ~"    ldab  #$7E
F2DD : E7 00    "  "    stab  $00,x
F2DF : C6 F2    "  "    ldab  #$F2
F2E1 : E7 01    "  "    stab  $01,x
F2E3 : C6 E9    "  "    ldab  #$E9
F2E5 : E7 02    "  "    stab  $02,x
F2E7 : DE 21    " !"    ldx  X0021
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
F315        LF315:
F315 : 39    "9"    rts
        ;
F316        LF316:
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
        ;
F32A        LF32A:
F32A : CE F6 57    "  W"    ldx  #$F657
F32D : DF 22    " ""    stx  X0022
F32F        LF32F:
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
        ;
F369        LF369:
F369 : 7F 00 10    "   "    clr  X0010
F36C : 7F 00 11    "   "    clr  X0011
F36F : 39    "9"    rts
        ;
F370        LF370:
F370 : 96 10    "  "    ldaa  X0010
F372 : 8A 80    "  "    oraa  #$80
F374 : 97 10    "  "    staa  X0010
F376 : 86 3C    " <"    ldaa  #$3C
F378 : 97 11    "  "    staa  X0011
F37A : 39    "9"    rts
        ;
F37B        LF37B:
F37B : 86 04    "  "    ldaa  #$04
F37D : BD F3 90    "   "    jsr  LF390
F380 : 96 11    "  "    ldaa  X0011
F382 : 48    "H"    asla
F383 : 48    "H"    asla
F384 : 43    "C"    coma
F385 : BD F4 4A    "  J"    jsr  LF44A
F388        LF388:
F388 : 7C 00 24    "| $"    inc  X0024
F38B : BD F4 4C    "  L"    jsr  LF44C
F38E : 20 F8    "  "    bra  LF388
        ;
F390        LF390:
F390 : 16    " "    tab
F391 : 58    "X"    aslb
F392 : 1B    " "    aba
F393 : 1B    " "    aba
F394 : 1B    " "    aba
F395 : CE F7 34    "  4"    ldx  #$F734
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
F3AE : 54    "T"    lsrb
F3AF : D7 22    " ""    stab  X0022
F3B1 : 84 0F    "  "    anda  #$0F
F3B3 : 97 1E    "  "    staa  X001E
F3B5 : DF 18    "  "    stx  X0018
F3B7 : CE F6 75    "  u"    ldx  #$F675
F3BA        LF3BA:
F3BA : 7A 00 1E    "z  "    dec  X001E
F3BD : 2B 08    "+ "    bmi  LF3C7
F3BF : A6 00    "  "    ldaa  $00,x
F3C1 : 4C    "L"    inca
F3C2 : BD F5 74    "  t"    jsr  LF574
F3C5 : 20 F3    "  "    bra  LF3BA
        ;
F3C7        LF3C7:
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
F3E1 : 16    " "    tab
F3E2 : A6 06    "  "    ldaa  $06,x
F3E4 : CE FE 00    "   "    ldx  #$FE00
F3E7 : BD F5 74    "  t"    jsr  LF574
F3EA : 17    " "    tba
F3EB : DF 28    " ("    stx  X0028
F3ED : 7F 00 30    "  0"    clr  X0030
F3F0 : BD F5 74    "  t"    jsr  LF574
F3F3 : DF 2A    " *"    stx  X002A
F3F5 : 39    "9"    rts
        ;
F3F6        LF3F6:
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
F4C6 : 39    "9"    rts
        ;
F4C7 : 8E 00 7F    "   "    lds  #$007F
F4CA : 7F 00 00    "   "    clr  X0000
F4CD : B6 04 02    "   "    ldaa  X0402
F4D0 : C6 80    "  "    ldab  #$80
F4D2 : F7 04 02    "   "    stab  X0402
F4D5 : 7C 00 15    "|  "    inc  X0015
F4D8 : 43    "C"    coma
F4D9 : 84 7F    "  "    anda  #$7F
F4DB : 36    "6"    psha
F4DC : 84 5F    " _"    anda  #$5F
F4DE : 81 16    "  "    cmpa  #$16
F4E0 : 27 03    "' "    beq  LF4E5
F4E2 : 7F 00 13    "   "    clr  X0013
F4E5        LF4E5:
F4E5 : 81 18    "  "    cmpa  #$18
F4E7 : 27 03    "' "    beq  LF4EC
F4E9 : 7F 00 14    "   "    clr  X0014
F4EC        LF4EC:
F4EC : 32    "2"    pula
F4ED : 85 20    "  "    bita  #$20
F4EF : 27 18    "' "    beq  LF509
F4F1        LF4F1:
F4F1 : C6 7E    " ~"    ldab  #$7E
F4F3 : F1 EF FD    "   "    cmpb  XEFFD
F4F6 : 26 05    "& "    bne  LF4FD
F4F8 : BD EF FD    "   "    jsr  LEFFD
F4FB : 20 08    "  "    bra  LF505
        ;
F4FD        LF4FD:
F4FD : F1 DF FD    "   "    cmpb  XDFFD
F500 : 26 07    "& "    bne  LF509
F502 : BD DF FD    "   "    jsr  LDFFD
F505        LF505:
F505 : 96 00    "  "    ldaa  X0000
F507 : 20 04    "  "    bra  LF50D
        ;
F509        LF509:
F509 : 0E    " "    cli
F50A : F6 04 02    "   "    ldab  X0402
F50D        LF50D:
F50D : 8D 20    "  "    bsr  LF52F
F50F : 7D 00 00    "}  "    tst  X0000
F512 : 26 DD    "& "    bne  LF4F1
F514 : 0E    " "    cli
F515 : F6 04 02    "   "    ldab  X0402
F518        LF518:
F518 : 96 10    "  "    ldaa  X0010
F51A : 9A 11    "  "    oraa  X0011
F51C        LF51C:
F51C : 27 FE    "' "    beq  LF51C
F51E : 4F    "O"    clra
F51F : 97 13    "  "    staa  X0013
F521 : 97 14    "  "    staa  X0014
F523 : 96 10    "  "    ldaa  X0010
F525 : 27 05    "' "    beq  LF52C
F527 : 2B 03    "+ "    bmi  LF52C
F529 : 7E F3 69    "~ i"    jmp  LF369
F52C        LF52C:
F52C : 7E F3 7B    "~ {"    jmp  LF37B
        ;
F52F        LF52F:
F52F : 84 1F    "  "    anda  #$1F
F531 : 26 01    "& "    bne  LF534
F533 : 39    "9"    rts
        ;
F534        LF534:
F534 : 4A    "J"    deca
F535 : 27 4C    "'L"    beq  LF583
F537 : 81 0A    "  "    cmpa  #$0A
F539 : 26 03    "& "    bne  LF53E
F53B : 7E F3 70    "~ p"    jmp  LF370
        ;
F53E        LF53E:
F53E : 81 18    "  "    cmpa  #$18
F540 : 26 03    "& "    bne  LF545
F542 : 7E F2 79    "~ y"    jmp  LF279
        ;
F545        LF545:
F545 : 81 0F    "  "    cmpa  #$0F
F547 : 22 0B    "" "    bhi  LF554
F549        LF549:
F549 : 4A    "J"    deca
F54A : BD F3 90    "   "    jsr  LF390
F54D : 7E F3 F6    "~  "    jmp  LF3F6
        ;
F550        LF550:
F550 : 80 06    "  "    suba  #$06
F552 : 20 F5    "  "    bra  LF549
        ;
F554        LF554:
F554 : 81 16    "  "    cmpa  #$16
F556 : 27 F8    "' "    beq  LF550
F558 : 81 17    "  "    cmpa  #$17
F55A : 27 F4    "' "    beq  LF550
F55C : 81 18    "  "    cmpa  #$18
F55E : 22 0C    "" "    bhi  LF56C
F560 : 80 10    "  "    suba  #$10
F562 : 48    "H"    asla
F563 : CE FE AE    "   "    ldx  #$FEAE
F566 : 8D 0C    "  "    bsr  LF574
F568 : EE 00    "  "    ldx  $00,x
F56A : 6E 00    "n "    jmp  $00,x            ;INFO: index jump
        ;
F56C        LF56C:
F56C : 80 18    "  "    suba  #$18
F56E : BD F2 17    "   "    jsr  LF217
F571 : 7E F2 2C    "~ ,"    jmp  LF22C
        ;
F574        LF574:
F574 : DF 1A    "  "    stx  X001A
F576 : 9B 1B    "  "    adda  X001B
F578 : 97 1B    "  "    staa  X001B
F57A : 96 1A    "  "    ldaa  X001A
F57C : 89 00    "  "    adca  #$00
F57E : 97 1A    "  "    staa  X001A
F580 : DE 1A    "  "    ldx  X001A
F582 : 39    "9"    rts
        ;
F583        LF583:
F583 : CE 00 E0    "   "    ldx  #$00E0
F586        LF586:
F586 : 86 20    "  "    ldaa  #$20
F588 : 8D EA    "  "    bsr  LF574
F58A        LF58A:
F58A : 09    " "    dex
F58B : 26 FD    "& "    bne  LF58A
F58D : 7F 04 00    "   "    clr  X0400
F590        LF590:
F590 : 5A    "Z"    decb
F591 : 26 FD    "& "    bne  LF590
F593 : 73 04 00    "s  "    com  X0400
F596 : DE 1A    "  "    ldx  X001A
F598 : 8C 10 00    "   "    cpx  #$1000
F59B : 26 E9    "& "    bne  LF586
F59D : 39    "9"    rts
        ;
F59E        LF59E:
F59E : 0F    " "    sei
F59F : 8E 00 7F    "   "    lds  #$007F
F5A2 : CE FF FF    "   "    ldx  #$FFFF
F5A5 : 5F    "_"    clrb
F5A6        LF5A6:
F5A6 : E9 00    "  "    adcb  $00,x
F5A8 : 09    " "    dex
F5A9 : 8C F0 00    "   "    cpx  #$F000
F5AC : 26 F8    "& "    bne  LF5A6
F5AE : E1 00    "  "    cmpb  $00,x
F5B0 : 27 01    "' "    beq  LF5B3
F5B2 : 3E    ">"    wai
F5B3        LF5B3:
F5B3 : 7F 04 02    "   "    clr  X0402
F5B6 : CE 2E E0    " . "    ldx  #$2EE0
F5B9        LF5B9:
F5B9 : 09    " "    dex
F5BA : 26 FD    "& "    bne  LF5B9
F5BC : BD F3 2A    "  *"    jsr  LF32A
F5BF : BD F3 2A    "  *"    jsr  LF32A
F5C2 : BD F3 2A    "  *"    jsr  LF32A
F5C5 : 86 80    "  "    ldaa  #$80
F5C7 : B7 04 02    "   "    staa  X0402
F5CA : 86 01    "  "    ldaa  #$01
F5CC : BD F3 90    "   "    jsr  LF390
F5CF : BD F3 F6    "   "    jsr  LF3F6
F5D2 : 86 0B    "  "    ldaa  #$0B
F5D4 : BD F3 90    "   "    jsr  LF390
F5D7 : BD F3 F6    "   "    jsr  LF3F6
F5DA : 01    " "    nop
F5DB : 01    " "    nop
F5DC : 01    " "    nop
F5DD : 86 02    "  "    ldaa  #$02
F5DF : BD F2 17    "   "    jsr  LF217
F5E2 : BD F2 2C    "  ,"    jsr  LF22C
F5E5 : F6 DF FA    "   "    ldab  XDFFA
F5E8 : C1 7E    " ~"    cmpb  #$7E
F5EA : 26 05    "& "    bne  LF5F1
F5EC : BD DF FA    "   "    jsr  LDFFA
F5EF : 20 AD    "  "    bra  LF59E
        ;
F5F1        LF5F1:
F5F1 : F6 EF FA    "   "    ldab  XEFFA
F5F4 : C1 7E    " ~"    cmpb  #$7E
F5F6 : 26 A6    "& "    bne  LF59E
F5F8 : BD EF FA    "   "    jsr  LEFFA
F5FB : 20 A1    "  "    bra  LF59E
        ;
F5FD : 40    "@"    nega
F5FE : 0F    " "    sei
        ;
F5FF : 00    " "    db  $00
        ;
F600 : 99 09    "  "    adca  X0009
        ;
F602 : 02 00    "  "    db  $02, $00
        ;
F604 : F8 FF F0    "   "    eorb  XFFF0
F607 : 0F    " "    sei
        ;
F608 : 02 21    " !"    db  $02, $21
        ;
F60A : 26 02    "& "    bne  LF60E
F60C : 80 00    "  "    suba  #$00
F60E        LF60E:
F60E : FF 05 01    "   "    stx  X0501
F611 : 01    " "    nop
F612 : 01    " "    nop
F613 : 20 01    "  "    bra  LF616
        ;
F615 : 08    " "    inx
F616        LF616:
F616 : FF FF FF    "   "    stx  XFFFF
F619 : 01    " "    nop
F61A : 01    " "    nop
F61B : 0F    " "    sei
        ;
F61C : 02    " "    db  $02
        ;
F61D : 01    " "    nop
F61E : 80 00    "  "    suba  #$00
F620 : FF 01 20    "   "    stx  X0120
F623 : 01    " "    nop
F624 : 23 00    "# "    bls  LF626
        ;
F626        LF626:
F626 : 03    " "    db  $03
        ;
F627 : 20 00    "  "    bra  LF629
        ;
F629        LF629:
F629 : FF 0E E7    "   "    stx  X0EE7
F62C : 35    "5"    txs
F62D : 33    "3"    pulb
F62E : 79 03 80    "y  "    rol  X0380
F631 : F2 FF 36    "  6"    sbcb  XFF36
        ;
F634 : 21    "!"    db  $21
        ;
F635 : 09    " "    dex
F636 : 06    " "    tap
F637 : EF 03    "  "    stx  $03,x
F639 : C0 00    "  "    subb  #$00
F63B : FF 20 11    "   "    stx  X2011
F63E : 07    " "    tpa
F63F : 07    " "    tpa
        ;
F640 : 04 00    "  "    db  $04, $00
        ;
F642 : D0 00    "  "    subb  X0000
F644 : BB 01 08    "   "    adda  X0108
        ;
F647 : 00    " "    db  $00
        ;
F648 : 47    "G"    asra
F649 : 01    " "    nop
F64A : 01    " "    nop
F64B : 22 00    "" "    bhi  LF64D
        ;
F64D        LF64D:
F64D : DD    " "    db  $DD
        ;
F64E : 17    " "    tba
F64F : 0B    " "    sev
F650 : 0D    " "    sec
F651 : 44    "D"    lsra
F652 : 01    " "    nop
        ;
F653 : 02 03 00 CC  "    "    db  $02, $03, $00, $CC
        ;
F657 : 01    " "    nop
        ;
F658 : FC 02 FC 03  "    "    db  $FC, $02, $FC, $03
        ;
F65C : F8 04 F8    "   "    eorb  X04F8
F65F : 06    " "    tap
F660 : F8 08 F4    "   "    eorb  X08F4
F663 : 0C    " "    clc
F664 : F4 10 F4    "   "    andb  X10F4
F667 : 20 F2    "  "    bra  LF65B
        ;
F669 : 40    "@"    nega
F66A : F1 60 F1    " ` "    cmpb  X60F1
F66D : 80 F1    "  "    suba  #$F1
F66F : A0 F1    "  "    suba  $F1,x
F671 : C0 F1    "  "    subb  #$F1
        ;
F673 : 00 00 04    "   "    db  $00, $00, $04
        ;
F676 : FF FF 00    "   "    stx  XFF00
        ;
F679 : 00    " "    db  $00
        ;
F67A : 08    " "    inx
F67B : 7F D9 FF    "   "    clr  XD9FF
F67E : D9 7F    "  "    adcb  X007F
F680 : 24 00    "$ "    bcc  LF682
F682        LF682:
F682 : 24 08    "$ "    bcc  LF68C
F684 : FF FF FF    "   "    stx  XFFFF
F687 : FF 00 00    "   "    stx  X0000
        ;
F68A : 00 00    "  "    db  $00, $00
        ;
F68C        LF68C:
F68C : 08    " "    inx
        ;
F68D : 00    " "    db  $00
        ;
F68E : 40    "@"    nega
F68F : 80 00    "  "    suba  #$00
F691 : FF 00 80    "   "    stx  X0080
F694 : 40    "@"    nega
F695 : 10    " "    sba
F696 : 7F B0 D9    "   "    clr  XB0D9
F699 : F5 FF F5    "   "    bitb  XFFF5
F69C : D9 B0    "  "    adcb  X00B0
F69E : 7F 4E 24    " N$"    clr  X4E24
F6A1 : 09    " "    dex
        ;
F6A2 : 00    " "    db  $00
        ;
F6A3 : 09    " "    dex
F6A4 : 24 4E    "$N"    bcc  LF6F4
F6A6 : 10    " "    sba
F6A7 : FF FF FF    "   "    stx  XFFFF
F6AA : FF FF FF    "   "    stx  XFFFF
F6AD : FF FF 00    "   "    stx  XFF00
        ;
F6B0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F6B4 : 00 00 00    "   "    db  $00, $00, $00
        ;
F6B7 : 10    " "    sba
        ;
F6B8 : 00    " "    db  $00
        ;
F6B9 : F4 00 E8    "   "    andb  X00E8
        ;
F6BC : 00 DC 00    "   "    db  $00, $DC, $00
        ;
F6BF : E2 00    "  "    sbcb  $00,x
        ;
F6C1 : DC 00    "  "    db  $DC, $00
        ;
F6C3 : E8 00    "  "    eorb  $00,x
F6C5 : F4 00 00    "   "    andb  X0000
F6C8 : 10    " "    sba
F6C9 : 59    "Y"    rolb
        ;
F6CA : 7B    "{"    db  $7B
        ;
F6CB : 98 AC    "  "    eora  X00AC
        ;
F6CD : B3    " "    db  $B3
        ;
F6CE : AC 98    "  "    cpx  $98,x
        ;
F6D0 : 7B    "{"    db  $7B
        ;
F6D1 : 59    "Y"    rolb
F6D2 : 37    "7"    pshb
F6D3 : 19    " "    daa
F6D4 : 06    " "    tap
        ;
F6D5 : 00    " "    db  $00
        ;
F6D6 : 06    " "    tap
F6D7 : 19    " "    daa
F6D8 : 37    "7"    pshb
        ;
F6D9 : 18    " "    db  $18
        ;
F6DA : FF FF FF    "   "    stx  XFFFF
F6DD : BF FF FF    "   "    sts  XFFFF
F6E0 : FF 7F FF    "   "    stx  X7FFF
F6E3 : FF FF 3F    "  ?"    stx  XFF3F
F6E6 : FF FF FF    "   "    stx  XFFFF
        ;
F6E9 : 00    " "    db  $00
        ;
F6EA        LF6EA:
F6EA : FF FF FF    "   "    stx  XFFFF
F6ED : 3F    "?"    swi
F6EE : FF FF FF    "   "    stx  XFFFF
F6F1 : BF 30 83    " 0 "    sts  X3083
F6F4        LF6F4:
F6F4 : 78 69 5B    "xi["    asl  X695B
        ;
F6F7 : 4E 42    "NB"    db  $4E, $42
        ;
F6F9        LF6F9:
F6F9 : 37    "7"    pshb
F6FA : 2D 24    "-$"    blt  LF720
        ;
F6FC : 1C 15    "  "    db  $1C, $15
        ;
F6FE : 0F    " "    sei
F6FF : 0A    " "    clv
F700 : 06    " "    tap
        ;
F701 : 03    " "    db  $03
        ;
F702 : 01    " "    nop
        ;
F703 : 00    " "    db  $00
        ;
F704 : 01    " "    nop
        ;
F705 : 03    " "    db  $03
        ;
F706 : 06    " "    tap
F707 : 0A    " "    clv
F708 : 0F    " "    sei
        ;
F709 : 15 1C    "  "    db  $15, $1C
        ;
F70B : 24 2D    "$-"    bcc  LF73A
F70D : 37    "7"    pshb
        ;
F70E : 42 4E 5B    "BN["    db  $42, $4E, $5B
        ;
F711 : 69 78    "ix"    rol  $78,x
F713 : 88 99    "  "    eora  #$99
F715 : AB BE    "  "    adda  $BE,x
F717 : D2 E7    "  "    sbcb  X00E7
        ;
F719 : FD    " "    db  $FD
        ;
F71A : E7 D2    "  "    stab  $D2,x
F71C : BE AB 99    "   "    lds  XAB99
F71F : 95 90    "  "    bita  X0090
F721 : 8C 88 10    "   "    cpx  #$8810
F724 : 7F B0 D9    "   "    clr  XB0D9
F727 : F5 FF F5    "   "    bitb  XFFF5
F72A : D9 B0    "  "    adcb  X00B0
F72C : 7F 4E 24    " N$"    clr  X4E24
F72F        LF72F:
F72F : 09    " "    dex
        ;
F730 : 00    " "    db  $00
        ;
F731 : 09    " "    dex
F732 : 24 4E    "$N"    bcc  LF782
        ;
F734 : 52    "R"    db  $52
        ;
F735 : 37    "7"    pshb
        ;
F736 : 00 00 00    "   "    db  $00, $00, $00
        ;
F739 : 10    " "    sba
F73A        LF73A:
F73A : 54    "T"    lsrb
F73B : 73 26 03    "s& "    com  X2603
        ;
F73E : 00 00    "  "    db  $00, $00
        ;
F740 : 10    " "    sba
F741 : 95 11    "  "    bita  X0011
        ;
F743 : 41 03 ED    "A  "    db  $41, $03, $ED
        ;
F746 : 09    " "    dex
F747 : 09    " "    dex
        ;
F748 : 4B 14    "K "    db  $4B, $14
        ;
F74A : 0A    " "    clv
F74B : 09    " "    dex
        ;
F74C : 00 00    "  "    db  $00, $00
        ;
F74E : 09    " "    dex
F74F : 6A F2    "j "    dec  $F2,x
F751 : 24 02    "$ "    bcc  LF755
        ;
F753 : 00 00    "  "    db  $00, $00
        ;
F755        LF755:
F755 : 10    " "    sba
F756 : 36    "6"    psha
F757 : 26 A0    "& "    bne  LF6F9
        ;
F759 : 00 00 00    "   "    db  $00, $00, $00
        ;
F75C : 16    " "    tab
F75D : 54    "T"    lsrb
F75E : 57    "W"    asrb
F75F : 31    "1"    ins
        ;
F760 : 00 00 00    "   "    db  $00, $00, $00
        ;
F763 : 20 85    "  "    bra  LF6EA
        ;
F765 : 46    "F"    rora
        ;
F766 : 41 02    "A "    db  $41, $02
        ;
F768 : 0E    " "    cli
F769 : 01    " "    nop
F76A : 0E    " "    cli
F76B : 27 51    "'Q"    beq  LF7BE
F76D : 36    "6"    psha
        ;
F76E : 00 00 00    "   "    db  $00, $00, $00
        ;
F771 : 0C    " "    clc
        ;
F772 : 00    " "    db  $00
        ;
F773 : 33    "3"    pulb
F774 : 60 01    "` "    neg  $01,x
F776 : 01    " "    nop
F777 : 01    " "    nop
F778 : 20 36    " 6"    bra  LF7B0
        ;
F77A : 16    " "    tab
F77B : 84 03    "  "    anda  #$03
F77D : 0E    " "    cli
F77E : 01    " "    nop
F77F : 0E    " "    cli
F780 : 27 11    "' "    beq  LF793
F782        LF782:
F782 : 26 00    "& "    bne  LF784
F784        LF784:
F784 : F0 05 08    "   "    subb  X0508
F787 : A5 51    " Q"    bita  $51,x
F789 : 32    "2"    pula
F78A : 01    " "    nop
        ;
F78B : 00 00    "  "    db  $00, $00
        ;
F78D : 10    " "    sba
        ;
F78E : 00    " "    db  $00
        ;
F78F : 46    "F"    rora
F790 : 56    "V"    rorb
        ;
F791 : 00 00 00    "   "    db  $00, $00, $00
        ;
F794 : 08    " "    inx
F795 : 6A 14    "j "    dec  $14,x
F797 : 27 01    "' "    beq  LF79A
F799 : FE 10 10    "   "    ldx  X1010
F79C : 54    "T"    lsrb
F79D : 63 27    "c'"    com  $27,x
F79F : 06    " "    tap
        ;
F7A0 : 00 00    "  "    db  $00, $00
        ;
F7A2 : 10    " "    sba
F7A3 : 95 52    " R"    bita  X0052
F7A5 : 32    "2"    pula
        ;
F7A6 : 04 00 00    "   "    db  $04, $00, $00
        ;
F7A9 : 20 84    "  "    bra  LF72F
        ;
F7AB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7AF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7B3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7B7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7BB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7BF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7C3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7C7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7CB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7CF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7D3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7D7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7DB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7DF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7E3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7E7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7EB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7EF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7F3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7F7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7FB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F7FF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F803 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F807 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F80B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F80F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F813 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F817 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F81B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F81F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F823 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F827 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F82B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F82F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F833 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F837 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F83B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F83F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F843 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F847 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F84B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F84F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F853 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F857 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F85B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F85F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F863 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F867 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F86B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F86F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F873 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F877 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F87B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F87F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F883 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F887 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F88B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F88F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F893 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F897 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F89B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F89F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8A3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8A7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8AB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8AF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8B3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8B7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8BB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8BF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8C3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8C7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8CB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8CF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8D3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8D7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8DB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8DF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8E3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8E7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8EB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8EF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8F3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8F7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8FB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F8FF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F903 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F907 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F90B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F90F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F913 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F917 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F91B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F91F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F923 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F927 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F92B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F92F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F933 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F937 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F93B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F93F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F943 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F947 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F94B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F94F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F953 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F957 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F95B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F95F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F963 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F967 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F96B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F96F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F973 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F977 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F97B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F97F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F983 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F987 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F98B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F98F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F993 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F997 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F99B : 00 00 00 00  "    "    db  $00, $00, $00, $00
F99F : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9A3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9A7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9AB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9AF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9B3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9B7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9BB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9BF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9C3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9C7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9CB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9CF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9D3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9D7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9DB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9DF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9E3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9E7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9EB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9EF : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9F3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9F7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9FB : 00 00 00 00  "    "    db  $00, $00, $00, $00
F9FF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA03 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA07 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA0B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA0F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA13 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA17 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA1B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA1F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA23 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA27 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA2B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA2F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA33 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA37 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA3B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA3F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA43 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA47 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA4B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA4F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA53 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA57 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA5B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA5F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA63 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA67 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA6B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA6F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA73 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA77 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA7B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA7F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA83 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA87 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA8B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA8F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA93 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA97 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA9B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FA9F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAA3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAA7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAAB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAAF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAB3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAB7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FABB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FABF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAC3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAC7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FACB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FACF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAD3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAD7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FADB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FADF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAE3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAE7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAEB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAEF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAF3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAF7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAFB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FAFF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB03 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB07 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB0B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB0F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB13 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB17 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB1B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB1F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB23 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB27 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB2B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB2F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB33 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB37 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB3B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB3F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB43 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB47 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB4B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB4F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB53 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB57 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB5B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB5F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB63 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB67 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB6B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB6F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB73 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB77 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB7B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB7F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB83 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB87 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB8B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB8F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB93 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB97 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB9B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FB9F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBA3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBA7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBAB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBAF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBB3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBB7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBBB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBBF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBC3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBC7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBCB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBCF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBD3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBD7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBDB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBDF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBE3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBE7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBEB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBEF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBF3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBF7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBFB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FBFF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC03 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC07 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC0B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC0F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC13 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC17 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC1B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC1F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC23 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC27 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC2B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC2F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC33 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC37 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC3B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC3F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC43 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC47 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC4B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC4F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC53 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC57 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC5B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC5F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC63 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC67 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC6B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC6F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC73 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC77 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC7B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC7F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC83 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC87 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC8B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC8F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC93 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC97 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC9B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC9F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCA3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCA7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCAB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCAF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCB3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCB7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCBB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCBF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCC3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCC7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCCB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCCF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCD3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCD7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCDB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCDF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCE3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCE7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCEB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCEF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCF3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCF7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCFB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCFF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD03 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD07 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD0B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD0F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD13 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD17 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD1B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD1F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD23 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD27 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD2B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD2F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD33 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD37 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD3B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD3F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD43 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD47 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD4B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD4F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD53 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD57 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD5B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD5F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD63 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD67 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD6B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD6F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD73 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD77 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD7B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD7F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD83 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD87 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD8B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD8F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD93 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD97 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD9B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD9F : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDA3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDA7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDAB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDAF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDB3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDB7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDBB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDBF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDC3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDC7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDCB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDCF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDD3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDD7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDDB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDDF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDE3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDE7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDEB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDEF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDF3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDF7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDFB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDFF : 00    " "    db  $00
        ;
FE00 : 10    " "    sba
FE01 : 90 91    "  "    suba  X0091
FE03 : A2 3A    " :"    sbca  $3A,x
FE05 : B4 5B C6    " [ "    anda  X5BC6
FE08 : 7C D8 9D    "|  "    inc  XD89D
FE0B : EA BE    "  "    orab  $BE,x
        ;
FE0D : FC    " "    db  $FC
        ;
FE0E : DF 0E    "  "    stx  X000E
FE10 : 01    " "    nop
FE11 : 01    " "    nop
        ;
FE12 : 02 02 04    "   "    db  $02, $02, $04
        ;
FE15 : 88 40    " @"    eora  #$40
FE17 : 08    " "    inx
FE18 : 08    " "    inx
FE19 : 40    "@"    nega
FE1A : 88 01    "  "    eora  #$01
FE1C : 01    " "    nop
        ;
FE1D : 02 02 03 04  "    "    db  $02, $02, $03, $04
FE21 : 05    " "    db  $05
        ;
FE22 : 06    " "    tap
FE23 : 07    " "    tpa
FE24 : 08    " "    inx
FE25 : 09    " "    dex
FE26 : 0A    " "    clv
FE27 : 0C    " "    clc
FE28 : 08    " "    inx
FE29 : 80 10    "  "    suba  #$10
FE2B : 78 18 70    "x p"    asl  X1870
FE2E : 20 60    " `"    bra  LFE90
        ;
FE30 : 28 58    "(X"    bvc  LFE8A
FE32 : 30    "0"    tsx
FE33 : 50    "P"    negb
FE34 : 40    "@"    nega
FE35 : 48    "H"    asla
FE36 : 01    " "    nop
        ;
FE37 : 02 02 03 03  "    "    db  $02, $02, $03, $03
FE3B : 03    " "    db  $03
        ;
FE3C : 06    " "    tap
FE3D : 06    " "    tap
FE3E : 06    " "    tap
FE3F : 06    " "    tap
FE40 : 0F    " "    sei
        ;
FE41 : 1F    " "    db  $1F
        ;
FE42 : 36    "6"    psha
        ;
FE43 : 55    "U"    db  $55
        ;
FE44 : 74 91 A8    "t  "    lsr  X91A8
FE47 : B9 CA DB    "   "    adca  XCADB
        ;
FE4A : EC    " "    db  $EC
        ;
FE4B : 80 7C    " |"    suba  #$7C
FE4D : 78 74 70    "xtp"    asl  X7470
FE50 : 74 78 7C    "tx|"    lsr  X787C
FE53 : 80 01    "  "    suba  #$01
FE55 : 01    " "    nop
        ;
FE56 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FE5A : 08    " "    inx
FE5B : 08    " "    inx
FE5C : 10    " "    sba
FE5D : 20 28    " ("    bra  LFE87
        ;
FE5F : 30    "0"    tsx
        ;
FE60 : 38    "8"    db  $38
        ;
FE61 : 40    "@"    nega
FE62 : 48    "H"    asla
FE63 : 50    "P"    negb
FE64 : 60 70    "`p"    neg  $70,x
FE66 : 80 A0    "  "    suba  #$A0
FE68 : B0 C0 20    "   "    suba  XC020
FE6B : 10    " "    sba
FE6C : 0C    " "    clc
FE6D : 0A    " "    clv
FE6E : 08    " "    inx
FE6F : 07    " "    tpa
FE70 : 06    " "    tap
        ;
FE71 : 05 04    "  "    db  $05, $04
        ;
FE73 : 01    " "    nop
        ;
FE74 : 02 04    "  "    db  $02, $04
        ;
FE76 : 08    " "    inx
FE77 : 09    " "    dex
FE78 : 0A    " "    clv
FE79 : 3F    "?"    swi
FE7A : 4F    "O"    clra
FE7B : 5F    "_"    clrb
FE7C : 6F 7F    "o "    clr  $7F,x
FE7E : 68 58    "hX"    asl  $58,x
FE80 : 48    "H"    asla
        ;
FE81 : 38    "8"    db  $38
        ;
FE82 : 28 18    "( "    bvc  LFE9C
        ;
FE84 : 1F    " "    db  $1F
        ;
FE85 : 2F 01    "/ "    ble  LFE88
FE87        LFE87:
FE87 : 01    " "    nop
FE88        LFE88:
FE88 : 01    " "    nop
FE89 : 01    " "    nop
        ;
FE8A        LFE8A:
FE8A : 02 02 03 03  "    "    db  $02, $02, $03, $03
FE8E : 04 04 05    "   "    db  $04, $04, $05
        ;
FE91 : 06    " "    tap
FE92 : 08    " "    inx
FE93 : 0A    " "    clv
FE94 : 0C    " "    clc
FE95 : 10    " "    sba
        ;
FE96 : 14 18    "  "    db  $14, $18
        ;
FE98 : 20 30    " 0"    bra  LFECA
        ;
FE9A : 40    "@"    nega
FE9B : 50    "P"    negb
FE9C        LFE9C:
FE9C : 40    "@"    nega
FE9D : 30    "0"    tsx
FE9E : 20 10    "  "    bra  LFEB0
        ;
FEA0 : 0C    " "    clc
FEA1 : 0A    " "    clv
FEA2 : 08    " "    inx
FEA3 : 07    " "    tpa
FEA4 : 06    " "    tap
        ;
FEA5 : 05 CC    "  "    db  $05, $CC
        ;
FEA7 : BB 60 10    " ` "    adda  X6010
FEAA : EE AA    "  "    ldx  $AA,x
FEAC : 50    "P"    negb
        ;
FEAD : 00    " "    db  $00
        ;
FEAE : F0 43 F0    " C "    subb  X43F0
FEB1 : 57    "W"    asrb
        ;
FEB2 : F3    " "    db  $F3
        ;
FEB3 : 69 F2    "i "    rol  $F2,x
FEB5 : 7D F2 81    "}  "    tst  XF281
FEB8 : F2 79 2C    " y,"    sbcb  X792C
FEBB : 7C 12 0C    "|  "    inc  X120C
FEBE : 74 7C 1D    "t| "    lsr  X7C1D
FEC1 : 06    " "    tap
        ;
FEC2 : FC    " "    db  $FC
        ;
FEC3 : 7C 29 03    "|) "    inc  X2903
FEC6 : 56    "V"    rorb
FEC7 : F8 04 0E    "   "    eorb  X040E
FECA        LFECA:
FECA : FF 00 04    "   "    stx  X0004
FECD : 01    " "    nop
FECE : 01    " "    nop
FECF : 7C 0D 0C    "|  "    inc  X0D0C
        ;
FED2 : 41    "A"    db  $41
        ;
FED3 : 7C 12 06    "|  "    inc  X1206
FED6 : 74 7C 1D    "t| "    lsr  X7C1D
        ;
FED9 : 03    " "    db  $03
        ;
FEDA : 79 7C 3F    "y|?"    rol  X7C3F
FEDD : 08    " "    inx
FEDE : F5 7C 30    " |0"    bitb  X7C30
FEE1 : 06    " "    tap
        ;
FEE2 : 14    " "    db  $14
        ;
FEE3 : 7C 29 05    "|) "    inc  X2905
        ;
FEE6 : 5B 18    "[ "    db  $5B, $18
        ;
FEE8 : F8 04 02    "   "    eorb  X0402
FEEB : FF 00 23    "  #"    stx  X0023
FEEE : 06    " "    tap
FEEF : 01    " "    nop
FEF0 : F8 04 03    "   "    eorb  X0403
FEF3 : FF 00 23    "  #"    stx  X0023
        ;
FEF6 : 02    " "    db  $02
        ;
FEF7 : AB F8    "  "    adda  $F8,x
        ;
FEF9 : 04    " "    db  $04
        ;
FEFA : 07    " "    tpa
FEFB : FF 7C 29    " |)"    stx  X7C29
        ;
FEFE : 15 5B    " ["    db  $15, $5B
        ;
FF00        XFF00:
FF00 : 24 7C    "$|"    bcc  LFF7E
FF02 : 23 10    "# "    bls  LFF14
        ;
FF04 : 5B    "["    db  $5B
        ;
FF05 : 7C 14 08    "|  "    inc  X1408
FF08 : 74 3E 40    "t>@"    lsr  X3E40
        ;
FF0B : 04    " "    db  $04
        ;
FF0C : FF 3E 40    " >@"    stx  X3E40
FF0F : 06    " "    tap
FF10 : FF 7C 30    " |0"    stx  X7C30
FF13 : 07    " "    tpa
FF14        LFF14:
FF14 : FF 7C 1D    " | "    stx  X7C1D
FF17 : 10    " "    sba
FF18 : F9 7C 0A    " | "    adcb  X7C0A
FF1B : 0C    " "    clc
        ;
FF1C : 41    "A"    db  $41
        ;
FF1D : 3E    ">"    wai
        ;
FF1E : 1E    " "    db  $1E
        ;
FF1F : 08    " "    inx
FF20 : 7D 3E 1E    "}> "    tst  X3E1E
FF23 : 08    " "    inx
FF24 : 7D 18 3E    "} >"    tst  X183E
        ;
FF27 : 1E    " "    db  $1E
        ;
FF28 : 06    " "    tap
FF29 : 7D 3E 1E    "}> "    tst  X3E1E
FF2C : 06    " "    tap
FF2D : 7D 3E 33    "}>3"    tst  X3E33
        ;
FF30 : 05    " "    db  $05
        ;
FF31 : 0A    " "    clv
FF32 : 3E    ">"    wai
        ;
FF33 : 18    " "    db  $18
        ;
FF34 : 07    " "    tpa
FF35 : 56    "V"    rorb
FF36        XFF36:
FF36 : 3E    ">"    wai
        ;
FF37 : 1E    " "    db  $1E
        ;
FF38 : 0D    " "    sec
FF39 : 0A    " "    clv
FF3A : 3E    ">"    wai
FF3B : 33    "3"    pulb
FF3C : 0F    " "    sei
FF3D : 7D 00 00    "}  "    tst  X0000
        ;
FF40 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF44 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF48 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF4C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF50 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF54 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF58 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF5C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF60 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF64 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF68 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF6C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF70 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF74 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF78 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF7C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF80 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF84 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF88 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF8C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF90 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF94 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF98 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF9C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFA0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFA4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFA8 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFAC : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFB0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFB4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFB8 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFBC : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFC0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFC4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFC8 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFCC : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD8 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFDC : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE8 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFEC : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
FFF0        XFFF0:
FFF0 : 7E F5 2F    "~ /"    jmp  LF52F
FFF3 : 7E F5 74    "~ t"    jmp  LF574
        ;
FFF6 : F3    " "    db  $F3
        ;
FFF7 : 69 F4    "i "    rol  $F4,x
        ;
FFF9 : C7    " "    db  $C7
        ;
FFFA : F0 01 F5    "   "    subb  X01F5
FFFD : 9E F0    "  "    lds  X00F0
FFFF        XFFFF:
FFFF : 01    " "    nop

;--------------------------------------------------------------




