        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    ThunderballSpeech4.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  B005
        ;  CRC-32:    2A4D6F4B
        ;
        ;  Date:    Thu May 13 13:47:04 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Thunderball, Speech entry ROM IC4
        ;
        ;
          org  $E000
        ;
E000        XE000:
E000 : 30    "0"    tsx
E001 : F0 EF 03    "   "    subb  XEF03
E004 : AF FF    "  "    sts  $FF,x
E006 : F4 05 1E    "   "    andb  X051E
E009 : FE E1 81    "   "    ldx  XE181
E00C : FF 1F 30    "  0"    stx  X1F30
E00F        XE00F:
E00F : F8 CF 01    "   "    eorb  XCF01
E012 : FF FC B4    "   "    stx  XFCB4
        ;
E015        XE015:
E015 : 1E    " "    db  $1E
        ;
E016 : 78 F8 07    "x  "    asl  XF807
E019 : 07    " "    tpa
E01A : FE FB C0    "   "    ldx  XFBC0
E01D : C5 3F    " ?"    bitb  #$3F
E01F        XE01F:
E01F : 0C    " "    clc
        ;
E020 : FC    " "    db  $FC
        ;
E021 : B7 AA F6    "   "    staa  XAAF6
E024 : 81 07    "  "    cmpa  #$07
E026 : 7F 70 E0    " p "    clr  X70E0
        ;
E029 : CF    " "    db  $CF
        ;
E02A : 07    " "    tpa
E02B : 5C    "\"    incb
        ;
E02C : FC    " "    db  $FC
        ;
E02D : C1 81    "  "    cmpb  #$81
E02F : 9F 0F    "  "    sts  X000F
        ;
E031 : 5B FC    "[ "    db  $5B, $FC
        ;
E033 : C1 83    "  "    cmpb  #$83
        ;
E035 : 1F 38    " 8"    db  $1F, $38
        ;
E037 : F0 C7 07    "   "    subb  XC707
        ;
E03A : 1E    " "    db  $1E
        ;
E03B : FE 70 00    " p "    ldx  X7000
E03E : 7F 2F 54    " /T"    clr  X2F54
E041 : D7 07    "  "    stab  X0007
E043 : 0E    " "    cli
        ;
E044 : FC    " "    db  $FC
        ;
E045 : E0 80    "  "    subb  $80,x
        ;
E047 : 1F    " "    db  $1F
        ;
E048 : 7E E0 C3    "~  "    jmp  LE0C3
        ;
E04B : 07    " "    tpa
        ;
E04C : 1F    " "    db  $1F
        ;
E04D : 78 F0 E1    "x  "    asl  XF0E1
E050 : 47    "G"    asra
E051 : 3F    "?"    swi
E052 : C0 C0    "  "    subb  #$C0
        ;
E054 : 1F    " "    db  $1F
        ;
E055 : 0C    " "    clc
E056 : F8 F3 08    "   "    eorb  XF308
        ;
E059 : 3C    "<"    db  $3C
        ;
E05A : DE 02    "  "    ldx  X0002
E05C : 07    " "    tpa
E05D : FE F0 C1    "   "    ldx  XF0C1
        ;
E060 : 4B    "K"    db  $4B
        ;
E061 : 3F    "?"    swi
E062 : 60 80    "` "    neg  $80,x
E064 : 3F    "?"    swi
E065 : 7C E0 83    "|  "    inc  XE083
        ;
E068 : 1F    " "    db  $1F
        ;
E069 : 2C F0    ", "    bge  LE05B
E06B : A5 23    " #"    bita  $23,x
E06D : 70 B5 0B    "p  "    neg  XB50B
E070 : 16    " "    tab
E071 : BD 0F 0E    "   "    jsr  L0F0E
E074 : C0 E0    "  "    subb  #$E0
        ;
E076 : 83    " "    db  $83
        ;
E077 : C5 7E    " ~"    bitb  #$7E
E079 : 7E C0 8A    "~  "    jmp  LC08A
        ;
E07C : 0F    " "    sei
        ;
E07D : 14    " "    db  $14
        ;
E07E : B4 D2 1F    "   "    anda  XD21F
        ;
E081 : 1E FC    "  "    db  $1E, $FC
        ;
E083        XE083:
E083 : E0 01    "  "    subb  $01,x
E085 : 80 5C    " \"    suba  #$5C
E087        XE087:
E087 : AD D4    "  "    jsr  $D4,x            ;INFO: index jump
E089 : EE 0F    "  "    ldx  $0F,x
E08B : 2A 74    "*t"    bpl  LE101
E08D : 48    "H"    asla
E08E : 7E 70 E0    "~p "    jmp  L70E0
        ;
E091 : 8F    " "    db  $8F
        ;
E092 : 0F    " "    sei
E093 : 7A E0 00    "z  "    dec  XE000
        ;
E096 : 02    " "    db  $02
        ;
E097 : D6 AE    "  "    ldab  X00AE
E099 : F2 EA 8B    "   "    sbcb  XEA8B
E09C : D2 07    "  "    sbcb  X0007
E09E : 07    " "    tpa
E09F : 7C F0 C0    "|  "    inc  XF0C0
E0A2 : 8B 9F    "  "    adda  #$9F
E0A4 : 6A 08    "j "    dec  $08,x
        ;
E0A6 : 05    " "    db  $05
        ;
E0A7 : 01    " "    nop
E0A8 : 09    " "    dex
E0A9 : 7D F5 F0    "}  "    tst  XF5F0
        ;
E0AC : E3 03    "  "    db  $E3, $03
        ;
E0AE : 3E    ">"    wai
        ;
E0AF : 3C    "<"    db  $3C
        ;
E0B0 : C0 A1    "  "    subb  #$A1
        ;
E0B2 : 8F 3C    " <"    db  $8F, $3C
        ;
E0B4 : F4 65 07    " e "    andb  X6507
E0B7 : 81 82    "  "    cmpa  #$82
E0B9 : 28 A0    "( "    bvc  LE05B
        ;
E0BB : 1F    " "    db  $1F
        ;
E0BC : 5F    "_"    clrb
E0BD : F8 E9 81    "   "    eorb  XE981
E0C0 : 0D    " "    sec
        ;
E0C1 : 1D    " "    db  $1D
        ;
E0C2 : D1 C0    "  "    cmpb  X00C0
E0C4 : 97 3E    " >"    staa  X003E
E0C6 : 5A    "Z"    decb
E0C7 : 69 49    "iI"    rol  $49,x
E0C9 : 01    " "    nop
E0CA : F0 C0 00    "   "    subb  XC000
E0CD : 3F    "?"    swi
E0CE : 7F F0 45    "  E"    clr  XF045
E0D1 : 57    "W"    asrb
        ;
E0D2        XE0D2:
E0D2 : 1A 62    " b"    db  $1A, $62
        ;
E0D4 : A1 0D    "  "    cmpa  $0D,x
E0D6 : 5D    "]"    tstb
E0D7 : F2 AA 45    "  E"    sbcb  XAA45
        ;
E0DA : FC    " "    db  $FC
        ;
E0DB : 70 00 06    "p  "    neg  X0006
        ;
E0DE : 3A    ":"    db  $3A
        ;
E0DF : E8 8B    "  "    eorb  $8B,x
E0E1 : 5F    "_"    clrb
E0E2 : F5 92 16    "   "    bitb  X9216
E0E5 : AA 50    " P"    oraa  $50,x
E0E7 : A8 52    " R"    eora  $52,x
E0E9 : 57    "W"    asrb
E0EA : DE D5    "  "    ldx  X00D5
E0EC : 95 24    " $"    bita  X0024
E0EE : 11    " "    cba
        ;
E0EF : 00 41    " A"    db  $00, $41
        ;
E0F1 : 4A    "J"    deca
E0F2 : 7A 7B BB    "z{ "    dec  X7BBB
        ;
E0F5 : 6B 55    "kU"    db  $6B, $55
        ;
E0F7 : 8A 84    "  "    oraa  #$84
E0F9 : 28 24    "($"    bvc  LE11F
E0FB : D5 7D    " }"    bitb  X007D
E0FD : BB BA 82    "   "    adda  XBA82
E100 : 84 48    " H"    anda  #$48
E102 : 54    "T"    lsrb
E103 : 90 48    " H"    suba  X0048
E105 : AA BA    "  "    oraa  $BA,x
E107        XE107:
E107 : AF DD    "  "    sts  $DD,x
E109 : 6A 85    "j "    dec  $85,x
        ;
E10B : 52    "R"    db  $52
        ;
E10C : 54    "T"    lsrb
        ;
E10D : 55 15    "U "    db  $55, $15
        ;
E10F : 39    "9"    rts
        ;
E110 : A5 52    " R"    bita  $52,x
E112 : AA 84    "  "    oraa  $84,x
E114 : 0A    " "    clv
        ;
E115 : 52    "R"    db  $52
        ;
E116 : D2 15    "  "    sbcb  X0015
E118 : 28 28    "(("    bvc  LE142
E11A : 91 5A    " Z"    cmpa  X005A
E11C : DF ED    "  "    stx  X00ED
E11E : AF 56    " V"    sts  $56,x
E120 : A5 02    "  "    bita  $02,x
E122 : 92 50    " P"    sbca  X0050
E124 : 49    "I"    rola
E125 : AD B5    "  "    jsr  $B5,x            ;INFO: index jump
E127 : 57    "W"    asrb
E128 : AB 4A    " J"    adda  $4A,x
E12A : 88 44    " D"    eora  #$44
E12C : 29 25    ")%"    bvs  LE153
        ;
E12E : 14    " "    db  $14
        ;
E12F : D2 E5    "  "    sbcb  X00E5
E131 : BE DE AA    "   "    lds  XDEAA
E134 : AA 44    " D"    oraa  $44,x
E136 : 89 4A    " J"    adca  #$4A
E138 : A4 4A    " J"    anda  $4A,x
        ;
E13A : 55 55 55    "UUU"    db  $55, $55, $55
        ;
E13D : 6D 55    "mU"    tst  $55,x
        ;
E13F        XE13F:
E13F : 45    "E"    db  $45
        ;
E140 : 11    " "    cba
E141 : A4 53    " S"    anda  $53,x
        ;
E143 : 55    "U"    db  $55
        ;
E144 : B5 80 48    "  H"    bita  X8048
E147 : 94 6A    " j"    anda  X006A
E149 : BF ED D6    "   "    sts  XEDD6
E14C : AA 92    "  "    oraa  $92,x
E14E : 44    "D"    lsra
E14F : 44    "D"    lsra
E150 : 49    "I"    rola
        ;
E151 : 55 55 55 FD  "UUU "    db  $55, $55, $55, $FD
        ;
E155 : 7A 55 15    "zU "    dec  X5515
E158 : 22 12    "" "    bhi  LE16C
E15A : A5 54    " T"    bita  $54,x
E15C : 5D    "]"    tstb
E15D : AB 92    "  "    adda  $92,x
E15F : A4 A4    "  "    anda  $A4,x
E161 : 54    "T"    lsrb
E162 : B7 77 BD    " w "    staa  X77BD
E165 : 6A 95    "j "    dec  $95,x
E167 : 6A 51    "jQ"    dec  $51,x
E169 : 11    " "    cba
        ;
E16A : 55    "U"    db  $55
        ;
E16B : 28 4A    "(J"    bvc  LE1B7
E16D : AA 5A    " Z"    oraa  $5A,x
        ;
E16F : 3D    "="    db  $3D
        ;
E170 : D5 6A    " j"    bitb  X006A
E172 : 4A    "J"    deca
E173 : 24 91    "$ "    bcc  LE106
E175 : 54    "T"    lsrb
        ;
E176        LE176:
E176 : 55    "U"    db  $55
        ;
E177 : 5D    "]"    tstb
E178 : A9 4A    " J"    adca  $4A,x
E17A : 2A FA    "* "    bpl  LE176
        ;
E17C : DD    " "    db  $DD
        ;
E17D : AE 56    " V"    lds  $56,x
        ;
E17F        LE17F:
E17F        XE17F:
E17F : 15    " "    db  $15
        ;
E180 : AA 52    " R"    oraa  $52,x
E182 : A4 4A    " J"    anda  $4A,x
        ;
E184 : 55    "U"    db  $55
        ;
E185 : B5 55 55    " UU"    bita  X5555
        ;
E188 : 51 55 55    "QUU"    db  $51, $55, $55
        ;
E18B : B5 D5 AA    "   "    bita  XD5AA
E18E : 50    "P"    negb
E18F : 25 B5    "% "    bcs  LE146
E191 : 5C    "\"    incb
E192 : D5 4D    " M"    bitb  X004D
E194 : 10    " "    sba
E195 : 89 52    " R"    adca  #$52
E197 : B5 ED DB    "   "    bita  XEDDB
E19A : 76 B5 AA    "v  "    ror  XB5AA
E19D : 8A 24    " $"    oraa  #$24
        ;
E19F : 51    "Q"    db  $51
        ;
E1A0 : 54    "T"    lsrb
        ;
E1A1 : 55 55    "UU"    db  $55, $55
        ;
E1A3 : AB AA    "  "    adda  $AA,x
E1A5 : 4A    "J"    deca
        ;
E1A6 : 5B    "["    db  $5B
        ;
E1A7 : EE D4    "  "    ldx  $D4,x
E1A9 : 89 22    " ""    adca  #$22
E1AB : AA 48    " H"    oraa  $48,x
        ;
E1AD : CD    " "    db  $CD
        ;
E1AE : 99 AD    "  "    adca  X00AD
E1B0 : 76 57 5D    "vW]"    ror  X575D
E1B3 : A1 42    " B"    cmpa  $42,x
E1B5 : 95 D8    "  "    bita  X00D8
E1B7        LE1B7:
E1B7 : B2 AF B7    "   "    sbca  XAFB7
E1BA : B6 A6 2A    "  *"    ldaa  XA62A
E1BD : 54    "T"    lsrb
E1BE : A4 92    "  "    anda  $92,x
        ;
E1C0 : 52    "R"    db  $52
        ;
E1C1 : 8C 52 4A    " RJ"    cpx  #$524A
E1C4 : AA 5A    " Z"    oraa  $5A,x
E1C6 : 57    "W"    asrb
E1C7 : BB 6B 59    " kY"    adda  X6B59
E1CA : 23 4D    "#M"    bls  LE219
E1CC : 9A 29    " )"    oraa  X0029
E1CE        LE1CE:
E1CE : 31    "1"    ins
E1CF : 35    "5"    txs
E1D0 : B7 A6 34    "  4"    staa  XA634
        ;
E1D3 : 6B    "k"    db  $6B
        ;
E1D4 : 66 AA    "f "    ror  $AA,x
E1D6 : D4 35    " 5"    andb  X0035
E1D8 : 33    "3"    pulb
E1D9 : 37    "7"    pshb
E1DA : 22 55    ""U"    bhi  LE231
E1DC : 4A    "J"    deca
E1DD : 68 A4    "h "    asl  $A4,x
        ;
E1DF : 51    "Q"    db  $51
        ;
E1E0 : 73 C6 AC    "s  "    com  XC6AC
E1E3 : 98 32    " 2"    eora  X0032
E1E5 : B5 8A 6A    "  j"    bita  X8A6A
E1E8 : 66 45    "fE"    ror  $45,x
E1EA : 9B 52    " R"    adda  X0052
E1EC : 7A 6A 64    "zjd"    dec  X6A64
E1EF : A5 44    " D"    bita  $44,x
E1F1 : C5 4E    " N"    bitb  #$4E
E1F3 : 4D    "M"    tsta
        ;
E1F4 : 12 6B    " k"    db  $12, $6B
        ;
E1F6 : 26 D6    "& "    bne  LE1CE
E1F8 : AA A6    "  "    oraa  $A6,x
        ;
