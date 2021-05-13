        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    GorgarSpeech6.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  CD8A
        ;  CRC-32:    218290B9
        ;
        ;  Date:    Tue May 11 23:38:40 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;Gorgar Speech ROM IC6 $D000, entry from Sound ROM
        ;
        ;updated 13 May 2021
        ;
org  $D000
        ;
D000        XD000:
D000 : 91 81    "  "    cmpa  X0081
D002        XD002:
D002 : 0E    " "    cli
D003 : 39    "9"    rts
        ;
D004 : E1 CE    "  "    cmpb  $CE,x
        ;
D006 : C7 1C    "  "    db  $C7, $1C
        ;
D008 : 8C 67 0C    " g "    cpx  #$670C
D00B : 63 0E    "c "    com  $0E,x
D00D : 7F 7D DC    " } "    clr  X7DDC
D010 : 60 0C    "` "    neg  $0C,x
D012 : 66 71    "fq"    ror  $71,x
D014 : CE 66 78    " fx"    ldx  #$6678
D017 : C4 4C    " L"    andb  #$4C
D019 : E7 B9    "  "    stab  $B9,x
        ;
D01B : CC    " "    db  $CC
        ;
D01C : 60 08    "` "    neg  $08,x
        ;
D01E : F3 F3 DD    "   "    db  $F3, $F3, $DD
        ;
D021 : A5 23    " #"    bita  $23,x
D023 : 1B    " "    aba
        ;
D024 : 1E    " "    db  $1E
        ;
D025 : 31    "1"    ins
D026 : 0E    " "    cli
D027 : 33    "3"    pulb
D028 : 39    "9"    rts
        ;
D029 : 8E 3E 1C    " > "    lds  #$3E1C
        ;
D02C : 5E 38    "^8"    db  $5E, $38
        ;
D02E : C1 39    " 9"    cmpb  #$39
D030 : FB EE 38    "  8"    addb  XEE38
D033 : C0 E3    "  "    subb  #$E3
D035 : 19    " "    daa
D036 : E7 46    " F"    stab  $46,x
D038 : 0C    " "    clc
D039 : 63 DF    "c "    com  $DF,x
D03B : 8E C7 11    "   "    lds  #$C711
        ;
D03E : 00    " "    db  $00
        ;
D03F : 86 3F    " ?"    ldaa  #$3F
D041 : BF EF 71    "  q"    sts  XEF71
D044 : 10    " "    sba
        ;
D045 : 04    " "    db  $04
        ;
D046 : 73 1C F7    "s  "    com  X1CF7
D049 : 36    "6"    psha
        ;
D04A : 1C E3    "  "    db  $1C, $E3
        ;
D04C : 1B    " "    aba
D04D : CE C6 31    "  1"    ldx  #$C631
D050 : 80 C6    "  "    suba  #$C6
        ;
D052 : E3    " "    db  $E3
        ;
D053 : DF E7    "  "    stx  X00E7
D055 : 33    "3"    pulb
D056 : 08    " "    inx
D057 : 0C    " "    clc
D058 : 36    "6"    psha
        ;
D059 : 1C FC    "  "    db  $1C, $FC
        ;
D05B : F1 9C 71    "  q"    cmpb  X9C71
D05E : CE E0 E1    "   "    ldx  #$E0E1
D061 : 80 61    " a"    suba  #$61
        ;
D063 : CF    " "    db  $CF
        ;
D064 : EF BF    "  "    stx  $BF,x
D066 : 8C 62 10    " b "    cpx  #$6210
D069 : 8E 73 1C    " s "    lds  #$731C
D06C : 5C    "\"    incb
        ;
D06D : 38 DC    "8 "    db  $38, $DC
        ;
D06F : F7 F8 E1    "   "    stab  XF8E1
D072 : C0 C1    "  "    subb  #$C1
D074 : E1 CF    "  "    cmpb  $CF,x
        ;
D076 : E3 8F    "  "    db  $E3, $8F
        ;
D078 : 0E    " "    cli
D079 : 27 1C    "' "    beq  LD097
D07B : 78 EC E6    "x  "    asl  XECE6
        ;
D07E : 18 04    "  "    db  $18, $04
        ;
D080 : 73 BC F3    "s  "    com  XBCF3
D083 : B9 61 E1    " a "    adca  X61E1
        ;
D086 : C7    " "    db  $C7
        ;
D087 : 31    "1"    ins
        ;
D088 : 83    " "    db  $83
        ;
D089 : 8E 33 8E    " 3 "    lds  #$338E
D08C : 3E    ">"    wai
D08D : 37    "7"    pshb
        ;
D08E : 1C    " "    db  $1C
        ;
D08F : 2E 18    ". "    bgt  LD0A9
D091 : 46    "F"    rora
        ;
D092 : 38    "8"    db  $38
        ;
D093 : 79 EC 71    "y q"    rol  XEC71
D096 : F1 C3 E3    "   "    cmpb  XC3E3
        ;
D099 : 83 83 8F    "   "    db  $83, $83, $8F
        ;
D09C : 07    " "    tpa
        ;
D09D : 8F    " "    db  $8F
        ;
D09E : 0E    " "    cli
D09F : 3F    "?"    swi
        ;
D0A0 : 1E 38 38 3C  " 88<"    db  $1E, $38, $38, $3C
D0A4 : 38    "8"    db  $38
        ;
D0A5 : F1 F0 F1    "   "    cmpb  XF0F1
D0A8 : E7 A1    "  "    stab  $A1,x
D0AA : C4 E1    "  "    andb  #$E1
        ;
D0AC : 83    " "    db  $83
        ;
D0AD : 8E 67 8E    " g "    lds  #$678E
D0B0 : 47    "G"    asra
D0B1 : 0E    " "    cli
        ;
D0B2 : 1E    " "    db  $1E
        ;
D0B3 : 4F    "O"    clra
        ;
D0B4 : 1C 3C 62    " <b"    db  $1C, $3C, $62
        ;
D0B7 : BC F8 E3    "   "    cpx  XF8E3
D0BA : C9 C1    "  "    adcb  #$C1
D0BC : C2 C3    "  "    sbcb  #$C3
        ;
D0BE : 8F 8F C7 18  "    "    db  $8F, $8F, $C7, $18
        ;
D0C2 : C4 15    "  "    andb  #$15
D0C4 : 33    "3"    pulb
D0C5 : 8E 67 38    " g8"    lds  #$6738
D0C8 : DE 7E    " ~"    ldx  X007E
        ;
D0CA : 38 E3 02    "8  "    db  $38, $E3, $02
        ;
D0CD : C4 E3    "  "    andb  #$E3
D0CF : C6 DC    "  "    ldab  #$DC
        ;
D0D1 : E3 CF    "  "    db  $E3, $CF
        ;
D0D3 : 0C    " "    clc
D0D4 : 0C    " "    clc
D0D5 : 67 1C    "g "    asr  $1C,x
        ;
D0D7 : 3C    "<"    db  $3C
        ;
D0D8 : 63 18    "c "    com  $18,x
D0DA : FF E7 B8    "   "    stx  XE7B8
D0DD : E2 02    "  "    sbcb  $02,x
D0DF : 08    " "    inx
        ;
D0E0 : C7 1F    "  "    db  $C7, $1F
        ;
D0E2 : BE 79 C6    " y "    lds  X79C6
D0E5 : 09    " "    dex
        ;
D0E6 : 1C 8F    "  "    db  $1C, $8F
        ;
D0E8 : 39    "9"    rts
        ;
D0E9 : 1C    " "    db  $1C
        ;
D0EA        LD0EA:
D0EA : 60 1C    "` "    neg  $1C,x
        ;
D0EC : FC    " "    db  $FC
        ;
D0ED : FF F0 C0    "   "    stx  XF0C0
D0F0 : 81 C7    "  "    cmpa  #$C7
D0F2 : 0E    " "    cli
        ;
D0F3 : E3 CF    "  "    db  $E3, $CF
        ;
D0F5 : 27 06    "' "    beq  LD0FD
D0F7 : 0E    " "    cli
D0F8 : 67 9F    "g "    asr  $9F,x
D0FA : C4 C3    "  "    andb  #$C3
D0FC : 08    " "    inx
        ;
D0FD        LD0FD:
D0FD : C7    " "    db  $C7
        ;
D0FE : 3F    "?"    swi
D0FF : FE 73 08    " s "    ldx  X7308
        ;
D102 : 02 C7 1E 7B  "   {"    db  $02, $C7, $1E, $7B
        ;
D106 : C6 18    "  "    ldab  #$18
        ;
D108 : 61    "a"    db  $61
        ;
D109 : 9E 7F    "  "    lds  X007F
        ;
D10B : 3C    "<"    db  $3C
        ;
D10C : E2 00    "  "    sbcb  $00,x
D10E : 11    " "    cba
D10F : F7 FB E7    "   "    stab  XFBE7
D112 : 10    " "    sba
D113 : 22 C7    "" "    bhi  LD0DC
D115 : 17    " "    tba
        ;
D116 : 3D C7    "= "    db  $3D, $C7
        ;
D118 : 10    " "    sba
        ;
D119 : 18 E3    "  "    db  $18, $E3
        ;
D11B : 3F    "?"    swi
D11C : DE 78    " x"    ldx  X0078
        ;
D11E : 18    " "    db  $18
        ;
D11F : 60 8C    "` "    neg  $8C,x
D121 : 7F F7 CC    "   "    clr  XF7CC
        ;
D124 : 61    "a"    db  $61
        ;
D125 : 84 58    " X"    anda  #$58
D127 : E7 73    " s"    stab  $73,x
D129 : 10    " "    sba
D12A : C6 18    "  "    ldab  #$18
D12C : F7 EF 66    "  f"    stab  XEF66
D12F : 20 30    " 0"    bra  LD161
        ;
D131 : 44    "D"    lsra
        ;
D132 : 7B FD    "{ "    db  $7B, $FD
        ;
D134 : EE 31    " 1"    ldx  $31,x
D136 : 84 63    " c"    anda  #$63
D138 : 33    "3"    pulb
D139 : 8E E3 88    "   "    lds  #$E388
D13C : C6 19    "  "    ldab  #$19
D13E : 9E F7    "  "    lds  X00F7
D140 : 9C 60    " `"    cpx  X0060
D142 : 06    " "    tap
D143 : 31    "1"    ins
D144 : 9F DE    "  "    sts  X00DE
D146 : 7E 9C 44    "~ D"    jmp  L9C44
        ;
D149 : 61    "a"    db  $61
        ;
D14A : 8D 0E    "  "    bsr  LD15A
D14C : 23 9C    "# "    bls  LD0EA
D14E : 67 3C    "g<"    asr  $3C,x
        ;
D150 : FC    " "    db  $FC
        ;
D151 : 70 CE 21    "p !"    neg  XCE21
D154 : 0C    " "    clc
D155 : 63 BD    "c "    com  $BD,x
D157 : EF 73    " s"    stx  $73,x
        ;
D159 : 18    " "    db  $18
        ;
D15A        LD15A:
D15A : C6 30    " 0"    ldab  #$30
D15C : C4 E1    "  "    andb  #$E1
D15E : 70 E3 59    "p Y"    neg  XE359
        ;
D161        LD161:
D161 : E3 CF    "  "    db  $E3, $CF
        ;
D163 : 33    "3"    pulb
        ;
D164 : C3 04    "  "    db  $C3, $04
        ;
D166 : 09    " "    dex
D167 : 0F    " "    sei
D168 : 3F    "?"    swi
D169 : BF F1 73    "  s"    sts  XF173
D16C : 08    " "    inx
D16D : 30    "0"    tsx
        ;
D16E : 62 3C    "b<"    db  $62, $3C
        ;
D170 : 73 F1 E3    "s  "    com  XF1E3
D173 : 43    "C"    coma
D174 : A9 E3    "  "    adca  $E3,x
        ;
D176 : C3    " "    db  $C3
        ;
D177 : 81 06    "  "    cmpa  #$06
D179 : 27 9F    "' "    beq  LD11A
D17B : FF 39 8E    " 9 "    stx  X398E
        ;
D17E : 00 18    "  "    db  $00, $18
        ;
D180 : C6 39    " 9"    ldab  #$39
        ;
D182 : FC    " "    db  $FC
        ;
D183 : E7 38    " 8"    stab  $38,x
D185 : C6 63    " c"    ldab  #$63
        ;
D187 : 38 E3 00 C7  "8   "    db  $38, $E3, $00, $C7
D18B : 13    " "    db  $13
        ;
D18C : DF EF    "  "    stx  X00EF
        ;
D18E : 3D    "="    db  $3D
        ;
D18F : 8C 00 21    "  !"    cpx  #$0021
D192 : 4C    "L"    inca
D193 : 7C F7 73    "| s"    inc  XF773
D196 : 9C 71    " q"    cpx  X0071
D198 : 89 8D    "  "    adca  #$8D
D19A : 0E    " "    cli
D19B : 10    " "    sba
        ;
D19C : 71    "q"    db  $71
        ;
D19D : 8E 73 FF    " s "    lds  #$73FF
D1A0 : E7 31    " 1"    stab  $31,x
D1A2 : 84 20    "  "    anda  #$20
D1A4 : 31    "1"    ins
D1A5 : 8E 7B F7    " { "    lds  #$7BF7
D1A8 : D7 14    "  "    stab  X0014
D1AA : C6 11    "  "    ldab  #$11
        ;
D1AC : 1C    " "    db  $1C
        ;
D1AD : 49    "I"    rola
D1AE : 0E    " "    cli
        ;
D1AF : 38    "8"    db  $38
        ;
D1B0 : EE 7F    "  "    ldx  $7F,x
D1B2 : BC E6 31    "  1"    cpx  XE631
D1B5 : 08    " "    inx
D1B6 : 60 18    "` "    neg  $18,x
D1B8 : EE F7    "  "    ldx  $F7,x
D1BA : BC E6 31    "  1"    cpx  XE631
D1BD : 01    " "    nop
D1BE : 46    "F"    rora
D1BF : 73 BE 38    "s 8"    com  XBE38
D1C2 : C6 33    " 3"    ldab  #$33
D1C4 : DE FF    "  "    ldx  X00FF
        ;
D1C6 : 38    "8"    db  $38
        ;
D1C7 : 10    " "    sba
D1C8 : 40    "@"    nega
        ;
D1C9 : 18    " "    db  $18
        ;
D1CA : E7 FF    "  "    stab  $FF,x
D1CC : F1 C2 80    "   "    cmpb  XC280
D1CF : 86 33    " 3"    ldaa  #$33
D1D1 : DF 3E    " >"    stx  X003E
        ;
D1D3 : 38 62    "8b"    db  $38, $62
        ;
D1D5 : 11    " "    cba
D1D6 : EF E7    "  "    stx  $E7,x
D1D8 : BC C2 00    "   "    cpx  XC200
D1DB : 0C    " "    clc
D1DC : 67 BF    "g "    asr  $BF,x
        ;
D1DE : FC 71 18 02  " q  "    db  $FC, $71, $18, $02
        ;
D1E2 : 37    "7"    pshb
D1E3 : BD F7 14    "   "    jsr  LF714
D1E6 : 10    " "    sba
D1E7 : 63 8E    "c "    com  $8E,x
D1E9 : F7 FF 1C    "   "    stab  XFF1C
        ;
D1EC : 03    " "    db  $03
        ;
D1ED : 08    " "    inx
        ;
D1EE : 3A    ":"    db  $3A
        ;
D1EF : EF 38    " 8"    stx  $38,x
D1F1 : E2 30    " 0"    sbcb  $30,x
D1F3 : 80 E7    "  "    suba  #$E7
D1F5 : 73 FD CE    "s  "    com  XFDCE
        ;
