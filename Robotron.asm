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
        ;redo...
        ;
        ;
org  $F000
        ;
F000 : 76 28 43    "v(C"    ror  X2843
F003 : 29 31    ")1"    bvs  LF036
F005 : 39    "9"    rts
        ;
F006 : 38    "8"    db  $38
        ;
F007 : 32    "2"    pula
F008 : 20 57    " W"    bra  LF061
        ;
F00A : 49    "I"    rola
F00B : 4C    "L"    inca
F00C : 4C    "L"    inca
F00D : 49    "I"    rola
        ;
F00E : 41    "A"    db  $41
        ;
F00F : 4D    "M"    tsta
F010 : 53    "S"    comb
F011 : 20 45    " E"    bra  LF058
        ;
F013 : 4C    "L"    inca
        ;
F014 : 45    "E"    db  $45
        ;
F015 : 43    "C"    coma
F016 : 54    "T"    lsrb
        ;
F017 : 52    "R"    db  $52
        ;
F018 : 4F    "O"    clra
        ;
F019 : 4E    "N"    db  $4E
        ;
F01A : 49    "I"    rola
F01B : 43    "C"    coma
F01C : 53    "S"    comb
F01D : 0F    " "    sei
F01E : 8E 00 7F    "   "    lds  #$007F
F021 : CE 04 00    "   "    ldx  #$0400
F024 : 6F 01    "o "    clr  $01,x
F026 : 6F 03    "o "    clr  $03,x
F028 : 86 FF    "  "    ldaa  #$FF
F02A : A7 00    "  "    staa  $00,x
F02C : 6F 02    "o "    clr  $02,x
F02E : 86 37    " 7"    ldaa  #$37
F030 : A7 03    "  "    staa  $03,x
F032 : 86 3C    " <"    ldaa  #$3C
F034 : A7 01    "  "    staa  $01,x
F036        LF036:
F036 : 97 05    "  "    staa  X0005
F038 : 4F    "O"    clra
F039 : 97 03    "  "    staa  X0003
F03B : 97 00    "  "    staa  X0000
F03D : 97 01    "  "    staa  X0001
F03F : 97 02    "  "    staa  X0002
F041 : 97 04    "  "    staa  X0004
F043 : 0E    " "    cli
F044        LF044:
F044 : 20 FE    "  "    bra  LF044
        ;
F046        LF046:
F046 : DF 0C    "  "    stx  X000C
F048 : CE F0 EB    "   "    ldx  #$F0EB
F04B : DF 07    "  "    stx  X0007
F04D : 86 80    "  "    ldaa  #$80
F04F        LF04F:
F04F : D6 15    "  "    ldab  X0015
F051 : 2A 09    "* "    bpl  LF05C
F053 : D6 06    "  "    ldab  X0006
F055 : 54    "T"    lsrb
F056 : 54    "T"    lsrb
F057 : 54    "T"    lsrb
F058        LF058:
F058 : 5C    "\"    incb
F059        LF059:
F059 : 5A    "Z"    decb
F05A : 26 FD    "& "    bne  LF059
F05C        LF05C:
F05C : 7A 00 1A    "z  "    dec  X001A
F05F : 27 4C    "'L"    beq  LF0AD
F061        LF061:
F061 : 7A 00 1B    "z  "    dec  X001B
F064 : 27 4C    "'L"    beq  LF0B2
F066 : 7A 00 1C    "z  "    dec  X001C
F069 : 27 4C    "'L"    beq  LF0B7
F06B : 7A 00 1D    "z  "    dec  X001D
F06E : 26 DF    "& "    bne  LF04F
F070 : D6 15    "  "    ldab  X0015
F072 : 27 DB    "' "    beq  LF04F
F074 : C4 7F    "  "    andb  #$7F
F076 : D7 1D    "  "    stab  X001D
F078 : D6 06    "  "    ldab  X0006
F07A : 58    "X"    aslb
F07B : DB 06    "  "    addb  X0006
F07D : CB 0B    "  "    addb  #$0B
F07F : D7 06    "  "    stab  X0006
F081 : 7A 00 2D    "z -"    dec  X002D
F084 : 26 0E    "& "    bne  LF094
F086 : D6 21    " !"    ldab  X0021
F088 : D7 2D    " -"    stab  X002D
F08A : DE 07    "  "    ldx  X0007
F08C : 09    " "    dex
F08D : 8C F0 E4    "   "    cpx  #$F0E4
F090 : 27 4E    "'N"    beq  LF0E0
F092 : DF 07    "  "    stx  X0007
F094        LF094:
F094 : D6 06    "  "    ldab  X0006
F096 : 2B 06    "+ "    bmi  LF09E
F098 : D4 19    "  "    andb  X0019
F09A : C4 7F    "  "    andb  #$7F
F09C : 20 05    "  "    bra  LF0A3
        ;
F09E        LF09E:
F09E : D4 19    "  "    andb  X0019
F0A0 : C4 7F    "  "    andb  #$7F
F0A2 : 50    "P"    negb
F0A3        LF0A3:
F0A3 : 36    "6"    psha
F0A4 : 1B    " "    aba
F0A5 : 16    " "    tab
F0A6 : 32    "2"    pula
F0A7 : DE 07    "  "    ldx  X0007
F0A9 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
F0AB : 20 A2    "  "    bra  LF04F
        ;
F0AD        LF0AD:
F0AD : CE 00 12    "   "    ldx  #$0012
F0B0 : 20 08    "  "    bra  LF0BA
        ;
F0B2        LF0B2:
F0B2 : CE 00 13    "   "    ldx  #$0013
F0B5 : 20 03    "  "    bra  LF0BA
        ;
F0B7        LF0B7:
F0B7 : CE 00 14    "   "    ldx  #$0014
F0BA        LF0BA:
F0BA : 6D 18    "m "    tst  $18,x
F0BC : 27 12    "' "    beq  LF0D0
F0BE : 6A 18    "j "    dec  $18,x
F0C0 : 26 0E    "& "    bne  LF0D0
F0C2 : E6 0C    "  "    ldab  $0C,x
F0C4 : E7 18    "  "    stab  $18,x
F0C6 : E6 00    "  "    ldab  $00,x
F0C8 : EB 10    "  "    addb  $10,x
F0CA : E1 14    "  "    cmpb  $14,x
F0CC : 27 12    "' "    beq  LF0E0
F0CE : E7 00    "  "    stab  $00,x
F0D0        LF0D0:
F0D0 : E6 00    "  "    ldab  $00,x
F0D2 : E7 08    "  "    stab  $08,x
F0D4 : AB 04    "  "    adda  $04,x
F0D6 : 60 04    "` "    neg  $04,x
F0D8 : 16    " "    tab
F0D9 : DE 07    "  "    ldx  X0007
F0DB : AD 00    "  "    jsr  $00,x            ;INFO: index jump
F0DD : 7E F0 4F    "~ O"    jmp  LF04F
        ;
F0E0        LF0E0:
F0E0 : DE 0C    "  "    ldx  X000C
F0E2 : 39    "9"    rts
        ;
F0E3 : 54    "T"    lsrb
F0E4 : 54    "T"    lsrb
F0E5 : 54    "T"    lsrb
F0E6 : 54    "T"    lsrb
F0E7 : 54    "T"    lsrb
F0E8 : 54    "T"    lsrb
F0E9 : 54    "T"    lsrb
F0EA : 54    "T"    lsrb
F0EB : F7 04 00    "   "    stab  X0400
F0EE : 39    "9"    rts
        ;
F0EF : CE F3 D2    "   "    ldx  #$F3D2
F0F2        LF0F2:
F0F2 : C6 1C    "  "    ldab  #$1C
F0F4 : BD F9 65    "  e"    jsr  LF965
F0F7 : BD F0 46    "  F"    jsr  LF046
F0FA : 39    "9"    rts
        ;
F0FB : CE F3 EE    "   "    ldx  #$F3EE
F0FE : 20 F2    "  "    bra  LF0F2
        ;
F100 : CE F4 0A    "   "    ldx  #$F40A
F103 : 20 ED    "  "    bra  LF0F2
        ;
F105 : CE F4 26    "  &"    ldx  #$F426
F108 : 20 E8    "  "    bra  LF0F2
        ;
F10A : CE F4 42    "  B"    ldx  #$F442
F10D : 20 E3    "  "    bra  LF0F2
        ;
F10F : CE F4 7A    "  z"    ldx  #$F47A
F112 : 20 DE    "  "    bra  LF0F2
        ;
F114 : CE F4 96    "   "    ldx  #$F496
F117 : 20 D9    "  "    bra  LF0F2
        ;
F119 : CE 00 60    "  `"    ldx  #$0060
F11C : A6 00    "  "    ldaa  $00,x
F11E : 80 02    "  "    suba  #$02
F120 : A7 00    "  "    staa  $00,x
F122 : BD F3 30    "  0"    jsr  LF330
F125 : 7E F3 49    "~ I"    jmp  LF349
        ;
F128 : CE 00 01    "   "    ldx  #$0001
F12B : DF 12    "  "    stx  X0012
F12D : CE 03 80    "   "    ldx  #$0380
F130 : DF 14    "  "    stx  X0014
F132        LF132:
F132 : 7F 04 00    "   "    clr  X0400
F135 : DE 12    "  "    ldx  X0012
F137 : 08    " "    inx
F138 : DF 12    "  "    stx  X0012
F13A        LF13A:
F13A : 09    " "    dex
F13B : 26 FD    "& "    bne  LF13A
F13D : 73 04 00    "s  "    com  X0400
F140 : DE 14    "  "    ldx  X0014
F142        LF142:
F142 : 09    " "    dex
F143 : 26 FD    "& "    bne  LF142
F145 : 20 EB    "  "    bra  LF132
        ;