E1FA : 1A    " "    db  $1A
        ;
E1FB : 67 A6    "g "    asr  $A6,x
E1FD        LE1FD:
E1FD : B1 94 2B    "  +"    cmpa  X942B
E200 : E5 CA    "  "    bitb  $CA,x
E202 : A2 56    " V"    sbca  $56,x
E204 : 4A    "J"    deca
E205 : 8E 74 D2    " t "    lds  #$74D2
        ;
E208 : CC    " "    db  $CC
        ;
E209 : 99 9A    "  "    adca  X009A
        ;
E20B : 1C    " "    db  $1C
        ;
E20C : 3B    ";"    rti
        ;
E20D        LE20D:
E20D : 31    "1"    ins
E20E : 57    "W"    asrb
E20F : C6 CC    "  "    ldab  #$CC
E211 : 64 C6    "d "    lsr  $C6,x
E213 : 5C    "\"    incb
        ;
E214 : 4B CC    "K "    db  $4B, $CC
        ;
E216 : 6A CE    "j "    dec  $CE,x
E218 : AA 71    " q"    oraa  $71,x
E21A : C6 1C    "  "    ldab  #$1C
E21C : 39    "9"    rts
        ;
E21D : 31    "1"    ins
E21E : 33    "3"    pulb
E21F : 29 39    ")9"    bvs  LE25A
        ;
E221 : 6B 72    "kr"    db  $6B, $72
        ;
E223 : 6A CD    "j "    dec  $CD,x
E225 : 8C 39 F0    " 9 "    cpx  #$39F0
        ;
E228 : A3    " "    db  $A3
        ;
E229 : 4C    "L"    inca
E22A : F8 51 35    " Q5"    eorb  X5135
E22D : E5 8C    "  "    bitb  $8C,x
E22F : 8D 65    " e"    bsr  LE296
E231        LE231:
E231 : A6 D4    "  "    ldaa  $D4,x
E233 : 54    "T"    lsrb
E234 : E5 69    " i"    bitb  $69,x
E236 : A9 CE    "  "    adca  $CE,x
E238 : 54    "T"    lsrb
        ;
E239 : 5B    "["    db  $5B
        ;
E23A : CA B4    "  "    orab  #$B4
E23C : CA 8C    "  "    orab  #$8C
E23E : D8 91    "  "    eorb  X0091
E240 : 2D CB    "- "    blt  LE20D
E242        LE242:
E242 : 58    "X"    aslb
E243 : 36    "6"    psha
E244 : 53    "S"    comb
        ;
E245 : 4B    "K"    db  $4B
        ;
E246 : 9C 2B    " +"    cpx  X002B
E248 : 76 E6 C8    "v  "    ror  XE6C8
E24B : 99 9D    "  "    adca  X009D
E24D : 39    "9"    rts
        ;
E24E : 63 EC    "c "    com  $EC,x
E250 : 98 26    " &"    eora  X0026
E252 : 1B    " "    aba
E253 : 26 ED    "& "    bne  LE242
E255        LE255:
E255 : 58    "X"    aslb
E256 : 69 93    "i "    rol  $93,x
E258 : A5 46    " F"    bita  $46,x
E25A        LE25A:
E25A : 8E 59 63    " Yc"    lds  #$5963
E25D : CE 98 39    "  9"    ldx  #$9839
E260 : 53    "S"    comb
E261 : 8D 9A    "  "    bsr  LE1FD
E263 : 31    "1"    ins
E264 : 76 CA 99    "v  "    ror  XCA99
E267 : A9 99    "  "    adca  $99,x
        ;
E269 : 6B    "k"    db  $6B
        ;
E26A : 29 4E    ")N"    bvs  LE2BA
E26C : BA B1 92    "   "    oraa  XB192
E26F : AD 34    " 4"    jsr  $34,x            ;INFO: index jump
E271 : 95 99    "  "    bita  X0099
        ;
E273 : B3    " "    db  $B3
        ;
E274 : CA 8A    "  "    orab  #$8A
E276 : 35    "5"    txs
E277 : 33    "3"    pulb
        ;
E278 : 65 CC 18    "e  "    db  $65, $CC, $18
        ;
E27B : 37    "7"    pshb
E27C : CE 99 B1    "   "    ldx  #$99B1
        ;
E27F        XE27F:
E27F : C3    " "    db  $C3
        ;
E280 : 9A 53    " S"    oraa  X0053
E282 : B2 E2 8A    "   "    sbca  XE28A
E285 : 2B CE    "+ "    bmi  LE255
E287 : 9C 31    " 1"    cpx  X0031
        ;
E289 : E3    " "    db  $E3
E28A        XE28A:
E28A : C3 1A    "  "    db  $C3, $1A
        ;
E28C : 79 AA D2    "y  "    rol  XAAD2
        ;
E28F : 1A    " "    db  $1A
        ;
E290 : 33    "3"    pulb
E291 : E6 8C    "  "    ldab  $8C,x
E293 : 33    "3"    pulb
E294 : A7 4C    " L"    staa  $4C,x
E296        LE296:
E296 : 2D 75    "-u"    blt  LE30D
E298 : 4A    "J"    deca
        ;
E299 : 55    "U"    db  $55
        ;
E29A : B9 6C A9    " l "    adca  X6CA9
E29D : 31    "1"    ins
        ;
E29E : B3    " "    db  $B3
        ;
E29F : F6 E0 15    "   "    ldab  XE015
        ;
E2A2 : 6B    "k"    db  $6B
        ;
E2A3 : E4 54    " T"    andb  $54,x
E2A5 : 69 A5    "i "    rol  $A5,x
        ;
E2A7 : 4B    "K"    db  $4B
        ;
E2A8 : A7 54    " T"    staa  $54,x
E2AA : B5 32 4B    " 2K"    bita  X324B
        ;
E2AD : 55 6B    "Uk"    db  $55, $6B
        ;
E2AF        LE2AF:
E2AF : C5 13    "  "    bitb  #$13
E2B1 : A7 5A    " Z"    staa  $5A,x
E2B3 : 53    "S"    comb
        ;
E2B4 : 45    "E"    db  $45
        ;
E2B5 : 59    "Y"    rolb
E2B6 : 73 72 D4    "sr "    com  X72D4
        ;
E2B9 : 52    "R"    db  $52
        ;
E2BA        LE2BA:
E2BA : 57    "W"    asrb
E2BB : AA CC    "  "    oraa  $CC,x
E2BD : 4A    "J"    deca
E2BE : 35    "5"    txs
E2BF : C6 9A    "  "    ldab  #$9A
E2C1 : 9A B1    "  "    oraa  X00B1
E2C3 : 33    "3"    pulb
E2C4 : 33    "3"    pulb
E2C5 : 66 4D    "fM"    ror  $4D,x
        ;
E2C7 : 55    "U"    db  $55
        ;
E2C8 : B1 96 4E    "  N"    cmpa  X964E
E2CB : 96 2D    " -"    ldaa  X002D
        ;
E2CD : 55    "U"    db  $55
        ;
E2CE : 6A 55    "jU"    dec  $55,x
E2D0 : A7 9A    "  "    staa  $9A,x
E2D2 : 19    " "    daa
        ;
E2D3 : B3    " "    db  $B3
        ;
E2D4 : AA 1A    "  "    oraa  $1A,x
E2D6 : 59    "Y"    rolb
E2D7 : 2B D6    "+ "    bmi  LE2AF
E2D9 : 2C 55    ",U"    bge  LE330
        ;
E2DB : 6B    "k"    db  $6B
        ;
E2DC : 8C 5A 69    " Zi"    cpx  #$5A69
E2DF        LE2DF:
E2DF : 53    "S"    comb
E2E0 : A5 66    " f"    bita  $66,x
E2E2 : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
        ;
E2E4 : 55 65    "Ue"    db  $55, $65
        ;
E2E6 : D5 AA    "  "    bitb  X00AA
E2E8 : 54    "T"    lsrb
        ;
E2E9 : 55 55    "UU"    db  $55, $55
        ;
E2EB : D5 AA    "  "    bitb  X00AA
E2ED : 53    "S"    comb
        ;
E2EE : 55 65    "Ue"    db  $55, $65
        ;
E2F0 : AD 5A    " Z"    jsr  $5A,x            ;INFO: index jump
E2F2 : 53    "S"    comb
E2F3 : C6 9A    "  "    ldab  #$9A
E2F5 : 69 6A    "ij"    rol  $6A,x
E2F7 : A5 55    " U"    bita  $55,x
        ;
E2F9 : 55    "U"    db  $55
        ;
E2FA : 5D    "]"    tstb
        ;
E2FB : 55    "U"    db  $55
        ;
E2FC : A9 46    " F"    adca  $46,x
E2FE : 8D 39    " 9"    bsr  LE339
        ;
E300 : 75    "u"    db  $75
        ;
E301 : CA 52    " R"    orab  #$52
E303        XE303:
E303 : 2B 6D    "+m"    bmi  LE372
E305 : AC AA    "  "    cpx  $AA,x
E307        XE307:
E307 : AA A6    "  "    oraa  $A6,x
        ;
E309 : CC    " "    db  $CC
        ;
E30A : 19    " "    daa
E30B : 63 55    "cU"    com  $55,x
        ;
E30D        LE30D:
E30D : 55    "U"    db  $55
        ;
E30E : 2B 55    "+U"    bmi  LE365
        ;
E310 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
E314 : 55 55    "UU"    db  $55, $55
        ;
E316 : AA 52    " R"    oraa  $52,x
E318 : A5 4A    " J"    bita  $4A,x
E31A : D5 4A    " J"    bitb  X004A
        ;
E31C : 55    "U"    db  $55
        ;
E31D : 54    "T"    lsrb
        ;
E31E : 55 55    "UU"    db  $55, $55
        ;
E320 : B5 E8 52    "  R"    bita  XE852
E323 : 5A    "Z"    decb
        ;
E324 : 55    "U"    db  $55
        ;
E325 : 6A C5    "j "    dec  $C5,x
        ;
E327 : 55    "U"    db  $55
        ;
E328 : 74 71 AA    "tq "    lsr  X71AA
        ;
E32B : 55 3C    "U<"    db  $55, $3C
        ;
E32D        LE32D:
E32D : A5 55    " U"    bita  $55,x
        ;
E32F : 55    "U"    db  $55
        ;
E330        LE330:
E330 : 5C    "\"    incb
        ;
E331 : 51    "Q"    db  $51
        ;
E332 : 2D 55    "-U"    blt  LE389
E334 : 8D A9    "  "    bsr  LE2DF
E336 : AE 68    " h"    lds  $68,x
E338 : 4D    "M"    tsta
E339        LE339:
E339 : EA 8A    "  "    orab  $8A,x
E33B : EA 42    " B"    orab  $42,x
        ;
E33D : B3    " "    db  $B3
        ;
E33E : CA 5A    " Z"    orab  #$5A
E340 : A9 56    " V"    adca  $56,x
E342 : 74 45 57    "tEW"    lsr  X4557
        ;
E345 : 51    "Q"    db  $51
        ;
E346 : 2D 5A    "-Z"    blt  LE3A2
E348 : AB 68    " h"    adda  $68,x
E34A : 0B    " "    sev
        ;
E34B : 6B    "k"    db  $6B
        ;
E34C : 19    " "    daa
E34D : 7E A2 AA    "~  "    jmp  LA2AA
        ;
E350 : 86 76    " v"    ldaa  #$76
E352 : 8B 3A    " :"    adda  #$3A
E354 : AA 55    " U"    oraa  $55,x
        ;
E356 : 42    "B"    db  $42
        ;
E357 : 2F D4    "/ "    ble  LE32D
E359 : D2 A8    "  "    sbcb  X00A8
E35B : CA 51    " Q"    orab  #$51
E35D : 95 3A    " :"    bita  X003A
E35F : 85 4B    " K"    bita  #$4B
E361 : DF F6    "  "    stx  X00F6
E363 : D7 80    "  "    stab  X0080
E365        LE365:
E365 : 06    " "    tap
E366 : 08    " "    inx
E367 : E0 7D    " }"    subb  $7D,x
E369 : 7F FF 3F    "  ?"    clr  XFF3F
        ;
E36C : 00    " "    db  $00
        ;
E36D : 01    " "    nop
E36E : 76 F0 01    "v  "    ror  XF001
E371 : 7F FD FF    "   "    clr  XFDFF
E374 : 07    " "    tpa
        ;
E375 : 00    " "    db  $00
        ;
E376 : E0 9F    "  "    subb  $9F,x
        ;
E378 : 1F    " "    db  $1F
        ;
E379 : E0 F3    "  "    subb  $F3,x
E37B : FF 1F 00    "   "    stx  X1F00
E37E : 80 FF    "  "    suba  #$FF
        ;
E380 : F3 00 FC    "   "    db  $F3, $00, $FC
        ;
E383 : FF FF 01    "   "    stx  XFF01
E386 : 78 F8 0F    "x  "    asl  XF80F
E389        LE389:
E389 : 08    " "    inx
E38A : C0 FF    "  "    subb  #$FF
E38C : FF 07 F0    "   "    stx  X07F0
        ;
E38F : E3 1F 00    "   "    db  $E3, $1F, $00
        ;
E392 : 80 FF    "  "    suba  #$FF
E394 : F9 1F E0    "   "    adcb  X1FE0
        ;
E397 : 8F    " "    db  $8F
        ;
E398 : 7F 00 00    "   "    clr  X0000
E39B : FE E1 3F    "  ?"    ldx  XE13F
E39E : E0 0F    "  "    subb  $0F,x
E3A0 : FF 00 06    "   "    stx  X0006
E3A3 : F8 C3 7F    "   "    eorb  XC37F
E3A6 : E0 07    "  "    subb  $07,x
E3A8 : FE 01 0F    "   "    ldx  X010F
E3AB : F8 83 7F    "   "    eorb  X837F
E3AE : C0 07    "  "    subb  #$07
E3B0 : FE 01 1F    "   "    ldx  X011F
E3B3 : F8 03 7F    "   "    eorb  X037F
E3B6 : C0 07    "  "    subb  #$07
E3B8 : FE 00 1F    "   "    ldx  X001F
E3BB : F8 83 3F    "  ?"    eorb  X833F
E3BE : E0 07    "  "    subb  $07,x
E3C0 : FE 80 0F    "   "    ldx  X800F
        ;
E3C3 : FC    " "    db  $FC
        ;
E3C4 : C1 3F    " ?"    cmpb  #$3F
E3C6 : E0 03    "  "    subb  $03,x
E3C8 : 3F    "?"    swi
E3C9 : 80 07    "  "    suba  #$07
        ;
E3CB : FC    " "    db  $FC
        ;
E3CC : E0 3F    " ?"    subb  $3F,x
E3CE : E0 83    "  "    subb  $83,x
E3D0 : 3F    "?"    swi
E3D1 : C0 01    "  "    subb  #$01
E3D3 : FE F0 3F    "  ?"    ldx  XF03F
E3D6 : E0 83    "  "    subb  $83,x
        ;
E3D8 : 1F    " "    db  $1F
        ;
E3D9 : 0C    " "    clc
E3DA : 01    " "    nop
E3DB : 7E F8 7F    "~  "    jmp  LF87F
        ;
E3DE : 80 03    "  "    suba  #$03
E3E0 : 7F 0F 06    "   "    clr  X0F06
E3E3 : 7C F8 FF    "|  "    inc  XF8FF
E3E6 : 01    " "    nop
        ;
E3E7 : 03    " "    db  $03
        ;
E3E8 : FE 0F 0E    "   "    ldx  X0F0E
E3EB : 70 F0 FF    "p  "    neg  XF0FF
E3EE : 07    " "    tpa
        ;
