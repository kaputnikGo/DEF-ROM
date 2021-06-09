        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    BlackKnightSpeech4.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  07B5
        ;  CRC-32:    F36F12E5
        ;
        ;  Date:    Fri May 21 11:27:10 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Black Knight Speech ROM, IC4 (5T 5004)
        ; TALK, TALKD entry routines for Speech
        ; contains laughter and "F and "R" sounds
        ;
          org  $E000
        ;
E000 : B7 45 63    " Ec"    staa  X4563
E003 : 7C 1E FF    "|  "    inc  X1EFF
E006 : FF FF 0E    "   "    stx  XFF0E
        ;
E009 : C7    " "    db  $C7
        ;
E00A : E2 28    " ("    sbcb  $28,x
E00C : 0C    " "    clc
E00D : 20 52    " R"    bra  LE061
        ;
E00F        XE00F:
E00F : B9 EF DF    "   "    adca  XEFDF
        ;
E012 : DD    " "    db  $DD
        ;
E013 : A2 71    " q"    sbca  $71,x
E015 : 3E    ">"    wai
E016 : 9E C7    "  "    lds  X00C7
E018 : 20 18    "  "    bra  LE032
        ;
E01A : 06    " "    tap
        ;
E01B : C7 71 18    " q "    db  $C7, $71, $18
        ;
E01E : 86 42    " B"    ldaa  #$42
E020 : B1 DA FE    "   "    cmpa  XDAFE
E023 : FE B6 8A    "   "    ldx  XB68A
        ;
E026 : E3    " "    db  $E3
        ;
E027        XE027:
E027 : 7C 9C 87    "|  "    inc  X9C87
        ;
E02A : 41    "A"    db  $41
        ;
E02B : 30    "0"    tsx
        ;
E02C : 18    " "    db  $18
        ;
E02D : C6 71    " q"    ldab  #$71
        ;
E02F : 38    "8"    db  $38
        ;
E030 : 96 45    " E"    ldaa  X0045
        ;
E032        LE032:
E032 : 55    "U"    db  $55
        ;
E033 : 56    "V"    rorb
E034 : EF F7    "  "    stx  $F7,x
E036 : B6 0A C7    "   "    ldaa  X0AC7
E039 : F9 3C 0B    " < "    adcb  X3C0B
E03C : 81 20    "  "    cmpa  #$20
        ;
E03E : 18    " "    db  $18
        ;
E03F : 47    "G"    asra
        ;
E040        LE040:
E040 : 6B 55 55    "kUU"    db  $6B, $55, $55
        ;
E043 : 95 4A    " J"    bita  X004A
        ;
E045 : 65    "e"    db  $65
        ;
E046 : F7 7A BB    " z "    stab  X7ABB
E049 : 0A    " "    clv
E04A : E7 F5    "  "    stab  $F5,x
        ;
E04C : 3C    "<"    db  $3C
        ;
E04D : 0E    " "    cli
E04E : 81 20    "  "    cmpa  #$20
        ;
E050 : 1C    " "    db  $1C
        ;
E051 : CB 69    " i"    addb  #$69
E053 : AA 56    " V"    oraa  $56,x
        ;
E055 : 55 55    "UU"    db  $55, $55
        ;
E057 : 29 55    ")U"    bvs  LE0AE
E059 : B5 BD CE    "   "    bita  XBDCE
E05C        LE05C:
E05C : F5 3C 87    " < "    bitb  X3C87
        ;
E05F : 42    "B"    db  $42
        ;
E060 : 28 29    "()"    bvc  LE08B
E062 : 95 96    "  "    bita  X0096
E064 : AA C6    "  "    oraa  $C6,x
E066 : A2 4A    " J"    sbca  $4A,x
        ;
E068 : 51    "Q"    db  $51
        ;
E069 : 5A    "Z"    decb
E06A : AB 5D    " ]"    adda  $5D,x
E06C : 8B 18    "  "    adda  #$18
E06E : AF D7    "  "    sts  $D7,x
E070 : 53    "S"    comb
E071 : 25 84    "% "    bcs  LDFF7
E073 : 24 2A    "$*"    bcc  LE09F
        ;
E075 : 55    "U"    db  $55
        ;
E076 : D7 BA    "  "    stab  X00BA
E078 : D6 A2    "  "    ldab  X00A2
E07A : 48    "H"    asla
E07B : AA 54    " T"    oraa  $54,x
E07D : 56    "V"    rorb
        ;
E07E : 55    "U"    db  $55
        ;
E07F : D6 7B    " {"    ldab  X007B
E081 : D5 A2    "  "    bitb  X00A2
E083 : 20 A4    "  "    bra  LE029
        ;
E085 : 28 D5    "( "    bvc  LE05C
E087 : AA DA    "  "    oraa  $DA,x
E089 : BB AA 29    "  )"    adda  XAA29
E08C : A5 AA    "  "    bita  $AA,x
E08E : 56    "V"    rorb
        ;
E08F : 61    "a"    db  $61
        ;
E090 : AA CA    "  "    oraa  $CA,x
E092 : F5 AA 08    "   "    bitb  XAA08
E095 : 91 42    " B"    cmpa  X0042
E097 : A9 AA    "  "    adca  $AA,x
E099 : 4A    "J"    deca
E09A : D7 BB    "  "    stab  X00BB
E09C : 5A    "Z"    decb
E09D : AB 50    " P"    adda  $50,x
E09F        LE09F:
E09F : D5 52    " R"    bitb  X0052
E0A1 : 5A    "Z"    decb
E0A2 : AA 52    " R"    oraa  $52,x
E0A4 : B5 14 8A    "   "    bita  X148A
E0A7 : A8 A4    "  "    eora  $A4,x
E0A9 : 2A 95    "* "    bpl  LE040
E0AB : AA 5E    " ^"    oraa  $5E,x
E0AD : 7D 6D 55    "}mU"    tst  X6D55
E0B0 : D5 62    " b"    bitb  X0062
        ;
E0B2 : 1A 15    "  "    db  $1A, $15
        ;
E0B4 : A5 A5    "  "    bita  $A5,x
E0B6 : AA 8A    "  "    oraa  $8A,x
E0B8 : 22 A9    "" "    bhi  LE063
        ;
E0BA : 52    "R"    db  $52
        ;
E0BB : D5 A9    "  "    bitb  X00A9
E0BD : 2A 5D    "*]"    bpl  LE11C
E0BF : AD 77    " w"    jsr  $77,x            ;INFO: index jump
        ;
E0C1 : 15    " "    db  $15
        ;
E0C2 : 95 5A    " Z"    bita  X005A
E0C4 : 2D 55    "-U"    blt  LE11B
E0C6 : AA 55    " U"    oraa  $55,x
        ;
E0C8 : 45 45    "EE"    db  $45, $45
        ;
E0CA : A4 DA    "  "    anda  $DA,x
E0CC : 54    "T"    lsrb
E0CD : AD 95    "  "    jsr  $95,x            ;INFO: index jump
E0CF : 0A    " "    clv
E0D0 : B5 5A 55    " ZU"    bita  X5A55
        ;
E0D3 : 15 55    " U"    db  $15, $55
        ;
E0D5 : 5D    "]"    tstb
E0D6 : A7 54    " T"    staa  $54,x
        ;
E0D8 : 55    "U"    db  $55
        ;
E0D9 : 8B 8A    "  "    adda  #$8A
E0DB : 8A AA    "  "    oraa  #$AA
E0DD : 6A 55    "jU"    dec  $55,x
E0DF : 5D    "]"    tstb
        ;
E0E0 : 15    " "    db  $15
        ;
E0E1 : 2A B5    "* "    bpl  LE098
E0E3 : AA 24    " $"    oraa  $24,x
E0E5 : 92 FF    "  "    sbca  X00FF
        ;
E0E7 : 05    " "    db  $05
        ;
E0E8 : 20 42    " B"    bra  LE12C
        ;
E0EA : D4 FF    "  "    andb  X00FF
E0EC : DF AE    "  "    stx  X00AE
E0EE : 8A 40    " @"    oraa  #$40
        ;
E0F0 : 52    "R"    db  $52
        ;
E0F1 : D5 F6    "  "    bitb  X00F6
E0F3 : 56    "V"    rorb
E0F4 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
E0F6 : A5 52    " R"    bita  $52,x
        ;
E0F8 : 52 FD    "R "    db  $52, $FD
        ;
E0FA : 17    " "    tba
        ;
E0FB : 00 00    "  "    db  $00, $00
        ;
E0FD : A4 F7    "  "    anda  $F7,x
E0FF : FF B7 55    "  U"    stx  XB755
        ;
E102 : 12    " "    db  $12
        ;
E103 : 44    "D"    lsra
E104 : 49    "I"    rola
E105 : AA 7B    " {"    oraa  $7B,x
E107 : 6D B7    "m "    tst  $B7,x
E109 : 8A 2A    " *"    oraa  #$2A
E10B : 89 6A    " j"    adca  #$6A
E10D : FF 1F 00    "   "    stx  X1F00
        ;
E110 : 00    " "    db  $00
        ;
E111 : 40    "@"    nega
E112 : FB FF DF    "   "    addb  XFFDF
E115 : AA 44    " D"    oraa  $44,x
E117 : 88 4A    " J"    eora  #$4A
E119 : A9 7B    " {"    adca  $7B,x
E11B        LE11B:
E11B : B5 BB 4A    "  J"    bita  XBB4A
E11E : 95 48    " H"    bita  X0048
E120 : F6 FF 00    "   "    ldab  XFF00
        ;
E123 : 00 00    "  "    db  $00, $00
        ;
E125 : BC FF FF    "   "    cpx  XFFFF
        ;
E128 : 52    "R"    db  $52
        ;
E129 : 49    "I"    rola
E12A : 44    "D"    lsra
E12B : B5 A4 7A    "  z"    bita  XA47A
        ;
E12E : 5B    "["    db  $5B
        ;
E12F : EF 15    "  "    stx  $15,x
E131        XE131:
E131 : A1 92    "  "    cmpa  $92,x
E133 : FE FF 00    "   "    ldx  XFF00
        ;
E136 : 00 00    "  "    db  $00, $00
        ;
E138        LE138:
E138 : FE FF 4F    "  O"    ldx  XFF4F
E13B : A4 52    " R"    anda  $52,x
E13D : B5 2A A4    " * "    bita  X2AA4
E140 : EE ED    "  "    ldx  $ED,x
E142 : BB 00 A9    "   "    adda  X00A9
E145 : F5 FF 03    "   "    bitb  XFF03
        ;
E148 : 00 00    "  "    db  $00, $00
        ;
E14A : FA FF 1F    "   "    orab  XFF1F
E14D : A0 EF    "  "    suba  $EF,x
E14F : AA 44    " D"    oraa  $44,x
E151        LE151:
E151 : 40    "@"    nega
        ;
E152 : FD    " "    db  $FD
        ;
E153 : 5F    "_"    clrb
E154 : AB 02    "  "    adda  $02,x
        ;
E156 : 62    "b"    db  $62
        ;
E157 : F7 FF 07    "   "    stab  XFF07
        ;
E15A : 00    " "    db  $00
        ;
E15B : F0 F7 FF    "   "    subb  XF7FF
E15E : 23 D8    "# "    bls  LE138
E160 : FF 03 48    "  H"    stx  X0348
E163 : E9 FE    "  "    adcb  $FE,x
E165 : 2F EA    "/ "    ble  LE151
        ;
E167 : 55    "U"    db  $55
        ;
E168 : D2 D6    "  "    sbcb  X00D6
E16A : FF 07 00    "   "    stx  X0700
        ;
E16D : FC CF    "  "    db  $FC, $CF
        ;
E16F : FE B3 FE    "   "    ldx  XB3FE
E172 : 7F 00 DC    "   "    clr  X00DC
E175 : A2 FF    "  "    sbca  $FF,x
E177 : A9 FF    "  "    adca  $FF,x
E179 : 85 48    " H"    bita  #$48
E17B : E9 FF    "  "    adcb  $FF,x
E17D : 01    " "    nop
E17E : C0 FF    "  "    subb  #$FF
        ;
E180        XE180:
E180 : 83    " "    db  $83
        ;
E181 : FF B9 FF    "   "    stx  XB9FF
E184 : 07    " "    tpa
E185 : E0 1F    "  "    subb  $1F,x
        ;
E187 : 00    " "    db  $00
        ;
E188 : 5F    "_"    clrb
E189 : EE 2F    " /"    ldx  $2F,x
E18B : 64 0A    "d "    lsr  $0A,x
        ;
E18D : FD    " "    db  $FD
        ;
E18E : 3F    "?"    swi
        ;
E18F : 00    " "    db  $00
E190        XE190:
E190 : FC    " "    db  $FC
        ;
E191 : 0F    " "    sei
E192 : E0 7F    "  "    subb  $7F,x
E194 : F7 3F 00    " ? "    stab  X3F00
E197 : FE 03 F8    "   "    ldx  X03F8
E19A : 85 BE    "  "    bita  #$BE
E19C : 44    "D"    lsra
        ;
E19D : 15    " "    db  $15
        ;
E19E : EB FF    "  "    addb  $FF,x
        ;
E1A0 : 05    " "    db  $05
        ;
E1A1 : 80 FF    "  "    suba  #$FF
        ;
E1A3 : 00    " "    db  $00
        ;
E1A4 : FE E7 FF    "   "    ldx  XE7FF
E1A7 : 01    " "    nop
E1A8 : F8 0F E0    "   "    eorb  X0FE0
        ;
E1AB : 1F    " "    db  $1F
        ;
E1AC : F4 0B A0    "   "    andb  X0BA0
E1AF : D5 ED    "  "    bitb  X00ED
E1B1 : BF 00 FC    "   "    sts  X00FC
E1B4 : 0F    " "    sei
E1B5 : C0 1F    "  "    subb  #$1F
        ;
E1B7 : FC 1F    "  "    db  $FC, $1F
        ;
E1B9        LE1B9:
E1B9 : C0 7F    "  "    subb  #$7F
        ;
E1BB : 00    " "    db  $00
        ;
E1BC : FF B0 3F    "  ?"    stx  XB03F
        ;
E1BF : 00 55    " U"    db  $00, $55
        ;
E1C1 : 7E FD 03    "~  "    jmp  LFD03
        ;
E1C4 : E0 3F    " ?"    subb  $3F,x
        ;
E1C6 : 00    " "    db  $00
        ;
E1C7 : 3F    "?"    swi
E1C8 : F8 7F C0    "   "    eorb  X7FC0
E1CB : 7F 80 2B    "  +"    clr  X802B
        ;
E1CE : FC    " "    db  $FC
        ;
E1CF : BF 02 A9    "   "    sts  X02A9
E1D2 : 2A 9D    "* "    bpl  LE171
E1D4 : 7F 00 FC    "   "    clr  X00FC
        ;
E1D7 : 03    " "    db  $03
        ;
E1D8 : F8 C0 FF    "   "    eorb  XC0FF
E1DB : C1 FF    "  "    cmpb  #$FF
E1DD : 82 1F    "  "    sbca  #$1F
E1DF : 80 FF    "  "    suba  #$FF
E1E1 : 4F    "O"    clra
E1E2 : 50    "P"    negb
        ;
E1E3 : DD 02    "  "    db  $DD, $02
        ;
E1E5 : EB 1F    "  "    addb  $1F,x
E1E7 : 80 7F    "  "    suba  #$7F
E1E9 : C0 06    "  "    subb  #$06
        ;
