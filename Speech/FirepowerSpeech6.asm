        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    FirepowerSpeech6.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  B1E1
        ;  CRC-32:    E56F7AA2
        ;
        ;  Date:    Tue May 11 11:11:31 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Speech ROM IC6 (5T 4973), entry point from Sound ROM 3
        ; contains vocab:
        ; "MISSION" - partial
        ; "ACCOMPLISHED" 
        ; "YOU"
        ; "ARE"
        ;
        ;update 11 May 2021
        ;
org  $D000
;
D000 : 3C    "<"    db  $3C
        ;
D001 : 68 D1    "h "    asl  $D1,x
        ;
D003 : C7 1A    "  "    db  $C7, $1A
        ;
D005 : 46    "F"    rora
        ;
D006 : 15    " "    db  $15
        ;
D007 : 39    "9"    rts
        ;
D008 : B1 C7 8E    "   "    cmpa  XC78E
D00B : 22 0E    "" "    bhi  LD01B
        ;
D00D : 3D FD    "= "    db  $3D, $FD
        ;
D00F : F2 C6 54    "  T"    sbcb  XC654
D012 : 94 30    " 0"    anda  X0030
        ;
D014 : C3 87    "  "    db  $C3, $87
        ;
D016 : 1B    " "    aba
        ;
D017 : 8F    " "    db  $8F
        ;
D018 : 39    "9"    rts
        ;
D019 : 8E 38 E3    " 8 "    lds  #$38E3
D01C : 2D CF    "- "    blt  LCFED
D01E : 5D    "]"    tstb
        ;
D01F : 3C    "<"    db  $3C
        ;
D020 : E5 93    "  "    bitb  $93,x
        ;
D022 : 00    " "    db  $00
        ;
D023 : 09    " "    dex
        ;
D024 : 18    " "    db  $18
        ;
D025 : DE 79    " y"    ldx  X0079
D027 : E2 B3    "  "    sbcb  $B3,x
D029 : BB 39 9C    " 9 "    adda  X399C
        ;
D02C : CC 62    " b"    db  $CC, $62
        ;
D02E : 32    "2"    pula
D02F : 31    "1"    ins
D030 : 99 E3    "  "    adca  X00E3
        ;
D032 : 55    "U"    db  $55
        ;
D033 : 9C E6    "  "    cpx  X00E6
D035 : 66 66    "ff"    ror  $66,x
D037 : CE 1C 64    "  d"    ldx  #$1C64
        ;
D03A : 61    "a"    db  $61
        ;
D03B : 67 36    "g6"    asr  $36,x
D03D : 67 1C    "g "    asr  $1C,x
D03F : 63 19    "c "    com  $19,x
D041 : 9F B3    "  "    sts  X00B3
        ;
D043 : 1C    " "    db  $1C
        ;
D044 : 79 DC 71    "y q"    rol  XDC71
        ;
D047 : 18    " "    db  $18
        ;
D048 : 63 31    "c1"    com  $31,x
D04A : 99 CC    "  "    adca  X00CC
D04C : C5 FB    "  "    bitb  #$FB
D04E : EF 30    " 0"    stx  $30,x
        ;
D050 : 03    " "    db  $03
        ;
D051 : 11    " "    cba
D052 : C6 7D    " }"    ldab  #$7D
D054 : 66 31    "f1"    ror  $31,x
D056 : 99 73    " s"    adca  X0073
        ;
D058 : 18 93    "  "    db  $18, $93
        ;
D05A : 7D F7 61    "} a"    tst  XF761
D05D : 01    " "    nop
D05E : 27 67    "'g"    beq  LD0C7
D060 : 85 1D    "  "    bita  #$1D
        ;
D062 : 3D    "="    db  $3D
        ;
D063 : 9C 38    " 8"    cpx  X0038
        ;
D065 : 4E    "N"    db  $4E
        ;
D066 : 31    "1"    ins
D067 : 23 7D    "#}"    bls  LD0E6
D069 : FB C0 41    "  A"    addb  XC041
D06C : E6 E1    "  "    ldab  $E1,x
D06E : C4 C7    "  "    andb  #$C7
D070 : DE 4C    " L"    ldx  X004C
D072 : 46    "F"    rora
D073 : 8E 22 2D    " "-"    lds  #$222D
D076 : 3F    "?"    swi
        ;
D077 : FC    " "    db  $FC
        ;
D078 : 50    "P"    negb
D079 : 4C    "L"    inca
D07A : F8 C8 68    "  h"    eorb  XC868
D07D : F2 F1 D1    "   "    sbcb  XF1D1
D080 : B4 E2 30    "  0"    anda  XE230
        ;
D083 : E3    " "    db  $E3
D084        XD084:
D084 : 1F    " "    db  $1F
        ;
D085 : BE 30 1C    " 0 "    lds  X301C
D088 : 9C 8C    "  "    cpx  X008C
D08A : 36    "6"    psha
D08B : 6E 5C    "n\"    jmp  $5C,x            ;INFO: index jump
        ;
D08D : CE 3C 51    " <Q"    ldx  #$3C51
D090 : 94 14    "  "    anda  X0014
D092 : D7 FB    "  "    stab  X00FB
        ;
D094 : C3    " "    db  $C3
        ;
D095 : 07    " "    tpa
        ;
D096 : A3 83 18 E3  "    "    db  $A3, $83, $18, $E3
        ;
D09A : 5A    "Z"    decb
        ;
D09B : E3    " "    db  $E3
        ;
D09C : 99 CD    "  "    adca  X00CD
D09E : 86 21    " !"    ldaa  #$21
D0A0 : 8C 7F F8    "   "    cpx  #$7FF8
D0A3 : 44    "D"    lsra
D0A4 : 7C 71 1C    "|q "    inc  X711C
D0A7 : 39    "9"    rts
        ;
D0A8 : 5C    "\"    incb
        ;
D0A9        LD0A9:
D0A9 : 6B    "k"    db  $6B
        ;
D0AA : 8E 34 C6    " 4 "    lds  #$34C6
        ;
D0AD : 38    "8"    db  $38
        ;
D0AE : C6 33    " 3"    ldab  #$33
D0B0 : FF 88 C3    "   "    stx  X88C3
D0B3 : E1 88    "  "    cmpb  $88,x
        ;
D0B5 : E3    " "    db  $E3
        ;
D0B6 : 98 E6    "  "    eora  X00E6
D0B8 : 73 26 71    "s&q"    com  X2671
        ;
D0BB : 87    " "    db  $87
        ;
D0BC : 0E    " "    cli
D0BD : 4F    "O"    clra
D0BE : 3E    ">"    wai
D0BF : 7C 44 3A    "|D:"    inc  X443A
        ;
D0C2 : 8F    " "    db  $8F
        ;
D0C3 : 0E    " "    cli
D0C4 : 2E 1C    ". "    bgt  LD0E2
D0C6 : F1 A3 A3    "   "    cmpb  XA3A3
        ;
D0C9 : 15    " "    db  $15
        ;
D0CA : 4C    "L"    inca
        ;
D0CB : 38 CF    "8 "    db  $38, $CF
        ;
D0CD : FF C0 43    "  C"    stx  XC043
D0D0 : 98 F1    "  "    eora  X00F1
        ;
D0D2 : CC 61    " a"    db  $CC, $61
        ;
D0D4 : CE 76 39    " v9"    ldx  #$7639
        ;
D0D7 : 62    "b"    db  $62
        ;
D0D8 : 98 73    " s"    eora  X0073
D0DA : 8C 3F 7C    " ?|"    cpx  #$3F7C
D0DD : 46    "F"    rora
        ;
D0DE : 1E    " "    db  $1E
        ;
D0DF : 32    "2"    pula
D0E0 : 29 C7    ") "    bvs  LD0A9
        ;
D0E2        LD0E2:
D0E2 : 1C    " "    db  $1C
        ;
D0E3 : E7 8E    "  "    stab  $8E,x
D0E5 : 63 18    "c "    com  $18,x
        ;
D0E7 : 61    "a"    db  $61
        ;
D0E8 : C5 63    " c"    bitb  #$63
D0EA : F7 98 C1    "   "    stab  X98C1
D0ED : 30    "0"    tsx
D0EE : E1 B1    "  "    cmpb  $B1,x
D0F0 : EB BE    "  "    addb  $BE,x
D0F2 : BA 96 18    "   "    oraa  X9618
        ;
D0F5 : 41    "A"    db  $41
        ;
D0F6 : 2C 08    ", "    bge  LD100
D0F8 : 3E    ">"    wai
D0F9 : FF FB 85    "   "    stx  XFB85
        ;
D0FC : 05 05 4E    "  N"    db  $05, $05, $4E
        ;
D0FF : AD 38    " 8"    jsr  $38,x            ;INFO: index jump
D101 : F5 74 D2    " t "    bitb  X74D2
        ;
D104 : 04 18    "  "    db  $04, $18
        ;
D106 : 7F FE F0    "   "    clr  XFEF0
D109 : E0 F1    "  "    subb  $F1,x
D10B : C1 06    "  "    cmpb  #$06
D10D : 9F 4F    " O"    sts  X004F
        ;
D10F : 1D 3A    " :"    db  $1D, $3A
        ;
D111 : A6 0C    "  "    ldaa  $0C,x
        ;
D113        LD113:
D113 : 18    " "    db  $18
        ;
D114 : 7F 7C 38    " |8"    clr  X7C38
D117 : 7C F8 60    "| `"    inc  XF860
        ;
D11A : 21    "!"    db  $21
        ;
D11B : EB D2    "  "    addb  $D2,x
D11D : D7 A7    "  "    stab  X00A7
D11F : 85 06    "  "    bita  #$06
D121 : 0E    " "    cli
D122 : 3F    "?"    swi
D123 : 8E 1E BF    "   "    lds  #$1EBF
        ;
D126 : 1C    " "    db  $1C
        ;
D127 : 08    " "    inx
        ;
D128 : 38    "8"    db  $38
        ;
D129 : E8 E9    "  "    eorb  $E9,x
D12B : F2 F3 47    "  G"    sbcb  XF347
        ;
D12E : 83    " "    db  $83
        ;
D12F : 07    " "    tpa
        ;
D130 : 1F 87    "  "    db  $1F, $87
        ;
D132 : 07    " "    tpa
D133 : DF 87    "  "    stx  X0087
D135 : 07    " "    tpa
D136 : 0C    " "    clc
D137 : 2D 2E    "-."    blt  LD167
        ;
D139 : 5E    "^"    db  $5E
        ;
D13A : BD 2C 20    " , "    jsr  L2C20
        ;
D13D : 61 F3    "a "    db  $61, $F3
        ;
D13F : E0 F0    "  "    subb  $F0,x
D141 : F9 F1 E0    "   "    adcb  XF1E0
D144 : C1 54    " T"    cmpb  #$54
D146 : B1 D7 75    "  u"    cmpa  XD775
D149 : AA 98    "  "    oraa  $98,x
D14B : 0C    " "    clc
        ;
D14C : 1E    " "    db  $1E
        ;
D14D : BE 1E 1F    "   "    lds  X1E1F
D150 : 3F    "?"    swi
        ;
D151 : 1E    " "    db  $1E
        ;
D152 : 0A    " "    clv
D153 : 0B    " "    sev
D154 : 46    "F"    rora
D155 : 97 AF    "  "    staa  X00AF
D157 : 4D    "M"    tsta
D158 : 5A    "Z"    decb
D159 : 80 41    " A"    suba  #$41
D15B : F9 F0 F0    "   "    adcb  XF0F0
D15E : F8 F8 F0    "   "    eorb  XF8F0
D161 : 30    "0"    tsx
D162 : 78 69 7A    "xiz"    asl  X697A
D165 : BA B5 86    "   "    oraa  XB586
D168 : 06    " "    tap
        ;
D169 : 1F    " "    db  $1F
        ;
D16A : 9F 07    "  "    sts  X0007
        ;
D16C : 8F 8F C7 02  "    "    db  $8F, $8F, $C7, $02
        ;
D170 : 85 C3    "  "    bita  #$C3
D172 : 53    "S"    comb
D173 : EB 66    " f"    addb  $66,x
D175 : D2 C0    "  "    sbcb  X00C0
        ;
D177 : 41    "A"    db  $41
        ;
D178 : F8 F8 78    "  x"    eorb  XF878
D17B : F8 FC 70    "  p"    eorb  XFC70
D17E : 2A 1C    "* "    bpl  LD19C
D180 : 36    "6"    psha
D181 : 5F    "_"    clrb
        ;
D182 : 3A    ":"    db  $3A
        ;
D183 : B5 4D 06    " M "    bita  X4D06
D186 : 0F    " "    sei
        ;
D187 : 8F 87 8F C7  "    "    db  $8F, $87, $8F, $C7
D18B : C3    " "    db  $C3
        ;
D18C : 81 A1    "  "    cmpa  #$A1
D18E : C2 EA    "  "    sbcb  #$EA
D190 : F5 6A B4    " j "    bitb  X6AB4
D193 : 60 60    "``"    neg  $60,x
        ;
D195 : FC    " "    db  $FC
        ;
D196 : F8 78 FC    " x "    eorb  X78FC
D199 : 7C 34 15    "|4 "    inc  X3415
D19C        LD19C:
D19C : 0D    " "    sec
        ;
D19D : 1E    " "    db  $1E
        ;
D19E : AF 4D    " M"    sts  $4D,x
D1A0 : A5 A2    "  "    bita  $A2,x
        ;
D1A2 : 03    " "    db  $03
        ;
D1A3 : 0E    " "    cli
D1A4 : 77 CB BA    "w  "    asr  XCBBA
D1A7 : F4 A4 4A    "  J"    andb  XA44A
        ;
D1AA : 14    " "    db  $14
        ;
D1AB : 49    "I"    rola
        ;
D1AC : 5B 7B    "[{"    db  $5B, $7B
        ;
D1AE : AD 56    " V"    jsr  $56,x            ;INFO: index jump
D1B0        LD1B0:
D1B0 : 88 08    "  "    eora  #$08
D1B2 : 23 AF    "# "    bls  LD163
D1B4 : BD F5 D4    "   "    jsr  LF5D4
D1B7 : 88 51    " Q"    eora  #$51
D1B9 : 4A    "J"    deca
D1BA : 4A    "J"    deca
        ;
D1BB : ED DD    "  "    db  $ED, $DD
        ;
D1BD : 6A AA    "j "    dec  $AA,x
D1BF : 80 05    "  "    suba  #$05
        ;
D1C1 : 3A    ":"    db  $3A
        ;
D1C2 : FB BA BC    "   "    addb  XBABC
D1C5 : A9 15    "  "    adca  $15,x
        ;
D1C7 : 14    " "    db  $14
        ;
D1C8 : 91 55    " U"    cmpa  X0055
D1CA : AD EB    "  "    jsr  $EB,x            ;INFO: index jump
D1CC : AA A8    "  "    oraa  $A8,x
D1CE : 08    " "    inx
D1CF : 23 DF    "# "    bls  LD1B0
D1D1 : 7A EB 49    "z I"    dec  XEB49
        ;
D1D4 : 45 52    "ER"    db  $45, $52
        ;
D1D6 : AA 54    " T"    oraa  $54,x
D1D8 : AA AB    "  "    oraa  $AB,x
D1DA : B7 55 80    " U "    staa  X5580
        ;
D1DD        LD1DD:
D1DD : 03 3C    " <"    db  $03, $3C
        ;
