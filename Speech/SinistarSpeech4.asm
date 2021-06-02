        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    SinistarSpeech4.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  2F10
        ;  CRC-32:    4B56A626
        ;
        ;  Date:    Fri May 21 12:12:08 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Sinistar Speech ROM IC4 
        ;
;*
;* TALKING EQUATES
;*
TALK     EQU  $EFFD    ;ENTRY TO TALKING         : SPEECH ROM ADDR
TALKD    EQU  $EFFA    ;ENTRY FOR DIAGNOSTICS    :  "      "    "
;
;
org  $E000;
;
;*************************************;
E000 : 05 41    " A"    db  $05, $41
        ;
E002 : 5D    "]"    tstb
E003 : FF B5 84    "   "    stx  XB584
E006 : D2 B6    "  "    sbcb  X00B6
E008 : 69 00    "i "    rol  $00,x
        ;
E00A : FC    " "    db  $FC
        ;
E00B : FF 01 00    "   "    stx  X0100
E00E : BA FD 55    "  U"    oraa  XFD55
        ;
E011 : 02    " "    db  $02
        ;
E012 : 54    "T"    lsrb
        ;
E013 : FD ED    "  "    db  $FD, $ED
        ;
E015 : 53    "S"    comb
E016 : 54    "T"    lsrb
        ;
E017 : DC    " "    db  $DC
        ;
E018 : EA 52    " R"    orab  $52,x
E01A : 50    "P"    negb
E01B : AA BF    "  "    oraa  $BF,x
E01D : 59    "Y"    rolb
E01E : C2 D3    "  "    sbcb  #$D3
E020 : AF D7    "  "    sts  $D7,x
E022 : 08    " "    inx
E023 : 85 85    "  "    bita  #$85
E025 : 85 FF    "  "    bita  #$FF
E027 : 3F    "?"    swi
        ;
E028 : 00    " "    db  $00
        ;
E029 : 80 EF    "  "    suba  #$EF
E02B : 7D 22 81    "}" "    tst  X2281
E02E : BC FE B4    "   "    cpx  XFEB4
E031 : 24 AA    "$ "    bcc  LDFDD
E033 : FE 5D 43    " ]C"    ldx  X5D43
E036 : 88 52    " R"    eora  #$52
E038 : 57    "W"    asrb
E039 : 0E    " "    cli
E03A : D6 F4    "  "    ldab  X00F4
E03C : 5F    "_"    clrb
E03D : BF 2B 84    " + "    sts  X2B84
        ;
E040 : 02    " "    db  $02
        ;
E041 : FF FE 00    "   "    stx  XFE00
        ;
E044        XE044:
E044 : 02    " "    db  $02
        ;
E045 : B8 FE 6B    "  k"    eora  XFE6B
E048 : 19    " "    daa
E049 : 88 E8    "  "    eora  #$E8
E04B : BB 9F 12    "   "    adda  X9F12
E04E : 82 CA    "  "    sbca  #$CA
E050 : FB 6E 11    " n "    addb  X6E11
E053 : 91 5A    " Z"    cmpa  X005A
E055 : 77 AD ED    "w  "    asr  XADED
        ;
E058 : 3A    ":"    db  $3A
        ;
E059 : AF 42    " B"    sts  $42,x
E05B : 01    " "    nop
E05C : FE FF 03    "   "    ldx  XFF03
E05F : 10    " "    sba
E060 : 58    "X"    aslb
E061 : F5 A7 0C    "   "    bitb  XA70C
E064 : B0 E2 DF    "   "    suba  XE2DF
E067 : 56    "V"    rorb
E068 : 94 85    "  "    anda  X0085
E06A : 5C    "\"    incb
E06B : FE AA 06    "   "    ldx  XAA06
E06E : 56    "V"    rorb
E06F : 5A    "Z"    decb
E070 : 63 CB    "c "    com  $CB,x
E072 : 68 FD    "h "    asl  $FD,x
        ;
E074 : 7B    "{"    db  $7B
        ;
E075 : B7 50 00    " P "    staa  X5000
        ;
E078 : FC    " "    db  $FC
        ;
E079 : FF 83 00    "   "    stx  X8300
E07C : 98 F5    "  "    eora  X00F5
E07E : 67 0E    "g "    asr  $0E,x
E080 : 94 A4    "  "    anda  X00A4
E082 : DF 3E    " >"    stx  X003E
E084 : 8A 41    " A"    oraa  #$41
E086 : 96 FB    "  "    ldaa  X00FB
E088 : F5 46 11    " F "    bitb  X4611
E08B : 54    "T"    lsrb
E08C : E5 25    " %"    bitb  $25,x
        ;
E08E : 5B    "["    db  $5B
        ;
E08F : B4 EE BF    "   "    anda  XEEBF
E092 : 56    "V"    rorb
        ;
E093 : 14 02 FC    "   "    db  $14, $02, $FC
        ;
E096 : FB 03 0C    "   "    addb  X030C
        ;
E099 : 38 E3 C7 3C  "8  <"    db  $38, $E3, $C7, $3C
        ;
E09D : 64 C5    "d "    lsr  $C5,x
E09F : A9 3C    " <"    adca  $3C,x
E0A1 : D7 47    " G"    stab  X0047
E0A3 : 0B    " "    sev
E0A4 : 99 56    " V"    adca  X0056
E0A6 : EF 2D    " -"    stx  $2D,x
E0A8 : 81 C2    "  "    cmpa  #$C2
E0AA : A5 AA    "  "    bita  $AA,x
E0AC : 5A    "Z"    decb
E0AD : E5 B9    "  "    bitb  $B9,x
E0AF : F7 69 15    " i "    stab  X6915
E0B2 : 01    " "    nop
        ;
E0B3 : FC    " "    db  $FC
        ;
E0B4 : F7 07 10    "   "    stab  X0710
E0B7 : 30    "0"    tsx
        ;
E0B8 : C7    " "    db  $C7
        ;
E0B9 : AF 5C    " \"    sts  $5C,x
        ;
E0BB : 62    "b"    db  $62
        ;
E0BC : 89 E6    "  "    adca  #$E6
        ;
E0BE : FC    " "    db  $FC
        ;
E0BF : 6A 25    "j%"    dec  $25,x
E0C1 : 94 72    " r"    anda  X0072
E0C3 : DE CF    "  "    ldx  X00CF
E0C5 : A4 00    "  "    anda  $00,x
E0C7 : AF 6F    " o"    sts  $6F,x
E0C9 : 22 50    ""P"    bhi  LE11B
E0CB : 5D    "]"    tstb
E0CC : 7F D5 8A    "   "    clr  XD58A
        ;
E0CF : 3A 87    ": "    db  $3A, $87
        ;
E0D1 : F0 8E 1F    "   "    subb  X8E1F
        ;
E0D4 : 4B 00    "K "    db  $4B, $00
        ;
E0D6 : 0D    " "    sec
E0D7 : AE F2    "  "    lds  $F2,x
        ;
E0D9 : 3A 1F    ": "    db  $3A, $1F
        ;
E0DB : 49    "I"    rola
        ;
E0DC : 51 75    "Qu"    db  $51, $75
        ;
E0DE : BC AB 86    "   "    cpx  XAB86
E0E1 : 5A    "Z"    decb
E0E2 : 5A    "Z"    decb
E0E3 : EF A7    "  "    stx  $A7,x
E0E5 : 20 48    " H"    bra  LE12F
        ;
E0E7 : 73 D5 55    "s U"    com  XD555
E0EA : 9C 73    " s"    cpx  X0073
E0EC : EB 52    " R"    addb  $52,x
        ;
E0EE : 55    "U"    db  $55
        ;
E0EF : E0 5F    " _"    subb  $5F,x
E0F1 : 3F    "?"    swi
E0F2 : 44    "D"    lsra
        ;
E0F3 : 02 41    " A"    db  $02, $41
        ;
E0F5 : B4 C7 A7    "   "    anda  XC7A7
        ;
E0F8 : 3A E3    ": "    db  $3A, $E3
        ;
E0FA : 9A 6D    " m"    oraa  X006D
        ;
E0FC        XE0FC:
E0FC : 61 52    "aR"    db  $61, $52
        ;
E0FE : 9E DE    "  "    lds  X00DE
E100 : AA 08    "  "    oraa  $08,x
        ;
E102 : 4E    "N"    db  $4E
        ;
E103 : EB AE    "  "    addb  $AE,x
        ;
E105 : 87    " "    db  $87
        ;
E106 : A1 50    " P"    cmpa  $50,x
E108 : 69 7D    "i}"    rol  $7D,x
E10A : BB 48 99    " H "    adda  X4899
E10D : 26 C4    "& "    bne  LE0D3
E10F        LE10F:
E10F : BF BE A8    "   "    sts  XBEA8
        ;
E112 : 02    " "    db  $02
        ;
E113 : A1 70    " p"    cmpa  $70,x
E115 : AC 9E    "  "    cpx  $9E,x
        ;
E117 : 75    "u"    db  $75
        ;
E118 : A9 48    " H"    adca  $48,x
E11A : D5 EB    "  "    bitb  X00EB
        ;
E11C : 55    "U"    db  $55
        ;
E11D : 4A    "J"    deca
E11E : D5 73    " s"    bitb  X0073
E120 : D5 F0    "  "    bitb  X00F0
E122 : 59    "Y"    rolb
E123 : D5 A0    "  "    bitb  X00A0
E125 : 44    "D"    lsra
E126 : A5 59    " Y"    bita  $59,x
        ;
E128 : F3    " "    db  $F3
        ;
E129 : BA CA C5    "   "    oraa  XCAC5
E12C : 54    "T"    lsrb
E12D : E0 BF    "  "    subb  $BF,x
E12F        LE12F:
E12F : BE 08 81    "   "    lds  X0881
E132 : 58    "X"    aslb
E133 : 6A C5    "j "    dec  $C5,x
E135 : AA F2    "  "    oraa  $F2,x
        ;
E137 : 52    "R"    db  $52
        ;
E138 : 47    "G"    asra
E139 : AA BB    "  "    oraa  $BB,x
E13B : 57    "W"    asrb
E13C : AD 42    " B"    jsr  $42,x            ;INFO: index jump
        ;
E13E : 51 EC    "Q "    db  $51, $EC
        ;
E140 : 7C 97 21    "| !"    inc  X9721
E143 : AA EA    "  "    oraa  $EA,x
        ;
E145 : 4B 14 55    "K U"    db  $4B, $14, $55
        ;
E148 : 4D    "M"    tsta
        ;
E149 : 1D 8F    "  "    db  $1D, $8F
        ;
E14B : 8B EF    "  "    adda  #$EF
E14D : EB 8A    "  "    addb  $8A,x
E14F : 06    " "    tap
E150 : 88 E2    "  "    eora  #$E2
E152 : 5A    "Z"    decb
E153 : 95 C4    "  "    bita  X00C4
E155 : C2 B2    "  "    sbcb  #$B2
E157 : 7A AF 35    "z 5"    dec  XAF35
        ;
E15A : 75 52    "uR"    db  $75, $52
        ;
E15C : AE 7E    " ~"    lds  $7E,x
E15E : 2A 28    "*("    bpl  LE188
E160 : 5A    "Z"    decb
        ;
E161 : 3D 1D    "= "    db  $3D, $1D
        ;
E163 : 29 94    ") "    bvs  LE0F9
E165 : AE 4F    " O"    lds  $4F,x
E167 : 2B 47    "+G"    bmi  LE1B0
E169 : 8B 92    "  "    adda  #$92
E16B : E7 FD    "  "    stab  $FD,x
E16D : 94 10    "  "    anda  X0010
E16F : 4C    "L"    inca
E170 : 31    "1"    ins
E171 : 2D 49    "-I"    blt  LE1BC
E173 : A8 75    " u"    eora  $75,x
E175 : 77 EB 94    "w  "    asr  XEB94
        ;
E178 : 61 55 75    "aUu"    db  $61, $55, $75
        ;
E17B : B9 BA 5A    "  Z"    adca  XBA5A
E17E : AD 05    "  "    jsr  $05,x            ;INFO: index jump
E180 : 95 8C    "  "    bita  X008C
        ;
E182 : 12    " "    db  $12
        ;
E183 : B2 5A AF    " Z "    sbca  X5AAF
E186 : 53    "S"    comb
E187 : 48    "H"    asla
E188        LE188:
E188 : D5 77    " w"    bitb  X0077
        ;
E18A : 55    "U"    db  $55
        ;
E18B : AB BE    "  "    adda  $BE,x
E18D : 26 80    "& "    bne  LE10F
E18F : 94 AA    "  "    anda  X00AA
E191 : A6 A4    "  "    ldaa  $A4,x
E193 : 90 DE    "  "    suba  X00DE
E195 : AF AB    "  "    sts  $AB,x
E197 : 0C    " "    clc
E198 : 5D    "]"    tstb
        ;
E199 : 6B    "k"    db  $6B
        ;
E19A : 67 81    "g "    asr  $81,x
        ;
E19C : 42    "B"    db  $42
        ;
E19D : EB EE    "  "    addb  $EE,x
E19F : A5 0A    "  "    bita  $0A,x
        ;
E1A1 : 51    "Q"    db  $51
        ;
E1A2 : AA D6    "  "    oraa  $D6,x
        ;
E1A4 : 3A    ":"    db  $3A
        ;
E1A5 : 23 4A    "#J"    bls  LE1F1
        ;
E1A7 : 7B    "{"    db  $7B
        ;
E1A8 : AF 8B    "  "    sts  $8B,x
E1AA : A0 79    " y"    suba  $79,x
        ;
E1AC : DD    " "    db  $DD
        ;
E1AD : AB 08    "  "    adda  $08,x
E1AF : 10    " "    sba
        ;
E1B0        LE1B0:
E1B0 : E3    " "    db  $E3
        ;
E1B1 : 5A    "Z"    decb
        ;
E1B2 : 55    "U"    db  $55
        ;
E1B3 : A2 54    " T"    sbca  $54,x
        ;
E1B5 : 7B    "{"    db  $7B
        ;
E1B6 : EB 5A    " Z"    addb  $5A,x
        ;
E1B8 : 75 52    "uR"    db  $75, $52
        ;
E1BA : 54    "T"    lsrb
E1BB : F5 5B 05    " [ "    bitb  X5B05
E1BE : 94 F4    "  "    anda  X00F4
E1C0 : DB 2A    " *"    addb  X002A
E1C2 : 48    "H"    asla
E1C3 : A4 DA    "  "    anda  $DA,x
E1C5 : 7A 55 A5    "zU "    dec  X55A5
E1C8 : 7A 5D 21    "z]!"    dec  X5D21
E1CB : 8A FA    "  "    oraa  #$FA
E1CD : 6A 0D    "j "    dec  $0D,x
        ;
E1CF : 52    "R"    db  $52
        ;