E1EB : FC    " "    db  $FC
        ;
E1EC : 3F    "?"    swi
E1ED : F8 4F 6D    " Om"    eorb  X4F6D
E1F0 : 01    " "    nop
E1F1 : EA FF    "  "    orab  $FF,x
        ;
E1F3 : 03 FC    "  "    db  $03, $FC
        ;
E1F5 : 25 C1    "% "    bcs  LE1B8
E1F7 : F1 0F C0    "   "    cmpb  X0FC0
        ;
E1FA : 1F    " "    db  $1F
        ;
E1FB : E0 02    "  "    subb  $02,x
E1FD : FE 01 FF    "   "    ldx  X01FF
        ;
E200 : FC 03    "  "    db  $FC, $03
        ;
E202 : B0 E4 3F    "  ?"    suba  XE43F
E205 : E0 1F    "  "    subb  $1F,x
        ;
E207 : 52    "R"    db  $52
        ;
E208 : C1 E9    "  "    cmpb  #$E9
E20A : 07    " "    tpa
E20B : C0 01    "  "    subb  #$01
        ;
E20D        XE20D:
E20D : 3C    "<"    db  $3C
        ;
E20E : C0 7F    "  "    subb  #$7F
E210 : F8 07 7F    "   "    eorb  X077F
        ;
E213 : 00    " "    db  $00
        ;
E214 : 0F    " "    sei
E215 : FE 01 FF    "   "    ldx  X01FF
E218 : 88 94    "  "    eora  #$94
E21A : 32    "2"    pula
E21B : F8 07 F0    "   "    eorb  X07F0
        ;
E21E : 02    " "    db  $02
        ;
E21F : 0F    " "    sei
E220 : F0 0F FF    "   "    subb  X0FFF
E223 : E0 1F    "  "    subb  $1F,x
        ;
E225 : 04 E3    "  "    db  $04, $E3
        ;
E227 : 0F    " "    sei
E228 : F0 3F 44    " ?D"    subb  X3F44
        ;
E22B : 1D    " "    db  $1D
        ;
E22C : A0 FF    "  "    suba  $FF,x
E22E : 01    " "    nop
        ;
E22F : 18    " "    db  $18
        ;
E230 : 80 01    "  "    suba  #$01
E232 : 7C E0 1F    "|  "    inc  XE01F
        ;
E235 : FC    " "    db  $FC
        ;
E236 : 20 81    "  "    bra  LE1B9
E238 : 7E 00 FE    "~  "    jmp  L00FE
        ;
E23B : 83    " "    db  $83
        ;
E23C : 5A    "Z"    decb
        ;
E23D : 02    " "    db  $02
        ;
E23E : FA FB 00    "   "    orab  XFB00
E241 : 0E    " "    cli
E242 : 80 00    "  "    suba  #$00
E244 : 7E EA 5F    "~ _"    jmp  LEA5F
        ;
E247 : FB 04 70    "  p"    addb  X0470
        ;
E24A : 1F    " "    db  $1F
        ;
E24B : 80 3F    " ?"    suba  #$3F
E24D : E9 8B    "  "    adcb  $8B,x
E24F : D0 52    " R"    subb  X0052
E251 : FE 1F 04    "   "    ldx  X1F04
        ;
E254 : 00 00    "  "    db  $00, $00
        ;
E256 : AD FD    "  "    jsr  $FD,x            ;INFO: index jump
E258 : FF BF 08    "   "    stx  XBF08
        ;
E25B : FC    " "    db  $FC
        ;
E25C : 01    " "    nop
E25D : 70 63 DF    "pc "    neg  X63DF
E260 : E2 3A    " :"    sbcb  $3A,x
E262 : A0 BF    "  "    suba  $BF,x
E264 : 07    " "    tpa
E265 : 01    " "    nop
        ;
E266 : 00    " "    db  $00
        ;
E267 : 80 6D    " m"    suba  #$6D
        ;
E269 : FD    " "    db  $FD
        ;
E26A : FF 5F 05    " _ "    stx  X5F05
        ;
E26D : FC 00    "  "    db  $FC, $00
        ;
E26F : 70 E5 5F    "p _"    neg  XE55F
E272 : F1 13 F8    "   "    cmpb  X13F8
        ;
E275 : 1F    " "    db  $1F
        ;
E276 : 0F    " "    sei
        ;
E277 : 00 00    "  "    db  $00, $00
        ;
E279 : C0 6A    " j"    subb  #$6A
E27B : FF FF 2F    "  /"    stx  XFF2F
E27E : 06    " "    tap
        ;
E27F : 5E 00    "^ "    db  $5E, $00
        ;
E281 : 9C F8    "  "    cpx  X00F8
E283 : 97 FC    "  "    staa  X00FC
E285 : 88 9E    "  "    eora  #$9E
E287 : 9F 07    "  "    sts  X0007
        ;
E289 : 00 00    "  "    db  $00, $00
        ;
E28B : A0 7A    " z"    suba  $7A,x
E28D : FF FF 6E    "  n"    stx  XFF6E
        ;
E290 : 05    " "    db  $05
        ;
E291 : 3E    ">"    wai
        ;
E292 : 00 45 FC C3  " E  "    db  $00, $45, $FC, $C3
        ;
E296 : 3F    "?"    swi
E297 : D8 A2    "  "    eorb  X00A2
E299 : BF 82 00    "   "    sts  X8200
        ;
E29C : 00    " "    db  $00
        ;
E29D : A0 B6    "  "    suba  $B6,x
E29F : FF FF 5B    "  ["    stx  XFF5B
E2A2 : 81 0F    "  "    cmpa  #$0F
E2A4 : A0 40    " @"    suba  $40,x
E2A6 : 7F F4 0B    "   "    clr  XF40B
E2A9 : BD F4 A7    "   "    jsr  LF4A7
E2AC : 01    " "    nop
        ;
E2AD : 00 00    "  "    db  $00, $00
        ;
E2AF : 28 EF    "( "    bvc  LE2A0
E2B1 : FF 7F 57    "  W"    stx  X7F57
E2B4 : C1 22    " ""    cmpb  #$22
E2B6 : 10    " "    sba
E2B7 : A5 2F    " /"    bita  $2F,x
E2B9 : BF 85 AB    "   "    sts  X85AB
        ;
E2BC : FD    " "    db  $FD
        ;
E2BD : 39    "9"    rts
        ;
E2BE : 00 00 00    "   "    db  $00, $00, $00
        ;
E2C1 : CA FB    "  "    orab  #$FB
E2C3 : FF BF 35    "  5"    stx  XBF35
E2C6 : 60 08    "` "    neg  $08,x
E2C8 : 54    "T"    lsrb
E2C9 : AB B7    "  "    adda  $B7,x
E2CB : DB 42    " B"    addb  X0042
E2CD : EB 3F    " ?"    addb  $3F,x
E2CF : 0B    " "    sev
        ;
E2D0 : 00 00    "  "    db  $00, $00
        ;
E2D2 : C0 F4    "  "    subb  #$F4
E2D4 : FF FF 6E    "  n"    stx  XFF6E
E2D7 : 0B    " "    sev
        ;
E2D8 : 18    " "    db  $18
        ;
E2D9 : 08    " "    inx
E2DA : B5 F6 D6    "   "    bita  XF6D6
E2DD : B5 B0 F5    "   "    bita  XB0F5
E2E0 : E7 00    "  "    stab  $00,x
        ;
E2E2 : 00 00    "  "    db  $00, $00
        ;
E2E4 : 58    "X"    aslb
        ;
E2E5 : FD    " "    db  $FD
        ;
E2E6 : FF DF AD    "   "    stx  XDFAD
        ;
E2E9 : 02    " "    db  $02
        ;
E2EA : 0C    " "    clc
E2EB : C4 B6    "  "    andb  #$B6
E2ED : 7E B5 AA    "~  "    jmp  LB5AA
        ;
E2F0 : 68 FD    "h "    asl  $FD,x
E2F2 : 2C 00    ", "    bge  LE2F4
        ;
E2F4        LE2F4:
E2F4 : 00 00    "  "    db  $00, $00
        ;
E2F6 : A7 FF    "  "    staa  $FF,x
E2F8 : DF F7    "  "    stx  X00F7
E2FA : 6A 10    "j "    dec  $10,x
E2FC : 08    " "    inx
E2FD : 9A D7    "  "    oraa  X00D7
E2FF : 7E D3 52    "~ R"    jmp  LD352
        ;
E302 : D4 1F    "  "    andb  X001F
        ;
E304 : 05 00 00    "   "    db  $05, $00, $00
        ;
E307 : D0 F5    "  "    subb  X00F5
E309 : FF FD AE    "   "    stx  XFDAE
E30C : 16    " "    tab
        ;
E30D : 02    " "    db  $02
        ;
E30E        LE30E:
E30E : 84 D6    "  "    anda  #$D6
E310 : BD 5F D5    " _ "    jsr  L5FD5
E313 : 24 F9    "$ "    bcc  LE30E
E315 : 43    "C"    coma
        ;
E316 : 00 00    "  "    db  $00, $00
        ;
E318 : 20 BC    "  "    bra  LE2D6
        ;
E31A : FE BF AF    "   "    ldx  XBFAF
E31D : A7 85    "  "    staa  $85,x
        ;
E31F : 00 52    " R"    db  $00, $52
        ;
E321 : EB 7E    " ~"    addb  $7E,x
E323 : AF 2A    " *"    sts  $2A,x
E325 : 85 FA    "  "    bita  #$FA
E327 : 01    " "    nop
E328 : 20 00    "  "    bra  LE32A
        ;
E32A        LE32A:
E32A : 88 5E    " ^"    eora  #$5E
E32C : FF DF B7    "   "    stx  XDFB7
E32F : B5 10 40    "  @"    bita  X1040
        ;
E332 : 71 ED    "q "    db  $71, $ED
        ;
E334 : F7 55 95    " U "    stab  X5595
E337 : 90 F6    "  "    suba  X00F6
E339 : 01    " "    nop
E33A : 10    " "    sba
        ;
E33B : 00 18 5B    "  ["    db  $00, $18, $5B
        ;
E33E : FF DF F7    "   "    stx  XDFF7
E341 : 4A    "J"    deca
E342 : 11    " "    cba
E343 : 50    "P"    negb
E344 : AC DE    "  "    cpx  $DE,x
E346 : BE 95 25    "  %"    lds  X9525
E349 : 50    "P"    negb
E34A : E9 07    "  "    adcb  $07,x
        ;
E34C : 41 00    "A "    db  $41, $00
        ;
E34E : 50    "P"    negb
E34F : B8 FD 7F    "   "    eora  XFD7F
E352 : DF 56    " V"    stx  X0056
E354 : 09    " "    dex
E355 : 86 D2    "  "    ldaa  #$D2
E357 : DA B7    "  "    orab  X00B7
E359 : B2 0A 28    "  ("    sbca  X0A28
E35C : 29 FD    ") "    bvs  LE35B
E35E : 69 20    "i "    rol  $20,x
        ;
E360        LE360:
E360 : 00    " "    db  $00
        ;
E361 : 10    " "    sba
E362 : DE DF    "  "    ldx  X00DF
E364 : EF EB    "  "    stx  $EB,x
E366 : E0 B2    "  "    subb  $B2,x
E368 : 68 B5    "h "    asl  $B5,x
E36A : 34    "4"    des
E36B        LE36B:
E36B : 2A 45    "*E"    bpl  LE3B2
        ;
E36D : 15    " "    db  $15
        ;
E36E : 85 D6    "  "    bita  #$D6
E370 : 3F    "?"    swi
E371 : 0D    " "    sec
        ;
E372 : 00 00 51    "  Q"    db  $00, $00, $51
        ;
E375 : F7 F7 BF    "   "    stab  XF7BF
E378 : BC 36 2D    " 6-"    cpx  X362D
E37B : 25 0A    "% "    bcs  LE387
E37D : 89 D2    "  "    adca  #$D2
E37F : AA D1    "  "    oraa  $D1,x
E381 : A6 F3    "  "    ldaa  $F3,x
E383 : 27 00    "' "    beq  LE385
E385        LE385:
E385 : 10    " "    sba
E386 : 28 AE    "( "    bvc  LE336
E388 : BF 9F DF    "   "    sts  X9FDF
E38B : 57    "W"    asrb
        ;
E38C : 4B    "K"    db  $4B
        ;
E38D : A1 20    "  "    cmpa  $20,x
        ;
E38F : 51    "Q"    db  $51
        ;
E390 : 69 BA    "i "    rol  $BA,x
E392 : 5A    "Z"    decb
E393 : AB 56    " V"    adda  $56,x
E395 : A5 52    " R"    bita  $52,x
        ;
E397 : 15    " "    db  $15
        ;
E398 : 10    " "    sba
        ;
E399 : 00    " "    db  $00
        ;
E39A : 49    "I"    rola
E39B : 89 FF    "  "    adca  #$FF
E39D : FF BB 55    "  U"    stx  XBB55
E3A0 : 28 24    "($"    bvc  LE3C6
E3A2 : 92 AA    "  "    sbca  X00AA
E3A4 : D6 6E    " n"    ldab  X006E
E3A6 : B7 4A 48    " JH"    staa  X4A48
E3A9 : 4A    "J"    deca
        ;
E3AA : 14 21 12    " ! "    db  $14, $21, $12
        ;
E3AD : 80 EF    "  "    suba  #$EF
        ;
E3AF : ED    " "    db  $ED
        ;
E3B0 : FF AA 4A    "  J"    stx  XAA4A
E3B3 : 09    " "    dex
E3B4 : 29 AA    ") "    bvs  LE360
E3B6 : AA ED    "  "    oraa  $ED,x
E3B8 : DB 4A    " J"    addb  X004A
E3BA : 11    " "    cba
        ;
E3BB : 41    "A"    db  $41
        ;
E3BC : 54    "T"    lsrb
E3BD : 2A 2D    "*-"    bpl  LE3EC
E3BF : 22 5E    ""^"    bhi  LE41F
        ;
E3C1 : ED    " "    db  $ED
        ;
E3C2 : AF A6    "  "    sts  $A6,x
E3C4 : A2 28    " ("    sbca  $28,x
E3C6        LE3C6:
E3C6 : 69 F5    "i "    rol  $F5,x
E3C8 : 5D    "]"    tstb
        ;
E3C9 : DD    " "    db  $DD
        ;
E3CA        LE3CA:
E3CA : 97 16    "  "    staa  X0016
        ;
E3CC : 45    "E"    db  $45
        ;
E3CD : 44    "D"    lsra
        ;
E3CE : 51    "Q"    db  $51
        ;
E3CF : 54    "T"    lsrb
        ;
E3D0 : 55 55    "UU"    db  $55, $55
        ;
E3D2 : 85 D7    "  "    bita  #$D7
E3D4 : EB 62    " b"    addb  $62,x
        ;
E3D6 : 21    "!"    db  $21
        ;
E3D7 : 28 92    "( "    bvc  LE36B
E3D9 : 5C    "\"    incb
E3DA : AF B7    "  "    sts  $B7,x
E3DC : D7 D5    "  "    stab  X00D5
E3DE : 4A    "J"    deca
E3DF : 91 28    " ("    cmpa  X0028
E3E1 : 95 AA    "  "    bita  X00AA
E3E3 : 56    "V"    rorb
E3E4 : 49    "I"    rola
E3E5 : F1 7A 75    " zu"    cmpb  X7A75
        ;
E3E8 : 14 02    "  "    db  $14, $02
        ;
