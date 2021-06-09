        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Comet.128
        ;
        ;  Size:    16384 bytes
        ;  Checksum:  C5CC
        ;  CRC-32:    F1DB0CBE
        ;
        ;  Date:    Wed Jun 09 10:16:25 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Comet pinball, System 9, 16kB ROM on main MPU board
        ; PIA audio addr : $2000
        ;
          org  $C000
        ;
C000        LC000:
C000 : 3F    "?"    swi
C001 : 96 A7    "  "    ldaa  X00A7
C003 : EA BA    "  "    orab  $BA,x
C005 : 0C    " "    clc
C006 : 43    "C"    coma
C007        XC007:
C007 : 0D    " "    sec
C008 : 7D A0 B1    "}  "    tst  XA0B1
C00B : BD ED 45    "  E"    jsr  LED45
C00E        LC00E:
C00E : F8 5C BA    " \ "    eorb  X5CBA
C011 : 56    "V"    rorb
C012 : 8B C6    "  "    adda  #$C6
        ;
C014 : 21 93 72    "! r"    db  $21, $93, $72
        ;
C017 : D1 04    "  "    cmpb  X0004
C019 : 67 B9    "g "    asr  $B9,x
C01B : 6A AB    "j "    dec  $AB,x
C01D : DA 0B    "  "    orab  X000B
C01F        XC01F:
C01F : 19    " "    daa
C020 : BF A2 BC    "   "    sts  XA2BC
C023 : 77 14 2A    "w *"    asr  X142A
C026 : 0D    " "    sec
        ;
C027 : 83    " "    db  $83
        ;
C028 : 19    " "    daa
C029 : 8B F9    "  "    adda  #$F9
C02B : EA 81    "  "    orab  $81,x
C02D : 17    " "    tba
C02E : A7 38    " 8"    staa  $38,x
C030 : 9F C8    "  "    sts  X00C8
C032 : AB 15    "  "    adda  $15,x
C034 : D4 B8    "  "    andb  X00B8
        ;
C036 : 87 3A    " :"    db  $87, $3A
        ;
C038 : 16    " "    tab
        ;
C039 : B3    " "    db  $B3
        ;
C03A : 22 DA    "" "    bhi  LC016
        ;
C03C : 52 3D    "R="    db  $52, $3D
        ;
C03E : F8 E8 AA    "   "    eorb  XE8AA
C041 : 28 65    "(e"    bvc  LC0A8
        ;
C043 : 61 15    "a "    db  $61, $15
        ;
C045 : 27 B9    "' "    beq  LC000
C047        XC047:
C047 : AE D2    "  "    lds  $D2,x
C049 : 5D    "]"    tstb
        ;
C04A : 45    "E"    db  $45
        ;
C04B : 11    " "    cba
C04C : B9 BE 6B    "  k"    adca  XBE6B
C04F : 98 A1    "  "    eora  X00A1
C051 : 53    "S"    comb
        ;
C052 : 15 CF    "  "    db  $15, $CF
        ;
C054 : A1 14    "  "    cmpa  $14,x
C056 : 95 8B    "  "    bita  X008B
        ;
C058 : 65    "e"    db  $65
        ;
C059 : F8 06 25    "  %"    eorb  X0625
C05C : 23 B0    "# "    bls  LC00E
C05E : FB 4F A7    " O "    addb  X4FA7
C061 : A2 52    " R"    sbca  $52,x
C063 : 4A    "J"    deca
C064 : 85 B8    "  "    bita  #$B8
C066 : EB 2B    " +"    addb  $2B,x
C068 : BF 82 3E    "  >"    sts  X823E
C06B : 5C    "\"    incb
C06C : C5 7D    " }"    bitb  #$7D
C06E : 26 2A    "&*"    bne  LC09A
C070 : F1 0B 75    "  u"    cmpb  X0B75
C073 : AB 90    "  "    adda  $90,x
C075 : 10    " "    sba
C076 : F4 FE 0A    "   "    andb  XFE0A
C079        XC079:
C079 : 2A 3E    "*>"    bpl  LC0B9
C07B : E6 FD    "  "    ldab  $FD,x
C07D : AA D6    "  "    oraa  $D6,x
C07F : AA A0    "  "    oraa  $A0,x
        ;
C081 : 38 CC    "8 "    db  $38, $CC
        ;
C083 : 4A    "J"    deca
C084 : CA 74    " t"    orab  #$74
C086 : BF A7 04    "   "    sts  XA704
C089 : 29 D4    ") "    bvs  LC05F
C08B : FB 2B 00    " + "    addb  X2B00
C08E : 68 3B    "h;"    asl  $3B,x
C090 : FF 5B 95    " [ "    stx  X5B95
C093 : A0 03    "  "    suba  $03,x
        ;
C095 : 52    "R"    db  $52
        ;
C096 : CB EA    "  "    addb  #$EA
C098 : FB 56 5B    " V["    addb  X565B
C09B : 49    "I"    rola
        ;
C09C : 1A    " "    db  $1A
        ;
C09D : AC 82    "  "    cpx  $82,x
C09F : B5 AA 22    "  ""    bita  XAA22
C0A2 : B5 AD FA    "   "    bita  XADFA
C0A5 : F1 3B 32    " ;2"    cmpb  X3B32
C0A8        LC0A8:
C0A8 : 01    " "    nop
C0A9 : EA 55    " U"    orab  $55,x
C0AB : 28 55    "(U"    bvc  LC102
C0AD : A9 51    " Q"    adca  $51,x
C0AF : 7D E9 3F    "} ?"    tst  XE93F
        ;
C0B2 : 45 83    "E "    db  $45, $83
        ;
C0B4 : 58    "X"    aslb
C0B5 : 94 D4    "  "    anda  X00D4
        ;
C0B7 : E3 FC 9D    "   "    db  $E3, $FC, $9D
        ;
C0BA : 46    "F"    rora
C0BB        XC0BB:
C0BB : 8B 14    "  "    adda  #$14
C0BD : 0A    " "    clv
C0BE : 11    " "    cba
C0BF : D2 3D    " ="    sbcb  X003D
C0C1 : 7F 2B 5A    " +Z"    clr  X2B5A
C0C4        XC0C4:
C0C4 : 2B 16    "+ "    bmi  LC0DC
C0C6 : 2A 28    "*("    bpl  LC0F0
C0C8 : AD 5D    " ]"    jsr  $5D,x            ;INFO: index jump
C0CA : DF EA    "  "    stx  X00EA
C0CC : AB 04    "  "    adda  $04,x
        ;
C0CE : 51    "Q"    db  $51
        ;
C0CF : 50    "P"    negb
C0D0 : BB 6B 45    " kE"    adda  X6B45
C0D3 : 9A AF    "  "    oraa  X00AF
        ;
C0D5 : 05    " "    db  $05
        ;
C0D6 : D4 A5    "  "    andb  X00A5
C0D8 : 28 A2    "( "    bvc  LC07C
C0DA : 50    "P"    negb
        ;
C0DB : 45    "E"    db  $45
        ;
C0DC        LC0DC:
C0DC : BE EF 82    "   "    lds  XEF82
C0DF : 84 F6    "  "    anda  #$F6
C0E1 : 7D 6B 5F    "}k_"    tst  X6B5F
C0E4 : 81 0A    "  "    cmpa  #$0A
C0E6 : 74 6F 95    "to "    lsr  X6F95
C0E9 : AE 5E    " ^"    lds  $5E,x
C0EB : 2A 20    "* "    bpl  LC10D
        ;
C0ED : 55    "U"    db  $55
        ;
C0EE : F5 BB 0B    "   "    bitb  XBB0B
C0F1 : 48    "H"    asla
C0F2 : E7 5A    " Z"    stab  $5A,x
C0F4 : A1 18    "  "    cmpa  $18,x
C0F6 : 66 F6    "f "    ror  $F6,x
C0F8 : 60 E9    "` "    neg  $E9,x
C0FA : 35    "5"    txs
C0FB : 54    "T"    lsrb
C0FC : BD 00 65    "  e"    jsr  L0065
C0FF : EB 2A    " *"    addb  $2A,x
C101 : F2 FF A5    "   "    sbcb  XFFA5
C104 : 20 22    " ""    bra  LC128
        ;
C106 : B5 DD BB    "   "    bita  XDDBB
C109 : AF A5    "  "    sts  $A5,x
        ;
C10B : 12 04    "  "    db  $12, $04
        ;
C10D        LC10D:
C10D : E5 EE    "  "    bitb  $EE,x
C10F        XC10F:
C10F : AB 50    " P"    adda  $50,x
        ;
C111 : 61    "a"    db  $61
        ;
C112 : A7 5B    " ["    staa  $5B,x
        ;
C114 : 00 55    " U"    db  $00, $55
        ;
C116 : B5 77 D5    " w "    bita  X77D5
C119 : 0B    " "    sev
C11A : 96 A4    "  "    ldaa  X00A4
C11C : CE 18 2A    "  *"    ldx  #$182A
C11F : 9B BB    "  "    adda  X00BB
C121 : B2 B9 D6    "   "    sbca  XB9D6
        ;
C124 : 41 4B    "AK"    db  $41, $4B
        ;
C126 : 92 8A    "  "    sbca  X008A
C128        LC128:
C128 : DA 5F    " _"    orab  X005F
C12A : C0 FD    "  "    subb  #$FD
C12C : D2 5D    " ]"    sbcb  X005D
        ;
C12E : 12    " "    db  $12
        ;
C12F : 69 A9    "i "    rol  $A9,x
        ;
C131 : 14    " "    db  $14
        ;
C132 : BE 81 D4    "   "    lds  X81D4
C135 : 0B    " "    sev
C136 : FB 45 A9    " E "    addb  X45A9
C139 : 58    "X"    aslb
C13A : A5 F8    "  "    bita  $F8,x
C13C : 57    "W"    asrb
C13D : 50    "P"    negb
        ;
C13E : CD    " "    db  $CD
        ;
C13F : 91 BB    "  "    cmpa  X00BB
C141 : D0 2B    " +"    subb  X002B
C143 : 40    "@"    nega
C144 : B5 DB 2A    "  *"    bita  XDB2A
C147 : 92 FE    "  "    sbca  X00FE
        ;
C149 : 05    " "    db  $05
        ;
C14A : B7 09 F5    "   "    staa  X09F5
C14D : 57    "W"    asrb
C14E : 01    " "    nop
C14F : A9 5A    " Z"    adca  $5A,x
C151 : 34    "4"    des
C152 : B5 57 20    " W "    bita  X5720
C155 : AB 2A    " *"    adda  $2A,x
C157 : CA AA    "  "    orab  #$AA
C159 : FA 56 D0    " V "    orab  X56D0
C15C : 4A    "J"    deca
C15D : 73 EF DC    "s  "    com  XEFDC
        ;
C160 : 05    " "    db  $05
        ;
C161 : 85 97    "  "    bita  #$97
        ;
C163 : 38    "8"    db  $38
        ;
C164 : 95 D5    "  "    bita  X00D5
        ;
C166 : 61 75    "au"    db  $61, $75
        ;
C168 : A8 E3    "  "    eora  $E3,x
C16A : 28 21    "(!"    bvc  LC18D
C16C : BE E6 81    "   "    lds  XE681
C16F : 74 BD CF    "t  "    lsr  XBDCF
C172 : 20 2E    " ."    bra  LC1A2
        ;
C174 : BE 65 88    " e "    lds  X6588
C177 : B4 DF 5A    "  Z"    anda  XDF5A
        ;
C17A : 41    "A"    db  $41
        ;
C17B : A9 1D    "  "    adca  $1D,x
C17D : 7D 62 A0    "}b "    tst  X62A0
C180 : 8A 57    " W"    oraa  #$57
        ;
C182 : 5E    "^"    db  $5E
        ;
C183 : 5D    "]"    tstb
        ;
C184 : 42    "B"    db  $42
        ;
C185 : AB 13    "  "    adda  $13,x
C187 : AB 1F    "  "    adda  $1F,x
C189        LC189:
C189 : 84 7A    " z"    anda  #$7A
C18B : EA B7    "  "    orab  $B7,x
        ;
C18D        LC18D:
C18D : 12    " "    db  $12
        ;
C18E : 68 F9    "h "    asl  $F9,x
C190 : 96 6E    " n"    ldaa  X006E
        ;
C192 : 41    "A"    db  $41
        ;
C193 : 8E D7 2B    "  +"    lds  #$D72B
C196 : A8 67    " g"    eora  $67,x
C198 : 44    "D"    lsra
C199 : 7D 84 EB    "}  "    tst  X84EB
C19C : 92 DE    "  "    sbca  X00DE
        ;
C19E : 15    " "    db  $15
        ;
C19F : 9A 22    " ""    oraa  X0022
C1A1 : 39    "9"    rts
        ;
C1A2        LC1A2:
C1A2 : A1 BB    "  "    cmpa  $BB,x
C1A4 : DA 2F    " /"    orab  X002F
C1A6 : 6A 0B    "j "    dec  $0B,x
        ;
C1A8 : 52    "R"    db  $52
        ;
C1A9 : 8B 6A    " j"    adda  #$6A
C1AB : B8 D7 33    "  3"    eora  XD733
C1AE : AC 75    " u"    cpx  $75,x
C1B0 : 10    " "    sba
C1B1 : 57    "W"    asrb
C1B2 : 49    "I"    rola
C1B3 : 59    "Y"    rolb
C1B4 : 2E BD    ". "    bgt  LC173
C1B6 : C8 A8    "  "    eorb  #$A8
C1B8 : 08    " "    inx
C1B9        XC1B9:
C1B9 : F5 5E 6F    " ^o"    bitb  X5E6F
C1BC : AF 4A    " J"    sts  $4A,x
C1BE : 01    " "    nop
C1BF : AD A2    "  "    jsr  $A2,x            ;INFO: index jump
C1C1 : A5 53    " S"    bita  $53,x
C1C3 : A9 A8    "  "    adca  $A8,x
C1C5 : A2 DA    "  "    sbca  $DA,x
C1C7 : 7F 69 09    " i "    clr  X6909
        ;
C1CA : 51    "Q"    db  $51
        ;
C1CB : F0 CA EA    "   "    subb  XCAEA
C1CE : BA 14 A0    "   "    oraa  X14A0
        ;
C1D1 : ED 5B    " ["    db  $ED, $5B
        ;
C1D3 : F2 02 C3    "   "    sbcb  X02C3
        ;
C1D6 : 87    " "    db  $87
        ;
C1D7 : BA 2B 0D    " + "    oraa  X2B0D
C1DA : 49    "I"    rola
C1DB : AD 53    " S"    jsr  $53,x            ;INFO: index jump
C1DD : D7 8A    "  "    stab  X008A
C1DF : 23 A8    "# "    bls  LC189
C1E1 : C5 D5    "  "    bitb  #$D5
C1E3 : D7 B5    "  "    stab  X00B5
C1E5 : 46    "F"    rora
C1E6 : 31    "1"    ins
C1E7 : 56    "V"    rorb
        ;
C1E8 : 75    "u"    db  $75
        ;
C1E9 : AF 28    " ("    sts  $28,x
C1EB : 07    " "    tpa
        ;
C1EC : 45    "E"    db  $45
        ;
C1ED : 4A    "J"    deca
C1EE : 59    "Y"    rolb
        ;
C1EF : 83 5B    " ["    db  $83, $5B
        ;
C1F1 : 0D    " "    sec
C1F2 : 8A 1A    "  "    oraa  #$1A
C1F4 : 4D    "M"    tsta
C1F5 : AA BB    "  "    oraa  $BB,x
        ;
C1F7 : CD 55 75    " Uu"    db  $CD, $55, $75
        ;
C1FA : 8A FF    "  "    oraa  #$FF
C1FC : A2 FA    "  "    sbca  $FA,x
        ;
C1FE : 55    "U"    db  $55
        ;
C1FF : 4F    "O"    clra
C200 : A8 2E    " ."    eora  $2E,x
C202 : 4C    "L"    inca
C203 : 8A 83    "  "    oraa  #$83
C205 : 56    "V"    rorb
C206 : 78 A9 25    "x %"    asl  XA925
        ;
C209 : 41    "A"    db  $41
        ;
C20A : 53    "S"    comb
C20B : D1 4B    " K"    cmpb  X004B
C20D : A9 BC    "  "    adca  $BC,x
C20F : A6 8B    "  "    ldaa  $8B,x
C211 : AB F5    "  "    adda  $F5,x
C213 : 97 D2    "  "    staa  X00D2
C215 : 57    "W"    asrb
C216 : 32    "2"    pula
C217 : F8 62 17    " b "    eorb  X6217
C21A : 48    "H"    asla
C21B : F5 48 A3    " H "    bitb  X48A3
        ;
C21E : 55    "U"    db  $55
        ;
C21F : B8 2E F9    " . "    eora  X2EF9
        ;
C222 : 52    "R"    db  $52
        ;
C223 : A5 6A    " j"    bita  $6A,x
C225 : 2B 45    "+E"    bmi  LC26C
C227 : BA A7 B9    "   "    oraa  XA7B9
C22A : 2B A8    "+ "    bmi  LC1D4
        ;
C22C        LC22C:
C22C : E3    " "    db  $E3
        ;
C22D : 53    "S"    comb
C22E : 47    "G"    asra
C22F : 43    "C"    coma
C230 : A5 B2    "  "    bita  $B2,x
C232 : 2A 52    "*R"    bpl  LC286
C234 : A9 2D    " -"    adca  $2D,x
        ;
C236 : FD    " "    db  $FD
        ;
C237 : 2A 2E    "*."    bpl  LC267
C239 : 69 AF    "i "    rol  $AF,x
C23B : EA 52    " R"    orab  $52,x
        ;
C23D : 21    "!"    db  $21
        ;
C23E : B8 47 F9    " G "    eora  X47F9
C241 : A8 4A    " J"    eora  $4A,x
C243 : 5F    "_"    clrb
C244 : 98 0A    "  "    eora  X000A
C246 : AD 50    " P"    jsr  $50,x            ;INFO: index jump
        ;
C248 : 62    "b"    db  $62
        ;
C249 : 68 FD    "h "    asl  $FD,x
C24B : 2B 5E    "+^"    bmi  LC2AB
C24D : A0 94    "  "    suba  $94,x
C24F : 8B E2    "  "    adda  #$E2
        ;
C251 : 5B    "["    db  $5B
        ;
C252 : B4 E7 42    "  B"    anda  XE742
C255 : E5 AB    "  "    bitb  $AB,x
C257 : A2 25    " %"    sbca  $25,x
C259 : 82 F6    "  "    sbca  #$F6
C25B : 56    "V"    rorb
C25C : 9E AE    "  "    lds  X00AE
C25E : D6 8A    "  "    ldab  X008A
C260 : 08    " "    inx
        ;
C261 : 00    " "    db  $00
        ;
C262 : BA 7E 53    " ~S"    oraa  X7E53
C265 : 91 AA    "  "    cmpa  X00AA
C267        LC267:
C267 : 7A 3D 29    "z=)"    dec  X3D29
C26A : 92 3F    " ?"    sbca  X003F
C26C        LC26C:
C26C : D5 0B    "  "    bitb  X000B
C26E : A0 D2    "  "    suba  $D2,x
C270 : EA EB    "  "    orab  $EB,x
C272 : 2A 35    "*5"    bpl  LC2A9
C274        LC274:
C274 : 08    " "    inx
C275 : 54    "T"    lsrb
        ;
C276 : FD 45    " E"    db  $FD, $45
        ;
C278 : A5 24    " $"    bita  $24,x
C27A : EB AD    "  "    addb  $AD,x
C27C : 2E F6    ". "    bgt  LC274
C27E : A2 DA    "  "    sbca  $DA,x
C280 : 29 2A    ")*"    bvs  LC2AC
C282 : 49    "I"    rola
C283 : 9A 0F    "  "    oraa  X000F
C285 : E9 57    " W"    adcb  $57,x
C287 : 50    "P"    negb
C288 : A8 AA    "  "    eora  $AA,x
C28A : 2F A0    "/ "    ble  LC22C
C28C : BE 4A A9    " J "    lds  X4AA9
C28F : D7 BA    "  "    stab  X00BA
        ;
C291 : 87    " "    db  $87
        ;
C292 : F8 4B 8A    " K "    eorb  X4B8A
        ;
C295 : 42    "B"    db  $42
        ;
C296 : E9 AF    "  "    adcb  $AF,x
C298 : E9 22    " ""    adcb  $22,x
C29A : AC 9A    "  "    cpx  $9A,x
C29C : 4A    "J"    deca
C29D        LC29D:
C29D : 8A A4    "  "    oraa  #$A4
C29F : DB F7    "  "    addb  X00F7
C2A1 : 32    "2"    pula
C2A2 : F0 6F 8E    " o "    subb  X6F8E
        ;
C2A5 : 1A    " "    db  $1A
        ;
C2A6 : E4 0B    "  "    andb  $0B,x
C2A8 : B5 AE 86    "   "    bita  XAE86
        ;
C2AB        LC2AB:
C2AB : 03    " "    db  $03
        ;
C2AC        LC2AC:
C2AC : 60 AD    "` "    neg  $AD,x
C2AE : 7D F5 EA    "}  "    tst  XF5EA
C2B1 : 32    "2"    pula
        ;
C2B2 : 15    " "    db  $15
        ;
C2B3 : 82 2B    " +"    sbca  #$2B
        ;
C2B5 : 52    "R"    db  $52
        ;
C2B6 : AB D7    "  "    adda  $D7,x
        ;
C2B8 : 61    "a"    db  $61
        ;
C2B9 : FE 5D C1    " ] "    ldx  X5DC1
        ;
C2BC : 8F    " "    db  $8F
        ;
C2BD : C1 06    "  "    cmpb  #$06
        ;
C2BF : 55    "U"    db  $55
        ;
C2C0 : B4 B5 97    "   "    anda  XB597
C2C3 : B0 1F 90    "   "    suba  X1F90
        ;
C2C6 : A3 A3 55    "  U"    db  $A3, $A3, $55
        ;
C2C9 : B9 06 58    "  X"    adca  X0658
C2CC : B5 BA C5    "   "    bita  XBAC5
C2CF : 17    " "    tba
C2D0 : 7A AB 12    "z  "    dec  XAB12
C2D3 : 85 D2    "  "    bita  #$D2
C2D5 : D7 17    "  "    stab  X0017
C2D7 : A7 50    " P"    staa  $50,x
C2D9 : 11    " "    cba
C2DA : DE 67    " g"    ldx  X0067
        ;
C2DC : 87    " "    db  $87
        ;
C2DD : 91 EE    "  "    cmpa  X00EE
C2DF : F0 53 44    " SD"    subb  X5344
C2E2 : E6 9C    "  "    ldab  $9C,x
C2E4 : 2F 56    "/V"    ble  LC33C
C2E6 : C1 42    " B"    cmpb  #$42
C2E8 : 01    " "    nop
C2E9 : E8 56    " V"    eorb  $56,x
        ;
C2EB : E3    " "    db  $E3
        ;
C2EC : 22 AF    "" "    bhi  LC29D
C2EE : 19    " "    daa
C2EF : 5A    "Z"    decb
C2F0 : BE AF 4B    "  K"    lds  XAF4B
C2F3 : 82 54    " T"    sbca  #$54
C2F5 : DF B1    "  "    stx  X00B1
        ;
C2F7 : 12    " "    db  $12
        ;
C2F8 : 4D    "M"    tsta
C2F9 : AF EB    "  "    sts  $EB,x
        ;
C2FB        XC2FB:
C2FB : 52    "R"    db  $52
        ;
C2FC : 46    "F"    rora
C2FD : 85 D9    "  "    bita  #$D9
C2FF : B5 44 A1    " D "    bita  X44A1
C302 : A2 D5    "  "    sbca  $D5,x
        ;
C304 : FC    " "    db  $FC
        ;
C305 : 0A    " "    clv
        ;
C306 : 87    " "    db  $87
        ;
C307 : A9 A2    "  "    adca  $A2,x
C309 : 68 A9    "h "    asl  $A9,x
        ;
C30B : C7    " "    db  $C7
        ;
C30C : 2B C3    "+ "    bmi  LC2D1
C30E : A2 F3    "  "    sbca  $F3,x
C310 : 0A    " "    clv
        ;
C311 : 75    "u"    db  $75
        ;
C312 : 67 A9    "g "    asr  $A9,x
C314 : 50    "P"    negb
C315 : 68 BB    "h "    asl  $BB,x
        ;
C317 : D3    " "    db  $D3
        ;
C318 : 6A 78    "jx"    dec  $78,x
C31A : 57    "W"    asrb
C31B : AB 1B    "  "    adda  $1B,x
C31D : 9F 39    " 9"    sts  X0039
C31F : 70 1A EF    "p  "    neg  X1AEF
        ;
C322 : 93    " "    db  $93
        ;
C323 : 82 22    " ""    sbca  #$22
C325 : 2D E3    "- "    blt  LC30A
        ;
C327        LC327:
C327 : 3C 41    "<A"    db  $3C, $41
        ;
C329 : BA 17 75    "  u"    oraa  X1775
C32C : 54    "T"    lsrb
C32D : A7 54    " T"    staa  $54,x
C32F        XC32F:
C32F : 59    "Y"    rolb
        ;
C330 : 87 71    " q"    db  $87, $71
        ;
C332 : DE 0A    "  "    ldx  X000A
C334 : 77 D0 BA    "w  "    asr  XD0BA
C337 : 50    "P"    negb
        ;
C338 : 1D    " "    db  $1D
        ;
C339 : 2B 6B    "+k"    bmi  LC3A6
C33B : 0E    " "    cli
C33C        LC33C:
C33C : 3F    "?"    swi
C33D : 68 8D    "h "    asl  $8D,x
        ;
C33F : 5E    "^"    db  $5E
        ;
C340 : 1B    " "    aba
C341 : B4 57 83    " W "    anda  X5783
C344 : 43    "C"    coma
C345 : A2 B5    "  "    sbca  $B5,x
C347 : BA 9F 42    "  B"    oraa  X9F42
C34A : 50    "P"    negb
C34B : 9F 3E    " >"    sts  X003E
C34D : 69 95    "i "    rol  $95,x
C34F : 0A    " "    clv
C350 : 53    "S"    comb
C351 : 35    "5"    txs
C352 : 60 D4    "` "    neg  $D4,x
C354 : DF 14    "  "    stx  X0014
C356 : 7E E8 A8    "~  "    jmp  LE8A8
        ;
C359 : 7B 13    "{ "    db  $7B, $13
        ;
C35B : AB 5A    " Z"    adda  $5A,x
C35D : E2 78    " x"    sbcb  $78,x
C35F : 78 07 C9    "x  "    asl  X07C9
        ;
C362 : 21 ED    "! "    db  $21, $ED
        ;
C364 : 25 57    "%W"    bcs  LC3BD
C366 : 89 52    " R"    adca  #$52
C368 : E9 28    " ("    adcb  $28,x
C36A : B4 EC 35    "  5"    anda  XEC35
        ;
C36D : C7    " "    db  $C7
        ;
C36E : EB 18    "  "    addb  $18,x
C370 : FB E1 8A    "   "    addb  XE18A
C373 : 46    "F"    rora
C374 : 23 8D    "# "    bls  LC303
C376 : 44    "D"    lsra
C377 : AD EA    "  "    jsr  $EA,x            ;INFO: index jump
        ;
C379 : E3    " "    db  $E3
        ;
C37A : 47    "G"    asra
C37B : 2E AA    ". "    bgt  LC327
        ;
C37D : EC    " "    db  $EC
        ;
C37E : 80 4B    " K"    suba  #$4B
C380 : 49    "I"    rola
C381 : 9F D1    "  "    sts  X00D1
C383 : 2D 27    "-'"    blt  LC3AC
C385 : 8A 0A    "  "    oraa  #$0A
C387 : 8E CA 5E    "  ^"    lds  #$CA5E
C38A : EF 88    "  "    stx  $88,x
C38C : AA 52    " R"    oraa  $52,x
        ;
C38E : 8F    " "    db  $8F
        ;
C38F : 80 DF    "  "    suba  #$DF
C391 : 35    "5"    txs
        ;
C392 : 1C C3    "  "    db  $1C, $C3
        ;
C394 : B5 5B 29    " [)"    bita  X5B29
C397 : 64 9A    "d "    lsr  $9A,x
C399 : FA 2A 6A    " *j"    orab  X2A6A
        ;
C39C : C3    " "    db  $C3
        ;
C39D : F2 A0 29    "  )"    sbcb  XA029
C3A0 : B0 7B 43    " {C"    suba  X7B43
C3A3 : B8 12 B7    "   "    eora  X12B7
        ;
C3A6        LC3A6:
C3A6 : 6B    "k"    db  $6B
        ;
C3A7 : 33    "3"    pulb
C3A8 : 8E 91 EC    "   "    lds  #$91EC
C3AB : F2 41 25    " A%"    sbcb  X4125
C3AE : DA 95    "  "    orab  X0095
        ;
C3B0 : 87 13    "  "    db  $87, $13
        ;
C3B2 : AD E2    "  "    jsr  $E2,x            ;INFO: index jump
        ;
C3B4 : 1F    " "    db  $1F
        ;
C3B5 : 0D    " "    sec
        ;
C3B6 : E3 1E    "  "    db  $E3, $1E
        ;
C3B8 : 0B    " "    sev
C3B9 : 5D    "]"    tstb
C3BA : 67 C3    "g "    asr  $C3,x
        ;
C3BC : A3    " "    db  $A3
        ;
C3BD        LC3BD:
C3BD : E9 B5    "  "    adcb  $B5,x
C3BF : 20 43    " C"    bra  LC404
        ;
C3C1 : FD    " "    db  $FD
        ;
C3C2 : A7 B0    "  "    staa  $B0,x
        ;
C3C4 : 1C    " "    db  $1C
        ;
C3C5 : 67 0A    "g "    asr  $0A,x
C3C7 : 6A 3D    "j="    dec  $3D,x
C3C9 : 0E    " "    cli
C3CA : 4D    "M"    tsta
        ;
C3CB : 9D    " "    db  $9D
        ;
C3CC : 8A 29    " )"    oraa  #$29
C3CE : 6C AB    "l "    inc  $AB,x
C3D0 : A5 EB    "  "    bita  $EB,x
        ;
C3D2 : A3 15    "  "    db  $A3, $15
        ;
C3D4 : A5 E7    "  "    bita  $E7,x
C3D6 : 78 68 FA    "xh "    asl  X68FA
C3D9 : AF 20    "  "    sts  $20,x
        ;
C3DB : 4B    "K"    db  $4B
        ;
C3DC : 96 46    " F"    ldaa  X0046
C3DE : D2 5E    " ^"    sbcb  X005E
C3E0 : A6 4B    " K"    ldaa  $4B,x
C3E2 : 20 7D    " }"    bra  LC461
        ;
C3E4 : A8 32    " 2"    eora  $32,x
C3E6 : 1B    " "    aba
C3E7 : 7A 67 30    "zg0"    dec  X6730
C3EA : EF 74    " t"    stx  $74,x
C3EC : 30    "0"    tsx
C3ED : 5F    "_"    clrb
C3EE : C1 8B    "  "    cmpb  #$8B
C3F0 : E8 3C    " <"    eorb  $3C,x
        ;
C3F2 : 1E    " "    db  $1E
        ;
C3F3 : 89 4B    " K"    adca  #$4B
C3F5 : 5A    "Z"    decb
C3F6 : BA F0 A2    "   "    oraa  XF0A2
C3F9 : 6A 17    "j "    dec  $17,x
C3FB : 57    "W"    asrb
C3FC : E1 B2    "  "    cmpb  $B2,x
C3FE : D2 D4    "  "    sbcb  X00D4
C400 : 5C    "\"    incb
C401 : 8B 20    "  "    adda  #$20
        ;
C403 : B3 FC    "  "    db  $B3, $FC
        ;
C405 : 0B    " "    sev
        ;
C406 : 1C 5E    " ^"    db  $1C, $5E
        ;
C408 : A8 F9    "  "    eora  $F9,x
        ;
C40A : 42    "B"    db  $42
        ;
C40B : 9A D5    "  "    oraa  X00D5
C40D : E1 05    "  "    cmpb  $05,x
C40F : 59    "Y"    rolb
        ;
C410 : 4E 1F    "N "    db  $4E, $1F
        ;
C412 : 6A 6B    "jk"    dec  $6B,x
C414 : B1 72 78    " rx"    cmpa  X7278
C417 : F5 14 C8    "   "    bitb  X14C8
C41A : AA E6    "  "    oraa  $E6,x
C41C : 43    "C"    coma
C41D : AB 1C    "  "    adda  $1C,x
        ;
C41F : 45    "E"    db  $45
        ;
C420 : AA A7    "  "    oraa  $A7,x
        ;
C422 : 3A 3C    ":<"    db  $3A, $3C
        ;
C424 : A4 DB    "  "    anda  $DB,x
C426        LC426:
C426 : 9A 6A    " j"    oraa  X006A
C428 : E1 23    " #"    cmpb  $23,x
C42A : 2A FA    "* "    bpl  LC426
C42C : 48    "H"    asla
C42D : 68 B5    "h "    asl  $B5,x
C42F : 73 71 D4    "sq "    com  X71D4
C432 : 85 BE    "  "    bita  #$BE
C434 : 50    "P"    negb
C435 : AF 2B    " +"    sts  $2B,x
C437 : 0B    " "    sev
C438 : B5 E6 10    "   "    bita  XE610
C43B : 95 EB    "  "    bita  X00EB
C43D : 31    "1"    ins
C43E : CA BA    "  "    orab  #$BA
C440 : CA C3    "  "    orab  #$C3
C442 : 06    " "    tap
        ;
C443 : 87    " "    db  $87
        ;
C444 : 3E    ">"    wai
        ;
C445 : 3A    ":"    db  $3A
        ;
C446 : 26 E6    "& "    bne  LC42E
        ;
C448 : 45    "E"    db  $45
        ;
C449 : BB 28 BA    " ( "    adda  X28BA
C44C : 17    " "    tba
C44D : 16    " "    tab
        ;
C44E : 3D 1E A3    "=  "    db  $3D, $1E, $A3
        ;
C451 : B7 55 0A    " U "    staa  X550A
C454 : 9A 75    " u"    oraa  X0075
C456 : BB 2C 2E    " ,."    adda  X2C2E
C459 : 8A E2    "  "    oraa  #$E2
C45B : AB C7    "  "    adda  $C7,x
C45D : AB 68    " h"    adda  $68,x
C45F : 22 3C    ""<"    bhi  LC49D
C461        LC461:
C461 : AB 39    " 9"    adda  $39,x
C463 : D2 50    " P"    sbcb  X0050
C465 : 2F 2B    "/+"    ble  LC492
C467 : 94 47    " G"    anda  X0047
C469 : F9 D6 89    "   "    adcb  XD689
C46C : 84 4B    " K"    anda  #$4B
C46E : BD 47 17    " G "    jsr  L4717
C471 : 2A 27    "*'"    bpl  LC49A
C473 : BD B6 E2    "   "    jsr  LB6E2
C476 : A8 28    " ("    eora  $28,x
        ;
C478 : ED    " "    db  $ED
        ;
C479 : 0B    " "    sev
C47A : AF 8A    "  "    sts  $8A,x
C47C : 4F    "O"    clra
C47D : 29 0A    ") "    bvs  LC489
C47F : A7 AA    "  "    staa  $AA,x
C481 : B2 86 4E    "  N"    sbca  X864E
C484 : F8 38 4A    " 8J"    eorb  X384A
C487 : 4D    "M"    tsta
C488 : D5 E0    "  "    bitb  X00E0
C48A : 57    "W"    asrb
C48B : 44    "D"    lsra
C48C : BF 65 9C    " e "    sts  X659C
        ;
C48F : 93 C7 61    "  a"    db  $93, $C7, $61
        ;
C492        LC492:
C492 : E9 A8    "  "    adcb  $A8,x
C494 : 31    "1"    ins
        ;
C495 : A3    " "    db  $A3
        ;
C496 : BE 25 0C    " % "    lds  X250C
C499 : F1 5B 2B    " [+"    cmpb  X5B2B
C49C        XC49C:
C49C : 08    " "    inx
C49D        LC49D:
C49D : 96 7A    " z"    ldaa  X007A
C49F : EE A0    "  "    ldx  $A0,x
C4A1 : 43    "C"    coma
C4A2 : 95 3E    " >"    bita  X003E
C4A4 : 0D    " "    sec
        ;
C4A5 : 45    "E"    db  $45
        ;
C4A6 : AA DE    "  "    oraa  $DE,x
        ;
C4A8 : A3    " "    db  $A3
        ;
C4A9 : 11    " "    cba
C4AA : AB F8    "  "    adda  $F8,x
        ;
C4AC : 42    "B"    db  $42
        ;
C4AD : F5 14 35    "  5"    bitb  X1435
C4B0 : 7A 2F A8    "z/ "    dec  X2FA8
C4B3 : B2 6B 56    " kV"    sbca  X6B56
C4B6 : CA D2    "  "    orab  #$D2
        ;
C4B8 : 21    "!"    db  $21
        ;
C4B9 : EB 29    " )"    addb  $29,x
C4BB : 7D 90 94    "}  "    tst  X9094
C4BE : 9E AB    "  "    lds  X00AB
C4C0 : 43    "C"    coma
C4C1        LC4C1:
C4C1 : 9A 8B    "  "    oraa  X008B
C4C3 : 56    "V"    rorb
C4C4 : 86 A3    "  "    ldaa  #$A3
        ;
C4C6 : 8F    " "    db  $8F
        ;
C4C7 : A8 96    "  "    eora  $96,x
C4C9 : AA 5E    " ^"    oraa  $5E,x
        ;
C4CB : 1F    " "    db  $1F
        ;
C4CC : 70 95 AF    "p  "    neg  X95AF
C4CF : 36    "6"    psha
C4D0 : 0A    " "    clv
C4D1 : DE 95    "  "    ldx  X0095
C4D3 : 91 5E    " ^"    cmpa  X005E
C4D5 : D2 41    " A"    sbcb  X0041
C4D7 : E5 9E    "  "    bitb  $9E,x
C4D9 : D2 13    "  "    sbcb  X0013
C4DB : 8C 67 FA    " g "    cpx  #$67FA
        ;
C4DE : 42    "B"    db  $42
        ;
C4DF : 74 17 C7    "t  "    lsr  X17C7
C4E2 : BB 61 89    " a "    adda  X6189
C4E5 : 74 F2 70    "t p"    lsr  XF270
C4E8 : B4 1A 95    "   "    anda  X1A95
C4EB : E5 D3    "  "    bitb  $D3,x
C4ED : 69 4F    "iO"    rol  $4F,x
C4EF : 0E    " "    cli
        ;
C4F0 : CC 8F    "  "    db  $CC, $8F
        ;
C4F2 : A5 2E    " ."    bita  $2E,x
C4F4        XC4F4:
C4F4 : 8D CB    "  "    bsr  LC4C1
C4F6 : 43    "C"    coma
        ;
C4F7 : 38    "8"    db  $38
        ;
C4F8        XC4F8:
C4F8 : AE B2    "  "    lds  $B2,x
C4FA : EA E8    "  "    orab  $E8,x
C4FC : 70 0A 1E    "p  "    neg  X0A1E
C4FF : 3E    ">"    wai
        ;
C500 : A3    " "    db  $A3
        ;
C501 : 73 17 45    "s E"    com  X1745
C504 : 56    "V"    rorb
C505 : E2 79    " y"    sbcb  $79,x
C507 : EE E1    "  "    ldx  $E1,x
C509 : C1 A8    "  "    cmpb  #$A8
        ;
C50B : 62    "b"    db  $62
        ;
C50C : 8B 1B    "  "    adda  #$1B
C50E : 73 72 54    "srT"    com  X7254
C511 : B7 43 E9    " C "    staa  X43E9
C514 : 5C    "\"    incb
C515 : F8 50 11    " P "    eorb  X5011
C518        LC518:
C518 : BA D4 AB    "   "    oraa  XD4AB
C51B : 90 AA    "  "    suba  X00AA
C51D : 9A A5    "  "    oraa  X00A5
        ;
C51F        LC51F:
C51F : 5E    "^"    db  $5E
        ;
C520 : 96 D2    "  "    ldaa  X00D2
C522 : A9 F8    "  "    adca  $F8,x
        ;
C524 : 83    " "    db  $83
        ;
C525 : 9A A2    "  "    oraa  X00A2
C527 : 6A 70    "jp"    dec  $70,x
C529 : 2F E5    "/ "    ble  LC510
C52B : A2 70    " p"    sbca  $70,x
C52D : 6C 1E    "l "    inc  $1E,x
C52F : 63 F0    "c "    com  $F0,x
C531 : D1 14    "  "    cmpb  X0014
C533 : 0F    " "    sei
C534 : F5 A2 E0    "   "    bitb  XA2E0
C537 : BD 22 D5    " " "    jsr  L22D5
C53A : 27 3A    "':"    beq  LC576
        ;
C53C : C3    " "    db  $C3
        ;
C53D : 2A 49    "*I"    bpl  LC588
C53F : BF 0A AA    "   "    sts  X0AAA
        ;
C542 : D3 13    "  "    db  $D3, $13
        ;
C544 : 0F    " "    sei
C545 : AA 1D    "  "    oraa  $1D,x
        ;
C547 : C7    " "    db  $C7
        ;
C548 : 25 D5    "% "    bcs  LC51F
        ;
C54A : 3C    "<"    db  $3C
        ;
C54B : 8B E2    "  "    adda  #$E2
C54D : 86 5A    " Z"    ldaa  #$5A
C54F : AC 8E    "  "    cpx  $8E,x
C551 : 97 E3    "  "    staa  X00E3
        ;
C553 : 1A    " "    db  $1A
        ;
C554 : 46    "F"    rora
        ;
C555 : 9D    " "    db  $9D
        ;
C556 : 8D 92    "  "    bsr  LC4EA
C558 : 56    "V"    rorb
        ;
C559 : 5B    "["    db  $5B
        ;
C55A : 9C FA    "  "    cpx  X00FA
        ;
C55C : 42    "B"    db  $42
        ;
C55D : BE 2C 56    " ,V"    lds  X2C56
C560 : B2 8A 96    "   "    sbca  X8A96
        ;
C563 : 4B    "K"    db  $4B
        ;
C564 : AC B7    "  "    cpx  $B7,x
C566 : A5 5E    " ^"    bita  $5E,x
C568 : 0A    " "    clv
C569 : B8 1A 95    "   "    eora  X1A95
        ;
C56C : 5E    "^"    db  $5E
        ;
C56D : E6 AE    "  "    ldab  $AE,x
        ;
C56F : 41    "A"    db  $41
        ;
C570 : 5D    "]"    tstb
C571 : 27 17    "' "    beq  LC58A
C573 : 39    "9"    rts
        ;
C574 : 3D    "="    db  $3D
        ;
C575 : D7 94    "  "    stab  X0094
C577 : 82 BB    "  "    sbca  #$BB
C579 : E8 5E    " ^"    eorb  $5E,x
C57B : 9C 50    " P"    cpx  X0050
        ;
C57D : 75    "u"    db  $75
        ;
C57E : 89 8A    "  "    adca  #$8A
C580 : D5 77    " w"    bitb  X0077
C582 : AA 6E    " n"    oraa  $6E,x
        ;
C584 : 05    " "    db  $05
        ;
C585 : 58    "X"    aslb
        ;
C586 : 3D 5E    "=^"    db  $3D, $5E
        ;
C588        LC588:
C588 : 25 2F    "%/"    bcs  LC5B9
C58A        LC58A:
C58A : 58    "X"    aslb
C58B : 2F 8B    "/ "    ble  LC518
C58D : 57    "W"    asrb
        ;
C58E : C3 18    "  "    db  $C3, $18
        ;
C590 : D5 A3    "  "    bitb  X00A3
C592 : 2F F4    "/ "    ble  LC588
C594 : 50    "P"    negb
C595 : B7 41 AD    " A "    staa  X41AD
C598 : B2 7C 22    " |""    sbca  X7C22
C59B : D6 6B    " k"    ldab  X006B
        ;
C59D : 83 72    " r"    db  $83, $72
        ;
C59F : 33    "3"    pulb
C5A0 : 96 92    "  "    ldaa  X0092
C5A2 : 6A FA    "j "    dec  $FA,x
C5A4 : B5 08 6A    "  j"    bita  X086A
C5A7 : 49    "I"    rola
C5A8 : 67 1E    "g "    asr  $1E,x
C5AA : 2B 50    "+P"    bmi  LC5FC
C5AC : 7D 35 B4    "}5 "    tst  X35B4
        ;
C5AF : 14    " "    db  $14
        ;
C5B0 : 17    " "    tba
C5B1 : 99 93    "  "    adca  X0093
        ;
C5B3 : 71    "q"    db  $71
        ;
C5B4 : CE 8C EA    "   "    ldx  #$8CEA
        ;
C5B7 : 38    "8"    db  $38
        ;
C5B8 : 39    "9"    rts
        ;
C5B9        LC5B9:
C5B9 : C9 E9    "  "    adcb  #$E9
        ;
C5BB : 14    " "    db  $14
        ;
C5BC : 73 E6 CC    "s  "    com  XE6CC
C5BF : 89 1D    "  "    adca  #$1D
C5C1 : 33    "3"    pulb
        ;
C5C2 : C7    " "    db  $C7
        ;
C5C3 : AC CC    "  "    cpx  $CC,x
        ;
C5C5 : 18 6B C7    " k "    db  $18, $6B, $C7
        ;
C5C8 : A4 39    " 9"    anda  $39,x
C5CA : 66 C6    "f "    ror  $C6,x
C5CC : D1 99    "  "    cmpb  X0099
C5CE : 39    "9"    rts
        ;
C5CF : 53    "S"    comb
C5D0 : 8E 9A F0    "   "    lds  #$9AF0
C5D3 : F2 86 8C    "   "    sbcb  X868C
        ;
C5D6 : 1F    " "    db  $1F
        ;
C5D7 : 9C 72    " r"    cpx  X0072
C5D9 : E2 CC    "  "    sbcb  $CC,x
C5DB : 8E 23 4F    " #O"    lds  #$234F
C5DE : 9C 99    "  "    cpx  X0099
C5E0 : E9 30    " 0"    adcb  $30,x
        ;
C5E2 : E3    " "    db  $E3
        ;
C5E3 : 47    "G"    asra
C5E4        LC5E4:
C5E4 : 78 DC C8    "x  "    asl  XDCC8
C5E7 : 28 FB    "( "    bvc  LC5E4
        ;
C5E9 : 03 71 1F 1E  " q  "    db  $03, $71, $1F, $1E
        ;
C5ED : CA F4    "  "    orab  #$F4
C5EF : 0E    " "    cli
C5F0 : 2A 6B    "*k"    bpl  LC65D
C5F2 : 2B AA    "+ "    bmi  LC59E
C5F4 : BC 85 83    "   "    cpx  X8583
C5F7 : E7 1C    "  "    stab  $1C,x
        ;
C5F9 : 1C    " "    db  $1C
        ;
C5FA : EE E2    "  "    ldx  $E2,x
C5FC        LC5FC:
C5FC : A8 93    "  "    eora  $93,x
        ;
C5FE : A3    " "    db  $A3
        ;
C5FF : B2 1E 9C    "   "    sbca  X1E9C
C602 : 76 70 32    "vp2"    ror  X7032
C605 : 9B 87    "  "    adda  X0087
C607 : AA AE    "  "    oraa  $AE,x
        ;
C609 : 38    "8"    db  $38
        ;
C60A : A9 73    " s"    adca  $73,x
C60C : C6 58    " X"    ldab  #$58
C60E : F2 46 87    " F "    sbcb  X4687
C611 : F1 78 8C    " x "    cmpb  X788C
C614 : CA E3    "  "    orab  #$E3
C616 : A1 39    " 9"    cmpa  $39,x
C618 : 47    "G"    asra
C619 : C6 1E    "  "    ldab  #$1E
        ;
C61B : 38    "8"    db  $38
        ;
C61C : E7 E0    "  "    stab  $E0,x
C61E : 64 DE    "d "    lsr  $DE,x
        ;
C620 : 83    " "    db  $83
        ;
C621 : F1 0E 4E    "  N"    cmpb  X0E4E
C624 : E6 38    " 8"    ldab  $38,x
C626 : 39    "9"    rts
        ;
C627 : EA 5C    " \"    orab  $5C,x
C629 : 54    "T"    lsrb
C62A : F2 1C 87    "   "    sbcb  X1C87
C62D : F2 F1 18    "   "    sbcb  XF118
        ;
C630        XC630:
C630 : 93    " "    db  $93
        ;
C631 : 53    "S"    comb
        ;
C632 : 4E CC    "N "    db  $4E, $CC
        ;
C634 : 39    "9"    rts
        ;
C635 : 33    "3"    pulb
C636 : EA C4    "  "    orab  $C4,x
C638        XC638:
C638 : 99 19    "  "    adca  X0019
C63A : 33    "3"    pulb
C63B : 27 CE    "' "    beq  LC60B
C63D : 9C 19    "  "    cpx  X0019
C63F : 7A 31 33    "z13"    dec  X3133
        ;
C642 : ED    " "    db  $ED
        ;
C643 : 78 E0 CE    "x  "    asl  XE0CE
C646 : 19    " "    daa
C647 : F1 89 59    "  Y"    cmpb  X8959
C64A : 23 C7    "# "    bls  LC613
C64C : 9C 98    "  "    cpx  X0098
C64E : 7C 72 F0    "|r "    inc  X72F0
C651 : C4 8D    "  "    andb  #$8D
C653 : 23 67    "#g"    bls  LC6BC
C655 : 66 9C    "f "    ror  $9C,x
C657 : 99 E3    "  "    adca  X00E3
        ;
C659 : 13 D3 4E    "  N"    db  $13, $D3, $4E
        ;
C65C : 0E    " "    cli
        ;
C65D        LC65D:
C65D : E3 E3    "  "    db  $E3, $E3
        ;
C65F : 90 17    "  "    suba  X0017
C661 : 63 73    "cs"    com  $73,x
C663 : 8E 8A F9    "   "    lds  #$8AF9
C666 : C8 B8    "  "    eorb  #$B8
        ;
C668 : 13    " "    db  $13
        ;
C669 : 53    "S"    comb
C66A : B9 38 EE    " 8 "    adca  X38EE
C66D : A4 38    " 8"    anda  $38,x
C66F : 27 87    "' "    beq  LC5F8
        ;
C671 : 9D    " "    db  $9D
        ;
C672 : 8E C1 73    "  s"    lds  #$C173
C675 : 46    "F"    rora
C676 : 8E 0F 8E    "   "    lds  #$0F8E
        ;
C679 : 1F    " "    db  $1F
        ;
C67A : 31    "1"    ins
C67B : CE 1B 31    "  1"    ldx  #$1B31
C67E : AF 8C    "  "    sts  $8C,x
C680 : A6 4F    " O"    ldaa  $4F,x
C682        LC682:
C682 : 8A 1E    "  "    oraa  #$1E
        ;
C684 : 4E    "N"    db  $4E
        ;
C685 : 8E 73 70    " sp"    lds  #$7370
C688 : 9C 8B    "  "    cpx  X008B
C68A : F1 36 43    " 6C"    cmpb  X3643
C68D : F6 74 E0    " t "    ldab  X74E0
C690 : CE 18 3C    "  <"    ldx  #$183C
C693 : 67 E4    "g "    asr  $E4,x
C695 : F8 03 E3    "   "    eorb  X03E3
C698 : 8B 11    "  "    adda  #$11
C69A : EF 11    "  "    stx  $11,x
C69C : F5 8E 90    "   "    bitb  X8E90
        ;
C69F : CF 05 B3    "   "    db  $CF, $05, $B3
        ;
C6A2 : A7 03    "  "    staa  $03,x
C6A4 : F7 18 19    "   "    stab  X1819
C6A7 : F7 60 3E    " `>"    stab  X603E
C6AA : 43    "C"    coma
C6AB : E9 39    " 9"    adcb  $39,x
        ;
C6AD : 18    " "    db  $18
        ;
C6AE : EF 42    " B"    stx  $42,x
        ;
C6B0 : EC    " "    db  $EC
        ;
C6B1 : 33    "3"    pulb
C6B2 : C1 AE    "  "    cmpb  #$AE
C6B4 : 69 70    "ip"    rol  $70,x
C6B6 : 4F    "O"    clra
C6B7 : A1 73    " s"    cmpa  $73,x
C6B9 : 07    " "    tpa
C6BA : D6 33    " 3"    ldab  X0033
C6BC        LC6BC:
C6BC : 54    "T"    lsrb
C6BD        LC6BD:
C6BD : DE 03    "  "    ldx  X0003
C6BF : F5 1E 18    "   "    bitb  X1E18
C6C2 : 6F 0E    "o "    clr  $0E,x
        ;
C6C4 : 3C    "<"    db  $3C
        ;
C6C5 : DB 90    "  "    addb  X0090
C6C7 : F9 E0 91    "   "    adcb  XE091
        ;
C6CA : E3    " "    db  $E3
        ;
C6CB : 86 FC    "  "    ldaa  #$FC
C6CD : 88 9A    "  "    eora  #$9A
C6CF : 27 4E    "'N"    beq  LC71F
C6D1 : 7C 72 E4    "|r "    inc  X72E4
C6D4 : E8 C4    "  "    eorb  $C4,x
C6D6 : 74 23 D3    "t# "    lsr  X23D3
C6D9 : 27 E2    "' "    beq  LC6BD
C6DB : A9 78    " x"    adca  $78,x
C6DD : E2 CC    "  "    sbcb  $CC,x
C6DF : 11    " "    cba
C6E0 : 6F 8E    "o "    clr  $8E,x
C6E2 : 9C 1A    "  "    cpx  X001A
C6E4 : 76 62 DE    "vb "    ror  X62DE
C6E7 : C0 DD    "  "    subb  #$DD
C6E9 : 01    " "    nop
C6EA : 5F    "_"    clrb
C6EB : 9C 09    "  "    cpx  X0009
        ;
C6ED : F3    " "    db  $F3
        ;
C6EE : 26 E5    "& "    bne  LC6D5
C6F0 : 89 1D    "  "    adca  #$1D
C6F2 : 27 8E    "' "    beq  LC682
        ;
C6F4 : F3    " "    db  $F3
        ;
C6F5 : 01    " "    nop
C6F6 : 77 4E 54    "wNT"    asr  X4E54
C6F9 : DF 40    " @"    stx  X0040
        ;
C6FB : 1E 1D 3A    "  :"    db  $1E, $1D, $3A
        ;
C6FE : 3E    ">"    wai
C6FF        XC6FF:
C6FF : D8 99    "  "    eorb  X0099
        ;
C701 : 1C    " "    db  $1C
        ;
C702 : 7C E3 E0    "|  "    inc  XE3E0
C705 : BC 03 D3    "   "    cpx  X03D3
C708 : 07    " "    tpa
C709 : CE 9D 18    "   "    ldx  #$9D18
C70C : 7E 62 BC    "~b "    jmp  L62BC
        ;
C70F : 38    "8"    db  $38
        ;
C710 : 6D C4    "m "    tst  $C4,x
C712 : AC A3    "  "    cpx  $A3,x
        ;
C714 : 71    "q"    db  $71
        ;
C715 : 31    "1"    ins
        ;
C716 : CF    " "    db  $CF
        ;
C717 : 89 39    " 9"    adca  #$39
C719 : 07    " "    tpa
        ;
C71A : D3 1F 1C    "   "    db  $D3, $1F, $1C
        ;
C71D : 77 62 F8    "wb "    asr  X62F8
C720 : C4 71    " q"    andb  #$71
        ;
C722 : 71    "q"    db  $71
        ;
C723 : C6 98    "  "    ldab  #$98
        ;
C725 : B3 51 C3    " Q "    db  $B3, $51, $C3
        ;
C728 : C5 79    " y"    bitb  #$79
C72A : 0E    " "    cli
C72B : C6 3B    " ;"    ldab  #$3B
C72D : F0 8D 79    "  y"    subb  X8D79
C730 : 26 CE    "& "    bne  LC700
C732 : 19    " "    daa
C733 : 99 1E    "  "    adca  X001E
        ;
C735 : CC    " "    db  $CC
        ;
C736 : 67 70    "gp"    asr  $70,x
C738 : CE C1 F1    "   "    ldx  #$C1F1
C73B : 60 9E    "` "    neg  $9E,x
C73D : 91 E3    "  "    cmpa  X00E3
C73F : 46    "F"    rora
C740 : C6 8B    "  "    ldab  #$8B
C742 : 73 CC 8C    "s  "    com  XCC8C
C745 : 73 30 2E    "s0."    com  X302E
C748 : E6 33    " 3"    ldab  $33,x
C74A : 39    "9"    rts
        ;
C74B : E6 64    " d"    ldab  $64,x
C74D : BC 98 73    "  s"    cpx  X9873
C750 : E2 9C    "  "    sbcb  $9C,x
        ;
C752 : 83 F3    "  "    db  $83, $F3
        ;
C754 : 81 7D    " }"    cmpa  #$7D
C756 : 46    "F"    rora
C757 : 2E 1B    ". "    bgt  LC774
        ;
C759 : 38    "8"    db  $38
        ;
C75A : 17    " "    tba
C75B : E7 8C    "  "    stab  $8C,x
C75D : 98 1F    "  "    eora  X001F
C75F : D4 4F    " O"    andb  X004F
C761 : 8C 73 72    " sr"    cpx  #$7372
        ;
C764 : DC    " "    db  $DC
        ;
C765 : C4 5C    " \"    andb  #$5C
C767 : 8C 77 72    " wr"    cpx  #$7772
C76A : 9C C1    "  "    cpx  X00C1
C76C : 79 31 D7    "y1 "    rol  X31D7
C76F : C4 3C    " <"    andb  #$3C
C771 : 07    " "    tpa
        ;
C772 : E3 C3    "  "    db  $E3, $C3
        ;
C774        LC774:
C774 : D8 0E    "  "    eorb  X000E
C776 : A6 3B    " ;"    ldaa  $3B,x
C778 : 98 8B    "  "    eora  X008B
C77A : 79 0E CE    "y  "    rol  X0ECE
        ;
C77D : 1E    " "    db  $1E
        ;
C77E : 31    "1"    ins
        ;
C77F        LC77F:
C77F : 1F CC    "  "    db  $1F, $CC
        ;
C781 : 33    "3"    pulb
C782 : 23 FB    "# "    bls  LC77F
C784 : C0 BC    "  "    subb  #$BC
        ;
C786 : 18    " "    db  $18
        ;
C787 : 67 E2    "g "    asr  $E2,x
C789 : 9C 83    "  "    cpx  X0083
C78B : B9 38 CD    " 8 "    adca  X38CD
C78E : C4 7C    " |"    andb  #$7C
C790 : 06    " "    tap
        ;
C791 : E3 C3    "  "    db  $E3, $C3
        ;
C793 : 74 0E 4E    "t N"    lsr  X0E4E
C796 : 3B    ";"    rti
        ;
C797 : 98 07    "  "    eora  X0007
        ;
C799 : F3    " "    db  $F3
        ;
C79A : 19    " "    daa
C79B : 9C 6E    " n"    cpx  X006E
C79D : 60 1F    "` "    neg  $1F,x
C79F : 8C 67 62    " gb"    cpx  #$6762
C7A2 : 9E 89    "  "    lds  X0089
        ;
C7A4 : 3C 38 CF    "<8 "    db  $3C, $38, $CF
        ;
C7A7 : C4 B4    "  "    andb  #$B4
C7A9 : 0B    " "    sev
C7AA : F9 60 3C    " `<"    adcb  X603C
        ;
C7AD : 13 F3    "  "    db  $13, $F3
        ;
C7AF : 0E    " "    cli
C7B0 : E4 C9    "  "    andb  $C9,x
C7B2 : F8 26 E6    " & "    eorb  X26E6
C7B5 : 19    " "    daa
C7B6 : 98 0F    "  "    eora  X000F
C7B8 : E6 33    " 3"    ldab  $33,x
C7BA : E2 DC    "  "    sbcb  $DC,x
C7BC : C0 3C    " <"    subb  #$3C
C7BE : 19    " "    daa
C7BF : 4F    "O"    clra
C7C0 : C6 A6    "  "    ldab  #$A6
        ;
C7C2 : 83 75 62    " ub"    db  $83, $75, $62
        ;
C7C5 : BE 11 BB    "   "    lds  X11BB
C7C8 : 06    " "    tap
C7C9 : E6 83    "  "    ldab  $83,x
C7CB : F1 CC 58    "  X"    cmpb  XCC58
C7CE : 37    "7"    pshb
C7CF : D0 8B    "  "    subb  X008B
C7D1 : F1 46 CE    " F "    cmpb  X46CE
C7D4 : 59    "Y"    rolb
C7D5 : 11    " "    cba
C7D6 : 2F C6    "/ "    ble  LC79E
C7D8 : 37    "7"    pshb
C7D9 : 11    " "    cba
C7DA : 5F    "_"    clrb
        ;
C7DB : 42    "B"    db  $42
        ;
C7DC : BE 98 3C    "  <"    lds  X983C
C7DF : 32    "2"    pula
C7E0        XC7E0:
C7E0 : 3E    ">"    wai
C7E1 : 0E    " "    cli
C7E2 : F6 62 7C    " b|"    ldab  X627C
C7E5 : 91 79    " y"    cmpa  X0079
C7E7 : 2A D4    "* "    bpl  LC7BD
        ;
C7E9 : 83 F3    "  "    db  $83, $F3
        ;
C7EB : 07    " "    tpa
C7EC : C6 97    "  "    ldab  #$97
C7EE : C8 27    " '"    eorb  #$27
C7F0 : A6 1F    "  "    ldaa  $1F,x
C7F2 : 8C 2F 22    " /""    cpx  #$2F22
C7F5 : 5F    "_"    clrb
C7F6 : 8C 1F 38    "  8"    cpx  #$1F38
        ;
C7F9 : 1F    " "    db  $1F
        ;
C7FA : 46    "F"    rora
C7FB : 3E    ">"    wai
        ;
C7FC : 38    "8"    db  $38
        ;
C7FD : 3F    "?"    swi
C7FE : 70 BC C8    "p  "    neg  XBCC8
        ;
C801 : 38    "8"    db  $38
        ;
C802 : 31    "1"    ins
C803 : 7F 60 7C    " `|"    clr  X607C
C806 : 98 BC    "  "    eora  X00BC
        ;
C808 : 38    "8"    db  $38
        ;
C809 : 7E 70 BC    "~p "    jmp  L70BC
        ;
C80C : 18    " "    db  $18
        ;
C80D : F9 62 FC    " b "    adcb  X62FC
C810 : 90 F1    "  "    suba  X00F1
C812 : 68 E8    "h "    asl  $E8,x
C814 : C5 E8    "  "    bitb  #$E8
C816 : A1 E3    "  "    cmpa  $E3,x
C818 : E1 F0    "  "    cmpb  $F0,x
C81A : 07    " "    tpa
C81B : A7 87    "  "    staa  $87,x
C81D : C6 8B    "  "    ldab  #$8B
C81F : A1 0F    "  "    cmpa  $0F,x
C821 : 8E 1F 1C    "   "    lds  #$1F1C
C824 : 2F 12    "/ "    ble  LC838
C826 : 3F    "?"    swi
C827 : 98 3D    " ="    eora  X003D
C829 : 32    "2"    pula
C82A : 3E    ">"    wai
C82B : 8C 7E 60    " ~`"    cpx  #$7E60
C82E : FE C0 79    "  y"    ldx  XC079
C831        LC831:
C831 : 22 FE    "" "    bhi  LC831
C833 : 81 73    " s"    cmpa  #$73
C835 : 07    " "    tpa
C836 : CE 0B D9    "   "    ldx  #$0BD9
C839 : 07    " "    tpa
        ;
C83A : F3    " "    db  $F3
        ;
C83B : 07    " "    tpa
C83C : C6 87    "  "    ldab  #$87
C83E : E4 07    "  "    andb  $07,x
C840 : A7 0F    "  "    staa  $0F,x
C842 : 8C 1F 23    "  #"    cpx  #$1F23
        ;
C845 : 1F    " "    db  $1F
        ;
C846 : 8C 3F 18    " ? "    cpx  #$3F18
C849 : 3F    "?"    swi
C84A : 24 3F    "$?"    bcc  LC88B
C84C : 98 3E    " >"    eora  X003E
C84E : 30    "0"    tsx
C84F : 3E    ">"    wai
C850 : 8A FE    "  "    oraa  #$FE
C852 : 60 FC    "` "    neg  $FC,x
C854 : C0 F9    "  "    subb  #$F9
C856 : 20 FD    "  "    bra  LC855
        ;
C858 : 81 79    " y"    cmpa  #$79
        ;
C85A : 03    " "    db  $03
        ;
C85B : E7 43    " C"    stab  $43,x
C85D : DA 03    "  "    orab  X0003
        ;
C85F : F3    " "    db  $F3
        ;
C860 : 07    " "    tpa
C861 : C6 17    "  "    ldab  #$17
C863 : B1 0F CC    "   "    cmpa  X0FCC
        ;
C866 : 1F 38    " 8"    db  $1F, $38
        ;
C868 : 3F    "?"    swi
C869 : 50    "P"    negb
C86A : 3F    "?"    swi
C86B : 98 3F    " ?"    eora  X003F
C86D : 70 3E 88    "p> "    neg  X3E88
C870 : 3F    "?"    swi
C871 : 0C    " "    clc
C872 : 3F    "?"    swi
        ;
C873 : 18    " "    db  $18
        ;
C874 : 3F    "?"    swi
C875 : 24 3D    "$="    bcc  LC8B4
C877 : 31    "1"    ins
C878 : 7D 60 FC    "}` "    tst  X60FC
C87B : 50    "P"    negb
        ;
C87C : FC    " "    db  $FC
        ;
C87D : 60 F2    "` "    neg  $F2,x
C87F : C0 F9    "  "    subb  #$F9
        ;
C881 : 21    "!"    db  $21
        ;
C882 : 79 31 FA    "y1 "    rol  X31FA
C885        LC885:
C885 : E0 F8    "  "    subb  $F8,x
        ;
C887 : 18 71    " q"    db  $18, $71
        ;
C889 : 73 78 E8    "sx "    com  X78E8
C88C : F0 38 F2    " 8 "    subb  X38F2
C88F : E2 E4    "  "    sbcb  $E4,x
C891 : C1 F1    "  "    cmpb  #$F1
        ;
C893 : 61    "a"    db  $61
        ;
C894 : F4 C4 F4    "   "    andb  XC4F4
C897 : 81 F3    "  "    cmpa  #$F3
        ;
C899 : C3    " "    db  $C3
        ;
C89A : E8 89    "  "    eorb  $89,x
        ;
C89C : D3 03    "  "    db  $D3, $03
        ;
C89E : A7 87    "  "    staa  $87,x
C8A0 : C9 17    "  "    adcb  #$17
        ;
C8A2 : C7    " "    db  $C7
        ;
C8A3 : 07    " "    tpa
C8A4 : 9C 0F    "  "    cpx  X000F
C8A6 : F1 03 B3    "   "    cmpb  X03B3
C8A9 : 47    "G"    asra
        ;
C8AA : 4E    "N"    db  $4E
        ;
C8AB : 0F    " "    sei
C8AC : 99 27    " '"    adca  X0027
C8AE : 27 0F    "' "    beq  LC8BF
C8B0 : 9C 1F    "  "    cpx  X001F
        ;
C8B2 : 12    " "    db  $12
        ;
C8B3 : 5F    "_"    clrb
        ;
C8B4        LC8B4:
C8B4 : 1C    " "    db  $1C
        ;
C8B5 : 3F    "?"    swi
C8B6 : 30    "0"    tsx
C8B7 : 3F    "?"    swi
C8B8        LC8B8:
C8B8 : E0 0F    "  "    subb  $0F,x
C8BA : 46    "F"    rora
        ;
C8BB : 1F 1C    "  "    db  $1F, $1C
        ;
C8BD : 2F C6    "/ "    ble  LC885
        ;
C8BF        LC8BF:
C8BF : 1E    " "    db  $1E
        ;
C8C0 : 9C 1C    "  "    cpx  X001C
C8C2 : 31    "1"    ins
C8C3 : 3F    "?"    swi
C8C4 : 8C 9E 38    "  8"    cpx  #$9E38
        ;
C8C7 : 3D    "="    db  $3D
        ;
C8C8 : E0 DE    "  "    subb  $DE,x
C8CA : 88 1F    "  "    eora  #$1F
C8CC : 9C 3C    " <"    cpx  X003C
        ;
C8CE : 72    "r"    db  $72
        ;
C8CF : 6E 8C    "n "    jmp  $8C,x            ;INFO: index jump
        ;
C8D1 : 9C 98    "  "    cpx  X0098
C8D3 : 39    "9"    rts
        ;
C8D4 : 72    "r"    db  $72
        ;
C8D5 : 7E C8 B8    "~  "    jmp  LC8B8
        ;
C8D8 : 31    "1"    ins
C8D9 : 73 E4 FC    "s  "    com  XE4FC
C8DC : 40    "@"    nega
C8DD : B9 70 76    " pv"    adca  X7076
C8E0 : E0 FC    "  "    subb  $FC,x
C8E2 : 90 B9    "  "    suba  X00B9
        ;
C8E4 : 38    "8"    db  $38
        ;
C8E5 : 39    "9"    rts
        ;
C8E6 : E4 7C    " |"    andb  $7C,x
C8E8 : 30    "0"    tsx
C8E9 : 3B    ";"    rti
        ;
C8EA : 38    "8"    db  $38
        ;
C8EB : 73 E0 FC    "s  "    com  XE0FC
C8EE : 50    "P"    negb
        ;
C8EF : 1D 38    " 8"    db  $1D, $38
        ;
C8F1 : 33    "3"    pulb
C8F2 : 70 7E F0    "p~ "    neg  X7EF0
        ;
C8F5 : 38    "8"    db  $38
        ;
C8F6 : 78 76 E0    "xv "    asl  X76E0
C8F9 : F9 60 7B    " `{"    adcb  X607B
C8FC : E0 E6    "  "    subb  $E6,x
C8FE : C0 79    " y"    subb  #$79
        ;
C900 : 61    "a"    db  $61
        ;
C901 : 3E    ">"    wai
C902        XC902:
C902 : 30    "0"    tsx
C903        XC903:
C903 : 77 E0 FC    "w  "    asr  XE0FC
C906 : A0 73    " s"    suba  $73,x
C908        XC908:
C908 : 70 E6 C0    "p  "    neg  XE6C0
C90B : F9 61 72    " ar"    adcb  X6172
C90E : E2 E6    "  "    sbcb  $E6,x
C910        XC910:
C910 : C0 F9    "  "    subb  #$F9
C912 : C1 3D    " ="    cmpb  #$3D
C914 : 60 7E    "`~"    neg  $7E,x
C916 : C0 BD    "  "    subb  #$BD
C918 : E0 39    " 9"    subb  $39,x
C91A : 70 77 C0    "pw "    neg  X77C0
        ;
C91D : DD    " "    db  $DD
        ;
C91E : E0 F1    "  "    subb  $F1,x
C920 : E0 CC    "  "    subb  $CC,x
C922 : 81 73    " s"    cmpa  #$73
        ;
C924 : C3    " "    db  $C3
        ;
C925 : F9 C0 BB    "   "    adcb  XC0BB
        ;
C928 : 03    " "    db  $03
        ;
C929 : E7 86    "  "    stab  $86,x
C92B : 7D 60 EE    "}` "    tst  X60EE
C92E : C0 B9    "  "    subb  #$B9
C930 : 91 F3    "  "    cmpa  X00F3
C932 : C0 CC    "  "    subb  #$CC
C934 : 91 33    " 3"    cmpa  X0033
        ;
C936 : C3    " "    db  $C3
        ;
C937 : F6 84 F9    "   "    ldab  X84F9
        ;
C93A : 03    " "    db  $03
        ;
C93B : E7 86    "  "    stab  $86,x
        ;
C93D : FD    " "    db  $FD
        ;
C93E : C0 B9    "  "    subb  #$B9
        ;
C940 : 03    " "    db  $03
        ;
C941 : EE 86    "  "    ldx  $86,x
C943 : F9 01 73    "  s"    adcb  X0173
C946 : 07    " "    tpa
C947 : CE 0D F3    "   "    ldx  #$0DF3
C94A : 81 39    " 9"    cmpa  #$39
        ;
C94C : 03    " "    db  $03
        ;
C94D : E7 85    "  "    stab  $85,x
C94F : F9 C0 EC    "   "    adcb  XC0EC
C952 : 81 73    " s"    cmpa  #$73
        ;
C954 : C3    " "    db  $C3
        ;
C955 : 8E 03 E7    "   "    lds  #$03E7
C958 : 0E    " "    cli
        ;
C959 : 3C    "<"    db  $3C
        ;
C95A : 1B    " "    aba
C95B : CE 07 9E    "   "    ldx  #$079E
C95E : 19    " "    daa
C95F : 78 27 EC    "x' "    asl  X27EC
C962 : 81 B3    "  "    cmpa  #$B3
        ;
C964 : 03    " "    db  $03
        ;
C965 : EE 85    "  "    ldx  $85,x
C967 : D9 03    "  "    adcb  X0003
C969 : 37    "7"    pshb
C96A : 07    " "    tpa
C96B : 9E 19    "  "    lds  X0019
C96D : 3B    ";"    rti
        ;
C96E : 2E 9C    ". "    bgt  LC90C
C970 : 19    " "    daa
C971 : 39    "9"    rts
        ;
C972 : 37    "7"    pshb
        ;
C973 : EC 03    "  "    db  $EC, $03
        ;
C975 : E7 07    "  "    stab  $07,x
        ;
C977 : DC    " "    db  $DC
        ;
C978 : 19    " "    daa
C979 : 73 0E DC    "s  "    com  X0EDC
C97C : 19    " "    daa
C97D : 78 76 78    "xvx"    asl  X7678
C980 : 4C    "L"    inca
C981 : 9C 1B    "  "    cpx  X001B
C983 : 70 27 FC    "p' "    neg  X27FC
C986 : C1 B9    "  "    cmpb  #$B9
        ;
C988 : 03    " "    db  $03
        ;
C989 : E7 83    "  "    stab  $83,x
C98B : 7D E0 CC    "}  "    tst  XE0CC
C98E : 81 9B    "  "    cmpa  #$9B
        ;
C990 : E3    " "    db  $E3
        ;
C991 : E1 C1    "  "    cmpb  $C1,x
C993 : 33    "3"    pulb
C994 : 47    "G"    asra
C995 : CE 0C 3F    "  ?"    ldx  #$0C3F
C998 : 01    " "    nop
C999 : 6F 86    "o "    clr  $86,x
C99B : AF 08    "  "    sts  $08,x
C99D : 3F    "?"    swi
C99E : E0 EE    "  "    subb  $EE,x
C9A0 : C0 DD    "  "    subb  #$DD
C9A2 : 60 1F    "` "    neg  $1F,x
C9A4 : 98 3B    " ;"    eora  X003B
C9A6 : 70 7E D0    "p~ "    neg  X7ED0
C9A9 : 07    " "    tpa
        ;
C9AA : DC 1D 38    "  8"    db  $DC, $1D, $38
        ;
C9AD : 37    "7"    pshb
C9AE : E8 13    "  "    eorb  $13,x
C9B0 : E6 0E    "  "    ldab  $0E,x
C9B2 : BC 13 FC    "   "    cpx  X13FC
        ;
C9B5 : 03    " "    db  $03
        ;
C9B6 : FE 08 FE    "   "    ldx  X08FE
C9B9 : 84 FC    "  "    anda  #$FC
C9BB : 06    " "    tap
C9BC : 7C 23 FA    "|# "    inc  X23FA
        ;
C9BF : 03    " "    db  $03
        ;
C9C0 : F9 03 EE    "   "    adcb  X03EE
C9C3 : 0C    " "    clc
C9C4 : 9E 13    "  "    lds  X0013
C9C6 : F6 81 73    "  s"    ldab  X8173
C9C9 : 07    " "    tpa
C9CA : DE 09    "  "    ldx  X0009
C9CC : F9 42 7B    " B{"    adcb  X427B
        ;
C9CF : 03    " "    db  $03
        ;
C9D0 : EE 09    "  "    ldx  $09,x
C9D2 : F9 E0 DC    "   "    adcb  XE0DC
C9D5 : 81 7B    " {"    cmpa  #$7B
C9D7 : 82 7E    " ~"    sbca  #$7E
C9D9 : 30    "0"    tsx
        ;
C9DA : 7B    "{"    db  $7B
        ;
C9DB : C0 7D    " }"    subb  #$7D
C9DD : 60 3F    "`?"    neg  $3F,x
C9DF : B0 DB C0    "   "    suba  XDBC0
C9E2 : 37    "7"    pshb
C9E3 : C1 3F    " ?"    cmpb  #$3F
C9E5 : 60 5F    "`_"    neg  $5F,x
C9E7 : 50    "P"    negb
        ;
C9E8 : 1F    " "    db  $1F
        ;
C9E9 : C4 1F    "  "    andb  #$1F
C9EB : 9C 1D    "  "    cpx  X001D
C9ED : 70 4F C8    "pO "    neg  X4FC8
C9F0 : 0F    " "    sei
C9F1 : CE 1D 70    "  p"    ldx  #$1D70
C9F4 : 37    "7"    pshb
C9F5 : D8 07    "  "    eorb  X0007
C9F7 : EE 09    "  "    ldx  $09,x
C9F9 : 7C 13 FC    "|  "    inc  X13FC
C9FC : E0 99    "  "    subb  $99,x
        ;
C9FE : 03    " "    db  $03
        ;
C9FF : E7 05    "  "    stab  $05,x
CA01        XCA01:
CA01 : 5D    "]"    tstb
CA02 : 9C 7C    " |"    cpx  X007C
        ;
CA04 : 62    "b"    db  $62
        ;
CA05 : 6E C2    "n "    jmp  $C2,x            ;INFO: index jump
        ;
CA07 : 2E 4E    ".N"    bgt  LCA57
CA09 : 3E    ">"    wai
CA0A : 39    "9"    rts
        ;
CA0B : 3A 62    ":b"    db  $3A, $62
        ;
CA0D : 0F    " "    sei
CA0E : 27 8F    "' "    beq  LC99F
CA10 : 9C 0F    "  "    cpx  X000F
        ;
CA12 : 3A 71    ":q"    db  $3A, $71
        ;
CA14 : E6 CC    "  "    ldab  $CC,x
CA16 : B8 E1 03    "   "    eora  XE103
CA19 : 6E 0E    "n "    jmp  $0E,x            ;INFO: index jump
        ;
CA1B : 9D    " "    db  $9D
        ;
CA1C : 0B    " "    sev
CA1D : 7E 81 3B    "~ ;"    jmp  L813B
        ;
CA20 : 23 6F    "#o"    bls  LCA91
CA22 : 84 5F    " _"    anda  #$5F
CA24 : E0 66    " f"    subb  $66,x
CA26 : E8 9B    "  "    eorb  $9B,x
CA28 : A0 2F    " /"    suba  $2F,x
CA2A : 9C 39    " 9"    cpx  X0039
        ;
CA2C : 71    "q"    db  $71
        ;
CA2D : 6E 50    "nP"    jmp  $50,x            ;INFO: index jump
        ;
CA2F : 1F 3C    " <"    db  $1F, $3C
        ;
CA31 : 33    "3"    pulb
CA32 : F0 5D E0    " ] "    subb  X5DE0
CA35 : 07    " "    tpa
        ;
CA36 : DC    " "    db  $DC
        ;
CA37 : 19    " "    daa
CA38 : F2 07 F1    "   "    sbcb  X07F1
CA3B : C5 89    "  "    bitb  #$89
        ;
CA3D : 13    " "    db  $13
        ;
CA3E : E7 86    "  "    stab  $86,x
CA40 : 9E 38    " 8"    lds  X0038
CA42 : 33    "3"    pulb
CA43 : E2 CD    "  "    sbcb  $CD,x
CA45 : C4 7C    " |"    andb  #$7C
        ;
CA47 : 38    "8"    db  $38
        ;
CA48 : 33    "3"    pulb
CA49 : E2 7C    " |"    sbcb  $7C,x
CA4B : 90 0F    "  "    suba  X000F
CA4D : 67 8E    "g "    asr  $8E,x
CA4F : 9C 1B    "  "    cpx  X001B
CA51 : BC 78 66    " xf"    cpx  X7866
CA54 : E2 E8    "  "    sbcb  $E8,x
CA56 : F0 09 67    "  g"    subb  X0967
CA59 : 0E    " "    cli
CA5A : 3E    ">"    wai
CA5B : 1B    " "    aba
CA5C : BC 03 6F    "  o"    cpx  X036F
CA5F : 0E    " "    cli
CA60 : BC 23 F6    " # "    cpx  X23F6
CA63 : 81 37    " 7"    cmpa  #$37
CA65 : 46    "F"    rora
CA66 : DE 03    "  "    ldx  X0003
CA68 : BF 60 E6    " ` "    sts  X60E6
CA6B : E0 D9    "  "    subb  $D9,x
CA6D : C1 1B    "  "    cmpb  #$1B
CA6F : CE 1C 31    "  1"    ldx  #$1C31
CA72 : 77 60 1F    "w` "    asr  X601F
CA75 : 9A 3B    " ;"    oraa  X003B
CA77        LCA77:
CA77 : 70 BC C8    "p  "    neg  XBCC8
        ;
CA7A : 1F    " "    db  $1F
        ;
CA7B : F0 C7 E0    "   "    subb  XC7E0
CA7E : 2E C4    ". "    bgt  LCA44
CA80 : 0F    " "    sei
CA81 : BC 1B E8    "   "    cpx  X1BE8
CA84 : 0F    " "    sei
CA85 : D4 1E    "  "    andb  X001E
CA87 : B8 47 E4    " G "    eora  X47E4
        ;
CA8A : 1D    " "    db  $1D
        ;
CA8B : A4 3F    " ?"    anda  $3F,x
CA8D : D0 8F    "  "    subb  X008F
CA8F : C8 1D    "  "    eorb  #$1D
CA91        LCA91:
CA91 : 4C    "L"    inca
CA92 : 3F    "?"    swi
CA93 : 30    "0"    tsx
        ;
CA94 : 1F    " "    db  $1F
        ;
CA95 : F4 25 7C    " %|"    andb  X257C
CA98 : A1 E3    "  "    cmpa  $E3,x
CA9A : C1 5C    " \"    cmpb  #$5C
        ;
CA9C : 13    " "    db  $13
        ;
CA9D : 5F    "_"    clrb
CA9E : 84 3F    " ?"    anda  #$3F
CAA0 : E0 1E    "  "    subb  $1E,x
CAA2 : 8C 1F E4    "   "    cpx  #$1FE4
CAA5 : 17    " "    tba
CAA6 : B1 4B BA    " K "    cmpa  X4BBA
CAA9 : 92 E6    "  "    sbca  X00E6
CAAB : 5C    "\"    incb
CAAC : D0 3B    " ;"    subb  X003B
CAAE : 30    "0"    tsx
CAAF : 2F C6    "/ "    ble  LCA77
CAB1 : 5D    "]"    tstb
CAB2 : A8 E7    "  "    eora  $E7,x
CAB4 : C0 3D    " ="    subb  #$3D
CAB6 : C1 97    "  "    cmpb  #$97
CAB8 : 70 1F 8C    "p  "    neg  X1F8C
CABB : 2F D4    "/ "    ble  LCA91
CABD : 1B    " "    aba
CABE : B8 0F D4    "   "    eora  X0FD4
        ;
CAC1 : A3    " "    db  $A3
        ;
CAC2 : 5C    "\"    incb
        ;
CAC3 : 1C    " "    db  $1C
        ;
CAC4 : EE 60    " `"    ldx  $60,x
        ;
CAC6 : 3D    "="    db  $3D
        ;
CAC7 : 11    " "    cba
CAC8 : 5F    "_"    clrb
CAC9 : C4 9B    "  "    andb  #$9B
CACB : 81 5F    " _"    cmpa  #$5F
CACD : E0 9D    "  "    subb  $9D,x
        ;
CACF : 18 1F    "  "    db  $18, $1F
        ;
CAD1 : 9C 1B    "  "    cpx  X001B
        ;
CAD3 : 71    "q"    db  $71
        ;
CAD4 : 0F    " "    sei
        ;
CAD5 : CC    " "    db  $CC
        ;
CAD6 : 17    " "    tba
CAD7        LCAD7:
CAD7 : 78 13 F3    "x  "    asl  X13F3
        ;
CADA : CC    " "    db  $CC
        ;
CADB : 98 07    "  "    eora  X0007
        ;
CADD : B3 B3 38    "  8"    db  $B3, $B3, $38
        ;
CAE0 : 0D    " "    sec
CAE1 : E7 B2    "  "    stab  $B2,x
CAE3 : E4 C4    "  "    andb  $C4,x
CAE5 : E1 39    " 9"    cmpb  $39,x
CAE7 : 39    "9"    rts
        ;
CAE8 : 9C C6    "  "    cpx  X00C6
CAEA        XCAEA:
CAEA : C9 38    " 8"    adcb  #$38
        ;
CAEC : 1D    " "    db  $1D
        ;
CAED : CE 07 73    "  s"    ldx  #$0773
        ;
CAF0 : C7    " "    db  $C7
        ;
CAF1 : 98 0F    "  "    eora  X000F
CAF3 : 76 62 72    "vbr"    ror  X6272
CAF6 : 9C 8C    "  "    cpx  X008C
        ;
CAF8 : 87    " "    db  $87
        ;
CAF9 : 33    "3"    pulb
CAFA : 5D    "]"    tstb
CAFB : 8E E1 70    "  p"    lds  #$E170
        ;
CAFE : 1E    " "    db  $1E
        ;
CAFF : CE 26 93    " & "    ldx  #$2693
        ;
CB02 : D3    " "    db  $D3
        ;
CB03 : 70 1C 87    "p  "    neg  X1C87
        ;
CB06 : E3 71 3C    " q<"    db  $E3, $71, $3C
        ;
CB09 : 8E C5 71    "  q"    lds  #$C571
        ;
CB0C : 38    "8"    db  $38
        ;
CB0D : 39    "9"    rts
        ;
CB0E : 0D    " "    sec
CB0F : 2F C6    "/ "    ble  LCAD7
CB11 : C9 78    " x"    adcb  #$78
CB13 : 32    "2"    pula
        ;
CB14 : 1D    " "    db  $1D
        ;
CB15 : 4F    "O"    clra
        ;
CB16 : E3    " "    db  $E3
        ;
CB17 : 19    " "    daa
        ;
CB18 : 38 4E    "8N"    db  $38, $4E
        ;
CB1A : C6 D3    "  "    ldab  #$D3
        ;
CB1C : 71 3C    "q<"    db  $71, $3C
        ;
CB1E : 9C 83    "  "    cpx  X0083
CB20 : 73 74 8C    "st "    com  X748C
        ;
CB23 : 8F C3    "  "    db  $8F, $C3
        ;
CB25 : C9 38    " 8"    adcb  #$38
CB27 : 99 C3    "  "    adca  X00C3
        ;
CB29 : CD    " "    db  $CD
        ;
CB2A : B8 8C 83    "   "    eora  X8C83
CB2D : 73 38 8E    "s8 "    com  X388E
        ;
CB30 : C7    " "    db  $C7
        ;
CB31 : F1 24 8E    " $ "    cmpb  X248E
CB34 : 63 71    "cq"    com  $71,x
CB36 : 0E    " "    cli
        ;
CB37 : C7    " "    db  $C7
        ;
CB38 : E1 38    " 8"    cmpb  $38,x
CB3A : 8E E3 71    "  q"    lds  #$E371
        ;
CB3D : 3C    "<"    db  $3C
        ;
CB3E : 9C C3    "  "    cpx  X00C3
CB40 : 39    "9"    rts
        ;
CB41 : 1C CF    "  "    db  $1C, $CF
        ;
CB43 : E1 38    " 8"    cmpb  $38,x
        ;
CB45 : 1C C7 E3 38  "   8"    db  $1C, $C7, $E3, $38
        ;
CB49 : 9C CB    "  "    cpx  X00CB
CB4B : D8 8C    "  "    eorb  X008C
        ;
CB4D : C7 71 1C C7  " q  "    db  $C7, $71, $1C, $C7
        ;
CB51 : E1 1C    "  "    cmpb  $1C,x
CB53 : 76 72 31    "vr1"    ror  X7231
CB56 : 17    " "    tba
CB57 : 73 19 9B    "s  "    com  X199B
CB5A : B9 88 8F    "   "    adca  X888F
        ;
CB5D : DC    " "    db  $DC
        ;
CB5E : C4 64    " d"    andb  #$64
CB60 : 5C    "\"    incb
CB61 : C6 71    " q"    ldab  #$71
CB63 : 26 67    "&g"    bne  LCBCC
CB65 : 33    "3"    pulb
CB66 : 17    " "    tba
        ;
CB67        LCB67:
CB67 : B3    " "    db  $B3
        ;
CB68 : 19    " "    daa
        ;
CB69 : 8F E3 38    "  8"    db  $8F, $E3, $38
        ;
CB6C : 8B 9B    "  "    adda  #$9B
CB6E : D8 CC    "  "    eorb  X00CC
        ;
CB70 : 4E CC    "N "    db  $4E, $CC
        ;
CB72 : E4 66    " f"    andb  $66,x
CB74 : 32    "2"    pula
        ;
CB75 : 93    " "    db  $93
        ;
CB76 : 99 CD    "  "    adca  X00CD
CB78 : 70 8E D3    "p  "    neg  X8ED3
        ;
CB7B : CC    " "    db  $CC
        ;
CB7C : 78 96 93    "x  "    asl  X9693
CB7F : 8D E6    "  "    bsr  LCB67
CB81 : 64 27    "d'"    lsr  $27,x
CB83 : 99 71    " q"    adca  X0071
CB85 : 66 36    "f6"    ror  $36,x
CB87 : 8E 39 E3    " 9 "    lds  #$39E3
CB8A : 19    " "    daa
        ;
CB8B : E3    " "    db  $E3
        ;
CB8C : 64 27    "d'"    lsr  $27,x
CB8E : 9B F1    "  "    adda  X00F1
CB90 : 8C 73 9C    " s "    cpx  #$739C
        ;
CB93 : 93 C7 71    "  q"    db  $93, $C7, $71
        ;
CB96 : C6 38    " 8"    ldab  #$38
CB98 : 66 39    "f9"    ror  $39,x
CB9A : 33    "3"    pulb
CB9B : 39    "9"    rts
        ;
CB9C : C6 CE    "  "    ldab  #$CE
CB9E : 70 1C C7    "p  "    neg  X1CC7
CBA1 : B2 B1 8D    "   "    sbca  XB18D
        ;
CBA4 : 71 3C A3 93  "q<  "    db  $71, $3C, $A3, $93
        ;
CBA8 : D9 CC    "  "    adcb  X00CC
CBAA : C4 66    " f"    andb  #$66
CBAC : 32    "2"    pula
        ;
CBAD : B3    " "    db  $B3
        ;
CBAE : 99 5C    " \"    adca  X005C
CBB0 : 86 E3    "  "    ldaa  #$E3
CBB2 : 58    "X"    aslb
CBB3 : 8C E3 78    "  x"    cpx  #$E378
CBB6 : CE E4 78    "  x"    ldx  #$E478
        ;
CBB9 : 1C 87    "  "    db  $1C, $87
        ;
CBBB : 73 78 1C    "sx "    com  X781C
        ;
CBBE : 8F E3 38 3C  "  8<"    db  $8F, $E3, $38, $3C
        ;
CBC2 : 8E C6 C7    "   "    lds  #$C6C7
CBC5 : 54    "T"    lsrb
        ;
CBC6 : 93 C3 71    "  q"    db  $93, $C3, $71
        ;
CBC9 : B8 98 C7    "   "    eora  X98C7
        ;
CBCC        LCBCC:
CBCC : 61 E3 4E 3C  "a N<"    db  $61, $E3, $4E, $3C
        ;
CBD0 : 8E 9C C3    "   "    lds  #$9CC3
CBD3 : C9 39    " 9"    adcb  #$39
CBD5 : 23 E6    "# "    bls  LCBBD
        ;
CBD7 : 4E    "N"    db  $4E
        ;
CBD8 : F0 8D 33    "  3"    subb  X8D33
CBDB : 73 31 8F    "s1 "    com  X318F
CBDE : C9 99    "  "    adcb  #$99
CBE0 : 1B    " "    aba
CBE1 : E6 6C    " l"    ldab  $6C,x
        ;
CBE3 : 3C    "<"    db  $3C
        ;
CBE4 : 70 67 C0    "pg "    neg  X67C0
        ;
CBE7 : 1F 21 CF    " ! "    db  $1F, $21, $CF
        ;
CBEA : 26 E6    "& "    bne  LCBD2
CBEC : D0 1F    "  "    subb  X001F
        ;
CBEE : 83    " "    db  $83
        ;
CBEF : 73 C4 9C    "s  "    com  XC49C
        ;
CBF2 : 93 83    "  "    db  $93, $83
        ;
CBF4 : EE 4C    " L"    ldx  $4C,x
CBF6 : 9C D3    "  "    cpx  X00D3
CBF8 : 60 1E    "` "    neg  $1E,x
CBFA : BC 70 67    " pg"    cpx  X7067
CBFD : 8C 1F 26    "  &"    cpx  #$1F26
CC00 : 7D 30 7C    "}0|"    tst  X307C
        ;
CC03 : 4E    "N"    db  $4E
        ;
CC04 : 8E 33 67    " 3g"    lds  #$3367
        ;
CC07 : CC    " "    db  $CC
        ;
CC08 : B8 71 DC    " q "    eora  X71DC
CC0B : 98 73    " s"    eora  X0073
CC0D : 43    "C"    coma
CC0E : CE C4 A9    "   "    ldx  #$C4A9
CC11 : 33    "3"    pulb
        ;
CC12 : C3    " "    db  $C3
        ;
CC13 : CE 05 3B    "  ;"    ldx  #$053B
        ;
CC16 : C7    " "    db  $C7
        ;
CC17 : 85 67    " g"    bita  #$67
CC19 : 46    "F"    rora
CC1A : 9C 39    " 9"    cpx  X0039
        ;
CC1C : 72 3A    "r:"    db  $72, $3A
        ;
CC1E : 0E    " "    cli
CC1F : 9E 19    "  "    lds  X0019
CC21 : 73 66 E8    "sf "    com  X66E8
CC24 : 69 70    "ip"    rol  $70,x
CC26 : E2 97    "  "    sbcb  $97,x
CC28 : 11    " "    cba
CC29 : 5F    "_"    clrb
CC2A : 84 6F    " o"    anda  #$6F
CC2C : C4 1B    "  "    andb  #$1B
CC2E : 70 73 CC    "ps "    neg  X73CC
CC31 : 99 F1    "  "    adca  X00F1
        ;
CC33 : 42    "B"    db  $42
        ;
CC34 : 17    " "    tba
        ;
CC35 : E3    " "    db  $E3
        ;
CC36 : E0 9E    "  "    subb  $9E,x
CC38 : 81 3F    " ?"    cmpa  #$3F
CC3A : C2 9E    "  "    sbcb  #$9E
CC3C : E4 03    "  "    andb  $03,x
CC3E : 2F 3E    "/>"    ble  LCC7E
CC40 : 31    "1"    ins
CC41 : 3B    ";"    rti
        ;
CC42 : E4 C4    "  "    andb  $C4,x
CC44 : 99 71    " q"    adca  X0071
CC46 : 27 4E    "'N"    beq  LCC96
CC48 : CE 19 71    "  q"    ldx  #$1971
        ;
CC4B : 1E 45    " E"    db  $1E, $45
        ;
CC4D : E7 71    " q"    stab  $71,x
CC4F : 58    "X"    aslb
        ;
CC50 : 1E    " "    db  $1E
        ;
CC51 : 8E D3 61    "  a"    lds  #$D361
CC54 : 32    "2"    pula
CC55 : 67 F2    "g "    asr  $F2,x
CC57 : 31    "1"    ins
CC58        XCC58:
CC58 : B9 81 BD    "   "    adca  X81BD
CC5B : 8C C6 E5    "   "    cpx  #$C6E5
CC5E : 11    " "    cba
CC5F : 73 33 1C    "s3 "    com  X331C
CC62 : 0F    " "    sei
        ;
CC63 : C7    " "    db  $C7
        ;
CC64 : 99 38    " 8"    adca  X0038
CC66 : 17    " "    tba
        ;
CC67 : CF    " "    db  $CF
        ;
CC68 : 4C    "L"    inca
CC69 : 9C 19    "  "    cpx  X0019
        ;
CC6B : C7    " "    db  $C7
CC6C        XCC6C:
CC6C : 4E    "N"    db  $4E
        ;
CC6D : 46    "F"    rora
        ;
CC6E : E3    " "    db  $E3
        ;
CC6F : 78 38 27    "x8'"    asl  X3827
CC72 : E6 99    "  "    ldab  $99,x
        ;
CC74 : 18    " "    db  $18
        ;
CC75 : 1B    " "    aba
CC76 : 73 9C CC    "s  "    com  X9CCC
        ;
CC79 : 71 3C    "q<"    db  $71, $3C
        ;
CC7B : 0C    " "    clc
CC7C : E7 B0    "  "    stab  $B0,x
CC7E        LCC7E:
CC7E : 19    " "    daa
CC7F : 9B D9    "  "    adda  X00D9
        ;
CC81 : CC    " "    db  $CC
        ;
CC82 : 0C    " "    clc
CC83 : 7D 1C 39    "} 9"    tst  X1C39
CC86 : 73 E4 38    "s 8"    com  XE438
CC89 : 0E    " "    cli
CC8A : E7 B8    "  "    stab  $B8,x
CC8C        XCC8C:
CC8C : 9C C5    "  "    cpx  X00C5
CC8E : 66 3C    "f<"    ror  $3C,x
CC90 : 33    "3"    pulb
        ;
CC91 : B3 CD    "  "    db  $B3, $CD
        ;
CC93 : 89 73    " s"    adca  #$73
        ;
CC95 : 62    "b"    db  $62
        ;
CC96        LCC96:
CC96 : 66 99    "f "    ror  $99,x
        ;
CC98 : 4B 93    "K "    db  $4B, $93
        ;
CC9A : 33    "3"    pulb
CC9B : E5 CC    "  "    bitb  $CC,x
CC9D : C9 24    " $"    adcb  #$24
CC9F : 67 43    "gC"    asr  $43,x
        ;
CCA1 : 13 CF    "  "    db  $13, $CF
        ;
CCA3 : 89 89    "  "    adca  #$89
CCA5 : 6D CE    "m "    tst  $CE,x
CCA7 : 9C 31    " 1"    cpx  X0031
CCA9 : 63 CE    "c "    com  $CE,x
        ;
CCAB : 18 CF    "  "    db  $18, $CF
        ;
CCAD : 64 64    "dd"    lsr  $64,x
        ;
CCAF : C7    " "    db  $C7
        ;
CCB0 : 33    "3"    pulb
CCB1 : 33    "3"    pulb
        ;
CCB2 : C3    " "    db  $C3
        ;
CCB3 : C9 CE    "  "    adcb  #$CE
CCB5 : 86 73    " s"    ldaa  #$73
CCB7 : 96 D3    "  "    ldaa  X00D3
CCB9 : B0 CC 6C    "  l"    suba  XCC6C
CCBC : 33    "3"    pulb
CCBD : 6E 24    "n$"    jmp  $24,x            ;INFO: index jump
CCBF : 39    "9"    rts
        ;
CCC0 : 1B    " "    aba
CCC1 : BE 0C 8F    "   "    lds  X0C8F
        ;
CCC4 : 8F    " "    db  $8F
        ;
CCC5 : 16    " "    tab
CCC6 : 67 47    "gG"    asr  $47,x
        ;
CCC8 : 83 B3    "  "    db  $83, $B3
        ;
CCCA        LCCCA:
CCCA : B8 78 66    " xf"    eora  X7866
        ;
CCCD : 1C    " "    db  $1C
        ;
CCCE : 8E 59 9C    " Y "    lds  #$599C
        ;
CCD1 : E3    " "    db  $E3
        ;
CCD2 : 46    "F"    rora
CCD3 : 66 E2    "f "    ror  $E2,x
        ;
CCD5 : 1C    " "    db  $1C
        ;
CCD6 : 8E 93 27    "  '"    lds  #$9327
        ;
CCD9        LCCD9:
CCD9 : C7 E3    "  "    db  $C7, $E3
        ;
CCDB : 32    "2"    pula
CCDC : 99 99    "  "    adca  X0099
CCDE : 99 E6    "  "    adca  X00E6
        ;
CCE0 : 1C    " "    db  $1C
        ;
CCE1 : 9C 63    " c"    cpx  X0063
        ;
CCE3 : 4E    "N"    db  $4E
        ;
CCE4 : CE 64 3D    " d="    ldx  #$643D
        ;
CCE7 : 1C 1E    "  "    db  $1C, $1E
        ;
CCE9 : 0E    " "    cli
CCEA : 27 CF    "' "    beq  LCCBB
        ;
CCEC : 18 E3    "  "    db  $18, $E3
        ;
CCEE : 6C 6C    "ll"    inc  $6C,x
        ;
CCF0 : 38    "8"    db  $38
        ;
CCF1 : 39    "9"    rts
        ;
CCF2 : 9C 85    "  "    cpx  X0085
CCF4 : 27 E3    "' "    beq  LCCD9
        ;
CCF6 : C3    " "    db  $C3
        ;
CCF7 : 89 EB    "  "    adca  #$EB
CCF9 : C8 71    " q"    eorb  #$71
CCFB : C6 E9    "  "    ldab  #$E9
CCFD : 6C 3C    "l<"    inc  $3C,x
CCFF : 32    "2"    pula
CD00 : B7 9C 31    "  1"    staa  X9C31
CD03 : 8E C7 89    "   "    lds  #$C789
CD06 : E9 64    " d"    adcb  $64,x
CD08 : 66 78    "fx"    ror  $78,x
        ;
CD0A : 71 83    "q "    db  $71, $83
        ;
CD0C : 9C 8C    "  "    cpx  X008C
        ;
CD0E : 1D CF    "  "    db  $1D, $CF
        ;
CD10 : 64 C7    "d "    lsr  $C7,x
CD12 : 99 99    "  "    adca  X0099
        ;
CD14 : 38    "8"    db  $38
        ;
CD15 : E6 64    " d"    ldab  $64,x
CD17 : 27 17    "' "    beq  LCD30
        ;
CD19 : 87    " "    db  $87
        ;
CD1A : 8B E3    "  "    adda  #$E3
        ;
CD1C : 61 C7    "a "    db  $61, $C7
        ;
CD1E : C9 71    " q"    adcb  #$71
CD20 : 19    " "    daa
CD21 : 4F    "O"    clra
CD22 : 0E    " "    cli
CD23 : E7 8C    "  "    stab  $8C,x
CD25 : 27 A3    "' "    beq  LCCCA
CD27 : A7 A4    "  "    staa  $A4,x
CD29 : F1 9C 71    "  q"    cmpb  X9C71
CD2C : 34    "4"    des
CD2D : 73 8E 19    "s  "    com  X8E19
CD30        LCD30:
CD30 : CB 39    " 9"    addb  #$39
CD32 : E2 39    " 9"    sbcb  $39,x
CD34 : EA 98    "  "    orab  $98,x
        ;
CD36 : E3    " "    db  $E3
        ;
CD37 : 8C 71 CE    " q "    cpx  #$71CE
CD3A : 31    "1"    ins
CD3B : E6 38    " 8"    ldab  $38,x
CD3D : 47    "G"    asra
CD3E : 39    "9"    rts
        ;
CD3F : 4F    "O"    clra
        ;
CD40 : 1C C7    "  "    db  $1C, $C7
        ;
CD42 : 19    " "    daa
CD43 : EB CE    "  "    addb  $CE,x
CD45 : 8C 99 9D    "   "    cpx  #$999D
CD48 : 31    "1"    ins
CD49 : 73 46 4E    "sFN"    com  X464E
        ;
CD4C : C7    " "    db  $C7
        ;
CD4D : C5 38    " 8"    bitb  #$38
CD4F : 39    "9"    rts
        ;
CD50 : 33    "3"    pulb
CD51 : 27 E6    "' "    beq  LCD39
        ;
CD53 : CC CC    "  "    db  $CC, $CC
        ;
CD55 : 19    " "    daa
CD56 : 33    "3"    pulb
CD57 : 63 76    "cv"    com  $76,x
        ;
CD59 : CC    " "    db  $CC
        ;
CD5A : 98 73    " s"    eora  X0073
        ;
CD5C : DC 18    "  "    db  $DC, $18
        ;
CD5E : 33    "3"    pulb
CD5F : E7 CC    "  "    stab  $CC,x
        ;
CD61 : 38    "8"    db  $38
        ;
CD62 : 47    "G"    asra
        ;
CD63 : 87    " "    db  $87
        ;
CD64 : 33    "3"    pulb
CD65 : E6 9C    "  "    ldab  $9C,x
CD67 : 73 C6 38    "s 8"    com  XC638
        ;
CD6A : E3    " "    db  $E3
        ;
CD6B : 98 63    " c"    eora  X0063
CD6D : 8E 63 8E    " c "    lds  #$638E
        ;
CD70 : E3    " "    db  $E3
        ;
CD71 : 98 33    " 3"    eora  X0033
CD73 : E6 78    " x"    ldab  $78,x
CD75 : 9C 34    " 4"    cpx  X0034
CD77 : BA 51 C6    " Q "    oraa  X51C6
CD7A : 39    "9"    rts
        ;
CD7B : 9C C7    "  "    cpx  X00C7
CD7D : 34    "4"    des
CD7E : 99 71    " q"    adca  X0071
CD80 : 63 C7    "c "    com  $C7,x
CD82 : C8 DD    "  "    eorb  #$DD
CD84 : 08    " "    inx
CD85 : 77 F0 19    "w  "    asr  XF019
        ;
CD88 : 71    "q"    db  $71
        ;
CD89 : E2 87    "  "    sbcb  $87,x
CD8B : C9 D9    "  "    adcb  #$D9
CD8D : 98 E6    "  "    eora  X00E6
CD8F : C4 0F    "  "    andb  #$0F
CD91 : 5C    "\"    incb
        ;
CD92 : FC    " "    db  $FC
        ;
CD93 : 20 79    " y"    bra  LCE0E
        ;
CD95 : 13    " "    db  $13
        ;
CD96 : 9F 68    " h"    sts  X0068
CD98 : FA C0 C4    "   "    orab  XC0C4
        ;
CD9B : 1D    " "    db  $1D
        ;
CD9C : 36    "6"    psha
CD9D : 66 F1    "f "    ror  $F1,x
CD9F : 19    " "    daa
CDA0 : F2 C5 C9    "   "    sbcb  XC5C9
CDA3 : 39    "9"    rts
        ;
CDA4 : 64 CE    "d "    lsr  $CE,x
CDA6 : 90 37    " 7"    suba  X0037
CDA8 : E2 CB    "  "    sbcb  $CB,x
CDAA : E0 9D    "  "    subb  $9D,x
        ;
CDAC : 18    " "    db  $18
        ;
CDAD : BE C0 0F    "   "    lds  XC00F
CDB0 : F4 1A 78    "  x"    andb  X1A78
CDB3 : 2F CC    "/ "    ble  LCD81
CDB5 : 33    "3"    pulb
CDB6 : F0 05 DE    "   "    subb  X05DE
CDB9 : 81 73    " s"    cmpa  #$73
CDBB : 46    "F"    rora
CDBC : 8E A3 9B    "   "    lds  #$A39B
        ;
CDBF : 71    "q"    db  $71
        ;
CDC0 : 33    "3"    pulb
CDC1 : 78 E6 C8    "x  "    asl  XE6C8
        ;
CDC4 : 61    "a"    db  $61
        ;
CDC5 : 7E 84 E7    "~  "    jmp  L84E7
        ;
CDC8 : C0 3B    " ;"    subb  #$3B
CDCA : 23 4E    "#N"    bls  LCE1A
        ;
CDCC : DC 13    "  "    db  $DC, $13
        ;
CDCE : 9B 0B    "  "    adda  X000B
CDD0 : 67 CE    "g "    asr  $CE,x
CDD2 : 9C C1    "  "    cpx  X00C1
CDD4 : 67 38    "g8"    asr  $38,x
CDD6 : 19    " "    daa
CDD7 : BE 38 7C    " 8|"    lds  X387C
CDDA : A8 17    "  "    eora  $17,x
CDDC : F4 38 78    " 8x"    andb  X3878
CDDF : 33    "3"    pulb
CDE0 : C9 89    "  "    adcb  #$89
CDE2 : 37    "7"    pshb
CDE3 : E2 CC    "  "    sbcb  $CC,x
CDE5 : 78 E2 F8    "x  "    asl  XE2F8
        ;
CDE8 : 21    "!"    db  $21
        ;
CDE9 : 6E C2    "n "    jmp  $C2,x            ;INFO: index jump
        ;
CDEB : E5 F0    "  "    bitb  $F0,x
CDED : C5 31    " 1"    bitb  #$31
        ;
CDEF : A3    " "    db  $A3
        ;
CDF0 : CE C4 9B    "   "    ldx  #$C49B
CDF3 : F0 46 E6    " F "    subb  X46E6
CDF6 : 81 2F    " /"    cmpa  #$2F
CDF8 : E2 0B    "  "    sbcb  $0B,x
CDFA : F2 C6 78    "  x"    sbcb  XC678
CDFD : 23 4E    "#N"    bls  LCE4D
CDFF : C2 2F    " /"    sbcb  #$2F
CE01 : F0 45 F3    " E "    subb  X45F3
        ;
CE04 : 42 5E    "B^"    db  $42, $5E
        ;
CE06 : 98 4F    " O"    eora  X004F
CE08 : F0 45 F1    " E "    subb  X45F1
CE0B : 46    "F"    rora
CE0C : 2E 74    ".t"    bgt  LCE82
CE0E        LCE0E:
CE0E : 66 F8    "f "    ror  $F8,x
CE10 : E2 71    " q"    sbcb  $71,x
        ;
CE12 : 62    "b"    db  $62
        ;
CE13 : 6E 88    "n "    jmp  $88,x            ;INFO: index jump
        ;
CE15 : 1B    " "    aba
CE16 : F1 85 E7    "   "    cmpb  X85E7
CE19 : 84 9F    "  "    anda  #$9F
CE1B : 88 1F    "  "    eora  #$1F
CE1D : F0 85 F3    "   "    subb  X85F3
CE20 : 46    "F"    rora
CE21 : 2E E2    ". "    bgt  LCE05
        ;
CE23 : A3    " "    db  $A3
        ;
CE24 : F0 C1 73    "  s"    subb  XC173
        ;
CE27 : 62 4E    "bN"    db  $62, $4E
        ;
CE29 : C6 E7    "  "    ldab  #$E7
CE2B : E0 13    "  "    subb  $13,x
CE2D : DB 0C    "  "    addb  X000C
CE2F : 3E    ">"    wai
CE30 : 19    " "    daa
        ;
CE31 : CF    " "    db  $CF
        ;
CE32 : C0 17    "  "    subb  #$17
CE34 : 9E 1C    "  "    lds  X001C
CE36 : 7C 31 2E    "|1."    inc  X312E
        ;
CE39 : 87    " "    db  $87
        ;
CE3A : 0F    " "    sei
CE3B : 9C 99    "  "    cpx  X0099
CE3D : 78 36 4E    "x6N"    asl  X364E
        ;
CE40 : 4E 3C 71    "N<q"    db  $4E, $3C, $71
        ;
CE43 : E6 CC    "  "    ldab  $CC,x
        ;
CE45 : 38 E3    "8 "    db  $38, $E3
        ;
CE47 : E1 E0    "  "    cmpb  $E0,x
CE49 : 8C 33 27    " 3'"    cpx  #$3327
CE4C : F1 89 79    "  y"    cmpb  X8979
        ;
CE4F : 3A    ":"    db  $3A
        ;
CE50 : F8 C4 F8    "   "    eorb  XC4F8
        ;
CE53 : 41    "A"    db  $41
        ;
CE54 : 3F    "?"    swi
CE55 : A1 67    " g"    cmpa  $67,x
CE57 : 0E    " "    cli
CE58 : 3E    ">"    wai
        ;
CE59 : 71    "q"    db  $71
        ;
CE5A : 76 D0 3B    "v ;"    ror  XD03B
CE5D : D0 0F    "  "    subb  X000F
CE5F : E2 C6    "  "    sbcb  $C6,x
CE61 : 8D 07    "  "    bsr  LCE6A
CE63 : 67 8E    "g "    asr  $8E,x
        ;
CE65 : 1E    " "    db  $1E
        ;
CE66 : 9C 33    " 3"    cpx  X0033
        ;
CE68 : E3    " "    db  $E3
        ;
CE69 : C4 0F    "  "    andb  #$0F
CE6B : 23 6F    "#o"    bls  LCEDC
CE6D : C4 0B    "  "    andb  #$0B
CE6F : 3B    ";"    rti
        ;
CE70 : 26 3F    "&?"    bne  LCEB1
        ;
CE72 : 04    " "    db  $04
        ;
CE73 : 5F    "_"    clrb
CE74 : 58    "X"    aslb
CE75 : 3E    ">"    wai
CE76 : E8 66    " f"    eorb  $66,x
CE78 : 70 33 76    "p3v"    neg  X3376
CE7B : A2 9C    "  "    sbca  $9C,x
CE7D : B8 71 E2    " q "    eora  X71E2
CE80 : 8E B1 19    "   "    lds  #$B119
CE83        LCE83:
CE83 : CE E4 E4    "   "    ldx  #$E4E4
CE86 : 33    "3"    pulb
        ;
CE87 : E3    " "    db  $E3
        ;
CE88 : C4 1C    "  "    andb  #$1C
CE8A : 33    "3"    pulb
        ;
CE8B : E3    " "    db  $E3
        ;
CE8C : E4 07    "  "    andb  $07,x
        ;
CE8E : C7    " "    db  $C7
        ;
CE8F : C5 78    " x"    bitb  #$78
        ;
CE91 : 83    " "    db  $83
        ;
CE92 : 27 73    "'s"    beq  LCF07
CE94 : 66 C4    "f "    ror  $C4,x
CE96 : C5 7C    " |"    bitb  #$7C
CE98 : 86 67    " g"    ldaa  #$67
CE9A : A2 DB    "  "    sbca  $DB,x
CE9C : 90 1F    "  "    suba  X001F
CE9E : BC 31 E2    " 1 "    cpx  X31E2
        ;
CEA1 : CD    " "    db  $CD
        ;
CEA2 : F8 64 CC    " d "    eorb  X64CC
CEA5 : 0E    " "    cli
CEA6 : 73 70 F6    "sp "    com  X70F6
CEA9 : C4 9C    "  "    andb  #$9C
CEAB : 19    " "    daa
CEAC : 73 E2 CC    "s  "    com  XE2CC
CEAF : C4 37    " 7"    andb  #$37
CEB1        LCEB1:
CEB1 : 33    "3"    pulb
CEB2        LCEB2:
CEB2 : B9 C8 C9    "   "    adca  XC8C9
        ;
CEB5 : 38    "8"    db  $38
        ;
CEB6 : 27 E7    "' "    beq  LCE9F
CEB8 : E0 9C    "  "    subb  $9C,x
CEBA : 99 C3    "  "    adca  X00C3
CEBC : F0 E4 3C    "  <"    subb  XE43C
CEBF : 11    " "    cba
CEC0 : 7E E0 0F    "~  "    jmp  LE00F
        ;
CEC3 : C6 17    "  "    ldab  #$17
CEC5 : F8 09 FE    "   "    eorb  X09FE
CEC8 : 88 3B    " ;"    eora  #$3B
CECA : 30    "0"    tsx
CECB : 2F E6    "/ "    ble  LCEB3
CECD : 0D    " "    sec
CECE : 5C    "\"    incb
CECF : 27 39    "'9"    beq  LCF0A
CED1 : 8B 3E    " >"    adda  #$3E
CED3 : 19    " "    daa
CED4 : E7 70    " p"    stab  $70,x
        ;
CED6 : 38    "8"    db  $38
        ;
CED7 : 9B CB    "  "    adda  X00CB
CED9 : B8 38 74    " 8t"    eora  X3874
CEDC        LCEDC:
CEDC : 66 EC    "f "    ror  $EC,x
CEDE : C8 B8    "  "    eorb  #$B8
CEE0 : 89 79    " y"    adca  #$79
CEE2 : 26 CE    "& "    bne  LCEB2
CEE4 : 31    "1"    ins
        ;
CEE5 : 1D 87    "  "    db  $1D, $87
        ;
CEE7 : 73 1D CC    "s  "    com  X1DCC
CEEA : E5 B8    "  "    bitb  $B8,x
        ;
CEEC : 13 F3    "  "    db  $13, $F3
        ;
CEEE : 30    "0"    tsx
CEEF : 2F CC    "/ "    ble  LCEBD
CEF1 : 99 19    "  "    adca  X0019
        ;
CEF3 : DD    " "    db  $DD
        ;
CEF4 : C8 73    " s"    eorb  #$73
        ;
CEF6 : 62    "b"    db  $62
        ;
CEF7 : 9C CE    "  "    cpx  X00CE
        ;
CEF9 : 51    "Q"    db  $51
        ;
CEFA : 2C 87    ", "    bge  LCE83
CEFC : 33    "3"    pulb
        ;
CEFD : 1D CC 65 3C  "  e<"    db  $1D, $CC, $65, $3C
        ;
CF01 : 8E E3 70    "  p"    lds  #$E370
        ;
CF04 : 1C C7 71 1C  "  q "    db  $1C, $C7, $71, $1C
        ;
CF08 : CE E1 70    "  p"    ldx  #$E170
        ;
CF0B : 1E C3    "  "    db  $1E, $C3
        ;
CF0D        LCF0D:
CF0D : 73 9C CC    "s  "    com  X9CCC
CF10 : 34    "4"    des
CF11 : 9B 35    " 5"    adda  X0035
CF13 : 19    " "    daa
CF14 : 3E    ">"    wai
CF15 : E1 F1    "  "    cmpb  $F1,x
CF17 : 70 E2 C4    "p  "    neg  XE2C4
CF1A : 39    "9"    rts
        ;
CF1B : E3    " "    db  $E3
        ;
CF1C : C4 39    " 9"    andb  #$39
CF1E : 63 C7    "c "    com  $C7,x
CF20 : B1 E2 99    "   "    cmpa  XE299
CF23 : 39    "9"    rts
        ;
CF24 : 66 C6    "f "    ror  $C6,x
CF26 : E9 A8    "  "    adcb  $A8,x
CF28 : 8B A3    "  "    adda  #$A3
CF2A : 33    "3"    pulb
CF2B : 53    "S"    comb
CF2C : 8E E9 61    "  a"    lds  #$E961
CF2F : 36    "6"    psha
CF30        LCF30:
CF30 : FF 9D A3    "   "    stx  X9DA3
CF33 : 78 A9 9C    "x  "    asl  XA99C
        ;
CF36 : A3    " "    db  $A3
        ;
CF37 : 35    "5"    txs
        ;
CF38 : 1C    " "    db  $1C
        ;
CF39 : 17    " "    tba
        ;
CF3A : C7    " "    db  $C7
        ;
CF3B : A5 72    " r"    bita  $72,x
CF3D : AC 0E    "  "    cpx  $0E,x
CF3F : CB B1    "  "    addb  #$B1
CF41 : 99 71    " q"    adca  X0071
        ;
CF43 : 1C    " "    db  $1C
        ;
CF44 : 2B C7    "+ "    bmi  LCF0D
CF46 : F1 98 1A    "   "    cmpb  X981A
CF49 : A7 39    " 9"    staa  $39,x
CF4B : 2E E3    ". "    bgt  LCF30
CF4D : 74 54 C7    "tT "    lsr  X54C7
CF50 : D2 38    " 8"    sbcb  X0038
        ;
CF52 : A3 C7    "  "    db  $A3, $C7
        ;
CF54 : B8 1C D3    "   "    eora  X1CD3
CF57 : A5 3C    " <"    bita  $3C,x
CF59 : C6 AA    "  "    ldab  #$AA
CF5B : B8 9C 72    "  r"    eora  X9C72
CF5E : 4A    "J"    deca
CF5F : 1B    " "    aba
CF60 : 63 6D    "cm"    com  $6D,x
CF62 : 86 A7    "  "    ldaa  #$A7
CF64 : AA 1C    "  "    oraa  $1C,x
CF66 : 2D 4D    "-M"    blt  LCFB5
CF68 : 39    "9"    rts
        ;
CF69 : 33    "3"    pulb
CF6A : 57    "W"    asrb
CF6B : C1 53    " S"    cmpb  #$53
CF6D : BC 8C 1D    "   "    cpx  X8C1D
CF70 : 79 C0 1F    "y  "    rol  XC01F
CF73 : E1 67    " g"    cmpb  $67,x
CF75 : 64 5E    "d^"    lsr  $5E,x
CF77 : B0 33 F2    " 3 "    suba  X33F2
CF7A : 86 8B    "  "    ldaa  #$8B
        ;
CF7C : 7B    "{"    db  $7B
        ;
CF7D : 30    "0"    tsx
CF7E : 7C 31 77    "|1w"    inc  X3177
CF81 : C0 9F    "  "    subb  #$9F
CF83 : A0 E7    "  "    suba  $E7,x
CF85 : C0 3F    " ?"    subb  #$3F
CF87 : A0 9F    "  "    suba  $9F,x
CF89 : C8 67    " g"    eorb  #$67
CF8B : E0 87    "  "    subb  $87,x
CF8D : B2 83 7B    "  {"    sbca  X837B
CF90 : 22 7E    ""~"    bhi  LD010
CF92 : 11    " "    cba
CF93 : 3F    "?"    swi
CF94 : D0 5D    " ]"    subb  X005D
CF96 : D0 07    "  "    subb  X0007
        ;
CF98 : 7B    "{"    db  $7B
        ;
CF99 : 8C DC 66    "  f"    cpx  #$DC66
CF9C : 66 92    "f "    ror  $92,x
CF9E : 33    "3"    pulb
CF9F : B9 98 C9    "   "    adca  X98C9
CFA2 : E4 13    "  "    andb  $13,x
CFA4 : F9 43 FC    " C "    adcb  X43FC
CFA7 : 01    " "    nop
CFA8 : 5F    "_"    clrb
        ;
CFA9 : CC    " "    db  $CC
        ;
CFAA : 70 72 9A    "pr "    neg  X729A
CFAD : C9 EC    "  "    adcb  #$EC
CFAF : 0A    " "    clv
CFB0 : 17    " "    tba
CFB1 : B7 38 BE    " 8 "    staa  X38BE
CFB4 : C4 5D    " ]"    andb  #$5D
CFB6 : 08    " "    inx
CFB7 : 3F    "?"    swi
CFB8 : 4C    "L"    inca
CFB9 : 7E E2 BC    "~  "    jmp  LE2BC
        ;
CFBC : 10    " "    sba
CFBD : 5F    "_"    clrb
CFBE : C8 8F    "  "    eorb  #$8F
        ;
CFC0 : 03    " "    db  $03
        ;
CFC1 : 77 70 BE    "wp "    asr  X70BE
CFC4 : C0 1F    "  "    subb  #$1F
CFC6 : C4 A7    "  "    andb  #$A7
CFC8 : E1 1B    "  "    cmpb  $1B,x
CFCA : 8C 0F 7A    "  z"    cpx  #$0F7A
        ;
CFCD : 13 FC 61    "  a"    db  $13, $FC, $61
        ;
CFD0 : E4 8D    "  "    andb  $8D,x
        ;
CFD2 : B3 83 FC    "   "    db  $B3, $83, $FC
        ;
CFD5 : 40    "@"    nega
CFD6 : 2F 9A    "/ "    ble  LCF72
        ;
CFD8 : 3C    "<"    db  $3C
        ;
CFD9 : E1 EC    "  "    cmpb  $EC,x
CFDB : 30    "0"    tsx
CFDC : 7E C0 37    "~ 7"    jmp  LC037
        ;
CFDF : 81 1F    "  "    cmpa  #$1F
CFE1 : 9C 0F    "  "    cpx  X000F
CFE3 : F2 83 7C    "  |"    sbcb  X837C
CFE6 : 23 F8    "# "    bls  LCFE0
CFE8 : 89 B9    "  "    adca  #$B9
        ;
CFEA : 83    " "    db  $83
        ;
CFEB : BE 20 5F    "  _"    lds  X205F
CFEE : 4C    "L"    inca
CFEF : 7C 70 E6    "|p "    inc  X70E6
CFF2 : 30    "0"    tsx
CFF3 : 5F    "_"    clrb
CFF4 : C0 9F    "  "    subb  #$9F
CFF6 : C0 0F    "  "    subb  #$0F
CFF8 : CE 1B F2    "   "    ldx  #$1BF2
CFFB : 06    " "    tap
CFFC : 7E 31 F8    "~1 "    jmp  L31F8
        ;
CFFF : 82 F3    "  "    sbca  #$F3
        ;
D001 : 41    "A"    db  $41
        ;
D002 : BD C0 2F    "  /"    jsr  LC02F
        ;
D005 : 4E    "N"    db  $4E
        ;
D006 : 9C 71    " q"    cpx  X0071
D008 : 76 98 33    "v 3"    ror  X9833
D00B : F1 E8 C4    "   "    cmpb  XE8C4
D00E : 17    " "    tba
D00F : 07    " "    tpa
        ;
D010        LD010:
D010 : 4E    "N"    db  $4E
        ;
D011 : EE 23    " #"    ldx  $23,x
        ;
D013 : 3A 71 E3    ":q "    db  $3A, $71, $E3
        ;
D016 : 8B 23    " #"    adda  #$23
D018 : 27 7C    "'|"    beq  LD096
        ;
D01A : 13    " "    db  $13
        ;
D01B : 9E 4C    " L"    lds  X004C
D01D : 7C E1 F4    "|  "    inc  XE1F4
D020 : 90 73    " s"    suba  X0073
D022 : E0 9D    "  "    subb  $9D,x
D024 : 09    " "    dex
D025 : 6F 1C    "o "    clr  $1C,x
        ;
D027 : 9D    " "    db  $9D
        ;
D028 : C8 47    " G"    eorb  #$47
D02A : EA E2    "  "    orab  $E2,x
D02C : C4 17    "  "    andb  #$17
D02E : 8E 4F F0    " O "    lds  #$4FF0
D031 : 07    " "    tpa
D032 : 79 33 F8    "y3 "    rol  X33F8
D035 : 89 E3    "  "    adca  #$E3
        ;
D037 : 83    " "    db  $83
        ;
D038 : DE 01    "  "    ldx  X0001
D03A : DF 0C    "  "    stx  X000C
D03C : 7E E0 7C    "~ |"    jmp  LE07C
        ;
D03F : 30    "0"    tsx
        ;
D040 : 1F    " "    db  $1F
        ;
D041 : E8 07    "  "    eorb  $07,x
D043 : 6E 1E    "n "    jmp  $1E,x            ;INFO: index jump
        ;
D045 : 71    "q"    db  $71
        ;
D046 : 76 90 2F    "v /"    ror  X902F
        ;
D049 : CC    " "    db  $CC
        ;
D04A : 1B    " "    aba
        ;
D04B : C3    " "    db  $C3
        ;
D04C : 4F    "O"    clra
        ;
D04D : 1C    " "    db  $1C
        ;
D04E : 0F    " "    sei
D04F : E4 0F    "  "    andb  $0F,x
D051 : F2 66 F0    " f "    sbcb  X66F0
        ;
D054 : 13 E3    "  "    db  $13, $E3
        ;
D056 : 07    " "    tpa
D057 : F9 41 9E    " A "    adcb  X419E
D05A : 78 E6 8A    "x  "    asl  XE68A
D05D : 39    "9"    rts
        ;
D05E : 07    " "    tpa
        ;
D05F : 7B 21    "{!"    db  $7B, $21
        ;
D061 : 7E E0 E4    "~  "    jmp  LE0E4
        ;
D064 : 89 73    " s"    adca  #$73
D066 : 43    "C"    coma
D067 : BE 60 0F    " ` "    lds  X600F
        ;
D06A : 3C    "<"    db  $3C
        ;
D06B : 79 E2 DC    "y  "    rol  XE2DC
D06E : A0 37    " 7"    suba  $37,x
D070 : A2 2F    " /"    sbca  $2F,x
D072 : E4 E2    "  "    andb  $E2,x
D074 : 19    " "    daa
        ;
D075 : 93 C3    "  "    db  $93, $C3
        ;
D077 : D9 A4    "  "    adcb  X00A4
D079 : 47    "G"    asra
D07A : EA C4    "  "    orab  $C4,x
D07C : 17    " "    tba
D07D : 8B 07    "  "    adda  #$07
D07F : F9 89 CC    "   "    adcb  X89CC
D082 : 91 8B    "  "    cmpa  X008B
D084 : 4F    "O"    clra
D085 : 4C    "L"    inca
        ;
D086 : 1E EC    "  "    db  $1E, $EC
        ;
D088 : 1B    " "    aba
D089 : F0 83 27    "  '"    subb  X8327
D08C : 3E    ">"    wai
D08D : D1 3C    " <"    cmpb  X003C
D08F : B0 0F EC    "   "    suba  X0FEC
        ;
D092 : 15    " "    db  $15
        ;
D093 : B9 F1 C4    "   "    adca  XF1C4
D096        LD096:
D096 : C5 61    " a"    bitb  #$61
        ;
D098 : DD    " "    db  $DD
        ;
D099 : 08    " "    inx
D09A : 7F 90 6E    "  n"    clr  X906E
D09D : F4 82 79    "  y"    andb  X8279
D0A0 : 31    "1"    ins
D0A1 : 4F    "O"    clra
D0A2 : 8C 1B F1    "   "    cpx  #$1BF1
D0A5 : C4 33    " 3"    andb  #$33
D0A7 : 1B    " "    aba
D0A8 : 8B E3    "  "    adda  #$E3
D0AA : E4 98    "  "    andb  $98,x
D0AC : 39    "9"    rts
        ;
D0AD : 71    "q"    db  $71
        ;
D0AE : E2 07    "  "    sbcb  $07,x
        ;
D0B0 : 8F    " "    db  $8F
        ;
D0B1 : 8B 79    " y"    adda  #$79
D0B3 : 0C    " "    clc
D0B4 : 7E 22 6E    "~"n"    jmp  L226E
        ;
D0B7 : 7C B1 B8    "|  "    inc  XB1B8
        ;
D0BA        XD0BA:
D0BA : 18    " "    db  $18
        ;
D0BB : 2F C6    "/ "    ble  LD083
D0BD : 0F    " "    sei
D0BE : A9 07    "  "    adca  $07,x
D0C0 : 6F 1C    "o "    clr  $1C,x
        ;
D0C2 : 3C EC    "< "    db  $3C, $EC
        ;
D0C4 : E4 B0    "  "    andb  $B0,x
        ;
D0C6 : 1E    " "    db  $1E
        ;
D0C7 : A1 8B    "  "    cmpa  $8B,x
D0C9 : 77 14 5E    "w ^"    asr  X145E
        ;
D0CC : CC    " "    db  $CC
        ;
D0CD : 27 72    "'r"    beq  LD141
        ;
D0CF : A3    " "    db  $A3
        ;
D0D0 : B8 71 66    " qf"    eora  X7166
D0D3 : C6 E4    "  "    ldab  #$E4
        ;
D0D5 : 3C    "<"    db  $3C
        ;
D0D6 : 19    " "    daa
D0D7 : 73 43 2E    "sC."    com  X432E
D0DA : DE E8    "  "    ldx  X00E8
        ;
D0DC : 1C    " "    db  $1C
        ;
D0DD : 9C A3    "  "    cpx  X00A3
D0DF : F1 E4 E0    "   "    cmpb  XE4E0
D0E2 : 85 17    "  "    bita  #$17
D0E4 : 27 0F    "' "    beq  LD0F5
D0E6 : 79 23 FC    "y# "    rol  X23FC
D0E9 : 30    "0"    tsx
D0EA : BC 78 C3    " x "    cpx  X78C3
        ;
D0ED : C3    " "    db  $C3
        ;
D0EE : E4 5C    " \"    andb  $5C,x
D0F0 : 19    " "    daa
D0F1 : 67 06    "g "    asr  $06,x
D0F3 : 17    " "    tba
D0F4 : 6F 5C    "o\"    clr  $5C,x
        ;
D0F6 : 3C    "<"    db  $3C
        ;
D0F7 : C6 C5    "  "    ldab  #$C5
        ;
D0F9 : 71    "q"    db  $71
        ;
D0FA : 66 70    "fp"    ror  $70,x
D0FC : F1 8D E3    "   "    cmpb  X8DE3
        ;
D0FF : 62    "b"    db  $62
        ;
D100 : BC 18 6F    "  o"    cpx  X186F
D103 : 84 13    "  "    anda  #$13
D105 : 7F E4 4C    "  L"    clr  XE44C
        ;
D108 : CC    " "    db  $CC
        ;
D109 : 8B 79    " y"    adda  #$79
D10B : 46    "F"    rora
        ;
D10C : 71    "q"    db  $71
        ;
D10D : E2 87    "  "    sbcb  $87,x
D10F : 8E 8D DC    "   "    lds  #$8DDC
        ;
D112 : 1C    " "    db  $1C
        ;
D113 : 2E C3    ". "    bgt  LD0D8
D115 : 8B 4F    " O"    adda  #$4F
D117 : 74 2E E2    "t. "    lsr  X2EE2
D11A : 0B    " "    sev
        ;
D11B : 3C    "<"    db  $3C
        ;
D11C : 1B    " "    aba
D11D : DE 78    " x"    ldx  X0078
D11F : E2 78    " x"    sbcb  $78,x
D121        LD121:
D121 : 11    " "    cba
D122 : 3F    "?"    swi
D123 : E4 39    " 9"    andb  $39,x
D125 : 4A    "J"    deca
D126 : 17    " "    tba
D127 : FE C8 5C    "  \"    ldx  XC85C
D12A : 8C 07 F3    "   "    cpx  #$07F3
D12D : 4C    "L"    inca
D12E : B8 78 63    " xc"    eora  X7863
D131 : 66 62    "fb"    ror  $62,x
D133 : DE C8    "  "    ldx  X00C8
D135        LD135:
D135 : 63 C6    "c "    com  $C6,x
D137 : 85 2F    " /"    bita  #$2F
        ;
D139 : 3A    ":"    db  $3A
        ;
D13A : 17    " "    tba
        ;
D13B : 65 55    "eU"    db  $65, $55
        ;
D13D : 56    "V"    rorb
        ;
D13E : 55    "U"    db  $55
        ;
D13F : 53    "S"    comb
        ;
D140 : 3C    "<"    db  $3C
        ;
D141        LD141:
D141 : 8D E6    "  "    bsr  LD129
D143 : B0 3C 2A    " <*"    suba  X3C2A
D146 : A7 63    " c"    staa  $63,x
D148        LD148:
D148 : 5A    "Z"    decb
D149 : 8E CE 91    "   "    lds  #$CE91
D14C : 79 94 4E    "y N"    rol  X944E
D14F : C9 35    " 5"    adcb  #$35
D151 : AA 53    " S"    oraa  $53,x
D153 : EA 94    "  "    orab  $94,x
D155 : A9 4E    " N"    adca  $4E,x
D157 : A6 55    " U"    ldaa  $55,x
D159 : AC 0E    "  "    cpx  $0E,x
        ;
D15B : F3    " "    db  $F3
        ;
D15C : 2A 5A    "*Z"    bpl  LD1B8
        ;
D15E : 55 4E    "UN"    db  $55, $4E
        ;
D160 : C6 AA    "  "    ldab  #$AA
D162 : 19    " "    daa
D163 : 3B    ";"    rti
        ;
D164 : 59    "Y"    rolb
D165 : 2A CE    "* "    bpl  LD135
D167 : 64 39    "d9"    lsr  $39,x
D169 : 33    "3"    pulb
D16A : AB E3    "  "    adda  $E3,x
D16C : 78 98 9A    "x  "    asl  X989A
D16F : 43    "C"    coma
D170 : E7 58    " X"    stab  $58,x
        ;
D172 : 1C B3    "  "    db  $1C, $B3
        ;
D174 : E2 CC    "  "    sbcb  $CC,x
        ;
D176 : 1C    " "    db  $1C
        ;
D177 : AB 62    " b"    adda  $62,x
D179 : 35    "5"    txs
        ;
D17A : 55    "U"    db  $55
        ;
D17B : 8D CB    "  "    bsr  LD148
D17D : 31    "1"    ins
D17E : 35    "5"    txs
        ;
D17F : 55    "U"    db  $55
        ;
D180 : 27 63    "'c"    beq  LD1E5
D182 : 47    "G"    asra
D183 : CE 89 55    "  U"    ldx  #$8955
        ;
D186 : 4B    "K"    db  $4B
        ;
D187 : B9 D2 03    "   "    adca  XD203
D18A : BF A0 DE    "   "    sts  XA0DE
        ;
D18D : 02    " "    db  $02
        ;
D18E : DF 88    "  "    stx  X0088
        ;
D190 : 5E    "^"    db  $5E
        ;
D191 : 23 75    "#u"    bls  LD208
D193        XD193:
D193 : 2E 8C    ". "    bgt  LD121
D195 : 1B    " "    aba
D196 : FB C0 EC    "   "    addb  XC0EC
D199 : 89 DC    "  "    adca  #$DC
D19B : 11    " "    cba
        ;
D19C : F3    " "    db  $F3
        ;
D19D : 46    "F"    rora
        ;
D19E : EC    " "    db  $EC
        ;
D19F : 8A 1E    "  "    oraa  #$1E
D1A1 : F8 A1 3C    "  <"    eorb  XA13C
D1A4 : 33    "3"    pulb
D1A5 : F2 16 EC    "   "    sbcb  X16EC
        ;
D1A8 : 15    " "    db  $15
        ;
D1A9 : 59    "Y"    rolb
D1AA : 53    "S"    comb
        ;
D1AB : 87 FC    "  "    db  $87, $FC
        ;
D1AD : C0 BC    "  "    subb  #$BC
        ;
D1AF : 03    " "    db  $03
        ;
D1B0 : FB 88 EA    "   "    addb  X88EA
        ;
D1B3 : 45 5E 71    "E^q"    db  $45, $5E, $71
        ;
D1B6 : 64 1F    "d "    lsr  $1F,x
D1B8        LD1B8:
D1B8 : 98 37    " 7"    eora  X0037
D1BA : 70 4F E4    "pO "    neg  X4FE4
D1BD : 2E E4    ". "    bgt  LD1A3
D1BF : 2D 03    "- "    blt  LD1C4
D1C1 : FF 40 BE    " @ "    stx  X40BE
D1C4        LD1C4:
D1C4 : 81 7D    " }"    cmpa  #$7D
D1C6 : 22 7B    ""{"    bhi  LD243
D1C8 : 46    "F"    rora
D1C9 : CE 03 FD    "   "    ldx  #$03FD
D1CC        LD1CC:
D1CC : 40    "@"    nega
D1CD : BD 03 7B    "  {"    jsr  L037B
D1D0 : 86 76    " v"    ldaa  #$76
        ;
D1D2 : 45    "E"    db  $45
        ;
D1D3 : CE 19 F0    "   "    ldx  #$19F0
D1D6 : 0F    " "    sei
        ;
D1D7 : CC    " "    db  $CC
        ;
D1D8 : 17    " "    tba
D1D9 : B4 4F C4    " O "    anda  X4FC4
D1DC : 97 68    " h"    staa  X0068
D1DE : 3B    ";"    rti
        ;
D1DF : B0 0F CC    "   "    suba  X0FCC
D1E2 : 1B    " "    aba
D1E3 : F4 23 6A    " #j"    andb  X236A
D1E6 : 0F    " "    sei
D1E7 : DA 15    "  "    orab  X0015
D1E9 : 47    "G"    asra
D1EA : EE A0    "  "    ldx  $A0,x
D1EC : 7C 22 77    "|"w"    inc  X2277
D1EF : A8 5E    " ^"    eora  $5E,x
D1F1 : A8 7B    " {"    eora  $7B,x
D1F3 : C0 3D    " ="    subb  #$3D
D1F5 : A1 4F    " O"    cmpa  $4F,x
D1F7 : E0 0F    "  "    subb  $0F,x
D1F9 : F1 0D EA    "   "    cmpb  X0DEA
        ;
D1FC : 13 3A    " :"    db  $13, $3A
        ;
D1FE : 39    "9"    rts
        ;
D1FF : 87    " "    db  $87
        ;
D200 : F2 51 DA    " Q "    sbcb  X51DA
D203        XD203:
D203 : 43    "C"    coma
D204 : 7A 85 79    "z y"    dec  X8579
D207 : 0E    " "    cli
        ;
D208        LD208:
D208 : DC 03    "  "    db  $DC, $03
        ;
D20A : F9 21 FD    " ! "    adcb  X21FD
D20D : 20 BD    "  "    bra  LD1CC
        ;
D20F : C1 BA    "  "    cmpb  #$BA
D211 : E2 E0    "  "    sbcb  $E0,x
        ;
D213 : 1D    " "    db  $1D
        ;
D214 : 8C 17 F1    "   "    cpx  #$17F1
        ;
D217 : 15    " "    db  $15
        ;
D218 : F6 94 D8    "   "    ldab  X94D8
        ;
D21B : 71    "q"    db  $71
        ;
D21C : E2 0E    "  "    sbcb  $0E,x
D21E : C6 8F    "  "    ldab  #$8F
D220 : 78 83 DE    "x  "    asl  X83DE
D223 : 90 3D    " ="    suba  X003D
D225 : E1 C4    "  "    cmpb  $C4,x
D227 : 0D    " "    sec
D228 : EE 89    "  "    ldx  $89,x
D22A : 78 23 7E    "x#~"    asl  X237E
D22D : 30    "0"    tsx
D22E : AF 70    " p"    sts  $70,x
D230 : 70 13 F3    "p  "    neg  X13F3
D233 : 22 7E    ""~"    bhi  LD2B3
D235 : 88 9F    "  "    eora  #$9F
D237 : 90 1F    "  "    suba  X001F
        ;
D239 : 4E CC    "N "    db  $4E, $CC
        ;
D23B : F0 BC 90    "   "    subb  XBC90
D23E : 37    "7"    pshb
D23F : F0 07 F9    "   "    subb  X07F9
D242 : 82 8B    "  "    sbca  #$8B
D244 : 33    "3"    pulb
D245 : B8 36 E4    " 6 "    eora  X36E4
D248 : 4D    "M"    tsta
D249 : BC 42 BD    " B "    cpx  X42BD
D24C : 60 F2    "` "    neg  $F2,x
D24E : 8C AC 0D    "   "    cpx  #$AC0D
D251 : 79 13 2F    "y /"    rol  X132F
D254 : E1 0F    "  "    cmpb  $0F,x
D256 : 98 7C    " |"    eora  X007C
D258 : 22 73    ""s"    bhi  LD2CD
D25A : 63 9E    "c "    com  $9E,x
D25C : C4 4B    " K"    andb  #$4B
D25E : F8 06 17    "   "    eorb  X0617
D261 : 9F 60    " `"    sts  X0060
        ;
D263 : 5E    "^"    db  $5E
        ;
D264 : D8 23    " #"    eorb  X0023
D266 : F9 18 BE    "   "    adcb  X18BE
D269 : E0 E2    "  "    subb  $E2,x
        ;
D26B : 13 DC    "  "    db  $13, $DC
        ;
D26D : 0B    " "    sev
        ;
D26E        LD26E:
D26E : 7B 04    "{ "    db  $7B, $04
        ;
D270 : 5F    "_"    clrb
D271        LD271:
D271 : C2 17    "  "    sbcb  #$17
D273 : 5C    "\"    incb
D274 : 78 92 DB    "x  "    asl  X92DB
D277 : C2 1D    "  "    sbcb  #$1D
D279 : C1 97    "  "    cmpb  #$97
D27B : F8 84 13    "   "    eorb  X8413
D27E : 4F    "O"    clra
D27F : EA 1A    "  "    orab  $1A,x
D281 : BC 23 7A    " #z"    cpx  X237A
        ;
D284 : 18    " "    db  $18
        ;
D285 : 9F 70    " p"    sts  X0070
D287 : F1 C4 3C    "  <"    cmpb  XC43C
        ;
D28A : 83    " "    db  $83
        ;
D28B : 37    "7"    pshb
D28C : 32    "2"    pula
D28D : 2F E2    "/ "    ble  LD271
D28F : 89 2E    " ."    adca  #$2E
        ;
D291 : 1E CC    "  "    db  $1E, $CC
        ;
D293 : 73 F0 0E    "s  "    com  XF00E
D296 : E6 45    " E"    ldab  $45,x
        ;
D298 : 3C    "<"    db  $3C
        ;
D299 : C9 C5    "  "    adcb  #$C5
        ;
D29B : 83 71    " q"    db  $83, $71
        ;
D29D : 16    " "    tab
D29E : DE C1    "  "    ldx  X00C1
D2A0 : BC 88 8F    "   "    cpx  X888F
D2A3 : B8 7C 30    " |0"    eora  X7C30
        ;
D2A6 : CF    " "    db  $CF
        ;
D2A7 : C0 9B    "  "    subb  #$9B
D2A9 : C8 87    "  "    eorb  #$87
D2AB : F9 88 C9    "   "    adcb  X88C9
D2AE : 07    " "    tpa
        ;
D2AF : E3    " "    db  $E3
        ;
D2B0 : 25 BC    "% "    bcs  LD26E
        ;
D2B2 : 83    " "    db  $83
        ;
D2B3        LD2B3:
D2B3 : 79 98 4F    "y O"    rol  X984F
D2B6 : D8 78    " x"    eorb  X0078
        ;
D2B8 : 62    "b"    db  $62
        ;
D2B9 : 6E C2    "n "    jmp  $C2,x            ;INFO: index jump
        ;
D2BB : 33    "3"    pulb
D2BC : D1 17    "  "    cmpb  X0017
D2BE : F9 84 8B    "   "    adcb  X848B
D2C1 : 07    " "    tpa
D2C2 : E7 25    " %"    stab  $25,x
D2C4 : 78 83 F5    "x  "    asl  X83F5
D2C7 : 30    "0"    tsx
D2C8 : AF 98    "  "    sts  $98,x
D2CA : F8 62 DC    " b "    eorb  X62DC
D2CD        LD2CD:
D2CD : 84 77    " w"    anda  #$77
D2CF : 30    "0"    tsx
D2D0        LD2D0:
D2D0 : 0F    " "    sei
        ;
D2D1 : F3    " "    db  $F3
        ;
D2D2 : 85 89    "  "    bita  #$89
D2D4 : 27 E7    "' "    beq  LD2BD
D2D6 : 25 F8    "% "    bcs  LD2D0
        ;
D2D8 : 13    " "    db  $13
        ;
D2D9        LD2D9:
D2D9 : BD C8 4D    "  M"    jsr  LC84D
D2DC : 0E    " "    cli
D2DD : 3E    ">"    wai
        ;
D2DE : 38    "8"    db  $38
        ;
D2DF : 27 C3    "' "    beq  LD2A4
D2E1 : 9B D8    "  "    adda  X00D8
D2E3 : 85 7D    " }"    bita  #$7D
D2E5        LD2E5:
D2E5 : 70 F0 E4    "p  "    neg  XF0E4
D2E8 : BC 08 7F    "   "    cpx  X087F
D2EB : 30    "0"    tsx
D2EC : 0F    " "    sei
        ;
D2ED : F3    " "    db  $F3
        ;
D2EE : D1 C0    "  "    cmpb  X00C0
D2F0 : 27 E7    "' "    beq  LD2D9
        ;
D2F2 : 45    "E"    db  $45
        ;
D2F3 : F8 C1 B9    "   "    eorb  XC1B9
D2F6 : 30    "0"    tsx
D2F7 : 4F    "O"    clra
        ;
D2F8 : 83    " "    db  $83
        ;
D2F9 : DE D0    "  "    ldx  X00D0
D2FB : 27 E8    "' "    beq  LD2E5
D2FD : 0B    " "    sev
D2FE : AF 8A    "  "    sts  $8A,x
        ;
D300 : 3A    ":"    db  $3A
        ;
D301 : 2E 3C    ".<"    bgt  LD33F
        ;
D303 : 03    " "    db  $03
        ;
D304 : 7F C2 1D    "   "    clr  XC21D
        ;
D307 : 4B    "K"    db  $4B
        ;
D308 : 2B 55    "+U"    bmi  LD35F
D30A : 0F    " "    sei
D30B : 7C 31 BD    "|1 "    inc  X31BD
D30E : 50    "P"    negb
        ;
D30F : 5B 3C 3A    "[<:"    db  $5B, $3C, $3A
        ;
D312 : C5 74    " t"    bitb  #$74
D314 : E1 4C    " L"    cmpb  $4C,x
D316 : 5C    "\"    incb
        ;
D317 : 13 F3 1C FC  "    "    db  $13, $F3, $1C, $FC
        ;
D31B : E0 70    " p"    subb  $70,x
D31D : E1 C6    "  "    cmpb  $C6,x
D31F : B4 A5 6B    "  k"    anda  XA56B
D322 : E2 E4    "  "    sbcb  $E4,x
D324 : 95 E1    "  "    bita  X00E1
D326 : C6 B3    "  "    ldab  #$B3
        ;
D328 : 38    "8"    db  $38
        ;
D329 : 17    " "    tba
D32A : E6 4D    " M"    ldab  $4D,x
D32C : D8 C3    "  "    eorb  X00C3
D32E : E4 C2    "  "    andb  $C2,x
D330 : 9B 71    " q"    adda  X0071
D332 : 26 CE    "& "    bne  LD302
D334 : 89 6D    " m"    adca  #$6D
D336 : 47    "G"    asra
D337 : 26 17    "& "    bne  LD350
D339 : DE 84    "  "    ldx  X0084
D33B : 39    "9"    rts
        ;
D33C : 31    "1"    ins
D33D : 4F    "O"    clra
D33E : C6 0F    "  "    ldab  #$0F
        ;
D340 : 3C    "<"    db  $3C
        ;
D341 : 27 3C    "'<"    beq  LD37F
D343 : 89 79    " y"    adca  #$79
D345 : 31    "1"    ins
D346 : 4F    "O"    clra
D347 : C6 0F    "  "    ldab  #$0F
D349 : 6C 1B    "l "    inc  $1B,x
D34B : F8 06 F6    "   "    eorb  X06F6
D34E : 86 39    " 9"    ldaa  #$39
D350        LD350:
D350 : 8E 37 F0    " 7 "    lds  #$37F0
D353 : 6C C2    "l "    inc  $C2,x
D355 : 1B    " "    aba
D356 : 9C 1B    "  "    cpx  X001B
        ;
D358 : E3    " "    db  $E3
        ;
D359 : 26 7C    "&|"    bne  LD3D7
D35B : 43    "C"    coma
D35C : B7 81 5F    "  _"    staa  X815F
D35F        LD35F:
D35F : 70 DE 88    "p  "    neg  XDE88
D362 : 37    "7"    pshb
D363 : F1 1A BC    "   "    cmpb  X1ABC
D366 : 39    "9"    rts
        ;
D367 : F0 0B DC    "   "    subb  X0BDC
        ;
D36A : 13    " "    db  $13
        ;
D36B : F1 46 5E    " F^"    cmpb  X465E
D36E : E1 4E    " N"    cmpb  $4E,x
D370 : B8 F0 03    "   "    eora  XF003
D373 : E7 85    "  "    stab  $85,x
D375 : BC 11 77    "  w"    cpx  X1177
D378 : A2 27    " '"    sbca  $27,x
D37A : 9C FC    "  "    cpx  X00FC
D37C : A0 73    " s"    suba  $73,x
D37E : 43    "C"    coma
D37F        LD37F:
D37F : FE A0 3D    "  ="    ldx  XA03D
D382 : C8 17    "  "    eorb  #$17
D384 : C5 8B    "  "    bitb  #$8B
D386 : 3B    ";"    rti
        ;
D387 : 38    "8"    db  $38
        ;
D388 : 6E 8C    "n "    jmp  $8C,x            ;INFO: index jump
        ;
D38A : 37    "7"    pshb
D38B : 32    "2"    pula
D38C : 4F    "O"    clra
D38D : F4 44 9D    " D "    andb  X449D
D390 : 0F    " "    sei
        ;
D391 : FC    " "    db  $FC
        ;
D392 : 81 79    " y"    cmpa  #$79
D394        LD394:
D394 : 23 DE    "# "    bls  LD374
D396 : C8 9A    "  "    eorb  #$9A
D398 : AA A9    "  "    oraa  $A9,x
        ;
D39A : 72    "r"    db  $72
        ;
D39B : 8E AA 0F    "   "    lds  #$AA0F
D39E : F8 41 BD    " A "    eorb  X41BD
D3A1 : 90 AF    "  "    suba  X00AF
D3A3 : A8 1E    "  "    eora  $1E,x
D3A5 : A5 5B    " ["    bita  $5B,x
D3A7 : 54    "T"    lsrb
        ;
D3A8 : 5E    "^"    db  $5E
        ;
D3A9 : E8 85    "  "    eorb  $85,x
        ;
D3AB : 93 3D    " ="    db  $93, $3D
        ;
D3AD : F0 0D D9    "   "    subb  X0DD9
        ;
D3B0 : 83    " "    db  $83
        ;
D3B1 : 7A 45 76    "zEv"    dec  X4576
D3B4 : 29 DE    ") "    bvs  LD394
D3B6 : 81 BB    "  "    cmpa  #$BB
D3B8 : 24 B7    "$ "    bcc  LD371
D3BA : C2 BA    "  "    sbcb  #$BA
D3BC : 48    "H"    asla
D3BD        LD3BD:
D3BD : 9F D0    "  "    sts  X00D0
D3BF : 7A 28 AF    "z( "    dec  X28AF
D3C2 : 68 9E    "h "    asl  $9E,x
D3C4 : 44    "D"    lsra
D3C5 : AF B0    "  "    sts  $B0,x
D3C7 : 2B F4    "+ "    bmi  LD3BD
        ;
D3C9 : 1A    " "    db  $1A
        ;
D3CA : AA 47    " G"    oraa  $47,x
D3CC : 11    " "    cba
        ;
D3CD        LD3CD:
D3CD        XD3CD:
D3CD : 6B 55    "kU"    db  $6B, $55
        ;
D3CF : 66 44    "fD"    ror  $44,x
D3D1 : 92 44    " D"    sbca  X0044
D3D3 : 2C 4E    ",N"    bge  LD423
        ;
D3D5 : 55    "U"    db  $55
        ;
D3D6 : AD 6F    " o"    jsr  $6F,x            ;INFO: index jump
D3D8 : AB B5    "  "    adda  $B5,x
D3DA : AD 52    " R"    jsr  $52,x            ;INFO: index jump
D3DC : 89 54    " T"    adca  #$54
        ;
D3DE : 12 51    " Q"    db  $12, $51
        ;
D3E0 : 2A 4D    "*M"    bpl  LD42F
D3E2 : AD B6    "  "    jsr  $B6,x            ;INFO: index jump
D3E4 : BA 5B AB    " [ "    oraa  X5BAB
        ;
D3E7 : 9D    " "    db  $9D
        ;
D3E8 : FA 02 25    "  %"    orab  X0225
D3EB : A6 61    " a"    ldaa  $61,x
        ;
D3ED : 41    "A"    db  $41
        ;
D3EE : 8C E6 FB    "   "    cpx  #$E6FB
D3F1 : 7E 7F B5    "~  "    jmp  L7FB5
        ;
D3F4 : A0 88    "  "    suba  $88,x
D3F6        LD3F6:
D3F6 : 98 85    "  "    eora  X0085
        ;
D3F8 : 14    " "    db  $14
        ;
D3F9 : 24 8A    "$ "    bcc  LD385
D3FB : D5 AE    "  "    bitb  X00AE
D3FD : DF BF    "  "    stx  X00BF
D3FF : D7 D4    "  "    stab  X00D4
D401 : 29 25    ")%"    bvs  LD428
D403 : 92 00    "  "    sbca  X0000
D405 : 4A    "J"    deca
D406 : 50    "P"    negb
D407 : B8 BC BB    "   "    eora  XBCBB
D40A : F7 3D CF    " = "    stab  X3DCF
D40D : 5A    "Z"    decb
D40E : 19    " "    daa
D40F : 85 88    "  "    bita  #$88
D411 : 88 12    "  "    eora  #$12
        ;
D413 : 4E    "N"    db  $4E
        ;
D414 : 26 B7    "& "    bne  LD3CD
D416 : 3B    ";"    rti
        ;
D417 : 77 FE 5A    "w Z"    asr  XFE5A
D41A : 35    "5"    txs
        ;
D41B : 4B    "K"    db  $4B
        ;
D41C : 24 04    "$ "    bcc  LD422
D41E : C5 A8    "  "    bitb  #$A8
D420 : C5 36    " 6"    bitb  #$36
D422        LD422:
D422 : B9 4F CF    " O "    adca  X4FCF
        ;
D425 : B3    " "    db  $B3
        ;
D426 : B6 B1 48    "  H"    ldaa  XB148
D429 : 92 4A    " J"    sbca  X004A
D42B : AA 58    " X"    oraa  $58,x
        ;
D42D : CD    " "    db  $CD
        ;
D42E : 58    "X"    aslb
D42F        LD42F:
D42F : 73 D9 78    "s x"    com  XD978
D432 : 4D    "M"    tsta
D433 : 63 59    "cY"    com  $59,x
D435 : 95 9C    "  "    bita  X009C
D437 : 39    "9"    rts
        ;
D438 : 65    "e"    db  $65
        ;
D439 : 8B 32    " 2"    adda  #$32
D43B : D2 52    " R"    sbcb  X0052
D43D : 2A CA    "* "    bpl  LD409
D43F : A9 D2    "  "    adca  $D2,x
D441 : E9 AE    "  "    adcb  $AE,x
D443 : 5D    "]"    tstb
        ;
D444 : 6B CF 14 45  "k  E"    db  $6B, $CF, $14, $45
        ;
D448 : 92 24    " $"    sbca  X0024
        ;
D44A : 52 52 93    "RR "    db  $52, $52, $93
        ;
D44D : 9E BE    "  "    lds  X00BE
D44F        LD44F:
D44F : 5D    "]"    tstb
D450 : 5F    "_"    clrb
D451 : B6 95 12    "   "    ldaa  X9512
D454 : 49    "I"    rola
D455 : 28 2C    "(,"    bvc  LD483
D457 : 91 2C    " ,"    cmpa  X002C
D459 : CB F5    "  "    addb  #$F5
D45B : 76 AD 5B    "v ["    ror  XAD5B
D45E : 9B 69    " i"    adda  X0069
D460 : 25 3D    "%="    bcs  LD49F
D462 : 20 92    "  "    bra  LD3F6
        ;
D464 : 61 38    "a8"    db  $61, $38
        ;
D466 : 92 65    " e"    sbca  X0065
D468 : F5 FC BF    "   "    bitb  XFCBF
D46B : 6F 8B    "o "    clr  $8B,x
D46D : 08    " "    inx
D46E : 0C    " "    clc
D46F : A2 98    "  "    sbca  $98,x
D471 : 31    "1"    ins
D472 : 92 32    " 2"    sbca  X0032
D474 : DF D7    "  "    stx  X00D7
D476 : FF 7A 53    " zS"    stx  X7A53
D479 : 69 92    "i "    rol  $92,x
        ;
D47B : 04    " "    db  $04
        ;
D47C : 89 04    "  "    adca  #$04
D47E : 43    "C"    coma
D47F : D1 68    " h"    cmpb  X0068
D481 : 3F    "?"    swi
D482 : DF 7F    "  "    stx  X007F
        ;
D484 : B3 DD    "  "    db  $B3, $DD
        ;
D486 : 0C    " "    clc
D487 : 09    " "    dex
D488 : 2A 10    "* "    bpl  LD49A
D48A : 8A AC    "  "    oraa  #$AC
D48C : D2 D9    "  "    sbcb  X00D9
D48E : 7A DB 77    "z w"    dec  XDB77
        ;
D491 : DD    " "    db  $DD
        ;
D492 : AA CA    "  "    oraa  $CA,x
D494 : 40    "@"    nega
D495 : 0C    " "    clc
        ;
D496 : 62    "b"    db  $62
        ;
D497 : 94 4C    " L"    anda  X004C
D499 : 6A 4F    "jO"    dec  $4F,x
D49B : EF B6    "  "    stx  $B6,x
D49D : B7 D6 66    "  f"    staa  XD666
D4A0 : A2 84    "  "    sbca  $84,x
D4A2 : 88 4C    " L"    eora  #$4C
D4A4 : 92 9A    "  "    sbca  X009A
D4A6 : 2E A7    ". "    bgt  LD44F
        ;
D4A8 : 7B    "{"    db  $7B
        ;
D4A9 : AE 5D    " ]"    lds  $5D,x
D4AB        XD4AB:
D4AB : B5 1A C5    "   "    bita  X1AC5
D4AE : 4A    "J"    deca
D4AF : 9A 28    " ("    oraa  X0028
        ;
D4B1 : 4B    "K"    db  $4B
        ;
D4B2 : 35    "5"    txs
        ;
D4B3 : 15    " "    db  $15
        ;
D4B4 : 59    "Y"    rolb
D4B5 : AB 54    " T"    adda  $54,x
D4B7 : AF 96    "  "    sts  $96,x
D4B9 : BA 2D 5B    " -["    oraa  X2D5B
D4BC : EA 51    " Q"    orab  $51,x
D4BE : 99 50    " P"    adca  X0050
D4C0 : 91 24    " $"    cmpa  X0024
D4C2 : 95 51    " Q"    bita  X0051
D4C4 : 53    "S"    comb
D4C5 : 5D    "]"    tstb
D4C6 : 9F EB    "  "    sts  X00EB
D4C8 : 6E AD    "n "    jmp  $AD,x            ;INFO: index jump
        ;
D4CA : CC    " "    db  $CC
        ;
D4CB : 44    "D"    lsra
D4CC : 92 84    "  "    sbca  X0084
D4CE : 4A    "J"    deca
        ;
D4CF : 52    "R"    db  $52
        ;
D4D0 : 31    "1"    ins
D4D1 : A7 B6    "  "    staa  $B6,x
D4D3 : AF 7B    " {"    sts  $7B,x
D4D5 : B5 4D 55    " MU"    bita  X4D55
D4D8 : 49    "I"    rola
D4D9 : 94 44    " D"    anda  X0044
D4DB : 29 45    ")E"    bvs  LD522
D4DD : E5 5F    " _"    bitb  $5F,x
D4DF : 48    "H"    asla
        ;
D4E0 : E3    " "    db  $E3
        ;
D4E1 : D8 48    " H"    eorb  X0048
D4E3 : 8C E3 7E    "  ~"    cpx  #$E37E
        ;
D4E6 : FD    " "    db  $FD
        ;
D4E7 : EF 4B    " K"    stx  $4B,x
D4E9 : 82 00    "  "    sbca  #$00
        ;
D4EB : 04    " "    db  $04
        ;
D4EC : A5 32    " 2"    bita  $32,x
D4EE : CB 2D    " -"    addb  #$2D
D4F0 : BD DF FD    "   "    jsr  LDFFD
D4F3 : 7F 3A 03    " : "    clr  X3A03
D4F6 : 84 04    "  "    anda  #$04
D4F8 : 46    "F"    rora
D4F9 : 4A    "J"    deca
D4FA : C5 53    " S"    bitb  #$53
D4FC        XD4FC:
D4FC : DE CF    "  "    ldx  X00CF
D4FE : 6F FF    "o "    clr  $FF,x
        ;
D500 : 1D    " "    db  $1D
        ;
D501 : A5 20    "  "    bita  $20,x
D503 : 22 00    "" "    bhi  LD505
        ;
D505        LD505:
D505 : 05    " "    db  $05
        ;
D506 : 9A F6    "  "    oraa  X00F6
D508 : EF F5    "  "    stx  $F5,x
D50A : BD 9A 8B    "   "    jsr  L9A8B
D50D : CA 84    "  "    orab  #$84
D50F : 60 00    "` "    neg  $00,x
        ;
D511 : 21    "!"    db  $21
        ;
D512 : 92 B3    "  "    sbca  X00B3
D514 : EF 77    " w"    stx  $77,x
D516 : F7 B9 5E    "  ^"    stab  XB95E
D519 : 23 C9    "# "    bls  LD4E4
D51B : 10    " "    sba
D51C : 10    " "    sba
D51D        LD51D:
D51D : 82 C4    "  "    sbca  #$C4
D51F : 92 BB    "  "    sbca  X00BB
D521 : FB EF 7D    "  }"    addb  XEF7D
D524 : 7D 74 46    "}tF"    tst  X7446
D527 : 44    "D"    lsra
D528 : 84 40    " @"    anda  #$40
D52A : A1 45    " E"    cmpa  $45,x
D52C : F5 DA FE    "   "    bitb  XDAFE
D52F : 67 3B    "g;"    asr  $3B,x
D531 : D7 94    "  "    stab  X0094
D533 : 86 44    " D"    ldaa  #$44
D535 : 44    "D"    lsra
        ;
D536 : 42    "B"    db  $42
        ;
D537 : 49    "I"    rola
        ;
D538 : 4E    "N"    db  $4E
        ;
D539 : F5 E7 CD    "   "    bitb  XE7CD
D53C : EB 35    " 5"    addb  $35,x
        ;
D53E : CD    " "    db  $CD
        ;
D53F : 94 11    "  "    anda  X0011
D541 : 4A    "J"    deca
D542 : A1 49    " I"    cmpa  $49,x
D544 : A5 52    " R"    bita  $52,x
D546 : F5 9D D3    "   "    bitb  X9DD3
D549 : BA 6A 69    " ji"    oraa  X6A69
D54C : AB 2A    " *"    adda  $2A,x
D54E : A5 A4    "  "    bita  $A4,x
D550 : 44    "D"    lsra
D551 : 4D    "M"    tsta
D552 : 0B    " "    sev
        ;
D553 : 4B    "K"    db  $4B
        ;
D554 : 95 1C    "  "    bita  X001C
D556 : F5 AB D8    "   "    bitb  XABD8
D559 : BE 7C 14    " | "    lds  X7C14
D55C : 24 64    "$d"    bcc  LD5C2
        ;
D55E : D3 FD    "  "    db  $D3, $FD
        ;
D560 : 6D D3    "m "    tst  $D3,x
        ;
D562 : 14    " "    db  $14
        ;
D563 : 32    "2"    pula
D564 : 4A    "J"    deca
D565 : BA 18 89    "   "    oraa  X1889
D568 : 98 4A    " J"    eora  X004A
D56A : 2B BF    "+ "    bmi  LD52B
D56C : 3F    "?"    swi
D56D : 6F 66    "of"    clr  $66,x
D56F : B5 AC 94    "   "    bita  XAC94
D572 : 40    "@"    nega
        ;
D573 : 05 83    "  "    db  $05, $83
        ;
D575 : A4 E4    "  "    anda  $E4,x
D577 : E6 F7    "  "    ldab  $F7,x
D579 : D5 7A    " z"    bitb  X007A
        ;
D57B : 1F    " "    db  $1F
        ;
D57C : A7 8A    "  "    staa  $8A,x
D57E : C4 48    " H"    andb  #$48
D580 : 31    "1"    ins
D581 : 4A    "J"    deca
        ;
D582 : 55 93    "U "    db  $55, $93
        ;
D584 : 67 B7    "g "    asr  $B7,x
D586 : AB 4F    " O"    adda  $4F,x
D588 : 5D    "]"    tstb
D589 : 2A 92    "* "    bpl  LD51D
D58B : 49    "I"    rola
D58C : 8A 54    " T"    oraa  #$54
D58E : AA 8E    "  "    oraa  $8E,x
D590 : A9 97    "  "    adca  $97,x
D592 : 2F 2F    "//"    ble  LD5C3
D594 : D5 95    "  "    bitb  X0095
D596 : C9 88    "  "    adcb  #$88
D598 : A9 B4    "  "    adca  $B4,x
D59A : 34    "4"    des
D59B : 59    "Y"    rolb
D59C : 4D    "M"    tsta
D59D : CB B6    "  "    addb  #$B6
D59F : BC 92 11    "   "    cpx  X9211
D5A2 : 97 34    " 4"    staa  X0034
D5A4 : B2 DA A6    "   "    sbca  XDAA6
D5A7 : 6A D7    "j "    dec  $D7,x
        ;
D5A9 : 18 4B CC    " K "    db  $18, $4B, $CC
        ;
D5AC : 22 4B    ""K"    bhi  LD5F9
D5AE : 23 36    "#6"    bls  LD5E6
        ;
D5B0 : CD    " "    db  $CD
        ;
D5B1 : F4 B9 D9    "   "    andb  XB9D9
D5B4 : B4 46 C3    " F "    anda  X46C3
D5B7 : 24 29    "$)"    bcc  LD5E2
D5B9 : C5 92    "  "    bitb  #$92
D5BB : CA 72    " r"    orab  #$72
D5BD        XD5BD:
D5BD : B9 EB B6    "   "    adca  XEBB6
D5C0 : 6E A9    "n "    jmp  $A9,x            ;INFO: index jump
        ;
D5C2        LD5C2:
D5C2 : 91 8A    "  "    cmpa  X008A
        ;
D5C4 : 12 15    "  "    db  $12, $15
        ;
D5C6 : 95 B1    "  "    bita  X00B1
D5C8 : AA AB    "  "    oraa  $AB,x
D5CA : AB 6B    " k"    adda  $6B,x
D5CC : AD 13    "  "    jsr  $13,x            ;INFO: index jump
        ;
D5CE : A3    " "    db  $A3
        ;
D5CF : 7A 05 54    "z T"    dec  X0554
D5D2 : 59    "Y"    rolb
D5D3 : 54    "T"    lsrb
D5D4 : AA A0    "  "    oraa  $A0,x
D5D6 : 66 BB    "f "    ror  $BB,x
D5D8 : DF EB    "  "    stx  X00EB
        ;
D5DA : 1D    " "    db  $1D
        ;
D5DB : 49    "I"    rola
D5DC : 40    "@"    nega
D5DD : 31    "1"    ins
D5DE : 0A    " "    clv
        ;
D5DF        XD5DF:
D5DF : 13    " "    db  $13
        ;
D5E0 : 11    " "    cba
        ;
D5E1 : 4B    "K"    db  $4B
        ;
D5E2        LD5E2:
D5E2 : E6 EE    "  "    ldab  $EE,x
D5E4 : FF 77 3B    " w;"    stx  X773B
D5E7 : 66 16    "f "    ror  $16,x
        ;
D5E9 : 15 62 04    " b "    db  $15, $62, $04
        ;
D5EC : 09    " "    dex
D5ED : C5 A4    "  "    bitb  #$A4
D5EF : 6D FB    "m "    tst  $FB,x
D5F1 : FF BA 2E    "  ."    stx  XBA2E
D5F4 : 97 CA    "  "    staa  X00CA
D5F6        LD5F6:
D5F6 : 84 10    "  "    anda  #$10
D5F8 : A2 A2    "  "    sbca  $A2,x
        ;
D5FA : 62    "b"    db  $62
        ;
D5FB : 36    "6"    psha
D5FC : 3B    ";"    rti
        ;
D5FD : B7 DB 77    "  w"    staa  XDB77
        ;
D600 : 4B    "K"    db  $4B
        ;
D601 : B5 4A 18    " J "    bita  X4A18
D604 : 48    "H"    asla
        ;
D605 : 62    "b"    db  $62
        ;
D606 : 4C    "L"    inca
D607 : C9 D6    "  "    adcb  #$D6
D609        XD609:
D609 : 9C BE    "  "    cpx  X00BE
        ;
D60B : DD    " "    db  $DD
        ;
D60C : DA 59    " Y"    orab  X0059
D60E : D5 90    "  "    bitb  X0090
D610 : A2 50    " P"    sbca  $50,x
D612 : 0E    " "    cli
D613 : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
D615 : 63 75    "cu"    com  $75,x
D617 : E9 B5    "  "    adcb  $B5,x
D619 : 2A 4D    "*M"    bpl  LD668
        ;
D61B : 3A    ":"    db  $3A
        ;
D61C : 8A CD    "  "    oraa  #$CD
D61E : 34    "4"    des
D61F : BA 94 4A    "  J"    oraa  X944A
        ;
D622 : 52    "R"    db  $52
        ;
D623 : 19    " "    daa
D624 : 39    "9"    rts
        ;
D625 : B5 D2 CC    "   "    bita  XD2CC
D628 : 6D DB    "m "    tst  $DB,x
D62A : 5A    "Z"    decb
D62B : 67 A9    "g "    asr  $A9,x
D62D : 85 22    " ""    bita  #$22
D62F : 49    "I"    rola
D630 : 2A 52    "*R"    bpl  LD684
D632 : B1 DC B4    "   "    cmpa  XDCB4
D635 : BD F5 6D    "  m"    jsr  LF56D
D638 : AD 2D    " -"    jsr  $2D,x            ;INFO: index jump
        ;
D63A : 12 21    " !"    db  $12, $21
        ;
D63C : 25 52    "%R"    bcs  LD690
        ;
D63E : 51    "Q"    db  $51
        ;
D63F : 29 D7    ") "    bvs  LD618
D641 : 6E 7B    "n{"    jmp  $7B,x            ;INFO: index jump
        ;
D643 : 5D    "]"    tstb
D644 : 37    "7"    pshb
D645 : 9B 25    " %"    adda  X0025
D647 : AA BC    "  "    oraa  $BC,x
D649 : 80 98    "  "    suba  #$98
D64B : D4 8C    "  "    andb  X008C
D64D : C4 D1    "  "    andb  #$D1
D64F : FE FC FF    "   "    ldx  XFCFF
D652 : 5A    "Z"    decb
D653 : B9 20 49    "  I"    adca  X2049
        ;
D656 : 04 A3    "  "    db  $04, $A3
        ;
D658        LD658:
D658 : 4A    "J"    deca
D659 : 94 AA    "  "    anda  X00AA
D65B : D5 DF    "  "    bitb  X00DF
        ;
D65D : FD    " "    db  $FD
        ;
D65E : 67 37    "g7"    asr  $37,x
        ;
D660 : 55    "U"    db  $55
        ;
D661 : 28 82    "( "    bvc  LD5E5
D663 : 82 88    "  "    sbca  #$88
D665 : 50    "P"    negb
D666        XD666:
D666 : 32    "2"    pula
D667 : 6D EF    "m "    tst  $EF,x
        ;
D669 : ED    " "    db  $ED
        ;
D66A : BB BD A6    "   "    adda  XBDA6
D66D : 39    "9"    rts
        ;
D66E : 8A 10    "  "    oraa  #$10
D670 : 90 41    " A"    suba  X0041
D672 : C9 AA    "  "    adcb  #$AA
        ;
D674 : 75    "u"    db  $75
        ;
D675 : 37    "7"    pshb
D676 : EF ED    "  "    stx  $ED,x
        ;
D678 : DD    " "    db  $DD
        ;
D679 : B4 32 24    " 2$"    anda  X3224
D67C : 50    "P"    negb
D67D : 24 54    "$T"    bcc  LD6D3
        ;
D67F : 65    "e"    db  $65
        ;
D680 : 2E BE    ". "    bgt  LD640
        ;
D682 : CD    " "    db  $CD
        ;
D683 : AF F5    "  "    sts  $F5,x
D685 : 5A    "Z"    decb
D686 : 53    "S"    comb
D687 : 54    "T"    lsrb
D688 : 22 11    "" "    bhi  LD69B
D68A        LD68A:
D68A : 2A CC    "* "    bpl  LD658
D68C : 6A B4    "j "    dec  $B4,x
        ;
D68E : B3    " "    db  $B3
        ;
D68F : 6E D7    "n "    jmp  $D7,x            ;INFO: index jump
        ;
D691 : AB 57    " W"    adda  $57,x
D693 : D2 5B    " ["    sbcb  X005B
        ;
D695 : 6B    "k"    db  $6B
        ;
D696 : 0B    " "    sev
D697 : 80 FF    "  "    suba  #$FF
        ;
D699 : 02 DC 12    "   "    db  $02, $DC, $12
        ;
D69C : FB 05 EA    "   "    addb  X05EA
D69F : 2D E9    "- "    blt  LD68A
        ;
D6A1 : 5B    "["    db  $5B
        ;
D6A2 : B5 02 E0    "   "    bita  X02E0
D6A5 : 7F 00 B7    "   "    clr  X00B7
        ;
D6A8 : 52    "R"    db  $52
        ;
D6A9        LD6A9:
D6A9 : 5F    "_"    clrb
D6AA : 20 FD    "  "    bra  LD6A9
        ;
D6AC : 4A    "J"    deca
D6AD : 7A 5B AD    "z[ "    dec  X5BAD
        ;
D6B0 : 00 FC    "  "    db  $00, $FC
        ;
D6B2 : 0F    " "    sei
D6B3 : A0 AB    "  "    suba  $AB,x
D6B5 : F4 2D 44    " -D"    andb  X2D44
D6B8 : 6D DB    "m "    tst  $DB,x
D6BA : 56    "V"    rorb
D6BB : 6D 0B    "m "    tst  $0B,x
D6BD : 80 FF    "  "    suba  #$FF
D6BF : 01    " "    nop
D6C0 : B4 4A FB    " J "    anda  X4AFB
D6C3 : 0A    " "    clv
D6C4 : EA AD    "  "    orab  $AD,x
D6C6 : A8 7F    "  "    eora  $7F,x
D6C8 : A9 00    "  "    adca  $00,x
D6CA : F0 7F 00    "   "    subb  X7F00
        ;
D6CD : DD    " "    db  $DD
        ;
D6CE : 44    "D"    lsra
D6CF : BF 42 DA    " B "    sts  X42DA
        ;
D6D2 : 5B    "["    db  $5B
        ;
D6D3        LD6D3:
D6D3 : AA F6    "  "    oraa  $F6,x
D6D5 : 2D D4    "- "    blt  LD6AB
        ;
D6D7 : FC    " "    db  $FC
        ;
D6D8 : 0F    " "    sei
D6D9 : A0 55    " U"    suba  $55,x
        ;
D6DB : 75    "u"    db  $75
        ;
D6DC : 9B 48    " H"    adda  X0048
        ;
D6DE : DD    " "    db  $DD
        ;
D6DF : AD AD    "  "    jsr  $AD,x            ;INFO: index jump
D6E1 : B4 0F 00    "   "    anda  X0F00
D6E4 : FE 03 B4    "   "    ldx  X03B4
        ;
D6E7 : 45    "E"    db  $45
        ;
D6E8 : EE 07    "  "    ldx  $07,x
D6EA : D2 5E    " ^"    sbcb  X005E
        ;
D6EC : 6B    "k"    db  $6B
        ;
D6ED : 57    "W"    asrb
        ;
D6EE : 65 05    "e "    db  $65, $05
        ;
D6F0 : C0 7F    "  "    subb  #$7F
D6F2 : 01    " "    nop
D6F3 : BA A2 FE    "   "    oraa  XA2FE
D6F6 : 0A    " "    clv
D6F7 : 68 6F    "ho"    asl  $6F,x
        ;
D6F9 : ED    " "    db  $ED
        ;
D6FA : 56    "V"    rorb
D6FB : 95 00    "  "    bita  X0000
        ;
D6FD : FC    " "    db  $FC
        ;
D6FE : 17    " "    tba
D6FF : A0 56    " V"    suba  $56,x
D701 : A9 7D    " }"    adca  $7D,x
        ;
D703 : 05    " "    db  $05
        ;
D704 : A9 77    " w"    adca  $77,x
D706 : BB AD 0A    "   "    adda  XAD0A
        ;
D709 : 00    " "    db  $00
        ;
D70A : FF 05 A4    "   "    stx  X05A4
D70D : 95 EA    "  "    bita  X00EA
D70F : B7 84 54    "  T"    staa  X8454
D712 : EF D4    "  "    stx  $D4,x
D714 : B5 0A 00    "   "    bita  X0A00
D717 : FF 05 54    "  T"    stx  X0554
D71A : 25 F5    "% "    bcs  LD711
        ;
D71C : 5B    "["    db  $5B
        ;
D71D : 49    "I"    rola
        ;
D71E : 52 ED    "R "    db  $52, $ED
        ;
D720 : BF 55 05    " U "    sts  X5505
D723 : 80 BF    "  "    suba  #$BF
        ;
D725 : 42 55    "BU"    db  $42, $55
        ;
D727 : 49    "I"    rola
D728 : DA B6    "  "    orab  X00B6
D72A : AA AA    "  "    oraa  $AA,x
D72C : DA BB    "  "    orab  X00BB
D72E : 35    "5"    txs
D72F : 01    " "    nop
D730 : B5 25 28    " %("    bita  X2528
D733        XD733:
D733 : 95 6A    " j"    bita  X006A
D735 : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
D737 : AB 54    " T"    adda  $54,x
D739 : 6F DB    "o "    clr  $DB,x
D73B : 2B 50    "+P"    bmi  LD78D
D73D : 7F 81 24    "  $"    clr  X8124
        ;
D740 : 21    "!"    db  $21
        ;
D741 : D5 92    "  "    bitb  X0092
D743 : F6 2A 75    " *u"    ldab  X2A75
D746 : B7 76 0B    " v "    staa  X760B
        ;
D749 : ED    " "    db  $ED
        ;
D74A : 57    "W"    asrb
D74B : 90 22    " ""    suba  X0022
D74D : 88 56    " V"    eora  #$56
D74F : 91 EE    "  "    cmpa  X00EE
D751 : AA 76    " v"    oraa  $76,x
D753 : AB 76    " v"    adda  $76,x
        ;
D755 : 41 FD    "A "    db  $41, $FD
        ;
D757 : 17    " "    tba
D758 : A8 85    "  "    eora  $85,x
D75A : 50    "P"    negb
D75B : 8B 50    " P"    adda  #$50
D75D : B7 A5 DE    "   "    staa  XA5DE
D760        LD760:
D760 : AA 56    " V"    oraa  $56,x
D762 : 50    "P"    negb
D763 : FF 25 6C    " %l"    stx  X256C
D766 : 85 A8    "  "    bita  #$A8
D768 : 4A    "J"    deca
D769 : 90 76    " v"    suba  X0076
        ;
D76B : 6B 75    "ku"    db  $6B, $75
        ;
D76D : AB 0A    "  "    adda  $0A,x
D76F : EA DF    "  "    orab  $DF,x
D771 : 4A    "J"    deca
D772 : B5 22 29    " ")"    bita  X2229
D775 : 11    " "    cba
        ;
D776 : 52 55 ED    "RU "    db  $52, $55, $ED
        ;
D779 : AE AD    "  "    lds  $AD,x
D77B : 80 FA    "  "    suba  #$FA
D77D : 57    "W"    asrb
D77E : F4 56 A9    " V "    andb  X56A9
        ;
D781 : 15    " "    db  $15
        ;
D782 : 90 54    " T"    suba  X0054
D784 : AA 6A    " j"    oraa  $6A,x
D786 : B7 2B A0    " + "    staa  X2BA0
D789 : FE 0A DD    "   "    ldx  X0ADD
        ;
D78C : 5B    "["    db  $5B
        ;
D78D        LD78D:
D78D : DA 2A    " *"    orab  X002A
D78F : 40    "@"    nega
        ;
D790 : 55 52    "UR"    db  $55, $52
        ;
D792 : B5 EA 15    "   "    bita  XEA15
D795 : A8 BF    "  "    eora  $BF,x
D797 : 84 F6    "  "    anda  #$F6
D799 : 6A DB    "j "    dec  $DB,x
D79B : 2A 48    "*H"    bpl  LD7E5
D79D : AA 24    " $"    oraa  $24,x
        ;
D79F : 55 55    "UU"    db  $55, $55
        ;
D7A1 : 85 F4    "  "    bita  #$F4
D7A3 : 57    "W"    asrb
D7A4 : 48    "H"    asla
D7A5 : BB D5 DF    "   "    adda  XD5DF
D7A8 : 92 2A    " *"    sbca  X002A
D7AA : 89 4A    " J"    adca  #$4A
D7AC : 91 AA    "  "    cmpa  X00AA
D7AE : 20 FD    "  "    bra  LD7AD
        ;
D7B0 : 15    " "    db  $15
        ;
D7B1 : D2 2E    " ."    sbcb  X002E
        ;
D7B3 : 75    "u"    db  $75
        ;
D7B4 : 7F 95 6A    "  j"    clr  X956A
        ;
D7B7 : 4B    "K"    db  $4B
        ;
D7B8 : 94 44    " D"    anda  X0044
D7BA : 22 A4    "" "    bhi  LD760
D7BC : 7E 45 AA    "~E "    jmp  L45AA
        ;
D7BF : 55    "U"    db  $55
        ;
D7C0 : F5 BB 6A    "  j"    bitb  XBB6A
D7C3 : B5 6D 25    " m%"    bita  X6D25
D7C6 : 48    "H"    asla
        ;
D7C7 : 00    " "    db  $00
        ;
D7C8 : D1 6E    " n"    cmpb  X006E
D7CA : 25 55    "%U"    bcs  LD821
        ;
D7CC : 55 ED DD    "U  "    db  $55, $ED, $DD
        ;
D7CF : 6A BB    "j "    dec  $BB,x
D7D1 : EE 56    " V"    ldx  $56,x
D7D3 : 40    "@"    nega
D7D4 : 01    " "    nop
D7D5 : 48    "H"    asla
        ;
D7D6 : 5B    "["    db  $5B
        ;
D7D7 : A5 56    " V"    bita  $56,x
        ;
D7D9 : 55    "U"    db  $55
        ;
D7DA : D5 6D    " m"    bitb  X006D
D7DC : DB EE    "  "    addb  X00EE
D7DE : 6D 5B    "m["    tst  $5B,x
D7E0 : 09    " "    dex
D7E1 : 10    " "    sba
D7E2 : 89 A4    "  "    adca  #$A4
D7E4 : 0A    " "    clv
        ;
D7E5        LD7E5:
D7E5 : 55    "U"    db  $55
        ;
D7E6 : AB B6    "  "    adda  $B6,x
D7E8 : B5 B6 EE    "   "    bita  XB6EE
D7EB : EF EA    "  "    stx  $EA,x
D7ED : 8A 20    "  "    oraa  #$20
        ;
D7EF : 45    "E"    db  $45
        ;
D7F0 : A0 52    " R"    suba  $52,x
        ;
D7F2 : 52    "R"    db  $52
        ;
D7F3 : AB AA    "  "    adda  $AA,x
D7F5 : 5D    "]"    tstb
D7F6 : B5 DD BE    "   "    bita  XDDBE
D7F9 : B7 AA 2A    "  *"    staa  XAA2A
D7FC : 10    " "    sba
        ;
D7FD : 41    "A"    db  $41
        ;
D7FE : A4 A4    "  "    anda  $A4,x
D800 : 5A    "Z"    decb
D801 : A5 BD    "  "    bita  $BD,x
D803        XD803:
D803 : AA DD    "  "    oraa  $DD,x
D805 : B6 EF D2    "   "    ldaa  XEFD2
D808 : 5D    "]"    tstb
        ;
D809 : 04 14 21    "  !"    db  $04, $14, $21
        ;
D80C : AA 54    " T"    oraa  $54,x
        ;
D80E : 55 6B    "Uk"    db  $55, $6B
        ;
D810 : 57    "W"    asrb
        ;
D811        LD811:
D811 : ED    " "    db  $ED
        ;
D812 : 6A 77    "jw"    dec  $77,x
D814 : D7 BE    "  "    stab  X00BE
        ;
D816 : 02    " "    db  $02
        ;
D817 : 92 20    "  "    sbca  X0020
        ;
D819 : 52    "R"    db  $52
        ;
D81A : 49    "I"    rola
D81B : 6A B5    "j "    dec  $B5,x
D81D : 6E D5    "n "    jmp  $D5,x            ;INFO: index jump
        ;
D81F : B6 EA FE    "   "    ldaa  XEAFE
D822 : DA 2A    " *"    orab  X002A
D824 : 81 84    "  "    cmpa  #$84
D826 : 20 29    " )"    bra  LD851
        ;
D828 : 55    "U"    db  $55
        ;
D829 : AD DA    "  "    jsr  $DA,x            ;INFO: index jump
D82B : AB 56    " V"    adda  $56,x
D82D : D5 F7    "  "    bitb  X00F7
D82F : AD 76    " v"    jsr  $76,x            ;INFO: index jump
D831 : 09    " "    dex
D832 : 24 81    "$ "    bcc  LD7B5
D834 : 48    "H"    asla
D835 : 95 6A    " j"    bita  X006A
D837 : D5 6E    " n"    bitb  X006E
        ;
D839 : 55    "U"    db  $55
        ;
D83A : E9 BD    "  "    adcb  $BD,x
D83C : 6D BB    "m "    tst  $BB,x
D83E : 95 20    "  "    bita  X0020
D840 : 01    " "    nop
D841 : A2 A4    "  "    sbca  $A4,x
        ;
D843 : 52    "R"    db  $52
        ;
D844 : AB 76    " v"    adda  $76,x
D846 : A5 BA    "  "    bita  $BA,x
D848 : 6D DD    "m "    tst  $DD,x
D84A : DB AE    "  "    addb  X00AE
        ;
D84C : 12    " "    db  $12
        ;
D84D : 08    " "    inx
        ;
D84E : 41 52    "AR"    db  $41, $52
        ;
D850 : 4A    "J"    deca
D851        LD851:
D851 : AD 5A    " Z"    jsr  $5A,x            ;INFO: index jump
        ;
D853 : 55    "U"    db  $55
        ;
D854 : BD D5 F6    "   "    jsr  LD5F6
D857 : DE BA    "  "    ldx  X00BA
D859 : 95 40    " @"    bita  X0040
D85B : 84 48    " H"    anda  #$48
D85D : 4A    "J"    deca
        ;
D85E : 55 55    "UU"    db  $55, $55
        ;
D860 : B5 6B 55    " kU"    bita  X6B55
        ;
D863 : 7B    "{"    db  $7B
        ;
D864 : F7 B6 5B    "  ["    stab  XB65B
        ;
D867 : 04    " "    db  $04
        ;
D868 : 09    " "    dex
D869 : 11    " "    cba
D86A : 29 A5    ") "    bvs  LD811
D86C : AA 6A    " j"    oraa  $6A,x
D86E : AB AA    "  "    adda  $AA,x
D870        LD870:
D870 : FA 76 5F    " v_"    orab  X765F
        ;
D873 : 5B    "["    db  $5B
        ;
D874 : 25 48    "%H"    bcs  LD8BE
D876        LD876:
D876 : 88 88    "  "    eora  #$88
D878 : 54    "T"    lsrb
D879 : 4A    "J"    deca
D87A : B5 5D AA    " ] "    bita  X5DAA
D87D        LD87D:
D87D : AE BB    "  "    lds  $BB,x
D87F : F7 DA 2A    "  *"    stab  XDA2A
        ;
D882 : 41    "A"    db  $41
        ;
D883 : 22 22    """"    bhi  LD8A7
        ;
D885 : 52 52    "RR"    db  $52, $52
        ;
D887 : D5 56    " V"    bitb  X0056
D889 : D5 AD    "  "    bitb  X00AD
D88B : EE BE    "  "    ldx  $BE,x
D88D : EB 96    "  "    addb  $96,x
D88F : 0A    " "    clv
D890 : 22 22    """"    bhi  LD8B4
D892 : 22 55    ""U"    bhi  LD8E9
        ;
D894 : 55    "U"    db  $55
        ;
D895 : D5 AA    "  "    bitb  X00AA
D897 : AE 76    " v"    lds  $76,x
D899 : F7 6E 5B    " n["    stab  X6E5B
D89C : 25 44    "%D"    bcs  LD8E2
D89E : 88 84    "  "    eora  #$84
D8A0 : 54    "T"    lsrb
        ;
D8A1 : 55    "U"    db  $55
        ;
D8A2 : AA 55    " U"    oraa  $55,x
D8A4 : AD AB    "  "    jsr  $AB,x            ;INFO: index jump
D8A6 : F7 DD B6    "   "    stab  XDDB6
D8A9 : AA 20    "  "    oraa  $20,x
        ;
D8AB : 41    "A"    db  $41
        ;
D8AC : 92 44    " D"    sbca  X0044
        ;
D8AE : 55    "U"    db  $55
        ;
D8AF : A9 6A    " j"    adca  $6A,x
        ;
D8B1 : 55    "U"    db  $55
        ;
D8B2 : AB 7E    " ~"    adda  $7E,x
D8B4        LD8B4:
D8B4 : DF DA    "  "    stx  X00DA
        ;
D8B6 : 55    "U"    db  $55
        ;
D8B7 : 22 BD    "" "    bhi  LD876
D8B9 : 28 49    "(I"    bvc  LD904
D8BB : AA AA    "  "    oraa  $AA,x
D8BD : AA AA    "  "    oraa  $AA,x
D8BF : AA 7D    " }"    oraa  $7D,x
D8C1 : DF 6D    " m"    stx  X006D
        ;
D8C3 : 5B 12    "[ "    db  $5B, $12
        ;
D8C5 : 44    "D"    lsra
D8C6 : 24 49    "$I"    bcc  LD911
        ;
D8C8 : 52 55 55 55  "RUUU"    db  $52, $55, $55, $55
D8CC : 55 FD    "U "    db  $55, $FD
        ;
D8CE : EE DB    "  "    ldx  $DB,x
D8D0 : 56    "V"    rorb
D8D1 : 25 10    "% "    bcs  LD8E3
D8D3 : 49    "I"    rola
D8D4 : A2 FF    "  "    sbca  $FF,x
        ;
D8D6 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
D8DA : ED    " "    db  $ED
        ;
D8DB : F7 DD 56    "  V"    stab  XDD56
D8DE : 25 90    "% "    bcs  LD870
D8E0 : 48    "H"    asla
D8E1 : A2 AA    "  "    sbca  $AA,x
D8E3        LD8E3:
D8E3 : AA AA    "  "    oraa  $AA,x
D8E5        LD8E5:
D8E5 : AA AA    "  "    oraa  $AA,x
D8E7 : EA F7    "  "    orab  $F7,x
D8E9        LD8E9:
D8E9 : EE 56    " V"    ldx  $56,x
D8EB : 25 90    "% "    bcs  LD87D
D8ED : 48    "H"    asla
D8EE : 92 AA    "  "    sbca  X00AA
D8F0 : AA AA    "  "    oraa  $AA,x
D8F2 : AA AA    "  "    oraa  $AA,x
D8F4 : EA FB    "  "    orab  $FB,x
D8F6 : B6 5B 09    " [ "    ldaa  X5B09
D8F9 : 24 44    "$D"    bcc  LD93F
        ;
D8FB : 52 55    "RU"    db  $52, $55
        ;
D8FD : AD 56    " V"    jsr  $56,x            ;INFO: index jump
        ;
D8FF : 55 55    "UU"    db  $55, $55
        ;
D901        LD901:
D901        XD901:
D901 : F5 DE DD    "   "    bitb  XDEDD
D904        LD904:
D904 : 56    "V"    rorb
D905 : 09    " "    dex
D906 : 84 48    " H"    anda  #$48
D908 : A4 AA    "  "    anda  $AA,x
D90A : C6 AB    "  "    ldab  #$AB
D90C        LD90C:
D90C : 6A A9    "j "    dec  $A9,x
D90E : BA 7B DD    " { "    oraa  X7BDD
D911        LD911:
D911 : AA 04    "  "    oraa  $04,x
        ;
D913        LD913:
D913 : 41    "A"    db  $41
        ;
D914 : 24 49    "$I"    bcc  LD95F
D916 : D5 B6    "  "    bitb  X00B6
D918 : D4 AD    "  "    andb  X00AD
D91A : AA ED    "  "    oraa  $ED,x
D91C : 6E 5B    "n["    jmp  $5B,x            ;INFO: index jump
        ;
D91E : 15    " "    db  $15
        ;
D91F        LD91F:
D91F : 88 88    "  "    eora  #$88
D921 : 88 52    " R"    eora  #$52
D923 : B5 DE B6    "   "    bita  XDEB6
D926 : 56    "V"    rorb
D927 : DB 76    " v"    addb  X0076
D929 : B5 55 02    " U "    bita  X5502
D92C : 11    " "    cba
D92D : 11    " "    cba
D92E : 49    "I"    rola
D92F : AA DA    "  "    oraa  $DA,x
D931 : DE 6E    " n"    ldx  X006E
D933 : DB F6    "  "    addb  X00F6
D935 : 5A    "Z"    decb
D936 : 2B 21    "+!"    bmi  LD959
D938 : 08    " "    inx
D939 : 49    "I"    rola
D93A : 24 A9    "$ "    bcc  LD8E5
D93C : AA DA    "  "    oraa  $DA,x
D93E : DE ED    "  "    ldx  X00ED
        ;
D940 : DD    " "    db  $DD
        ;
D941 : AD AD    "  "    jsr  $AD,x            ;INFO: index jump
D943 : 24 40    "$@"    bcc  LD985
D945 : 24 92    "$ "    bcc  LD8D9
D947 : A4 AA    "  "    anda  $AA,x
D949 : AA F5    "  "    oraa  $F5,x
D94B : F6 DE BB    "   "    ldab  XDEBB
D94E : AD 4A    " J"    jsr  $4A,x            ;INFO: index jump
D950 : 20 42    " B"    bra  LD994
        ;
D952 : 22 25    ""%"    bhi  LD979
        ;
D954 : 55 55    "UU"    db  $55, $55
        ;
D956 : B5 EE BD    "   "    bita  XEEBD
D959        LD959:
D959 : 6F BB    "o "    clr  $BB,x
D95B : AA 40    " @"    oraa  $40,x
D95D : 44    "D"    lsra
D95E : 44    "D"    lsra
D95F        LD95F:
D95F : 92 AA    "  "    sbca  X00AA
D961 : AA AA    "  "    oraa  $AA,x
        ;
D963 : DD    " "    db  $DD
        ;
D964 : DB 7B    " {"    addb  X007B
D966 : B7 56 42    " VB"    staa  X5642
D969 : 88 88    "  "    eora  #$88
D96B : 24 55    "$U"    bcc  LD9C2
D96D : A9 6A    " j"    adca  $6A,x
        ;
D96F : ED    " "    db  $ED
        ;
D970 : DB DD    "  "    addb  X00DD
D972 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
D974 : 22 11    "" "    bhi  LD987
D976 : 22 89    "" "    bhi  LD901
D978        XD978:
D978 : 2A A5    "* "    bpl  LD91F
D97A : 6A FB    "j "    dec  $FB,x
        ;
D97C : ED    " "    db  $ED
        ;
D97D : 6E AB    "n "    jmp  $AB,x            ;INFO: index jump
        ;
D97F : 2A 92    "* "    bpl  LD913
D981 : 24 89    "$ "    bcc  LD90C
D983 : A4 94    "  "    anda  $94,x
D985        LD985:
D985 : 54    "T"    lsrb
D986 : D5 EF    "  "    bitb  X00EF
D988 : EE AD    "  "    ldx  $AD,x
        ;
D98A : 55    "U"    db  $55
        ;
D98B        LD98B:
D98B : 82 94    "  "    sbca  #$94
D98D : 94 52    " R"    anda  X0052
        ;
D98F : 55    "U"    db  $55
        ;
D990 : 92 AA    "  "    sbca  X00AA
D992 : BA 77 77    " ww"    oraa  X7777
D995 : AD 12    "  "    jsr  $12,x            ;INFO: index jump
D997 : 24 22    "$""    bcc  LD9BB
D999 : A5 AA    "  "    bita  $AA,x
D99B : AA AA    "  "    oraa  $AA,x
D99D : DA DB    "  "    orab  X00DB
D99F : B6 AD 0A    "   "    ldaa  XAD0A
D9A2 : 11    " "    cba
        ;
D9A3 : 45    "E"    db  $45
        ;
D9A4 : A2 54    " T"    sbca  $54,x
        ;
D9A6 : 55    "U"    db  $55
        ;
D9A7 : B5 BF B7    "   "    bita  XBFB7
D9AA : B5 56 09    " V "    bita  X5609
        ;
D9AD : 12    " "    db  $12
        ;
D9AE : 49    "I"    rola
D9AF : 4A    "J"    deca
D9B0 : AA 2A    " *"    oraa  $2A,x
        ;
D9B2 : 55    "U"    db  $55
        ;
D9B3 : FB EF 6E    "  n"    addb  XEF6E
D9B6        LD9B6:
D9B6 : AB 12    "  "    adda  $12,x
D9B8 : 48    "H"    asla
D9B9 : 44    "D"    lsra
D9BA : 92 52    " R"    sbca  X0052
        ;
D9BC : 55 55    "UU"    db  $55, $55
        ;
D9BE : BF DB DB    "   "    sts  XDBDB
D9C1 : 56    "V"    rorb
        ;
D9C2        LD9C2:
D9C2 : 15    " "    db  $15
        ;
D9C3 : 22 22    """"    bhi  LD9E7
D9C5 : 91 54    " T"    cmpa  X0054
D9C7 : 4A    "J"    deca
D9C8 : 6D 7F    "m "    tst  $7F,x
        ;
D9CA : 7B 5B    "{["    db  $7B, $5B
        ;
D9CC : AB 12    "  "    adda  $12,x
D9CE : 49    "I"    rola
D9CF : 92 48    " H"    sbca  X0048
D9D1 : 4A    "J"    deca
        ;
D9D2 : 52 75    "Ru"    db  $52, $75
        ;
D9D4 : DF B7    "  "    stx  X00B7
D9D6 : 5D    "]"    tstb
D9D7 : 20 48    " H"    bra  LDA21
        ;
D9D9 : 52    "R"    db  $52
        ;
D9DA : 92 52    " R"    sbca  X0052
        ;
D9DC : 45    "E"    db  $45
        ;
D9DD : A5 7B    " {"    bita  $7B,x
        ;
D9DF : 7B    "{"    db  $7B
        ;
D9E0 : AB 2D    " -"    adda  $2D,x
D9E2 : A1 24    " $"    cmpa  $24,x
D9E4 : 29 A5    ") "    bvs  LD98B
D9E6 : 2A 69    "*i"    bpl  LDA51
D9E8 : BF DB D5    "   "    sts  XDBD5
D9EB : 5A    "Z"    decb
D9EC : 20 4A    " J"    bra  LDA38
        ;
D9EE : 94 52    " R"    anda  X0052
D9F0 : AA AA    "  "    oraa  $AA,x
        ;
D9F2 : FD    " "    db  $FD
        ;
D9F3 : DB 57    " W"    addb  X0057
D9F5 : AD 04    "  "    jsr  $04,x            ;INFO: index jump
D9F7 : 92 48    " H"    sbca  X0048
D9F9 : 49    "I"    rola
D9FA : 29 55    ")U"    bvs  LDA51
D9FC : F7 DD B7    "   "    stab  XDDB7
D9FF : B6 8A 48    "  H"    ldaa  X8A48
DA02 : 48    "H"    asla
DA03 : 24 89    "$ "    bcc  LD98E
DA05 : AA ED    "  "    oraa  $ED,x
DA07 : 7D 6B AB    "}k "    tst  X6BAB
        ;
DA0A : 45    "E"    db  $45
        ;
DA0B : 2A A9    "* "    bpl  LD9B6
        ;
DA0D : 12    " "    db  $12
        ;
DA0E : D0 EA    "  "    subb  X00EA
DA10 : 4A    "J"    deca
DA11        LDA11:
DA11 : 7F 6A 15    " j "    clr  X6A15
DA14 : 34    "4"    des
DA15 : AA A5    "  "    oraa  $A5,x
DA17 : 2A F8    "* "    bpl  LDA11
DA19 : BF F4 41    "  A"    sts  XF441
        ;
DA1C : 05    " "    db  $05
        ;
DA1D : 69 E1    "i "    rol  $E1,x
        ;
DA1F : A3    " "    db  $A3
        ;
DA20 : A6 C0    "  "    ldaa  $C0,x
DA22 : EF E7    "  "    stx  $E7,x
        ;
DA24 : C3 41    " A"    db  $C3, $41
        ;
DA26 : A1 D1    "  "    cmpa  $D1,x
DA28 : C5 D1    "  "    bitb  #$D1
DA2A        XDA2A:
DA2A : 80 D7    "  "    suba  #$D7
DA2C : AF 47    " G"    sts  $47,x
DA2E : 85 C1    "  "    bita  #$C1
DA30 : A5 6B    " k"    bita  $6B,x
        ;
DA32 : 65    "e"    db  $65
        ;
DA33 : 01    " "    nop
DA34 : AF AF    "  "    sts  $AF,x
DA36 : 47    "G"    asra
DA37 : 09    " "    dex
DA38        LDA38:
DA38 : C5 D1    "  "    bitb  #$D1
DA3A : AE D5    "  "    lds  $D5,x
        ;
DA3C : 00    " "    db  $00
        ;
DA3D : DF 57    " W"    stx  X0057
DA3F : 47    "G"    asra
DA40 : 09    " "    dex
DA41 : C5 62    " b"    bitb  #$62
DA43 : E7 B2    "  "    stab  $B2,x
DA45 : 80 FF    "  "    suba  #$FF
        ;
DA47 : CD    " "    db  $CD
        ;
DA48 : 43    "C"    coma
        ;
DA49 : 05    " "    db  $05
        ;
DA4A : E1 D4    "  "    cmpb  $D4,x
DA4C : D5 32    " 2"    bitb  X0032
DA4E : C0 7F    "  "    subb  #$7F
DA50 : EB 61    " a"    addb  $61,x
        ;
DA52 : 41    "A"    db  $41
        ;
DA53 : 78 F4 B8    "x  "    asl  XF4B8
DA56 : 0C    " "    clc
DA57 : F0 EF 3C    "  <"    subb  XEF3C
        ;
DA5A : 38    "8"    db  $38
        ;
DA5B : 28 1E    "( "    bvc  LDA7B
DA5D : AF 9A    "  "    sts  $9A,x
        ;
DA5F : 02    " "    db  $02
        ;
DA60 : BE AF 07    "   "    lds  XAF07
DA63 : 0B    " "    sev
DA64 : C4 E3    "  "    andb  #$E3
        ;
DA66 : C7 55    " U"    db  $C7, $55
        ;
DA68 : C0 77    " w"    subb  #$77
DA6A : FB 60 C0    " ` "    addb  X60C0
        ;
DA6D : 38    "8"    db  $38
        ;
DA6E : 7E 5C 06    "~\ "    jmp  L5C06
        ;
DA71 : FC 5E 1F    " ^ "    db  $FC, $5E, $1F
        ;
DA74 : 06    " "    tap
DA75 : 94 C3    "  "    anda  X00C3
        ;
DA77 : 8F    " "    db  $8F
        ;
DA78 : AB 80    "  "    adda  $80,x
DA7A : DF FD    "  "    stx  X00FD
DA7C : E0 40    " @"    subb  $40,x
        ;
DA7E : 3A    ":"    db  $3A
        ;
DA7F : 7C 3C 03    "|< "    inc  X3C03
DA82 : BE CE 07    "   "    lds  XCE07
DA85 : 07    " "    tpa
DA86 : D2 E1    "  "    sbcb  X00E1
        ;
DA88 : C7 15    "  "    db  $C7, $15
        ;
DA8A : F0 73 1F    " s "    subb  X731F
        ;
DA8D : 3C    "<"    db  $3C
        ;
DA8E : A0 86    "  "    suba  $86,x
        ;
DA90 : 1F    " "    db  $1F
        ;
DA91 : AF C0    "  "    sts  $C0,x
        ;
DA93 : 8F    " "    db  $8F
        ;
DA94 : FB E0 01    "   "    addb  XE001
        ;
DA97 : 1D FC    "  "    db  $1D, $FC
        ;
DA99 : 78 01 3F    "x ?"    asl  X013F
DA9C        LDA9C:
DA9C : FE 81 07    "   "    ldx  X8107
        ;
DA9F : 3A    ":"    db  $3A
        ;
DAA0 : F8 E1 03    "   "    eorb  XE103
        ;
DAA3 : FC    " "    db  $FC
        ;
DAA4 : F8 07 1E    "   "    eorb  X071E
DAA7 : B8 C1 0F    "   "    eora  XC10F
DAAA : 2F F0    "/ "    ble  LDA9C
        ;
DAAC : C3 1F 3C    "  <"    db  $C3, $1F, $3C
        ;
DAAF : E0 83    "  "    subb  $83,x
        ;
DAB1 : 1F    " "    db  $1F
        ;
DAB2 : 3E    ">"    wai
DAB3 : E0 87    "  "    subb  $87,x
DAB5 : 3F    "?"    swi
DAB6 : F0 C0 07    "   "    subb  XC007
DAB9 : 3F    "?"    swi
DABA : 7C C0 0F    "|  "    inc  XC00F
DABD : 7F E0 01    "   "    clr  XE001
        ;
DAC0 : 1F FC    "  "    db  $1F, $FC
        ;
DAC2 : F0 01 3F    "  ?"    subb  X013F
DAC5 : FA 81 07    "   "    orab  X8107
DAC8 : 7C F8 C1    "|  "    inc  XF8C1
DACB : 07    " "    tpa
DACC : 7E F4 03    "~  "    jmp  LF403
        ;
DACF : 0F    " "    sei
DAD0 : F8 E0 87    "   "    eorb  XE087
DAD3 : 0E    " "    cli
        ;
DAD4 : FC    " "    db  $FC
        ;
DAD5 : E9 07    "  "    adcb  $07,x
        ;
DAD7 : 1C    " "    db  $1C
        ;
DAD8 : F0 E1 D1    "   "    subb  XE1D1
DADB : 2D F0    "- "    blt  LDACD
        ;
DADD : F3 1E    "  "    db  $F3, $1E
        ;
DADF : 70 C0 47    "p G"    neg  XC047
DAE2 : 3F    "?"    swi
DAE3 : 4C    "L"    inca
DAE4 : E0 CF    "  "    subb  $CF,x
        ;
DAE6 : 7B    "{"    db  $7B
        ;
DAE7 : C0 01    "  "    subb  #$01
DAE9 : 9F FA    "  "    sts  X00FA
DAEB : B0 80 3F    "  ?"    suba  X803F
DAEE : EF 01    "  "    stx  $01,x
DAF0 : 07    " "    tpa
DAF1 : 7C E6 A3    "|  "    inc  XE6A3
        ;
DAF4 : 04    " "    db  $04
        ;
DAF5 : FE FC 06    "   "    ldx  XFC06
        ;
DAF8 : 1C    " "    db  $1C
        ;
DAF9 : F0 5A 1F    " Z "    subb  X5A1F
        ;
DAFC : 05    " "    db  $05
        ;
DAFD : F0 EF 5B    "  ["    subb  XEF5B
DB00 : 60 40    "`@"    neg  $40,x
DB02 : 5F    "_"    clrb
DB03 : FA 14 C0    "   "    orab  X14C0
DB06 : BF 6F 01    " o "    sts  X6F01
        ;
DB09 : 03    " "    db  $03
        ;
DB0A : 7A E7 87    "z  "    dec  XE787
        ;
DB0D : 00    " "    db  $00
        ;
DB0E : FF 5D 0B    " ] "    stx  X5D0B
DB11 : 0C    " "    clc
DB12 : E2 AD    "  "    sbcb  $AD,x
DB14 : AF 00    "  "    sts  $00,x
DB16 : F4 F7 E9    "   "    andb  XF7E9
DB19 : A0 20    "  "    suba  $20,x
        ;
DB1B : ED    " "    db  $ED
        ;
DB1C : 7A 15 60    "z `"    dec  X1560
DB1F : 5F    "_"    clrb
DB20        XDB20:
DB20 : B7 8E 02    "   "    staa  X8E02
DB23 : AA 6E    " n"    oraa  $6E,x
DB25 : AB 02    "  "    adda  $02,x
        ;
DB27 : FC    " "    db  $FC
        ;
DB28 : F9 E9 04    "   "    adcb  XE904
DB2B : 68 69    "hi"    asl  $69,x
DB2D : 2F 0D    "/ "    ble  LDB3C
DB2F : C0 6F    " o"    subb  #$6F
DB31 : 3F    "?"    swi
DB32 : AE 80    "  "    lds  $80,x
DB34 : 95 FA    "  "    bita  X00FA
DB36 : 70 02 7C    "p |"    neg  X027C
        ;
DB39 : FD    " "    db  $FD
        ;
DB3A : 8E 0B 1C    "   "    lds  #$0B1C
DB3D : 4D    "M"    tsta
        ;
DB3E : 87    " "    db  $87
        ;
DB3F : 0B    " "    sev
DB40 : 8A EA    "  "    oraa  #$EA
        ;
DB42 : CF    " "    db  $CF
        ;
DB43 : A7 38    " 8"    staa  $38,x
DB45 : C5 0D    "  "    bitb  #$0D
        ;
DB47 : 1C    " "    db  $1C
        ;
DB48 : B4 0A 3F    "  ?"    anda  X0A3F
DB4B : EF A1    "  "    stx  $A1,x
DB4D : 0F    " "    sei
        ;
DB4E : 6B    "k"    db  $6B
        ;
DB4F : 50    "P"    negb
DB50 : A1 15    "  "    cmpa  $15,x
        ;
DB52 : 55    "U"    db  $55
        ;
DB53 : FA C3 2F    "  /"    orab  XC32F
DB56 : AF 82    "  "    sts  $82,x
DB58 : BD 2B F8    " + "    jsr  L2BF8
DB5B : C0 0B    "  "    subb  #$0B
DB5D : FF EA 06    "   "    stx  XEA06
DB60 : 17    " "    tba
DB61 : 2C D2    ", "    bge  LDB35
DB63 : C2 16    "  "    sbcb  #$16
        ;
DB65 : FC    " "    db  $FC
        ;
DB66 : E9 0F    "  "    adcb  $0F,x
DB68 : 3E    ">"    wai
DB69 : E8 A1    "  "    eorb  $A1,x
DB6B : 16    " "    tab
DB6C : 2A F4    "* "    bpl  LDB62
        ;
DB6E : 61 1F FC    "a  "    db  $61, $1F, $FC
        ;
DB71 : E0 27    " '"    subb  $27,x
        ;
DB73 : 1E    " "    db  $1E
        ;
DB74 : D2 C0    "  "    sbcb  X00C0
DB76 : 47    "G"    asra
        ;
DB77        XDB77:
DB77 : 9D    " "    db  $9D
        ;
DB78 : F0 A2 2F    "  /"    subb  XA22F
DB7B : 7E D1 81    "~  "    jmp  LD181
        ;
DB7E : 0F    " "    sei
DB7F : DA C0    "  "    orab  X00C0
DB81        XDB81:
DB81 : 85 6E    " n"    bita  #$6E
DB83 : FA C9 87    "   "    orab  XC987
DB86 : 7E 64 05    "~d "    jmp  L6405
        ;
DB89 : 86 72    " r"    ldaa  #$72
DB8B : D4 A5    "  "    andb  X00A5
DB8D        LDB8D:
DB8D : 2D FE    "- "    blt  LDB8D
DB8F : B5 0B 1C    "   "    bita  X0B1C
DB92 : A8 52    " R"    eora  $52,x
DB94 : 1B    " "    aba
DB95 : 54    "T"    lsrb
DB96 : F8 E7 5D    "  ]"    eorb  XE75D
DB99 : 7A 50 15    "zP "    dec  X5015
DB9C : 5D    "]"    tstb
DB9D : 50    "P"    negb
DB9E : C1 97    "  "    cmpb  #$97
DBA0 : F6 D1 93    "   "    ldab  XD193
DBA3 : BE EA 40    "  @"    lds  XEA40
DBA6 : 80 3E    " >"    suba  #$3E
DBA8 : AD 03    "  "    jsr  $03,x            ;INFO: index jump
DBAA : 17    " "    tba
DBAB : FF AB A7    "   "    stx  XABA7
        ;
DBAE : 00    " "    db  $00
        ;
DBAF : A8 A5    "  "    eora  $A5,x
DBB1 : B5 78 50    " xP"    bita  X7850
DBB4 : AB FF    "  "    adda  $FF,x
DBB6 : 9B 30    " 0"    adda  X0030
DBB8 : 2A 48    "*H"    bpl  LDC02
DBBA : 81 AB    "  "    cmpa  #$AB
DBBC : BE F2 E2    "   "    lds  XF2E2
DBBF : E5 5F    " _"    bitb  $5F,x
        ;
DBC1 : 1D    " "    db  $1D
        ;
DBC2 : 08    " "    inx
DBC3 : 80 C8    "  "    suba  #$C8
        ;
DBC5 : 5B    "["    db  $5B
        ;
DBC6 : BF 54 E8    " T "    sts  X54E8
DBC9 : FB 9B 1A    "   "    addb  X9B1A
DBCC : 28 20    "( "    bvc  LDBEE
DBCE : D4 56    " V"    andb  X0056
DBD0 : AF 5E    " ^"    sts  $5E,x
        ;
DBD2 : EC    " "    db  $EC
        ;
DBD3 : FA 53 0D    " S "    orab  X530D
DBD6        XDBD6:
DBD6 : 0C    " "    clc
DBD7 : 30    "0"    tsx
DBD8 : A0 B6    "  "    suba  $B6,x
DBDA : DF 4B    " K"    stx  X004B
DBDC : 95 FA    "  "    bita  X00FA
DBDE : F5 32 08    " 2 "    bitb  X3208
DBE1 : 40    "@"    nega
DBE2 : 54    "T"    lsrb
DBE3 : BB BE 7D    "  }"    adda  XBE7D
DBE6 : 95 F6    "  "    bita  X00F6
        ;
DBE8 : DD    " "    db  $DD
        ;
DBE9 : E1 C0    "  "    cmpb  $C0,x
DBEB : 40    "@"    nega
DBEC : 44    "D"    lsra
DBED : 5A    "Z"    decb
DBEE        LDBEE:
DBEE : BE BE AA    "   "    lds  XBEAA
DBF1 : 8A AF    "  "    oraa  #$AF
DBF3 : DB 46    " F"    addb  X0046
        ;
DBF5 : 02    " "    db  $02
        ;
DBF6 : 10    " "    sba
DBF7 : D4 AA    "  "    andb  X00AA
DBF9 : AF B5    "  "    sts  $B5,x
DBFB : C9 DD    "  "    adcb  #$DD
DBFD : 5F    "_"    clrb
DBFE : 79 20 20    "y  "    rol  X2020
DC01 : 84 56    " V"    anda  #$56
DC03 : AF 37    " 7"    sts  $37,x
DC05 : B7 E8 F5    "   "    staa  XE8F5
DC08 : AB 14    "  "    adda  $14,x
        ;
DC0A : 02    " "    db  $02
        ;
DC0B : 0A    " "    clv
DC0C : B2 E8 D5    "   "    sbca  XE8D5
DC0F : AF AB    "  "    sts  $AB,x
DC11 : AA ED    "  "    oraa  $ED,x
        ;
DC13 : 1A    " "    db  $1A
        ;
DC14 : 0D    " "    sec
        ;
DC15 : 02 03    "  "    db  $02, $03
        ;
DC17 : 56    "V"    rorb
DC18 : FA 75 57    " uW"    orab  X7557
DC1B : AB 92    "  "    adda  $92,x
DC1D : D7 55    " U"    stab  X0055
        ;
DC1F        LDC1F:
DC1F : 1D 14    "  "    db  $1D, $14
        ;
DC21 : 82 12    "  "    sbca  #$12
DC23 : B9 EB 57    "  W"    adca  XEB57
DC26 : 2B 6A    "+j"    bmi  LDC92
        ;
DC28 : DD    " "    db  $DD
        ;
DC29 : 57    "W"    asrb
DC2A : 2E A8    ". "    bgt  LDBD4
DC2C : 10    " "    sba
DC2D : 22 69    ""i"    bhi  LDC98
DC2F : D5 AF    "  "    bitb  X00AF
        ;
DC31 : 5B    "["    db  $5B
        ;
DC32 : 34    "4"    des
DC33 : B8 EF AE    "   "    eora  XEFAE
DC36 : 86 01    "  "    ldaa  #$01
        ;
DC38 : 05    " "    db  $05
        ;
DC39 : 34    "4"    des
DC3A : 5A    "Z"    decb
DC3B : BD 9E D5    "   "    jsr  L9ED5
DC3E : E4 E5    "  "    andb  $E5,x
DC40 : 6F 73    "os"    clr  $73,x
DC42 : 28 40    "(@"    bvc  LDC84
DC44 : 90 52    " R"    suba  X0052
        ;
DC46 : 4B CF    "K "    db  $4B, $CF
        ;
DC48 : 5F    "_"    clrb
        ;
DC49 : 5B 55    "[U"    db  $5B, $55
        ;
DC4B : 5D    "]"    tstb
DC4C : BB 6A 24    " j$"    adda  X6A24
        ;
DC4F : 00    " "    db  $00
        ;
DC50 : 88 62    " b"    eora  #$62
        ;
DC52 : 5B    "["    db  $5B
        ;
DC53 : 7F BB 2E    "  ."    clr  XBB2E
DC56 : 2A 6A    "*j"    bpl  LDCC2
        ;
DC58 : DD    " "    db  $DD
        ;
DC59 : 73 51 80    "sQ "    com  X5180
DC5C : 40    "@"    nega
DC5D : AD B6    "  "    jsr  $B6,x            ;INFO: index jump
DC5F : BD 6A 5A    " jZ"    jsr  L6A5A
DC62 : 54    "T"    lsrb
DC63 : 69 77    "iw"    rol  $77,x
DC65 : B5 4B 0B    " K "    bita  X4B0B
        ;
DC68 : 02    " "    db  $02
        ;
DC69 : 24 B4    "$ "    bcc  LDC1F
DC6B : F4 FA AB    "   "    andb  XFAAB
DC6E : 8B 8A    "  "    adda  #$8A
DC70 : BA FF 75    "  u"    oraa  XFF75
        ;
DC73 : 21 00    "! "    db  $21, $00
        ;
DC75 : 40    "@"    nega
        ;
DC76        LDC76:
DC76 : 52    "R"    db  $52
        ;
DC77 : D7 AF    "  "    stab  X00AF
        ;
DC79 : 5B    "["    db  $5B
        ;
DC7A : 5D    "]"    tstb
DC7B : 59    "Y"    rolb
DC7C : A9 D3    "  "    adca  $D3,x
DC7E : AB 5A    " Z"    adda  $5A,x
DC80 : 50    "P"    negb
DC81 : 80 40    " @"    suba  #$40
DC83 : A5 DE    "  "    bita  $DE,x
DC85 : 7F 6F 13    " o "    clr  X6F13
DC88 : 81 A4    "  "    cmpa  #$A4
DC8A : FA FE F3    "   "    orab  XFEF3
DC8D : 40    "@"    nega
        ;
DC8E : 00    " "    db  $00
        ;
DC8F : 89 96    "  "    adca  #$96
        ;
DC91 : 5E    "^"    db  $5E
        ;
DC92        LDC92:
DC92 : AF B6    "  "    sts  $B6,x
DC94 : AA 42    " B"    oraa  $42,x
DC96 : A5 EB    "  "    bita  $EB,x
DC98        LDC98:
DC98 : FB 57 07    " W "    addb  X5707
        ;
DC9B : 04    " "    db  $04
        ;
DC9C : 20 50    " P"    bra  LDCEE
        ;
DC9E : EA FD    "  "    orab  $FD,x
DCA0 : B7 97 04    "   "    staa  X9704
        ;
DCA3 : 52    "R"    db  $52
        ;
DCA4 : FA BE EF    "   "    orab  XBEEF
DCA7 : C2 00    "  "    sbcb  #$00
        ;
DCA9 : 00    " "    db  $00
        ;
DCAA : 92 BA    "  "    sbca  X00BA
DCAC : FE FE BA    "   "    ldx  XFEBA
        ;
DCAF : 12 02    "  "    db  $12, $02
        ;
DCB1 : 4A    "J"    deca
        ;
DCB2 : 5B    "["    db  $5B
        ;
DCB3 : 7F BF 85    "   "    clr  XBF85
        ;
DCB6 : 02 00    "  "    db  $02, $00
        ;
DCB8 : 4A    "J"    deca
        ;
DCB9 : FD    " "    db  $FD
        ;
DCBA : 7F B7 12    "   "    clr  XB712
DCBD : 01    " "    nop
DCBE : 22 B6    "" "    bhi  LDC76
DCC0 : 7F DF 6D    "  m"    clr  XDF6D
        ;
DCC3 : 05 04    "  "    db  $05, $04
        ;
DCC5 : 10    " "    sba
DCC6 : 54    "T"    lsrb
        ;
DCC7 : ED    " "    db  $ED
        ;
DCC8        XDCC8:
DCC8 : F7 AD 4A    "  J"    stab  XAD4A
DCCB : 48    "H"    asla
DCCC : A8 F4    "  "    eora  $F4,x
        ;
DCCE : FD ED    "  "    db  $FD, $ED
        ;
DCD0 : AD 16    "  "    jsr  $16,x            ;INFO: index jump
DCD2 : 40    "@"    nega
DCD3 : 80 A0    "  "    suba  #$A0
DCD5 : DB BF    "  "    addb  X00BF
        ;
DCD7 : 5E    "^"    db  $5E
        ;
DCD8 : 2A 90    "* "    bpl  LDC6A
DCDA : A2 AD    "  "    sbca  $AD,x
DCDC : 6F 5F    "o_"    clr  $5F,x
DCDE : 5A    "Z"    decb
DCDF : AA 0A    "  "    oraa  $0A,x
        ;
DCE1 : 14    " "    db  $14
        ;
DCE2 : A8 68    " h"    eora  $68,x
DCE4 : 6D 5F    "m_"    tst  $5F,x
DCE6 : 2F 15    "/ "    ble  LDCFD
DCE8 : A8 68    " h"    eora  $68,x
DCEA : D5 AE    "  "    bitb  X00AE
DCEC : 9B AE    "  "    adda  X00AE
DCEE        LDCEE:
DCEE : EE 2E    " ."    ldx  $2E,x
DCF0 : 10    " "    sba
DCF1 : 90 D0    "  "    suba  X00D0
DCF3 : 5A    "Z"    decb
DCF4 : 5F    "_"    clrb
DCF5 : 2D 24    "-$"    blt  LDD1B
DCF7 : A1 6A    " j"    cmpa  $6A,x
DCF9 : 5F    "_"    clrb
DCFA : 6F AD    "o "    clr  $AD,x
DCFC : DA F6    "  "    orab  X00F6
DCFE : DE 01    "  "    ldx  X0001
        ;
DD00 : 00    " "    db  $00
        ;
DD01 : 80 EA    "  "    suba  #$EA
DD03 : FA AB 25    "  %"    orab  XAB25
DD06 : 49    "I"    rola
DD07 : 6A F7    "j "    dec  $F7,x
DD09 : 56    "V"    rorb
DD0A : AB AA    "  "    adda  $AA,x
DD0C : 6A 75    "ju"    dec  $75,x
DD0E : EB 00    "  "    addb  $00,x
        ;
DD10 : 00    " "    db  $00
        ;
DD11 : A6 DE    "  "    ldaa  $DE,x
DD13 : EB 44    " D"    addb  $44,x
DD15 : A1 DA    "  "    cmpa  $DA,x
DD17 : FB 6B 05    " k "    addb  X6B05
DD1A : 84 AC    "  "    anda  #$AC
DD1C : 7D 7B B7    "}{ "    tst  X7BB7
        ;
DD1F : 05 00    "  "    db  $05, $00
        ;
DD21 : A8 F6    "  "    eora  $F6,x
DD23 : AB 15    "  "    adda  $15,x
DD25 : 4A    "J"    deca
DD26 : D4 EA    "  "    andb  X00EA
DD28 : AD 92    "  "    jsr  $92,x            ;INFO: index jump
DD2A : A8 FB    "  "    eora  $FB,x
DD2C : D7 5A    " Z"    stab  X005A
DD2E : 6A F9    "j "    dec  $F9,x
        ;
DD30 : 00    " "    db  $00
        ;
DD31 : 01    " "    nop
DD32 : 2D 5A    "-Z"    blt  LDD8E
        ;
DD34 : 51    "Q"    db  $51
        ;
DD35 : 89 D5    "  "    adca  #$D5
DD37 : DF 77    " w"    stx  X0077
DD39 : 25 84    "% "    bcs  LDCBF
DD3B : B4 FD B6    "   "    anda  XFDB6
DD3E : 5A    "Z"    decb
DD3F : 5A    "Z"    decb
DD40 : DA 00    "  "    orab  X0000
        ;
DD42 : 00    " "    db  $00
        ;
DD43 : 2E F7    ". "    bgt  LDD3C
DD45 : A5 05    "  "    bita  $05,x
        ;
DD47 : 55 FD    "U "    db  $55, $FD
        ;
DD49 : B6 2B 55    " +U"    ldaa  X2B55
DD4C : D1 A5    "  "    cmpb  X00A5
DD4E        LDD4E:
DD4E : 0A    " "    clv
DD4F : 2A FD    "* "    bpl  LDD4E
DD51 : FA 1B 10    "   "    orab  X1B10
DD54 : C0 6A    " j"    subb  #$6A
DD56        XDD56:
DD56 : 3B    ";"    rti
        ;
DD57 : 32    "2"    pula
DD58 : A9 BB    "  "    adca  $BB,x
        ;
DD5A : 5B 21 42    "[!B"    db  $5B, $21, $42
        ;
DD5D : B5 BF 6D    "  m"    bita  XBF6D
DD60 : A5 AA    "  "    bita  $AA,x
DD62 : AA D5    "  "    oraa  $D5,x
DD64 : 2B 40    "+@"    bmi  LDDA6
DD66 : B0 53 25    " S%"    suba  X5325
DD69 : 40    "@"    nega
DD6A : D1 7F    "  "    cmpb  X007F
DD6C : DF 52    " R"    stx  X0052
DD6E : 25 55    "%U"    bcs  LDDC5
DD70 : 49    "I"    rola
        ;
DD71 : 4B    "K"    db  $4B
        ;
DD72 : B7 7B B7    " { "    staa  X7BB7
DD75 : 85 82    "  "    bita  #$82
        ;
DD77 : 02    " "    db  $02
        ;
DD78 : 08    " "    inx
DD79 : F6 BA 4A    "  J"    ldab  XBA4A
DD7C : A8 D4    "  "    eora  $D4,x
        ;
DD7E : 5E    "^"    db  $5E
        ;
DD7F : 5D    "]"    tstb
DD80 : F5 BA 55    "  U"    bitb  XBA55
        ;
DD83 : 15    " "    db  $15
        ;
DD84 : 28 51    "(Q"    bvc  LDDD7
DD86 : 69 7B    "i{"    rol  $7B,x
DD88 : 6F 5B    "o["    clr  $5B,x
        ;
DD8A : 55 00    "U "    db  $55, $00
        ;
DD8C : 80 6B    " k"    suba  #$6B
DD8E        LDD8E:
DD8E : AB 83    "  "    adda  $83,x
        ;
DD90 : 55 FD    "U "    db  $55, $FD
        ;
DD92 : A6 15    "  "    ldaa  $15,x
DD94 : 2E B5    ". "    bgt  LDD4B
        ;
DD96 : 55 55 55 45  "UUUE"    db  $55, $55, $55, $45
DD9A : 55 FD    "U "    db  $55, $FD
        ;
DD9C : 6A 55    "jU"    dec  $55,x
        ;
DD9E : 6B 00    "k "    db  $6B, $00
        ;
DDA0 : 44    "D"    lsra
DDA1 : AB 42    " B"    adda  $42,x
        ;
DDA3        LDDA3:
DDA3 : 21    "!"    db  $21
        ;
DDA4 : DA FE    "  "    orab  X00FE
        ;
DDA6        LDDA6:
DDA6 : 5B    "["    db  $5B
        ;
DDA7 : 2B B5    "+ "    bmi  LDD5E
DDA9 : AA 55    " U"    oraa  $55,x
DDAB : AA 4A    " J"    oraa  $4A,x
DDAD : 2B 75    "+u"    bmi  LDE24
DDAF : FB 5B A9    " [ "    addb  X5BA9
DDB2 : 80 48    " H"    suba  #$48
        ;
DDB4 : 00    " "    db  $00
        ;
DDB5 : A9 DD    "  "    adca  $DD,x
DDB7        XDDB7:
DDB7 : 92 92    "  "    sbca  X0092
DDB9 : BA DF 5B    "  ["    oraa  XDF5B
DDBC : 2B D5    "+ "    bmi  LDD93
DDBE        XDDBE:
DDBE : 56    "V"    rorb
        ;
DDBF : 5B 55    "[U"    db  $5B, $55
        ;
DDC1 : 20 A8    "  "    bra  LDD6B
        ;
DDC3 : AA 7D    " }"    oraa  $7D,x
DDC5        LDDC5:
DDC5 : 5D    "]"    tstb
        ;
DDC6 : 55 15    "U "    db  $55, $15
        ;
DDC8 : B5 2D 00    " - "    bita  X2D00
DDCB : 24 B5    "$ "    bcc  LDD82
        ;
DDCD : 52    "R"    db  $52
        ;
DDCE : D5 FE    "  "    bitb  X00FE
DDD0 : 77 85 88    "w  "    asr  X8588
DDD3 : DA 6E    " n"    orab  X006E
        ;
DDD5 : 55 45    "UE"    db  $55, $45
        ;
DDD7        LDDD7:
DDD7 : 85 AA    "  "    bita  #$AA
DDD9 : FA AA 45    "  E"    orab  XAA45
DDDC : 6A 7D    "j}"    dec  $7D,x
DDDE : AB AA    "  "    adda  $AA,x
        ;
DDE0 : 02    " "    db  $02
        ;
DDE1 : A0 D0    "  "    suba  $D0,x
DDE3 : 92 92    "  "    sbca  X0092
DDE5 : AA 7D    " }"    oraa  $7D,x
DDE7 : B5 D5 BD    "   "    bita  XD5BD
        ;
DDEA : DD    " "    db  $DD
        ;
DDEB        LDDEB:
DDEB : 4A    "J"    deca
DDEC : 22 B5    "" "    bhi  LDDA3
DDEE : AA AA    "  "    oraa  $AA,x
DDF0 : BA 55 AD    " U "    oraa  X55AD
DDF3 : 60 A1    "` "    neg  $A1,x
DDF5 : 26 6D    "&m"    bne  LDE64
DDF7 : A9 00    "  "    adca  $00,x
DDF9 : 90 EE    "  "    suba  X00EE
DDFB : 4A    "J"    deca
DDFC : 2B ED    "+ "    bmi  LDDEB
DDFE : BB B6 D2    "   "    adda  XB6D2
DE01 : 56    "V"    rorb
DE02 : B7 6A 15    " j "    staa  X6A15
DE05 : 24 D0    "$ "    bcc  LDDD7
DE07 : AA AD    "  "    oraa  $AD,x
DE09 : A8 AA    "  "    eora  $AA,x
DE0B : AF B6    "  "    sts  $B6,x
DE0D : 44    "D"    lsra
DE0E : AA 54    " T"    oraa  $54,x
DE10 : 01    " "    nop
        ;
DE11 : 52    "R"    db  $52
        ;
DE12 : D5 4A    " J"    bitb  X004A
DE14 : D5 EA    "  "    bitb  X00EA
DE16 : AF 5A    " Z"    sts  $5A,x
DE18 : 6A AB    "j "    dec  $AB,x
        ;
DE1A : 55    "U"    db  $55
        ;
DE1B : 50    "P"    negb
DE1C : A9 AF    "  "    adca  $AF,x
DE1E : D5 A2    "  "    bitb  X00A2
DE20 : AA AA    "  "    oraa  $AA,x
DE22 : AA AA    "  "    oraa  $AA,x
DE24        LDE24:
DE24 : 7A 5B 55    "z[U"    dec  X5B55
DE27 : 81 54    " T"    cmpa  #$54
        ;
DE29 : 00    " "    db  $00
        ;
DE2A : 10    " "    sba
DE2B        LDE2B:
DE2B : BD AA 96    "   "    jsr  LAA96
DE2E : DA DB    "  "    orab  X00DB
DE30 : 57    "W"    asrb
        ;
DE31 : 5B    "["    db  $5B
        ;
DE32 : 6D 6D    "mm"    tst  $6D,x
        ;
DE34 : 55 45    "UE"    db  $55, $45
        ;
DE36 : 4A    "J"    deca
DE37 : 92 2A    " *"    sbca  X002A
DE39 : BB 6B 55    " kU"    adda  X6B55
DE3C : 2D 50    "-P"    blt  LDE8E
DE3E : A2 AA    "  "    sbca  $AA,x
        ;
DE40 : 52 51    "RQ"    db  $52, $51
        ;
DE42 : 40    "@"    nega
DE43 : AA AA    "  "    oraa  $AA,x
DE45 : 95 B6    "  "    bita  X00B6
DE47 : EE DD    "  "    ldx  $DD,x
DE49 : DE AD    "  "    ldx  X00AD
        ;
DE4B : 55 55    "UU"    db  $55, $55
        ;
DE4D : 6D 55    "mU"    tst  $55,x
        ;
DE4F : 45    "E"    db  $45
        ;
DE50 : 29 48    ")H"    bvs  LDE9A
DE52 : A9 AA    "  "    adca  $AA,x
DE54 : 92 4A    " J"    sbca  X004A
DE56 : B5 7D AB    " } "    bita  X7DAB
DE59 : 2A 52    "*R"    bpl  LDEAD
DE5B : 25 09    "% "    bcs  LDE66
DE5D : 24 51    "$Q"    bcc  LDEB0
DE5F : A9 DA    "  "    adca  $DA,x
        ;
DE61 : FD    " "    db  $FD
        ;
DE62 : BD 5D B5    " ] "    jsr  L5DB5
DE65 : 56    "V"    rorb
DE66        LDE66:
DE66 : 89 AA    "  "    adca  #$AA
DE68 : AA 24    " $"    oraa  $24,x
DE6A : 92 AA    "  "    sbca  X00AA
DE6C : 5A    "Z"    decb
DE6D : AB 6E    " n"    adda  $6E,x
DE6F : 6D 5B    "m["    tst  $5B,x
DE71 : AD 82    "  "    jsr  $82,x            ;INFO: index jump
DE73 : 88 28    " ("    eora  #$28
DE75 : 95 92    "  "    bita  X0092
DE77 : 92 24    " $"    sbca  X0024
DE79 : 95 76    " v"    bita  X0076
DE7B : BF AA 76    "  v"    sts  XAA76
DE7E : BB B5 B5    "   "    adda  XB5B5
DE81 : BD 55 41    " UA"    jsr  L5541
DE84 : A4 54    " T"    anda  $54,x
        ;
DE86 : 55 55    "UU"    db  $55, $55
DE88        XDE88:
DE88 : 55 55    "UU"    db  $55, $55
        ;
DE8A : AB 5E    " ^"    adda  $5E,x
DE8C : 29 22    ")""    bvs  LDEB0
DE8E        LDE8E:
DE8E : A9 AA    "  "    adca  $AA,x
        ;
DE90 : 12    " "    db  $12
        ;
DE91 : 89 04    "  "    adca  #$04
DE93 : 94 D4    "  "    anda  X00D4
DE95 : B6 F6 DD    "   "    ldaa  XF6DD
DE98 : B7 ED DA    "   "    staa  XEDDA
DE9B : 5A    "Z"    decb
DE9C : AB 12    "  "    adda  $12,x
DE9E : 4A    "J"    deca
DE9F : 95 52    " R"    bita  X0052
DEA1 : AA AA    "  "    oraa  $AA,x
DEA3 : 6A 55    "jU"    dec  $55,x
DEA5 : AA AA    "  "    oraa  $AA,x
DEA7 : 22 25    ""%"    bhi  LDECE
DEA9        LDEA9:
DEA9 : 29 80    ") "    bvs  LDE2B
DEAB : 4A    "J"    deca
        ;
DEAC : 55    "U"    db  $55
        ;
DEAD        LDEAD:
DEAD : 4A    "J"    deca
DEAE : 95 F6    "  "    bita  X00F6
DEB0        LDEB0:
DEB0 : BB DB 20    "   "    adda  XDB20
DEB3 : B6 5B 6B    " [k"    ldaa  X5B6B
DEB6        XDEB6:
DEB6 : A5 8A    "  "    bita  $8A,x
DEB8 : 54    "T"    lsrb
DEB9 : AA 92    "  "    oraa  $92,x
        ;
DEBB        XDEBB:
DEBB : 52    "R"    db  $52
        ;
DEBC : AA AA    "  "    oraa  $AA,x
DEBE : 56    "V"    rorb
DEBF : 95 AA    "  "    bita  X00AA
DEC1 : 2A 90    "* "    bpl  LDE53
DEC3 : 94 52    " R"    anda  X0052
DEC5 : A5 AA    "  "    bita  $AA,x
DEC7 : AA AA    "  "    oraa  $AA,x
DEC9 : 4A    "J"    deca
        ;
DECA : 55    "U"    db  $55
        ;
DECB : B7 AF BB    "   "    staa  XAFBB
DECE        LDECE:
DECE : BD DB 6A    "  j"    jsr  LDB6A
        ;
DED1 : 55    "U"    db  $55
        ;
DED2 : AB 8A    "  "    adda  $8A,x
DED4 : 4A    "J"    deca
DED5 : 4A    "J"    deca
        ;
DED6 : 55    "U"    db  $55
        ;
DED7 : A9 52    " R"    adca  $52,x
DED9 : 92 0A    "  "    sbca  X000A
DEDB : 48    "H"    asla
DEDC : A9 AA    "  "    adca  $AA,x
        ;
DEDE : 52    "R"    db  $52
        ;
DEDF : 49    "I"    rola
DEE0 : D5 52    " R"    bitb  X0052
        ;
DEE2 : 4B    "K"    db  $4B
        ;
DEE3 : AA AA    "  "    oraa  $AA,x
DEE5 : AA F5    "  "    oraa  $F5,x
        ;
DEE7 : 75    "u"    db  $75
        ;
DEE8 : DB 6D    " m"    addb  X006D
DEEA : DB DB    "  "    addb  X00DB
DEEC : 5A    "Z"    decb
        ;
DEED : 55 15    "U "    db  $55, $15
        ;
DEEF : 92 A4    "  "    sbca  X00A4
DEF1 : A4 4A    " J"    anda  $4A,x
DEF3 : 8A A4    "  "    oraa  #$A4
DEF5 : 4A    "J"    deca
        ;
DEF6 : 55    "U"    db  $55
        ;
DEF7 : A9 AA    "  "    adca  $AA,x
DEF9 : AA AA    "  "    oraa  $AA,x
DEFB : AB AA    "  "    adda  $AA,x
DEFD : 2A AA    "* "    bpl  LDEA9
DEFF : 4A    "J"    deca
        ;
DF00 : 55    "U"    db  $55
        ;
DF01 : D5 AA    "  "    bitb  X00AA
DF03 : 76 BF DB    "v  "    ror  XBFDB
DF06 : B6 D6 5A    "  Z"    ldaa  XD65A
DF09 : AB 22    " ""    adda  $22,x
DF0B : 91 92    "  "    cmpa  X0092
DF0D : 24 91    "$ "    bcc  LDEA0
DF0F : 92 2A    " *"    sbca  X002A
        ;
DF11 : 55    "U"    db  $55
        ;
DF12 : D5 FF    "  "    bitb  X00FF
DF14 : FF FF FF    "   "    stx  XFFFF
DF17 : FF FF FF    "   "    stx  XFFFF
DF1A : FF FF FF    "   "    stx  XFFFF
DF1D : FF FF FF    "   "    stx  XFFFF
DF20 : FF FF FF    "   "    stx  XFFFF
DF23 : FF FF FF    "   "    stx  XFFFF
DF26 : FF FF FF    "   "    stx  XFFFF
DF29 : FF FF FF    "   "    stx  XFFFF
DF2C : FF FF FF    "   "    stx  XFFFF
DF2F : FF FF FF    "   "    stx  XFFFF
DF32 : FF FF FF    "   "    stx  XFFFF
DF35 : FF FF FF    "   "    stx  XFFFF
DF38 : FF FF FF    "   "    stx  XFFFF
DF3B : FF FF FF    "   "    stx  XFFFF
DF3E : FF FF FF    "   "    stx  XFFFF
DF41 : FF FF FF    "   "    stx  XFFFF
DF44 : FF FF FF    "   "    stx  XFFFF
DF47 : FF FF FF    "   "    stx  XFFFF
DF4A : FF FF FF    "   "    stx  XFFFF
DF4D : FF FF FF    "   "    stx  XFFFF
DF50 : FF FF FF    "   "    stx  XFFFF
DF53 : FF FF FF    "   "    stx  XFFFF
DF56 : FF FF FF    "   "    stx  XFFFF
DF59 : FF FF FF    "   "    stx  XFFFF
DF5C : FF FF FF    "   "    stx  XFFFF
DF5F : FF FF FF    "   "    stx  XFFFF
DF62 : FF FF FF    "   "    stx  XFFFF
DF65 : FF FF FF    "   "    stx  XFFFF
DF68 : FF FF FF    "   "    stx  XFFFF
DF6B : FF FF FF    "   "    stx  XFFFF
DF6E : FF FF FF    "   "    stx  XFFFF
DF71 : FF FF FF    "   "    stx  XFFFF
DF74 : FF FF FF    "   "    stx  XFFFF
DF77 : FF FF FF    "   "    stx  XFFFF
DF7A : FF FF FF    "   "    stx  XFFFF
DF7D : FF FF FF    "   "    stx  XFFFF
DF80 : FF FF FF    "   "    stx  XFFFF
DF83 : FF FF FF    "   "    stx  XFFFF
DF86 : FF FF FF    "   "    stx  XFFFF
DF89 : FF FF FF    "   "    stx  XFFFF
DF8C : FF FF FF    "   "    stx  XFFFF
DF8F : FF FF FF    "   "    stx  XFFFF
DF92 : FF FF FF    "   "    stx  XFFFF
DF95 : FF FF FF    "   "    stx  XFFFF
DF98 : FF FF FF    "   "    stx  XFFFF
DF9B : FF FF FF    "   "    stx  XFFFF
DF9E : FF FF FF    "   "    stx  XFFFF
DFA1 : FF FF FF    "   "    stx  XFFFF
DFA4 : FF FF FF    "   "    stx  XFFFF
DFA7 : FF FF FF    "   "    stx  XFFFF
DFAA : FF FF FF    "   "    stx  XFFFF
DFAD : FF FF FF    "   "    stx  XFFFF
DFB0 : FF FF FF    "   "    stx  XFFFF
DFB3 : FF FF FF    "   "    stx  XFFFF
DFB6 : FF FF FF    "   "    stx  XFFFF
DFB9 : FF FF FF    "   "    stx  XFFFF
DFBC : FF FF FF    "   "    stx  XFFFF
DFBF : FF FF FF    "   "    stx  XFFFF
DFC2 : FF FF FF    "   "    stx  XFFFF
DFC5 : FF FF FF    "   "    stx  XFFFF
DFC8 : FF FF FF    "   "    stx  XFFFF
DFCB : FF FF FF    "   "    stx  XFFFF
DFCE : FF FF FF    "   "    stx  XFFFF
DFD1 : FF FF FF    "   "    stx  XFFFF
DFD4 : FF FF FF    "   "    stx  XFFFF
DFD7 : FF FF FF    "   "    stx  XFFFF
DFDA : FF FF FF    "   "    stx  XFFFF
DFDD : FF FF FF    "   "    stx  XFFFF
DFE0 : FF FF FF    "   "    stx  XFFFF
DFE3 : FF FF FF    "   "    stx  XFFFF
DFE6 : FF FF FF    "   "    stx  XFFFF
DFE9 : FF FF FF    "   "    stx  XFFFF
DFEC : FF FF FF    "   "    stx  XFFFF
DFEF : FF FF FF    "   "    stx  XFFFF
DFF2 : FF FF FF    "   "    stx  XFFFF
DFF5 : FF FF FF    "   "    stx  XFFFF
DFF8 : FF FF FF    "   "    stx  XFFFF
DFFB : FF FF FF    "   "    stx  XFFFF
DFFE : FF FF FF    "   "    stx  XFFFF
E001        XE001:
E001 : FF FF FF    "   "    stx  XFFFF
E004 : FF FF FF    "   "    stx  XFFFF
E007 : FF FF FF    "   "    stx  XFFFF
E00A : FF FF FF    "   "    stx  XFFFF
E00D : FF FF FF    "   "    stx  XFFFF
E010 : FF FF FF    "   "    stx  XFFFF
E013 : FF FF FF    "   "    stx  XFFFF
E016 : FF FF FF    "   "    stx  XFFFF
E019 : FF FF FF    "   "    stx  XFFFF
E01C : FF FF FF    "   "    stx  XFFFF
E01F : FF FF FF    "   "    stx  XFFFF
E022 : FF FF FF    "   "    stx  XFFFF
E025 : FF FF FF    "   "    stx  XFFFF
E028 : FF FF FF    "   "    stx  XFFFF
E02B : FF FF FF    "   "    stx  XFFFF
E02E : FF FF FF    "   "    stx  XFFFF
E031 : FF FF FF    "   "    stx  XFFFF
E034 : FF FF FF    "   "    stx  XFFFF
E037 : FF FF FF    "   "    stx  XFFFF
E03A : FF FF FF    "   "    stx  XFFFF
E03D : FF FF FF    "   "    stx  XFFFF
E040 : FF FF FF    "   "    stx  XFFFF
E043 : FF FF FF    "   "    stx  XFFFF
E046 : FF FF FF    "   "    stx  XFFFF
E049 : FF FF FF    "   "    stx  XFFFF
E04C : FF FF FF    "   "    stx  XFFFF
E04F : FF FF FF    "   "    stx  XFFFF
E052 : FF FF FF    "   "    stx  XFFFF
E055 : FF FF FF    "   "    stx  XFFFF
E058 : FF FF FF    "   "    stx  XFFFF
E05B : FF FF FF    "   "    stx  XFFFF
E05E : FF FF FF    "   "    stx  XFFFF
E061 : FF FF FF    "   "    stx  XFFFF
E064 : FF FF FF    "   "    stx  XFFFF
E067 : FF FF FF    "   "    stx  XFFFF
E06A : FF FF FF    "   "    stx  XFFFF
E06D : FF FF FF    "   "    stx  XFFFF
E070 : FF FF FF    "   "    stx  XFFFF
E073 : FF FF FF    "   "    stx  XFFFF
E076 : FF FF FF    "   "    stx  XFFFF
E079 : FF FF FF    "   "    stx  XFFFF
E07C        LE07C:
E07C : FF FF FF    "   "    stx  XFFFF
E07F : FF FF FF    "   "    stx  XFFFF
E082 : FF FF FF    "   "    stx  XFFFF
E085 : FF FF FF    "   "    stx  XFFFF
E088 : FF FF FF    "   "    stx  XFFFF
E08B : FF FF FF    "   "    stx  XFFFF
E08E : FF FF FF    "   "    stx  XFFFF
E091        XE091:
E091 : FF FF FF    "   "    stx  XFFFF
E094 : FF FF FF    "   "    stx  XFFFF
E097 : FF FF FF    "   "    stx  XFFFF
E09A : FF FF FF    "   "    stx  XFFFF
E09D : FF FF FF    "   "    stx  XFFFF
E0A0 : FF FF FF    "   "    stx  XFFFF
E0A3 : FF FF FF    "   "    stx  XFFFF
E0A6 : FF FF FF    "   "    stx  XFFFF
E0A9 : FF FF FF    "   "    stx  XFFFF
E0AC : FF FF FF    "   "    stx  XFFFF
E0AF : FF FF FF    "   "    stx  XFFFF
E0B2 : FF FF FF    "   "    stx  XFFFF
E0B5 : FF FF FF    "   "    stx  XFFFF
E0B8 : FF FF FF    "   "    stx  XFFFF
E0BB : FF FF FF    "   "    stx  XFFFF
E0BE : FF FF FF    "   "    stx  XFFFF
E0C1 : FF FF FF    "   "    stx  XFFFF
E0C4 : FF FF FF    "   "    stx  XFFFF
E0C7 : FF FF FF    "   "    stx  XFFFF
E0CA : FF FF FF    "   "    stx  XFFFF
E0CD : FF FF FF    "   "    stx  XFFFF
E0D0 : FF FF FF    "   "    stx  XFFFF
E0D3 : FF FF FF    "   "    stx  XFFFF
E0D6 : FF FF FF    "   "    stx  XFFFF
E0D9 : FF FF FF    "   "    stx  XFFFF
E0DC        XE0DC:
E0DC : FF FF FF    "   "    stx  XFFFF
E0DF : FF FF FF    "   "    stx  XFFFF
E0E2 : FF FF FF    "   "    stx  XFFFF
E0E5 : FF FF FF    "   "    stx  XFFFF
E0E8 : FF FF FF    "   "    stx  XFFFF
E0EB : FF FF FF    "   "    stx  XFFFF
E0EE : FF FF FF    "   "    stx  XFFFF
E0F1 : FF FF FF    "   "    stx  XFFFF
E0F4 : FF FF FF    "   "    stx  XFFFF
E0F7 : FF FF FF    "   "    stx  XFFFF
E0FA : FF FF FF    "   "    stx  XFFFF
E0FD : FF FF FF    "   "    stx  XFFFF
E100 : FF FF FF    "   "    stx  XFFFF
E103        XE103:
E103 : FF FF FF    "   "    stx  XFFFF
E106 : FF FF FF    "   "    stx  XFFFF
E109 : FF FF FF    "   "    stx  XFFFF
E10C : FF FF FF    "   "    stx  XFFFF
E10F : FF FF FF    "   "    stx  XFFFF
E112 : FF FF FF    "   "    stx  XFFFF
E115 : FF FF FF    "   "    stx  XFFFF
E118 : FF FF FF    "   "    stx  XFFFF
E11B : FF FF FF    "   "    stx  XFFFF
E11E : FF FF FF    "   "    stx  XFFFF
E121 : FF FF FF    "   "    stx  XFFFF
E124 : FF FF FF    "   "    stx  XFFFF
E127 : FF FF FF    "   "    stx  XFFFF
E12A : FF FF FF    "   "    stx  XFFFF
E12D : FF FF FF    "   "    stx  XFFFF
E130 : FF FF FF    "   "    stx  XFFFF
E133 : FF FF FF    "   "    stx  XFFFF
E136 : FF FF FF    "   "    stx  XFFFF
E139 : FF FF FF    "   "    stx  XFFFF
E13C : FF FF FF    "   "    stx  XFFFF
E13F : FF FF FF    "   "    stx  XFFFF
E142 : FF FF FF    "   "    stx  XFFFF
E145 : FF FF FF    "   "    stx  XFFFF
E148 : FF FF FF    "   "    stx  XFFFF
E14B : FF FF FF    "   "    stx  XFFFF
E14E : FF FF FF    "   "    stx  XFFFF
E151 : FF FF FF    "   "    stx  XFFFF
E154 : FF FF FF    "   "    stx  XFFFF
E157 : FF FF FF    "   "    stx  XFFFF
E15A : FF FF FF    "   "    stx  XFFFF
E15D : FF FF FF    "   "    stx  XFFFF
E160 : FF FF FF    "   "    stx  XFFFF
E163 : FF FF FF    "   "    stx  XFFFF
E166 : FF FF FF    "   "    stx  XFFFF
E169 : FF FF FF    "   "    stx  XFFFF
E16C : FF FF FF    "   "    stx  XFFFF
E16F : FF FF FF    "   "    stx  XFFFF
E172 : FF FF FF    "   "    stx  XFFFF
E175 : FF FF FF    "   "    stx  XFFFF
E178 : FF FF FF    "   "    stx  XFFFF
E17B : FF FF FF    "   "    stx  XFFFF
E17E : FF FF FF    "   "    stx  XFFFF
E181 : FF FF FF    "   "    stx  XFFFF
E184 : FF FF FF    "   "    stx  XFFFF
E187 : FF FF FF    "   "    stx  XFFFF
E18A        XE18A:
E18A : FF FF FF    "   "    stx  XFFFF
E18D : FF FF FF    "   "    stx  XFFFF
E190 : FF FF FF    "   "    stx  XFFFF
E193 : FF FF FF    "   "    stx  XFFFF
E196 : FF FF FF    "   "    stx  XFFFF
E199 : FF FF FF    "   "    stx  XFFFF
E19C : FF FF FF    "   "    stx  XFFFF
E19F : FF FF FF    "   "    stx  XFFFF
E1A2 : FF FF FF    "   "    stx  XFFFF
E1A5 : FF FF FF    "   "    stx  XFFFF
E1A8 : FF FF FF    "   "    stx  XFFFF
E1AB : FF FF FF    "   "    stx  XFFFF
E1AE : FF FF FF    "   "    stx  XFFFF
E1B1 : FF FF FF    "   "    stx  XFFFF
E1B4 : FF FF FF    "   "    stx  XFFFF
E1B7 : FF FF FF    "   "    stx  XFFFF
E1BA : FF FF FF    "   "    stx  XFFFF
E1BD : FF FF FF    "   "    stx  XFFFF
E1C0 : 7E E2 27    "~ '"    jmp  LE227
E1C3        LE1C3:
E1C3 : 7E E2 1A    "~  "    jmp  LE21A
        ;
E1C6 : A4 34    " 4"    anda  $34,x
E1C8 : AF 52    " R"    sts  $52,x
E1CA : 97 54    " T"    staa  X0054
E1CC : A4 34    " 4"    anda  $34,x
        ;
E1CE : D3 CD    "  "    db  $D3, $CD
        ;
E1D0 : D6 92    "  "    ldab  X0092
E1D2 : 80 00    "  "    suba  #$00
        ;
E1D4 : 83 CF 83 CF  "    "    db  $83, $CF, $83, $CF
E1D8 : 87    " "    db  $87
        ;
E1D9 : 9E 87    "  "    lds  X0087
E1DB : 9E 8B    "  "    lds  X008B
E1DD : 49    "I"    rola
E1DE : 8B 49    " I"    adda  #$49
E1E0 : 8E D4 8E    "   "    lds  #$D48E
E1E3 : D4 94    "  "    andb  X0094
E1E5 : D4 94    "  "    andb  X0094
E1E7 : D4 97    "  "    andb  X0097
E1E9 : 54    "T"    lsrb
E1EA : A4 34    " 4"    anda  $34,x
E1EC : AF 52    " R"    sts  $52,x
E1EE : AF 52    " R"    sts  $52,x
E1F0 : BD 91 BD    "   "    jsr  L91BD
E1F3 : 91 C5    "  "    cmpa  X00C5
E1F5 : B1 D3 CD    "   "    cmpa  XD3CD
E1F8 : D6 92    "  "    ldab  X0092
E1FA : D6 92    "  "    ldab  X0092
E1FC : DF 13    "  "    stx  X0013
E1FE : D8 6D    " m"    eorb  X006D
E200 : DF 13    "  "    stx  X0013
E202 : D9 9B    "  "    adcb  X009B
E204 : DF 13    "  "    stx  X0013
E206 : D9 D2    "  "    adcb  X00D2
E208 : DF 13    "  "    stx  X0013
E20A : BD 91 C5    "   "    jsr  L91C5
E20D : B1 AF 52    "  R"    cmpa  XAF52
E210 : BD 91 C5    "   "    jsr  L91C5
E213 : B1 D3 CD    "   "    cmpa  XD3CD
        ;
E216 : D3 CD    "  "    db  $D3, $CD
        ;
E218 : D6 92    "  "    ldab  X0092
E21A        LE21A:
E21A : CE 80 00    "   "    ldx  #$8000
E21D : DF 00    "  "    stx  X0000
E21F : CE DF 13    "   "    ldx  #$DF13
E222 : DF 02    "  "    stx  X0002
E224 : 7E E2 D9    "~  "    jmp  LE2D9
        ;
E227        LE227:
E227 : CE E3 6E    "  n"    ldx  #$E36E
E22A : 84 1F    "  "    anda  #$1F
E22C : 27 10    "' "    beq  LE23E
E22E : 81 18    "  "    cmpa  #$18
E230 : 2C 28    ",("    bge  LE25A
E232        LE232:
E232 : 08    " "    inx
E233 : E6 00    "  "    ldab  $00,x
E235 : 26 FB    "& "    bne  LE232
E237 : E6 01    "  "    ldab  $01,x
E239 : 26 F7    "& "    bne  LE232
E23B : 4A    "J"    deca
E23C : 26 F4    "& "    bne  LE232
E23E        LE23E:
E23E : 08    " "    inx
E23F : 08    " "    inx
E240        LE240:
E240 : DF 05    "  "    stx  X0005
E242        LE242:
E242 : DE 05    "  "    ldx  X0005
E244 : A6 00    "  "    ldaa  $00,x
E246 : 27 12    "' "    beq  LE25A
E248 : 2A 11    "* "    bpl  LE25B
E24A : E6 01    "  "    ldab  $01,x
E24C        LE24C:
E24C : 6D 00    "m "    tst  $00,x
E24E : 6D 00    "m "    tst  $00,x
E250 : 5C    "\"    incb
E251 : 26 F9    "& "    bne  LE24C
E253 : 4C    "L"    inca
E254 : 26 F6    "& "    bne  LE24C
E256 : 08    " "    inx
E257 : 08    " "    inx
E258 : 20 E6    "  "    bra  LE240
E25A        LE25A:
E25A : 39    "9"    rts
        ;
E25B        LE25B:
E25B : 08    " "    inx
E25C : DF 05    "  "    stx  X0005
E25E : 16    " "    tab
E25F : 8B BF    "  "    adda  #$BF
E261 : 97 01    "  "    staa  X0001
E263 : 86 E1    "  "    ldaa  #$E1
E265 : 89 00    "  "    adca  #$00
E267 : 97 00    "  "    staa  X0000
E269 : DE 00    "  "    ldx  X0000
E26B : A6 03    "  "    ldaa  $03,x
E26D : 97 03    "  "    staa  X0003
E26F : A6 02    "  "    ldaa  $02,x
E271 : 97 02    "  "    staa  X0002
E273 : A6 01    "  "    ldaa  $01,x
E275 : 97 01    "  "    staa  X0001
E277 : A6 00    "  "    ldaa  $00,x
E279 : 97 00    "  "    staa  X0000
E27B : C1 13    "  "    cmpb  #$13
E27D : 25 0E    "% "    bcs  LE28D
E27F : C1 4B    " K"    cmpb  #$4B
E281 : 25 05    "% "    bcs  LE288
E283 : BD E3 21    "  !"    jsr  LE321
E286 : 20 BA    "  "    bra  LE242
        ;
E288        LE288:
E288 : BD E2 D9    "   "    jsr  LE2D9
E28B : 20 B5    "  "    bra  LE242
        ;
E28D        LE28D:
E28D : BD E2 92    "   "    jsr  LE292
E290 : 20 B0    "  "    bra  LE242
        ;
E292        LE292:
E292 : DE 00    "  "    ldx  X0000
E294 : 5F    "_"    clrb
E295 : 0D    " "    sec
E296        LE296:
E296 : 59    "Y"    rolb
E297 : 01    " "    nop
E298 : A6 00    "  "    ldaa  $00,x
E29A : 08    " "    inx
E29B : 97 04    "  "    staa  X0004
E29D        LE29D:
E29D : 86 37    " 7"    ldaa  #$37
E29F : B7 20 01    "   "    staa  X2001
E2A2 : 86 34    " 4"    ldaa  #$34
E2A4 : D5 04    "  "    bitb  X0004
E2A6 : 26 15    "& "    bne  LE2BD
E2A8 : B7 20 03    "   "    staa  X2003
E2AB : 01    " "    nop
E2AC : 86 3F    " ?"    ldaa  #$3F
E2AE : B7 20 01    "   "    staa  X2001
E2B1 : 58    "X"    aslb
E2B2 : 25 E2    "% "    bcs  LE296
E2B4 : 2A 1D    "* "    bpl  LE2D3
E2B6 : A6 00    "  "    ldaa  $00,x
E2B8 : 9C 02    "  "    cpx  X0002
E2BA : 26 E1    "& "    bne  LE29D
E2BC        LE2BC:
E2BC : 39    "9"    rts
        ;
E2BD        LE2BD:
E2BD : 86 3C    " <"    ldaa  #$3C
E2BF : B7 20 03    "   "    staa  X2003
E2C2 : 86 3F    " ?"    ldaa  #$3F
E2C4        XE2C4:
E2C4 : B7 20 01    "   "    staa  X2001
E2C7 : 58    "X"    aslb
E2C8 : 25 CC    "% "    bcs  LE296
E2CA : 2A 07    "* "    bpl  LE2D3
E2CC        XE2CC:
E2CC : A6 00    "  "    ldaa  $00,x
E2CE : 9C 02    "  "    cpx  X0002
E2D0 : 26 CB    "& "    bne  LE29D
E2D2 : 39    "9"    rts
        ;
E2D3        LE2D3:
E2D3 : 01    " "    nop
E2D4 : 01    " "    nop
E2D5 : A6 00    "  "    ldaa  $00,x
E2D7 : 20 C4    "  "    bra  LE29D
        ;
E2D9        LE2D9:
E2D9 : DE 00    "  "    ldx  X0000
E2DB : 5F    "_"    clrb
E2DC        XE2DC:
E2DC : 0D    " "    sec
E2DD        LE2DD:
E2DD : 59    "Y"    rolb
E2DE : 01    " "    nop
E2DF : A6 00    "  "    ldaa  $00,x
E2E1 : 08    " "    inx
E2E2 : 97 04    "  "    staa  X0004
E2E4        LE2E4:
E2E4 : 01    " "    nop
E2E5 : 86 37    " 7"    ldaa  #$37
E2E7 : B7 20 01    "   "    staa  X2001
E2EA : 86 34    " 4"    ldaa  #$34
E2EC : D5 04    "  "    bitb  X0004
E2EE : 26 15    "& "    bne  LE305
E2F0 : B7 20 03    "   "    staa  X2003
E2F3 : 01    " "    nop
E2F4 : 86 3F    " ?"    ldaa  #$3F
E2F6 : B7 20 01    "   "    staa  X2001
E2F9 : 58    "X"    aslb
E2FA : 25 E1    "% "    bcs  LE2DD
E2FC : 2A 1D    "* "    bpl  LE31B
E2FE : A6 00    "  "    ldaa  $00,x
E300 : 9C 02    "  "    cpx  X0002
E302 : 26 E0    "& "    bne  LE2E4
E304 : 39    "9"    rts
        ;
E305        LE305:
E305 : 86 3C    " <"    ldaa  #$3C
E307 : B7 20 03    "   "    staa  X2003
E30A : 86 3F    " ?"    ldaa  #$3F
E30C : B7 20 01    "   "    staa  X2001
E30F : 58    "X"    aslb
E310 : 25 CB    "% "    bcs  LE2DD
E312 : 2A 07    "* "    bpl  LE31B
E314 : A6 00    "  "    ldaa  $00,x
E316 : 9C 02    "  "    cpx  X0002
E318 : 26 CA    "& "    bne  LE2E4
E31A : 39    "9"    rts
        ;
E31B        LE31B:
E31B : 01    " "    nop
E31C : 01    " "    nop
E31D : A6 00    "  "    ldaa  $00,x
E31F : 20 C3    "  "    bra  LE2E4
        ;
E321        LE321:
E321 : DE 00    "  "    ldx  X0000
E323 : 5F    "_"    clrb
E324 : 0D    " "    sec
E325        LE325:
E325 : 59    "Y"    rolb
E326 : 01    " "    nop
E327 : A6 00    "  "    ldaa  $00,x
E329 : 08    " "    inx
E32A : 97 04    "  "    staa  X0004
E32C        LE32C:
E32C : 01    " "    nop
E32D : 01    " "    nop
E32E : 01    " "    nop
E32F : 01    " "    nop
E330 : 01    " "    nop
E331 : 7E E3 34    "~ 4"    jmp  LE334
        ;
E334        LE334:
E334 : 86 37    " 7"    ldaa  #$37
E336 : B7 20 01    "   "    staa  X2001
E339 : 86 34    " 4"    ldaa  #$34
E33B : D5 04    "  "    bitb  X0004
E33D : 26 15    "& "    bne  LE354
E33F : B7 20 03    "   "    staa  X2003
E342 : 01    " "    nop
E343 : 86 3F    " ?"    ldaa  #$3F
E345 : B7 20 01    "   "    staa  X2001
E348 : 58    "X"    aslb
E349 : 25 DA    "% "    bcs  LE325
E34B : 2A 1D    "* "    bpl  LE36A
E34D : A6 00    "  "    ldaa  $00,x
E34F : 9C 02    "  "    cpx  X0002
E351 : 26 D9    "& "    bne  LE32C
E353 : 39    "9"    rts
        ;
E354        LE354:
E354 : 86 3C    " <"    ldaa  #$3C
E356 : B7 20 03    "   "    staa  X2003
E359 : 86 3F    " ?"    ldaa  #$3F
E35B : B7 20 01    "   "    staa  X2001
E35E : 58    "X"    aslb
E35F : 25 C4    "% "    bcs  LE325
E361 : 2A 07    "* "    bpl  LE36A
E363 : A6 00    "  "    ldaa  $00,x
E365 : 9C 02    "  "    cpx  X0002
E367 : 26 C3    "& "    bne  LE32C
E369 : 39    "9"    rts
        ;
E36A        LE36A:
E36A : 01    " "    nop
E36B : 01    " "    nop
E36C : A6 00    "  "    ldaa  $00,x
E36E : 20 BC    "  "    bra  LE32C
        ;
E370 : 07    " "    tpa
        ;
E371 : 00 00    "  "    db  $00, $00
        ;
E373 : 53    "S"    comb
        ;
E374 : 00 00    "  "    db  $00, $00
        ;
E376 : 0B    " "    sev
        ;
E377 : 4B 00 00    "K  "    db  $4B, $00, $00
        ;
E37A : 2F 00    "/ "    ble  LE37C
        ;
E37C        LE37C:
E37C : 00 1F 13 00  "    "    db  $00, $1F, $13, $00
E380 : 00 1F    "  "    db  $00, $1F
        ;
E382 : 17    " "    tba
        ;
E383 : 00 00 1F    "   "    db  $00, $00, $1F
        ;
E386 : 1B    " "    aba
        ;
E387 : 00 00    "  "    db  $00, $00
        ;
E389 : 17    " "    tba
E38A : 1B    " "    aba
        ;
E38B : 00 00 1F 13  "    "    db  $00, $00, $1F, $13
E38F : FD    " "    db  $FD
        ;
E390 : 01    " "    nop
E391 : 17    " "    tba
E392 : 1B    " "    aba
        ;
E393 : 00 00 13 00  "    "    db  $00, $00, $13, $00
E397 : 00 1F 00 00  "    "    db  $00, $1F, $00, $00
        ;
E39B : 1B    " "    aba
        ;
E39C : 00 00    "  "    db  $00, $00
        ;
E39E : 23 00    "# "    bls  LE3A0
        ;
E3A0        LE3A0:
E3A0 : 00    " "    db  $00
        ;
E3A1 : 23 27    "#'"    bls  LE3CA
E3A3 : 27 27    "''"    beq  LE3CC
        ;
E3A5 : 00 00    "  "    db  $00, $00
        ;
E3A7 : 3F    "?"    swi
        ;
E3A8 : 00 00    "  "    db  $00, $00
        ;
E3AA : 3B    ";"    rti
        ;
E3AB : 00 00    "  "    db  $00, $00
        ;
E3AD : 57    "W"    asrb
        ;
E3AE : 00 00    "  "    db  $00, $00
        ;
E3B0 : 37    "7"    pshb
        ;
E3B1 : 00 00    "  "    db  $00, $00
        ;
E3B3 : 0F    " "    sei
        ;
E3B4 : 00 00    "  "    db  $00, $00
        ;
E3B6 : 0F    " "    sei
        ;
E3B7 : 00 00    "  "    db  $00, $00
        ;
E3B9 : FF FF FF    "   "    stx  XFFFF
E3BC : FF FF FF    "   "    stx  XFFFF
E3BF : FF 15 
;*************************************;
;Reset and setup power on
;*************************************;
;RESET
E3C1 : 0F         sei                 ;set interrupt mask I=1  
E3C2 : 8E 00 7F    "   "    lds  #$007F
E3C5 : CE 20 00    "   "    ldx  #$2000
E3C8 : 6F 01    "o "    clr  $01,x
E3CA        LE3CA:
E3CA : 6F 03    "o "    clr  $03,x
E3CC        LE3CC:
E3CC : 86 FF    "  "    ldaa  #$FF
E3CE : A7 02    "  "    staa  $02,x
E3D0 : 6F 00    "o "    clr  $00,x
E3D2 : 86 37    " 7"    ldaa  #$37
E3D4 : A7 01    "  "    staa  $01,x
E3D6 : 86 3C    " <"    ldaa  #$3C
E3D8 : A7 03    "  "    staa  $03,x
E3DA : 6F 00    "o "    clr  $00,x
E3DC : CE 00 00    "   "    ldx  #$0000
E3DF : 86 80    "  "    ldaa  #$80
E3E1        LE3E1:
E3E1 : 6F 00    "o "    clr  $00,x
E3E3 : 08    " "    inx
E3E4 : 4A    "J"    deca
E3E5 : 26 FA    "& "    bne  LE3E1
E3E7 : 9F 61    " a"    sts  X0061
E3E9 : 0E    " "    cli
E3EA        LE3EA:
E3EA : 20 FE    "  "    bra  LE3EA
E3EC        LE3EC:
E3EC : 7E F0 06    "~  "    jmp  LF006
        ;
E3EF : C6 10    "  "    ldab  #$10
E3F1 : CE 00 00    "   "    ldx  #$0000
E3F4 : DF 70    " p"    stx  X0070
E3F6 : CE F4 EE    "   "    ldx  #$F4EE
E3F9        LE3F9:
E3F9 : C6 10    "  "    ldab  #$10
E3FB : 4D    "M"    tsta
E3FC : 27 07    "' "    beq  LE405
E3FE        LE3FE:
E3FE : 08    " "    inx
E3FF : 5A    "Z"    decb
E400 : 26 FC    "& "    bne  LE3FE
E402 : 4A    "J"    deca
E403 : 26 F4    "& "    bne  LE3F9
E405        LE405:
E405 : C6 10    "  "    ldab  #$10
E407 : BD EE A6    "   "    jsr  LEEA6
E40A : 96 08    "  "    ldaa  X0008
E40C : B7 20 02    "   "    staa  X2002
E40F : D6 00    "  "    ldab  X0000
E411        LE411:
E411 : 7A 00 07    "z  "    dec  X0007
E414 : 27 D6    "' "    beq  LE3EC
E416 : DE 0C    "  "    ldx  X000C
E418        LE418:
E418 : 96 02    "  "    ldaa  X0002
E41A        LE41A:
E41A : 4A    "J"    deca
E41B : 26 FD    "& "    bne  LE41A
E41D : 96 01    "  "    ldaa  X0001
E41F        LE41F:
E41F : 4A    "J"    deca
E420 : 26 FD    "& "    bne  LE41F
E422 : A6 00    "  "    ldaa  $00,x
E424        LE424:
E424 : 4A    "J"    deca
E425 : 26 FD    "& "    bne  LE424
E427 : 73 20 02    "s  "    com  X2002
E42A : 5A    "Z"    decb
E42B : 26 EB    "& "    bne  LE418
E42D : D6 00    "  "    ldab  X0000
E42F : 7A 00 06    "z  "    dec  X0006
E432 : 26 0D    "& "    bne  LE441
E434 : 96 05    "  "    ldaa  X0005
E436 : 97 06    "  "    staa  X0006
E438        XE438:
E438 : 96 01    "  "    ldaa  X0001
E43A : 9B 0A    "  "    adda  X000A
E43C        XE43C:
E43C : 94 0B    "  "    anda  X000B
E43E : 4C    "L"    inca
E43F : 97 01    "  "    staa  X0001
E441        LE441:
E441 : 08    " "    inx
E442 : 9C 0E    "  "    cpx  X000E
E444 : 26 D2    "& "    bne  LE418
E446 : B6 20 02    "   "    ldaa  X2002
E449 : 2B 04    "+ "    bmi  LE44F
E44B : 9B 09    "  "    adda  X0009
E44D : 9B 09    "  "    adda  X0009
E44F        LE44F:
E44F : 90 09    "  "    suba  X0009
E451 : 7A 00 04    "z  "    dec  X0004
E454 : 26 BB    "& "    bne  LE411
E456 : 96 03    "  "    ldaa  X0003
E458 : 97 04    "  "    staa  X0004
E45A : 96 02    "  "    ldaa  X0002
E45C : 84 0F    "  "    anda  #$0F
E45E : 4A    "J"    deca
E45F : 26 02    "& "    bne  LE463
E461 : 86 0F    "  "    ldaa  #$0F
E463        LE463:
E463 : 97 02    "  "    staa  X0002
E465 : 20 AA    "  "    bra  LE411
        ;
E467 : CE 00 02    "   "    ldx  #$0002
E46A : DF 70    " p"    stx  X0070
E46C : CE F5 3E    "  >"    ldx  #$F53E
E46F : 16    " "    tab
E470 : 4F    "O"    clra
E471 : 58    "X"    aslb
E472 : 89 00    "  "    adca  #$00
E474 : 58    "X"    aslb
E475 : 89 00    "  "    adca  #$00
E477 : BD EE 7E    "  ~"    jsr  LEE7E
E47A : A6 00    "  "    ldaa  $00,x
E47C : 97 00    "  "    staa  X0000
E47E : A6 01    "  "    ldaa  $01,x
E480 : 97 01    "  "    staa  X0001
E482 : EE 02    "  "    ldx  $02,x
E484 : C6 0D    "  "    ldab  #$0D
E486 : BD EE A6    "   "    jsr  LEEA6
E489 : 96 07    "  "    ldaa  X0007
E48B : B7 20 02    "   "    staa  X2002
E48E : D6 00    "  "    ldab  X0000
E490        LE490:
E490 : DE 0B    "  "    ldx  X000B
E492        LE492:
E492 : 96 02    "  "    ldaa  X0002
E494        LE494:
E494 : 4A    "J"    deca
E495 : 26 FD    "& "    bne  LE494
E497 : A6 00    "  "    ldaa  $00,x
E499        LE499:
E499 : 4A    "J"    deca
E49A : 26 FD    "& "    bne  LE499
E49C : 73 20 02    "s  "    com  X2002
E49F : 5A    "Z"    decb
E4A0 : 26 F0    "& "    bne  LE492
E4A2 : 7A 00 05    "z  "    dec  X0005
E4A5 : 26 0C    "& "    bne  LE4B3
E4A7 : 96 04    "  "    ldaa  X0004
E4A9 : 97 05    "  "    staa  X0005
E4AB : B6 20 02    "   "    ldaa  X2002
E4AE : 90 08    "  "    suba  X0008
E4B0 : B7 20 02    "   "    staa  X2002
E4B3        LE4B3:
E4B3 : D6 00    "  "    ldab  X0000
E4B5 : 08    " "    inx
E4B6 : 9C 0D    "  "    cpx  X000D
E4B8 : 26 D8    "& "    bne  LE492
E4BA : 7A 00 09    "z  "    dec  X0009
E4BD : 27 0B    "' "    beq  LE4CA
E4BF : 7A 20 02    "z  "    dec  X2002
E4C2 : 96 02    "  "    ldaa  X0002
E4C4 : 9B 01    "  "    adda  X0001
E4C6 : 97 02    "  "    staa  X0002
E4C8 : 20 C6    "  "    bra  LE490
E4CA        LE4CA:
E4CA : 7E F0 06    "~  "    jmp  LF006
        ;
E4CD        LE4CD:
E4CD : A6 01    "  "    ldaa  $01,x
E4CF : CE 00 1E    "   "    ldx  #$001E
E4D2 : 80 02    "  "    suba  #$02
E4D4        LE4D4:
E4D4 : 23 15    "# "    bls  LE4EB
E4D6 : 81 03    "  "    cmpa  #$03
E4D8 : 27 09    "' "    beq  LE4E3
E4DA : C6 01    "  "    ldab  #$01
E4DC : E7 00    "  "    stab  $00,x
E4DE : 08    " "    inx
E4DF : 80 02    "  "    suba  #$02
E4E1 : 20 F1    "  "    bra  LE4D4
        ;
E4E3        LE4E3:
E4E3 : C6 91    "  "    ldab  #$91
E4E5 : E7 00    "  "    stab  $00,x
E4E7 : 6F 01    "o "    clr  $01,x
E4E9 : 08    " "    inx
E4EA : 08    " "    inx
E4EB        LE4EB:
E4EB : C6 7E    " ~"    ldab  #$7E
E4ED : E7 00    "  "    stab  $00,x
E4EF : C6 E5    "  "    ldab  #$E5
E4F1 : E7 01    "  "    stab  $01,x
E4F3 : C6 4C    " L"    ldab  #$4C
E4F5 : E7 02    "  "    stab  $02,x
E4F7 : 39    "9"    rts
        ;
E4F8 : 16    " "    tab
E4F9 : 4F    "O"    clra
E4FA : 58    "X"    aslb
E4FB : 89 00    "  "    adca  #$00
E4FD : D7 6F    " o"    stab  X006F
E4FF : 58    "X"    aslb
E500 : 89 00    "  "    adca  #$00
E502 : DB 6F    " o"    addb  X006F
E504 : 89 00    "  "    adca  #$00
E506 : CE F7 24    "  $"    ldx  #$F724
E509 : BD EE 7E    "  ~"    jsr  LEE7E
E50C : A6 02    "  "    ldaa  $02,x
E50E : 97 12    "  "    staa  X0012
E510 : D6 60    " `"    ldab  X0060
E512 : C5 08    "  "    bitb  #$08
E514 : 27 02    "' "    beq  LE518
E516 : 97 50    " P"    staa  X0050
E518        LE518:
E518 : A6 03    "  "    ldaa  $03,x
E51A : 97 13    "  "    staa  X0013
E51C : C5 08    "  "    bitb  #$08
E51E : 27 02    "' "    beq  LE522
E520 : 97 51    " Q"    staa  X0051
E522        LE522:
E522 : A6 04    "  "    ldaa  $04,x
E524 : 97 14    "  "    staa  X0014
E526 : A6 05    "  "    ldaa  $05,x
E528 : 97 1D    "  "    staa  X001D
E52A : 97 15    "  "    staa  X0015
E52C : EE 00    "  "    ldx  $00,x
E52E : DF 6A    " j"    stx  X006A
E530 : CE 00 00    "   "    ldx  #$0000
E533 : DF 70    " p"    stx  X0070
E535 : C6 12    "  "    ldab  #$12
E537 : DE 6A    " j"    ldx  X006A
E539 : DF 67    " g"    stx  X0067
E53B : BD EE A6    "   "    jsr  LEEA6
E53E : DE 12    "  "    ldx  X0012
E540 : 09    " "    dex
E541 : 09    " "    dex
E542 : 09    " "    dex
E543 : 09    " "    dex
E544 : DF 12    "  "    stx  X0012
E546 : A6 00    "  "    ldaa  $00,x
E548 : 97 69    " i"    staa  X0069
E54A : 20 07    "  "    bra  LE553
        ;
E54C        LE54C:
E54C : DE 18    "  "    ldx  X0018
E54E : 09    " "    dex
E54F : DF 18    "  "    stx  X0018
E551 : 26 53    "&S"    bne  LE5A6
E553        LE553:
E553 : DE 12    "  "    ldx  X0012
E555 : 08    " "    inx
E556 : 08    " "    inx
E557 : 08    " "    inx
E558 : 08    " "    inx
E559        LE559:
E559 : A6 00    "  "    ldaa  $00,x
E55B : 26 1D    "& "    bne  LE57A
E55D : A6 01    "  "    ldaa  $01,x
E55F : 26 0E    "& "    bne  LE56F
E561 : DF 12    "  "    stx  X0012
E563 : EE 02    "  "    ldx  $02,x
E565        LE565:
E565 : 86 16    "  "    ldaa  #$16
E567        LE567:
E567 : 4A    "J"    deca
E568 : 26 FD    "& "    bne  LE567
E56A : 09    " "    dex
E56B : 26 F8    "& "    bne  LE565
E56D : 20 E4    "  "    bra  LE553
        ;
E56F        LE56F:
E56F : 7A 00 14    "z  "    dec  X0014
E572 : 27 26    "'&"    beq  LE59A
E574 : EE 01    "  "    ldx  $01,x
E576 : DF 12    "  "    stx  X0012
E578 : 20 DF    "  "    bra  LE559
        ;
E57A        LE57A:
E57A : 97 16    "  "    staa  X0016
E57C : 97 17    "  "    staa  X0017
E57E : A6 02    "  "    ldaa  $02,x
E580 : 97 18    "  "    staa  X0018
E582 : A6 03    "  "    ldaa  $03,x
E584 : 97 19    "  "    staa  X0019
E586 : DF 12    "  "    stx  X0012
E588 : BD E4 CD    "   "    jsr  LE4CD
E58B : CE 00 00    "   "    ldx  #$0000
E58E : DF 70    " p"    stx  X0070
E590 : DE 67    " g"    ldx  X0067
E592 : C6 12    "  "    ldab  #$12
E594 : BD EE A6    "   "    jsr  LEEA6
E597 : 7E E5 4C    "~ L"    jmp  LE54C
        ;
E59A        LE59A:
E59A : 96 60    " `"    ldaa  X0060
E59C : 85 08    "  "    bita  #$08
E59E : 27 03    "' "    beq  LE5A3
E5A0 : 7E F0 15    "~  "    jmp  LF015
E5A3        LE5A3:
E5A3 : 7E F0 06    "~  "    jmp  LF006
        ;
E5A6        LE5A6:
E5A6        XE5A6:
E5A6 : 96 00    "  "    ldaa  X0000
E5A8 : F6 20 02    "   "    ldab  X2002
E5AB : 2B 09    "+ "    bmi  LE5B6
E5AD : AC 00    "  "    cpx  $00,x
E5AF : AC 00    "  "    cpx  $00,x
E5B1 : 8C 00 00    "   "    cpx  #$0000
E5B4 : 20 0F    "  "    bra  LE5C5
        ;
E5B6        LE5B6:
E5B6 : 7A 00 1D    "z  "    dec  X001D
E5B9 : 27 05    "' "    beq  LE5C0
E5BB : BC E5 A6    "   "    cpx  XE5A6
E5BE : 20 05    "  "    bra  LE5C5
        ;
E5C0        LE5C0:
E5C0 : D6 15    "  "    ldab  X0015
E5C2 : D7 1D    "  "    stab  X001D
E5C4 : 43    "C"    coma
E5C5        LE5C5:
E5C5 : B7 20 02    "   "    staa  X2002
E5C8 : 7A 00 17    "z  "    dec  X0017
E5CB : 26 07    "& "    bne  LE5D4
E5CD : 96 16    "  "    ldaa  X0016
E5CF : 97 17    "  "    staa  X0017
E5D1 : 73 20 02    "s  "    com  X2002
E5D4        LE5D4:
E5D4 : 96 01    "  "    ldaa  X0001
E5D6 : 26 06    "& "    bne  LE5DE
E5D8 : 4C    "L"    inca
E5D9 : 97 01    "  "    staa  X0001
E5DB : 7F 00 10    "   "    clr  X0010
E5DE        LE5DE:
E5DE : 81 04    "  "    cmpa  #$04
E5E0 : 26 08    "& "    bne  LE5EA
E5E2 : 08    " "    inx
E5E3 : 08    " "    inx
E5E4 : 08    " "    inx
E5E5 : CE 00 02    "   "    ldx  #$0002
E5E8 : 20 18    "  "    bra  LE602
        ;
E5EA        LE5EA:
E5EA : 81 03    "  "    cmpa  #$03
E5EC : 26 07    "& "    bne  LE5F5
E5EE : 08    " "    inx
E5EF : 01    " "    nop
E5F0 : CE 00 06    "   "    ldx  #$0006
E5F3 : 20 0D    "  "    bra  LE602
        ;
E5F5        LE5F5:
E5F5 : 81 02    "  "    cmpa  #$02
E5F7 : 26 05    "& "    bne  LE5FE
E5F9 : CE 00 0A    "   "    ldx  #$000A
E5FC : 20 04    "  "    bra  LE602
        ;
E5FE        LE5FE:
E5FE : 08    " "    inx
E5FF : CE 00 0E    "   "    ldx  #$000E
E602        LE602:
E602 : 96 00    "  "    ldaa  X0000
E604 : 6A 00    "j "    dec  $00,x
E606 : 26 17    "& "    bne  LE61F
E608 : AB 02    "  "    adda  $02,x
E60A : 6A 03    "j "    dec  $03,x
E60C : 26 0A    "& "    bne  LE618
E60E : 7A 00 01    "z  "    dec  X0001
E611 : 01    " "    nop
E612 : CE 00 00    "   "    ldx  #$0000
E615 : 7E E6 28    "~ ("    jmp  LE628
        ;
E618        LE618:
E618 : E6 01    "  "    ldab  $01,x
E61A : E7 00    "  "    stab  $00,x
E61C : 7E E6 28    "~ ("    jmp  LE628
        ;
E61F        LE61F:
E61F : C6 05    "  "    ldab  #$05
E621        LE621:
E621 : 5A    "Z"    decb
E622 : 26 FD    "& "    bne  LE621
E624 : 01    " "    nop
E625 : 7E E6 28    "~ ("    jmp  LE628
        ;
E628        LE628:
E628 : 97 00    "  "    staa  X0000
E62A : 7E 00 1E    "~  "    jmp  L001E
        ;
E62D : CE E6 DA    "   "    ldx  #$E6DA
E630 : 48    "H"    asla
E631 : BD EE 70    "  p"    jsr  LEE70
E634 : EE 00    "  "    ldx  $00,x
E636 : A6 00    "  "    ldaa  $00,x
E638 : 97 00    "  "    staa  X0000
E63A : 97 01    "  "    staa  X0001
E63C : A6 01    "  "    ldaa  $01,x
E63E : 97 05    "  "    staa  X0005
E640 : 97 06    "  "    staa  X0006
E642 : EE 02    "  "    ldx  $02,x
E644 : DF 07    "  "    stx  X0007
E646 : A6 00    "  "    ldaa  $00,x
E648 : 97 02    "  "    staa  X0002
E64A : A6 01    "  "    ldaa  $01,x
E64C : 97 09    "  "    staa  X0009
E64E : A6 02    "  "    ldaa  $02,x
E650 : 97 0A    "  "    staa  X000A
E652 : A6 03    "  "    ldaa  $03,x
E654 : 97 0B    "  "    staa  X000B
E656 : EE 04    "  "    ldx  $04,x
E658 : DF 03    "  "    stx  X0003
E65A        LE65A:
E65A : DE 03    "  "    ldx  X0003
E65C : 09    " "    dex
E65D : DF 03    "  "    stx  X0003
E65F : 27 53    "'S"    beq  LE6B4
E661 : 96 02    "  "    ldaa  X0002
E663        LE663:
E663 : 4A    "J"    deca
E664 : 26 FD    "& "    bne  LE663
E666 : BD EE 54    "  T"    jsr  LEE54
E669 : 26 01    "& "    bne  LE66C
E66B : 53    "S"    comb
E66C        LE66C:
E66C : 4D    "M"    tsta
E66D : 26 01    "& "    bne  LE670
E66F : 43    "C"    coma
E670        LE670:
E670 : 94 00    "  "    anda  X0000
E672 : D4 01    "  "    andb  X0001
E674 : D7 6E    " n"    stab  X006E
E676 : C6 08    "  "    ldab  #$08
E678 : D7 6F    " o"    stab  X006F
E67A : 5F    "_"    clrb
E67B        LE67B:
E67B : 44    "D"    lsra
E67C : 24 03    "$ "    bcc  LE681
E67E : F7 20 02    "   "    stab  X2002
E681        LE681:
E681        XE681:
E681 : CB 05    "  "    addb  #$05
E683 : 7A 00 6F    "z o"    dec  X006F
E686 : 26 F3    "& "    bne  LE67B
E688 : 96 6E    " n"    ldaa  X006E
E68A        XE68A:
E68A : C6 08    "  "    ldab  #$08
E68C : D7 6F    " o"    stab  X006F
E68E : D6 0A    "  "    ldab  X000A
E690        LE690:
E690 : 44    "D"    lsra
E691 : 24 03    "$ "    bcc  LE696
E693 : F7 20 02    "   "    stab  X2002
E696        LE696:
E696 : C0 05    "  "    subb  #$05
E698 : 7A 00 6F    "z o"    dec  X006F
E69B : 26 F3    "& "    bne  LE690
E69D : 7A 00 06    "z  "    dec  X0006
E6A0 : 26 B8    "& "    bne  LE65A
E6A2 : 96 05    "  "    ldaa  X0005
E6A4 : 97 06    "  "    staa  X0006
E6A6 : 96 02    "  "    ldaa  X0002
E6A8 : 9B 09    "  "    adda  X0009
E6AA : 97 02    "  "    staa  X0002
E6AC : 96 0A    "  "    ldaa  X000A
E6AE : 9B 0B    "  "    adda  X000B
E6B0 : 97 0A    "  "    staa  X000A
E6B2 : 20 A6    "  "    bra  LE65A
        ;
E6B4        LE6B4:
E6B4 : DE 07    "  "    ldx  X0007
E6B6 : 08    " "    inx
E6B7 : 08    " "    inx
E6B8 : 08    " "    inx
E6B9 : 08    " "    inx
E6BA : 08    " "    inx
E6BB : 08    " "    inx
E6BC : DF 07    "  "    stx  X0007
E6BE : A6 00    "  "    ldaa  $00,x
E6C0        XE6C0:
E6C0 : 26 03    "& "    bne  LE6C5
E6C2 : 7E F0 06    "~  "    jmp  LF006
        ;
E6C5        LE6C5:
E6C5 : 97 02    "  "    staa  X0002
E6C7 : A6 01    "  "    ldaa  $01,x
E6C9 : 97 09    "  "    staa  X0009
E6CB : A6 02    "  "    ldaa  $02,x
E6CD : 97 0A    "  "    staa  X000A
E6CF : A6 03    "  "    ldaa  $03,x
E6D1 : 97 0B    "  "    staa  X000B
E6D3 : EE 04    "  "    ldx  $04,x
E6D5 : DF 03    "  "    stx  X0003
E6D7 : 7E E6 5A    "~ Z"    jmp  LE65A
        ;
E6DA : E6 EE    "  "    ldab  $EE,x
E6DC : E6 F2    "  "    ldab  $F2,x
E6DE : E6 F6    "  "    ldab  $F6,x
E6E0 : E6 FA    "  "    ldab  $FA,x
E6E2 : E6 FE    "  "    ldab  $FE,x
E6E4 : E7 02    "  "    stab  $02,x
E6E6 : E7 06    "  "    stab  $06,x
E6E8 : E7 0A    "  "    stab  $0A,x
E6EA : E7 0E    "  "    stab  $0E,x
E6EC : E7 12    "  "    stab  $12,x
E6EE : FF 50 FF    " P "    stx  X50FF
        ;
E6F1 : 7B    "{"    db  $7B
        ;
E6F2 : FF 50 FF    " P "    stx  X50FF
E6F5 : AE 81    "  "    lds  $81,x
E6F7 : 50    "P"    negb
E6F8 : FF 7B 81    " { "    stx  X7B81
E6FB        XE6FB:
E6FB : 50    "P"    negb
E6FC : FF AE 81    "   "    stx  XAE81
E6FF : 50    "P"    negb
E700 : FF B7 81    "   "    stx  XB781
E703 : 50    "P"    negb
E704 : FF C6 FF    "   "    stx  XC6FF
E707 : 50    "P"    negb
E708 : FF C6 FF    "   "    stx  XC6FF
E70B : 50    "P"    negb
E70C : FF C6 FF    "   "    stx  XC6FF
E70F : 50    "P"    negb
E710 : FF DB 81    "   "    stx  XDB81
E713 : 50    "P"    negb
E714 : FF DB D6    "   "    stx  XDBD6
E717 : 60 C4    "` "    neg  $C4,x
E719 : 70 CA 01    "p  "    neg  XCA01
E71C : CA 08    "  "    orab  #$08
E71E : D7 60    " `"    stab  X0060
E720 : 48    "H"    asla
E721 : CE F9 76    "  v"    ldx  #$F976
E724 : BD EE 70    "  p"    jsr  LEE70
E727 : EE 00    "  "    ldx  $00,x
E729 : DF 0B    "  "    stx  X000B
E72B : DF 6A    " j"    stx  X006A
E72D : CE 00 00    "   "    ldx  #$0000
E730 : DF 70    " p"    stx  X0070
E732 : DE 6A    " j"    ldx  X006A
E734 : 09    " "    dex
E735 : A6 00    "  "    ldaa  $00,x
E737 : 97 0A    "  "    staa  X000A
E739 : 08    " "    inx
E73A : C6 0A    "  "    ldab  #$0A
E73C : BD EE A6    "   "    jsr  LEEA6
E73F : 96 01    "  "    ldaa  X0001
E741 : B7 20 02    "   "    staa  X2002
E744 : 20 3D    " ="    bra  LE783
        ;
E746 : 96 60    " `"    ldaa  X0060
E748 : 84 70    " p"    anda  #$70
E74A : 8A 01    "  "    oraa  #$01
E74C : 8A 08    "  "    oraa  #$08
E74E : 97 60    " `"    staa  X0060
E750 : 20 31    " 1"    bra  LE783
E752        LE752:
E752 : 7E F0 06    "~  "    jmp  LF006
        ;
E755        LE755:
E755 : DE 0B    "  "    ldx  X000B
E757 : 86 0A    "  "    ldaa  #$0A
E759 : BD EE 70    "  p"    jsr  LEE70
E75C        LE75C:
E75C : DF 0B    "  "    stx  X000B
E75E : A6 00    "  "    ldaa  $00,x
E760 : 26 0B    "& "    bne  LE76D
E762 : 7A 00 0A    "z  "    dec  X000A
E765 : 27 EB    "' "    beq  LE752
E767 : EE 01    "  "    ldx  $01,x
E769 : DF 6A    " j"    stx  X006A
E76B : 20 EF    "  "    bra  LE75C
        ;
E76D        LE76D:
E76D : CE 00 00    "   "    ldx  #$0000
E770 : DF 70    " p"    stx  X0070
E772 : DE 6A    " j"    ldx  X006A
E774 : C6 0A    "  "    ldab  #$0A
E776 : BD EE A6    "   "    jsr  LEEA6
E779 : 96 01    "  "    ldaa  X0001
E77B : B7 20 02    "   "    staa  X2002
E77E : CE A5 C8    "   "    ldx  #$A5C8
E781 : DF 61    " a"    stx  X0061
E783        LE783:
E783 : DE 08    "  "    ldx  X0008
E785 : 09    " "    dex
E786 : DF 08    "  "    stx  X0008
E788 : 27 CB    "' "    beq  LE755
E78A : 96 05    "  "    ldaa  X0005
E78C        LE78C:
E78C : 4A    "J"    deca
E78D : 26 FD    "& "    bne  LE78C
E78F : BD EE 54    "  T"    jsr  LEE54
E792 : 94 03    "  "    anda  X0003
E794 : D4 04    "  "    andb  X0004
E796 : D7 6E    " n"    stab  X006E
E798 : C6 08    "  "    ldab  #$08
E79A : D7 6F    " o"    stab  X006F
E79C : 5F    "_"    clrb
E79D        LE79D:
E79D : 44    "D"    lsra
E79E : 24 0A    "$ "    bcc  LE7AA
E7A0 : DB 00    "  "    addb  X0000
E7A2 : D7 0D    "  "    stab  X000D
E7A4 : 73 20 02    "s  "    com  X2002
E7A7        LE7A7:
E7A7 : 5A    "Z"    decb
E7A8 : 26 FD    "& "    bne  LE7A7
E7AA        LE7AA:
E7AA : 73 20 02    "s  "    com  X2002
E7AD : D6 0D    "  "    ldab  X000D
E7AF : 7A 00 6F    "z o"    dec  X006F
E7B2 : 26 E9    "& "    bne  LE79D
E7B4 : 7A 00 07    "z  "    dec  X0007
E7B7 : 26 CA    "& "    bne  LE783
E7B9 : 96 06    "  "    ldaa  X0006
E7BB : 97 07    "  "    staa  X0007
E7BD : B6 20 02    "   "    ldaa  X2002
E7C0 : 2A 04    "* "    bpl  LE7C6
E7C2 : 90 02    "  "    suba  X0002
E7C4 : 90 02    "  "    suba  X0002
E7C6        LE7C6:
E7C6 : 9B 02    "  "    adda  X0002
E7C8 : B7 20 02    "   "    staa  X2002
E7CB : 20 B6    "  "    bra  LE783
        ;
E7CD        XE7CD:
E7CD : CE 00 E0    "   "    ldx  #$00E0
E7D0 : C6 80    "  "    ldab  #$80
E7D2        LE7D2:
E7D2 : 86 20    "  "    ldaa  #$20
E7D4 : BD EE 70    "  p"    jsr  LEE70
E7D7        LE7D7:
E7D7 : 09    " "    dex
E7D8 : 26 FD    "& "    bne  LE7D7
E7DA : 7F 20 02    "   "    clr  X2002
E7DD        LE7DD:
E7DD : 5A    "Z"    decb
E7DE : 26 FD    "& "    bne  LE7DD
E7E0 : 73 20 02    "s  "    com  X2002
E7E3 : DE 6A    " j"    ldx  X006A
E7E5 : 8C 10 00    "   "    cpx  #$1000
E7E8 : 26 E8    "& "    bne  LE7D2
E7EA : 7E F0 06    "~  "    jmp  LF006
        ;
E7ED : 96 60    " `"    ldaa  X0060
E7EF : 84 07    "  "    anda  #$07
E7F1 : 97 60    " `"    staa  X0060
E7F3 : CE E8 34    "  4"    ldx  #$E834
E7F6 : DF 02    "  "    stx  X0002
E7F8        LE7F8:
E7F8 : DE 02    "  "    ldx  X0002
E7FA        XE7FA:
E7FA : A6 00    "  "    ldaa  $00,x
E7FC : 27 33    "'3"    beq  LE831
E7FE : E6 01    "  "    ldab  $01,x
E800 : C4 F0    "  "    andb  #$F0
E802 : D7 01    "  "    stab  X0001
E804 : E6 01    "  "    ldab  $01,x
E806 : 08    " "    inx
E807 : 08    " "    inx
E808 : DF 02    "  "    stx  X0002
E80A : 97 00    "  "    staa  X0000
E80C : C4 0F    "  "    andb  #$0F
E80E        LE80E:
E80E : 96 01    "  "    ldaa  X0001
E810 : B7 20 02    "   "    staa  X2002
E813 : 96 00    "  "    ldaa  X0000
E815        LE815:
E815 : CE 00 05    "   "    ldx  #$0005
E818        LE818:
E818 : 09    " "    dex
E819 : 26 FD    "& "    bne  LE818
E81B : 4A    "J"    deca
E81C : 26 F7    "& "    bne  LE815
E81E : 7F 20 02    "   "    clr  X2002
E821 : 96 00    "  "    ldaa  X0000
E823        LE823:
E823 : CE 00 05    "   "    ldx  #$0005
E826        LE826:
E826 : 09    " "    dex
E827 : 26 FD    "& "    bne  LE826
E829 : 4A    "J"    deca
E82A : 26 F7    "& "    bne  LE823
E82C : 5A    "Z"    decb
E82D : 26 DF    "& "    bne  LE80E
E82F : 20 C7    "  "    bra  LE7F8
E831        LE831:
E831 : 7E F0 06    "~  "    jmp  LF006
        ;
E834 : 01    " "    nop
        ;
E835 : FC 02 FC 03  "    "    db  $FC, $02, $FC, $03
        ;
E839 : F8 04 F8    "   "    eorb  X04F8
E83C : 06    " "    tap
E83D : F8 08 F4    "   "    eorb  X08F4
E840 : 0C    " "    clc
E841 : F4 10 F4    "   "    andb  X10F4
E844 : 20 F2    "  "    bra  LE838
        ;
E846 : 40    "@"    nega
E847 : F1 60 F1    " ` "    cmpb  X60F1
E84A : 80 F1    "  "    suba  #$F1
E84C : A0 F1    "  "    suba  $F1,x
E84E : C0 F1    "  "    subb  #$F1
        ;
E850 : 00 00    "  "    db  $00, $00
        ;
E852 : CE E8 CB    "   "    ldx  #$E8CB
E855 : 16    " "    tab
E856 : 86 0D    "  "    ldaa  #$0D
E858 : BD EE 8B    "   "    jsr  LEE8B
E85B : 96 0B    "  "    ldaa  X000B
E85D : 97 14    "  "    staa  X0014
E85F : 96 09    "  "    ldaa  X0009
E861 : 97 12    "  "    staa  X0012
E863 : 96 0A    "  "    ldaa  X000A
E865 : 97 13    "  "    staa  X0013
E867 : 96 06    "  "    ldaa  X0006
E869 : 97 11    "  "    staa  X0011
E86B : 96 04    "  "    ldaa  X0004
E86D : 97 16    "  "    staa  X0016
E86F : 96 00    "  "    ldaa  X0000
E871 : 97 17    "  "    staa  X0017
E873        LE873:
E873 : 96 17    "  "    ldaa  X0017
E875 : 97 0D    "  "    staa  X000D
E877 : 96 0C    "  "    ldaa  X000C
E879 : 97 15    "  "    staa  X0015
E87B : 96 01    "  "    ldaa  X0001
E87D : 97 0E    "  "    staa  X000E
E87F : 96 02    "  "    ldaa  X0002
E881 : 97 10    "  "    staa  X0010
E883 : DE 07    "  "    ldx  X0007
E885 : 96 14    "  "    ldaa  X0014
E887 : B7 20 02    "   "    staa  X2002
E88A : 96 11    "  "    ldaa  X0011
E88C        LE88C:
E88C : D6 0E    "  "    ldab  X000E
E88E : D7 0F    "  "    stab  X000F
E890        LE890:
E890 : 48    "H"    asla
E891 : 24 05    "$ "    bcc  LE898
E893 : 73 20 02    "s  "    com  X2002
E896 : 98 11    "  "    eora  X0011
E898        LE898:
E898 : D6 0D    "  "    ldab  X000D
E89A        LE89A:
E89A : 5A    "Z"    decb
E89B : 26 FD    "& "    bne  LE89A
E89D : 7A 00 0F    "z  "    dec  X000F
E8A0 : 26 EE    "& "    bne  LE890
E8A2 : D6 0D    "  "    ldab  X000D
E8A4 : DB 10    "  "    addb  X0010
E8A6 : D7 0D    "  "    stab  X000D
E8A8        LE8A8:
E8A8 : D6 15    "  "    ldab  X0015
E8AA        XE8AA:
E8AA : DB 14    "  "    addb  X0014
E8AC : D7 14    "  "    stab  X0014
E8AE : F7 20 02    "   "    stab  X2002
E8B1 : 09    " "    dex
E8B2 : 26 D8    "& "    bne  LE88C
E8B4 : 7A 00 12    "z  "    dec  X0012
E8B7 : 27 0F    "' "    beq  LE8C8
E8B9 : D6 14    "  "    ldab  X0014
E8BB : D0 13    "  "    subb  X0013
E8BD : D7 14    "  "    stab  X0014
E8BF : D6 16    "  "    ldab  X0016
E8C1 : DB 17    "  "    addb  X0017
E8C3 : D7 17    "  "    stab  X0017
E8C5 : 7E E8 73    "~ s"    jmp  LE873
E8C8        LE8C8:
E8C8 : 7E F0 06    "~  "    jmp  LF006
        ;
E8CB : 01    " "    nop
E8CC : FF 01 00    "   "    stx  X0100
        ;
E8CF : 00 00    "  "    db  $00, $00
        ;
E8D1 : 4D    "M"    tsta
        ;
E8D2 : 00    " "    db  $00
        ;
E8D3 : FF 01 00    "   "    stx  X0100
E8D6 : FF 00 01    "   "    stx  X0001
E8D9 : FF 01 00    "   "    stx  X0100
        ;
E8DC : 00 00    "  "    db  $00, $00
        ;
E8DE : 4D    "M"    tsta
        ;
E8DF : 00    " "    db  $00
        ;
E8E0 : 10    " "    sba
        ;
E8E1 : 04    " "    db  $04
        ;
E8E2 : 20 FF    "  "    bra  LE8E3
        ;
E8E4 : 00    " "    db  $00
        ;
E8E5 : CE E9 4C    "  L"    ldx  #$E94C
E8E8 : 16    " "    tab
E8E9 : 86 09    "  "    ldaa  #$09
E8EB : BD EE 8B    "   "    jsr  LEE8B
E8EE : 86 55    " U"    ldaa  #$55
E8F0 : 97 11    "  "    staa  X0011
E8F2 : 96 08    "  "    ldaa  X0008
E8F4 : 97 10    "  "    staa  X0010
E8F6 : 96 01    "  "    ldaa  X0001
E8F8 : 97 09    "  "    staa  X0009
E8FA : 96 02    "  "    ldaa  X0002
E8FC : 97 0A    "  "    staa  X000A
E8FE : 96 03    "  "    ldaa  X0003
E900 : 97 0B    "  "    staa  X000B
E902 : DE 06    "  "    ldx  X0006
E904        XE904:
E904 : DF 0E    "  "    stx  X000E
E906 : DE 04    "  "    ldx  X0004
E908 : DF 0C    "  "    stx  X000C
E90A        LE90A:
E90A : F6 20 02    "   "    ldab  X2002
E90D : 96 11    "  "    ldaa  X0011
E90F : 48    "H"    asla
E910 : 24 02    "$ "    bcc  LE914
E912 : 98 00    "  "    eora  X0000
E914        LE914:
E914 : 97 11    "  "    staa  X0011
E916 : D1 11    "  "    cmpb  X0011
E918 : 24 1F    "$ "    bcc  LE939
E91A        LE91A:
E91A : F7 20 02    "   "    stab  X2002
E91D : DB 09    "  "    addb  X0009
E91F : 25 E9    "% "    bcs  LE90A
E921 : D1 11    "  "    cmpb  X0011
E923 : 24 E5    "$ "    bcc  LE90A
E925 : 09    " "    dex
E926 : 26 F2    "& "    bne  LE91A
E928        LE928:
E928 : DE 0E    "  "    ldx  X000E
E92A : 09    " "    dex
E92B : DF 0E    "  "    stx  X000E
E92D : 27 1A    "' "    beq  LE949
E92F : DE 0C    "  "    ldx  X000C
E931 : 96 09    "  "    ldaa  X0009
E933 : 9B 10    "  "    adda  X0010
E935 : 97 09    "  "    staa  X0009
E937 : 20 D1    "  "    bra  LE90A
        ;
E939        LE939:
E939 : F7 20 02    "   "    stab  X2002
E93C : D0 09    "  "    subb  X0009
E93E : 25 CA    "% "    bcs  LE90A
E940 : D1 11    "  "    cmpb  X0011
E942 : 23 C6    "# "    bls  LE90A
E944 : 09    " "    dex
E945 : 26 F2    "& "    bne  LE939
E947 : 20 DF    "  "    bra  LE928
E949        LE949:
E949 : 7E F0 06    "~  "    jmp  LF006
        ;
E94C : 84 01    "  "    anda  #$01
E94E : 01    " "    nop
E94F : 01    " "    nop
        ;
E950 : 00    " "    db  $00
        ;
E951 : 80 00    "  "    suba  #$00
E953 : 40    "@"    nega
E954 : 01    " "    nop
        ;
E955 : 42    "B"    db  $42
        ;
E956 : 01    " "    nop
E957 : 01    " "    nop
E958 : 01    " "    nop
        ;
E959 : 00    " "    db  $00
        ;
E95A : 80 00    "  "    suba  #$00
E95C : 40    "@"    nega
E95D : 01    " "    nop
        ;
E95E : 21    "!"    db  $21
        ;
E95F : 01    " "    nop
E960 : 01    " "    nop
E961 : 01    " "    nop
        ;
E962 : 00    " "    db  $00
        ;
E963 : 80 00    "  "    suba  #$00
E965 : 40    "@"    nega
E966 : 01    " "    nop
E967 : 28 01    "( "    bvc  LE96A
E969 : 01    " "    nop
E96A        LE96A:
E96A : 01    " "    nop
        ;
E96B : 00    " "    db  $00
        ;
E96C : 80 00    "  "    suba  #$00
E96E : 40    "@"    nega
E96F : 01    " "    nop
E970 : 48    "H"    asla
E971 : 01    " "    nop
E972 : 01    " "    nop
E973 : 01    " "    nop
        ;
E974 : 00    " "    db  $00
        ;
E975 : 80 00    "  "    suba  #$00
E977 : 40    "@"    nega
E978 : 01    " "    nop
E979 : 90 01    "  "    suba  X0001
E97B : 01    " "    nop
E97C : 01    " "    nop
        ;
E97D : 00    " "    db  $00
        ;
E97E : 80 00    "  "    suba  #$00
E980 : 40    "@"    nega
E981 : 01    " "    nop
E982 : 82 01    "  "    sbca  #$01
E984 : 01    " "    nop
E985 : 01    " "    nop
        ;
E986 : 00    " "    db  $00
        ;
E987 : 80 00    "  "    suba  #$00
E989 : 40    "@"    nega
E98A : 01    " "    nop
E98B : 88 01    "  "    eora  #$01
E98D : 01    " "    nop
E98E : 01    " "    nop
        ;
E98F : 00    " "    db  $00
        ;
E990 : 80 00    "  "    suba  #$00
E992 : 40    "@"    nega
E993 : 01    " "    nop
E994 : 81 01    "  "    cmpa  #$01
E996 : 01    " "    nop
E997 : 01    " "    nop
        ;
E998 : 00    " "    db  $00
        ;
E999 : 80 00    "  "    suba  #$00
E99B : 40    "@"    nega
E99C : 01    " "    nop
E99D : 82 01    "  "    sbca  #$01
E99F : 01    " "    nop
E9A0 : 01    " "    nop
        ;
E9A1 : 00    " "    db  $00
        ;
E9A2 : 80 00    "  "    suba  #$00
E9A4 : 40    "@"    nega
E9A5 : 01    " "    nop
E9A6 : CE EA 43    "  C"    ldx  #$EA43
E9A9 : 16    " "    tab
E9AA : 86 0C    "  "    ldaa  #$0C
E9AC : BD EE 8B    "   "    jsr  LEE8B
E9AF : 96 00    "  "    ldaa  X0000
E9B1 : 97 0D    "  "    staa  X000D
E9B3 : 96 09    "  "    ldaa  X0009
E9B5 : 97 17    "  "    staa  X0017
E9B7 : 96 0A    "  "    ldaa  X000A
E9B9 : 97 18    "  "    staa  X0018
E9BB : 96 01    "  "    ldaa  X0001
E9BD : 97 0E    "  "    staa  X000E
E9BF        LE9BF:
E9BF : 96 0B    "  "    ldaa  X000B
E9C1 : 43    "C"    coma
E9C2 : 97 0C    "  "    staa  X000C
E9C4 : 96 07    "  "    ldaa  X0007
E9C6 : 97 15    "  "    staa  X0015
E9C8 : 96 08    "  "    ldaa  X0008
E9CA : 97 16    "  "    staa  X0016
E9CC        LE9CC:
E9CC : 4F    "O"    clra
E9CD : 97 0F    "  "    staa  X000F
E9CF : 97 10    "  "    staa  X0010
E9D1 : 96 0D    "  "    ldaa  X000D
E9D3 : 97 11    "  "    staa  X0011
E9D5 : 96 0E    "  "    ldaa  X000E
E9D7 : 97 12    "  "    staa  X0012
E9D9 : D6 04    "  "    ldab  X0004
E9DB : DE 05    "  "    ldx  X0005
E9DD : DF 13    "  "    stx  X0013
E9DF        LE9DF:
E9DF : 96 10    "  "    ldaa  X0010
E9E1 : 9B 12    "  "    adda  X0012
E9E3 : 97 10    "  "    staa  X0010
E9E5 : 96 0F    "  "    ldaa  X000F
E9E7 : 99 11    "  "    adca  X0011
E9E9 : 97 0F    "  "    staa  X000F
E9EB : 81 80    "  "    cmpa  #$80
E9ED : 22 03    "" "    bhi  LE9F2
E9EF : 4F    "O"    clra
E9F0 : 20 03    "  "    bra  LE9F5
        ;
E9F2        LE9F2:
E9F2 : 96 0C    "  "    ldaa  X000C
E9F4 : 01    " "    nop
E9F5        LE9F5:
E9F5 : B7 20 02    "   "    staa  X2002
E9F8 : 5A    "Z"    decb
E9F9 : 26 18    "& "    bne  LEA13
E9FB : 96 12    "  "    ldaa  X0012
E9FD : 9B 03    "  "    adda  X0003
E9FF : 97 12    "  "    staa  X0012
EA01 : 96 11    "  "    ldaa  X0011
EA03 : 99 02    "  "    adca  X0002
EA05 : 97 11    "  "    staa  X0011
EA07 : D6 04    "  "    ldab  X0004
EA09 : DE 13    "  "    ldx  X0013
EA0B : 09    " "    dex
EA0C : DF 13    "  "    stx  X0013
EA0E : 27 14    "' "    beq  LEA24
EA10 : 7E E9 DF    "~  "    jmp  LE9DF
        ;
EA13        LEA13:
EA13 : 08    " "    inx
EA14 : 09    " "    dex
EA15        XEA15:
EA15 : 08    " "    inx
EA16 : 09    " "    dex
EA17 : 08    " "    inx
EA18 : 09    " "    dex
EA19 : 08    " "    inx
EA1A : 09    " "    dex
EA1B : 08    " "    inx
EA1C : 09    " "    dex
EA1D : 08    " "    inx
EA1E : 09    " "    dex
EA1F : 01    " "    nop
EA20 : 01    " "    nop
EA21 : 01    " "    nop
EA22 : 20 BB    "  "    bra  LE9DF
        ;
EA24        LEA24:
EA24 : 7A 00 15    "z  "    dec  X0015
EA27 : 27 09    "' "    beq  LEA32
EA29 : 96 0C    "  "    ldaa  X000C
EA2B : 90 16    "  "    suba  X0016
EA2D : 97 0C    "  "    staa  X000C
EA2F : 7E E9 CC    "~  "    jmp  LE9CC
        ;
EA32        LEA32:
EA32 : 7A 00 17    "z  "    dec  X0017
EA35 : 27 09    "' "    beq  LEA40
EA37 : 96 0D    "  "    ldaa  X000D
EA39 : 9B 18    "  "    adda  X0018
EA3B : 97 0D    "  "    staa  X000D
EA3D : 7E E9 BF    "~  "    jmp  LE9BF
EA40        LEA40:
EA40        XEA40:
EA40 : 7E F0 06    "~  "    jmp  LF006
        ;
EA43 : 49    "I"    rola
        ;
EA44 : 00    " "    db  $00
        ;
EA45 : FF FE 08    "   "    stx  XFE08
        ;
EA48 : 00    " "    db  $00
        ;
EA49 : 67 08    "g "    asr  $08,x
EA4B : 20 01    "  "    bra  LEA4E
        ;
EA4D : 00 00    "  "    db  $00, $00
        ;
EA4F : 31    "1"    ins
        ;
EA50 : 00    " "    db  $00
        ;
EA51 : FF FE 10    "   "    stx  XFE10
        ;
EA54 : 00    " "    db  $00
        ;
EA55 : 67 08    "g "    asr  $08,x
EA57 : 20 01    "  "    bra  LEA5A
        ;
EA59 : 00 00    "  "    db  $00, $00
        ;
EA5B : 09    " "    dex
        ;
EA5C : 00    " "    db  $00
        ;
EA5D : CA 19    "  "    orab  #$19
EA5F : 01    " "    nop
        ;
EA60 : 00    " "    db  $00
        ;
EA61 : 28 5F    "(_"    bvc  LEAC2
EA63 : F7 FC FF    "   "    stab  XFCFF
EA66 : 20 01    "  "    bra  LEA69
        ;
EA68 : 00    " "    db  $00
        ;
EA69        LEA69:
EA69 : 19    " "    daa
EA6A : 90 02    "  "    suba  X0002
        ;
EA6C : 00 18    "  "    db  $00, $18
        ;
EA6E : 20 02    "  "    bra  LEA72
        ;
EA70 : 19    " "    daa
EA71 : 06    " "    tap
EA72        LEA72:
EA72 : 50    "P"    negb
        ;
EA73 : 3A 00 21    ": !"    db  $3A, $00, $21
        ;
EA76 : F9 02 09    "   "    adcb  X0209
        ;
EA79 : 62 1A    "b "    db  $62, $1A
        ;
EA7B : 9F EB    "  "    sts  X00EB
EA7D : EF 07    "  "    stx  $07,x
EA7F : 09    " "    dex
        ;
EA80 : 00    " "    db  $00
        ;
EA81 : 11    " "    cba
EA82 : 20 55    " U"    bra  LEAD9
        ;
EA84 : 47    "G"    asra
EA85 : 01    " "    nop
EA86 : 01    " "    nop
EA87 : 20 01    "  "    bra  LEA8A
        ;
EA89 : 06    " "    tap
EA8A        LEA8A:
EA8A : A0 01    "  "    suba  $01,x
        ;
EA8C : 00 21    " !"    db  $00, $21
        ;
EA8E : F9 04 01    "   "    adcb  X0401
        ;
EA91 : 62 04    "b "    db  $62, $04
        ;
EA93 : 90 01    "  "    suba  X0001
EA95 : 10    " "    sba
        ;
EA96 : 02    " "    db  $02
        ;
EA97 : 01    " "    nop
        ;
EA98 : 00 21    " !"    db  $00, $21
        ;
EA9A : F9 04 01    "   "    adcb  X0401
        ;
EA9D : 62 04    "b "    db  $62, $04
        ;
EA9F : 90 02    "  "    suba  X0002
EAA1        LEAA1:
EAA1 : 10    " "    sba
EAA2 : 50    "P"    negb
        ;
EAA3 : 00 00    "  "    db  $00, $00
        ;
EAA5 : F0 90 04    "   "    subb  X9004
EAA8 : 01    " "    nop
EAA9 : 30    "0"    tsx
EAAA : 20 02    "  "    bra  LEAAE
        ;
EAAC : 01    " "    nop
EAAD        LEAAD:
EAAD : 06    " "    tap
        ;
EAAE        LEAAE:
EAAE : 00 00 00    "   "    db  $00, $00, $00
        ;
EAB1 : F0 90 01    "   "    subb  X9001
EAB4 : 01    " "    nop
EAB5 : 30    "0"    tsx
EAB6 : 20 02    "  "    bra  LEABA
        ;
EAB8 : 02    " "    db  $02
        ;
EAB9 : 06    " "    tap
        ;
EABA        LEABA:
EABA : 00    " "    db  $00
        ;
EABB : 09    " "    dex
        ;
EABC : 00    " "    db  $00
        ;
EABD : 22 20    "" "    bhi  LEADF
        ;
EABF : 02    " "    db  $02
        ;
EAC0 : 47    "G"    asra
EAC1 : 01    " "    nop
EAC2        LEAC2:
EAC2 : 01    " "    nop
EAC3 : 20 01    "  "    bra  LEAC6
        ;
EAC5 : 06    " "    tap
EAC6        LEAC6:
EAC6 : 09    " "    dex
EAC7 : 09    " "    dex
        ;
EAC8 : 00    " "    db  $00
        ;
EAC9 : 11    " "    cba
EACA : 20 99    "  "    bra  LEA65
        ;
EACC : 47    "G"    asra
EACD : 01    " "    nop
EACE : 01    " "    nop
EACF : 20 01    "  "    bra  LEAD2
        ;
EAD1 : 06    " "    tap
EAD2        LEAD2:
EAD2 : A0 09    "  "    suba  $09,x
        ;
EAD4 : 00    " "    db  $00
        ;
EAD5 : 11    " "    cba
EAD6 : 20 33    " 3"    bra  LEB0B
        ;
EAD8 : 47    "G"    asra
EAD9        LEAD9:
EAD9 : 01    " "    nop
EADA : 01    " "    nop
EADB : 20 01    "  "    bra  LEADE
        ;
EADD : 06    " "    tap
EADE        LEADE:
EADE : A0 09    "  "    suba  $09,x
        ;
EAE0 : 00    " "    db  $00
        ;
EAE1 : 11    " "    cba
EAE2 : 20 22    " ""    bra  LEB06
        ;
EAE4 : 47    "G"    asra
EAE5 : 01    " "    nop
EAE6 : 01    " "    nop
EAE7 : 20 01    "  "    bra  LEAEA
        ;
EAE9 : 06    " "    tap
EAEA        LEAEA:
EAEA : A0 09    "  "    suba  $09,x
        ;
EAEC : 00    " "    db  $00
        ;
EAED : 81 20    "  "    cmpa  #$20
EAEF : 99 00    "  "    adca  X0000
EAF1 : 30    "0"    tsx
EAF2 : 01    " "    nop
EAF3 : 20 01    "  "    bra  LEAF6
        ;
EAF5 : 06    " "    tap
EAF6        LEAF6:
EAF6 : 09    " "    dex
EAF7 : 29 00    ") "    bvs  LEAF9
EAF9        LEAF9:
EAF9 : 81 20    "  "    cmpa  #$20
EAFB : 99 00    "  "    adca  X0000
EAFD : 30    "0"    tsx
EAFE        XEAFE:
EAFE : 01    " "    nop
EAFF : 20 01    "  "    bra  LEB02
        ;
EB01 : 06    " "    tap
EB02        LEB02:
EB02 : 09    " "    dex
EB03 : 77 00 81    "w  "    asr  X0081
EB06        LEB06:
EB06 : 20 99    "  "    bra  LEAA1
        ;
EB08 : 00    " "    db  $00
        ;
EB09 : 30    "0"    tsx
EB0A : 01    " "    nop
EB0B        LEB0B:
EB0B : 20 01    "  "    bra  LEB0E
        ;
EB0D : 06    " "    tap
EB0E        LEB0E:
EB0E : 09    " "    dex
EB0F : 77 00 81    "w  "    asr  X0081
EB12 : 20 99    "  "    bra  LEAAD
        ;
EB14 : 00    " "    db  $00
        ;
EB15 : 30    "0"    tsx
EB16 : 01    " "    nop
EB17 : 20 01    "  "    bra  LEB1A
        ;
EB19 : 06    " "    tap
        ;
EB1A        LEB1A:
EB1A : 02    " "    db  $02
        ;
EB1B : 01    " "    nop
        ;
EB1C : 00 21    " !"    db  $00, $21
        ;
EB1E : 08    " "    inx
        ;
EB1F : 04    " "    db  $04
        ;
EB20 : 01    " "    nop
        ;
EB21 : 62 04    "b "    db  $62, $04
        ;
EB23 : 90 01    "  "    suba  X0001
EB25 : 10    " "    sba
EB26 : 20 01    "  "    bra  LEB29
        ;
EB28 : 00 21    " !"    db  $00, $21
        ;
EB2A : 07    " "    tpa
        ;
EB2B : 04    " "    db  $04
        ;
EB2C : 01    " "    nop
        ;
EB2D : 62 04    "b "    db  $62, $04
        ;
EB2F : 90 01    "  "    suba  X0001
EB31 : 10    " "    sba
        ;
EB32 : 00    " "    db  $00
        ;
EB33 : 91 00    "  "    cmpa  X0000
        ;
EB35 : 21    "!"    db  $21
        ;
EB36 : 07    " "    tpa
        ;
EB37 : 04    " "    db  $04
        ;
EB38 : 01    " "    nop
        ;
EB39 : 62 04    "b "    db  $62, $04
        ;
EB3B : 90 01    "  "    suba  X0001
EB3D : 10    " "    sba
        ;
EB3E : 00    " "    db  $00
        ;
EB3F : 91 00    "  "    cmpa  X0000
        ;
EB41 : 21 03 04    "!  "    db  $21, $03, $04
        ;
EB44 : 01    " "    nop
        ;
EB45 : 62 04    "b "    db  $62, $04
        ;
EB47 : 90 01    "  "    suba  X0001
EB49 : 10    " "    sba
        ;
EB4A : 00    " "    db  $00
        ;
EB4B : 91 00    "  "    cmpa  X0000
        ;
EB4D : 02    " "    db  $02
        ;
EB4E : 07    " "    tpa
        ;
EB4F : 04    " "    db  $04
        ;
EB50 : 01    " "    nop
        ;
EB51 : 62 04    "b "    db  $62, $04
        ;
EB53 : 90 01    "  "    suba  X0001
EB55 : 10    " "    sba
        ;
EB56 : 00    " "    db  $00
        ;
EB57        XEB57:
EB57 : 91 00    "  "    cmpa  X0000
EB59 : 11    " "    cba
EB5A : 07    " "    tpa
        ;
EB5B : 04    " "    db  $04
        ;
EB5C : 01    " "    nop
        ;
EB5D : 62 04    "b "    db  $62, $04
        ;
EB5F : 90 01    "  "    suba  X0001
EB61 : 10    " "    sba
        ;
EB62 : 00    " "    db  $00
        ;
EB63 : 99 00    "  "    adca  X0000
EB65 : 0A    " "    clv
EB66 : 07    " "    tpa
EB67 : 07    " "    tpa
EB68 : 01    " "    nop
EB69 : 01    " "    nop
        ;
EB6A : 02    " "    db  $02
        ;
EB6B : E0 01    "  "    subb  $01,x
EB6D : 90 01    "  "    suba  X0001
        ;
EB6F : 4B 00    "K "    db  $4B, $00
        ;
EB71 : FF FF 0A    "   "    stx  XFF0A
        ;
EB74 : 00    " "    db  $00
        ;
EB75 : 67 08    "g "    asr  $08,x
EB77 : 20 01    "  "    bra  LEB7A
        ;
EB79 : 00 00    "  "    db  $00, $00
        ;
EB7B : 4D    "M"    tsta
        ;
EB7C : 00    " "    db  $00
        ;
EB7D : FF FF 0A    "   "    stx  XFF0A
        ;
EB80 : 00    " "    db  $00
        ;
EB81 : 67 08    "g "    asr  $08,x
EB83 : 20 01    "  "    bra  LEB86
        ;
EB85 : 00 00    "  "    db  $00, $00
        ;
EB87 : 01    " "    nop
        ;
EB88 : 00    " "    db  $00
        ;
EB89 : 57    "W"    asrb
EB8A : 90 02    "  "    suba  X0002
        ;
EB8C : 00 18    "  "    db  $00, $18
        ;
EB8E : 20 10    "  "    bra  LEBA0
        ;
EB90 : 40    "@"    nega
EB91 : 06    " "    tap
EB92 : 50    "P"    negb
EB93        LEB93:
EB93 : CE 00 00    "   "    ldx  #$0000
EB96 : DF 11    "  "    stx  X0011
EB98 : DF 13    "  "    stx  X0013
EB9A : 96 00    "  "    ldaa  X0000
EB9C : 97 0F    "  "    staa  X000F
EB9E : 96 01    "  "    ldaa  X0001
EBA0        LEBA0:
EBA0 : 97 10    "  "    staa  X0010
EBA2 : 96 02    "  "    ldaa  X0002
EBA4 : 97 15    "  "    staa  X0015
EBA6 : 96 03    "  "    ldaa  X0003
EBA8 : 97 16    "  "    staa  X0016
EBAA : 96 04    "  "    ldaa  X0004
EBAC : 97 17    "  "    staa  X0017
EBAE : DE 07    "  "    ldx  X0007
EBB0 : DF 0D    "  "    stx  X000D
EBB2 : 96 05    "  "    ldaa  X0005
EBB4 : 97 0B    "  "    staa  X000B
EBB6        XEBB6:
EBB6 : 96 06    "  "    ldaa  X0006
EBB8 : 97 0C    "  "    staa  X000C
EBBA : CE 55 AA    " U "    ldx  #$55AA
EBBD : DF 09    "  "    stx  X0009
EBBF : D6 0E    "  "    ldab  X000E
EBC1 : 39    "9"    rts
        ;
EBC2 : CE EC 27    "  '"    ldx  #$EC27
EBC5 : 16    " "    tab
EBC6 : 86 09    "  "    ldaa  #$09
EBC8 : BD EE 8B    "   "    jsr  LEE8B
EBCB : BD EB 93    "   "    jsr  LEB93
EBCE        LEBCE:
EBCE : 96 0A    "  "    ldaa  X000A
EBD0 : 44    "D"    lsra
EBD1 : 44    "D"    lsra
EBD2 : 44    "D"    lsra
EBD3 : 98 0A    "  "    eora  X000A
EBD5 : 44    "D"    lsra
EBD6 : 76 00 09    "v  "    ror  X0009
EBD9 : 76 00 0A    "v  "    ror  X000A
EBDC : 96 0B    "  "    ldaa  X000B
EBDE : 24 01    "$ "    bcc  LEBE1
EBE0 : 4F    "O"    clra
EBE1        LEBE1:
EBE1 : DE 13    "  "    ldx  X0013
EBE3 : AB 18    "  "    adda  $18,x
EBE5 : 46    "F"    rora
EBE6 : DE 11    "  "    ldx  X0011
EBE8 : A7 18    "  "    staa  $18,x
EBEA : B7 20 02    "   "    staa  X2002
EBED : 96 12    "  "    ldaa  X0012
EBEF : 4C    "L"    inca
EBF0 : 84 1F    "  "    anda  #$1F
EBF2 : 97 12    "  "    staa  X0012
EBF4 : 9B 15    "  "    adda  X0015
EBF6 : 84 1F    "  "    anda  #$1F
EBF8 : 97 14    "  "    staa  X0014
EBFA : 96 0F    "  "    ldaa  X000F
EBFC        LEBFC:
EBFC : 4A    "J"    deca
EBFD : 26 FD    "& "    bne  LEBFC
EBFF : 5A    "Z"    decb
EC00 : 26 CC    "& "    bne  LEBCE
EC02 : 7A 00 0D    "z  "    dec  X000D
EC05 : 2A C7    "* "    bpl  LEBCE
EC07 : 96 07    "  "    ldaa  X0007
EC09 : 97 0D    "  "    staa  X000D
EC0B : D6 0E    "  "    ldab  X000E
EC0D : 96 0F    "  "    ldaa  X000F
EC0F : 9B 10    "  "    adda  X0010
EC11 : 97 0F    "  "    staa  X000F
EC13 : 96 15    "  "    ldaa  X0015
EC15 : 9B 16    "  "    adda  X0016
EC17 : 97 15    "  "    staa  X0015
EC19 : 96 0B    "  "    ldaa  X000B
EC1B : 9B 0C    "  "    adda  X000C
EC1D : 97 0B    "  "    staa  X000B
EC1F : 7A 00 17    "z  "    dec  X0017
EC22 : 26 AA    "& "    bne  LEBCE
EC24 : 7E F0 06    "~  "    jmp  LF006
        ;
EC27 : 01    " "    nop
        ;
EC28 : 00 00    "  "    db  $00, $00
        ;
EC2A : 01    " "    nop
EC2B : 40    "@"    nega
EC2C : FF FC 00    "   "    stx  XFC00
EC2F : FF 01 00    "   "    stx  X0100
        ;
EC32 : 00    " "    db  $00
        ;
EC33 : 01    " "    nop
EC34 : 40    "@"    nega
EC35        XEC35:
EC35 : FF FC 00    "   "    stx  XFC00
EC38 : 80 01    "  "    suba  #$01
        ;
EC3A : 00 00    "  "    db  $00, $00
        ;
EC3C : 01    " "    nop
EC3D : 40    "@"    nega
EC3E : FF FC 00    "   "    stx  XFC00
EC41 : 40    "@"    nega
EC42 : 01    " "    nop
EC43 : 01    " "    nop
        ;
EC44 : 00    " "    db  $00
        ;
EC45 : 01    " "    nop
EC46 : 40    "@"    nega
EC47 : FF 00 00    "   "    stx  X0000
EC4A : FF 40 FF    " @ "    stx  X40FF
EC4D : 40    "@"    nega
EC4E : FF 40 FF    " @ "    stx  X40FF
        ;
EC51 : 00 00    "  "    db  $00, $00
        ;
EC53 : FF 20 FF    "   "    stx  X20FF
EC56 : 20 FF    "  "    bra  LEC57
EC58 : 20 FF    "  "    bra  LEC59
        ;
EC5A : 00 00    "  "    db  $00, $00
        ;
EC5C : FF 01 00    "   "    stx  X0100
        ;
EC5F : 00    " "    db  $00
        ;
EC60 : 01    " "    nop
EC61 : 40    "@"    nega
EC62 : FF 00 00    "   "    stx  X0000
EC65 : FF 10 00    "   "    stx  X1000
        ;
EC68 : 00    " "    db  $00
        ;
EC69 : 01    " "    nop
EC6A : 40    "@"    nega
EC6B : FF FC 01    "   "    stx  XFC01
EC6E : FF 01 00    "   "    stx  X0100
EC71 : 40    "@"    nega
EC72 : FE 40 FF    " @ "    ldx  X40FF
        ;
EC75 : 00 00    "  "    db  $00, $00
        ;
EC77 : FF 40 FF    " @ "    stx  X40FF
        ;
EC7A : 00    " "    db  $00
        ;
EC7B : 01    " "    nop
EC7C : 40    "@"    nega
EC7D : FF FF 00    "   "    stx  XFF00
EC80 : A0 02    "  "    suba  $02,x
EC82 : 01    " "    nop
        ;
EC83 : 00    " "    db  $00
        ;
EC84 : 01    " "    nop
EC85 : 0F    " "    sei
EC86 : FF FA 00    "   "    stx  XFA00
EC89 : FF 01 01    "   "    stx  X0101
EC8C : 3F    "?"    swi
EC8D : FF 40 FF    " @ "    stx  X40FF
        ;
EC90 : 00 00    "  "    db  $00, $00
        ;
EC92 : 80 01    "  "    suba  #$01
EC94 : 01    " "    nop
        ;
EC95 : 00    " "    db  $00
        ;
EC96 : 01    " "    nop
EC97 : 0B    " "    sev
EC98 : FF FC 01    "   "    stx  XFC01
EC9B : FF 01 01    "   "    stx  X0101
EC9E : 3F    "?"    swi
EC9F : FF 40 FF    " @ "    stx  X40FF
        ;
ECA2 : FC    " "    db  $FC
        ;
ECA3 : 01    " "    nop
ECA4 : FF 01 00    "   "    stx  X0100
ECA7 : 40    "@"    nega
ECA8 : FF 40 FF    " @ "    stx  X40FF
        ;
ECAB : 00 00    "  "    db  $00, $00
        ;
ECAD : FF 01 01    "   "    stx  X0101
        ;
ECB0 : 00    " "    db  $00
        ;
ECB1 : 01    " "    nop
ECB2 : 10    " "    sba
ECB3 : FF FA 00    "   "    stx  XFA00
ECB6        LECB6:
ECB6 : FF 48 FF    " H "    stx  X48FF
ECB9 : 40    "@"    nega
ECBA : FF 10 FF    "   "    stx  X10FF
ECBD : F0 00 FF    "   "    subb  X00FF
ECC0 : 20 FF    "  "    bra  LECC1
ECC2 : 20 FF    "  "    bra  LECC3
ECC4 : 20 F0    "  "    bra  LECB6
        ;
ECC6        LECC6:
ECC6 : F9 00 A0    "   "    adcb  X00A0
        ;
ECC9 : 18    " "    db  $18
        ;
ECCA : FF 00 02    "   "    stx  X0002
ECCD : 10    " "    sba
ECCE : FF FC 00    "   "    stx  XFC00
ECD1 : F0 EC FE    "   "    subb  XECFE
        ;
ECD4 : ED 14 ED    "   "    db  $ED, $14, $ED
        ;
ECD7 : 27 ED    "' "    beq  LECC6
ECD9 : 2B ED    "+ "    bmi  LECC8
ECDB : 37    "7"    pshb
        ;
ECDC : ED    " "    db  $ED
        ;
ECDD : C5 ED    "  "    bitb  #$ED
        ;
ECDF : CD ED    "  "    db  $CD, $ED
        ;
ECE1 : D7 EE    "  "    stab  X00EE
ECE3 : 0E    " "    cli
        ;
ECE4 : ED    " "    db  $ED
        ;
ECE5 : 09    " "    dex
        ;
ECE6 : ED    " "    db  $ED
        ;
ECE7 : 2F ED    "/ "    ble  LECD6
ECE9 : 33    "3"    pulb
ECEA        XECEA:
ECEA : 48    "H"    asla
ECEB : CE EC D2    "   "    ldx  #$ECD2
ECEE : BD EE 70    "  p"    jsr  LEE70
ECF1 : EE 00    "  "    ldx  $00,x
ECF3 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
ECF5 : 7E F0 06    "~  "    jmp  LF006
        ;
ECF8 : 01    " "    nop
ECF9 : 01    " "    nop
ECFA : 01    " "    nop
ECFB : FF 03 E8    "   "    stx  X03E8
ECFE        XECFE:
ECFE : CE EC F8    "   "    ldx  #$ECF8
ED01 : 20 14    "  "    bra  LED17
        ;
ED03 : 01    " "    nop
ED04 : 01    " "    nop
ED05 : 10    " "    sba
ED06 : 4D    "M"    tsta
ED07 : 01    " "    nop
        ;
ED08 : 00    " "    db  $00
        ;
ED09 : CE ED 03    "   "    ldx  #$ED03
ED0C : 20 09    "  "    bra  LED17
        ;
ED0E : 01    " "    nop
ED0F : 01    " "    nop
ED10 : 01    " "    nop
ED11 : 40    "@"    nega
ED12 : 10    " "    sba
        ;
ED13 : 00    " "    db  $00
        ;
ED14 : CE ED 0E    "   "    ldx  #$ED0E
ED17        LED17:
ED17 : A6 00    "  "    ldaa  $00,x
ED19 : 97 06    "  "    staa  X0006
ED1B : A6 01    "  "    ldaa  $01,x
ED1D : 97 07    "  "    staa  X0007
ED1F : A6 02    "  "    ldaa  $02,x
ED21 : E6 03    "  "    ldab  $03,x
ED23 : EE 04    "  "    ldx  $04,x
ED25 : 20 17    "  "    bra  LED3E
        ;
ED27 : C6 02    "  "    ldab  #$02
ED29 : 20 0E    "  "    bra  LED39
        ;
ED2B : C6 03    "  "    ldab  #$03
ED2D : 20 0A    "  "    bra  LED39
        ;
ED2F : C6 05    "  "    ldab  #$05
ED31 : 20 06    "  "    bra  LED39
        ;
ED33 : C6 06    "  "    ldab  #$06
ED35 : 20 02    "  "    bra  LED39
        ;
ED37 : C6 04    "  "    ldab  #$04
ED39        LED39:
ED39 : 4F    "O"    clra
ED3A : 97 07    "  "    staa  X0007
ED3C : 97 06    "  "    staa  X0006
ED3E        LED3E:
ED3E : 97 05    "  "    staa  X0005
ED40 : D7 00    "  "    stab  X0000
ED42 : DF 03    "  "    stx  X0003
ED44 : 7F 00 02    "   "    clr  X0002
ED47 : 86 6C    " l"    ldaa  #$6C
ED49 : 97 01    "  "    staa  X0001
ED4B : 97 61    " a"    staa  X0061
ED4D : 86 E6    "  "    ldaa  #$E6
ED4F : 97 02    "  "    staa  X0002
ED51 : 97 62    " b"    staa  X0062
ED53 : B7 20 02    "   "    staa  X2002
ED56        LED56:
ED56 : DE 03    "  "    ldx  X0003
ED58 : B6 20 02    "   "    ldaa  X2002
ED5B        LED5B:
ED5B : 16    " "    tab
ED5C : 54    "T"    lsrb
ED5D : 54    "T"    lsrb
ED5E : 54    "T"    lsrb
ED5F : D8 02    "  "    eorb  X0002
ED61 : 54    "T"    lsrb
ED62 : 76 00 01    "v  "    ror  X0001
ED65 : 76 00 02    "v  "    ror  X0002
ED68 : D6 00    "  "    ldab  X0000
ED6A : 7D 00 06    "}  "    tst  X0006
ED6D : 27 04    "' "    beq  LED73
ED6F : D4 01    "  "    andb  X0001
ED71 : DB 07    "  "    addb  X0007
ED73        LED73:
ED73 : D7 61    " a"    stab  X0061
ED75 : D6 62    " b"    ldab  X0062
ED77 : 91 02    "  "    cmpa  X0002
ED79 : 22 12    "" "    bhi  LED8D
ED7B        LED7B:
ED7B : 09    " "    dex
ED7C : 27 26    "'&"    beq  LEDA4
ED7E : B7 20 02    "   "    staa  X2002
ED81 : DB 62    " b"    addb  X0062
ED83 : 99 61    " a"    adca  X0061
ED85 : 25 16    "% "    bcs  LED9D
ED87 : 91 02    "  "    cmpa  X0002
ED89 : 23 F0    "# "    bls  LED7B
ED8B : 20 10    "  "    bra  LED9D
        ;
ED8D        LED8D:
ED8D : 09    " "    dex
ED8E : 27 14    "' "    beq  LEDA4
ED90 : B7 20 02    "   "    staa  X2002
ED93 : D0 62    " b"    subb  X0062
ED95 : 92 61    " a"    sbca  X0061
ED97 : 25 04    "% "    bcs  LED9D
ED99 : 91 02    "  "    cmpa  X0002
ED9B : 22 F0    "" "    bhi  LED8D
ED9D        LED9D:
ED9D : 96 02    "  "    ldaa  X0002
ED9F : B7 20 02    "   "    staa  X2002
EDA2 : 20 B7    "  "    bra  LED5B
        ;
EDA4        LEDA4:
EDA4 : D6 05    "  "    ldab  X0005
EDA6 : 27 B3    "' "    beq  LED5B
EDA8 : 96 00    "  "    ldaa  X0000
EDAA : D6 62    " b"    ldab  X0062
EDAC : 44    "D"    lsra
EDAD : 56    "V"    rorb
EDAE : 44    "D"    lsra
EDAF : 56    "V"    rorb
EDB0 : 44    "D"    lsra
EDB1 : 56    "V"    rorb
EDB2 : 43    "C"    coma
EDB3 : 50    "P"    negb
EDB4 : 82 FF    "  "    sbca  #$FF
EDB6 : DB 62    " b"    addb  X0062
EDB8 : 99 00    "  "    adca  X0000
EDBA : D7 62    " b"    stab  X0062
EDBC : 97 00    "  "    staa  X0000
EDBE : 26 96    "& "    bne  LED56
EDC0 : C1 07    "  "    cmpb  #$07
EDC2 : 26 92    "& "    bne  LED56
EDC4 : 39    "9"    rts
        ;
EDC5 : 86 01    "  "    ldaa  #$01
EDC7 : 97 0B    "  "    staa  X000B
EDC9 : C6 03    "  "    ldab  #$03
EDCB : 20 12    "  "    bra  LEDDF
        ;
EDCD : 86 FF    "  "    ldaa  #$FF
EDCF : 97 0B    "  "    staa  X000B
EDD1 : 86 60    " `"    ldaa  #$60
EDD3 : C6 FF    "  "    ldab  #$FF
EDD5 : 20 08    "  "    bra  LEDDF
        ;
EDD7 : 86 01    "  "    ldaa  #$01
EDD9 : 97 0B    "  "    staa  X000B
EDDB : 86 01    "  "    ldaa  #$01
EDDD : C6 00    "  "    ldab  #$00
EDDF        LEDDF:
EDDF : 97 09    "  "    staa  X0009
EDE1 : 86 FF    "  "    ldaa  #$FF
EDE3 : B7 20 02    "   "    staa  X2002
EDE6 : D7 0A    "  "    stab  X000A
EDE8        LEDE8:
EDE8 : D6 0A    "  "    ldab  X000A
EDEA        LEDEA:
EDEA : 96 62    " b"    ldaa  X0062
EDEC : 44    "D"    lsra
EDED : 44    "D"    lsra
EDEE : 44    "D"    lsra
EDEF : 98 62    " b"    eora  X0062
EDF1 : 44    "D"    lsra
EDF2 : 76 00 61    "v a"    ror  X0061
EDF5 : 76 00 62    "v b"    ror  X0062
EDF8 : 24 03    "$ "    bcc  LEDFD
EDFA : 73 20 02    "s  "    com  X2002
EDFD        LEDFD:
EDFD : 96 09    "  "    ldaa  X0009
EDFF        LEDFF:
EDFF : 4A    "J"    deca
EE00 : 26 FD    "& "    bne  LEDFF
EE02 : 5A    "Z"    decb
EE03 : 26 E5    "& "    bne  LEDEA
EE05 : 96 09    "  "    ldaa  X0009
EE07 : 9B 0B    "  "    adda  X000B
EE09 : 97 09    "  "    staa  X0009
EE0B : 26 DB    "& "    bne  LEDE8
EE0D : 39    "9"    rts
        ;
EE0E : 86 20    "  "    ldaa  #$20
EE10 : 97 0A    "  "    staa  X000A
EE12 : 97 0E    "  "    staa  X000E
EE14 : 86 01    "  "    ldaa  #$01
EE16 : CE 00 01    "   "    ldx  #$0001
EE19 : C6 FF    "  "    ldab  #$FF
EE1B : 20 00    "  "    bra  LEE1D
        ;
EE1D        LEE1D:
EE1D : 97 0C    "  "    staa  X000C
EE1F        LEE1F:
EE1F : DF 0F    "  "    stx  X000F
EE21        LEE21:
EE21 : D7 0D    "  "    stab  X000D
EE23 : D6 0A    "  "    ldab  X000A
EE25        LEE25:
EE25 : 96 62    " b"    ldaa  X0062
EE27 : 44    "D"    lsra
EE28 : 44    "D"    lsra
EE29 : 44    "D"    lsra
EE2A : 98 62    " b"    eora  X0062
EE2C : 44    "D"    lsra
EE2D : 76 00 61    "v a"    ror  X0061
EE30 : 76 00 62    "v b"    ror  X0062
EE33 : 86 00    "  "    ldaa  #$00
EE35 : 24 02    "$ "    bcc  LEE39
EE37 : 96 0D    "  "    ldaa  X000D
EE39        LEE39:
EE39 : B7 20 02    "   "    staa  X2002
EE3C : DE 0F    "  "    ldx  X000F
EE3E        LEE3E:
EE3E : 09    " "    dex
EE3F : 26 FD    "& "    bne  LEE3E
EE41 : 5A    "Z"    decb
EE42 : 26 E1    "& "    bne  LEE25
EE44 : D6 0D    "  "    ldab  X000D
EE46 : D0 0C    "  "    subb  X000C
EE48 : 27 09    "' "    beq  LEE53
EE4A : DE 0F    "  "    ldx  X000F
EE4C : 08    " "    inx
EE4D : 96 0E    "  "    ldaa  X000E
EE4F : 27 D0    "' "    beq  LEE21
EE51 : 20 CC    "  "    bra  LEE1F
EE53        LEE53:
EE53 : 39    "9"    rts
        ;
EE54        LEE54:
EE54 : 96 61    " a"    ldaa  X0061
EE56 : D6 62    " b"    ldab  X0062
EE58 : 53    "S"    comb
EE59 : C5 09    "  "    bitb  #$09
EE5B : 26 05    "& "    bne  LEE62
EE5D : 53    "S"    comb
EE5E        LEE5E:
EE5E : 46    "F"    rora
EE5F : 56    "V"    rorb
EE60 : 20 09    "  "    bra  LEE6B
        ;
EE62        LEE62:
EE62 : 53    "S"    comb
EE63 : C5 09    "  "    bitb  #$09
EE65 : 26 02    "& "    bne  LEE69
EE67 : 27 F5    "' "    beq  LEE5E
EE69        LEE69:
EE69 : 44    "D"    lsra
EE6A : 56    "V"    rorb
EE6B        LEE6B:
EE6B : 97 61    " a"    staa  X0061
EE6D : D7 62    " b"    stab  X0062
EE6F : 39    "9"    rts
        ;
EE70        LEE70:
EE70 : DF 6A    " j"    stx  X006A
EE72 : 9B 6B    " k"    adda  X006B
EE74 : 97 6B    " k"    staa  X006B
EE76 : 24 03    "$ "    bcc  LEE7B
EE78 : 7C 00 6A    "| j"    inc  X006A
EE7B        LEE7B:
EE7B : DE 6A    " j"    ldx  X006A
EE7D : 39    "9"    rts
        ;
EE7E        LEE7E:
EE7E : DF 6A    " j"    stx  X006A
EE80 : DB 6B    " k"    addb  X006B
EE82 : D7 6B    " k"    stab  X006B
EE84 : 99 6A    " j"    adca  X006A
EE86 : 97 6A    " j"    staa  X006A
EE88 : DE 6A    " j"    ldx  X006A
EE8A : 39    "9"    rts
        ;
EE8B        LEE8B:
EE8B : 36    "6"    psha
EE8C        LEE8C:
EE8C : 5A    "Z"    decb
EE8D : 2B 07    "+ "    bmi  LEE96
EE8F : 32    "2"    pula
EE90 : 36    "6"    psha
EE91 : BD EE 70    "  p"    jsr  LEE70
EE94 : 20 F6    "  "    bra  LEE8C
        ;
EE96        LEE96:
EE96 : DF 6A    " j"    stx  X006A
EE98 : DF 72    " r"    stx  X0072
EE9A : CE 00 00    "   "    ldx  #$0000
EE9D : DF 70    " p"    stx  X0070
EE9F : DE 6A    " j"    ldx  X006A
EEA1 : 33    "3"    pulb
EEA2 : BD EE A6    "   "    jsr  LEEA6
EEA5 : 39    "9"    rts
        ;
EEA6        LEEA6:
EEA6 : 97 6F    " o"    staa  X006F
EEA8        LEEA8:
EEA8 : A6 00    "  "    ldaa  $00,x
EEAA : DF 6A    " j"    stx  X006A
EEAC : DE 70    " p"    ldx  X0070
EEAE : A7 00    "  "    staa  $00,x
EEB0 : 08    " "    inx
EEB1 : DF 70    " p"    stx  X0070
EEB3 : DE 6A    " j"    ldx  X006A
EEB5 : 08    " "    inx
EEB6 : 5A    "Z"    decb
EEB7 : 26 EF    "& "    bne  LEEA8
EEB9 : 96 6F    " o"    ldaa  X006F
EEBB : 39    "9"    rts
        ;
EEBC : 8D 03    "  "    bsr  LEEC1
EEBE : 7E F0 06    "~  "    jmp  LF006
        ;
EEC1        LEEC1:
EEC1 : 86 FF    "  "    ldaa  #$FF
EEC3 : 97 00    "  "    staa  X0000
EEC5 : CE FE C0    "   "    ldx  #$FEC0
EEC8 : DF 02    "  "    stx  X0002
EECA : 86 20    "  "    ldaa  #$20
EECC : CE FF E0    "   "    ldx  #$FFE0
EECF : 8D 05    "  "    bsr  LEED6
EED1 : 86 01    "  "    ldaa  #$01
EED3 : CE 00 44    "  D"    ldx  #$0044
EED6        LEED6:
EED6 : 97 04    "  "    staa  X0004
EED8 : DF 05    "  "    stx  X0005
EEDA        LEEDA:
EEDA : CE 00 10    "   "    ldx  #$0010
EEDD        LEEDD:
EEDD : 8D 21    " !"    bsr  LEF00
EEDF : 96 01    "  "    ldaa  X0001
EEE1 : 9B 03    "  "    adda  X0003
EEE3 : 97 01    "  "    staa  X0001
EEE5 : 96 00    "  "    ldaa  X0000
EEE7 : 99 02    "  "    adca  X0002
EEE9 : 97 00    "  "    staa  X0000
EEEB : 09    " "    dex
EEEC : 26 EF    "& "    bne  LEEDD
EEEE : 96 03    "  "    ldaa  X0003
EEF0 : 9B 04    "  "    adda  X0004
EEF2 : 97 03    "  "    staa  X0003
EEF4 : 24 03    "$ "    bcc  LEEF9
EEF6 : 7C 00 02    "|  "    inc  X0002
EEF9        LEEF9:
EEF9 : DE 02    "  "    ldx  X0002
EEFB : 9C 05    "  "    cpx  X0005
EEFD : 26 DB    "& "    bne  LEEDA
EEFF : 39    "9"    rts
        ;
EF00        LEF00:
EF00 : 4F    "O"    clra
EF01        LEF01:
EF01 : B7 20 02    "   "    staa  X2002
EF04 : 8B 20    "  "    adda  #$20
EF06 : 24 F9    "$ "    bcc  LEF01
EF08 : 8D 09    "  "    bsr  LEF13
EF0A : 86 E0    "  "    ldaa  #$E0
EF0C        LEF0C:
EF0C : B7 20 02    "   "    staa  X2002
EF0F : 80 20    "  "    suba  #$20
EF11 : 24 F9    "$ "    bcc  LEF0C
EF13        LEF13:
EF13 : D6 00    "  "    ldab  X0000
EF15        LEF15:
EF15 : 86 02    "  "    ldaa  #$02
EF17        LEF17:
EF17 : 4A    "J"    deca
EF18 : 26 FD    "& "    bne  LEF17
EF1A : 5A    "Z"    decb
EF1B : 26 F8    "& "    bne  LEF15
EF1D : 39    "9"    rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
EF1E : B6 20 00    "   "    ldaa  X2000
EF21 : 97 6E    " n"    staa  X006E
EF23 : 81 FF    "  "    cmpa  #$FF
EF25 : 23 01    "# "    bls  LEF28
EF27 : 3B    ";"    rti
        ;
EF28        LEF28:
EF28 : 8E 00 7F    "   "    lds  #$007F
EF2B : D6 60    " `"    ldab  X0060
EF2D : 2A 04    "* "    bpl  LEF33
EF2F : C4 70    " p"    andb  #$70
EF31 : 20 3E    " >"    bra  LEF71
        ;
EF33        LEF33:
EF33 : C5 08    "  "    bitb  #$08
EF35 : 27 3A    "':"    beq  LEF71
EF37 : C4 07    "  "    andb  #$07
EF39 : 27 36    "'6"    beq  LEF71
EF3B : C1 01    "  "    cmpb  #$01
EF3D : 26 10    "& "    bne  LEF4F
EF3F : 96 52    " R"    ldaa  X0052
EF41 : 97 57    " W"    staa  X0057
EF43 : DE 12    "  "    ldx  X0012
EF45 : DF 58    " X"    stx  X0058
EF47 : DF 50    " P"    stx  X0050
EF49 : 96 66    " f"    ldaa  X0066
EF4B : 97 5A    " Z"    staa  X005A
EF4D : 20 22    " ""    bra  LEF71
        ;
EF4F        LEF4F:
EF4F : C1 02    "  "    cmpb  #$02
EF51 : 26 02    "& "    bne  LEF55
EF53 : 20 12    "  "    bra  LEF67
        ;
EF55        LEF55:
EF55 : C1 06    "  "    cmpb  #$06
EF57 : 26 0A    "& "    bne  LEF63
EF59 : D6 12    "  "    ldab  X0012
EF5B        XEF5B:
EF5B : D7 64    " d"    stab  X0064
EF5D : D6 11    "  "    ldab  X0011
EF5F : D7 63    " c"    stab  X0063
EF61 : 20 0E    "  "    bra  LEF71
        ;
EF63        LEF63:
EF63 : C1 07    "  "    cmpb  #$07
EF65 : 26 0A    "& "    bne  LEF71
EF67        LEF67:
EF67 : DE 12    "  "    ldx  X0012
EF69 : DF 50    " P"    stx  X0050
EF6B : 96 66    " f"    ldaa  X0066
EF6D : 97 53    " S"    staa  X0053
EF6F : 20 00    "  "    bra  LEF71
        ;
EF71        LEF71:
EF71 : D6 60    " `"    ldab  X0060
EF73 : C4 77    " w"    andb  #$77
EF75 : D7 60    " `"    stab  X0060
EF77 : 96 6E    " n"    ldaa  X006E
EF79        LEF79:
EF79 : 26 19    "& "    bne  LEF94
EF7B : 96 60    " `"    ldaa  X0060
EF7D        XEF7D:
EF7D : 84 70    " p"    anda  #$70
EF7F : 97 60    " `"    staa  X0060
EF81 : CE 00 50    "  P"    ldx  #$0050
EF84 : 86 10    "  "    ldaa  #$10
EF86        LEF86:
EF86 : 6F 00    "o "    clr  $00,x
EF88 : 08    " "    inx
EF89 : 4A    "J"    deca
EF8A : 26 FA    "& "    bne  LEF86
EF8C : CE EF 92    "   "    ldx  #$EF92
EF8F : 7E EF B8    "~  "    jmp  LEFB8
EF92        LEF92:
EF92 : 20 FE    "  "    bra  LEF92
        ;
EF94        LEF94:
EF94 : CE F1 CC    "   "    ldx  #$F1CC
EF97 : 4A    "J"    deca
EF98 : 16    " "    tab
EF99 : 97 6E    " n"    staa  X006E
EF9B : 4F    "O"    clra
EF9C : 58    "X"    aslb
EF9D : 89 00    "  "    adca  #$00
EF9F : DB 6E    " n"    addb  X006E
EFA1 : 89 00    "  "    adca  #$00
EFA3 : BD EE 7E    "  ~"    jsr  LEE7E
EFA6 : A6 00    "  "    ldaa  $00,x
EFA8 : E6 02    "  "    ldab  $02,x
EFAA : D7 66    " f"    stab  X0066
EFAC : E6 01    "  "    ldab  $01,x
EFAE        XEFAE:
EFAE : 48    "H"    asla
EFAF : CE F1 9C    "   "    ldx  #$F19C
EFB2 : BD EE 70    "  p"    jsr  LEE70
EFB5 : EE 00    "  "    ldx  $00,x
EFB7 : 17    " "    tba
EFB8        LEFB8:
EFB8 : 0E    " "    cli
EFB9 : 6E 00    "n "    jmp  $00,x            ;INFO: index jump
        ;
EFBB : D6 60    " `"    ldab  X0060
EFBD : C4 70    " p"    andb  #$70
EFBF : CA 05    "  "    orab  #$05
EFC1 : CA 08    "  "    orab  #$08
EFC3 : D7 60    " `"    stab  X0060
EFC5 : 97 5B    " ["    staa  X005B
EFC7        LEFC7:
EFC7 : 96 5B    " ["    ldaa  X005B
EFC9 : CE E1 C0    "   "    ldx  #$E1C0
EFCC : BD EF B8    "   "    jsr  LEFB8
EFCF : 20 F6    "  "    bra  LEFC7
        ;
EFD1 : 97 65    " e"    staa  X0065
EFD3 : BD EF E6    "   "    jsr  LEFE6
EFD6 : D6 60    " `"    ldab  X0060
EFD8 : C4 70    " p"    andb  #$70
EFDA : CA 06    "  "    orab  #$06
EFDC        XEFDC:
EFDC : CA 08    "  "    orab  #$08
EFDE : D7 60    " `"    stab  X0060
EFE0 : CE E9 AF    "   "    ldx  #$E9AF
EFE3 : 7E EF B8    "~  "    jmp  LEFB8
        ;
EFE6        LEFE6:
EFE6 : 48    "H"    asla
EFE7 : CE EF FE    "   "    ldx  #$EFFE
EFEA : BD EE 70    "  p"    jsr  LEE70
EFED : EE 00    "  "    ldx  $00,x
EFEF : DF 6A    " j"    stx  X006A
EFF1 : CE 00 00    "   "    ldx  #$0000
EFF4 : DF 70    " p"    stx  X0070
EFF6 : DE 6A    " j"    ldx  X006A
EFF8 : C6 0C    "  "    ldab  #$0C
EFFA : BD EE A6    "   "    jsr  LEEA6
EFFD : 39    "9"    rts
        ;
EFFE : EA DF    "  "    orab  $DF,x
F000 : EA D3    "  "    orab  $D3,x
F002        XF002:
F002 : EA 7F    "  "    orab  $7F,x
F004 : EA C7    "  "    orab  $C7,x
F006        LF006:
F006 : 8E 00 7F    "   "    lds  #$007F
F009 : D6 60    " `"    ldab  X0060
F00B : 2A 02    "* "    bpl  LF00F
F00D : C4 70    " p"    andb  #$70
F00F        LF00F:
F00F : D6 60    " `"    ldab  X0060
F011 : C4 77    " w"    andb  #$77
F013 : D7 60    " `"    stab  X0060
F015        LF015:
F015        XF015:
F015 : 96 66    " f"    ldaa  X0066
F017 : 27 05    "' "    beq  LF01E
F019        XF019:
F019 : 7E EF 79    "~ y"    jmp  LEF79
F01C        LF01C:
F01C : 20 FE    "  "    bra  LF01C
        ;
F01E        LF01E:
F01E : D6 60    " `"    ldab  X0060
F020 : C4 07    "  "    andb  #$07
F022 : 27 F8    "' "    beq  LF01C
F024 : C1 01    "  "    cmpb  #$01
F026 : 26 06    "& "    bne  LF02E
F028 : 96 5A    " Z"    ldaa  X005A
F02A : 97 53    " S"    staa  X0053
F02C : 20 64    " d"    bra  LF092
        ;
F02E        LF02E:
F02E : C1 02    "  "    cmpb  #$02
F030 : 26 02    "& "    bne  LF034
F032 : 20 5E    " ^"    bra  LF092
        ;
F034        LF034:
F034 : C1 03    "  "    cmpb  #$03
F036 : 26 1D    "& "    bne  LF055
F038 : D6 60    " `"    ldab  X0060
F03A : CA 08    "  "    orab  #$08
F03C : D7 60    " `"    stab  X0060
F03E : C6 04    "  "    ldab  #$04
F040 : CE EC 27    "  '"    ldx  #$EC27
F043 : 86 09    "  "    ldaa  #$09
F045 : BD EE 8B    "   "    jsr  LEE8B
F048 : BD EB 93    "   "    jsr  LEB93
F04B : 96 56    " V"    ldaa  X0056
F04D : 97 15    "  "    staa  X0015
F04F : CE EB CE    "   "    ldx  #$EBCE
F052 : 7E EF B8    "~  "    jmp  LEFB8
        ;
F055        LF055:
F055 : C1 05    "  "    cmpb  #$05
F057 : 26 10    "& "    bne  LF069
F059 : D6 60    " `"    ldab  X0060
F05B : CA 08    "  "    orab  #$08
F05D : D7 60    " `"    stab  X0060
F05F        LF05F:
F05F : 96 5B    " ["    ldaa  X005B
F061 : CE E1 C0    "   "    ldx  #$E1C0
F064 : BD EF B8    "   "    jsr  LEFB8
F067 : 20 F6    "  "    bra  LF05F
        ;
F069        LF069:
F069 : C1 06    "  "    cmpb  #$06
F06B : 26 21    "&!"    bne  LF08E
F06D : D6 60    " `"    ldab  X0060
F06F : CA 08    "  "    orab  #$08
F071 : D7 60    " `"    stab  X0060
F073 : 96 65    " e"    ldaa  X0065
F075 : BD EF E6    "   "    jsr  LEFE6
F078 : D6 63    " c"    ldab  X0063
F07A : D7 0D    "  "    stab  X000D
F07C : D6 64    " d"    ldab  X0064
F07E : D7 0E    "  "    stab  X000E
F080 : D6 09    "  "    ldab  X0009
F082 : D7 17    "  "    stab  X0017
F084 : D6 0A    "  "    ldab  X000A
F086 : D7 18    "  "    stab  X0018
F088 : CE E9 BF    "   "    ldx  #$E9BF
F08B : 7E EF B8    "~  "    jmp  LEFB8
        ;
F08E        LF08E:
F08E : C1 07    "  "    cmpb  #$07
F090 : 26 8A    "& "    bne  LF01C
F092        LF092:
F092 : 96 52    " R"    ldaa  X0052
F094 : 16    " "    tab
F095 : 4F    "O"    clra
F096 : 58    "X"    aslb
F097 : 89 00    "  "    adca  #$00
F099 : D7 6F    " o"    stab  X006F
F09B : 58    "X"    aslb
F09C : 89 00    "  "    adca  #$00
F09E : DB 6F    " o"    addb  X006F
F0A0 : 89 00    "  "    adca  #$00
F0A2        XF0A2:
F0A2 : CE F7 24    "  $"    ldx  #$F724
F0A5 : BD EE 7E    "  ~"    jsr  LEE7E
F0A8 : A6 02    "  "    ldaa  $02,x
F0AA : 97 12    "  "    staa  X0012
F0AC : A6 03    "  "    ldaa  $03,x
F0AE : 97 13    "  "    staa  X0013
F0B0 : A6 04    "  "    ldaa  $04,x
F0B2 : 97 14    "  "    staa  X0014
F0B4 : A6 05    "  "    ldaa  $05,x
F0B6 : 97 1D    "  "    staa  X001D
F0B8 : 97 15    "  "    staa  X0015
F0BA : EE 00    "  "    ldx  $00,x
F0BC : DF 6A    " j"    stx  X006A
F0BE : CE 00 00    "   "    ldx  #$0000
F0C1 : DF 70    " p"    stx  X0070
F0C3 : C6 12    "  "    ldab  #$12
F0C5 : DE 6A    " j"    ldx  X006A
F0C7 : DF 67    " g"    stx  X0067
F0C9 : BD EE A6    "   "    jsr  LEEA6
F0CC : D6 60    " `"    ldab  X0060
F0CE : C5 08    "  "    bitb  #$08
F0D0 : 26 19    "& "    bne  LF0EB
F0D2 : DE 50    " P"    ldx  X0050
F0D4 : 86 01    "  "    ldaa  #$01
F0D6        LF0D6:
F0D6 : E6 00    "  "    ldab  $00,x
F0D8 : 26 04    "& "    bne  LF0DE
F0DA : EE 01    "  "    ldx  $01,x
F0DC : 20 04    "  "    bra  LF0E2
        ;
F0DE        LF0DE:
F0DE : 08    " "    inx
F0DF : 08    " "    inx
F0E0 : 08    " "    inx
F0E1 : 08    " "    inx
F0E2        LF0E2:
F0E2 : 4A    "J"    deca
F0E3 : 26 F1    "& "    bne  LF0D6
F0E5 : DF 12    "  "    stx  X0012
F0E7 : D6 53    " S"    ldab  X0053
F0E9 : D7 66    " f"    stab  X0066
F0EB        LF0EB:
F0EB : D6 60    " `"    ldab  X0060
F0ED : C4 7F    "  "    andb  #$7F
F0EF : CA 08    "  "    orab  #$08
F0F1 : D7 60    " `"    stab  X0060
F0F3 : CE E5 3E    "  >"    ldx  #$E53E
F0F6 : 7E EF B8    "~  "    jmp  LEFB8
        ;
F0F9 : D6 60    " `"    ldab  X0060
F0FB : C4 70    " p"    andb  #$70
F0FD : CA 03    "  "    orab  #$03
F0FF : CA 08    "  "    orab  #$08
F101 : D7 60    " `"    stab  X0060
F103 : 97 54    " T"    staa  X0054
F105 : 81 02    "  "    cmpa  #$02
F107 : 23 05    "# "    bls  LF10E
F109 : 86 4A    " J"    ldaa  #$4A
F10B : 7E EF 79    "~ y"    jmp  LEF79
        ;
F10E        LF10E:
F10E : CE F1 1C    "   "    ldx  #$F11C
F111 : BD EE 70    "  p"    jsr  LEE70
F114 : A6 00    "  "    ldaa  $00,x
F116 : CE EC EA    "   "    ldx  #$ECEA
F119 : 7E EF B8    "~  "    jmp  LEFB8
        ;
F11C : 04    " "    db  $04
        ;
F11D : 0A    " "    clv
F11E : 0B    " "    sev
F11F : D6 60    " `"    ldab  X0060
F121 : C4 07    "  "    andb  #$07
F123 : C1 07    "  "    cmpb  #$07
F125 : 26 0A    "& "    bne  LF131
F127 : 91 52    " R"    cmpa  X0052
F129 : 26 06    "& "    bne  LF131
F12B : D6 60    " `"    ldab  X0060
F12D : C4 77    " w"    andb  #$77
F12F : 20 0C    "  "    bra  LF13D
        ;
F131        LF131:
F131 : D6 60    " `"    ldab  X0060
F133 : C4 70    " p"    andb  #$70
F135 : CA 08    "  "    orab  #$08
F137 : CA 07    "  "    orab  #$07
F139 : D7 60    " `"    stab  X0060
F13B : 97 52    " R"    staa  X0052
F13D        LF13D:
F13D : 7E F0 1E    "~  "    jmp  LF01E
        ;
F140 : CE F1 6C    "  l"    ldx  #$F16C
F143 : 96 54    " T"    ldaa  X0054
F145 : 4C    "L"    inca
F146 : 81 04    "  "    cmpa  #$04
F148 : 22 07    "" "    bhi  LF151
F14A : 97 54    " T"    staa  X0054
F14C : BD EE 70    "  p"    jsr  LEE70
F14F : 20 03    "  "    bra  LF154
        ;
F151        LF151:
F151 : 4F    "O"    clra
F152 : 97 54    " T"    staa  X0054
F154        LF154:
F154 : A6 00    "  "    ldaa  $00,x
F156 : 97 52    " R"    staa  X0052
F158 : 96 60    " `"    ldaa  X0060
F15A : 16    " "    tab
F15B : C4 70    " p"    andb  #$70
F15D : CA 02    "  "    orab  #$02
F15F : 84 07    "  "    anda  #$07
F161 : 81 02    "  "    cmpa  #$02
F163 : 27 02    "' "    beq  LF167
F165 : CA 08    "  "    orab  #$08
F167        LF167:
F167 : D7 60    " `"    stab  X0060
F169 : 7E F0 1E    "~  "    jmp  LF01E
        ;
F16C : 30    "0"    tsx
F16D : 2C 2B    ",+"    bge  LF19A
F16F : 2A 21    "*!"    bpl  LF192
F171 : D6 60    " `"    ldab  X0060
F173 : C4 70    " p"    andb  #$70
F175 : CA 01    "  "    orab  #$01
F177 : D7 60    " `"    stab  X0060
F179 : D6 57    " W"    ldab  X0057
F17B : 27 09    "' "    beq  LF186
F17D : D7 52    " R"    stab  X0052
F17F : DE 58    " X"    ldx  X0058
F181 : DF 50    " P"    stx  X0050
F183 : 7E F0 1E    "~  "    jmp  LF01E
        ;
F186        LF186:
F186 : 97 52    " R"    staa  X0052
F188 : 97 57    " W"    staa  X0057
F18A : D6 60    " `"    ldab  X0060
F18C : CA 08    "  "    orab  #$08
F18E : D7 60    " `"    stab  X0060
F190 : 7E F0 1E    "~  "    jmp  LF01E
        ;
F193 : CE E1 C0    "   "    ldx  #$E1C0
F196 : BD EF B8    "   "    jsr  LEFB8
F199 : 7E F0 06    "~  "    jmp  LF006
        ;
F19C : E3    " "    db  $E3
        ;
F19D : EF E4    "  "    stx  $E4,x
F19F : 67 E4    "g "    asr  $E4,x
F1A1 : F8 F0 15    "   "    eorb  XF015
F1A4 : E6 2D    " -"    ldab  $2D,x
F1A6 : E7 20    "  "    stab  $20,x
F1A8 : E7 CD    "  "    stab  $CD,x
F1AA : E7 ED    "  "    stab  $ED,x
F1AC : E9 A6    "  "    adcb  $A6,x
F1AE : E8 52    " R"    eorb  $52,x
F1B0 : E8 E5    "  "    eorb  $E5,x
F1B2 : EB C2    "  "    addb  $C2,x
F1B4 : E7 16    "  "    stab  $16,x
F1B6 : F1 1F F1    "   "    cmpb  X1FF1
F1B9 : 40    "@"    nega
F1BA : F1 93 EF    "   "    cmpb  X93EF
F1BD : D1 EF    "  "    cmpb  X00EF
F1BF : BB EC EA    "   "    adda  XECEA
F1C2 : EF 7B    " {"    stx  $7B,x
F1C4        XF1C4:
F1C4 : F0 F9 F1    "   "    subb  XF9F1
        ;
F1C7 : 71    "q"    db  $71
        ;
F1C8 : F1 86 EE    "   "    cmpb  X86EE
F1CB : BC 0F 0A    "   "    cpx  X0F0A
        ;
F1CE : 00 05    "  "    db  $00, $05
        ;
F1D0 : 01    " "    nop
        ;
F1D1 : 42    "B"    db  $42
        ;
F1D2 : 0B    " "    sev
        ;
F1D3 : 02 00 04    "   "    db  $02, $00, $04
        ;
F1D6 : 01    " "    nop
        ;
F1D7 : 00 04 02 00  "    "    db  $00, $04, $02, $00
F1DB : 04 03 00    "   "    db  $04, $03, $00
        ;
F1DE : 09    " "    dex
F1DF : 01    " "    nop
        ;
F1E0 : 00 04 05 00  "    "    db  $00, $04, $05, $00
F1E4 : 04    " "    db  $04
        ;
F1E5 : 06    " "    tap
        ;
F1E6 : 00 04    "  "    db  $00, $04
        ;
F1E8 : 07    " "    tpa
        ;
F1E9 : 00 03 00 00  "    "    db  $00, $03, $00, $00
F1ED : 00    " "    db  $00
        ;
F1EE : 01    " "    nop
        ;
F1EF : 00 00 02 00  "    "    db  $00, $00, $02, $00
F1F3 : 00 03 00    "   "    db  $00, $03, $00
        ;
F1F6 : 07    " "    tpa
        ;
F1F7 : 00 00    "  "    db  $00, $00
        ;
F1F9 : 0F    " "    sei
        ;
F1FA : 00 00    "  "    db  $00, $00
        ;
F1FC : 0F    " "    sei
F1FD : 01    " "    nop
        ;
F1FE : 00    " "    db  $00
        ;
F1FF : 0F    " "    sei
        ;
F200 : 02 00    "  "    db  $02, $00
        ;
F202 : 0F    " "    sei
        ;
F203 : 03 00    "  "    db  $03, $00
        ;
F205 : 0F    " "    sei
        ;
F206 : 04 00    "  "    db  $04, $00
        ;
F208 : 0F    " "    sei
        ;
F209 : 05 00    "  "    db  $05, $00
        ;
F20B : 0F    " "    sei
F20C : 06    " "    tap
        ;
F20D : 00    " "    db  $00
        ;
F20E : 0F    " "    sei
F20F : 07    " "    tpa
        ;
F210 : 00    " "    db  $00
        ;
F211 : 0F    " "    sei
F212 : 08    " "    inx
        ;
F213 : 00    " "    db  $00
        ;
F214 : 0F    " "    sei
F215 : 09    " "    dex
        ;
F216 : 00    " "    db  $00
        ;
F217 : 0F    " "    sei
F218 : 0A    " "    clv
        ;
F219 : 00    " "    db  $00
        ;
F21A : 0F    " "    sei
F21B : 0B    " "    sev
        ;
F21C : 00    " "    db  $00
        ;
F21D : 0F    " "    sei
F21E : 0C    " "    clc
        ;
F21F : 00    " "    db  $00
        ;
F220 : 0F    " "    sei
F221 : 0D    " "    sec
        ;
F222 : 00    " "    db  $00
        ;
F223 : 0F    " "    sei
F224 : 0E    " "    cli
        ;
F225 : 00    " "    db  $00
        ;
F226 : 01    " "    nop
F227 : 49    "I"    rola
        ;
F228 : 00    " "    db  $00
        ;
F229 : 0D    " "    sec
F22A : 2C 00    ", "    bge  LF22C
F22C        LF22C:
F22C : 0D    " "    sec
F22D : 30    "0"    tsx
        ;
F22E : 00 05    "  "    db  $00, $05
        ;
F230 : 07    " "    tpa
        ;
F231 : 00 05    "  "    db  $00, $05
        ;
F233 : 08    " "    inx
        ;
F234 : 00 05    "  "    db  $00, $05
        ;
F236 : 09    " "    dex
        ;
F237 : 00 05    "  "    db  $00, $05
        ;
F239 : 0A    " "    clv
        ;
F23A : 00 05    "  "    db  $00, $05
        ;
F23C : 0B    " "    sev
        ;
F23D : 00 05    "  "    db  $00, $05
        ;
F23F : 0C    " "    clc
        ;
F240 : 00 05    "  "    db  $00, $05
        ;
F242 : 0D    " "    sec
        ;
F243 : 00 05    "  "    db  $00, $05
        ;
F245 : 0E    " "    cli
        ;
F246 : 00    " "    db  $00
        ;
F247 : 16    " "    tab
F248 : 30    "0"    tsx
F249 : 2C 10    ", "    bge  LF25B
        ;
F24B : 03 00    "  "    db  $03, $00
        ;
F24D : 16    " "    tab
F24E : 2C 30    ",0"    bge  LF280
F250 : 0D    " "    sec
F251 : 34    "4"    des
        ;
F252 : 00    " "    db  $00
        ;
F253 : 0E    " "    cli
        ;
F254 : 00 00 15    "   "    db  $00, $00, $15
        ;
F257 : 2C 30    ",0"    bge  LF289
F259 : 16    " "    tab
F25A : 2B 31    "+1"    bmi  LF28D
F25C : 16    " "    tab
F25D : 2A 32    "*2"    bpl  LF291
F25F : 16    " "    tab
        ;
F260 : 21    "!"    db  $21
        ;
F261 : 2A 05    "* "    bpl  LF268
F263 : 01    " "    nop
F264 : 86 05    "  "    ldaa  #$05
F266 : 01    " "    nop
F267 : 88 05    "  "    eora  #$05
F269 : 01    " "    nop
        ;
F26A : 87 05    "  "    db  $87, $05
        ;
F26C : 01    " "    nop
F26D : 8A 08    "  "    oraa  #$08
        ;
F26F : 02    " "    db  $02
F270        XF270:
F270 : 00    " "    db  $00
        ;
F271 : 08    " "    inx
        ;
F272 : 03 00    "  "    db  $03, $00
        ;
F274 : 08    " "    inx
        ;
F275 : 04 00    "  "    db  $04, $00
        ;
F277 : 09    " "    dex
        ;
F278 : 00 00    "  "    db  $00, $00
        ;
F27A : 09    " "    dex
F27B : 01    " "    nop
        ;
F27C : 00    " "    db  $00
        ;
F27D : 0A    " "    clv
        ;
F27E : 00 00    "  "    db  $00, $00
        ;
F280        LF280:
F280 : 0A    " "    clv
F281 : 01    " "    nop
        ;
F282 : 00    " "    db  $00
        ;
F283 : 0A    " "    clv
        ;
F284 : 02 00    "  "    db  $02, $00
        ;
F286 : 01    " "    nop
F287 : 4A    "J"    deca
        ;
F288 : 00    " "    db  $00
        ;
F289        LF289:
F289 : 0A    " "    clv
        ;
F28A : 04 00    "  "    db  $04, $00
        ;
F28C : 0A    " "    clv
        ;
F28D        LF28D:
F28D : 05 00    "  "    db  $05, $00
        ;
F28F : 0A    " "    clv
F290 : 06    " "    tap
        ;
F291        LF291:
F291 : 00 05    "  "    db  $00, $05
        ;
F293 : 01    " "    nop
F294 : 89 0A    "  "    adca  #$0A
F296 : 08    " "    inx
        ;
F297 : 00    " "    db  $00
        ;
F298 : 0A    " "    clv
F299 : 09    " "    dex
        ;
F29A : 00    " "    db  $00
        ;
F29B : 0B    " "    sev
        ;
F29C : 00 00    "  "    db  $00, $00
        ;
F29E : 0B    " "    sev
F29F : 01    " "    nop
        ;
F2A0 : 00    " "    db  $00
        ;
F2A1 : 0B    " "    sev
        ;
F2A2 : 02 00    "  "    db  $02, $00
        ;
F2A4 : 0B    " "    sev
        ;
F2A5 : 03 00    "  "    db  $03, $00
        ;
F2A7 : 0B    " "    sev
        ;
F2A8 : 04 00    "  "    db  $04, $00
        ;
F2AA : 0B    " "    sev
        ;
F2AB : 05 00    "  "    db  $05, $00
        ;
F2AD : 0B    " "    sev
F2AE : 06    " "    tap
        ;
F2AF : 00    " "    db  $00
        ;
F2B0 : 0B    " "    sev
F2B1 : 07    " "    tpa
        ;
F2B2 : 00    " "    db  $00
        ;
F2B3 : 0B    " "    sev
F2B4 : 08    " "    inx
        ;
F2B5 : 00    " "    db  $00
        ;
F2B6 : 0B    " "    sev
F2B7 : 09    " "    dex
        ;
F2B8 : 00    " "    db  $00
        ;
F2B9 : 0B    " "    sev
F2BA : 0A    " "    clv
        ;
F2BB : 00    " "    db  $00
        ;
F2BC : 0B    " "    sev
F2BD : 0B    " "    sev
        ;
F2BE : 00    " "    db  $00
        ;
F2BF : 0B    " "    sev
F2C0 : 0C    " "    clc
        ;
F2C1 : 00    " "    db  $00
        ;
F2C2 : 0B    " "    sev
F2C3 : 0D    " "    sec
        ;
F2C4 : 00    " "    db  $00
        ;
F2C5 : 0B    " "    sev
F2C6 : 0E    " "    cli
        ;
F2C7 : 00    " "    db  $00
        ;
F2C8 : 06    " "    tap
        ;
F2C9 : 00 00    "  "    db  $00, $00
        ;
F2CB : 07    " "    tpa
        ;
F2CC : 00 00    "  "    db  $00, $00
        ;
F2CE : 01    " "    nop
F2CF : 49    "I"    rola
        ;
F2D0 : 00    " "    db  $00
        ;
F2D1 : 01    " "    nop
F2D2 : 4A    "J"    deca
        ;
F2D3 : 00    " "    db  $00
        ;
F2D4 : 01    " "    nop
        ;
F2D5 : 4B 00 03 00  "K   "    db  $4B, $00, $03, $00
F2D9 : 00 05 04 00  "    "    db  $00, $05, $04, $00
        ;
F2DD : 08    " "    inx
        ;
F2DE : 05 00    "  "    db  $05, $00
        ;
F2E0 : 08    " "    inx
F2E1 : 06    " "    tap
        ;
F2E2        XF2E2:
F2E2 : 00    " "    db  $00
        ;
F2E3 : 08    " "    inx
F2E4 : 07    " "    tpa
        ;
F2E5 : 00    " "    db  $00
        ;
F2E6 : 08    " "    inx
F2E7 : 08    " "    inx
        ;
F2E8 : 00    " "    db  $00
        ;
F2E9 : 08    " "    inx
F2EA : 09    " "    dex
        ;
F2EB : 00    " "    db  $00
        ;
F2EC : 08    " "    inx
F2ED : 0A    " "    clv
        ;
F2EE : 00    " "    db  $00
        ;
F2EF : 17    " "    tba
        ;
F2F0 : 00 00    "  "    db  $00, $00
        ;
F2F2 : 08    " "    inx
F2F3 : 0C    " "    clc
        ;
F2F4 : 00    " "    db  $00
        ;
F2F5 : 08    " "    inx
F2F6 : 0D    " "    sec
        ;
F2F7 : 00    " "    db  $00
        ;
F2F8 : 08    " "    inx
F2F9 : 0E    " "    cli
        ;
F2FA : 00    " "    db  $00
        ;
F2FB : 08    " "    inx
F2FC : 0F    " "    sei
        ;
F2FD : 00    " "    db  $00
        ;
F2FE : 08    " "    inx
F2FF : 10    " "    sba
        ;
F300 : 00    " "    db  $00
        ;
F301 : 08    " "    inx
F302 : 11    " "    cba
        ;
F303 : 00    " "    db  $00
        ;
F304 : 08    " "    inx
        ;
F305 : 12 00    "  "    db  $12, $00
        ;
F307 : 08    " "    inx
        ;
F308 : 13 00    "  "    db  $13, $00
        ;
F30A : 08    " "    inx
        ;
F30B : 14 00    "  "    db  $14, $00
        ;
F30D : 08    " "    inx
        ;
F30E : 15 00    "  "    db  $15, $00
        ;
F310 : 08    " "    inx
F311 : 16    " "    tab
        ;
F312 : 00    " "    db  $00
        ;
F313 : 08    " "    inx
F314 : 17    " "    tba
        ;
F315 : 00    " "    db  $00
        ;
F316 : 08    " "    inx
        ;
F317 : 18 00 02 05  "    "    db  $18, $00, $02, $05
F31B : 00 02    "  "    db  $00, $02
        ;
F31D : 06    " "    tap
        ;
F31E : 00 02 03 00  "    "    db  $00, $02, $03, $00
F322 : 02 04 00 02  "    "    db  $02, $04, $00, $02
F326 : 05 00 02    "   "    db  $05, $00, $02
        ;
F329 : 06    " "    tap
        ;
F32A : 00 02    "  "    db  $00, $02
        ;
F32C : 0D    " "    sec
        ;
F32D : 00 02    "  "    db  $00, $02
        ;
F32F : 08    " "    inx
        ;
F330 : 00 02 13 00  "    "    db  $00, $02, $13, $00
F334 : 02    " "    db  $02
        ;
F335 : 0A    " "    clv
        ;
F336 : 00 02    "  "    db  $00, $02
        ;
F338 : 0B    " "    sev
        ;
F339 : 00 02    "  "    db  $00, $02
        ;
F33B : 0C    " "    clc
        ;
F33C : 00 02    "  "    db  $00, $02
        ;
F33E : 0D    " "    sec
        ;
F33F : 00 02    "  "    db  $00, $02
        ;
F341 : 0E    " "    cli
        ;
F342 : 00 02 18 00  "    "    db  $00, $02, $18, $00
        ;
F346 : 01    " "    nop
        ;
F347 : 4B 00 05 03  "K   "    db  $4B, $00, $05, $03
F34B : 00 05 04 00  "    "    db  $00, $05, $04, $00
        ;
F34F : 0B    " "    sev
F350 : 0F    " "    sei
        ;
F351 : 00    " "    db  $00
        ;
F352 : 0B    " "    sev
F353 : 10    " "    sba
        ;
F354 : 00    " "    db  $00
        ;
F355 : 0B    " "    sev
F356 : 11    " "    cba
        ;
F357 : 00    " "    db  $00
        ;
F358 : 0B    " "    sev
        ;
F359 : 12 00    "  "    db  $12, $00
        ;
F35B : 08    " "    inx
        ;
F35C : 00 00    "  "    db  $00, $00
        ;
F35E : 08    " "    inx
F35F : 19    " "    daa
        ;
F360 : 00    " "    db  $00
        ;
F361 : 08    " "    inx
        ;
F362 : 1A 00    "  "    db  $1A, $00
        ;
F364 : 0A    " "    clv
F365 : 07    " "    tpa
        ;
F366 : 00    " "    db  $00
        ;
F367 : 08    " "    inx
F368 : 01    " "    nop
        ;
F369 : 00    " "    db  $00
        ;
F36A : 0D    " "    sec
        ;
F36B : 00 00 04    "   "    db  $00, $00, $04
        ;
F36E : 08    " "    inx
        ;
F36F : 00 04    "  "    db  $00, $04
        ;
F371 : 09    " "    dex
        ;
F372 : 00 05 05 00  "    "    db  $00, $05, $05, $00
F376 : 03 00 00 02  "    "    db  $03, $00, $00, $02
F37A : 38 00    "8 "    db  $38, $00
        ;
F37C : 0D    " "    sec
F37D : 01    " "    nop
        ;
F37E : 00    " "    db  $00
        ;
F37F : 0D    " "    sec
        ;
F380 : 02 00 02    "   "    db  $02, $00, $02
        ;
F383 : 39    "9"    rts
        ;
F384 : 00    " "    db  $00
        ;
F385 : 0D    " "    sec
        ;
F386 : 15 00 05    "   "    db  $15, $00, $05
        ;
F389 : 06    " "    tap
        ;
F38A : 00 02 3A 00  "  : "    db  $00, $02, $3A, $00
        ;
F38E : 01    " "    nop
F38F : 01    " "    nop
        ;
F390 : 00    " "    db  $00
        ;
F391 : 01    " "    nop
        ;
F392 : 02 00    "  "    db  $02, $00
        ;
F394 : 01    " "    nop
        ;
F395 : 03 00    "  "    db  $03, $00
        ;
F397 : 01    " "    nop
        ;
F398 : 04 00    "  "    db  $04, $00
        ;
F39A : 01    " "    nop
        ;
F39B : 05 00    "  "    db  $05, $00
        ;
F39D : 01    " "    nop
F39E : 06    " "    tap
        ;
F39F : 00    " "    db  $00
        ;
F3A0 : 01    " "    nop
F3A1 : 07    " "    tpa
        ;
F3A2 : 00    " "    db  $00
        ;
F3A3 : 01    " "    nop
F3A4 : 08    " "    inx
        ;
F3A5 : 00    " "    db  $00
        ;
F3A6 : 10    " "    sba
        ;
F3A7 : 02 00    "  "    db  $02, $00
        ;
F3A9 : 10    " "    sba
F3AA : 01    " "    nop
        ;
F3AB : 00    " "    db  $00
        ;
F3AC : 10    " "    sba
        ;
F3AD : 00 00 02 1E  "    "    db  $00, $00, $02, $1E
F3B1 : 00 02    "  "    db  $00, $02
        ;
F3B3 : 1B    " "    aba
        ;
F3B4 : 00 02 1F 00  "    "    db  $00, $02, $1F, $00
F3B8 : 02 1C 00 02  "    "    db  $02, $1C, $00, $02
F3BC : 1D 00    "  "    db  $1D, $00
        ;
F3BE : 08    " "    inx
F3BF : 1B    " "    aba
        ;
F3C0 : 00    " "    db  $00
        ;
F3C1 : 01    " "    nop
F3C2 : 09    " "    dex
        ;
F3C3 : 00    " "    db  $00
        ;
F3C4 : 01    " "    nop
F3C5 : 0A    " "    clv
        ;
F3C6 : 00    " "    db  $00
        ;
F3C7 : 01    " "    nop
F3C8 : 0B    " "    sev
        ;
F3C9 : 00    " "    db  $00
        ;
F3CA : 01    " "    nop
F3CB : 0C    " "    clc
        ;
F3CC : 00    " "    db  $00
        ;
F3CD : 01    " "    nop
F3CE : 0D    " "    sec
        ;
F3CF : 00    " "    db  $00
        ;
F3D0 : 01    " "    nop
F3D1 : 0E    " "    cli
        ;
F3D2 : 00    " "    db  $00
        ;
F3D3 : 01    " "    nop
F3D4 : 0F    " "    sei
        ;
F3D5 : 00    " "    db  $00
        ;
F3D6 : 01    " "    nop
F3D7 : 10    " "    sba
        ;
F3D8 : 00    " "    db  $00
        ;
F3D9 : 01    " "    nop
F3DA : 11    " "    cba
        ;
F3DB : 00    " "    db  $00
        ;
F3DC : 01    " "    nop
        ;
F3DD : 12 00    "  "    db  $12, $00
        ;
F3DF : 01    " "    nop
        ;
F3E0 : 13 00    "  "    db  $13, $00
        ;
F3E2 : 01    " "    nop
        ;
F3E3 : 14 00    "  "    db  $14, $00
        ;
F3E5 : 01    " "    nop
        ;
F3E6 : 15 00    "  "    db  $15, $00
        ;
F3E8 : 01    " "    nop
F3E9 : 16    " "    tab
        ;
F3EA : 00    " "    db  $00
        ;
F3EB : 01    " "    nop
F3EC : 17    " "    tba
        ;
F3ED : 00    " "    db  $00
        ;
F3EE : 01    " "    nop
        ;
F3EF : 18 00    "  "    db  $18, $00
        ;
F3F1 : 01    " "    nop
F3F2 : 19    " "    daa
        ;
F3F3 : 00    " "    db  $00
        ;
F3F4 : 01    " "    nop
        ;
F3F5 : 1A 00    "  "    db  $1A, $00
        ;
F3F7 : 01    " "    nop
F3F8 : 1B    " "    aba
        ;
F3F9 : 00    " "    db  $00
        ;
F3FA : 01    " "    nop
        ;
F3FB : 1C 00    "  "    db  $1C, $00
        ;
F3FD : 01    " "    nop
        ;
F3FE : 1D 00    "  "    db  $1D, $00
        ;
F400 : 01    " "    nop
        ;
F401 : 1E 00    "  "    db  $1E, $00
        ;
F403        LF403:
F403 : 01    " "    nop
        ;
F404 : 1F 00    "  "    db  $1F, $00
        ;
F406 : 01    " "    nop
F407 : 20 00    "  "    bra  LF409
        ;
F409        LF409:
F409 : 01    " "    nop
        ;
F40A : 21 00    "! "    db  $21, $00
        ;
F40C : 01    " "    nop
F40D : 22 00    "" "    bhi  LF40F
F40F        LF40F:
F40F : 01    " "    nop
F410 : 23 00    "# "    bls  LF412
F412        LF412:
F412 : 01    " "    nop
F413 : 24 00    "$ "    bcc  LF415
F415        LF415:
F415 : 01    " "    nop
F416 : 25 00    "% "    bcs  LF418
F418        LF418:
F418 : 01    " "    nop
F419 : 26 00    "& "    bne  LF41B
F41B        LF41B:
F41B : 01    " "    nop
F41C : 27 00    "' "    beq  LF41E
F41E        LF41E:
F41E : 01    " "    nop
F41F : 28 00    "( "    bvc  LF421
F421        LF421:
F421 : 01    " "    nop
F422 : 29 00    ") "    bvs  LF424
F424        LF424:
F424 : 01    " "    nop
F425 : 2A 00    "* "    bpl  LF427
F427        LF427:
F427 : 01    " "    nop
F428 : 2B 00    "+ "    bmi  LF42A
F42A        LF42A:
F42A : 01    " "    nop
F42B : 2C 00    ", "    bge  LF42D
F42D        LF42D:
F42D : 01    " "    nop
F42E : 2D 00    "- "    blt  LF430
F430        LF430:
F430 : 01    " "    nop
F431 : 2E 00    ". "    bgt  LF433
F433        LF433:
F433 : 01    " "    nop
F434 : 2F 00    "/ "    ble  LF436
F436        LF436:
F436 : 01    " "    nop
F437 : 30    "0"    tsx
        ;
F438 : 00    " "    db  $00
        ;
F439 : 01    " "    nop
F43A : 31    "1"    ins
        ;
F43B : 00    " "    db  $00
        ;
F43C : 01    " "    nop
F43D : 32    "2"    pula
        ;
F43E : 00    " "    db  $00
        ;
F43F : 01    " "    nop
F440 : 33    "3"    pulb
        ;
F441        XF441:
F441 : 00    " "    db  $00
        ;
F442 : 01    " "    nop
F443 : 34    "4"    des
        ;
F444 : 00    " "    db  $00
        ;
F445 : 01    " "    nop
F446 : 35    "5"    txs
        ;
F447 : 00    " "    db  $00
        ;
F448 : 01    " "    nop
F449 : 36    "6"    psha
        ;
F44A : 00    " "    db  $00
        ;
F44B : 01    " "    nop
F44C : 37    "7"    pshb
        ;
F44D : 00    " "    db  $00
        ;
F44E : 01    " "    nop
        ;
F44F : 38 00    "8 "    db  $38, $00
        ;
F451 : 01    " "    nop
F452 : 39    "9"    rts
        ;
F453 : 00    " "    db  $00
        ;
F454 : 01    " "    nop
        ;
F455 : 3A 00    ": "    db  $3A, $00
        ;
F457 : 01    " "    nop
F458 : 3B    ";"    rti
        ;
F459 : 00    " "    db  $00
        ;
F45A : 01    " "    nop
        ;
F45B : 3C 00    "< "    db  $3C, $00
        ;
F45D : 01    " "    nop
        ;
F45E : 3D 00    "= "    db  $3D, $00
        ;
F460 : 01    " "    nop
F461 : 3E    ">"    wai
        ;
F462 : 00    " "    db  $00
        ;
F463 : 01    " "    nop
F464 : 3F    "?"    swi
        ;
F465 : 00    " "    db  $00
        ;
F466 : 01    " "    nop
F467 : 40    "@"    nega
        ;
F468 : 00    " "    db  $00
        ;
F469 : 01    " "    nop
        ;
F46A : 41 00    "A "    db  $41, $00
        ;
F46C : 01    " "    nop
        ;
F46D : 42 00    "B "    db  $42, $00
        ;
F46F : 01    " "    nop
F470 : 43    "C"    coma
        ;
F471 : 00 02    "  "    db  $00, $02
        ;
F473 : 22 00    "" "    bhi  LF475
        ;
F475        LF475:
F475 : 02    " "    db  $02
        ;
F476 : 23 00    "# "    bls  LF478
        ;
F478        LF478:
F478 : 02    " "    db  $02
        ;
F479 : 24 00    "$ "    bcc  LF47B
        ;
F47B        LF47B:
F47B : 02    " "    db  $02
        ;
F47C : 25 00    "% "    bcs  LF47E
        ;
F47E        LF47E:
F47E : 02    " "    db  $02
        ;
F47F : 26 00    "& "    bne  LF481
        ;
F481        LF481:
F481 : 02    " "    db  $02
        ;
F482 : 27 00    "' "    beq  LF484
        ;
F484        LF484:
F484 : 02    " "    db  $02
        ;
F485 : 28 00    "( "    bvc  LF487
        ;
F487        LF487:
F487 : 02    " "    db  $02
        ;
F488 : 29 00    ") "    bvs  LF48A
F48A        LF48A:
F48A : 0D    " "    sec
F48B : 3B    ";"    rti
        ;
F48C : 00    " "    db  $00
        ;
F48D : 0D    " "    sec
        ;
F48E : 3C 00    "< "    db  $3C, $00
        ;
F490 : 11    " "    cba
F491 : 10    " "    sba
        ;
F492 : 00    " "    db  $00
        ;
F493 : 0D    " "    sec
        ;
F494 : 3D 00    "= "    db  $3D, $00
        ;
F496 : 0D    " "    sec
F497 : 3E    ">"    wai
        ;
F498 : 00 12 00 00  "    "    db  $00, $12, $00, $00
F49C : 12    " "    db  $12
        ;
F49D : 01    " "    nop
        ;
F49E : 00    " "    db  $00
        ;
F49F : 11    " "    cba
F4A0 : 11    " "    cba
        ;
F4A1 : 00    " "    db  $00
        ;
F4A2 : 11    " "    cba
        ;
F4A3 : 12 00    "  "    db  $12, $00
        ;
F4A5 : 11    " "    cba
        ;
F4A6 : 13 00 12 05  "    "    db  $13, $00, $12, $05
F4AA : 00 12    "  "    db  $00, $12
        ;
F4AC : 06    " "    tap
        ;
F4AD : 00 12    "  "    db  $00, $12
        ;
F4AF : 07    " "    tpa
        ;
F4B0 : 00 12    "  "    db  $00, $12
        ;
F4B2 : 09    " "    dex
        ;
F4B3 : 00 12    "  "    db  $00, $12
        ;
F4B5 : 08    " "    inx
        ;
F4B6 : 00    " "    db  $00
        ;
F4B7 : 01    " "    nop
F4B8        XF4B8:
F4B8 : 44    "D"    lsra
        ;
F4B9 : 00    " "    db  $00
        ;
F4BA : 01    " "    nop
        ;
F4BB : 45 00    "E "    db  $45, $00
        ;
F4BD : 01    " "    nop
F4BE : 46    "F"    rora
        ;
F4BF : 00    " "    db  $00
        ;
F4C0 : 01    " "    nop
F4C1 : 47    "G"    asra
        ;
F4C2 : 00 03 00 00  "    "    db  $00, $03, $00, $00
F4C6 : 13 00 00    "   "    db  $13, $00, $00
;*************************************;
;* DIAGNOSTIC PROCESSING HERE
;*************************************;
;NMI:
F4C9 : 0F    " "    sei
F4CA : 8E 00 7F    "   "    lds  #$007F
F4CD : 4F    "O"    clra
F4CE : CE FF FF    "   "    ldx  #$FFFF
F4D1 : 5F    "_"    clrb
F4D2        LF4D2:
F4D2 : E9 00    "  "    adcb  $00,x
F4D4 : 09    " "    dex
F4D5 : 8C E3 C0    "   "    cpx  #$E3C0
F4D8 : 26 F8    "& "    bne  LF4D2
F4DA : E1 00    "  "    cmpb  $00,x
F4DC        LF4DC:
F4DC : 26 FE    "& "    bne  LF4DC
F4DE : CE EC D2    "   "    ldx  #$ECD2
F4E1 : EE 00    "  "    ldx  $00,x
F4E3 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
F4E5 : BD E1 C3    "   "    jsr  LE1C3
F4E8 : 20 DF    "  "    bra  LF4C9
        ;
F4EA : 0E    " "    cli
F4EB : 7E F0 15    "~  "    jmp  LF015
        ;
F4EE : 01    " "    nop
F4EF : 01    " "    nop
        ;
F4F0 : 03    " "    db  $03
        ;
F4F1 : 39    "9"    rts
        ;
F4F2 : 01    " "    nop
F4F3 : 20 03    "  "    bra  LF4F8
F4F5 : 20 00    "  "    bra  LF4F7
        ;
F4F7        LF4F7:
F4F7 : F0 FE 1F    "   "    subb  XFE1F
F4FA : FF 19 FF    "   "    stx  X19FF
F4FD : 39    "9"    rts
        ;
F4FE : 01    " "    nop
F4FF : 27 03    "' "    beq  LF504
F501 : 39    "9"    rts
        ;
F502 : 01    " "    nop
        ;
F503 : 04 03    "  "    db  $04, $03
        ;
F505 : 40    "@"    nega
        ;
F506 : 00    " "    db  $00
        ;
F507 : FF FF 3F    "  ?"    stx  XFF3F
F50A : FF 19 FF    "   "    stx  X19FF
F50D : 39    "9"    rts
        ;
F50E : 01    " "    nop
        ;
F50F : 3C 02    "< "    db  $3C, $02
        ;
F511 : 3E    ">"    wai
        ;
F512 : 21 04    "! "    db  $21, $04
        ;
F514 : 01    " "    nop
F515 : 40    "@"    nega
        ;
F516 : 00    " "    db  $00
        ;
F517 : FF FF 3F    "  ?"    stx  XFF3F
F51A : FF 19 FF    "   "    stx  X19FF
F51D : 39    "9"    rts
        ;
F51E : 02    " "    db  $02
        ;
F51F : 20 08    "  "    bra  LF529
F521 : 39    "9"    rts
        ;
F522 : 06    " "    tap
F523 : 32    "2"    pula
F524 : 27 40    "'@"    beq  LF566
        ;
F526 : 00    " "    db  $00
        ;
F527 : FF FF 3F    "  ?"    stx  XFF3F
F52A : FF 39 FF    " 9 "    stx  X39FF
F52D : 59    "Y"    rolb
F52E : 01    " "    nop
F52F : 20 08    "  "    bra  LF539
F531 : 39    "9"    rts
        ;
F532 : 06    " "    tap
F533 : 32    "2"    pula
F534 : 27 40    "'@"    beq  LF576
        ;
F536 : 00    " "    db  $00
        ;
F537 : FF FF 3F    "  ?"    stx  XFF3F
F53A : FF 39 FF    " 9 "    stx  X39FF
F53D : 59    "Y"    rolb
F53E : 06    " "    tap
F53F : 01    " "    nop
F540 : F6 6E 06    " n "    ldab  X6E06
F543 : FF F6 6E    "  n"    stx  XF66E
F546 : 06    " "    tap
F547 : F9 F6 7B    "  {"    adcb  XF67B
F54A : 06    " "    tap
F54B : 08    " "    inx
F54C : F6 7B 06    " { "    ldab  X7B06
        ;
F54F : DD    " "    db  $DD
        ;
F550 : F6 7B 09    " { "    ldab  X7B09
        ;
F553 : DD    " "    db  $DD
        ;
F554 : F6 88 02    "   "    ldab  X8802
F557 : 50    "P"    negb
F558 : F6 95 01    "   "    ldab  X9501
F55B : 50    "P"    negb
F55C : F6 95 05    "   "    ldab  X9505
F55F : FF F6 A2    "   "    stx  XF6A2
        ;
F562 : 04    " "    db  $04
        ;
F563 : 80 F6    "  "    suba  #$F6
F565 : AF 0D    "  "    sts  $0D,x
F567 : 89 F6    "  "    adca  #$F6
F569 : AF 0D    "  "    sts  $0D,x
F56B : E1 F6    "  "    cmpb  $F6,x
F56D        LF56D:
F56D : AF 06    "  "    sts  $06,x
F56F : 80 F6    "  "    suba  #$F6
F571 : AF 0C    "  "    sts  $0C,x
F573 : 60 F6    "` "    neg  $F6,x
F575 : AF 04    "  "    sts  $04,x
F577 : 89 F6    "  "    adca  #$F6
F579 : C9 0A    "  "    adcb  #$0A
F57B : 80 F6    "  "    suba  #$F6
F57D : AF 03    "  "    sts  $03,x
        ;
F57F : 55    "U"    db  $55
        ;
F580 : F6 D6 09    "   "    ldab  XD609
        ;
F583 : FD    " "    db  $FD
        ;
F584 : F6 AF 08    "   "    ldab  XAF08
F587 : 80 F6    "  "    suba  #$F6
F589 : AF 08    "  "    sts  $08,x
F58B : 60 F6    "` "    neg  $F6,x
F58D : AF 08    "  "    sts  $08,x
        ;
F58F : 62    "b"    db  $62
        ;
F590 : F6 AF 08    "   "    ldab  XAF08
        ;
F593 : 41    "A"    db  $41
        ;
F594 : F6 AF 08    "   "    ldab  XAF08
F597 : 89 F6    "  "    adca  #$F6
F599 : AF 02    "  "    sts  $02,x
F59B : 89 F6    "  "    adca  #$F6
        ;
F59D : E3    " "    db  $E3
        ;
F59E : 06    " "    tap
F59F : 60 F6    "` "    neg  $F6,x
F5A1 : AF 06    "  "    sts  $06,x
        ;
F5A3 : 55    "U"    db  $55
        ;
F5A4 : F6 AF 06    "   "    ldab  XAF06
F5A7 : 89 F6    "  "    adca  #$F6
F5A9 : AF 06    "  "    sts  $06,x
F5AB : E1 F6    "  "    cmpb  $F6,x
F5AD : AF 05    "  "    sts  $05,x
F5AF : 60 F6    "` "    neg  $F6,x
F5B1 : AF 05    "  "    sts  $05,x
F5B3 : 89 F6    "  "    adca  #$F6
F5B5 : AF 05    "  "    sts  $05,x
F5B7 : E1 F6    "  "    cmpb  $F6,x
F5B9 : AF 04    "  "    sts  $04,x
F5BB : 60 F6    "` "    neg  $F6,x
F5BD : AF 04    "  "    sts  $04,x
F5BF : 89 F6    "  "    adca  #$F6
F5C1 : AF 04    "  "    sts  $04,x
F5C3 : E1 F6    "  "    cmpb  $F6,x
F5C5 : AF 03    "  "    sts  $03,x
F5C7 : 60 F6    "` "    neg  $F6,x
F5C9 : AF 03    "  "    sts  $03,x
        ;
F5CB : 55    "U"    db  $55
        ;
F5CC : F6 AF 03    "   "    ldab  XAF03
        ;
F5CF : 62    "b"    db  $62
        ;
F5D0 : F6 AF 03    "   "    ldab  XAF03
        ;
F5D3 : 41    "A"    db  $41
        ;
F5D4 : F6 AF 03    "   "    ldab  XAF03
F5D7 : E1 F6    "  "    cmpb  $F6,x
F5D9 : AF 02    "  "    sts  $02,x
F5DB : 80 F6    "  "    suba  #$F6
F5DD : AF 02    "  "    sts  $02,x
F5DF : 60 F6    "` "    neg  $F6,x
F5E1 : AF 02    "  "    sts  $02,x
        ;
F5E3 : 55    "U"    db  $55
        ;
F5E4 : F6 AF 02    "   "    ldab  XAF02
        ;
F5E7 : 62    "b"    db  $62
        ;
F5E8 : F6 AF 02    "   "    ldab  XAF02
        ;
F5EB : 41    "A"    db  $41
        ;
F5EC : F6 AF 02    "   "    ldab  XAF02
F5EF : 37    "7"    pshb
F5F0 : F6 AF 02    "   "    ldab  XAF02
F5F3 : 89 F6    "  "    adca  #$F6
F5F5 : AF 02    "  "    sts  $02,x
        ;
F5F7 : FD    " "    db  $FD
        ;
F5F8 : F6 AF 02    "   "    ldab  XAF02
F5FB : E1 F6    "  "    cmpb  $F6,x
F5FD : AF 01    "  "    sts  $01,x
F5FF : 80 F6    "  "    suba  #$F6
F601 : AF 01    "  "    sts  $01,x
F603 : 60 F6    "` "    neg  $F6,x
F605 : AF 01    "  "    sts  $01,x
        ;
F607 : 55    "U"    db  $55
        ;
F608 : F6 AF 01    "   "    ldab  XAF01
        ;
F60B : 62    "b"    db  $62
        ;
F60C : F6 AF 01    "   "    ldab  XAF01
        ;
F60F : 41    "A"    db  $41
        ;
F610 : F6 AF 01    "   "    ldab  XAF01
F613 : 37    "7"    pshb
F614 : F6 AF 01    "   "    ldab  XAF01
F617 : 89 F6    "  "    adca  #$F6
F619 : AF 01    "  "    sts  $01,x
        ;
F61B : FD    " "    db  $FD
        ;
F61C : F6 AF 01    "   "    ldab  XAF01
F61F : E1 F6    "  "    cmpb  $F6,x
F621 : AF 04    "  "    sts  $04,x
F623        LF623:
F623 : 60 F6    "` "    neg  $F6,x
F625 : BC 08 00    "   "    cpx  X0800
F628 : F6 F0 02    "   "    ldab  XF002
F62B : 07    " "    tpa
F62C : F6 C9 03    "   "    ldab  XC903
F62F : 07    " "    tpa
F630 : F6 C9 02    "   "    ldab  XC902
F633 : 09    " "    dex
F634 : F6 C9 02    "   "    ldab  XC902
F637 : 10    " "    sba
F638 : F6 C9 03    "   "    ldab  XC903
F63B : 10    " "    sba
F63C : F6 C9 10    "   "    ldab  XC910
F63F : 10    " "    sba
F640 : F6 C9 02    "   "    ldab  XC902
        ;
F643 : 13    " "    db  $13
        ;
F644 : F6 C9 03    "   "    ldab  XC903
        ;
F647 : 13    " "    db  $13
        ;
F648 : F6 C9 03    "   "    ldab  XC903
F64B : 16    " "    tab
F64C : F6 C9 08    "   "    ldab  XC908
F64F : 30    "0"    tsx
F650 : F6 AF 08    "   "    ldab  XAF08
F653 : 7F F6 AF    "   "    clr  XF6AF
F656 : 08    " "    inx
F657 : BF F6 AF    "   "    sts  XF6AF
F65A : 08    " "    inx
F65B : C9 F6    "  "    adcb  #$F6
F65D : AF 08    "  "    sts  $08,x
        ;
F65F : C7    " "    db  $C7
        ;
F660 : F6 AF 01    "   "    ldab  XAF01
F663 : 80 F6    "  "    suba  #$F6
        ;
F665 : FD    " "    db  $FD
        ;
F666 : 01    " "    nop
F667 : 80 F7    "  "    suba  #$F7
F669 : 0A    " "    clv
F66A : 01    " "    nop
F66B : 80 F7    "  "    suba  #$F7
F66D : 17    " "    tba
F66E        XF66E:
F66E : 32    "2"    pula
F66F : 01    " "    nop
F670 : F5 51 00    " Q "    bitb  X5100
        ;
F673 : 00    " "    db  $00
        ;
F674 : 0D    " "    sec
F675 : 30    "0"    tsx
        ;
F676 : 00    " "    db  $00
        ;
F677 : FF 19 FF    "   "    stx  X19FF
F67A : 39    "9"    rts
        ;
F67B        XF67B:
F67B : 38    "8"    db  $38
        ;
F67C : 01    " "    nop
F67D : F5 51 00    " Q "    bitb  X5100
        ;
F680 : 00    " "    db  $00
        ;
F681 : 11    " "    cba
F682 : 08    " "    inx
        ;
F683 : 00    " "    db  $00
        ;
F684 : FF 2C FF    " , "    stx  X2CFF
F687 : 39    "9"    rts
        ;
F688 : 38    "8"    db  $38
        ;
F689 : 01    " "    nop
F68A : F5 51 00    " Q "    bitb  X5100
        ;
F68D : 00    " "    db  $00
        ;
F68E : 22 20    "" "    bhi  LF6B0
        ;
F690 : 00    " "    db  $00
        ;
F691 : FF 2C FF    " , "    stx  X2CFF
F694 : 39    "9"    rts
        ;
F695 : 50    "P"    negb
F696 : 50    "P"    negb
F697 : 01    " "    nop
F698 : 01    " "    nop
F699 : 01    " "    nop
        ;
F69A : 00 00    "  "    db  $00, $00
        ;
F69C : 80 00    "  "    suba  #$00
F69E : FF 19 FF    "   "    stx  X19FF
F6A1 : 26 80    "& "    bne  LF623
F6A3 : 01    " "    nop
F6A4 : 40    "@"    nega
F6A5 : 01    " "    nop
        ;
F6A6 : 00 00 12    "   "    db  $00, $00, $12
        ;
F6A9 : 22 00    "" "    bhi  LF6AB
F6AB        LF6AB:
F6AB : FF 19 FF    "   "    stx  X19FF
F6AE : 29 01    ") "    bvs  LF6B1
F6B0        LF6B0:
F6B0 : 01    " "    nop
F6B1        LF6B1:
F6B1 : F5 51 00    " Q "    bitb  X5100
        ;
F6B4 : 00 00    "  "    db  $00, $00
        ;
F6B6 : 80 00    "  "    suba  #$00
F6B8 : FF 2C FF    " , "    stx  X2CFF
F6BB : 33    "3"    pulb
F6BC : 01    " "    nop
F6BD : 01    " "    nop
F6BE : F5 51 00    " Q "    bitb  X5100
        ;
F6C1 : 00 00    "  "    db  $00, $00
        ;
F6C3 : 80 00    "  "    suba  #$00
F6C5 : FF 59 FF    " Y "    stx  X59FF
        ;
F6C8 : 5B    "["    db  $5B
        ;
F6C9 : 01    " "    nop
F6CA : 01    " "    nop
F6CB : F5 51 00    " Q "    bitb  X5100
        ;
F6CE : 00 00    "  "    db  $00, $00
        ;
F6D0 : 80 00    "  "    suba  #$00
F6D2 : FF 5B FF    " [ "    stx  X5BFF
F6D5 : 5D    "]"    tstb
F6D6 : 01    " "    nop
F6D7 : 01    " "    nop
F6D8 : F5 51 00    " Q "    bitb  X5100
        ;
F6DB : 00 00    "  "    db  $00, $00
        ;
F6DD        XF6DD:
F6DD : 80 00    "  "    suba  #$00
F6DF : FF 5D FF    " ] "    stx  X5DFF
        ;
F6E2 : 65    "e"    db  $65
        ;
F6E3 : 01    " "    nop
F6E4 : 01    " "    nop
F6E5 : F5 51 00    " Q "    bitb  X5100
        ;
F6E8 : 00 00    "  "    db  $00, $00
        ;
F6EA : 80 00    "  "    suba  #$00
F6EC : FF 65 FF    " e "    stx  X65FF
F6EF : 6D 01    "m "    tst  $01,x
F6F1 : 01    " "    nop
F6F2 : F5 51 00    " Q "    bitb  X5100
        ;
F6F5 : 00 00    "  "    db  $00, $00
        ;
F6F7 : 80 00    "  "    suba  #$00
F6F9 : FF 6D FF    " m "    stx  X6DFF
        ;
F6FC : 7B    "{"    db  $7B
        ;
F6FD : 01    " "    nop
F6FE : 01    " "    nop
F6FF : F5 51 00    " Q "    bitb  X5100
        ;
F702 : 00 00    "  "    db  $00, $00
        ;
F704 : 20 00    "  "    bra  LF706
        ;
F706        LF706:
F706 : FF 2A FF    " * "    stx  X2AFF
F709 : 33    "3"    pulb
F70A : 01    " "    nop
F70B : 01    " "    nop
F70C : F5 51 00    " Q "    bitb  X5100
        ;
F70F : 00 00    "  "    db  $00, $00
        ;
F711 : 20 00    "  "    bra  LF713
        ;
F713        LF713:
F713 : FF 2C FF    " , "    stx  X2CFF
F716 : 33    "3"    pulb
F717 : 01    " "    nop
F718 : 01    " "    nop
F719 : F5 51 00    " Q "    bitb  X5100
        ;
F71C : 00 00    "  "    db  $00, $00
        ;
F71E : 20 00    "  "    bra  LF720
        ;
F720        LF720:
F720 : FF 2D FF    " - "    stx  X2DFF
F723 : 33    "3"    pulb
F724 : F8 9E FB    "   "    eorb  X9EFB
F727 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F729 : 03    " "    db  $03
        ;
F72A : F8 9E FB    "   "    eorb  X9EFB
F72D : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F72F : 02    " "    db  $02
        ;
F730 : F8 9E FB    "   "    eorb  X9EFB
F733 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
F735 : 01    " "    nop
F736 : F8 B0 FB    "   "    eorb  XB0FB
F739 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F73B : 05    " "    db  $05
        ;
F73C : F8 B0 FB    "   "    eorb  XB0FB
F73F : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
F741 : 01    " "    nop
F742 : F8 B0 FB    "   "    eorb  XB0FB
F745 : 2E FF    ". "    bgt  LF746
        ;
F747 : 05    " "    db  $05
        ;
F748 : F8 B0 FB    "   "    eorb  XB0FB
F74B : 2E FF    ". "    bgt  LF74C
F74D : 01    " "    nop
F74E : F8 C2 FB    "   "    eorb  XC2FB
F751 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F753 : 02    " "    db  $02
        ;
F754 : F8 C2 FB    "   "    eorb  XC2FB
F757 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F759 : 03    " "    db  $03
        ;
F75A : F8 D4 FB    "   "    eorb  XD4FB
F75D : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
F75F : 01    " "    nop
F760 : F8 D4 FB    "   "    eorb  XD4FB
F763 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F765 : 02    " "    db  $02
        ;
F766 : F8 D4 FB    "   "    eorb  XD4FB
F769 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F76B : 03    " "    db  $03
        ;
F76C : F8 D4 FB    "   "    eorb  XD4FB
F76F : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F771 : 05    " "    db  $05
        ;
F772 : F8 D4 FB    "   "    eorb  XD4FB
F775 : 2E FF    ". "    bgt  LF776
        ;
F777 : 03    " "    db  $03
        ;
F778 : F8 E6 FB    "   "    eorb  XE6FB
F77B : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
F77D : 01    " "    nop
F77E : F8 E6 FB    "   "    eorb  XE6FB
F781 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F783 : 02    " "    db  $02
        ;
F784 : F8 E6 FB    "   "    eorb  XE6FB
F787 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F789 : 03    " "    db  $03
        ;
F78A : F8 E6 FB    "   "    eorb  XE6FB
F78D : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F78F : 05    " "    db  $05
        ;
F790 : F8 E6 FD    "   "    eorb  XE6FD
F793 : 76 FF 05    "v  "    ror  XFF05
F796 : F8 E6 FB    "   "    eorb  XE6FB
F799 : 2E FF    ". "    bgt  LF79A
F79B : 01    " "    nop
F79C : F8 F8 FB    "   "    eorb  XF8FB
F79F : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F7A1 : 02    " "    db  $02
        ;
F7A2 : F9 0A FB    "   "    adcb  X0AFB
F7A5 : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F7A7 : 02    " "    db  $02
        ;
F7A8 : F9 1C FB    "   "    adcb  X1CFB
F7AB : AD FF    "  "    jsr  $FF,x            ;INFO: index jump
        ;
F7AD : 02    " "    db  $02
        ;
F7AE : F9 2E FD    " . "    adcb  X2EFD
F7B1 : 76 FF 01    "v  "    ror  XFF01
F7B4 : F9 2E FD    " . "    adcb  X2EFD
F7B7 : 76 FF 03    "v  "    ror  XFF03
F7BA : F9 2E FD    " . "    adcb  X2EFD
F7BD : 76 FF 01    "v  "    ror  XFF01
F7C0 : F8 E6 FD    "   "    eorb  XE6FD
F7C3 : 76 FF 05    "v  "    ror  XFF05
F7C6 : F8 D4 FC    "   "    eorb  XD4FC
F7C9 : AE 01    "  "    lds  $01,x
        ;
F7CB : 02    " "    db  $02
        ;
F7CC : F8 D4 FC    "   "    eorb  XD4FC
F7CF : B9 01 02    "   "    adca  X0102
F7D2 : F8 D4 FC    "   "    eorb  XD4FC
F7D5 : C4 01    "  "    andb  #$01
        ;
F7D7 : 02    " "    db  $02
        ;
F7D8 : F8 D4 FC    "   "    eorb  XD4FC
        ;
F7DB : CF    " "    db  $CF
        ;
F7DC : 01    " "    nop
        ;
F7DD : 02    " "    db  $02
        ;
F7DE : F8 D4 FC    "   "    eorb  XD4FC
F7E1 : DA 01    "  "    orab  X0001
        ;
F7E3 : 02    " "    db  $02
        ;
F7E4 : F8 E6 FD    "   "    eorb  XE6FD
F7E7 : 76 01 05    "v  "    ror  X0105
F7EA : F9 40 FD    " @ "    adcb  X40FD
F7ED : 76 01 03    "v  "    ror  X0103
F7F0 : F8 D4 FC    "   "    eorb  XD4FC
F7F3 : AE 01    "  "    lds  $01,x
        ;
F7F5 : 03    " "    db  $03
        ;
F7F6 : F8 D4 FC    "   "    eorb  XD4FC
F7F9 : B9 01 03    "   "    adca  X0103
F7FC : F8 D4 FC    "   "    eorb  XD4FC
F7FF : C4 01    "  "    andb  #$01
        ;
F801 : 03    " "    db  $03
        ;
F802 : F8 D4 FC    "   "    eorb  XD4FC
        ;
F805 : CF    " "    db  $CF
        ;
F806 : 01    " "    nop
        ;
F807 : 03    " "    db  $03
        ;
F808 : F8 D4 FC    "   "    eorb  XD4FC
F80B : DA 01    "  "    orab  X0001
        ;
F80D : 03    " "    db  $03
        ;
F80E : F8 D4 FC    "   "    eorb  XD4FC
F811 : E5 01    "  "    bitb  $01,x
        ;
F813 : 03    " "    db  $03
        ;
F814 : F8 D4 FD    "   "    eorb  XD4FD
F817 : 06    " "    tap
F818 : 01    " "    nop
        ;
F819 : 03    " "    db  $03
        ;
F81A : F8 D4 FD    "   "    eorb  XD4FD
F81D : 11    " "    cba
F81E : 01    " "    nop
        ;
F81F : 03    " "    db  $03
        ;
F820 : F8 9E FD    "   "    eorb  X9EFD
F823 : 76 01 03    "v  "    ror  X0103
F826 : F8 9E FD    "   "    eorb  X9EFD
F829 : 76 01 02    "v  "    ror  X0102
F82C : F8 9E FD    "   "    eorb  X9EFD
F82F : 76 01 01    "v  "    ror  X0101
F832 : F8 E6 FD    "   "    eorb  XE6FD
F835 : 76 01 05    "v  "    ror  X0105
F838 : F8 B0 FD    "   "    eorb  XB0FD
F83B : 76 01 05    "v  "    ror  X0105
F83E : F9 52 FD    " R "    adcb  X52FD
F841 : 76 01 03    "v  "    ror  X0103
F844 : F8 D4 FD    "   "    eorb  XD4FD
F847 : 76 01 03    "v  "    ror  X0103
F84A : F8 B0 FD    "   "    eorb  XB0FD
F84D : 76 01 03    "v  "    ror  X0103
F850 : F9 52 FD    " R "    adcb  X52FD
F853 : 76 01 01    "v  "    ror  X0101
F856 : F8 9E FB    "   "    eorb  X9EFB
F859 : D8 01    "  "    eorb  X0001
        ;
F85B : 02    " "    db  $02
        ;
F85C : F8 D4 FB    "   "    eorb  XD4FB
F85F : D8 01    "  "    eorb  X0001
        ;
F861 : 03    " "    db  $03
        ;
F862 : F9 64 FD    " d "    adcb  X64FD
        ;
F865 : 1C    " "    db  $1C
        ;
F866 : 01    " "    nop
        ;
F867 : 04    " "    db  $04
        ;
F868 : F9 64 FD    " d "    adcb  X64FD
F86B : 2B 01    "+ "    bmi  LF86E
        ;
F86D : 04    " "    db  $04
        ;
F86E        LF86E:
F86E : F9 64 FD    " d "    adcb  X64FD
        ;
F871 : 3A    ":"    db  $3A
        ;
F872 : 01    " "    nop
        ;
F873 : 04    " "    db  $04
        ;
F874 : F8 D4 FD    "   "    eorb  XD4FD
F877 : 49    "I"    rola
F878 : 01    " "    nop
        ;
F879 : 03    " "    db  $03
        ;
F87A : F8 D4 FD    "   "    eorb  XD4FD
F87D : 58    "X"    aslb
F87E : 01    " "    nop
        ;
F87F : 03    " "    db  $03
        ;
F880 : F8 D4 FD    "   "    eorb  XD4FD
F883 : 67 01    "g "    asr  $01,x
        ;
F885 : 03    " "    db  $03
        ;
F886 : F8 D4 FC    "   "    eorb  XD4FC
F889 : 17    " "    tba
F88A : 01    " "    nop
        ;
F88B : 03    " "    db  $03
        ;
F88C : F8 D4 FC    "   "    eorb  XD4FC
F88F : 26 01    "& "    bne  LF892
        ;
F891 : 05    " "    db  $05
        ;
F892        LF892:
F892 : F8 D4 FC    "   "    eorb  XD4FC
F895 : 35    "5"    txs
F896 : 01    " "    nop
        ;
F897 : 05    " "    db  $05
        ;
F898 : F8 D4 FC    "   "    eorb  XD4FC
F89B : 44    "D"    lsra
F89C : 01    " "    nop
        ;
F89D : 05 38 04    " 8 "    db  $05, $38, $04
        ;
F8A0 : 09    " "    dex
F8A1 : 09    " "    dex
F8A2 : 01    " "    nop
        ;
F8A3 : 38    "8"    db  $38
        ;
F8A4 : 90 90    "  "    suba  X0090
F8A6 : FF 03 20    "   "    stx  X0320
F8A9 : 20 01    "  "    bra  LF8AC
        ;
F8AB : 0F    " "    sei
F8AC        LF8AC:
F8AC : A0 A0    "  "    suba  $A0,x
F8AE : 01    " "    nop
F8AF : 01    " "    nop
F8B0 : 7F 04 01    "   "    clr  X0401
F8B3 : 01    " "    nop
F8B4 : FF 7F 09    "   "    stx  X7F09
F8B7 : 09    " "    dex
F8B8 : 01    " "    nop
F8B9 : 3F    "?"    swi
F8BA : 50    "P"    negb
F8BB : 50    "P"    negb
F8BC : FF 40 01    " @ "    stx  X4001
F8BF : 01    " "    nop
F8C0 : 01    " "    nop
F8C1        XF8C1:
F8C1 : 30    "0"    tsx
F8C2 : 7F 04 01    "   "    clr  X0401
F8C5 : 01    " "    nop
F8C6 : FF 7F 03    "   "    stx  X7F03
        ;
F8C9 : 03    " "    db  $03
        ;
F8CA : 01    " "    nop
F8CB : 7F 50 50    " PP"    clr  X5050
F8CE : FF 40 09    " @ "    stx  X4009
F8D1 : 09    " "    dex
F8D2 : 01    " "    nop
F8D3 : 30    "0"    tsx
F8D4 : 7F 04 01    "   "    clr  X0401
F8D7 : 01    " "    nop
F8D8 : FF 7F 04    "   "    stx  X7F04
        ;
F8DB : 04    " "    db  $04
        ;
F8DC : 01    " "    nop
F8DD : 7F 01 01    "   "    clr  X0101
F8E0 : FF 40 09    " @ "    stx  X4009
F8E3 : 09    " "    dex
F8E4 : 01    " "    nop
F8E5 : 3F    "?"    swi
F8E6 : 60 04    "` "    neg  $04,x
F8E8 : 0B    " "    sev
F8E9 : 0B    " "    sev
F8EA : FF 26 01    " & "    stx  X2601
F8ED : 01    " "    nop
F8EE : 01    " "    nop
F8EF : 17    " "    tba
F8F0 : 40    "@"    nega
F8F1 : 40    "@"    nega
        ;
F8F2 : 02    " "    db  $02
        ;
F8F3 : 01    " "    nop
F8F4 : 09    " "    dex
F8F5 : 09    " "    dex
F8F6 : FE 0B 20    "   "    ldx  X0B20
        ;
F8F9 : 04 05    "  "    db  $04, $05
F8FB        XF8FB:
F8FB : 05    " "    db  $05
        ;
F8FC : FF 20 02    "   "    stx  X2002
        ;
F8FF : 02    " "    db  $02
        ;
F900 : 01    " "    nop
F901 : 4F    "O"    clra
F902 : 0B    " "    sev
F903 : 0B    " "    sev
F904 : 01    " "    nop
F905 : 30    "0"    tsx
F906 : 10    " "    sba
F907 : 10    " "    sba
F908 : FE 2F 20    " / "    ldx  X2F20
        ;
F90B : 04 05 05    "   "    db  $04, $05, $05
        ;
F90E : FF 20 02    "   "    stx  X2002
        ;
F911 : 02    " "    db  $02
        ;
F912 : 01    " "    nop
F913 : 4F    "O"    clra
F914 : 0B    " "    sev
F915 : 0B    " "    sev
F916 : 01    " "    nop
F917 : 30    "0"    tsx
F918 : 30    "0"    tsx
F919 : 30    "0"    tsx
F91A : FE 2F 20    " / "    ldx  X2F20
        ;
F91D : 04    " "    db  $04
        ;
F91E : 07    " "    tpa
F91F : 07    " "    tpa
F920 : FF 20 02    "   "    stx  X2002
        ;
F923 : 02    " "    db  $02
        ;
F924 : 01    " "    nop
F925 : 4F    "O"    clra
        ;
F926 : 04 04    "  "    db  $04, $04
        ;
F928 : 01    " "    nop
F929 : 30    "0"    tsx
F92A : 20 20    "  "    bra  LF94C
        ;
F92C : FF 30 7F    " 0 "    stx  X307F
        ;
F92F : 04    " "    db  $04
        ;
F930 : 09    " "    dex
F931 : 09    " "    dex
F932 : FF 7F 04    "   "    stx  X7F04
        ;
F935 : 04    " "    db  $04
        ;
F936 : 01    " "    nop
F937 : 5F    "_"    clrb
F938 : 0B    " "    sev
F939 : 0B    " "    sev
F93A : FF 3F 02    " ? "    stx  X3F02
        ;
F93D : 02    " "    db  $02
        ;
F93E : 01    " "    nop
F93F : 50    "P"    negb
F940 : 7F 04 09    "   "    clr  X0409
F943 : 09    " "    dex
F944 : FF 60 04    " ` "    stx  X6004
        ;
F947 : 04    " "    db  $04
        ;
F948 : 01    " "    nop
F949 : 5F    "_"    clrb
F94A : 0B    " "    sev
F94B : 0B    " "    sev
F94C        LF94C:
F94C : FF 3F 02    " ? "    stx  X3F02
        ;
F94F : 02    " "    db  $02
        ;
F950 : 01    " "    nop
F951 : 40    "@"    nega
F952 : 7F 04 02    "   "    clr  X0402
        ;
F955 : 02    " "    db  $02
        ;
F956 : FF 61 07    " a "    stx  X6107
F959 : 07    " "    tpa
F95A : 01    " "    nop
        ;
F95B : 38    "8"    db  $38
        ;
F95C : 29 29    "))"    bvs  LF987
F95E : FF 08 01    "   "    stx  X0801
F961 : 01    " "    nop
F962 : 01    " "    nop
F963 : 30    "0"    tsx
F964 : 7F 04 01    "   "    clr  X0401
F967 : 01    " "    nop
F968 : FF 7F 02    "   "    stx  X7F02
        ;
F96B : 02    " "    db  $02
        ;
F96C : 01    " "    nop
F96D : 40    "@"    nega
F96E : 01    " "    nop
F96F : 01    " "    nop
F970 : FF 40 09    " @ "    stx  X4009
F973 : 09    " "    dex
F974 : 01    " "    nop
F975 : 40    "@"    nega
F976 : F9 95 F9    "   "    adcb  X95F9
F979 : C1 F9    "  "    cmpb  #$F9
F97B : D9 FA    "  "    adcb  X00FA
        ;
F97D : 05    " "    db  $05
        ;
F97E : FA 1D FA    "   "    orab  X1DFA
F981 : 3F    "?"    swi
F982 : FA 57 FA    " W "    orab  X57FA
F985 : 6F FA    "o "    clr  $FA,x
        ;
F987        LF987:
F987 : 87    " "    db  $87
        ;
F988 : FA 9F FA    "   "    orab  X9FFA
F98B : B7 FA CF    "   "    staa  XFACF
F98E : FA E7 FA    "   "    orab  XE7FA
F991 : FF FB 17    "   "    stx  XFB17
F994 : FF 05 00    "   "    stx  X0500
F997 : 01    " "    nop
F998 : 80 80    "  "    suba  #$80
F99A : 10    " "    sba
F99B : 40    "@"    nega
F99C : 40    "@"    nega
        ;
F99D : 1F    " "    db  $1F
        ;
F99E : 59    "Y"    rolb
        ;
F99F : 05    " "    db  $05
        ;
F9A0 : 7F FF 80    "   "    clr  XFF80
F9A3 : 80 10    "  "    suba  #$10
F9A5 : 58    "X"    aslb
F9A6 : 58    "X"    aslb
F9A7 : 28 00    "( "    bvc  LF9A9
        ;
F9A9        LF9A9:
F9A9 : 04 00    "  "    db  $04, $00
        ;
F9AB : 01    " "    nop
F9AC : 80 80    "  "    suba  #$80
F9AE : 10    " "    sba
        ;
F9AF : 3D 3D 1E    "== "    db  $3D, $3D, $1E
        ;
F9B2 : 39    "9"    rts
        ;
F9B3 : 04    " "    db  $04
        ;
F9B4 : 7F FF 80    "   "    clr  XFF80
F9B7 : 80 10    "  "    suba  #$10
F9B9 : 40    "@"    nega
F9BA : 40    "@"    nega
F9BB : 20 00    "  "    bra  LF9BD
        ;
F9BD        LF9BD:
F9BD : 00    " "    db  $00
        ;
F9BE : F9 95 01    "   "    adcb  X9501
F9C1 : 28 00    "( "    bvc  LF9C3
        ;
F9C3        LF9C3:
F9C3 : 02    " "    db  $02
        ;
F9C4 : EF 00    "  "    stx  $00,x
F9C6 : 01    " "    nop
        ;
F9C7 : 04 04 00 15  "    "    db  $04, $04, $00, $15
        ;
F9CB : 06    " "    tap
F9CC : 10    " "    sba
        ;
F9CD : 03    " "    db  $03
        ;
F9CE : FF FF 24    "  $"    stx  XFF24
F9D1 : 06    " "    tap
F9D2 : 06    " "    tap
        ;
F9D3 : 00    " "    db  $00
        ;
F9D4 : BC 00 F9    "   "    cpx  X00F9
F9D7 : C1 FF    "  "    cmpb  #$FF
        ;
F9D9 : 04 00    "  "    db  $04, $00
        ;
F9DB : 01    " "    nop
F9DC : C4 C4    "  "    andb  #$C4
F9DE : 10    " "    sba
F9DF : 40    "@"    nega
F9E0 : 40    "@"    nega
        ;
F9E1 : 1F    " "    db  $1F
        ;
F9E2 : 59    "Y"    rolb
        ;
F9E3 : 04    " "    db  $04
        ;
F9E4 : 7F FF C4    "   "    clr  XFFC4
F9E7 : C4 10    "  "    andb  #$10
F9E9 : 58    "X"    aslb
F9EA : 58    "X"    aslb
F9EB : 28 00    "( "    bvc  LF9ED
        ;
F9ED        LF9ED:
F9ED : 03 00    "  "    db  $03, $00
        ;
F9EF : 01    " "    nop
F9F0 : C4 C4    "  "    andb  #$C4
F9F2 : 10    " "    sba
        ;
F9F3 : 3D 3D 1E    "== "    db  $3D, $3D, $1E
        ;
F9F6 : 39    "9"    rts
        ;
F9F7 : 03    " "    db  $03
        ;
F9F8 : 7F FF C4    "   "    clr  XFFC4
F9FB : C4 10    "  "    andb  #$10
F9FD : 40    "@"    nega
F9FE : 40    "@"    nega
F9FF : 20 00    "  "    bra  LFA01
        ;
FA01        LFA01:
FA01 : 00    " "    db  $00
        ;
FA02 : F9 D9 01    "   "    adcb  XD901
FA05 : FF 7F FD    "   "    stx  X7FFD
FA08 : 80 80    "  "    suba  #$80
FA0A : 08    " "    inx
FA0B : 10    " "    sba
FA0C : 10    " "    sba
FA0D : 07    " "    tpa
FA0E : 59    "Y"    rolb
FA0F : FF 00 02    "   "    stx  X0002
FA12 : 80 80    "  "    suba  #$80
FA14 : 08    " "    inx
FA15 : 10    " "    sba
FA16 : 10    " "    sba
        ;
FA17 : 03    " "    db  $03
        ;
FA18 : 73 00 FA    "s  "    com  X00FA
        ;
FA1B : 05    " "    db  $05
        ;
FA1C : 01    " "    nop
        ;
FA1D : 04    " "    db  $04
        ;
FA1E : 48    "H"    asla
        ;
FA1F : ED    " "    db  $ED
        ;
FA20 : C4 C4    "  "    andb  #$C4
        ;
FA22 : 04    " "    db  $04
        ;
FA23 : 68 68    "hh"    asl  $68,x
        ;
FA25 : 03    " "    db  $03
        ;
FA26 : 80 03    "  "    suba  #$03
        ;
FA28 : 00 00    "  "    db  $00, $00
        ;
FA2A : C4 C4    "  "    andb  #$C4
FA2C : 10    " "    sba
FA2D : 6D 6D    "mm"    tst  $6D,x
        ;
FA2F : 03    " "    db  $03
        ;
FA30 : 40    "@"    nega
        ;
FA31 : 03 00    "  "    db  $03, $00
        ;
FA33 : 0B    " "    sev
FA34 : C4 C4    "  "    andb  #$C4
FA36 : 10    " "    sba
FA37 : A0 A0    "  "    suba  $A0,x
FA39 : 07    " "    tpa
        ;
FA3A : 00 00    "  "    db  $00, $00
        ;
FA3C : FA 1D 01    "   "    orab  X1D01
FA3F : 01    " "    nop
FA40 : 01    " "    nop
FA41 : 01    " "    nop
        ;
FA42 : 00    " "    db  $00
        ;
FA43 : 01    " "    nop
FA44 : 01    " "    nop
FA45 : 01    " "    nop
FA46 : 01    " "    nop
FA47 : 01    " "    nop
FA48 : 01    " "    nop
FA49 : 01    " "    nop
FA4A : 01    " "    nop
FA4B : 01    " "    nop
FA4C : 01    " "    nop
FA4D : 01    " "    nop
FA4E : 01    " "    nop
FA4F : 01    " "    nop
FA50 : 01    " "    nop
FA51 : 01    " "    nop
FA52 : 01    " "    nop
        ;
FA53 : 00    " "    db  $00
        ;
FA54 : FA 3F 01    " ? "    orab  X3F01
FA57 : 06    " "    tap
FA58 : 60 FA    "` "    neg  $FA,x
FA5A : 80 80    "  "    suba  #$80
FA5C : 10    " "    sba
FA5D : 58    "X"    aslb
FA5E : 58    "X"    aslb
        ;
FA5F : 04 00 05    "   "    db  $04, $00, $05
        ;
FA62 : 08    " "    inx
FA63 : 01    " "    nop
FA64 : 80 80    "  "    suba  #$80
FA66 : 10    " "    sba
FA67 : 30    "0"    tsx
FA68 : 30    "0"    tsx
FA69 : 16    " "    tab
FA6A : 20 00    "  "    bra  LFA6C
        ;
FA6C        LFA6C:
FA6C : FA 57 01    " W "    orab  X5701
FA6F : FF 7F FD    "   "    stx  X7FFD
FA72 : 0A    " "    clv
FA73 : 0A    " "    clv
FA74 : 08    " "    inx
FA75 : 10    " "    sba
FA76 : 10    " "    sba
        ;
FA77 : 03    " "    db  $03
        ;
FA78 : 59    "Y"    rolb
FA79 : FF 00 02    "   "    stx  X0002
FA7C : 0A    " "    clv
FA7D : 0A    " "    clv
FA7E : 08    " "    inx
FA7F : 10    " "    sba
FA80 : 10    " "    sba
        ;
FA81 : 03    " "    db  $03
        ;
FA82 : 73 00 FA    "s  "    com  X00FA
FA85 : 6F 01    "o "    clr  $01,x
FA87 : FF 7F FD    "   "    stx  X7FFD
FA8A : 0C    " "    clc
FA8B : 0C    " "    clc
FA8C : 08    " "    inx
FA8D : 10    " "    sba
FA8E : 10    " "    sba
        ;
FA8F : 03    " "    db  $03
        ;
FA90 : 59    "Y"    rolb
FA91 : FF 00 02    "   "    stx  X0002
FA94 : 0C    " "    clc
FA95 : 0C    " "    clc
FA96 : 08    " "    inx
FA97 : 10    " "    sba
FA98 : 10    " "    sba
        ;
FA99 : 03    " "    db  $03
        ;
FA9A : 73 00 FA    "s  "    com  X00FA
        ;
FA9D : 87    " "    db  $87
        ;
FA9E : 01    " "    nop
FA9F : FF 7F FD    "   "    stx  X7FFD
FAA2 : 0E    " "    cli
FAA3 : 0E    " "    cli
FAA4 : 08    " "    inx
FAA5 : 10    " "    sba
FAA6 : 10    " "    sba
        ;
FAA7 : 03    " "    db  $03
        ;
FAA8 : 59    "Y"    rolb
FAA9 : FF 00 02    "   "    stx  X0002
FAAC : 0E    " "    cli
FAAD : 0E    " "    cli
FAAE : 08    " "    inx
FAAF : 10    " "    sba
FAB0 : 10    " "    sba
        ;
FAB1 : 03    " "    db  $03
        ;
FAB2 : 73 00 FA    "s  "    com  X00FA
FAB5 : 9F 01    "  "    sts  X0001
FAB7 : FF 7F FD    "   "    stx  X7FFD
        ;
FABA : 02 02    "  "    db  $02, $02
        ;
FABC : 08    " "    inx
FABD : 10    " "    sba
FABE : 10    " "    sba
        ;
FABF : 03    " "    db  $03
        ;
FAC0 : 59    "Y"    rolb
FAC1 : FF 00 02    "   "    stx  X0002
        ;
FAC4 : 02 02    "  "    db  $02, $02
        ;
FAC6 : 08    " "    inx
FAC7 : 10    " "    sba
FAC8 : 10    " "    sba
        ;
FAC9 : 03    " "    db  $03
        ;
FACA : 73 00 FA    "s  "    com  X00FA
FACD : B7 01 FF    "   "    staa  X01FF
FAD0 : 7F FD AA    "   "    clr  XFDAA
FAD3 : AA 08    "  "    oraa  $08,x
FAD5 : 10    " "    sba
FAD6 : 10    " "    sba
        ;
FAD7 : 03    " "    db  $03
        ;
FAD8 : 59    "Y"    rolb
FAD9 : FF 00 02    "   "    stx  X0002
FADC : AA AA    "  "    oraa  $AA,x
FADE : 08    " "    inx
FADF : 10    " "    sba
FAE0 : 10    " "    sba
        ;
FAE1 : 03    " "    db  $03
        ;
FAE2 : 73 00 FA    "s  "    com  X00FA
        ;
FAE5 : CF    " "    db  $CF
        ;
FAE6 : 01    " "    nop
FAE7 : FF 7F FD    "   "    stx  X7FFD
        ;
FAEA : CC CC    "  "    db  $CC, $CC
        ;
FAEC : 08    " "    inx
FAED : 10    " "    sba
FAEE : 10    " "    sba
        ;
FAEF : 03    " "    db  $03
        ;
FAF0 : 59    "Y"    rolb
FAF1 : FF 00 02    "   "    stx  X0002
        ;
FAF4 : CC CC    "  "    db  $CC, $CC
        ;
FAF6 : 08    " "    inx
FAF7 : 10    " "    sba
FAF8 : 10    " "    sba
        ;
FAF9 : 03    " "    db  $03
        ;
FAFA : 73 00 FA    "s  "    com  X00FA
FAFD : E7 01    "  "    stab  $01,x
FAFF : FF 7F FD    "   "    stx  X7FFD
FB02 : EE EE    "  "    ldx  $EE,x
FB04 : 08    " "    inx
FB05 : 10    " "    sba
FB06 : 10    " "    sba
        ;
FB07 : 03    " "    db  $03
        ;
FB08 : 59    "Y"    rolb
FB09 : FF 00 02    "   "    stx  X0002
FB0C : EE EE    "  "    ldx  $EE,x
FB0E : 08    " "    inx
FB0F : 10    " "    sba
FB10 : 10    " "    sba
        ;
FB11 : 03    " "    db  $03
        ;
FB12 : 73 00 FA    "s  "    com  X00FA
FB15 : FF 01 FF    "   "    stx  X01FF
FB18 : 7F FD 22    "  ""    clr  XFD22
FB1B : 22 08    "" "    bhi  LFB25
FB1D : 10    " "    sba
FB1E : 10    " "    sba
        ;
FB1F : 03    " "    db  $03
        ;
FB20 : 59    "Y"    rolb
FB21 : FF 00 02    "   "    stx  X0002
FB24 : 22 22    """"    bhi  LFB48
FB26 : 08    " "    inx
FB27 : 10    " "    sba
FB28 : 10    " "    sba
        ;
FB29 : 03    " "    db  $03
        ;
FB2A : 73 00 FB    "s  "    com  X00FB
FB2D : 17    " "    tba
FB2E : 06    " "    tap
FB2F : 0E    " "    cli
        ;
FB30 : 02 DC 03    "   "    db  $02, $DC, $03
        ;
FB33 : 0C    " "    clc
        ;
FB34 : 02    " "    db  $02
        ;
FB35 : E0 09    "  "    subb  $09,x
FB37 : 0F    " "    sei
        ;
FB38 : 02    " "    db  $02
        ;
FB39 : D8 06    "  "    eorb  X0006
FB3B : 0E    " "    cli
        ;
FB3C : 02 DC 05    "   "    db  $02, $DC, $05
        ;
FB3F : 0E    " "    cli
        ;
FB40 : 02    " "    db  $02
        ;
FB41 : DE 06    "  "    ldx  X0006
FB43 : 0E    " "    cli
        ;
FB44 : 02 DC    "  "    db  $02, $DC
        ;
FB46 : 08    " "    inx
FB47 : 0E    " "    cli
        ;
FB48        LFB48:
FB48 : 02    " "    db  $02
        ;
FB49 : E0 09    "  "    subb  $09,x
FB4B : 0F    " "    sei
        ;
FB4C : 02    " "    db  $02
        ;
FB4D : D8 19    "  "    eorb  X0019
FB4F : 0A    " "    clv
        ;
FB50 : 03 00    "  "    db  $03, $00
        ;
FB52 : 0E    " "    cli
FB53 : 09    " "    dex
        ;
FB54 : 02    " "    db  $02
        ;
FB55 : F8 0F 05    "   "    eorb  X0F05
        ;
FB58 : 03    " "    db  $03
        ;
FB59 : 0C    " "    clc
FB5A : 10    " "    sba
        ;
FB5B : 04 03 14    "   "    db  $04, $03, $14
        ;
FB5E : 11    " "    cba
FB5F : 06    " "    tap
        ;
FB60 : 03    " "    db  $03
        ;
FB61 : 08    " "    inx
        ;
FB62 : 12 05 03 14  "    "    db  $12, $05, $03, $14
FB66 : 13    " "    db  $13
        ;
FB67 : 06    " "    tap
        ;
FB68 : 03    " "    db  $03
        ;
FB69 : 08    " "    inx
FB6A : 09    " "    dex
FB6B : 0F    " "    sei
        ;
FB6C : 02    " "    db  $02
        ;
FB6D : D8 08    "  "    eorb  X0008
FB6F : 0E    " "    cli
        ;
FB70 : 02    " "    db  $02
        ;
FB71 : E0 16    "  "    subb  $16,x
FB73 : 0A    " "    clv
        ;
FB74 : 02    " "    db  $02
        ;
FB75 : F8 15 09    "   "    eorb  X1509
        ;
FB78 : 03 00    "  "    db  $03, $00
        ;
FB7A : 07    " "    tpa
FB7B : 10    " "    sba
        ;
FB7C : 02    " "    db  $02
        ;
FB7D : D0 19    "  "    subb  X0019
FB7F : 0A    " "    clv
        ;
FB80 : 03 00    "  "    db  $03, $00
        ;
FB82 : 1B    " "    aba
        ;
FB83 : 05 03    "  "    db  $05, $03
        ;
FB85 : 10    " "    sba
        ;
FB86 : 1D 03 03 18  "    "    db  $1D, $03, $03, $18
FB8A : 1E    " "    db  $1E
        ;
FB8B : 08    " "    inx
        ;
FB8C : 03 00 1D 03  "    "    db  $03, $00, $1D, $03
FB90 : 03 18    "  "    db  $03, $18
        ;
FB92 : 19    " "    daa
FB93 : 0A    " "    clv
        ;
FB94 : 03 00 13    "   "    db  $03, $00, $13
        ;
FB97 : 06    " "    tap
        ;
FB98 : 03    " "    db  $03
        ;
FB99 : 08    " "    inx
FB9A : 11    " "    cba
FB9B : 06    " "    tap
        ;
FB9C : 03    " "    db  $03
        ;
FB9D : 08    " "    inx
FB9E : 08    " "    inx
FB9F : 0E    " "    cli
        ;
FBA0 : 02    " "    db  $02
        ;
FBA1 : E0 06    "  "    subb  $06,x
FBA3 : 0E    " "    cli
        ;
FBA4 : 02 DC    "  "    db  $02, $DC
        ;
FBA6 : 07    " "    tpa
FBA7 : 10    " "    sba
        ;
FBA8 : 02    " "    db  $02
        ;
FBA9 : D0 00    "  "    subb  X0000
FBAB : FB 2E 07    " . "    addb  X2E07
FBAE : 07    " "    tpa
        ;
FBAF : 02    " "    db  $02
        ;
FBB0 : F4 05 18    "   "    andb  X0518
        ;
FBB3 : 02    " "    db  $02
        ;
FBB4 : B8 04 21    "  !"    eora  X0421
        ;
FBB7 : 02    " "    db  $02
        ;
FBB8 : 90 04    "  "    suba  X0004
FBBA : 0C    " "    clc
        ;
FBBB : 02 DD 04 03  "    "    db  $02, $DD, $04, $03
FBBF : 03    " "    db  $03
        ;
FBC0 : A8 04    "  "    eora  $04,x
FBC2 : 0C    " "    clc
        ;
FBC3 : 02 DD 04 21  "   !"    db  $02, $DD, $04, $21
FBC7 : 02    " "    db  $02
        ;
FBC8 : 90 05    "  "    suba  X0005
        ;
FBCA : 18 02    "  "    db  $18, $02
        ;
FBCC : B8 07 07    "   "    eora  X0707
        ;
FBCF : 02    " "    db  $02
        ;
FBD0 : F4 07 10    "   "    andb  X0710
        ;
FBD3 : 03    " "    db  $03
        ;
FBD4 : 60 00    "` "    neg  $00,x
FBD6 : FB AD 02    "   "    addb  XAD02
        ;
FBD9 : 14 02    "  "    db  $14, $02
        ;
FBDB : 28 03    "( "    bvc  LFBE0
        ;
FBDD : 02 02    "  "    db  $02, $02
        ;
FBDF : 6C 03    "l "    inc  $03,x
FBE1 : 20 02    "  "    bra  LFBE5
        ;
FBE3 : 0D    " "    sec
        ;
FBE4 : 04    " "    db  $04
        ;
FBE5        LFBE5:
FBE5 : 16    " "    tab
        ;
FBE6 : 02    " "    db  $02
        ;
FBE7 : 2C 05    ", "    bge  LFBEE
FBE9 : 0E    " "    cli
        ;
FBEA : 02 4B    " K"    db  $02, $4B
        ;
FBEC : 06    " "    tap
        ;
FBED : 04 02    "  "    db  $04, $02
        ;
FBEF : 6C 07    "l "    inc  $07,x
FBF1 : 07    " "    tpa
        ;
FBF2 : 02    " "    db  $02
        ;
FBF3 : 5C    "\"    incb
FBF4 : 08    " "    inx
        ;
FBF5 : 03 02    "  "    db  $03, $02
        ;
FBF7 : 73 09 04    "s  "    com  X0904
        ;
FBFA : 02    " "    db  $02
        ;
FBFB : 73 08 03    "s  "    com  X0803
        ;
FBFE : 02    " "    db  $02
        ;
FBFF : 73 07 07    "s  "    com  X0707
        ;
FC02 : 02    " "    db  $02
        ;
FC03 : 5C    "\"    incb
FC04 : 06    " "    tap
        ;
FC05 : 04    " "    db  $04
FC06        XFC06:
FC06 : 02    " "    db  $02
        ;
FC07 : 6C 04    "l "    inc  $04,x
FC09 : 16    " "    tab
        ;
FC0A : 02    " "    db  $02
        ;
FC0B : 2C 03    ", "    bge  LFC10
FC0D : 20 02    "  "    bra  LFC11
        ;
FC0F : 0D    " "    sec
        ;
FC10        LFC10:
FC10 : 03 02 02    "   "    db  $03, $02, $02
        ;
FC13 : 6C 00    "l "    inc  $00,x
FC15 : FB D8 03    "   "    addb  XD803
FC18 : 0C    " "    clc
        ;
FC19 : 02    " "    db  $02
        ;
FC1A : 8D 03    "  "    bsr  LFC1F
FC1C : 0C    " "    clc
        ;
FC1D : 02    " "    db  $02
        ;
FC1E : 8D 02    "  "    bsr  LFC22
        ;
FC20 : 1F 02 3D 00  "  = "    db  $1F, $02, $3D, $00
FC24 : FC    " "    db  $FC
        ;
FC25 : 17    " "    tba
        ;
FC26 : 02    " "    db  $02
        ;
FC27 : 37    "7"    pshb
        ;
FC28 : 02    " "    db  $02
        ;
FC29 : 06    " "    tap
        ;
FC2A : 02    " "    db  $02
        ;
FC2B : 37    "7"    pshb
        ;
FC2C : 02    " "    db  $02
        ;
FC2D : 06    " "    tap
        ;
FC2E : 03    " "    db  $03
        ;
FC2F : 2B 02    "+ "    bmi  LFC33
FC31 : 25 00    "% "    bcs  LFC33
        ;
FC33        LFC33:
FC33 : FC    " "    db  $FC
        ;
FC34 : 26 02    "& "    bne  LFC38
        ;
FC36 : 14 02 65 02  "  e "    db  $14, $02, $65, $02
FC3A : 14 02 65 03  "  e "    db  $14, $02, $65, $03
        ;
FC3E : 0C    " "    clc
        ;
FC3F : 02    " "    db  $02
        ;
FC40 : 8D 00    "  "    bsr  LFC42
        ;
FC42        LFC42:
FC42 : FC    " "    db  $FC
        ;
FC43 : 35    "5"    txs
        ;
FC44 : 04    " "    db  $04
        ;
FC45 : 16    " "    tab
        ;
FC46 : 02    " "    db  $02
        ;
FC47 : 6A 03    "j "    dec  $03,x
FC49 : 0C    " "    clc
        ;
FC4A : 02    " "    db  $02
        ;
FC4B : 8D 02    "  "    bsr  LFC4F
        ;
FC4D : 14 02 65 00  "  e "    db  $14, $02, $65, $00
FC51 : FC    " "    db  $FC
        ;
FC52 : 44    "D"    lsra
        ;
FC53 : 05 18    "  "    db  $05, $18
        ;
FC55 : 01    " "    nop
FC56 : A1 05    "  "    cmpa  $05,x
FC58 : 0E    " "    cli
FC59 : 01    " "    nop
FC5A : B8 0A 07    "   "    eora  X0A07
FC5D : 01    " "    nop
        ;
FC5E : CC 04 21    "  !"    db  $CC, $04, $21
        ;
FC61 : 01    " "    nop
FC62 : 89 09    "  "    adca  #$09
        ;
FC64 : 04    " "    db  $04
        ;
FC65 : 01    " "    nop
FC66 : D6 08    "  "    ldab  X0008
FC68 : 0E    " "    cli
FC69 : 01    " "    nop
FC6A : B9 04 03    "   "    adca  X0403
FC6D : 01    " "    nop
FC6E : D4 03    "  "    andb  X0003
FC70 : 2B 01    "+ "    bmi  LFC73
        ;
FC72 : 72 03    "r "    db  $72, $03
        ;
FC74 : 20 01    "  "    bra  LFC77
        ;
FC76 : 89 06    "  "    adca  #$06
        ;
FC78 : 04    " "    db  $04
        ;
FC79 : 01    " "    nop
FC7A : D1 02    "  "    cmpb  X0002
FC7C : 37    "7"    pshb
FC7D : 01    " "    nop
        ;
FC7E : 5E 02 14 04  "^   "    db  $5E, $02, $14, $04
        ;
FC82 : 50    "P"    negb
        ;
FC83 : 02    " "    db  $02
        ;
FC84 : 37    "7"    pshb
FC85 : 01    " "    nop
        ;
FC86 : 5E    "^"    db  $5E
        ;
FC87 : 06    " "    tap
        ;
FC88 : 04    " "    db  $04
        ;
FC89 : 01    " "    nop
FC8A : D1 03    "  "    cmpb  X0003
FC8C : 20 01    "  "    bra  LFC8F
        ;
FC8E : 89 07    "  "    adca  #$07
FC90 : 10    " "    sba
FC91 : 01    " "    nop
FC92 : B0 04 03    "   "    suba  X0403
FC95 : 01    " "    nop
FC96 : D4 04    "  "    andb  X0004
FC98 : 0C    " "    clc
FC99 : 01    " "    nop
FC9A : B7 02 14    "   "    staa  X0214
FC9D : 01    " "    nop
FC9E : 9E 04    "  "    lds  X0004
        ;
FCA0 : 21    "!"    db  $21
        ;
FCA1 : 01    " "    nop
FCA2 : 89 02    "  "    adca  #$02
FCA4 : 29 01    ") "    bvs  LFCA7
FCA6 : 74 05 0E    "t  "    lsr  X050E
FCA9 : 01    " "    nop
FCAA : B8 00 FC    "   "    eora  X00FC
FCAD : 53    "S"    comb
FCAE : 08    " "    inx
        ;
FCAF : 03 03    "  "    db  $03, $03
        ;
FCB1 : 10    " "    sba
FCB2 : 0A    " "    clv
FCB3 : 07    " "    tpa
        ;
FCB4 : 03 00 00 FC  "    "    db  $03, $00, $00, $FC
        ;
FCB8 : AE 09    "  "    lds  $09,x
FCBA : 0F    " "    sei
        ;
FCBB : 02    " "    db  $02
        ;
FCBC : D8 0C    "  "    eorb  X000C
FCBE : 10    " "    sba
        ;
FCBF        XFCBF:
FCBF : 02    " "    db  $02
        ;
FCC0 : D8 00    "  "    eorb  X0000
        ;
FCC2 : FC    " "    db  $FC
        ;
FCC3 : B9 0A 07    "   "    adca  X0A07
        ;
FCC6 : 03 00    "  "    db  $03, $00
        ;
FCC8 : 0C    " "    clc
FCC9 : 10    " "    sba
        ;
FCCA : 02    " "    db  $02
        ;
FCCB : D8 00    "  "    eorb  X0000
        ;
FCCD : FC    " "    db  $FC
        ;
FCCE : C4 0F    "  "    andb  #$0F
        ;
FCD0 : 05 03    "  "    db  $05, $03
        ;
FCD2 : 0C    " "    clc
        ;
FCD3 : 12 05 03 14  "    "    db  $12, $05, $03, $14
FCD7 : 00 FC CF    "   "    db  $00, $FC, $CF
        ;
FCDA : 0A    " "    clv
FCDB : 07    " "    tpa
        ;
FCDC : 03 00    "  "    db  $03, $00
        ;
FCDE : 10    " "    sba
        ;
FCDF : 04 03 14 00  "    "    db  $04, $03, $14, $00
FCE3 : FC    " "    db  $FC
        ;
FCE4 : DA 10    "  "    orab  X0010
        ;
FCE6 : 04 03 14 14  "    "    db  $04, $03, $14, $14
        ;
FCEA : 07    " "    tpa
        ;
FCEB : 03    " "    db  $03
        ;
FCEC : 08    " "    inx
        ;
FCED : 00 FC    "  "    db  $00, $FC
        ;
FCEF : E5 13    "  "    bitb  $13,x
FCF1 : 06    " "    tap
        ;
FCF2 : 03    " "    db  $03
        ;
FCF3 : 08    " "    inx
FCF4 : 19    " "    daa
FCF5 : 0A    " "    clv
        ;
FCF6 : 03 00 00 FC  "    "    db  $03, $00, $00, $FC
        ;
FCFA : F0 14 07    "   "    subb  X1407
        ;
FCFD : 03    " "    db  $03
        ;
FCFE : 08    " "    inx
FCFF        XFCFF:
FCFF : 19    " "    daa
FD00 : 0A    " "    clv
        ;
FD01 : 03 00 00 FC  "    "    db  $03, $00, $00, $FC
        ;
FD05 : FB 1E 08    "   "    addb  X1E08
        ;
FD08 : 03 00    "  "    db  $03, $00
        ;
FD0A : 25 02    "% "    bcs  LFD0E
        ;
FD0C : 02    " "    db  $02
        ;
FD0D        XFD0D:
FD0D : F8 00 FD    "   "    eorb  X00FD
FD10 : 06    " "    tap
        ;
FD11 : 14    " "    db  $14
        ;
FD12 : 07    " "    tpa
        ;
FD13 : 03    " "    db  $03
        ;
FD14 : 08    " "    inx
FD15 : 20 08    "  "    bra  LFD1F
        ;
FD17 : 03 04 00 FD  "    "    db  $03, $04, $00, $FD
        ;
FD1B : 11    " "    cba
        ;
FD1C : 00 00 03    "   "    db  $00, $00, $03
        ;
FD1F        LFD1F:
FD1F : 40    "@"    nega
FD20 : 0E    " "    cli
FD21 : 09    " "    dex
        ;
FD22        XFD22:
FD22 : 04    " "    db  $04
        ;
FD23 : 74 00 00    "t  "    lsr  X0000
        ;
FD26 : 03    " "    db  $03
        ;
FD27 : 40    "@"    nega
        ;
FD28 : 00 FD 1C 00  "    "    db  $00, $FD, $1C, $00
FD2C : 00 03    "  "    db  $00, $03
        ;
FD2E : 40    "@"    nega
        ;
FD2F : 13    " "    db  $13
        ;
FD30 : 06    " "    tap
        ;
FD31 : 04    " "    db  $04
        ;
FD32 : 8C 00 00    "   "    cpx  #$0000
        ;
FD35 : 03    " "    db  $03
        ;
FD36 : 40    "@"    nega
        ;
FD37 : 00 FD    "  "    db  $00, $FD
        ;
FD39 : 2B 00    "+ "    bmi  LFD3B
        ;
FD3B        LFD3B:
FD3B : 00 03    "  "    db  $00, $03
        ;
FD3D : 40    "@"    nega
FD3E : 0C    " "    clc
FD3F : 07    " "    tpa
        ;
FD40 : 04    " "    db  $04
        ;
FD41 : 80 00    "  "    suba  #$00
        ;
FD43 : 00 03    "  "    db  $00, $03
        ;
FD45 : 40    "@"    nega
        ;
FD46 : 00 FD 3A 00  "  : "    db  $00, $FD, $3A, $00
FD4A : 00 03    "  "    db  $00, $03
        ;
FD4C : 40    "@"    nega
FD4D : 0A    " "    clv
FD4E : 0F    " "    sei
        ;
FD4F : 02    " "    db  $02
        ;
FD50 : E0 00    "  "    subb  $00,x
        ;
FD52 : 00 03    "  "    db  $00, $03
        ;
FD54 : 40    "@"    nega
        ;
FD55 : 00 FD    "  "    db  $00, $FD
        ;
FD57 : 49    "I"    rola
        ;
FD58 : 00 00 03    "   "    db  $00, $00, $03
        ;
FD5B : 40    "@"    nega
        ;
FD5C : 12 05 03 14  "    "    db  $12, $05, $03, $14
FD60 : 00 00 03    "   "    db  $00, $00, $03
        ;
FD63 : 40    "@"    nega
        ;
FD64 : 00 FD    "  "    db  $00, $FD
        ;
FD66 : 58    "X"    aslb
        ;
FD67 : 00 00 03    "   "    db  $00, $00, $03
        ;
FD6A : 40    "@"    nega
FD6B : 0F    " "    sei
        ;
FD6C : 05 03    "  "    db  $05, $03
        ;
FD6E : 0C    " "    clc
        ;
FD6F : 00 00 03    "   "    db  $00, $00, $03
        ;
FD72 : 40    "@"    nega
        ;
FD73 : 00 FD    "  "    db  $00, $FD
        ;
FD75 : 67 0E    "g "    asr  $0E,x
FD77 : 09    " "    dex
        ;
FD78 : 03    " "    db  $03
        ;
FD79 : F5 0E 09    "   "    bitb  X0E09
        ;
FD7C : 03    " "    db  $03
        ;
FD7D : F5 10 04    "   "    bitb  X1004
        ;
FD80 : 04 1A    "  "    db  $04, $1A
        ;
FD82 : 10    " "    sba
        ;
FD83 : 04 04 1A 13  "    "    db  $04, $04, $1A, $13
        ;
FD87 : 06    " "    tap
        ;
FD88 : 04    " "    db  $04
        ;
FD89 : 0A    " "    clv
        ;
FD8A : 13    " "    db  $13
        ;
FD8B : 06    " "    tap
        ;
FD8C : 04    " "    db  $04
        ;
FD8D : 0A    " "    clv
FD8E : 10    " "    sba
        ;
FD8F : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FD92 : 10    " "    sba
        ;
FD93 : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FD96 : 0E    " "    cli
FD97 : 09    " "    dex
        ;
FD98 : 03    " "    db  $03
        ;
FD99 : F5 0E 09    "   "    bitb  X0E09
        ;
FD9C : 03    " "    db  $03
        ;
FD9D : F5 0C 07    "   "    bitb  X0C07
        ;
FDA0 : 04 00    "  "    db  $04, $00
        ;
FDA2 : 0C    " "    clc
FDA3 : 07    " "    tpa
        ;
FDA4 : 04 00    "  "    db  $04, $00
        ;
FDA6 : 0A    " "    clv
FDA7 : 0F    " "    sei
        ;
FDA8 : 03    " "    db  $03
        ;
FDA9 : D5 0A    "  "    bitb  X000A
FDAB : 0F    " "    sei
        ;
FDAC : 03    " "    db  $03
        ;
FDAD : D5 0C    "  "    bitb  X000C
FDAF : 07    " "    tpa
        ;
FDB0 : 04 00    "  "    db  $04, $00
        ;
FDB2 : 0C    " "    clc
FDB3 : 07    " "    tpa
        ;
FDB4 : 04 00    "  "    db  $04, $00
FDB6        XFDB6:
FDB6 : 12 05 04 1A  "    "    db  $12, $05, $04, $1A
FDBA : 12 05 04 1A  "    "    db  $12, $05, $04, $1A
        ;
FDBE : 0E    " "    cli
FDBF : 09    " "    dex
        ;
FDC0 : 03    " "    db  $03
        ;
FDC1 : F5 0E 09    "   "    bitb  X0E09
        ;
FDC4 : 03    " "    db  $03
        ;
FDC5 : F5 0C 07    "   "    bitb  X0C07
        ;
FDC8 : 04 00    "  "    db  $04, $00
        ;
FDCA : 0C    " "    clc
FDCB : 07    " "    tpa
        ;
FDCC : 04 00    "  "    db  $04, $00
        ;
FDCE : 0A    " "    clv
FDCF : 0F    " "    sei
        ;
FDD0 : 03    " "    db  $03
        ;
FDD1 : D5 0A    "  "    bitb  X000A
FDD3 : 0F    " "    sei
        ;
FDD4 : 03    " "    db  $03
        ;
FDD5 : D5 13    "  "    bitb  X0013
FDD7 : 06    " "    tap
        ;
FDD8 : 04    " "    db  $04
        ;
FDD9 : 0A    " "    clv
        ;
FDDA : 13    " "    db  $13
        ;
FDDB : 06    " "    tap
        ;
FDDC : 04    " "    db  $04
        ;
FDDD : 0A    " "    clv
FDDE : 0F    " "    sei
        ;
FDDF : 05 04    "  "    db  $05, $04
        ;
FDE1 : 10    " "    sba
FDE2 : 0F    " "    sei
        ;
FDE3 : 05 04    "  "    db  $05, $04
        ;
FDE5 : 10    " "    sba
FDE6 : 0C    " "    clc
FDE7 : 10    " "    sba
        ;
FDE8 : 03    " "    db  $03
        ;
FDE9 : CA 0C    "  "    orab  #$0C
FDEB : 10    " "    sba
        ;
FDEC : 03    " "    db  $03
        ;
FDED : CA 0A    "  "    orab  #$0A
FDEF : 0F    " "    sei
        ;
FDF0 : 03    " "    db  $03
        ;
FDF1 : D5 0A    "  "    bitb  X000A
FDF3 : 0F    " "    sei
        ;
FDF4 : 03    " "    db  $03
        ;
FDF5 : D5 0E    "  "    bitb  X000E
FDF7 : 09    " "    dex
        ;
FDF8 : 03    " "    db  $03
        ;
FDF9 : F5 0E 09    "   "    bitb  X0E09
        ;
FDFC : 03    " "    db  $03
        ;
FDFD : F5 10 04    "   "    bitb  X1004
        ;
FE00 : 04 1A    "  "    db  $04, $1A
        ;
FE02 : 10    " "    sba
        ;
FE03        XFE03:
FE03 : 04 04 1A 13  "    "    db  $04, $04, $1A, $13
        ;
FE07 : 06    " "    tap
        ;
FE08        XFE08:
FE08 : 04    " "    db  $04
        ;
FE09 : 0A    " "    clv
        ;
FE0A        XFE0A:
FE0A : 13    " "    db  $13
        ;
FE0B : 06    " "    tap
        ;
FE0C : 04    " "    db  $04
        ;
FE0D : 0A    " "    clv
FE0E : 10    " "    sba
        ;
FE0F : 04    " "    db  $04
FE10        XFE10:
FE10 : 04 1A    "  "    db  $04, $1A
        ;
FE12 : 10    " "    sba
        ;
FE13 : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FE16 : 0E    " "    cli
FE17 : 09    " "    dex
        ;
FE18 : 03    " "    db  $03
        ;
FE19 : F5 0E 09    "   "    bitb  X0E09
        ;
FE1C : 03    " "    db  $03
        ;
FE1D : F5 0C 07    "   "    bitb  X0C07
        ;
FE20 : 04 00    "  "    db  $04, $00
        ;
FE22 : 0C    " "    clc
FE23 : 07    " "    tpa
        ;
FE24 : 04 00    "  "    db  $04, $00
        ;
FE26 : 0A    " "    clv
FE27 : 0F    " "    sei
        ;
FE28 : 03    " "    db  $03
        ;
FE29 : D5 0A    "  "    bitb  X000A
FE2B : 0F    " "    sei
        ;
FE2C : 03    " "    db  $03
        ;
FE2D : D5 0C    "  "    bitb  X000C
FE2F : 07    " "    tpa
        ;
FE30 : 04 00    "  "    db  $04, $00
        ;
FE32 : 0C    " "    clc
FE33 : 07    " "    tpa
        ;
FE34 : 04 00    "  "    db  $04, $00
        ;
FE36 : 09    " "    dex
        ;
FE37 : 04 04 15 12  "    "    db  $04, $04, $15, $12
FE3B : 05 04 1A    "   "    db  $05, $04, $1A
        ;
FE3E : 0E    " "    cli
FE3F : 09    " "    dex
        ;
FE40 : 03    " "    db  $03
        ;
FE41 : F5 0E 09    "   "    bitb  X0E09
        ;
FE44 : 03    " "    db  $03
        ;
FE45 : F5 0C 07    "   "    bitb  X0C07
        ;
FE48 : 04 00    "  "    db  $04, $00
        ;
FE4A : 0C    " "    clc
FE4B : 07    " "    tpa
        ;
FE4C : 04 00    "  "    db  $04, $00
        ;
FE4E : 0A    " "    clv
FE4F : 0F    " "    sei
        ;
FE50 : 03    " "    db  $03
        ;
FE51 : D5 0A    "  "    bitb  X000A
FE53 : 0F    " "    sei
        ;
FE54 : 03    " "    db  $03
        ;
FE55 : D5 13    "  "    bitb  X0013
FE57 : 06    " "    tap
        ;
FE58 : 04    " "    db  $04
        ;
FE59 : 0A    " "    clv
        ;
FE5A        XFE5A:
FE5A : 13    " "    db  $13
        ;
FE5B : 06    " "    tap
        ;
FE5C : 04    " "    db  $04
        ;
FE5D : 0A    " "    clv
FE5E : 0F    " "    sei
        ;
FE5F : 05 04    "  "    db  $05, $04
        ;
FE61 : 10    " "    sba
FE62 : 0F    " "    sei
        ;
FE63 : 05 04    "  "    db  $05, $04
        ;
FE65 : 10    " "    sba
FE66 : 0C    " "    clc
FE67 : 10    " "    sba
        ;
FE68 : 03    " "    db  $03
        ;
FE69 : CA 0C    "  "    orab  #$0C
FE6B : 10    " "    sba
        ;
FE6C : 03    " "    db  $03
        ;
FE6D : CA 0A    "  "    orab  #$0A
FE6F : 0F    " "    sei
        ;
FE70 : 03    " "    db  $03
        ;
FE71 : D5 0A    "  "    bitb  X000A
FE73 : 0F    " "    sei
        ;
FE74 : 03    " "    db  $03
        ;
FE75 : D5 0E    "  "    bitb  X000E
FE77 : 09    " "    dex
FE78 : 0B    " "    sev
FE79 : DF 0E    "  "    stx  X000E
FE7B : 09    " "    dex
FE7C : 07    " "    tpa
FE7D : EA 13    "  "    orab  $13,x
FE7F : 06    " "    tap
        ;
FE80 : 04    " "    db  $04
        ;
FE81 : 0A    " "    clv
FE82 : 10    " "    sba
        ;
FE83 : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FE86 : 0F    " "    sei
        ;
FE87 : 05 04    "  "    db  $05, $04
        ;
FE89 : 10    " "    sba
FE8A : 0E    " "    cli
FE8B : 09    " "    dex
FE8C : 0B    " "    sev
FE8D : DF 0E    "  "    stx  X000E
FE8F : 09    " "    dex
FE90 : 07    " "    tpa
FE91 : EA 0C    "  "    orab  $0C,x
FE93 : 07    " "    tpa
        ;
FE94 : 04 00    "  "    db  $04, $00
        ;
FE96 : 0E    " "    cli
FE97 : 09    " "    dex
        ;
FE98 : 03    " "    db  $03
        ;
FE99 : F5 10 04    "   "    bitb  X1004
        ;
FE9C : 04 1A 12 05  "    "    db  $04, $1A, $12, $05
        ;
FEA0 : 0C    " "    clc
        ;
FEA1 : 4E 12 05    "N  "    db  $4E, $12, $05
        ;
FEA4 : 08    " "    inx
FEA5 : 34    "4"    des
        ;
FEA6 : 12 05 04 1A  "    "    db  $12, $05, $04, $1A
        ;
FEAA : 09    " "    dex
        ;
FEAB : 04 04 15 12  "    "    db  $04, $04, $15, $12
FEAF : 05 04 1A 13  "    "    db  $05, $04, $1A, $13
        ;
FEB3 : 06    " "    tap
FEB4 : 0C    " "    clc
        ;
FEB5 : 1E 13    "  "    db  $1E, $13
        ;
FEB7 : 06    " "    tap
FEB8 : 08    " "    inx
        ;
FEB9 : 14    " "    db  $14
FEBA        XFEBA:
FEBA : 13    " "    db  $13
        ;
FEBB : 06    " "    tap
        ;
FEBC : 04    " "    db  $04
        ;
FEBD : 0A    " "    clv
FEBE : 10    " "    sba
        ;
FEBF : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FEC2 : 0F    " "    sei
        ;
FEC3 : 05 04    "  "    db  $05, $04
        ;
FEC5 : 10    " "    sba
FEC6 : 0E    " "    cli
FEC7 : 09    " "    dex
FEC8 : 0B    " "    sev
FEC9 : DF 0E    "  "    stx  X000E
FECB : 09    " "    dex
FECC : 07    " "    tpa
FECD : EA 13    "  "    orab  $13,x
FECF : 06    " "    tap
        ;
FED0 : 04    " "    db  $04
        ;
FED1 : 0A    " "    clv
FED2 : 10    " "    sba
        ;
FED3 : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FED6 : 0F    " "    sei
        ;
FED7 : 05 04    "  "    db  $05, $04
        ;
FED9 : 10    " "    sba
FEDA : 0E    " "    cli
FEDB : 09    " "    dex
FEDC : 0B    " "    sev
FEDD : DF 0E    "  "    stx  X000E
FEDF : 09    " "    dex
FEE0 : 07    " "    tpa
FEE1 : EA 0C    "  "    orab  $0C,x
FEE3 : 07    " "    tpa
        ;
FEE4 : 04 00    "  "    db  $04, $00
        ;
FEE6 : 0E    " "    cli
FEE7 : 09    " "    dex
        ;
FEE8 : 03    " "    db  $03
        ;
FEE9 : F5 10 04    "   "    bitb  X1004
        ;
FEEC : 04 1A 12 05  "    "    db  $04, $1A, $12, $05
        ;
FEF0 : 0C    " "    clc
        ;
FEF1 : 4E 12    "N "    db  $4E, $12
FEF3        XFEF3:
FEF3 : 05    " "    db  $05
        ;
FEF4 : 08    " "    inx
FEF5 : 34    "4"    des
        ;
FEF6 : 12 05 04 1A  "    "    db  $12, $05, $04, $1A
        ;
FEFA : 09    " "    dex
        ;
FEFB : 04 04 15 12  "    "    db  $04, $04, $15, $12
FEFF : 05    " "    db  $05
FF00        XFF00:
FF00 : 04    " "    db  $04
FF01        XFF01:
FF01 : 1A 13    "  "    db  $1A, $13
        ;
FF03        XFF03:
FF03 : 06    " "    tap
FF04 : 0C    " "    clc
        ;
FF05        XFF05:
FF05 : 1E 13    "  "    db  $1E, $13
        ;
FF07 : 06    " "    tap
FF08 : 08    " "    inx
        ;
FF09 : 14    " "    db  $14
FF0A        XFF0A:
FF0A : 13    " "    db  $13
        ;
FF0B : 06    " "    tap
        ;
FF0C : 04    " "    db  $04
        ;
FF0D : 0A    " "    clv
FF0E : 10    " "    sba
        ;
FF0F : 04 04 1A    "   "    db  $04, $04, $1A
        ;
FF12 : 0F    " "    sei
        ;
FF13 : 05 04    "  "    db  $05, $04
        ;
FF15 : 10    " "    sba
        ;
FF16 : 00 FD    "  "    db  $00, $FD
        ;
FF18 : 76 25 2B    "v%+"    ror  X252B
FF1B : 32    "2"    pula
FF1C : 37    "7"    pshb
FF1D : 39    "9"    rts
        ;
FF1E : 3D    "="    db  $3D
        ;
FF1F : 3F    "?"    swi
FF20 : 3F    "?"    swi
FF21 : 3F    "?"    swi
FF22 : 3E    ">"    wai
FF23 : 39    "9"    rts
        ;
FF24        XFF24:
FF24 : 3C    "<"    db  $3C
        ;
FF25 : 32    "2"    pula
FF26 : 2B 27    "+'"    bmi  LFF4F
FF28 : 20 1A    "  "    bra  LFF44
        ;
FF2A : 14    " "    db  $14
        ;
FF2B : 0D    " "    sec
FF2C : 09    " "    dex
        ;
FF2D : 05 02    "  "    db  $05, $02
        ;
FF2F : 01    " "    nop
        ;
FF30 : 00    " "    db  $00
        ;
FF31 : 01    " "    nop
        ;
FF32 : 02 05    "  "    db  $02, $05
        ;
FF34 : 0A    " "    clv
FF35 : 0D    " "    sec
        ;
FF36 : 14 1A    "  "    db  $14, $1A
        ;
FF38 : 20 25    " %"    bra  LFF5F
        ;
FF3A : 00    " "    db  $00
        ;
FF3B : 32    "2"    pula
FF3C : 37    "7"    pshb
FF3D : 01    " "    nop
FF3E : 01    " "    nop
FF3F        XFF3F:
FF3F : 01    " "    nop
FF40 : 01    " "    nop
FF41 : 01    " "    nop
FF42 : 01    " "    nop
FF43 : 01    " "    nop
FF44        LFF44:
FF44 : 01    " "    nop
FF45 : 32    "2"    pula
        ;
FF46 : 00    " "    db  $00
        ;
FF47 : 27 20    "' "    beq  LFF69
        ;
FF49 : 00 14    "  "    db  $00, $14
        ;
FF4B : 0D    " "    sec
        ;
FF4C : 00 05 02 00  "    "    db  $00, $05, $02, $00
FF50 : 00 00 02 05  "    "    db  $00, $00, $02, $05
        ;
FF54 : 0A    " "    clv
FF55 : 0D    " "    sec
        ;
FF56 : 14 00    "  "    db  $14, $00
        ;
FF58 : 20 01    "  "    bra  LFF5B
        ;
FF5A : 51    "Q"    db  $51
        ;
FF5B        LFF5B:
FF5B : 01    " "    nop
FF5C : 99 01    "  "    adca  X0001
FF5E : 99 10    "  "    adca  X0010
FF60 : 99 20    "  "    adca  X0020
FF62 : 99 30    " 0"    adca  X0030
FF64 : 99 01    "  "    adca  X0001
FF66 : D1 09    "  "    cmpb  X0009
FF68 : D1 07    "  "    cmpb  X0007
FF6A : D1 03    "  "    cmpb  X0003
FF6C : D1 09    "  "    cmpb  X0009
        ;
FF6E : 05 02    "  "    db  $05, $02
        ;
FF70 : 01    " "    nop
        ;
FF71 : 00    " "    db  $00
        ;
FF72 : 01    " "    nop
        ;
FF73 : 02 05    "  "    db  $02, $05
        ;
FF75        XFF75:
FF75 : 0A    " "    clv
FF76 : 0D    " "    sec
        ;
FF77 : 14 1A    "  "    db  $14, $1A
        ;
FF79 : 20 25    " %"    bra  LFFA0
        ;
FF7B : 01    " "    nop
FF7C : 01    " "    nop
FF7D : FF 00 05    "   "    stx  X0005
        ;
FF80        XFF80:
FF80 : 00    " "    db  $00
        ;
FF81 : 08    " "    inx
FF82 : 01    " "    nop
FF83 : FF 00 02    "   "    stx  X0002
        ;
FF86 : 00    " "    db  $00
        ;
FF87 : 10    " "    sba
FF88 : FF FF 00    "   "    stx  XFF00
        ;
FF8B : 03 00 04    "   "    db  $03, $00, $04
        ;
FF8E : 01    " "    nop
FF8F : FF 00 06    "   "    stx  X0006
        ;
FF92 : 00 03    "  "    db  $00, $03
        ;
FF94 : 01    " "    nop
FF95 : FF 00 01    "   "    stx  X0001
        ;
FF98 : 00    " "    db  $00
        ;
FF99 : 07    " "    tpa
FF9A : 01    " "    nop
FF9B : FF 00 09    "   "    stx  X0009
        ;
FF9E : 00 05    "  "    db  $00, $05
        ;
FFA0        LFFA0:
FFA0 : 01    " "    nop
FFA1 : FF 00 04    "   "    stx  X0004
        ;
FFA4 : 00    " "    db  $00
        ;
FFA5        XFFA5:
FFA5 : 08    " "    inx
FFA6 : FF 00 FF    "   "    stx  X00FF
FFA9 : 01    " "    nop
        ;
FFAA : 00 00    "  "    db  $00, $00
        ;
FFAC : FF 7B 01    " { "    stx  X7B01
FFAF : 01    " "    nop
FFB0 : FF 00 40    "  @"    stx  X0040
        ;
FFB3 : 00 00    "  "    db  $00, $00
        ;
FFB5 : FF AE 30    "  0"    stx  XAE30
FFB8 : FE FF 00    "   "    ldx  XFF00
        ;
FFBB : 05 00    "  "    db  $05, $00
        ;
FFBD : 08    " "    inx
FFBE : 01    " "    nop
FFBF : B0 FD 0D    "   "    suba  XFD0D
        ;
FFC2 : 00 00    "  "    db  $00, $00
        ;
FFC4        XFFC4:
FFC4 : FF B7 01    "   "    stx  XB701
        ;
FFC7 : 02    " "    db  $02
        ;
FFC8 : FF 00 01    "   "    stx  X0001
        ;
FFCB : 00    " "    db  $00
        ;
FFCC : 01    " "    nop
        ;
FFCD : 04    " "    db  $04
        ;
FFCE : FF 00 03    "   "    stx  X0003
        ;
FFD1 : DD    " "    db  $DD
        ;
FFD2 : 30    "0"    tsx
FFD3 : 06    " "    tap
FFD4 : D8 E9    "  "    eorb  X00E9
        ;
FFD6 : 02 00 00    "   "    db  $02, $00, $00
        ;
FFD9 : FF C6 30    "  0"    stx  XC630
FFDC : FA FF FF    "   "    orab  XFFFF
        ;
FFDF : 02 00    "  "    db  $02, $00
        ;
FFE1 : 01    " "    nop
        ;
FFE2 : 04    " "    db  $04
        ;
FFE3 : FF FE 03    "   "    stx  XFE03
        ;
FFE6 : DD    " "    db  $DD
        ;
FFE7 : 30    "0"    tsx
        ;
FFE8 : 04    " "    db  $04
        ;
FFE9 : D8 D0    "  "    eorb  X00D0
FFEB : 01    " "    nop
        ;
FFEC : 00 00    "  "    db  $00, $00
        ;
FFEE : FF DB FF    "   "    stx  XDBFF
FFF1 : FF FF FF    "   "    stx  XFFFF
FFF4 : FF FF FF    "   "    stx  XFFFF
FFF7 : FF 
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : EF 1E                          ;IRQ
FFFA : E3 C1                          ;RESET SWI (software) 
FFFC : F4 C9                          ;NMI 
FFFE : E3 C1                          ;RESET (hardware) 

;--------------------------------------------------------------