E1D0 : 24 15    "$ "    bcc  LE1E7
        ;
E1D2 : 55    "U"    db  $55
        ;
E1D3 : B4 B5 7D    "  }"    anda  XB57D
E1D6 : 5D    "]"    tstb
        ;
E1D7 : 55    "U"    db  $55
        ;
E1D8 : AA 78    " x"    oraa  $78,x
E1DA : AD 4B    " K"    jsr  $4B,x            ;INFO: index jump
E1DC : A4 A8    "  "    anda  $A8,x
E1DE : AF B5    "  "    sts  $B5,x
E1E0 : 84 48    " H"    anda  #$48
E1E2 : 24 55    "$U"    bcc  LE239
E1E4 : BB B7 56    "  V"    adda  XB756
        ;
E1E7        LE1E7:
E1E7 : 3A    ":"    db  $3A
        ;
E1E8 : 5D    "]"    tstb
E1E9 : C5 E8    "  "    bitb  #$E8
E1EB : 3B    ";"    rti
        ;
E1EC : 74 A1 8A    "t  "    lsr  XA18A
E1EF : 9A 20    "  "    oraa  X0020
E1F1        LE1F1:
E1F1 : 44    "D"    lsra
        ;
E1F2 : 6B    "k"    db  $6B
        ;
E1F3 : FB 2B 85    " + "    addb  X2B85
E1F6 : E8 EE    "  "    eorb  $EE,x
        ;
E1F8 : 6B    "k"    db  $6B
        ;
E1F9 : 25 41    "%A"    bcs  LE23C
E1FB : 94 77    " w"    anda  X0077
E1FD : EB 95    "  "    addb  $95,x
E1FF        XE1FF:
E1FF : 44    "D"    lsra
E200 : A8 D2    "  "    eora  $D2,x
E202 : 2A 16    "* "    bpl  LE21A
E204 : D5 7D    " }"    bitb  X007D
E206 : BD A5 15    "   "    jsr  LA515
        ;
E209 : 14    " "    db  $14
        ;
E20A : E0 BF    "  "    subb  $BF,x
E20C : 3F    "?"    swi
E20D : A0 00    "  "    suba  $00,x
        ;
E20F : 1C FD    "  "    db  $1C, $FD
        ;
E211 : E5 12    "  "    bitb  $12,x
        ;
E213 : 1A    " "    db  $1A
        ;
E214 : C9 73    " s"    adcb  #$73
E216 : 5F    "_"    clrb
E217 : 56    "V"    rorb
E218 : A1 92    "  "    cmpa  $92,x
E21A        LE21A:
E21A : 7E DD 82    "~  "    jmp  LDD82
        ;
E21D : 14    " "    db  $14
        ;
E21E : B4 B4 4A    "  J"    anda  XB44A
E221 : BF FA 6A    "  j"    sts  XFA6A
        ;
E224 : 8F    " "    db  $8F
        ;
E225 : A6 A8    "  "    ldaa  $A8,x
E227 : 0A    " "    clv
        ;
E228 : 05 00    "  "    db  $05, $00
        ;
E22A : FF FF 01    "   "    stx  XFF01
        ;
E22D : 00 FC FD    "   "    db  $00, $FC, $FD
        ;
E230 : 0B    " "    sev
        ;
E231 : 02    " "    db  $02
        ;
E232 : 78 FB 8F    "x  "    asl  XFB8F
        ;
E235 : 04    " "    db  $04
        ;
E236 : 68 EB    "h "    asl  $EB,x
E238 : 2F 4D    "/M"    ble  LE287
E23A : A8 6B    " k"    eora  $6B,x
E23C        LE23C:
E23C : 2F 42    "/B"    ble  LE280
E23E : A0 DD    "  "    suba  $DD,x
E240 : 5F    "_"    clrb
E241 : AA C8    "  "    oraa  $C8,x
E243 : AD 5B    " ["    jsr  $5B,x            ;INFO: index jump
E245 : 22 50    ""P"    bhi  LE297
E247 : CA 15    "  "    orab  #$15
E249 : 81 FF    "  "    cmpa  #$FF
E24B : 7F 00 40    "  @"    clr  X0040
E24E : 7F 5B 02    " [ "    clr  X5B02
        ;
E251 : 52    "R"    db  $52
        ;
E252 : FF 5B 02    " [ "    stx  X5B02
E255 : 68 FD    "h "    asl  $FD,x
E257 : 6E 01    "n "    jmp  $01,x            ;INFO: index jump
        ;
E259 : 78 DD 27    "x '"    asl  XDD27
E25C : 11    " "    cba
E25D        LE25D:
E25D : AC EE    "  "    cpx  $EE,x

E25F : AB 
E260 : FA    "  "    adda  $FA,x
E261 : 82 56    " V"    sbca  #$56
E263 : 7D A8 62    "} b"    tst  XA862
        ;
E266 : 1D    " "    db  $1D
        ;
E267 : 5D    "]"    tstb
E268 : A2 35    " 5"    sbca  $35,x
E26A : AF 05    "  "    sts  $05,x
E26C : 77 A1 1B    "w  "    asr  XA11B
E26F : 9A EA    "  "    oraa  X00EA
E271 : 43    "C"    coma
E272 : B5 46 47    " FG"    bita  X4647
E275 : EB 42    " B"    addb  $42,x
        ;
E277 : 71 C7    "q "    db  $71, $C7
        ;
E279 : 19    " "    daa
E27A : 73 84 5F    "s _"    com  X845F
E27D : 53    "S"    comb
E27E : A1 5C    " \"    cmpa  $5C,x
        ;
E280        LE280:
E280 : 7B    "{"    db  $7B
        ;
E281 : 48    "H"    asla
E282 : BD D0 E2    "   "    jsr  LD0E2
E285 : B5 94 EA    "   "    bita  X94EA
E288 : 90 AD    "  "    suba  X00AD
E28A : 2F 0D    "/ "    ble  LE299
E28C : F1 AA 5C    "  \"    cmpb  XAA5C
        ;
E28F : 1D    " "    db  $1D
        ;
E290 : E2 58    " X"    sbcb  $58,x
        ;
E292 : DD    " "    db  $DD
        ;
E293 : 82 AC    "  "    sbca  #$AC
E295 : 4F    "O"    clra
E296 : E9 03    "  "    adcb  $03,x
E298 : D5 3A    " :"    bitb  X003A
E29A : 4A    "J"    deca
E29B : 5D    "]"    tstb
E29C : AE 4E    " N"    lds  $4E,x
E29E : 50    "P"    negb
        ;
E29F : 55    "U"    db  $55
        ;
E2A0 : EF 85    "  "    stx  $85,x
E2A2 : 4A    "J"    deca
E2A3 : 5D    "]"    tstb
        ;
E2A4 : 61    "a"    db  $61
        ;
E2A5 : D7 A1    "  "    stab  X00A1
E2A7 : AE 50    " P"    lds  $50,x
E2A9 : 95 AF    "  "    bita  X00AF
        ;
E2AB : 55 05    "U "    db  $55, $05
        ;
E2AD : BA 4B 89    " K "    oraa  X4B89
E2B0 : AD 60    " `"    jsr  $60,x            ;INFO: index jump
E2B2 : 3F    "?"    swi
E2B3 : 2D A8    "- "    blt  LE25D
E2B5 : 7D 2A 83    "}* "    tst  X2A83
E2B8 : 7E 45 4A    "~EJ"    jmp  L454A
        ;
E2BB : 73 B5 0A    "s  "    com  XB50A
        ;
E2BE : FC 15    "  "    db  $FC, $15
        ;
E2C0 : 64 5F    "d_"    lsr  $5F,x
E2C2 : 29 5A    ")Z"    bvs  LE31E
        ;
E2C4 : 55 15 FC    "U  "    db  $55, $15, $FC
        ;
E2C7 : A6 A8    "  "    ldaa  $A8,x
E2C9 : BD 84 6A    "  j"    jsr  L846A
        ;
E2CC : 9D    " "    db  $9D
        ;
E2CD : 0A    " "    clv
E2CE : E7 15    "  "    stab  $15,x
E2D0 : AA F5    "  "    oraa  $F5,x
E2D2 : 84 55    " U"    anda  #$55
E2D4 : 5F    "_"    clrb
E2D5 : D2 A2    "  "    sbcb  X00A2
E2D7 : A2 5E    " ^"    sbca  $5E,x
        ;
E2D9 : C7    " "    db  $C7
        ;
E2DA : 58    "X"    aslb
E2DB : 81 FB    "  "    cmpa  #$FB
E2DD : B4 42 79    " By"    anda  X4279
E2E0        LE2E0:
E2E0 : 5D    "]"    tstb
E2E1 : 20 FD    "  "    bra  LE2E0
        ;
E2E3 : 54    "T"    lsrb
        ;
E2E4 : 45 75 9D 42  "Eu B"    db  $45, $75, $9D, $42
E2E8 : DC 1D    "  "    db  $DC, $1D
        ;
E2EA : D8 72    " r"    eorb  X0072
        ;
E2EC : 87    " "    db  $87
        ;
E2ED : 6A 0A    "j "    dec  $0A,x
E2EF : F7 06 E9    "   "    stab  X06E9
E2F2 : 5D    "]"    tstb
        ;
E2F3 : 45    "E"    db  $45
        ;
E2F4 : 2A FB    "* "    bpl  LE2F1
        ;
E2F6 : 03    " "    db  $03
        ;
E2F7 : 74 17 BD    "t  "    lsr  X17BD
E2FA : 81 7A    " z"    cmpa  #$7A
E2FC : 97 A4    "  "    staa  X00A4
E2FE : CA 72    " r"    orab  #$72
E300 : AD A2    "  "    jsr  $A2,x            ;INFO: index jump
E302 : E8 DA    "  "    eorb  $DA,x
        ;
E304 : 02    " "    db  $02
        ;
E305 : BF A0 D6    "   "    sts  XA0D6
E308 : 49    "I"    rola
E309 : 57    "W"    asrb
E30A : 0B    " "    sev
E30B : F5 02 7D    "  }"    bitb  X027D
E30E : 2D 05    "- "    blt  LE315
E310 : EE 43    " C"    ldx  $43,x
        ;
E312 : 5E    "^"    db  $5E
        ;
E313 : A4 5E    " ^"    anda  $5E,x
E315        LE315:
E315 : D1 6A    " j"    cmpb  X006A
        ;
E317 : 1D    " "    db  $1D
        ;
E318 : E8 AD    "  "    eorb  $AD,x
E31A : 5A    "Z"    decb
E31B : 81 FE    "  "    cmpa  #$FE
        ;
E31D : 04    " "    db  $04
        ;
E31E        LE31E:
E31E : F5 89 1E    "   "    bitb  X891E
E321 : B4 96 BB    "   "    anda  X96BB
E324 : 80 7E    " ~"    suba  #$7E
        ;
E326        LE326:
E326 : 51    "Q"    db  $51
        ;
E327 : AA 33    " 3"    oraa  $33,x
E329 : 17    " "    tba
E32A : E1 FE    "  "    cmpb  $FE,x
        ;
E32C : 00    " "    db  $00
        ;
E32D : BE CA 52    "  R"    lds  XCA52
E330 : 74 3B 8A    "t; "    lsr  X3B8A
E333 : E4 0F    "  "    andb  $0F,x
E335 : EA 42    " B"    orab  $42,x
E337 : 7F 80 7F    "   "    clr  X807F
E33A : 01    " "    nop
E33B : 7F 08 FF    "   "    clr  X08FF
E33E : 80 FA    "  "    suba  #$FA
        ;
E340 : 05    " "    db  $05
        ;
E341 : F5 58 07    " X "    bitb  X5807
E344 : FA 8A 6E    "  n"    orab  X8A6E
E347 : 22 DD    "" "    bhi  LE326
E349 : 56    "V"    rorb
E34A : A0 3F    " ?"    suba  $3F,x
E34C : C0 1F    "  "    subb  #$1F
E34E : F0 0F 68    "  h"    subb  X0F68
E351 : BB 15 68    "  h"    adda  X1568
E354 : BF 20 59    "  Y"    sts  X2059
E357 : AB 15    "  "    adda  $15,x
E359 : C5 00    "  "    bitb  #$00
E35B : FF 07 FE    "   "    stx  X07FE
E35E : 80 1F    "  "    suba  #$1F
E360 : C0 96    "  "    subb  #$96
E362 : 6A 40    "j@"    dec  $40,x
E364 : BF 5A 13    " Z "    sts  X5A13
        ;
E367 : FD 05    "  "    db  $FD, $05
        ;
E369 : BF 04 7C    "  |"    sts  X047C
E36C : F0 FF 00    "   "    subb  XFF00
E36F : 7C 40 00    "|@ "    inc  X4000
E372 : F0 0F C0    "   "    subb  X0FC0
        ;
E375 : 62    "b"    db  $62
        ;
E376 : 3F    "?"    swi
E377 : 80 1D    "  "    suba  #$1D
E379 : C4 9B    "  "    andb  #$9B
E37B : C4 3D    " ="    andb  #$3D
        ;
E37D : 00 FC    "  "    db  $00, $FC
        ;
E37F : 3F    "?"    swi
E380 : C0 FF    "  "    subb  #$FF
E382 : FF 00 FE    "   "    stx  X00FE
        ;
E385 : 03 00 FD    "   "    db  $03, $00, $FD
        ;
E388 : 0F    " "    sei
E389 : E0 07    "  "    subb  $07,x
        ;
E38B : 75    "u"    db  $75
        ;
E38C : 40    "@"    nega
E38D : 2F 50    "/P"    ble  LE3DF
E38F : FE 0F F0    "   "    ldx  X0FF0
E392 : FF 1F 80    "   "    stx  X1F80
E395        LE395:
E395 : FF 00 80    "   "    stx  X0080
E398 : FF 07 E0    "   "    stx  X07E0
E39B : D5 01    "  "    bitb  X0001
E39D : F8 03 FC    "   "    eorb  X03FC
E3A0 : 3F    "?"    swi
E3A1 : 80 FB    "  "    suba  #$FB
E3A3 : 7F 00 FE    "   "    clr  X00FE
        ;
E3A6 : 8F 00 FC    "   "    db  $8F, $00, $FC
        ;
E3A9 : 3F    "?"    swi
E3AA : C0 E5    "  "    subb  #$E5
E3AC : 0E    " "    cli
        ;
E3AD : 65    "e"    db  $65
        ;
E3AE : 29 E5    ") "    bvs  LE395
E3B0 : FF 00 F3    "   "    stx  X00F3
E3B3 : FE 03 F0    "   "    ldx  X03F0
E3B6 : FF 03 E0    "   "    stx  X03E0
E3B9 : FF 19 C0    "   "    stx  X19C0
E3BC : 3F    "?"    swi
E3BD : F0 07 3A    "  :"    subb  X073A
        ;
E3C0 : FC    " "    db  $FC
        ;