E3EA : 11    " "    cba
E3EB : 49    "I"    rola
        ;
E3EC        LE3EC:
E3EC : 55    "U"    db  $55
        ;
E3ED : F7 F6 5D    "  ]"    stab  XF65D
        ;
E3F0 : 5B    "["    db  $5B
        ;
E3F1 : 95 AA    "  "    bita  X00AA
E3F3 : 22 D5    "" "    bhi  LE3CA
E3F5 : 4A    "J"    deca
E3F6 : BD 0A DD    "   "    jsr  L0ADD
E3F9 : C5 52    " R"    bitb  #$52
E3FB : A1 20    "  "    cmpa  $20,x
E3FD : 92 A8    "  "    sbca  X00A8
E3FF : 56    "V"    rorb
E400 : F7 AE AB    "   "    stab  XAEAB
E403        XE403:
E403 : AA AA    "  "    oraa  $AA,x
        ;
E405 : 52    "R"    db  $52
        ;
E406 : A9 DA    "  "    adca  $DA,x
E408 : 57    "W"    asrb
        ;
E409 : 55    "U"    db  $55
        ;
E40A : 2B A2    "+ "    bmi  LE3AE
E40C : AA AA    "  "    oraa  $AA,x
E40E : AA 0A    "  "    oraa  $0A,x
E410 : 48    "H"    asla
E411 : 8A 54    " T"    oraa  #$54
E413 : AB AD    "  "    adda  $AD,x
E415 : FA B6 55    "  U"    orab  XB655
        ;
E418 : 55    "U"    db  $55
        ;
E419 : A9 2A    " *"    adca  $2A,x
E41B : 54    "T"    lsrb
        ;
E41C : 5B 52    "[R"    db  $5B, $52
        ;
E41E : 49    "I"    rola
E41F        LE41F:
E41F : B5 EE 8A    "   "    bita  XEE8A
E422 : 2A 81    "* "    bpl  LE3A5
E424 : 2A 51    "*Q"    bpl  LE477
        ;
E426 : 55 75    "Uu"    db  $55, $75
        ;
E428 : DF 56    " V"    stx  X0056
E42A : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
E42C : 0A    " "    clv
E42D : A9 55    " U"    adca  $55,x
E42F : AA 94    "  "    oraa  $94,x
E431 : 6A 55    "jU"    dec  $55,x
        ;
E433 : 55 55    "UU"    db  $55, $55
        ;
E435 : A9 0B    "  "    adca  $0B,x
E437 : 54    "T"    lsrb
E438 : 95 E8    "  "    bita  X00E8
E43A : 76 B5 DA    "v  "    ror  XB5DA
E43D : 56    "V"    rorb
E43E : 85 76    " v"    bita  #$76
E440 : 8B 54    " T"    adda  #$54
E442 : A9 B5    "  "    adca  $B5,x
E444 : AA 92    "  "    oraa  $92,x
E446 : A8 AA    "  "    eora  $AA,x
        ;
E448 : 45    "E"    db  $45
        ;
E449 : EA 8A    "  "    orab  $8A,x
E44B : AA F5    "  "    oraa  $F5,x
        ;
E44D : 52 55    "RU"    db  $52, $55
        ;
E44F : AA 92    "  "    oraa  $92,x
E451 : 7A 15 AA    "z  "    dec  X15AA
E454 : 95 56    " V"    bita  X0056
        ;
E456 : 51    "Q"    db  $51
        ;
E457 : 95 5E    " ^"    bita  X005E
        ;
E459 : A3    " "    db  $A3
        ;
E45A : F7 35 54    " 5T"    stab  X3554
E45D : 47    "G"    asra
E45E : E2 3E    " >"    sbcb  $3E,x
E460 : FF 03 A0    "   "    stx  X03A0
E463 : 80 4F    " O"    suba  #$4F
E465 : FA AD FA    "   "    orab  XADFA
        ;
E468 : 55 4B    "UK"    db  $55, $4B
        ;
E46A : D0 FF    "  "    subb  X00FF
E46C : 3F    "?"    swi
        ;
E46D : 00 7B    " {"    db  $00, $7B
        ;
E46F : F0 1F E0    "   "    subb  X1FE0
        ;
E472 : CF    " "    db  $CF
        ;
E473 : FF 00 9E    "   "    stx  X009E
        ;
E476 : 75    "u"    db  $75
        ;
E477        LE477:
E477 : C0 3F    " ?"    subb  #$3F
E479 : 80 7F    "  "    suba  #$7F
E47B : 80 FF    "  "    suba  #$FF
E47D : 07    " "    tpa
E47E : F0 07 FF    "   "    subb  X07FF
E481 : 81 3F    " ?"    cmpa  #$3F
E483 : F8 0F E0    "   "    eorb  X0FE0
        ;
E486 : E3 04    "  "    db  $E3, $04
        ;
E488 : FE 80 FD    "   "    ldx  X80FD
        ;
E48B : 05    " "    db  $05
        ;
E48C : F0 FF 01    "   "    subb  XFF01
E48F : FE C1 1F    "   "    ldx  XC11F
E492 : F0 07 FF    "   "    subb  X07FF
E495 : 01    " "    nop
E496 : BC 1E E0    "   "    cpx  X1EE0
E499 : 27 F8    "' "    beq  LE493
        ;
E49B : 9D 00    "  "    db  $9D, $00
        ;
E49D : FE FF 00    "   "    ldx  XFF00
E4A0 : 3E    ">"    wai
E4A1 : C0 07    "  "    subb  #$07
E4A3 : F8 80 3F    "  ?"    eorb  X803F
E4A6 : E0 C1    "  "    subb  $C1,x
        ;
E4A8 : 1F    " "    db  $1F
        ;
E4A9 : AC E1    "  "    cpx  $E1,x
E4AB : E8 1E    "  "    eorb  $1E,x
E4AD : 08    " "    inx
E4AE : FA FF 00    "   "    orab  XFF00
E4B1 : 3E    ">"    wai
E4B2 : C0 07    "  "    subb  #$07
E4B4 : F8 C0 1F    "   "    eorb  XC01F
E4B7 : BC C0 0F    "   "    cpx  XC00F
E4BA : 0F    " "    sei
        ;
E4BB : DC    " "    db  $DC
        ;
E4BC : E1 2D    " -"    cmpb  $2D,x
        ;
E4BE : 04    " "    db  $04
        ;
E4BF : EE E5    "  "    ldx  $E5,x
E4C1 : 0F    " "    sei
E4C2 : F0 01 1F    "   "    subb  X011F
E4C5 : F8 83 7F    "   "    eorb  X837F
E4C8 : F8 C0 1F    "   "    eorb  XC01F
        ;
E4CB : 1F    " "    db  $1F
        ;
E4CC : F8 D0 1F    "   "    eorb  XD01F
E4CF : 0B    " "    sev
E4D0 : 7E F0 FF    "~  "    jmp  LF0FF
        ;
E4D3 : 2A FD    "* "    bpl  LE4D2
E4D5 : AA FD    "  "    oraa  $FD,x
        ;
E4D7 : 1F    " "    db  $1F
        ;
E4D8 : 40    "@"    nega
        ;
E4D9 : 00    " "    db  $00
        ;
E4DA : 60 BF    "` "    neg  $BF,x
E4DC : FF AF 4A    "  J"    stx  XAF4A
E4DF : 95 50    " P"    bita  X0050
E4E1 : AD 89    "  "    jsr  $89,x            ;INFO: index jump
        ;
E4E3 : 14    " "    db  $14
        ;
E4E4 : 91 7A    " z"    cmpa  X007A
E4E6 : EF 5D    " ]"    stx  $5D,x
        ;
E4E8 : 15    " "    db  $15
        ;
E4E9 : 24 A5    "$ "    bcc  LE490
E4EB : 6A DB    "j "    dec  $DB,x
        ;
E4ED : FD    " "    db  $FD
        ;
E4EE : 7F 00 08    "   "    clr  X0008
        ;
E4F1 : 00    " "    db  $00
        ;
E4F2 : FA BE FF    "   "    orab  XBEFF
E4F5 : 57    "W"    asrb
E4F6 : 29 11    ") "    bvs  LE509
E4F8 : 69 55    "iU"    rol  $55,x
E4FA : 92 92    "  "    sbca  X0092
E4FC : D4 EF    "  "    andb  X00EF
E4FE : 6D 95    "m "    tst  $95,x
E500 : 80 A4    "  "    suba  #$A4
E502 : 6A BB    "j "    dec  $BB,x
        ;
E504 : 5B FD    "[ "    db  $5B, $FD
        ;
E506 : 3F    "?"    swi
        ;
E507 : 00 02 00    "   "    db  $00, $02, $00
        ;
E50A : DF FD    "  "    stx  X00FD
E50C : FF AA 8A    "   "    stx  XAA8A
E50F : 20 55    " U"    bra  LE566
        ;
E511 : 25 55    "%U"    bcs  LE568
E513 : A5 FD    "  "    bita  $FD,x
E515 : 6D AB    "m "    tst  $AB,x
        ;
E517 : 00 21    " !"    db  $00, $21
        ;
E519 : A5 B6    "  "    bita  $B6,x
E51B : F6 DB FF    "   "    ldab  XDBFF
        ;
E51E : 03    " "    db  $03
        ;
E51F : 20 00    "  "    bra  LE521
        ;
E521        LE521:
E521 : 70 DF FF    "p  "    neg  XDFFF
E524 : AF 2A    " *"    sts  $2A,x
E526 : 81 A8    "  "    cmpa  #$A8
E528 : 11    " "    cba
E529 : 6D A5    "m "    tst  $A5,x
E52B : FE B5 AD    "   "    ldx  XB5AD
E52E : 80 84    "  "    suba  #$84
E530 : 50    "P"    negb
        ;
E531 : 55 ED    "U "    db  $55, $ED
        ;
E533 : EF FF    "  "    stx  $FF,x
        ;
E535 : 03    " "    db  $03
        ;
E536 : 08    " "    inx
        ;
E537 : 00    " "    db  $00
        ;
E538 : E0 F7    "  "    subb  $F7,x
E53A : FF 4F 55    " OU"    stx  X4F55
E53D : 40    "@"    nega
E53E : AA A4    "  "    oraa  $A4,x
E540 : B6 D2 BD    "   "    ldaa  XD2BD
E543 : DA 56    " V"    orab  X0056
E545 : 20 09    "  "    bra  LE550
        ;
E547 : D0 4A    " J"    subb  X004A
        ;
E549 : ED    " "    db  $ED
        ;
E54A : FF FF 00    "   "    stx  XFF00
        ;
E54D : 05 00    "  "    db  $05, $00
        ;
E54F : 74 FF FF    "t  "    lsr  XFFFF
        ;
E552 : 45    "E"    db  $45
        ;
E553 : 2B 40    "+@"    bmi  LE595
        ;
E555 : 5B    "["    db  $5B
        ;
E556 : A4 57    " W"    anda  $57,x
E558 : D4 57    " W"    andb  X0057
E55A : F5 0A 29    "  )"    bitb  X0A29
        ;
E55D : 21    "!"    db  $21
        ;
E55E : A4 A4    "  "    anda  $A4,x
E560 : FE FF 0F    "   "    ldx  XFF0F
E563 : 10    " "    sba
        ;
E564 : 00    " "    db  $00
        ;
E565 : F0 FB FF    "   "    subb  XFBFF
E568        LE568:
E568 : 07    " "    tpa
E569 : B8 00 F7    "   "    eora  X00F7
E56C : 4A    "J"    deca
E56D : 5D    "]"    tstb
        ;
E56E : 41    "A"    db  $41
        ;
E56F : 6F E9    "o "    clr  $E9,x
E571 : 1B    " "    aba
        ;
E572 : 51 05    "Q "    db  $51, $05
        ;
E574 : 54    "T"    lsrb
E575 : 49    "I"    rola
        ;
E576 : FD    " "    db  $FD
        ;
E577 : FF 01 07    "   "    stx  X0107
        ;
E57A : 00    " "    db  $00
        ;
E57B : FF FF FF    "   "    stx  XFFFF
E57E : 01    " "    nop
E57F : 0D    " "    sec
E580 : E0 2F    " /"    subb  $2F,x
E582 : FE 02 7B    "  {"    ldx  X027B
E585 : D1 3E    " >"    cmpb  X003E
E587 : A1 2B    " +"    cmpa  $2B,x
E589 : D0 22    " ""    subb  X0022
E58B : FF 1F 40    "  @"    stx  X1F40
        ;
E58E : 00 FC    "  "    db  $00, $FC
        ;
E590 : FF FF 07    "   "    stx  XFF07
E593 : F0 C1 FF    "   "    subb  XC1FF
E596 : A1 05    "  "    cmpa  $05,x
E598 : F8 6B BF    " k "    eorb  X6BBF
E59B : C0 8A    "  "    subb  #$8A
E59D : DA AA    "  "    orab  X00AA
E59F : FF 07 20    "   "    stx  X0720
        ;
E5A2 : 00    " "    db  $00
        ;
E5A3 : FF FF FF    "   "    stx  XFFFF
        ;
E5A6 : 00    " "    db  $00
        ;
E5A7 : FE FA 0F    "   "    ldx  XFA0F
E5AA : A8 D5    "  "    eora  $D5,x
E5AC : FF A1 01    "   "    stx  XA101
E5AF : 7C 77 25    "|w%"    inc  X7725
E5B2 : F2 3F 80    " ? "    sbcb  X3F80
E5B5 : 01    " "    nop
E5B6 : F0 7F F8    "   "    subb  X7FF8
        ;
E5B9 : 00 FC 8F    "   "    db  $00, $FC, $8F
        ;
E5BC : 0F    " "    sei
E5BD : E0 AB    "  "    subb  $AB,x
E5BF : 2F 00    "/ "    ble  LE5C1
E5C1        LE5C1:
E5C1        XE5C1:
E5C1 : 9F FE    "  "    sts  X00FE
        ;
E5C3 : 03 00    "  "    db  $03, $00
        ;
E5C5 : F4 7F 00    "   "    andb  X7F00
        ;
E5C8 : 02    " "    db  $02
        ;
E5C9 : F8 1F 80    "   "    eorb  X1F80
        ;
E5CC : 00    " "    db  $00
        ;
E5CD : FF 01 00    "   "    stx  X0100
E5D0 : FE 07 89    "   "    ldx  X0789
E5D3 : A8 17    "  "    eora  $17,x
E5D5 : 29 AA    ") "    bvs  LE581
E5D7 : F6 4A 15    " J "    ldab  X4A15
E5DA : B5 6A C8    " j "    bita  X6AC8
E5DD : B5 CE 94    "   "    bita  XCE94
        ;
E5E0 : 52    "R"    db  $52
        ;
E5E1 : 95 8F    "  "    bita  X008F
E5E3 : BA 2A 45    " *E"    oraa  X2A45
E5E6 : 2E 7A    ".z"    bgt  LE662
E5E8 : E8 52    " R"    eorb  $52,x
E5EA : 0B    " "    sev
        ;
E5EB : 1F    " "    db  $1F
        ;
E5EC : 74 F4 A1    "t  "    lsr  XF4A1
E5EF : AD 65    " e"    jsr  $65,x            ;INFO: index jump
E5F1 : 43    "C"    coma
        ;
E5F2 : 1F 3C FC    " < "    db  $1F, $3C, $FC
        ;
E5F5 : D0 D1    "  "    subb  X00D1
        ;