F147 : 86 FF    "  "    ldaa  #$FF
F149 : 97 12    "  "    staa  X0012
F14B : CE FE C0    "   "    ldx  #$FEC0
F14E : DF 14    "  "    stx  X0014
F150 : 86 20    "  "    ldaa  #$20
F152 : CE FF E0    "   "    ldx  #$FFE0
F155 : 8D 05    "  "    bsr  LF15C
F157 : 86 01    "  "    ldaa  #$01
F159 : CE 00 44    "  D"    ldx  #$0044
F15C        LF15C:
F15C : 97 16    "  "    staa  X0016
F15E : DF 17    "  "    stx  X0017
F160        LF160:
F160 : CE 00 10    "   "    ldx  #$0010
F163        LF163:
F163 : 8D 21    " !"    bsr  LF186
F165 : 96 13    "  "    ldaa  X0013
F167 : 9B 15    "  "    adda  X0015
F169 : 97 13    "  "    staa  X0013
F16B : 96 12    "  "    ldaa  X0012
F16D : 99 14    "  "    adca  X0014
F16F : 97 12    "  "    staa  X0012
F171 : 09    " "    dex
F172 : 26 EF    "& "    bne  LF163
F174 : 96 15    "  "    ldaa  X0015
F176 : 9B 16    "  "    adda  X0016
F178 : 97 15    "  "    staa  X0015
F17A : 24 03    "$ "    bcc  LF17F
F17C : 7C 00 14    "|  "    inc  X0014
F17F        LF17F:
F17F : DE 14    "  "    ldx  X0014
F181 : 9C 17    "  "    cpx  X0017
F183 : 26 DB    "& "    bne  LF160
F185 : 39    "9"    rts
        ;
F186        LF186:
F186 : 4F    "O"    clra
F187        LF187:
F187 : B7 04 00    "   "    staa  X0400
F18A : 8B 20    "  "    adda  #$20
F18C : 24 F9    "$ "    bcc  LF187
F18E : 8D 09    "  "    bsr  LF199
F190 : 86 E0    "  "    ldaa  #$E0
F192        LF192:
F192 : B7 04 00    "   "    staa  X0400
F195 : 80 20    "  "    suba  #$20
F197 : 24 F9    "$ "    bcc  LF192
F199        LF199:
F199 : D6 12    "  "    ldab  X0012
F19B        LF19B:
F19B : 86 02    "  "    ldaa  #$02
F19D        LF19D:
F19D : 4A    "J"    deca
F19E : 26 FD    "& "    bne  LF19D
F1A0 : 5A    "Z"    decb
F1A1 : 26 F8    "& "    bne  LF19B
F1A3 : 39    "9"    rts
        ;
F1A4 : 86 80    "  "    ldaa  #$80
F1A6 : 97 1C    "  "    staa  X001C
F1A8 : 86 F1    "  "    ldaa  #$F1
F1AA : 97 1A    "  "    staa  X001A
F1AC        LF1AC:
F1AC : 86 80    "  "    ldaa  #$80
F1AE : 97 10    "  "    staa  X0010
F1B0        LF1B0:
F1B0 : 86 12    "  "    ldaa  #$12
F1B2        LF1B2:
F1B2 : 4A    "J"    deca
F1B3 : 26 FD    "& "    bne  LF1B2
F1B5 : 96 19    "  "    ldaa  X0019
F1B7 : 9B 1C    "  "    adda  X001C
F1B9 : 97 19    "  "    staa  X0019
F1BB : 44    "D"    lsra
F1BC : 44    "D"    lsra
F1BD : 44    "D"    lsra
F1BE : 8B D8    "  "    adda  #$D8
F1C0 : 97 1B    "  "    staa  X001B
F1C2 : DE 1A    "  "    ldx  X001A
F1C4 : A6 00    "  "    ldaa  $00,x
F1C6 : B7 04 00    "   "    staa  X0400
F1C9 : 7A 00 10    "z  "    dec  X0010
F1CC : 26 E2    "& "    bne  LF1B0
F1CE : 7A 00 1C    "z  "    dec  X001C
F1D1 : 96 1C    "  "    ldaa  X001C
F1D3 : 81 20    "  "    cmpa  #$20
F1D5 : 26 D5    "& "    bne  LF1AC
F1D7 : 39    "9"    rts
        ;
F1D8 : 80 8C    "  "    suba  #$8C
F1DA : 98 A5    "  "    eora  X00A5
F1DC : B0 BC C6    "   "    suba  XBCC6
F1DF : D0 DA    "  "    subb  X00DA
F1E1 : E2 EA    "  "    sbcb  $EA,x
F1E3 : F0 F5 FA    "   "    subb  XF5FA
        ;
F1E6 : FD    " "    db  $FD
        ;
F1E7 : FE FF FE    "   "    ldx  XFFFE
        ;
F1EA : FD    " "    db  $FD
        ;
F1EB : FA F5 F0    "   "    orab  XF5F0
F1EE : EA E2    "  "    orab  $E2,x
F1F0 : DA D0    "  "    orab  X00D0
F1F2 : C6 BC    "  "    ldab  #$BC
F1F4 : B0 A5 98    "   "    suba  XA598
F1F7 : 8C 80 73    "  s"    cpx  #$8073
F1FA : 67 5A    "gZ"    asr  $5A,x
F1FC : 4F    "O"    clra
F1FD : 43    "C"    coma
F1FE : 39    "9"    rts
        ;
F1FF : 2F 25    "/%"    ble  LF226
        ;
F201 : 1D 15    "  "    db  $1D, $15
        ;
F203 : 0F    " "    sei
F204 : 0A    " "    clv
        ;
F205 : 05 02    "  "    db  $05, $02
        ;
F207 : 01    " "    nop
        ;
F208 : 00    " "    db  $00
        ;
F209 : 01    " "    nop
        ;
F20A : 02 05    "  "    db  $02, $05
        ;
F20C : 0A    " "    clv
F20D : 0F    " "    sei
        ;
F20E : 15 1D    "  "    db  $15, $1D
        ;
F210 : 25 2F    "%/"    bcs  LF241
F212 : 39    "9"    rts
        ;
F213 : 43    "C"    coma
F214 : 4F    "O"    clra
F215 : 5A    "Z"    decb
F216 : 67 73    "gs"    asr  $73,x
F218 : 7F 04 02    "   "    clr  X0402
F21B : CE F2 5F    "  _"    ldx  #$F25F
F21E : DF 14    "  "    stx  X0014
F220        LF220:
F220 : DE 14    "  "    ldx  X0014
F222 : A6 00    "  "    ldaa  $00,x
F224 : 27 33    "'3"    beq  LF259
F226        LF226:
F226 : E6 01    "  "    ldab  $01,x
F228 : C4 F0    "  "    andb  #$F0
F22A : D7 13    "  "    stab  X0013
F22C : E6 01    "  "    ldab  $01,x
F22E : 08    " "    inx
F22F : 08    " "    inx
F230 : DF 14    "  "    stx  X0014
F232 : 97 12    "  "    staa  X0012
F234 : C4 0F    "  "    andb  #$0F
F236        LF236:
F236 : 96 13    "  "    ldaa  X0013
F238 : B7 04 00    "   "    staa  X0400
F23B : 96 12    "  "    ldaa  X0012
F23D        LF23D:
F23D : CE 00 05    "   "    ldx  #$0005
F240        LF240:
F240 : 09    " "    dex
F241        LF241:
F241 : 26 FD    "& "    bne  LF240
F243 : 4A    "J"    deca
F244 : 26 F7    "& "    bne  LF23D
F246 : 7F 04 00    "   "    clr  X0400
F249 : 96 12    "  "    ldaa  X0012
F24B        LF24B:
F24B : CE 00 05    "   "    ldx  #$0005
F24E        LF24E:
F24E : 09    " "    dex
F24F : 26 FD    "& "    bne  LF24E
F251 : 4A    "J"    deca
F252 : 26 F7    "& "    bne  LF24B
F254 : 5A    "Z"    decb
F255 : 26 DF    "& "    bne  LF236
F257 : 20 C7    "  "    bra  LF220
        ;
F259        LF259:
F259 : 86 80    "  "    ldaa  #$80
F25B : B7 04 02    "   "    staa  X0402
F25E : 39    "9"    rts
        ;
F25F : 01    " "    nop
        ;
F260 : FC 02 FC 03  "    "    db  $FC, $02, $FC, $03
        ;
F264 : F8 04 F8    "   "    eorb  X04F8
F267 : 06    " "    tap
F268 : F8 08 F4    "   "    eorb  X08F4
F26B : 0C    " "    clc
F26C : F4 10 F4    "   "    andb  X10F4
F26F : 20 F2    "  "    bra  LF263
        ;
F271 : 40    "@"    nega
F272 : F1 60 F1    " ` "    cmpb  X60F1
F275 : 80 F1    "  "    suba  #$F1
F277 : A0 F1    "  "    suba  $F1,x
F279 : C0 F1    "  "    subb  #$F1
        ;
F27B : 00 00    "  "    db  $00, $00
        ;
F27D : 7A 00 2E    "z ."    dec  X002E
F280 : 20 04    "  "    bra  LF286
        ;