E3C1 : 0F    " "    sei
        ;
E3C2 : 00    " "    db  $00
        ;
E3C3 : F7 7F 00    "   "    stab  X7F00
E3C6 : F2 FF 01    "   "    sbcb  XFF01
E3C9 : F0 FE 07    "   "    subb  XFE07
E3CC : A0 63    " c"    suba  $63,x
E3CE : BE 80 21    "  !"    lds  X8021
        ;
E3D1 : FC 1F 00    "   "    db  $FC, $1F, $00
        ;
E3D4 : 80 FF    "  "    suba  #$FF
        ;
E3D6 : 00 00 FC    "   "    db  $00, $00, $FC
        ;
E3D9 : 07    " "    tpa
E3DA : 0D    " "    sec
E3DB : E0 9E    "  "    subb  $9E,x
E3DD : 64 08    "d "    lsr  $08,x
E3DF        LE3DF:
E3DF : BA 29 1A    " ) "    oraa  X291A
        ;
E3E2 : 83    " "    db  $83
        ;
E3E3 : FF DF 08    "   "    stx  XDF08
E3E6 : 40    "@"    nega
E3E7 : 07    " "    tpa
E3E8 : FE 88 19    "   "    ldx  X8819
E3EB : F0 47 54    " GT"    subb  X4754
        ;
E3EE : CD    " "    db  $CD
        ;
E3EF : D5 22    " ""    bitb  X0022
E3F1 : 40    "@"    nega
E3F2 : EF D5    "  "    stx  $D5,x
        ;
E3F4 : 00 FC    "  "    db  $00, $FC
        ;
E3F6 : FF 87 E0    "   "    stx  X87E0
        ;
E3F9 : 00    " "    db  $00
        ;
E3FA : F8 15 57    "  W"    eorb  X1557
E3FD : F6 09 C0    "   "    ldab  X09C0
E400 : BD AF A0    "   "    jsr  LAFA0
E403 : 2A E5    "* "    bpl  LE3EA
        ;
E405 : 1C    " "    db  $1C
        ;
E406 : E1 16    "  "    cmpb  $16,x
E408 : E0 FF    "  "    subb  $FF,x
E40A : BF 01 01    "   "    sts  X0101
E40D : 40    "@"    nega
E40E : FF 36 67    " 6g"    stx  X3667
        ;
E411 : 41    "A"    db  $41
        ;
E412 : A0 FC    "  "    suba  $FC,x
        ;
E414 : 1D    " "    db  $1D
        ;
E415 : FB 25 51    " %Q"    addb  X2551
E418 : A4 5E    " ^"    anda  $5E,x
        ;
E41A : 41 ED 21 FC  "A ! "    db  $41, $ED, $21, $FC
        ;
E41E : FF 7F 00    "   "    stx  X7F00
        ;
E421 : 00 3A    " :"    db  $00, $3A
        ;
E423 : EE EF    "  "    ldx  $EF,x
E425 : 08    " "    inx
E426 : 22 19    "" "    bhi  LE441
E428 : D7 EF    "  "    stab  X00EF
E42A : AB 24    " $"    adda  $24,x
E42C : 90 DE    "  "    suba  X00DE
E42E : 8A E9    "  "    oraa  #$E9
E430 : 6A 05    "j "    dec  $05,x
E432 : 60 FF    "` "    neg  $FF,x
E434 : FF 1B 04    "   "    stx  X1B04
        ;
E437 : 00 DC    "  "    db  $00, $DC
        ;
E439 : F7 1B 88    "   "    stab  X1B88
        ;
E43C : 52 15 E3    "R  "    db  $52, $15, $E3
        ;
E43F : BF 4E 85    " N "    sts  X4E85
E442 : D2 7A    " z"    sbcb  X007A
        ;
E444 : 05    " "    db  $05
        ;
E445 : AA FF    "  "    oraa  $FF,x
        ;
E447 : 13    " "    db  $13
        ;
E448 : 40    "@"    nega
E449 : EB FF    "  "    addb  $FF,x
        ;
E44B : 1F    " "    db  $1F
        ;
E44C : 07    " "    tpa
        ;
E44D : 00    " "    db  $00
        ;
E44E : 54    "T"    lsrb
E44F : 39    "9"    rts
        ;
E450 : FE 6F 00    " o "    ldx  X6F00
E453 : C8 7D    " }"    eorb  #$7D
        ;
E455 : 15    " "    db  $15
        ;
E456 : FB 6F 02    " o "    addb  X6F02
E459 : 50    "P"    negb
E45A : FF 04 DD    "   "    stx  X04DD
E45D : A2 AC    "  "    sbca  $AC,x
        ;
E45F : ED 04    "  "    db  $ED, $04
        ;
E461 : FF FF 0C    "   "    stx  XFF0C
        ;
E464 : 00 51    " Q"    db  $00, $51
        ;
E466 : CA F9    "  "    orab  #$F9
        ;
E468 : 1E    " "    db  $1E
        ;
E469 : 43    "C"    coma
E46A : 31    "1"    ins
        ;
E46B        LE46B:
E46B : 4E    "N"    db  $4E
        ;
E46C : E9 BE    "  "    adcb  $BE,x
        ;
E46E : 65 51    "eQ"    db  $65, $51
        ;
E470 : BF 80 54    "  T"    sts  X8054
        ;
E473 : 7B    "{"    db  $7B
        ;
E474 : 01    " "    nop
        ;
E475 : 7B 71    "{q"    db  $7B, $71
        ;
E477 : 7F 7F C1    "   "    clr  X7FC1
E47A : F9 0F 03    "   "    adcb  X0F03
E47D : 20 9E    "  "    bra  LE41D
        ;
E47F : EE 8E    "  "    ldx  $8E,x
        ;
E481 : 41    "A"    db  $41
        ;
E482 : 30    "0"    tsx
        ;
E483        LE483:
E483 : 1D A3    "  "    db  $1D, $A3
        ;
E485 : F9 5F A5    " _ "    adcb  X5FA5
E488 : D0 5F    " _"    subb  X005F
E48A : 20 DF    "  "    bra  LE46B
        ;
E48C : D0 28    " ("    subb  X0028
E48E : D4 51    " Q"    andb  X0051
E490 : FF F7 0A    "   "    stx  XF70A
E493 : 94 3A    " :"    anda  X003A
E495 : CE C7 39    "  9"    ldx  #$C739
        ;
E498 : 00    " "    db  $00
        ;
E499 : E4 73    " s"    andb  $73,x
E49B : 34    "4"    des
E49C : FE 07 D0    "   "    ldx  X07D0
        ;
E49F : 75    "u"    db  $75
        ;
E4A0 : AE 4A    " J"    lds  $4A,x
E4A2 : AB 52    " R"    adda  $52,x
E4A4 : 7D 4B 54    "}KT"    tst  X4B54
E4A7 : 4A    "J"    deca
E4A8 : 01    " "    nop
E4A9 : 40    "@"    nega
E4AA : FF 7F A9    "   "    stx  X7FA9
E4AD : B7 00 94    "   "    staa  X0094
E4B0 : EE 7F    "  "    ldx  $7F,x
E4B2 : 2C 05    ", "    bge  LE4B9
        ;
E4B4 : 61    "a"    db  $61
        ;
E4B5 : 31    "1"    ins
E4B6 : 98 CE    "  "    eora  X00CE
E4B8 : 77 18 AF    "w  "    asr  X18AF
        ;
E4BB : 55    "U"    db  $55
        ;
E4BC : 82 FA    "  "    sbca  #$FA
        ;
E4BE : 15    " "    db  $15
        ;
E4BF : 9A D7    "  "    oraa  X00D7
E4C1 : 79 1A 03    "y  "    rol  X1A03
E4C4 : 54    "T"    lsrb
E4C5 : 7D 9B D2    "}  "    tst  X9BD2
E4C8 : DF 16    "  "    stx  X0016
E4CA : 80 BF    "  "    suba  #$BF
E4CC : 85 54    " T"    bita  #$54
E4CE : B9 17 54    "  T"    adca  X1754
E4D1 : CB B5    "  "    addb  #$B5
E4D3 : 10    " "    sba
E4D4 : 91 F4    "  "    cmpa  X00F4
E4D6 : DF 42    " B"    stx  X0042
E4D8 : D4 BE    "  "    andb  X00BE
        ;
E4DA : 05    " "    db  $05
        ;
E4DB : 70 BF 16    "p  "    neg  XBF16
E4DE : C1 7A    " z"    cmpb  #$7A
E4E0 : 2D A1    "- "    blt  LE483
        ;
E4E2 : FD    " "    db  $FD
        ;
E4E3 : 08    " "    inx
        ;
E4E4 : 55    "U"    db  $55
        ;
E4E5 : 34    "4"    des
E4E6 : DB 7B    " {"    addb  X007B
        ;
E4E8 : 15    " "    db  $15
        ;
E4E9 : F2 5E 80    " ^ "    sbcb  X5E80
E4EC : FA FE 00    "   "    orab  XFE00
E4EF : AC 4A    " J"    cpx  $4A,x
        ;
E4F1 : 55    "U"    db  $55
        ;
E4F2 : F2 6F 95    " o "    sbcb  X6F95
E4F5 : A2 D8    "  "    sbca  $D8,x
E4F7 : 8A 5A    " Z"    oraa  #$5A
E4F9 : 95 FF    "  "    bita  X00FF
E4FB : 01    " "    nop
E4FC : D4 BE    "  "    andb  X00BE
E4FE : 17    " "    tba
E4FF : A8 AA    "  "    eora  $AA,x
E501 : 11    " "    cba
        ;
E502 : 55    "U"    db  $55
        ;
E503 : EF 7A    " z"    stx  $7A,x
E505 : 01    " "    nop
E506 : 5A    "Z"    decb
E507 : F9 05 AD    "   "    adcb  X05AD
        ;
E50A : FC 8F    "  "    db  $FC, $8F
        ;
E50C : 4A    "J"    deca
E50D        LE50D:
E50D : 4A    "J"    deca
E50E : 11    " "    cba
E50F : 60 BB    "` "    neg  $BB,x
E511 : 5C    "\"    incb
        ;
E512 : 15    " "    db  $15
        ;
E513 : DE CA    "  "    ldx  X00CA
E515 : A6 C6    "  "    ldaa  $C6,x
E517 : E8 AE    "  "    eorb  $AE,x
E519 : 2F 54    "/T"    ble  LE56F
E51B : AF 82    "  "    sts  $82,x
E51D : C0 FF    "  "    subb  #$FF
E51F : 20 5A    " Z"    bra  LE57B
        ;
E521 : A9 55    " U"    adca  $55,x
E523 : 7D D1 8A    "}  "    tst  XD18A
E526 : EA 52    " R"    orab  $52,x
E528 : 88 52    " R"    eora  #$52
E52A : FF F7 00    "   "    stx  XF700
E52D : 4A    "J"    deca
E52E : E9 BB    "  "    adcb  $BB,x
E530 : 4A    "J"    deca
E531 : 11    " "    cba
        ;
E532 : 42 6B    "Bk"    db  $42, $6B
        ;
E534 : F5 5B 8A    " [ "    bitb  X5B8A
E537 : 40    "@"    nega
E538        LE538:
E538 : DF 6B    " k"    stx  X006B
E53A : 46    "F"    rora
E53B : BA 83 D2    "   "    oraa  X83D2
        ;
E53E : 51    "Q"    db  $51
        ;
E53F : B5 77 A5    " w "    bita  X77A5
E542 : 48    "H"    asla
E543 : 6F 48    "oH"    clr  $48,x
E545 : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
        ;
E547 : 14    " "    db  $14
        ;
E548 : FF 3F 00    " ? "    stx  X3F00
E54B : C0 BF    "  "    subb  #$BF
E54D        LE54D:
E54D : 53    "S"    comb
        ;
E54E : 45    "E"    db  $45
        ;
E54F : E9 75    " u"    adcb  $75,x
E551 : AB 02    "  "    adda  $02,x
E553 : D0 FB    "  "    subb  X00FB
E555 : 16    " "    tab
E556 : 20 F5    "  "    bra  LE54D
        ;
E558 : F5 5A 8A    " Z "    bitb  X5A8A
E55B : 64 A1    "d "    lsr  $A1,x
E55D : AB 6E    " n"    adda  $6E,x
E55F : D1 D5    "  "    cmpb  X00D5
E561 : 0B    " "    sev
E562 : B8 D2 07    "   "    eora  XD207
E565 : CA 7F    "  "    orab  #$7F
        ;
E567 : 05    " "    db  $05
        ;
E568 : 80 D7    "  "    suba  #$D7
E56A : 2F A1    "/ "    ble  LE50D
E56C : A8 BB    "  "    eora  $BB,x
        ;
E56E : 15 62    " b"    db  $15, $62
        ;
E570 : B4 7E 15    " ~ "    anda  X7E15
        ;
E573 : 14    " "    db  $14
        ;
E574 : F7 AE 04    "   "    stab  XAE04
        ;
E577 : 52    "R"    db  $52
        ;
E578 : DF 33    " 3"    stx  X0033
E57A : B8 F0 BA    "   "    eora  XF0BA
E57D : 2A 14    "* "    bpl  LE593
E57F : 2D B7    "- "    blt  LE538
E581 : 44    "D"    lsra
E582 : AF 06    "  "    sts  $06,x
E584 : F1 7F 0F    "   "    cmpb  X7F0F
        ;
E587 : 00    " "    db  $00
        ;
E588 : CE 9F 00    "   "    ldx  #$9F00
E58B : EA DF    "  "    orab  $DF,x
E58D : 01    " "    nop
E58E : 68 FD    "h "    asl  $FD,x
        ;
E590 : 72    "r"    db  $72
        ;
E591 : 48    "H"    asla
E592 : BC 5D 2A    " ]*"    cpx  X5D2A
E595 : AA 7E    " ~"    oraa  $7E,x
E597 : 85 88    "  "    bita  #$88
E599 : FA 6A 58    " jX"    orab  X6A58
E59C : E8 6A    " j"    eorb  $6A,x
E59E : AD 56    " V"    jsr  $56,x            ;INFO: index jump
E5A0 : 0C    " "    clc
E5A1 : 97 AB    "  "    staa  X00AB
E5A3 : 97 00    "  "    staa  X0000
E5A5 : F9 CF 03    "   "    adcb  XCF03
E5A8 : E0 FB    "  "    subb  $FB,x
E5AA : 01    " "    nop
E5AB        XE5AB:
E5AB : E0 FD    "  "    subb  $FD,x
        ;
E5AD : 72    "r"    db  $72
        ;
E5AE : C0 BC    "  "    subb  #$BC
E5B0 : 3E    ">"    wai
        ;
E5B1 : 14    " "    db  $14
        ;