E3EF : 00    " "    db  $00
        ;
E3F0 : F8 7F 14    "   "    eorb  X7F14
E3F3 : C0 C0    "  "    subb  #$C0
E3F5 : FF 3F 00    " ? "    stx  X3F00
E3F8 : C0 FF    "  "    subb  #$FF
E3FA : 2F 00    "/ "    ble  LE3FC
E3FC        LE3FC:
E3FC : 01    " "    nop
E3FD : FF FF 01    "   "    stx  XFF01
        ;
E400 : 00    " "    db  $00
        ;
E401 : FE FF 03    "   "    ldx  XFF03
        ;
E404 : 1C    " "    db  $1C
        ;
E405 : F8 FF 1F    "   "    eorb  XFF1F
E408 : 20 E0    "  "    bra  LE3EA
        ;
E40A : FF 1F E0    "   "    stx  X1FE0
E40D : 80 FF    "  "    suba  #$FF
E40F : FF 01 06    "   "    stx  X0106
E412 : 3E    ">"    wai
E413 : FF 08 0F    "   "    stx  X080F
        ;
E416 : FC    " "    db  $FC
        ;
E417 : F8 3F E0    " ? "    eorb  X3FE0
E41A : C0 F7    "  "    subb  #$F7
E41C : FB 81 C1    "   "    addb  X81C1
        ;
E41F : 87    " "    db  $87
        ;
E420 : BF 1F 0E    "   "    sts  X1F0E
        ;
E423 : 38    "8"    db  $38
        ;
E424 : F8 1F 7C    "  |"    eorb  X1F7C
E427 : C0 F8    "  "    subb  #$F8
E429 : F9 07 0C    "   "    adcb  X070C
E42C : F0 FD FE    "   "    subb  XFDFE
E42F : 01    " "    nop
E430 : 0E    " "    cli
E431 : F8 FF 83    "   "    eorb  XFF83
        ;
E434 : 00    " "    db  $00
        ;
E435 : 07    " "    tpa
E436 : FE E1 07    "   "    ldx  XE107
E439 : 78 F2 7F    "x  "    asl  XF27F
E43C : E0 01    "  "    subb  $01,x
E43E : FE C0 0F    "   "    ldx  XC00F
        ;
E441 : FC    " "    db  $FC
        ;
E442 : C1 07    "  "    cmpb  #$07
        ;
E444 : FC    " "    db  $FC
        ;
E445 : E0 FC    "  "    subb  $FC,x
E447 : C1 03    "  "    cmpb  #$03
E449 : 9E A7    "  "    lds  X00A7
        ;
E44B : 1F    " "    db  $1F
        ;
E44C : F0 E0 FC    "   "    subb  XE0FC
E44F : C1 03    "  "    cmpb  #$03
E451 : 07    " "    tpa
        ;
E452 : CF    " "    db  $CF
        ;
E453 : 0F    " "    sei
        ;
E454 : 3C    "<"    db  $3C
        ;
E455 : 70 F8 C3    "p  "    neg  XF8C3
E458 : 07    " "    tpa
E459 : 07    " "    tpa
E45A : 97 1E    "  "    staa  X001E
E45C : 34    "4"    des
E45D : D0 F0    "  "    subb  X00F0
        ;
E45F : 87 1F    "  "    db  $87, $1F
        ;
E461 : 9C 0E    "  "    cpx  X000E
        ;
E463 : 1F 38    " 8"    db  $1F, $38
        ;
E465 : C0 C2    "  "    subb  #$C2
        ;
E467 : 1F    " "    db  $1F
        ;
E468 : 5F    "_"    clrb
E469 : E0 55    " U"    subb  $55,x
E46B : 7F D0 01    "   "    clr  XD001
E46E : 0A    " "    clv
E46F : 7F F8 40    "  @"    clr  XF840
E472 : 79 F8 C3    "y  "    rol  XF8C3
E475 : 07    " "    tpa
E476 : B2 E0 87    "   "    sbca  XE087
E479 : 0F    " "    sei
E47A : 58    "X"    aslb
E47B : F1 1E 7E    "  ~"    cmpb  X1E7E
E47E : C0 07    "  "    subb  #$07
E480 : 7E 78 C0    "~x "    jmp  L78C0
        ;
E483 : D1 FA    "  "    cmpb  X00FA
E485 : F0 80 EF    "   "    subb  X80EF
E488 : E0 07    "  "    subb  $07,x
E48A : 0F    " "    sei
E48B : 0C    " "    clc
E48C : AE 1F    "  "    lds  $1F,x
        ;
E48E : 1F 18    "  "    db  $1F, $18
        ;
E490 : F8 7F F8    "   "    eorb  X7FF8
        ;
E493 : 00    " "    db  $00
        ;
E494 : C0 FE    "  "    subb  #$FE
E496 : FA 83 01    "   "    orab  X8301
E499 : F0 AA FF    "   "    subb  XAAFF
E49C : 3F    "?"    swi
E49D : 80 FF    "  "    suba  #$FF
        ;
E49F : 1F    " "    db  $1F
        ;
E4A0 : C0 FF    "  "    subb  #$FF
        ;
E4A2 : 03 FC    "  "    db  $03, $FC
        ;
E4A4 : FF 00 F0    "   "    stx  X00F0
E4A7 : 7F 00 FE    "   "    clr  X00FE
        ;
E4AA : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
E4AD : 07    " "    tpa
        ;
E4AE : 00    " "    db  $00
        ;
E4AF : FF 01 F0    "   "    stx  X01F0
E4B2 : 7F 00 FF    "   "    clr  X00FF
E4B5 : 0F    " "    sei
        ;
E4B6 : 00    " "    db  $00
        ;
E4B7 : FE 87 E0    "   "    ldx  X87E0
E4BA : FF C0 01    "   "    stx  XC001
E4BD : FF 10 E0    "   "    stx  X10E0
E4C0 : FF 00 FE    "   "    stx  X00FE
E4C3 : 0F    " "    sei
        ;
E4C4 : 00    " "    db  $00
        ;
E4C5 : FE 13 80    "   "    ldx  X1380
E4C8 : FF 01 F0    "   "    stx  X01F0
E4CB : 3F    "?"    swi
E4CC : 60 F0    "` "    neg  $F0,x
        ;
E4CE : 1F 00    "  "    db  $1F, $00
        ;
E4D0 : FE 07 F0    "   "    ldx  X07F0
E4D3 : FF 81 81    "   "    stx  X8181
E4D6 : 7F 18 F0    "   "    clr  X18F0
E4D9 : 47    "G"    asra
        ;
E4DA : 1F EC 1F 38  "   8"    db  $1F, $EC, $1F, $38
        ;
E4DE : F0 87 03    "   "    subb  X8703
        ;
E4E1 : FC    " "    db  $FC
        ;
E4E2 : 7F 80 FF    "   "    clr  X80FF
E4E5 : C0 81    "  "    subb  #$81
E4E7 : 3F    "?"    swi
        ;
E4E8 : 3C    "<"    db  $3C
        ;
E4E9 : E0 FF    "  "    subb  $FF,x
        ;
E4EB : 00    " "    db  $00
        ;
E4EC : FE 0F 18    "   "    ldx  X0F18
E4EF : F8 07 01    "   "    eorb  X0701
E4F2 : FE 61 D0    " a "    ldx  X61D0
E4F5 : FF C0 83    "   "    stx  XC083
E4F8 : 3F    "?"    swi
E4F9 : 78 F0 07    "x  "    asl  XF007
        ;
E4FC : 1F    " "    db  $1F
        ;
E4FD : FE 0F 38    "  8"    ldx  X0F38
E500 : F8 03 0F    "   "    eorb  X030F
E503 : 3E    ">"    wai
E504 : DB EA    "  "    addb  X00EA
E506 : FF 81 07    "   "    stx  X8107
E509 : FF F0 03    "   "    stx  XF003
E50C : 3F    "?"    swi
E50D : FE E0 1F    "   "    ldx  XE01F
E510 : F8 E0 8F    "   "    eorb  XE08F
        ;
E513 : 1F    " "    db  $1F
        ;
E514 : F0 F3 07    "   "    subb  XF307
        ;
E517 : FC 03    "  "    db  $FC, $03
        ;
E519 : 0F    " "    sei
        ;
E51A : FC 87    "  "    db  $FC, $87
        ;
E51C : 07    " "    tpa
        ;
E51D : FC    " "    db  $FC
        ;
E51E : F1 03 7F    "   "    cmpb  X037F
E521 : E0 83    "  "    subb  $83,x
E523 : 7F E0 80    "   "    clr  XE080
E526 : 3F    "?"    swi
E527 : 7C E0 0F    "|  "    inc  XE00F
E52A : 7C F0 0F    "|  "    inc  XF00F
        ;
E52D : 18    " "    db  $18
        ;
E52E : F0 0F 1E    "   "    subb  X0F1E
E531 : F8 81 1F    "   "    eorb  X811F
E534 : FE 01 0F    "   "    ldx  X010F
        ;
E537 : FC    " "    db  $FC
        ;
E538 : 01    " "    nop
E539 : 0F    " "    sei
E53A : 3F    "?"    swi
E53B : E0 87    "  "    subb  $87,x
E53D : 3F    "?"    swi
E53E : E0 83    "  "    subb  $83,x
E540 : 3F    "?"    swi
E541 : F0 E3 07    "   "    subb  XE307
        ;
E544 : FC    " "    db  $FC
        ;
E545 : E0 0F    "  "    subb  $0F,x
E547 : 7C E0 0F    "|  "    inc  XE00F
        ;
E54A : FC FC    "  "    db  $FC, $FC
        ;
E54C : C0 0F    "  "    subb  #$0F
E54E : FE 01 1F    "   "    ldx  X011F
        ;
E551 : FC    " "    db  $FC
        ;
E552 : 81 9F    "  "    cmpa  #$9F
        ;
E554 : 1F    " "    db  $1F
        ;
E555 : F8 C1 7F    "   "    eorb  XC17F
E558 : E0 03    "  "    subb  $03,x
E55A : 7F F0 E7    "   "    clr  XF0E7
E55D : 07    " "    tpa
E55E : 7C E0 1F    "|  "    inc  XE01F
E561 : F8 C0 1F    "   "    eorb  XC01F
        ;
E564 : FC    " "    db  $FC
        ;
E565 : F8 03 1F    "   "    eorb  X031F
E568 : F8 07 3E    "  >"    eorb  X073E
E56B : F0 83 3E    "  >"    subb  X833E
E56E : FE C0 07    "   "    ldx  XC007
E571 : FE 01 0F    "   "    ldx  X010F
E574 : F8 03 5F    "  _"    eorb  X035F
E577 : 3F    "?"    swi
E578 : E0 03    "  "    subb  $03,x
E57A : FF 01 0F    "   "    stx  X010F
        ;
E57D : FC 03    "  "    db  $FC, $03
        ;
E57F : FF 1F C0    "   "    stx  X1FC0
        ;
E582 : 03    " "    db  $03
        ;
E583 : FF 01 0F    "   "    stx  X010F
        ;
E586 : FC    " "    db  $FC
        ;
E587 : 01    " "    nop
E588 : FF 3F E0    " ? "    stx  X3FE0
E58B : 07    " "    tpa
E58C : FF 00 0F    "   "    stx  X000F
        ;
E58F : FC    " "    db  $FC
        ;
E590 : 80 BF    "  "    suba  #$BF
E592 : 3F    "?"    swi
E593 : E0 87    "  "    subb  $87,x
E595 : FF 00 1F    "   "    stx  X001F
E598 : BE 1F F8    "   "    lds  X1FF8
E59B : 3F    "?"    swi
E59C : C0 87    "  "    subb  #$87
E59E : FF 03 7C    "  |"    stx  X037C
E5A1 : C0 3F    " ?"    subb  #$3F
E5A3 : F8 3F 00    " ? "    eorb  X3F00
E5A6 : 3F    "?"    swi
E5A7 : F0 07 F8    "   "    subb  X07F8
E5AA : E0 1F    "  "    subb  $1F,x
E5AC : D0 FF    "  "    subb  X00FF
E5AE : 01    " "    nop
E5AF : 7E F0 0F    "~  "    jmp  LF00F
        ;
E5B2 : 80 3F    " ?"    suba  #$3F
E5B4 : F8 01 FC    "   "    eorb  X01FC
        ;
E5B7 : 03    " "    db  $03
        ;
E5B8 : F8 C2 7F    "   "    eorb  XC27F
        ;
E5BB : 00    " "    db  $00
        ;
E5BC : 3F    "?"    swi
E5BD : F8 07 FC    "   "    eorb  X07FC
E5C0 : 3F    "?"    swi
E5C1 : C0 1F    "  "    subb  #$1F
E5C3 : FE 01 F0    "   "    ldx  X01F0
E5C6 : 07    " "    tpa
E5C7 : 7E 80 7F    "~  "    jmp  L807F
        ;
E5CA : 00    " "    db  $00
        ;
E5CB : FF E1 3F    "  ?"    stx  XE13F
E5CE : C0 3F    " ?"    subb  #$3F
E5D0 : F0 03 FE    "   "    subb  X03FE
E5D3 : 0F    " "    sei
E5D4 : E0 0F    "  "    subb  $0F,x
E5D6 : FF 03 F0    "   "    stx  X03F0
E5D9 : 0F    " "    sei
        ;
E5DA : FC    " "    db  $FC
        ;
E5DB : 80 FF    "  "    suba  #$FF
        ;
E5DD : 00    " "    db  $00
        ;
E5DE : FE 03 3F    "  ?"    ldx  X033F
E5E1 : 80 7F    "  "    suba  #$7F
E5E3 : 80 2E    " ."    suba  #$2E
E5E5 : F8 0F E0    "   "    eorb  X0FE0
E5E8 : 3F    "?"    swi
E5E9 : F4 01 F0    "   "    andb  X01F0
E5EC : 3F    "?"    swi
E5ED : C0 8F    "  "    subb  #$8F
E5EF : 7F 00 F0    "   "    clr  X00F0
E5F2 : 0F    " "    sei
        ;
E5F3 : FC 00    "  "    db  $FC, $00
        ;
E5F5 : FE 01 69    "  i"    ldx  X0169
E5F8 : FF 0F C0    "   "    stx  X0FC0
E5FB : 3F    "?"    swi
E5FC : F8 03 D8    "   "    eorb  X03D8
E5FF : FF 00 F5    "   "    stx  X00F5
E602 : FF 00 F0    "   "    stx  X00F0
E605 : D7 A1    "  "    stab  X00A1
        ;
E607 : 00    " "    db  $00
        ;
E608 : F8 1F 00    "   "    eorb  X1F00
E60B : FF 0F 00    "   "    stx  X0F00
E60E : FE 83 1F    "   "    ldx  X831F
        ;
E611 : 00    " "    db  $00
        ;
E612 : FF 03 F8    "   "    stx  X03F8
E615 : FF 03 C0    "   "    stx  X03C0
E618 : 7F AA 05    "   "    clr  XAA05
        ;
E61B : 52    "R"    db  $52
        ;
E61C : FF B7 C0    "   "    stx  XB7C0
E61F : FF 00 F8    "   "    stx  X00F8
E622 : 5F    "_"    clrb
E623 : 80 3F    " ?"    suba  #$3F
        ;
E625 : 00    " "    db  $00
        ;
E626 : FE 0F F8    "   "    ldx  X0FF8
        ;
E629 : 1F 00    "  "    db  $1F, $00
        ;
E62B : F8 3F C0    " ? "    eorb  X3FC0
        ;
E62E : 1F    " "    db  $1F
        ;
E62F : 80 FF    "  "    suba  #$FF
E631 : 92 AA    "  "    sbca  X00AA
E633 : 7F 00 F8    "   "    clr  X00F8
        ;