D1F8 : 03    " "    db  $03
        ;
D1F9 : 08    " "    inx
D1FA : 63 E7    "c "    com  $E7,x
        ;
D1FC : 3D    "="    db  $3D
        ;
D1FD : E7 31    " 1"    stab  $31,x
D1FF : C6 87    "  "    ldab  #$87
D201 : 19    " "    daa
        ;
D202 : 18    " "    db  $18
        ;
D203 : 39    "9"    rts
        ;
D204 : 31    "1"    ins
D205 : 98 E7    "  "    eora  X00E7
        ;
D207 : 3D    "="    db  $3D
        ;
D208 : E7 C7    "  "    stab  $C7,x
D20A : 06    " "    tap
D20B : 07    " "    tpa
D20C : 0C    " "    clc
D20D : 2E 39    ".9"    bgt  LD248
D20F : 9C 7F    "  "    cpx  X007F
D211 : F9 E4 70    "  p"    adcb  XE470
        ;
D214 : 00    " "    db  $00
        ;
D215 : E1 30    " 0"    cmpb  $30,x
D217 : E7 DD    "  "    stab  $DD,x
        ;
D219 : CF 87    "  "    db  $CF, $87
        ;
D21B : 8E 8E 0C    "   "    lds  #$8E0C
        ;
D21E : 1C 38    " 8"    db  $1C, $38
        ;
D220 : 9C 79    " y"    cpx  X0079
        ;
D222 : FC    " "    db  $FC
        ;
D223 : FA F3 98    "   "    orab  XF398
D226 : 60 C1    "` "    neg  $C1,x
D228 : 10    " "    sba
        ;
D229 : C3 C7    "  "    db  $C3, $C7
        ;
D22B : DF 9F    "  "    stx  X009F
        ;
D22D : C7 18    "  "    db  $C7, $18
        ;
D22F : 0C    " "    clc
D230 : 0C    " "    clc
        ;
D231 : 18 3C    " <"    db  $18, $3C
        ;
D233 : FE 79 EE    " y "    ldx  X79EE
D236 : 63 61    "ca"    com  $61,x
D238 : C6 63    " c"    ldab  #$63
D23A : 09    " "    dex
D23B : C4 62    " b"    andb  #$62
D23D : 39    "9"    rts
        ;
D23E : EF 7F    "  "    stx  $7F,x
D240 : B9 C4 04    "   "    adca  XC404
D243 : 01    " "    nop
        ;
D244 : 18    " "    db  $18
        ;
D245 : 79 FF BC    "y  "    rol  XFFBC
D248        LD248:
D248 : E4 71    " q"    andb  $71,x
D24A : 80 E3    "  "    suba  #$E3
D24C : 39    "9"    rts
        ;
D24D : CF 71    " q"    db  $CF, $71
        ;
D24F : 89 11    "  "    adca  #$11
D251 : 8E 73 BC    " s "    lds  #$73BC
D254 : E6 31    " 1"    ldab  $31,x
D256 : 80 23    " #"    suba  #$23
D258 : 9B FF    "  "    adda  X00FF
D25A : 79 DC 60    "y `"    rol  XDC60
D25D : 84 11    "  "    anda  #$11
D25F : 6E 7E    "n~"    jmp  $7E,x            ;INFO: index jump
        ;
D261 : 7B    "{"    db  $7B
        ;
D262 : CE 18 31    "  1"    ldx  #$1831
D265 : 0C    " "    clc
D266 : 73 D9 C6    "s  "    com  XD9C6
D269 : 73 18 C6    "s  "    com  X18C6
D26C : 33    "3"    pulb
D26D : 9F CE    "  "    sts  X00CE
        ;
D26F : 71    "q"    db  $71
        ;
D270 : 8C 42 1C    " B "    cpx  #$421C
D273 : 6C 7F    "l "    inc  $7F,x
D275 : BC F3 81    "   "    cpx  XF381
D278 : 10    " "    sba
D279 : C2 A7    "  "    sbcb  #$A7
D27B : 73 CE E3    "s  "    com  XCEE3
        ;
D27E : 00 87    "  "    db  $00, $87
        ;
D280 : 3E    ">"    wai
D281 : 77 3C AB    "w< "    asr  X3CAB
D284 : 10    " "    sba
        ;
D285 : 18    " "    db  $18
        ;
D286 : F2 DE 39    "  9"    sbcb  XDE39
D289 : C6 62    " b"    ldab  #$62
        ;
D28B : 71 C7    "q "    db  $71, $C7
        ;
D28D : A5 C1    "  "    bita  $C1,x
        ;
D28F : C7 18 C7 1D  "    "    db  $C7, $18, $C7, $1D
D293 : 8F 3C 1C 62  " < b"    db  $8F, $3C, $1C, $62
D297 : 38    "8"    db  $38
        ;
D298 : C6 78    " x"    ldab  #$78
D29A : F7 E5 60    "  `"    stab  XE560
D29D : E1 01    "  "    cmpb  $01,x
        ;
D29F : C7    " "    db  $C7
        ;
D2A0 : 73 DF C7    "s  "    com  XDFC7
D2A3 : 11    " "    cba
D2A4 : 07    " "    tpa
D2A5 : 0E    " "    cli
D2A6 : 33    "3"    pulb
        ;
D2A7 : 1E    " "    db  $1E
        ;
D2A8 : 7E 39 98    "~9 "    jmp  L3998
D2AB : 20 70    " p"    bra  LD31D
        ;
D2AD : E5 FE    "  "    bitb  $FE,x
        ;
D2AF : F3 CD 42 03  "  B "    db  $F3, $CD, $42, $03
        ;
D2B3 : 0C    " "    clc
D2B4 : 47    "G"    asra
D2B5 : 3F    "?"    swi
D2B6 : FE E7 10    "   "    ldx  XE710
D2B9 : 08    " "    inx
D2BA        LD2BA:
D2BA : 43    "C"    coma
        ;
D2BB : 1C    " "    db  $1C
        ;
D2BC : FE FB 52    "  R"    ldx  XFB52
        ;
D2BF : 18 04    "  "    db  $18, $04
        ;
D2C1 : 31    "1"    ins
        ;
D2C2 : F3    " "    db  $F3
        ;
D2C3 : EF 79    " y"    stx  $79,x
D2C5 : C5 84    "  "    bitb  #$84
        ;
D2C7 : 21    "!"    db  $21
        ;
D2C8 : 8C 77 3D    " w="    cpx  #$773D
D2CB : EE 71    " q"    ldx  $71,x
D2CD : 8C 10 42    "  B"    cpx  #$1042
D2D0 : D9 F9    "  "    adcb  X00F9
D2D2 : E7 71    " q"    stab  $71,x
D2D4 : 88 43    " C"    eora  #$43
D2D6 : 0C    " "    clc
D2D7 : E7 9F    "  "    stab  $9F,x
D2D9 : BC E3 8C    "   "    cpx  XE38C
D2DC : 63 08    "c "    com  $08,x
D2DE : 8E 73 9C    " s "    lds  #$739C
D2E1 : FE 71 9C    " q "    ldx  X719C
        ;
D2E4 : 61    "a"    db  $61
        ;
D2E5 : 08    " "    inx
        ;
D2E6 : E3 E3    "  "    db  $E3, $E3
        ;
D2E8 : CE C7 18    "   "    ldx  #$C718
D2EB : 86 31    " 1"    ldaa  #$31
D2ED : 4D    "M"    tsta
D2EE : DF 3D    " ="    stx  X003D
D2F0 : EE 61    " a"    ldx  $61,x
D2F2 : 20 C6    "  "    bra  LD2BA
        ;
D2F4 : 63 9C    "c "    com  $9C,x
D2F6 : E7 31    " 1"    stab  $31,x
D2F8 : CE 47 19    " G "    ldx  #$4719
        ;
D2FB : 1E    " "    db  $1E
        ;
D2FC : 3F    "?"    swi
        ;
D2FD : 38 38 61    "88a"    db  $38, $38, $61
        ;
D300 : 30    "0"    tsx
D301 : E4 63    " c"    andb  $63,x
D303 : B1 DE F3    "   "    cmpa  XDEF3
        ;
D306 : D3    " "    db  $D3
        ;
D307 : C5 43    " C"    bitb  #$43
D309 : 86 8E    "  "    ldaa  #$8E
D30B : 0E    " "    cli
        ;
D30C : 38    "8"    db  $38
        ;
D30D : CE 36 57    " 6W"    ldx  #$3657
D310 : 9E 77    " w"    lds  X0077
        ;
D312 : 38    "8"    db  $38
        ;
D313 : 8C 30 98    " 0 "    cpx  #$3098
        ;
D316 : E3 18 E3 9D  "    "    db  $E3, $18, $E3, $9D
        ;
D31A : B9 E3 30    "  0"    adca  XE330
        ;
D31D        LD31D:
D31D : C7    " "    db  $C7
        ;
D31E : 31    "1"    ins
        ;
D31F : C7    " "    db  $C7
        ;
D320 : 73 C7 8E    "s  "    com  XC78E
D323 : 63 08    "c "    com  $08,x
D325 : 8E 33 1C    " 3 "    lds  #$331C
D328 : CE 7B BC    " { "    ldx  #$7BBC
D32B : F7 30 C0    " 0 "    stab  X30C0
        ;
D32E : 62 18 C7    "b  "    db  $62, $18, $C7
        ;
D331 : 47    "G"    asra
D332 : 33    "3"    pulb
D333 : 8E DC F3    "   "    lds  #$DCF3
D336 : 9C F1    "  "    cpx  X00F1
D338 : 82 08    "  "    sbca  #$08
D33A : 63 5B    "c["    com  $5B,x
D33C : EE F3    "  "    ldx  $F3,x
D33E : 8C 61 8A    " a "    cpx  #$618A
        ;
D341 : 38 E3    "8 "    db  $38, $E3
        ;
D343 : 8E 33 8E    " 3 "    lds  #$338E
D346 : 73 E7 19    "s  "    com  XE719
        ;
D349 : C7    " "    db  $C7
        ;
D34A : 11    " "    cba
        ;
D34B : 12    " "    db  $12
        ;
D34C : 43    "C"    coma
D34D : 8C 67 3F    " g?"    cpx  #$673F
D350 : DF 7B    " {"    stx  X007B
D352 : 8C 44 18    " D "    cpx  #$4418
D355 : 8C 67 99    " g "    cpx  #$6799
        ;
D358 : CF 71    " q"    db  $CF, $71
        ;
D35A : C6 19    "  "    ldab  #$19
D35C : 8E 4F 39    " O9"    lds  #$4F39
D35F : CE 73 08    " s "    ldx  #$7308
        ;
D362 : 18    " "    db  $18
        ;
D363 : 46    "F"    rora
D364 : 6E F5    "n "    jmp  $F5,x            ;INFO: index jump
        ;
D366 : F5 E5 C1    "   "    bitb  XE5C1
D369 : 80 C2    "  "    suba  #$C2
D36B : 33    "3"    pulb
D36C : DF EF    "  "    stx  X00EF
D36E : AB 18    "  "    adda  $18,x
        ;
D370 : 03 04 3C    "  <"    db  $03, $04, $3C
        ;
D373 : 77 3D EE    "w= "    asr  X3DEE
D376 : 73 10 42    "s B"    com  X1042
D379 : 31    "1"    ins
D37A : 9C E7    "  "    cpx  X00E7
D37C : E5 CB    "  "    bitb  $CB,x
D37E : 43    "C"    coma
D37F : 08    " "    inx
        ;
D380 : A3    " "    db  $A3
        ;
D381 : 97 BB    "  "    staa  X00BB
D383 : CE 63 0C    " c "    ldx  #$630C
D386 : 10    " "    sba
D387 : 6A B9    "j "    dec  $B9,x
D389 : F9 F1 E2    "   "    adcb  XF1E2
D38C : 70 C2 E3    "p  "    neg  XC2E3
D38F : 99 C7    "  "    adca  X00C7
D391 : 99 4E    " N"    adca  X004E
D393 : 67 8C    "g "    asr  $8C,x
D395 : 67 18    "g "    asr  $18,x
        ;
D397 : CC    " "    db  $CC
        ;
D398 : 63 1C    "c "    com  $1C,x
D39A : 73 A8 D0    "s  "    com  XA8D0
D39D : E7 1C    "  "    stab  $1C,x
D39F : E7 39    " 9"    stab  $39,x
D3A1 : 54    "T"    lsrb
        ;
D3A2 : 61 13 1C    "a  "    db  $61, $13, $1C
        ;
D3A5 : EF 39    " 9"    stx  $39,x
        ;
D3A7 : CC 71    " q"    db  $CC, $71
        ;
D3A9 : B1 8C 63    "  c"    cmpa  X8C63
D3AC : 8C 67 73    " gs"    cpx  #$6773
D3AF : BC E3 30    "  0"    cpx  XE330
D3B2 : 10    " "    sba
D3B3 : 63 39    "c9"    com  $39,x
D3B5 : EF 77    " w"    stx  $77,x
D3B7 : 39    "9"    rts
        ;
D3B8 : 84 06    "  "    anda  #$06
        ;
D3BA : 1C    " "    db  $1C
        ;
D3BB : 76 BB 59    "v Y"    ror  XBB59
D3BE : 96 19    "  "    ldaa  X0019
D3C0 : 8C 63 8F    " c "    cpx  #$638F
        ;
D3C3 : 3C    "<"    db  $3C
        ;
D3C4 : E6 8C    "  "    ldab  $8C,x
D3C6 : 43    "C"    coma
        ;
D3C7 : 18 C7 7B    "  {"    db  $18, $C7, $7B
        ;
D3CA : 79 CF 38    "y 8"    rol  XCF38
D3CD : C6 31    " 1"    ldab  #$31
D3CF : 09    " "    dex
        ;
D3D0 : 4E    "N"    db  $4E
        ;
D3D1 : 39    "9"    rts
        ;
D3D2 : DE 79    " y"    ldx  X0079
        ;
D3D4 : 71 62    "qb"    db  $71, $62
        ;
D3D6 : 98 62    " b"    eora  X0062
D3D8 : 31    "1"    ins
        ;
D3D9 : CD    " "    db  $CD
        ;
D3DA : E7 79    " y"    stab  $79,x
        ;
D3DC : C7    " "    db  $C7
        ;
D3DD : 23 86    "# "    bls  LD365
D3DF : 0E    " "    cli
D3E0 : 33    "3"    pulb
D3E1 : 8E 67 3D    " g="    lds  #$673D
        ;
D3E4 : 1C 71    " q"    db  $1C, $71
        ;
D3E6 : 9C 70    " p"    cpx  X0070
        ;
D3E8 : C7 38    " 8"    db  $C7, $38
        ;
D3EA : E7 53    " S"    stab  $53,x
D3EC : 8C C3 23    "  #"    cpx  #$C323
D3EF : 99 C7    "  "    adca  X00C7
D3F1 : 3B    ";"    rti
        ;
D3F2 : 1C    " "    db  $1C
        ;
D3F3 : 4A    "J"    deca
D3F4 : 33    "3"    pulb
        ;
D3F5 : 1C    " "    db  $1C
        ;
D3F6 : F6 E7 38    "  8"    ldab  XE738
D3F9 : E1 48    " H"    cmpb  $48,x
D3FB : C2 A1    "  "    sbcb  #$A1
D3FD : C8 E3    "  "    eorb  #$E3
D3FF : BD E7 47    "  G"    jsr  LE747
D402 : 0D    " "    sec
D403 : 46    "F"    rora
        ;
D404 : 13 1C    "  "    db  $13, $1C
        ;