E5B2 : 99 BE    "  "    adca  X00BE
E5B4 : 0E    " "    cli
E5B5 : 95 CA    "  "    bita  X00CA
E5B7 : AF 02    "  "    sts  $02,x
E5B9 : F5 CD 03    "   "    bitb  XCD03
E5BC : C6 57    " W"    ldab  #$57
        ;
E5BE : A3 C3    "  "    db  $A3, $C3
        ;
E5C0 : 73 23 AA    "s# "    com  X23AA
E5C3 : BA B9 50    "  P"    oraa  XB950
E5C6 : 5A    "Z"    decb
E5C7 : 16    " "    tab
E5C8 : FE E3 01    "   "    ldx  XE301
E5CB : 78 7F 20    "x  "    asl  X7F20
E5CE : F0 BF 14    "   "    subb  XBF14
E5D1 : 70 BE 29    "p )"    neg  XBE29
E5D4 : 22 5E    ""^"    bhi  LE634
E5D6 : 5F    "_"    clrb
        ;
E5D7 : 42    "B"    db  $42
        ;
E5D8 : A5 57    " W"    bita  $57,x
E5DA : 2B 4A    "+J"    bmi  LE626
        ;
E5DC : 7B    "{"    db  $7B
        ;
E5DD : A5 80    "  "    bita  $80,x
E5DF : F5 AB 4A    "  J"    bitb  XAB4A
E5E2 : 5A    "Z"    decb
E5E3 : BD 06 5D    "  ]"    jsr  L065D
E5E6 : 53    "S"    comb
E5E7 : 50    "P"    negb
E5E8 : 8B 1F    "  "    adda  #$1F
E5EA : B4 E8 E0    "   "    anda  XE8E0
E5ED : 7F 38 20    " 8 "    clr  X3820
E5F0 : FF 0D 08    "   "    stx  X0D08
E5F3 : FE 0D 03    "   "    ldx  X0D03
        ;
E5F6 : 8F 1F 45    "  E"    db  $8F, $1F, $45
        ;
E5F9 : D2 EB    "  "    sbcb  X00EB
        ;
E5FB : 45    "E"    db  $45
        ;
E5FC : 92 FA    "  "    sbca  X00FA
        ;
E5FE : 55    "U"    db  $55
        ;
E5FF : 01    " "    nop
        ;
E600 : FD    " "    db  $FD
        ;
E601 : 7E 00 E8    "~  "    jmp  L00E8
        ;
E604 : 3F    "?"    swi
        ;
E605 : 1D    " "    db  $1D
        ;
E606 : 58    "X"    aslb
E607 : 7A 0B 4E    "z N"    dec  X0B4E
        ;
E60A : 1D 55    " U"    db  $1D, $55
        ;
E60C : E5 A1    "  "    bitb  $A1,x
E60E : F2 D5 42    "  B"    sbcb  XD542
E611 : 17    " "    tba
E612 : 11    " "    cba
E613 : 5D    "]"    tstb
E614 : D1 1F    "  "    cmpb  X001F
        ;
E616 : 1F    " "    db  $1F
        ;
E617 : 40    "@"    nega
E618 : EF 03    "  "    stx  $03,x
        ;
E61A : 03    " "    db  $03
        ;
E61B : FF 15 E0    "   "    stx  X15E0
E61E : EA 07    "  "    orab  $07,x
        ;
E620 : 45    "E"    db  $45
        ;
E621 : FB 71 C0    " q "    addb  X71C0
E624 : FA 6A F0    " j "    orab  X6AF0
E627 : F8 E0 44    "  D"    eorb  XE044
E62A : 2F 1E    "/ "    ble  LE64A
E62C : BA D2 03    "   "    oraa  XD203
E62F : 97 17    "  "    staa  X0017
E631 : C9 CB    "  "    adcb  #$CB
E633 : 86 5E    " ^"    ldaa  #$5E
E635 : 5C    "\"    incb
E636 : 74 B9 80    "t  "    lsr  XB980
E639 : 5F    "_"    clrb
E63A : 08    " "    inx
E63B : F5 47 2F    " G/"    bitb  X472F
        ;
E63E : 45    "E"    db  $45
        ;
E63F : 74 E8 A5    "t  "    lsr  XE8A5
E642 : 54    "T"    lsrb
E643 : BF 1A A0    "   "    sts  X1AA0
E646 : FB 46 05    " F "    addb  X4605
E649 : AD 8B    "  "    jsr  $8B,x            ;INFO: index jump
E64B : E8 F2    "  "    eorb  $F2,x
E64D : 57    "W"    asrb
E64E : 81 B6    "  "    cmpa  #$B6
E650 : 6A E0    "j "    dec  $E0,x
E652 : FA 89 50    "  P"    orab  X8950
E655 : F5 51 49    " QI"    bitb  X5149
E658 : EB A5    "  "    addb  $A5,x
E65A : 56    "V"    rorb
E65B : 27 0A    "' "    beq  LE667
        ;
E65D : FC    " "    db  $FC
        ;
E65E : B5 20 2B    "  +"    bita  X202B
        ;
E661 : 3D    "="    db  $3D
        ;
E662 : F8 F8 A2    "   "    eorb  XF8A2
E665 : 84 2C    " ,"    anda  #$2C
E667        LE667:
E667 : BF 3C 50    " <P"    sts  X3C50
E66A : D5 4F    " O"    bitb  X004F
E66C : 48    "H"    asla
E66D : F9 A5 04    "   "    adcb  XA504
E670 : 3E    ">"    wai
E671 : 3E    ">"    wai
        ;
E672 : 51 C7 03    "Q  "    db  $51, $C7, $03
        ;
E675 : AF 57    " W"    sts  $57,x
E677 : F0 F0 E2    "   "    subb  XF0E2
E67A : 40    "@"    nega
        ;
E67B : 1F    " "    db  $1F
        ;
E67C : 3F    "?"    swi
        ;
E67D : 38    "8"    db  $38
        ;
E67E : F8 A2 83    "   "    eorb  XA283
        ;
E681 : 1F    " "    db  $1F
        ;
E682 : 0E    " "    cli
E683 : FA 42 E5    " B "    orab  X42E5
E686 : D7 06    "  "    stab  X0006
E688 : 78 7D A0    "x} "    asl  X7DA0
E68B : A0 3F    " ?"    suba  $3F,x
E68D : 0F    " "    sei
        ;
E68E : 3C    "<"    db  $3C
        ;
E68F : 7C 90 FA    "|  "    inc  X90FA
E692 : 57    "W"    asrb
E693 : 01    " "    nop
E694 : AE 36    " 6"    lds  $36,x
E696 : F4 F8 83    "   "    andb  XF883
E699 : C0 B7    "  "    subb  #$B7
E69B : 56    "V"    rorb
E69C : 60 F5    "` "    neg  $F5,x
E69E : 0F    " "    sei
E69F : 06    " "    tap
E6A0 : 9F 16    "  "    sts  X0016
E6A2 : C1 A7    "  "    cmpb  #$A7
E6A4 : 57    "W"    asrb
E6A5 : 50    "P"    negb
E6A6 : E5 6B    " k"    bitb  $6B,x
E6A8 : B0 F8 3D    "  ="    suba  XF83D
E6AB : 10    " "    sba
E6AC : 7C 1D 2C    "| ,"    inc  X1D2C
E6AF : E9 C7    "  "    adcb  $C7,x
        ;
E6B1 : 03    " "    db  $03
        ;
E6B2 : 17    " "    tba
E6B3 : BD F0 C3    "   "    jsr  LF0C3
E6B6 : 43    "C"    coma
E6B7 : 57    "W"    asrb
        ;
E6B8 : 3C    "<"    db  $3C
        ;
E6B9 : 58    "X"    aslb
E6BA : F0 E5 AB    "   "    subb  XE5AB
E6BD : 5C    "\"    incb
E6BE : B4 50 02    " P "    anda  X5002
E6C1 : 4F    "O"    clra
        ;
E6C2        LE6C2:
E6C2 : 1F    " "    db  $1F
        ;
E6C3 : AE E8    "  "    lds  $E8,x
        ;
E6C5 : B3    " "    db  $B3
        ;
E6C6 : 82 7A    " z"    sbca  #$7A
        ;
E6C8 : 75 05    "u "    db  $75, $05
        ;
E6CA : 7C 35 B0    "|5 "    inc  X35B0
        ;
E6CD : FC 05    "  "    db  $FC, $05
        ;
E6CF : C6 17    "  "    ldab  #$17
        ;
E6D1 : ED 71    " q"    db  $ED, $71
        ;
E6D3 : C1 E3    "  "    cmpb  #$E3
E6D5 : 74 E0 FC    "t  "    lsr  XE0FC
        ;
E6D8 : 38    "8"    db  $38
        ;
E6D9 : 34    "4"    des
        ;
E6DA : 1E 05    "  "    db  $1E, $05
        ;
E6DC : BE 07 D5    "   "    lds  X07D5
E6DF : CB 05    "  "    addb  #$05
E6E1 : 5F    "_"    clrb
        ;
E6E2 : 1F    " "    db  $1F
        ;
E6E3 : 60 F8    "` "    neg  $F8,x
E6E5 : 70 D0 3E    "p >"    neg  XD03E
E6E8 : F0 0F 06    "   "    subb  X0F06
E6EB : FE F0 C0    "   "    ldx  XF0C0
        ;
E6EE : C7 83    "  "    db  $C7, $83
        ;
E6F0 : D6 74    " t"    ldab  X0074
E6F2 : F4 F0 38    "  8"    andb  XF038
E6F5 : 78 3C 94    "x< "    asl  X3C94
E6F8 : 3F    "?"    swi
E6F9 : 78 E0 83    "x  "    asl  XE083
E6FC : 47    "G"    asra
E6FD : 3F    "?"    swi
E6FE : 78 F8 E0    "x  "    asl  XF8E0
E701 : C1 A5    "  "    cmpb  #$A5
E703 : 07    " "    tpa
E704 : 2F BC    "/ "    ble  LE6C2
E706 : 68 F4    "h "    asl  $F4,x
E708 : F2 A2 52    "  R"    sbcb  XA252
E70B : 9F 16    "  "    sts  X0016
E70D : 2C 69    ",i"    bge  LE778
E70F : 49    "I"    rola
E710 : B5 44 DA    " D "    bita  X44DA
E713 : DF 84    "  "    stx  X0084
E715 : F4 6A 21    " j!"    andb  X6A21
E718 : FA A7 03    "   "    orab  XA703
E71B : B7 B0 F8    "   "    staa  XB0F8
E71E : 69 85    "i "    rol  $85,x
E720 : CA 17    "  "    orab  #$17
E722 : 36    "6"    psha
        ;
E723 : 4E    "N"    db  $4E
        ;
E724 : D5 81    "  "    bitb  X0081
E726 : D5 43    " C"    bitb  X0043
E728 : 59    "Y"    rolb
E729 : D5 FF    "  "    bitb  X00FF
        ;
E72B : C7 E3    "  "    db  $C7, $E3
        ;
E72D : 70 18 38    "p 8"    neg  X1838
E730 : 70 38 3C    "p8<"    neg  X383C
E733 : 06    " "    tap
        ;
E734 : 1E 1E    "  "    db  $1E, $1E
        ;
E736 : 0E    " "    cli
        ;
E737 : 8F B3    "  "    db  $8F, $B3
        ;
E739 : 43    "C"    coma
        ;
E73A : 00 00    "  "    db  $00, $00
        ;
E73C : F4 FF 1F    "   "    andb  XFF1F
        ;
E73F : 87 03 00    "   "    db  $87, $03, $00
        ;
E742 : C0 E3    "  "    subb  #$E3
E744 : F1 30 10    " 0 "    cmpb  X3010
        ;
E747 : 18    " "    db  $18
        ;
E748 : 3E    ">"    wai
        ;
E749 : 1F C7 02 00  "    "    db  $1F, $C7, $02, $00
        ;
E74D : 80 F8    "  "    suba  #$F8
E74F : F9 E7 71    "  q"    adcb  XE771
        ;
E752 : 18 00 38    "  8"    db  $18, $00, $38
        ;
E755 : 9E 9F    "  "    lds  X009F
        ;
E757 : 87    " "    db  $87
        ;
E758 : 82 C0    "  "    sbca  #$C0
        ;
E75A : E3    " "    db  $E3
        ;
E75B : FB 3D 10    " = "    addb  X3D10
        ;
E75E : 00    " "    db  $00
        ;
E75F : 80 CF    "  "    suba  #$CF
E761 : E7 79    " y"    stab  $79,x
E763 : 0E    " "    cli
        ;
E764 : 00    " "    db  $00
        ;
E765 : 10    " "    sba
E766 : DE 9F    "  "    ldx  X009F
        ;
E768 : 87    " "    db  $87
        ;
E769 : 01    " "    nop
E76A : C0 F1    "  "    subb  #$F1
E76C : FB 3D 00    " = "    addb  X3D00
        ;
E76F : 00    " "    db  $00
        ;
E770 : C0 F2    "  "    subb  #$F2
        ;
E772 : 3C    "<"    db  $3C
        ;
E773 : 9F 03    "  "    sts  X0003
        ;
E775 : 00    " "    db  $00
        ;
E776 : 84 E7    "  "    anda  #$E7
E778        LE778:
E778 : FF D3 81    "   "    stx  XD381
E77B : 80 E1    "  "    suba  #$E1
E77D : FB 7B 18    " { "    addb  X7B18
        ;
E780 : 00 00    "  "    db  $00, $00
        ;
E782 : 79 3E EF    "y> "    rol  X3EEF
E785 : 07    " "    tpa
        ;
E786 : 00    " "    db  $00
        ;
E787 : C0 F9    "  "    subb  #$F9
E789 : F7 EF 20    "   "    stab  XEF20
E78C : 60 78    "`x"    neg  $78,x
E78E : 7F 8F 01    "   "    clr  X8F01
        ;
E791 : 00    " "    db  $00
        ;
E792 : C1 F3    "  "    cmpb  #$F3
E794 : 7C 37 00    "|7 "    inc  X3700
        ;
E797 : 00 C7 CF    "   "    db  $00, $C7, $CF
        ;
E79A : FF 61 60    " a`"    stx  X6160
        ;
E79D : 18    " "    db  $18
        ;
E79E : BF 0F 03    "   "    sts  X0F03
        ;
E7A1 : 00    " "    db  $00
        ;
E7A2 : 78 9E F7    "x  "    asl  X9EF7
        ;
E7A5 : 03 00    "  "    db  $03, $00
        ;
E7A7 : 30    "0"    tsx
E7A8 : F2 FE 1E    "   "    sbcb  XFE1E
        ;
E7AB : 03    " "    db  $03
        ;
E7AC : C1 78    " x"    cmpb  #$78
        ;
E7AE : 3C    "<"    db  $3C
        ;
E7AF : 07    " "    tpa
        ;
E7B0 : 02    " "    db  $02
        ;