E636 : 1F    " "    db  $1F
        ;
E637 : AA A2    "  "    oraa  $A2,x
E639 : 3E    ">"    wai
E63A : F8 3F F8    " ? "    eorb  X3FF8
        ;
E63D : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
E640 : 7F 00 FC    "   "    clr  X00FC
E643 : 07    " "    tpa
E644 : F8 C7 FF    "   "    eorb  XC7FF
E647 : 01    " "    nop
        ;
E648 : 00    " "    db  $00
        ;
E649 : FA 3F 80    " ? "    orab  X3F80
E64C : 7F 00 5E    "  ^"    clr  X005E
E64F : FF 3F 00    " ? "    stx  X3F00
        ;
E652 : 00    " "    db  $00
        ;
E653 : FA 0F FC    "   "    orab  X0FFC
E656 : 0F    " "    sei
E657 : 80 50    " P"    suba  #$50
E659 : FF 1F 10    "   "    stx  X1F10
        ;
E65C : 00    " "    db  $00
        ;
E65D : FE D0 FF    "   "    ldx  XD0FF
        ;
E660 : 00    " "    db  $00
        ;
E661 : 46    "F"    rora
E662 : E0 FF    "  "    subb  $FF,x
        ;
E664 : 13    " "    db  $13
        ;
E665 : 07    " "    tpa
        ;
E666        LE666:
E666 : 00    " "    db  $00
        ;
E667 : 2D FD    "- "    blt  LE666
        ;
E669 : 1F    " "    db  $1F
        ;
E66A : A8 02    "  "    eora  $02,x
E66C : F0 FF 5D    "  ]"    subb  XFF5D
E66F : 01    " "    nop
        ;
E670 : 00    " "    db  $00
        ;
E671 : EA 7F    "  "    orab  $7F,x
E673 : A1 5B    " ["    cmpa  $5B,x
        ;
E675 : 00    " "    db  $00
        ;
E676 : BC FF 2F    "  /"    cpx  XFF2F
        ;
E679 : 00 00 FD    "   "    db  $00, $00, $FD
        ;
E67C : 0F    " "    sei
E67D : EA 13    "  "    orab  $13,x
E67F : 20 6D    " m"    bra  LE6EE
        ;
E681 : FF 2F 00    " / "    stx  X2F00
E684 : 80 FF    "  "    suba  #$FF
E686 : 81 7E    " ~"    cmpa  #$7E
E688 : 09    " "    dex
E689 : 90 D6    "  "    suba  X00D6
E68B : FF 27 00    " ' "    stx  X2700
E68E : E0 BF    "  "    subb  $BF,x
E690 : A0 5F    " _"    suba  $5F,x
        ;
E692 : 02    " "    db  $02
        ;
E693 : D0 F6    "  "    subb  X00F6
E695 : FF 05 00    "   "    stx  X0500
E698 : F8 1F A8    "   "    eorb  X1FA8
E69B : 2F 01    "/ "    ble  LE69E
E69D : F8 7F B7    "   "    eorb  X7FB7
        ;
E6A0        LE6A0:
E6A0 : 00 00    "  "    db  $00, $00
        ;
E6A2 : FE 1F 48    "  H"    ldx  X1F48
E6A5 : 17    " "    tba
E6A6 : 80 FE    "  "    suba  #$FE
E6A8 : 7F 15 00    "   "    clr  X1500
E6AB : C0 FF    "  "    subb  #$FF
E6AD : 0F    " "    sei
E6AE : 80 2D    " -"    suba  #$2D
E6B0 : D4 FF    "  "    andb  X00FF
E6B2 : D7 00    "  "    stab  X0000
        ;
E6B4 : 00    " "    db  $00
        ;
E6B5 : FE BF 00    "   "    ldx  XBF00
E6B8 : A8 5A    " Z"    eora  $5A,x
E6BA : FF E2 7F    "   "    stx  XE27F
        ;
E6BD : 00    " "    db  $00
        ;
E6BE : E0 FF    "  "    subb  $FF,x
E6C0 : 01    " "    nop
E6C1 : BC 80 FE    "   "    cpx  X80FE
E6C4 : 07    " "    tpa
E6C5 : F8 1F 00    "   "    eorb  X1F00
E6C8        XE6C8:
E6C8 : FF 03 FE    "   "    stx  X03FE
        ;
E6CB : 03 FC    "  "    db  $03, $FC
        ;
E6CD : 0F    " "    sei
E6CE : F0 3F 00    " ? "    subb  X3F00
E6D1 : FF 01 FE    "   "    stx  X01FE
E6D4 : 01    " "    nop
E6D5 : FE 07 F0    "   "    ldx  X07F0
E6D8 : 3F    "?"    swi
        ;
E6D9 : 00 FC    "  "    db  $00, $FC
        ;
E6DB : AA 86    "  "    oraa  $86,x
        ;
E6DD : C3 CF CC    "   "    db  $C3, $CF, $CC
        ;
E6E0 : E1 D4    "  "    cmpb  $D4,x
        ;
E6E2 : 87    " "    db  $87
        ;
E6E3 : BA 34 35    " 45"    oraa  X3435
E6E6 : 54    "T"    lsrb
E6E7 : 0E    " "    cli
E6E8 : D6 13    "  "    ldab  X0013
E6EA : 97 23    " #"    staa  X0023
        ;
E6EC : 65 4E    "eN"    db  $65, $4E
        ;
E6EE        LE6EE:
E6EE : 6E 2D    "n-"    jmp  $2D,x            ;INFO: index jump
        ;
E6F0 : 53    "S"    comb
E6F1 : A9 FD    "  "    adca  $FD,x
E6F3 : C9 D4    "  "    adcb  #$D4
E6F5 : 2B F6    "+ "    bmi  LE6ED
E6F7 : 90 79    " y"    suba  X0079
E6F9 : 54    "T"    lsrb
E6FA : 2D A4    "- "    blt  LE6A0
E6FC : 2A 31    "*1"    bpl  LE72F
E6FE : 33    "3"    pulb
        ;
E6FF : CC    " "    db  $CC
        ;
E700 : 58    "X"    aslb
E701 : CB 43    " C"    addb  #$43
E703 : D6 17    "  "    ldab  X0017
        ;
E705 : FD CC    "  "    db  $FD, $CC
        ;
E707 : 69 6D    "im"    rol  $6D,x
E709 : 66 00    "f "    ror  $00,x
        ;
E70B : 00    " "    db  $00
        ;
E70C : 09    " "    dex
E70D : FF EF 6F    "  o"    stx  XEF6F
E710 : 4F    "O"    clra
E711 : AF A5    "  "    sts  $A5,x
        ;
E713        LE713:
E713 : 1E 00 00 00  "    "    db  $1E, $00, $00, $00
        ;
E717 : F8 FF FF    "   "    eorb  XFFFF
        ;
E71A : 7B CF    "{ "    db  $7B, $CF
        ;
E71C : 97 03    "  "    staa  X0003
        ;
E71E : 00 00    "  "    db  $00, $00
        ;
E720 : AE FF    "  "    lds  $FF,x
E722 : FF 7E FC    " ~ "    stx  X7EFC
        ;
E725 : FD    " "    db  $FD
        ;
E726 : FF 40 80    " @ "    stx  X4080
E729 : C1 FF    "  "    cmpb  #$FF
E72B : 3F    "?"    swi
E72C : 0E    " "    cli
E72D : 08    " "    inx
E72E : FE FF 1F    "   "    ldx  XFF1F
E731 : 20 E0    "  "    bra  LE713
        ;
E733 : F7 FF 07    "   "    stab  XFF07
        ;
E736 : 00    " "    db  $00
        ;
E737 : 7E FF FF    "~  "    jmp  LFFFF
        ;
E73A : 02 02    "  "    db  $02, $02
        ;
E73C : FF FF 78    "  x"    stx  XFF78
        ;
E73F : 00    " "    db  $00
        ;
E740 : D0 FF    "  "    subb  X00FF
E742 : DF 5F    " _"    stx  X005F
        ;
E744 : 00    " "    db  $00
        ;
E745 : 80 7F    "  "    suba  #$7F
E747 : 3F    "?"    swi
E748 : 20 C0    "  "    bra  LE70A
        ;
E74A : E7 DF    "  "    stab  $DF,x
E74C : FF 01 00    "   "    stx  X0100
E74F : 7E FE 40    "~ @"    jmp  LFE40
        ;
E752 : 80 F5    "  "    suba  #$F5
E754 : EF DF    "  "    stx  $DF,x
E756 : 0F    " "    sei
        ;
E757 : 18    " "    db  $18
        ;
E758 : F0 FB 03    "   "    subb  XFB03
        ;
E75B : 03    " "    db  $03
        ;
E75C : BE 3F FF    " ? "    lds  X3FFF
        ;
E75F : 1F    " "    db  $1F
        ;
E760 : 70 F0 F7    "p  "    neg  XF0F7
        ;
E763 : 03 02    "  "    db  $03, $02
        ;
E765 : BF 3F FF    " ? "    sts  X3FFF
        ;
E768 : 1F 38    " 8"    db  $1F, $38
        ;
E76A : F0 FB 03    "   "    subb  XFB03
        ;
E76D : 83    " "    db  $83
        ;
E76E : DF 1F    "  "    stx  X001F
E770 : FF 0F 1C    "   "    stx  X0F1C
        ;
E773 : FC FC    "  "    db  $FC, $FC
        ;
E775 : C0 C1    "  "    subb  #$C1
E777 : FF 87 FF    "   "    stx  X87FF
        ;
E77A : 03    " "    db  $03
        ;
E77B : 07    " "    tpa
E77C : 3F    "?"    swi
E77D : 3F    "?"    swi
E77E : 60 F0    "` "    neg  $F0,x
E780 : FF E1 7F    "   "    stx  XE17F
E783 : C0 C1    "  "    subb  #$C1
        ;
E785 : CF    " "    db  $CF
        ;
E786 : 07    " "    tpa
        ;
E787 : 18    " "    db  $18
        ;
E788 : FE 3E FC    " > "    ldx  X3EFC
        ;
E78B : 1F 38    " 8"    db  $1F, $38
        ;
E78D : F8 F9 01    "   "    eorb  XF901
E790 : 80 1F    "  "    suba  #$1F
E792 : 0E    " "    cli
E793 : FF 07 0E    "   "    stx  X070E
E796 : FE 3E 80    " > "    ldx  X3E80
E799 : E1 03    "  "    cmpb  $03,x
E79B : EA FF    "  "    orab  $FF,x
E79D : 01    " "    nop
        ;
E79E : 87    " "    db  $87
        ;
E79F : FF 0A F0    "   "    stx  X0AF0
E7A2 : F9 00 FA    "   "    adcb  X00FA
E7A5 : 7F 80 C3    "   "    clr  X80C3
E7A8 : 0F    " "    sei
        ;
E7A9 : 03    " "    db  $03
        ;
E7AA : F8 7F 00    "   "    eorb  X7F00
E7AD : FE 7F C0    "   "    ldx  X7FC0
E7B0 : E1 0F    "  "    cmpb  $0F,x
        ;
E7B2 : 00    " "    db  $00
        ;
E7B3 : FE 3F 00    " ? "    ldx  X3F00
E7B6 : FE FF 80    "   "    ldx  XFF80
        ;
E7B9 : C7    " "    db  $C7
        ;
E7BA : 0F    " "    sei
        ;
E7BB : 00 FC    "  "    db  $00, $FC
        ;
E7BD : 7F C0 FF    "   "    clr  XC0FF
E7C0 : FF 01 8F    "   "    stx  X018F
        ;
E7C3 : 1F    " "    db  $1F
        ;
E7C4 : 20 F8    "  "    bra  LE7BE
        ;
E7C6 : 7F C0 7F    "   "    clr  XC07F
E7C9 : F5 07 7C    "  |"    bitb  X077C
        ;
E7CC : FC    " "    db  $FC
        ;
E7CD : 80 C1    "  "    suba  #$C1
E7CF        XE7CF:
E7CF : 7F 05 FD    "   "    clr  X05FD
        ;
E7D2 : E3    " "    db  $E3
        ;
E7D3 : 7F 80 C7    "   "    clr  X80C7
E7D6 : 07    " "    tpa
E7D7 : 08    " "    inx
E7D8 : FE 78 E0    " x "    ldx  X78E0
        ;
E7DB : E3    " "    db  $E3
        ;
E7DC : FB 07 F8    "   "    addb  X07F8
E7DF : F8 00 FF    "   "    eorb  X00FF
        ;
E7E2 : 1F 00    "  "    db  $1F, $00
        ;
E7E4 : FF 0F 7F    "   "    stx  X0F7F
E7E7 : 06    " "    tap
E7E8 : 7C 3E 2C    "|>,"    inc  X3E2C
E7EB : FF 21 E8    " ! "    stx  X21E8
E7EE : FF 81 FF    "   "    stx  X81FF
E7F1 : 07    " "    tpa
E7F2 : 7C 3F C0    "|? "    inc  X3FC0
E7F5 : F0 EF 40    "  @"    subb  XEF40
E7F8 : BF 46 FF    " F "    sts  X46FF
        ;
E7FB : 1F    " "    db  $1F
        ;
E7FC : F8 78 80    " x "    eorb  X7880
        ;
E7FF : C7    " "    db  $C7
        ;
E800 : 0F    " "    sei
E801 : 09    " "    dex
E802 : 7E 14 FE    "~  "    jmp  L14FE
        ;
E805 : 7F E0 E3    "   "    clr  XE0E3
E808 : 07    " "    tpa
E809 : 06    " "    tap
E80A : 7E 1E E0    "~  "    jmp  L1EE0
        ;
E80D : 3F    "?"    swi
E80E : 07    " "    tpa
E80F : FF 07 1C    "   "    stx  X071C
E812 : 3E    ">"    wai
E813 : E0 E0    "  "    subb  $E0,x
        ;
E815 : F3 03 87    "   "    db  $F3, $03, $87
        ;
E818 : 0F    " "    sei
E819 : FF 7F 80    "   "    stx  X7F80
        ;
E81C : C7    " "    db  $C7
        ;
E81D : 0F    " "    sei
E81E : F8 FC C1    "   "    eorb  XFCC1
E821 : F0 FF 20    "   "    subb  XFF20
        ;
E824 : FD    " "    db  $FD
        ;
E825 : 7F C0 F3    "   "    clr  XC0F3
        ;
E828 : 03 00    "  "    db  $03, $00
        ;
E82A : 7E 0F 20    "~  "    jmp  L0F20
        ;
E82D : FC    " "    db  $FC
        ;
E82E : 20 F0    "  "    bra  LE820
        ;
E830 : FF C0 E3    "   "    stx  XC0E3
E833 : 0F    " "    sei
E834 : 0E    " "    cli
E835 : FE 5E 70    " ^p"    ldx  X5E70
        ;
E838 : FC    " "    db  $FC
        ;
E839 : F0 E7 CF    "   "    subb  XE7CF
E83C : 80 E7    "  "    suba  #$E7
E83E : 07    " "    tpa
        ;
E83F : 1C    " "    db  $1C
        ;
E840 : FE 74 E0    " t "    ldx  X74E0
E843 : 3F    "?"    swi
E844 : 2C FC    ", "    bge  LE842
E846 : FF 03 9E    "   "    stx  X039E
E849 : 3F    "?"    swi
E84A : 30    "0"    tsx
E84B : F8 FF 81    "   "    eorb  XFF81
        ;
E84E : C7    " "    db  $C7
        ;
E84F : 0F    " "    sei
E850 : 0F    " "    sei
E851 : FF 1F F0    "   "    stx  X1FF0
E854 : F8 81 EB    "   "    eorb  X81EB
        ;