D406 : AE 73    " s"    lds  $73,x
D408 : 9C 71    " q"    cpx  X0071
D40A : 29 30    ")0"    bvs  LD43C
D40C : E7 55    " U"    stab  $55,x
D40E : D7 C7    "  "    stab  X00C7
D410 : 86 29    " )"    ldaa  #$29
D412 : 86 A7    "  "    ldaa  #$A7
D414 : 33    "3"    pulb
D415 : CE 67 1C    " g "    ldx  #$671C
        ;
D418 : 62    "b"    db  $62
        ;
D419 : 2C 71    ",q"    bge  LD48C
D41B : 9C F8    "  "    cpx  X00F8
        ;
D41D : F3 18 C3 A3  "    "    db  $F3, $18, $C3, $A3
D421 : 1C    " "    db  $1C
        ;
D422 : E7 31    " 1"    stab  $31,x
D424 : 9C 4E    " N"    cpx  X004E
D426 : 31    "1"    ins
        ;
D427 : CC    " "    db  $CC
        ;
D428 : E7 31    " 1"    stab  $31,x
D42A : 8C E3 19    "   "    cpx  #$E319
D42D : CE C7 1C    "   "    ldx  #$C71C
D430 : C6 27    " '"    ldab  #$27
        ;
D432 : 18 E3    "  "    db  $18, $E3
        ;
D434 : 39    "9"    rts
        ;
D435 : F4 E3 98    "   "    andb  XE398
D438 : C2 A3    "  "    sbcb  #$A3
D43A : 2A E7    "* "    bpl  LD423
        ;
D43C        LD43C:
D43C : 9D    " "    db  $9D
        ;
D43D : CE 43 18    " C "    ldx  #$4318
D440 : 86 3B    " ;"    ldaa  #$3B
        ;
D442 : 3D    "="    db  $3D
        ;
D443 : CE 39 51    " 9Q"    ldx  #$3951
        ;
D446 : 4E    "N"    db  $4E
        ;
D447 : 30    "0"    tsx
D448 : EA 79    " y"    orab  $79,x
        ;
D44A : E3    " "    db  $E3
        ;
D44B : 30    "0"    tsx
D44C : C2 E3    "  "    sbcb  #$E3
D44E : 9A E7    "  "    oraa  X00E7
D450 : 53    "S"    comb
D451 : 8C 47 0A    " G "    cpx  #$470A
D454 : 8E 73 9C    " s "    lds  #$739C
D457 : 73 99 9C    "s  "    com  X999C
D45A : 39    "9"    rts
        ;
D45B : 54    "T"    lsrb
D45C : 68 B1    "h "    asl  $B1,x
        ;
D45E        LD45E:
D45E : 65    "e"    db  $65
        ;
D45F : 78 E7 39    "x 9"    asl  XE739
        ;
D462 : CD    " "    db  $CD
        ;
D463 : 6A 71    "jq"    dec  $71,x
D465 : 84 A3    "  "    anda  #$A3
        ;
D467 : 87    " "    db  $87
        ;
D468 : 2F 1C    "/ "    ble  LD486
D46A : E7 33    " 3"    stab  $33,x
        ;
D46C : 1C    " "    db  $1C
        ;
D46D : 2A 33    "*3"    bpl  LD4A2
        ;
D46F : 38    "8"    db  $38
        ;
D470 : CE 76 39    " v9"    ldx  #$7639
D473 : 8C 71 95    " q "    cpx  #$7195
        ;
D476 : 55    "U"    db  $55
        ;
D477 : 67 3A    "g:"    asr  $3A,x
        ;
D479 : C7 1C    "  "    db  $C7, $1C
        ;
D47B        LD47B:
D47B : 8A 96    "  "    oraa  #$96
D47D : 39    "9"    rts
        ;
D47E : AE 7C    " |"    lds  $7C,x
D480 : 70 C8 62    "p b"    neg  XC862
D483 : D1 CF    "  "    cmpb  X00CF
        ;
D485 : 6B C7    "k "    db  $6B, $C7
        ;
D487 : 53    "S"    comb
D488 : 06    " "    tap
D489 : 16    " "    tab
        ;
D48A : 1A    " "    db  $1A
        ;
D48B : 9C F7    "  "    cpx  X00F7
        ;
D48D : 1C    " "    db  $1C
        ;
D48E : 74 58 9C    "tX "    lsr  X589C
D491 : 63 38    "c8"    com  $38,x
D493 : F4 E7 59    "  Y"    andb  XE759
        ;
D496 : 51    "Q"    db  $51
        ;
D497 : 8A 27    " '"    oraa  #$27
D499 : 33    "3"    pulb
        ;
D49A : DC    " "    db  $DC
        ;
D49B : F7 1A 18    "   "    stab  X1A18
        ;
D49E : 51    "Q"    db  $51
        ;
D49F : 8D 6B    " k"    bsr  LD50C
D4A1 : BB AD 52    "  R"    adda  XAD52
D4A4 : 90 8C    "  "    suba  X008C
        ;
D4A6 : 65    "e"    db  $65
        ;
D4A7 : 39    "9"    rts
        ;
D4A8 : AC F3    "  "    cpx  $F3,x
        ;
D4AA : 3C C7    "< "    db  $3C, $C7
        ;
D4AC : 0C    " "    clc
D4AD : 31    "1"    ins
        ;
D4AE : C7    " "    db  $C7
        ;
D4AF : 39    "9"    rts
        ;
D4B0 : D6 B4    "  "    ldab  X00B4
D4B2 : C5 45    " E"    bitb  #$45
D4B4 : 23 8E    "# "    bls  LD444
D4B6 : 73 9D CE    "s  "    com  X9DCE
D4B9 : 33    "3"    pulb
D4BA : 0C    " "    clc
D4BB : 66 31    "f1"    ror  $31,x
D4BD : 9C E7    "  "    cpx  X00E7
        ;
D4BF : 38    "8"    db  $38
        ;
D4C0 : E6 38    " 8"    ldab  $38,x
D4C2 : CA AA    "  "    orab  #$AA
D4C4 : B8 C6 71    "  q"    eora  XC671
D4C7 : AA C6    "  "    oraa  $C6,x
D4C9 : 63 8B    "c "    com  $8B,x
D4CB : 8E 73 8E    " s "    lds  #$738E
D4CE : 2A 8E    "* "    bpl  LD45E
D4D0 : 2D 36    "-6"    blt  LD508
D4D2 : 9E 3C    " <"    lds  X003C
        ;
D4D4 : E3    " "    db  $E3
        ;
D4D5 : 28 A4    "( "    bvc  LD47B
D4D7 : A9 A5    "  "    adca  $A5,x
D4D9 : CE E7 99    "   "    ldx  #$E799
D4DC : C5 45    " E"    bitb  #$45
        ;
D4DE : 14 C7    "  "    db  $14, $C7
        ;
D4E0 : 35    "5"    txs
        ;
D4E1 : 75    "u"    db  $75
        ;
D4E2 : 8E 32 99    " 2 "    lds  #$3299
        ;
D4E5 : 1C    " "    db  $1C
        ;
D4E6 : 73 9C E5    "s  "    com  X9CE5
        ;
D4E9 : 52    "R"    db  $52
        ;
D4EA : 98 C5    "  "    eora  X00C5
        ;
D4EC : 51    "Q"    db  $51
        ;
D4ED : CE 5B A7    " [ "    ldx  #$5BA7
D4F0 : 2B 15    "+ "    bmi  LD507
D4F2 : 4C    "L"    inca
        ;
D4F3 : 52    "R"    db  $52
        ;
D4F4        LD4F4:
D4F4 : AB AE    "  "    adda  $AE,x
D4F6 : AB 55    " U"    adda  $55,x
D4F8 : 2A 53    "*S"    bpl  LD54D
D4FA        LD4FA:
D4FA : 8E 31 8E    " 1 "    lds  #$318E
        ;
D4FD : 38    "8"    db  $38
        ;
D4FE : E6 74    " t"    ldab  $74,x
D500        LD500:
D500 : A9 54    " T"    adca  $54,x
        ;
D502 : 72    "r"    db  $72
        ;
D503 : D5 C6    "  "    bitb  X00C6
D505 : 63 9C    "c "    com  $9C,x
D507        LD507:
D507        XD507:
D507 : A6 33    " 3"    ldaa  $33,x
D509 : 8C 73 99    " s "    cpx  #$7399
        ;
D50C        LD50C:
D50C : 55    "U"    db  $55
        ;
D50D : 63 38    "c8"    com  $38,x
        ;
D50F : E3    " "    db  $E3
        ;
D510 : 2A E2    "* "    bpl  LD4F4
D512 : E5 CD    "  "    bitb  $CD,x
D514 : 66 98    "f "    ror  $98,x
        ;
D516        LD516:
D516 : C3 1A    "  "    db  $C3, $1A
        ;
D518 : 63 9C    "c "    com  $9C,x
D51A : B6 B5 AC    "   "    ldaa  XB5AC
        ;
D51D : 62    "b"    db  $62
        ;
D51E : A5 28    " ("    bita  $28,x
        ;
D520 : E3    " "    db  $E3
        ;
D521 : 2B 4D    "+M"    bmi  LD570
        ;
D523 : 65    "e"    db  $65
        ;
D524 : 95 63    " c"    bita  X0063
D526 : 2B 5A    "+Z"    bmi  LD582
        ;
D528 : 65 4E 38 C7  "eN8 "    db  $65, $4E, $38, $C7
D52C : 38    "8"    db  $38
        ;
D52D : E5 56    " V"    bitb  $56,x
D52F : 31    "1"    ins
        ;
D530 : CC    " "    db  $CC
        ;
D531 : 73 31 C6    "s1 "    com  X31C6
D534 : 63 8E    "c "    com  $8E,x
D536 : 96 55    " U"    ldaa  X0055
        ;
D538 : 55 3A    "U:"    db  $55, $3A
        ;
D53A : AA 58    " X"    oraa  $58,x
D53C : B1 65 54    " eT"    cmpa  X6554
D53F : B8 E5 71    "  q"    eora  XE571
D542 : D8 E6    "  "    eorb  X00E6
D544 : B1 C5 8B    "   "    cmpa  XC58B
D547 : 53    "S"    comb
D548 : 96 A7    "  "    ldaa  X00A7
D54A : 2A AE    "* "    bpl  LD4FA
D54C : 2C 55    ",U"    bge  LD5A3
        ;
D54E : 1C D3 55    "  U"    db  $1C, $D3, $55
        ;
D551 : 5C    "\"    incb
        ;
D552 : E3 38    " 8"    db  $E3, $38
        ;
D554 : C6 59    " Y"    ldab  #$59
D556 : 69 8C    "i "    rol  $8C,x
        ;
D558 : E3    " "    db  $E3
        ;
D559 : 94 CD    "  "    anda  X00CD
D55B : 53    "S"    comb
D55C : 8E 95 55    "  U"    lds  #$9555
D55F : 96 
;*************************************;
;
D560 : AA    "  "    ldaa  X00AA
D561 : AA AE    "  "    oraa  $AE,x
D563 : 8B 55    " U"    adda  #$55
D565 : 74 55 52    "tUR"    lsr  X5552
D568 : D4 AF    "  "    andb  X00AF
D56A : 2A AA    "* "    bpl  LD516
D56C : 2D 54    "-T"    blt  LD5C2
D56E : E8 BD    "  "    eorb  $BD,x
D570        LD570:
D570 : 8B A5    "  "    adda  #$A5
D572 : 35    "5"    txs
        ;
D573        LD573:
D573 : 55 52 55    "URU"    db  $55, $52, $55
        ;
D576 : 25 75    "%u"    bcs  LD5ED
D578 : 2E 86    ". "    bgt  LD500
D57A : F2 AD A2    "   "    sbcb  XADA2
D57D : E8 5D    " ]"    eorb  $5D,x
        ;
D57F : 04    " "    db  $04
        ;
D580 : B6 FE EA    "   "    ldaa  XFEEA
D583 : A8 84    "  "    eora  $84,x
D585        LD585:
D585 : 4A    "J"    deca
D586        LD586:
D586 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
        ;
D588 : 12    " "    db  $12
        ;
D589 : B5 77 51    " wQ"    bita  X7751
D58C : A4 5D    " ]"    anda  $5D,x
D58E : AF 74    " t"    sts  $74,x
D590 : 6A A8    "j "    dec  $A8,x
D592 : FA 80 EF    "   "    orab  X80EF
D595 : BF AA 10    "   "    sts  XAA10
D598 : 22 D9    "" "    bhi  LD573
        ;
D59A : 55    "U"    db  $55
        ;
D59B : 49    "I"    rola
D59C : 86 B7    "  "    ldaa  #$B7
        ;
D59E : 15 05    "  "    db  $15, $05
        ;
D5A0 : 5A    "Z"    decb
D5A1 : AF B5    "  "    sts  $B5,x
        ;
D5A3        LD5A3:
D5A3 : 38    "8"    db  $38
        ;
D5A4 : 2F E0    "/ "    ble  LD586
D5A6 : 3F    "?"    swi
D5A7 : D7 F8    "  "    stab  X00F8
        ;
D5A9 : 1A 00    "  "    db  $1A, $00
        ;
D5AB : BC F6 A0    "   "    cpx  XF6A0
        ;
D5AE : 05    " "    db  $05
        ;
D5AF : 5F    "_"    clrb
D5B0 : BD 90 0A    "   "    jsr  L900A
D5B3 : AD FD    "  "    jsr  $FD,x            ;INFO: index jump
        ;
D5B5 : 55 00    "U "    db  $55, $00
        ;
D5B7 : 06    " "    tap
D5B8 : 7F FF B0    "   "    clr  XFFB0
        ;
D5BB : 04    " "    db  $04
        ;
D5BC : AB CF    "  "    adda  $CF,x
        ;
D5BE : 42    "B"    db  $42
        ;
D5BF : 06    " "    tap
D5C0 : 0B    " "    sev
D5C1 : 7F B5 00    "   "    clr  XB500
D5C4 : 2D BF    "- "    blt  LD585
D5C6 : FA 20 00    "   "    orab  X2000
D5C9 : 5F    "_"    clrb
D5CA : FF F4 08    "   "    stx  XF408
        ;
D5CD : 52    "R"    db  $52
        ;
D5CE : FA EF 80    "   "    orab  XEF80
        ;
D5D1        LD5D1:
D5D1 : 04    " "    db  $04
        ;
D5D2 : 2F FD    "/ "    ble  LD5D1
D5D4 : 70 00 F5    "p  "    neg  X00F5
D5D7 : FF C0 20    "   "    stx  XC020
D5DA : 23 FF    "# "    bls  LD5DB
D5DC : F9 0A 0A    "   "    adcb  X0A0A
D5DF : FE 77 C0    " w "    ldx  X77C0
D5E2 : 01    " "    nop
D5E3 : 0F    " "    sei
D5E4 : FE BE 00    "   "    ldx  XBE00
D5E7 : 6A BF    "j "    dec  $BF,x
D5E9 : E1 00    "  "    cmpb  $00,x
D5EB : 47    "G"    asra
        ;
D5EC : FD    " "    db  $FD
        ;
D5ED        LD5ED:
D5ED : FE 00 A8    "   "    ldx  X00A8
D5F0 : 3F    "?"    swi
D5F1 : EA F0    "  "    orab  $F0,x
D5F3 : 82 03    "  "    sbca  #$03
D5F5 : FE 5F 00    " _ "    ldx  X5F00
D5F8 : 35    "5"    txs
D5F9 : 5F    "_"    clrb
D5FA : F0 13 01    "   "    subb  X1301
D5FD : FF 5F E0    " _ "    stx  X5FE0
D600 : 31    "1"    ins
D601 : 07    " "    tpa
D602 : E9 7E    " ~"    adcb  $7E,x
        ;
D604 : 02    " "    db  $02
        ;
