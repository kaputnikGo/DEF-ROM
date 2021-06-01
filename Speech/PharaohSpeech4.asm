        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    PharaohSpeech4.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  DCEC
        ;  CRC-32:    9ECC23FD
        ;
        ;  Date:    Sun May 09 23:17:45 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;Pharaoh Speech ROM IC4
        ; 
        ;update 10/May/2021
        ;
;*
;* TALKING EQUATES
;*
TALK     EQU  $EFFD    ;ENTRY TO TALKING         : SPEECH ROM ADDR
TALKD    EQU  $EFFA    ;ENTRY FOR DIAGNOSTICS    :  "      "    "
;
;
;

          org  $E000
E000 : 00    " "    db  $00
        ;
E001 : A0 ED    "  "    suba  $ED,x
E003 : EF D5    "  "    stx  $D5,x
E005 : AA AA    "  "    oraa  $AA,x
E007 : D6 AA    "  "    ldab  X00AA
        ;
E009 : 51    "Q"    db  $51
        ;
E00A : 10    " "    sba
        ;
E00B : FC FC    "  "    db  $FC, $FC
        ;
E00D : 7E 14 40    "~ @"    jmp  L1440
        ;
E010 : 40    "@"    nega
E011 : E8 69    " i"    eorb  $69,x
        ;
E013 : 83    " "    db  $83
        ;
E014 : 81 D1    "  "    cmpa  #$D1
E016 : FB FB B5    "   "    addb  XFBB5
E019 : 24 3F    "$?"    bcc  LE05A
E01B : 3F    "?"    swi
E01C : 9F 0C    "  "    sts  X000C
E01E : 20 20    "  "    bra  LE040
        ;
E020        XE020:
E020 : 7C 79 23    "|y#"    inc  X7923
        ;
E023 : 00    " "    db  $00
        ;
E024 : 90 54    " T"    suba  X0054
E026 : DB 7B    " {"    addb  X007B
E028 : FF EF DF    "   "    stx  XEFDF
E02B : 23 01    "# "    bls  LE02E
E02D : 0C    " "    clc
E02E        LE02E:
E02E : 8C 2F 37    " /7"    cpx  #$2F37
        ;
E031 : 18    " "    db  $18
        ;
E032 : 10    " "    sba
E033 : 94 B4    "  "    anda  X00B4
E035 : 70 B0 F8    "p  "    neg  XB0F8
        ;
E038 : FC 7B    " {"    db  $FC, $7B
        ;
E03A : E7 C0    "  "    stab  $C0,x
E03C : E1 F3    "  "    cmpb  $F3,x
        ;
E03E : F3    " "    db  $F3
        ;
E03F : 86 03    "  "    ldaa  #$03
E041 : 81 45    " E"    cmpa  #$45
E043 : 26 0C    "& "    bne  LE051
E045 : F4 F3 F9    "   "    andb  XF3F9
E048 : 40    "@"    nega
E049 : 01    " "    nop
E04A : C1 E3    "  "    cmpb  #$E3
E04C : FF BF 0F    "   "    stx  XBF0F
E04F : 07    " "    tpa
        ;
E050 : 87    " "    db  $87
        ;
E051        LE051:
E051 : 26 0A    "& "    bne  LE05D
E053 : FE F8 78    "  x"    ldx  XF878
E056 : 88 80    "  "    eora  #$80
E058 : C1 E0    "  "    cmpb  #$E0
E05A        LE05A:
E05A : 68 A3    "h "    asl  $A3,x
        ;
E05C : 87    " "    db  $87
        ;
E05D        LE05D:
E05D : E7 FF    "  "    stab  $FF,x
E05F : 9B 8E    "  "    adda  X008E
        ;
E061 : 1F    " "    db  $1F
        ;
E062 : 3F    "?"    swi
        ;
E063 : 87 04 18    "   "    db  $87, $04, $18
        ;
E066 : 28 9E    "( "    bvc  LE006
E068 : AE 30    " 0"    lds  $30,x
        ;
E06A : 00    " "    db  $00
        ;
E06B : 40    "@"    nega
E06C : 6C FB    "l "    inc  $FB,x
E06E : FF FF 1F    "   "    stx  XFF1F
E071 : 23 C4    "# "    bls  LE037
E073 : E8 78    " x"    eorb  $78,x
E075 : D5 42    " B"    bitb  X0042
E077 : 81 40    " @"    cmpa  #$40
E079 : 80 00    "  "    suba  #$00
E07B : F1 FC 7F    "   "    cmpb  XFC7F
E07E : 7F D6 68    "  h"    clr  XD668
E081 : F2 F6 CE    "   "    sbcb  XF6CE
        ;
E084 : 41    "A"    db  $41
        ;
E085 : 01    " "    nop
E086 : 90 A0    "  "    suba  X00A0
E088 : 79 3C 18    "y< "    rol  X3C18
E08B : 10    " "    sba
E08C : F4 FD FF    "   "    andb  XFDFF
E08F : 77 45 91    "wE "    asr  X4591
        ;
E092 : 52    "R"    db  $52
        ;
E093 : A5 62    " b"    bita  $62,x
        ;
E095 : 1D    " "    db  $1D
        ;
E096 : DF 07    "  "    stx  X0007
E098 : 08    " "    inx
        ;
E099 : 00    " "    db  $00
        ;
E09A        LE09A:
E09A : 48    "H"    asla
E09B : FE FF 7F    "   "    ldx  XFF7F
        ;
E09E : 14    " "    db  $14
        ;
E09F : 44    "D"    lsra
E0A0 : D1 F1    "  "    cmpb  X00F1
E0A2 : E7 F7    "  "    stab  $F7,x
E0A4 : A1 20    "  "    cmpa  $20,x
        ;
E0A6 : 02 02 83    "   "    db  $02, $02, $83
        ;
E0A9 : DB BF    "  "    addb  X00BF
E0AB : 3E    ">"    wai
E0AC : 0F    " "    sei
E0AD : 29 F4    ") "    bvs  LE0A3
E0AF : F8 7F 36    "  6"    eorb  X7F36
E0B2 : A0 B0    "  "    suba  $B0,x
E0B4        LE0B4:
E0B4 : F0 E0 20    "   "    subb  XE020
E0B7 : 20 E1    "  "    bra  LE09A
        ;
E0B9 : E7 D7    "  "    stab  $D7,x
E0BB : 9F 8F    "  "    sts  X008F
        ;
E0BD : 8F    " "    db  $8F
        ;
E0BE : 0E    " "    cli
E0BF : 0D    " "    sec
E0C0 : 0E    " "    cli
E0C1 : DF 5F    " _"    stx  X005F
E0C3 : 81 01    "  "    cmpa  #$01
        ;
E0C5 : 00    " "    db  $00
        ;
E0C6 : C8 DF    "  "    eorb  #$DF
E0C8 : FF EF 18    "   "    stx  XEF18
E0CB : 10    " "    sba
E0CC : B2 F6 FE    "   "    sbca  XF6FE
E0CF : 7A 55 80    "zU "    dec  X5580
        ;
E0D2 : 00    " "    db  $00
        ;
E0D3 : 40    "@"    nega
E0D4 : BE DF DF    "   "    lds  XDFDF
        ;
E0D7 : 83    " "    db  $83
        ;
E0D8 : 10    " "    sba
E0D9 : 0A    " "    clv
E0DA : 9F 7F    "  "    sts  X007F
E0DC : 9F 16    "  "    sts  X0016
        ;
E0DE : 12    " "    db  $12
        ;
E0DF : 08    " "    inx
        ;
E0E0 : 00    " "    db  $00
        ;
E0E1 : E7 FD    "  "    stab  $FD,x
        ;
E0E3 : FD 38    " 8"    db  $FD, $38
        ;
E0E5 : 40    "@"    nega
E0E6 : F0 F8 FB    "   "    subb  XF8FB
        ;
E0E9 : 75 61 41    "uaA"    db  $75, $61, $41
        ;
E0EC : 40    "@"    nega
E0ED : 30    "0"    tsx
E0EE : BC BF 77    "  w"    cpx  XBF77
        ;
E0F1 : 51    "Q"    db  $51
        ;
E0F2 : 10    " "    sba
E0F3 : 8E AF FF    "   "    lds  #$AFFF
        ;
E0F6 : 55    "U"    db  $55
        ;
E0F7 : 86 06    "  "    ldaa  #$06
E0F9 : 81 C0    "  "    cmpa  #$C0
E0FB : F1 F1 C7    "   "    cmpb  XF1C7
        ;
E0FE : C3    " "    db  $C3
        ;
E0FF : C1 E1    "  "    cmpb  #$E1
E101 : D5 D7    "  "    bitb  X00D7
        ;
E103 : E3 51 83    " Q "    db  $E3, $51, $83
        ;
E106 : E0 30    " 0"    subb  $30,x
        ;
E108 : 38    "8"    db  $38
        ;
E109 : 7E EC 78    "~ x"    jmp  LEC78
        ;
E10C : 70 74 EE    "pt "    neg  X74EE
E10F : F9 70 5A    " pZ"    adcb  X705A
        ;
E112 : 03 1C    "  "    db  $03, $1C
        ;
E114 : 0E    " "    cli
E115 : 8E 1E 3D    "  ="    lds  #$1E3D
        ;
E118 : 1E 1E 8F    "   "    db  $1E, $1E, $8F
        ;
E11B : 3B    ";"    rti
        ;
E11C : 5D    "]"    tstb
        ;
E11D : 1C 8F    "  "    db  $1C, $8F
        ;
E11F : 01    " "    nop
        ;
E120 : 87 83 A3    "   "    db  $87, $83, $A3
        ;
E123 : 27 8F    "' "    beq  LE0B4
        ;
E125 : 87 C7 C3 C7  "    "    db  $87, $C7, $C3, $C7
E129 : 87 D3    "  "    db  $87, $D3
        ;
E12B : 63 E0    "c "    com  $E0,x
E12D : 70 70 EC    "pp "    neg  X70EC
E130 : D8 F1    "  "    eorb  X00F1
E132 : E1 E8    "  "    cmpb  $E8,x
E134 : F8 F2 E1    "   "    eorb  XF2E1
E137 : F2 0C 38    "  8"    sbcb  X0C38
        ;
E13A : 1C 1C    "  "    db  $1C, $1C
        ;
E13C : 3E    ">"    wai
E13D : 7E 3C 3C    "~<<"    jmp  L3C3C
        ;
E140 : 1C    " "    db  $1C
        ;
E141 : 7E 7A 3C    "~z<"    jmp  L7A3C
        ;
E144 : 9D 02    "  "    db  $9D, $02
        ;
E146 : 01    " "    nop
        ;
E147 : C3    " "    db  $C3
        ;
E148 : CE 9F 17    "   "    ldx  #$9F17
E14B : 07    " "    tpa
E14C : 85 CB    "  "    bita  #$CB
E14E : DF AF    "  "    stx  X00AF
E150 : 6E 1A    "n "    jmp  $1A,x            ;INFO: index jump
        ;
E152 : 00 04 C7    "   "    db  $00, $04, $C7
        ;
E155 : FB 7B 0E    " { "    addb  X7B0E
        ;
E158 : 04    " "    db  $04
        ;
E159 : 43    "C"    coma
E15A : F7 DF 4F    "  O"    stab  XDF4F
E15D : AA 7A    " z"    oraa  $7A,x
E15F : F5 7A EF    " z "    bitb  X7AEF
        ;
E162        LE162:
E162 : CD 12    "  "    db  $CD, $12
        ;
E164 : 43    "C"    coma
E165 : 9F 1F    "  "    sts  X001F
E167 : 4D    "M"    tsta
        ;
E168 : 00 00    "  "    db  $00, $00
        ;
E16A : C0 D5    "  "    subb  #$D5
E16C : DF 4E    " N"    stx  X004E
E16E : 9A 74    " t"    oraa  X0074
E170 : F5 76 E3    " v "    bitb  X76E3
E173 : F9 EF 87    "   "    adcb  XEF87
E176 : 01    " "    nop
        ;
E177 : 00    " "    db  $00
        ;
E178 : 90 FC    "  "    suba  X00FC
E17A : DA 43    " C"    orab  X0043
E17C : 01    " "    nop
E17D : 46    "F"    rora
E17E : AF DE    "  "    sts  $DE,x
        ;
E180 : 14    " "    db  $14
        ;
E181 : BE FF 3F    "  ?"    lds  XFF3F
E184 : 07    " "    tpa
        ;
E185 : 00    " "    db  $00
        ;
E186 : F0 F2 55    "  U"    subb  XF255
        ;
E189 : 05    " "    db  $05
        ;
E18A : 08    " "    inx
E18B : 9C BE    "  "    cpx  X00BE
        ;
E18D : 52    "R"    db  $52
        ;
E18E : 10    " "    sba
E18F : FA EF DF    "   "    orab  XEFDF
E192 : 01    " "    nop
E193 : 20 FC    "  "    bra  LE191
        ;
E195 : FD A3 00 83  "    "    db  $FD, $A3, $00, $83
E199 : 5E    "^"    db  $5E
        ;
E19A : 0F    " "    sei
        ;
E19B : 02    " "    db  $02
        ;
E19C : 80 FF    "  "    suba  #$FF
        ;
E19E : FD 71 00    " q "    db  $FD, $71, $00
        ;
E1A1 : 94 FF    "  "    anda  X00FF
        ;
E1A3 : 1F    " "    db  $1F
        ;
E1A4 : 08    " "    inx
E1A5 : E0 F2    "  "    subb  $F2,x
E1A7 : D7 01    "  "    stab  X0001
        ;
E1A9 : 04    " "    db  $04
        ;
E1AA : FA FF 1F    "   "    orab  XFF1F
        ;
E1AD : 02    " "    db  $02
        ;
E1AE : D0 F9    "  "    subb  X00F9
E1B0 : 7F 01 80    "   "    clr  X0180
E1B3 : 7E 3F 10    "~? "    jmp  L3F10
E1B6 : 20 AA    "  "    bra  LE162
        ;
E1B8 : FF FF 20    "   "    stx  XFF20
E1BB : 80 9F    "  "    suba  #$9F
E1BD : 3F    "?"    swi
        ;
E1BE : 03    " "    db  $03
        ;
E1BF : 40    "@"    nega
E1C0 : F9 F7 00    "   "    adcb  XF700
E1C3 : 08    " "    inx
        ;
E1C4 : 4B    "K"    db  $4B
        ;
E1C5 : FF DF 07    "   "    stx  XDF07
        ;
E1C8 : 02    " "    db  $02
        ;
E1C9 : F6 FF 20    "   "    ldab  XFF20
        ;
E1CC : 00    " "    db  $00
        ;
E1CD : B7 BF 0A    "   "    staa  XBF0A
E1D0 : 80 B0    "  "    suba  #$B0
E1D2 : F4 3F 0F    " ? "    andb  X3F0F
        ;
E1D5 : 00    " "    db  $00
        ;
E1D6 : DE FF    "  "    ldx  X00FF
E1D8 : A7 04    "  "    staa  $04,x
E1DA : 7A FF 10    "z  "    dec  XFF10
E1DD : 40    "@"    nega
E1DE : A5 A5    "  "    bita  $A5,x
E1E0 : 3F    "?"    swi
        ;
E1E1 : 1F 00    "  "    db  $1F, $00
        ;
E1E3 : D0 F1    "  "    subb  X00F1
        ;
E1E5 : 83    " "    db  $83
        ;
E1E6 : 91 FF    "  "    cmpa  X00FF
E1E8 : FF 0B 80    "   "    stx  X0B80
E1EB : 54    "T"    lsrb
        ;
E1EC : ED    " "    db  $ED
        ;
E1ED : BF 0F 00    "   "    sts  X0F00
E1F0 : EA A3    "  "    orab  $A3,x
        ;
E1F2 : 02 00 FD    "   "    db  $02, $00, $FD
        ;
E1F5 : FF 6B A0    " k "    stx  X6BA0
E1F8 : 84 FD    "  "    anda  #$FD
E1FA : DF 07    "  "    stx  X0007
E1FC : 40    "@"    nega
        ;