D1DF : FB DD 5A    "  Z"    addb  XDD5A
D1E2 : 22 45    ""E"    bhi  LD229
        ;
D1E4 : 55 55    "UU"    db  $55, $55
        ;
D1E6 : D5 69    " i"    bitb  X0069
D1E8 : 74 D5 68    "t h"    lsr  XD568
        ;
D1EB : 00    " "    db  $00
        ;
D1EC : 29 EF    ") "    bvs  LD1DD
D1EE : BD B5 A2    "   "    jsr  LB5A2
D1F1 : 84 A9    "  "    anda  #$A9
        ;
D1F3 : 55    "U"    db  $55
        ;
D1F4 : 56    "V"    rorb
D1F5 : AE 97    "  "    lds  $97,x
D1F7 : 56    "V"    rorb
D1F8 : D5 80    "  "    bitb  X0080
        ;
D1FA : 02    " "    db  $02
        ;
D1FB : AE FB    "  "    lds  $FB,x
D1FD : DB 5A    " Z"    addb  X005A
D1FF : 28 45    "(E"    bvc  LD246
        ;
D201 : 55 55    "UU"    db  $55, $55
        ;
D203 : 6A BA    "j "    dec  $BA,x
D205 : AD 6D    " m"    jsr  $6D,x            ;INFO: index jump
D207 : 54    "T"    lsrb
        ;
D208 : 00    " "    db  $00
        ;
D209 : 19    " "    daa
D20A : DF BB    "  "    stx  X00BB
D20C : AD 51    " Q"    jsr  $51,x            ;INFO: index jump
        ;
D20E : 12    " "    db  $12
        ;
D20F : 54    "T"    lsrb
D210 : AA AD    "  "    oraa  $AD,x
D212 : AD 57    " W"    jsr  $57,x            ;INFO: index jump
        ;
D214 : 55    "U"    db  $55
        ;
D215 : D2 80    "  "    sbcb  X0080
        ;
D217 : 03 3D    " ="    db  $03, $3D
        ;
D219 : F6 ED 5A    "  Z"    ldab  XED5A
D21C : 28 4A    "(J"    bvc  LD268
D21E : 95 55    " U"    bita  X0055
D220 : BA B4 BA    "   "    oraa  XB4BA
D223 : BA 48 00    " H "    oraa  X4800
D226 : AB BF    "  "    adda  $BF,x
D228 : 76 D5 8A    "v  "    ror  XD58A
D22B : 22 A5    "" "    bhi  LD1D2
        ;
D22D : 55 5B 5B    "U[["    db  $55, $5B, $5B
        ;
D230 : 57    "W"    asrb
        ;
D231 : 55    "U"    db  $55
        ;
D232 : A8 04    "  "    eora  $04,x
        ;
D234 : 15    " "    db  $15
        ;
D235 : D7 EF    "  "    stab  X00EF
D237 : 5A    "Z"    decb
D238 : B1 12 2A    "  *"    cmpa  X122A
        ;
D23B : 55    "U"    db  $55
        ;
D23C : 57    "W"    asrb
        ;
D23D : 55 75    "Uu"    db  $55, $75
        ;
D23F : 6A AC    "j "    dec  $AC,x
D241 : 20 42    " B"    bra  LD285
        ;
D243 : AE FE    "  "    lds  $FE,x
D245 : EB 56    " V"    addb  $56,x
D247 : 24 8A    "$ "    bcc  LD1D3
D249 : A5 55    " U"    bita  $55,x
        ;
D24B        LD24B:
D24B : 75    "u"    db  $75
        ;
D24C : 5D    "]"    tstb
D24D : 56    "V"    rorb
D24E : AA 8A    "  "    oraa  $8A,x
        ;
D250 : 02 15    "  "    db  $02, $15
        ;
D252 : EF D7    "  "    stx  $D7,x
D254 : AA A9    "  "    oraa  $A9,x
        ;
D256 : 12    " "    db  $12
        ;
D257 : 4A    "J"    deca
D258 : 96 AB    "  "    ldaa  X00AB
D25A : D2 EA    "  "    sbcb  X00EA
D25C : AA 55    " U"    oraa  $55,x
D25E : 28 08    "( "    bvc  LD268
        ;
D260 : 5B    "["    db  $5B
        ;
D261        LD261:
D261 : BF AF 55    "  U"    sts  XAF55
D264 : 92 24    " $"    sbca  X0024
D266 : 94 B5    "  "    anda  X00B5
D268        LD268:
D268 : AE AA    "  "    lds  $AA,x
D26A : D2 AA    "  "    sbcb  X00AA
        ;
D26C : 55    "U"    db  $55
        ;
D26D : 56    "V"    rorb
        ;
D26E : 04 15    "  "    db  $04, $15
        ;
D270 : BB EF 6D    "  m"    adda  XEF6D
D273 : 64 84    "d "    lsr  $84,x
D275 : 95 35    " 5"    bita  X0035
        ;
D277 : 55    "U"    db  $55
        ;
D278 : AA AA    "  "    oraa  $AA,x
D27A : A5 55    " U"    bita  $55,x
        ;
D27C : 55    "U"    db  $55
        ;
D27D : 50    "P"    negb
        ;
D27E : 61 55    "aU"    db  $61, $55
        ;
D280 : FB 75 AD    " u "    addb  X75AD
D283 : 2A 15    "* "    bpl  LD29A
        ;
D285        LD285:
D285 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
        ;
D289 : 54    "T"    lsrb
D28A : AA AB    "  "    oraa  $AB,x
        ;
D28C : 55    "U"    db  $55
        ;
D28D : 6A A2    "j "    dec  $A2,x
D28F : AA 
;*************************************;
;called by JMPTBL
D290 : AA    "  "    oraa  $AA,x
D291 : 08    " "    inx
D292 : 5F    "_"    clrb
D293 : E0 5D    " ]"    subb  $5D,x
D295 : B5 03 7A    "  z"    bita  X037A
D298 : 8A AB    "  "    oraa  #$AB
D29A        LD29A:
D29A : A8 AD    "  "    eora  $AD,x
D29C : B5 12 F5    "   "    bita  X12F5
D29F : 2A AA    "* "    bpl  LD24B
D2A1 : AA 55    " U"    oraa  $55,x
        ;
D2A3 : 55 52    "UR"    db  $55, $52
        ;
D2A5 : 09    " "    dex
D2A6 : 7F C0 BD    "   "    clr  XC0BD
D2A9 : B4 07 E8    "   "    anda  X07E8
D2AC : 92 B7    "  "    sbca  X00B7
D2AE : 91 5D    " ]"    cmpa  X005D
D2B0 : AA 27    " '"    oraa  $27,x
D2B2 : E8 2B    " +"    eorb  $2B,x
        ;
D2B4 : 55    "U"    db  $55
        ;
D2B5 : 22 AA    "" "    bhi  LD261
D2B7 : 3F    "?"    swi
D2B8        LD2B8:
D2B8 : F0 2E BD    " . "    subb  X2EBD
D2BB : 01    " "    nop
D2BC : 7D 14 97    "}  "    tst  X1497
D2BF : D4 55    " U"    andb  X0055
D2C1 : 77 41 5D    "wA]"    asr  X415D
D2C4 : 49    "I"    rola
D2C5 : 25 A8    "% "    bcs  LD26F
D2C7 : 4F    "O"    clra
D2C8 : F8 17 3F    "  ?"    eorb  X173F
        ;
D2CB : 00 ED    "  "    db  $00, $ED
        ;
D2CD : 6A 07    "j "    dec  $07,x
D2CF : EA A2    "  "    orab  $A2,x
D2D1 : BE 85 55    "  U"    lds  X8555
        ;
D2D4 : 51 55    "QU"    db  $51, $55
        ;
D2D6 : 4A    "J"    deca
D2D7 : 3F    "?"    swi
D2D8 : C1 51    " Q"    cmpb  #$51
        ;
D2DA : FC 05    "  "    db  $FC, $05
        ;
D2DC : 4F    "O"    clra
D2DD : E0 56    " V"    subb  $56,x
D2DF : BE A1 6A    "  j"    lds  XA16A
D2E2 : DA 15    "  "    orab  X0015
D2E4 : 2A D2    "* "    bpl  LD2B8
D2E6 : 07    " "    tpa
D2E7 : F9 84 3F    "  ?"    adcb  X843F
D2EA : 91 40    " @"    cmpa  X0040
        ;
D2EC : FD    " "    db  $FD
        ;
D2ED : 58    "X"    aslb
D2EE : 0F    " "    sei
D2EF : 77 50 55    "wPU"    asr  X5055
D2F2 : AD 12    "  "    jsr  $12,x            ;INFO: index jump
D2F4 : AA F4    "  "    oraa  $F4,x
D2F6 : FE 35 22    " 5""    ldx  X3522
D2F9 : E5 54    " T"    bitb  $54,x
D2FB : 2A AB    "* "    bpl  LD2A8
D2FD : D5 55    " U"    bitb  X0055
D2FF : 5A    "Z"    decb
D300 : A4 8A    "  "    anda  $8A,x
D302 : AA EA    "  "    oraa  $EA,x
D304 : 6A 97    "j "    dec  $97,x
D306 : F5 E4 28    "  ("    bitb  XE428
D309 : 96 8A    "  "    ldaa  X008A
D30B : A5 D5    "  "    bita  $D5,x
        ;
D30D : 75    "u"    db  $75
        ;
D30E : 2A AA    "* "    bpl  LD2BA
D310 : AA AA    "  "    oraa  $AA,x
D312 : AA AA    "  "    oraa  $AA,x
D314 : AA AA    "  "    oraa  $AA,x
        ;
D316 : 55    "U"    db  $55
        ;
D317 : 56    "V"    rorb
D318 : AA AA    "  "    oraa  $AA,x
D31A : AA 95    "  "    oraa  $95,x
        ;
D31C : 55 55 55    "UUU"    db  $55, $55, $55
        ;
D31F : 60 2E    "`."    neg  $2E,x
D321 : D2 AA    "  "    sbcb  X00AA
D323 : BD 15 55    "  U"    jsr  L1555
        ;
D326 : 55    "U"    db  $55
        ;
D327 : 56    "V"    rorb
D328 : A5 2A    " *"    bita  $2A,x
D32A : F5 2A AA    " * "    bitb  X2AAA
D32D : AA 55    " U"    oraa  $55,x
D32F : AA AA    "  "    oraa  $AA,x
D331 : AA AA    "  "    oraa  $AA,x
D333 : AB 6A    " j"    adda  $6A,x
        ;
D335 : 55    "U"    db  $55
        ;
D336 : 56    "V"    rorb
D337 : A2 AD    "  "    sbca  $AD,x
        ;
D339 : 55    "U"    db  $55
        ;
D33A : 57    "W"    asrb
        ;
D33B : FD 00    "  "    db  $FD, $00
        ;
D33D : FE 12 AF    "   "    ldx  X12AF
D340 : E0 57    " W"    subb  $57,x
D342 : 6A 85    "j "    dec  $85,x
D344 : 7A 89 57    "z W"    dec  X8957
D347 : A8 5A    " Z"    eora  $5A,x
D349 : AA AA    "  "    oraa  $AA,x
D34B : AA AD    "  "    oraa  $AD,x
D34D : 95 5F    " _"    bita  X005F
D34F : 68 01    "h "    asl  $01,x
D351 : FE 0A 6F    "  o"    ldx  X0A6F
D354 : E0 3E    " >"    subb  $3E,x
D356 : AA 13    "  "    oraa  $13,x
D358 : EA 25    " %"    orab  $25,x
        ;
D35A : 5B    "["    db  $5B
        ;
D35B : A0 7E    " ~"    suba  $7E,x
D35D : 92 AB    "  "    sbca  X00AB
D35F : D4 5E    " ^"    andb  X005E
        ;
D361 : 00    " "    db  $00
        ;
D362 : 7F 07 0B    "   "    clr  X070B
D365 : F8 2B AD    " + "    eorb  X2BAD
D368 : 81 7D    " }"    cmpa  #$7D
        ;
D36A : 14 93    "  "    db  $14, $93
        ;
D36C : F8 2B B6    " + "    eorb  X2BB6
D36F : A2 BD    "  "    sbca  $BD,x
D371 : 40    "@"    nega
D372 : 3F    "?"    swi
        ;
D373 : A3 03    "  "    db  $A3, $03
        ;
D375 : FE 0A 5F    "  _"    ldx  X0A5F
D378 : C0 5A    " Z"    subb  #$5A
D37A : BC 0B E9    "   "    cpx  X0BE9
        ;
D37D : 55    "U"    db  $55
        ;
D37E : 7A 47 57    "zGW"    dec  X4757
D381 : 80 FD    "  "    suba  #$FD
        ;
D383 : 3C    "<"    db  $3C
        ;
D384 : 0F    " "    sei
D385 : F1 C0 5F    "  _"    cmpb  XC05F
D388 : 95 01    "  "    bita  X0001
D38A : F9 68 5E    " h^"    adcb  X685E
D38D        LD38D:
D38D : D5 54    " T"    bitb  X0054
        ;
D38F : 55    "U"    db  $55
        ;
D390 : F0 38 FF    " 8 "    subb  X38FF
D393 : 01    " "    nop
        ;
D394 : DD FC 03    "   "    db  $DD, $FC, $03
        ;
D397 : 2F E0    "/ "    ble  LD379
        ;
D399 : 12    " "    db  $12
        ;
D39A        LD39A:
D39A : 7F 49 8A    " I "    clr  X498A
D39D : F4 74 16    " t "    andb  X7416
D3A0 : 07    " "    tpa
D3A1 : 97 E8    "  "    staa  X00E8
        ;
D3A3 : 75 5B    "u["    db  $75, $5B
        ;
D3A5 : 95 40    " @"    bita  X0040
D3A7 : BA 56 87    " V "    oraa  X5687
        ;
D3AA : 55    "U"    db  $55
        ;
D3AB : D2 C2    "  "    sbcb  X00C2
D3AD : D2 78    " x"    sbcb  X0078
D3AF : 70 3C 3F    "p<?"    neg  X3C3F
        ;
D3B2 : 1F 45    " E"    db  $1F, $45
        ;
D3B4 : D2 D0    "  "    sbcb  X00D0
D3B6 : B2 3A 95    " : "    sbca  X3A95
D3B9 : A5 55    " U"    bita  $55,x
        ;
D3BB : 42    "B"    db  $42
        ;
D3BC        LD3BC:
D3BC : 6A ED    "j "    dec  $ED,x
D3BE : AA DD    "  "    oraa  $DD,x
D3C0 : A4 A8    "  "    anda  $A8,x
D3C2 : 96 90    "  "    ldaa  X0090
D3C4 : AB A8    "  "    adda  $A8,x
D3C6 : 5D    "]"    tstb
D3C7 : 27 D1    "' "    beq  LD39A
        ;
D3C9 : 71 75    "qu"    db  $71, $75
        ;
D3CB : 17    " "    tba
D3CC : 0B    " "    sev
D3CD : A2 B1    "  "    sbca  $B1,x
        ;
D3CF : 55    "U"    db  $55
        ;
D3D0 : AF 15    "  "    sts  $15,x
D3D2 : 74 BA C1    "t  "    lsr  XBAC1
D3D5 : 5A    "Z"    decb
D3D6 : 5A    "Z"    decb
D3D7 : 92 95    "  "    sbca  X0095
        ;
D3D9 : 65 55    "eU"    db  $65, $55
        ;