E7B1 : C0 73    " s"    subb  #$73
E7B3 : BC 1F 02    "   "    cpx  X1F02
E7B6 : 80 E0    "  "    suba  #$E0
E7B8 : F9 7F 1C    "   "    adcb  X7F1C
        ;
E7BB : 04 83 F3    "   "    db  $04, $83, $F3
        ;
E7BE : 7D 08 00    "}  "    tst  X0800
E7C1 : 7C 9E E7    "|  "    inc  X9EE7
        ;
E7C4 : 87 00    "  "    db  $87, $00
        ;
E7C6 : 60 70    "`p"    neg  $70,x
        ;
E7C8 : 3C    "<"    db  $3C
        ;
E7C9 : 3F    "?"    swi
E7CA : 0F    " "    sei
E7CB : 01    " "    nop
E7CC : C1 F1    "  "    cmpb  #$F1
E7CE : F9 18 00    "   "    adcb  X1800
E7D1 : C0 F3    "  "    subb  #$F3
        ;
E7D3 : 3C 1F    "< "    db  $3C, $1F
        ;
E7D5 : 0C    " "    clc
        ;
E7D6 : 00    " "    db  $00
        ;
E7D7 : 82 C5    "  "    sbca  #$C5
E7D9 : FB 71 10    " q "    addb  X7110
E7DC : 08    " "    inx
E7DD : 4A    "J"    deca
E7DE : EF 63    " c"    stx  $63,x
        ;
E7E0 : 00 00    "  "    db  $00, $00
        ;
E7E2 : 7C 9E E7    "|  "    inc  X9EE7
        ;
E7E5 : 83 00    "  "    db  $83, $00
        ;
E7E7 : 40    "@"    nega
E7E8 : 78 3C 3F    "x<?"    asl  X3C3F
E7EB : 0E    " "    cli
        ;
E7EC : 02 C3    "  "    db  $02, $C3
        ;
E7EE : E1 79    " y"    cmpb  $79,x
E7F0 : 10    " "    sba
        ;
E7F1 : 00    " "    db  $00
        ;
E7F2 : 8C 3E 8F    " > "    cpx  #$3E8F
E7F5 : E7 41    " A"    stab  $41,x
        ;
E7F7 : 00    " "    db  $00
        ;
E7F8 : 30    "0"    tsx
E7F9 : 7C 3C 1F    "|< "    inc  X3C1F
E7FC : 07    " "    tpa
E7FD : 81 E1    "  "    cmpa  #$E1
E7FF : 79 56 00    "yV "    rol  X5600
        ;
E802 : 00    " "    db  $00
        ;
E803 : AB FE    "  "    adda  $FE,x
        ;
E805 : 3C    "<"    db  $3C
        ;
E806 : 8E 87 01    "   "    lds  #$8701
E809 : 40    "@"    nega
E80A : B8 79 77    " yw"    eora  X7977
E80D : 0C    " "    clc
E80E : 0C    " "    clc
E80F : 82 C3    "  "    sbca  #$C3
        ;
E811 : 9D    " "    db  $9D
        ;
E812 : 23 02    "# "    bls  LE816
E814 : 88 91    "  "    eora  #$91
E816        LE816:
E816 : 9F E7    "  "    sts  X00E7
        ;
E818 : F3    " "    db  $F3
        ;
E819 : 30    "0"    tsx
        ;
E81A : 00    " "    db  $00
        ;
E81B : 08    " "    inx
        ;
E81C : 9D    " "    db  $9D
        ;
E81D : 7F 8E 85    "   "    clr  X8E85
E820 : 40    "@"    nega
E821 : 70 BC 9F    "p  "    neg  XBC9F
        ;
E824 : 21 00    "! "    db  $21, $00
        ;
E826 : 08    " "    inx
        ;
E827 : CF    " "    db  $CF
        ;
E828 : EF F3    "  "    stx  $F3,x
        ;
E82A : 71 18 00    "q  "    db  $71, $18, $00
        ;
E82D : C0 F8    "  "    subb  #$F8
E82F : 7C 1E 06    "|  "    inc  X1E06
E832 : 80 34    " 4"    suba  #$34
E834 : DF CF    "  "    stx  X00CF
E836 : 01    " "    nop
        ;
E837 : 00    " "    db  $00
        ;
E838 : 50    "P"    negb
        ;
E839 : DD    " "    db  $DD
        ;
E83A : EF F3    "  "    stx  $F3,x
        ;
E83C : 71 00 00    "q  "    db  $71, $00, $00
        ;
E83F : E1 FD    "  "    cmpb  $FD,x
        ;
E841 : 3D    "="    db  $3D
        ;
E842 : 07    " "    tpa
        ;
E843 : 02    " "    db  $02
        ;
E844 : C0 78    " x"    subb  #$78
E846 : FF 4F 01    " O "    stx  X4F01
        ;
E849 : 00    " "    db  $00
        ;
E84A : E1 75    " u"    cmpb  $75,x
E84C : BF FF 87    "   "    sts  XFF87
E84F : 20 00    "  "    bra  LE851
        ;
E851        LE851:
E851 : 9C FF    "  "    cpx  X00FF
E853 : F7 44 08    " D "    stab  X4408
E856 : A0 FA    "  "    suba  $FA,x
E858 : FE 5F 21    " _!"    ldx  X5F21
        ;
E85B : 00    " "    db  $00
        ;
E85C : 48    "H"    asla
E85D : 9F EF    "  "    sts  X00EF
E85F : FF 1F 06    "   "    stx  X1F06
E862 : 40    "@"    nega
E863 : E0 7C    " |"    subb  $7C,x
E865 : 3F    "?"    swi
E866 : 67 C1    "g "    asr  $C1,x
E868 : 30    "0"    tsx
E869 : 2E EF    ". "    bgt  LE85A
E86B : F7 35 04    " 5 "    stab  X3504
E86E : 80 D0    "  "    suba  #$D0
E870 : FE FE FF    "   "    ldx  XFEFF
        ;
E873 : 1F    " "    db  $1F
        ;
E874 : 80 00    "  "    suba  #$00
E876 : 74 FE EF    "t  "    lsr  XFEEF
E879 : 32    "2"    pula
E87A : 0A    " "    clv
E87B : 86 F3    "  "    ldaa  #$F3
E87D : FA BE 05    "   "    orab  XBE05
E880 : 40    "@"    nega
E881 : 10    " "    sba
E882 : 7D FF FE    "}  "    tst  XFFFE
E885 : BF AD 00    "   "    sts  XAD00
E888 : 08    " "    inx
E889 : 91 FD    "  "    cmpa  X00FD
E88B : F5 BD 8A    "   "    bitb  XBD8A
        ;
E88E : 42    "B"    db  $42
        ;
E88F : 70 7C FF    "p| "    neg  X7CFF
E892 : 95 40    " @"    bita  X0040
E894 : 80 E8    "  "    suba  #$E8
E896 : 7F FE FF    "   "    clr  XFEFF
E899 : 25 08    "% "    bcs  LE8A3
        ;
E89B : 00 F3    "  "    db  $00, $F3
        ;
E89D : FA 7D 8B    " } "    orab  X7D8B
        ;
E8A0 : 42    "B"    db  $42
        ;
E8A1 : A1 78    " x"    cmpa  $78,x
E8A3        LE8A3:
E8A3 : FF 7D 0A    " } "    stx  X7D0A
        ;
E8A6 : 00    " "    db  $00
        ;
E8A7 : 44    "D"    lsra
        ;
E8A8 : FD    " "    db  $FD
        ;
E8A9 : FF EF DF    "   "    stx  XEFDF
E8AC : 40    "@"    nega
E8AD : 20 22    " ""    bra  LE8D1
        ;
E8AF : B5 EF AA    "   "    bita  XEFAA
E8B2 : B9 34 8E    " 4 "    adca  X348E
        ;
E8B5 : 15    " "    db  $15
        ;
E8B6 : D6 DF    "  "    ldab  X00DF
        ;
E8B8 : 45    "E"    db  $45
        ;
E8B9 : 20 4A    " J"    bra  LE905
        ;
E8BB : CE FF EF    "   "    ldx  #$FFEF
E8BE : FF 0B 00    "   "    stx  X0B00
E8C1 : A2 A2    "  "    sbca  $A2,x
        ;
E8C3 : FC    " "    db  $FC
        ;
E8C4 : BF 86 48    "  H"    sts  X8648
E8C7 : 95 B1    "  "    bita  X00B1
E8C9 : FA DF 23    "  #"    orab  XDF23
        ;
E8CC : 02    " "    db  $02
        ;
E8CD : A1 DA    "  "    cmpa  $DA,x
E8CF : BF 4F FB    " O "    sts  X4FFB
E8D2 : FF 12 10    "   "    stx  X1210
E8D5 : 0C    " "    clc
E8D6 : E1 FA    "  "    cmpb  $FA,x
E8D8 : FB 14 50    "  P"    addb  X1450
E8DB : 34    "4"    des
E8DC : 5D    "]"    tstb
E8DD : FF 7F 01    "   "    stx  X7F01
        ;
E8E0        XE8E0:
E8E0 : 00    " "    db  $00
        ;
E8E1 : D4 BC    "  "    andb  X00BC
E8E3 : FF 7D DF    " } "    stx  X7DDF
        ;
E8E6 : 4B 00    "K "    db  $4B, $00
        ;
E8E8 : 90 AA    "  "    suba  X00AA
        ;
E8EA : 3A    ":"    db  $3A
        ;
E8EB : 3E    ">"    wai
        ;
E8EC : CF    " "    db  $CF
        ;
E8ED : 82 E2    "  "    sbca  #$E2
E8EF : 7A 5B FF    "z[ "    dec  X5BFF
E8F2 : 37    "7"    pshb
        ;
E8F3 : 00 00    "  "    db  $00, $00
        ;
E8F5 : 7A FF FF    "z  "    dec  XFFFF
E8F8 : AD 73    " s"    jsr  $73,x            ;INFO: index jump
        ;
E8FA : 04 00    "  "    db  $04, $00
        ;
E8FC : 63 FB    "c "    com  $FB,x
E8FE : 96 55    " U"    ldaa  X0055
E900 : 4A    "J"    deca
E901 : 44    "D"    lsra
E902 : FB BF 65    "  e"    addb  XBF65
E905        LE905:
E905 : B5 05 00    "   "    bita  X0500
E908 : E0 F7    "  "    subb  $F7,x
E90A : FB DD BC    "   "    addb  XDDBC
        ;
E90D : CF 02    "  "    db  $CF, $02
        ;
E90F : 20 52    " R"    bra  LE963
        ;
E911 : 5A    "Z"    decb
        ;
E912 : 3D    "="    db  $3D
        ;
E913 : 5F    "_"    clrb
        ;
E914 : 4B    "K"    db  $4B
        ;
E915 : 16    " "    tab
E916 : D7 E2    "  "    stab  X00E2
E918 : FA 3F 02    " ? "    orab  X3F02
        ;
E91B : 00    " "    db  $00
        ;
E91C : AC FB    "  "    cpx  $FB,x
E91E : FF FF 75    "  u"    stx  XFF75
        ;
E921 : 04 00    "  "    db  $04, $00
        ;
E923 : 32    "2"    pula
E924 : AF AE    "  "    sts  $AE,x
        ;
E926 : 6B    "k"    db  $6B
        ;
E927 : 06    " "    tap
E928 : 85 DD    "  "    bita  #$DD
E92A : AE 1C    "  "    lds  $1C,x
E92C : DF 03    "  "    stx  X0003
        ;
E92E : 00    " "    db  $00
        ;
E92F : EA 6A    " j"    orab  $6A,x
E931 : FE FF BF    "   "    ldx  XFFBF
E934 : 47    "G"    asra
        ;
E935 : 00    " "    db  $00
        ;
E936 : 80 F6    "  "    suba  #$F6
E938 : BA AE 26    "  &"    oraa  XAE26
E93B : 08    " "    inx
E93C : AA DF    "  "    oraa  $DF,x
E93E : D5 DE    "  "    bitb  X00DE
E940 : A7 00    "  "    staa  $00,x
E942 : 80 2E    " ."    suba  #$2E
E944 : FB FF 9F    "   "    addb  XFF9F
E947 : F7 11 00    "   "    stab  X1100
E94A : E8 AD    "  "    eorb  $AD,x
E94C : AA D7    "  "    oraa  $D7,x
        ;
E94E : 00    " "    db  $00
        ;
E94F : B8 BF 44    "  D"    eora  XBF44
        ;
E952 : 75    "u"    db  $75
        ;
E953 : B7 14 08    "   "    staa  X1408
E956 : 08    " "    inx
E957 : A5 FF    "  "    bita  $FF,x
E959 : 7F F3 3F    "  ?"    clr  XF33F
        ;
E95C : 00    " "    db  $00
        ;
E95D : E0 77    " w"    subb  $77,x
E95F : B4 3F 00    " ? "    anda  X3F00
E962 : A8 5F    " _"    eora  $5F,x
        ;
E964 : F3    " "    db  $F3
        ;
E965 : 3B    ";"    rti
        ;
E966 : 00    " "    db  $00
        ;
E967 : FF 05 40    "  @"    stx  X0540
E96A : 57    "W"    asrb
E96B : A0 FF    "  "    suba  $FF,x
        ;
E96D : E3 FC    "  "    db  $E3, $FC
        ;
E96F : 0F    " "    sei
E970 : 80 2F    " /"    suba  #$2F
E972 : C0 7F    "  "    subb  #$7F
        ;
E974 : 00 FC 83    "   "    db  $00, $FC, $83
        ;
E977 : FE 01 F8    "   "    ldx  X01F8
        ;
E97A : CF 75    " u"    db  $CF, $75
        ;
E97C : 01    " "    nop
E97D : 80 45    " E"    suba  #$45
E97F : FF 3F FC    " ? "    stx  X3FFC
E982 : 27 40    "'@"    beq  LE9C4
        ;
E984 : 1F    " "    db  $1F
        ;
E985 : E4 2F    " /"    andb  $2F,x
E987 : 60 0F    "` "    neg  $0F,x
E989 : F0 1F B8    "   "    subb  X1FB8
E98C : 07    " "    tpa
E98D : F8 3F 00    " ? "    eorb  X3F00
E990 : 81 7C    " |"    cmpa  #$7C
        ;
E992 : FC    " "    db  $FC
        ;
E993 : 7F F0 1F    "   "    clr  XF01F
E996 : E0 03    "  "    subb  $03,x
E998 : F8 05 9F    "   "    eorb  X059F
E99B : C0 3F    " ?"    subb  #$3F
E99D : B8 07 F8    "   "    eora  X07F8
E9A0 : F0 BF 00    "   "    subb  XBF00
        ;
E9A3 : 00    " "    db  $00
        ;