E1FD : FD    " "    db  $FD
        ;
E1FE : 7E 00 AA    "~  "    jmp  L00AA
        ;
E201        LE201:
E201 : 38    "8"    db  $38
        ;
E202 : FF 9A AA    "   "    stx  X9AAA
E205 : 92 FF    "  "    sbca  X00FF
        ;
E207 : FC    " "    db  $FC
        ;
E208 : 30    "0"    tsx
E209 : F0 EF 07    "   "    subb  XEF07
        ;
E20C : 05 00 87 05  "    "    db  $05, $00, $87, $05
        ;
E210 : 29 EF    ") "    bvs  LE201
E212 : F9 EF 03    "   "    adcb  XEF03
E215 : 90 FF    "  "    suba  X00FF
E217 : 7F 20 A0    "   "    clr  X20A0
E21A : BF 03 00    "   "    sts  X0300
E21D : 60 EF    "` "    neg  $EF,x
E21F : 7F 0F 00    "   "    clr  X0F00
        ;
E222 : FD    " "    db  $FD
        ;
E223 : FF 03 02    "   "    stx  X0302
E226 : FE FE 04    "   "    ldx  XFE04
        ;
E229 : 00    " "    db  $00
        ;
E22A : 30    "0"    tsx
E22B : FF BF 00    "   "    stx  XBF00
E22E : E0 FF    "  "    subb  $FF,x
E230 : 2F 04    "/ "    ble  LE236
E232 : E8 FD    "  "    eorb  $FD,x
        ;
E234 : 6B    "k"    db  $6B
        ;
E235 : 01    " "    nop
        ;
E236        LE236:
E236 : 00    " "    db  $00
        ;
E237 : F1 F7 63    "  c"    cmpb  XF763
        ;
E23A : 00    " "    db  $00
        ;
E23B : BE BF 15    "   "    lds  XBF15
E23E : 82 D5    "  "    sbca  #$D5
E240 : DF 12    "  "    stx  X0012
E242 : 25 38    "%8"    bcs  LE27C
E244 : 0E    " "    cli
        ;
E245 : 05    " "    db  $05
        ;
E246 : AB F7    "  "    adda  $F7,x
E248 : AA A0    "  "    oraa  $A0,x
E24A : FA 5F 0B    " _ "    orab  X5F0B
E24D : 44    "D"    lsra
E24E : A5 FB    "  "    bita  $FB,x
E250 : 9F 00    "  "    sts  X0000
        ;
E252 : 00    " "    db  $00
        ;
E253 : FE BF 00    "   "    ldx  XBF00
E256 : A0 FF    "  "    suba  $FF,x
E258 : 3F    "?"    swi
        ;
E259 : 00    " "    db  $00
        ;
E25A : B0 ED FF    "   "    suba  XEDFF
E25D : 07    " "    tpa
        ;
E25E : 00    " "    db  $00
        ;
E25F : F0 FF 05    "   "    subb  XFF05
        ;
E262 : 00    " "    db  $00
        ;
E263 : EF FF    "  "    stx  $FF,x
E265 : 24 00    "$ "    bcc  LE267
E267        LE267:
E267 : E9 FF    "  "    adcb  $FF,x
E269 : 3F    "?"    swi
        ;
E26A : 00    " "    db  $00
        ;
E26B        LE26B:
E26B : 20 FE    "  "    bra  LE26B
        ;
E26D : 5F    "_"    clrb
        ;
E26E : 02    " "    db  $02
        ;
E26F : C0 FF    "  "    subb  #$FF
E271 : AF 00    "  "    sts  $00,x
E273 : 40    "@"    nega
E274 : FB FF 83    "   "    addb  XFF83
        ;
E277 : 00    " "    db  $00
        ;
E278 : 4C    "L"    inca
E279 : FF 15 80    "   "    stx  X1580
E27C        LE27C:
E27C : F4 FF 15    "   "    andb  XFF15
        ;
E27F : 00    " "    db  $00
        ;
E280 : 70 FF 7F    "p  "    neg  XFF7F
E283 : 10    " "    sba
E284 : 40    "@"    nega
E285 : E9 DF    "  "    adcb  $DF,x
        ;
E287 : 02    " "    db  $02
        ;
E288 : 90 FE    "  "    suba  X00FE
E28A : 7F 00 01    "   "    clr  X0001
E28D : FB FF 07    "   "    addb  XFF07
E290 : 01    " "    nop
E291 : C4 FF    "  "    andb  #$FF
E293 : 19    " "    daa
        ;
E294 : 00    " "    db  $00
        ;
E295 : E9 FF    "  "    adcb  $FF,x
E297 : 07    " "    tpa
E298 : 10    " "    sba
E299 : 70 FD FF    "p  "    neg  XFDFF
        ;
E29C : 00 00    "  "    db  $00, $00
        ;
E29E : FE 3F 02    " ? "    ldx  X3F02
E2A1 : A0 FF    "  "    suba  $FF,x
E2A3 : 5F    "_"    clrb
        ;
E2A4 : 00    " "    db  $00
        ;
E2A5 : 50    "P"    negb
        ;
E2A6 : DD    " "    db  $DD
        ;
E2A7 : FF 0F 00    "   "    stx  X0F00
E2AA : F0 F7 07    "   "    subb  XF707
        ;
E2AD : 02    " "    db  $02
        ;
E2AE : BC FF 23    "  #"    cpx  XFF23
E2B1 : 80 D2    "  "    suba  #$D2
E2B3 : EF 3F    " ?"    stx  $3F,x
E2B5 : 01    " "    nop
E2B6 : 80 FD    "  "    suba  #$FD
E2B8 : 5F    "_"    clrb
E2B9 : 01    " "    nop
E2BA : 50    "P"    negb
E2BB : FF AF 00    "   "    stx  XAF00
E2BE : A4 AF    "  "    anda  $AF,x
E2C0 : FF 03 03    "   "    stx  X0303
E2C3 : C6 FF    "  "    ldab  #$FF
E2C5 : 58    "X"    aslb
E2C6 : 40    "@"    nega
E2C7 : F4 9F 07    "   "    andb  X9F07
E2CA : 0C    " "    clc
E2CB : BE BB 02    "   "    lds  XBB02
E2CE : 07    " "    tpa
E2CF : 0F    " "    sei
E2D0 : 2F F2    "/ "    ble  LE2C4
E2D2 : E0 F1    "  "    subb  $F1,x
        ;
E2D4 : 13 15    "  "    db  $13, $15
        ;
E2D6 : 3E    ">"    wai
E2D7 : BE FC 02    "   "    lds  XFC02
        ;
E2DA : 00    " "    db  $00
        ;
E2DB : FF 8F 01    "   "    stx  X8F01
E2DE : E0 FF    "  "    subb  $FF,x
E2E0 : 57    "W"    asrb
        ;
E2E1 : 00    " "    db  $00
        ;
E2E2 : F0 FF CB    "   "    subb  XFFCB
E2E5 : 24 00    "$ "    bcc  LE2E7
E2E7        LE2E7:
E2E7 : F0 FF 07    "   "    subb  XFF07
        ;
E2EA : 00    " "    db  $00
        ;
E2EB : FE FF 08    "   "    ldx  XFF08
        ;
E2EE : 00    " "    db  $00
        ;
E2EF : F7 7F 47    "  G"    stab  X7F47
        ;
E2F2 : 00    " "    db  $00
        ;
E2F3 : 80 FF    "  "    suba  #$FF
E2F5 : EF 01    "  "    stx  $01,x
E2F7 : C0 FE    "  "    subb  #$FE
E2F9 : 7F 00 A0    "   "    clr  X00A0
E2FC : FF BF 02    "   "    stx  XBF02
        ;
E2FF : 00    " "    db  $00
        ;
E300 : F8 FC 3B    "  ;"    eorb  XFC3B
        ;
E303 : 00    " "    db  $00
        ;
E304 : D4 FF    "  "    andb  X00FF
E306 : 0F    " "    sei
        ;
E307 : 00    " "    db  $00
        ;
E308 : F4 FF 4F    "  O"    andb  XFF4F
        ;
E30B : 00 00    "  "    db  $00, $00
        ;
E30D : EF FF    "  "    stx  $FF,x
        ;
E30F : 18    " "    db  $18
        ;
E310 : 40    "@"    nega
        ;
E311 : FC    " "    db  $FC
        ;
E312 : BF 03 80    "   "    sts  X0380
E315 : F6 FF 0B    "   "    ldab  XFF0B
        ;
E318 : 00    " "    db  $00
        ;
E319 : E0 F9    "  "    subb  $F9,x
E31B : 3F    "?"    swi
E31C : 0E    " "    cli
E31D : 10    " "    sba
E31E : FF 6F 01    " o "    stx  X6F01
E321 : A0 FF    "  "    suba  $FF,x
E323 : 7F 05 00    "   "    clr  X0500
E326 : 70 FE E7    "p  "    neg  XFEE7
E329 : 01    " "    nop
E32A : D0 FF    "  "    subb  X00FF
        ;
E32C : 3D 00    "= "    db  $3D, $00
        ;
E32E : E8 FF    "  "    eorb  $FF,x
E330 : 9F 00    "  "    sts  X0000
        ;
E332 : 00 3C    " <"    db  $00, $3C
        ;
E334 : FF 1D 00    "   "    stx  X1D00
E337 : D9 FF    "  "    adcb  X00FF
E339 : 07    " "    tpa
        ;
E33A : 00    " "    db  $00
        ;
E33B : FA FF 47    "  G"    orab  XFF47
        ;
E33E : 00 04    "  "    db  $00, $04
        ;
E340 : FE BF 03    "   "    ldx  XBF03
E343 : 80 FD    "  "    suba  #$FD
E345 : FF 00 40    "  @"    stx  X0040
E348 : FF BF 12    "   "    stx  XBF12
E34B : 01    " "    nop
E34C : 80 FF    "  "    suba  #$FF
E34E : 3F    "?"    swi
        ;
E34F : 00    " "    db  $00
        ;
E350 : D0 FF    "  "    subb  X00FF
        ;
E352 : 8F 00    "  "    db  $8F, $00
        ;
E354 : E8 FF    "  "    eorb  $FF,x
        ;
E356 : 4B 12    "K "    db  $4B, $12
        ;
E358 : 01    " "    nop
E359 : E2 FF    "  "    sbcb  $FF,x
        ;
E35B : 03    " "    db  $03
        ;
E35C : 20 FC    "  "    bra  LE35A
        ;
E35E : FF 12 00    "   "    stx  X1200
E361 : 5F    "_"    clrb
E362 : FF 48 85    " H "    stx  X4885
E365 : 80 8F    "  "    suba  #$8F
        ;
E367 : 8F    " "    db  $8F
        ;
E368 : 09    " "    dex
E369 : E1 F9    "  "    cmpb  $F9,x
        ;
E36B : 6B    "k"    db  $6B
        ;
E36C : 0A    " "    clv
E36D : B8 7E 55    " ~U"    eora  X7E55
E370 : 0A    " "    clv
E371 : CB 1F    "  "    addb  #$1F
        ;
E373 : 03    " "    db  $03
        ;
E374 : 82 C7    "  "    sbca  #$C7
E376 : 3F    "?"    swi
        ;
E377 : 51    "Q"    db  $51
        ;
E378 : E0 EB    "  "    subb  $EB,x
        ;
E37A : 8F    " "    db  $8F
        ;
E37B : 01    " "    nop
E37C : 5C    "\"    incb
E37D : F4 FF C1    "   "    andb  XFFC1
        ;
E380 : 00    " "    db  $00
        ;
E381 : E8 7F    "  "    eorb  $7F,x
E383        XE383:
E383 : 0E    " "    cli
E384 : 40    "@"    nega
E385 : FA BF 03    "   "    orab  XBF03
E388 : 40    "@"    nega
E389 : F5 FA 7F    "   "    bitb  XFA7F
        ;
E38C : 00    " "    db  $00
        ;
E38D : C0 FC    "  "    subb  #$FC
E38F : 3F    "?"    swi
        ;
E390 : 00    " "    db  $00
        ;
E391 : 94 FF    "  "    anda  X00FF
        ;
E393 : 1F 00    "  "    db  $1F, $00
        ;
E395 : C2 FB    "  "    sbcb  #$FB
E397 : FF 01 00    "   "    stx  X0100
        ;
E39A : FC    " "    db  $FC
        ;
E39B : FF 00 04    "   "    stx  X0004
E39E : FF BF 02    "   "    stx  XBF02
        ;
E3A1 : 00    " "    db  $00
        ;
E3A2 : EB FF    "  "    addb  $FF,x
E3A4 : 0F    " "    sei
        ;
E3A5 : 00    " "    db  $00
        ;
E3A6 : C2 FF    "  "    sbcb  #$FF
        ;
E3A8 : 4B 00    "K "    db  $4B, $00
        ;
E3AA : F8 FB 1B    "   "    eorb  XFB1B
        ;
E3AD : 00    " "    db  $00
        ;
E3AE : A8 FF    "  "    eora  $FF,x
E3B0 : 3F    "?"    swi
        ;
E3B1 : 02    " "    db  $02
        ;
E3B2 : C0 FA    "  "    subb  #$FA
E3B4 : 77 00 54    "w T"    asr  X0054
        ;
E3B7 : FD    " "    db  $FD
        ;
E3B8 : 5F    "_"    clrb
        ;
E3B9 : 04 00    "  "    db  $04, $00
        ;
E3BB : FF 7F 14    "   "    stx  X7F14
        ;
E3BE : 02    " "    db  $02
        ;
E3BF : 0E    " "    cli
E3C0 : BF 43 C1    " C "    sts  X43C1
E3C3 : E1 7F    "  "    cmpb  $7F,x
E3C5 : 2C 00    ", "    bge  LE3C7
E3C7        LE3C7:
E3C7 : FE FD 11    "   "    ldx  XFD11
E3CA : 0E    " "    cli
E3CB : 78 F8 28    "x ("    asl  XF828
E3CE : 0D    " "    sec
        ;
E3CF : 1E    " "    db  $1E
        ;
E3D0 : DF D2    "  "    stx  X00D2
        ;
E3D2 : 00 FC FD 51  "   Q"    db  $00, $FC, $FD, $51
        ;
E3D6 : 9C 82    "  "    cpx  X0082
E3D8 : 07    " "    tpa
E3D9 : 07    " "    tpa
E3DA : 57    "W"    asrb
E3DB : F9 70 A9    " p "    adcb  X70A9
        ;
E3DE : 05    " "    db  $05
        ;
E3DF : F0 F7 87    "   "    subb  XF787
E3E2 : 78 1E 38    "x 8"    asl  X1E38
E3E5 : 28 5C    "(\"    bvc  LE443
        ;
E3E7 : CF    " "    db  $CF
        ;
E3E8 : 07    " "    tpa
        ;
E3E9 : A3    " "    db  $A3
        ;
E3EA : A5 C1    "  "    bita  $C1,x
        ;
E3EC : CF 1F    "  "    db  $CF, $1F
        ;
E3EE : E2 F9    "  "    sbcb  $F9,x
E3F0 : E0 40    " @"    subb  $40,x
E3F2 : F0 7C 1E    " | "    subb  X7C1E
E3F5 : 0C    " "    clc
E3F6 : 97 06    "  "    staa  X0006
E3F8 : 7F FE 80    "   "    clr  XFE80
        ;
E3FB : CF    " "    db  $CF
        ;
E3FC : C1 81    "  "    cmpb  #$81
E3FE : C2 75    " u"    sbcb  #$75
E400 : FA 30 AA    " 0 "    orab  X30AA
E403 : 0A    " "    clv
E404 : F8 FD 87    "   "    eorb  XFD87
E407 : 5C    "\"    incb
E408 : 81 83    "  "    cmpa  #$83
        ;
E40A : 83    " "    db  $83
        ;
E40B : FA F0 E1    "   "    orab  XF0E1
        ;
E40E : 1A 1E    "  "    db  $1A, $1E
        ;
E410 : E0 EF    "  "    subb  $EF,x
        ;