E5F7 : 45 93 15 9D  "E   "    db  $45, $93, $15, $9D
        ;
E5FB : AA E8    "  "    oraa  $E8,x
E5FD : 95 2E    " ."    bita  X002E
E5FF : 2D 6C    "-l"    blt  LE66D
E601 : B9 78 85    " x "    adca  X7885
E604 : A5 47    " G"    bita  $47,x
E606        LE606:
E606 : 0B    " "    sev
E607 : 7D F0 16    "}  "    tst  XF016
E60A : 29 FA    ") "    bvs  LE606
E60C : D0 07    "  "    subb  X0007
E60E : 7C 7C C1    "|| "    inc  X7CC1
E611 : 0B    " "    sev
E612 : BD AA 03    "   "    jsr  LAA03
        ;
E615 : 1F    " "    db  $1F
        ;
E616 : 7A A4 D6    "z  "    dec  XA4D6
        ;
E619 : 1A    " "    db  $1A
        ;
E61A : B6 D0 07    "   "    ldaa  XD007
E61D : 0F    " "    sei
E61E : BE 60 17    " ` "    lds  X6017
E621 : BD B8 A0    "   "    jsr  LB8A0
E624 : 57    "W"    asrb
E625 : 0F    " "    sei
E626 : 86 DE    "  "    ldaa  #$DE
E628 : 5C    "\"    incb
E629 : D1 A3    "  "    cmpb  X00A3
E62B : 3B    ";"    rti
        ;
E62C : E0 0F    "  "    subb  $0F,x
E62E : F8 42 3B    " B;"    eorb  X423B
E631 : E0 0F    "  "    subb  $0F,x
        ;
E633 : 3C    "<"    db  $3C
        ;
E634 : B1 F8 03    "   "    cmpa  XF803
E637 : 3F    "?"    swi
E638 : F8 D2 1F    "   "    eorb  XD21F
E63B : 69 C8    "i "    rol  $C8,x
E63D : A2 0B    "  "    sbca  $0B,x
        ;
E63F : 14    " "    db  $14
        ;
E640 : AA 4A    " J"    oraa  $4A,x
E642 : 17    " "    tba
E643 : F0 C7 FF    "   "    subb  XC7FF
E646 : 7F 01 16    "   "    clr  X0116
E649 : EE 80    "  "    ldx  $80,x
E64B : 26 A0    "& "    bne  LE5ED
E64D : 40    "@"    nega
E64E : 5D    "]"    tstb
E64F : E0 FF    "  "    subb  $FF,x
E651 : 3F    "?"    swi
E652 : 80 FF    "  "    suba  #$FF
        ;
E654 : 1D    " "    db  $1D
        ;
E655 : 80 81    "  "    suba  #$81
E657 : 0F    " "    sei
E658 : 10    " "    sba
E659 : F0 FF 0F    "   "    subb  XFF0F
E65C : E0 7F    "  "    subb  $7F,x
        ;
E65E : 03    " "    db  $03
        ;
E65F : E0 F8    "  "    subb  $F8,x
        ;
E661 : 00    " "    db  $00
        ;
E662        LE662:
E662 : 80 FF    "  "    suba  #$FF
E664 : 3B    ";"    rti
        ;
E665 : 80 FF    "  "    suba  #$FF
E667 : 09    " "    dex
E668 : C0 07    "  "    subb  #$07
E66A : 01    " "    nop
E66B : F0 FF 07    "   "    subb  XFF07
E66E : F0 BF 01    "   "    subb  XBF01
        ;
E671 : 3C    "<"    db  $3C
        ;
E672 : 54    "T"    lsrb
E673 : 80 FF    "  "    suba  #$FF
E675 : 3F    "?"    swi
E676 : C0 FF    "  "    subb  #$FF
E678 : 0D    " "    sec
E679 : C0 53    " S"    subb  #$53
        ;
E67B : 00    " "    db  $00
        ;
E67C : FE 7F 00    "   "    ldx  X7F00
E67F : BF 3F 00    " ? "    sts  X3F00
E682 : C6 80    "  "    ldab  #$80
E684 : FF 7E 80    " ~ "    stx  X7E80
E687 : DF 1F    "  "    stx  X001F
E689 : 80 43    " C"    suba  #$43
E68B : 80 FF    "  "    suba  #$FF
E68D : 3F    "?"    swi
E68E : 80 FF    "  "    suba  #$FF
E690 : 0B    " "    sev
E691 : C0 03    "  "    subb  #$03
E693 : E0 FF    "  "    subb  $FF,x
        ;
E695 : 1F    " "    db  $1F
        ;
E696 : E0 FB    "  "    subb  $FB,x
        ;
E698 : 03    " "    db  $03
        ;
E699 : E0 00    "  "    subb  $00,x
        ;
E69B : FC    " "    db  $FC
        ;
E69C : FF 03 FC    "   "    stx  X03FC
        ;
E69F : FC 00    "  "    db  $FC, $00
        ;
E6A1 : 39    "9"    rts
        ;
E6A2 : 00    " "    db  $00
        ;
E6A3 : FF 7F 80    "   "    stx  X7F80
E6A6 : 9F 33    " 3"    sts  X0033
E6A8 : 60 07    "` "    neg  $07,x
E6AA : E0 DF    "  "    subb  $DF,x
E6AC : 0F    " "    sei
E6AD : F8 73 03    " s "    eorb  X7303
E6B0 : 76 00 FE    "v  "    ror  X00FE
        ;
E6B3 : FD 00    "  "    db  $FD, $00
        ;
E6B5 : BF 37 00    " 7 "    sts  X3700
E6B8 : 0F    " "    sei
E6B9 : F0 E7 07    "   "    subb  XE707
E6BC : F8 BD 03    "   "    eorb  XBD03
        ;
E6BF : 38    "8"    db  $38
        ;
E6C0 : C0 3F    " ?"    subb  #$3F
E6C2 : 3F    "?"    swi
E6C3 : E0 EF    "  "    subb  $EF,x
E6C5 : 0E    " "    cli
E6C6 : C0 01    "  "    subb  #$01
E6C8 : FF EC 80    "   "    stx  XEC80
E6CB : 3F    "?"    swi
E6CC : 79 41 07    "yA "    rol  X4107
        ;
E6CF : FC    " "    db  $FC
        ;
E6D0 : F1 01 FE    "   "    cmpb  X01FE
E6D3 : E6 80    "  "    ldab  $80,x
E6D5 : 0D    " "    sec
E6D6 : F8 E7 07    "   "    eorb  XE707
        ;
E6D9 : FC CC 03 1F  "    "    db  $FC, $CC, $03, $1F
        ;
E6DD : F0 C7 07    "   "    subb  XC707
E6E0 : F8 8F 03    "   "    eorb  X8F03
E6E3 : 3B    ";"    rti
        ;
E6E4 : F0 C7 07    "   "    subb  XC707
E6E7 : F8 8D 03    "   "    eorb  X8D03
E6EA : 3F    "?"    swi
E6EB : F0 07 07    "   "    subb  X0707
E6EE : F8 8F 01    "   "    eorb  X8F01
        ;
E6F1 : 3C FC 83 03  "<   "    db  $3C, $FC, $83, $03
        ;
E6F5 : FE C3 C0    "   "    ldx  XC3C0
E6F8 : 0C    " "    clc
E6F9 : FE E9 00    "   "    ldx  XE900
E6FC : FF 61 30    " a0"    stx  X6130
E6FF : 82 7F    "  "    sbca  #$7F
E701 : 78 C0 7F    "x  "    asl  XC07F
        ;
E704 : 38    "8"    db  $38
        ;
E705 : 08    " "    inx
E706 : E1 3F    " ?"    cmpb  $3F,x
E708 : 0C    " "    clc
E709 : F8 17 1E    "   "    eorb  X171E
        ;
E70C : 42    "B"    db  $42
        ;
E70D : F8 1F 03    "   "    eorb  X1F03
        ;
E710 : FC 87 83 00  "    "    db  $FC, $87, $83, $00
        ;
E714 : FE C7 01    "   "    ldx  XC701
E717 : 7F E1 31    "  1"    clr  XE131
        ;
E71A : 00    " "    db  $00
        ;
E71B : FF 3B C0    " ; "    stx  X3BC0
E71E : 3F    "?"    swi
E71F : 30    "0"    tsx
E720 : 0E    " "    cli
E721 : E0 5F    " _"    subb  $5F,x
E723 : 0E    " "    cli
E724 : F8 17 16    "   "    eorb  X1716
E727 : 07    " "    tpa
E728 : F8 37 03    " 7 "    eorb  X3703
        ;
E72B : FC 87    "  "    db  $FC, $87
        ;
E72D : C5 00    "  "    bitb  #$00
E72F : FF FC 80    "   "    stx  XFC80
E732 : 3F    "?"    swi
E733 : 31    "1"    ins
        ;
E734 : 1E    " "    db  $1E
        ;
E735 : C0 3F    " ?"    subb  #$3F
        ;
E737 : 1D    " "    db  $1D
        ;
E738 : F0 27 DC    " ' "    subb  X27DC
        ;
E73B : 05    " "    db  $05
        ;
E73C : F8 B3 03    "   "    eorb  XB303
E73F : FE C4 58    "  X"    ldx  XC458
        ;
E742 : 00    " "    db  $00
        ;
E743 : 7F 76 C0    " v "    clr  X76C0
E746 : 9F 30    " 0"    sts  X0030
        ;
E748 : 1C    " "    db  $1C
        ;
E749 : F0 27 07    " ' "    subb  X2707
        ;
E74C : FC    " "    db  $FC
        ;
E74D : 81 BD    "  "    cmpa  #$BD
        ;
E74F : 00    " "    db  $00
        ;
E750 : FF 7C C0    " | "    stx  X7CC0
        ;
E753 : 1F    " "    db  $1F
        ;
E754 : 30    "0"    tsx
        ;
E755 : 72    "r"    db  $72
        ;
E756 : F0 AA F8    "   "    subb  XAAF8
        ;
E759 : 45 41    "EA"    db  $45, $41
        ;
E75B : BF D0 95    "   "    sts  XD095
E75E : 0F    " "    sei
E75F : F8 99 1A    "   "    eorb  X991A
E762 : 7A 72 43    "zrC"    dec  X7243
        ;
E765 : CC    " "    db  $CC
        ;
E766 : FA 03 7E    "  ~"    orab  X037E
E769 : E4 85    "  "    andb  $85,x
        ;
E76B : 3D    "="    db  $3D
        ;
E76C : E0 A7    "  "    subb  $A7,x
E76E : 2E 3A    ".:"    bgt  LE7AA
E770 : E8 57    " W"    eorb  $57,x
        ;
E772 : 41    "A"    db  $41
        ;
E773 : F0 0F BC    "   "    subb  X0FBC
E776 : F4 82 3E    "  >"    andb  X823E
E779 : D4 51    " Q"    andb  X0051
E77B : 17    " "    tba
E77C : 7E A2 94    "~  "    jmp  LA294
        ;
E77F : 1F    " "    db  $1F
        ;
E780 : F8 21 0B    " ! "    eorb  X210B
E783 : FF C0 45    "  E"    stx  XC045
        ;
E786 : 1D    " "    db  $1D
        ;
E787 : 7D E1 80    "}  "    tst  XE180
E78A : 7F 38 61    " 8a"    clr  X3861
E78D : 4F    "O"    clra
E78E : AC B9    "  "    cpx  $B9,x
E790        LE790:
E790 : 50    "P"    negb
        ;
E791 : 15    " "    db  $15
        ;
E792 : 7F E1 90    "   "    clr  XE190
E795 : 9F 25    " %"    sts  X0025
E797 : F8 05 17    "   "    eorb  X0517
        ;
E79A : FD    " "    db  $FD
        ;
E79B : 40    "@"    nega
        ;
E79C : CD 9D    "  "    db  $CD, $9D
        ;
E79E : 09    " "    dex
E79F : F9 53 03    " S "    adcb  X5303
E7A2 : FE D0 C1    "   "    ldx  XD0C1
        ;
E7A5 : 1F    " "    db  $1F
        ;
E7A6 : 58    "X"    aslb
E7A7 : D7 09    "  "    stab  X0009
E7A9 : BC D5 30    "  0"    cpx  XD530
E7AC : EA 27    " '"    orab  $27,x
E7AE : 19    " "    daa
E7AF : F4 07 BA    "   "    andb  X07BA
        ;
E7B2 : DC    " "    db  $DC
        ;
E7B3 : 81 AF    "  "    cmpa  #$AF
E7B5 : E8 4A    " J"    eorb  $4A,x
E7B7 : 0F    " "    sei
E7B8 : E8 D5    "  "    eorb  $D5,x
        ;
E7BA : 1A    " "    db  $1A
        ;
E7BB : A9 74    " t"    adca  $74,x
E7BD : AD D8    "  "    jsr  $D8,x            ;INFO: index jump
E7BF : 0B    " "    sev
E7C0 : D1 7F    "  "    cmpb  X007F
E7C2 : 08    " "    inx
E7C3 : FA 0B 52    "  R"    orab  X0B52
E7C6 : AB 51    " Q"    adda  $51,x
E7C8 : FE 91 51    "  Q"    ldx  X9151
E7CB : 3B    ";"    rti
        ;
E7CC : 27 C2    "' "    beq  LE790
        ;
E7CE : C7    " "    db  $C7
        ;
E7CF : 28 08    "( "    bvc  LE7D9
E7D1 : FF 93 01    "   "    stx  X9301
E7D4 : 7F 25 E0    " % "    clr  X25E0
        ;
E7D7 : 1F    " "    db  $1F
        ;
E7D8 : 8A A0    "  "    oraa  #$A0
E7DA : E1 BF    "  "    cmpb  $BF,x
E7DC : 19    " "    daa
E7DD : F0 67 06    " g "    subb  X6706
        ;
E7E0 : FC    " "    db  $FC
        ;
E7E1 : 81 09    "  "    cmpa  #$09
E7E3 : 0D    " "    sec
E7E4 : FF F0 C0    "   "    stx  XF0C0
        ;
E7E7 : 1F    " "    db  $1F
        ;
E7E8 : 31    "1"    ins
E7E9 : F8 0F 22    "  ""    eorb  X0F22
E7EC        LE7EC:
E7EC : 24 FE    "$ "    bcc  LE7EC
E7EE : CB 81    "  "    addb  #$81
E7F0 : 3F    "?"    swi
E7F1 : 63 E0    "c "    com  $E0,x
E7F3 : 9F 08    "  "    sts  X0008
        ;
E7F5 : 00    " "    db  $00
        ;
E7F6 : FF CD 80    "   "    stx  XCD80
E7F9 : BF 21 F0    " ! "    sts  X21F0
E7FC : 2F 40    "/@"    ble  LE83E
E7FE : C8 7F    "  "    eorb  #$7F
E800 : 32    "2"    pula
E801 : E0 5F    " _"    subb  $5F,x
E803 : 80 FC    "  "    suba  #$FC
E805 : 0F    " "    sei
E806 : 40    "@"    nega
E807 : F8 1F 02    "   "    eorb  X1F02
E80A : FE 07 81    "   "    ldx  X0781
E80D : FF 01 C0    "   "    stx  X01C0
E810 : FF 21 F0    " ! "    stx  X21F0
E813 : 3F    "?"    swi
E814 : 40    "@"    nega
E815 : FE 07 80    "   "    ldx  X0780
E818 : FF 07 C0    "   "    stx  X07C0
E81B : FF 01 3C    "  <"    stx  X013C
E81E : 3F    "?"    swi
        ;