E9A4 : 7D E1 FF    "}  "    tst  XE1FF
E9A7 : F0 1F 04    "   "    subb  X1F04
E9AA : C0 7F    "  "    subb  #$7F
        ;
E9AC : 38 00    "8 "    db  $38, $00
        ;
E9AE : EF F0    "  "    stx  $F0,x
        ;
E9B0 : 05    " "    db  $05
        ;
E9B1 : 0E    " "    cli
E9B2 : E1 3B    " ;"    cmpb  $3B,x
E9B4 : 3E    ">"    wai
E9B5 : 80 61    " a"    suba  #$61
        ;
E9B7 : 3C    "<"    db  $3C
        ;
E9B8 : C8 87    "  "    eorb  #$87
E9BA : FF C3 00    "   "    stx  XC300
E9BD : 7C BC 03    "|  "    inc  XBC03
E9C0 : 60 FC    "` "    neg  $FC,x
E9C2 : 0F    " "    sei
        ;
E9C3 : 03    " "    db  $03
        ;
E9C4        LE9C4:
E9C4 : F0 7D 0F    " } "    subb  X7D0F
E9C7 : 01    " "    nop
E9C8 : F8 0E 82    "   "    eorb  X0E82
E9CB : 63 7E    "c~"    com  $7E,x
E9CD : 8E 81 FB    "   "    lds  #$81FB
E9D0 : 3F    "?"    swi
        ;
E9D1 : 00    " "    db  $00
        ;
E9D2 : 80 FF    "  "    suba  #$FF
E9D4 : 3E    ">"    wai
        ;
E9D5 : 00    " "    db  $00
        ;
E9D6 : E7 7F    "  "    stab  $7F,x
        ;
E9D8 : 18    " "    db  $18
        ;
E9D9 : 80 E3    "  "    suba  #$E3
E9DB : 19    " "    daa
E9DC : 06    " "    tap
        ;
E9DD : 87    " "    db  $87
        ;
E9DE : 9F 43    " C"    sts  X0043
E9E0 : F0 FC 0F    "   "    subb  XFC0F
E9E3 : 01    " "    nop
E9E4 : F0 3C 06    " < "    subb  X3C06
E9E7 : C2 FF    "  "    sbcb  #$FF
        ;
E9E9 : 1C 04    "  "    db  $1C, $04
        ;
E9EB : C1 78    " x"    cmpb  #$78
E9ED : 0C    " "    clc
E9EE : 5C    "\"    incb
E9EF : F0 79 06    " y "    subb  X7906
        ;
E9F2 : CF    " "    db  $CF
        ;
E9F3 : FF 10 90    "   "    stx  X1090
E9F6 : DF 03    "  "    stx  X0003
E9F8 : 30    "0"    tsx
E9F9 : FE C7 41    "  A"    ldx  XC741
        ;
E9FC : 3C    "<"    db  $3C
        ;
E9FD : 0F    " "    sei
E9FE : 40    "@"    nega
E9FF : 70 F8 3D    "p ="    neg  XF83D
EA02 : 82 E7    "  "    sbca  #$E7
EA04 : 7F 00 DC    "   "    clr  X00DC
EA07 : FF 01 00    "   "    stx  X0100
EA0A : FF 47 20    " G "    stx  X4720
EA0D : DE C3    "  "    ldx  X00C3
        ;
EA0F : 00    " "    db  $00
        ;
EA10 : 0A    " "    clv
EA11 : 3E    ">"    wai
        ;
EA12 : 8F    " "    db  $8F
        ;
EA13 : E0 F9    "  "    subb  $F9,x
        ;
EA15 : 1D 00    "  "    db  $1D, $00
        ;
EA17 : E7 7F    "  "    stab  $7F,x
        ;
EA19 : 00 EC    "  "    db  $00, $EC
        ;
EA1B : FF 09 88    "   "    stx  X0988
EA1E : FB 28 04    " ( "    addb  X2804
EA21 : E1 E7    "  "    cmpb  $E7,x
EA23 : 09    " "    dex
EA24 : 0E    " "    cli
EA25 : 9F 23    " #"    sts  X0023
EA27 : 70 FC C7    "p  "    neg  XFCC7
EA2A : 80 F9    "  "    suba  #$F9
EA2C : 7F 00 38    "  8"    clr  X0038
EA2F : 7F 82 00    "   "    clr  X8200
EA32 : 3E    ">"    wai
EA33 : 4F    "O"    clra
EA34 : 10    " "    sba
EA35 : F8 9E 00    "   "    eorb  X9E00
EA38 : E1 3F    " ?"    cmpb  $3F,x
        ;
EA3A : 02    " "    db  $02
        ;
EA3B : E4 7F    "  "    andb  $7F,x
EA3D : 0E    " "    cli
EA3E : C0 F8    "  "    subb  #$F8
EA40 : 20 82    "  "    bra  LE9C4
        ;
EA42 : F8 79 82    " y "    eorb  X7982
EA45 : C0 F7    "  "    subb  #$F7
        ;
EA47 : 04    " "    db  $04
        ;
EA48 : 80 FF    "  "    suba  #$FF
EA4A : 08    " "    inx
EA4B : 30    "0"    tsx
EA4C : FF 33 00    " 3 "    stx  X3300
        ;
EA4F : C7    " "    db  $C7
        ;
EA50 : 43    "C"    coma
        ;
EA51 : 14    " "    db  $14
        ;
EA52 : 8E CF 23    "  #"    lds  #$CF23
EA55 : 0C    " "    clc
EA56 : 3E    ">"    wai
EA57 : 07    " "    tpa
EA58 : 40    "@"    nega
EA59 : F8 CF 00    "   "    eorb  XCF00
EA5C : FA 7F 03    "   "    orab  X7F03
EA5F : 60 7C    "`|"    neg  $7C,x
        ;
EA61 : 14    " "    db  $14
        ;
EA62 : C0 F1    "  "    subb  #$F1
EA64 : 79 84 C0    "y  "    rol  X84C0
EA67 : E7 01    "  "    stab  $01,x
        ;
EA69 : 00    " "    db  $00
        ;
EA6A : FF 0B 00    "   "    stx  X0B00
EA6D : FE 3F 00    " ? "    ldx  X3F00
EA70 : E6 4B    " K"    ldab  $4B,x
EA72 : 01    " "    nop
EA73 : 08    " "    inx
EA74 : F8 3C C3    " < "    eorb  X3CC3
EA77 : E0 7B    " {"    subb  $7B,x
        ;
EA79 : 04    " "    db  $04
        ;
EA7A : C0 FF    "  "    subb  #$FF
EA7C : 0C    " "    clc
EA7D : 80 FF    "  "    suba  #$FF
EA7F : 59    "Y"    rolb
EA80 : 10    " "    sba
EA81 : F7 94 61    "  a"    stab  X9461
        ;
EA84 : 00    " "    db  $00
        ;
EA85 : F0 79 86    " y "    subb  X7986
EA88 : C0 E7    "  "    subb  #$E7
EA8A : 01    " "    nop
EA8B : 0C    " "    clc
EA8C : FF 09 60    "  `"    stx  X0960
EA8F : FE 23 E1    " # "    ldx  X23E1
        ;
EA92 : 3C 38    "<8"    db  $3C, $38
        ;
EA94 : 0C    " "    clc
        ;
EA95 : 71    "q"    db  $71
        ;
EA96 : C0 E7    "  "    subb  #$E7
EA98 : 11    " "    cba
EA99 : 06    " "    tap
EA9A : 9F 07    "  "    sts  X0007
EA9C : 30    "0"    tsx
        ;
EA9D : FC    " "    db  $FC
        ;
EA9E : 47    "G"    asra
EA9F : 80 F9    "  "    suba  #$F9
        ;
EAA1 : 8F    " "    db  $8F
        ;
EAA2 : C2 57    " W"    sbcb  #$57
EAA4 : 0D    " "    sec
EAA5 : 82 41    " A"    sbca  #$41
EAA7 : 27 7C    "'|"    beq  LEB25
        ;
EAA9 : 1E 00    "  "    db  $1E, $00
        ;
EAAB : F0 79 00    " y "    subb  X7900
EAAE : E5 3F    " ?"    bitb  $3F,x
        ;
EAB0 : 00    " "    db  $00
        ;
EAB1 : F8 7F 08    "   "    eorb  X7F08
EAB4 : BC 63 10    " c "    cpx  X6310
EAB7 : 1B    " "    aba
        ;
EAB8 : 8F    " "    db  $8F
        ;
EAB9 : 82 CF    "  "    sbca  #$CF
        ;
EABB : 03    " "    db  $03
        ;
EABC : 0C    " "    clc
EABD        LEABD:
EABD : 3E    ">"    wai
EABE : 0F    " "    sei
EABF : 20 FC    "  "    bra  LEABD
        ;
EAC1 : 0F    " "    sei
EAC2 : C0 FF    "  "    subb  #$FF
        ;
EAC4 : 05    " "    db  $05
        ;
EAC5 : E2 4F    " O"    sbcb  $4F,x
        ;
EAC7 : 05    " "    db  $05
        ;
EAC8 : 2C 3F    ",?"    bge  LEB09
        ;
EACA : 38    "8"    db  $38
        ;
EACB : F0 71 04    " q "    subb  X7104
EACE : C1 E7    "  "    cmpb  #$E7
EAD0 : 01    " "    nop
EAD1 : 86 CF    "  "    ldaa  #$CF
        ;
EAD3 : 00 3C    " <"    db  $00, $3C
        ;
EAD5 : EF 61    " a"    stx  $61,x
EAD7 : 78 07 81    "x  "    asl  X0781
EADA : DA 55    " U"    orab  X0055
EADC : 0E    " "    cli
EADD : 7C 1C 42    "| B"    inc  X1C42
EAE0 : F0 79 00    " y "    subb  X7900
EAE3 : E1 E7    "  "    cmpb  $E7,x
        ;
EAE5 : 00    " "    db  $00
        ;
EAE6 : AE DF    "  "    lds  $DF,x
EAE8 : 40    "@"    nega
EAE9 : 7C 1D 20    "|  "    inc  X1D20
EAEC : EB E1    "  "    addb  $E1,x
        ;
EAEE : 00    " "    db  $00
        ;
EAEF : 9F 47    " G"    sts  X0047
        ;
EAF1 : 00    " "    db  $00
        ;
EAF2 : 7C 0E 40    "| @"    inc  X0E40
EAF5 : F8 39 40    " 9@"    eorb  X3940
EAF8 : E5 39    " 9"    bitb  $39,x
EAFA : C6 87    "  "    ldab  #$87
        ;
EAFC : 02    " "    db  $02
        ;
EAFD : B5 8F 20    "   "    bita  X8F20
EB00 : E0 E3    "  "    subb  $E3,x
EB02 : 09    " "    dex
EB03 : 80 9F    "  "    suba  #$9F
        ;
EB05 : 03 00    "  "    db  $03, $00
        ;
EB07 : 7E 1F 00    "~  "    jmp  L1F00
        ;
EB0A : FC    " "    db  $FC
        ;
EB0B : 57    "W"    asrb
EB0C : 8A B0    "  "    oraa  #$B0
        ;
EB0E : 15    " "    db  $15
        ;
EB0F : 0D    " "    sec
        ;
EB10 : 03 C7    "  "    db  $03, $C7
        ;
EB12 : F0 79 00    " y "    subb  X7900
EB15 : E0 E7    "  "    subb  $E7,x
EB17 : 01    " "    nop
EB18 : 80 FF    "  "    suba  #$FF
EB1A : 01    " "    nop
EB1B : 40    "@"    nega
EB1C : FF 0F E0    "   "    stx  X0FE0
EB1F : 7C 08 C3    "|  "    inc  X08C3
EB22 : E9 18    "  "    adcb  $18,x
        ;
EB24 : FC 3C 00    " < "    db  $FC, $3C, $00
        ;
EB27 : F8 F3 00    "   "    eorb  XF300
EB2A : D0 E7    "  "    subb  X00E7
EB2C : 01    " "    nop
EB2D : B2 8F 07    "   "    sbca  X8F07
        ;
EB30 : 4B 3D    "K="    db  $4B, $3D
        ;
EB32 : 58    "X"    aslb
EB33 : D4 A4    "  "    andb  X00A4
        ;
EB35 : 02    " "    db  $02
        ;
EB36 : F8 3C 02    " < "    eorb  X3C02
EB39 : E0 F3    "  "    subb  $F3,x
        ;
EB3B : 00    " "    db  $00
        ;
EB3C : C0 FF    "  "    subb  #$FF
EB3E : 01    " "    nop
EB3F : 20 DF    "  "    bra  LEB20
        ;
EB41 : 87 61    " a"    db  $87, $61
        ;
EB43 : AD 18    "  "    jsr  $18,x            ;INFO: index jump
        ;
EB45 : D3    " "    db  $D3
        ;
EB46 : 82 78    " x"    sbca  #$78
EB48 : F0 F1 00    "   "    subb  XF100
EB4B : C1 CF    "  "    cmpb  #$CF
        ;
EB4D : 03    " "    db  $03
        ;
EB4E : 80 9F    "  "    suba  #$9F
EB50 : 07    " "    tpa
EB51 : 84 3F    " ?"    anda  #$3F
EB53 : 4F    "O"    clra
EB54 : 50    "P"    negb
EB55 : E7 02    "  "    stab  $02,x
EB57 : E1 3F    " ?"    cmpb  $3F,x
EB59 : 06    " "    tap
EB5A : 20 9F    "  "    bra  LEAFB
        ;
EB5C : C7 00    "  "    db  $C7, $00
        ;
EB5E : 7C 1E 00    "|  "    inc  X1E00
EB61 : F8 3F 00    " ? "    eorb  X3F00
EB64 : EE B7    "  "    ldx  $B7,x
EB66 : 10    " "    sba
EB67 : BC 2D 86    " - "    cpx  X2D86
EB6A : F1 10 DC    "   "    cmpb  X10DC
        ;
EB6D : 87 CF 03    "   "    db  $87, $CF, $03
        ;
EB70 : 08    " "    inx
EB71 : 3E    ">"    wai
EB72 : 0E    " "    cli
EB73 : 40    "@"    nega
EB74 : FE 3C 80    " < "    ldx  X3C80
        ;
EB77 : E3 7B    " {"    db  $E3, $7B
        ;
EB79 : 08    " "    inx
EB7A : 3E    ">"    wai
        ;
EB7B : 1F    " "    db  $1F
        ;
EB7C : 50    "P"    negb
EB7D : EB 20    "  "    addb  $20,x
EB7F : EE FF    "  "    ldx  $FF,x
EB81 : F8 38 8C    " 8 "    eorb  X388C
        ;
EB84 : E3 C3    "  "    db  $E3, $C3
        ;
EB86 : 70 BF 0F    "p  "    neg  XBF0F
EB89 : C0 FF    "  "    subb  #$FF
EB8B : 1B    " "    aba
EB8C : 80 FF    "  "    suba  #$FF
EB8E : 5F    "_"    clrb
        ;