E412 : 1F    " "    db  $1F
        ;
E413 : 6A 01    "j "    dec  $01,x
E415 : 07    " "    tpa
        ;
E416 : 8F    " "    db  $8F
        ;
E417 : E1 C1    "  "    cmpb  $C1,x
        ;
E419 : E3 7B    " {"    db  $E3, $7B
        ;
E41B : 70 80 BF    "p  "    neg  X80BF
E41E : 3F    "?"    swi
E41F : 96 02    "  "    ldaa  X0002
        ;
E421 : 1C    " "    db  $1C
        ;
E422 : 7C C3 03    "|  "    inc  XC303
        ;
E425 : C7    " "    db  $C7
        ;
E426 : EF E1    "  "    stx  $E1,x
        ;
E428 : 00    " "    db  $00
        ;
E429 : BF FF 98    "   "    sts  XFF98
E42C : 0A    " "    clv
        ;
E42D : 18    " "    db  $18
        ;
E42E : F8 87 07    "   "    eorb  X8707
        ;
E431 : 1C    " "    db  $1C
        ;
E432 : FF C1 03    "   "    stx  XC103
        ;
E435 : 5E    "^"    db  $5E
        ;
E436 : FF 69 09    " i "    stx  X6909
E439 : 30    "0"    tsx
E43A : F0 2F 07    " / "    subb  X2F07
        ;
E43D : 18    " "    db  $18
        ;
E43E : FE A3 03    "   "    ldx  XA303
        ;
E441 : 8F    " "    db  $8F
        ;
E442 : FF E3 01    "   "    stx  XE301
E445 : 60 F0    "` "    neg  $F0,x
        ;
E447 : 7B    "{"    db  $7B
        ;
E448 : 06    " "    tap
        ;
E449 : 18 FC    "  "    db  $18, $FC
        ;
E44B : B5 82 C7    "   "    bita  X82C7
E44E : AA AF    "  "    oraa  $AF,x
E450 : FB F7 FD    "   "    addb  XF7FD
E453 : E7 48    " H"    stab  $48,x
        ;
E455 : 00    " "    db  $00
        ;
E456 : 40    "@"    nega
        ;
E457 : 21    "!"    db  $21
        ;
E458 : D1 75    " u"    cmpb  X0075
E45A : F7 6D 95    " m "    stab  X6D95
E45D : 20 28    " ("    bra  LE487
        ;
E45F : 4A    "J"    deca
        ;
E460 : 75 FD    "u "    db  $75, $FD
        ;
E462 : FF FF 79    "  y"    stx  XFF79
E465 : 24 00    "$ "    bcc  LE467
E467        LE467:
E467 : 10    " "    sba
E468 : 28 69    "(i"    bvc  LE4D3
E46A : DE 7D    " }"    ldx  X007D
E46C : 5D    "]"    tstb
        ;
E46D : 15    " "    db  $15
        ;
E46E : 22 14    "" "    bhi  LE484
        ;
E470 : 65    "e"    db  $65
        ;
E471 : 7E FF FF    "~  "    jmp  LFFFF
        ;
E474 : 2F 16    "/ "    ble  LE48C
E476 : 08    " "    inx
        ;
E477 : 00 14    "  "    db  $00, $14
        ;
E479 : 56    "V"    rorb
E47A : 3E    ">"    wai
E47B : 9F 2B    " +"    sts  X002B
E47D : 8B 82    "  "    adda  #$82
E47F        XE47F:
E47F : 8A CF    "  "    oraa  #$CF
E481 : EF FF    "  "    stx  $FF,x
E483 : 0B    " "    sev
E484        LE484:
E484 : 07    " "    tpa
        ;
E485 : 02    " "    db  $02
        ;
E486 : 81 CA    "  "    cmpa  #$CA
E488 : AB EF    "  "    adda  $EF,x
E48A : A5 41    " A"    bita  $41,x
        ;
E48C        LE48C:
E48C : 02    " "    db  $02
        ;
E48D : D8 E3    "  "    eorb  X00E3
        ;
E48F : FD    " "    db  $FD
        ;
E490 : F7 CD 01    "   "    stab  XCD01
E493 : 80 80    "  "    suba  #$80
E495 : E0 EA    "  "    subb  $EA,x
E497 : FB FB 6A    "  j"    addb  XFB6A
E49A : B4 C7 F3    "   "    anda  XC7F3
        ;
E49D : C7    " "    db  $C7
        ;
E49E : 81 03    "  "    cmpa  #$03
E4A0 : 80 83    "  "    suba  #$83
        ;
E4A2 : C3    " "    db  $C3
        ;
E4A3 : E7 E3    "  "    stab  $E3,x
E4A5 : 84 02    "  "    anda  #$02
E4A7 : E8 F1    "  "    eorb  $F1,x
E4A9 : F9 F9 F1    "   "    adcb  XF9F1
E4AC : A0 E0    "  "    suba  $E0,x
E4AE : E2 E7    "  "    sbcb  $E7,x
E4B0 : E7 83    "  "    stab  $83,x
        ;
E4B2 : 00 00 87    "   "    db  $00, $00, $87
        ;
E4B5 : DF EF    "  "    stx  X00EF
        ;
E4B7 : 8F 03 00 14  "    "    db  $8F, $03, $00, $14
        ;
E4BB : 9C 3C    " <"    cpx  X003C
        ;
E4BD : 1C 51    " Q"    db  $1C, $51
        ;
E4BF : E8 CF    "  "    eorb  $CF,x
E4C1 : FF FF AF    "   "    stx  XFFAF
E4C4 : 01    " "    nop
E4C5 : 40    "@"    nega
E4C6 : 60 70    "`p"    neg  $70,x
E4C8 : B9 4D 03    " M "    adca  X4D03
E4CB : C5 E3    "  "    bitb  #$E3
E4CD : E7 E7    "  "    stab  $E7,x
E4CF : 81 00    "  "    cmpa  #$00
E4D1 : 40    "@"    nega
E4D2 : F9 FF FF    "   "    adcb  XFFFF
E4D5 : 97 02    "  "    staa  X0002
E4D7 : 78 F8 78    "x x"    asl  XF878
E4DA : 9E 18    "  "    lds  X0018
        ;
E4DC : 00    " "    db  $00
        ;
E4DD : 29 6B    ")k"    bvs  LE54A
E4DF : 5D    "]"    tstb
E4E0 : 08    " "    inx
        ;
E4E1 : 00    " "    db  $00
        ;
E4E2 : D8 DF    "  "    eorb  X00DF
E4E4        LE4E4:
E4E4 : FF FF AF    "   "    stx  XFFAF
        ;
E4E7 : 02    " "    db  $02
        ;
E4E8 : 08    " "    inx
        ;
E4E9 : 61    "a"    db  $61
        ;
E4EA : D5 39    " 9"    bitb  X0039
E4EC : 89 00    "  "    adca  #$00
E4EE : F4 79 6F    " yo"    andb  X796F
E4F1 : 2C 00    ", "    bge  LE4F3
        ;
E4F3        LE4F3:
E4F3 : 18    " "    db  $18
        ;
E4F4 : FE FF FF    "   "    ldx  XFFFF
E4F7 : 2B 00    "+ "    bmi  LE4F9
        ;
E4F9        LE4F9:
E4F9 : 00    " "    db  $00
        ;
E4FA : 3E    ">"    wai
E4FB : 7F 1F 07    "   "    clr  X1F07
        ;
E4FE : 00 00    "  "    db  $00, $00
        ;
E500 : E5 FB    "  "    bitb  $FB,x
E502 : 5F    "_"    clrb
        ;
E503 : 9D    " "    db  $9D
        ;
E504 : 86 EA    "  "    ldaa  #$EA
E506 : FF 7F 01    "   "    stx  X7F01
E509 : 01    " "    nop
E50A : 20 4A    " J"    bra  LE556
        ;
E50C : 7B    "{"    db  $7B
        ;
E50D : 95 01    "  "    bita  X0001
E50F : C0 E8    "  "    subb  #$E8
E511 : FF FF 7F    "   "    stx  XFF7F
        ;
E514 : 41    "A"    db  $41
        ;
E515 : 01    " "    nop
E516 : E0 AA    "  "    subb  $AA,x
E518 : 5F    "_"    clrb
        ;
E519 : 83 02 00    "   "    db  $83, $02, $00
        ;
E51C : F4 FF DF    "   "    andb  XFFDF
        ;
E51F : 1F    " "    db  $1F
        ;
E520 : A5 00    "  "    bita  $00,x
E522 : 6D AB    "m "    tst  $AB,x
E524 : 5F    "_"    clrb
E525 : 81 02    "  "    cmpa  #$02
        ;
E527 : 00    " "    db  $00
        ;
E528 : F2 EF FF    "   "    sbcb  XEFFF
        ;
E52B : 45    "E"    db  $45
        ;
E52C : 47    "G"    asra
E52D : A1 AF    "  "    cmpa  $AF,x
        ;
E52F : 75    "u"    db  $75
        ;
E530 : 0F    " "    sei
        ;
E531 : 04    " "    db  $04
        ;
E532 : 0C    " "    clc
        ;
E533 : 00    " "    db  $00
        ;
E534 : 5F    "_"    clrb
        ;
E535 : FD 1F EC    "   "    db  $FD, $1F, $EC
        ;
E538 : 2A AA    "* "    bpl  LE4E4
E53A : AA B7    "  "    oraa  $B7,x
E53C : 50    "P"    negb
E53D : 5D    "]"    tstb
E53E : 85 6A    " j"    bita  #$6A
        ;
E540 : 55 15    "U "    db  $55, $15
        ;
E542 : D5 45    " E"    bitb  X0045
E544 : D5 AB    "  "    bitb  X00AB
E546 : A8 AA    "  "    eora  $AA,x
E548 : A5 95    "  "    bita  $95,x
E54A        LE54A:
E54A : A0 BE    "  "    suba  $BE,x
        ;
E54C : 15 55 55 75  " UUu"    db  $15, $55, $55, $75
E550 : 55    "U"    db  $55
        ;
E551 : 48    "H"    asla
        ;
E552 : ED 4B    " K"    db  $ED, $4B
        ;
E554 : A8 75    " u"    eora  $75,x
E556        LE556:
E556 : 4A    "J"    deca
E557 : BD A6 1C    "   "    jsr  LA61C
E55A : C4 FE    "  "    andb  #$FE
        ;
E55C : 02    " "    db  $02
        ;
E55D : BA 15 EA    "   "    oraa  X15EA
E560 : 2D A9    "- "    blt  LE50B
E562 : 54    "T"    lsrb
E563 : B5 2B A4    " + "    bita  X2BA4
E566 : 5D    "]"    tstb
E567 : 54    "T"    lsrb
E568 : 6F 65    "oe"    clr  $65,x
E56A : 11    " "    cba
E56B : B4 17 D2    "   "    anda  X17D2
        ;
E56E : 13    " "    db  $13
        ;
E56F : E8 5B    " ["    eorb  $5B,x
E571 : 58    "X"    aslb
E572 : 2E 97    ". "    bgt  LE50B
E574 : 43    "C"    coma
E575 : EF 53    " S"    stx  $53,x
E577 : 50    "P"    negb
E578 : 3B    ";"    rti
        ;
E579 : DE FF    "  "    ldx  X00FF
        ;
E57B : 45    "E"    db  $45
        ;
E57C : 20 12    "  "    bra  LE590
        ;
E57E : 48    "H"    asla
E57F : 56    "V"    rorb
E580 : 92 A8    "  "    sbca  X00A8
E582 : DA 76    " v"    orab  X0076
E584 : AD AE    "  "    jsr  $AE,x            ;INFO: index jump
        ;
E586 : ED    " "    db  $ED
        ;
E587 : B7 AE B5    "   "    staa  XAEB5
E58A : 84 BE    "  "    anda  #$BE
E58C : FF 7F 90    "   "    stx  X7F90
E58F : 08    " "    inx
        ;
E590        LE590:
E590 : 00    " "    db  $00
        ;
E591 : AA 88    "  "    oraa  $88,x
E593 : 5A    "Z"    decb
E594 : 11    " "    cba
E595 : BB D7 76    "  v"    adda  XD776
        ;
E598 : 55 ED    "U "    db  $55, $ED
        ;
E59A : 7D AB 54    "} T"    tst  XAB54
E59D : FF 7F 00    "   "    stx  X7F00
E5A0 : 09    " "    dex
        ;
E5A1 : 00    " "    db  $00
        ;
E5A2 : 5A    "Z"    decb
        ;
E5A3 : 4B 02 51    "K Q"    db  $4B, $02, $51
        ;
E5A6        LE5A6:
E5A6 : 77 6B BB    "wk "    asr  X6BBB
E5A9 : 96 EA    "  "    ldaa  X00EA
E5AB : 5F    "_"    clrb
E5AC : FB FF 0F    "   "    addb  XFF0F
        ;
E5AF : 00 00    "  "    db  $00, $00
        ;
E5B1 : F4 AD 10    "   "    andb  XAD10
        ;
E5B4 : 02    " "    db  $02
        ;
E5B5 : C9 FF    "  "    adcb  #$FF
E5B7 : AA 54    " T"    oraa  $54,x
E5B9 : 95 D4    "  "    bita  X00D4
E5BB : FF 7F 00    "   "    stx  X7F00
        ;
E5BE : 00 00    "  "    db  $00, $00
        ;
E5C0 : FE 07 00    "   "    ldx  X0700
        ;
E5C3 : 21    "!"    db  $21
        ;
E5C4 : D4 7D    " }"    andb  X007D
E5C6 : 25 11    "% "    bcs  LE5D9
E5C8 : D1 FF    "  "    cmpb  X00FF
E5CA : 7F 00 00    "   "    clr  X0000
E5CD : 80 FE    "  "    suba  #$FE
        ;
E5CF : 1F 00 12    "   "    db  $1F, $00, $12
        ;
E5D2 : D2 FE    "  "    sbcb  X00FE
        ;
E5D4 : 15    " "    db  $15
        ;
E5D5 : A1 FE    "  "    cmpa  $FE,x
E5D7 : FF 81 08    "   "    stx  X8108
        ;
E5DA : 00 FC    "  "    db  $00, $FC
        ;
E5DC : 7F 01 88    "   "    clr  X0188
E5DF : 90 FA    "  "    suba  X00FA
E5E1 : 2E 49    ".I"    bgt  LE62C
E5E3 : FF FF 03    "   "    stx  XFF03
E5E6 : 90 00    "  "    suba  X0000
E5E8 : F8 FF 03    "   "    eorb  XFF03
E5EB : 40    "@"    nega
E5EC : A2 54    " T"    sbca  $54,x
E5EE : B7 8A FF    "   "    staa  X8AFF
E5F1 : FF 01 20    "   "    stx  X0120
        ;
E5F4 : 21 EC    "! "    db  $21, $EC
        ;
E5F6 : FF 07 00    "   "    stx  X0700
E5F9 : 98 D6    "  "    eora  X00D6
E5FB : AE AB    "  "    lds  $AB,x
E5FD : FF 7F 00    "   "    stx  X7F00
E600 : 24 08    "$ "    bcc  LE60A
E602 : EA FF    "  "    orab  $FF,x
        ;
E604 : 02 00    "  "    db  $02, $00
        ;
E606 : 8A 55    " U"    oraa  #$55
        ;
E608 : D3    " "    db  $D3
        ;
E609 : FA FF 07    "   "    orab  XFF07
E60C : 90 A6    "  "    suba  X00A6
E60E : F1 FF 7F    "   "    cmpb  XFF7F
        ;
E611 : 04    " "    db  $04
        ;
E612 : 40    "@"    nega
E613 : 20 91    "  "    bra  LE5A6
        ;
E615 : D0 FF    "  "    subb  X00FF
E617 : 3F    "?"    swi
        ;
E618 : 00    " "    db  $00
        ;
E619 : 48    "H"    asla
        ;
E61A : 04    " "    db  $04
        ;
E61B : F9 FF 2F    "  /"    adcb  XFF2F
E61E : 69 AD    "i "    rol  $AD,x
E620 : 6A 55    "jU"    dec  $55,x
E622 : FF 7F 01    "   "    stx  X7F01
        ;