E857 : 1F 3C    " <"    db  $1F, $3C
        ;
E859 : 3E    ">"    wai
E85A : 6C DC    "l "    inc  $DC,x
        ;
E85C : FC    " "    db  $FC
        ;
E85D : DF 01    "  "    stx  X0001
        ;
E85F : 87 1F 18 FC  "    "    db  $87, $1F, $18, $FC
E863 : F3    " "    db  $F3
        ;
E864 : C0 C3    "  "    subb  #$C3
E866 : 0F    " "    sei
E867 : 0E    " "    cli
E868 : FF 1D 70    "  p"    stx  X1D70
E86B : F8 81 81    "   "    eorb  X8181
E86E : 5F    "_"    clrb
        ;
E86F : 1D 18    "  "    db  $1D, $18
        ;
E871 : F2 83 E0    "   "    sbcb  X83E0
E874 : FF 1E 78    "  x"    stx  X1E78
        ;
E877 : FC    " "    db  $FC
        ;
E878 : C1 C1    "  "    cmpb  #$C1
E87A : 3F    "?"    swi
E87B : 0F    " "    sei
        ;
E87C : 3C    "<"    db  $3C
        ;
E87D : 79 F8 E1    "y  "    rol  XF8E1
E880 : F7 0F 38    "  8"    stab  X0F38
        ;
E883 : FC    " "    db  $FC
        ;
E884 : C0 81    "  "    subb  #$81
E886 : 9F 07    "  "    sts  X0007
E888 : D4 1F    "  "    andb  X001F
        ;
E88A : 1C FC    "  "    db  $1C, $FC
        ;
E88C : FB 01 E0    "   "    addb  X01E0
E88F : F8 03 03    "   "    eorb  X0303
E892 : 3F    "?"    swi
        ;
E893 : FC    " "    db  $FC
        ;
E894 : 81 83    "  "    cmpa  #$83
E896 : 0F    " "    sei
        ;
E897 : 1D    " "    db  $1D
        ;
E898 : FE 6F 00    " o "    ldx  X6F00
        ;
E89B : C3 1F    "  "    db  $C3, $1F
        ;
E89D : 10    " "    sba
E89E : F8 E3 03    "   "    eorb  XE303
        ;
E8A1 : 1F 1E    "  "    db  $1F, $1E
        ;
E8A3 : D8 F4    "  "    eorb  X00F4
        ;
E8A5 : FC 1C    "  "    db  $FC, $1C
        ;
E8A7 : 60 E0    "` "    neg  $E0,x
        ;
E8A9 : C3 03    "  "    db  $C3, $03
        ;
E8AB : 78 3F 06    "x? "    asl  X3F06
        ;
E8AE : 05    " "    db  $05
        ;
E8AF : 77 38 F8    "w8 "    asr  X38F8
E8B2 : 7D 01 F8    "}  "    tst  X01F8
E8B5 : C0 03    "  "    subb  #$03
E8B7 : 0F    " "    sei
        ;
E8B8 : 3C    "<"    db  $3C
        ;
E8B9 : E8 E3    "  "    eorb  $E3,x
        ;
E8BB : 41 38    "A8"    db  $41, $38
        ;
E8BD : 74 81 D7    "t  "    lsr  X81D7
        ;
E8C0 : 1F    " "    db  $1F
        ;
E8C1 : 44    "D"    lsra
E8C2 : 2C 00    ", "    bge  LE8C4
E8C4        LE8C4:
E8C4 : D0 F4    "  "    subb  X00F4
E8C6 : 91 A7    "  "    cmpa  X00A7
        ;
E8C8 : 8F    " "    db  $8F
        ;
E8C9 : 0A    " "    clv
E8CA : 90 7E    " ~"    suba  X007E
E8CC : 70 FC C3    "p  "    neg  XFCC3
        ;
E8CF : 03 00    "  "    db  $03, $00
        ;
E8D1 : 09    " "    dex
E8D2 : 96 3E    " >"    ldaa  X003E
E8D4 : F9 E0 D2    "   "    adcb  XE0D2
E8D7        LE8D7:
E8D7 : 07    " "    tpa
E8D8 : 01    " "    nop
        ;
E8D9 : 1F    " "    db  $1F
        ;
E8DA : 3E    ">"    wai
        ;
E8DB : FC    " "    db  $FC
        ;
E8DC : E2 01    "  "    sbcb  $01,x
        ;
E8DE : 04    " "    db  $04
        ;
E8DF : 08    " "    inx
        ;
E8E0 : 13    " "    db  $13
        ;
E8E1 : 5D    "]"    tstb
E8E2 : FE F0 D0    "   "    ldx  XF0D0
        ;
E8E5 : C3    " "    db  $C3
        ;
E8E6 : 01    " "    nop
        ;
E8E7 : 52 5E    "R^"    db  $52, $5E
        ;
E8E9 : F6 75 31    " u1"    ldab  X7531
        ;
E8EC : 00 00    "  "    db  $00, $00
        ;
E8EE : 3E    ">"    wai
        ;
E8EF : 38 FC    "8 "    db  $38, $FC
        ;
E8F1 : F1 41 87    " A "    cmpb  X4187
E8F4 : 0B    " "    sev
E8F5 : 2A 54    "*T"    bpl  LE94B
E8F7 : A9 D4    "  "    adca  $D4,x
E8F9 : F6 3F 08    " ? "    ldab  X3F08
E8FC : 60 40    "`@"    neg  $40,x
        ;
E8FE : 41    "A"    db  $41
        ;
E8FF : 4F    "O"    clra
E900 : AF AD    "  "    sts  $AD,x
E902 : 2C 54    ",T"    bge  LE958
E904 : 80 60    " `"    suba  #$60
E906 : 7D 70 E8    "}p "    tst  X70E8
E909 : EF 07    "  "    stx  $07,x
E90B : 0C    " "    clc
E90C : 10    " "    sba
E90D : 80 D2    "  "    suba  #$D2
E90F : AE 56    " V"    lds  $56,x
E911 : A7 F5    "  "    staa  $F5,x
        ;
E913 : 83    " "    db  $83
        ;
E914 : 01    " "    nop
        ;
E915 : 1E 1E    "  "    db  $1E, $1E
        ;
E917 : E0 E8    "  "    subb  $E8,x
        ;
E919 : 55    "U"    db  $55
        ;
E91A : B7 6E 20    " n "    staa  X6E20
        ;
E91D : 00 00    "  "    db  $00, $00
        ;
E91F : 7E 78 D2    "~x "    jmp  L78D2
        ;
E922 : D7 0B    "  "    stab  X000B
        ;
E924 : 1A    " "    db  $1A
        ;
E925 : AA C4    "  "    oraa  $C4,x
        ;
E927 : 45 15    "E "    db  $45, $15
        ;
E929 : 5A    "Z"    decb
E92A : A2 52    " R"    sbca  $52,x
E92C : 3F    "?"    swi
E92D : 7E 41 01    "~A "    jmp  L4101
        ;
E930 : 04    " "    db  $04
        ;
E931 : 48    "H"    asla
E932 : D2 AB    "  "    sbcb  X00AB
E934 : 77 6D 54    "wmT"    asr  X6D54
E937 : 11    " "    cba
E938 : 11    " "    cba
E939 : 6C D8    "l "    inc  $D8,x
E93B : AA 17    "  "    oraa  $17,x
        ;
E93D : 51 51    "QQ"    db  $51, $51
        ;
E93F : 25 96    "% "    bcs  LE8D7
E941 : AA 5B    " ["    oraa  $5B,x
E943 : B7 0A 42    "  B"    staa  X0A42
E946 : 44    "D"    lsra
        ;
E947 : 52    "R"    db  $52
        ;
E948 : B5 BD AA    "   "    bita  XBDAA
E94B        LE94B:
E94B : AA 4A    " J"    oraa  $4A,x
E94D : AA FF    "  "    oraa  $FF,x
E94F : B6 8A 20    "   "    ldaa  X8A20
E952 : 08    " "    inx
E953 : C9 B6    "  "    adcb  #$B6
E955 : 76 6D 55    "vmU"    ror  X6D55
E958        LE958:
E958 : 91 FA    "  "    cmpa  X00FA
E95A : DF 15    "  "    stx  X0015
E95C : 49    "I"    rola
        ;
E95D : 00    " "    db  $00
        ;
E95E : 90 5B    " ["    suba  X005B
E960 : BB ED 12    "   "    adda  XED12
        ;
E963 : 55    "U"    db  $55
        ;
E964 : F5 FF 05    "   "    bitb  XFF05
        ;
E967 : 3A 00    ": "    db  $3A, $00
        ;
E969 : E0 97    "  "    subb  $97,x
E96B : FE 4B B0    " K "    ldx  X4BB0
E96E : 0B    " "    sev
        ;
E96F : FD    " "    db  $FD
        ;
E970 : 3F    "?"    swi
E971 : E0 07    "  "    subb  $07,x
E973 : 80 17    "  "    suba  #$17
E975 : F8 1F FC    "   "    eorb  X1FFC
E978 : 01    " "    nop
E979 : FE 1F F8    "   "    ldx  X1FF8
E97C : 01    " "    nop
E97D : 70 C0 FF    "p  "    neg  XC0FF
E980 : C1 0F    "  "    cmpb  #$0F
E982 : F8 FF 3F    "  ?"    eorb  XFF3F
E985 : 70 00 F0    "p  "    neg  X00F0
E988 : F4 3F 3E    " ?>"    andb  X3F3E
        ;
E98B : 00    " "    db  $00
        ;
E98C : FF FF 81    "   "    stx  XFF81
        ;
E98F : 03    " "    db  $03
        ;
E990 : 80 C3    "  "    suba  #$C3
E992 : FF 3E 00    " > "    stx  X3E00
        ;
E995 : 3C    "<"    db  $3C
        ;
E996 : FF 1F 0E    "   "    stx  X1F0E
        ;
E999 : 00    " "    db  $00
        ;
E99A : F4 FF 7E    "  ~"    andb  XFF7E
        ;
E99D : 00    " "    db  $00
        ;
E99E : 80 FF    "  "    suba  #$FF
E9A0 : 3F    "?"    swi
E9A1 : 10    " "    sba
        ;
E9A2 : 00    " "    db  $00
        ;
E9A3 : 7C FF 7F    "|  "    inc  XFF7F
        ;
E9A6 : 00 00    "  "    db  $00, $00
        ;
E9A8 : FF 3F 10    " ? "    stx  X3F10
        ;
E9AB : 00 DC    "  "    db  $00, $DC
        ;
E9AD : FF 3F 00    " ? "    stx  X3F00
E9B0 : 80 FF    "  "    suba  #$FF
E9B2 : 3F    "?"    swi
        ;
E9B3 : 00 00    "  "    db  $00, $00
        ;
E9B5 : E8 FF    "  "    eorb  $FF,x
E9B7 : 3F    "?"    swi
        ;
E9B8 : 00    " "    db  $00
        ;
E9B9 : C0 FF    "  "    subb  #$FF
        ;
E9BB : 1F 02 00    "   "    db  $1F, $02, $00
        ;
E9BE : F8 FF 0F    "   "    eorb  XFF0F
        ;
E9C1 : 00    " "    db  $00
        ;
E9C2 : F0 FF C7    "   "    subb  XFFC7
E9C5 : 01    " "    nop
        ;
E9C6 : 00    " "    db  $00
        ;
E9C7 : FE FF 0B    "   "    ldx  XFF0B
        ;
E9CA : 00    " "    db  $00
        ;
E9CB : FE FF 0F    "   "    ldx  XFF0F
        ;
E9CE : 00    " "    db  $00
        ;
E9CF : 80 FE    "  "    suba  #$FE
E9D1 : FF 00 F0    "   "    stx  X00F0
E9D4 : FF 7D 20    " } "    stx  X7D20
        ;
E9D7 : 00    " "    db  $00
        ;
E9D8 : F8 FF 49    "  I"    eorb  XFF49
E9DB : C0 FF    "  "    subb  #$FF
E9DD : E7 01    "  "    stab  $01,x
E9DF : 01    " "    nop
E9E0 : E0 FF    "  "    subb  $FF,x
E9E2 : 0F    " "    sei
        ;
E9E3 : 03    " "    db  $03
        ;
E9E4 : EE 3F    " ?"    ldx  $3F,x
        ;
E9E6 : 1F 00 00    "   "    db  $1F, $00, $00
        ;
E9E9 : 7E FF 3E    "~ >"    jmp  LFF3E
        ;
E9EC : E0 7F    "  "    subb  $7F,x
E9EE : 70 14 00    "p  "    neg  X1400
E9F1 : 74 F8 7F    "t  "    lsr  XF87F
E9F4 : E0 FF    "  "    subb  $FF,x
E9F6 : E4 01    "  "    andb  $01,x
E9F8 : C0 80    "  "    subb  #$80
E9FA : EF C3    "  "    stx  $C3,x
        ;
E9FC : 83    " "    db  $83
        ;
E9FD : FF CF 07    "   "    stx  XCF07
        ;
EA00 : 02 00 1F    "   "    db  $02, $00, $1F
        ;
EA03 : BF 0F DC    "   "    sts  X0FDC
EA06 : 7F 0E 0F    "   "    clr  X0E0F
        ;
EA09 : 00    " "    db  $00
        ;
EA0A : 0A    " "    clv
EA0B : 7E 7E 1C    "~~ "    jmp  L7E1C
        ;
EA0E : 3F    "?"    swi
EA0F : 78 18 78    "x x"    asl  X1878
EA12 : 70 F0 78    "p x"    neg  XF078
EA15 : F8 FF 41    "  A"    eorb  XFF41
EA18 : 40    "@"    nega
EA19 : 60 FC    "` "    neg  $FC,x
        ;
EA1B : E3 83    "  "    db  $E3, $83
        ;
EA1D : E0 FD    "  "    subb  $FD,x
EA1F : DF 03    "  "    stx  X0003
        ;
EA21 : 00    " "    db  $00
        ;
EA22 : 82 FF    "  "    sbca  #$FF
        ;
EA24 : 8F    " "    db  $8F
        ;
EA25 : 07    " "    tpa
EA26 : 8E FF 0F    "   "    lds  #$FF0F
        ;
EA29 : 02 00 1E    "   "    db  $02, $00, $1E
        ;
EA2C : FF 1F 04    "   "    stx  X1F04
EA2F : 3F    "?"    swi
EA30 : 7F 1C 00    "   "    clr  X1C00
EA33 : 30    "0"    tsx
EA34 : FE 7F 78    "  x"    ldx  X7F78
EA37 : F8 F0 F1    "   "    eorb  XF0F1
EA3A : 40    "@"    nega
EA3B : 80 F0    "  "    suba  #$F0
EA3D : E7 E7    "  "    stab  $E7,x
        ;
EA3F : E3 83    "  "    db  $E3, $83
        ;
EA41 : 07    " "    tpa
EA42 : 07    " "    tpa
EA43 : 06    " "    tap
EA44 : 06    " "    tap
EA45 : 3F    "?"    swi
EA46 : 3F    "?"    swi
EA47 : BE 3F 3C    " ?<"    lds  X3F3C
EA4A : 10    " "    sba
EA4B : 30    "0"    tsx
EA4C : E0 FC    "  "    subb  $FC,x
EA4E : F9 F0 FF    "   "    adcb  XF0FF
EA51 : E1 01    "  "    cmpb  $01,x
        ;
EA53 : 00 41    " A"    db  $00, $41
        ;
EA55 : FF 57 A5    " W "    stx  X57A5
        ;
EA58 : FD    " "    db  $FD
        ;
EA59 : 0F    " "    sei
EA5A : 0D    " "    sec
EA5B : 20 10    "  "    bra  LEA6D
        ;