EB8F : 00 FC    "  "    db  $00, $FC
        ;
EB91 : AF 40    " @"    sts  $40,x
        ;
EB93 : FC    " "    db  $FC
        ;
EB94        XEB94:
EB94 : FF 01 1E    "   "    stx  X011E
EB97 : 9F 07    "  "    sts  X0007
        ;
EB99 : FC    " "    db  $FC
        ;
EB9A : 78 8C F2    "x  "    asl  X8CF2
        ;
EB9D : E3 E3    "  "    db  $E3, $E3
        ;
EB9F : 48    "H"    asla
EBA0 : BF AF 05    "   "    sts  XAF05
EBA3 : F7 71 38    " q8"    stab  X7138
EBA6 : BC F2 F7    "   "    cpx  XF2F7
EBA9 : 57    "W"    asrb
        ;
EBAA : 04    " "    db  $04
        ;
EBAB : E5 F3    "  "    bitb  $F3,x
EBAD : 30    "0"    tsx
EBAE : C6 9F    "  "    ldab  #$9F
EBB0 : 07    " "    tpa
EBB1 : B8 FF 55    "  U"    eora  XFF55
EBB4 : 30    "0"    tsx
EBB5 : EF AB    "  "    stx  $AB,x
EBB7 : 30    "0"    tsx
EBB8 : FF 1F 01    "   "    stx  X1F01
        ;
EBBB : FC    " "    db  $FC
        ;
EBBC : 7E A6 F7    "~  "    jmp  LA6F7
        ;
EBBF : E3 00    "  "    db  $E3, $00
        ;
EBC1 : 3E    ">"    wai
        ;
EBC2 : 1F 03    "  "    db  $1F, $03
        ;
EBC4 : F0 79 08    " y "    subb  X7908
EBC7 : F2 EF 81    "   "    sbcb  XEF81
EBCA : F0 FE 05    "   "    subb  XFE05
EBCD : B4 FF 03    "   "    anda  XFF03
EBD0 : A0 FD    "  "    suba  $FD,x
EBD2 : 16    " "    tab
EBD3 : CE FF 03    "   "    ldx  #$FF03
EBD6 : C0 E7    "  "    subb  #$E7
EBD8 : 33    "3"    pulb
EBD9 : 08    " "    inx
EBDA : FF 0F 90    "   "    stx  X0F90
EBDD : FE 1D A1    "   "    ldx  X1DA1
EBE0 : DE B7    "  "    ldx  X00B7
EBE2 : 28 7E    "(~"    bvc  LEC62
EBE4 : BF 04 F2    "   "    sts  X04F2
EBE7 : 3E    ">"    wai
        ;
EBE8 : 51 F3    "Q "    db  $51, $F3
        ;
EBEA : FF 02 1E    "   "    stx  X021E
EBED : 9F 23    " #"    sts  X0023
EBEF : F8 F8 38    "  8"    eorb  XF838
EBF2 : B4 CF A7    "   "    anda  XCFA7
        ;
EBF5 : 51    "Q"    db  $51
        ;
EBF6 : BE AF 86    "   "    lds  XAF86
        ;
EBF9 : F3    " "    db  $F3
        ;
EBFA : 7E 20 F8    "~  "    jmp  L20F8
        ;
EBFD : FB D1 F9    "   "    addb  XD1F9
EC00 : 57    "W"    asrb
EC01 : C0 E3    "  "    subb  #$E3
EC03 : F1 0C 1E    "   "    cmpb  X0C1E
        ;
EC06 : 1F A3    "  "    db  $1F, $A3
        ;
EC08 : FA 7D 40    " }@"    orab  X7D40
        ;
EC0B : C7    " "    db  $C7
        ;
EC0C : 7F 0E 2D    "  -"    clr  X0E2D
EC0F : FF 0F 20    "   "    stx  X0F20
EC12 : FE 3B 86    " ; "    ldx  X3B86
        ;
EC15 : F3    " "    db  $F3
        ;
EC16 : BF C0 C7    "   "    sts  XC0C7
EC19 : E7 00    "  "    stab  $00,x
EC1B : 7D 7C 8C    "}| "    tst  X7C8C
        ;
EC1E : C3 F3    "  "    db  $C3, $F3
        ;
EC20 : A1 9A    "  "    cmpa  $9A,x
EC22 : 9F 8F    "  "    sts  X008F
        ;
EC24 : 71 FD    "q "    db  $71, $FD
        ;
EC26 : 73 80 F2    "s  "    com  X80F2
EC29 : DF 08    "  "    stx  X0008
        ;
EC2B : 4E    "N"    db  $4E
        ;
EC2C : FF 0F F0    "   "    stx  X0FF0
EC2F : F1 31 C0    " 1 "    cmpb  X31C0
EC32 : 9F 07    "  "    sts  X0007
EC34 : E5 F9    "  "    bitb  $F9,x
        ;
EC36 : 4B    "K"    db  $4B
        ;
EC37 : 31    "1"    ins
EC38 : DE 8F    "  "    ldx  X008F
EC3A : 43    "C"    coma
EC3B : B9 BE 3B    "  ;"    adca  XBE3B
EC3E : 84 E5    "  "    anda  #$E5
EC40 : B7 2B BC    " + "    staa  X2BBC
EC43 : FE 0E C0    "   "    ldx  X0EC0
EC46 : E7 63    " c"    stab  $63,x
EC48 : 08    " "    inx
EC49 : 7E 3F 08    "~? "    jmp  L3F08
        ;
EC4C : F3 F3 41    "  A"    db  $F3, $F3, $41
        ;
EC4F : 9C FF    "  "    cpx  X00FF
        ;
EC51 : 1A    " "    db  $1A
        ;
EC52 : B8 DC EF    "   "    eora  XDCEF
        ;
EC55 : 05    " "    db  $05
        ;
EC56 : 82 BF    "  "    sbca  #$BF
        ;
EC58 : 1C D3    "  "    db  $1C, $D3
        ;
EC5A : BE 7F 01    "   "    lds  X7F01
        ;
EC5D : FC    " "    db  $FC
        ;
EC5E : 78 0C D2    "x  "    asl  X0CD2
        ;
EC61 : CF    " "    db  $CF
        ;
EC62        LEC62:
EC62 : 07    " "    tpa
EC63 : C6 7C    " |"    ldab  #$7C
EC65 : 3E    ">"    wai
        ;
EC66 : 1C    " "    db  $1C
        ;
EC67 : E7 E9    "  "    stab  $E9,x
EC69 : AB 14    "  "    adda  $14,x
EC6B : D7 7F    "  "    stab  X007F
EC6D : 0F    " "    sei
EC6E : 40    "@"    nega
EC6F : 5F    "_"    clrb
EC70 : 5F    "_"    clrb
        ;
EC71 : 14    " "    db  $14
        ;
EC72 : FB FB 48    "  H"    addb  XFB48
EC75 : 80 9F    "  "    suba  #$9F
EC77 : 0F    " "    sei
EC78 : 09    " "    dex
EC79 : FF 78 E0    " x "    stx  X78E0
        ;
EC7C : 18 CF 1F    "   "    db  $18, $CF, $1F
        ;
EC7F : 47    "G"    asra
EC80 : B8 7E A5    " ~ "    eora  X7EA5
EC83 : C1 ED    "  "    cmpb  #$ED
EC85 : 3F    "?"    swi
        ;
EC86 : 87    " "    db  $87
        ;
EC87 : 28 F5    "( "    bvc  LEC7E
EC89 : B8 CA F3    "   "    eora  XCAF3
        ;
EC8C : DD    " "    db  $DD
        ;
EC8D : F2 58 82    " X "    sbcb  X5882
        ;
EC90 : 8F    " "    db  $8F
        ;
EC91 : 0F    " "    sei
        ;
EC92 : 05    " "    db  $05
        ;
EC93 : F2 F9 E1    "   "    sbcb  XF9E1
EC96 : 30    "0"    tsx
EC97 : 5F    "_"    clrb
        ;
EC98 : 1F    " "    db  $1F
        ;
EC99 : 0E    " "    cli
EC9A : 5C    "\"    incb
EC9B : F1 D3 C7    "   "    cmpb  XD3C7
        ;
EC9E : 1A    " "    db  $1A
        ;
EC9F : 3F    "?"    swi
        ;
ECA0 : 1E    " "    db  $1E
        ;
ECA1 : 5A    "Z"    decb
ECA2 : 8C D7 E7    "   "    cpx  #$D7E7
ECA5 : 70 78 F7    "px "    neg  X78F7
ECA8 : 29 43    ")C"    bvs  LECED
        ;
ECAA : 1F FC    "  "    db  $1F, $FC
        ;
ECAC : 78 70 98    "xp "    asl  X7098
ECAF : 0F    " "    sei
        ;
ECB0 : 1F    " "    db  $1F
        ;
ECB1 : 0E    " "    cli
ECB2 : 7A E6 F3    "z  "    dec  XE6F3
        ;
ECB5 : 02    " "    db  $02
        ;
ECB6 : 73 7F 3C    "s <"    com  X7F3C
ECB9 : 68 EA    "h "    asl  $EA,x
        ;
ECBB : E3    " "    db  $E3
        ;
ECBC : 27 0E    "' "    beq  LECCC
        ;
ECBE : 5E    "^"    db  $5E
        ;
ECBF : F7 42 68    " Bh"    stab  X4268
ECC2 : DF 57    " W"    stx  X0057
ECC4 : 74 FC C2    "t  "    lsr  XFCC2
ECC7 : 80 F5    "  "    suba  #$F5
        ;
ECC9 : F3 83    "  "    db  $F3, $83
        ;
ECCB : 81 3E    " >"    cmpa  #$3E
ECCD : 7E 70 F0    "~p "    jmp  L70F0
        ;
ECD0 : F1 96 0E    "   "    cmpb  X960E
ECD3 : 76 7C 4D    "v|M"    ror  X7C4D
ECD6 : 27 17    "' "    beq  LECEF
ECD8 : 5A    "Z"    decb
ECD9 : FE 7A C1    " z "    ldx  X7AC1
ECDC : D0 57    " W"    subb  X0057
ECDE : 07    " "    tpa
ECDF : AE BE    "  "    lds  $BE,x
ECE1 : F4 C2 8F    "   "    andb  XC28F
        ;
ECE4 : 15 3C 8F 1F  " <  "    db  $15, $3C, $8F, $1F
        ;
ECE8 : 3E    ">"    wai
        ;
ECE9 : 38    "8"    db  $38
        ;
ECEA : 58    "X"    aslb
ECEB : E5 8F    "  "    bitb  $8F,x
ECED        LECED:
ECED : 0F    " "    sei
        ;
ECEE : 1C    " "    db  $1C
        ;
ECEF        LECEF:
ECEF : FA 9E 41    "  A"    orab  X9E41
ECF2 : 2D 77    "-w"    blt  LED6B
ECF4 : B9 52 45    " RE"    adca  X5245
ECF7 : FF 7E 60    " ~`"    stx  X7E60
ECFA : E0 AE    "  "    subb  $AE,x
ECFC : 2D BC    "- "    blt  LECBA
ECFE : DB 85    "  "    addb  X0085
ED00 : C2 5F    " _"    sbcb  #$5F
ED02 : 16    " "    tab
ED03 : 96 A7    "  "    ldaa  X00A7
ED05 : F8 F0 C1    "   "    eorb  XF0C1
        ;
ED08 : 83    " "    db  $83
        ;
ED09 : 17    " "    tba
ED0A : 3F    "?"    swi
ED0B : E8 C1    "  "    eorb  $C1,x
        ;
ED0D : C3    " "    db  $C3
        ;
ED0E : D7 3E    " >"    stab  X003E
ED10 : D0 D0    "  "    subb  X00D0
ED12 : D7 4B    " K"    stab  X004B
        ;
ED14 : 18    " "    db  $18
        ;
ED15 : AF A7    "  "    sts  $A7,x
ED17 : 0B    " "    sev
ED18 : 2D 5C    "-\"    blt  LED76
ED1A : FA AA AB    "   "    orab  XAAAB
        ;
ED1D : C3 E3    "  "    db  $C3, $E3
        ;
ED1F : EB 12    "  "    addb  $12,x
ED21 : 94 0A    "  "    anda  X000A
ED23 : 7F 7E E0    " ~ "    clr  X7EE0
ED26 : C0 E3    "  "    subb  #$E3
ED28 : 3E    ">"    wai
ED29 : 79 C0 E1    "y  "    rol  XC0E1
        ;
ED2C : CF    " "    db  $CF
        ;
ED2D : 27 20    "' "    beq  LED4F
ED2F : F1 F7 0B    "   "    cmpb  XF70B
        ;
ED32 : 55    "U"    db  $55
        ;
ED33 : BE 32 A1    " 2 "    lds  X32A1
ED36 : F1 4D 15    " M "    cmpb  X4D15
ED39 : F4 DF 45    "  E"    andb  XDF45
ED3C : A4 5F    " _"    anda  $5F,x
ED3E : 0F    " "    sei
ED3F : 01    " "    nop
ED40 : 3E    ">"    wai
ED41 : FE F0 80    "   "    ldx  XF080
        ;
ED44 : C3    " "    db  $C3
        ;
ED45 : 4F    "O"    clra
ED46        LED46:
ED46 : AB 90    "  "    adda  $90,x
        ;
ED48 : 87 1F    "  "    db  $87, $1F
        ;
ED4A : BE 78 A8    " x "    lds  X78A8
ED4D : 34    "4"    des
ED4E : FE F2 E0    "   "    ldx  XF2E0
ED51 : D2 2E    " ."    sbcb  X002E
ED53 : 06    " "    tap
        ;
ED54 : E3    " "    db  $E3
        ;
ED55 : 5D    "]"    tstb
        ;
ED56 : 15    " "    db  $15
        ;
ED57 : BE 7E 94    " ~ "    lds  X7E94
ED5A : E0 D7    "  "    subb  $D7,x
        ;
ED5C : 12    " "    db  $12
        ;
ED5D : 7C F8 C3    "|  "    inc  XF8C3
        ;
ED60 : 03    " "    db  $03
        ;
ED61 : 0E    " "    cli
ED62 : 7E DA 30    "~ 0"    jmp  LDA30
        ;
ED65 : 1E    " "    db  $1E
        ;
ED66 : DB E0    "  "    addb  X00E0
        ;
ED68 : E3    " "    db  $E3
        ;
ED69 : 07    " "    tpa
ED6A : 0D    " "    sec
        ;
ED6B        LED6B:
ED6B : DD    " "    db  $DD
        ;
ED6C : F6 4A 47    " JG"    ldab  X4A47
ED6F : 39    "9"    rts
        ;