E625        LE625:
E625 : 00    " "    db  $00
        ;
E626 : 20 A8    "  "    bra  LE5D0
        ;
E628 : FF 16 01    "   "    stx  X1601
E62B : 80 B6    "  "    suba  #$B6
E62D : BB FF FF    "   "    adda  XFFFF
E630 : 2F 28    "/("    ble  LE65A
        ;
E632 : 45    "E"    db  $45
        ;
E633 : 10    " "    sba
        ;
E634 : FD    " "    db  $FD
        ;
E635 : 2B 01    "+ "    bmi  LE638
        ;
E637 : 04    " "    db  $04
        ;
E638        LE638:
E638 : 08    " "    inx
E639 : 80 FA    "  "    suba  #$FA
E63B : FF FF 56    "  V"    stx  XFF56
E63E : 82 68    " h"    sbca  #$68
E640 : FF DF 12    "   "    stx  XDF12
E643 : 80 20    "  "    suba  #$20
        ;
E645 : 52 52    "RR"    db  $52, $52
        ;
E647 : AA AB    "  "    oraa  $AB,x
E649 : 6A FF    "j "    dec  $FF,x
E64B : AF D4    "  "    sts  $D4,x
E64D : FF B7 AA    "   "    stx  XB7AA
E650 : 10    " "    sba
        ;
E651 : 00    " "    db  $00
        ;
E652 : AA 66    " f"    oraa  $66,x
        ;
E654 : 38    "8"    db  $38
        ;
E655 : 63 5C    "c\"    com  $5C,x
        ;
E657 : 75    "u"    db  $75
        ;
E658 : 66 1C    "f "    ror  $1C,x
        ;
E65A        LE65A:
E65A : 55    "U"    db  $55
        ;
E65B : 0C    " "    clc
E65C : 2B C7    "+ "    bmi  LE625
        ;
E65E : 1C    " "    db  $1C
        ;
E65F : AD F2    "  "    jsr  $F2,x            ;INFO: index jump
E661 : 4A    "J"    deca
E662 : 99 71    " q"    adca  X0071
E664 : 7A CD 8A    "z  "    dec  XCD8A
        ;
E667 : 6B DC    "k "    db  $6B, $DC
        ;
E669 : 6C C7    "l "    inc  $C7,x
E66B : 53    "S"    comb
        ;
E66C : 6B    "k"    db  $6B
        ;
E66D : EA A2    "  "    orab  $A2,x
        ;
E66F : 51    "Q"    db  $51
        ;
E670 : CB 3C    " <"    addb  #$3C
E672 : C6 04    "  "    ldab  #$04
E674 : 85 11    "  "    bita  #$11
E676 : 26 4C    "&L"    bne  LE6C4
        ;
E678 : 3A    ":"    db  $3A
        ;
E679 : 9E B2    "  "    lds  X00B2
E67B : D2 9C    "  "    sbcb  X009C
E67D : 97 B6    "  "    staa  X00B6
E67F : 7C 65 4D    "|eM"    inc  X654D
        ;
E682 : 8F    " "    db  $8F
        ;
E683 : F7 78 F9    " x "    stab  X78F9
        ;
E686 : CF 83 41    "  A"    db  $CF, $83, $41
        ;
E689 : C5 62    " b"    bitb  #$62
        ;
E68B : 45 83    "E "    db  $45, $83
        ;
E68D : 0B    " "    sev
E68E : 0B    " "    sev
E68F : 85 AA    "  "    bita  #$AA
E691 : 0A    " "    clv
        ;
E692 : 55    "U"    db  $55
        ;
E693 : A7 5A    " Z"    staa  $5A,x
E695 : 7A 77 FD    "zw "    dec  X77FD
E698 : FF C7 80    "   "    stx  XC780
E69B : E0 E5    "  "    subb  $E5,x
E69D : C5 05    "  "    bitb  #$05
        ;
E69F : 45 55 E3    "EU "    db  $45, $55, $E3
        ;
E6A2 : E1 E0    "  "    cmpb  $E0,x
E6A4 : 54    "T"    lsrb
        ;
E6A5 : 55    "U"    db  $55
        ;
E6A6 : AB 54    " T"    adda  $54,x
        ;
E6A8 : FD    " "    db  $FD
        ;
E6A9 : FF 87 01    "   "    stx  X8701
E6AC : 80 A7    "  "    suba  #$A7
        ;
E6AE : 8F 03    "  "    db  $8F, $03
        ;
E6B0 : 85 CB    "  "    bita  #$CB
E6B2 : A7 8B    "  "    staa  $8B,x
        ;
E6B4 : 45 51    "EQ"    db  $45, $51
        ;
E6B6 : F5 BD FE    "   "    bitb  XBDFE
E6B9 : E7 C3    "  "    stab  $C3,x
E6BB : 80 E0    "  "    suba  #$E0
        ;
E6BD : E3 C3 03    "   "    db  $E3, $C3, $03
        ;
E6C0        LE6C0:
E6C0 : C1 C5    "  "    cmpb  #$C5
        ;
E6C2 : E3 52 41    " RA"    db  $E3, $52, $41
        ;
E6C5 : D0 F8    "  "    subb  X00F8
        ;
E6C7 : FD    " "    db  $FD
        ;
E6C8 : 7D 30 20    "}0 "    tst  X3020
E6CB : F8 F8 79    "  y"    eorb  XF879
E6CE : 20 F0    "  "    bra  LE6C0
        ;
E6D0 : F8 78 38    " x8"    eorb  X7838
E6D3 : 28 DC    "( "    bvc  LE6B1
E6D5 : FB FB 71    "  q"    addb  XFB71
        ;
E6D8 : 00    " "    db  $00
        ;
E6D9 : F0 F9 F3    "   "    subb  XF9F3
E6DC : 40    "@"    nega
E6DD : 60 F8    "` "    neg  $F8,x
E6DF : 78 22 82    "x" "    asl  X2282
E6E2 : D6 DF    "  "    ldab  X00DF
        ;
E6E4 : CF 03    "  "    db  $CF, $03
        ;
E6E6 : 80 C5    "  "    suba  #$C5
E6E8 : DF 87    "  "    stx  X0087
        ;
E6EA : 03    " "    db  $03
        ;
E6EB : 82 E7    "  "    sbca  #$E7
        ;
E6ED : 45    "E"    db  $45
        ;
E6EE : 43    "C"    coma
        ;
E6EF : FC    " "    db  $FC
        ;
E6F0 : F7 FB 01    "   "    stab  XFB01
        ;
E6F3 : 61    "a"    db  $61
        ;
E6F4 : F2 FB 69    "  i"    sbcb  XFB69
        ;
E6F7        LE6F7:
E6F7 : 00 41    " A"    db  $00, $41
        ;
E6F9 : E5 54    " T"    bitb  $54,x
E6FB : 10    " "    sba
E6FC : FF 7C 3D    " |="    stx  X7C3D
        ;
E6FF : 00    " "    db  $00
        ;
E700 : 8C FC 7C    "  |"    cpx  #$FC7C
        ;
E703 : 18    " "    db  $18
        ;
E704 : A0 F0    "  "    suba  $F0,x
E706 : 79 D5 F2    "y  "    rol  XD5F2
E709 : E7 F7    "  "    stab  $F7,x
        ;
E70B : 41    "A"    db  $41
        ;
E70C : C0 E2    "  "    subb  #$E2
        ;
E70E : D3 C7    "  "    db  $D3, $C7
        ;
E710 : 01    " "    nop
E711 : 81 4A    " J"    cmpa  #$4A
E713 : 85 A2    "  "    bita  #$A2
        ;
E715 : 8F 87 C7 83  "    "    db  $8F, $87, $C7, $83
E719 : CF    " "    db  $CF
        ;
E71A : DF 8F    "  "    stx  X008F
E71C : 07    " "    tpa
E71D : 0E    " "    cli
E71E : 86 06    "  "    ldaa  #$06
E720 : EB CF    "  "    addb  $CF,x
        ;
E722 : E3    " "    db  $E3
        ;
E723 : 01    " "    nop
        ;
E724 : 42    "B"    db  $42
        ;
E725 : C5 83    "  "    bitb  #$83
E727 : 07    " "    tpa
        ;
E728 : 83 C7 8F 87  "    "    db  $83, $C7, $8F, $87
        ;
E72C : FF F9 7C    "  |"    stx  XF97C
E72F : 08    " "    inx
E730 : 58    "X"    aslb
        ;
E731 : FC    " "    db  $FC
        ;
E732 : F8 70 20    " p "    eorb  X7020
E735 : 20 C0    "  "    bra  LE6F7
        ;
E737 : E0 CF    "  "    subb  $CF,x
E739 : EF 87    "  "    stx  $87,x
E73B : 81 8F    "  "    cmpa  #$8F
E73D : DF 0F    "  "    stx  X000F
E73F : 07    " "    tpa
E740 : 06    " "    tap
E741 : 86 4B    " K"    ldaa  #$4B
E743 : 7F 1C 18    "   "    clr  X1C18
E746 : 20 FC    "  "    bra  LE744
        ;
E748        LE748:
E748 : FC    " "    db  $FC
        ;
E749 : FA 70 F0    " p "    orab  X70F0
E74C : F0 F0 F0    "   "    subb  XF0F0
E74F : F1 F1 C0    "   "    cmpb  XF1C0
E752 : C0 C1    "  "    subb  #$C1
E754 : E0 F1    "  "    subb  $F1,x
E756 : E2 C3    "  "    sbcb  $C3,x
        ;
E758 : 41    "A"    db  $41
        ;
E759 : E9 EF    "  "    adcb  $EF,x
E75B : F7 01 84    "   "    stab  X0184
        ;
E75E : CF    " "    db  $CF
        ;
E75F : 9F 05    "  "    sts  X0005
        ;
E761 : 00    " "    db  $00
        ;
E762 : 84 DB    "  "    anda  #$DB
E764 : B7 9F 0F    "   "    staa  X9F0F
E767 : 07    " "    tpa
        ;
E768 : 1D    " "    db  $1D
        ;
E769 : 3F    "?"    swi
E76A : 3F    "?"    swi
        ;
E76B : 5B    "["    db  $5B
        ;
E76C : 70 00 00    "p  "    neg  X0000
E76F : E0 FF    "  "    subb  $FF,x
E771 : 9F 83    "  "    sts  X0083
E773 : 60 7C    "`|"    neg  $7C,x
        ;
E775 : FD    " "    db  $FD
        ;
E776 : EB E0    "  "    addb  $E0,x
E778 : D0 82    "  "    subb  X0082
E77A : 20 78    " x"    bra  LE7F4
        ;
E77C : 78 7E E8    "x~ "    asl  X7EE8
E77F : F0 E8 CE    "   "    subb  XE8CE
E782 : E7 52    " R"    stab  $52,x
        ;
E784 : 1C    " "    db  $1C
        ;
E785 : 2E C1    ". "    bgt  LE748
        ;
E787 : C3    " "    db  $C3
        ;
E788 : 80 83    "  "    suba  #$83
E78A : E7 A7    "  "    stab  $A7,x
        ;
E78C : 87    " "    db  $87
        ;
E78D : 8E C7 AB    "   "    lds  #$C7AB
E790 : 96 CF    "  "    ldaa  X00CF
E792 : 0F    " "    sei
E793 : 0E    " "    cli
        ;
E794 : 00    " "    db  $00
        ;
E795 : 86 CF    "  "    ldaa  #$CF
        ;
E797 : 8F    " "    db  $8F
        ;
E798 : 0F    " "    sei
E799 : 0E    " "    cli
E79A : 3E    ">"    wai
E79B : 7E 1F 7D    "~ }"    jmp  L1F7D
        ;
E79E : 01    " "    nop
E79F : 06    " "    tap
E7A0 : 84 F3    "  "    anda  #$F3
E7A2 : E7 06    "  "    stab  $06,x
E7A4 : 07    " "    tpa
        ;
E7A5 : 8F    " "    db  $8F
        ;
E7A6 : 9F 5F    " _"    sts  X005F
E7A8 : 9F 0E    "  "    sts  X000E
E7AA : C0 00    "  "    subb  #$00
E7AC : F0 FE E9    "   "    subb  XFEE9
E7AF : C1 C1    "  "    cmpb  #$C1
        ;
E7B1 : E3    " "    db  $E3
        ;
E7B2 : EB EB    "  "    addb  $EB,x
E7B4 : E9 02    "  "    adcb  $02,x
E7B6 : 0C    " "    clc
        ;
E7B7 : 00 CF    "  "    db  $00, $CF
        ;
E7B9 : 9F 1E    "  "    sts  X001E
        ;
E7BB : 1C 3C    " <"    db  $1C, $3C
        ;
E7BD : 7E 3F 1F    "~? "    jmp  L3F1F
        ;
E7C0 : 1D    " "    db  $1D
        ;
E7C1 : 60 20    "` "    neg  $20,x
E7C3 : 78 FD F0    "x  "    asl  XFDF0
E7C6 : E0 E0    "  "    subb  $E0,x
E7C8 : F1 F3 F7    "   "    cmpb  XF3F7
E7CB : E9 80    "  "    adcb  $80,x
E7CD : 01    " "    nop
E7CE : C1 EB    "  "    cmpb  #$EB
        ;
E7D0 : 87    " "    db  $87
        ;
E7D1 : 07    " "    tpa
E7D2 : 07    " "    tpa
E7D3 : 9F 1F    "  "    sts  X001F
E7D5 : 3F    "?"    swi
E7D6 : 5F    "_"    clrb
E7D7 : 0A    " "    clv
        ;
E7D8 : 04 04    "  "    db  $04, $04
        ;
E7DA : 7F 3F 1E    " ? "    clr  X3F1E
        ;
E7DD : 14    " "    db  $14
        ;
E7DE : 7C FC FC    "|  "    inc  XFCFC
E7E1 : F5 28 08    " ( "    bitb  X2808
        ;
E7E4 : 00    " "    db  $00
        ;
E7E5 : FE F9 78    "  x"    ldx  XF978
E7E8 : 30    "0"    tsx
E7E9 : F1 F1 FB    "   "    cmpb  XF1FB
E7EC : AB 43    " C"    adda  $43,x
E7EE : 20 00    "  "    bra  LE7F0
        ;
E7F0        LE7F0:
E7F0 : FC F3 71    "  q"    db  $FC, $F3, $71
        ;
E7F3 : 50    "P"    negb
        ;
E7F4        LE7F4:
E7F4 : C3 E3    "  "    db  $C3, $E3
        ;
E7F6 : EF 9F    "  "    stx  $9F,x
E7F8 : 2F C0    "/ "    ble  LE7BA
        ;
E7FA : 00    " "    db  $00
        ;
E7FB : D8 C7    "  "    eorb  X00C7
        ;
E7FD : C7 02 1E    "   "    db  $C7, $02, $1E
        ;
E800 : 5F    "_"    clrb
E801 : 7F 7D D9    " } "    clr  X7DD9
        ;
E804 : 00    " "    db  $00
        ;
E805 : 01    " "    nop
E806 : 54    "T"    lsrb
E807        XE807:
E807 : 3F    "?"    swi
E808 : BF B0 60    "  `"    sts  XB060
E80B : B8 DE 7F    "   "    eora  XDE7F
E80E : 37    "7"    pshb
E80F : 0A    " "    clv
        ;
E810 : 00    " "    db  $00
        ;
E811 : C0 F1    "  "    subb  #$F1
E813 : AA C9    "  "    oraa  $C9,x
E815 : BE F5 6F    "  o"    lds  XF56F
E818 : 80 04    "  "    suba  #$04
E81A : 80 92    "  "    suba  #$92
E81C : FA DB DE    "   "    orab  XDBDE
        ;
E81F : 21 7B    "!{"    db  $21, $7B
        ;
E821 : C1 FF    "  "    cmpb  #$FF
E823 : D6 1D    "  "    ldab  X001D
        ;
E825 : 00 05    "  "    db  $00, $05
        ;