E81F : 00    " "    db  $00
        ;
E820 : FF 47 C0    " G "    stx  X47C0
E823 : DF 01    "  "    stx  X0001
E825 : F8 2F 00    " / "    eorb  X2F00
E828 : FF 27 C0    " ' "    stx  X27C0
E82B : BF 09 F0    "   "    sts  X09F0
E82E : 0F    " "    sei
E82F : 80 FF    "  "    suba  #$FF
        ;
E831 : 13    " "    db  $13
        ;
E832 : E0 7F    "  "    subb  $7F,x
E834 : 01    " "    nop
        ;
E835 : FC    " "    db  $FC
        ;
E836 : 07    " "    tpa
E837 : C0 FF    "  "    subb  #$FF
        ;
E839 : 13    " "    db  $13
        ;
E83A : E0 7F    "  "    subb  $7F,x
        ;
E83C : 00    " "    db  $00
        ;
E83D : FE 03 F0    "   "    ldx  X03F0
E840 : FF 02 FC    "   "    stx  X02FC
        ;
E843 : 1D 00    "  "    db  $1D, $00
        ;
E845 : FF 00 FC    "   "    stx  X00FC
E848 : 5F    "_"    clrb
E849 : 01    " "    nop
E84A : FE 06 E4    "   "    ldx  X06E4
E84D : 3F    "?"    swi
        ;
E84E : 00    " "    db  $00
        ;
E84F : FF 0F C0    "   "    stx  X0FC0
E852 : BF 03 F8    "   "    sts  X03F8
E855 : 07    " "    tpa
E856 : C0 FF    "  "    subb  #$FF
E858 : 11    " "    cba
E859 : F0 6F 00    " o "    subb  X6F00
E85C : FE 03 E0    "   "    ldx  X03E0
E85F : FF 00 F9    "   "    stx  X00F9
E862 : 73 00 FF    "s  "    com  X00FF
E865 : 01    " "    nop
E866 : F0 5F 80    " _ "    subb  X5F80
E869 : F9 17 E0    "   "    adcb  X17E0
E86C : FF 00 F8    "   "    stx  X00F8
        ;
E86F : 1F    " "    db  $1F
        ;
E870 : 80 FD    "  "    suba  #$FD
        ;
E872 : 13    " "    db  $13
        ;
E873 : B0 FF 00    "   "    suba  XFF00
E876 : F8 1F 80    "   "    eorb  X1F80
E879 : FB 03 E4    "   "    addb  X03E4
E87C : FF 00 F8    "   "    stx  X00F8
        ;
E87F : 1F    " "    db  $1F
        ;
E880 : 01    " "    nop
E881 : FB 07 C8    "   "    addb  X07C8
E884 : FF 01 F0    "   "    stx  X01F0
E887 : 3F    "?"    swi
        ;
E888 : 00    " "    db  $00
        ;
E889 : FF 03 2C    "  ,"    stx  X032C
E88C : FF 00 E3    "   "    stx  X00E3
E88F : 3F    "?"    swi
E890        XE890:
E890 : 80 FE    "  "    suba  #$FE
E892 : 07    " "    tpa
E893 : 30    "0"    tsx
E894 : FF 03 E0    "   "    stx  X03E0
E897 : FF 00 FC    "   "    stx  X00FC
E89A : 0F    " "    sei
E89B : A0 FE    "  "    suba  $FE,x
E89D : 07    " "    tpa
E89E : 80 FF    "  "    suba  #$FF
E8A0 : 01    " "    nop
E8A1 : F0 3F 80    " ? "    subb  X3F80
E8A4 : F9 1F 00    "   "    adcb  X1F00
E8A7 : FE 07 A0    "   "    ldx  X07A0
E8AA : FF 00 F3    "   "    stx  X00F3
E8AD : 3F    "?"    swi
        ;
E8AE : 00    " "    db  $00
        ;
E8AF : F9 0F C0    "   "    adcb  X0FC0
E8B2 : FF 01 CC    "   "    stx  X01CC
E8B5 : FF 00 F8    "   "    stx  X00F8
E8B8 : 3F    "?"    swi
        ;
E8B9 : 00    " "    db  $00
        ;
E8BA : FF 07 70    "  p"    stx  X0770
E8BD : FF 01 F0    "   "    stx  X01F0
E8C0 : 7F 00 FD    "   "    clr  X00FD
        ;
E8C3 : 1F    " "    db  $1F
        ;
E8C4 : 80 FF    "  "    suba  #$FF
        ;
E8C6 : 03    " "    db  $03
        ;
E8C7 : 50    "P"    negb
E8C8 : FF 01 AA    "   "    stx  X01AA
E8CB : 7F 80 DE    "   "    clr  X80DE
        ;
E8CE : 1F 00    "  "    db  $1F, $00
        ;
E8D0 : FF 0F C0    "   "    stx  X0FC0
E8D3 : FE 03 E8    "   "    ldx  X03E8
E8D6 : 7F 00 EA    "   "    clr  X00EA
E8D9 : FE 00 F3    "   "    ldx  X00F3
E8DC : 3F    "?"    swi
E8DD : 80 F3    "  "    suba  #$F3
E8DF : 0F    " "    sei
E8E0 : C0 ED    "  "    subb  #$ED
E8E2 : 07    " "    tpa
        ;
E8E3 : 38    "8"    db  $38
        ;
E8E4 : FF 03 F8    "   "    stx  X03F8
E8E7 : 7E 00 FA    "~  "    jmp  L00FA
        ;
E8EA : F8 00 8F    "   "    eorb  X008F
E8ED : 7F C0 8E    "   "    clr  XC08E
E8F0 : 0F    " "    sei
E8F1 : 70 0F 3E    "p >"    neg  X0F3E
        ;
E8F4 : C3 83    "  "    db  $C3, $83
        ;
E8F6 : 3F    "?"    swi
E8F7 : E8 E1    "  "    eorb  $E1,x
E8F9 : 0F    " "    sei
E8FA : D8 01    "  "    eorb  X0001
E8FC : 9F E3    "  "    sts  X00E3
E8FE : C1 1F    "  "    cmpb  #$1F
E900        XE900:
E900 : 98 F3    "  "    eora  X00F3
        ;
E902 : 03 CC 1F    "   "    db  $03, $CC, $1F
        ;
E905 : 78 E7 03    "x  "    asl  XE703
E908 : 7E 06 EA    "~  "    jmp  L06EA
        ;
E90B : 03    " "    db  $03
        ;
E90C : 34    "4"    des
E90D : 7F 80 7F    "   "    clr  X807F
E910 : 78 E0 0F    "x  "    asl  XE00F
E913 : 78 79 00    "xy "    asl  X7900
E916 : EF 15    "  "    stx  $15,x
E918 : F0 7F 81    "   "    subb  X7F81
E91B : F2 1F 80    "   "    sbcb  X1F80
E91E : 7F 04 DC    "   "    clr  X04DC
        ;
E921 : 13    " "    db  $13
        ;
E922 : A8 F7    "  "    eora  $F7,x
        ;
E924 : 1F    " "    db  $1F
        ;
E925 : 68 CA    "h "    asl  $CA,x
        ;
E927 : 1F    " "    db  $1F
        ;
E928 : AA 40    " @"    oraa  $40,x
E92A : 7F 47 C0    " G "    clr  X47C0
E92D : FE 11 94    "   "    ldx  X1194
E930 : BF 90 3E    "  >"    sts  X903E
E933 : A8 EE    "  "    eora  $EE,x
        ;
E935 : 05    " "    db  $05
        ;
E936 : D4 AF    "  "    andb  X00AF
E938 : 01    " "    nop
        ;
E939 : 75    "u"    db  $75
        ;
E93A : D7 44    " D"    stab  X0044
E93C : 89 7B    " {"    adca  #$7B
E93E : 0F    " "    sei
E93F : E1 F8    "  "    cmpb  $F8,x
E941 : 2A 32    "*2"    bpl  LE975
        ;
E943 : F3 42    " B"    db  $F3, $42
        ;
E945 : 5F    "_"    clrb
E946 : E0 F1    "  "    subb  $F1,x
E948 : 0B    " "    sev
E949 : 98 FB    "  "    eora  X00FB
        ;
E94B : 41    "A"    db  $41
        ;
E94C : 54    "T"    lsrb
E94D : BF D0 0A    "   "    sts  XD00A
E950 : BD F0 11    "   "    jsr  LF011
        ;
E953 : 8F    " "    db  $8F
        ;
E954 : F4 C8 0E    "   "    andb  XC80E
E957 : BF 50 85    " P "    sts  X5085
E95A : BE 78 C0    " x "    lds  X78C0
        ;
E95D : C7 5E    " ^"    db  $C7, $5E
        ;
E95F : D0 8B    "  "    subb  X008B
        ;
E961 : 5E    "^"    db  $5E
        ;
E962 : F8 02 3D    "  ="    eorb  X023D
E965 : F8 81 0F    "   "    eorb  X810F
E968 : FB 40 A7    " @ "    addb  X40A7
E96B : AF E0    "  "    sts  $E0,x
E96D : 86 AD    "  "    ldaa  #$AD
E96F : E0 0F    "  "    subb  $0F,x
        ;
E971 : 3C    "<"    db  $3C
        ;
E972 : F8 C3 14    "   "    eorb  XC314
        ;
E975        LE975:
E975 : FC A3 52    "  R"    db  $FC, $A3, $52
        ;
E978 : F4 86 F8    "   "    andb  X86F8
        ;
E97B : 1C    " "    db  $1C
        ;
E97C : 07    " "    tpa
E97D : F1 3C 86    " < "    cmpb  X3C86
E980 : E7 39    " 9"    stab  $39,x
        ;
E982 : 04    " "    db  $04
        ;
E983 : F7 09 78    "  x"    stab  X0978
E986 : 9E 07    "  "    lds  X0007
E988 : F8 1C 87    "   "    eorb  X1C87
        ;
E98B : 7B 3C    "{<"    db  $7B, $3C
        ;
E98D : C0 F7    "  "    subb  #$F7
E98F : 0C    " "    clc
E990 : E0 7F    "  "    subb  $7F,x
E992 : 0E    " "    cli
E993 : F8 3B 00    " ; "    eorb  X3B00
E996 : DE 75    " u"    ldx  X0075
E998 : 90 8F    "  "    suba  X008F
E99A : 33    "3"    pulb
E99B : F0 C2 3F    "  ?"    subb  XC23F
E99E : 78 E0 0F    "x  "    asl  XE00F
E9A1 : 7C B0 A0    "|  "    inc  XB0A0
        ;
E9A4 : 7B    "{"    db  $7B
        ;
E9A5 : 54    "T"    lsrb
E9A6 : C5 5F    " _"    bitb  #$5F
E9A8 : 98 BA    "  "    eora  X00BA
E9AA : A5 EA    "  "    bita  $EA,x
E9AC : 0E    " "    cli
E9AD : C1 F2    "  "    cmpb  #$F2
E9AF : 0A    " "    clv
E9B0 : AA F2    "  "    oraa  $F2,x
        ;
E9B2 : 14    " "    db  $14
        ;
E9B3 : 8B F7    "  "    adda  #$F7
E9B5 : 08    " "    inx
E9B6 : EB A7    "  "    addb  $A7,x
        ;
E9B8 : 51    "Q"    db  $51
        ;
E9B9 : B8 17 35    "  5"    eora  X1735
E9BC : F8 21 4D    " !M"    eorb  X214D
E9BF : B7 A0 FD    "   "    staa  XA0FD
        ;
E9C2 : 02    " "    db  $02
        ;
E9C3 : D5 5E    " ^"    bitb  X005E
E9C5 : 48    "H"    asla
E9C6 : EB 5A    " Z"    addb  $5A,x
E9C8 : 28 DD    "( "    bvc  LE9A7
        ;
E9CA : D3    " "    db  $D3
        ;
E9CB : 10    " "    sba
        ;
E9CC : FC A3 21    "  !"    db  $FC, $A3, $21
        ;
E9CF : BE 46 E1    " F "    lds  X46E1
E9D2 : 9A 9A    "  "    oraa  X009A
E9D4 : 70 87 2D    "p -"    neg  X872D
E9D7 : F4 0B 2B    "  +"    andb  X0B2B
        ;
E9DA : FC    " "    db  $FC
        ;
E9DB : 82 C6    "  "    sbca  #$C6
E9DD : 7A 09 D7    "z  "    dec  X09D7
E9E0 : A5 14    "  "    bita  $14,x
E9E2 : EF 41    " A"    stx  $41,x
E9E4 : 17    " "    tba
        ;
E9E5 : 3D 61    "=a"    db  $3D, $61
        ;
E9E7 : B7 48 B5    " H "    staa  X48B5
E9EA : A7 48    " H"    staa  $48,x
E9EC : BE D6 02    "   "    lds  XD602
E9EF : 3E    ">"    wai
E9F0 : BA C0 AF    "   "    oraa  XC0AF
E9F3 : 2D A0    "- "    blt  LE995
E9F5 : AF 85    "  "    sts  $85,x
E9F7 : 78 97 42    "x B"    asl  X9742
E9FA : FA 56 81    " V "    orab  X5681
E9FD : BE A6 A0    "   "    lds  XA6A0
EA00 : 77 09 DA    "w  "    asr  X09DA
EA03 : AF 40    " @"    sts  $40,x
EA05 : FA 2E A8    " . "    orab  X2EA8
EA08 : AE 85    "  "    lds  $85,x
EA0A : AC 6F    " o"    cpx  $6F,x
EA0C : 40    "@"    nega
EA0D : F5 2A 69    " *i"    bitb  X2A69
EA10 : 57    "W"    asrb
        ;
EA11 : 41    "A"    db  $41
        ;
EA12 : BD B2 82    "   "    jsr  LB282
EA15 : BE B2 A0    "   "    lds  XB2A0
        ;
EA18 : 1F    " "    db  $1F
        ;
EA19 : B1 E8 17    "   "    cmpa  XE817
        ;
EA1C : 52    "R"    db  $52
        ;
EA1D : 6D 8D    "m "    tst  $8D,x
        ;
EA1F : DC 15 52    "  R"    db  $DC, $15, $52
        ;
EA22 : F6 07 AC    "   "    ldab  X07AC
EA25 : FE 01 3A    "  :"    ldx  X013A
EA28 : 6F 21    "o!"    clr  $21,x
EA2A : B5 6E 91    " n "    bita  X6E91
EA2D : B8 AE A1    "   "    eora  XAEA1
        ;
EA30 : 3A 1E    ": "    db  $3A, $1E
        ;
EA32 : 69 69    "ii"    rol  $69,x
        ;
EA34 : 15    " "    db  $15
        ;
EA35 : CB 7C    " |"    addb  #$7C
        ;
EA37 : 14    " "    db  $14
        ;
EA38 : 57    "W"    asrb
EA39 : 57    "W"    asrb
EA3A : 50    "P"    negb
        ;
EA3B : DD    " "    db  $DD
        ;
EA3C : 43    "C"    coma
EA3D : F4 56 85    " V "    andb  X5685
EA40 : BA 54 8A    " T "    oraa  X548A
EA43 : AF A5    "  "    sts  $A5,x
EA45 : 28 FD    "( "    bvc  LEA44
EA47 : A2 54    " T"    sbca  $54,x
EA49 : B5 0A ED    "   "    bita  X0AED
EA4C : E9 88    "  "    adcb  $88,x
EA4E : BE A1 B0    "   "    lds  XA1B0
        ;