D3DB : 5A    "Z"    decb
D3DC : 7D 0A D2    "}  "    tst  X0AD2
D3DF : AA D5    "  "    oraa  $D5,x
D3E1 : 25 AA    "% "    bcs  LD38D
        ;
D3E3 : 9D    " "    db  $9D
        ;
D3E4 : 5F    "_"    clrb
D3E5 : 56    "V"    rorb
D3E6 : D5 01    "  "    bitb  X0001
        ;
D3E8 : 52 55    "RU"    db  $52, $55
        ;
D3EA : 4A    "J"    deca
D3EB : BB A5 C5    "   "    adda  XA5C5
D3EE : AA 5F    " _"    oraa  $5F,x
D3F0 : E8 2A    " *"    eorb  $2A,x
D3F2 : 95 2A    " *"    bita  X002A
D3F4 : A9 55    " U"    adca  $55,x
        ;
D3F6 : 55    "U"    db  $55
        ;
D3F7 : 2D 6A    "-j"    blt  LD463
D3F9 : 2E 96    ". "    bgt  LD391
D3FB : A0 7F    "  "    suba  $7F,x
D3FD : C1 E8    "  "    cmpb  #$E8
        ;
D3FF : 55 15 52    "U R"    db  $55, $15, $52
        ;
D402 : BD 4A AA    " J "    jsr  L4AAA
D405 : AA B4    "  "    oraa  $B4,x
        ;
D407 : 55    "U"    db  $55
        ;
D408 : 6A 09    "j "    dec  $09,x
D40A : FF 05 E1    "   "    stx  X05E1
D40D : 70 97 42    "p B"    neg  X9742
D410 : DA EA    "  "    orab  X00EA
D412 : 2B A8    "+ "    bmi  LD3BC
D414 : B5 25 50    " %P"    bita  X2550
D417 : B7 F8 1F    "   "    staa  XF81F
D41A : 25 A0    "% "    bcs  LD3BC
D41C : BA 85 DA    "   "    oraa  X85DA
D41F : 5D    "]"    tstb
        ;
D420 : 4B 62    "Kb"    db  $4B, $62
        ;
D422        LD422:
D422 : 5A    "Z"    decb
D423 : 92 85    "  "    sbca  X0085
D425        LD425:
D425 : 4F    "O"    clra
        ;
D426 : FC    " "    db  $FC
        ;
D427 : 0F    " "    sei
D428 : 31    "1"    ins
D429 : C1 6E    " n"    cmpb  #$6E
D42B : 22 F5    "" "    bhi  LD422
D42D : 56    "V"    rorb
D42E : A5 A8    "  "    bita  $A8,x
D430 : AD 24    " $"    jsr  $24,x            ;INFO: index jump
D432 : A2 5F    " _"    sbca  $5F,x
D434 : F8 1E A3    "   "    eorb  X1EA3
D437 : 84 EC    "  "    anda  #$EC
D439 : 25 EA    "% "    bcs  LD425
D43B : AA AB    "  "    oraa  $AB,x
D43D : 60 BA    "` "    neg  $BA,x
D43F : A1 A2    "  "    cmpa  $A2,x
D441 : 3F    "?"    swi
D442 : F0 1F 0B    "   "    subb  X1F0B
D445 : A0 F8    "  "    suba  $F8,x
        ;
D447 : 1E    " "    db  $1E
        ;
D448 : AD 4A    " J"    jsr  $4A,x            ;INFO: index jump
D44A : CB A8    "  "    addb  #$A8
D44C : 74 54 AA    "tT "    lsr  X54AA
        ;
D44F : 1F    " "    db  $1F
        ;
D450 : F0 3B A3    " ; "    subb  X3BA3
D453 : 40    "@"    nega
D454 : F8 64 F8    " d "    eorb  X64F8
D457 : 7C 1F 0F    "|  "    inc  X1F0F
D45A : 07    " "    tpa
D45B : C2 C1    "  "    sbcb  #$C1
D45D : BF E0 3E    "  >"    sts  XE03E
D460 : 2F 03    "/ "    ble  LD465
        ;
D462 : 71    "q"    db  $71
        ;
D463        LD463:
D463 : 2B D1    "+ "    bmi  LD436
        ;
D465        LD465:
D465 : DC    " "    db  $DC
        ;
D466 : 96 89    "  "    ldaa  X0089
D468 : 2D 12    "- "    blt  LD47C
D46A : B8 2F F0    " / "    eora  X2FF0
D46D : 3F    "?"    swi
D46E : 26 85    "& "    bne  LD3F5
D470 : 6A 42    "jB"    dec  $42,x
D472 : BC 5E 17    " ^ "    cpx  X5E17
D475 : D0 F0    "  "    subb  X00F0
D477 : B8 9C 8F    "   "    eora  X9C8F
D47A : F0 1F 4E    "  N"    subb  X1F4E
D47D : 08    " "    inx
D47E : 7F 06 AD    "   "    clr  X06AD
D481 : AB 52    " R"    adda  $52,x
D483 : E8 55    " U"    eorb  $55,x
D485 : 4A    "J"    deca
D486 : 0B    " "    sev
        ;
D487 : 8F    " "    db  $8F
        ;
D488 : F8 0F CA    "   "    eorb  X0FCA
D48B : 50    "P"    negb
D48C : 77 C0 97    "w  "    asr  XC097
D48F : D4 6B    " k"    andb  X006B
        ;
D491 : EC    " "    db  $EC
        ;
D492 : 2B 54    "+T"    bmi  LD4E8
D494        LD494:
D494 : 24 9F    "$ "    bcc  LD435
D496 : F8 05 FA    "   "    eorb  X05FA
D499 : 80 5E    " ^"    suba  #$5E
D49B : DA D5    "  "    orab  X00D5
D49D : 56    "V"    rorb
D49E : 5D    "]"    tstb
        ;
D49F : 15    " "    db  $15
        ;
D4A0 : 29 52    ")R"    bvs  LD4F4
D4A2 : AB 43    " C"    adda  $43,x
D4A4 : EA EF    "  "    orab  $EF,x
        ;
D4A6 : 00 FC 1F    "   "    db  $00, $FC, $1F
        ;
D4A9 : 47    "G"    asra
D4AA        XD4AA:
D4AA : A8 BD    "  "    eora  $BD,x
        ;
D4AC : 05    " "    db  $05
        ;
D4AD : B5 4A A4    " J "    bita  X4AA4
D4B0 : AB 52    " R"    adda  $52,x
D4B2 : 97 EC    "  "    staa  X00EC
        ;
D4B4 : 03    " "    db  $03
        ;
D4B5 : F8 7E 1F    " ~ "    eorb  X7E1F
        ;
D4B8 : 41    "A"    db  $41
        ;
D4B9 : F4 15 2F    "  /"    andb  X152F
        ;
D4BC : 51    "Q"    db  $51
        ;
D4BD : 5D    "]"    tstb
D4BE : 26 D4    "& "    bne  LD494
D4C0 : BD 08 1F    "   "    jsr  L081F
D4C3 : E1 DC    "  "    cmpb  $DC,x
D4C5 : 7D 07 D4    "}  "    tst  X07D4
        ;
D4C8 : 15 4B    " K"    db  $15, $4B
        ;
D4CA : 54    "T"    lsrb
D4CB : BE 8A DA    "   "    lds  X8ADA
D4CE : B8 B0 1F    "   "    eora  XB01F
        ;
D4D1 : C3    " "    db  $C3
        ;
D4D2 : 9C 7D    " }"    cpx  X007D
D4D4 : 07    " "    tpa
D4D5 : E8 1A    "  "    eorb  $1A,x
D4D7 : A9 A8    "  "    adca  $A8,x
D4D9 : BD 45 EA    " E "    jsr  L45EA
D4DC : AD 40    " @"    jsr  $40,x            ;INFO: index jump
D4DE : 3F    "?"    swi
        ;
D4DF : 87 38    " 8"    db  $87, $38
        ;
D4E1 : FA 0F D0    "   "    orab  X0FD0
D4E4 : 2B 55    "+U"    bmi  LD53B
        ;
D4E6 : 51 7B 15    "Q{ "    db  $51, $7B, $15
        ;
D4E9 : EA 3E    " >"    orab  $3E,x
D4EB : 80 7F    "  "    suba  #$7F
D4ED : 0D    " "    sec
        ;
D4EE : 61    "a"    db  $61
        ;
D4EF : FA 0F D0    "   "    orab  X0FD0
D4F2 : 2D 55    "-U"    blt  LD549
D4F4        LD4F4:
D4F4 : 49    "I"    rola
        ;
D4F5 : 7B 15    "{ "    db  $7B, $15
        ;
D4F7        LD4F7:
D4F7 : EA 5D    " ]"    orab  $5D,x
D4F9 : 40    "@"    nega
D4FA : 3F    "?"    swi
D4FB : 86 E1    "  "    ldaa  #$E1
D4FD : FA 0F D0    "   "    orab  X0FD0
D500 : 2D 55    "-U"    blt  LD557
D502 : 49    "I"    rola
D503 : 7A 95 E9    "z  "    dec  X95E9
D506 : 6D 40    "m@"    tst  $40,x
D508 : 3F    "?"    swi
D509 : 85 71    " q"    bita  #$71
D50B : FA 0F D0    "   "    orab  X0FD0
D50E : 2D 55    "-U"    blt  LD565
D510 : 44    "D"    lsra
D511 : FA 8B D5    "   "    orab  X8BD5
        ;
D514 : 3D    "="    db  $3D
        ;
D515 : 40    "@"    nega
D516 : 3F    "?"    swi
D517 : 82 F1    "  "    sbca  #$F1
D519 : FA 0F E0    "   "    orab  X0FE0
D51C : 2D 55    "-U"    blt  LD573
D51E : A1 7D    " }"    cmpa  $7D,x
D520 : 53    "S"    comb
D521 : B5 5E 00    " ^ "    bita  X5E00
        ;
D524 : 1F    " "    db  $1F
        ;
D525 : C0 F1    "  "    subb  #$F1
D527 : EF 01    "  "    stx  $01,x
D529 : F0 06 BB    "   "    subb  X06BB
D52C : EA BF    "  "    orab  $BF,x
D52E : AA FA    "  "    oraa  $FA,x
D530 : AA 80    "  "    oraa  $80,x
        ;
D532 : 1F    " "    db  $1F
        ;
D533 : C0 3A    " :"    subb  #$3A
        ;
D535 : CF    " "    db  $CF
        ;
D536 : 01    " "    nop
D537 : 7E 01 7F    "~  "    jmp  L017F
        ;
D53A : A4 57    " W"    anda  $57,x
D53C : 64 2D    "d-"    lsr  $2D,x
D53E : D4 40    " @"    andb  X0040
        ;
D540 : 1F    " "    db  $1F
        ;
D541 : F8 0F BD    "   "    eorb  X0FBD
D544 : 28 15    "( "    bvc  LD55B
D546 : 54    "T"    lsrb
D547 : FB 54 D2    " T "    addb  X54D2
D54A        XD54A:
D54A : 4A    "J"    deca
D54B : AA AE    "  "    oraa  $AE,x
D54D : A0 29    " )"    suba  $29,x
D54F : 6D 75    "mu"    tst  $75,x
D551 : D5 AA    "  "    bitb  X00AA
D553 : A1 0B    "  "    cmpa  $0B,x
D555        XD555:
D555 : FF 54 40    " T@"    stx  X5440
D558 : 97 55    " U"    staa  X0055
D55A : BA 89 55    "  U"    oraa  X8955
        ;
D55D : 5E    "^"    db  $5E
        ;
D55E : A8 94    "  "    eora  $94,x
D560 : 4A    "J"    deca
D561 : A1 2F    " /"    cmpa  $2F,x
D563 : FF A8 02    "   "    stx  XA802
D566 : B5 6D 42    " mB"    bita  X6D42
        ;
D569 : 55    "U"    db  $55
        ;
D56A : 5F    "_"    clrb
D56B : D5 22    " ""    bitb  X0022
D56D : 2A 88    "* "    bpl  LD4F7
D56F : 88 FF    "  "    eora  #$FF
D571 : FB 00 3B    "  ;"    addb  X003B
D574 : 6E 80    "n "    jmp  $80,x            ;INFO: index jump
        ;
D576 : 55    "U"    db  $55
        ;
D577 : 7F 54 A2    " T "    clr  X54A2
D57A : B6 A2 08    "   "    ldaa  XA208
D57D : 57    "W"    asrb
D57E : FF A8 03    "   "    stx  XA803
D581 : DF 50    " P"    stx  X0050
D583 : 09    " "    dex
D584 : 6F E9    "o "    clr  $E9,x
D586 : 22 6F    ""o"    bhi  LD5F7
D588        LD588:
D588 : 54    "T"    lsrb
        ;
D589 : 41    "A"    db  $41
        ;
D58A        XD58A:
D58A : 25 7F    "% "    bcs  LD60B
        ;
D58C : FD 00    "  "    db  $FD, $00
        ;
D58E : 6D FA    "m "    tst  $FA,x
D590 : 01    " "    nop
D591 : 17    " "    tba
D592 : F6 A0 AB    "   "    ldab  XA0AB
D595 : BD 08 89    "   "    jsr  L0889
D598 : 53    "S"    comb
D599 : FF D4 03    "   "    stx  XD403
D59C : 5F    "_"    clrb
D59D : C1 02    "  "    cmpb  #$02
D59F : BF 6C 12    " l "    sts  X6C12
D5A2 : D7 D4    "  "    stab  X00D4
        ;
D5A4 : 42    "B"    db  $42
        ;
D5A5 : 54    "T"    lsrb
D5A6 : 97 FF    "  "    staa  X00FF
D5A8 : C0 29    " )"    subb  #$29
D5AA : BF 20 0B    "   "    sts  X200B
D5AD : BD D1 13    "   "    jsr  LD113
D5B0 : 77 68 12    "wh "    asr  X6812
D5B3 : 54    "T"    lsrb
D5B4 : 97 FF    "  "    staa  X00FF
D5B6 : C0 25    " %"    subb  #$25
        ;
D5B8 : FD    " "    db  $FD
        ;
D5B9 : 20 15    "  "    bra  LD5D0
        ;
D5BB : BF 52 15    " R "    sts  X5215
        ;
D5BE : 7B    "{"    db  $7B
        ;
D5BF : A8 42    " B"    eora  $42,x
D5C1 : A9 57    " W"    adca  $57,x
D5C3 : FF 80 47    "  G"    stx  X8047
        ;
D5C6 : ED    " "    db  $ED
        ;
D5C7 : 40    "@"    nega
D5C8 : 25 BE    "% "    bcs  LD588
D5CA : A8 4B    " K"    eora  $4B,x
D5CC : 7F F5 01    "   "    clr  XF501
        ;
D5CF : 1A    " "    db  $1A
        ;
D5D0        LD5D0:
D5D0 : 57    "W"    asrb
D5D1 : EF 81    "  "    stx  $81,x
D5D3 : 47    "G"    asra
D5D4 : C4 00    "  "    andb  #$00
D5D6 : 01    " "    nop
D5D7 : 77 55 37    "wU7"    asr  X5537
D5DA : 7F FA A5    "   "    clr  XFAA5
D5DD : 6A B7    "j "    dec  $B7,x
D5DF : FF 01 07    "   "    stx  X0107
D5E2 : A9 00    "  "    adca  $00,x
        ;
D5E4 : 12    " "    db  $12
        ;
D5E5 : FB F4 94    "   "    addb  XF494
D5E8 : DA E9    "  "    orab  X00E9
        ;