E827 : 80 2D    " -"    suba  #$2D
E829 : F9 AF F4    "   "    adcb  XAFF4
E82C        LE82C:
E82C : 09    " "    dex
E82D : EA 07    "  "    orab  $07,x
E82F : FF A7 97    "   "    stx  XA797
        ;
E832 : 00    " "    db  $00
        ;
E833 : 0C    " "    clc
E834 : 40    "@"    nega
E835 : 2B F5    "+ "    bmi  LE82C
        ;
E837 : 1F    " "    db  $1F
        ;
E838 : BD 82 AA    "   "    jsr  L82AA
E83B : 2F FF    "/ "    ble  LE83C
E83D : D7 0D    "  "    stab  X000D
        ;
E83F : 00    " "    db  $00
        ;
E840 : 0A    " "    clv
E841 : A0 B2    "  "    suba  $B2,x
E843 : EB AF    "  "    addb  $AF,x
E845 : 92 0A    "  "    sbca  X000A
E847 : E8 3F    " ?"    eorb  $3F,x
E849 : FF E7 0A    "   "    stx  XE70A
E84C : 80 00    "  "    suba  #$00
E84E : 0B    " "    sev
        ;
E84F : FD    " "    db  $FD
        ;
E850 : 89 3E    " >"    adca  #$3E
E852 : 60 03    "` "    neg  $03,x
E854 : FE D7 7F    "   "    ldx  XD77F
        ;
E857 : 5E 00    "^ "    db  $5E, $00
        ;
E859 : 0E    " "    cli
E85A : F0 51 1F    " Q "    subb  X511F
        ;
E85D : 38    "8"    db  $38
        ;
E85E : 40    "@"    nega
E85F : 23 F4    "# "    bls  LE855
E861 : 7F FF 4F    "  O"    clr  XFF4F
        ;
E864 : 02    " "    db  $02
        ;
E865 : 30    "0"    tsx
E866 : F0 97 7F    "   "    subb  X977F
E869 : 20 00    "  "    bra  LE86B
        ;
E86B        LE86B:
E86B : 04    " "    db  $04
        ;
E86C : DA FE    "  "    orab  X00FE
E86E : FF 1F 0E    "   "    stx  X1F0E
E871 : 50    "P"    negb
E872 : B0 3F 7F    " ? "    suba  X3F7F
E875 : A4 00    "  "    anda  $00,x
        ;
E877 : 04    " "    db  $04
        ;
E878 : 80 FE    "  "    suba  #$FE
E87A : FE 9F 0E    "   "    ldx  X9F0E
        ;
E87D : 18    " "    db  $18
        ;
E87E : D8 A7    "  "    eorb  X00A7
E880 : BF 5C A0    " \ "    sts  X5CA0
        ;
E883 : 00 04    "  "    db  $00, $04
        ;
E885 : 3E    ">"    wai
E886 : FE E3 83    "   "    ldx  XE383
        ;
E889 : 83    " "    db  $83
        ;
E88A : FB F4 55    "  U"    addb  XF455
E88D : 0A    " "    clv
E88E : 0E    " "    cli
E88F : 4A    "J"    deca
E890 : C1 C7    "  "    cmpb  #$C7
        ;
E892 : 8F    " "    db  $8F
        ;
E893 : 10    " "    sba
E894 : 60 F0    "` "    neg  $F0,x
E896 : FF BF 07    "   "    stx  XBF07
E899 : 90 50    " P"    suba  X0050
E89B : A8 FE    "  "    eora  $FE,x
E89D : FE 18 01    "   "    ldx  X1801
        ;
E8A0 : 00    " "    db  $00
        ;
E8A1 : D5 FD    "  "    bitb  X00FD
E8A3 : 7F 5C 14    " \ "    clr  X5C14
E8A6 : 82 A1    "  "    sbca  #$A1
E8A8 : EF BF    "  "    stx  $BF,x
E8AA : 33    "3"    pulb
        ;
E8AB : 00 38    " 8"    db  $00, $38
        ;
E8AD : A0 D7    "  "    suba  $D7,x
E8AF : C1 47    " G"    cmpb  #$47
E8B1 : B9 06 7E    "  ~"    adca  X067E
E8B4 : FE BC C0    "   "    ldx  XBCC0
E8B7 : E0 E1    "  "    subb  $E1,x
E8B9 : 7A 01 06    "z  "    dec  X0106
E8BC : 80 6D    " m"    suba  #$6D
        ;
E8BE : FC    " "    db  $FC
        ;
E8BF : F7 EF 01    "   "    stab  XEF01
        ;
E8C2 : 02 8F    "  "    db  $02, $8F
        ;
E8C4 : FF 1F 38    "  8"    stx  X1F38
        ;
E8C7 : 00 00    "  "    db  $00, $00
        ;
E8C9 : EA 9F    "  "    orab  $9F,x
E8CB : FF 8F 00    "   "    stx  X8F00
        ;
E8CE        XE8CE:
E8CE : 18 FC    "  "    db  $18, $FC
        ;
E8D0 : FE BF 02    "   "    ldx  XBF02
        ;
E8D3 : 02 00    "  "    db  $02, $00
        ;
E8D5 : F4 FB FD    "   "    andb  XFBFD
E8D8 : A9 02    "  "    adca  $02,x
E8DA : A0 E1    "  "    suba  $E1,x
E8DC : FF BF 0A    "   "    stx  XBF0A
        ;
E8DF : 00 00 3A    "  :"    db  $00, $00, $3A
        ;
E8E2 : FF BF 0B    "   "    stx  XBF0B
        ;
E8E5 : 18    " "    db  $18
        ;
E8E6 : 30    "0"    tsx
E8E7 : FA FE 7E    "  ~"    orab  XFE7E
        ;
E8EA : 55 00 00    "U  "    db  $55, $00, $00
        ;
E8ED : CA FF    "  "    orab  #$FF
E8EF : E7 07    "  "    stab  $07,x
        ;
E8F1 : 02    " "    db  $02
        ;
E8F2 : 84 D7    "  "    anda  #$D7
E8F4 : 7F BF 15    "   "    clr  XBF15
        ;
E8F7 : 00 00    "  "    db  $00, $00
        ;
E8F9 : F1 FD FB    "   "    cmpb  XFDFB
        ;
E8FC : 03    " "    db  $03
        ;
E8FD : 01    " "    nop
E8FE : C2 E9    "  "    sbcb  #$E9
E900 : FF EF 06    "   "    stx  XEF06
        ;
E903 : 00    " "    db  $00
        ;
E904 : 80 F1    "  "    suba  #$F1
E906 : FF 7B C1    " { "    stx  X7BC1
        ;
E909 : 00 61 FD FD  " a  "    db  $00, $61, $FD, $FD
        ;
E90D : F7 01 02    "   "    stab  X0102
E910 : 80 F1    "  "    suba  #$F1
E912 : FF 7B 02    " { "    stx  X7B02
E915        XE915:
E915 : 08    " "    inx
E916 : E1 F5    "  "    cmpb  $F5,x
E918 : F7 6F 60    " o`"    stab  X6F60
        ;
E91B : 00    " "    db  $00
        ;
E91C : C0 E7    "  "    subb  #$E7
E91E : FF 73 41    " sA"    stx  X7341
E921 : C0 E0    "  "    subb  #$E0
E923 : F5 FF 83    "   "    bitb  XFF83
        ;
E926 : 03 00    "  "    db  $03, $00
        ;
E928 : D2 DE    "  "    sbcb  X00DE
E92A : F7 C7 05    "   "    stab  XC705
        ;
E92D : 83 83    "  "    db  $83, $83
        ;
E92F : F7 5F 38    " _8"    stab  X5F38
        ;
E932 : 00    " "    db  $00
        ;
E933 : 88 C3    "  "    eora  #$C3
E935 : AF CF    "  "    sts  $CF,x
E937 : 0F    " "    sei
        ;
E938 : 1F 1C 1E    "   "    db  $1F, $1C, $1E
        ;
E93B : 5F    "_"    clrb
E93C : 85 01    "  "    bita  #$01
E93E : C1 1C    "  "    cmpb  #$1C
        ;
E940 : 1F 5E    " ^"    db  $1F, $5E
        ;
E942 : 78 F4 FC    "x  "    asl  XF4FC
E945        LE945:
E945 : F9 FC 30    "  0"    adcb  XFC30
        ;
E948 : 00 00    "  "    db  $00, $00
        ;
E94A : EE FD    "  "    ldx  $FD,x
E94C : F9 20 08    "   "    adcb  X2008
        ;
E94F : E3    " "    db  $E3
        ;
E950 : EF FF    "  "    stx  $FF,x
E952 : AF 80    "  "    sts  $80,x
        ;
E954 : 00    " "    db  $00
        ;
E955 : 40    "@"    nega
E956 : EE BF    "  "    ldx  $BF,x
        ;
E958 : CF 03    "  "    db  $CF, $03
        ;
E95A : 40    "@"    nega
E95B : F0 FC FF    "   "    subb  XFCFF
        ;
E95E : 1F 14 00    "   "    db  $1F, $14, $00
        ;
E961 : 10    " "    sba
        ;
E962 : FD    " "    db  $FD
        ;
E963 : FE 7D 28    " }("    ldx  X7D28
E966 : 10    " "    sba
E967 : A8 EB    "  "    eora  $EB,x
E969 : FF 0F 07    "   "    stx  X0F07
        ;
E96C : 00    " "    db  $00
        ;
E96D : 82 AF    "  "    sbca  #$AF
E96F : 7F 1F 07    "   "    clr  X1F07
        ;
E972 : 02    " "    db  $02
        ;
E973 : 4A    "J"    deca
E974 : DF FF    "  "    stx  X00FF
        ;
E976 : 87 03    "  "    db  $87, $03
        ;
E978 : 01    " "    nop
E979 : A0 E7    "  "    suba  $E7,x
E97B : FF CF 02    "   "    stx  XCF02
E97E : 01    " "    nop
E97F : A1 D7    "  "    cmpa  $D7,x
E981 : FF C7 81    "   "    stx  XC781
        ;
E984 : 00    " "    db  $00
        ;
E985 : C0 D3    "  "    subb  #$D3
E987 : FF EF 85    "   "    stx  XEF85
        ;
E98A : 00    " "    db  $00
        ;
E98B : A1 EB    "  "    cmpa  $EB,x
E98D : FF C3 83    "   "    stx  XC383
        ;
E990 : 00    " "    db  $00
        ;
E991 : 80 EB    "  "    suba  #$EB
E993 : EF EF    "  "    stx  $EF,x
E995 : 43    "C"    coma
E996 : 01    " "    nop
E997 : C1 E5    "  "    cmpb  #$E5
E999 : FF A7 83    "   "    stx  XA783
        ;
E99C : 00    " "    db  $00
        ;
E99D : 01    " "    nop
E99E : C5 DF    "  "    bitb  #$DF
E9A0 : DF C7    "  "    stx  X00C7
        ;
E9A2 : 00 83    "  "    db  $00, $83
        ;
E9A4 : C6 EF    "  "    ldab  #$EF
E9A6 : 9F 0E    "  "    sts  X000E
        ;
E9A8 : 03 00    "  "    db  $03, $00
        ;
E9AA : 8C BF FF    "   "    cpx  #$BFFF
        ;
E9AD : 8F 05 02 45  "   E"    db  $8F, $05, $02, $45
        ;
E9B1 : EF BF    "  "    stx  $BF,x
        ;
E9B3 : 3C    "<"    db  $3C
        ;
E9B4 : 0C    " "    clc
        ;
E9B5 : 00    " "    db  $00
        ;
E9B6 : 50    "P"    negb
E9B7 : 7E FF 7E    "~ ~"    jmp  LFF7E
        ;
E9BA : 0E    " "    cli
E9BB : 28 88    "( "    bvc  LE945
E9BD : BC FF E3    "   "    cpx  XFFE3
E9C0 : 31    "1"    ins
        ;
E9C1 : 00    " "    db  $00
        ;
E9C2 : 80 F4    "  "    suba  #$F4
E9C4 : F5 FF 73    "  s"    bitb  XFF73
        ;
E9C7 : 42    "B"    db  $42
        ;
E9C8 : 40    "@"    nega
E9C9 : E1 F6    "  "    cmpb  $F6,x
E9CB : 3F    "?"    swi
E9CC : 0F    " "    sei
        ;
E9CD : 03 00    "  "    db  $03, $00
        ;
E9CF : 48    "H"    asla
E9D0 : BE FF BF    "   "    lds  XFFBF
        ;
E9D3 : 55    "U"    db  $55
        ;
E9D4 : 08    " "    inx
E9D5 : 44    "D"    lsra
E9D6 : D6 DF    "  "    ldab  X00DF
        ;
E9D8 : E3 61    " a"    db  $E3, $61
        ;
E9DA : 40    "@"    nega
        ;
E9DB : 00    " "    db  $00
        ;
E9DC : 4A    "J"    deca
E9DD : EF EF    "  "    stx  $EF,x
E9DF : 77 2D 89    "w- "    asr  X2D89
E9E2 : 44    "D"    lsra
E9E3 : A5 DD    "  "    bita  $DD,x
E9E5 : D6 45    " E"    ldab  X0045
        ;
E9E7 : 04    " "    db  $04
        ;
E9E8 : 40    "@"    nega
E9E9 : A4 D6    "  "    anda  $D6,x
E9EB : EE 6E    " n"    ldx  $6E,x
        ;
E9ED : 6B    "k"    db  $6B
        ;
E9EE : D5 76    " v"    bitb  X0076
E9F0 : F7 AE 55    "  U"    stab  XAE55
        ;
E9F3 : 02    " "    db  $02
        ;
E9F4 : 01    " "    nop
E9F5 : 08    " "    inx
        ;
E9F6 : 51    "Q"    db  $51
        ;
E9F7 : AA 56    " V"    oraa  $56,x
        ;
E9F9 : 55    "U"    db  $55
        ;
E9FA : EB F7    "  "    addb  $F7,x
E9FC : FB BE 55    "  U"    addb  XBE55
        ;
E9FF : 45    "E"    db  $45
        ;
EA00 : 08    " "    inx
EA01 : 91 2A    " *"    cmpa  X002A
EA03 : AB 4A    " J"    adda  $4A,x
EA05 : 08    " "    inx
EA06 : 84 54    " T"    anda  #$54
        ;
EA08 : ED    " "    db  $ED
        ;
EA09 : FB F7 6E    "  n"    addb  XF76E
        ;
EA0C : 55    "U"    db  $55
        ;
EA0D : 95 52    " R"    bita  X0052
EA0F : 2A 25    "*%"    bpl  LEA36
EA11 : 11    " "    cba
EA12 : 22 49    ""I"    bhi  LEA5D
EA14 : A9 AA    "  "    adca  $AA,x
EA16 : 44    "D"    lsra
EA17 : 22 51    ""Q"    bhi  LEA6A
EA19 : 6A FF    "j "    dec  $FF,x
EA1B : DF BF    "  "    stx  X00BF
EA1D : AB 2A    " *"    adda  $2A,x
EA1F : A8 AA    "  "    eora  $AA,x
EA21 : B4 FB AB    "   "    anda  XFBAB
EA24 : 76 01 48    "v H"    ror  X0148
EA27 : 2B A9    "+ "    bmi  LE9D2
EA29 : BB 52 AB    " R "    adda  X52AB
EA2C : AA 25    " %"    oraa  $25,x
        ;
EA2E : FD    " "    db  $FD
        ;
EA2F : FF AF 2A    "  *"    stx  XAF2A
        ;
EA32 : 00 00    "  "    db  $00, $00
        ;
EA34 : A5 FA    "  "    bita  $FA,x
EA36        LEA36:
EA36 : 5F    "_"    clrb
        ;
EA37 : ED    " "    db  $ED
        ;
EA38 : 0A    " "    clv
        ;
EA39 : 00    " "    db  $00
        ;
EA3A : 5D    "]"    tstb
EA3B : A4 BD    "  "    anda  $BD,x
        ;
EA3D : 55    "U"    db  $55
        ;