ED70 : EA 30    " 0"    orab  $30,x
ED72 : AD 37    " 7"    jsr  $37,x            ;INFO: index jump
ED74 : 56    "V"    rorb
ED75 : 2B CF    "+ "    bmi  LED46
ED77 : A7 53    " S"    staa  $53,x
        ;
ED79 : 1E    " "    db  $1E
        ;
ED7A : 10    " "    sba
ED7B : 7E FC E0    "~  "    jmp  LFCE0
        ;
ED7E : 81 07    "  "    cmpa  #$07
        ;
ED80 : 1F    " "    db  $1F
        ;
ED81 : 7E 68 4C    "~hL"    jmp  L684C
        ;
ED84 : 4C    "L"    inca
ED85 : 4C    "L"    inca
ED86 : 4C    "L"    inca
ED87 : 4C    "L"    inca
ED88 : BB BB BB    "   "    adda  XBBBB
ED8B : BB BB BB    "   "    adda  XBBBB
ED8E : BB BB 44    "  D"    adda  XBB44
ED91 : 44    "D"    lsra
ED92 : 44    "D"    lsra
ED93 : 44    "D"    lsra
ED94 : 44    "D"    lsra
ED95 : 44    "D"    lsra
ED96 : 44    "D"    lsra
ED97 : 44    "D"    lsra
;*************************************;
; zero padding
ED98 : 00 00 00 00 00 00 00 00 
EDA0 : 00 00 00 00 00 00 00 00 
EDA8 : 00 00 00 00 00 00 00 00 
EDB0 : 00 00 00 00 00 00 00 00 
EDB8 : 00 00 00 00 00 00 00 00 
EDC0 : 00 00 00 00 00 00 00 00 
EDC8 : 00 00 00 00 00 00 00 00 
EDD0 : 00 00 00 00 00 00 00 00 
EDD8 : 00 00 00 00 00 00 00 00 
EDE0 : 00 00 00 00 00 00 00 00 
EDE8 : 00 00 00 00 00 00 00 00 
EDF0 : 00 00 00 00 00 00 00 00 
EDF8 : 00 00 00 00 00 00 00 00 
EE00 : 00 00 00 00 00 00 00 00 
EE08 : 00 00 
;*************************************;
;TALKD ldx call
EE0A : 0A 
EE0B : 82 83 
EE0D : 04 
EE0E : 89 28 
EE10 : 82 07 
EE12 : 82 08 
EE14 : 89 05 
EE16 : 86 05 
EE18 : 86 86 
EE1A : 06 
EE1B : 82 88 
;*************************************;
;TKIRQ ldx call #3
EE1D : 28 05 
EE1F : 01 0B 
EE21 : B0 00 
EE23 : C2 80 
EE25 : C2 81 
EE27 : C5 11 
EE29 : C5 12 
EE2B : C9 40 
EE2D : C9 41 
EE2F : D2 11 
EE31 : D2 12 
EE33 : D9 02 
EE35 : D9 03 
EE37 : DD 4E 
EE39 : DD 4F 
EE3B : E2 5F 
EE3D : E2 60 
EE3F : E7 29 
EE41 : E7 2A 
EE43 : ED 82 
EE45 : B0 00 
EE47 : EE 0A 
EE49 : D2 0D 
;*************************************;
;TKIRQ ldx call #2
EE4B : D2 11 
EE4D : EE 0B 
EE4F : EE 0E 
EE51 : EE 12 
EE53 : EE 14 
EE55 : EE 16 
EE57 : EE 18 
EE59 : EE 1B
EE5B : EE 1F 
;*************************************;
;TKIRQ ldx call #1
EE5D : EE 20 
EE5F : 00 00 
EE61 : 01 00 
EE63 : 02 00 
EE65 : 03 00 
EE67 : 04 00 
EE69 : 05 00 
EE6B : 06 00 
EE6D : 07 00 
EE6F : 08 00 
;*************************************;
; Copyright Message
;*************************************;
EE71 : 43    "C"                      ;COPYRIGHT
EE72 : 4F    "O"                      ;
EE73 : 50    "P"                      ;
EE74 : 59    "Y"                      ;
EE75 : 52    "R"                      ;
EE76 : 49    "I"                      ;
EE77 : 47    "G"                      ;
EE78 : 48    "H"                      ;
EE79 : 54    "T"                      ;
EE7A : 2D 57    "-W"                  ;-WILLIAMS
EE7C : 49    "I"                      ;
EE7D : 4C    "L"                      ;
EE7E : 4C    "L"                      ;
EE7F : 49    "I"                      ;
EE80 : 41    "A"                      ;
EE81 : 4D    "M"                      ;
EE82 : 53    "S"                      ;
EE83 : 20 45    " E"                  ;ELECTRONICS
EE85 : 4C    "L"                      ;
EE86 : 45    "E"                      ;
EE87 : 43    "C"                      ;
EE88 : 54    "T"                      ;
EE89 : 52    "R"                      ;
EE8A : 4F    "O"                      ;
EE8B : 4E    "N"                      ;
EE8C : 49    "I"                      ;
EE8D : 43    "C"                      ;
EE8E : 53    "S"                      ;
EE8F : 2D 35    "-5"                  ;-5-25-82
EE91 : 2D 32    "-2"                  ;
EE93 : 35    "5"                      ;
EE94 : 2D 38    "-8"                  ;
EE96 : 32    "2"                      ;
EE97 : 2D 4A    "-J"                  ;-JK-
EE99 : 4B    "K"                      ;
EE9A : 2D    "-"                      ;
;*************************************;
; DIAGNOSTICS
;*************************************;
;TALKD
EE9B : CE EE 0A   ldx  #$EE0A         ;load X with EE0Ah
EE9E : 20 28      bra  LEEC8          ;branch always TIRQ2A
;*************************************;
; TALKING IRQ processing
;*************************************;
;TKIRQ
EEA0 : CE EE 5D   ldx  #$EE5D         ;load X with EE5Dh
EEA3 : 97 14      staa  $14           ;store A in addr 14
EEA5 : 97 16      staa  $16           ;store A in addr 16
EEA7 : 84 1F      anda  #$1F          ;and A with 1Fh
EEA9 : 27 0A      beq  LEEB5          ;branch Z=1 TIRQ1
EEAB : 48         asla                ;arith shift left A
EEAC : BD FF F3   jsr  LFFF3          ;jump sub ROMJMP (Video Sound ROM to ADDX)
EEAF : E6 01      ldab  $01,x         ;load B with X+01h
EEB1 : D7 15      stab  $15           ;store B in addr 15
EEB3 : A6 00      ldaa  $00,x         ;load A with X+00h
;TIRQ1
EEB5 : 27 3C      beq  LEEF3          ;branch Z=1 TIRQ4
EEB7 : 0E         cli                 ;clear interrupts I=0
EEB8 : 48         asla                ;arith shift left A
EEB9 : CE EE 4B   ldx  #$EE4B         ;load X with EE4Bh
EEBC : BD FF F3   jsr  LFFF3          ;jump sub ROMJMP (Video Sound ROM to ADDX)
EEBF : EE 00      ldx  $00,x          ;load X with X+00h
EEC1 : 86 C8      ldaa  #$C8          ;load A with C8h (#200)
;TIRQ2 (count loop 200*73=14600)
EEC3 : 8D 50      bsr  LEF15          ;branch sub TKCD
EEC5 : 4A         deca                ;decr A
EEC6 : 26 FB      bne  LEEC3          ;branch Z=0 TIRQ2
;TIRQ2A
EEC8 : DF 1B      stx  $1B            ;store X in addr 1B
EECA : A6 00      ldaa  $00,x         ;load A with X+00h
EECC : 84 7F      anda  #$7F          ;and A with 7Fh
EECE : 81 0B      cmpa  #$0B          ;compare A with 0Bh
EED0 : 22 23      bhi  LEEF5          ;branch C+Z=0 TIRQ5
EED2 : 48         asla                ;arith shift left A
EED3 : 48         asla                ;arith shift left A
EED4 : CE EE 1D   ldx  #$EE1D         ;load X with EE1Dh
EED7 : BD FF F3   jsr  LFFF3          ;jump sub ROMJMP (Video Sound ROM to ADDX)
EEDA : DF 1D      stx  $1D            ;store X in addr 1D
EEDC : EE 00      ldx  $00,x          ;load X with X+00h
EEDE : DF 17      stx  $17            ;store X in addr 17
EEE0 : DE 1D      ldx  $1D            ;load X with addr 1D
EEE2 : EE 02      ldx  $02,x          ;load X with X+02h
EEE4 : DF 19      stx  $19            ;store X in addr 19
EEE6 : 8D 33      bsr  LEF1B          ;branch sub TKSC
;TIRQ3
EEE8 : DE 1B      ldx  $1B            ;load X with addr 1B
EEEA : A6 00      ldaa  $00,x         ;load A with X+00h
EEEC : 81 0B      cmpa  #$0B          ;compare A with 0Bh
EEEE : 23 10      bls  LEF00          ;branch C+Z=1 TIRQ7
EEF0 : 08         inx                 ;incr X
EEF1 : 20 D5      bra  LEEC8          ;branch always TIRQ2A
;****;
;TIRQ4
EEF3 : 20 12      bra  LEF07          ;branch always TIRQ9
;TIRQ5
EEF5 : A6 00      ldaa  $00,x         ;load A with X+00h
;TIRQ6
EEF7 : 8D 1C      bsr  LEF15          ;branch sub TKCD
EEF9 : 4A         deca                ;decr A
EEFA : 26 FB      bne  LEEF7          ;branch Z=0 TIRQ6
EEFC : 97 14      staa  $14           ;store A in addr 14
EEFE : 20 E8      bra  LEEE8          ;branch always TIRQ3
;TIRQ7
EF00 : 86 32      ldaa  #$32          ;load A with 32h (#50)
;TIRQ8 (count loop 50*73=3650)
EF02 : 8D 11      bsr  LEF15          ;branch sub TKCD
EF04 : 4A         deca                ;decr A
EF05 : 26 FB      bne  LEF02          ;branch Z=0 TIRQ8
;TIRQ9
EF07 : 96 14      ldaa  $14           ;load A with addr 14
EF09 : 7D 00 16   tst  $0016          ;test addr 0016
EF0C : 26 02      bne  LEF10          ;branch Z=0 TIRQ10
EF0E : 96 15      ldaa  $15           ;load A with addr 15
;TIRQ10
EF10 : F6 04 02   ldab  $0402         ;load B with PIA sound select
EF13 : 0E         cli                 ;clear interrupts I=0 (allow interrupts)
EF14 : 39         rts                 ;return subroutine (back to calling Video Sound ROM IRQ)
;*************************************;
;TALKING count down loop (435 cycles)
;*************************************;
;TKCD
EF15 : C6 49      ldab  #$49          ;load B with 49h (#73) (2 cycles)
;TKCDLP
EF17 : 5A         decb                ;decr B (2 cycles)
EF18 : 26 FD      bne  LEF17          ;branch Z=0 TKCDLP (4 cycles)
EF1A : 39         rts                 ;return subroutine (5 cycles)
;*************************************;
;TALKING speech clock (0403)
;*************************************;
;TKSC
EF1B : DE 17      ldx  $17            ;load X with addr 17
EF1D : A6 00      ldaa  $00,x         ;load A with X+00h
EF1F : 7F 00 16   clr  $0016          ;clear addr 0016
EF22 : 08         inx                 ;incr X
EF23 : C6 01      ldab  #$01          ;load B with 01h
;TKSCLP
EF25 : 86 3F      ldaa  #$3F          ;load A with 3Fh (0011 1111)
EF27 : B7 04 03   staa  $0403         ;store A (3Fh) in PIA CR port B (CB2 - speech clock)
EF2A : 84 F7      anda  #$F7          ;and A with 7Fh (1111 0111)(flip bit 3)
EF2C : B7 04 03   staa  $0403         ;store A (F7h) in PIA CR port B (CB2 - speech clock)
EF2F : 58         aslb                ;arith shift left B
EF30 : 26 07      bne  LEF39          ;branch Z=0 TKSD
EF32 : 59         rolb                ;rotate left B
EF33 : 08         inx                 ;incr X
EF34 : 9C 19      cpx  $19            ;compare X with addr 19
EF36 : 26 01      bne  LEF39          ;branch Z=0 TKSD
EF38 : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech data (0401)
;*************************************;
;TKSD
EF39 : 6D 00      tst  $00,x          ;test addr X+00h (7 cycles)
EF3B : 6D 00      tst  $00,x          ;test addr X+00h (7 cycles)
EF3D : 01         nop                 ;(2 cycles)
EF3E : E5 00      bitb  $00,x         ;bit test B with X+00h (5 cycles)
EF40 : 27 07      beq  LEF49          ;branch Z=1 TKSD1
EF42 : 86 3C      ldaa  #$3C          ;load A with 3Ch (0011 1100)
EF44 : B7 04 01   staa  $0401         ;store A (3Ch) in PIA sound select (CA2 - speech data)
EF47 : 20 DC      bra  LEF25          ;branch always TKSCLP
;TKSD1
EF49 : 86 34      ldaa  #$34          ;load A with 34h (0011 0100)(flip bit 3)
EF4B : B7 04 01   staa  $0401         ;store A (34h) in PIA sound select (CA2 - speech data)
EF4E : 20 D5      bra  LEF25          ;branch always TKSCLP
;*************************************;
; zero padding
EF50 : 00 00 00 00 00 00 00 00 
EF58 : 00 00 00 00 00 00 00 00 
EF60 : 00 00 00 00 00 00 00 00 
EF68 : 00 00 00 00 00 00 00 00 
EF70 : 00 00 00 00 00 00 00 00 
EF78 : 00 00 00 00 00 00 00 00 
EF80 : 00 00 00 00 00 
EF85 : 00 00 00 00 00 00 00 00 
EF8D : 00 00 00 00 00 00 00 00 
EF95 : 00 00 00 00 00 00 00 00 
EF9D : 00 00 00 00 00 00 00 00 
EFA5 : 00 00 00 00 00 
EFAA : 00 00 00 00 00 00 00 00 
EFB2 : 00 00 00 00 00 00 00 00 
EFBA : 00 00 00 00 00 00 00 00 
EFC2 : 00 00 00 00 00 00 00 00 
EFCA : 00 00 00 00 00 00 00 00 
EFD2 : 00 00 00 00 00 00 00 00 
EFDA : 00 00 00 00 00
EFDF : 00 00 00 00 00 00 00 00 
EFE7 : 00 00 00 00 00 00 00 00 
EFEF : 00 00 00 00 00 00 00 00 
EFF7 : 00 00 00 
;*************************************;
;ENTRY (from Sound ROM)
;*************************************;
EFFA : 7E EE 9B    jmp  LEE9B         ;ENTRY FOR DIAGNOSTICS
EFFD : 7E EE A0    jmp  LEEA0         ;ENTRY TO TALKING (TKIRQ)

;--------------------------------------------------------------