D605 : 90 7F    "  "    suba  X007F
        ;
D607 : C7    " "    db  $C7
        ;
D608 : E0 07    "  "    subb  $07,x
D60A : 17    " "    tba
        ;
D60B : FC    " "    db  $FC
        ;
D60C : 0E    " "    cli
D60D : 01    " "    nop
D60E : FE 3F 80    " ? "    ldx  X3F80
D611 : F8 1F C0    "   "    eorb  X1FC0
D614 : 7C 07 E0    "|  "    inc  X07E0
D617 : F7 0B 88    "   "    stab  X0B88
        ;
D61A : 1E    " "    db  $1E
        ;
D61B : BD F0 22    "  ""    jsr  LF022
D61E : 43    "C"    coma
D61F : FB 5F 00    " _ "    addb  X5F00
D622 : F0 7F C4    "   "    subb  X7FC4
        ;
D625 : 61    "a"    db  $61
        ;
D626 : 07    " "    tpa
D627 : B6 BD C0    "   "    ldaa  XBDC0
D62A : A0 27    " '"    suba  $27,x
D62C : FE 1E 01    "   "    ldx  X1E01
D62F : F8 7E C0    " ~ "    eorb  X7EC0
D632 : E0 2F    " /"    subb  $2F,x
D634 : CB F8    "  "    addb  #$F8
D636 : 0C    " "    clc
        ;
D637 : 03 FC    "  "    db  $03, $FC
        ;
D639 : 7F 80 70    "  p"    clr  X8070
        ;
D63C : 1F    " "    db  $1F
        ;
D63D : F0 DC 0F    "   "    subb  XDC0F
D640 : F1 7D 00    " } "    cmpb  X7D00
D643 : C0 3F    " ?"    subb  #$3F
D645 : EB D0    "  "    addb  $D0,x
D647 : 0A    " "    clv
D648 : A7 FB    "  "    staa  $FB,x
        ;
D64A : 1C    " "    db  $1C
        ;
D64B : 01    " "    nop
D64C : 2D FF    "- "    blt  LD64D
D64E : A1 04    "  "    cmpa  $04,x
        ;
D650 : 1F    " "    db  $1F
        ;
D651 : FF 7E 00    " ~ "    stx  X7E00
        ;
D654 : 00    " "    db  $00
        ;
D655 : FF F5 40    "  @"    stx  XF540
D658 : 01    " "    nop
D659 : FF FE 80    "   "    stx  XFE80
D65C : 01    " "    nop
D65D : 7F F6 80    "   "    clr  XF680
        ;
D660 : 00    " "    db  $00
        ;
D661 : BF FF E8    "   "    sts  XFFE8
        ;
D664 : 00    " "    db  $00
        ;
D665 : 0F    " "    sei
D666 : FF E8 00    "   "    stx  XE800
        ;
D669 : 02    " "    db  $02
        ;
D66A : FF FF 80    "   "    stx  XFF80
        ;
D66D : 00    " "    db  $00
        ;
D66E : 7F FC 60    "  `"    clr  XFC60
        ;
D671 : 00    " "    db  $00
        ;
D672 : 77 FF F0    "w  "    asr  XFFF0
        ;
D675 : 00 1F    "  "    db  $00, $1F
        ;
D677 : DE FC    "  "    ldx  X00FC
        ;
D679 : 00    " "    db  $00
        ;
D67A : 01    " "    nop
D67B : FF FE 60    "  `"    stx  XFE60
D67E : 01    " "    nop
D67F : BB FB 44    "  D"    adda  XFB44
D682 : 06    " "    tap
D683 : 07    " "    tpa
D684 : FE 7E 14    " ~ "    ldx  X7E14
        ;
D687 : 61 F3 5B    "a ["    db  $61, $F3, $5B
        ;
D68A : 80 18    "  "    suba  #$18
D68C : 5F    "_"    clrb
D68D : F0 FC 13    "   "    subb  XFC13
D690 : C0 CC    "  "    subb  #$CC
D692 : D7 E5    "  "    stab  X00E5
D694 : E0 02    "  "    subb  $02,x
        ;
D696 : 1F FD    "  "    db  $1F, $FD
        ;
D698 : FE 00 41    "  A"    ldx  X0041
        ;
D69B : FC    " "    db  $FC
        ;
D69C : 7F 80 02    "   "    clr  X8002
        ;
D69F : 1F    " "    db  $1F
        ;
D6A0 : FF E0 00    "   "    stx  XE000
        ;
D6A3 : 1F    " "    db  $1F
        ;
D6A4 : FF F8 00    "   "    stx  XF800
        ;
D6A7 : 05    " "    db  $05
        ;
D6A8 : FF FF 40    "  @"    stx  XFF40
        ;
D6AB : 00    " "    db  $00
        ;
D6AC : 3F    "?"    swi
D6AD : FF D0 00    "   "    stx  XD000
D6B0 : 0F    " "    sei
D6B1 : FF F4 00    "   "    stx  XF400
        ;
D6B4 : 03    " "    db  $03
        ;
D6B5 : FF FD 00    "   "    stx  XFD00
        ;
D6B8 : 00    " "    db  $00
        ;
D6B9 : DF FF    "  "    stx  X00FF
D6BB : D0 00    "  "    subb  X0000
D6BD : 0F    " "    sei
D6BE : FF F4 00    "   "    stx  XF400
        ;
D6C1 : 03    " "    db  $03
        ;
D6C2 : FF FD 00    "   "    stx  XFD00
        ;
D6C5 : 00    " "    db  $00
        ;
D6C6 : FF FF 40    "  @"    stx  XFF40
        ;
D6C9 : 00    " "    db  $00
        ;
D6CA : 2F FF    "/ "    ble  LD6CB
D6CC : F8 00 03    "   "    eorb  X0003
D6CF : FF FD 00    "   "    stx  XFD00
        ;
D6D2 : 00    " "    db  $00
        ;
D6D3 : FF FF 00    "   "    stx  XFF00
        ;
D6D6 : 00    " "    db  $00
        ;
D6D7 : FF FF 80    "   "    stx  XFF80
        ;
D6DA : 00 87    "  "    db  $00, $87
        ;
D6DC : FF FC 00    "   "    stx  XFC00
D6DF : 48    "H"    asla
D6E0 : FF F3 C0    "   "    stx  XF3C0
        ;
D6E3 : 03 87 FC 1D  "    "    db  $03, $87, $FC, $1D
D6E7 : 02    " "    db  $02
        ;
D6E8 : 7E B7 C4    "~  "    jmp  LB7C4
        ;
D6EB : 4A    "J"    deca
D6EC : 0F    " "    sei
D6ED : 01    " "    nop
D6EE : F8 FC E7    "   "    eorb  XFCE7
D6F1 : C1 E0    "  "    cmpb  #$E0
        ;
D6F3 : 1F 87    "  "    db  $1F, $87
        ;
D6F5 : F0 10 0F    "   "    subb  X100F
D6F8 : F9 F5 04    "   "    adcb  XF504
D6FB : A0 FF    "  "    suba  $FF,x
D6FD : DB A0    "  "    addb  X00A0
        ;
D6FF : 00 C3    "  "    db  $00, $C3
        ;
D701 : FF FF 00    "   "    stx  XFF00
        ;
D704 : 00    " "    db  $00
        ;
D705 : FF FF 00    "   "    stx  XFF00
        ;
D708 : 00    " "    db  $00
        ;
D709 : 3F    "?"    swi
D70A : FF E0 02    "   "    stx  XE002
D70D : 17    " "    tba
D70E : FF F4 00    "   "    stx  XF400
        ;
D711 : 00    " "    db  $00
        ;
D712 : FF FF C0    "   "    stx  XFFC0
        ;
D715 : 00    " "    db  $00
        ;
D716 : 7D FF 89    "}  "    tst  XFF89
        ;
D719 : 00    " "    db  $00
        ;
D71A : 08    " "    inx
D71B : FF FD 40    "  @"    stx  XFD40
D71E : 90 7F    "  "    suba  X007F
D720 : E7 E0    "  "    stab  $E0,x
        ;
D722 : 00    " "    db  $00
        ;
D723 : 17    " "    tba
D724 : DF FC    "  "    stx  X00FC
        ;
D726        LD726:
D726 : 1E 03    "  "    db  $1E, $03
        ;
D728 : 74 3F 07    "t? "    lsr  X3F07
D72B : C0 34    " 4"    subb  #$34
        ;
D72D : 1F    " "    db  $1F
        ;
D72E : BE F0 30    "  0"    lds  XF030
        ;
D731 : 3A D3    ": "    db  $3A, $D3
        ;
D733 : F8 C0 00    "   "    eorb  XC000
D736 : BF FF C5    "   "    sts  XFFC5
D739 : 80 35    " 5"    suba  #$35
D73B : 2F E9    "/ "    ble  LD726
D73D : E0 02    "  "    subb  $02,x
D73F : 07    " "    tpa
D740 : FF EA 00    "   "    stx  XEA00
D743 : 35    "5"    txs
D744 : 5F    "_"    clrb
D745 : F1 40 0C    " @ "    cmpb  X400C
        ;
D748 : 3D    "="    db  $3D
        ;
D749 : FE F8 02    "   "    ldx  XF802
        ;
D74C : 8F    " "    db  $8F
        ;
D74D : E7 E8    "  "    stab  $E8,x
        ;
D74F : 04    " "    db  $04
        ;
D750 : 09    " "    dex
D751 : FF AF C0    "   "    stx  XAFC0
D754 : 0C    " "    clc
        ;
D755        XD755:
D755 : 1F    " "    db  $1F
        ;
D756 : DF 38    " 8"    stx  X0038
        ;
D758 : 00 1F    "  "    db  $00, $1F
        ;
D75A : BF C3 00    "   "    sts  XC300
D75D : 7D F7 F0    "}  "    tst  XF7F0
D760 : 60 03    "` "    neg  $03,x
        ;
D762 : 8F    " "    db  $8F
        ;
D763 : FF 1E 00    "   "    stx  X1E00
D766 : 4A    "J"    deca
D767 : FF 2F 80    " / "    stx  X2F80
D76A : 0E    " "    cli
        ;
D76B : 1F F3    "  "    db  $1F, $F3
        ;
D76D : E0 00    "  "    subb  $00,x
        ;
D76F : C7    " "    db  $C7
        ;
D770        LD770:
D770 : FF F8 00    "   "    stx  XF800
D773 : 0E    " "    cli
D774 : EF FC    "  "    stx  $FC,x
        ;
D776 : 14 05 1F    "   "    db  $14, $05, $1F
        ;
D779 : EB 70    " p"    addb  $70,x
        ;
D77B : 04 1F    "  "    db  $04, $1F
        ;
D77D : FF 5E 00    " ^ "    stx  X5E00
D780 : 01    " "    nop
D781 : 7F EF C0    "   "    clr  XEFC0
        ;
D784 : 04 87    "  "    db  $04, $87
        ;
D786 : FF F1 00    "   "    stx  XF100
D789 : 07    " "    tpa
D78A : D7 EB    "  "    stab  X00EB
D78C : 80 06    "  "    suba  #$06
D78E : 0F    " "    sei
D78F : FF E0 50    "  P"    stx  XE050
D792 : 0D    " "    sec
        ;
D793 : DD    " "    db  $DD
        ;
D794 : F5 42 03    " B "    bitb  X4203
        ;
D797 : 87    " "    db  $87
        ;
D798 : FB F0 D0    "   "    addb  XF0D0
        ;
D79B : 1E    " "    db  $1E
        ;
D79C : 17    " "    tba
D79D : C1 C0    "  "    cmpb  #$C0
D79F : 63 F7    "c "    com  $F7,x
D7A1 : F9 D0 02    "   "    adcb  XD002
D7A4 : 17    " "    tba
D7A5 : 5F    "_"    clrb
D7A6 : E5 70    " p"    bitb  $70,x
D7A8 : 07    " "    tpa
D7A9 : 07    " "    tpa
D7AA : FB F8 20    "   "    addb  XF820
D7AD : D0 79    " y"    subb  X0079
D7AF : AF A0    "  "    sts  $A0,x
D7B1 : 68 87    "h "    asl  $87,x
D7B3 : F1 FA 83    "   "    cmpb  XFA83
D7B6 : C1 B1    "  "    cmpb  #$B1
D7B8 : D4 28    " ("    andb  X0028
D7BA : 17    " "    tba
D7BB : 9F E5    "  "    sts  X00E5
D7BD : EA 0D    "  "    orab  $0D,x
D7BF : 0F    " "    sei
D7C0        LD7C0:
D7C0 : 5A    "Z"    decb
D7C1 : B4 00 C1    "   "    anda  X00C1
D7C4 : FE 7E 8E    " ~ "    ldx  X7E8E
        ;
D7C7 : 05 8F    "  "    db  $05, $8F
        ;
D7C9 : E9 F0    "  "    adcb  $F0,x
        ;
D7CB : 04    " "    db  $04
        ;
D7CC : 0B    " "    sev
        ;
D7CD : FD    " "    db  $FD
        ;
D7CE : 7C 8A 03    "|  "    inc  X8A03
        ;
D7D1 : CF 75    " u"    db  $CF, $75
        ;
D7D3 : A4 14    "  "    anda  $14,x
D7D5 : A7 D4    "  "    staa  $D4,x
D7D7 : F8 1F 07    "   "    eorb  X1F07
        ;
D7DA : CF    " "    db  $CF
        ;
D7DB : 58    "X"    aslb
D7DC : 0C    " "    clc
D7DD : 0B    " "    sev
D7DE : AF 5E    " ^"    sts  $5E,x
        ;
D7E0 : 6B    "k"    db  $6B
        ;
D7E1 : 07    " "    tpa
D7E2 : 0B    " "    sev
        ;
D7E3 : FC    " "    db  $FC
        ;
D7E4 : 7C 02 0A    "|  "    inc  X020A
D7E7 : B7 AF 54    "  T"    staa  XAF54
D7EA : 8A 0B    "  "    oraa  #$0B
D7EC : D7 EE    "  "    stab  X00EE
D7EE : 2A 80    "* "    bpl  LD770
D7F0 : E0 FE    "  "    subb  $FE,x
D7F2 : 9F 80    "  "    sts  X0080
D7F4 : D0 77    " w"    subb  X0077
D7F6 : AF C0    "  "    sts  $C0,x
D7F8 : A4 0F    "  "    anda  $0F,x
D7FA : 3F    "?"    swi
        ;
D7FB : 5B    "["    db  $5B
        ;
D7FC : 43    "C"    coma
        ;
D7FD : 05    " "    db  $05
        ;
D7FE : 5C    "\"    incb
D7FF : FE 0E 21    "  !"    ldx  X0E21
D802 : 56    "V"    rorb
D803 : AF C7    "  "    sts  $C7,x
D805 : 50    "P"    negb
D806 : 34    "4"    des
D807 : 3F    "?"    swi
        ;
D808 : 5E    "^"    db  $5E
        ;
D809 : 28 A1    "( "    bvc  LD7AC
D80B : 3B    ";"    rti
        ;
D80C : 5F    "_"    clrb
        ;
D80D : 1C 14    "  "    db  $1C, $14
        ;
D80F : AB D7    "  "    adda  $D7,x
D811 : C5 45    " E"    bitb  #$45
        ;
D813 : 05 D3    "  "    db  $05, $D3
        ;
D815 : F5 69 A0    " i "    bitb  X69A0
D818 : A2 5F    " _"    sbca  $5F,x
D81A : 4F    "O"    clra
D81B : 54    "T"    lsrb
D81C : 86 85    "  "    ldaa  #$85
        ;
D81E : E3 EC    "  "    db  $E3, $EC
        ;