EA3E : B5 92 D0    "   "    bita  X92D0
EA41 : FF 7F 6D    "  m"    stx  X7F6D
        ;
EA44 : 05 00    "  "    db  $05, $00
        ;
EA46 : 10    " "    sba
EA47 : 69 FF    "i "    rol  $FF,x
EA49 : DB 8D    "  "    addb  X008D
        ;
EA4B : 00    " "    db  $00
        ;
EA4C : 6C 82    "l "    inc  $82,x
EA4E : DE 55    " U"    ldx  X0055
EA50 : 6D 85    "m "    tst  $85,x
EA52 : FA FF D7    "   "    orab  XFFD7
EA55 : 2D 00    "- "    blt  LEA57
EA57        LEA57:
EA57 : 80 90    "  "    suba  #$90
EA59 : FA DF 56    "  V"    orab  XDF56
        ;
EA5C : 00    " "    db  $00
        ;
EA5D        LEA5D:
EA5D : D4 92    "  "    andb  X0092
EA5F : BA DF D2    "   "    oraa  XDFD2
EA62 : 96 FE    "  "    ldaa  X00FE
EA64 : FF E9 15    "   "    stx  XE915
        ;
EA67 : 00 00    "  "    db  $00, $00
        ;
EA69 : A2 FE    "  "    sbca  $FE,x
EA6B : 57    "W"    asrb
EA6C : 0A    " "    clv
EA6D : 81 94    "  "    cmpa  #$94
EA6F : 48    "H"    asla
EA70 : DF BD    "  "    stx  X00BD
        ;
EA72 : FD    " "    db  $FD
        ;
EA73 : FF 7F 6A    "  j"    stx  X7F6A
EA76 : 01    " "    nop
        ;
EA77 : 00    " "    db  $00
        ;
EA78 : 08    " "    inx
EA79 : EA FF    "  "    orab  $FF,x
EA7B : 92 04    "  "    sbca  X0004
EA7D : E8 15    "  "    eorb  $15,x
EA7F : E8 8A    "  "    eorb  $8A,x
EA81 : 54    "T"    lsrb
EA82 : FF 7F B5    "   "    stx  X7FB5
        ;
EA85 : 00    " "    db  $00
        ;
EA86 : 40    "@"    nega
EA87 : CB FF    "  "    addb  #$FF
EA89 : FF 14 00    "   "    stx  X1400
EA8C : 78 81 6A    "x j"    asl  X816A
EA8F : 50    "P"    negb
EA90 : FF 7F FE    "   "    stx  X7FFE
        ;
EA93 : 00    " "    db  $00
        ;
EA94 : 80 01    "  "    suba  #$01
EA96 : FE 2F 91    " / "    ldx  X2F91
        ;
EA99 : 00    " "    db  $00
        ;
EA9A : 78 55 BB    "xU "    asl  X55BB
EA9D : FA FF E3    "   "    orab  XFFE3
EAA0 : 01    " "    nop
        ;
EAA1 : 00 00    "  "    db  $00, $00
        ;
EAA3 : F8 57 92    " W "    eorb  X5792
        ;
EAA6 : 00    " "    db  $00
        ;
EAA7 : B0 28 08    " ( "    suba  X2808
EAAA : D0 FF    "  "    subb  X00FF
        ;
EAAC : 71    "q"    db  $71
        ;
EAAD : 01    " "    nop
EAAE : C0 07    "  "    subb  #$07
EAB0 : FF 5F 1D    " _ "    stx  X5F1D
EAB3 : 80 A4    "  "    suba  #$A4
        ;
EAB5 : 00    " "    db  $00
        ;
EAB6 : 01    " "    nop
EAB7 : FF 3F 2F    " ?/"    stx  X3F2F
        ;
EABA : 00    " "    db  $00
        ;
EABB : 7C F8 17    "|  "    inc  XF817
EABE : B0 00 4B    "  K"    suba  X004B
EAC1 : 91 4A    " J"    cmpa  X004A
EAC3 : FF 7F 16    "   "    stx  X7F16
        ;
EAC6 : 00    " "    db  $00
        ;
EAC7 : 78 E8 07    "x  "    asl  XE807
EACA : E0 A9    "  "    subb  $A9,x
EACC : 0A    " "    clv
        ;
EACD : 00 02 FC 1F  "    "    db  $00, $02, $FC, $1F
        ;
EAD1 : 40    "@"    nega
EAD2 : 80 FF    "  "    suba  #$FF
        ;
EAD4 : D3 03    "  "    db  $D3, $03
        ;
EAD6 : FE 87 02    "   "    ldx  X8702
EAD9 : A8 82    "  "    eora  $82,x
EADB : FF 07 38    "  8"    stx  X0738
EADE : F0 3F 00    " ? "    subb  X3F00
EAE1 : 81 FF    "  "    cmpa  #$FF
        ;
EAE3 : 00    " "    db  $00
        ;
EAE4 : D8 3F    " ?"    eorb  X003F
EAE6 : F4 7F 80    "   "    andb  X7F80
        ;
EAE9 : 83    " "    db  $83
        ;
EAEA : FF 01 68    "  h"    stx  X0168
EAED : F5 07 A0    "   "    bitb  X07A0
EAF0 : 3E    ">"    wai
        ;
EAF1 : 00    " "    db  $00
        ;
EAF2 : FE 03 BC    "   "    ldx  X03BC
EAF5 : F6 3F C0    " ? "    ldab  X3FC0
EAF8 : E7 1F    "  "    stab  $1F,x
        ;
EAFA : 00    " "    db  $00
        ;
EAFB : BF 02 F4    "   "    sts  X02F4
        ;
EAFE : 1F    " "    db  $1F
        ;
EAFF : C0 09    "  "    subb  #$09
EB01 : 7F 00 FE    "   "    clr  X00FE
EB04 : EF 01    "  "    stx  $01,x
EB06 : FE 02 E8    "   "    ldx  X02E8
EB09 : FF 00 77    "  w"    stx  X0077
EB0C : FE 01 E0    "   "    ldx  X01E0
EB0F : 0F    " "    sei
EB10 : 01    " "    nop
        ;
EB11 : FC    " "    db  $FC
        ;
EB12 : 0F    " "    sei
        ;
EB13 : 72    "r"    db  $72
        ;
EB14 : FF 03 EC    "   "    stx  X03EC
EB17 : FF 03 E0    "   "    stx  X03E0
EB1A : 7F 00 E0    "   "    clr  X00E0
EB1D : 07    " "    tpa
EB1E : E0 FF    "  "    subb  $FF,x
EB20 : 07    " "    tpa
EB21 : D8 6F    " o"    eorb  X006F
        ;
EB23 : 03    " "    db  $03
        ;
EB24 : F0 FF 00    "   "    subb  XFF00
EB27 : FA 07 00    "   "    orab  X0700
EB2A : FA 1F E0    "   "    orab  X1FE0
EB2D : FF 00 E0    "   "    stx  X00E0
EB30 : FF 01 F6    "   "    stx  X01F6
        ;
EB33 : 8F    " "    db  $8F
        ;
EB34 : A0 C0    "  "    suba  $C0,x
        ;
EB36 : 1F    " "    db  $1F
        ;
EB37 : C0 FF    "  "    subb  #$FF
EB39 : 30    "0"    tsx
EB3A : 81 FF    "  "    cmpa  #$FF
        ;
EB3C : 03 FC    "  "    db  $03, $FC
        ;
EB3E : 0F    " "    sei
EB3F : D0 DE    "  "    subb  X00DE
EB41 : 0F    " "    sei
        ;
EB42 : 00    " "    db  $00
        ;
EB43 : FE 47 80    " G "    ldx  X4780
EB46 : FF 23 F0    " # "    stx  X23F0
        ;
EB49 : 1F    " "    db  $1F
        ;
EB4A        LEB4A:
EB4A : C0 5B    " ["    subb  #$5B
EB4C : FF 01 F8    "   "    stx  X01F8
        ;
EB4F : 83    " "    db  $83
        ;
EB50 : 17    " "    tba
EB51 : F0 0F F8    "   "    subb  X0FF8
        ;
EB54 : 8F    " "    db  $8F
        ;
EB55 : 80 6F    " o"    suba  #$6F
EB57 : FA 0F 80    "   "    orab  X0F80
EB5A : 3F    "?"    swi
EB5B : F0 01 FF    "   "    subb  X01FF
EB5E : 80 FF    "  "    suba  #$FF
        ;
EB60 : 00 FD    "  "    db  $00, $FD
        ;
EB62 : 92 FF    "  "    sbca  X00FF
        ;
EB64 : 00 FC    "  "    db  $00, $FC
        ;
EB66 : 01    " "    nop
EB67 : 0F    " "    sei
EB68 : F0 0F F8    "   "    subb  X0FF8
EB6B : 07    " "    tpa
EB6C : F8 2B F8    " + "    eorb  X2BF8
        ;
EB6F : 1F    " "    db  $1F
        ;
EB70 : C0 3F    " ?"    subb  #$3F
EB72 : B0 01 FE    "   "    suba  X01FE
        ;
EB75 : 03    " "    db  $03
        ;
EB76 : 7E C1 AF    "~  "    jmp  LC1AF
EB79 : 20 FF    "  "    bra  LEB7A
        ;
EB7B : 03    " "    db  $03
        ;
EB7C : F0 07 1E    "   "    subb  X071E
EB7F : E0 7F    "  "    subb  $7F,x
EB81 : 80 9F    "  "    suba  #$9F
EB83 : 2E C5    ". "    bgt  LEB4A
EB85 : EA 3F    " ?"    orab  $3F,x
        ;
EB87 : 00    " "    db  $00
        ;
EB88 : FE 03 88    "   "    ldx  X0388
EB8B : FE 07 E0    "   "    ldx  X07E0
EB8E : 7F 80 7F    "   "    clr  X807F
EB91 : 09    " "    dex
EB92 : F8 03 FE    "   "    eorb  X03FE
EB95 : 01    " "    nop
EB96 : FE C2 13    "   "    ldx  XC213
EB99 : F8 1F F0    "   "    eorb  X1FF0
EB9C : 2F 00    "/ "    ble  LEB9E
EB9E        LEB9E:
EB9E : FE 03 F8    "   "    ldx  X03F8
EBA1 : EB 06    "  "    addb  $06,x
EBA3 : E0 7F    "  "    subb  $7F,x
EBA5 : 80 FF    "  "    suba  #$FF
EBA7 : 91 00    "  "    cmpa  X0000
        ;
EBA9 : FC    " "    db  $FC
        ;
EBAA : 79 06 F8    "y  "    rol  X06F8
        ;
EBAD : 1F    " "    db  $1F
        ;
EBAE : E0 FC    "  "    subb  $FC,x
EBB0 : 07    " "    tpa
EBB1 : E0 FF    "  "    subb  $FF,x
        ;
EBB3 : 00    " "    db  $00
        ;
EBB4 : F8 07 F0    "   "    eorb  X07F0
        ;
EBB7 : 1F    " "    db  $1F
        ;
EBB8 : F4 05 FB    "   "    andb  X05FB
EBBB : 01    " "    nop
EBBC : FE 03 0F    "   "    ldx  X030F
EBBF : E0 1F    "  "    subb  $1F,x
EBC1 : 80 EE    "  "    suba  #$EE
EBC3 : 7F 00 FF    "   "    clr  X00FF
EBC6 : 01    " "    nop
EBC7 : AA FF    "  "    oraa  $FF,x
EBC9 : 01    " "    nop
EBCA : E0 3F    " ?"    subb  $3F,x
EBCC : 80 3F    " ?"    suba  #$3F
EBCE : B9 1E C0    "   "    adca  X1EC0
EBD1 : FF 80 3F    "  ?"    stx  X803F
EBD4 : F8 01 F8    "   "    eorb  X01F8
EBD7 : 0F    " "    sei
EBD8 : D0 FB    "  "    subb  X00FB
EBDA : 01    " "    nop
EBDB : F0 1F E0    "   "    subb  X1FE0
EBDE : 3F    "?"    swi
EBDF : 74 01 FC    "t  "    lsr  X01FC
EBE2 : 07    " "    tpa
EBE3 : F0 0F 5E    "  ^"    subb  X0F5E
EBE6 : 01    " "    nop
EBE7 : FE 0F E0    "   "    ldx  X0FE0
EBEA : 3F    "?"    swi
EBEB : F1 00 FC    "   "    cmpb  X00FC
        ;
EBEE : 03 FC    "  "    db  $03, $FC
        ;
EBF0 : 8B 11    "  "    adda  #$11
        ;
EBF2 : FC    " "    db  $FC
        ;
EBF3 : 0B    " "    sev
EBF4 : FE 01 FE    "   "    ldx  X01FE
EBF7 : 0B    " "    sev
EBF8 : 80 FF    "  "    suba  #$FF
EBFA : 01    " "    nop
EBFB : F8 7F 00    "   "    eorb  X7F00
EBFE : FE 03 F8    "   "    ldx  X03F8
EC01 : 0F    " "    sei
EC02 : F0 0F E0    "   "    subb  X0FE0
EC05 : 17    " "    tba
        ;
EC06 : EC    " "    db  $EC
        ;
EC07 : 80 FF    "  "    suba  #$FF
EC09 : 01    " "    nop
        ;
EC0A : FC 03    "  "    db  $FC, $03
        ;
EC0C : F8 3F C0    " ? "    eorb  X3FC0
EC0F : 3F    "?"    swi
EC10 : C0 0F    "  "    subb  #$0F
EC12 : F0 0F FC    "   "    subb  X0FFC
        ;
EC15 : 03 FC    "  "    db  $03, $FC
        ;
EC17 : 01    " "    nop
EC18 : B5 FF 01    "   "    bita  XFF01
EC1B : 7E 80 3F    "~ ?"    jmp  L803F
        ;
EC1E : C0 3F    " ?"    subb  #$3F
EC20 : F0 07 FE    "   "    subb  X07FE
        ;
EC23 : 00    " "    db  $00
        ;
EC24 : BB E4 7F    "   "    adda  XE47F
EC27 : 80 38    " 8"    suba  #$38
EC29 : 7F 00 FE    "   "    clr  X00FE
        ;
EC2C : 03    " "    db  $03
        ;
EC2D : 8E FF 01    "   "    lds  #$FF01
EC30 : F8 03 FD    "   "    eorb  X03FD
EC33 : 0F    " "    sei
EC34 : 80 FF    "  "    suba  #$FF
        ;
EC36 : 00    " "    db  $00
        ;
EC37 : F4 7F 00    "   "    andb  X7F00
EC3A : FE 0F C0    "   "    ldx  X0FC0
EC3D : 3F    "?"    swi
EC3E : A0 FF    "  "    suba  $FF,x
        ;
EC40 : 03    " "    db  $03
        ;
EC41 : F8 07 98    "   "    eorb  X0798
EC44 : F2 1F C0    "   "    sbcb  X1FC0
EC47 : 7F 00 FB    "   "    clr  X00FB
        ;
EC4A : 13    " "    db  $13
        ;
EC4B : F8 1F 80    "   "    eorb  X1F80
EC4E : 7F C0 0D    "   "    clr  XC00D
EC51 : FE 03 F8    "   "    ldx  X03F8
EC54 : 07    " "    tpa
EC55 : 56    "V"    rorb
        ;
EC56 : ED    " "    db  $ED
        ;
EC57 : 89 3A    " :"    adca  #$3A
EC59 : 9C 03    "  "    cpx  X0003
EC5B : F4 17 E8    "   "    andb  X17E8
EC5E        LEC5E:
EC5E : CE B6 40    "  @"    ldx  #$B640
EC61        LEC61:
EC61 : FE 03 FC    "   "    ldx  X03FC
EC64 : 0F    " "    sei
        ;
EC65 : 00    " "    db  $00
        ;
EC66 : FE 03 FC    "   "    ldx  X03FC
        ;
EC69 : C3 13    "  "    db  $C3, $13
        ;
EC6B : F0 3F 80    " ? "    subb  X3F80
EC6E : FF 02 FC    "   "    stx  X02FC
EC71 : 07    " "    tpa
EC72 : E0 7F    "  "    subb  $7F,x
        ;