F282 : C6 A0    "  "    ldab  #$A0
F284 : D7 2E    " ."    stab  X002E
F286        LF286:
F286 : 86 04    "  "    ldaa  #$04
F288 : 97 13    "  "    staa  X0013
F28A        LF28A:
F28A : 86 9F    "  "    ldaa  #$9F
F28C : D6 2E    " ."    ldab  X002E
F28E        LF28E:
F28E : CE 01 C0    "   "    ldx  #$01C0
F291        LF291:
F291 : 09    " "    dex
F292 : 27 20    "' "    beq  LF2B4
F294 : F7 00 12    "   "    stab  X0012
F297 : B7 04 00    "   "    staa  X0400
F29A        LF29A:
F29A : 09    " "    dex
F29B : 27 17    "' "    beq  LF2B4
F29D : 7A 00 12    "z  "    dec  X0012
F2A0 : 26 F8    "& "    bne  LF29A
F2A2 : 09    " "    dex
F2A3 : 27 0F    "' "    beq  LF2B4
F2A5 : D7 12    "  "    stab  X0012
F2A7 : 73 04 00    "s  "    com  X0400
F2AA        LF2AA:
F2AA : 09    " "    dex
F2AB : 27 07    "' "    beq  LF2B4
F2AD : 7A 00 12    "z  "    dec  X0012
F2B0 : 26 F8    "& "    bne  LF2AA
F2B2 : 20 DD    "  "    bra  LF291
        ;
F2B4        LF2B4:
F2B4 : D0 13    "  "    subb  X0013
F2B6 : C1 10    "  "    cmpb  #$10
F2B8 : 22 D4    "" "    bhi  LF28E
F2BA : 39    "9"    rts
        ;
F2BB : C6 11    "  "    ldab  #$11
F2BD : D7 2E    " ."    stab  X002E
F2BF : 86 FE    "  "    ldaa  #$FE
F2C1 : 97 13    "  "    staa  X0013
F2C3 : 20 C5    "  "    bra  LF28A
        ;
F2C5 : CE F4 B2    "   "    ldx  #$F4B2
F2C8 : 20 26    " &"    bra  LF2F0
        ;
F2CA        LF2CA:
F2CA : BD F3 30    "  0"    jsr  LF330
F2CD : BD F3 49    "  I"    jsr  LF349
F2D0 : 39    "9"    rts
        ;
F2D1        XF2D1:
F2D1 : CE F4 B8    "   "    ldx  #$F4B8
F2D4 : 20 F4    "  "    bra  LF2CA
        ;
F2D6 : C6 FF    "  "    ldab  #$FF
F2D8 : D7 09    "  "    stab  X0009
F2DA        LF2DA:
F2DA : CE F4 BE    "   "    ldx  #$F4BE
F2DD : 8D EB    "  "    bsr  LF2CA
F2DF : CE F4 C4    "   "    ldx  #$F4C4
F2E2 : 8D E6    "  "    bsr  LF2CA
F2E4 : 5A    "Z"    decb
F2E5 : 26 F3    "& "    bne  LF2DA
F2E7 : 39    "9"    rts
        ;
F2E8 : CE F4 CA    "   "    ldx  #$F4CA
F2EB : 20 DD    "  "    bra  LF2CA
        ;
F2ED : CE F4 D6    "   "    ldx  #$F4D6
F2F0        LF2F0:
F2F0 : 8D D8    "  "    bsr  LF2CA
F2F2 : 8D 30    " 0"    bsr  LF324
F2F4 : 20 FA    "  "    bra  LF2F0
        ;
F2F6 : 86 FF    "  "    ldaa  #$FF
F2F8 : 97 09    "  "    staa  X0009
F2FA : CE F4 DC    "   "    ldx  #$F4DC
F2FD : 20 F1    "  "    bra  LF2F0
        ;
F2FF : 86 FF    "  "    ldaa  #$FF
F301 : 97 09    "  "    staa  X0009
F303 : CE F4 D0    "   "    ldx  #$F4D0
F306 : 20 E8    "  "    bra  LF2F0
        ;
F308        XF308:
F308 : C6 30    " 0"    ldab  #$30
F30A : CE F4 E2    "   "    ldx  #$F4E2
F30D : 8D 21    " !"    bsr  LF330
F30F        LF30F:
F30F : 96 06    "  "    ldaa  X0006
F311 : 48    "H"    asla
F312 : 9B 06    "  "    adda  X0006
F314 : 8B 0B    "  "    adda  #$0B
F316 : 97 06    "  "    staa  X0006
F318 : 44    "D"    lsra
F319 : 44    "D"    lsra
F31A : 8B 0C    "  "    adda  #$0C
F31C : 97 13    "  "    staa  X0013
F31E : 8D 29    " )"    bsr  LF349
F320 : 5A    "Z"    decb
F321 : 26 EC    "& "    bne  LF30F
F323 : 39    "9"    rts
        ;
F324        LF324:
F324 : 96 09    "  "    ldaa  X0009
F326 : 80 08    "  "    suba  #$08
F328 : 2A 03    "* "    bpl  LF32D
F32A : 97 09    "  "    staa  X0009
F32C        LF32C:
F32C : 39    "9"    rts
        ;
F32D        LF32D:
F32D : 32    "2"    pula
F32E : 32    "2"    pula
F32F : 39    "9"    rts
        ;
F330        LF330:
F330 : A6 00    "  "    ldaa  $00,x
F332 : 97 13    "  "    staa  X0013
F334 : A6 01    "  "    ldaa  $01,x
F336 : 97 14    "  "    staa  X0014
F338 : A6 02    "  "    ldaa  $02,x
F33A : 97 15    "  "    staa  X0015
F33C : A6 03    "  "    ldaa  $03,x
F33E : 97 16    "  "    staa  X0016
F340 : A6 04    "  "    ldaa  $04,x
F342 : 97 17    "  "    staa  X0017
F344 : A6 05    "  "    ldaa  $05,x
F346 : 97 18    "  "    staa  X0018
F348 : 39    "9"    rts
        ;
F349        LF349:
F349 : 96 09    "  "    ldaa  X0009
F34B : 37    "7"    pshb
F34C : D6 17    "  "    ldab  X0017
F34E : D7 19    "  "    stab  X0019
F350 : D6 14    "  "    ldab  X0014
F352 : D7 1A    "  "    stab  X001A
F354        LF354:
F354 : 43    "C"    coma
F355 : D6 13    "  "    ldab  X0013
F357 : B7 04 00    "   "    staa  X0400
F35A        LF35A:
F35A : 5A    "Z"    decb
F35B : 26 FD    "& "    bne  LF35A
F35D : 43    "C"    coma
F35E : D6 13    "  "    ldab  X0013
F360 : 20 00    "  "    bra  LF362
        ;
F362        LF362:
F362 : 08    " "    inx
F363 : 09    " "    dex
F364 : 08    " "    inx
F365 : 09    " "    dex
F366 : B7 04 00    "   "    staa  X0400
F369        LF369:
F369 : 5A    "Z"    decb
F36A : 26 FD    "& "    bne  LF369
F36C : 7A 00 1A    "z  "    dec  X001A
F36F : 27 16    "' "    beq  LF387
F371 : 7A 00 19    "z  "    dec  X0019
F374 : 26 DE    "& "    bne  LF354
F376 : 43    "C"    coma
F377 : D6 17    "  "    ldab  X0017
F379 : B7 04 00    "   "    staa  X0400
F37C : D7 19    "  "    stab  X0019
F37E : D6 13    "  "    ldab  X0013
F380 : 9B 18    "  "    adda  X0018
F382 : 2B 1E    "+ "    bmi  LF3A2
F384 : 01    " "    nop
F385 : 20 15    "  "    bra  LF39C
        ;
F387        LF387:
F387 : 08    " "    inx
F388 : 09    " "    dex
F389 : 01    " "    nop
F38A : 43    "C"    coma
F38B : D6 14    "  "    ldab  X0014
F38D : B7 04 00    "   "    staa  X0400
F390 : D7 1A    "  "    stab  X001A
F392 : D6 13    "  "    ldab  X0013
F394 : D0 15    "  "    subb  X0015
F396 : D1 16    "  "    cmpb  X0016
F398 : D1 16    "  "    cmpb  X0016
F39A : 27 06    "' "    beq  LF3A2
F39C        LF39C:
F39C : D7 13    "  "    stab  X0013
F39E : C0 05    "  "    subb  #$05
F3A0 : 20 B8    "  "    bra  LF35A
        ;
F3A2        LF3A2:
F3A2 : 33    "3"    pulb
F3A3 : 39    "9"    rts
        ;
F3A4 : DA FF    "  "    orab  X00FF
F3A6 : DA 80    "  "    orab  X0080
F3A8 : 26 01    "& "    bne  LF3AB
F3AA : 26 80    "& "    bne  LF32C
F3AC : 07    " "    tpa
F3AD : 0A    " "    clv
F3AE : 07    " "    tpa
        ;
F3AF : 00    " "    db  $00
        ;
F3B0 : F9 F6 F9    "   "    adcb  XF6F9
        ;
F3B3 : 00 3A    " :"    db  $00, $3A
        ;
F3B5 : 3E    ">"    wai
F3B6 : 50    "P"    negb
F3B7 : 46    "F"    rora
F3B8 : 33    "3"    pulb
F3B9 : 2C 27    ",'"    bge  LF3E2
F3BB : 20 25    " %"    bra  LF3E2
        ;
F3BD : 1C 1A    "  "    db  $1C, $1A
        ;
F3BF : 17    " "    tba
        ;
F3C0 : 14    " "    db  $14
        ;
F3C1 : 11    " "    cba
F3C2 : 10    " "    sba
F3C3 : 33    "3"    pulb
F3C4 : 08    " "    inx
        ;
F3C5 : 03 02    "  "    db  $03, $02
        ;
F3C7 : 01    " "    nop
        ;