EA5D : E1 1F    "  "    cmpb  $1F,x
EA5F : AF 7B    " {"    sts  $7B,x
EA61 : 3F    "?"    swi
        ;
EA62 : 83    " "    db  $83
        ;
EA63 : 1B    " "    aba
        ;
EA64 : 18 00    "  "    db  $18, $00
        ;
EA66 : 35    "5"    txs
EA67 : BE BE BB    "   "    lds  XBEBB
EA6A : 7F F0 02    "   "    clr  XF002
        ;
EA6D        LEA6D:
EA6D : 00    " "    db  $00
        ;
EA6E : E0 EA    "  "    subb  $EA,x
EA70 : FE F4 FA    "   "    ldx  XF4FA
        ;
EA73 : 87    " "    db  $87
        ;
EA74 : 56    "V"    rorb
        ;
EA75 : 00 00    "  "    db  $00, $00
        ;
EA77 : D6 F7    "  "    ldab  X00F7
EA79 : 57    "W"    asrb
EA7A : E5 7F    "  "    bitb  $7F,x
        ;
EA7C : 61    "a"    db  $61
        ;
EA7D : 07    " "    tpa
        ;
EA7E : 00    " "    db  $00
        ;
EA7F : C0 BF    "  "    subb  #$BF
EA81 : 5F    "_"    clrb
        ;
EA82 : 03    " "    db  $03
        ;
EA83 : FF 1F 66    "  f"    stx  X1F66
        ;
EA86 : 00    " "    db  $00
        ;
EA87 : 30    "0"    tsx
EA88 : F8 3F 5E    " ?^"    eorb  X3F5E
EA8B        XEA8B:
EA8B : 50    "P"    negb
EA8C : FF C3 1C    "   "    stx  XC31C
        ;
EA8F : 00    " "    db  $00
        ;
EA90 : 44    "D"    lsra
EA91 : FE 57 35    " W5"    ldx  X5735
EA94 : E0 FF    "  "    subb  $FF,x
EA96 : B0 01 C0    "   "    suba  X01C0
EA99 : C1 FF    "  "    cmpb  #$FF
EA9B : C1 03    "  "    cmpb  #$03
EA9D : F2 3F F0    " ? "    sbcb  X3FF0
EAA0 : 01    " "    nop
EAA1 : F0 C0 FF    "   "    subb  XC0FF
EAA4 : 80 0F    "  "    suba  #$0F
        ;
EAA6 : FC 1F    "  "    db  $FC, $1F
        ;
EAA8 : 7C 00 78    "| x"    inc  X0078
EAAB : E8 7F    "  "    eorb  $7F,x
EAAD : 40    "@"    nega
EAAE : 17    " "    tba
        ;
EAAF : FC 1F    "  "    db  $FC, $1F
        ;
EAB1 : F8 00 F8    "   "    eorb  X00F8
EAB4 : C1 FF    "  "    cmpb  #$FF
        ;
EAB6 : 00    " "    db  $00
        ;
EAB7 : 27 FC    "' "    beq  LEAB5
        ;
EAB9 : 1F    " "    db  $1F
        ;
EABA : E0 01    "  "    subb  $01,x
EABC : F8 07 7F    "   "    eorb  X077F
        ;
EABF : 00    " "    db  $00
        ;
EAC0 : 7E FF 1F    "~  "    jmp  LFF1F
        ;
EAC3 : C0 00    "  "    subb  #$00
        ;
EAC5 : FC    " "    db  $FC
        ;
EAC6 : 07    " "    tpa
        ;
EAC7 : 3C    "<"    db  $3C
        ;
EAC8 : 80 FF    "  "    suba  #$FF
        ;
EACA : FD    " "    db  $FD
        ;
EACB : 0F    " "    sei
EACC : C0 0F    "  "    subb  #$0F
EACE : FE 03 FC    "   "    ldx  X03FC
EAD1 : 80 7F    "  "    suba  #$7F
EAD3 : E0 1F    "  "    subb  $1F,x
EAD5 : C0 1F    "  "    subb  #$1F
EAD7 : F8 03 FC    "   "    eorb  X03FC
EADA : 01    " "    nop
EADB : FF E0 3F    "  ?"    stx  XE03F
EADE : 80 3F    " ?"    suba  #$3F
EAE0 : F8 07 F0    "   "    eorb  X07F0
EAE3 : 07    " "    tpa
EAE4 : FE C1 FF    "   "    ldx  XC1FF
        ;
EAE7 : 00    " "    db  $00
        ;
EAE8 : 7E F0 1F    "~  "    jmp  LF01F
        ;
EAEB : C0 1F    "  "    subb  #$1F
        ;
EAED : FC 03    "  "    db  $FC, $03
        ;
EAEF : FF 03 F8    "   "    stx  X03F8
        ;
EAF2 : C3    " "    db  $C3
        ;
EAF3 : 3F    "?"    swi
EAF4 : 80 7F    "  "    suba  #$7F
EAF6 : F8 0F FC    "   "    eorb  X0FFC
EAF9 : 0F    " "    sei
EAFA : C0 1F    "  "    subb  #$1F
        ;
EAFC : FC 03    "  "    db  $FC, $03
        ;
EAFE : F8 87 7E    "  ~"    eorb  X877E
EB01 : E0 FF    "  "    subb  $FF,x
        ;
EB03 : 00 FC    "  "    db  $00, $FC
        ;
EB05 : E0 1F    "  "    subb  $1F,x
EB07 : E0 3F    " ?"    subb  $3F,x
EB09 : F0 81 FF    "   "    subb  X81FF
EB0C : 07    " "    tpa
EB0D : E0 1F    "  "    subb  $1F,x
EB0F : FE 00 FE    "   "    ldx  X00FE
EB12 : 07    " "    tpa
        ;
EB13 : FC    " "    db  $FC
        ;
EB14 : F9 7F 00    "   "    adcb  X7F00
EB17 : FE C3 3F    "  ?"    ldx  XC33F
EB1A : C0 3F    " ?"    subb  #$3F
EB1C : C0 3F    " ?"    subb  #$3F
EB1E : FF 07 E0    "   "    stx  X07E0
EB21 : 3F    "?"    swi
        ;
EB22 : FC    " "    db  $FC
        ;
EB23 : 01    " "    nop
EB24 : F8 07 FC    "   "    eorb  X07FC
EB27 : 27 FF    "' "    beq  LEB28
EB29 : 01    " "    nop
        ;
EB2A : FC    " "    db  $FC
        ;
EB2B : 07    " "    tpa
EB2C : 78 00 FF    "x  "    asl  X00FF
EB2F : 01    " "    nop
EB30 : 7F C0 7F    "   "    clr  XC07F
EB33 : 80 FF    "  "    suba  #$FF
        ;
EB35 : 00 1F    "  "    db  $00, $1F
        ;
EB37 : C0 3F    " ?"    subb  #$3F
EB39 : C0 1F    "  "    subb  #$1F
        ;
EB3B : FC 1F    "  "    db  $FC, $1F
        ;
EB3D : 80 7F    "  "    suba  #$7F
EB3F : C0 1F    "  "    subb  #$1F
EB41 : E0 1F    "  "    subb  $1F,x
EB43 : E0 7F    "  "    subb  $7F,x
EB45 : F0 0F E0    "   "    subb  X0FE0
        ;
EB48 : 1F    " "    db  $1F
        ;
EB49 : E0 07    "  "    subb  $07,x
EB4B : F8 07 F8    "   "    eorb  X07F8
EB4E : 07    " "    tpa
        ;
EB4F : FC    " "    db  $FC
        ;
EB50 : 0F    " "    sei
EB51 : E0 3F    " ?"    subb  $3F,x
EB53 : E0 0F    "  "    subb  $0F,x
EB55 : F0 1F F0    "   "    subb  X1FF0
EB58 : 0F    " "    sei
EB59 : F0 1F E0    "   "    subb  X1FE0
        ;
EB5C : 1F    " "    db  $1F
        ;
EB5D : E0 07    "  "    subb  $07,x
EB5F : F8 07 F0    "   "    eorb  X07F0
EB62 : 0F    " "    sei
        ;
EB63 : FC 1F    "  "    db  $FC, $1F
        ;
EB65 : 80 FF    "  "    suba  #$FF
EB67 : C0 0F    "  "    subb  #$0F
EB69 : F0 1F C0    "   "    subb  X1FC0
EB6C : 3F    "?"    swi
EB6D : F0 7F 00    "   "    subb  X7F00
EB70 : FF 00 7F    "   "    stx  X007F
EB73 : 80 7F    "  "    suba  #$7F
EB75 : 80 7F    "  "    suba  #$7F
EB77 : C0 FF    "  "    subb  #$FF
        ;
EB79 : 03    " "    db  $03
        ;
EB7A : F0 3F 7C    " ?|"    subb  X3F7C
EB7D : 01    " "    nop
        ;
EB7E : FC    " "    db  $FC
        ;
EB7F : 07    " "    tpa
EB80 : F0 07 FC    "   "    subb  X07FC
        ;
EB83 : 1F    " "    db  $1F
        ;
EB84 : 80 FF    "  "    suba  #$FF
        ;
EB86 : 00    " "    db  $00
        ;
EB87 : 0F    " "    sei
EB88 : E0 3F    " ?"    subb  $3F,x
EB8A : C0 7F    "  "    subb  #$7F
EB8C : E0 FF    "  "    subb  $FF,x
        ;
EB8E : 03    " "    db  $03
        ;
EB8F : E0 3F    " ?"    subb  $3F,x
EB91 : F0 01 FC    "   "    subb  X01FC
EB94 : 0F    " "    sei
EB95 : F0 0F F0    "   "    subb  X0FF0
EB98 : FF 00 FC    "   "    stx  X00FC
EB9B : 07    " "    tpa
EB9C : 3F    "?"    swi
        ;
EB9D : 00    " "    db  $00
        ;
EB9E : FF 01 FC    "   "    stx  X01FC
EBA1 : E0 5F    " _"    subb  $5F,x
EBA3 : FF 00 FC    "   "    stx  X00FC
EBA6 : 07    " "    tpa
EBA7 : F0 00 FF    "   "    subb  X00FF
EBAA : 01    " "    nop
        ;
EBAB : FC    " "    db  $FC
        ;
EBAC : 07    " "    tpa
EBAD : F8 7F 00    "   "    eorb  X7F00
        ;
EBB0 : FC 1F    "  "    db  $FC, $1F
        ;
EBB2 : 28 C0    "( "    bvc  LEB74
EBB4 : FF 03 FC    "   "    stx  X03FC
EBB7 : 4D    "M"    tsta
EBB8 : FA FF 00    "   "    orab  XFF00
EBBB : F8 1F F0    "   "    eorb  X1FF0
        ;
EBBE : 00    " "    db  $00
        ;
EBBF : FE 03 F0    "   "    ldx  X03F0
        ;
EBC2 : 03    " "    db  $03
        ;
EBC3 : 7F F8 1F    "   "    clr  XF81F
EBC6 : 80 FF    "  "    suba  #$FF
        ;
EBC8 : 00    " "    db  $00
        ;
EBC9 : 3F    "?"    swi
EBCA : 80 FF    "  "    suba  #$FF
        ;
EBCC : 00    " "    db  $00
        ;
EBCD : 3E    ">"    wai
EBCE : C0 7F    "  "    subb  #$7F
        ;
EBD0 : FD 03    "  "    db  $FD, $03
        ;
EBD2 : E0 3F    " ?"    subb  $3F,x
EBD4 : 80 07    "  "    suba  #$07
EBD6 : F0 3F 80    " ? "    subb  X3F80
        ;
EBD9 : 1F    " "    db  $1F
        ;
EBDA : F0 AF FE    "   "    subb  XAFFE
        ;
EBDD : 03    " "    db  $03
        ;
EBDE : C0 7F    "  "    subb  #$7F
EBE0 : E0 0F    "  "    subb  $0F,x
EBE2 : E0 7F    "  "    subb  $7F,x
        ;
EBE4 : 00    " "    db  $00
        ;
EBE5 : 27 F8    "' "    beq  LEBDF
EBE7 : FF 5F 03    " _ "    stx  X5F03
        ;
EBEA : 00    " "    db  $00
        ;
EBEB : FF 01 3F    "  ?"    stx  X013F
        ;
EBEE : 00    " "    db  $00
        ;
EBEF : FF 01 6A    "  j"    stx  X016A
EBF2 : F5 5E DB    " ^ "    bitb  X5EDB
EBF5 : FF 03 80    "   "    stx  X0380
EBF8 : 7F C0 0F    "   "    clr  XC00F
EBFB : 80 FF    "  "    suba  #$FF
        ;
EBFD : 03 3C    " <"    db  $03, $3C
        ;
EBFF : C0 FF    "  "    subb  #$FF
EC01 : 80 FF    "  "    suba  #$FF
        ;
EC03 : 03 00    "  "    db  $03, $00
        ;
EC05 : 7E E1 7F    "~  "    jmp  LE17F
        ;
EC08 : 00    " "    db  $00
        ;
EC09 : FE A3 15    "   "    ldx  XA315
EC0C : 80 FF    "  "    suba  #$FF
EC0E : 43    "C"    coma
EC0F : DF 6E    " n"    stx  X006E
        ;
EC11 : 00    " "    db  $00
        ;
EC12 : E8 84    "  "    eorb  $84,x
EC14 : FF 01 C0    "   "    stx  X01C0
EC17 : FF 03 00    "   "    stx  X0300
EC1A : F8 7F F4    "   "    eorb  X7FF4
EC1D : 0F    " "    sei
EC1E : 7A 00 F8    "z  "    dec  X00F8
        ;
EC21 : 03    " "    db  $03
        ;
EC22 : FE 01 F0    "   "    ldx  X01F0
EC25 : 5F    "_"    clrb
EC26 : 20 D4    "  "    bra  LEBFC
        ;
EC28 : 9E BF    "  "    lds  X00BF
EC2A : 85 FD    "  "    bita  #$FD
EC2C : 0F    " "    sei
        ;
EC2D : 00    " "    db  $00
        ;
EC2E : F0 C9 F7    "   "    subb  XC9F7
        ;
EC31 : 00    " "    db  $00
        ;
EC32 : E0 FF    "  "    subb  $FF,x
EC34 : 80 07    "  "    suba  #$07
EC36 : E0 FF    "  "    subb  $FF,x
EC38 : C0 5F    " _"    subb  #$5F
EC3A : FA 07 00    "   "    orab  X0700
EC3D : 6C FF    "l "    inc  $FF,x
EC3F : 0F    " "    sei
        ;
EC40 : 00    " "    db  $00
        ;
EC41 : F6 BF 00    "   "    ldab  XBF00
EC44 : 09    " "    dex
EC45 : F5 FF 80    "   "    bitb  XFF80
EC48 : AC FF    "  "    cpx  $FF,x
EC4A : 0F    " "    sei
        ;
EC4B : 00 FC FC 1F  "    "    db  $00, $FC, $FC, $1F
EC4F : 00 FC    "  "    db  $00, $FC
        ;
EC51 : 5F    "_"    clrb
EC52 : 8B 00    "  "    adda  #$00
EC54 : F0 FD 1F    "   "    subb  XFD1F
EC57 : E0 FF    "  "    subb  $FF,x
        ;
EC59 : 15 00    "  "    db  $15, $00
        ;
EC5B : C0 7F    "  "    subb  #$7F
        ;
EC5D : FD 00    "  "    db  $FD, $00
        ;
EC5F : C0 5F    " _"    subb  #$5F
EC61 : E9 1F    "  "    adcb  $1F,x
        ;
EC63 : 00    " "    db  $00
        ;