EA51 : 5E C3 52    "^ R"    db  $5E, $C3, $52
        ;
EA54        LEA54:
EA54 : 2D A8    "- "    blt  LE9FE
EA56 : B6 27 F8    " ' "    ldaa  X27F8
EA59 : EE 0A    "  "    ldx  $0A,x
EA5B : D8 5B    " ["    eorb  X005B
EA5D : 01    " "    nop
EA5E : EB 25    " %"    addb  $25,x
EA60 : 25 BE    "% "    bcs  LEA20
EA62 : D1 84    "  "    cmpb  X0084
EA64 : 3F    "?"    swi
        ;
EA65 : 51 45    "QE"    db  $51, $45
        ;
EA67 : 5F    "_"    clrb
EA68 : B0 C2 3F    "  ?"    suba  XC23F
        ;
EA6B : 72    "r"    db  $72
        ;
EA6C : E0 27    " '"    subb  $27,x
EA6E : 2E E4    ". "    bgt  LEA54
        ;
EA70 : A3 1A    "  "    db  $A3, $1A
        ;
EA72 : EA EA    "  "    orab  $EA,x
EA74 : 0A    " "    clv
        ;
EA75 : 55    "U"    db  $55
        ;
EA76 : F5 50 AA    " P "    bitb  X50AA
EA79 : FE E8 90    "   "    ldx  XE890
EA7C : 3B    ";"    rti
        ;
EA7D : 33    "3"    pulb
EA7E : 22 EF    "" "    bhi  LEA6F
EA80 : 60 54    "`T"    neg  $54,x
EA82 : 9F A4    "  "    sts  X00A4
EA84 : D0 8D    "  "    subb  X008D
EA86 : F2 8D 17    "   "    sbcb  X8D17
EA89 : F4 63 06    " c "    andb  X6306
EA8C : F7 44 8A    " D "    stab  X448A
EA8F : BB 11 89    "   "    adda  X1189
EA92 : 77 E2 0D    "w  "    asr  XE20D
        ;
EA95 : 1F    " "    db  $1F
        ;
EA96 : F4 C4 07    "   "    andb  XC407
EA99 : F5 B4 02    "   "    bitb  XB402
EA9C : F7 B2 40    "  @"    stab  XB240
EA9F : AB 7E    " ~"    adda  $7E,x
EAA1 : C1 89    "  "    cmpb  #$89
        ;
EAA3 : 1F    " "    db  $1F
        ;
EAA4 : B1 A3 36    "  6"    cmpa  XA336
        ;
EAA7 : EC    " "    db  $EC
        ;
EAA8 : C2 AA    "  "    sbcb  #$AA
        ;
EAAA : 9D    " "    db  $9D
        ;
EAAB : 74 07 2D    "t -"    lsr  X072D
EAAE : F8 83 16    "   "    eorb  X8316
EAB1 : FA C1 16    "   "    orab  XC116
EAB4 : BD A1 2B    "  +"    jsr  LA12B
EAB7 : AB E0    "  "    adda  $E0,x
EAB9 : 0B    " "    sev
EABA : 3F    "?"    swi
EABB : F0 85 1E    "   "    subb  X851E
EABE : F4 A2 17    "   "    andb  XA217
        ;
EAC1 : DC    " "    db  $DC
        ;
EAC2 : D2 15    "  "    sbcb  X0015
EAC4 : F4 A2 1F    "   "    andb  XA21F
EAC7 : E8 B0    "  "    eorb  $B0,x
EAC9 : 0F    " "    sei
EACA : 74 EA 0B    "t  "    lsr  XEA0B
EACD : DA F4    "  "    orab  X00F4
EACF : 81 3A    " :"    cmpa  #$3A
EAD1 : F2 07 2E    "  ."    sbcb  X072E
EAD4 : F4 83 5A    "  Z"    andb  X835A
EAD7 : FA 42 1D    " B "    orab  X421D
EADA : BD 41 1D    " A "    jsr  L411D
        ;
EADD : FC 83    "  "    db  $FC, $83
        ;
EADF : 2E 7C    ".|"    bgt  LEB5D
        ;
EAE1 : 41    "A"    db  $41
        ;
EAE2 : 97 7A    " z"    staa  X007A
EAE4 : C1 2B    " +"    cmpb  #$2B
EAE6 : AF A0    "  "    sts  $A0,x
        ;
EAE8 : 15    " "    db  $15
        ;
EAE9 : FA 41 0F    " A "    orab  X410F
EAEC : FE 40 1B    " @ "    ldx  X401B
EAEF : BF A0 55    "  U"    sts  XA055
EAF2 : AF A0    "  "    sts  $A0,x
        ;
EAF4 : 4E    "N"    db  $4E
        ;
EAF5 : F5 81 1E    "   "    bitb  X811E
EAF8 : DE C0    "  "    ldx  X00C0
        ;
EAFA : 1E    " "    db  $1E
        ;
EAFB : 5F    "_"    clrb
EAFC : E0 96    "  "    subb  $96,x
        ;
EAFE : 5E    "^"    db  $5E
        ;
EAFF : E0 4A    " J"    subb  $4A,x
EB01 : FB A0 15    "   "    addb  XA015
EB04 : 7E 41 0B    "~A "    jmp  L410B
        ;
EB07 : 7F D0 45    "  E"    clr  XD045
        ;
EB0A : 1F    " "    db  $1F
        ;
EB0B : D4 C9    "  "    andb  X00C9
EB0D : F1 C1 2C    "  ,"    cmpb  XC12C
EB10 : DE 41    " A"    ldx  X0041
EB12 : 35    "5"    txs
EB13 : 5F    "_"    clrb
EB14 : E1 54    " T"    cmpb  $54,x
EB16 : 3E    ">"    wai
EB17 : A1 A9    "  "    cmpa  $A9,x
EB19 : C5 87    "  "    bitb  #$87
EB1B : 74 B8 07    "t  "    lsr  XB807
EB1E : B5 FC 82    "   "    bita  XFC82
EB21 : 53    "S"    comb
EB22 : 7A 42 47    "zBG"    dec  X4247
EB25 : 0D    " "    sec
EB26 : 3F    "?"    swi
EB27 : E4 C1    "  "    andb  $C1,x
        ;
EB29 : 3D    "="    db  $3D
        ;
EB2A : A8 E1    "  "    eora  $E1,x
EB2C : 0F    " "    sei
EB2D : D6 F8    "  "    ldab  X00F8
EB2F : 81 9E    "  "    cmpa  #$9E
        ;
EB31 : 72    "r"    db  $72
        ;
EB32 : F0 23 0F    " # "    subb  X230F
        ;
EB35 : EC    " "    db  $EC
        ;
EB36 : 91 0E    "  "    cmpa  X000E
EB38 : 7F 61 46    " aF"    clr  X6146
        ;
EB3B : 1F    " "    db  $1F
        ;
EB3C : E8 C9    "  "    eorb  $C9,x
EB3E : 07    " "    tpa
EB3F : 7C E4 03    "|  "    inc  XE403
EB42 : 7D B4 43    "} C"    tst  XB443
        ;
EB45 : 1F    " "    db  $1F
        ;
EB46 : CE E0 99    "   "    ldx  #$E099
EB49 : 8E A9 00    "   "    lds  #$A900
EB4C : 7F E5 C1    "   "    clr  XE5C1
EB4F : 3E    ">"    wai
EB50 : 56    "V"    rorb
EB51 : C0 1F    "  "    subb  #$1F
        ;
EB53 : 3C    "<"    db  $3C
        ;
EB54 : F0 07 0E    "   "    subb  X070E
EB57 : F9 81 3F    "  ?"    adcb  X813F
EB5A : 78 C0 3F    "x ?"    asl  XC03F
EB5D        LEB5D:
EB5D : 68 A4    "h "    asl  $A4,x
EB5F : 17    " "    tba
EB60 : 74 FA 85    "t  "    lsr  XFA85
EB63 : 6E 72    "nr"    jmp  $72,x            ;INFO: index jump
        ;
EB65 : 41    "A"    db  $41
        ;
EB66 : 2F E5    "/ "    ble  LEB4D
EB68 : F8 07 15    "   "    eorb  X0715
EB6B : F4 03 A7    "   "    andb  X03A7
EB6E        LEB6E:
EB6E : F8 84 47    "  G"    eorb  X8447
EB71 : 7D A8 CB    "}  "    tst  XA8CB
EB74 : 2B F8    "+ "    bmi  LEB6E
        ;
EB76 : 42    "B"    db  $42
        ;
EB77 : 07    " "    tpa
EB78 : 7D A4 8B    "}  "    tst  XA48B
        ;
EB7B : 1E    " "    db  $1E
        ;
EB7C : 74 17 A5    "t  "    lsr  X17A5
EB7F : F4 2C CA    " , "    andb  X2CCA
EB82 : 5D    "]"    tstb
EB83 : 94 F4    "  "    anda  X00F4
        ;
EB85 : 15    " "    db  $15
        ;
EB86 : 95 EA    "  "    bita  X00EA
        ;
EB88 : 65    "e"    db  $65
        ;
EB89 : 8E 6E 81    " n "    lds  #$6E81
EB8C : AE AE    "  "    lds  $AE,x
EB8E : 40    "@"    nega
EB8F : 97 17    "  "    staa  X0017
        ;
EB91 : 71    "q"    db  $71
        ;
EB92 : AE 52    " R"    lds  $52,x
EB94 : F4 4A 4F    " JO"    andb  X4A4F
        ;
EB97 : 71    "q"    db  $71
        ;
EB98 : 88 9F    "  "    eora  #$9F
EB9A : 74 A4 87    "t  "    lsr  XA487
EB9D : 5A    "Z"    decb
EB9E : A9 95    "  "    adca  $95,x
        ;
EBA0 : 5E    "^"    db  $5E
        ;
EBA1 : A8 A3    "  "    eora  $A3,x
EBA3 : 1B    " "    aba
EBA4 : DA CA    "  "    orab  X00CA
        ;
EBA6 : 42    "B"    db  $42
        ;
EBA7 : BB A8 43    "  C"    adda  XA843
EBAA : 6F 51    "oQ"    clr  $51,x
EBAC : 8A EE    "  "    oraa  #$EE
EBAE : B8 A4 8B    "   "    eora  XA48B
        ;
EBB1 : 3C    "<"    db  $3C
        ;
EBB2 : EA 83    "  "    orab  $83,x
EBB4 : 36    "6"    psha
EBB5 : F4 C2 1B    "   "    andb  XC21B
EBB8 : F4 A1 1E    "   "    andb  XA11E
EBBB : F4 A2 2D    "  -"    andb  XA22D
EBBE : BA 41 2B    " A+"    oraa  X412B
EBC1 : BB 42 57    " BW"    adda  X4257
EBC4 : 6D A8    "m "    tst  $A8,x
EBC6 : D6 2A    " *"    ldab  X002A
EBC8 : A8 AB    "  "    eora  $AB,x
EBCA : 7A 70 A3    "zp "    dec  X70A3
EBCD : 2E F4    ". "    bgt  LEBC3
EBCF : 48    "H"    asla
        ;
EBD0 : 8F    " "    db  $8F
        ;
EBD1 : F4 D8 85    "   "    andb  XD885
EBD4 : AA EA    "  "    oraa  $EA,x
        ;
EBD6 : 21    "!"    db  $21
        ;
EBD7 : 5D    "]"    tstb
EBD8 : AA 51    " Q"    oraa  $51,x
EBDA : BB 14 D5    "   "    adda  X14D5
EBDD : EA 2A    " *"    orab  $2A,x
EBDF : AA E9    "  "    oraa  $E9,x
        ;
EBE1 : 15    " "    db  $15
        ;
EBE2 : 5A    "Z"    decb
EBE3 : D1 0A    "  "    cmpb  X000A
EBE5 : 7F A1 2A    "  *"    clr  XA12A
EBE8 : BB E2 AA    "   "    adda  XE2AA
EBEB : 2E E8    ". "    bgt  LEBD5
        ;
EBED : A3    " "    db  $A3
        ;
EBEE : 0A    " "    clv
EBEF : F5 45 2E    " E."    bitb  X452E
EBF2 : DA C3    "  "    orab  X00C3
EBF4 : 34    "4"    des
EBF5 : 67 A2    "g "    asr  $A2,x
EBF7 : 5C    "\"    incb
        ;
EBF8 : 75    "u"    db  $75
        ;
EBF9 : 91 57    " W"    cmpa  X0057
        ;
EBFB : 51    "Q"    db  $51
        ;
EBFC : 49    "I"    rola
EBFD : AF 1A    "  "    sts  $1A,x
EBFF : F4 92 87    "   "    andb  X9287
        ;
EC02 : 3C    "<"    db  $3C
        ;
EC03 : D5 85    "  "    bitb  X0085
EC05 : AA 7A    " z"    oraa  $7A,x
        ;
EC07 : 55    "U"    db  $55
        ;
EC08 : A2 7A    " z"    sbca  $7A,x
        ;
EC0A : 45 51    "EQ"    db  $45, $51
        ;
EC0C : 3F    "?"    swi
EC0D : B2 52 4B    " RK"    sbca  X524B
EC10 : 5A    "Z"    decb
EC11 : A7 8A    "  "    staa  $8A,x
EC13 : 76 A9 94    "v  "    ror  XA994
EC16 : BB 2A 85    " * "    adda  X2A85
EC19 : D5 2C    " ,"    bitb  X002C
EC1B : 74 A9 87    "t  "    lsr  XA987
EC1E : AA DC    "  "    oraa  $DC,x
EC20 : 85 2E    " ."    bita  #$2E
        ;
EC22 : 75    "u"    db  $75
        ;
EC23 : 29 95    ") "    bvs  LEBBA
EC25 : 7A 29 55    "z)U"    dec  X2955
EC28 : BE F0 42    "  B"    lds  XF042
EC2B : 2B 7A    "+z"    bmi  LECA7
EC2D : 85 A5    "  "    bita  #$A5
EC2F : 3E    ">"    wai
        ;
EC30 : 61    "a"    db  $61
        ;
EC31 : A7 AA    "  "    staa  $AA,x
EC33 : D2 0B    "  "    sbcb  X000B
EC35 : 35    "5"    txs
EC36 : 79 C5 0B    "y  "    rol  XC50B
EC39 : BA D2 45    "  E"    oraa  XD245
EC3C : 56    "V"    rorb
EC3D        LEC3D:
EC3D : B5 A4 56    "  V"    bita  XA456
EC40 : 57    "W"    asrb
EC41 : 29 55    ")U"    bvs  LEC98
EC43 : AD CA    "  "    jsr  $CA,x            ;INFO: index jump
        ;
EC45 : 14    " "    db  $14
        ;
EC46 : 5F    "_"    clrb
EC47 : B0 4A 57    " JW"    suba  X4A57
EC4A : B4 8A BB    "   "    anda  X8ABB
EC4D : 68 93    "h "    asl  $93,x
EC4F : 74 55 05    "tU "    lsr  X5505
EC52 : 7D 55 A2    "}U "    tst  X55A2
EC55 : 57    "W"    asrb
EC56 : 54    "T"    lsrb
EC57 : 95 AE    "  "    bita  X00AE
EC59 : 70 C9 2B    "p +"    neg  XC92B
EC5C : A9 B4    "  "    adca  $B4,x
EC5E : 57    "W"    asrb
EC5F : 5A    "Z"    decb
EC60 : E8 A5    "  "    eorb  $A5,x
EC62 : 2A EC    "* "    bpl  LEC50
EC64 : A9 14    "  "    adca  $14,x
EC66 : F9 A6 22    "  ""    adcb  XA622
        ;