D5EA : 00 12    "  "    db  $00, $12
        ;
D5EC : BF FE 18    "   "    sts  XFE18
        ;
D5EF : 1D    " "    db  $1D
        ;
D5F0 : 74 02 16    "t  "    lsr  X0216
D5F3 : BF EA 94    "   "    sts  XEA94
        ;
D5F6 : 55    "U"    db  $55
        ;
D5F7        LD5F7:
D5F7 : 7A 84 22    "z ""    dec  X8422
D5FA : BF FE 58    "  X"    sts  XFE58
        ;
D5FD : 14    " "    db  $14
        ;
D5FE : B0 0D 2C    "  ,"    suba  X0D2C
D601 : FF 5B 54    " [T"    stx  X5B54
D604 : 2A A9    "* "    bpl  LD5AF
D606 : 24 05    "$ "    bcc  LD60D
D608 : 7F FE E0    "   "    clr  XFEE0
        ;
D60B        LD60B:
D60B : 61    "a"    db  $61
        ;
D60C : 40    "@"    nega
        ;
D60D        LD60D:
D60D : 1D    " "    db  $1D
        ;
D60E : 7F C4 6C    "  l"    clr  XC46C
D611 : D7 E2    "  "    stab  X00E2
D613 : 84 02    "  "    anda  #$02
        ;
D615 : DD    " "    db  $DD
        ;
D616 : 7E FC B8    "~  "    jmp  LFCB8
        ;
D619 : 68 00    "h "    asl  $00,x
D61B : 77 FE 05    "w  "    asr  XFE05
D61E : 27 FD    "' "    beq  LD61D
        ;
D620 : 14    " "    db  $14
        ;
D621 : 01    " "    nop
D622        XD622:
D622 : EB B4    "  "    addb  $B4,x
D624 : 3B    ";"    rti
        ;
D625 : FB E1 00    "   "    addb  XE100
D628 : 06    " "    tap
D629 : FF E0 81    "   "    stx  XE081
D62C : FF AA 00    "   "    stx  XAA00
        ;
D62F : DD    " "    db  $DD
        ;
D630 : EA 05    "  "    orab  $05,x
D632 : 6F FA    "o "    clr  $FA,x
D634 : A2 00    "  "    sbca  $00,x
        ;
D636 : 1F FC 12 1F  "    "    db  $1F, $FC, $12, $1F
        ;
D63A : FB 40 16    " @ "    addb  X4016
D63D : FE 42 17    " B "    ldx  X4217
D640 : DE E9    "  "    ldx  X00E9
D642 : 50    "P"    negb
        ;
D643 : 04    " "    db  $04
        ;
D644 : 7F E2 01    "   "    clr  XE201
D647 : FF B8 02    "   "    stx  XB802
D64A : 5F    "_"    clrb
D64B : E8 82    "  "    eorb  $82,x
D64D : 7D F5 49    "} I"    tst  XF549
D650 : 40    "@"    nega
        ;
D651 : 21    "!"    db  $21
        ;
D652 : FF 58 03    " X "    stx  X5803
D655 : FF C4 02    "   "    stx  XC402
D658 : DF 70    " p"    stx  X0070
D65A : 82 DF    "  "    sbca  #$DF
D65C : B5 4B 00    " K "    bita  X4B00
        ;
D65F : 21    "!"    db  $21
        ;
D660 : FF 70 07    " p "    stx  X7007
D663 : BF C2 05    "   "    sts  XC205
D666 : 7D D0 84    "}  "    tst  XD084
D669 : F7 DA 93    "   "    stab  XDA93
        ;
D66C : 00    " "    db  $00
        ;
D66D : 31    "1"    ins
D66E : FE F0 0D    "   "    ldx  XF00D
D671 : FF 50 03    " P "    stx  X5003
D674 : 5F    "_"    clrb
D675 : A4 81    "  "    anda  $81,x
D677 : BD EE 2A    "  *"    jsr  LEE2A
D67A : 40    "@"    nega
        ;
D67B : 51    "Q"    db  $51
        ;
D67C : FF 70 24    " p$"    stx  X7024
D67F : FF D8 02    "   "    stx  XD802
D682 : 3F    "?"    swi
D683 : 95 04    "  "    bita  X0004
D685 : 77 ED 94    "w  "    asr  XED94
D688 : 40    "@"    nega
D689 : 43    "C"    coma
D68A : FF E0 42    "  B"    stx  XE042
D68D : FE F0 20    "   "    ldx  XF020
D690 : BB D6 22    "  ""    adda  XD622
        ;
D693 : 5B    "["    db  $5B
        ;
D694 : EE D2    "  "    ldx  $D2,x
D696 : 01    " "    nop
        ;
D697 : 03    " "    db  $03
        ;
D698 : FF C5 03    "   "    stx  XC503
D69B : E7 E9    "  "    stab  $E9,x
D69D : 40    "@"    nega
D69E : 47    "G"    asra
D69F : 6E A9    "n "    jmp  $A9,x            ;INFO: index jump
        ;
D6A1 : 2B DD    "+ "    bmi  LD680
D6A3 : C6 81    "  "    ldab  #$81
D6A5 : 07    " "    tpa
D6A6 : 9F DE    "  "    sts  X00DE
        ;
D6A8 : 05 1F    "  "    db  $05, $1F
        ;
D6AA : AF 05    "  "    sts  $05,x
        ;
D6AC : 05    " "    db  $05
        ;
D6AD : 3E    ">"    wai
D6AE : BA A7 2D    "  -"    oraa  XA72D
        ;
D6B1 : 55 04    "U "    db  $55, $04
        ;
D6B3 : 0E    " "    cli
D6B4 : 3F    "?"    swi
D6B5 : 7E 18 3C    "~ <"    jmp  L183C
        ;
D6B8 : 7C B4 10    "|  "    inc  XB410
D6BB : B5 F3 6A    "  j"    bita  XF36A
D6BE : A9 86    "  "    adca  $86,x
D6C0 : 06    " "    tap
D6C1 : 0E    " "    cli
D6C2 : 3F    "?"    swi
D6C3 : BE 38 38    " 88"    lds  X3838
D6C6 : 78 D4 AA    "x  "    asl  XD4AA
D6C9 : 5A    "Z"    decb
D6CA        LD6CA:
D6CA : AA AC    "  "    oraa  $AC,x
D6CC : AA AA    "  "    oraa  $AA,x
        ;
D6CE : 04 18    "  "    db  $04, $18
        ;
D6D0 : FF FC E1    "   "    stx  XFCE1
        ;
D6D3 : 42    "B"    db  $42
        ;
D6D4 : 69 B4    "i "    rol  $B4,x
D6D6 : B1 87 46    "  F"    cmpa  X8746
D6D9 : A8 E3    "  "    eora  $E3,x
D6DB : E0 E0    "  "    subb  $E0,x
        ;
D6DD : E3    " "    db  $E3
        ;
D6DE : EB D7    "  "    addb  $D7,x
        ;
D6E0 : 45    "E"    db  $45
        ;
D6E1 : 86 97    "  "    ldaa  #$97
        ;
D6E3 : 1C    " "    db  $1C
        ;
D6E4 : 63 8A    "c "    com  $8A,x
        ;
D6E6 : 87    " "    db  $87
        ;
D6E7 : 19    " "    daa
D6E8 : 67 37    "g7"    asr  $37,x
D6EA : 0C    " "    clc
D6EB : 2B 5E    "+^"    bmi  LD74B
        ;
D6ED : 75 DC 71    "u q"    db  $75, $DC, $71
        ;
D6F0 : CE 31 C3    " 1 "    ldx  #$31C3
D6F3 : 0C    " "    clc
        ;
D6F4 : C7 1C 3A    "  :"    db  $C7, $1C, $3A
        ;
D6F7 : 9C 5E    " ^"    cpx  X005E
D6F9 : 39    "9"    rts
        ;
D6FA : CE 38 E3    " 8 "    ldx  #$38E3
D6FD : 8E 31 C8    " 1 "    lds  #$31C8
        ;
D700 : C7    " "    db  $C7
        ;
D701 : 22 C7    "" "    bhi  LD6CA
        ;
D703 : 1C 71 E3    " q "    db  $1C, $71, $E3
        ;
D706 : A5 B1    "  "    bita  $B1,x
D708 : CE 72 E3    " r "    ldx  #$72E3
        ;
D70B : 1C 71    " q"    db  $1C, $71
        ;
D70D : C6 31    " 1"    ldab  #$31
        ;
D70F : C3    " "    db  $C3
        ;
D710 : 1B    " "    aba
D711 : 8C 67 1C    " g "    cpx  #$671C
        ;
D714 : E3    " "    db  $E3
        ;
D715 : 39    "9"    rts
        ;
D716 : C7    " "    db  $C7
        ;
D717 : 53    "S"    comb
D718 : 27 38    "'8"    beq  LD752
D71A : C4 72    " r"    andb  #$72
        ;
D71C : C7 3C 71    " <q"    db  $C7, $3C, $71
        ;
D71F : C6 39    " 9"    ldab  #$39
D721 : C6 71    " q"    ldab  #$71
D723 : C6 38    " 8"    ldab  #$38
        ;
D725 : E3    " "    db  $E3
        ;
D726 : 19    " "    daa
D727 : CE 3A 69    " :i"    ldx  #$3A69
D72A : CE 31 8C    " 1 "    ldx  #$318C
        ;
D72D : EC E3    "  "    db  $EC, $E3
        ;
D72F : 19    " "    daa
D730 : 9C 67    " g"    cpx  X0067
        ;
D732 : 18    " "    db  $18
        ;
D733 : D8 CC    "  "    eorb  X00CC
D735 : 73 9A CB    "s  "    com  X9ACB
        ;
D738 : 13    " "    db  $13
        ;
D739 : 98 C6    "  "    eora  X00C6
D73B : 33    "3"    pulb
D73C : 99 CC    "  "    adca  X00CC
D73E : 63 39    "c9"    com  $39,x
D740 : 9C C6    "  "    cpx  X00C6
D742 : 46    "F"    rora
        ;
D743 : 71 C7 1C    "q  "    db  $71, $C7, $1C
        ;
D746 : E7 39    " 9"    stab  $39,x
D748 : 85 C6    "  "    bita  #$C6
D74A : 33    "3"    pulb
D74B        LD74B:
D74B : 0C    " "    clc
D74C : 67 39    "g9"    asr  $39,x
D74E : CE 73 39    " s9"    ldx  #$7339
D751 : C6 27    " '"    ldab  #$27
        ;
D753 : 38 CC    "8 "    db  $38, $CC
        ;
D755 : AC 63    " c"    cpx  $63,x
D757 : 98 CB    "  "    eora  X00CB
        ;
D759 : 1C    " "    db  $1C
        ;
D75A : C6 63    " c"    ldab  #$63
        ;
D75C : 38    "8"    db  $38
        ;
D75D : E7 33    " 3"    stab  $33,x
D75F : 99 8C    "  "    adca  X008C
D761 : A9 C6    "  "    adca  $C6,x
D763 : 6A 71    "jq"    dec  $71,x
D765 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
        ;
D767 : 55    "U"    db  $55
        ;
D768 : CA A3    "  "    orab  #$A3
        ;
D76A : 1A 55    " U"    db  $1A, $55
        ;
D76C : 4A    "J"    deca
D76D : AA AB    "  "    oraa  $AB,x
        ;
D76F : 55    "U"    db  $55
;
D770 : 6A AA    "j "    dec  $AA,x
D772 : AA AA    "  "    oraa  $AA,x
D774 : AA
; 
                          ;
D775 : 55    "U"    db  $55
D776 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D77A : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D77E : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D782 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D786 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D78A : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D78E : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D792 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D796 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D79A : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D79E : 55    "U"    db  $55
                          ;
; 
D79F : 6A AA    "j "    dec  $AA,x
D7A1 : AA AA    "  "    oraa  $AA,x
D7A3 : AA AA    "  "    oraa  $AA,x
D7A5 : AA AA    "  "    oraa  $AA,x
D7A7 : 39    "9"    rts
        ;
D7A8 : CE 65 51    " eQ"    ldx  #$6551
        ;
D7AB : C7    " "    db  $C7
        ;
D7AC : 35    "5"    txs
D7AD : 4A    "J"    deca
D7AE : 9A 8E    "  "    oraa  X008E
D7B0 : 39    "9"    rts
        ;
D7B1 : 9C 72    " r"    cpx  X0072
D7B3 : B2 98 E3    "   "    sbca  X98E3
D7B6 : AE 33    " 3"    lds  $33,x
        ;
D7B8 : 1C    " "    db  $1C
        ;
D7B9 : 79 8C 63    "y c"    rol  X8C63
D7BC : 8C C7 1B    "   "    cpx  #$C71B
D7BF : 39    "9"    rts
        ;
D7C0 : 8D 5D    " ]"    bsr  LD81F
D7C2 : 39    "9"    rts
        ;
D7C3 : 99 9C    "  "    adca  X009C
D7C5 : E6 62    " b"    ldab  $62,x
D7C7 : 99 1C    "  "    adca  X001C
        ;
D7C9 : 4E    "N"    db  $4E
        ;
D7CA : 31    "1"    ins
D7CB : 9C 7A    " z"    cpx  X007A
D7CD : 66 66    "ff"    ror  $66,x
D7CF : 59    "Y"    rolb
        ;
D7D0 : CC    " "    db  $CC
        ;
D7D1 : E4 63    " c"    andb  $63,x
D7D3 : B1 4B 8E    " K "    cmpa  X4B8E
D7D6 : CA 87    "  "    orab  #$87
D7D8 : 2E 35    ".5"    bgt  LD80F
        ;
D7DA : 1A 72    " r"    db  $1A, $72
        ;
D7DC : 9C 72    " r"    cpx  X0072
D7DE : F0 E3 A9    "   "    subb  XE3A9
        ;
D7E1 : E3    " "    db  $E3
        ;
D7E2 : 8D 56    " V"    bsr  LD83A
D7E4 : 5A    "Z"    decb
D7E5 : 34    "4"    des
D7E6 : 58    "X"    aslb
        ;
D7E7 : 71    "q"    db  $71
        ;
D7E8        LD7E8:
D7E8 : E8 F1    "  "    eorb  $F1,x
D7EA : E5 A8    "  "    bitb  $A8,x
D7EC : A2 C5    "  "    sbca  $C5,x
D7EE : 53    "S"    comb
D7EF : 8B 16    "  "    adda  #$16
D7F1 : AF 5A    " Z"    sts  $5A,x
D7F3 : AD 5D    " ]"    jsr  $5D,x            ;INFO: index jump
D7F5 : 59    "Y"    rolb
D7F6 : 54    "T"    lsrb
        ;
D7F7 : 52    "R"    db  $52
        ;
D7F8        LD7F8:
D7F8 : A1 52    " R"    cmpa  $52,x
D7FA : B5 F5 D5    "   "    bita  XF5D5
D7FD : D4 A5    "  "    andb  X00A5
D7FF        LD7FF:
D7FF : 4A    "J"    deca
        ;
D800 : 52    "R"    db  $52
        ;
D801 : AB 5A    " Z"    adda  $5A,x
D803 : AF 5A    " Z"    sts  $5A,x
D805 : A8 A1    "  "    eora  $A1,x
D807 : 44    "D"    lsra
D808 : A5 6B    " k"    bita  $6B,x
D80A : AB AA    "  "    adda  $AA,x
D80C : D2 A5    "  "    sbcb  X00A5
        ;