D820 : AA 85    "  "    oraa  $85,x
D822 : 4A    "J"    deca
D823 : CB D4    "  "    addb  #$D4
D825 : F1 1C 8B    "   "    cmpb  X1C8B
        ;
D828 : C7    " "    db  $C7
        ;
D829 : 2A 95    "* "    bpl  LD7C0
D82B : 5D    "]"    tstb
D82C : 57    "W"    asrb
D82D : 54    "T"    lsrb
        ;
D82E : 4B    "K"    db  $4B
        ;
D82F : 0E    " "    cli
D830 : C5 E4    "  "    bitb  #$E4
D832 : A8 55    " U"    eora  $55,x
        ;
D834 : 7B 4E    "{N"    db  $7B, $4E
        ;
D836 : A0 E1    "  "    suba  $E1,x
D838 : 74 ED 4A    "t J"    lsr  XED4A
D83B : 85 95    "  "    bita  #$95
D83D : 7D 5C 15    "}\ "    tst  X5C15
D840 : 25 D2    "% "    bcs  LD814
D842 : FA 2A 92    " * "    orab  X2A92
D845 : D2 F1    "  "    sbcb  X00F1
D847 : 74 52 B5    "tR "    lsr  X52B5
        ;
D84A : 3C    "<"    db  $3C
        ;
D84B : B5 14 6A    "  j"    bita  X146A
D84E : 9F 54    " T"    sts  X0054
D850 : 5C    "\"    incb
        ;
D851 : 1E    " "    db  $1E
        ;
D852 : 57    "W"    asrb
D853 : 54    "T"    lsrb
D854 : A9 1D    "  "    adca  $1D,x
D856 : 2D 5D    "-]"    blt  LD8B5
        ;
D858 : 1E    " "    db  $1E
        ;
D859 : 0B    " "    sev
        ;
D85A : 52    "R"    db  $52
        ;
D85B : BC B1 54    "  T"    cpx  XB154
D85E : 5A    "Z"    decb
D85F : AB AA    "  "    adda  $AA,x
D861 : 54    "T"    lsrb
D862 : 5A    "Z"    decb
D863 : AB 51    " Q"    adda  $51,x
D865 : A9 56    " V"    adca  $56,x
D867 : AB C5    "  "    adda  $C5,x
        ;
D869 : 52    "R"    db  $52
        ;
D86A : 8C C7 33    "  3"    cpx  #$C733
D86D : 9C AE    "  "    cpx  X00AE
D86F : A6 34    " 4"    ldaa  $34,x
D871 : 54    "T"    lsrb
        ;
D872 : D3 38 DC 72  " 8 r"    db  $D3, $38, $DC, $72
        ;
D876 : B8 CA AA    "   "    eora  XCAAA
D879 : A5 AA    "  "    bita  $AA,x
D87B : 96 95    "  "    ldaa  X0095
        ;
D87D : 1A    " "    db  $1A
        ;
D87E : 95 5A    " Z"    bita  X005A
D880 : AA EA    "  "    oraa  $EA,x
D882 : AA A6    "  "    oraa  $A6,x
D884 : 33    "3"    pulb
D885 : 8C 66 38    " f8"    cpx  #$6638
D888 : 9C 67    " g"    cpx  X0067
D88A : 39    "9"    rts
        ;
D88B : CB 31    " 1"    addb  #$31
D88D : AA 8A    "  "    oraa  $8A,x
        ;
D88F : 1E    " "    db  $1E
        ;
D890 : 7A 86 5B    "z ["    dec  X865B
D893 : 5C    "\"    incb
        ;
D894 : 52    "R"    db  $52
        ;
D895 : A8 CE    "  "    eora  $CE,x
D897 : E8 3E    " >"    eorb  $3E,x
D899 : 26 BA    "& "    bne  LD855
D89B : 39    "9"    rts
        ;
D89C : 2A E5    "* "    bpl  LD883
D89E : 58    "X"    aslb
D89F : 7C 71 E1    "|q "    inc  X71E1
        ;
D8A2 : A3    " "    db  $A3
        ;
D8A3 : D1 36    " 6"    cmpb  X0036
D8A5 : 99 55    " U"    adca  X0055
D8A7 : 63 35    "c5"    com  $35,x
D8A9 : C1 AB    "  "    cmpb  #$AB
D8AB        LD8AB:
D8AB : 99 51    " Q"    adca  X0051
D8AD : F6 A6 91    "   "    ldab  XA691
D8B0 : 6C 44    "lD"    inc  $44,x
D8B2 : E9 49    " I"    adcb  $49,x
        ;
D8B4 : 55    "U"    db  $55
        ;
D8B5        LD8B5:
D8B5 : 78 D5 07    "x  "    asl  XD507
D8B8 : 9C 9D    "  "    cpx  X009D
D8BA : 99 94    "  "    adca  X0094
D8BC : 4F    "O"    clra
        ;
D8BD : ED    " "    db  $ED
        ;
D8BE : 36    "6"    psha
D8BF : 85 6A    " j"    bita  #$6A
D8C1 : BA 76 86    " v "    oraa  X7686
        ;
D8C4 : 9D    " "    db  $9D
        ;
D8C5 : 89 22    " ""    adca  #$22
        ;
D8C7 : CC    " "    db  $CC
        ;
D8C8 : F8 1B 4E    "  N"    eorb  X1B4E
D8CB : 4F    "O"    clra
        ;
D8CC        LD8CC:
D8CC : 8F 21    " !"    db  $8F, $21
        ;
D8CE : C5 38    " 8"    bitb  #$38
D8D0 : 66 2E    "f."    ror  $2E,x
D8D2 : 35    "5"    txs
        ;
D8D3 : 93    " "    db  $93
        ;
D8D4 : AA 4C    " L"    oraa  $4C,x
D8D6 : 26 D3    "& "    bne  LD8AB
D8D8 : D6 71    " q"    ldab  X0071
D8DA : F4 71 D6    " q "    andb  X71D6
D8DD : 39    "9"    rts
        ;
D8DE : 97 15    "  "    staa  X0015
D8E0 : 2A 0A    "* "    bpl  LD8EC
D8E2 : A2 58    " X"    sbca  $58,x
D8E4 : 8B 3E    " >"    adda  #$3E
D8E6 : 6E EB    "n "    jmp  $EB,x            ;INFO: index jump
        ;
D8E8 : DB F5    "  "    addb  X00F5
D8EA : 6A 7A    "jz"    dec  $7A,x
        ;
D8EC        LD8EC:
D8EC : 72    "r"    db  $72
        ;
D8ED : A2 40    " @"    sbca  $40,x
D8EF : 32    "2"    pula
D8F0 : C4 AA    "  "    andb  #$AA
D8F2 : 59    "Y"    rolb
D8F3 : 31    "1"    ins
D8F4 : 6E BD    "n "    jmp  $BD,x            ;INFO: index jump
        ;
D8F6 : D6 6D    " m"    ldab  X006D
        ;
D8F8 : D3    " "    db  $D3
        ;
D8F9 : 32    "2"    pula
D8FA : 88 3A    " :"    eora  #$3A
D8FC : 5D    "]"    tstb
        ;
D8FD : 87    " "    db  $87
        ;
D8FE : 09    " "    dex
        ;
D8FF : C3    " "    db  $C3
        ;
D900 : 58    "X"    aslb
D901 : E9 0B    "  "    adcb  $0B,x
D903 : 9B 4E    " N"    adda  X004E
D905 : 25 C5    "% "    bcs  LD8CC
D907 : 39    "9"    rts
        ;
D908 : 4A    "J"    deca
D909 : 97 23    " #"    staa  X0023
D90B : 54    "T"    lsrb
D90C : EB BC    "  "    addb  $BC,x
        ;
D90E : 6B    "k"    db  $6B
        ;
D90F : FA AE 58    "  X"    orab  XAE58
D912 : 8A 49    " I"    oraa  #$49
        ;
D914 : 52    "R"    db  $52
        ;
D915 : 6C 4F    "lO"    inc  $4F,x
D917 : 39    "9"    rts
        ;
D918 : 9B 71    " q"    adda  X0071
        ;
D91A : EC    " "    db  $EC
        ;
D91B : E8 55    " U"    eorb  $55,x
        ;
D91D : 4B    "K"    db  $4B
        ;
D91E : 28 A2    "( "    bvc  LD8C2
D920 : CE 79 38    " y8"    ldx  #$7938
D923 : 63 72    "cr"    com  $72,x
D925 : C4 D1    "  "    andb  #$D1
D927 : 9A E7    "  "    oraa  X00E7
        ;
D929 : 15    " "    db  $15
        ;
D92A : 4D    "M"    tsta
        ;
D92B : 72    "r"    db  $72
        ;
D92C : F2 22 B7    " " "    sbcb  X22B7
D92F : 63 89    "c "    com  $89,x
        ;
D931        LD931:
D931 : 5B    "["    db  $5B
        ;
D932 : AB 38    " 8"    adda  $38,x
        ;
D934 : CF 3C    " <"    db  $CF, $3C
        ;
D936 : 26 29    "&)"    bne  LD961
D938 : 54    "T"    lsrb
D939 : 91 52    " R"    cmpa  X0052
D93B : AB 4A    " J"    adda  $4A,x
D93D : 37    "7"    pshb
        ;
D93E : 55    "U"    db  $55
        ;
D93F : 97 15    "  "    staa  X0015
D941 : 3B    ";"    rti
        ;
D942 : 1D    " "    db  $1D
        ;
D943 : 98 BA    "  "    eora  X00BA
D945 : 59    "Y"    rolb
D946 : 54    "T"    lsrb
D947 : 58    "X"    aslb
        ;
D948 : DD    " "    db  $DD
        ;
D949 : 2A 1A    "* "    bpl  LD965
D94B : 2E 39    ".9"    bgt  LD986
        ;
D94D : CC    " "    db  $CC
        ;
D94E : F1 B4 F3    "   "    cmpb  XB4F3
        ;
D951 : 51    "Q"    db  $51
        ;
D952 : 76 59 4C    "vYL"    ror  X594C
D955 : 97 31    " 1"    staa  X0031
D957 : C9 55    " U"    adcb  #$55
D959 : 7A 2C 55    "z,U"    dec  X2C55
        ;
D95C : 1A    " "    db  $1A
        ;
D95D : B5 51 54    " QT"    bita  X5154
        ;
D960 : 38    "8"    db  $38
        ;
D961        LD961:
D961 : CA A8    "  "    orab  #$A8
D963 : DA B8    "  "    orab  X00B8
        ;
D965        LD965:
D965 : C7 55    " U"    db  $C7, $55
        ;
D967 : 53    "S"    comb
D968 : 49    "I"    rola
D969 : 63 9B    "c "    com  $9B,x
D96B : 86 B9    "  "    ldaa  #$B9
D96D : 39    "9"    rts
        ;
D96E : B6 2A E9    " * "    ldaa  X2AE9
D971 : D8 9D    "  "    eorb  X009D
D973 : 69 4A    "iJ"    rol  $4A,x
D975 : A5 56    " V"    bita  $56,x
D977 : 59    "Y"    rolb
        ;
D978 : 3C 65    "<e"    db  $3C, $65
        ;
D97A : B4 C9 AC    "   "    anda  XC9AC
D97D : 63 F1    "c "    com  $F1,x
D97F : 54    "T"    lsrb
D980 : 67 2D    "g-"    asr  $2D,x
D982 : 2A 95    "* "    bpl  LD919
D984 : 2E 34    ".4"    bgt  LD9BA
D986        LD986:
D986 : 54    "T"    lsrb
        ;
D987 : 4E    "N"    db  $4E
        ;
D988 : 54    "T"    lsrb
D989 : DA 73    " s"    orab  X0073
D98B : BD 2C 2E    " ,."    jsr  L2C2E
D98E : 4C    "L"    inca
D98F : E1 5A    " Z"    cmpb  $5A,x
D991 : B1 75 29    " u)"    cmpa  X7529
D994 : 76 32 D5    "v2 "    ror  X32D5
        ;
D997 : 1A    " "    db  $1A
        ;
D998 : D4 B8    "  "    andb  X00B8
D99A : 57    "W"    asrb
D99B : 5D    "]"    tstb
D99C : 27 64    "'d"    beq  LDA02
D99E : 9C E3    "  "    cpx  X00E3
D9A0 : 39    "9"    rts
        ;
D9A1 : 2A 8E    "* "    bpl  LD931
        ;
D9A3 : 52    "R"    db  $52
        ;
D9A4 : CA B3    "  "    orab  #$B3
D9A6 : 76 B5 AB    "v  "    ror  XB5AB
D9A9 : 54    "T"    lsrb
D9AA : A8 86    "  "    eora  $86,x
D9AC        LD9AC:
D9AC : 2D 4A    "-J"    blt  LD9F8
D9AE : AA D6    "  "    oraa  $D6,x
D9B0 : AA AB    "  "    oraa  $AB,x
        ;
D9B2 : 1E 38    " 8"    db  $1E, $38
        ;
D9B4 : 96 71    " q"    ldaa  X0071
D9B6 : AC 6A    " j"    cpx  $6A,x
D9B8 : 53    "S"    comb
        ;
D9B9 : 55    "U"    db  $55
        ;
D9BA        LD9BA:
D9BA : 5A    "Z"    decb
D9BB : 90 CE    "  "    suba  X00CE
D9BD : 39    "9"    rts
        ;
D9BE : 54    "T"    lsrb
        ;
D9BF : 75 3A    "u:"    db  $75, $3A
        ;
D9C1 : D4 AA    "  "    andb  X00AA
D9C3 : CA BA    "  "    orab  #$BA
D9C5 : 2C 4E    ",N"    bge  LDA15
D9C7 : 32    "2"    pula
D9C8 : A9 C5    "  "    adca  $C5,x
D9CA : B2 D7 55    "  U"    sbca  XD755
D9CD : 4D    "M"    tsta
D9CE : 54    "T"    lsrb
D9CF : CA AD    "  "    orab  #$AD
        ;
D9D1 : 45    "E"    db  $45
        ;
D9D2        LD9D2:
D9D2 : AB 4A    " J"    adda  $4A,x
D9D4 : 36    "6"    psha
D9D5        LD9D5:
D9D5 : A8 AA    "  "    eora  $AA,x
D9D7 : 29 C9    ") "    bvs  LD9A2
        ;
D9D9 : 9D    " "    db  $9D
        ;
D9DA : 54    "T"    lsrb
D9DB : B7 9A E4    "   "    staa  X9AE4
D9DE : E5 51    " Q"    bitb  $51,x
D9E0 : 54    "T"    lsrb
D9E1 : AA CA    "  "    oraa  $CA,x
D9E3 : 2A D5    "* "    bpl  LD9BA
D9E5 : 86 CC    "  "    ldaa  #$CC
D9E7 : B5 2E AE    " . "    bita  X2EAE
D9EA : 33    "3"    pulb
D9EB : 35    "5"    txs
        ;
D9EC : 55    "U"    db  $55
        ;
D9ED : 5C    "\"    incb
D9EE : E7 52    " R"    stab  $52,x
D9F0 : C5 55    " U"    bitb  #$55
        ;
D9F2 : 55    "U"    db  $55
        ;
D9F3 : 29 54    ")T"    bvs  LDA49
D9F5 : 96 35    " 5"    ldaa  X0035
D9F7 : 5D    "]"    tstb
D9F8        LD9F8:
D9F8 : 54    "T"    lsrb
D9F9 : BA 95 95    "   "    oraa  X9595
D9FC : 29 D4    ") "    bvs  LD9D2
D9FE : B5 2C 5F    " ,_"    bita  X2C5F
DA01 : 2A A9    "* "    bpl  LD9AC
        ;
DA03 : 52    "R"    db  $52
        ;