F3C8 : 02 03 04 05  "    "    db  $02, $03, $04, $05
        ;
F3CC : 06    " "    tap
F3CD : 0A    " "    clv
        ;
F3CE : 1E    " "    db  $1E
        ;
F3CF : 32    "2"    pula
F3D0 : 70 00 FF    "p  "    neg  X00FF
F3D3 : FF FF 90    "   "    stx  XFF90
F3D6 : FF FF FF    "   "    stx  XFFFF
F3D9 : FF FF FF    "   "    stx  XFFFF
F3DC : FF 90 FF    "   "    stx  X90FF
F3DF : FF FF FF    "   "    stx  XFFFF
F3E2        LF3E2:
F3E2 : FF FF FF    "   "    stx  XFFFF
F3E5 : FF 00 00    "   "    stx  X0000
        ;
F3E8 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F3EC : 00 00    "  "    db  $00, $00
        ;
F3EE : 48    "H"    asla
F3EF : 01    " "    nop
        ;
F3F0 : 00 00    "  "    db  $00, $00
        ;
F3F2 : 3F    "?"    swi
F3F3 : 3F    "?"    swi
        ;
F3F4 : 00 00    "  "    db  $00, $00
        ;
F3F6 : 48    "H"    asla
F3F7 : 01    " "    nop
        ;
F3F8 : 00 00    "  "    db  $00, $00
        ;
F3FA : 01    " "    nop
F3FB : 08    " "    inx
        ;
F3FC : 00 00    "  "    db  $00, $00
        ;
F3FE : 81 01    "  "    cmpa  #$01
        ;
F400 : 00 00    "  "    db  $00, $00
        ;
F402 : 01    " "    nop
F403 : FF 00 00    "   "    stx  X0000
F406 : 01    " "    nop
F407 : 08    " "    inx
        ;
F408 : 00 00    "  "    db  $00, $00
        ;
F40A : 01    " "    nop
F40B : 10    " "    sba
        ;
F40C : 00 00    "  "    db  $00, $00
        ;
F40E : 3F    "?"    swi
F40F : 3F    "?"    swi
        ;
F410 : 00 00    "  "    db  $00, $00
        ;
F412 : 01    " "    nop
F413 : 10    " "    sba
        ;
F414 : 00 00 05 05  "    "    db  $00, $00, $05, $05
F418 : 00 00    "  "    db  $00, $00
        ;
F41A : 01    " "    nop
F41B : 01    " "    nop
        ;
F41C : 00 00    "  "    db  $00, $00
        ;
F41E : 31    "1"    ins
F41F : FF 00 00    "   "    stx  X0000
        ;
F422 : 05 05 00 00  "    "    db  $05, $05, $00, $00
        ;
F426 : 30    "0"    tsx
        ;
F427 : 00 00 00    "   "    db  $00, $00, $00
        ;
F42A : 7F 00 00    "   "    clr  X0000
        ;
F42D : 00    " "    db  $00
        ;
F42E : 30    "0"    tsx
        ;
F42F : 00 00 00    "   "    db  $00, $00, $00
        ;
F432 : 01    " "    nop
        ;
F433 : 00 00 00    "   "    db  $00, $00, $00
        ;
F436 : 7F 00 00    "   "    clr  X0000
        ;
F439 : 00 02 00 00  "    "    db  $00, $02, $00, $00
F43D : 00    " "    db  $00
        ;
F43E : 01    " "    nop
        ;
F43F : 00 00 00 04  "    "    db  $00, $00, $00, $04
F443 : 00 00 04    "   "    db  $00, $00, $04
        ;
F446 : 7F 00 00    "   "    clr  X0000
F449 : 7F 04 00    "   "    clr  X0400
        ;
F44C : 00 04    "  "    db  $00, $04
        ;
F44E : FF 00 00    "   "    stx  X0000
F451 : A0 00    "  "    suba  $00,x
        ;
F453 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F457 : 00 00 00    "   "    db  $00, $00, $00
        ;
F45A : FF 00 00    "   "    stx  X0000
F45D : A0 0C    "  "    suba  $0C,x
F45F : 68 68    "hh"    asl  $68,x
        ;
F461 : 00    " "    db  $00
        ;
F462 : 07    " "    tpa
        ;
F463 : 1F    " "    db  $1F
        ;
F464 : 0F    " "    sei
        ;
F465 : 00    " "    db  $00
        ;
F466 : 0C    " "    clc
F467 : 80 80    "  "    suba  #$80
        ;
F469 : 00    " "    db  $00
        ;
F46A : FF FF FF    "   "    stx  XFFFF
        ;
F46D : 00 00 00 00  "    "    db  $00, $00, $00, $00
F471 : 00 00 00 00  "    "    db  $00, $00, $00, $00
F475 : 00    " "    db  $00
        ;
F476 : FF FF FF    "   "    stx  XFFFF
        ;
F479 : 00    " "    db  $00
        ;
F47A : 01    " "    nop
        ;
F47B : 04 00 00    "   "    db  $04, $00, $00
        ;
F47E : 3F    "?"    swi
F47F : 7F 00 00    "   "    clr  X0000
F482 : 01    " "    nop
        ;
F483 : 04 00 00 05  "    "    db  $04, $00, $00, $05
        ;
F487 : FF 00 00    "   "    stx  X0000
F48A : 01    " "    nop
        ;
F48B : 00 00 00    "   "    db  $00, $00, $00
        ;
F48E : 48    "H"    asla
        ;
F48F : 00 00 00 05  "    "    db  $00, $00, $00, $05
        ;
F493 : FF 00 00    "   "    stx  X0000
        ;
F496 : 02    " "    db  $02
        ;
F497 : 80 00    "  "    suba  #$00
F499 : 30    "0"    tsx
F49A : 0A    " "    clv
F49B : 7F 00 7F    "   "    clr  X007F
        ;
F49E : 02    " "    db  $02
        ;
F49F : 80 00    "  "    suba  #$00
F4A1 : 30    "0"    tsx
F4A2 : C0 80    "  "    subb  #$80
        ;
F4A4 : 00    " "    db  $00
        ;
F4A5 : 20 01    "  "    bra  LF4A8
        ;
F4A7 : 10    " "    sba
        ;
F4A8        LF4A8:
F4A8 : 00 15    "  "    db  $00, $15
        ;
F4AA : C0 10    "  "    subb  #$10
        ;
F4AC : 00 00    "  "    db  $00, $00
        ;
F4AE : C0 80    "  "    subb  #$80
        ;
F4B0 : 00 00    "  "    db  $00, $00
        ;
F4B2 : FF 01 02    "   "    stx  X0102
        ;
F4B5 : C3    " "    db  $C3
        ;
F4B6 : FF 00 01    "   "    stx  X0001
        ;
F4B9 : 03    " "    db  $03
        ;
F4BA : FF 80 FF    "   "    stx  X80FF
        ;
F4BD : 00    " "    db  $00
        ;
F4BE : 20 03    "  "    bra  LF4C3
        ;
F4C0 : FF 50 FF    " P "    stx  X50FF
        ;
F4C3        LF4C3:
F4C3 : 00    " "    db  $00
        ;
F4C4 : 50    "P"    negb
        ;
F4C5 : 03    " "    db  $03
        ;
F4C6 : 01    " "    nop
F4C7 : 20 FF    "  "    bra  LF4C8
        ;
F4C9 : 00    " "    db  $00
        ;
F4CA : FE 04 02    "   "    ldx  X0402
        ;
F4CD : 04    " "    db  $04
        ;
F4CE : FF 00 48    "  H"    stx  X0048
        ;
F4D1 : 03    " "    db  $03
        ;
F4D2 : 01    " "    nop
F4D3 : 0C    " "    clc
F4D4 : FF 00 48    "  H"    stx  X0048
        ;
F4D7 : 02    " "    db  $02
        ;
F4D8 : 01    " "    nop
F4D9 : 0C    " "    clc
F4DA : FF 00 E0    "   "    stx  X00E0
F4DD : 01    " "    nop
        ;
F4DE : 02    " "    db  $02
        ;
F4DF : 10    " "    sba
F4E0 : FF 00 50    "  P"    stx  X0050
F4E3 : FF 00 00    "   "    stx  X0000
F4E6 : 60 80    "` "    neg  $80,x
F4E8 : FF 02 01    "   "    stx  X0201
F4EB : 06    " "    tap
F4EC : FF 00 16    "   "    stx  X0016
F4EF : 48    "H"    asla
F4F0 : 48    "H"    asla
F4F1 : 48    "H"    asla
F4F2 : 1B    " "    aba
F4F3 : CE 00 12    "   "    ldx  #$0012
F4F6 : DF 0E    "  "    stx  X000E
F4F8 : CE FC 08    "   "    ldx  #$FC08
F4FB : BD FB 92    "   "    jsr  LFB92
F4FE : C6 09    "  "    ldab  #$09
F500 : 7E F9 65    "~ e"    jmp  LF965
        ;
F503        LF503:
F503 : 96 1A    "  "    ldaa  X001A
F505 : B7 04 00    "   "    staa  X0400
F508        LF508:
F508 : 96 12    "  "    ldaa  X0012
F50A : 97 1B    "  "    staa  X001B
F50C : 96 13    "  "    ldaa  X0013
F50E : 97 1C    "  "    staa  X001C
F510        LF510:
F510 : DE 17    "  "    ldx  X0017
F512        LF512:
F512 : 96 1B    "  "    ldaa  X001B
F514 : 73 04 00    "s  "    com  X0400
F517        LF517:
F517 : 09    " "    dex
F518 : 27 10    "' "    beq  LF52A
F51A : 4A    "J"    deca
F51B : 26 FA    "& "    bne  LF517
F51D : 73 04 00    "s  "    com  X0400
F520 : 96 1C    "  "    ldaa  X001C
F522        LF522:
F522 : 09    " "    dex
F523 : 27 05    "' "    beq  LF52A
F525 : 4A    "J"    deca
F526 : 26 FA    "& "    bne  LF522
F528 : 20 E8    "  "    bra  LF512
        ;