D80E : 55    "U"    db  $55
        ;
D80F        LD80F:
D80F : 2A AA    "* "    bpl  LD7BB
D811 : B5 AA BE    "   "    bita  XAABE
D814 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
        ;
D816 : 52    "R"    db  $52
        ;
D817 : A4 AA    "  "    anda  $AA,x
D819 : A2 A5    "  "    sbca  $A5,x
        ;
D81B : 55 55    "UU"    db  $55, $55
        ;
D81D : 56    "V"    rorb
D81E : AD B5    "  "    jsr  $B5,x            ;INFO: index jump
;*************************************;
;LDA20 - v.near mid ROM
;*************************************;
D820 : AA AA    "  "    oraa  $AA,x
D822 : AA AA    "  "    oraa  $AA,x
D824 : AD F6    "  "    jsr  $F6,x            ;INFO: index jump
D826 : EB 55    " U"    addb  $55,x
D828 : 08    " "    inx
D829 : 92 55    " U"    sbca  X0055
D82B : 56    "V"    rorb
D82C : DB D5    "  "    addb  X00D5
D82E : AA 94    "  "    oraa  $94,x
D830 : AA 55    " U"    oraa  $55,x
D832 : 2A 54    "*T"    bpl  LD888
D834 : A2 95    "  "    sbca  $95,x
D836 : 7E FB 6A    "~ j"    jmp  LFB6A
        ;
D839 : 84 48    " H"    anda  #$48
D83B : 92 AA    "  "    sbca  X00AA
D83D : DE B6    "  "    ldx  X00B6
D83F : D5 55    " U"    bitb  X0055
D841 : 29 54    ")T"    bvs  LD897
D843 : A4 92    "  "    anda  $92,x
        ;
D845 : 51    "Q"    db  $51
        ;
D846 : 4A    "J"    deca
D847 : DF FB    "  "    stx  X00FB
D849 : 6A A4    "j "    dec  $A4,x
        ;
D84B : 12    " "    db  $12
        ;
D84C : 24 AA    "$ "    bcc  LD7F8
D84E : B6 EE DA    "   "    ldaa  XEEDA
D851 : B5 44 89    " D "    bita  X4489
D854 : 24 92    "$ "    bcc  LD7E8
D856 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
D858 : B7 55 28    " U("    staa  X5528
        ;
D85B : 21    "!"    db  $21
        ;
D85C : 25 55    "%U"    bcs  LD8B3
D85E : 6D EE    "m "    tst  $EE,x
D860 : DA AA    "  "    orab  X00AA
D862 : 88 89    "  "    eora  #$89
D864 : 24 95    "$ "    bcc  LD7FB
D866 : 77 FD BA    "w  "    asr  XFDBA
D869 : B2 82 11    "   "    sbca  X8211
D86C : 29 56    ")V"    bvs  LD8C4
D86E : DF 76    " v"    stx  X0076
D870 : D5 52    " R"    bitb  X0052
D872 : 08    " "    inx
D873 : 92 94    "  "    sbca  X0094
D875 : BA FF B7    "   "    oraa  XFFB7
D878 : 59    "Y"    rolb
D879 : 20 84    "  "    bra  LD7FF
        ;
D87B : 8A 5A    " Z"    oraa  #$5A
D87D : EE EE    "  "    ldx  $EE,x
D87F : DA A4    "  "    orab  X00A4
        ;
D881 : 42    "B"    db  $42
        ;
D882 : 24 94    "$ "    bcc  LD818
D884 : BC FF B7    "   "    cpx  XFFB7
D887 : 58    "X"    aslb
D888        LD888:
D888 : A0 82    "  "    suba  $82,x
D88A : 4A    "J"    deca
D88B : 5A    "Z"    decb
D88C : EF 6E    " n"    stx  $6E,x
D88E : B5 50 89    " P "    bita  X5089
        ;
D891 : 12 52 F3    " R "    db  $12, $52, $F3
        ;
D894 : FF 75 68    " uh"    stx  X7568
D897        LD897:
D897 : 82 0A    "  "    sbca  #$0A
D899 : 2A B5    "* "    bpl  LD850
D89B : EE DA    "  "    ldx  $DA,x
D89D : B4 A2 24    "  $"    anda  XA224
D8A0 : 49    "I"    rola
        ;
D8A1 : 4B    "K"    db  $4B
        ;
D8A2 : 9F FD    "  "    sts  X00FD
D8A4 : EA 8A    "  "    orab  $8A,x
D8A6 : 08    " "    inx
D8A7 : 22 A7    "" "    bhi  LD850
        ;
D8A9 : 5E    "^"    db  $5E
        ;
D8AA : F5 D5 4A    "  J"    bitb  XD54A
D8AD : 11    " "    cba
D8AE : 22 94    "" "    bhi  LD844
D8B0 : B9 FF DE    "   "    adca  XFFDE
D8B3        LD8B3:
D8B3 : 58    "X"    aslb
D8B4 : 50    "P"    negb
        ;
D8B5 : 42    "B"    db  $42
        ;
D8B6 : 2D 3A    "-:"    blt  LD8F2
D8B8 : F7 AD 54    "  T"    stab  XAD54
D8BB : 90 89    "  "    suba  X0089
        ;
D8BD : 14    " "    db  $14
        ;
D8BE : A7 9F    "  "    staa  $9F,x
        ;
D8C0 : FD    " "    db  $FD
        ;
D8C1 : E5 42    " B"    bitb  $42,x
D8C3 : 08    " "    inx
D8C4        LD8C4:
D8C4 : 29 AB    ") "    bvs  LD871
D8C6 : AF 7A    " z"    sts  $7A,x
D8C8 : B2 A2 14    "   "    sbca  XA214
        ;
D8CB : 51 52 F3    "QR "    db  $51, $52, $F3
        ;
D8CE : EF BC    "  "    stx  $BC,x
D8D0 : 60 82    "` "    neg  $82,x
D8D2 : 8B 3A    " :"    adda  #$3A
D8D4 : F5 E6 A6    "   "    bitb  XE6A6
        ;
D8D7 : 14 51    " Q"    db  $14, $51
        ;
D8D9 : 4A    "J"    deca
        ;
D8DA : 45    "E"    db  $45
        ;
D8DB : 3E    ">"    wai
D8DC : FF EF 18    "   "    stx  XEF18
D8DF : 10    " "    sba
D8E0 : 08    " "    inx
D8E1 : 66 DF    "f "    ror  $DF,x
D8E3 : BE BA 51    "  Q"    lds  XBA51
        ;
D8E6 : 42    "B"    db  $42
        ;
D8E7 : 44    "D"    lsra
        ;
D8E8 : 52    "R"    db  $52
        ;
D8E9 : 5F    "_"    clrb
D8EA : 7E FB C4    "~  "    jmp  LFBC4
        ;
D8ED : 09    " "    dex
D8EE : 0A    " "    clv
        ;
D8EF : 3A    ":"    db  $3A
        ;
D8F0 : F5 C5 26    "  &"    bitb  XC526
D8F3 : 35    "5"    txs
        ;
D8F4 : 75    "u"    db  $75
        ;
D8F5 : AA A1    "  "    oraa  $A1,x
D8F7 : 0F    " "    sei
D8F8 : 3E    ">"    wai
D8F9 : FB A0 41    "  A"    addb  XA041
D8FC : 07    " "    tpa
        ;
D8FD : 1E FD    "  "    db  $1E, $FD
        ;
D8FF : 6A 44    "jD"    dec  $44,x
        ;
D901 : 21    "!"    db  $21
        ;
D902 : 53    "S"    comb
        ;
D903 : 4E    "N"    db  $4E
        ;
D904 : 9C BF    "  "    cpx  X00BF
D906 : 7F F9 40    "  @"    clr  XF940
        ;
D909 : 00 87    "  "    db  $00, $87
        ;
D90B : 5F    "_"    clrb
D90C : 77 9A 54    "w T"    asr  X9A54
D90F : A8 30    " 0"    eora  $30,x
D911 : 82 45    " E"    sbca  #$45
D913 : 3F    "?"    swi
D914 : 7F FF 48    "  H"    clr  XFF48
        ;
D917 : 00 42    " B"    db  $00, $42
        ;
D919 : D6 F7    "  "    ldab  X00F7
        ;
D91B : 55    "U"    db  $55
        ;
D91C : AB 56    " V"    adda  $56,x
D91E : AA 04    "  "    oraa  $04,x
        ;
D920 : 00 3D    " ="    db  $00, $3D
        ;
D922 : FF FE 70    "  p"    stx  XFE70
D925 : 40    "@"    nega
D926 : 94 B9    "  "    anda  X00B9
        ;
D928 : 72    "r"    db  $72
        ;
D929 : 94 BA    "  "    anda  X00BA
D92B : F7 6A 48    " jH"    stab  X6A48
        ;
D92E : 04 18    "  "    db  $04, $18
        ;
D930 : FF FE 38    "  8"    stx  XFE38
D933 : 31    "1"    ins
D934 : 56    "V"    rorb
D935 : AE 28    " ("    lds  $28,x
D937 : 24 57    "$W"    bcc  LD990
D939 : 7E B5 89    "~  "    jmp  LB589
        ;
D93C : 04 1C    "  "    db  $04, $1C
        ;
D93E        LD93E:
D93E : F7 CE 0C    "   "    stab  XCE0C
D941 : 33    "3"    pulb
D942 : EF AF    "  "    stx  $AF,x
D944 : 10    " "    sba
D945 : 20 97    "  "    bra  LD8DE
        ;
D947 : 5E    "^"    db  $5E
        ;
D948 : D9 A2    "  "    adcb  X00A2
D94A : 44    "D"    lsra
D94B : F8 F7 88    "   "    eorb  XF788
        ;
D94E        LD94E:
D94E : 04    " "    db  $04
        ;
D94F : 63 FF    "c "    com  $FF,x
D951 : EE 50    " P"    ldx  $50,x
        ;
D953 : 41    "A"    db  $41
        ;
D954 : 0E    " "    cli
D955 : 5C    "\"    incb
D956 : E9 96    "  "    adcb  $96,x
D958 : 2B FF    "+ "    bmi  LD959
D95A : C6 38    " 8"    ldab  #$38
        ;
D95C : 00    " "    db  $00
        ;
D95D : 27 DF    "' "    beq  LD93E
        ;
D95F : FD    " "    db  $FD
        ;
D960 : C1 42    " B"    cmpb  #$42
        ;
D962 : 18 E3 55    "  U"    db  $18, $E3, $55
        ;
D965 : 4D    "M"    tsta
D966 : 37    "7"    pshb
D967 : FF F8 60    "  `"    stx  XF860
        ;
D96A : 00    " "    db  $00
        ;
D96B : 36    "6"    psha
D96C : FF F7 8C    "   "    stx  XF78C
D96F : 28 51    "(Q"    bvc  LD9C2
        ;
D971 : 87    " "    db  $87
        ;
D972 : 16    " "    tab
        ;
D973 : 38    "8"    db  $38
        ;
D974 : EF FF    "  "    stx  $FF,x
D976 : D5 04    "  "    bitb  X0004
        ;
D978 : 00    " "    db  $00
        ;
D979 : 47    "G"    asra
D97A : BF FE 70    "  p"    sts  XFE70
        ;
D97D : C3    " "    db  $C3
        ;
D97E : 06    " "    tap
        ;
D97F : 18    " "    db  $18
        ;
D980 : D1 C6    "  "    cmpb  X00C6
D982 : BF FF 68    "  h"    sts  XFF68
D985 : 81 00    "  "    cmpa  #$00
D987 : 19    " "    daa
D988 : FF F7 8E    "   "    stx  XF78E
        ;
D98B : 18    " "    db  $18
        ;
D98C : 60 C3    "` "    neg  $C3,x
D98E : 16    " "    tab
D98F : 2C FF    ", "    bge  LD990
D991 : FF 4A 00    " J "    stx  X4A00
D994 : 81 0C    "  "    cmpa  #$0C
D996 : FF FD E1    "   "    stx  XFDE1
D999 : 86 14    "  "    ldaa  #$14
D99B : 28 B1    "( "    bvc  LD94E
        ;
D99D : C7    " "    db  $C7
        ;
D99E : FF FD 14    "   "    stx  XFD14
        ;
D9A1 : 00 83    "  "    db  $00, $83
        ;
D9A3 : 0E    " "    cli
D9A4 : 7F FC F0    "   "    clr  XFCF0
        ;
D9A7 : C3 04    "  "    db  $C3, $04
        ;
D9A9 : 8E 1C 7B    "  {"    lds  #$1C7B
        ;
D9AC : FD    " "    db  $FD
        ;
D9AD : F5 44 00    " D "    bitb  X4400
D9B0 : 82 1E    "  "    sbca  #$1E
D9B2 : FF FC 78    "  x"    stx  XFC78
        ;
D9B5 : 41 21 C3    "A! "    db  $41, $21, $C3
        ;
D9B8 : 8D 6F    " o"    bsr  LDA29
D9BA : DF B8    "  "    stx  X00B8
D9BC : 90 03    "  "    suba  X0003
        ;
D9BE : 04 1F    "  "    db  $04, $1F
        ;
D9C0 : FF 7C 70    " |p"    stx  X7C70
D9C3 : 28 30    "(0"    bvc  LD9F5
D9C5 : E5 A4    "  "    bitb  $A4,x
D9C7 : FB FB E1    "   "    addb  XFBE1
        ;
D9CA : 42    "B"    db  $42
        ;
D9CB : 01    " "    nop
        ;
D9CC : 04    " "    db  $04
        ;
D9CD : 3F    "?"    swi
D9CE : FF BD 12    "   "    stx  XBD12
D9D1 : 06    " "    tap
D9D2 : 19    " "    daa
D9D3 : 57    "W"    asrb
D9D4 : 0E    " "    cli
D9D5 : FB BF 18    "   "    addb  XBF18
D9D8 : 84 02    "  "    anda  #$02
        ;
D9DA : 05    " "    db  $05
        ;
D9DB : 77 FF DD    "w  "    asr  XFFDD
        ;
D9DE : 05 02    "  "    db  $05, $02
        ;
D9E0 : 27 8E    "' "    beq  LD970
        ;
D9E2 : 9D    " "    db  $9D
        ;
D9E3 : E7 DD    "  "    stab  $DD,x
        ;
D9E5 : 42    "B"    db  $42
        ;
D9E6 : 81 00    "  "    cmpa  #$00
D9E8 : 0D    " "    sec
D9E9 : EF FF    "  "    stx  $FF,x
D9EB : D2 82    "  "    sbcb  X0082
        ;
D9ED : 02 C7    "  "    db  $02, $C7
        ;
D9EF : 95 7B    " {"    bita  X007B
D9F1 : D7 B8    "  "    stab  X00B8
D9F3 : A2 20    "  "    sbca  $20,x
D9F5        LD9F5:
D9F5 : 08    " "    inx
D9F6 : 17    " "    tba
D9F7 : BF FF C5    "   "    sts  XFFC5
        ;
D9FA : 00    " "    db  $00
        ;
D9FB : A1 AD    "  "    cmpa  $AD,x
D9FD : 59    "Y"    rolb
D9FE : F7 3D 69    " =i"    stab  X3D69
DA01 : 0A    " "    clv
DA02        LDA02:
DA02 : 08    " "    inx
        ;
DA03 : 00 5E    " ^"    db  $00, $5E
        ;
DA05 : FF FF 14    "   "    stx  XFF14
DA08 : 01    " "    nop
        ;