DA04 : D1 74    " t"    cmpb  X0074
DA06 : A8 D5    "  "    eora  $D5,x
DA08 : 6A D2    "j "    dec  $D2,x
DA0A : CA B9    "  "    orab  #$B9
        ;
DA0C : CC    " "    db  $CC
        ;
DA0D : 66 55    "fU"    ror  $55,x
DA0F : A2 D1    "  "    sbca  $D1,x
DA11 : AA AA    "  "    oraa  $AA,x
        ;
DA13 : 3A    ":"    db  $3A
        ;
DA14 : 5C    "\"    incb
DA15        LDA15:
DA15 : A6 AA    "  "    ldaa  $AA,x
DA17 : A4 D6    "  "    anda  $D6,x
DA19 : E2 9A    "  "    sbcb  $9A,x
DA1B : 95 D2    "  "    bita  X00D2
DA1D : AA AE    "  "    oraa  $AE,x
DA1F : 95 55    " U"    bita  X0055
DA21 : 35    "5"    txs
DA22 : 54    "T"    lsrb
DA23 : 95 55    " U"    bita  X0055
DA25 : 2D 55    "-U"    blt  LDA7C
DA27 : 2A AC    "* "    bpl  LD9D5
DA29 : EA 95    "  "    orab  $95,x
        ;
DA2B : 55    "U"    db  $55
        ;
DA2C : 5A    "Z"    decb
DA2D : 85 35    " 5"    bita  #$35
DA2F        LDA2F:
DA2F : 6A 51    "jQ"    dec  $51,x
DA31 : AB 5A    " Z"    adda  $5A,x
        ;
DA33 : 4E    "N"    db  $4E
        ;
DA34 : 9A AA    "  "    oraa  X00AA
DA36 : AA B0    "  "    oraa  $B0,x
DA38 : BA 55 54    " UT"    oraa  X5554
DA3B : D5 79    " y"    bitb  X0079
        ;
DA3D        LDA3D:
DA3D : 65 55 52    "eUR"    db  $65, $55, $52
        ;
DA40 : CB 19    "  "    addb  #$19
DA42        LDA42:
DA42 : 56    "V"    rorb
DA43 : 59    "Y"    rolb
DA44 : B4 EA AA    "   "    anda  XEAAA
DA47 : CA A9    "  "    orab  #$A9
DA49        LDA49:
DA49 : 50    "P"    negb
DA4A : D5 25    " %"    bitb  X0025
DA4C : 54    "T"    lsrb
DA4D : AB AA    "  "    adda  $AA,x
DA4F        LDA4F:
DA4F : E5 55    " U"    bitb  $55,x
        ;
DA51 : 55    "U"    db  $55
        ;
DA52 : 53    "S"    comb
DA53 : A2 A5    "  "    sbca  $A5,x
        ;
DA55 : 55    "U"    db  $55
        ;
DA56 : CA B5    "  "    orab  #$B5
DA58 : 56    "V"    rorb
DA59 : AA E5    "  "    oraa  $E5,x
        ;
DA5B : 55    "U"    db  $55
        ;
DA5C : 85 C8    "  "    bita  #$C8
DA5E : D5 5A    " Z"    bitb  X005A
DA60 : 56    "V"    rorb
DA61 : AA AD    "  "    oraa  $AD,x
DA63 : 2A CA    "* "    bpl  LDA2F
DA65 : B1 92 AA    "   "    cmpa  X92AA
DA68 : AA B2    "  "    oraa  $B2,x
DA6A : D4 D5    "  "    andb  X00D5
DA6C : 5A    "Z"    decb
DA6D : 95 27    " '"    bita  X0027
DA6F : 4A    "J"    deca
DA70 : E4 D4    "  "    andb  $D4,x
DA72 : B2 3A 73    " :s"    sbca  X3A73
DA75 : 54    "T"    lsrb
DA76        LDA76:
DA76 : AA D5    "  "    oraa  $D5,x
DA78 : 28 D5    "( "    bvc  LDA4F
        ;
DA7A : 55    "U"    db  $55
        ;
DA7B : 92 AA    "  "    sbca  X00AA
DA7D : F5 4A D4    " J "    bitb  X4AD4
DA80 : AE 56    " V"    lds  $56,x
DA82 : 8A 9A    "  "    oraa  #$9A
DA84 : AA 55    " U"    oraa  $55,x
        ;
DA86 : 55    "U"    db  $55
        ;
DA87 : AB 55    " U"    adda  $55,x
        ;
DA89 : 55    "U"    db  $55
        ;
DA8A : 54    "T"    lsrb
DA8B : 57    "W"    asrb
        ;
DA8C : 1A    " "    db  $1A
        ;
DA8D : AA A9    "  "    oraa  $A9,x
        ;
DA8F : 55 55    "UU"    db  $55, $55
        ;
DA91 : 56    "V"    rorb
DA92 : AA AB    "  "    oraa  $AB,x
        ;
DA94 : 55 55 55 55  "UUUU"    db  $55, $55, $55, $55
        ;
DA98 : 58    "X"    aslb
DA99 : AB 39    " 9"    adda  $39,x
DA9B : CA B5    "  "    orab  #$B5
DA9D : 2A AA    "* "    bpl  LDA49
        ;
DA9F : D3    " "    db  $D3
;*************************************;
;
DAA0 : AA 3F    " ?"    oraa  $3F,x
DAA2 : 43    "C"    coma
DAA3 : C1 B4    "  "    cmpb  #$B4
DAA5 : 5D    "]"    tstb
DAA6 : 17    " "    tba
        ;
DAA7 : 52    "R"    db  $52
        ;
DAA8 : B5 55 55    " UU"    bita  X5555
DAAB : 54    "T"    lsrb
DAAC : AA AD    "  "    oraa  $AD,x
DAAE : 2B A4    "+ "    bmi  LDA54
DAB0 : 3F    "?"    swi
DAB1 : 07    " "    tpa
DAB2 : D0 BC    "  "    subb  X00BC
DAB4 : 2E 87    ". "    bgt  LDA3D
DAB6 : A2 BA    "  "    sbca  $BA,x
DAB8 : 2E 95    ". "    bgt  LDA4F
DABA : 6A AA    "j "    dec  $AA,x
        ;
DABC : 5E    "^"    db  $5E
        ;
DABD : 17    " "    tba
DABE : 0B    " "    sev
DABF : C1 F8    "  "    cmpb  #$F8
        ;
DAC1 : 3D    "="    db  $3D
        ;
DAC2 : 17    " "    tba
DAC3 : 85 E0    "  "    bita  #$E0
DAC5 : F4 5D 15    " ] "    andb  X5D15
DAC8 : C9 75    " u"    adcb  #$75
DACA : 2A AA    "* "    bpl  LDA76
        ;
DACC : 52    "R"    db  $52
        ;
DACD : D0 DA    "  "    subb  X00DA
DACF : 97 4C    " L"    staa  X004C
        ;
DAD1 : 15    " "    db  $15
        ;
DAD2 : 2B FF    "+ "    bmi  LDAD3
        ;
DAD4 : FD    " "    db  $FD
        ;
DAD5 : A2 01    "  "    sbca  $01,x
        ;
DAD7 : 05    " "    db  $05
        ;
DAD8 : 36    "6"    psha
DAD9 : BF 69 41    " iA"    sts  X6941
DADC : 49    "I"    rola
        ;
DADD : 55 5B    "U["    db  $55, $5B
        ;
DADF : AA BA    "  "    oraa  $BA,x
        ;
DAE1 : DD    " "    db  $DD
        ;
DAE2 : 50    "P"    negb
DAE3 : 30    "0"    tsx
DAE4 : FF FF E0    "   "    stx  XFFE0
DAE7        LDAE7:
DAE7 : 08    " "    inx
        ;
DAE8 : 1D    " "    db  $1D
        ;
DAE9 : 74 E0 41    "t A"    lsr  XE041
DAEC : 5F    "_"    clrb
DAED : 5F    "_"    clrb
DAEE : 10    " "    sba
DAEF : A2 EB    "  "    sbca  $EB,x
        ;
DAF1 : ED    " "    db  $ED
        ;
DAF2 : 0C    " "    clc
DAF3 : 95 B8    "  "    bita  X00B8
DAF5 : 07    " "    tpa
DAF6 : 77 FF 64    "w d"    asr  XFF64
        ;
DAF9 : 03    " "    db  $03
        ;
DAFA : 9E F2    "  "    lds  X00F2
        ;
DAFC : 00    " "    db  $00
        ;
DAFD : 0D    " "    sec
DAFE : 7E DA 42    "~ B"    jmp  LDA42
        ;
DB01 : 92 AD    "  "    sbca  X00AD
        ;
DB03 : 7B    "{"    db  $7B
        ;
DB04 : D2 81    "  "    sbcb  X0081
        ;
DB06 : 21    "!"    db  $21
        ;
DB07 : 40    "@"    nega
DB08 : FF FF 80    "   "    stx  XFF80
DB0B : 79 EF 80    "y  "    rol  XEF80
        ;
DB0E : 18 5E    " ^"    db  $18, $5E
        ;
DB10 : A1 AE    "  "    cmpa  $AE,x
        ;
DB12 : 3D 00    "= "    db  $3D, $00
        ;
DB14 : EB FF    "  "    addb  $FF,x
        ;
DB16 : 00    " "    db  $00
        ;
DB17 : 50    "P"    negb
DB18 : FF 80 1C    "   "    stx  X801C
DB1B : FF E8 0F    "   "    stx  XE80F
DB1E : 7C A1 06    "|  "    inc  XA106
        ;
DB21 : DC    " "    db  $DC
        ;
DB22 : 2A C3    "* "    bpl  LDAE7
DB24 : F8 0C 5F    "  _"    eorb  X0C5F
DB27 : F0 47 4D    " GM"    subb  X474D
DB2A : A1 80    "  "    cmpa  $80,x
DB2C : 0F    " "    sei
DB2D : FF 88 1F    "   "    stx  X881F
        ;
DB30 : FC    " "    db  $FC
        ;
DB31 : 81 1A    "  "    cmpa  #$1A
DB33 : FA 00 3F    "  ?"    orab  X003F
        ;
DB36 : F3 00    "  "    db  $F3, $00
        ;
DB38 : F7 AB 84    "   "    stab  XAB84
        ;
DB3B : 71    "q"    db  $71
        ;
DB3C : D4 80    "  "    andb  X0080
DB3E : 7F F8 21    "  !"    clr  XF821
DB41 : BF F8 01    "   "    sts  XF801
        ;
DB44 : CF    " "    db  $CF
        ;
DB45 : F0 03 DE    "   "    subb  X03DE
DB48 : 70 27 DE    "p' "    neg  X27DE
DB4B : 30    "0"    tsx
        ;
DB4C : 55 5E    "U^"    db  $55, $5E
        ;
DB4E : E0 0E    "  "    subb  $0E,x
DB50 : FB 06 11    "   "    addb  X0611
DB53 : FF 01 58    "  X"    stx  X0158
DB56 : FF 00 31    "  1"    stx  X0031
DB59 : FF 0C 71    "  q"    stx  X0C71
DB5C : 96 06    "  "    ldaa  X0006
DB5E : FF 8C 00    "   "    stx  X8C00
DB61 : FF C6 10    "   "    stx  XC610
DB64 : FF 84 30    "  0"    stx  X8430
DB67 : FF 80 33    "  3"    stx  X8033
DB6A : FF 00 78    "  x"    stx  X0078
        ;
DB6D : CF    " "    db  $CF
        ;
DB6E : 90 BE    "  "    suba  X00BE
DB70 : D0 06    "  "    subb  X0006
DB72 : 7D EF 10    "}  "    tst  XEF10
DB75 : FA 07 B0    "   "    orab  X07B0
DB78 : FB 08 61    "  a"    addb  X0861
DB7B : DF 70    " p"    stx  X0070
DB7D : C4 2D    " -"    andb  #$2D
DB7F : F5 07 08    "   "    bitb  X0708
        ;
DB82 : 3D C3    "= "    db  $3D, $C3
        ;
DB84 : 9C FB    "  "    cpx  X00FB
DB86 : C4 01    "  "    andb  #$01
        ;
DB88 : F3    " "    db  $F3
        ;
DB89 : F8 09 C3    "   "    eorb  X09C3
DB8C : 3E    ">"    wai
DB8D : E0 CF    "  "    subb  $CF,x
DB8F : 0F    " "    sei
DB90 : E1 1A    "  "    cmpb  $1A,x
DB92 : 40    "@"    nega
DB93 : FF 80 71    "  q"    stx  X8071
DB96 : FF A0 67    "  g"    stx  XA067
DB99 : 0E    " "    cli
DB9A : F8 07 8C    "   "    eorb  X078C
DB9D : 39    "9"    rts
        ;
DB9E : E7 18    "  "    stab  $18,x
DBA0 : 37    "7"    pshb
DBA1 : FF 08 01    "   "    stx  X0801
DBA4 : FF 10 C7    "   "    stx  X10C7
DBA7 : FE 01 CF    "   "    ldx  X01CF
        ;
DBAA : 3C 41    "<A"    db  $3C, $41
        ;
DBAC : 9F 19    "  "    sts  X0019
DBAE : C0 3F    " ?"    subb  #$3F
DBB0        LDBB0:
DBB0 : C1 1E    "  "    cmpb  #$1E
        ;
DBB2 : FD    " "    db  $FD
        ;
DBB3 : D0 03    "  "    subb  X0003
DBB5 : DF 30    " 0"    stx  X0030
DBB7 : 47    "G"    asra
        ;
DBB8 : FC 00    "  "    db  $FC, $00
        ;
DBBA : FF 7C 80    " | "    stx  X7C80
        ;
DBBD : 1F    " "    db  $1F
        ;
DBBE : 79 C0 3D    "y ="    rol  XC03D
        ;
DBC1 : C3    " "    db  $C3
        ;
DBC2 : 0C    " "    clc
DBC3 : FB CC 00    "   "    addb  XCC00
DBC6 : 7F CC 18    "   "    clr  XCC18
DBC9 : E7 90    "  "    stab  $90,x
DBCB : 3F    "?"    swi
DBCC : CE 38 13    " 8 "    ldx  #$3813
        ;
DBCF : CF 18    "  "    db  $CF, $18
        ;
DBD1 : 7E 03 29    "~ )"    jmp  L0329
        ;
DBD4 : FB 0E 41    "  A"    addb  X0E41
        ;
DBD7 : 8F    " "    db  $8F
        ;
DBD8 : F9 C6 18    "   "    adcb  XC618
DBDB : F1 8E 78    "  x"    cmpb  X8E78
        ;
DBDE : E3    " "    db  $E3
        ;
DBDF : 0C    " "    clc
DBE0 : 78 C7 9C    "x  "    asl  XC79C
DBE3 : F0 05 FC    "   "    subb  X05FC
DBE6 : 31    "1"    ins
DBE7 : C6 F8    "  "    ldab  #$F8
        ;
DBE9 : 8F 38    " 8"    db  $8F, $38
        ;
DBEB : 77 9C 61    "w a"    asr  X9C61
        ;
DBEE : 8F 18    "  "    db  $8F, $18
        ;
DBF0 : 73 C4 1F    "s  "    com  XC41F
DBF3 : C1 DC    "  "    cmpb  #$DC
DBF5 : 11    " "    cba
DBF6 : F5 84 39    "  9"    bitb  X8439
DBF9 : F8 47 1C    " G "    eorb  X471C
DBFC : F7 0F E0    "   "    stab  X0FE0
DBFF : 67 02    "g "    asr  $02,x
DC01 : FF 20 0F    "   "    stx  X200F
DC04 : FA 10 C7    "   "    orab  X10C7
DC07 : BC 60 8F    " ` "    cpx  X608F
DC0A : FE 00 7F    "   "    ldx  X007F
        ;