F52A        LF52A:
F52A : B6 04 00    "   "    ldaa  X0400
F52D : 2B 01    "+ "    bmi  LF530
F52F : 43    "C"    coma
F530        LF530:
F530 : 8B 00    "  "    adda  #$00
F532 : B7 04 00    "   "    staa  X0400
F535 : 96 1B    "  "    ldaa  X001B
F537 : 9B 14    "  "    adda  X0014
F539 : 97 1B    "  "    staa  X001B
F53B : 96 1C    "  "    ldaa  X001C
F53D : 9B 15    "  "    adda  X0015
F53F : 97 1C    "  "    staa  X001C
F541 : 91 16    "  "    cmpa  X0016
F543 : 26 CB    "& "    bne  LF510
F545 : 96 19    "  "    ldaa  X0019
F547 : 27 06    "' "    beq  LF54F
F549 : 9B 12    "  "    adda  X0012
F54B : 97 12    "  "    staa  X0012
F54D : 26 B9    "& "    bne  LF508
F54F        LF54F:
F54F : 39    "9"    rts
        ;
F550 : 86 FF    "  "    ldaa  #$FF
F552 : 97 19    "  "    staa  X0019
F554 : 86 60    " `"    ldaa  #$60
F556 : C6 FF    "  "    ldab  #$FF
F558 : 20 12    "  "    bra  LF56C
        ;
F55A : 86 01    "  "    ldaa  #$01
F55C : 97 19    "  "    staa  X0019
F55E : C6 03    "  "    ldab  #$03
F560 : 20 0A    "  "    bra  LF56C
        ;
F562 : 86 FE    "  "    ldaa  #$FE
F564 : 97 19    "  "    staa  X0019
F566 : 86 C0    "  "    ldaa  #$C0
F568 : C6 10    "  "    ldab  #$10
F56A : 20 00    "  "    bra  LF56C
        ;
F56C        LF56C:
F56C : 97 18    "  "    staa  X0018
F56E : 86 FF    "  "    ldaa  #$FF
F570 : B7 04 00    "   "    staa  X0400
F573 : D7 14    "  "    stab  X0014
F575        LF575:
F575 : D6 14    "  "    ldab  X0014
F577        LF577:
F577 : 96 06    "  "    ldaa  X0006
F579 : 44    "D"    lsra
F57A : 44    "D"    lsra
F57B : 44    "D"    lsra
F57C : 98 06    "  "    eora  X0006
F57E : 44    "D"    lsra
F57F : 76 00 05    "v  "    ror  X0005
F582 : 76 00 06    "v  "    ror  X0006
F585 : 24 03    "$ "    bcc  LF58A
F587 : 73 04 00    "s  "    com  X0400
F58A        LF58A:
F58A : 96 18    "  "    ldaa  X0018
F58C        LF58C:
F58C : 4A    "J"    deca
F58D : 26 FD    "& "    bne  LF58C
F58F : 5A    "Z"    decb
F590 : 26 E5    "& "    bne  LF577
F592 : 96 18    "  "    ldaa  X0018
F594 : 9B 19    "  "    adda  X0019
F596 : 97 18    "  "    staa  X0018
F598 : 26 DB    "& "    bne  LF575
F59A : 39    "9"    rts
        ;
F59B        XF59B:
F59B : 86 20    "  "    ldaa  #$20
F59D : 97 14    "  "    staa  X0014
F59F : 97 17    "  "    staa  X0017
F5A1 : 86 01    "  "    ldaa  #$01
F5A3 : CE 00 01    "   "    ldx  #$0001
F5A6 : C6 FF    "  "    ldab  #$FF
F5A8 : 20 00    "  "    bra  LF5AA
        ;
F5AA        LF5AA:
F5AA : 97 12    "  "    staa  X0012
F5AC        LF5AC:
F5AC : DF 15    "  "    stx  X0015
F5AE        LF5AE:
F5AE : D7 13    "  "    stab  X0013
F5B0 : D6 14    "  "    ldab  X0014
F5B2        LF5B2:
F5B2 : 96 06    "  "    ldaa  X0006
F5B4 : 44    "D"    lsra
F5B5 : 44    "D"    lsra
F5B6 : 44    "D"    lsra
F5B7 : 98 06    "  "    eora  X0006
F5B9 : 44    "D"    lsra
F5BA : 76 00 05    "v  "    ror  X0005
F5BD : 76 00 06    "v  "    ror  X0006
F5C0 : 86 00    "  "    ldaa  #$00
F5C2 : 24 02    "$ "    bcc  LF5C6
F5C4 : 96 13    "  "    ldaa  X0013
F5C6        LF5C6:
F5C6 : B7 04 00    "   "    staa  X0400
F5C9 : DE 15    "  "    ldx  X0015
F5CB        LF5CB:
F5CB : 09    " "    dex
F5CC : 26 FD    "& "    bne  LF5CB
F5CE : 5A    "Z"    decb
F5CF : 26 E1    "& "    bne  LF5B2
F5D1 : D6 13    "  "    ldab  X0013
F5D3 : D0 12    "  "    subb  X0012
F5D5 : 27 09    "' "    beq  LF5E0
F5D7 : DE 15    "  "    ldx  X0015
F5D9 : 08    " "    inx
F5DA : 96 17    "  "    ldaa  X0017
F5DC : 27 D0    "' "    beq  LF5AE
F5DE : 20 CC    "  "    bra  LF5AC
F5E0        LF5E0:
F5E0 : 39    "9"    rts
        ;
F5E1 : CE F6 00    "   "    ldx  #$F600
F5E4 : DF 23    " #"    stx  X0023
F5E6 : BD F7 2A    "  *"    jsr  LF72A
F5E9 : CE A5 00    "   "    ldx  #$A500
F5EC : DF 05    "  "    stx  X0005
F5EE : CE F6 29    "  )"    ldx  #$F629
F5F1 : BD F6 33    "  3"    jsr  LF633
F5F4 : BD F6 CE    "   "    jsr  LF6CE
F5F7 : CE F6 2E    "  ."    ldx  #$F62E
F5FA        XF5FA:
F5FA : BD F6 33    "  3"    jsr  LF633
F5FD : 7E F6 DB    "~  "    jmp  LF6DB
        ;
F600 : 90 10    "  "    suba  X0010
        ;
F602 : 02 14    "  "    db  $02, $14
        ;
F604 : 40    "@"    nega
F605 : B4 40 FF    " @ "    anda  X40FF
        ;
F608 : 14    " "    db  $14
        ;
F609 : 30    "0"    tsx
F60A : D0 32    " 2"    subb  X0032
        ;
F60C : 02    " "    db  $02
        ;
F60D : 10    " "    sba
F60E : 60 EE    "` "    neg  $EE,x
F610 : 20 02    "  "    bra  LF614
        ;
F612 : 08    " "    inx
F613 : 54    "T"    lsrb
F614        LF614:
F614 : E9 54    " T"    adcb  $54,x
F616 : FF 20 28    "  ("    stx  X2028
F619 : C0 30    " 0"    subb  #$30
        ;
F61B : 02 14    "  "    db  $02, $14
        ;
F61D : 58    "X"    aslb
F61E : AC 20    "  "    cpx  $20,x
        ;
F620 : 02    " "    db  $02
        ;
F621 : 08    " "    inx
F622 : 58    "X"    aslb
F623 : A6 58    " X"    ldaa  $58,x
F625 : FF 18 22    "  ""    stx  X1822
        ;
F628 : 00    " "    db  $00
        ;
F629 : 30    "0"    tsx
F62A : 10    " "    sba
        ;
F62B : FC 00    "  "    db  $FC, $00
        ;
F62D : 01    " "    nop
F62E : 30    "0"    tsx
        ;
F62F : FC    " "    db  $FC
        ;
F630 : 01    " "    nop
        ;
F631 : 00    " "    db  $00
        ;
F632 : 01    " "    nop
F633        LF633:
F633 : A6 00    "  "    ldaa  $00,x
F635 : 97 2A    " *"    staa  X002A
F637 : A6 01    "  "    ldaa  $01,x
F639 : 97 13    "  "    staa  X0013
F63B : A6 02    "  "    ldaa  $02,x
F63D : 97 12    "  "    staa  X0012
F63F : A6 03    "  "    ldaa  $03,x
F641 : 97 17    "  "    staa  X0017
F643 : A6 04    "  "    ldaa  $04,x
F645 : 97 2F    " /"    staa  X002F
F647        LF647:
F647 : 39    "9"    rts
        ;
F648 : 8D E9    "  "    bsr  LF633
F64A : 8D 30    " 0"    bsr  LF67C
F64C        LF64C:
F64C : 8D 58    " X"    bsr  LF6A6
F64E : 96 2E    " ."    ldaa  X002E
F650 : 91 2F    " /"    cmpa  X002F
F652 : 26 F8    "& "    bne  LF64C
F654 : 59    "Y"    rolb
F655 : F7 04 00    "   "    stab  X0400
F658 : 8D 2D    " -"    bsr  LF687
F65A : 8D 38    " 8"    bsr  LF694
F65C : 8D 5C    " \"    bsr  LF6BA
F65E : 7D 00 13    "}  "    tst  X0013
F661 : 27 E4    "' "    beq  LF647
F663 : 7D 00 14    "}  "    tst  X0014
F666 : 26 E4    "& "    bne  LF64C
F668 : 7D 00 17    "}  "    tst  X0017
F66B : 27 DF    "' "    beq  LF64C
F66D : 2B 05    "+ "    bmi  LF674
F66F : 7C 00 2F    "| /"    inc  X002F
F672 : 20 D8    "  "    bra  LF64C
        ;