DA09 : 45    "E"    db  $45
        ;
DA0A : 74 EB BD    "t  "    lsr  XEBBD
        ;
DA0D : 5B    "["    db  $5B
        ;
DA0E : 8A 24    " $"    oraa  #$24
DA10 : 80 00    "  "    suba  #$00
DA12 : BE FF FE    "   "    lds  XFFFE
        ;
DA15 : 41    "A"    db  $41
        ;
DA16 : 01    " "    nop
DA17 : 2A E9    "* "    bpl  LDA02
DA19 : EF 3A    " :"    stx  $3A,x
DA1B : AB 89    "  "    adda  $89,x
DA1D : 28 80    "( "    bvc  LD99F
        ;
DA1F : 02    " "    db  $02
        ;
DA20 : BF FF DD    "   "    sts  XFFDD
DA23 : 20 02    "  "    bra  LDA27
        ;
DA25 : 59    "Y"    rolb
DA26 : D7 7D    " }"    stab  X007D
        ;
DA28 : 55    "U"    db  $55
        ;
DA29        LDA29:
DA29 : AA 91    "  "    oraa  $91,x
DA2B : 4A    "J"    deca
        ;
DA2C : 00 02    "  "    db  $00, $02
        ;
DA2E : FF FF D9    "   "    stx  XFFD9
DA31 : 40    "@"    nega
DA32 : 08    " "    inx
DA33 : B5 AF 7B    "  {"    bita  XAF7B
        ;
DA36 : 55    "U"    db  $55
        ;
DA37 : 5A    "Z"    decb
        ;
DA38 : 42    "B"    db  $42
        ;
DA39 : 94 00    "  "    anda  X0000
DA3B : 0B    " "    sev
DA3C : FF FF A5    "   "    stx  XFFA5
        ;
DA3F : 00    " "    db  $00
        ;
DA40 : 22 AE    "" "    bhi  LD9F0
DA42 : AE FA    "  "    lds  $FA,x
DA44 : AA D5    "  "    oraa  $D5,x
DA46 : 09    " "    dex
DA47 : 50    "P"    negb
        ;
DA48 : 00    " "    db  $00
        ;
DA49 : 2F FF    "/ "    ble  LDA4A
DA4B : FE 92 00    "   "    ldx  X9200
DA4E : 8A 76    " v"    oraa  #$76
DA50 : AF BA    "  "    sts  $BA,x
DA52 : AB 5A    " Z"    adda  $5A,x
DA54 : 11    " "    cba
DA55 : 40    "@"    nega
        ;
DA56 : 00    " "    db  $00
        ;
DA57 : BF FF FC    "   "    sts  XFFFC
DA5A : 84 02    "  "    anda  #$02
DA5C : 2A D6    "* "    bpl  LDA34
DA5E : BB EA D6    "   "    adda  XEAD6
DA61 : AA 12    "  "    oraa  $12,x
        ;
DA63 : 00 03    "  "    db  $00, $03
        ;
DA65 : FF FF D4    "   "    stx  XFFD4
DA68 : 80 11    "  "    suba  #$11
        ;
DA6A : 55    "U"    db  $55
        ;
DA6B : AD BB    "  "    jsr  $BB,x            ;INFO: index jump
        ;
DA6D : ED    " "    db  $ED
        ;
DA6E : 5A    "Z"    decb
DA6F : A4 10    "  "    anda  $10,x
        ;
DA71 : 00    " "    db  $00
        ;
DA72 : 27 FF    "' "    beq  LDA73
DA74 : FF A4 08    "   "    stx  XA408
DA77 : 09    " "    dex
DA78 : 5A    "Z"    decb
DA79 : B7 6F 75    " ou"    staa  X6F75
DA7C : AB 20    "  "    adda  $20,x
DA7E : 80 01    "  "    suba  #$01
DA80 : 3F    "?"    swi
DA81 : FF FD 41    "  A"    stx  XFD41
        ;
DA84 : 02 12    "  "    db  $02, $12
        ;
DA86 : D5 AF    "  "    bitb  X00AF
        ;
DA88 : 7B    "{"    db  $7B
        ;
DA89 : D5 5A    " Z"    bitb  X005A
        ;
DA8B : 41 00 05    "A  "    db  $41, $00, $05
        ;
DA8E : BF FF EA    "   "    sts  XFFEA
DA91 : 80 81    "  "    suba  #$81
DA93        XDA93:
DA93 : 2B 56    "+V"    bmi  LDAEB
DA95 : AF 7D    " }"    sts  $7D,x
DA97 : EA AA    "  "    orab  $AA,x
DA99 : 80 00    "  "    suba  #$00
DA9B : 16    " "    tab
DA9C : FF FF AA    "   "    stx  XFFAA
        ;
DA9F : 04    " "    db  $04
        ;
DAA0 : 08    " "    inx
DAA1 : AD 6A    " j"    jsr  $6A,x            ;INFO: index jump
DAA3 : AF BF    "  "    sts  $BF,x
DAA5 : AA AA    "  "    oraa  $AA,x
DAA7 : 40    "@"    nega
        ;
DAA8 : 00    " "    db  $00
        ;
DAA9 : 37    "7"    pshb
DAAA : FF FD 50    "  P"    stx  XFD50
DAAD : 80 49    " I"    suba  #$49
        ;
DAAF : 5B    "["    db  $5B
        ;
DAB0 : 6A B7    "j "    dec  $B7,x
DAB2 : F7 6A A9    " j "    stab  X6AA9
        ;
DAB5 : 00 00    "  "    db  $00, $00
        ;
DAB7 : EF FF    "  "    stx  $FF,x
DAB9 : F5 40 10    " @ "    bitb  X4010
DABC : A5 5D    " ]"    bita  $5D,x
DABE : AA B7    "  "    oraa  $B7,x
DAC0 : F7 55 50    " UP"    stab  X5550
        ;
DAC3 : 00    " "    db  $00
        ;
DAC4 : 06    " "    tap
DAC5 : FF FF 6A    "  j"    stx  XFF6A
        ;
DAC8 : 00    " "    db  $00
        ;
DAC9 : 85 2A    " *"    bita  #$2A
DACB : DB A9    "  "    addb  X00A9
DACD : 5F    "_"    clrb
DACE : BE AA A0    "   "    lds  XAAA0
        ;
DAD1 : 00    " "    db  $00
        ;
DAD2 : 17    " "    tba
DAD3 : FF FD 54    "  T"    stx  XFD54
DAD6 : 40    "@"    nega
DAD7 : 0A    " "    clv
DAD8 : AB 5D    " ]"    adda  $5D,x
DADA : A9 5F    " _"    adca  $5F,x
DADC : DE AA    "  "    ldx  X00AA
DADE : 80 00    "  "    suba  #$00
DAE0 : 57    "W"    asrb
DAE1 : FF FA A4    "   "    stx  XFAA4
DAE4 : 80 0A    "  "    suba  #$0A
DAE6 : DA B6    "  "    orab  X00B6
DAE8 : D2 BB    "  "    sbcb  X00BB
        ;
DAEA : FD 55 00 00  " U  "    db  $FD, $55, $00, $00
        ;
DAEE : AF FF    "  "    sts  $FF,x
DAF0 : F5 48 20    " H "    bitb  X4820
        ;
DAF3 : 15    " "    db  $15
        ;
DAF4 : D6 AD    "  "    ldab  X00AD
DAF6 : A9 6F    " o"    adca  $6F,x
        ;
DAF8 : FD    " "    db  $FD
        ;
DAF9 : 4A    "J"    deca
        ;
DAFA : 00 02    "  "    db  $00, $02
        ;
DAFC : BD FF F5    "   "    jsr  LFFF5
DAFF : 11    " "    cba
        ;
DB00 : 00    " "    db  $00
        ;
DB01 : 4D    "M"    tsta
DB02 : DA AB    "  "    orab  X00AB
DB04 : 6A BF    "j "    dec  $BF,x
DB06 : F5 48 00    " H "    bitb  X4800
        ;
DB09 : 05    " "    db  $05
        ;
DB0A : 7F FF B4    "   "    clr  XFFB4
DB0D : 88 01    "  "    eora  #$01
DB0F        LDB0F:
DB0F : 2B B5    "+ "    bmi  LDAC6
DB11        LDB11:
DB11 : 6D 6A    "mj"    tst  $6A,x
DB13 : BF F5 40    "  @"    sts  XF540
        ;
DB16 : 00    " "    db  $00
        ;
DB17 : 0D    " "    sec
DB18 : EF FF    "  "    stx  $FF,x
DB1A : AA 20    "  "    oraa  $20,x
DB1C : 08    " "    inx
DB1D : AD B6    "  "    jsr  $B6,x            ;INFO: index jump
DB1F : B5 A2 AF    "   "    bita  XA2AF
DB22 : FA A0 00    "   "    orab  XA000
        ;
DB25 : 55    "U"    db  $55
        ;
DB26 : DF FE    "  "    stx  X00FE
DB28 : D1 00    "  "    cmpb  X0000
DB2A : 44    "D"    lsra
DB2B : B7 B6 A5    "   "    staa  XB6A5
DB2E : 2A DF    "* "    bpl  LDB0F
DB30 : FB 40 00    " @ "    addb  X4000
DB33 : AB 7F    "  "    adda  $7F,x
DB35 : F7 44 10    " D "    stab  X4410
DB38 : 89 5D    " ]"    adca  #$5D
DB3A : DA AB    "  "    orab  X00AB
DB3C : 6D 55    "mU"    tst  $55,x
DB3E : B7 40 00    " @ "    staa  X4000
        ;
DB41 : ED    " "    db  $ED
        ;
DB42 : BF FA 90    "   "    sts  XFA90
        ;
DB45 : 21    "!"    db  $21
        ;
DB46 : 09    " "    dex
DB47 : 6F B5    "o "    clr  $B5,x
        ;
DB49 : 55    "U"    db  $55
        ;
DB4A : B6 AB 6D    "  m"    ldaa  XAB6D
        ;
DB4D : 00 00    "  "    db  $00, $00
        ;
DB4F : F7 7F ED    "   "    stab  X7FED
        ;
DB52 : 42 04    "B "    db  $42, $04
        ;
DB54 : 24 BB    "$ "    bcc  LDB11
        ;
DB56 : ED    " "    db  $ED
        ;
DB57 : 5A    "Z"    decb
DB58 : D5 52    " R"    bitb  X0052
DB5A : B6 00 05    "   "    ldaa  X0005
        ;
DB5D : DD    " "    db  $DD
        ;
DB5E : BF DD 10    "   "    sts  XDD10
        ;
DB61 : 12    " "    db  $12
        ;
DB62 : 4A    "J"    deca
DB63 : B7 ED 55    "  U"    staa  XED55
DB66 : B5 4A BB    " J "    bita  X4ABB
        ;
DB69 : 00 03    "  "    db  $00, $03
        ;
DB6B : 76 F7 FA    "v  "    ror  XF7FA
DB6E : 80 44    " D"    suba  #$44
DB70 : 95 5D    " ]"    bita  X005D
DB72 : F6 AB 6D    "  m"    ldab  XAB6D
DB75 : 29 5D    ")]"    bvs  LDBD4
        ;
DB77 : 00 02    "  "    db  $00, $02
        ;
DB79 : F6 F7 FA    "   "    ldab  XF7FA
DB7C : 88 09    "  "    eora  #$09
DB7E : 4A    "J"    deca
DB7F : AF BD    "  "    sts  $BD,x
        ;
DB81 : 55    "U"    db  $55
        ;
DB82 : 5A    "Z"    decb
DB83 : A4 BD    "  "    anda  $BD,x
        ;
DB85 : 00 02    "  "    db  $00, $02
        ;
DB87 : F7 B7 ED    "   "    stab  XB7ED
DB8A : 40    "@"    nega
        ;
DB8B : 12    " "    db  $12
        ;
DB8C : 95 5D    " ]"    bita  X005D
DB8E : F6 D5 55    "  U"    ldab  XD555
        ;
DB91 : 55    "U"    db  $55
        ;
DB92 : 5A    "Z"    decb
        ;
DB93 : 00 03 7B    "  {"    db  $00, $03, $7B
        ;
DB96 : DF 7A    " z"    stx  X007A
DB98 : 81 09    "  "    cmpa  #$09
        ;
DB9A : 55 5B    "U["    db  $55, $5B
        ;
DB9C : EE AA    "  "    ldx  $AA,x
DB9E : AA AA    "  "    oraa  $AA,x
DBA0 : AA 00    "  "    oraa  $00,x
        ;
DBA2 : 05    " "    db  $05
        ;
DBA3 : F7 DE EC    "   "    stab  XDEEC
DBA6 : 80 25    " %"    suba  #$25
        ;
DBA8 : 55    "U"    db  $55
        ;
DBA9 : 6F DD    "o "    clr  $DD,x
        ;
DBAB : 55 55    "UU"    db  $55, $55
        ;
DBAD : 54    "T"    lsrb
DBAE : A8 00    "  "    eora  $00,x
DBB0 : 17    " "    tba
DBB1 : BF BB B4    "   "    sts  XBBB4
DBB4 : 20 25    " %"    bra  LDBDB
        ;
DBB6 : 55    "U"    db  $55
        ;
DBB7 : 7F BA 94    "   "    clr  XBA94
DBBA : AA 95    "  "    oraa  $95,x
DBBC : 68 00    "h "    asl  $00,x
        ;
DBBE : 1D    " "    db  $1D
        ;
DBBF : F7 7B A9    " { "    stab  X7BA9
        ;
DBC2 : 00    " "    db  $00
        ;
DBC3 : A9 56    " V"    adca  $56,x
DBC5 : FF 69 2A    " i*"    stx  X692A
DBC8 : A4 AB    "  "    anda  $AB,x
DBCA : F5 00 0B    "   "    bitb  X000B
DBCD : 6D BE    "m "    tst  $BE,x
DBCF : EA 84    "  "    orab  $84,x
DBD1 : A5 57    " W"    bita  $57,x
        ;
DBD3 : ED    " "    db  $ED
        ;
DBD4        LDBD4:
DBD4 : 48    "H"    asla
DBD5 : 95 55    " U"    bita  X0055
DBD7 : FE A8 00    "   "    ldx  XA800
DBDA : 0A    " "    clv
DBDB        LDBDB:
DBDB : DB DF    "  "    addb  X00DF
        ;
DBDD : 75 52    "uR"    db  $75, $52
        ;
DBDF : 29 6D    ")m"    bvs  LDC4E
DBE1 : AA A5    "  "    oraa  $A5,x
DBE3 : 49    "I"    rola
DBE4 : 6F 54    "oT"    clr  $54,x
        ;
DBE6 : 12    " "    db  $12
        ;
DBE7 : AA 21    " !"    oraa  $21,x
DBE9 : 2D 5B    "-["    blt  LDC46
DBEB : 7F 56 AA    " V "    clr  X56AA
DBEE : AA AA    "  "    oraa  $AA,x
DBF0 : A2 52    " R"    sbca  $52,x
DBF2 : AA BA    "  "    oraa  $BA,x
DBF4 : 91 28    " ("    cmpa  X0028
DBF6 : AA B6    "  "    oraa  $B6,x
DBF8 : AA AA    "  "    oraa  $AA,x
DBFA : AA FB    "  "    oraa  $FB,x
DBFC : 6D AA    "m "    tst  $AA,x
DBFE : A8 48    " H"    eora  $48,x
DC00 : 4A    "J"    deca
DC01 : AA BB    "  "    oraa  $BB,x
DC03 : AD 48    " H"    jsr  $48,x            ;INFO: index jump
DC05 : 8A AA    "  "    oraa  #$AA
DC07 : AB DB    "  "    adda  $DB,x
DC09 : 56    "V"    rorb
DC0A : AA 48    " H"    oraa  $48,x
DC0C : A9 55    " U"    adca  $55,x
        ;