DC0D : CC    " "    db  $CC
        ;
DC0E : 10    " "    sba
DC0F        XDC0F:
DC0F : FF 88 23    "  #"    stx  X8823
DC12 : BF A0 07    "   "    sts  XA007
DC15 : FE 00 B8    "   "    ldx  X00B8
DC18 : FF 80 67    "  g"    stx  X8067
DC1B : DF 00    "  "    stx  X0000
DC1D : 0F    " "    sei
        ;
DC1E : FC    " "    db  $FC
        ;
DC1F : 20 8F    "  "    bra  LDBB0
        ;
DC21 : F8 07 BA    "   "    eorb  X07BA
DC24 : F0 03 FF    "   "    subb  X03FF
        ;
DC27 : 00    " "    db  $00
        ;
DC28 : 4D    "M"    tsta
DC29 : FE C0 1D    "   "    ldx  XC01D
DC2C : EF 08    "  "    stx  $08,x
DC2E : 10    " "    sba
DC2F : FF F0 23    "  #"    stx  XF023
DC32 : 9F F0    "  "    sts  X00F0
DC34 : 07    " "    tpa
DC35 : F8 41 8F    " A "    eorb  X418F
        ;
DC38 : FC    " "    db  $FC
        ;
DC39 : 01    " "    nop
DC3A : D7 F4    "  "    stab  X00F4
        ;
DC3C : 03 FC    "  "    db  $03, $FC
        ;
DC3E : 06    " "    tap
DC3F : 95 F0    "  "    bita  X00F0
DC41 : 47    "G"    asra
        ;
DC42 : FC    " "    db  $FC
        ;
DC43 : 11    " "    cba
        ;
DC44 : CF    " "    db  $CF
        ;
DC45 : BC 03 FC    "   "    cpx  X03FC
DC48 : 01    " "    nop
DC49 : E7 D8    "  "    stab  $D8,x
        ;
DC4B : 03 FC    "  "    db  $03, $FC
        ;
DC4D : 0A    " "    clv
DC4E : B7 D4 01    "   "    staa  XD401
DC51 : 7F C0 07    "   "    clr  XC007
DC54 : FE 81 1F    "   "    ldx  X811F
DC57 : F8 03 F1    "   "    eorb  X03F1
        ;
DC5A : C7 00    "  "    db  $C7, $00
        ;
DC5C : FF 05 70    "  p"    stx  X0570
DC5F : EF 02    "  "    stx  $02,x
        ;
DC61 : FC    " "    db  $FC
        ;
DC62 : 0F    " "    sei
DC63 : F0 0F C1    "   "    subb  X0FC1
        ;
DC66 : 1E C7 DC    "   "    db  $1E, $C7, $DC
        ;
DC69 : 19    " "    daa
DC6A : EA 1D    "  "    orab  $1D,x
DC6C : C0 AC    "  "    subb  #$AC
DC6E : 0F    " "    sei
DC6F : F8 07 D8    "   "    eorb  X07D8
        ;
DC72 : 71    "q"    db  $71
        ;
DC73 : AF AC    "  "    sts  $AC,x
DC75 : 01    " "    nop
DC76 : FE 00 BF    "   "    ldx  X00BF
        ;
DC79 : 41    "A"    db  $41
        ;
DC7A : 7E 47 E4    "~G "    jmp  L47E4
DC7D : 3B    ";"    rti
        ;
DC7E : C2 38    " 8"    sbcb  #$38
DC80 : 43    "C"    coma
        ;
DC81 : DC    " "    db  $DC
        ;
DC82 : 73 86 3E    "s >"    com  X863E
DC85 : 63 06    "c "    com  $06,x
DC87 : 7F 80 3D    "  ="    clr  X803D
DC8A : C1 8E    "  "    cmpb  #$8E
DC8C : 7C 33 D8    "|3 "    inc  X33D8
DC8F : 7C C3 B8    "|  "    inc  XC3B8
DC92 : 33    "3"    pulb
DC93 : 85 3D    " ="    bita  #$3D
        ;
DC95 : 52    "R"    db  $52
        ;
DC96 : 3B    ";"    rti
        ;
DC97 : 91 5F    " _"    cmpa  X005F
        ;
DC99 : 41 4B    "AK"    db  $41, $4B
        ;
DC9B : 7E 40 3F    "~@?"    jmp  L403F
        ;
DC9E : C0 EE    "  "    subb  #$EE
DCA0 : 10    " "    sba
DCA1 : 7F 96 30    "  0"    clr  X9630
DCA4 : 6F E0    "o "    clr  $E0,x
DCA6 : 67 0E    "g "    asr  $0E,x
DCA8 : F0 0F F0    "   "    subb  X0FF0
DCAB : 07    " "    tpa
DCAC : DF C0    "  "    stx  X00C0
DCAE : 0F    " "    sei
DCAF : F8 02 FF    "   "    eorb  X02FF
DCB2 : A0 2E    " ."    suba  $2E,x
DCB4 : E9 07    "  "    adcb  $07,x
DCB6 : F2 8B 1B    "   "    sbcb  X8B1B
DCB9 : F8 06 F8    "   "    eorb  X06F8
DCBC : 63 0D    "c "    com  $0D,x
DCBE : F8 0F 39    "  9"    eorb  X0F39
DCC1 : 88 17    "  "    eora  #$17
        ;
DCC3 : FC    " "    db  $FC
        ;
DCC4 : 06    " "    tap
DCC5 : CE F8 01    "   "    ldx  #$F801
DCC8 : FF 44 05    " D "    stx  X4405
DCCB : FF 01 3F    "  ?"    stx  X013F
DCCE : F0 03 FC    "   "    subb  X03FC
DCD1 : E0 07    "  "    subb  $07,x
DCD3 : F8 17 1D    "   "    eorb  X171D
DCD6 : E0 1F    "  "    subb  $1F,x
DCD8 : E1 86    "  "    cmpb  $86,x
DCDA : 7F C0 1E    "   "    clr  XC01E
DCDD : F4 C2 38    "  8"    andb  XC238
DCE0 : EF 01    "  "    stx  $01,x
DCE2 : 7D 8E 08    "}  "    tst  X8E08
DCE5 : FF 04 C8    "   "    stx  X04C8
DCE8 : FE 01 F3    "   "    ldx  X01F3
        ;
DCEB : 3D 00    "= "    db  $3D, $00
        ;
DCED : FE 2D 82    " - "    ldx  X2D82
DCF0 : BF 80 73    "  s"    sts  X8073
DCF3 : AF 70    " p"    sts  $70,x
        ;
DCF5 : 00    " "    db  $00
        ;
DCF6 : FF A1 C8    "   "    stx  XA1C8
DCF9 : FF 80 7E    "  ~"    stx  X807E
DCFC : 47    "G"    asra
        ;
DCFD : 00    " "    db  $00
        ;
DCFE : FF 0B 60    "  `"    stx  X0B60
DD01 : FE 82 38    "  8"    ldx  X8238
DD04 : EF 88    "  "    stx  $88,x
DD06 : 77 87 30    "w 0"    asr  X8730
DD09 : 57    "W"    asrb
DD0A : E8 67    " g"    eorb  $67,x
        ;
DD0C : 05    " "    db  $05
        ;
DD0D : FA 0F 19    "   "    orab  X0F19
        ;
DD10 : FC 05 F3    "   "    db  $FC, $05, $F3
        ;
DD13 : C0 0F    "  "    subb  #$0F
DD15 : F2 80 3F    "  ?"    sbcb  X803F
DD18 : E0 98    "  "    subb  $98,x
DD1A : 7F C0 7D    "  }"    clr  XC07D
DD1D : 56    "V"    rorb
DD1E : 80 FB    "  "    suba  #$FB
DD20 : A4 B2    "  "    anda  $B2,x
DD22 : 50    "P"    negb
DD23 : EF B0    "  "    stx  $B0,x
DD25 : B1 DE 04    "   "    cmpa  XDE04
DD28 : EB 9C    "  "    addb  $9C,x
DD2A : 01    " "    nop
DD2B : FE 42 27    " B'"    ldx  X4227
DD2E : F7 00 75    "  u"    stab  X0075
DD31 : F6 08 F7    "   "    ldab  X08F7
DD34 : 88 73    " s"    eora  #$73
        ;
DD36 : 8F    " "    db  $8F
        ;
DD37 : 30    "0"    tsx
DD38 : EE 01    "  "    ldx  $01,x
        ;
DD3A : FC C7 03    "   "    db  $FC, $C7, $03
        ;
DD3D : F8 07 B5    "   "    eorb  X07B5
DD40 : E0 0F    "  "    subb  $0F,x
DD42 : F0 A0 3F    "  ?"    subb  XA03F
DD45 : F0 16 7F    "   "    subb  X167F
DD48 : 80 7D    " }"    suba  #$7D
DD4A : 4F    "O"    clra
        ;
DD4B : 04    " "    db  $04
        ;
DD4C : F9 17 45    "  E"    adcb  X1745
DD4F : F0 88 EF    "   "    subb  X88EF
        ;
DD52 : 71    "q"    db  $71
        ;
DD53 : 01    " "    nop
DD54 : FE 04 EA    "   "    ldx  X04EA
        ;
DD57 : FC    " "    db  $FC
        ;
DD58 : 01    " "    nop
DD59 : FA 18 5B    "  ["    orab  X185B
        ;
DD5C : EC 05    "  "    db  $EC, $05
        ;
DD5E : EF 90    "  "    stx  $90,x
DD60 : 57    "W"    asrb
DD61 : 5F    "_"    clrb
DD62 : 40    "@"    nega
DD63 : 7C 5B 82    "|[ "    inc  X5B82
DD66 : 77 1D 41    "w A"    asr  X1D41
DD69 : BD 8E 07    "   "    jsr  L8E07
DD6C : F8 2E 23    " .#"    eorb  X2E23
DD6F : E0 7B    " {"    subb  $7B,x
DD71 : 0B    " "    sev
        ;
DD72 : 61    "a"    db  $61
        ;
DD73 : F4 1C E3    "   "    andb  X1CE3
DD76 : D4 3B    " ;"    andb  X003B
        ;
DD78 : 4B    "K"    db  $4B
        ;
DD79 : B0 55 F6    " U "    suba  X55F6
DD7C : 08    " "    inx
DD7D : AF E4    "  "    sts  $E4,x
DD7F : 11    " "    cba
DD80 : F4 77 85    " w "    andb  X7785
DD83 : D1 EC    "  "    cmpb  X00EC
        ;
DD85 : 1D    " "    db  $1D
        ;
DD86 : 43    "C"    coma
DD87 : F0 1F 45    "  E"    subb  X1F45
DD8A : 54    "T"    lsrb
DD8B : A6 FC    "  "    ldaa  $FC,x
        ;
DD8D : 15    " "    db  $15
        ;
DD8E : C2 FC    "  "    sbcb  #$FC
DD90 : 86 1F    "  "    ldaa  #$1F
DD92 : C2 E0    "  "    sbcb  #$E0
DD94 : BF 0A 63    "  c"    sts  X0A63
DD97 : BA 29 E0    " ) "    oraa  X29E0
DD9A : DE 3C    " <"    ldx  X003C
        ;
DD9C : C3    " "    db  $C3
        ;
DD9D : A2 7B    " {"    sbca  $7B,x
DD9F        LDD9F:
DD9F : 07    " "    tpa
DDA0 : 33    "3"    pulb
DDA1 : E1 15    "  "    cmpb  $15,x
DDA3 : 7D 03 33    "} 3"    tst  X0333
DDA6 : E9 18    "  "    adcb  $18,x
DDA8 : 3F    "?"    swi
DDA9 : C2 F4    "  "    sbcb  #$F4
        ;
DDAB : 55    "U"    db  $55
        ;
DDAC : A1 7C    " |"    cmpa  $7C,x
        ;
DDAE : 87 62    " b"    db  $87, $62
        ;
DDB0 : D8 55    " U"    eorb  X0055
DDB2 : E6 19    "  "    ldab  $19,x
        ;
DDB4 : F3 CC    "  "    db  $F3, $CC
        ;
DDB6 : 50    "P"    negb
DDB7 : DF 0D    "  "    stx  X000D
DDB9 : C0 DC    "  "    subb  #$DC
        ;
DDBB : 6B    "k"    db  $6B
        ;
DDBC : 86 11    "  "    ldaa  #$11
DDBE : FB 88 56    "  V"    addb  X8856
DDC1 : BF 80 AB    "   "    sts  X80AB
DDC4 : BD 54 2B    " T+"    jsr  L542B
DDC7 : A5 54    " T"    bita  $54,x
DDC9 : A5 B9    "  "    bita  $B9,x
DDCB : 29 2F    ")/"    bvs  LDDFC
        ;
DDCD        LDDCD:
DDCD : 72    "r"    db  $72
        ;
DDCE : 0A    " "    clv
DDCF : 5F    "_"    clrb
DDD0 : F4 50 77    " Pw"    andb  X5077
        ;
DDD3 : 38 41    "8A"    db  $38, $41
        ;
DDD5 : F9 62 16    " b "    adcb  X6216
DDD8 : BD 84 5A    "  Z"    jsr  L845A
DDDB : F5 44 6F    " Do"    bitb  X446F
DDDE : A5 15    "  "    bita  $15,x
        ;
DDE0 : DD 42    " B"    db  $DD, $42
        ;
DDE2 : B9 9C 88    "   "    adca  X9C88
DDE5 : EE 16    "  "    ldx  $16,x
DDE7 : F4 0D A8    "   "    andb  X0DA8
        ;
DDEA : FC    " "    db  $FC
        ;
DDEB : 0A    " "    clv
DDEC : EA D2    "  "    orab  $D2,x
DDEE : 2A AF    "* "    bpl  LDD9F
DDF0 : A0 AB    "  "    suba  $AB,x
DDF2 : 57    "W"    asrb
DDF3 : 50    "P"    negb
DDF4 : 97 D2    "  "    staa  X00D2
DDF6 : 94 6B    " k"    anda  X006B
DDF8 : D7 08    "  "    stab  X0008
        ;
DDFA : 6B    "k"    db  $6B
        ;
DDFB : BA 41 5F    " A_"    oraa  X415F
DDFE : 54    "T"    lsrb
DDFF : 4A    "J"    deca
DE00        LDE00:
DE00 : B7 6A 15    " j "    staa  X6A15
DE03 : AA F0    "  "    oraa  $F0,x
DE05 : 2B 59    "+Y"    bmi  LDE60
DE07 : E2 1B    "  "    sbcb  $1B,x
DE09 : D4 A2    "  "    andb  X00A2
DE0B : 95 FA    "  "    bita  X00FA
        ;
DE0D : 03    " "    db  $03
        ;
DE0E : D9 6A    " j"    adcb  X006A
DE10 : 0B    " "    sev
DE11 : EA 29    " )"    orab  $29,x
DE13 : 4D    "M"    tsta
DE14 : E5 4A    " J"    bitb  $4A,x
DE16 : 37    "7"    pshb
DE17 : C2 B8    "  "    sbcb  #$B8
DE19 : AA ED    "  "    oraa  $ED,x
        ;
DE1B : 14    " "    db  $14
        ;
DE1C : C5 BE    "  "    bitb  #$BE
DE1E : 22 AD    "" "    bhi  LDDCD
DE20 : A9 29    " )"    adca  $29,x
DE22 : 7E 81 56    "~ V"    jmp  L8156
        ;
DE25 : FA 48 AF    " H "    orab  X48AF
DE28 : 64 A5    "d "    lsr  $A5,x
DE2A : 2B D4    "+ "    bmi  LDE00
DE2C : 2B 47    "+G"    bmi  LDE75
DE2E : B0 6B 15    " k "    suba  X6B15
        ;