EC74 : 00 FC    "  "    db  $00, $FC
        ;
EC76 : 3F    "?"    swi
        ;
EC77 : 00    " "    db  $00
        ;
EC78        LEC78:
EC78 : FE 07 E0    "   "    ldx  X07E0
EC7B : 7F 11 6D    "  m"    clr  X116D
        ;
EC7E : 00    " "    db  $00
        ;
EC7F : 7F C0 AA    "   "    clr  XC0AA
EC82 : F6 FF 7D    "  }"    ldab  XFF7D
EC85 : 2D 0A    "- "    blt  LEC91
EC87 : 84 E4    "  "    anda  #$E4
EC89 : F6 AF C3    "   "    ldab  XAFC3
EC8C : 80 00    "  "    suba  #$00
EC8E : 30    "0"    tsx
EC8F : EE FD    "  "    ldx  $FD,x
EC91        LEC91:
EC91 : FF DE 7A    "  z"    stx  XDE7A
EC94 : F5 7A EF    " z "    bitb  X7AEF
        ;
EC97 : CD 12    "  "    db  $CD, $12
        ;
EC99 : 43    "C"    coma
EC9A : 9F 1F    "  "    sts  X001F
EC9C : 4D    "M"    tsta
        ;
EC9D        LEC9D:
EC9D : 00 00    "  "    db  $00, $00
        ;
EC9F        LEC9F:
EC9F : C0 D5    "  "    subb  #$D5
ECA1 : DF 4E    " N"    stx  X004E
ECA3 : 9A 74    " t"    oraa  X0074
ECA5 : F5 76 E3    " v "    bitb  X76E3
ECA8 : F9 EF 87    "   "    adcb  XEF87
ECAB : 01    " "    nop
        ;
ECAC : 00    " "    db  $00
        ;
ECAD : 90 FC    "  "    suba  X00FC
ECAF : DA 43    " C"    orab  X0043
ECB1 : 01    " "    nop
ECB2 : 46    "F"    rora
ECB3 : AF DE    "  "    sts  $DE,x
        ;
ECB5 : 14    " "    db  $14
        ;
ECB6 : BE FF 3F    "  ?"    lds  XFF3F
ECB9 : 07    " "    tpa
        ;
ECBA : 00    " "    db  $00
        ;
ECBB : F0 F2 55    "  U"    subb  XF255
        ;
ECBE        LECBE:
ECBE : 05    " "    db  $05
        ;
ECBF : 08    " "    inx
ECC0 : 9C 
;*************************************;
; jmp call
ECC1 : 96    "  "    cpx  X0096
ECC2 : 90 26    " &"    suba  X0026
ECC4        LECC4:
ECC4 : 91 9C    "  "    cmpa  X009C
ECC6 : 26 81    "& "    bne  LEC49
ECC8 : 26 82    "& "    bne  LEC4C
ECCA : 26 83    "& "    bne  LEC4F
ECCC : 86 26    " &"    ldaa  #$26
ECCE : 82 26    " &"    sbca  #$26
        ;
ECD0 : 8F    " "    db  $8F
        ;
ECD1 : 9B 89    "  "    adda  X0089
ECD3 : 07    " "    tpa
;*************************************;
; jmp call
ECD4 : 92 9C    "  "    sbca  X009C
ECD6 : 30    "0"    tsx
ECD7 : 96 90    "  "    ldaa  X0090
ECD9 : 9F 9F    "  "    sts  X009F
ECDB : 26 81    "& "    bne  LEC5E
ECDD : 26 82    "& "    bne  LEC61
ECDF : 30    "0"    tsx
        ;
ECE0 : 8F    " "    db  $8F
        ;
ECE1 : 9B 89    "  "    adda  X0089
        ;
ECE3        LECE3:
ECE3 : 87    " "    db  $87
        ;
ECE4 : 9F 9F    "  "    sts  X009F
ECE6 : 9B 93    "  "    adda  X0093
ECE8 : 97 30    " 0"    staa  X0030
ECEA : 8C A4 1F    "   "    cpx  #$A41F
;*************************************;
; jmp call  11 bytes
ECED : 91 9C    "  "    cmpa  X009C
ECEF : 96 8E    "  "    ldaa  X008E
ECF1 : A1 26    " &"    cmpa  $26,x
ECF3 : 81 26    " &"    cmpa  #$26
ECF5 : 82 30    " 0"    sbca  #$30
        ;
ECF7 : 03    " "    db  $03
;*************************************;
; jmp call 13 bytes
ECF8 : A2 84    "  "    sbca  $84,x
ECFA : 8B 82    "  "    adda  #$82
ECFC : 9B 89    "  "    adda  X0089
        ;
ECFE : 87    " "    db  $87
        ;
ECFF : 9F 9F    "  "    sts  X009F
ED01 : 30    "0"    tsx
ED02 : 8C A4 1F    "   "    cpx  #$A41F
;*************************************;
; jmp call 14 bytes
ED05 : 91 9C    "  "    cmpa  X009C
ED07 : 26 96    "& "    bne  LEC9F
ED09 : 90 26    " &"    suba  X0026
ED0B : 81 9B    "  "    cmpa  #$9B
ED0D : 89 87    "  "    adca  #$87
ED0F : 9F 9F    "  "    sts  X009F
ED11 : 26 03    "& "    bne  LED16
;*************************************;
; jmp call 6 bytes
ED13 : 8D A3    "  "    bsr  LECB8
ED15 : 26 86    "& "    bne  LEC9D
ED17 : 60 08    "` "    neg  $08,x
;*************************************;
; jmp call 8 bytes
ED19 : 81 26    " &"    cmpa  #$26
ED1B : 82 9B    "  "    sbca  #$9B
        ;
ED1D : 93    " "    db  $93
        ;
ED1E : 97 26    " &"    staa  X0026
        ;
ED20 : 03    " "    db  $03
;*************************************;
; jmp call 9 bytes
ED21 : A2 84    "  "    sbca  $84,x
ED23 : 8B 82    "  "    adda  #$82
ED25 : 9B 93    "  "    adda  X0093
ED27 : 97 26    " &"    staa  X0026
        ;
ED29 : 03    " "    db  $03
;*************************************;
; jmp call 10 bytes
ED2A : 81 9B    "  "    cmpa  #$9B
ED2C : 89 87    "  "    adca  #$87
ED2E : 9F 9F    "  "    sts  X009F
ED30 : 26 8C    "& "    bne  LECBE
ED32 : A4 1F    "  "    anda  $1F,x
;*************************************;
; jmp call 13 bytes
ED34 : A2 84    "  "    sbca  $84,x
ED36 : 8B 82    "  "    adda  #$82
ED38 : 9B 89    "  "    adda  X0089
        ;
ED3A : 87    " "    db  $87
        ;
ED3B : 9F 9F    "  "    sts  X009F
ED3D : 26 85    "& "    bne  LECC4
ED3F : 9E 1F    "  "    lds  X001F
;*************************************;
; jmp call 1 byte
ED41 : 0A    " "    clv
;*************************************;
; jmp call 1 byte
ED42 : 08    " "    inx
;*************************************;
; jmp call 3 bytes
ED43 : 96 9D    "  "    ldaa  X009D
ED45 : 0B    " "    sev
;*************************************;
; jmp call 6 bytes
ED46 : 91 9C    "  "    cmpa  X009C
ED48 : 9B 89    "  "    adda  X0089
ED4A : A0 0B    "  "    suba  $0B,x
;*************************************;
; jmp call 20 bytes
ED4C : 91 9C    "  "    cmpa  X009C
ED4E : 96 8E    "  "    ldaa  X008E
ED50 : A1 96    "  "    cmpa  $96,x
ED52 : 94 99    "  "    anda  X0099
ED54 : 98 30    " 0"    eora  X0030
ED56 : 9A 9B    "  "    oraa  X009B
ED58 : 89 87    "  "    adca  #$87
ED5A : 9F 9F    "  "    sts  X009F
ED5C : 26 85    "& "    bne  LECE3
ED5E : 9E 1F    "  "    lds  X001F
;*************************************;
; jmp call 8 bytes
ED60 : 8A 26    " &"    oraa  #$26
ED62 : 9A 26    " &"    oraa  X0026
        ;
ED64 : 8F    " "    db  $8F
        ;
ED65 : 9B 89    "  "    adda  X0089
ED67        LED67:
ED67 : 07    " "    tpa
;*************************************;
; jmp call 20 bytes
ED68 : 96 90    "  "    ldaa  X0090
ED6A : 26 91    "& "    bne  LECFD
ED6C : 9C 96    "  "    cpx  X0096
ED6E : 94 99    "  "    anda  X0099
ED70 : 98 30    " 0"    eora  X0030
ED72 : 9A 26    " &"    oraa  X0026
        ;
ED74 : 8F    " "    db  $8F
        ;
ED75 : 9B 89    "  "    adda  X0089
        ;
ED77 : 87    " "    db  $87
        ;
ED78 : 9F 9F    "  "    sts  X009F
ED7A : 26 03    "& "    bne  LED7F
;*************************************;
; jmp call 18 bytes
ED7C : 91 9C    "  "    cmpa  X009C
ED7E : 96 8E    "  "    ldaa  X008E
ED80 : A1 96    "  "    cmpa  $96,x
ED82 : 94 99    "  "    anda  X0099
ED84 : 98 30    " 0"    eora  X0030
ED86 : 9A 9B    "  "    oraa  X009B
ED88 : 89 87    "  "    adca  #$87
ED8A : 9F 9F    "  "    sts  X009F
ED8C : 26 03    "& "    bne  LED91
;*************************************;
; jmp call 12 bytes
ED8E : 91 9C    "  "    cmpa  X009C
ED90 : 26 84    "& "    bne  LED16
ED92 : 8B 89    "  "    adda  #$89
        ;
ED94 : 87    " "    db  $87
        ;
ED95 : 9F 9F    "  "    sts  X009F
ED97 : 50    "P"    negb
ED98 : 85 1E    "  "    bita  #$1E
;*************************************;
; jmp call 10 bytes
ED9A : 8A 60    " `"    oraa  #$60
ED9C : 8A 60    " `"    oraa  #$60
ED9E : 95 50    " P"    bita  X0050
EDA0 : 95 50    " P"    bita  X0050
        ;
EDA2 : 15 15    "  "    db  $15, $15
;*************************************;
;LEDA4 called by TALKD
EDA4 : A5 FF    "  "    bita  $FF,x
EDA6 : 96 90    "  "    ldaa  X0090
EDA8 : 91 9C    "  "    cmpa  X009C
EDAA : 81 82    "  "    cmpa  #$82
        ;
EDAC : 83    " "    db  $83
        ;
EDAD : 86 8F    "  "    ldaa  #$8F
EDAF : 9B 89    "  "    adda  X0089
        ;
EDB1 : 87    " "    db  $87
        ;
EDB2 : 9F 30    " 0"    sts  X0030
        ;
EDB4 : 93    " "    db  $93
        ;
EDB5 : 97 30    " 0"    staa  X0030
EDB7 : 8C A4 8E    "   "    cpx  #$A48E
EDBA : A1 94    "  "    cmpa  $94,x
EDBC : 99 98    "  "    adca  X0098
EDBE : 9A 30    " 0"    oraa  X0030
EDC0 : 85 9E    "  "    bita  #$9E
EDC2 : 8D A3    "  "    bsr  LED67
EDC4 : 88 A2    "  "    eora  #$A2
EDC6 : 84 8B    "  "    anda  #$8B
EDC8 : 9B 89    "  "    adda  X0089
EDCA : A0 8B    "  "    suba  $8B,x
EDCC : 96 9D    "  "    ldaa  X009D
EDCE : 8B 95    "  "    adda  #$95
EDD0 : 30    "0"    tsx
EDD1 : 8A 30    " 0"    oraa  #$30
EDD3 : 92 1C    "  "    sbca  X001C
EDD5 : B0 00 B3    "   "    suba  X00B3
EDD8 : D0 B3    "  "    subb  X00B3
EDDA : D1 B5    "  "    cmpb  X00B5
EDDC : 40    "@"    nega
EDDD : B5 41 BA    " A "    bita  X41BA
        ;
EDE0 : 51    "Q"    db  $51
        ;
EDE1 : BA 52 BE    " R "    oraa  X52BE
EDE4 : 2F BE    "/ "    ble  LEDA4
EDE6 : 30    "0"    tsx
EDE7 : C1 54    " T"    cmpb  #$54
        ;
EDE9 : C3    " "    db  $C3
        ;
EDEA : B0 C5 10    "   "    suba  XC510
EDED : C5 11    "  "    bitb  #$11
EDEF : C8 6E    " n"    eorb  #$6E
EDF1 : C8 6F    " o"    eorb  #$6F
EDF3 : D0 77    " w"    subb  X0077
EDF5 : D0 78    " x"    subb  X0078
EDF7 : D1 58    " X"    cmpb  X0058
EDF9 : D1 59    " Y"    cmpb  X0059
EDFB : D6 D0    "  "    ldab  X00D0
EDFD : D6 D1    "  "    ldab  X00D1
EDFF        XEDFF:
EDFF : D7 FA    "  "    stab  X00FA
EE01 : D7 FB    "  "    stab  X00FB
EE03 : DA FF    "  "    orab  X00FF
EE05 : DB 00    "  "    addb  X0000
        ;
EE07 : DD    " "    db  $DD
        ;
EE08 : A6 DD    "  "    ldaa  $DD,x
EE0A : A7 DD    "  "    staa  $DD,x
EE0C : FB DD FC    "   "    addb  XDDFC
EE0F : E1 5C    " \"    cmpb  $5C,x
EE11 : E1 5D    " ]"    cmpb  $5D,x
EE13 : E4 4D    " M"    andb  $4D,x
EE15 : E4 4E    " N"    andb  $4E,x
EE17 : E5 38    " 8"    bitb  $38,x
EE19 : E5 39    " 9"    bitb  $39,x
EE1B : E6 51    " Q"    ldab  $51,x
EE1D : E6 52    " R"    ldab  $52,x
EE1F : E8 12    "  "    eorb  $12,x
EE21 : E8 13    "  "    eorb  $13,x
EE23 : EA 1F    "  "    orab  $1F,x
EE25 : EA 20    "  "    orab  $20,x
        ;
EE27 : EC    " "    db  $EC
        ;
EE28 : 80 EC    "  "    suba  #$EC
EE2A : 81 EC    "  "    cmpa  #$EC
EE2C : C1 B0    "  "    cmpb  #$B0
        ;
EE2E : 00    " "    db  $00
        ;
EE2F : B1 FF B1    "   "    cmpa  XFFB1
        ;
EE32 : 00    " "    db  $00
        ;
EE33 : B2 00 B2    "   "    sbca  X00B2
        ;
EE36 : 00 B3    "  "    db  $00, $B3
        ;
EE38 : D0 B5    "  "    subb  X00B5
        ;
EE3A : 41    "A"    db  $41
        ;
EE3B : B7 80 D7    "   "    staa  X80D7
EE3E : 40    "@"    nega
EE3F : D7 FA    "  "    stab  X00FA
EE41 : B6 90 B8    "   "    ldaa  X90B8
        ;
EE44 : 00    " "    db  $00
        ;
EE45 : B5 C0 BA    "   "    bita  XC0BA
        ;
EE48 : 51    "Q"    db  $51
        ;
EE49 : C1 BF    "  "    cmpb  #$BF
        ;
EE4B : C3    " "    db  $C3
        ;
EE4C : AF D0    "  "    sts  $D0,x
EE4E : 10    " "    sba
EE4F : D0 77    " w"    subb  X0077
EE51 : D2 80    "  "    sbcb  X0080
EE53 : D6 D0    "  "    ldab  X00D0
EE55 : D8 40    " @"    eorb  X0040
EE57 : DA 80    "  "    orab  X0080
EE59 : DB 00    "  "    addb  X0000
        ;
EE5B : DC    " "    db  $DC
        ;
EE5C : 90 E2    "  "    suba  X00E2
        ;