F674        LF674:
F674 : 7A 00 2F    "z /"    dec  X002F
F677 : 7A 00 2E    "z ."    dec  X002E
F67A : 20 D0    "  "    bra  LF64C
        ;
F67C        LF67C:
F67C : 7F 00 14    "   "    clr  X0014
F67F : 96 2F    " /"    ldaa  X002F
F681 : 97 2E    " ."    staa  X002E
F683 : 7F 00 2D    "  -"    clr  X002D
F686 : 39    "9"    rts
        ;
F687        LF687:
F687 : 96 06    "  "    ldaa  X0006
F689 : 44    "D"    lsra
F68A : 44    "D"    lsra
F68B : 44    "D"    lsra
F68C : 98 06    "  "    eora  X0006
F68E : 97 28    " ("    staa  X0028
F690 : 08    " "    inx
F691 : 84 07    "  "    anda  #$07
F693 : 39    "9"    rts
        ;
F694        LF694:
F694 : 96 28    " ("    ldaa  X0028
F696 : 44    "D"    lsra
F697 : 76 00 05    "v  "    ror  X0005
F69A : 76 00 06    "v  "    ror  X0006
F69D : 86 00    "  "    ldaa  #$00
F69F : 24 02    "$ "    bcc  LF6A3
F6A1 : 96 13    "  "    ldaa  X0013
F6A3        LF6A3:
F6A3 : 97 2D    " -"    staa  X002D
F6A5 : 39    "9"    rts
        ;
F6A6        LF6A6:
F6A6 : 96 2F    " /"    ldaa  X002F
F6A8 : 7A 00 2E    "z ."    dec  X002E
F6AB : 27 04    "' "    beq  LF6B1
F6AD : 08    " "    inx
F6AE : 09    " "    dex
F6AF : 20 08    "  "    bra  LF6B9
        ;
F6B1        LF6B1:
F6B1 : 97 2E    " ."    staa  X002E
F6B3 : D6 2D    " -"    ldab  X002D
F6B5 : 54    "T"    lsrb
F6B6 : 7C 00 14    "|  "    inc  X0014
F6B9        LF6B9:
F6B9 : 39    "9"    rts
        ;
F6BA        LF6BA:
F6BA : 96 2A    " *"    ldaa  X002A
F6BC : 91 14    "  "    cmpa  X0014
F6BE : 27 04    "' "    beq  LF6C4
F6C0 : 08    " "    inx
F6C1 : 09    " "    dex
F6C2 : 20 09    "  "    bra  LF6CD
        ;
F6C4        LF6C4:
F6C4 : 7F 00 14    "   "    clr  X0014
F6C7 : 96 13    "  "    ldaa  X0013
F6C9 : 90 12    "  "    suba  X0012
F6CB : 97 13    "  "    staa  X0013
F6CD        LF6CD:
F6CD : 39    "9"    rts
        ;
F6CE        LF6CE:
F6CE : 7F 00 21    "  !"    clr  X0021
F6D1 : 7F 00 2B    "  +"    clr  X002B
F6D4 : 86 0E    "  "    ldaa  #$0E
F6D6 : 97 22    " ""    staa  X0022
F6D8 : 7F 00 27    "  '"    clr  X0027
F6DB        LF6DB:
F6DB : 8D 9F    "  "    bsr  LF67C
F6DD        LF6DD:
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
        ;
F6FB        LF6FB:
F6FB : 96 26    " &"    ldaa  X0026
F6FD : 7A 00 22    "z ""    dec  X0022
F700 : 27 07    "' "    beq  LF709
F702 : B6 00 13    "   "    ldaa  X0013
F705 : 26 0A    "& "    bne  LF711
F707 : 20 68    " h"    bra  LF771
        ;
F709        LF709:
F709 : 97 22    " ""    staa  X0022
F70B : 96 21    " !"    ldaa  X0021
F70D : 9B 2B    " +"    adda  X002B
F70F : 97 21    " !"    staa  X0021
F711        LF711:
F711 : 39    "9"    rts
        ;
F712        LF712:
F712 : 96 21    " !"    ldaa  X0021
F714 : 91 29    " )"    cmpa  X0029
F716 : 27 07    "' "    beq  LF71F
F718 : 08    " "    inx
F719 : 96 13    "  "    ldaa  X0013
F71B : 26 2A    "&*"    bne  LF747
F71D : 20 29    " )"    bra  LF748
        ;
F71F        LF71F:
F71F : 7F 00 21    "  !"    clr  X0021
F722 : 7F 00 2B    "  +"    clr  X002B
F725 : 7F 00 27    "  '"    clr  X0027
F728 : DE 23    " #"    ldx  X0023
F72A        LF72A:
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
F747        LF747:
F747 : 39    "9"    rts
        ;
F748        LF748:
F748 : 32    "2"    pula
F749 : 32    "2"    pula
F74A : 39    "9"    rts
        ;
F74B        LF74B:
F74B : 96 20    "  "    ldaa  X0020
F74D : 27 06    "' "    beq  LF755
F74F : 91 13    "  "    cmpa  X0013
F751 : 26 04    "& "    bne  LF757
F753 : 20 03    "  "    bra  LF758
        ;
F755        LF755:
F755 : 08    " "    inx
F756 : 09    " "    dex
F757        LF757:
F757 : 39    "9"    rts
        ;
F758        LF758:
F758 : 7F 00 20    "   "    clr  X0020
F75B : 96 25    " %"    ldaa  X0025
F75D : 97 21    " !"    staa  X0021
F75F : 96 2C    " ,"    ldaa  X002C
F761 : 97 2B    " +"    staa  X002B
F763 : 39    "9"    rts
        ;
F764        LF764:
F764 : 96 27    " '"    ldaa  X0027
F766 : 9B 21    " !"    adda  X0021
F768 : 97 27    " '"    staa  X0027
F76A : 2A 01    "* "    bpl  LF76D
F76C : 43    "C"    coma
F76D        LF76D:
F76D : 1B    " "    aba
F76E : B7 04 00    "   "    staa  X0400
F771        LF771:
F771 : 39    "9"    rts
        ;
F772        LF772:
F772 : C6 01    "  "    ldab  #$01
F774 : D7 00    "  "    stab  X0000
F776 : CE F7 85    "   "    ldx  #$F785
F779 : 20 2A    " *"    bra  LF7A5
        ;
F77B : CE F7 8B    "   "    ldx  #$F78B
F77E : 20 25    " %"    bra  LF7A5
        ;
F780 : CE F7 91    "   "    ldx  #$F791
F783 : 20 20    "  "    bra  LF7A5
        ;
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
        ;
F7A7 : 97 19    "  "    staa  X0019
F7A9 : A6 01    "  "    ldaa  $01,x
F7AB : 97 15    "  "    staa  X0015
F7AD : A6 02    "  "    ldaa  $02,x
F7AF : E6 03    "  "    ldab  $03,x
F7B1 : EE 04    "  "    ldx  $04,x
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
        ;
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
        ;
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
        ;
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
        ;
F8C9 : 7A 00 04    "z  "    dec  X0004
F8CC : 39    "9"    rts
        ;
F8CD        LF8CD:
F8CD : 8D 03    "  "    bsr  LF8D2
F8CF : 7E FB 7F    "~  "    jmp  LFB7F
        ;
F8D2        LF8D2:
F8D2 : 7F 00 04    "   "    clr  X0004
F8D5 : 97 10    "  "    staa  X0010
F8D7 : CE FC 57    "  W"    ldx  #$FC57
F8DA        LF8DA:
F8DA : A6 00    "  "    ldaa  $00,x
F8DC : 27 2D    "'-"    beq  LF90B
F8DE : 7A 00 10    "z  "    dec  X0010
F8E1 : 27 06    "' "    beq  LF8E9
F8E3 : 4C    "L"    inca
F8E4 : BD FB 92    "   "    jsr  LFB92
F8E7 : 20 F1    "  "    bra  LF8DA
        ;
F8E9        LF8E9:
F8E9 : 08    " "    inx
F8EA : DF 0E    "  "    stx  X000E
F8EC : BD FB 92    "   "    jsr  LFB92
F8EF : DF 0C    "  "    stx  X000C
F8F1 : DE 0E    "  "    ldx  X000E
F8F3        LF8F3:
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
F90B        LF90B:
F90B : 39    "9"    rts
F90C : 39    "9"    rts
        ;
F90D        LF90D:
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
F929        LF929:
F929 : C6 7E    " ~"    ldab  #$7E
F92B : E7 00    "  "    stab  $00,x
F92D : C6 F9    "  "    ldab  #$F9
F92F : E7 01    "  "    stab  $01,x
F931 : C6 37    " 7"    ldab  #$37
F933 : E7 02    "  "    stab  $02,x
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
F964        LF964:
F964 : 39    "9"    rts
        ;
F965        LF965:
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
        ;
F979 : 4F    "O"    clra
F97A : 97 00    "  "    staa  X0000
F97C : 97 01    "  "    staa  X0001
F97E : 39    "9"    rts
        ;
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
        ;
F98F        LF98F:
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
        ;
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
        ;