DE31 : 75    "u"    db  $75
        ;
DE32 : 16    " "    tab
DE33 : AD C2    "  "    jsr  $C2,x            ;INFO: index jump
DE35 : 5A    "Z"    decb
DE36 : AF 05    "  "    sts  $05,x
DE38 : 5A    "Z"    decb
DE39        XDE39:
DE39 : D5 2A    " *"    bitb  X002A
DE3B : AA B8    "  "    oraa  $B8,x
DE3D : 96 A9    "  "    ldaa  X00A9
        ;
DE3F : 72    "r"    db  $72
        ;
DE40 : 9A AA    "  "    oraa  X00AA
DE42 : D5 55    " U"    bitb  X0055
        ;
DE44 : 55    "U"    db  $55
        ;
DE45 : 54    "T"    lsrb
        ;
DE46 : 55    "U"    db  $55
        ;
DE47 : 30    "0"    tsx
DE48 : A8 CA    "  "    eora  $CA,x
DE4A : 73 55 CB    "sU "    com  X55CB
DE4D : A5 8A    "  "    bita  $8A,x
        ;
DE4F : 83    " "    db  $83
        ;
DE50 : 79 E6 13    "y  "    rol  XE613
        ;
DE53 : 1C    " "    db  $1C
        ;
DE54 : F1 2C 65    " ,e"    cmpb  X2C65
        ;
DE57 : 7B    "{"    db  $7B
        ;
DE58 : A0 F8    "  "    suba  $F8,x
DE5A : 9A D4    "  "    oraa  X00D4
        ;
DE5C : CC    " "    db  $CC
        ;
DE5D : 35    "5"    txs
DE5E : 9C 70    " p"    cpx  X0070
DE60        LDE60:
DE60 : F9 C7 86    "   "    adcb  XC786
DE63 : AB 44    " D"    adda  $44,x
DE65 : D9 64    " d"    adcb  X0064
DE67 : B2 9C CE    "   "    sbca  X9CCE
        ;
DE6A : 83    " "    db  $83
        ;
DE6B : 97 25    " %"    staa  X0025
DE6D : C6 EF    "  "    ldab  #$EF
DE6F : 19    " "    daa
DE70 : 0E    " "    cli
DE71 : 66 19    "f "    ror  $19,x
DE73 : A5 24    " $"    bita  $24,x
DE75        LDE75:
DE75 : E5 B9    "  "    bitb  $B9,x
DE77 : A4 2F    " /"    anda  $2F,x
DE79 : 39    "9"    rts
DE7A : 3B    ";"    rti
        ;
DE7B : 27 60    "'`"    beq  LDEDD
DE7D : 9F DA    "  "    sts  X00DA
DE7F : A7 0A    "  "    staa  $0A,x
        ;
DE81 : CD    " "    db  $CD
        ;
DE82 : AC ED    "  "    cpx  $ED,x
DE84 : 0C    " "    clc
DE85 : AD 13    "  "    jsr  $13,x            ;INFO: index jump
DE87 : 24 CD    "$ "    bcc  LDE56
DE89 : F0 33 58    " 3X"    subb  X3358
        ;
DE8C : CF    " "    db  $CF
        ;
DE8D : 0F    " "    sei
        ;
DE8E : 61    "a"    db  $61
        ;
DE8F : 8B 32    " 2"    adda  #$32
DE91 : 47    "G"    asra
DE92 : 0E    " "    cli
DE93 : 59    "Y"    rolb
DE94 : B1 A4 9C    "   "    cmpa  XA49C
DE97 : 64 E6    "d "    lsr  $E6,x
DE99 : E6 73    " s"    ldab  $73,x
DE9B : D6 39    " 9"    ldab  X0039
DE9D : D9 71    " q"    adcb  X0071
        ;
DE9F : 93    " "    db  $93
        ;
DEA0 : 34    "4"    des
DEA1 : 86 0B    "  "    ldaa  #$0B
        ;
DEA3 : 04    " "    db  $04
        ;
DEA4 : 58    "X"    aslb
DEA5 : 8B 39    " 9"    adda  #$39
DEA7 : E7 6F    " o"    stab  $6F,x
DEA9 : DB FA    "  "    addb  X00FA
DEAB : 77 1E 63    "w c"    asr  X1E63
        ;
DEAE : 18    " "    db  $18
        ;
DEAF : 84 32    " 2"    anda  #$32
DEB1 : 46    "F"    rora
DEB2 : 94 69    " i"    anda  X0069
DEB4 : B1 3A FD    " : "    cmpa  X3AFD
DEB7 : 6E 3D    "n="    jmp  $3D,x            ;INFO: index jump
        ;
DEB9 : C5 A3    "  "    bitb  #$A3
DEBB : 44    "D"    lsra
DEBC : 73 2B C5    "s+ "    com  X2BC5
DEBF : 22 
;last word data above
;
;*************************************;
; Copyright message
;*************************************;
DEC0 : 43    "C"                      ;COPYRIGHT
DEC1 : 4F    "O"                      ;
DEC2 : 50    "P"                      ;
DEC3 : 59    "Y"                      ;
DEC4 : 52    "R"                      ;
DEC5 : 49    "I"                      ;
DEC6 : 47    "G"                      ;
DEC7 : 48    "H"                      ;
DEC8 : 54    "T"                      ;
DEC9 : 20 2D    " -"                  ;-
DECB : 20 57    " W"                  ;WILLIAMS
DECD : 49    "I"                      ;
DECE : 4C    "L"                      ;
DECF : 4C    "L"                      ;
DED0 : 49    "I"                      ;
DED1 : 41    "A"                      ;
DED2 : 4D    "M"                      ;
DED3 : 53    "S"                      ;
DED4 : 20 45    " E"                  ;ELECTRONICS
DED6 : 4C    "L"                      ;
DED7 : 45    "E"                      ;
DED8 : 43    "C"                      ;
DED9 : 54    "T"                      ;
DEDA : 52    "R"                      ;
DEDB : 4F    "O"                      ;
DEDC : 4E    "N"                      ;
DEDD : 49    "I"                      ;
DEDE : 43    "C"                      ;
DEDF : 53    "S"                      ;
DEE0 : 20 38    " 8"                  ;8/15/79
DEE2 : 2F 31    "/1"                  ;
DEE4 : 35    "5"                      ;
DEE5 : 2F 37    "/7"                  ;
DEE7 : 39    "9"                      ;
DEE8 : 20 2D    " -"                  ;-
DEEA : 20 50    " P"                  ;PGD (Paul Dussault)
DEEC : 47    "G"                      ;
DEED : 44    "D"                      ;
;
;*************************************;
;  IRQ entry from Sound ROM, mask A
;*************************************;
;TALK, 7 words 
DEEE : 84 0F      anda  #$0F          ;and A with 0Fh (mask: 0000 xxxx)
DEF0 : 80 08      suba  #$08          ;sub A with 08h (sub: 0000 0xxx)
;*************************************;
; DIAGNOSTICS NMI entry from Sound ROM
;*************************************;
;TALKD
DEF2 : 48         asla                ;arith shift left A (C<-bit7 and bit0<-0)(0000 xxx0)
DEF3 : FE FF F6   ldx  $FFF6          ;load X FFF6 (Sound ROM, DFEE, JMPTBL below)
DEF6 : BD FF F3   jsr  LFFF3          ;jump sub ADDX (Sound ROM)
DEF9 : EE 00      ldx  $00,x          ;load X with X+00h
;*************************************;
; TALK IRQ processing
;*************************************;
;TKIRQ
DEFB : DF 06      stx  $06            ;store X in addr 06 (jmptbl addr)
;TKIRQ1
DEFD : DE 06      ldx  $06            ;load X with addr 06 (jmptbl addr)(eg.DF7A)
DEFF : EE 00      ldx  $00,x          ;load X with X+00h (romtbl value)(eg.C1C0)
DF01 : 26 01      bne  LDF04          ;branch Z=0 TKPRM
DF03 : 39         rts                 ;return subroutine
;*************************************;
; talk params, X = romtbl value
;*************************************;
;TKPRM
DF04 : DF 02      stx  $02            ;store X in addr 02(eg.C1C0)
DF06 : 96 02      ldaa  $02           ;load A with addr 02(eg.C1)
DF08 : 2A 12      bpl  LDF1C          ;branch N=0 TKPMLP
DF0A : DE 06      ldx  $06            ;load X with addr 06 (eg.DF7A)
DF0C : EE 02      ldx  $02,x          ;load X with X+02h (eg.C85F)
DF0E : DF 04      stx  $04            ;store X in addr 04 (eg.C85F)
DF10 : DE 06      ldx  $06            ;load X with addr 06 (eg.DF7A)
DF12 : 08         inx                 ;incr X
DF13 : 08         inx                 ;incr X
DF14 : 08         inx                 ;incr X
DF15 : 08         inx                 ;incr X (+4)(eg.DF7E)
DF16 : DF 06      stx  $06            ;store X in addr 06 (eg.DF7E)
DF18 : 8D 0D      bsr  LDF27          ;branch sub TKSC
DF1A : 20 E1      bra  LDEFD          ;branch always TKIRQ1
;TKPMLP - count down X
DF1C : 8D 4C      bsr  LDF6A          ;branch sub TKTMR
DF1E : 09         dex                 ;decr X
DF1F : 26 FB      bne  LDF1C          ;branch Z=0 TKPMLP
;
DF21 : DE 06      ldx  $06            ;load X with addr 06
DF23 : 08         inx                 ;incr X
DF24 : 08         inx                 ;incr X (+2)
DF25 : 20 D4      bra  LDEFB          ;branch always TKIRQ
;*************************************;
;TALKING speech clock (0403) pulse CB2
;*************************************;
;TKSC
DF27 : DE 02      ldx  $02            ;load X with addr 02(eg.C1C0)
DF29 : A6 00      ldaa  $00,x         ;load A with addr X+00h (eg value at 1st byte C1C0)
DF2B : 81 AA      cmpa  #$AA          ;compare A with AAh (stop byte?)
DF2D : 26 20      bne  LDF4F          ;branch Z=0 TKSCX
DF2F : 7F 00 00   clr  $0000          ;clear addr 0000
DF32 : 97 01      staa  $01           ;store A in addr 01
DF34 : 08         inx                 ;incr X (eg.C1C1)
DF35 : C6 08      ldab  #$08          ;load B with 08h
;TKSC1
DF37 : 86 3F      ldaa  #$3F          ;load A with 3Fh
DF39 : B7 04 03   staa  $0403         ;store A in PIA,CB2 Peripheral Control - speech clock
DF3C : 84 F7      anda  #$F7          ;and A(3Fh) with F7h = 37h(0011 0111)(bit3=0 LO)
DF3E : B7 04 03   staa  $0403         ;store A in PIA,CB2 Peripheral Control - speech clock
DF41 : 5A         decb                ;decr B (eg.07h)
DF42 : 26 0C      bne  LDF50          ;branch Z=0 TKSD
DF44 : C6 08      ldab  #$08          ;load B with 08h
DF46 : A6 00      ldaa  $00,x         ;load A with X+00h (eg. value in C1C1)
DF48 : 97 01      staa  $01           ;store A in addr 01
DF4A : 08         inx                 ;incr X (eg.C1C2)
DF4B : 9C 04      cpx  $04            ;compare X with addr 04 (eg.C85F)
DF4D : 26 08      bne  LDF57          ;branch Z=0 TKSD1
;TKSCX
DF4F : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech data (0401) pulse CA2
;*************************************;
;TKSD
DF50 : 6D 00      tst  $00,x          ;test X+00h (7 cycles)
DF52 : 6D 00      tst  $00,x          ;test X+00h (7 cycles)
DF54 : 6D 00      tst  $00,x          ;test X+00h (7 cycles)
DF56 : 01         nop                 ;nop        (2 cycles)(23)
;TKSD1
DF57 : 79 00 01   rol  $0001          ;rotate left addr 0001 
DF5A : 24 07      bcc  LDF63          ;branch C=0 TKSD2
DF5C : 86 3C      ldaa  #$3C          ;load A with 3Ch(0011 1100) (bit3=1 HI)
DF5E : B7 04 01   staa  $0401         ;store A(3Ch) in PIA,CA2 - speech data
DF61 : 20 D4      bra  LDF37          ;branch always TKSC1
;TKSD2
DF63 : 86 34      ldaa  #$34          ;load A with 34h (0011 0100) (bit3=0 LO)
DF65 : B7 04 01   staa  $0401         ;store A in PIA,CA2 - speech data
DF68 : 20 CD      bra  LDF37          ;branch always TKSC1
;*************************************;
;talk timer
;*************************************;
;TKTMR
DF6A : 86 94      ldaa  #$94          ;load A with 94h (148d)
;TKTMLP - count down A
DF6C : 4A         deca                ;decr A
DF6D : 26 FD      bne  LDF6C          ;TKTMLP
;
DF6F : 39         rts                 ;return subroutine
;*************************************;
;ROMTBL start of speech rom table jumps (7 words)
;*************************************;
;
DF70 : B000 BA6F BA70 C1BF            ;#1
DF78 : 00 00                          ;
;*************************************;
;
DF7A : C1C0 C85F                      ;#2 eg.
DF7E : 01 00                          ;
DF80 : C860 CE7F                      ;
DF84 : 02 00                          ;
DF86 : B000 BA6F 
DF8A : 00 00                          ;
;*************************************;
;
DF8C : CE80 D55F B000 BA6F            ;#3
DF94 : 01 00                          ;
DF96 : C860 CE7F CE80 D55F            ;
DF9E : 00 00                          ;
;*************************************;
;
DFA0 : C1C0 C85F                      ;#4
DFA4 : 00 80                          ;
DFA6 : C860 CE7F                      ;
DFAA : 01 00                          ;
DFAC : CE80 D55F                      ;
DFB0 : 00 00                          ;
;*************************************;
;
DFB2 : C1C0 C85F                      ;#5
DFB6 : 00 40                          ;
DFB8 : D560 DA9F                      ;
DFBC : 01 00                          ;
DFBE : B000 BA6F                      ;
DFC2 : 00 00                          ;
;*************************************;
;
DFC4 : CE80 D35F                      ;#6
DFC8 : 00 C0                          ;
DFCA : D560 DA9F                      ;
DFCE : 00 00                          ;
;*************************************;
;
DFD0 : CE80 D35F                      ;#7
DFD4 : 00 20                          ;
DFD6 : DAA0 DEBF                      ;
DFDA : 00 40                          ;
DFDC : C1C0 C85F                      ;
DFE0 : 00 00                          ;
;*************************************;
;
DFE2 : B000 BA6F                      ;#8
DFE6 : 00 00                          ;
;*************************************;
;TALKD NMI diagnostic call all words
DFE8 : B000 DEBF                      ;#9
DFEC : 00 00                          ;
;*************************************;
;jump table for ROM phonemes, processed by ADDX
;*************************************;
;JMPTBL (x9 jumps)
DFEE : DF 70                          ;#0(0000 0000)EE+0
DFF0 : DF 7A                          ;#1(0000 0010)EE+2
DFF2 : DF 8C                          ;#2(0000 0100)EE+4
DFF4 : DF A0                          ;#3(0000 0110)EE+6
DFF6 : DF B2                          ;#4(0000 1000)EE+8
DFF8 : DF C4                          ;#5(0000 1010)EE+A
DFFA : DF D0                          ;#6(0000 1100)EE+C
DFFC : DF E2                          ;#7(0000 1110)EE+E
DFFE : DF E8                          ;TALKD NMI all words
;*************************************;
;
;
;--------------------------------------------------------------