EC69 : 75    "u"    db  $75
        ;
EC6A : AA C5    "  "    oraa  $C5,x
EC6C : AA 3E    " >"    oraa  $3E,x
EC6E : A5 A2    "  "    bita  $A2,x
EC70 : 2E 55    ".U"    bgt  LECC7
EC72 : AD 52    " R"    jsr  $52,x            ;INFO: index jump
EC74 : 8A AB    "  "    oraa  #$AB
EC76 : AA A2    "  "    oraa  $A2,x
EC78 : AA 2F    " /"    oraa  $2F,x
EC7A : 2C D5    ", "    bge  LEC51
EC7C : AB 2A    " *"    adda  $2A,x
EC7E : AA 45    " E"    oraa  $45,x
        ;
EC80        XEC80:
EC80 : 55    "U"    db  $55
        ;
EC81 : 2F A9    "/ "    ble  LEC2C
EC83 : 74 99 A3    "t  "    lsr  X99A3
EC86 : 2A B5    "* "    bpl  LEC3D
        ;
EC88 : 51    "Q"    db  $51
        ;
EC89 : 4D    "M"    tsta
EC8A : 7D 5A 50    "}ZP"    tst  X5A50
EC8D : AF 52    " R"    sts  $52,x
EC8F : F8 42 4B    " BK"    eorb  X424B
EC92 : F5 48 4D    " HM"    bitb  X484D
EC95 : BD A8 52    "  R"    jsr  LA852
EC98        LEC98:
EC98 : 9F 6A    " j"    sts  X006A
EC9A : A1 AE    "  "    cmpa  $AE,x
EC9C : AA C0    "  "    oraa  $C0,x
        ;
EC9E : 1F    " "    db  $1F
        ;
EC9F : B9 E0 27    "  '"    adca  XE027
ECA2 : 36    "6"    psha
ECA3 : D2 8D    "  "    sbcb  X008D
ECA5 : 2E E9    ". "    bgt  LEC90
ECA7        LECA7:
ECA7 : AA 16    "  "    oraa  $16,x
ECA9 : B5 AA AA    "   "    bita  XAAAA
ECAC : AA AA    "  "    oraa  $AA,x
ECAE        LECAE:
ECAE : AA AA    "  "    oraa  $AA,x
;*************************************;
;called by TALKD
ECB0 : A7 24    " $"    staa  $24,x
ECB2 : 01    " "    nop
        ;
ECB3        XECB3:
ECB3 : 02 03    "  "    db  $02, $03
ECB5        XECB5:
ECB5 : 04 05    "  "    db  $04, $05
        ;
ECB7        XECB7:
ECB7 : 06    " "    tap
ECB8 : 07    " "    tpa
ECB9        XECB9:
ECB9 : 08    " "    inx
ECBA : 09    " "    dex
ECBB        XECBB:
ECBB : 9E 0A    "  "    lds  X000A
ECBD : 0B    " "    sev
ECBE        LECBE:
ECBE : 0C    " "    clc
ECBF : 0D    " "    sec
ECC0        XECC0:
ECC0 : 0E    " "    cli
        ;
ECC1 : 9D 1F    "  "    db  $9D, $1F
        ;
ECC3 : 16    " "    tab
        ;
ECC4 : 8F    " "    db  $8F
        ;
ECC5 : 17    " "    tba
ECC6 : 90 17    "  "    suba  X0017
        ;
ECC8 : 21    "!"    db  $21
        ;
ECC9 : 99 18    "  "    adca  X0018
ECCB : 99 90    "  "    adca  X0090
        ;
ECCD : 1F    " "    db  $1F
        ;
ECCE : 89 A3    "  "    adca  #$A3
ECD0 : 19    " "    daa
ECD1 : 9B 1C    "  "    adda  X001C
        ;
ECD3 : 9D 1C    "  "    db  $9D, $1C
        ;
ECD5 : 9B 9C    "  "    adda  X009C
ECD7 : 0C    " "    clc
ECD8 : A0 22    " ""    suba  $22,x
ECDA : 8D 1E    "  "    bsr  LECFA
ECDC : 26 27    "&'"    bne  LED05
ECDE : 28 25    "(%"    bvc  LED05
ECE0 : 84 9D    "  "    anda  #$9D
ECE2 : 9F A1    "  "    sts  X00A1
ECE4 : AF 81    "  "    sts  $81,x
ECE6 : FA 87 8B    "   "    orab  X878B
ECE9 : A0 22    " ""    suba  $22,x
        ;
ECEB : 83    " "    db  $83
        ;
ECEC : 9B 9C    "  "    adda  X009C
ECEE : 8C 01 88    "   "    cpx  #$0188
ECF1 : 84 85    "  "    anda  #$85
ECF3 : 99 98    "  "    adca  X0098
ECF5 : AF 8F    "  "    sts  $8F,x
ECF7 : 97 9D    "  "    staa  X009D
        ;
ECF9 : 1F    " "    db  $1F
ECFA        LECFA:
ECFA        XECFA:
ECFA : 87    " "    db  $87
        ;
ECFB : 8B 9E    "  "    adda  #$9E
ECFD : 8A 9D    "  "    oraa  #$9D
        ;
ECFF : 1F 8F    "  "    db  $1F, $8F
        ;
ED01 : 97 89    "  "    staa  X0089
        ;
ED03 : A3    " "    db  $A3
        ;
ED04 : 99 AF    "  "    adca  X00AF
ED06 : 99 98    "  "    adca  X0098
ED08 : 8D 1E    "  "    bsr  LED28
        ;
ED0A : 8F    " "    db  $8F
        ;
ED0B : 97 89    "  "    staa  X0089
        ;
ED0D : A3    " "    db  $A3
        ;
ED0E : 99 AF    "  "    adca  X00AF
ED10 : 9B 90    "  "    adda  X0090
ED12 : 9F 8D    "  "    sts  X008D
        ;
ED14 : 1E    " "    db  $1E
        ;
ED15 : 88 86    "  "    eora  #$86
ED17 : 9E 8A    "  "    lds  X008A
ED19 : 07    " "    tpa
        ;
ED1A : 87    " "    db  $87
        ;
ED1B : 8B A0    "  "    adda  #$A0
ED1D : 22 8F    "" "    bhi  LECAE
ED1F : 97 9D    "  "    staa  X009D
ED21 : 9F 89    "  "    sts  X0089
ED23 : AF 01    "  "    sts  $01,x
ED25 : 86 87    "  "    ldaa  #$87
ED27 : 84 85    "  "    anda  #$85
ED29        LED29:
ED29 : 82 81    "  "    sbca  #$81
ED2B : 09    " "    dex
ED2C : 84 9D    "  "    anda  #$9D
ED2E : 9F 09    "  "    sts  X0009
        ;
ED30 : 87    " "    db  $87
        ;
ED31 : A0 A2    "  "    suba  $A2,x
ED33 : 85 90    "  "    bita  #$90
ED35 : 97 99    "  "    staa  X0099
ED37 : 98 8F    "  "    eora  X008F
ED39 : 97 85    "  "    staa  X0085
ED3B : 82 81    "  "    sbca  #$81
ED3D : 09    " "    dex
ED3E : 85 82    "  "    bita  #$82
ED40 : 81 8E    "  "    cmpa  #$8E
ED42 : 09    " "    dex
ED43 : 88 8B    "  "    eora  #$8B
ED45 : 9E 8A    "  "    lds  X008A
        ;
ED47 : 87    " "    db  $87
        ;
ED48 : FA AF 87    "   "    orab  XAF87
ED4B : A0 22    " ""    suba  $22,x
        ;
ED4D : 87    " "    db  $87
        ;
ED4E : 8B 8F    "  "    adda  #$8F
ED50 : 97 96    "  "    staa  X0096
ED52 : A0 22    " ""    suba  $22,x
ED54 : 88 8E    "  "    eora  #$8E
ED56 : 09    " "    dex
ED57 : 85 82    "  "    bita  #$82
ED59 : 81 86    "  "    cmpa  #$86
ED5B : A0 A2    "  "    suba  $A2,x
ED5D : 09    " "    dex
ED5E : 88 86    "  "    eora  #$86
ED60 : 9E 8A    "  "    lds  X008A
        ;
ED62 : 87    " "    db  $87
        ;
ED63 : AF 9D    "  "    sts  $9D,x
ED65 : 9C 0D    "  "    cpx  X000D
        ;
ED67 : 87    " "    db  $87
        ;
ED68 : A0 A2    "  "    suba  $A2,x
ED6A : 8E 8F 97    "   "    lds  #$8F97
ED6D : FA 88 84    "   "    orab  X8884
ED70 : 85 09    "  "    bita  #$09
ED72 : 85 82    "  "    bita  #$82
ED74 : 81 86    "  "    cmpa  #$86
ED76 : 8A 07    "  "    oraa  #$07
ED78 : 99 98    "  "    adca  X0098
ED7A : AF 89    "  "    sts  $89,x
        ;
ED7C : A3    " "    db  $A3
        ;
ED7D : 99 07    "  "    adca  X0007
ED7F        XED7F:
ED7F : 99 90    "  "    adca  X0090
ED81 : 9F AF    "  "    sts  X00AF
ED83 : 89 A3    "  "    adca  #$A3
ED85 : 99 07    "  "    adca  X0007
        ;
ED87 : 8F    " "    db  $8F
        ;
ED88 : 97 89    "  "    staa  X0089
        ;
ED8A : A3    " "    db  $A3
        ;
ED8B : 99 AF    "  "    adca  X00AF
        ;
ED8D : 9D    " "    db  $9D
        ;
ED8E : 9F FA    "  "    sts  X00FA
ED90 : 85 82    "  "    bita  #$82
ED92 : 01    " "    nop
        ;
ED93 : 8F    " "    db  $8F
        ;
ED94 : 97 AF    "  "    staa  X00AF
ED96 : 99 98    "  "    adca  X0098
ED98 : AF A0    "  "    sts  $A0,x
ED9A : 22 8E    "" "    bhi  LED2A
ED9C : 8D 8B    "  "    bsr  LED29
        ;
ED9E : 8F    " "    db  $8F
        ;
ED9F : 97 85    "  "    staa  X0085
EDA1 : 82 81    "  "    sbca  #$81
EDA3 : 09    " "    dex
EDA4 : 88 83    "  "    eora  #$83
EDA6 : 07    " "    tpa
EDA7 : 88 86    "  "    eora  #$86
EDA9 : 9E 8A    "  "    lds  X008A
EDAB : 85 FA    "  "    bita  #$FA
EDAD : 01    " "    nop
EDAE : 86 87    "  "    ldaa  #$87
EDB0 : A1 8F    "  "    cmpa  $8F,x
EDB2 : 97 85    "  "    staa  X0085
EDB4 : 81 09    "  "    cmpa  #$09
        ;
EDB6 : 87    " "    db  $87
        ;
EDB7 : 86 A1    "  "    ldaa  #$A1
EDB9 : 9E 8A    "  "    lds  X008A
        ;
EDBB : 9D 1F    "  "    db  $9D, $1F
        ;
EDBD        XEDBD:
EDBD : 91 92    "  "    cmpa  X0092
EDBF : 92 93    "  "    sbca  X0093
        ;
EDC1 : 93 93    "  "    db  $93, $93
        ;
EDC3 : 94 94    "  "    anda  X0094
;*************************************;
;
EDC5 : 15    " "    db  $15
        ;
EDC6 : 91 92    "  "    cmpa  X0092
        ;
EDC8 : 13    " "    db  $13
        ;
EDC9 : B0 00 B3    "   "    suba  X00B3
        ;
EDCC : 00 B3 00    "   "    db  $00, $B3, $00
        ;
EDCF : B6 A0 B6    "   "    ldaa  XA0B6
EDD2 : A0 BB    "  "    suba  $BB,x
        ;
EDD4 : 6B    "k"    db  $6B
        ;
EDD5 : BB 6B BF    " k "    adda  X6BBF
EDD8 : 81 BF    "  "    cmpa  #$BF
EDDA : 81 C3    "  "    cmpa  #$C3
        ;
EDDC : 00 C3 00    "   "    db  $00, $C3, $00
        ;
EDDF : C6 A6    "  "    ldab  #$A6
EDE1 : C6 A6    "  "    ldab  #$A6
EDE3 : C9 D0    "  "    adcb  #$D0
EDE5 : C9 D0    "  "    adcb  #$D0
        ;
EDE7 : CD    " "    db  $CD
        ;
EDE8 : FE CD FE    "   "    ldx  XCDFE
EDEB : D1 E5    "  "    cmpb  X00E5
EDED : D1 E5    "  "    cmpb  X00E5
EDEF : D6 60    " `"    ldab  X0060
EDF1 : D6 60    " `"    ldab  X0060
EDF3 : D9 F0    "  "    adcb  X00F0
EDF5 : D9 F0    "  "    adcb  X00F0
        ;
EDF7 : DD 4B DD 4B  " K K"    db  $DD, $4B, $DD, $4B
        ;
EDFB : E0 E3    "  "    subb  $E3,x
EDFD : E0 E3    "  "    subb  $E3,x
EDFF : E4 53    " S"    andb  $53,x
EE01 : E4 53    " S"    andb  $53,x
EE03 : E4 D5    "  "    andb  $D5,x
EE05 : E4 D5    "  "    andb  $D5,x
EE07 : E5 D6    "  "    bitb  $D6,x
EE09 : E5 D6    "  "    bitb  $D6,x
EE0B : E7 57    " W"    stab  $57,x
EE0D : E7 57    " W"    stab  $57,x
EE0F : E9 28    " ("    adcb  $28,x
EE11 : E9 28    " ("    adcb  $28,x
EE13 : EA A9    "  "    orab  $A9,x
EE15 : EA A9    "  "    orab  $A9,x
EE17 : EB EA    "  "    addb  $EA,x
EE19 : EB EA    "  "    addb  $EA,x
        ;
EE1B : EC    " "    db  $EC
        ;
EE1C : AB B8    "  "    adda  $B8,x
EE1E : 80 BB    "  "    suba  #$BB
        ;
EE20 : 6B    "k"    db  $6B
        ;
EE21 : B0 80 B3    "   "    suba  X80B3
        ;
EE24 : 00 C7    "  "    db  $00, $C7
        ;
EE26 : A0 C9    "  "    suba  $C9,x
EE28 : D0 B2    "  "    subb  X00B2
        ;
EE2A : 00 B3 00    "   "    db  $00, $B3, $00
        ;
EE2D : DE 70    " p"    ldx  X0070
EE2F : E0 E3    "  "    subb  $E3,x
EE31 : BF 81 C0    "   "    sts  X81C0
EE34 : 60 CA    "` "    neg  $CA,x
EE36 : D0 CD    "  "    subb  X00CD
EE38 : FE DE 70    "  p"    ldx  XDE70
EE3B : DE F0    "  "    ldx  X00F0
EE3D : D1 E5    "  "    cmpb  X00E5
EE3F : D2 A5    "  "    sbcb  X00A5
EE41 : C0 40    " @"    subb  #$40
        ;
EE43 : C3 00 C3 00  "    "    db  $C3, $00, $C3, $00
EE47 : C3    " "    db  $C3
        ;
EE48 : D0 D7    "  "    subb  X00D7
EE4A : 20 D9    "  "    bra  LEE25
        ;