DC0E : 55 6B 55 55  "UkUU"    db  $55, $6B, $55, $55
DC12 : 51    "Q"    db  $51
        ;
DC13 : 2A AB    "* "    bpl  LDBC0
DC15 : 5D    "]"    tstb
DC16 : 5A    "Z"    decb
DC17 : AA AA    "  "    oraa  $AA,x
DC19 : A5 4A    " J"    bita  $4A,x
DC1B : AA AA    "  "    oraa  $AA,x
DC1D : AA AA    "  "    oraa  $AA,x
DC1F : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
DC21 : AB 51    " Q"    adda  $51,x
        ;
DC23 : 15    " "    db  $15
        ;
DC24 : DA 03    "  "    orab  X0003
DC26 : FF 82 57    "  W"    stx  X8257
DC29 : 60 4A    "`J"    neg  $4A,x
DC2B : AB D2    "  "    adda  $D2,x
DC2D : A5 6B    " k"    bita  $6B,x
        ;
DC2F : 55    "U"    db  $55
        ;
DC30 : 54    "T"    lsrb
DC31 : 8A A2    "  "    oraa  #$A2
DC33 : E8 0F    "  "    eorb  $0F,x
        ;
DC35 : FC    " "    db  $FC
        ;
DC36 : 06    " "    tap
DC37 : BD A0 16    "   "    jsr  LA016
DC3A : DE 89    "  "    ldx  X0089
DC3C : 5D    "]"    tstb
DC3D : 6A AB    "j "    dec  $AB,x
        ;
DC3F : 42 55    "BU"    db  $42, $55
        ;
DC41 : 49    "I"    rola
DC42 : 50    "P"    negb
DC43 : 7F F0 1E    "   "    clr  XF01E
DC46        LDC46:
DC46 : F6 80 3F    "  ?"    ldab  X803F
DC49 : 92 15    "  "    sbca  X0015
        ;
DC4B : FD 05    "  "    db  $FD, $05
        ;
DC4D : DA 44    " D"    orab  X0044
DC4F : B5 0A B3    "   "    bita  X0AB3
DC52 : FF 01 FB    "   "    stx  X01FB
DC55 : 50    "P"    negb
        ;
DC56 : 03 FC    "  "    db  $03, $FC
        ;
DC58 : 0A    " "    clv
DC59 : AF E8    "  "    sts  $E8,x
DC5B : 1B    " "    aba
DC5C : D2 25    " %"    sbcb  X0025
DC5E : 69 15    "i "    rol  $15,x
        ;
DC60 : 8F    " "    db  $8F
        ;
DC61 : F8 0F BA    "   "    eorb  X0FBA
DC64 : 40    "@"    nega
DC65 : 3F    "?"    swi
DC66 : A0 93    "  "    suba  $93,x
DC68 : EF 42    " B"    stx  $42,x
DC6A : EE 24    " $"    ldx  $24,x
        ;
DC6C : 87    " "    db  $87
        ;
DC6D : 19    " "    daa
DC6E : 2F 1F    "/ "    ble  LDC8F
DC70 : E0 3E    " >"    subb  $3E,x
DC72 : B8 00 FF    "   "    eora  X00FF
DC75 : 01    " "    nop
DC76 : 47    "G"    asra
DC77 : FA 57 B2    " W "    orab  X57B2
        ;
DC7A : 45    "E"    db  $45
        ;
DC7B : 2D 23    "-#"    blt  LDCA0
        ;
DC7D : 51    "Q"    db  $51
        ;
DC7E : FF 01 F6    "   "    stx  X01F6
DC81 : B0 07 F0    "   "    suba  X07F0
        ;
DC84 : 14 3D    " ="    db  $14, $3D
        ;
DC86 : D0 BF    "  "    subb  X00BF
        ;
DC88 : 52    "R"    db  $52
        ;
DC89 : 8A A9    "  "    oraa  #$A9
DC8B : 3F    "?"    swi
        ;
DC8C : 1F    " "    db  $1F
        ;
DC8D : F0 0F 9E    "   "    subb  X0F9E
DC90 : 80 7F    "  "    suba  #$7F
        ;
DC92 : 02 A3 FD 4B  "   K"    db  $02, $A3, $FD, $4B
        ;
DC96 : AA 20    "  "    oraa  $20,x
DC98 : AA 05    "  "    oraa  $05,x
DC9A : E0 FF    "  "    subb  $FF,x
        ;
DC9C : 00    " "    db  $00
        ;
DC9D : F9 F0 07    "   "    adcb  XF007
DCA0        LDCA0:
DCA0 : F4 2A 9F    " * "    andb  X2A9F
DCA3 : C8 BE    "  "    eorb  #$BE
DCA5 : 92 0B    "  "    sbca  X000B
DCA7 : 28 5D    "(]"    bvc  LDD06
DCA9 : 07    " "    tpa
DCAA : F8 1F 9F    "   "    eorb  X1F9F
DCAD : 80 7E    " ~"    suba  #$7E
        ;
DCAF : 12 93    "  "    db  $12, $93
        ;
DCB1 : F8 2B B5    " + "    eorb  X2BB5
        ;
DCB4 : 42 71    "Bq"    db  $42, $71
        ;
DCB6 : 0B    " "    sev
DCB7 : 90 FF    "  "    suba  X00FF
        ;
DCB9 : 83    " "    db  $83
        ;
DCBA : F9 F0 07    "   "    adcb  XF007
DCBD : E0 A8    "  "    subb  $A8,x
DCBF : 7E C2 E9    "~  "    jmp  LC2E9
        ;
DCC2 : 05    " "    db  $05
        ;
DCC3 : 3F    "?"    swi
DCC4 : 49    "I"    rola
DCC5 : 5D    "]"    tstb
DCC6 : 4F    "O"    clra
DCC7 : F0 3B 3F    " ;?"    subb  X3B3F
        ;
DCCA : 00    " "    db  $00
        ;
DCCB : F4 5A 0F    " Z "    andb  X5A0F
DCCE : C4 F8    "  "    andb  #$F8
DCD0 : 07    " "    tpa
DCD1 : DA D0    "  "    orab  X00D0
DCD3 : AF A4    "  "    sts  $A4,x
DCD5 : FE 06 5F    "  _"    ldx  X065F
DCD8 : E0 1D    "  "    subb  $1D,x
DCDA : 5D    "]"    tstb
DCDB : 01    " "    nop
        ;
DCDC : FC    " "    db  $FC
        ;
DCDD : 58    "X"    aslb
DCDE : F0 0F F1    "   "    subb  X0FF1
        ;
DCE1 : 41    "A"    db  $41
        ;
DCE2 : 7F 2F C0    " / "    clr  X2FC0
        ;
DCE5 : E3 EC 03    "   "    db  $E3, $EC, $03
        ;
DCE8 : 47    "G"    asra
DCE9 : E8 2E    " ."    eorb  $2E,x
DCEB : BF 07 80    "   "    sts  X0780
DCEE : 7F 82 0B    "   "    clr  X820B
DCF1 : FF F0 38    "  8"    stx  XF038
DCF4 : 3F    "?"    swi
        ;
DCF5 : 00    " "    db  $00
        ;
DCF6 : F0 7C DA    " | "    subb  X7CDA
DCF9 : 0F    " "    sei
DCFA : F1 48 03    " H "    cmpb  X4803
        ;
DCFD : FC 02    "  "    db  $FC, $02
        ;
DCFF : F7 FE 07    "   "    stab  XFE07
        ;
DD02 : C3    " "    db  $C3
        ;
DD03 : C0 6E    " n"    subb  #$6E
DD05 : 0A    " "    clv
DD06        LDD06:
DD06 : AF C2    "  "    sts  $C2,x
DD08 : 57    "W"    asrb
DD09 : F8 10 1F    "   "    eorb  X101F
DD0C : E0 86    "  "    subb  $86,x
DD0E : FF E0 7C    "  |"    stx  XE07C
        ;
DD11 : 3C    "<"    db  $3C
        ;
DD12 : 0B    " "    sev
DD13 : A8 0B    "  "    eora  $0B,x
        ;
DD15 : FD    " "    db  $FD
        ;
DD16 : 68 3D    "h="    asl  $3D,x
        ;
DD18 : 6B    "k"    db  $6B
        ;
DD19 : 80 7F    "  "    suba  #$7F
DD1B : 81 13    "  "    cmpa  #$13
DD1D : FE 18 7E    "  ~"    ldx  X187E
        ;
DD20 : 1A    " "    db  $1A
        ;
DD21 : 0F    " "    sei
DD22 : A0 3D    " ="    suba  $3D,x
DD24 : 7E 29 74    "~)t"    jmp  L2974
        ;
DD27 : BC 03 F8    "   "    cpx  X03F8
        ;
DD2A : 18    " "    db  $18
        ;
DD2B : 3F    "?"    swi
DD2C : F8 0F 1F    "   "    eorb  X0F1F
        ;
DD2F : 02    " "    db  $02
        ;
DD30 : 3F    "?"    swi
        ;
DD31 : 02    " "    db  $02
        ;
DD32 : EF 68    " h"    stx  $68,x
DD34 : BD 15 E0    "   "    jsr  L15E0
DD37 : 3F    "?"    swi
DD38 : C0 C3    "  "    subb  #$C3
DD3A : FF 81 E9    "   "    stx  X81E9
DD3D : A0 07    "  "    suba  $07,x
DD3F : F0 A7 D6    "   "    subb  XA7D6
        ;
DD42 : 87    " "    db  $87
        ;
DD43 : E4 5E    " ^"    andb  $5E,x
        ;
DD45 : 03    " "    db  $03
        ;
DD46 : F8 1C 1F    "   "    eorb  X1C1F
DD49 : F0 3F 2B    " ?+"    subb  X3F2B
        ;
DD4C : 00    " "    db  $00
        ;
DD4D : FE 05 AF    "   "    ldx  X05AF
        ;
DD50 : 51    "Q"    db  $51
        ;
DD51 : 7E 0F C0    "~  "    jmp  L0FC0
        ;
DD54 : 3F    "?"    swi
DD55 : 01    " "    nop
DD56 : C1 FE    "  "    cmpb  #$FE
        ;
DD58 : 03    " "    db  $03
        ;
DD59 : EB A0    "  "    addb  $A0,x
        ;
DD5B : 1F    " "    db  $1F
        ;
DD5C : A0 79    " y"    suba  $79,x
DD5E : F4 36 E0    " 6 "    andb  X36E0
        ;
DD61 : FC 03    "  "    db  $FC, $03
        ;
DD63 : F0 3C 1F    " < "    subb  X3C1F
DD66 : C0 7C    " |"    subb  #$7C
        ;
DD68 : FC    " "    db  $FC
        ;
DD69 : 01    " "    nop
DD6A : F8 52 BF    " R "    eorb  X52BF
DD6D : 43    "C"    coma
DD6E : D5 2F    " /"    bitb  X002F
DD70 : 40    "@"    nega
DD71 : 7E 23 03    "~# "    jmp  L2303
        ;
DD74 : F8 1F 1F    "   "    eorb  X1F1F
DD77 : C0 7C    " |"    subb  #$7C
DD79 : 5A    "Z"    decb
DD7A : 0F    " "    sei
DD7B : D2 B5    "  "    sbcb  X00B5
        ;
DD7D : 75 38    "u8"    db  $75, $38
        ;
DD7F : 07    " "    tpa
        ;
DD80 : C7 00    "  "    db  $C7, $00
        ;
DD82 : 7F 86 1B    "   "    clr  X861B
DD85 : F8 1C 3E    "  >"    eorb  X1C3E
        ;
DD88 : 02    " "    db  $02
        ;
DD89 : FA E8 7D    "  }"    orab  XE87D
DD8C : 2F 00    "/ "    ble  LDD8E
DD8E        LDD8E:
DD8E : F8 F0 0F    "   "    eorb  XF00F
DD91 : F1 C0 FF    "   "    cmpb  XC0FF
DD94 : 07    " "    tpa
        ;
DD95 : 03    " "    db  $03
        ;
DD96 : F0 65 7E    " e~"    subb  X657E
        ;
DD99 : 87 C3    "  "    db  $87, $C3
        ;
DD9B : F0 1E 1F    "   "    subb  X1E1F
DD9E : 01    " "    nop
        ;
DD9F : FC    " "    db  $FC
        ;