EC64 : FE A3 BE    "   "    ldx  XA3BE
EC67 : 20 FF    "  "    bra  LEC68
        ;
EC69 : 2F 00    "/ "    ble  LEC6B
EC6B        LEC6B:
EC6B : 80 F7    "  "    suba  #$F7
EC6D : 76 01 E0    "v  "    ror  X01E0
EC70 : B7 FB 0A    "   "    staa  XFB0A
        ;
EC73 : 00    " "    db  $00
        ;
EC74 : DA 6F    " o"    orab  X006F
EC76 : D2 35    " 5"    sbcb  X0035
EC78 : F4 FF 03    "   "    andb  XFF03
        ;
EC7B : 00    " "    db  $00
        ;
EC7C : F0 AF BE    "   "    subb  XAFBE
        ;
EC7F : 00    " "    db  $00
        ;
EC80 : E0 5F    " _"    subb  $5F,x
EC82 : F4 16 A0    "   "    andb  X16A0
EC85 : 57    "W"    asrb
        ;
EC86 : 51    "Q"    db  $51
        ;
EC87 : 5A    "Z"    decb
        ;
EC88 : 15    " "    db  $15
        ;
EC89 : FB FF 01    "   "    addb  XFF01
        ;
EC8C : 00    " "    db  $00
        ;
EC8D : E0 DF    "  "    subb  $DF,x
EC8F : AE 02    "  "    lds  $02,x
EC91 : A0 BF    "  "    suba  $BF,x
EC93 : A8 2F    " /"    eora  $2F,x
        ;
EC95 : 00    " "    db  $00
        ;
EC96 : AA FD    "  "    oraa  $FD,x
EC98 : 17    " "    tba
        ;
EC99 : 51    "Q"    db  $51
        ;
EC9A : B5 FE 5F    "  _"    bita  XFE5F
        ;
EC9D : 00 00    "  "    db  $00, $00
        ;
EC9F : 7C DF 45    "| E"    inc  XDF45
        ;
ECA2 : 00    " "    db  $00
        ;
ECA3 : D4 5A    " Z"    andb  X005A
ECA5 : FF 0F 00    "   "    stx  X0F00
        ;
ECA8 : 6B    "k"    db  $6B
        ;
ECA9 : F4 1F 02    "   "    andb  X1F02
ECAC : F7 75 BF    " u "    stab  X75BF
        ;
ECAF : 00 00    "  "    db  $00, $00
        ;
ECB1 : AE DA    "  "    lds  $DA,x
ECB3 : 5F    "_"    clrb
ECB4 : 23 40    "#@"    bls  LECF6
        ;
ECB6 : 75    "u"    db  $75
        ;
ECB7 : EE 5F    " _"    ldx  $5F,x
ECB9 : 01    " "    nop
ECBA : 50    "P"    negb
ECBB : A9 7F    "  "    adca  $7F,x
        ;
ECBD : 03    " "    db  $03
        ;
ECBE : D0 ED    "  "    subb  X00ED
ECC0 : 6E A7    "n "    jmp  $A7,x            ;INFO: index jump
        ;
ECC2 : 00    " "    db  $00
        ;
ECC3 : E0 42    " B"    subb  $42,x
ECC5 : F4 4F 55    " OU"    andb  X4F55
        ;
ECC8 : 05    " "    db  $05
        ;
ECC9 : 50    "P"    negb
ECCA : FF 5A 55    " ZU"    stx  X5A55
        ;
ECCD : 00    " "    db  $00
        ;
ECCE : F4 2F 81    " / "    andb  X2F81
ECD1 : AA BE    "  "    oraa  $BE,x
ECD3 : 5F    "_"    clrb
ECD4 : 91 6A    " j"    cmpa  X006A
        ;
ECD6 : 02    " "    db  $02
        ;
ECD7 : E0 02    "  "    subb  $02,x
ECD9 : F8 3F A4    " ? "    eorb  X3FA4
ECDC : 06    " "    tap
ECDD : D0 7F    "  "    subb  X007F
ECDF : A1 2C    " ,"    cmpa  $2C,x
ECE1 : 20 FD    "  "    bra  LECE0
        ;
ECE3 : 1F 52    " R"    db  $1F, $52
        ;
ECE5 : 01    " "    nop
ECE6 : FA 6F 95    " o "    orab  X6F95
ECE9 : 20 F5    "  "    bra  LECE0
        ;
ECEB : 40    "@"    nega
ECEC : B4 00 FD    "   "    anda  X00FD
        ;
ECEF : 87    " "    db  $87
        ;
ECF0 : AC 02    "  "    cpx  $02,x
ECF2 : F4 BF D5    "   "    andb  XBFD5
        ;
ECF5 : 04    " "    db  $04
        ;
ECF6        LECF6:
ECF6 : A8 96    "  "    eora  $96,x
        ;
ECF8 : FD 02    "  "    db  $FD, $02
        ;
ECFA : F0 8D FA    "   "    subb  X8DFA
ECFD : 07    " "    tpa
ECFE : E4 95    "  "    andb  $95,x
ED00 : 88 12    "  "    eora  #$12
        ;
ED02 : 42    "B"    db  $42
        ;
ED03 : DB FF    "  "    addb  X00FF
        ;
ED05 : 15    " "    db  $15
        ;
ED06 : A8 14    "  "    eora  $14,x
ED08 : EA 5F    " _"    orab  $5F,x
ED0A : 91 4A    " J"    cmpa  X004A
ED0C : 50    "P"    negb
        ;
ED0D : ED    " "    db  $ED
        ;
ED0E : AA A2    "  "    oraa  $A2,x
ED10 : 5A    "Z"    decb
ED11 : D5 37    " 7"    bitb  X0037
ED13 : 01    " "    nop
ED14 : 4A    "J"    deca
ED15 : F5 9F 20    "   "    bitb  X9F20
        ;
ED18 : 02    " "    db  $02
        ;
ED19 : EA EA    "  "    orab  $EA,x
ED1B : BF 20 15    "   "    sts  X2015
ED1E : D4 B7    "  "    andb  X00B7
ED20 : 56    "V"    rorb
        ;
ED21 : 05    " "    db  $05
        ;
ED22 : 95 A4    "  "    bita  X00A4
ED24 : 57    "W"    asrb
ED25 : D0 55    " U"    subb  X0055
        ;
ED27 : FC    " "    db  $FC
        ;
ED28 : 6F 0A    "o "    clr  $0A,x
ED2A : 44    "D"    lsra
ED2B : 95 5A    " Z"    bita  X005A
        ;
ED2D : 15 00    "  "    db  $15, $00
        ;
ED2F : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
ED31 : 7F 45 91    " E "    clr  X4591
        ;
ED34 : 52    "R"    db  $52
        ;
ED35 : E9 B7    "  "    adcb  $B7,x
ED37 : 50    "P"    negb
ED38 : 22 54    ""T"    bhi  LED8E
ED3A : EA DF    "  "    orab  $DF,x
ED3C : AA AA    "  "    oraa  $AA,x
ED3E : 22 A8    "" "    bhi  LECE8
ED40 : 4A    "J"    deca
ED41 : EA 6B    " k"    orab  $6B,x
ED43 : 01    " "    nop
        ;
ED44 : 45    "E"    db  $45
        ;
ED45 : C0 AB    "  "    subb  #$AB
        ;
ED47 : DD    " "    db  $DD
        ;
ED48 : E9 0A    "  "    adcb  $0A,x
ED4A : B2 A8 AA    "   "    sbca  XA8AA
ED4D : BE A4 AF    "   "    lds  XA4AF
ED50 : 50    "P"    negb
ED51 : AA 82    "  "    oraa  $82,x
ED53 : FE AA 26    "  &"    ldx  XAA26
        ;
ED56 : 05    " "    db  $05
        ;
ED57 : E8 AA    "  "    eorb  $AA,x
ED59 : 7D 05 05    "}  "    tst  X0505
ED5C : 49    "I"    rola
ED5D : F1 A7 AB    "   "    cmpb  XA7AB
ED60 : AA 50    " P"    oraa  $50,x
ED62 : 8B AA    "  "    adda  #$AA
ED64 : 5F    "_"    clrb
        ;
ED65 : 55    "U"    db  $55
        ;
ED66 : 17    " "    tba
ED67 : 50    "P"    negb
ED68 : AD 54    " T"    jsr  $54,x            ;INFO: index jump
ED6A : 9B A0    "  "    adda  X00A0
ED6C : 56    "V"    rorb
ED6D : D2 BE    "  "    sbcb  X00BE
ED6F : A2 AE    "  "    sbca  $AE,x
ED71 : 50    "P"    negb
        ;
ED72 : 5B    "["    db  $5B
        ;
ED73 : 88 2A    " *"    eora  #$2A
        ;
ED75 : 41 5B    "A["    db  $41, $5B
        ;
ED77 : 49    "I"    rola
ED78 : 6D D7    "m "    tst  $D7,x
ED7A : EE 4A    " J"    ldx  $4A,x
ED7C : 95 24    " $"    bita  X0024
ED7E : A9 0A    "  "    adca  $0A,x
        ;
ED80 : 55 45 55    "UEU"    db  $55, $45, $55
        ;
ED83 : 95 BA    "  "    bita  X00BA
ED85 : AA AA    "  "    oraa  $AA,x
ED87 : AA 8A    "  "    oraa  $8A,x
ED89 : 28 09    "( "    bvc  LED94
        ;
ED8B        LED8B:
ED8B : 75 55 4B    "uUK"    db  $75, $55, $4B
        ;
ED8E        LED8E:
ED8E : 90 56    " V"    suba  X0056
ED90 : A9 AA    "  "    adca  $AA,x
ED92 : DB 77    " w"    addb  X0077
ED94        LED94:
ED94 : DB AD    "  "    addb  X00AD
ED96 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
        ;
ED98 : 55    "U"    db  $55
        ;
ED99 : 25 29    "%)"    bcs  LEDC4
ED9B : 95 94    "  "    bita  X0094
ED9D : AA AA    "  "    oraa  $AA,x
ED9F : AA AA    "  "    oraa  $AA,x
EDA1 : AA AA    "  "    oraa  $AA,x
EDA3 : AA EA    "  "    oraa  $EA,x
EDA5 : AA BA    "  "    oraa  $BA,x
EDA7 : AA 52    " R"    oraa  $52,x
EDA9 : 09    " "    dex
EDAA : A5 2A    " *"    bita  $2A,x
EDAC : AA A4    "  "    oraa  $A4,x
EDAE : EB AD    "  "    addb  $AD,x
EDB0 : 28 20    "( "    bvc  LEDD2
        ;
EDB2 : 45    "E"    db  $45
        ;
EDB3 : DB 7B    " {"    addb  X007B
EDB5 : 6D 55    "mU"    tst  $55,x
        ;
EDB7 : 45 55    "EU"    db  $45, $55
        ;
EDB9 : B7 6D 55    " mU"    staa  X6D55
EDBC : A1 54    " T"    cmpa  $54,x
        ;
EDBE : 55 55 55    "UUU"    db  $55, $55, $55
        ;
EDC1 : A5 52    " R"    bita  $52,x
        ;
EDC3 : 55 5B    "U["    db  $55, $5B
        ;
EDC5 : D5 AA    "  "    bitb  X00AA
EDC7 : 4A    "J"    deca
EDC8 : 95 AA    "  "    bita  X00AA
EDCA : A2 A2    "  "    sbca  $A2,x
        ;
EDCC : 55 1A    "U "    db  $55, $1A
        ;
EDCE : 5D    "]"    tstb
EDCF : 6A 71    "jq"    dec  $71,x
EDD1 : A9 4E    " N"    adca  $4E,x
EDD3 : 2F 55    "/U"    ble  LEE2A
EDD5 : 69 75    "iu"    rol  $75,x
EDD7 : D5 56    " V"    bitb  X0056
        ;
EDD9 : 5B    "["    db  $5B
        ;
EDDA : BD DA 6A    "  j"    jsr  LDA6A
EDDD : AB AB    "  "    adda  $AB,x
EDDF : 4A    "J"    deca
EDE0 : 2A A9    "* "    bpl  LED8B
        ;
EDE2 : 52    "R"    db  $52
        ;
EDE3 : A5 92    "  "    bita  $92,x
        ;
EDE5 : 12    " "    db  $12
        ;
EDE6 : 2A 55    "*U"    bpl  LEE3D
EDE8 : A9 92    "  "    adca  $92,x
EDEA : 2A 29    "*)"    bpl  LEE15
EDEC : AA 44    " D"    oraa  $44,x
EDEE : 4A    "J"    deca
        ;
EDEF : 45 55 55    "EUU"    db  $45, $55, $55
        ;
EDF2 : B5 AB 5A    "  Z"    bita  XAB5A
        ;
EDF5 : ED    " "    db  $ED
        ;
EDF6 : 6D 6B    "mk"    tst  $6B,x
EDF8 : DB 76    " v"    addb  X0076
EDFA : BB D6 D6    "   "    adda  XD6D6
EDFD : D6 6A    " j"    ldab  X006A
        ;
EDFF : 5B 55 55 55  "[UUU"    db  $5B, $55, $55, $55
EE03 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
EE07 : 55 55 55    "UUU"    db  $55, $55, $55
;*************************************;
;TALKD call
EE0A : 19    " "    daa
EE0B : 01    " "    nop
EE0C : 82 1E    "  "    sbca  #$1E
EE0E : 90 1E    "  "    suba  X001E
EE10 : 16    " "    tab
        ;
EE11 : 83 1E    "  "    db  $83, $1E
        ;
EE13 : 90 1E    "  "    suba  X001E
EE15        LEE15:
EE15 : 16    " "    tab
EE16 : 84 1E    "  "    anda  #$1E
EE18 : 90 1E    "  "    suba  X001E
EE1A : 16    " "    tab
EE1B : 85 23    " #"    bita  #$23
EE1D : 90 1E    "  "    suba  X001E
EE1F : 16    " "    tab
EE20 : 86 1E    "  "    ldaa  #$1E
EE22 : 10    " "    sba
EE23 : 88 1E    "  "    eora  #$1E
EE25 : 10    " "    sba
        ;
EE26 : 87    " "    db  $87
        ;
EE27 : 28 91    "( "    bvc  LEDBA
EE29 : 8D 13    "  "    bsr  LEE3E
EE2B : 92 1E    "  "    sbca  X001E
        ;
EE2D : 14    " "    db  $14
        ;
EE2E : 8C 14 0B    "   "    cpx  #$140B
EE31 : 8E 1E 15    "   "    lds  #$1E15
        ;
EE34 : 02 03 04 05  "    "    db  $02, $03, $04, $05
        ;
EE38 : 06    " "    tap
        ;
EE39 : 8F    " "    db  $8F
        ;
EE3A : 8A 1E    "  "    oraa  #$1E
EE3C : 06    " "    tap
        ;
EE3D        LEE3D:
EE3D : 8F    " "    db  $8F
        ;
EE3E        LEE3E:
EE3E : 8A 1E    "  "    oraa  #$1E
EE40 : 85 09    "  "    bita  #$09
;*************************************;
;irq call for ADDX
EE42 : 97 1E    "  "    staa  X001E
        ;
EE44 : 18 1A    "  "    db  $18, $1A
        ;
EE46 : B0 00 B9    "   "    suba  X00B9
EE49 : 9F B9    "  "    sts  X00B9
EE4B : A0 BD    "  "    suba  $BD,x
EE4D : A4 BD    "  "    anda  $BD,x
EE4F : A5 C1    "  "    bita  $C1,x
        ;
EE51 : 05    " "    db  $05
        ;
EE52 : C1 06    "  "    cmpb  #$06
EE54 : C4 BE    "  "    andb  #$BE
EE56 : C4 BF    "  "    andb  #$BF
        ;