F9CC : 96 03    "  "    ldaa  X0003
F9CE : 26 09    "& "    bne  LF9D9
F9D0 : 7C 00 03    "|  "    inc  X0003
F9D3 : 86 0D    "  "    ldaa  #$0D
F9D5 : 8D 05    "  "    bsr  LF9DC
F9D7 : 20 69    " i"    bra  LFA42
F9D9        LF9D9:
F9D9 : 7E FA 89    "~  "    jmp  LFA89
        ;
F9DC        LF9DC:
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
        ;
FA42        LFA42:
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
        ;
FAD0        LFAD0:
FAD0 : CE 00 23    "  #"    ldx  #$0023
FAD3 : DF 0E    "  "    stx  X000E
FAD5 : DE 17    "  "    ldx  X0017
FAD7 : E6 00    "  "    ldab  $00,x
FAD9 : 08    " "    inx
FADA : BD F9 65    "  e"    jsr  LF965
FADD : DE 0E    "  "    ldx  X000E
FADF : DF 1E    "  "    stx  X001E
FAE1 : 39    "9"    rts
        ;
FAE2        LFAE2:
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
        ;
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
        ;
FB92        LFB92:
FB92 : DF 0C    "  "    stx  X000C
FB94 : 9B 0D    "  "    adda  X000D
FB96 : 97 0D    "  "    staa  X000D
FB98 : 24 03    "$ "    bcc  LFB9D
FB9A : 7C 00 0C    "|  "    inc  X000C
FB9D        LFB9D:
FB9D : DE 0C    "  "    ldx  X000C
FB9F : 39    "9"    rts
        ;
FBA0        LFBA0:
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
        ;
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
FC07 : A2 40    " @"    sbca  $40,x
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
FC45 : FE 80 8C    "   "    ldx  X808C
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
FC56 : 8C 1C F8    "   "    cpx  #$1CF8
        ;
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
        ;
FC74 : B0 1F 1D    "   "    suba  X1F1D
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
        ;
FD25 : 00    " "    db  $00
        ;
FD26 : 47    "G"    asra
FD27 : 3F    "?"    swi
FD28 : 37    "7"    pshb
FD29 : 30    "0"    tsx
FD2A : 29 23    ")#"    bvs  LFD4F
        ;
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
        ;
FD32 : 08    " "    inx
FD33 : 7F D9 FF    "   "    clr  XD9FF
FD36 : D9 7F    "  "    adcb  X007F
FD38 : 24 00    "$ "    bcc  LFD3A
FD3A        LFD3A:
FD3A : 24 08    "$ "    bcc  LFD44
        ;
FD3C : 00    " "    db  $00
        ;
FD3D : 40    "@"    nega
FD3E : 80 00    "  "    suba  #$00
FD40 : FF 00 80    "   "    stx  X0080
FD43 : 40    "@"    nega
FD44        LFD44:
FD44 : 10    " "    sba
FD45 : 7F B0 D9    "   "    clr  XB0D9
FD48 : F5 FF F5    "   "    bitb  XFFF5
FD4B : D9 B0    "  "    adcb  X00B0
FD4D : 7F 4E 24    " N$"    clr  X4E24
FD50 : 09    " "    dex
        ;
FD51 : 00    " "    db  $00
        ;
FD52 : 09    " "    dex
FD53 : 24 4E    "$N"    bcc  LFDA3
FD55 : 10    " "    sba
FD56 : 7F C5 EC    "   "    clr  XC5EC
FD59 : E7 BF    "  "    stab  $BF,x
FD5B : 8D 6D    " m"    bsr  LFDCA
FD5D : 6A 7F    "j "    dec  $7F,x
FD5F : 94 92    "  "    anda  X0092
        ;
FD61 : 71    "q"    db  $71
        ;
FD62 : 40    "@"    nega
FD63 : 17    " "    tba
        ;
FD64 : 12    " "    db  $12
        ;
FD65 : 39    "9"    rts
        ;
FD66 : 10    " "    sba
FD67 : FF FF FF    "   "    stx  XFFFF
FD6A : FF 00 00    "   "    stx  X0000
        ;
FD6D : 00 00    "  "    db  $00, $00
        ;
FD6F : FF FF FF    "   "    stx  XFFFF
FD72 : FF 00 00    "   "    stx  X0000
        ;
FD75 : 00 00    "  "    db  $00, $00
        ;
FD77 : 48    "H"    asla
FD78 : 8A 95    "  "    oraa  #$95
FD7A : A0 AB    "  "    suba  $AB,x
FD7C : B5 BF C8    "   "    bita  XBFC8
FD7F : D1 DA    "  "    cmpb  X00DA
FD81 : E1 E8    "  "    cmpb  $E8,x
FD83 : EE F3    "  "    ldx  $F3,x
FD85 : F7 FB FD    "   "    stab  XFBFD
FD88 : FE FF FE    "   "    ldx  XFFFE
        ;
FD8B : FD    " "    db  $FD
        ;
FD8C : FB F7 F3    "   "    addb  XF7F3
FD8F : EE E8    "  "    ldx  $E8,x
FD91 : E1 DA    "  "    cmpb  $DA,x
FD93 : D1 C8    "  "    cmpb  X00C8
FD95 : BF B5 AB    "   "    sts  XB5AB
FD98 : A0 95    "  "    suba  $95,x
FD9A : 8A 7F    "  "    oraa  #$7F
        ;
FD9C : 75    "u"    db  $75
        ;
FD9D : 6A 5F    "j_"    dec  $5F,x
FD9F : 54    "T"    lsrb
FDA0 : 4A    "J"    deca
FDA1 : 40    "@"    nega
FDA2 : 37    "7"    pshb
FDA3        LFDA3:
FDA3 : 2E 25    ".%"    bgt  LFDCA
        ;
FDA5 : 1E    " "    db  $1E
        ;
FDA6 : 17    " "    tba
FDA7 : 11    " "    cba
FDA8 : 0C    " "    clc
FDA9 : 08    " "    inx
        ;
FDAA : 04 02    "  "    db  $04, $02
        ;
FDAC : 01    " "    nop
        ;
FDAD : 00    " "    db  $00
        ;
FDAE : 01    " "    nop
        ;
FDAF : 02 04    "  "    db  $02, $04
        ;
FDB1 : 08    " "    inx
FDB2 : 0C    " "    clc
FDB3 : 11    " "    cba
FDB4 : 17    " "    tba
        ;
FDB5 : 1E    " "    db  $1E
        ;
FDB6 : 25 2E    "%."    bcs  LFDE6
FDB8 : 37    "7"    pshb
FDB9 : 40    "@"    nega
FDBA : 4A    "J"    deca
FDBB : 54    "T"    lsrb
FDBC : 5F    "_"    clrb
FDBD : 6A 75    "ju"    dec  $75,x
FDBF : 7F 10 59    "  Y"    clr  X1059
        ;
FDC2 : 7B    "{"    db  $7B
        ;
FDC3 : 98 AC    "  "    eora  X00AC
        ;
FDC5 : B3    " "    db  $B3
        ;
FDC6 : AC 98    "  "    cpx  $98,x
        ;
FDC8 : 7B    "{"    db  $7B
        ;
FDC9 : 59    "Y"    rolb
FDCA        LFDCA:
FDCA : 37    "7"    pshb
FDCB : 19    " "    daa
FDCC : 06    " "    tap
        ;
FDCD : 00    " "    db  $00
        ;
FDCE : 06    " "    tap
FDCF : 19    " "    daa
FDD0 : 37    "7"    pshb
FDD1 : 08    " "    inx
FDD2 : FF FF FF    "   "    stx  XFFFF
FDD5 : FF 00 00    "   "    stx  X0000
        ;
FDD8 : 00 00    "  "    db  $00, $00
        ;
FDDA : 10    " "    sba
FDDB : 76 FF B8    "v  "    ror  XFFB8
FDDE : D0 9D    "  "    subb  X009D
FDE0 : E6 6A    " j"    ldab  $6A,x
FDE2 : 82 76    " v"    sbca  #$76
FDE4 : EA 81    "  "    orab  $81,x
FDE6        LFDE6:
FDE6 : 86 4E    " N"    ldaa  #$4E
FDE8 : 9C 32    " 2"    cpx  X0032
FDEA : 63 10    "c "    com  $10,x
        ;
FDEC : 00    " "    db  $00
        ;
FDED : F4 00 E8    "   "    andb  X00E8
        ;
FDF0 : 00 DC 00    "   "    db  $00, $DC, $00
        ;
FDF3 : E2 00    "  "    sbcb  $00,x
        ;
FDF5 : DC 00    "  "    db  $DC, $00
        ;
FDF7 : E8 00    "  "    eorb  $00,x
FDF9 : F4 00 00    "   "    andb  X0000
FDFC : 48    "H"    asla
        ;
FDFD : 45 4B    "EK"    db  $45, $4B
        ;
FDFF : 50    "P"    negb
FE00 : 56    "V"    rorb
        ;
FE01 : 5B    "["    db  $5B
        ;
FE02 : 60 64    "`d"    neg  $64,x
FE04 : 69 6D    "im"    rol  $6D,x
        ;
FE06 : 71    "q"    db  $71
        ;
FE07 : 74 77 7A    "twz"    lsr  X777A
FE0A : 7C 7E 7F    "|~ "    inc  X7E7F
FE0D : 7F 80 7F    "   "    clr  X807F
FE10 : 7F 7E 7C    " ~|"    clr  X7E7C
FE13 : 7A 77 74    "zwt"    dec  X7774
        ;
FE16 : 71    "q"    db  $71
        ;