DDA0 : 7C 0F 1F    "|  "    inc  X0F1F
DDA3 : 80 78    " x"    suba  #$78
DDA5 : 7C 1D 6B    "| k"    inc  X1D6B
DDA8 : 64 BD    "d "    lsr  $BD,x
DDAA : 01    " "    nop
DDAB : E1 F0    "  "    cmpb  $F0,x
DDAD : 70 FF 81    "p  "    neg  XFF81
DDB0 : C1 FF    "  "    cmpb  #$FF
DDB2 : 80 07    "  "    suba  #$07
DDB4 : 9F 45    " E"    sts  X0045
DDB6 : AA D9    "  "    oraa  $D9,x
DDB8 : 70 1E 1F    "p  "    neg  X1E1F
DDBB : 0F    " "    sei
DDBC : 07    " "    tpa
DDBD : EF 9E    "  "    stx  $9E,x
DDBF : 0E    " "    cli
;*************************************;
; Copyright message
;*************************************;
DDC0 : 43    "C"                      ;COPYRIGHT
DDC1 : 4F    "O"                      ;
DDC2 : 50    "P"                      ;
DDC3 : 59    "Y"                      ;
DDC4 : 52    "R"                      ;
DDC5 : 49    "I"                      ;
DDC6 : 47    "G"                      ;
DDC7 : 48    "H"                      ;
DDC8 : 54    "T"                      ;
DDC9 : 20 2D    " -"                  ; -
DDCB : 20 57    " W"                  ;WILLIAMS
DDCD : 49    "I"                      ;
DDCE : 4C    "L"                      ;
DDCF : 4C    "L"                      ;
DDD0 : 49    "I"                      ;
DDD1 : 41    "A"                      ;
DDD2 : 4D    "M"                      ;
DDD3 : 53    "S"                      ;
DDD4 : 20 45    " E"                  ;ELECTRONICS
DDD6 : 4C    "L"                      ;
DDD7 : 45    "E"                      ;
DDD8 : 43    "C"                      ;
DDD9 : 54    "T"                      ;
DDDA : 52    "R"                      ;
DDDB : 4F    "O"                      ;
DDDC : 4E    "N"                      ;
DDDD : 49    "I"                      ;
DDDE : 43    "C"                      ;
DDDF : 53    "S"                      ;
DDE0 : 20 2D    " -"                  ; -
DDE2 : 20 31    " 1"                  ;10/30/79
DDE4 : 30    "0"                      ;
DDE5 : 2F 33    "/3"                  ;
DDE7 : 30    "0"                      ;
DDE8 : 2F 37    "/7"                  ;
DDEA : 39    "9"                      ;
DDEB : 20 2D    " -"                  ; -
DDED : 20 50    " P"                  ;PGD (Paul Dussault)
DDEF : 47    "G"                      ;
DDF0 : 44    "D"                      ;
;*************************************;
; DIAGNOSTICS
;*************************************;
;TALKD
DDF1 : CE DF 4C   ldx  #$DF4C         ;load X with DF4Ch
DDF4 : 20 7E      bra  LDE74          ;branch always TKSEL2
;*************************************;
; TALKING IRQ processing (A has sound select value)
;*************************************;
; needs to access ROM addrs $C000,$D000,$B000
;TKIRQ
DDF6 : 97 13      staa  $13           ;store A in addr 13
DDF8 : 97 00      staa  $00           ;store A in addr 00
DDFA : 84 1F      anda  #$1F          ;and A with 1Fh
DDFC : CE DF 5A   ldx  #$DF5A         ;load X with DF5Ah
DDFF : C6 1F      ldab  #$1F          ;load B with 1Fh
DE01 : 11         cba                 ;compare B with A
DE02 : 27 66      beq  LDE6A          ;branch Z=1 TKLDX
;
DE04 : 5A         decb                ;decr B
DE05 : 11         cba                 ;compare B with A
DE06 : 27 62      beq  LDE6A          ;branch Z=1 TKLDX
;
DE08 : CE DF 34   ldx  #$DF34         ;load X with DF34h
DE0B : C6 1A      ldab  #$1A          ;load B with 1Ah
DE0D : 11         cba                 ;compare B with A
DE0E : 27 5A      beq  LDE6A          ;branch Z=1 TKLDX
;
DE10 : CE DF 24   ldx  #$DF24         ;load X with DF24h
DE13 : C6 0F      ldab  #$0F          ;load B with 0Fh
DE15 : 11         cba                 ;compare B with A
DE16 : 27 52      beq  LDE6A          ;branch Z=1 TKLDX
;
DE18 : CE DF 2E   ldx  #$DF2E         ;load X with DF2Eh
DE1B : C6 0D      ldab  #$0D          ;load B with 0Dh
DE1D : 11         cba                 ;compare B with A
DE1E : 27 4A      beq  LDE6A          ;branch Z=1 TKLDX
;
DE20 : CE DF 28   ldx  #$DF28         ;load X with DF28h
DE23 : 5A         decb                ;decr B
DE24 : 11         cba                 ;compare B with A
DE25 : 27 43      beq  LDE6A          ;branch Z=1 TKLDX
;
DE27 : CE DE FC   ldx  #$DEFC         ;load X with DEFCh
DE2A : 5F         clrb                ;clear B 
DE2B : 81 0E      cmpa  #$0E          ;compare A with 0Eh
DE2D : 27 3B      beq  LDE6A          ;branch Z=1 TKLDX
;
DE2F : CE DF 3A   ldx  #$DF3A         ;load X with DF3Ah
DE32 : 81 08      cmpa  #$08          ;compare A with 08h
DE34 : 27 34      beq  LDE6A          ;branch Z=1 TKLDX
;
DE36 : CE DF 1A   ldx  #$DF1A         ;load X with DF1Ah
DE39 : 5C         incb                ;incr B
DE3A : 81 07      cmpa  #$07          ;compare A with 07h
DE3C : 27 2C      beq  LDE6A          ;branch Z=1 TKLDX
;
DE3E : C6 14      ldab  #$14          ;load B with 14h
DE40 : 81 18      cmpa  #$18          ;compare A with 18h
DE42 : 26 13      bne  LDE57          ;branch Z=0 TKLD
;
DE44 : CE DF 04   ldx  #$DF04         ;load X with DF04h
DE47 : 96 02      ldaa  $02           ;load A with addr 02
DE49 : 27 24      beq  LDE6F          ;branch Z=1 TKSEL
;
DE4B : CE DF 0E   ldx  #$DF0E         ;load X with DF0Eh
DE4E : 81 01      cmpa  #$01          ;compare A with 01h
DE50 : 27 1D      beq  LDE6F          ;branch Z=1 TKSEL
;
DE52 : CE DF 14   ldx  #$DF14         ;load X with DF14h
DE55 : 20 13      bra  LDE6A          ;branch Z=1 TKLDX
;*************************************;
;process and load talk jump table
;*************************************;
;TKLD
DE57 : C6 1B      ldab  #$1B          ;load B with 1Bh
DE59 : 11         cba                 ;compare B with A
DE5A : 26 20      bne  LDE7C          ;branch Z=0 TKSEL4
DE5C : 0E         cli                 ;clear interrupts I=0
DE5D : 96 09      ldaa  $09           ;load A with addr 09
DE5F : 84 0F      anda  #$0F          ;and A with 0Fh
DE61 : 48         asla                ;arith shift left A
DE62 : FE FF F6   ldx  $FFF6          ;load X with addr FFF6 (DFDA - jmptbl)
DE65 : BD FF F3   jsr  LFFF3          ;jump sub ROM ADDX
DE68 : EE 00      ldx  $00,x          ;load X with X+00h
;TKLDX
DE6A : 7F 00 02   clr  $0002          ;clear addr 0002
DE6D : 20 03      bra  LDE72          ;branch always TKSEL1
;*************************************;
;select talk jump addr and PIA select
;*************************************;
;TKSEL
DE6F : 7C 00 02   inc  $0002          ;incr addr 0002
;TKSEL1
DE72 : D7 03      stab  $03           ;store B in addr 03
;TKSEL2
DE74 : DF 18      stx  $18            ;store X in addr 18
;TKSEL3
DE76 : DE 18      ldx  $18            ;load X with addr 18
DE78 : EE 00      ldx  $00,x          ;load X with X+00h (JMPTBL addr)
DE7A : 26 10      bne  LDE8C          ;branch Z=0 TKPRM
;TKSEL4
DE7C : 96 00      ldaa  $00
DE7E : 7D 00 13   tst  $0013
DE81 : 26 04      bne  LDE87          ;branch Z=0 TKSEL5
DE83 : 84 E0      anda  #$E0
DE85 : 9B 03      adda  $03
;TKSEL5
DE87 : F6 04 02   ldab  $0402         ;load B with PIA sound select
DE8A : 0E         cli                 ;clear interrupts I=0
DE8B : 39         rts                 ;return subroutine
;*************************************;
;talk params 
;*************************************;
;TKPRM LDE8C:
DE8C : DF 14      stx  $14            ;store X in addr 14
DE8E : 96 14      ldaa  $14           ;load A with addr 14
DE90 : 2A 12      bpl  LDEA4          ;branch N=0 TKPMLP
DE92 : DE 18      ldx  $18            ;load X with addr 18
DE94 : EE 02      ldx  $02,x          ;load X with addr X+02h
DE96 : DF 16      stx  $16            ;store X in addr 16
DE98 : DE 18      ldx  $18            ;load X with addr 18
DE9A : 08         inx                 ;incr X
DE9B : 08         inx                 ;incr X
DE9C : 08         inx                 ;incr X
DE9D : 08         inx                 ;incr X (+4)
DE9E : DF 18      stx  $18            ;store X in addr 18
DEA0 : 8D 0D      bsr  LDEAF          ;branch sub TKSC
DEA2 : 20 D2      bra  LDE76          ;branch always TKSEL3
;TKPMLP
DEA4 : 8D 50      bsr  LDEF6          ;branch sub TKSD3
DEA6 : 09         dex                 ;decr X (-1)
DEA7 : 26 FB      bne  LDEA4          ;TKPMLP
DEA9 : DE 18      ldx  $18            ;load X with addr 18
DEAB : 08         inx                 ;incr X
DEAC : 08         inx                 ;incr X (+2)
DEAD : 20 C5      bra  LDE74          ;branch always TKSEL2
;*************************************;
;TALKING speech clock (0403)
;*************************************;
;TKSC
DEAF : DE 14      ldx  $14            ;load X with addr 14
DEB1 : A6 00      ldaa  $00,x         ;load A with X+00h
DEB3 : 81 AA      cmpa  #$AA          ;compare A with AAh
DEB5 : 26 20      bne  LDED7          ;branch Z=0 TKSCX
DEB7 : 7F 00 13   clr  $0013          ;clear addr 0013
DEBA : 97 01      staa  $01           ;store A in addr 01
DEBC : 08         inx                 ;incr X
DEBD : C6 08      ldab  #$08          ;l0ad B with 08h
;TKSC1
DEBF : 86 3F      ldaa  #$3F          ;load A with 3Fh (0011 1111)(bit3=1 HI)
DEC1 : B7 04 03   staa  $0403         ;store A (3Fh) in PIA, CB2 - speech clock
DEC4 : 84 F7      anda  #$F7          ;and A(3Fh) with F7h = 37h(0011 0111)(bit3=0 LO)
DEC6 : B7 04 03   staa  $0403         ;store A (37h) in PIA, CB2 - speech clock
DEC9 : 5A         decb                ;decr B
DECA : 26 0C      bne  LDED8          ;branch Z=0 TKSD
DECC : C6 08      ldab  #$08          ;load B with 08h
DECE : A6 00      ldaa  $00,x         ;load A with X+00h
DED0 : 97 01      staa  $01           ;store A in 01
DED2 : 08         inx                 ;incr X
DED3 : 9C 16      cpx  $16            ;compare X with addr 16
DED5 : 26 08      bne  LDEDF          ;branch Z=0 TKSD1
;TKSCX
DED7 : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech data (0401)
;*************************************;
;TKSD
DED8 : 6D 00      tst  $00,x          ;test X+00h (7 cycles)
DEDA : 6D 00      tst  $00,x          ;test X+00h (7 cycles) 
DEDC : 6D 00      tst  $00,x          ;test X+00h (7 cycles)
DEDE : 01         nop                 ;nop        (2 cycles)(23)
;TKSD1
DEDF : 08         inx                 ;incr X     (4 cycles)
DEE0 : 09         dex                 ;decr X     (4 cycles)
DEE1 : 01         nop                 ;nop        (2 cycles)
DEE2 : 01         nop                 ;nop        (2 cycles)(12)(35)
DEE3 : 79 00 01   rol  $0001          ;rotate left addr 0001
DEE6 : 24 07      bcc  LDEEF          ;branch C=0 TKSD2
DEE8 : 86 3C      ldaa  #$3C          ;load A with 3Ch (0011 1100) (bit3=1 HI)
DEEA : B7 04 01   staa  $0401         ;store A (3Ch) in PIA, CA2 - speech data
DEED : 20 D0      bra  LDEBF          ;branch always TKSC1
;TKSD2
DEEF : 86 34      ldaa  #$34          ;load A with 34h (0011 0100) (bit3=0 LO)
DEF1 : B7 04 01   staa  $0401         ;store A (34h) in PIA, CA2 - speech data
DEF4 : 20 C9      bra  LDEBF          ;branch always TKSC1
;TKSD3
DEF6 : 86 94      ldaa  #$94          ;load A with 94h
;TKSDLP - count down A
DEF8 : 4A         deca                ;decr A
DEF9 : 26 FD      bne  LDEF8          ;branch Z=0 TKSDLP
;
DEFB : 39         rts                 ;return subroutine
;*************************************;
;ROM addr tables for phonemes, assuming layout with end 0000
;*************************************;
;addr  start end
;TKIRQ
DEFC : 00 40                          ;
DEDE : C440 CDDF                      ;ROM5
DF02 : 00 00                          ;
;*************************************;
;TKIRQ
DF04 : B000 B3CF B7A0 BBEF            ;ROM7
DF0C : 00 00                          ;
;*************************************;
;TKIRQ
DF0E : BBF0 BFFF                      ;ROM7
DF12 : 00 00                          ;
;*************************************;
;TKIRQ
DF14 : C000 C43F                      ;ROM5
DF18 : 00 00                          ;
;*************************************;
;TKIRQ
DF1A : D820 DDBF C850 CDDF            ;ROM6,ROM5
DF22 : 00 00                          ;
;*************************************;
;TKIRQ
DF24 : B000 B79F                      ;ROM7
;*************************************;
;TKIRQ
DF28 : CDE0 D81F                      ;ROM5-6
DF2C : 00 00                          ;
;*************************************;
;TKIRQ
DF2E : B000 B3CF                      ;ROM7
DF32 : 00 00                          ;
;*************************************;
;TKIRQ
DF34 : B3D0 B79F                      ;ROM7
DF38 : 00 00                          ;
;*************************************;
;TKIRQ
DF3A : D820 DC1F B7A0 BBEF            ;ROM6,ROM7
DF42 : B7A0 BBEF CDE0 D28F            ;ROM7,ROM5-6
DF4A : 00 00                          ;
;*************************************;
;TALKD
DF4C : B000 DDBF                      ;ROM7-6
DF00 : 00 00                          ;
;*************************************;
;JMPTBL
DF52 : D820 DC1F C850 CDDF            ;ROM6,ROM5
;*************************************;
;TKIRQ
DF5A : B000 B79F                      ;ROM7
DF5E : 00 00                          ;
;*************************************;
;JMPTBL
DF60 : C440 CDDF D820 DC1F            ;ROM5,ROM6
DF68 : 00 00                          ;
;*************************************;
;JMPTBL
DF6A : CDE0 D28F BBF0 BFFF            ;ROM5-6,ROM7
DF72 : B7A0 BBEF C000 C43F            ;ROM7,ROM5
DF7A : D290 D81F                      ;ROM6
DF7E : 00 00                          ;
;*************************************;
;JMPTBL
DF80 : D820 DDBF C440 C84F            ;ROM6,ROM5
DF88 : 00 00                          ;
;*************************************;
;JMPTBL
DF8A : C440 C84F                      ;ROM5
;*************************************;
;JMPTBL
DF8E : B000 B3CF C850 CDDF            ;ROM7,ROM5
DF96 : D820 DC1F                      ;ROM6
DF9A : 00 00                          ;
;*************************************;
;JMPTBL
DF9C : CDE0 D28F C850 CDDF            ;ROM5-6,ROM5
DFA4 : D820 DC1F                      ;ROM6
DFA8 : 00 00                          ;
;*************************************;
;JMPTBL
DFAA : C440 C84F B3D0 BBEF            ;ROM5,ROM7
DFB2 : 00 00                          ;
;*************************************;
;JMPTBL
DFB4 : D820 DC1F C850 CDDF            ;ROM6,ROM5
DFBC : C440 C84F CDE0 D28F            ;ROM5,ROM5-6
DFC4 : 00 00                          ;
;*************************************;
;JMPTBL
DFC6 : D820 DC1F B7A0 BBEF            ;ROM6,ROM7
DFCE : 00 40                          ;
;*************************************;
;JMPTBL
DFD0 : B000 B79F C850 CDDF            ;ROM7,ROM5
DFD8 : 00 00                          ;
;*************************************;
;jump table, processed by ADDX
;*************************************;
;JMPTBL
DFDA : DF 52                          ;
DFDC : DF 60                          ;
DFDE : DF 6A                          ;
DFE0 : DF 80                          ;
DFE2 : DF 8A                          ;
DFE4 : DF 9C                          ;
DFE6 : DF AA                          ;
DFE8 : DF B4                          ;
DFEA : DF C6                          ;
DFEC : DF D0                          ;
DFEE : DF D0                          ;
DFF0 : DF 8E                          ;
DFF2 : DF 8A                          ;
DFF4 : DF B4                          ;
DFF6 : DF 8E                          ;
DFF8 : DF 80                          ;
;*************************************;
;ENTRY (from Sound ROM)
;*************************************;
DFFA : 7E DD F1   jmp  LDDF1          ;jump TALKD
DFFD : 7E DD F6   jmp  LDDF6          ;jump TKIRQ (TALK)
;
;--------------------------------------------------------------