EE5E : 00    " "    db  $00
        ;
EE5F : E4 4D    " M"    andb  $4D,x
EE61 : C1 55    " U"    cmpb  #$55
        ;
EE63 : C3    " "    db  $C3
        ;
EE64 : AF B0    "  "    sts  $B0,x
        ;
EE66 : 00 
;*************************************;
;LEE67 called by TP11 (possible jumps?)
EE67 : EC C1 
EE69 : EC C1 
EE6B : EC D4 
EE6D : EC ED 
EE6F : ED 13 
EE71 : ED 05 
EE73 : EC F8 
EE75 : ED 19 
EE77 : ED 21 
EE79 : ED 2A 
EE7B : ED 34
EE7D : ED 60 
EE7F : ED 42 
EE81 : ED 43 
EE83 : ED 46 
EE85 : ED 4C 
EE87 : ED 7C 
EE89 : ED 68 
EE8B : ED 9A 
EE8D : ED 8E 
EE8F : ED 41 
;*************************************;
;called by TKIRQ
EE91 : ED A3 00    "   "    db  $ED, $A3, $00
        ;
EE94 : 01    " "    nop
        ;
EE95 : 00 02 00 03  "    "    db  $00, $02, $00, $03
        ;
EE99 : 0D    " "    sec
        ;
EE9A : 00 03 00 00  "    "    db  $00, $03, $00, $00
        ;
EE9E : 06    " "    tap
        ;
EE9F : 00    " "    db  $00
        ;
EEA0 : 07    " "    tpa
        ;
EEA1 : 14 00 00    "   "    db  $14, $00, $00
        ;
EEA4 : 09    " "    dex
EEA5 : 0C    " "    clc
        ;
EEA6 : 00 00    "  "    db  $00, $00
        ;
EEA8 : 0B    " "    sev
        ;
EEA9 : 13 00 00    "   "    db  $13, $00, $00
        ;
EEAC : 0D    " "    sec
EEAD : 01    " "    nop
        ;
EEAE : 00    " "    db  $00
        ;
EEAF : 0F    " "    sei
        ;
EEB0 : 00 00    "  "    db  $00, $00
        ;
EEB2 : 10    " "    sba
EEB3 : 11    " "    cba
        ;
EEB4 : 14 00 12 00  "    "    db  $14, $00, $12, $00
EEB8 : 13    " "    db  $13
        ;
EEB9 : 0E    " "    cli
        ;
EEBA : 00    " "    db  $00
        ;
EEBB : 0A    " "    clv
        ;
EEBC : 00 00    "  "    db  $00, $00
        ;
EEBE : 16    " "    tab
        ;
EEBF : 00    " "    db  $00
        ;
EEC0 : 17    " "    tba

EEC1 : 00 18 00    "   "    db  $00, $18, $00
        ;
EEC4 : 19    " "    daa
EEC5 : 06    " "    tap
        ;
EEC6 : 1D 00    "  "    db  $1D, $00
        ;
EEC8 : 1B    " "    aba
        ;
EEC9 : 00 1C 00 1D  "    "    db  $00, $1C, $00, $1D
EECD : 12 00 00 1F  "    "    db  $12, $00, $00, $1F
;*************************************;
; Copyright 
;*************************************;
EED1 : 43    "C"                      ;COPYRIGHT
EED2 : 4F    "O"                      ;
EED3 : 50    "P"                      ;
EED4 : 59    "Y"                      ;
EED5 : 52    "R"                      ;
EED6 : 49    "I"                      ;
EED7 : 47    "G"                      ;
EED8 : 48    "H"                      ;
EED9 : 54    "T"                      ;
EEDA : 2D 57    "-W"                  ;-WILLIAMS
EEDC : 49    "I"                      ;
EEDD : 4C    "L"                      ;
EEDE : 4C    "L"                      ;
EEDF : 49    "I"                      ;
EEE0 : 41    "A"                      ;
EEE1 : 4D    "M"                      ;
EEE2 : 53    "S"                      ;
EEE3 : 20 45    " E"                  ;ELECTRONICS
EEE5 : 4C    "L"                      ;
EEE6 : 45    "E"                      ;
EEE7 : 43    "C"                      ;
EEE8 : 54    "T"                      ;
EEE9 : 52    "R"                      ;
EEEA : 4F    "O"                      ;
EEEB : 4E    "N"                      ;
EEEC : 49    "I"                      ;
EEED : 43    "C"                      ;
EEEE : 53    "S"                      ;
EEEF : 2D 34    "-4"                  ;-4/23/81
EEF1 : 2F 32    "/2"                  ;
EEF3 : 33    "3"                      ;
EEF4 : 2F 38    "/8"                  ;
EEF6 : 31    "1"                      ;
EEF7 : 2D 4A    "-J"                  ;-JK (John Kotlarik)
EEF9 : 4B    "K"                      ;
EEFA : 2D    "-"                      ;-
;*************************************;
; DIAGNOSTICS
;*************************************;
;TALKD
EEFB : CE ED A4   ldx #$EDA4          ;load X with EDA4h
EEFE : 7F 00 04   clr $0004           ;clear addr 0004
EF01 : 20 65      bra  LEF68          ;branch always TP1LP4
;*************************************;
; TALKING IRQ processing
;*************************************;
;TKIRQ
EF03 : CE EE 91   ldx  #$EE91         ;load X with EE91h
EF06 : 97 01      staa  $01           ;store A in addr 01
EF08 : 97 05      staa  $05           ;store A in addr 05
EF0A : 84 1F      anda  #$1F          ;and A with 1Fh
EF0C : 27 0A      beq  LEF18          ;branch Z=0 TKIRQ1
EF0E : 48         asla                ;arith shift left A
EF0F : BD FF F3   jsr  LFFF3          ;jump sub Sound ROM (jmp to ADDX)
EF12 : E6 01      ldab  $01,x         ;load B with addr X+01h
EF14 : D7 04      stab  $04           ;store B with addr 04
EF16 : A6 00      ldaa  $00,x         ;load A with addr X+00h
;TKIRQ1 LEF18:
EF18 : 27 79      beq  LEF93          ;branch Z=1 TP12
EF1A : 0E         cli                 ;clear interrputs I=0
EF1B : 81 01      cmpa  #$01          ;compare A with 01h
EF1D : 27 0C      beq  LEF2B          ;branch Z=1 TKIRQ2
EF1F : 81 0A      cmpa  #$0A          ;compare A with 0Ah
EF21 : 27 08      beq  LEF2B          ;branch Z=1 TKIRQ2
EF23 : 81 0F      cmpa  #$0F          ;compare A with 0Fh
EF25 : 27 04      beq  LEF2B          ;branch Z=1 TKIRQ2
EF27 : 81 14      cmpa  #$14          ;compare A with 14h
EF29 : 26 08      bne  LEF33          ;branch Z=0 TKIRQ3
;TKIRQ2 LEF2B:
EF2B : 73 00 03   com  $0003          ;complement 1s in 0003
EF2E : 2B 21      bmi  LEF51          ;branch N=1 TP11
EF30 : 4C         inca                ;incr A
EF31 : 20 1E      bra  LEF51          ;branch always TP11
;TKIRQ3 LEF33:
EF33 : 81 03      cmpa  #$03          ;compare A with 03h
EF35 : 27 04      beq  LEF3B          ;branch Z=1 TKPRM1
EF37 : 81 06      cmpa  #$06          ;compare A with 06h
EF39 : 26 16      bne  LEF51          ;branch Z=0 TP11
;*************************************;
; TALKING param 1
;*************************************;
;TKPRM1 LEF3B:
EF3B : CE B0 00   ldx  #$B000         ;load X B000h (Speech ROM IC7)
EF3E : 36         psha                ;push A into stack then SP-1
EF3F : 96 15      ldaa  $15           ;load A with addr 15
;TP1LP1 LEF41:
EF41 : 08         inx                 ;incr X
EF42 : BD FF F3   jsr  LFFF3          ;jump sub Sound ROM (jmps to ADDX)
EF45 : E6 00      ldab  $00,x         ;load B with addr X+00h
EF47 : C4 03      andb  #$03          ;and B with 03h
EF49 : D1 02      cmpb  $02           ;compare B with addr 02
EF4B : 27 F4      beq  LEF41          ;branch Z=1 TP1LP1
EF4D : 32         pula                ;SP+1 pull stack into A
EF4E : D7 02      stab  $02           ;store B with addr 02
EF50 : 1B         aba                 ;add A with B
;TP11 LEF51:
EF51 : 48         asla                ;arith shift left A
EF52 : CE EE 67   ldx  #$EE67         ;load X with EE67h
EF55 : BD FF F3   jsr  LFFF3          ;jump sub Sound ROM (jmp to ADDX)
EF58 : EE 00      ldx  $00,x          ;load X with addr X+00h
EF5A : 86 C8      ldaa  #$C8          ;load A with C8h
;TP1LP2 LEF5C:
EF5C : 8D 5D      bsr  LEFBB          ;branch sub TKCD
EF5E : 4A         deca                ;decr A
EF5F : 26 FB      bne  LEF5C          ;branch Z=0 TP1LP2
EF61 : 86 C8      ldaa  #$C8          ;load A with C8h
;TP1LP3 LEF63:
EF63 : 8D 56      bsr  LEFBB          ;branch sub TKCD
EF65 : 4A         deca                ;decr A
EF66 : 26 FB      bne  LEF63          ;branch Z=0 TP1LP3
;TP1LP4 LEF68:
EF68 : DF 0A      stx  $0A            ;store X in addr 0A
EF6A : A6 00      ldaa  $00,x         ;load A with addr X+00h
EF6C : 84 7F      anda  #$7F          ;and A with 7Fh
EF6E : 81 25      cmpa  #$25          ;compare A with 25h
EF70 : 22 23      bhi  LEF95          ;branch C+Z=0 TP13
EF72 : 48         asla                ;arith shift left A
EF73 : 48         asla                ;arith shift left A
EF74 : CE ED D1   ldx  #$EDD1         ;load X with EDD1h
EF77 : BD FF F3   jsr  LFFF3          ;jump sub Sound ROM (jmp to ADDX)
EF7A : DF 0C      stx  $0C            ;store X in addr 0C
EF7C : EE 00      ldx  $00,x          ;load X with addr X+00h
EF7E : DF 06      stx  $06            ;store X in addr 06
EF80 : DE 0C      ldx  $0C            ;load X with addr 0C
EF82 : EE 02      ldx  $02,x          ;load X with addr X+02h
EF84 : DF 08      stx  $08            ;store X in addr 08
EF86 : 8D 39      bsr  LEFC1          ;branch sub TKSC
;
;TP1LP5 LEF88 main loop
EF88 : DE 0A      ldx  $0A            ;load X with addr 0A
EF8A : A6 00      ldaa  $00,x         ;load A with X+00h
EF8C : 81 25      cmpa  #$25          ;compare A with 25h
EF8E : 23 10      bls  LEFA0          ;branch C+Z=1 TKPRM2
EF90 : 08         inx                 ;incr X
EF91 : 20 D5      bra  LEF68          ;branch always TP1LP4
;
;TP12 LEF93:
EF93 : 20 12      bra  LEFA7          ;branch always TP21
;
;TP13 LEF95:
EF95 : A6 00      ldaa  $00,x         ;load A with X+00h
;TP1LP6 LEF97 count down A loop
EF97 : 8D 22      bsr  LEFBB          ;branch sub TKCD
EF99 : 4A         deca                ;decr A
EF9A : 26 FB      bne  LEF97          ;branch Z=0 TP1LP6
;
EF9C : 97 01      staa  $01           ;store A in addr 01
EF9E : 20 E8      bra  LEF88          ;branch always TP1LP5
;*************************************;
;TALKING param 2
;*************************************;
;TKPRM2 LEFA0:
EFA0 : 86 64      ldaa  #$64          ;load A with 64h
;TP2LP1 LEFA2 count down A loop
EFA2 : 8D 17      bsr  LEFBB          ;branch sub TKCD
EFA4 : 4A         deca                ;decr A
EFA5 : 26 FB      bne  LEFA2          ;branch Z=0 TP2LP1
;TP21 LEFA7:
EFA7 : 96 01      ldaa  $01           ;load A with addr 01
EFA9 : 7D 00 05   tst  $0005          ;test addr 0005
EFAC : 26 02      bne  LEFB0          ;branch Z=0 TP22
EFAE : 96 04      ldaa  $04           ;load A with addr 04
;TP22 LEFB0:
EFB0 : F6 04 02   ldab  $0402         ;load B with PIA sound select
EFB3 : 0E         cli                 ;clear interrupts I=0
EFB4 : BD FF F0   jsr  LFFF0          ;jump sub Sound ROM (IRQ11)
EFB7 : 7F 00 00   clr  $X0000         ;clear addr 0000
EFBA : 39         rts                 ;return subroutine
;*************************************;
;TALKING count down loop
;*************************************;
;TKCD LEFBB:
EFBB : C6 49      ldab  #$49          ;load B with 49h (#73)
;TKCDLP LEFBD:
EFBD : 5A         decb                ;decr B
EFBE : 26 FD      bne  LEFBD          ;branch Z=0 TKCDLP
EFC0 : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech clock (0403)
;*************************************;
;TKSC LEFC1:
EFC1 : DE 06      ldx  $06            ;load X with 06
EFC3 : A6 00      ldaa  $00,x         ;load A with X+00h
EFC5 : 81 AA      cmpa  #$AA          ;compare A with AAh
EFC7 : 26 19      bne  LEFE2          ;branch Z=0 TKSCX
EFC9 : 7F 00 05   clr  $0005          ;clear 0005
EFCC : 08         inx                 ;incr X
EFCD : C6 01      ldab  #$01          ;load B with 01h
;TKSC1 LEFCF:
EFCF : 86 3F      ldaa  #$3F          ;load A with 3Fh (0011 1111)
EFD1 : B7 04 03   staa  $0403         ;store A (3Fh) in PIA CR port B (CB2 - speech clock)
EFD4 : 84 F7      anda  #$F7          ;and A with F7h (1111 0111)
EFD6 : B7 04 03   staa  $0403         ;store A (F7h) in PIA CR port B (CB2 - speech clock)
EFD9 : 58         aslb                ;arith shift left B
EFDA : 26 07      bne  LEFE3          ;branch Z=0 TKSD
EFDC : 59         rolb                ;rotate left B
EFDD : 08         inx                 ;incr X
EFDE : 9C 08      cpx  $08            ;compare X with addr 08
EFE0 : 26 05      bne  LEFE7          ;branch Z=0 TKSD1
;TKSCX LEFE2:
EFE2 : 39         rts                 ;return subroutine
;*************************************;
;TALKING speech data (0401)
;*************************************;
;TKSD LEFE3:
EFE3 : 6D 00      tst  $00,x          ;test X+00h
EFE5 : 6D 00      tst  $00,x          ;test X+00h
;TKSD1 LEFE7:
EFE7 : E5 00      bitb  $00,x         ;bit test B with X+00h
EFE9 : 27 07      beq  LEFF2          ;branch Z=1 TKSD2
EFEB : 86 3C      ldaa  #$3C          ;load A with 3Ch (0011 1100)
EFED : B7 04 01   staa  $0401         ;store A (3Ch) in PIA sound select (CA2 - speech data)
EFF0 : 20 DD      bra  LEFCF          ;branch always TKSC1
;TKSD2 LEFF2:
EFF2 : 86 34      ldaa  #$34          ;load A with 34h (0011 0100)
EFF4 : B7 04 01   staa  $0401         ;store A (34h) in PIA sound select (CA2 - speech data)
EFF7 : 20 D6      bra  LEFCF          ;branch always TKSC1
;*************************************;
; zero padding
EFF9 : 00                             ;
;*************************************;
;ENTRY (from Sound ROM)
;*************************************;
EFFA : 7E EE FB    jmp  LEEFB         ;ENTRY FOR DIAGNOSTICS
EFFD : 7E EF 03    jmp  LEF03         ;ENTRY TO TALKING (TKIRQ)

;--------------------------------------------------------------