FE17 : 6D 69    "mi"    tst  $69,x
FE19 : 64 60    "d`"    lsr  $60,x
        ;
FE1B : 5B    "["    db  $5B
        ;
FE1C : 56    "V"    rorb
FE1D : 50    "P"    negb
        ;
FE1E : 4B 45    "KE"    db  $4B, $45
        ;
FE20 : 40    "@"    nega
FE21 : 3B    ";"    rti
        ;
FE22 : 35    "5"    txs
FE23 : 30    "0"    tsx
FE24 : 2A 25    "*%"    bpl  LFE4B
FE26 : 20 1C    "  "    bra  LFE44
        ;
FE28 : 17    " "    tba
        ;
FE29 : 13    " "    db  $13
        ;
FE2A : 0F    " "    sei
FE2B : 0C    " "    clc
FE2C : 09    " "    dex
FE2D : 06    " "    tap
        ;
FE2E : 04 02    "  "    db  $04, $02
        ;
FE30 : 01    " "    nop
FE31 : 01    " "    nop
        ;
FE32 : 00    " "    db  $00
        ;
FE33 : 01    " "    nop
FE34 : 01    " "    nop
        ;
FE35 : 02 04    "  "    db  $02, $04
        ;
FE37 : 06    " "    tap
FE38 : 09    " "    dex
FE39 : 0C    " "    clc
FE3A : 0F    " "    sei
        ;
FE3B : 13    " "    db  $13
        ;
FE3C : 17    " "    tba
        ;
FE3D : 1C    " "    db  $1C
        ;
FE3E : 20 25    " %"    bra  LFE65
        ;
FE40 : 2A 30    "*0"    bpl  LFE72
FE42 : 35    "5"    txs
FE43 : 3B    ";"    rti
        ;
FE44        LFE44:
FE44 : 40    "@"    nega
FE45 : 81 24    " $"    cmpa  #$24
        ;
FE47 : 00 00 00    "   "    db  $00, $00, $00
        ;
FE4A : 16    " "    tab
FE4B        LFE4B:
FE4B : 31    "1"    ins
        ;
FE4C : 12 05 1A    "   "    db  $12, $05, $1A
        ;
FE4F : FF 00 27    "  '"    stx  X0027
FE52 : 6D 11    "m "    tst  $11,x
        ;
FE54 : 05    " "    db  $05
        ;
FE55 : 11    " "    cba
FE56 : 01    " "    nop
FE57 : 0F    " "    sei
FE58 : 01    " "    nop
FE59 : 47    "G"    asra
FE5A : 11    " "    cba
FE5B : 31    "1"    ins
        ;
FE5C : 00    " "    db  $00
        ;
FE5D : 01    " "    nop
        ;
FE5E : 00    " "    db  $00
        ;
FE5F : 0D    " "    sec
FE60 : 1B    " "    aba
FE61 : F4 12 00    "   "    andb  X1200
        ;
FE64 : 00 00 14    "   "    db  $00, $00, $14
        ;
FE67 : 47    "G"    asra
        ;
FE68 : 41 45 00 00  "AE  "    db  $41, $45, $00, $00
FE6C : 00    " "    db  $00
        ;
FE6D : 0F    " "    sei
        ;
FE6E : 5B 21    "[!"    db  $5B, $21
        ;
FE70 : 35    "5"    txs
FE71 : 11    " "    cba
FE72        LFE72:
FE72 : FF 00 0D    "   "    stx  X000D
FE75 : 1B    " "    aba
        ;
FE76 : 15 00 00 FD  "    "    db  $15, $00, $00, $FD
FE7A : 00    " "    db  $00
        ;
FE7B : 01    " "    nop
FE7C : 69 31    "i1"    rol  $31,x
FE7E : 11    " "    cba
        ;
FE7F : 00    " "    db  $00
        ;
FE80 : 01    " "    nop
        ;
FE81 : 00 03    "  "    db  $00, $03
        ;
FE83 : 6A 01    "j "    dec  $01,x
        ;
FE85 : 15    " "    db  $15
        ;
FE86 : 01    " "    nop
FE87 : 01    " "    nop
FE88 : 01    " "    nop
FE89 : 01    " "    nop
FE8A : 47    "G"    asra
FE8B : F6 53 03    " S "    ldab  X5303
        ;
FE8E : 00 02    "  "    db  $00, $02
        ;
FE90 : 06    " "    tap
FE91 : 94 6A    " j"    anda  X006A
FE93 : 10    " "    sba
        ;
FE94 : 02 00 02    "   "    db  $02, $00, $02
        ;
FE97 : 06    " "    tap
FE98 : 9A 1F    "  "    oraa  X001F
        ;
FE9A : 12 00    "  "    db  $12, $00
        ;
FE9C : FF 10 04    "   "    stx  X1004
FE9F : 69 31    "i1"    rol  $31,x
FEA1 : 11    " "    cba
        ;
FEA2 : 00    " "    db  $00
        ;
FEA3 : FF 00 0D    "   "    stx  X000D
        ;
FEA6 : 00 12    "  "    db  $00, $12
        ;
FEA8 : 06    " "    tap
        ;
FEA9 : 00    " "    db  $00
        ;
FEAA : FF 01 09    "   "    stx  X0109
FEAD : 28 14    "( "    bvc  LFEC3
FEAF : 17    " "    tba
        ;
FEB0 : 00 00 00    "   "    db  $00, $00, $00
        ;
FEB3 : 0E    " "    cli
FEB4 : 0D    " "    sec
FEB5 : F4 11 00    "   "    andb  X1100
        ;
FEB8 : 00 00    "  "    db  $00, $00
        ;
FEBA : 0E    " "    cli
FEBB : 0D    " "    sec
        ;
FEBC : 21    "!"    db  $21
        ;
FEBD : 30    "0"    tsx
        ;
FEBE : 00    " "    db  $00
        ;
FEBF : 01    " "    nop
        ;
FEC0 : 00    " "    db  $00
        ;
FEC1 : 0D    " "    sec
FEC2 : 1B    " "    aba
        ;
FEC3        LFEC3:
FEC3 : 13    " "    db  $13
        ;
FEC4 : 10    " "    sba
        ;
FEC5 : 00    " "    db  $00
        ;
FEC6 : FF 00 09    "   "    stx  X0009
FEC9 : A4 F4    "  "    anda  $F4,x
        ;
FECB : 18 00 00 00  "    "    db  $18, $00, $00, $00
FECF : 12 B3    "  "    db  $12, $B3
        ;
FED1 : 82 22    " ""    sbca  #$22
        ;
FED3 : 00 00 00 18  "    "    db  $00, $00, $00, $18
        ;
FED7 : C6 F2    "  "    ldab  #$F2
FED9 : 19    " "    daa
        ;
FEDA : 00 00 00    "   "    db  $00, $00, $00
        ;
FEDD : 16    " "    tab
FEDE : DF 21    " !"    stx  X0021
FEE0 : 30    "0"    tsx
        ;
FEE1 : 00    " "    db  $00
        ;
FEE2 : FF 00 1B    "   "    stx  X001B
FEE5 : 0D    " "    sec
FEE6 : F1 19 00    "   "    cmpb  X1900
        ;
FEE9 : 00 00    "  "    db  $00, $00
        ;
FEEB : 0E    " "    cli
FEEC : A4 31    " 1"    anda  $31,x
FEEE : 19    " "    daa
        ;
FEEF : 00    " "    db  $00
        ;
FEF0 : 01    " "    nop
        ;
FEF1 : 00 03    "  "    db  $00, $03
        ;
FEF3 : 6A 41    "jA"    dec  $41,x
        ;
FEF5 : 02    " "    db  $02
        ;
FEF6 : D0 00    "  "    subb  X0000
        ;
FEF8 : 00    " "    db  $00
        ;
FEF9 : 27 6D    "'m"    beq  LFF68
        ;
FEFB : 03 15    "  "    db  $03, $15
        ;
FEFD : 11    " "    cba
FEFE : FF 00 0D    "   "    stx  X000D
FF01        XFF01:
FF01 : 1B    " "    aba
FF02 : A0 98    "  "    suba  $98,x
FF04 : 90 88    "  "    suba  X0088
FF06 : 80 78    " x"    suba  #$78
FF08 : 70 68 60    "ph`"    neg  X6860
FF0B : 58    "X"    aslb
FF0C : 50    "P"    negb
FF0D : 44    "D"    lsra
FF0E : 40    "@"    nega
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
FF1C : E0 01    "  "    subb  $01,x
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
FF2A : 80 7C    " |"    suba  #$7C
FF2C : 78 74 70    "xtp"    asl  X7470
FF2F : 74 78 7C    "tx|"    lsr  X787C
FF32 : 80 01    "  "    suba  #$01
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
FF47 : B0 C0 08    "   "    suba  XC008
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
FF6B : 40    "@"    nega
FF6C : 10    " "    sba
FF6D : 08    " "    inx
FF6E : 01    " "    nop
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
FF96 : 07    " "    tpa
FF97 : 08    " "    inx
FF98 : 09    " "    dex
FF99        LFF99:
FF99 : 0A    " "    clv
FF9A : 0C    " "    clc
FF9B : 08    " "    inx
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
FFA1 : 1C 00 00 00  "    "    db  $1C, $00, $00, $00
FFA5 : 00    " "    db  $00
        ;
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
        ;
FFF8 : FB 11 F0    "   "    addb  X11F0
        ;
FFFB : 1D    " "    db  $1D
        ;
FFFC : FB A0 F0    "   "    addb  XA0F0
        ;
FFFF        XFFFF:
FFFF : 1D    " "    db  $1D

;--------------------------------------------------------------