EE58 : C7    " "    db  $C7
        ;
EE59 : 3F    "?"    swi
        ;
EE5A : C7    " "    db  $C7
        ;
EE5B : 40    "@"    nega
EE5C : CA FB    "  "    orab  #$FB
EE5E : CA FC    "  "    orab  #$FC
EE60 : D2 3B    " ;"    sbcb  X003B
EE62 : D2 3C    " <"    sbcb  X003C
EE64 : D6 6D    " m"    ldab  X006D
EE66 : D6 6E    " n"    ldab  X006E
EE68 : D9 C8    "  "    adcb  X00C8
EE6A : D9 C9    "  "    adcb  X00C9
EE6C : DB 64    " d"    addb  X0064
EE6E : DB 65    " e"    addb  X0065
        ;
EE70 : E3 15 E3    "   "    db  $E3, $15, $E3
        ;
EE73 : 16    " "    tab
EE74 : E4 99    "  "    andb  $99,x
EE76 : E4 9A    "  "    andb  $9A,x
EE78 : E6 DA    "  "    ldab  $DA,x
EE7A : E6 DB    "  "    ldab  $DB,x
EE7C : E9 40    " @"    adcb  $40,x
EE7E : B0 00 B2    "   "    suba  X00B2
        ;
EE81 : 00    " "    db  $00
        ;
EE82 : B6 00 B9    "   "    ldaa  X00B9
EE85 : 80 B9    "  "    suba  #$B9
EE87 : A0 BA    "  "    suba  $BA,x
EE89 : C0 BD    "  "    subb  #$BD
EE8B : A5 BF    "  "    bita  $BF,x
EE8D : 80 CF    "  "    suba  #$CF
        ;
EE8F : 00    " "    db  $00
        ;
EE90 : D1 60    " `"    cmpb  X0060
        ;
EE92 : DC    " "    db  $DC
        ;
EE93 : EA E3    "  "    orab  $E3,x
        ;
EE95 : 15 DD    "  "    db  $15, $DD
        ;
EE97 : E0 E3    "  "    subb  $E3,x
        ;
EE99 : 15    " "    db  $15
        ;
EE9A : E1 80    "  "    cmpb  $80,x
        ;
EE9C : E3 15    "  "    db  $E3, $15
        ;
EE9E : E9 41    " A"    adcb  $41,x
        ;
EEA0 : ED    " "    db  $ED
        ;
EEA1 : 91 ED    "  "    cmpa  X00ED
EEA3 : 91 EE    "  "    cmpa  X00EE
EEA5 : 0A    " "    clv
EEA6 : B0 00 EE    "   "    suba  X00EE
EEA9 : 0A    " "    clv
EEAA : BC 00 

;*************************************;
;irq call for ADDX
EEAC : BC    "   "    cpx  X00BC
EEAD : 04    " "    db  $04
EEAE : EE 0B    "  "    ldx  $0B,x
EEB0 : EE 0C    "  "    ldx  $0C,x
EEB2 : EE 11    "  "    ldx  $11,x
EEB4 : EE 16    "  "    ldx  $16,x
EEB6 : EE 1B    "  "    ldx  $1B,x
EEB8 : EE 20    "  "    ldx  $20,x
EEBA : EE 23    " #"    ldx  $23,x
EEBC : EE 26    " &"    ldx  $26,x
EEBE : EE 2B    " +"    ldx  $2B,x
EEC0 : EE 2E    " ."    ldx  $2E,x
EEC2 : EE 30    " 0"    ldx  $30,x
EEC4 : EE 31    " 1"    ldx  $31,x
EEC6 : EE 34    " 4"    ldx  $34,x
EEC8 : EE 35    " 5"    ldx  $35,x
EECA : EE 36    " 6"    ldx  $36,x
EECC : EE 37    " 7"    ldx  $37,x
EECE : EE 38    " 8"    ldx  $38,x
EED0 : EE 39    " 9"    ldx  $39,x
EED2 : EE 3D    " ="    ldx  $3D,x
EED4 : EE 42    " B"    ldx  $42,x
EED6 : EE 45    " E"    ldx  $45,x
        ;
EED8 : 00    " "    db  $00
        ;
EED9 : 01    " "    nop
EEDA : 01    " "    nop
        ;
EEDB : 00 02 00 03  "    "    db  $00, $02, $00, $03
EEDF : 00 04 00 05  "    "    db  $00, $04, $00, $05
EEE3 : 00    " "    db  $00
        ;
EEE4 : 06    " "    tap
        ;
EEE5 : 00    " "    db  $00
        ;
EEE6 : 07    " "    tpa
        ;
EEE7 : 00    " "    db  $00
        ;
EEE8 : 08    " "    inx
        ;
EEE9 : 00    " "    db  $00
        ;
EEEA : 09    " "    dex
        ;
EEEB : 00    " "    db  $00
        ;
EEEC : 0A    " "    clv
        ;
EEED : 00    " "    db  $00
        ;
EEEE : 0B    " "    sev
        ;
EEEF : 00    " "    db  $00
        ;
EEF0 : 0C    " "    clc
        ;
EEF1 : 00    " "    db  $00
        ;
EEF2 : 0D    " "    sec
        ;
EEF3 : 00    " "    db  $00
        ;
EEF4 : 0E    " "    cli
        ;
EEF5 : 00    " "    db  $00
        ;
EEF6 : 0F    " "    sei
        ;
EEF7 : 00    " "    db  $00
        ;
EEF8 : 10    " "    sba
        ;
EEF9 : 00    " "    db  $00
        ;
EEFA : 11    " "    cba
        ;
EEFB : 00 12 00 13  "    "    db  $00, $12, $00, $13
EEFF : 00 14 00 00  "    "    db  $00, $14, $00, $00
EF03        XEF03:
EF03 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF07 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF0B : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF0F        LEF0F:
EF0F : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF13 : 00 00 00    "   "    db  $00, $00, $00
;*************************************;
; Copyright Message
;*************************************;
EF16 : 43    "C"                      ;COPYRIGHT
EF17 : 4F    "O"                      ;
EF18 : 50    "P"                      ;
EF19 : 59    "Y"                      ;
EF1A : 52    "R"                      ;
EF1B : 49    "I"                      ;
EF1C : 47    "G"                      ;
EF1D : 48    "H"                      ;
EF1E : 54    "T"                      ;
EF1F : 2D 57    "-W"                  ;-WILLIAMS
EF21 : 49    "I"                      ;
EF22 : 4C    "L"                      ;
EF23 : 4C    "L"                      ;
EF24 : 49    "I"                      ;
EF25 : 41    "A"                      ;
EF26 : 4D    "M"                      ;
EF27 : 53    "S"                      ;
EF28 : 20 45    " E"                  ;ELECTRONICS
EF2A : 4C    "L"                      ;
EF2B : 45    "E"                      ;
EF2C : 43    "C"                      ;
EF2D : 54    "T"                      ;
EF2E : 52    "R"                      ;
EF2F : 4F    "O"                      ;
EF30 : 4E    "N"                      ;
EF31 : 49    "I"                      ;
EF32 : 43    "C"                      ;
EF33 : 53    "S"                      ;
EF34 : 2D 34    "-4"                  ;-4-27-82
EF36 : 2D 32    "-2"                  ;
EF38 : 37    "7"                      ;
EF39 : 2D 38    "-8"                  ;
EF3B : 32    "2"                      ;
EF3C : 2D 4A    "-J"                  ;-JK
EF3E : 4B 2D "K-"                     ;
;*************************************;
; DIAGNOSTICS
;*************************************;
;TALKD
EF40 : CE EE 0A   ldx  #$EE0A         ;load X with EE0Ah (data)
EF43 : 20 28      bra  LEF6D          ;branch always TKIRQ2
;*************************************;
; TALKING IRQ processing
;*************************************;
;TKIRQ
EF45 : CE EE D6   ldx  #$EED6         ;load X with EED6h (data)
EF48 : 97 14      staa  $14           ;store A in addr 14
EF4A : 97 16      staa  $16           ;store A in addr 16
EF4C : 84 1F      anda  #$1F          ;and A with 1Fh
EF4E : 27 0A      beq  LEF5A          ;branch Z=1 TKIRQ1
EF50 : 48         asla                ;arith shift left A
EF51 : BD FF F3   jsr  LFFF3          ;jump sub addr FFF3 (Sound ROM jump to ADDX)
EF54 : E6 01      ldab  $01,x         ;load B with X+01h
EF56 : D7 15      stab  $15           ;store B in addr 15
EF58 : A6 00      ldaa  $00,x         ;load A with X+00h
;TKIRQ1 
EF5A : 27 3C      beq  LEF98          ;branch Z=1 TKIRQ4
EF5C : 0E         cli                 ;clear interrupts
EF5D : 48         asla                ;arith shift left A
EF5E : CE EE AC   ldx  #$EEAC         ;load X with EEACh (data)
EF61 : BD FF F3   jsr  LFFF3          ;jump sub addr FFF3 (Sound ROM jump to ADDX)
EF64 : EE 00      ldx  $00,x          ;load X with X+00h
EF66 : 86 C8      ldaa  #$C8          ;load A with C8h (#-56 or #200)
;TKIRQL 
EF68 : 8D 50      bsr  LEFBA          ;branch sub TKCD
EF6A : 4A         deca                ;decr A
EF6B : 26 FB      bne  LEF68          ;branch Z=0 TKIRQL
;TKIRQ2
EF6D : DF 1B      stx  $1B            ;store X in addr 1B
EF6F : A6 00      ldaa  $00,x         ;load A with X+00h
EF71 : 84 7F      anda  #$7F          ;and A with 7Fh
EF73 : 81 1A      cmpa  #$1A          ;compare A with 1Ah
EF75 : 22 23      bhi  LEF9A          ;branch C+Z=0 TKPRMD
EF77 : 48         asla                ;arith shift left A
EF78 : 48         asla                ;arith shift left A
EF79 : CE EE 42   ldx  #$EE42         ;load X with EE42h (data)
EF7C : BD FF F3   jsr  LFFF3          ;jump sub addr FFF3 (Sound ROM jump to ADDX)
EF7F : DF 1D      stx  $1D            ;store X in addr 1D
EF81 : EE 00      ldx  $00,x          ;load X with X+00h
EF83 : DF 17      stx  $17            ;store X in addr 17
EF85 : DE 1D      ldx  $1D            ;load X with addr 1D
EF87 : EE 02      ldx  $02,x          ;load X with X+02h
EF89 : DF 19      stx  $19            ;store X in addr 19
EF8B : 8D 33      bsr  LEFC0          ;branch sub TKSC
;TKIRQ3
EF8D : DE 1B      ldx  $1B            ;load X with addr 1B
EF8F : A6 00      ldaa  $00,x         ;load A with X+00h
EF91 : 81 1A      cmpa  #$1A          ;compare A with 1Ah
EF93 : 23 10      bls  LEFA5          ;branch C+Z=1 TKPRME
EF95 : 08         inx                 ;incr X
EF96 : 20 D5      bra  LEF6D          ;branch always TKIRQ2
;TKIRQ4 
EF98 : 20 12      bra  LEFAC          ;branch always TKPRM1
;*************************************;
;Talking Param Delay routine
;*************************************;
;TKPRMD 
EF9A : A6 00      ldaa  $00,x         ;load A with X+00h
;TKPDLP
EF9C : 8D 1C      bsr  LEFBA          ;branch sub TKCD
EF9E : 4A         deca                ;decr A
EF9F : 26 FB      bne  LEF9C          ;branch Z=0 TKPDLP
EFA1 : 97 14      staa  $14           ;store A in addr 14
EFA3 : 20 E8      bra  LEF8D          ;branch always TKIRQ3
;*************************************;
;Talking Param Exit routine
;*************************************;
;TKPRME
EFA5 : 86 32      ldaa  #$32          ;load A with 32h (#50)
;TKPELP 
EFA7 : 8D 11      bsr  LEFBA          ;branch sub TKCD
EFA9 : 4A         deca                ;decr A
EFAA : 26 FB      bne  LEFA7          ;branch Z=0 TKPELP
;TKPRM1 
EFAC : 96 14      ldaa  $14           ;load A with addr 14
EFAE : 7D 00 16   tst  $0016          ;test addr 0016
EFB1 : 26 02      bne  LEFB5          ;branch Z=0 TKPRMX
EFB3 : 96 15      ldaa  $15           ;load A with addr 15
;TKPRMX 
EFB5 : F6 04 02   ldab  $0402         ;load B with PIA sound select
EFB8 : 0E         cli                 ;clear interrupts
EFB9 : 39         rts                 ;return subroutine (back to Sound ROM calling IRQ)
;*************************************;
;TALKING count down loop
;*************************************;
;TKCD
EFBA : C6 49      ldab  #$49          ;load B with 49h (#73)
;TKCDLP
EFBC : 5A         decb                ;decr B
EFBD : 26 FD      bne  LEFBC          ;branch Z=0 TKCDLP
EFBF : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech clock (0403)
;*************************************;
;TKSC
EFC0 : DE 17      ldx  $17            ;load X with addr 17
EFC2 : A6 00      ldaa  $00,x         ;load A with X+00h
EFC4 : 81 AA      cmpa  #$AA          ;compare A with AAh
EFC6 : 26 19      bne  LEFE1          ;branch Z=0 TKSCX
EFC8 : 7F 00 16   clr  $0016          ;clear addr 0016
EFCB : 08         inx                 ;incr X
EFCC : C6 01      ldab  #$01          ;load B with 01h
;TKSC1
EFCE : 86 3F      ldaa  #$3F          ;load A with 3Fh (0011 1111)
EFD0 : B7 04 03   staa  $0403         ;store A (3Fh) in PIA CR port B (CB2 - speech clock)
EFD3 : 84 F7      anda  #$F7          ;and A with F7h (1111 0111)
EFD5 : B7 04 03   staa  $0403         ;store A (F7h) in PIA CR port B (CB2 - speech clock)
EFD8 : 58         aslb                ;arith shift left B
EFD9 : 26 07      bne  LEFE2          ;branch Z=0 TKSD
EFDB : 59         rolb                ;rotate left B
EFDC : 08         inx                 ;incr X
EFDD : 9C 19      cpx  $19            ;compare X with addr 19
EFDF : 26 01      bne  LEFE2          ;branch Z=0 TKSD
;TKSCX
EFE1 : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech data (0401)
;*************************************;
;TKSD
EFE2 : 6D 00      tst  $00,x          ;test X+00h
EFE4 : 6D 00      tst  $00,x          ;test X+00h
EFE6 : E5 00      bitb  $00,x         ;bit test B with X+00h
EFE8 : 27 07      beq  LEFF1          ;branch Z=1 TKSD1
EFEA : 86 3C      ldaa  #$3C          ;load A with 3Ch (0011 1100)
EFEC : B7 04 01   staa  $0401         ;store A (3Ch) in PIA sound select (CA2 - speech data)
EFEF : 20 DD      bra  LEFCE          ;branch always TKSC1
;TKSD1
EFF1 : 86 34      ldaa  #$34          ;load A with 34h (0011 0100)
EFF3 : B7 04 01   staa  $0401         ;store A (34h) in PIA sound select (CA2 - speech data)
EFF6 : 20 D6      bra  LEFCE          ;branch always TKSC1
;*************************************;
; ??
EFF8 : A2 09      sbca  $09,x
;*************************************;
;ENTRY (from Sound ROM)
;*************************************;
EFFA : 7E EF 40   jmp  LEF40          ;jump TALKD (ENTRY FOR DIAGNOSTICS)
EFFD : 7E EF 45   jmp  LEF45          ;jump TIRQ (ENTRY TO TALKING (TKIRQ))

;--------------------------------------------------------------