EE4C : F0 D0 00    "   "    subb  XD000
EE4F : D1 E5    "  "    cmpb  X00E5
EE51 : D1 E5    "  "    cmpb  X00E5
EE53 : D2 45    " E"    sbcb  X0045
EE55 : B0 00 E4    "   "    suba  X00E4
EE58 : 53    "S"    comb
EE59 : BB 68 BB    " h "    adda  X68BB
        ;
EE5C : 6B EC    "k "    db  $6B, $EC
        ;
EE5E : B2 EC B3    "   "    sbca  XECB3
        ;
EE61 : EC    " "    db  $EC
        ;
EE62 : B4 EC B5    "   "    anda  XECB5
        ;
EE65 : EC    " "    db  $EC
        ;
EE66 : B6 EC B7    "   "    ldaa  XECB7
        ;
EE69 : EC    " "    db  $EC
        ;
EE6A : B8 EC B9    "   "    eora  XECB9
        ;
EE6D : EC    " "    db  $EC
        ;
EE6E : BA EC BB    "   "    oraa  XECBB
        ;
EE71 : EC    " "    db  $EC
        ;
EE72 : BD EC BE    "   "    jsr  LECBE
        ;
EE75 : EC    " "    db  $EC
        ;
EE76 : BF EC C0    "   "    sts  XECC0
        ;
EE79 : EC    " "    db  $EC
        ;
EE7A : C1 EC    "  "    cmpb  #$EC
        ;
EE7C : C3 EC    "  "    db  $C3, $EC
        ;
EE7E : C4 EC    "  "    andb  #$EC
EE80 : C6 EC    "  "    ldab  #$EC
EE82 : C8 EC    "  "    eorb  #$EC
EE84 : C9 EC    "  "    adcb  #$EC
EE86 : CB EC    "  "    addb  #$EC
EE88 : CE EC D1    "   "    ldx  #$ECD1
        ;
EE8B : EC D3 EC    "   "    db  $EC, $D3, $EC
        ;
EE8E : D5 EC    "  "    bitb  X00EC
EE90 : D8 EC    "  "    eorb  X00EC
EE92 : DA EC    "  "    orab  X00EC
        ;
EE94 : DC EC DD EC  "    "    db  $DC, $EC, $DD, $EC
        ;
EE98 : DE EC    "  "    ldx  X00EC
EE9A : DF EC    "  "    stx  X00EC
EE9C : E0 EC    "  "    subb  $EC,x
EE9E : EB EC    "  "    addb  $EC,x
EEA0 : F0 EC FA    "   "    subb  XECFA
        ;
EEA3 : ED 00 ED    "   "    db  $ED, $00, $ED
        ;
EEA6 : 0A    " "    clv
        ;
EEA7 : ED 15 ED 1A  "    "    db  $ED, $15, $ED, $1A
EEAB : ED 1E ED    "   "    db  $ED, $1E, $ED
        ;
EEAE : 25 ED    "% "    bcs  LEE9D
EEB0 : 2C ED    ", "    bge  LEE9F
EEB2 : 30    "0"    tsx
        ;
EEB3 : ED    " "    db  $ED
        ;
EEB4 : 3E    ">"    wai
        ;
EEB5 : ED    " "    db  $ED
        ;
EEB6 : 43    "C"    coma
        ;
EEB7 : ED    " "    db  $ED
        ;
EEB8 : 4D    "M"    tsta
        ;
EEB9 : ED    " "    db  $ED
        ;
EEBA : 54    "T"    lsrb
        ;
EEBB : ED    " "    db  $ED
        ;
EEBC : 57    "W"    asrb
        ;
EEBD : ED 5E ED    " ^ "    db  $ED, $5E, $ED
        ;
EEC0 : 67 ED    "g "    asr  $ED,x
        ;
EEC2 : 72 ED    "r "    db  $72, $ED
        ;
EEC4 : 78 ED 7F    "x  "    asl  XED7F
        ;
EEC7 : ED 87 ED 93  "    "    db  $ED, $87, $ED, $93
EECB : ED    " "    db  $ED
        ;
EECC : 9B ED    "  "    adda  X00ED
EECE : A4 ED    "  "    anda  $ED,x
EED0 : A7 ED    "  "    staa  $ED,x
EED2 : AE ED    "  "    lds  $ED,x
EED4 : B6 ED BD    "   "    ldaa  XEDBD
        ;
EED7 : ED    " "    db  $ED
        ;
EED8 : C6 ED    "  "    ldab  #$ED
EEDA : BD 
;*************************************;
; Copyright message
;*************************************;
EEDB : 43 4F    "CO"                  ;COPYRIGHT
EEDD : 50    "P"                      ;
EEDE : 59    "Y"                      ;
EEDF : 52    "R"                      ;
EEE0 : 49    "I"                      ;
EEE1 : 47    "G"                      ;
EEE2 : 48    "H"                      ;
EEE3 : 54    "T"                      ;
EEE4 : 2D 57    "-W"                  ;-WILLIAMS
EEE6 : 49    "I"                      ;
EEE7 : 4C    "L"                      ;
EEE8 : 4C    "L"                      ;
EEE9 : 49    "I"                      ;
EEEA : 41    "A"                      ;
EEEB : 4D    "M"                      ;
EEEC : 53    "S"                      ;
EEED : 20 45    " E"                  ; ELECTRONICS
EEEF : 4C    "L"                      ;
EEF0 : 45    "E"                      ;
EEF1 : 43    "C"                      ;
EEF2 : 54    "T"                      ;
EEF3 : 52    "R"                      ;
EEF4 : 4F    "O"                      ;
EEF5 : 4E    "N"                      ;
EEF6 : 49    "I"                      ;
EEF7 : 43    "C"                      ;
EEF8 : 53    "S"                      ;
EEF9 : 2D 39    "-9"                  ;-9/27/80
EEFB : 2F 32    "/2"                  ;
EEFD : 37    "7"                      ;
EEFE : 2F 38    "/8"                  ;
EF00 : 30    "0"                      ;
EF01 : 2D 50    "-P"                  ;-PGD
EF03 : 47    "G"                      ;
EF04 : 44    "D"                      ;
;*************************************;
; DIAGNOSTICS
;*************************************;
;TALKD
EF05 : CE EC B0   ldx  #$ECB0         ;load X with ECB0h
EF08 : 20 3B      bra  LEF45          ;branch always TKIRQ5
;*************************************;
; TALKING IRQ processing (A has sound select value)
;*************************************;
;TKIRQ
EF0A : D6 00      ldab  $00           ;load B wqith addr 00
EF0C : 27 01      beq  LEF0F          ;branch Z=1 TKIRQ1
EF0E : 39         rts                 ;return subroutine
;TKIRQ1
EF0F : CE EE 5B   ldx  #$EE5B         ;load X with EE5Bh
EF12 : 97 04      staa  $04
EF14 : 84 1F      anda  #$1F          ;and A with 1Fh
EF16 : 27 78      beq  LEF90          ;branch Z=1 TKPRM2
EF18 : 7D 00 01   tst  $0001          ;test addr 0001
EF1B : 26 10      bne  LEF2D          ;branch Z=0 TKIRQ2
EF1D : 8B 1F      adda  #$1F          ;add A with 1Fh
EF1F : 81 3E      cmpa  #$3E          ;compare A with 3Eh
EF21 : 26 0A      bne  LEF2D          ;branch Z=0 TKIRQ2
EF23 : 0E         cli                 ;clear interrupts I=0
EF24 : 7C 00 02   inc  $0002          ;incr addr 0002
EF27 : 96 02      ldaa  $02           ;load A with addr 02
EF29 : 84 1F      anda  #$1F          ;and A with 1Fh
EF2B : 8B 20      adda  #$20          ;add A with 20h
;TKIRQ2
EF2D : 81 1B      cmpa  #$1B          ;compare A with 1Bh
EF2F : 23 03      bls  LEF34          ;branch C+Z=1 TKIRQ3
EF31 : 7C 00 00   inc  $0000          ;incr addr 0000
;TKIRQ3
EF34 : 48         asla                ;arith shift left A
EF35 : BD FF F3   jsr  LFFF3          ;jump sub Sound ROM (jmp to ADDX)
EF38 : EE 00      ldx  $00,x          ;load x with X+00h
EF3A : 96 01      ldaa  $01           ;load A with addr 01
EF3C : 26 07      bne  LEF45          ;branch Z=0 TKIRQ5
EF3E : 86 FA      ldaa  #$FA          ;load A with FAh

;TKIRQ4
EF40 : 8D 6E      bsr  LEFB0          ;branch sub
EF42 : 4A         deca
EF43 : 26 FB      bne  LEF40
;TKIRQ5:
EF45 : DF 09      stx  X0009
EF47 : A6 00      ldaa  $00,x
EF49 : 84 7F      anda  #$7F
EF4B : 81 28      cmpa  #$28
EF4D : 26 03      bne  LEF52
EF4F : 7F 00 03   clr  X0003
;TKIRQ6
EF52 : 81 26      cmpa  #$26
EF54 : 26 04      bne  LEF5A
EF56 : C6 FF      ldab  #$FF
EF58 : D7 03      stab  X0003
;TKIRQ7
EF5A : 81 27      cmpa  #$27
EF5C : 26 02      bne  LEF60
EF5E : 97 03      staa  X0003
;TKIRQ8
EF60 : 81 25      cmpa  #$25
EF62 : 22 21      bhi  LEF85
EF64 : 48         asla
EF65 : 48         asla
EF66 : CE ED C5   ldx  #$EDC5
EF69 : BD FF F3   jsr  LFFF3          ;jump sub Sound ROM (jmp to ADDX)
EF6C : DF 0B      stx  X000B
EF6E : EE 00      ldx  $00,x
EF70 : DF 05      stx  X0005
EF72 : DE 0B      ldx  X000B
EF74 : EE 02      ldx  $02,x
EF76 : DF 07      stx  X0007
EF78 : 8D 3C      bsr  LEFB6
;TKIRQ9
EF7A : DE 09      ldx  X0009
EF7C : A6 00      ldaa  $00,x
EF7E : 81 28      cmpa  #$28
EF80 : 23 0E      bls  LEF90
EF82 : 08         inx
EF83 : 20 C0      bra  LEF45
;*************************************;
;TALKING param 1
;*************************************;
;TKPRM1
EF85 : A6 00      ldaa  $00,x         ;load A with X+00h
;TKP1LP
EF87 : 8D 27      bsr  LEFB0          ;branch sub TKCD
EF89 : 4A         deca                ;decr A
EF8A : 26 FB      bne  LEF87          ;branch Z=0 TKP1LP
EF8C : 97 04      staa  $04           ;store A in addr 04
EF8E : 20 EA      bra  LEF7A          ;branch always TKIRQ9
;*************************************;
;TALKING param 2
;*************************************;
;TKPRM2
EF90 : 7D 00 01   tst  $0001          ;test addr 0001
EF93 : 26 07      bne  LEF9C          ;branch Z=0 TKPM21
EF95 : 86 32      ldaa  #$32          ;load A with 32h (#50)
;TKP2LP - count down A loop
EF97 : 8D 17      bsr  LEFB0          ;branch sub TKCD
EF99 : 4A         deca                ;decr A 
EF9A : 26 FB      bne  LEF97          ;branch Z=0 TKP2LP
;TKPM21
EF9C : 96 04      ldaa  $04           ;load A with addr 04
EF9E : 26 08      bne  LEFA8          ;branch Z=0 TKPM22
EFA0 : 7D 00 01   tst  $0001          ;test addr 0001
EFA3 : 27 03      beq  LEFA8          ;branch Z=1 TKPM22
EFA5 : 43         coma                ;complement 1s A
EFA6 : 20 03      bra  LEFAB          ;branch always EXIT
;TKPM22
EFA8 : 7C 00 00   inc  $0000          ;incr addr 0000
;EXIT
EFAB : F6 04 02   ldab  $0402         ;load B with PIA sound select
EFAE : 0E         cli                 ;clear interrupts I=0
EFAF : 39         rts                 ;return subroutine
;*************************************;
;TALKING count down loop
;*************************************;
;TKCD
EFB0 : C6 94      ldab  #$94          ;load B with 94h (#148)(#-108)
;TKCDLP
EFB2 : 5A         decb                ;decr B
EFB3 : 26 FD      bne  LEFB2          ;branch Z=0 TKCDLP
EFB5 : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech clock (0403)
;*************************************;
;TKSC
EFB6 : 86 2F      ldaa  #$2F          ;load A with 2Fh (0010 1111)
EFB8 : B7 04 03   staa  $0403         ;store A (2Fh) in PIA CR port B (CB2 - speech clock)
EFBB : DE 05      ldx  $05            ;load X with addr 05
EFBD : A6 00      ldaa  $00,x         ;load A with X+00h
EFBF : 81 AA      cmpa  #$AA          ;compare A with AAh
EFC1 : 26 12      bne  LEFD5          ;branch Z=0 TKSCX
EFC3 : 7F 00 04   clr  $0004          ;clear addr 0004
EFC6 : 08         inx                 ;incr X
EFC7 : C6 01      ldab  #$01          ;load B with 01h
;TKSC1
EFC9 : B7 04 02   staa  $0402         ;store A in PIA sound select
EFCC : 58         aslb                ;arith shift left B
EFCD : 26 07      bne  LEFD6          ;branch Z=0 TKSD
EFCF : 59         rolb                ;rotate left B
EFD0 : 08         inx                 ;incr X
EFD1 : 9C 07      cpx  $07            ;compare X with addr 07
EFD3 : 26 05      bne  LEFDA          ;branch Z=0 TKSD1
;TKSCX
EFD5 : 39         rts
;*************************************;
;TALKING speech data (0401)
;*************************************;
;TKSD
EFD6 : 6D 00      tst  $00,x          ;test X+00h
EFD8 : 6D 00      tst  $00,x          ;test X+00h
;TKSD1
EFDA : 96 03      ldaa  $03           ;load A with addr 03
EFDC : 27 08      beq  LEFE6          ;branch Z=1 TKSD3
EFDE : 2A 04      bpl  LEFE4          ;branch N=0 TKSD2
EFE0 : 20 00      bra  LEFE2          ;branch always (*)
EFE2 : 20 00      bra  LEFE4          ;branch always TKSD2 (*)
;TKSD2
EFE4 : 20 00      bra  LEFE6          ;branch always TKSD3 (*)
;TKSD3
EFE6 : E5 00      bitb  $00,x         ;bit test B with X+00h
EFE8 : 27 08      beq  LEFF2          ;branch Z=0 TKSD4
EFEA : 86 BC      ldaa  #$BC          ;load A with BCh (1011 1100)
EFEC : B7 04 01   staa  $0401         ;store A (BCh) in PIA sound select (CA2 - speech data)
EFEF : 7E EF C9   jmp  LEFC9          ;jump TKSC1
;TKSD4
EFF2 : 86 B4      ldaa  #$B4          ;load A with B4h (1011 0100) (flip bit 3)
EFF4 : B7 04 01   staa  $0401         ;store A (B4h) in PIA sound select (CA2 - speech data)
EFF7 : 7E EF C9   jmp  LEFC9          ;jump TKSC1
;*************************************;
;ENTRY (from Sound ROM)
;*************************************;
EFFA : 7E EF 05   jmp  LEF05          ;jump TALKD
EFFD : 7E EF 0A   jmp  LEF0A          ;jump TIRQ (TALK)

;--------------------------------------------------------------





