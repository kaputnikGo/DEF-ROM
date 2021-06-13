        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    SpaceShuttle.128
        ;
        ;  Size:    16384 bytes
        ;  Checksum:  5E45
        ;  CRC-32:    8050AE27
        ;
        ;  Date:    Fri Jun 11 14:37:16 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Space Shuttle, 1st System 9 pinball, Nov 1984
        ;
        ;Sound prog by : Eugene Jarvis, Bill Parod
        ;Speech prog by: Larry DeMar
        ;
        ; sound logic on MPU board, 
        ; Speech Board of 3 2532 ROMS - U4, U5, U6
        ; Sound ROM 16Kx8 27128 - U49
        ;
        ; Speech vocab (NMI call):
        ;   U5 : One, Two, Three
        ;   U6 : Four, Liftoff
        ;   U4 : Abort, Ready, Pilot
        ;  U49 : Airlock, Open, Close, scream
        ;
        ; DAC output SOUND $2002
        ; sound select $2000
        ;
        ; In sys 9 Speech processing is moved to this ROM from the speech board ROMs
        ; CA2=$2001 Speech CLOCK
        ; CB2=$2003 Speech DATA
        ;
        ;NOTES:
;*
;*SYSTEM CONSTANTS
;*
ROM      EQU  $C000
SOUND    EQU  $2002
ENDRAM   EQU  $7F
VECTOR   EQU  $FFF8    ;RESET,INT VECTORS
WVELEN   EQU  72
;
LOCRAM   EQU  *        ;                         : 0000
;*
;*GWAVE PARAMETERS
;*
         ORG  LOCRAM
GECHO    RMB  1        ;ECHO FLAG                : 0000
GCCNT    RMB  1        ;CYCLE COUNT              : 0001
GECDEC   RMB  1        ;# OF DECAYS PER ECHO     : 0002
GDFINC   RMB  1        ;DELTA FREQ INC           : 0003
GDCNT    RMB  1        ;DELTA FREQ COUNT         : 0004
GWFRM    RMB  2        ;WAVEFORM ADDRESS         : 0005-0006
;*TEMPORARY OR COMPUTED PARAMETERS
PRDECA   RMB  1        ;PRE-DECAY FACTOR         : 0007
GWFRQ    RMB  2        ;FREQ TABLE ADDR          : 0008-0009
FRQEND   RMB  2        ;END ADDR FREQ TABLE      : 000A-000B
WVEND    RMB  2        ;WAVE END ADDR            : 000C-000D
GPER     RMB  1        ;PERIOD                   : 000E
GECNT    RMB  1        ;# OF ECHOES COUNTER      : 000F
FOFSET   RMB  1        ;FREQUENCY OFFSET         : 0010
;*
;*GWAVE TABLES
;*
GWTAB    RMB  WVELEN   ;WAVE TABLE               : 0011-0059
;*
;*VARIWAVE PARAMETERS
;*
         ORG  LOCRAM
LOPER    RMB  1        ;LO PERIOD                : 0000
HIPER    RMB  1        ;HIPERIOD                 : 0001
LODT     RMB  1        ;PERIOD DELTAS            : 0002
HIDT     RMB  1        ;                         : 0003
HIEN     RMB  1        ;END PERIOD               : 0004
SWPDT    RMB  2        ;SWEEP PERIOD             : 0005-0006
LOMOD    RMB  1        ;BASE FREQ MOD            : 0007
VAMP     RMB  1        ;AMPLITUDE                : 0008
LOCNT    RMB  1        ;PERIOD COUNTERS          : 0009
HICNT    RMB  1        ;                         : 000A
;*
;*FILTERED NOISE ROUTINE PARAMETERS
;*
; FNOISE #1
         ORG  LOCRAM
FMAX     RMB  1        ;MAXIMUM_FREQUENCY        : 0000
FHI      RMB  1        ;FREQUENCY                : 0001
FLO      RMB  1        ;                         : 0002
SAMPC    RMB  2        ;SAMPLE COUNT             : 0003-0004
FDFLG    RMB  1        ;FREQUENCY DECREMENT FLAG : 0005
DSFLG    RMB  1        ;DISTORTION FLAG          : 0006
HI       RMB  1        ;RANDOM SEED              : 0060
LO       RMB  1        ;RANDOM SEED              : 0061
;*
; FNOISE #2
;*
HI       RMB  1        ;RANDOM SEED              : 0001
LO       RMB  1        ;RANDOM SEED              : 0002
FMAX     RMB  1        ;MAXIMUM_FREQUENCY        : 0004
FHI      RMB  1        ;FREQUENCY                : 0005
FLO      RMB  1        ;                         : 0006
SAMPC    RMB  2        ;SAMPLE COUNT             : 0007-0008
FDFLG    RMB  1        ;FREQUENCY DECREMENT FLAG : 0009
DSFLG    RMB  1        ;DISTORTION FLAG          : 000A

;*
;*TEMPORARIES
;*
TMPRAM   EQU  *        ;TEMPORARY RAM
TEMPSP   RMB  2        ;Stack Pointer temp       : 0060-0061

XPLAY    RMB  2        ;                         : 0068-0069
TEMPX    RMB  2        ;X TEMPS                  : 006A-006B
TEMPA    RMB  1        ;ACCA TEMP                : 006C
TEMPB    RMB  1        ;                         : 006D
XPTR     RMB  2        ;                         : 006E-006F
;
;
        ; 
        ; 
org  $C000
        ; 
        ;
C000        XC000:
C000 : 3F    "?"    swi
        ;
C001 : 00    " "    db  $00
        ;
C002 : 28 FA    "( "    bvc  LBFFE
C004 : FF 7F 09    "   "    stx  X7F09
C007 : 80 D6    "  "    suba  #$D6
C009 : F7 17 15    "   "    stab  X1715
        ;
C00C : 00    " "    db  $00
        ;
C00D : 40    "@"    nega
C00E : 90 F6    "  "    suba  X00F6
C010 : FF FF 01    "   "    stx  XFF01
        ;
C013 : 00    " "    db  $00
        ;
C014 : FE FF 3F    "  ?"    ldx  XFF3F
        ;
C017 : 00    " "    db  $00
        ;
C018 : 88 FE    "  "    eora  #$FE
C01A : BF FF 40    "  @"    sts  XFF40
C01D : 0D    " "    sec
C01E : E8 8B    "  "    eorb  $8B,x
C020        XC020:
C020 : FA 03 17    "   "    orab  X0317
        ;
C023 : 00 00    "  "    db  $00, $00
        ;
C025 : E8 FF    "  "    eorb  $FF,x
C027 : FF 03 00    "   "    stx  X0300
C02A : F8 FF FF    "   "    eorb  XFFFF
        ;
C02D : 00    " "    db  $00
        ;
C02E : 08    " "    inx
C02F : F9 FF 5E    "  ^"    adcb  XFF5E
C032 : 2C 8A    ", "    bge  LBFBE
C034 : 7E D0 95    "~  "    jmp  LD095
        ;
C037 : E8 05    "  "    eorb  $05,x
C039 : 08    " "    inx
        ;
C03A : 02    " "    db  $02
        ;
C03B : A0 FF    "  "    suba  $FF,x
C03D : FF 1F 00    "   "    stx  X1F00
C040 : C0 FF    "  "    subb  #$FF
C042 : FF 17 50    "  P"    stx  X1750
C045 : A0 FF    "  "    suba  $FF,x
C047 : EE 8A    "  "    ldx  $8A,x
        ;
C049 : 87    " "    db  $87
        ;
C04A : D4 27    " '"    andb  X0027
C04C : 7C 02 35    "| 5"    inc  X0235
C04F : 20 04    "  "    bra  LC055
        ;
C051 : 80 FE    "  "    suba  #$FE
C053 : FF FF 00    "   "    stx  XFF00
C056 : 01    " "    nop
        ;
C057        XC057:
C057 : FC    " "    db  $FC
        ;
C058 : FF BF 91    "   "    stx  XBF91
        ;
C05B : 02    " "    db  $02
        ;
C05C : 6C B7    "l "    inc  $B7,x
C05E : 9F 7E    " ~"    sts  X007E
C060 : 90 2E    " ."    suba  X002E
C062 : D0 8B    "  "    subb  X008B
C064 : 54    "T"    lsrb
        ;
C065 : 05 00 00    "   "    db  $05, $00, $00
        ;
C068 : F4 FF FF    "   "    andb  XFFFF
C06B : 07    " "    tpa
C06C : 06    " "    tap
C06D : C0 6F    " o"    subb  #$6F
C06F : FF 7F 2B    "  +"    stx  X7F2B
C072 : 80 22    " ""    suba  #$22
C074 : B7 FD 2F    "  /"    staa  XFD2F
        ;
C077 : 3A 00    ": "    db  $3A, $00
        ;
C079 : AA A8    "  "    oraa  $A8,x
C07B : 2F 44    "/D"    ble  LC0C1
C07D : 08    " "    inx
        ;
C07E : 00    " "    db  $00
        ;
C07F        XC07F:
C07F : FF FF FF 
        ;
C082 : 75 00 52    "u R"    db  $75, $00, $52
        ;
C085 : F1 BF FF    "   "    cmpb  XBFFF
C088 : 8B 24    " $"    adda  #$24
        ;
C08A : 00    " "    db  $00
        ;
C08B : E5 DF    "  "    bitb  $DF,x
C08D : F6 0A 28    "  ("    ldab  X0A28
C090 : A5 F6    "  "    bita  $F6,x
C092 : DB BA    "  "    addb  X00BA
C094 : 22 A8    "" "    bhi  LC03E
C096 : A2 EE    "  "    sbca  $EE,x
C098 : CA 5D    " ]"    orab  #$5D
C09A : BD BD DD    "   "    jsr  LBDDD
C09D : EE 5D    " ]"    ldx  $5D,x
        ;
C09F : 15 00    "  "    db  $15, $00
        ;
C0A1 : D0 FF    "  "    subb  X00FF
C0A3 : F6 17 90    "   "    ldab  X1790
        ;
C0A6 : 02    " "    db  $02
        ;
C0A7 : FB 75 6B    " uk"    addb  X756B
C0AA : A1 50    " P"    cmpa  $50,x
C0AC : E5 E9    "  "    bitb  $E9,x
C0AE : 8A 54    " T"    oraa  #$54
C0B0 : AA AE    "  "    oraa  $AE,x
C0B2 : 6E B7    "n "    jmp  $B7,x            ;INFO: index jump
        ;
C0B4 : 7A A5 80    "z  "    dec  XA580
C0B7 : D0 FF    "  "    subb  X00FF
C0B9 : EB 0B    "  "    addb  $0B,x
C0BB : 50    "P"    negb
C0BC : 95 FA    "  "    bita  X00FA
C0BE : B7 DD 02    "   "    staa  XDD02
        ;
C0C1        LC0C1:
C0C1 : 55    "U"    db  $55
        ;
C0C2 : D5 AF    "  "    bitb  X00AF
C0C4 : AA 0A    "  "    oraa  $0A,x
C0C6 : 2A 97    "* "    bpl  LC05F
C0C8 : DE 56    " V"    ldx  X0056
C0CA : B5 00 08    "   "    bita  X0008
C0CD : EA FF    "  "    orab  $FF,x
C0CF : F7 0A 50    "  P"    stab  X0A50
C0D2 : 95 FE    "  "    bita  X00FE
C0D4 : F5 BA 44    "  D"    bitb  XBA44
        ;
C0D7 : 4B DD 5B 45  "K [E"    db  $4B, $DD, $5B, $45
        ;
C0DB : 2A EA    "* "    bpl  LC0C7
C0DD : 5D    "]"    tstb
C0DE : BD A0 28    "  ("    jsr  LA028
C0E1 : 40    "@"    nega
C0E2 : 40    "@"    nega
C0E3 : F5 FF BB    "   "    bitb  XFFBB
        ;
C0E6 : 00    " "    db  $00
        ;
C0E7 : 4C    "L"    inca
C0E8 : D7 FF    "  "    stab  X00FF
C0EA : AA 0A    "  "    oraa  $0A,x
C0EC : E8 BA    "  "    eorb  $BA,x
        ;
C0EE : FD    " "    db  $FD
        ;
C0EF : 25 11    "% "    bcs  LC102
C0F1 : A2 C7    "  "    sbca  $C7,x
C0F3 : FA AA 83    "   "    orab  XAA83
C0F6        XC0F6:
C0F6 : 44    "D"    lsra
C0F7 : 40    "@"    nega
C0F8 : A0 FE    "  "    suba  $FE,x
C0FA : FF 55 00    " U "    stx  X5500
C0FD : A5 FD    "  "    bita  $FD,x
C0FF        XC0FF:
C0FF : BF 16 01    "   "    sts  X1601
C102        LC102:
C102 : AA F6    "  "    oraa  $F6,x
C104 : DF AA    "  "    stx  X00AA
        ;
C106 : 02    " "    db  $02
        ;
C107 : 69 D2    "i "    rol  $D2,x
        ;
C109 : 5B    "["    db  $5B
        ;
C10A : D5 25    " %"    bitb  X0025
C10C : 08    " "    inx
        ;
C10D : 00 55    " U"    db  $00, $55
        ;
C10F : FF FF 0A    "   "    stx  XFF0A
C112 : C0 B2    "  "    subb  #$B2
C114 : FE D7 25    "  %"    ldx  XD725
C117 : 50    "P"    negb
C118 : D5 DF    "  "    bitb  X00DF
        ;
C11A : 6B    "k"    db  $6B
        ;
C11B : 0A    " "    clv
C11C : 22 55    ""U"    bhi  LC173
        ;
C11E : CD    " "    db  $CD
        ;
C11F        XC11F:
C11F : 56    "V"    rorb
        ;
C120 : EC 02    "  "    db  $EC, $02
        ;
C122 : 08    " "    inx
C123 : 80 EA    "  "    suba  #$EA
C125 : FF B7 01    "   "    stx  XB701
C128 : 98 DA    "  "    eora  X00DA
C12A : FF DA 04    "   "    stx  XDA04
C12D : 6A F5    "j "    dec  $F5,x
C12F        XC12F:
C12F : BF A9 22    "  ""    sts  XA922
C132 : AA EA    "  "    oraa  $EA,x
C134 : 5A    "Z"    decb
        ;
C135 : 55 55 21 00  "UU! "    db  $55, $55, $21, $00
        ;
C139 : A2 FE    "  "    sbca  $FE,x
C13B : FF 1B 80    "   "    stx  X1B80
C13E : 53    "S"    comb
C13F : FF 2F 1B    " / "    stx  X2F1B
C142 : 81 6E    " n"    cmpa  #$6E
        ;
C144 : FD    " "    db  $FD
        ;
C145 : 57    "W"    asrb
        ;
C146 : 55    "U"    db  $55
        ;
C147 : 90 AA    "  "    suba  X00AA
C149 : EA 4A    " J"    orab  $4A,x
C14B : AA 24    " $"    oraa  $24,x
C14D : 01    " "    nop
C14E : 80 D0    "  "    suba  #$D0
C150 : FF BF 06    "   "    stx  XBF06
C153 : A0 E8    "  "    suba  $E8,x
C155 : FF 65 05    " e "    stx  X6505
C158 : A8 D5    "  "    eora  $D5,x
C15A : BF D5 0A    "   "    sts  XD50A
        ;
C15D : 52 55    "RU"    db  $52, $55
        ;
C15F : B5 A4 4A    "  J"    bita  XA44A
C162 : 24 01    "$ "    bcc  LC165
C164 : 80 D4    "  "    suba  #$D4
C166 : FF BF 01    "   "    stx  XBF01
C169 : 28 FA    "( "    bvc  LC165
C16B : 7F 75 02    " u "    clr  X7502
C16E : 5A    "Z"    decb
C16F : F5 5F B5    " _ "    bitb  X5FB5
C172 : 22 69    ""i"    bhi  LC1DD
C174 : D5 AE    "  "    bitb  X00AE
C176 : A4 92    "  "    anda  $92,x
C178 : 24 00    "$ "    bcc  LC17A
        ;
C17A        LC17A:
C17A : 42    "B"    db  $42
        ;
C17B : FA FF 77    "  w"    orab  XFF77
        ;
C17E : 00    " "    db  $00
        ;
C17F : 16    " "    tab
        ;
C180 : FD    " "    db  $FD
        ;
C181 : 5F    "_"    clrb
        ;
C182 : 5B    "["    db  $5B
        ;
C183 : 40    "@"    nega
C184 : 56    "V"    rorb
        ;
C185 : FD    " "    db  $FD
        ;
C186 : AF 56    " V"    sts  $56,x
        ;
C188 : 42    "B"    db  $42
        ;
C189 : AA 7A    " z"    oraa  $7A,x
C18B : AB 2A    " *"    adda  $2A,x
        ;
C18D : 51    "Q"    db  $51
        ;
C18E : 89 80    "  "    adca  #$80
C190 : 20 F5    "  "    bra  LC187
        ;
C192 : FF EF 00    "   "    stx  XEF00
C195 : 0C    " "    clc
C196 : FB DF 36    "  6"    addb  XDF36
        ;
C199 : 04 55 FD    " U "    db  $04, $55, $FD
        ;
C19C        LC19C:
C19C : AF AD    "  "    sts  $AD,x
C19E : 40    "@"    nega
        ;
C19F : 55    "U"    db  $55
        ;
C1A0 : F5 56 55    " VU"    bitb  X5655
C1A3 : 11    " "    cba
C1A4 : 95 80    "  "    bita  X0080
C1A6 : 08    " "    inx
C1A7 : EA FF    "  "    orab  $FF,x
C1A9 : DF 02    "  "    stx  X0002
        ;
C1AB : 18    " "    db  $18
        ;
C1AC : BA 7F 7B    "  {"    oraa  X7F7B
C1AF : 08    " "    inx
C1B0 : 95 FA    "  "    bita  X00FA
C1B2 : BB 3B 21    " ;!"    adda  X3B21
C1B5 : 49    "I"    rola
C1B6 : B5 AB 56    "  V"    bita  XAB56
        ;
C1B9 : 45    "E"    db  $45
        ;
C1BA : 49    "I"    rola
C1BB : 20 02    "  "    bra  LC1BF
        ;
C1BD : B2 FF 7F    "   "    sbca  XFF7F
        ;
C1C0 : 15    " "    db  $15
        ;
C1C1 : A0 A8    "  "    suba  $A8,x
C1C3 : FF B5 5B    "  ["    stx  XB55B
C1C6 : AF 4A    " J"    sts  $4A,x
C1C8 : 50    "P"    negb
C1C9 : 29 05    ") "    bvs  LC1D0
        ;
C1CB : 00    " "    db  $00
        ;
C1CC : F8 F4 7F    "   "    eorb  XF47F
C1CF : 5D    "]"    tstb
        ;
C1D0        LC1D0:
C1D0 : 00 05    "  "    db  $00, $05
        ;
C1D2 : FF FA 0B    "   "    stx  XFA0B
        ;
C1D5 : 15    " "    db  $15
        ;
C1D6 : D0 56    " V"    subb  X0056
C1D8 : FF AA 09    "   "    stx  XAA09
C1DB : 94 E8    "  "    anda  X00E8
C1DD        LC1DD:
C1DD : EF 7E    " ~"    stx  $7E,x
        ;
C1DF : 51    "Q"    db  $51
        ;
C1E0 : 22 AA    "" "    bhi  LC18C
C1E2 : EA 15    "  "    orab  $15,x
C1E4 : 01    " "    nop
        ;
C1E5 : 00    " "    db  $00
        ;
C1E6 : C0 BF    "  "    subb  #$BF
C1E8 : FF 55 01    " U "    stx  X5501
C1EB : 28 FA    "( "    bvc  LC1E7
C1ED : B7 5F 21    " _!"    staa  X5F21
C1F0 : 01    " "    nop
C1F1 : 5D    "]"    tstb
        ;
C1F2 : FD    " "    db  $FD
        ;
C1F3 : 57    "W"    asrb
C1F4 : 4D    "M"    tsta
C1F5 : 20 A5    "  "    bra  LC19C
        ;
C1F7 : FF BD 45    "  E"    stx  XBD45
C1FA : 84 A8    "  "    anda  #$A8
        ;
C1FC : 12 05 00    "   "    db  $12, $05, $00
        ;
C1FF : F8 F9 BF    "   "    eorb  XF9BF
        ;
C202 : 1E 00 05    "   "    db  $1E, $00, $05
        ;
C205 : FF FA 17    "   "    stx  XFA17
        ;
C208 : 15    " "    db  $15
        ;
C209 : A0 55    " U"    suba  $55,x
C20B : FF B5 05    "   "    stx  XB505
C20E : AA F4    "  "    oraa  $F4,x
C210 : B7 AD 88    "   "    staa  XAD88
C213 : 08    " "    inx
C214 : 11    " "    cba
        ;
C215 : 00 00 FC    "   "    db  $00, $00, $FC
        ;
C218 : F9 5F 1F    " _ "    adcb  X5F1F
C21B : 80 02    "  "    suba  #$02
C21D : FF F5 0F    "   "    stx  XF50F
        ;
C220 : 1A    " "    db  $1A
        ;
C221 : C0 53    " S"    subb  #$53
C223 : FF B9 03    "   "    stx  XB903
C226 : 5D    "]"    tstb
C227 : D8 57    " W"    eorb  X0057
C229 : 5D    "]"    tstb
C22A : A4 02    "  "    anda  $02,x
C22C : 08    " "    inx
        ;
C22D : 00    " "    db  $00
        ;
C22E : C0 BF    "  "    subb  #$BF
C230 : FF F3 00    "   "    stx  XF300
C233 : A0 F0    "  "    suba  $F0,x
C235 : FF 7F 20    "   "    stx  X7F20
        ;
C238 : 05    " "    db  $05
        ;
C239 : 78 F5 BF    "x  "    asl  XF5BF
C23C        LC23C:
C23C : BA 20 8B    "   "    oraa  X208B
C23F        XC23F:
C23F : BC 55 17    " U "    cpx  X5517
C242 : 48    "H"    asla
        ;
C243 : 00 00    "  "    db  $00, $00
        ;
C245 : E0 DF    "  "    subb  $DF,x
C247 : FF F9 00    "   "    stx  XF900
C24A : 20 F0    "  "    bra  LC23C
        ;
C24C : FF FF 40    "  @"    stx  XFF40
C24F : 01    " "    nop
C250 : B8 F5 FF    "   "    eora  XF5FF
C253 : BA 02 0A    "   "    oraa  X020A
C256 : F9 D5 16    "   "    adcb  XD516
C259 : 20 00    "  "    bra  LC25B
        ;
C25B        LC25B:
C25B : 00    " "    db  $00
        ;
C25C : FE FB 1F    "   "    ldx  XFB1F
C25F : 0F    " "    sei
        ;
C260 : 00    " "    db  $00
        ;
C261 : 8A FE    "  "    oraa  #$FE
C263 : FF 1F 90    "   "    stx  X1F90
        ;
C266 : 00 7B    " {"    db  $00, $7B
        ;
C268 : FB 3F 2D    " ?-"    addb  X3F2D
C26B : 40    "@"    nega
C26C : 25 7F    "% "    bcs  LC2ED
        ;
C26E : 55 05 00 00  "U   "    db  $55, $05, $00, $00
        ;
C272 : F0 FF FF    "   "    subb  XFFFF
C275 : 70 01 C0    "p  "    neg  X01C0
C278 : F4 FF 7F    "   "    andb  XFF7F
C27B : 01    " "    nop
C27C : 08    " "    inx
C27D : F8 DF 7F    "   "    eorb  XDF7F
C280 : 89 04    "  "    adca  #$04
C282 : D8 DA    "  "    eorb  X00DA
C284 : 9F 04    "  "    sts  X0004
        ;
C286 : 00 00    "  "    db  $00, $00
        ;
C288 : C0 FF    "  "    subb  #$FF
C28A : FF 07 16    "   "    stx  X0716
        ;
C28D : 00    " "    db  $00
        ;
C28E : AF FF    "  "    sts  $FF,x
C290 : 9F 0D    "  "    sts  X000D
        ;
C292 : 00 93    "  "    db  $00, $93
        ;
C294 : FF FF 2A    "  *"    stx  XFF2A
C297 : 80 92    "  "    suba  #$92
C299 : EE AB    "  "    ldx  $AB,x
C29B : 26 00    "& "    bne  LC29D
        ;
C29D        LC29D:
C29D : 00 00    "  "    db  $00, $00
        ;
C29F : FF FF 3F    "  ?"    stx  XFF3F
C2A2 : 40    "@"    nega
        ;
C2A3 : 00    " "    db  $00
        ;
C2A4 : FE FE 7F    "   "    ldx  XFE7F
C2A7 : 81 02    "  "    cmpa  #$02
C2A9 : F8 ED FF    "   "    eorb  XEDFF
        ;
C2AC : 05 05    "  "    db  $05, $05
        ;
C2AE : E4 5D    " ]"    andb  $5D,x
C2B0 : BD 20 02    "   "    jsr  L2002
        ;
C2B3 : 00 00 FC    "   "    db  $00, $00, $FC
        ;
C2B6 : BF FF 00    "   "    sts  XFF00
C2B9 : 06    " "    tap
C2BA : F0 FF FF    "   "    subb  XFFFF
C2BD : 0A    " "    clv
C2BE : A0 C0    "  "    suba  $C0,x
C2C0 : FF EF 15    "   "    stx  XEF15
C2C3 : 40    "@"    nega
        ;
C2C4 : 55 FD    "U "    db  $55, $FD
        ;
C2C6        LC2C6:
C2C6 : 0B    " "    sev
        ;
C2C7 : 15    " "    db  $15
        ;
C2C8 : 80 00    "  "    suba  #$00
        ;
C2CA : 00    " "    db  $00
        ;
C2CB : F4 FF FE    "   "    andb  XFFFE
        ;
C2CE : 03    " "    db  $03
        ;
C2CF : 10    " "    sba
C2D0 : E0 FF    "  "    subb  $FF,x
C2D2 : 5F    "_"    clrb
C2D3 : 0F    " "    sei
        ;
C2D4        LC2D4:
C2D4 : 00    " "    db  $00
        ;
C2D5 : 2F FD    "/ "    ble  LC2D4
C2D7 : 7F A9 00    "   "    clr  XA900
C2DA : EA 57    " W"    orab  $57,x
C2DC : DF 00    "  "    stx  X0000
        ;
C2DE : 05 00    "  "    db  $05, $00
        ;
C2E0 : 01    " "    nop
C2E1 : F0 FF FD    "   "    subb  XFFFD
C2E4 : 07    " "    tpa
C2E5 : 40    "@"    nega
C2E6 : 81 FF    "  "    cmpa  #$FF
C2E8 : 7F 69 00    " i "    clr  X6900
C2EB : F8 EB FF    "   "    eorb  XEBFF
        ;
C2EE : 41    "A"    db  $41
        ;
C2EF : 09    " "    dex
C2F0 : 64 7F    "d "    lsr  $7F,x
C2F2 : E9 05    "  "    adcb  $05,x
C2F4 : 50    "P"    negb
        ;
C2F5 : 00    " "    db  $00
        ;
C2F6 : 80 C0    "  "    suba  #$C0
C2F8 : FF F7 1F    "   "    stx  XF71F
        ;
C2FB : 00    " "    db  $00
        ;
C2FC : 22 FF    "" "    bhi  LC2FD
C2FE : FF A1 02    "   "    stx  XA102
C301 : E0 BF    "  "    subb  $BF,x
C303 : FF 0B 48    "  H"    stx  X0B48
C306 : 92 FE    "  "    sbca  X00FE
C308 : 96 56    " V"    ldaa  $56
        ;
C30A : 00    " "    db  $00
        ;
C30B : 01    " "    nop
        ;
C30C : 00    " "    db  $00
        ;
C30D : 80 FF    "  "    suba  #$FF
C30F : EF 3F    " ?"    stx  $3F,x
        ;
C311 : 00 14 FD    "   "    db  $00, $14, $FD
        ;
C314 : FF 07 1A    "   "    stx  X071A
C317 : C0 FF    "  "    subb  #$FF
C319 : EE 2F    " /"    ldx  $2F,x
C31B : 20 A9    "  "    bra  LC2C6
        ;
C31D : DA 37    " 7"    orab  X0037
C31F : A9 08    "  "    adca  $08,x
        ;
C321 : 00 00 00    "   "    db  $00, $00, $00
        ;
C324 : FF BF FF    "   "    stx  XBFFF
        ;
C327 : 00    " "    db  $00
        ;
C328 : 50    "P"    negb
C329 : F9 FF 0F    "   "    adcb  XFF0F
C32C : 70 00 FF    "p  "    neg  X00FF
C32F : F7 2F 10    " / "    stab  X2F10
C332 : A9 B6    "  "    adca  $B6,x
        ;
C334 : ED    " "    db  $ED
        ;
C335 : 92 88    "  "    sbca  X0088
        ;
C337 : 00 00 00 FC  "    "    db  $00, $00, $00, $FC
        ;
C33B : 7F FF 01    "   "    clr  XFF01
C33E : A0 F5    "  "    suba  $F5,x
C340 : FF 3F 80    " ? "    stx  X3F80
        ;
C343 : 05    " "    db  $05
        ;
C344 : FA FF 3D    "  ="    orab  XFF3D
C347 : 01    " "    nop
C348 : A5 DE    "  "    bita  $DE,x
C34A : AA 15    "  "    oraa  $15,x
C34C : 22 00    "" "    bhi  LC34E
        ;
C34E        LC34E:
C34E : 00 00    "  "    db  $00, $00
        ;
C350 : FA FF FD    "   "    orab  XFFFD
        ;
C353 : 03    " "    db  $03
        ;
C354 : 80 DB    "  "    suba  #$DB
C356 : FF 7F 00    "   "    stx  X7F00
C359 : 16    " "    tab
C35A : F4 FF 2F    "  /"    andb  XFF2F
C35D : 81 48    " H"    cmpa  #$48
C35F : FB 55 2B    " U+"    addb  X552B
C362 : 44    "D"    lsra
        ;
C363 : 00 00 00 FC  "    "    db  $00, $00, $00, $FC
        ;
C367 : 7F FE 03    "   "    clr  XFE03
C36A : C0 FB    "  "    subb  #$FB
C36C : FF 5F 00    " _ "    stx  X5F00
C36F : 0B    " "    sev
        ;
C370 : FD    " "    db  $FD
        ;
C371 : FF 4D 90    " M "    stx  X4D90
C374 : C4 7E    " ~"    andb  #$7E
        ;
C376 : 55    "U"    db  $55
        ;
C377 : 89 24    " $"    adca  #$24
C379 : 10    " "    sba
        ;
C37A : 00 00    "  "    db  $00, $00
        ;
C37C : FE 7F FF    "   "    ldx  X7FFF
        ;
C37F : 00    " "    db  $00
        ;
C380 : 80 FD    "  "    suba  #$FD
C382 : FF 3F 80    " ? "    stx  X3F80
        ;
C385 : 02 FD    "  "    db  $02, $FD
        ;
C387 : FF 2B 12    " + "    stx  X2B12
        ;
C38A : 51    "Q"    db  $51
        ;
C38B : 6D AD    "m "    tst  $AD,x
C38D : 2A 0B    "* "    bpl  LC39A
        ;
C38F : 00 00    "  "    db  $00, $00
        ;
C391 : 80 FF    "  "    suba  #$FF
C393 : FF 3F 00    " ? "    stx  X3F00
C396 : E0 BF    "  "    subb  $BF,x
C398 : FB 0F E0    "   "    addb  X0FE0
C39B : 81 FF    "  "    cmpa  #$FF
C39D : 77 05 2A    "w *"    asr  X052A
C3A0 : FA 4B 36    " K6"    orab  X4B36
C3A3 : C0 05    "  "    subb  #$05
C3A5 : 08    " "    inx
        ;
C3A6 : 00    " "    db  $00
        ;
C3A7 : F0 FF F7    "   "    subb  XFFF7
C3AA : 0F    " "    sei
        ;
C3AB : 00 FC    "  "    db  $00, $FC
        ;
C3AD : BF FF 00    "   "    sts  XFF00
C3B0 : C0 AB    "  "    subb  #$AB
C3B2 : FF 3F 01    " ? "    stx  X3F01
C3B5 : 24 F5    "$ "    bcc  LC3AC
        ;
C3B7 : 5B    "["    db  $5B
        ;
C3B8 : AB 90    "  "    adda  $90,x
        ;
C3BA : 00 00 00 FC  "    "    db  $00, $00, $00, $FC
        ;
C3BE : FF F7 02    "   "    stx  XF702
        ;
C3C1 : 00    " "    db  $00
        ;
C3C2 : FE FF 5F    "  _"    ldx  XFF5F
        ;
C3C5 : 00    " "    db  $00
        ;
C3C6 : 60 F5    "` "    neg  $F5,x
C3C8 : FF 3F 50    " ?P"    stx  X3F50
        ;
C3CB : 21    "!"    db  $21
        ;
C3CC : DA AA    "  "    orab  X00AA
C3CE : 56    "V"    rorb
C3CF : 37    "7"    pshb
        ;
C3D0 : 00 00 00    "   "    db  $00, $00, $00
        ;
C3D3 : FF FF 2F    "  /"    stx  XFF2F
        ;
C3D6 : 00    " "    db  $00
        ;
C3D7 : C0 FF    "  "    subb  #$FF
C3D9 : 7F 0B 00    "   "    clr  X0B00
        ;
C3DC : FC    " "    db  $FC
        ;
C3DD : B6 FE A3    "   "    ldaa  XFEA3
C3E0 : 0A    " "    clv
C3E1 : AF A0    "  "    sts  $A0,x
        ;
C3E3 : 15    " "    db  $15
        ;
C3E4 : F4 15 04    "   "    andb  X1504
        ;
C3E7 : 00    " "    db  $00
        ;
C3E8 : C0 FF    "  "    subb  #$FF
C3EA : FF 12 00    "   "    stx  X1200
C3ED : F0 FF B7    "   "    subb  XFFB7
C3F0 : 0A    " "    clv
        ;
C3F1 : 00    " "    db  $00
        ;
C3F2 : FB AF F5    "   "    addb  XAFF5
        ;
C3F5 : 03    " "    db  $03
        ;
C3F6 : 7E 59 05    "~Y "    jmp  L5905
        ;
C3F9 : 49    "I"    rola
C3FA : E8 0D    "  "    eorb  $0D,x
        ;
C3FC : 00 00    "  "    db  $00, $00
        ;
C3FE : F8 FF 0F    "   "    eorb  XFF0F
        ;
C401 : 15 00    "  "    db  $15, $00
        ;
C403 : FE FF 91    "   "    ldx  XFF91
C406 : 0A    " "    clv
C407 : A0 FF    "  "    suba  $FF,x
C409 : 17    " "    tba
C40A : 95 0B    "  "    bita  X000B
C40C : FA 8F 2A    "  *"    orab  X8F2A
C40F : 80 5A    " Z"    suba  #$5A
C411 : 8A 00    "  "    oraa  #$00
        ;
C413 : 00    " "    db  $00
        ;
C414 : FE FF 43    "  C"    ldx  XFF43
        ;
C417 : 05    " "    db  $05
        ;
C418 : 80 FF    "  "    suba  #$FF
C41A : FF 50 01    " P "    stx  X5001
C41D : D4 FF    "  "    andb  X00FF
C41F : 57    "W"    asrb
C420 : 22 54    ""T"    bhi  LC476
C422 : F5 3F 54    " ?T"    bitb  X3F54
C425 : 01    " "    nop
C426 : B4 08 08    "   "    anda  X0808
        ;
C429 : 00    " "    db  $00
        ;
C42A : FF FF 43    "  C"    stx  XFF43
        ;
C42D : 05    " "    db  $05
        ;
C42E : 80 FF    "  "    suba  #$FF
C430 : FF AA 02    "   "    stx  XAA02
C433 : A0 FF    "  "    suba  $FF,x
C435 : B7 25 60    " %`"    staa  X2560
C438 : 27 FF    "' "    beq  LC439
C43A : 81 26    " &"    cmpa  #$26
C43C : 50    "P"    negb
        ;
C43D : 05    " "    db  $05
        ;
C43E : 08    " "    inx
        ;
C43F : 00    " "    db  $00
        ;
C440 : FF FF EF    "   "    stx  XFFEF
C443 : 0A    " "    clv
        ;
C444 : 00 FC    "  "    db  $00, $FC
        ;
C446 : BF FB 2F    "  /"    sts  XFB2F
C449 : 40    "@"    nega
C44A : 54    "T"    lsrb
C44B : DB 5A    " Z"    addb  X005A
C44D : F5 1F F4    "   "    bitb  X1FF4
C450 : 01    " "    nop
C451 : 58    "X"    aslb
        ;
C452 : 51 15    "Q "    db  $51, $15
        ;
C454 : 01    " "    nop
C455 : 80 FF    "  "    suba  #$FF
C457 : FF F7 4B    "  K"    stx  XF74B
        ;
C45A : 00    " "    db  $00
        ;
C45B : 68 DF    "h "    asl  $DF,x
C45D : 7F FF 02    "   "    clr  XFF02
C460 : A5 94    "  "    bita  $94,x
        ;
C462 : 12    " "    db  $12
        ;
C463 : F5 FF E8    "   "    bitb  XFFE8
        ;
C466 : 05    " "    db  $05
        ;
C467 : 80 12    "  "    suba  #$12
        ;
C469 : 55    "U"    db  $55
        ;
C46A : 01    " "    nop
C46B : E0 FF    "  "    subb  $FF,x
C46D : FF BB 16    "   "    stx  XBB16
        ;
C470 : 00    " "    db  $00
        ;
C471 : EA F5    "  "    orab  $F5,x
C473 : FE DF 12    "   "    ldx  XDF12
C476        LC476:
C476 : 58    "X"    aslb
        ;
C477 : 15 51    " Q"    db  $15, $51
        ;
C479 : A9 FF    "  "    adca  $FF,x
        ;
C47B : A3    " "    db  $A3
        ;
C47C : 07    " "    tpa
        ;
C47D : 00 15    "  "    db  $00, $15
        ;
C47F : 54    "T"    lsrb
C480 : 01    " "    nop
C481 : E8 FF    "  "    eorb  $FF,x
C483 : EF 5F    " _"    stx  $5F,x
        ;
C485 : 15 00    "  "    db  $15, $00
        ;
C487 : F2 BD DF    "   "    sbcb  XBDDF
C48A : 7F 09 91    "   "    clr  X0991
C48D : 96 D0    "  "    ldaa  $D0
C48F : AA FE    "  "    oraa  $FE,x
C491 : 07    " "    tpa
C492 : 3B    ";"    rti
        ;
C493 : 00    " "    db  $00
        ;
C494 : 4C    "L"    inca
C495 : 50    "P"    negb
        ;
C496 : 04    " "    db  $04
        ;
C497 : B8 FF 7F    "   "    eora  XFF7F
C49A : 7D 0D 01    "}  "    tst  X0D01
C49D : E8 FD    "  "    eorb  $FD,x
C49F : BE FF 09    "   "    lds  XFF09
C4A2 : 44    "D"    lsra
        ;
C4A3 : 55    "U"    db  $55
        ;
C4A4 : 49    "I"    rola
        ;
C4A5 : 55 FD    "U "    db  $55, $FD
        ;
C4A7 : 0F    " "    sei
C4A8 : 7C 00 58    "| X"    inc  X0058
        ;
C4AB : 42    "B"    db  $42
        ;
C4AC : 08    " "    inx
C4AD : 68 FF    "h "    asl  $FF,x
C4AF : FF FA 16    "   "    stx  XFA16
        ;
C4B2 : 02    " "    db  $02
        ;
C4B3 : 60 FF    "` "    neg  $FF,x
C4B5 : EF F7    "  "    stx  $F7,x
        ;
C4B7 : 15    " "    db  $15
        ;
C4B8 : 08    " "    inx
        ;
C4B9 : 55 55 52 FD  "UUR "    db  $55, $55, $52, $FD
C4BD : 1F    " "    db  $1F
        ;
C4BE : F0 01 50    "  P"    subb  X0150
C4C1 : 89 08    "  "    adca  #$08
C4C3 : 50    "P"    negb
C4C4 : FF FF F3    "   "    stx  XFFF3
C4C7 : 2D 04    "- "    blt  LC4CD
C4C9 : 80 F7    "  "    suba  #$F7
C4CB : FF DE AB    "   "    stx  XDEAB
        ;
C4CE : 00    " "    db  $00
        ;
C4CF : 4A    "J"    deca
C4D0 : AB 92    "  "    adda  $92,x
        ;
C4D2 : FC    " "    db  $FC
        ;
C4D3 : 3F    "?"    swi
C4D4 : E0 05    "  "    subb  $05,x
C4D6 : A0 12    "  "    suba  $12,x
C4D8 : 11    " "    cba
C4D9 : A0 FE    "  "    suba  $FE,x
C4DB : FF D7 5D    "  ]"    stx  XD75D
C4DE : 10    " "    sba
        ;
C4DF : 00    " "    db  $00
        ;
C4E0 : FB FF B7    "   "    addb  XFFB7
C4E3 : AE 20    "  "    lds  $20,x
C4E5 : 50    "P"    negb
C4E6 : AD 92    "  "    jsr  $92,x            ;INFO: index jump
        ;
C4E8 : FC    " "    db  $FC
        ;
C4E9 : 3F    "?"    swi
C4EA : D0 01    "  "    subb  X0001
C4EC : 50    "P"    negb
C4ED : 25 09    "% "    bcs  LC4F8
        ;
C4EF : 02    " "    db  $02
        ;
C4F0 : FA FF DF    "   "    orab  XFFDF
        ;
C4F3 : 6B    "k"    db  $6B
        ;
C4F4 : 01    " "    nop
        ;
C4F5 : 00    " "    db  $00
        ;
C4F6        XC4F6:
C4F6 : DE FF    "  "    ldx  X00FF
C4F8        LC4F8:
C4F8 : AF AE    "  "    sts  $AE,x
        ;
C4FA : 42    "B"    db  $42
        ;
C4FB : 40    "@"    nega
C4FC : 56    "V"    rorb
C4FD : 95 FE    "  "    bita  X00FE
C4FF : 3F    "?"    swi
C500 : A8 00    "  "    eora  $00,x
C502 : A8 A5    "  "    eora  $A5,x
C504 : 08    " "    inx
        ;
C505 : 02    " "    db  $02
        ;
C506 : F4 FF 7F    "   "    andb  XFF7F
C509 : 57    "W"    asrb
C50A : 01    " "    nop
        ;
C50B : 00 FD    "  "    db  $00, $FD
        ;
C50D : FF 5B AD    " [ "    stx  X5BAD
        ;
C510 : 42    "B"    db  $42
        ;
C511 : 40    "@"    nega
C512 : B6 4A FF    " J "    ldaa  X4AFF
C515 : 2F 54    "/T"    ble  LC56B
        ;
C517 : 00    " "    db  $00
        ;
C518 : 74 55 10    "tU "    lsr  X5510
        ;
C51B : 00    " "    db  $00
        ;
C51C : F8 FF FF    "   "    eorb  XFFFF
C51F : AA 00    "  "    oraa  $00,x
C521 : 80 F6    "  "    suba  #$F6
C523 : FF AF 2A    "  *"    stx  XAF2A
        ;
C526 : 05    " "    db  $05
        ;
C527 : A0 5A    " Z"    suba  $5A,x
C529 : B7 FF 43    "  C"    staa  XFF43
        ;
C52C : 05    " "    db  $05
        ;
C52D : 80 DD    "  "    suba  #$DD
        ;
C52F : 15 04 00 FC  "    "    db  $15, $04, $00, $FC
        ;
C533 : FF 7F 95    "   "    stx  X7F95
        ;
C536 : 00    " "    db  $00
        ;
C537 : 40    "@"    nega
C538 : FF FF 2B    "  +"    stx  XFF2B
C53B : 2A 05    "* "    bpl  LC542
C53D : A8 7A    " z"    eora  $7A,x
C53F : FB BF 50    "  P"    addb  XBF50
        ;
C542        LC542:
C542 : 00    " "    db  $00
        ;
C543 : A8 BF    "  "    eora  $BF,x
        ;
C545 : 05    " "    db  $05
        ;
C546 : 01    " "    nop
        ;
C547 : 00 FC    "  "    db  $00, $FC
        ;
C549 : FF 7F 11    "   "    stx  X7F11
        ;
C54C : 00    " "    db  $00
        ;
C54D : A8 FF    "  "    eora  $FF,x
C54F : FF 52 14    " R "    stx  X5214
        ;
C552 : 41    "A"    db  $41
        ;
C553 : D4 BE    "  "    andb  X00BE
C555 : FF 07 09    "   "    stx  X0709
C558 : 01    " "    nop
C559 : EA 7F    "  "    orab  $7F,x
C55B : 82 00    "  "    sbca  #$00
        ;
C55D : 00    " "    db  $00
        ;
C55E : FA FF 3F    "  ?"    orab  XFF3F
        ;
C561 : 02    " "    db  $02
        ;
C562 : 20 72    " r"    bra  LC5D6
        ;
C564 : FF FF 20    "   "    stx  XFF20
C567 : 94 24    " $"    anda  X0024
        ;
C569 : ED    " "    db  $ED
        ;
C56A : EF 7F    "  "    stx  $7F,x
C56C : 81 28    " ("    cmpa  #$28
C56E : 82 FE    "  "    sbca  #$FE
C570 : 2F 00    "/ "    ble  LC572
        ;
C572        LC572:
C572 : 00 00    "  "    db  $00, $00
        ;
C574 : FF FF 0F    "   "    stx  XFF0F
        ;
C577 : 00    " "    db  $00
        ;
C578 : A1 FA    "  "    cmpa  $FA,x
C57A : FF 2F 80    " / "    stx  X2F80
C57D : 54    "T"    lsrb
C57E : D5 FE    "  "    bitb  X00FE
C580 : FE 47 20    " G "    ldx  X4720
        ;
C583 : 55    "U"    db  $55
        ;
C584 : A4 FF    "  "    anda  $FF,x
        ;
C586 : 15 00 00    "   "    db  $15, $00, $00
        ;
C589 : 80 FF    "  "    suba  #$FF
C58B : FF 03 40    "  @"    stx  X0340
C58E : E9 FE    "  "    adcb  $FE,x
C590 : FF 02 40    "  @"    stx  X0240
C593 : 7F D7 2A    "  *"    clr  XD72A
        ;
C596 : DD 55    " U"    db  $DD, $55
        ;
C598 : EB 0A    "  "    addb  $0A,x
C59A : 80 FE    "  "    suba  #$FE
        ;
C59C : 4B    "K"    db  $4B
C59D        XC59D:
C59D : 00 00    "  "    db  $00, $00
        ;
C59F : C0 FF    "  "    subb  #$FF
C5A1 : FF 00 40    "  @"    stx  X0040
C5A4 : FF FF 07    "   "    stx  XFF07
        ;
C5A7 : 00    " "    db  $00
        ;
C5A8 : F8 FF 45    "  E"    eorb  XFF45
C5AB : 80 FA    "  "    suba  #$FA
C5AD : 7F 4B 00    " K "    clr  X4B00
C5B0 : A4 7F    "  "    anda  $7F,x
        ;
C5B2 : 13 00 00    "   "    db  $13, $00, $00
        ;
C5B5 : E0 FF    "  "    subb  $FF,x
C5B7 : 3F    "?"    swi
        ;
C5B8 : 00    " "    db  $00
        ;
C5B9 : F0 FF DF    "   "    subb  XFFDF
        ;
C5BC : 00 00    "  "    db  $00, $00
        ;
C5BE : FF 7F 00    "   "    stx  X7F00
C5C1 : 48    "H"    asla
C5C2 : FF BF 84    "   "    stx  XBF84
C5C5 : 90 6A    " j"    suba  X006A
        ;
C5C7 : 55 04 42 00  "U B "    db  $55, $04, $42, $00
        ;
C5CB : F0 FF 1F    "   "    subb  XFF1F
        ;
C5CE : 00 FC    "  "    db  $00, $FC
        ;
C5D0 : FF 5E 00    " ^ "    stx  X5E00
C5D3 : C0 FF    "  "    subb  #$FF
        ;
C5D5 : 1F 00    "  "    db  $1F, $00
        ;
C5D7 : DA FF    "  "    orab  X00FF
C5D9 : AB 88    "  "    adda  $88,x
C5DB : 6C 5B    "l["    inc  $5B,x
C5DD : 10    " "    sba
C5DE : 48    "H"    asla
C5DF : 09    " "    dex
        ;
C5E0 : 04    " "    db  $04
        ;
C5E1 : F0 FF 1F    "   "    subb  XFF1F
        ;
C5E4 : 00 FC    "  "    db  $00, $FC
        ;
C5E6 : FF 17 00    "   "    stx  X1700
C5E9 : E0 FF    "  "    subb  $FF,x
C5EB : 0F    " "    sei
        ;
C5EC : 00 FD    "  "    db  $00, $FD
        ;
C5EE : BF 25 51    " %Q"    sts  X2551
C5F1 : BD 15 80    "   "    jsr  L1580
C5F4 : D4 0A    "  "    andb  X000A
        ;
C5F6 : 00    " "    db  $00
        ;
C5F7 : F0 FF 0F    "   "    subb  XFF0F
        ;
C5FA : 00    " "    db  $00
        ;
C5FB : FE FF 0D    "   "    ldx  XFF0D
        ;
C5FE : 00    " "    db  $00
        ;
C5FF : F0 FF 07    "   "    subb  XFF07
C602 : 80 FD    "  "    suba  #$FD
C604 : BF 22 69    " "i"    sts  X2269
C607 : DF 02    "  "    stx  X0002
C609 : 40    "@"    nega
C60A : BD 05 00    "   "    jsr  L0500
C60D : F0 FF 1F    "   "    subb  XFF1F
        ;
C610 : 00    " "    db  $00
        ;
C611 : FE FF 09    "   "    ldx  XFF09
        ;
C614 : 00    " "    db  $00
        ;
C615 : F4 FF 0F    "   "    andb  XFF0F
        ;
C618 : 00    " "    db  $00
        ;
C619 : FF 3F 89    " ? "    stx  X3F89
C61C : EA BB    "  "    orab  $BB,x
        ;
C61E : 02    " "    db  $02
        ;
C61F : 40    "@"    nega
C620 : F7 05 00    "   "    stab  X0500
C623 : F0 FF 1F    "   "    subb  XFF1F
        ;
C626 : 00 FC    "  "    db  $00, $FC
        ;
C628 : FF 05 00    "   "    stx  X0500
C62B : FA FF 07    "   "    orab  XFF07
        ;
C62E : 00    " "    db  $00
        ;
C62F : FF BF 88    "   "    stx  XBF88
C632 : EA DF    "  "    orab  $DF,x
        ;
C634 : 00    " "    db  $00
        ;
C635 : A0 FD    "  "    suba  $FD,x
        ;
C637 : 05 00    "  "    db  $05, $00
        ;
C639 : E8 FF    "  "    eorb  $FF,x
        ;
C63B : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
C63E : FF 03 00    "   "    stx  X0300
C641 : FE FF 0B    "   "    ldx  XFF0B
        ;
C644 : 00    " "    db  $00
        ;
C645 : FF 3F 11    " ? "    stx  X3F11
        ;
C648 : ED    " "    db  $ED
        ;
C649 : BF 02 40    "  @"    sts  X0240
C64C : FF 05 00    "   "    stx  X0500
C64F : D4 FF    "  "    andb  X00FF
        ;
C651 : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
C654 : FF 03 00    "   "    stx  X0300
        ;
C657 : FD    " "    db  $FD
        ;
C658 : FF 03 40    "  @"    stx  X0340
C65B : FF 5F 48    " _H"    stx  X5F48
C65E : DE 7F    "  "    ldx  X007F
C660 : 01    " "    nop
C661 : C0 7F    "  "    subb  #$7F
        ;
C663 : 05 00    "  "    db  $05, $00
        ;
C665 : F4 FF 0F    "   "    andb  XFF0F
        ;
C668 : 00    " "    db  $00
        ;
C669 : FE FF 01    "   "    ldx  XFF01
C66C : 80 FE    "  "    suba  #$FE
C66E : FF 01 E0    "   "    stx  X01E0
C671 : FF 27 A8    " ' "    stx  X27A8
C674 : FE 5F 01    " _ "    ldx  X5F01
C677 : 60 FF    "` "    neg  $FF,x
        ;
C679 : 00 00    "  "    db  $00, $00
        ;
C67B : F5 FF 07    "   "    bitb  XFF07
        ;
C67E : 00    " "    db  $00
        ;
C67F : FF FF 00    "   "    stx  XFF00
C682 : A0 FE    "  "    suba  $FE,x
C684 : FF 00 F0    "   "    stx  X00F0
C687 : FF 85 A8    "   "    stx  X85A8
C68A : FF 2F 00    " / "    stx  X2F00
C68D : D8 3F    " ?"    eorb  X003F
C68F : 01    " "    nop
C690 : 80 FC    "  "    suba  #$FC
C692 : FF 03 80    "   "    stx  X0380
C695 : FF 7F 00    "   "    stx  X7F00
C698 : D0 FF    "  "    subb  X00FF
C69A : 3F    "?"    swi
        ;
C69B : 00 FC    "  "    db  $00, $FC
        ;
C69D : 7F 01 EA    "   "    clr  X01EA
C6A0 : FF 17 00    "   "    stx  X1700
C6A3 : FA 5B 00    " [ "    orab  X5B00
C6A6 : 40    "@"    nega
C6A7 : F9 FF 03    "   "    adcb  XFF03
C6AA : 80 FF    "  "    suba  #$FF
C6AC : 3F    "?"    swi
        ;
C6AD : 00    " "    db  $00
        ;
C6AE : D0 FF    "  "    subb  X00FF
C6B0 : 3F    "?"    swi
        ;
C6B1 : 00 FC    "  "    db  $00, $FC
        ;
C6B3 : 7F 80 F4    "   "    clr  X80F4
C6B6 : FF 0B 00    "   "    stx  X0B00
C6B9 : FE 2E 00    " . "    ldx  X2E00
C6BC : A0 FA    "  "    suba  $FA,x
C6BE : FF 03 C0    "   "    stx  X03C0
C6C1 : FF 1F 00    "   "    stx  X1F00
C6C4 : D4 FF    "  "    andb  X00FF
        ;
C6C6 : 1F 00    "  "    db  $1F, $00
        ;
C6C8 : FE 3F 20    " ? "    ldx  X3F20
C6CB : F5 FF 03    "   "    bitb  XFF03
C6CE : 80 FE    "  "    suba  #$FE
C6D0 : 8E 00 90    "   "    lds  #$0090
C6D3        LC6D3:
C6D3 : D4 FF    "  "    andb  X00FF
C6D5 : 07    " "    tpa
C6D6 : 80 FF    "  "    suba  #$FF
        ;
C6D8 : 1F    " "    db  $1F
        ;
C6D9 : 40    "@"    nega
C6DA : A1 FF    "  "    cmpa  $FF,x
C6DC : 7F 00 FC    "   "    clr  X00FC
C6DF : 3F    "?"    swi
        ;
C6E0 : 41 ED    "A "    db  $41, $ED
        ;
C6E2 : FF 05 00    "   "    stx  X0500
C6E5 : FB 2F 00    " / "    addb  X2F00
C6E8 : 20 E9    "  "    bra  LC6D3
        ;
C6EA : FF 0F 00    "   "    stx  X0F00
C6ED : FF 1F 40    "  @"    stx  X1F40
C6F0 : D1 FE    "  "    cmpb  X00FE
C6F2 : 7F 00 FC    "   "    clr  X00FC
C6F5 : 3F    "?"    swi
C6F6 : 49    "I"    rola
C6F7 : F5 FF 02    "   "    bitb  XFF02
C6FA : 80 FE    "  "    suba  #$FE
C6FC : 2F 00    "/ "    ble  LC6FE
C6FE        LC6FE:
C6FE : 40    "@"    nega
C6FF : D2 FF    "  "    sbcb  X00FF
C701 : 0F    " "    sei
        ;
C702 : 00    " "    db  $00
        ;
C703 : FF 1F 10    "   "    stx  X1F10
        ;
C706 : 45    "E"    db  $45
        ;
C707 : FF 7F 00    "   "    stx  X7F00
C70A : F8 BF 54    "  T"    eorb  XBF54
C70D : B5 7E 03    " ~ "    bita  X7E03
C710 : 80 FD    "  "    suba  #$FD
        ;
C712 : 1F 00 00    "   "    db  $1F, $00, $00
        ;
C715 : D9 FF    "  "    adcb  X00FF
C717 : 07    " "    tpa
C718 : 80 FF    "  "    suba  #$FF
        ;
C71A : 1F 04    "  "    db  $1F, $04
        ;
C71C : E1 FF    "  "    cmpb  $FF,x
        ;
C71E : 1F 00    "  "    db  $1F, $00
        ;
C720 : FE AF 6A    "  j"    ldx  XAF6A
C723 : AA BD    "  "    oraa  $BD,x
C725 : 01    " "    nop
C726 : D0 FF    "  "    subb  X00FF
C728 : 07    " "    tpa
        ;
C729 : 00    " "    db  $00
        ;
C72A : 40    "@"    nega
        ;
C72B : FD    " "    db  $FD
        ;
C72C : FF 01 C0    "   "    stx  X01C0
C72F : FF 0F 01    "   "    stx  X0F01
C732 : F1 FF 0F    "   "    cmpb  XFF0F
C735 : 80 FF    "  "    suba  #$FF
C737 : A7 BA    "  "    staa  $BA,x
C739 : AA EB    "  "    oraa  $EB,x
        ;
C73B : 00    " "    db  $00
        ;
C73C : DA FF    "  "    orab  X00FF
        ;
C73E : 03 00    "  "    db  $03, $00
        ;
C740 : B0 FE FF    "   "    suba  XFEFF
        ;
C743 : 00    " "    db  $00
        ;
C744 : F0 FF 83    "   "    subb  XFF83
        ;
C747 : 02    " "    db  $02
        ;
C748 : F8 FF 03    "   "    eorb  XFF03
C74B : C0 FF    "  "    subb  #$FF
        ;
C74D : 55    "U"    db  $55
        ;
C74E : 6D D5    "m "    tst  $D5,x
        ;
C750 : 55    "U"    db  $55
        ;
C751 : 01    " "    nop
        ;
C752 : FD    " "    db  $FD
        ;
C753 : 7F 00 00    "   "    clr  X0000
C756 : B4 FF 3F    "  ?"    anda  XFF3F
        ;
C759 : 00 FC    "  "    db  $00, $FC
        ;
C75B : 7F 51 00    " Q "    clr  X5100
C75E : FE 7F 00    "   "    ldx  X7F00
C761 : F8 BF 4A    "  J"    eorb  XBF4A
C764 : B5 DF 02    "   "    bita  XDF02
C767 : 50    "P"    negb
C768 : FF 2F 00    " / "    stx  X2F00
        ;
C76B : 00    " "    db  $00
        ;
C76C : FA FF 03    "   "    orab  XFF03
C76F : C0 FF    "  "    subb  #$FF
C771 : AF 02    "  "    sts  $02,x
C773 : C0 FF    "  "    subb  #$FF
C775 : 0F    " "    sei
C776 : 80 FF    "  "    suba  #$FF
C778 : 76 81 FC    "v  "    ror  X81FC
C77B : BF 00 E8    "   "    sts  X00E8
C77E : DF 26    " &"    stx  X0026
        ;
C780 : 00 00    "  "    db  $00, $00
        ;
C782 : FF 3F 00    " ? "    stx  X3F00
        ;
C785 : FC    " "    db  $FC
        ;
C786 : FF 0F 00    "   "    stx  X0F00
        ;
C789 : FC    " "    db  $FC
        ;
C78A : 7F 00 54    "  T"    clr  X0054
C78D : FF 17 80    "   "    stx  X1780
C790 : FE 1F 00    "   "    ldx  X1F00
        ;
C793 : EC    " "    db  $EC
        ;
C794 : DF 04    "  "    stx  X0004
        ;
C796 : 00    " "    db  $00
        ;
C797 : C0 FF    "  "    subb  #$FF
C799 : 07    " "    tpa
        ;
C79A : 00    " "    db  $00
        ;
C79B : 7E FF 03    "~  "    jmp  LFF03
        ;
C79E : 00    " "    db  $00
        ;
C79F : FF 97 02    "   "    stx  X9702
C7A2 : 60 FF    "` "    neg  $FF,x
        ;
C7A4 : 05    " "    db  $05
        ;
C7A5 : C0 FF    "  "    subb  #$FF
C7A7 : 0F    " "    sei
        ;
C7A8 : 00    " "    db  $00
        ;
C7A9 : F8 5F 01    " _ "    eorb  X5F01
        ;
C7AC : 00    " "    db  $00
        ;
C7AD : F0 FF 03    "   "    subb  XFF03
        ;
C7B0 : 00    " "    db  $00
        ;
C7B1 : FB FF 01    "   "    addb  XFF01
C7B4 : 60 F7    "` "    neg  $F7,x
C7B6 : 7D 01 EC    "}  "    tst  X01EC
        ;
C7B9 : 55 72 05    "Ur "    db  $55, $72, $05
        ;
C7BC : FF 1F 00    "   "    stx  X1F00
        ;
C7BF : EC    " "    db  $EC
        ;
C7C0 : B7 00 00    "   "    staa  $00
C7C3        LC7C3:
C7C3 : FE 8F 1F    "   "    ldx  X8F1F
        ;
C7C6 : 00    " "    db  $00
        ;
C7C7 : FF 0F 2E    "  ."    stx  X0F2E
C7CA : E0 B7    "  "    subb  $B7,x
        ;
C7CC : 42    "B"    db  $42
        ;
C7CD : FA A9 17    "   "    orab  XA917
        ;
C7D0 : 00    " "    db  $00
        ;
C7D1 : E9 FF    "  "    adcb  $FF,x
C7D3 : 17    " "    tba
        ;
C7D4 : 00 FC    "  "    db  $00, $FC
        ;
C7D6 : 17    " "    tba
        ;
C7D7 : 42 00 FC    "B  "    db  $42, $00, $FC
        ;
C7DA : 7F 8A 50    "  P"    clr  X8A50
C7DD : FF 25 A9    " % "    stx  X25A9
C7E0 : A8 FF    "  "    eora  $FF,x
C7E2 : 20 75    " u"    bra  LC859
        ;
C7E4 : 6B 4B 00    "kK "    db  $6B, $4B, $00
        ;
C7E7 : F4 FF 07    "   "    andb  XFF07
        ;
C7EA : 00    " "    db  $00
        ;
C7EB : FF 97 40    "  @"    stx  X9740
C7EE : 50    "P"    negb
        ;
C7EF : FD    " "    db  $FD
        ;
C7F0 : 5F    "_"    clrb
        ;
C7F1 : 00    " "    db  $00
        ;
C7F2 : FA 76 2F    " v/"    orab  X762F
C7F5 : 40    "@"    nega
C7F6 : BD AD 8A    "   "    jsr  LAD8A
C7F9 : E8 6D    " m"    eorb  $6D,x
        ;
C7FB : 02    " "    db  $02
        ;
C7FC : 80 EA    "  "    suba  #$EA
C7FE : FF 03 80    "   "    stx  X0380
C801 : FF 57 80    " W "    stx  X5780
C804 : A8 FE    "  "    eora  $FE,x
C806 : 2F 00    "/ "    ble  LC808
C808        LC808:
C808 : F5 DD 26    "  &"    bitb  XDD26
C80B : 20 7D    " }"    bra  LC88A
        ;
C80D        LC80D:
C80D : 17    " "    tba
        ;
C80E : 51    "Q"    db  $51
        ;
C80F : EA 5E    " ^"    orab  $5E,x
        ;
C811 : 00    " "    db  $00
        ;
C812 : A0 EE    "  "    suba  $EE,x
C814 : FF 01 C0    "   "    stx  X01C0
C817 : FF 93 10    "   "    stx  X9310
C81A : 54    "T"    lsrb
C81B : FF 27 20    " ' "    stx  X2720
C81E : F5 BF 04    "   "    bitb  XBF04
C821 : 54    "T"    lsrb
        ;
C822 : 7B    "{"    db  $7B
        ;
C823 : 57    "W"    asrb
C824 : 20 ED    "  "    bra  LC813
        ;
C826 : AB 00    "  "    adda  $00,x
C828 : 48    "H"    asla
C829 : F5 FF 05    "   "    bitb  XFF05
C82C : 80 FF    "  "    suba  #$FF
C82E : 47    "G"    asra
C82F : 48    "H"    asla
C830 : 64 FF    "d "    lsr  $FF,x
C832 : 17    " "    tba
C833 : 80 FA    "  "    suba  #$FA
C835 : 5F    "_"    clrb
        ;
C836 : 42    "B"    db  $42
        ;
C837 : A8 DE    "  "    eora  $DE,x
C839 : 2B 88    "+ "    bmi  LC7C3
C83B : FA 56 00    " V "    orab  X5600
C83E : A4 DA    "  "    anda  $DA,x
C840 : FF 03 C0    "   "    stx  X03C0
C843 : FF 0B A1    "   "    stx  X0BA1
C846 : 64 FF    "d "    lsr  $FF,x
C848 : 2B 00    "+ "    bmi  LC84A
        ;
C84A        LC84A:
C84A : FD    " "    db  $FD
        ;
C84B : B7 04 D1    "   "    staa  X04D1
C84E : BE 2B 90    " + "    lds  X2B90
C851 : F6 16 10    "   "    ldab  X1610
C854 : A4 D4    "  "    anda  $D4,x
C856 : FF 07 00    "   "    stx  X0700
C859        LC859:
C859 : FF 0F 91    "   "    stx  X0F91
C85C : 92 FD    "  "    sbca  X00FD
        ;
C85E : 1F 00 FD 5B  "   ["    db  $1F, $00, $FD, $5B
        ;
C862 : 09    " "    dex
C863 : 49    "I"    rola
C864 : DF 55    " U"    stx  X0055
C866 : A0 7A    " z"    suba  $7A,x
C868 : 2B 20    "+ "    bmi  LC88A
C86A : 24 55    "$U"    bcc  LC8C1
C86C : FF 0F 00    "   "    stx  X0F00
C86F : FF 17 12    "   "    stx  X1712
C872 : A5 FE    "  "    bita  $FE,x
C874 : 2F 00    "/ "    ble  LC876
        ;
C876        LC876:
C876 : FD 5B    " ["    db  $FD, $5B
        ;
C878 : 09    " "    dex
C879 : A9 BE    "  "    adca  $BE,x
C87B : 2B 90    "+ "    bmi  LC80D
C87D : F6 16 08    "   "    ldab  X1608
C880 : 92 D4    "  "    sbca  X00D4
C882 : FF 0F 00    "   "    stx  X0F00
C885 : FF 17 94    "   "    stx  X1794
C888 : 94 F6    "  "    anda  X00F6
C88A        LC88A:
C88A : 5F    "_"    clrb
        ;
C88B : 00 FD 5B    "  ["    db  $00, $FD, $5B
        ;
C88E : 89 A8    "  "    adca  #$A8
C890 : DE 95    "  "    ldx  X0095
C892 : A0 7A    " z"    suba  $7A,x
C894 : 8D 00    "  "    bsr  LC896
C896        LC896:
C896 : 94 D6    "  "    anda  X00D6
C898 : FF 07 80    "   "    stx  X0780
C89B : FF 0B 4A    "  J"    stx  X0B4A
        ;
C89E : 52    "R"    db  $52
        ;
C89F : FF 27 80    " ' "    stx  X2780
        ;
C8A2 : FD    " "    db  $FD
        ;
C8A3 : AB 24    " $"    adda  $24,x
C8A5 : D2 BE    "  "    sbcb  X00BE
        ;
C8A7 : 05 51 7B 15  " Q{ "    db  $05, $51, $7B, $15
C8AB : 00 55    " U"    db  $00, $55
        ;
C8AD : EA FF    "  "    orab  $FF,x
C8AF : 01    " "    nop
C8B0 : E0 FF    "  "    subb  $FF,x
C8B2 : 84 8A    "  "    anda  #$8A
C8B4 : E4 FF    "  "    andb  $FF,x
C8B6 : 11    " "    cba
C8B7 : A0 FF    "  "    suba  $FF,x
C8B9 : 2A 91    "* "    bpl  LC84C
C8BB : B4 6F 09    " o "    anda  X6F09
        ;
C8BE : 52    "R"    db  $52
        ;
C8BF : 5F    "_"    clrb
        ;
C8C0 : 05    " "    db  $05
        ;
C8C1        LC8C1:
C8C1 : 88 54    " T"    eora  #$54
C8C3 : FA FF 00    "   "    orab  XFF00
C8C6 : F0 BF 44    "  D"    subb  XBF44
C8C9 : 85 F4    "  "    bita  #$F4
C8CB : 7F 01 D4    "   "    clr  X01D4
C8CE : BF 2A 91    " * "    sts  X2A91
C8D1 : EA 5B    " ["    orab  $5B,x
        ;
C8D3 : 21    "!"    db  $21
        ;
C8D4 : 6A AF    "j "    dec  $AF,x
C8D6 : 20 48    " H"    bra  LC920
        ;
C8D8 : 92 FE    "  "    sbca  X00FE
C8DA : 3F    "?"    swi
        ;
C8DB : 00    " "    db  $00
        ;
C8DC : FE 97 54    "  T"    ldx  X9754
C8DF : 10    " "    sba
        ;
C8E0 : FD    " "    db  $FD
        ;
C8E1 : 5F    "_"    clrb
        ;
C8E2 : 00 DD    "  "    db  $00, $DD
        ;
C8E4 : B7 2A 21    " *!"    staa  X2A21
        ;
C8E7 : FD    " "    db  $FD
        ;
C8E8 : 56    "V"    rorb
C8E9 : 90 DA    "  "    suba  X00DA
C8EB : 2D 10    "- "    blt  LC8FD
        ;
C8ED : 41    "A"    db  $41
        ;
C8EE : D2 FF    "  "    sbcb  X00FF
        ;
C8F0 : 03    " "    db  $03
        ;
C8F1 : E0 BF    "  "    subb  $BF,x
C8F3 : AA 0A    "  "    oraa  $0A,x
C8F5 : E0 FF    "  "    subb  $FF,x
C8F7 : 09    " "    dex
C8F8 : A8 EE    "  "    eora  $EE,x
C8FA : 76 25 A8    "v% "    ror  X25A8
C8FD        LC8FD:
C8FD : EF 12    "  "    stx  $12,x
        ;
C8FF : 52    "R"    db  $52
        ;
C900 : 6D 15    "m "    tst  $15,x
C902 : 01    " "    nop
C903        XC903:
C903 : 48    "H"    asla
        ;
C904 : FD    " "    db  $FD
        ;
C905 : 3F    "?"    swi
        ;
C906 : 00    " "    db  $00
        ;
C907 : FE EA 2D    "  -"    ldx  XEA2D
        ;
C90A : 00    " "    db  $00
        ;
C90B : FE 57 42    " WB"    ldx  X5742
C90E : A9 BE    "  "    adca  $BE,x
C910 : 57    "W"    asrb
C911 : 82 DA    "  "    sbca  #$DA
        ;
C913 : 5B    "["    db  $5B
        ;
C914 : 89 A4    "  "    adca  #$A4
C916 : 5D    "]"    tstb
C917 : 09    " "    dex
C918 : 80 68    " h"    suba  #$68
C91A : FF 07 A0    "   "    stx  X07A0
C91D : BD FE 01    "   "    jsr  LFE01
C920        LC920:
C920 : D0 7D    " }"    subb  X007D
C922 : AD 12    "  "    jsr  $12,x            ;INFO: index jump
C924 : D1 FE    "  "    cmpb  X00FE
C926 : 26 49    "&I"    bne  LC971
        ;
C928 : 75    "u"    db  $75
        ;
C929 : B7 02 A9    "   "    staa  X02A9
C92C : BB 08 80    "   "    adda  X0880
C92F : F4 FF 01    "   "    andb  XFF01
C932 : 4A    "J"    deca
C933 : F5 7F 04    "   "    bitb  X7F04
C936 : AA DA    "  "    oraa  $DA,x
C938 : DE 0A    "  "    ldx  X000A
C93A : 6A 5B    "j["    dec  $5B,x
        ;
C93C        LC93C:
C93C : DD 15    "  "    db  $DD, $15
        ;
C93E : D4 5B    " ["    andb  X005B
C940 : 22 95    "" "    bhi  LC8D7
C942 : 6A 01    "j "    dec  $01,x
C944 : 80 FE    "  "    suba  #$FE
C946 : 43    "C"    coma
        ;
C947 : 1F    " "    db  $1F
        ;
C948 : D0 DE    "  "    subb  X00DE
C94A : 25 5D    "%]"    bcs  LC9A9
C94C : A8 AE    "  "    eora  $AE,x
C94E : 4A    "J"    deca
C94F : BD A5 AE    "   "    jsr  LA5AE
C952 : 92 EA    "  "    sbca  X00EA
C954 : 96 56    " V"    ldaa  $56
C956 : 90 DA    "  "    suba  X00DA
C958 : 0A    " "    clv
C959 : 29 01    ") "    bvs  LC95C
C95B : FE 2B DA    " + "    ldx  X2BDA
        ;
C95E : 52    "R"    db  $52
        ;
C95F : B7 AA DA    "   "    staa  XAADA
        ;
C962 : 42    "B"    db  $42
        ;
C963 : 7D A5 B6    "}  "    tst  XA5B6
C966 : AA B6    "  "    oraa  $B6,x
C968 : 95 54    " T"    bita  X0054
C96A : D5 05    "  "    bitb  X0005
C96C : A9 BB    "  "    adca  $BB,x
        ;
C96E : 52 12 55 FD  "R U "    db  $52, $12, $55, $FD
        ;
C972 : E0 05    "  "    subb  $05,x
C974 : 7D 51 B7    "}Q "    tst  X51B7
C977 : A4 3E    " >"    anda  $3E,x
C979 : E8 15    "  "    eorb  $15,x
C97B : 5D    "]"    tstb
        ;
C97C : 65 55 4B    "eUK"    db  $65, $55, $4B
        ;
C97F : AA 3F    " ?"    oraa  $3F,x
C981 : D0 49    " I"    subb  X0049
C983 : AB AA    "  "    adda  $AA,x
C985 : D4 82    "  "    andb  X0082
C987 : BF F8 C0    "   "    sts  XF8C0
        ;
C98A : 87    " "    db  $87
        ;
C98B : 2A AF    "* "    bpl  LC93C
C98D        LC98D:
C98D : BC C0 1F    "   "    cpx  XC01F
C990 : F4 90 2D    "  -"    andb  X902D
C993 : F9 A4 26    "  &"    adcb  XA426
C996 : BA 20 B5    "   "    oraa  X20B5
C999        LC999:
C999 : A6 B4    "  "    ldaa  $B4,x
C99B : 54    "T"    lsrb
C99C : 89 3E    " >"    adca  #$3E
C99E : C8 A2    "  "    eorb  #$A2
C9A0 : 5F    "_"    clrb
C9A1 : 6C A1    "l "    inc  $A1,x
C9A3 : 5F    "_"    clrb
C9A4 : B9 64 AB    " d "    adca  X64AB
C9A7 : D6 BA    "  "    ldab  X00BA
C9A9        LC9A9:
C9A9 : AA D5    "  "    oraa  $D5,x
        ;
C9AB : 5B    "["    db  $5B
        ;
C9AC : 01    " "    nop
C9AD : D4 1F    "  "    andb  X001F
C9AF : FA 05 25    "  %"    orab  X0525
C9B2 : BF 50 A9    " P "    sts  X50A9
C9B5 : 25 FA    "% "    bcs  LC9B1
        ;
C9B7 : DD    " "    db  $DD
        ;
C9B8 : C0 4B    " K"    subb  #$4B
C9BA : 96 54    " T"    ldaa  $54
C9BC : D5 AB    "  "    bitb  X00AB
C9BE : AE 22    " ""    lds  $22,x
C9C0 : 95 D4    "  "    bita  X00D4
C9C2 : 0A    " "    clv
C9C3 : D5 55    " U"    bitb  X0055
        ;
C9C5 : 52 55    "RU"    db  $52, $55
        ;
C9C7 : D4 85    "  "    andb  X0085
C9C9 : D6 F3    "  "    ldab  X00F3
C9CB : DE 09    "  "    ldx  X0009
C9CD : 2A 75    "*u"    bpl  LCA44
C9CF : D5 D5    "  "    bitb  X00D5
C9D1 : 2D 34    "-4"    blt  LCA07
C9D3 : 95 A8    "  "    bita  X00A8
C9D5        LC9D5:
C9D5 : 4A    "J"    deca
C9D6 : 7D 68 B1    "}h "    tst  X68B1
C9D9 : A8 92    "  "    eora  $92,x
C9DB : 5A    "Z"    decb
C9DC : 95 83    "  "    bita  X0083
C9DE : 5C    "\"    incb
C9DF : D1 B7    "  "    cmpb  X00B7
C9E1 : 22 AA    "" "    bhi  LC98D
C9E3 : E8 A2    "  "    eorb  $A2,x
C9E5 : 6D BD    "m "    tst  $BD,x
        ;
C9E7 : 12 52    " R"    db  $12, $52
        ;
C9E9 : B4 57 AD    " W "    anda  X57AD
C9EC : 2A AB    "* "    bpl  LC999
C9EE : D4 57    " W"    andb  X0057
C9F0 : BD E2 1A    "   "    jsr  LE21A
C9F3 : 7E 89 AE    "~  "    jmp  L89AE
        ;
C9F6 : 5A    "Z"    decb
        ;
C9F7 : 45    "E"    db  $45
        ;
C9F8 : B7 B4 A1    "   "    staa  XB4A1
C9FB : 56    "V"    rorb
C9FC : D4 2A    " *"    andb  X002A
C9FE : D5 57    " W"    bitb  X0057
CA00 : 54    "T"    lsrb
CA01 : A8 52    " R"    eora  $52,x
CA03 : BD 55 8B    " U "    jsr  L558B
CA06 : AA D4    "  "    oraa  $D4,x
CA08 : 23 54    "#T"    bls  LCA5E
        ;
CA0A : 5B 55    "[U"    db  $5B, $55
        ;
CA0C : 69 2A    "i*"    rol  $2A,x
        ;
CA0E : 55 55    "UU"    db  $55, $55
        ;
CA10 : 29 A4    ") "    bvs  LC9B6
CA12 : 5D    "]"    tstb
CA13 : 5F    "_"    clrb
CA14 : C1 25    " %"    cmpb  #$25
CA16 : C9 AA    "  "    adcb  #$AA
CA18 : D5 6E    " n"    bitb  X006E
CA1A : 89 54    " T"    adca  #$54
CA1C : 8A EA    "  "    oraa  #$EA
CA1E : AB AA    "  "    adda  $AA,x
CA20 : 09    " "    dex
        ;
CA21 : 55    "U"    db  $55
        ;
CA22 : A9 B4    "  "    adca  $B4,x
CA24 : B5 A0 15    "   "    bita  XA015
CA27 : DA 52    " R"    orab  X0052
CA29 : 2D AA    "- "    blt  LC9D5
CA2B : AA 4A    " J"    oraa  $4A,x
        ;
CA2D        LCA2D:
CA2D : 45    "E"    db  $45
        ;
CA2E : B5 BA A2    "   "    bita  XBAA2
        ;
CA31 : 1E    " "    db  $1E
        ;
CA32 : AB 5E    " ^"    adda  $5E,x
        ;
CA34 : 55    "U"    db  $55
        ;
CA35 : D5 AA    "  "    bitb  X00AA
        ;
CA37 : 5B 55    "[U"    db  $5B, $55
        ;
CA39 : A8 76    " v"    eora  $76,x
CA3B : 25 55    "%U"    bcs  LCA92
CA3D : D5 55    " U"    bitb  X0055
        ;
CA3F : 52 55    "RU"    db  $52, $55
        ;
CA41 : B5 DA AB    "   "    bita  XDAAB
CA44        LCA44:
CA44 : AA AA    "  "    oraa  $AA,x
CA46 : AA A4    "  "    oraa  $A4,x
CA48 : EB AA    "  "    addb  $AA,x
CA4A : AA AA    "  "    oraa  $AA,x
CA4C : 7A 95 AA    "z  "    dec  X95AA
CA4F : 4A    "J"    deca
        ;
CA50 : 51    "Q"    db  $51
        ;
CA51 : AD 07    "  "    jsr  $07,x            ;INFO: index jump
        ;
CA53 : 12 00 00    "   "    db  $12, $00, $00
        ;
CA56 : 22 ED    "" "    bhi  LCA45
CA58 : FF 6F 22    " o""    stx  X6F22
        ;
CA5B : 52    "R"    db  $52
        ;
CA5C : 6A F7    "j "    dec  $F7,x
CA5E        LCA5E:
CA5E : 6D 11    "m "    tst  $11,x
CA60 : 69 EF    "i "    rol  $EF,x
CA62 : 7D 57 05    "}W "    tst  X5705
        ;
CA65 : 52 ED    "R "    db  $52, $ED
        ;
CA67 : AD 56    " V"    jsr  $56,x            ;INFO: index jump
CA69 : 82 88    "  "    sbca  #$88
        ;
CA6B : 52 12    "R "    db  $52, $12
        ;
CA6D : 09    " "    dex
CA6E : 11    " "    cba
CA6F : 22 4A    ""J"    bhi  LCABB
        ;
CA71 : 55    "U"    db  $55
        ;
CA72 : FF FF 24    "  $"    stx  XFF24
        ;
CA75 : 55    "U"    db  $55
        ;
CA76 : AD DA    "  "    jsr  $DA,x            ;INFO: index jump
CA78 : FF 5B 55    " [U"    stx  X5B55
CA7B : B5 56 55    " VU"    bita  X5655
        ;
CA7E : 05 00    "  "    db  $05, $00
        ;
CA80 : 91 10    "  "    cmpa  X0010
        ;
CA82 : 00 00    "  "    db  $00, $00
        ;
CA84 : FE FF 27    "  '"    ldx  XFF27
CA87 : 54    "T"    lsrb
        ;
CA88 : 05    " "    db  $05
        ;
CA89 : E9 FF    "  "    adcb  $FF,x
CA8B : 0B    " "    sev
CA8C : 48    "H"    asla
CA8D : 6F 55    "oU"    clr  $55,x
CA8F : FF 9B 00    "   "    stx  X9B00
CA92        LCA92:
CA92 : EA DD    "  "    orab  $DD,x
CA94 : 6A 5B    "j["    dec  $5B,x
        ;
CA96 : 02    " "    db  $02
        ;
CA97 : 48    "H"    asla
        ;
CA98 : 5B    "["    db  $5B
        ;
CA99 : 25 92    "% "    bcs  LCA2D
CA9B : 48    "H"    asla
        ;
CA9C : 00    " "    db  $00
        ;
CA9D : 91 44    " D"    cmpa  X0044
        ;
CA9F : 12    " "    db  $12
        ;
CAA0 : FF FF 8B    "   "    stx  XFF8B
CAA3        LCAA3:
CAA3 : 68 95    "h "    asl  $95,x
CAA5 : EA FF    "  "    orab  $FF,x
        ;
CAA7 : 1F 52    " R"    db  $1F, $52
        ;
CAA9 : BD AA DA    "   "    jsr  LAADA
        ;
CAAC : 02 00    "  "    db  $02, $00
        ;
CAAE : 92 00    "  "    sbca  X0000
        ;
CAB0 : 00    " "    db  $00
        ;
CAB1 : F0 FF 7F    "   "    subb  XFF7F
CAB4 : 0A    " "    clv
CAB5 : 8B 50    " P"    adda  #$50
CAB7 : FE BF 02    "   "    ldx  XBF02
        ;
CABA : 75    "u"    db  $75
        ;
CABB        LCABB:
CABB : B7 FA BF    "   "    staa  XFABF
        ;
CABE : 02    " "    db  $02
        ;
CABF : 50    "P"    negb
        ;
CAC0 : 7B    "{"    db  $7B
        ;
CAC1 : AB B6    "  "    adda  $B6,x
CAC3 : 0A    " "    clv
CAC4 : 80 54    " T"    suba  #$54
        ;
CAC6 : 45 00 00    "E  "    db  $45, $00, $00
        ;
CAC9 : 80 FF    "  "    suba  #$FF
CACB : FF 13 94    "   "    stx  X1394
CACE : 88 FA    "  "    eora  #$FA
CAD0 : FF 13 A8    "   "    stx  X13A8
CAD3 : F7 6D 7B    " m{"    stab  X6D7B
        ;
CAD6 : 13    " "    db  $13
        ;
CAD7 : 80 FA    "  "    suba  #$FA
CAD9 : AE 2A    " *"    lds  $2A,x
CADB : 09    " "    dex
        ;
CADC : 00 00 04    "   "    db  $00, $00, $04
        ;
CADF : 90 FF    "  "    suba  X00FF
CAE1 : FF 0B 94    "   "    stx  X0B94
CAE4 : 44    "D"    lsra
CAE5 : EA FF    "  "    orab  $FF,x
CAE7 : 17    " "    tba
        ;
CAE8 : 52    "R"    db  $52
        ;
CAE9 : 7F AB F6    "   "    clr  XABF6
CAEC : 16    " "    tab
CAED : 40    "@"    nega
CAEE : F6 B7 4A    "  J"    ldab  XB74A
CAF1 : 09    " "    dex
        ;
CAF2 : 00 00 00    "   "    db  $00, $00, $00
        ;
CAF5 : 81 FF    "  "    cmpa  #$FF
CAF7 : FF 13 A8    "   "    stx  X13A8
CAFA : 4A    "J"    deca
CAFB : D2 FF    "  "    sbcb  X00FF
CAFD : 2F A4    "/ "    ble  LCAA3
CAFF : FF 55 69    " Ui"    stx  X5569
CB02 : AB 80    "  "    adda  $80,x
CB04 : F4 6F 09    " o "    andb  X6F09
        ;
CB07 : 52 02 00 00  "R   "    db  $52, $02, $00, $00
        ;
CB0B : A0 FF    "  "    suba  $FF,x
CB0D : FF 17 20    "   "    stx  X1720
CB10 : 49    "I"    rola
CB11 : E9 FF    "  "    adcb  $FF,x
        ;
CB13 : 1F    " "    db  $1F
        ;
CB14 : 91 FD    "  "    cmpa  X00FD
CB16 : AD DA    "  "    jsr  $DA,x            ;INFO: index jump
CB18 : 96 00    "  "    ldaa  $00
CB1A : EA DF    "  "    orab  $DF,x
        ;
CB1C : 12    " "    db  $12
        ;
CB1D : 49    "I"    rola
        ;
CB1E : 00 00 00    "   "    db  $00, $00, $00
        ;
CB21 : D0 FF    "  "    subb  X00FF
CB23 : FF 0B 20    "   "    stx  X0B20
CB26 : A9 FA    "  "    adca  $FA,x
CB28 : FF 4B A4    " K "    stx  X4BA4
CB2B : FB 6D AD    " m "    addb  X6DAD
CB2E : 4A    "J"    deca
CB2F : 40    "@"    nega
CB30 : FA BD 12    "   "    orab  XBD12
CB33 : 10    " "    sba
        ;
CB34 : 00 00 00 FC  "    "    db  $00, $00, $00, $FC
        ;
CB38 : FF 7F 81    "   "    stx  X7F81
CB3B : 20 4A    " J"    bra  LCB87
        ;
CB3D : FF FF 92    "   "    stx  XFF92
CB40 : D8 EE    "  "    eorb  X00EE
CB42 : 6E B7    "n "    jmp  $B7,x            ;INFO: index jump
        ;
CB44 : 09    " "    dex
CB45 : A0 FA    "  "    suba  $FA,x
CB47 : AE 22    " ""    lds  $22,x
        ;
CB49 : 02 00 00 00  "    "    db  $02, $00, $00, $00
        ;
CB4D : FF FF 3F    "  ?"    stx  XFF3F
CB50 : 20 88    "  "    bra  LCADA
        ;
CB52 : D2 FF    "  "    sbcb  X00FF
CB54 : BF 12 D5    "   "    sts  X12D5
CB57 : EE EE    "  "    ldx  $EE,x
CB59 : 6D 09    "m "    tst  $09,x
CB5B : A0 FA    "  "    suba  $FA,x
CB5D : 56    "V"    rorb
CB5E : 22 42    ""B"    bhi  LCBA2
        ;
CB60 : 00 00    "  "    db  $00, $00
        ;
CB62 : 80 FF    "  "    suba  #$FF
CB64 : FF 1F 08    "   "    stx  X1F08
CB67 : 90 74    " t"    suba  X0074
CB69 : FF 7F 89    "   "    stx  X7F89
CB6C : AA 6D    " m"    oraa  $6D,x
CB6E : FB 6E 09    " n "    addb  X6E09
CB71 : 48    "H"    asla
        ;
CB72 : DD 55    " U"    db  $DD, $55
        ;
CB74 : 88 08    "  "    eora  #$08
        ;
CB76 : 00 00    "  "    db  $00, $00
        ;
CB78 : C0 FF    "  "    subb  #$FF
CB7A : FF 0F 02    "   "    stx  X0F02
CB7D : 88 F4    "  "    eora  #$F4
CB7F        LCB7F:
CB7F : FF 7F 11    "   "    stx  X7F11
CB82 : D5 DA    "  "    bitb  X00DA
CB84 : F6 AE 12    "   "    ldab  XAE12
CB87        LCB87:
CB87 : 48    "H"    asla
        ;
CB88 : ED    " "    db  $ED
        ;
CB89 : 8A 88    "  "    oraa  #$88
        ;
CB8B : 04 00 00    "   "    db  $04, $00, $00
        ;
CB8E : E0 FF    "  "    subb  $FF,x
CB90 : FF 87 80    "   "    stx  X8780
CB93 : 20 EA    "  "    bra  LCB7F
        ;
CB95 : FF FF 44    "  D"    stx  XFF44
CB98 : AA B5    "  "    oraa  $B5,x
CB9A : 6D BB    "m "    tst  $BB,x
CB9C : 8A 20    "  "    oraa  #$20
CB9E : 6D 15    "m "    tst  $15,x
        ;
CBA0 : 41 04 00 00  "A   "    db  $41, $04, $00, $00
        ;
CBA4 : F0 FF FF    "   "    subb  XFFFF
CBA7 : 23 10    "# "    bls  LCBB9
CBA9 : 08    " "    inx
CBAA : D5 FF    "  "    bitb  X00FF
CBAC : FF 49 D4    " I "    stx  X49D4
CBAF : DA D6    "  "    orab  X00D6
CBB1 : B6 15 41    "  A"    ldaa  X1541
CBB4 : AA 4A    " J"    oraa  $4A,x
CBB6 : 10    " "    sba
        ;
CBB7 : 00 00 00    "   "    db  $00, $00, $00
        ;
CBBA : FE FF 7F    "   "    ldx  XFF7F
CBBD : 81 20    "  "    cmpa  #$20
CBBF : 90 FA    "  "    suba  X00FA
CBC1        XCBC1:
CBC1 : FF 7F 09    "   "    stx  X7F09
CBC4 : D5 B6    "  "    bitb  X00B6
CBC6 : 56    "V"    rorb
        ;
CBC7 : 6B 4B    "kK"    db  $6B, $4B
        ;
CBC9 : 10    " "    sba
CBCA : 49    "I"    rola
CBCB : 09    " "    dex
        ;
CBCC : 04 00 00    "   "    db  $04, $00, $00
        ;
CBCF : F0 FF FF    "   "    subb  XFFFF
CBD2 : 27 20    "' "    beq  LCBF4
        ;
CBD4 : 04    " "    db  $04
        ;
CBD5 : A9 FF    "  "    adca  $FF,x
CBD7 : FF 2B 48    " +H"    stx  X2B48
        ;
CBDA : ED    " "    db  $ED
        ;
CBDB : 77 AD AA    "w  "    asr  XADAA
        ;
CBDE : 12    " "    db  $12
        ;
CBDF : 44    "D"    lsra
CBE0 : 22 04    "" "    bhi  LCBE6
CBE2 : 08    " "    inx
        ;
CBE3 : 00    " "    db  $00
        ;
CBE4 : F0 FF FF    "   "    subb  XFFFF
CBE7 : 97 20    "  "    staa  $20
        ;
CBE9 : 02    " "    db  $02
        ;
CBEA : 49    "I"    rola
CBEB : FF FF 5F    "  _"    stx  XFF5F
CBEE : 11    " "    cba
CBEF : 49    "I"    rola
        ;
CBF0 : 6B    "k"    db  $6B
        ;
CBF1 : B7 AD 4A    "  J"    staa  XAD4A
CBF4        LCBF4:
CBF4 : 48    "H"    asla
CBF5 : 08    " "    inx
        ;
CBF6 : 00    " "    db  $00
        ;
CBF7 : 01    " "    nop
        ;
CBF8 : 00    " "    db  $00
        ;
CBF9 : F0 FF FF    "   "    subb  XFFFF
CBFC : 4F    "O"    clra
CBFD : 48    "H"    asla
        ;
CBFE : 04    " "    db  $04
        ;
CBFF : A2 FE    "  "    sbca  $FE,x
CC01 : FF BF 88    "   "    stx  XBF88
CC04 : 90 12    "  "    suba  X0012
        ;
CC06 : FD    " "    db  $FD
        ;
CC07 : FF 27 41    " 'A"    stx  X2741
CC0A : 20 80    "  "    bra  LCB8C
        ;
CC0C : 48    "H"    asla
        ;
CC0D : 04    " "    db  $04
        ;
CC0E : 70 FF FF    "p  "    neg  XFFFF
CC11 : 9F 10    "  "    sts  X0010
        ;
CC13 : 04    " "    db  $04
        ;
CC14 : A4 FA    "  "    anda  $FA,x
CC16 : FF FF 05    "   "    stx  XFF05
CC19 : 44    "D"    lsra
CC1A : 6A 6D    "jm"    dec  $6D,x
CC1C : EF 6F    " o"    stx  $6F,x
CC1E : 01    " "    nop
        ;
CC1F : 00    " "    db  $00
        ;
CC20 : 20 04    "  "    bra  LCC26
        ;
CC22 : 08    " "    inx
        ;
CC23 : FC    " "    db  $FC
        ;
CC24 : FF FF 97    "   "    stx  XFF97
CC27 : 80 14    "  "    suba  #$14
        ;
CC29 : 45    "E"    db  $45
        ;
CC2A : F5 FF FF    "   "    bitb  XFFFF
CC2D : 17    " "    tba
        ;
CC2E : 02    " "    db  $02
        ;
CC2F : 49    "I"    rola
CC30 : B5 B6 BB    "   "    bita  XB6BB
        ;
CC33 : 45    "E"    db  $45
        ;
CC34 : 10    " "    sba
CC35 : 08    " "    inx
CC36 : 10    " "    sba
        ;
CC37 : 00    " "    db  $00
        ;
CC38 : E0 FE    "  "    subb  $FE,x
CC3A : FF BF 20    "   "    stx  XBF20
CC3D : 49    "I"    rola
CC3E : 44    "D"    lsra
CC3F : EA FF    "  "    orab  $FF,x
CC41 : FF 5F 09    " _ "    stx  X5F09
        ;
CC44 : 52 55    "RU"    db  $52, $55
        ;
CC46 : A5 FD    "  "    bita  $FD,x
CC48 : 3B    ";"    rti
        ;
CC49 : 01    " "    nop
        ;
CC4A : 00 00    "  "    db  $00, $00
        ;
CC4C : 2A 51    "*Q"    bpl  LCC9F
        ;
CC4E : FD    " "    db  $FD
        ;
CC4F : FF FF 52    "  R"    stx  XFF52
CC52 : B5 0A 00    "   "    bita  X0A00
CC55 : B9 FF FF    "   "    adca  XFFFF
CC58 : 2F 21    "/!"    ble  LCC7B
        ;
CC5A : 55    "U"    db  $55
        ;
CC5B : AB AA    "  "    adda  $AA,x
CC5D : B6 42 00    " B "    ldaa  X4200
        ;
CC60 : 00    " "    db  $00
        ;
CC61 : 84 B4    "  "    anda  #$B4
CC63 : 5A    "Z"    decb
        ;
CC64 : ED    " "    db  $ED
        ;
CC65 : FF 5F EB    " _ "    stx  X5FEB
CC68 : FE 2B 40    " +@"    ldx  X2B40
CC6B : B4 BF DF    "   "    anda  XBFDF
CC6E : AA 5A    " Z"    oraa  $5A,x
CC70 : BB 6D 95    " m "    adda  X6D95
CC73 : 92 00    "  "    sbca  X0000
        ;
CC75 : 00    " "    db  $00
        ;
CC76 : 22 29    "")"    bhi  LCCA1
CC78 : 7D BF 00    "}  "    tst  XBF00
CC7B        LCC7B:
CC7B : C8 B6    "  "    eorb  #$B6
CC7D : BB FF 5F    "  _"    adda  XFF5F
        ;
CC80 : 55 FD    "U "    db  $55, $FD
        ;
CC82 : AE D5    "  "    lds  $D5,x
CC84 : AE 95    "  "    lds  $95,x
CC86 : 6A 6F    "jo"    dec  $6F,x
CC88 : 95 48    " H"    bita  X0048
CC8A : 22 00    "" "    bhi  LCC8C
CC8C        LCC8C:
CC8C : 10    " "    sba
CC8D : 49    "I"    rola
CC8E : FE 7F 25    "  %"    ldx  X7F25
CC91 : 44    "D"    lsra
CC92 : 4A    "J"    deca
        ;
CC93 : 55    "U"    db  $55
        ;
CC94        LCC94:
CC94 : DF B7    "  "    stx  X00B7
CC96 : AA EE    "  "    oraa  $EE,x
CC98 : BF DB DD    "   "    sts  XDBDD
CC9B : AA 6A    " j"    oraa  $6A,x
CC9D : BB 2A 21    " *!"    adda  X2A21
CCA0 : 11    " "    cba
        ;
CCA1        LCCA1:
CCA1 : 00    " "    db  $00
        ;
CCA2 : 11    " "    cba
CCA3 : A9 FF    "  "    adca  $FF,x
CCA5 : 7F 91 50    "  P"    clr  X9150
CCA8 : AA 52    " R"    oraa  $52,x
CCAA : FB AD 24    "  $"    addb  XAD24
        ;
CCAD : DD    " "    db  $DD
        ;
CCAE : BB 6D DB    " m "    adda  X6DDB
CCB1 : AA ED    "  "    oraa  $ED,x
        ;
CCB3        LCCB3:
CCB3 : DD    " "    db  $DD
        ;
CCB4 : 0A    " "    clv
CCB5 : 84 10    "  "    anda  #$10
        ;
CCB7 : 02    " "    db  $02
        ;
CCB8 : 22 F9    "" "    bhi  LCCB3
CCBA : FF 5F 8A    " _ "    stx  X5F8A
CCBD : 92 94    "  "    sbca  X0094
CCBF : EA 7D    " }"    orab  $7D,x
CCC1 : AB A4    "  "    adda  $A4,x
CCC3 : 6E DB    "n "    jmp  $DB,x            ;INFO: index jump
        ;
CCC5 : DE B6    "  "    ldx  X00B6
        ;
CCC7 : 52    "R"    db  $52
        ;
CCC8 : B5 5B 05    " [ "    bita  X5B05
CCCB : 89 10    "  "    adca  #$10
        ;
CCCD : 00    " "    db  $00
        ;
CCCE : 44    "D"    lsra
        ;
CCCF : FD    " "    db  $FD
        ;
CCD0 : FF 57 A2    " W "    stx  X57A2
CCD3 : 28 A9    "( "    bvc  LCC7E
CCD5 : 7A DF AA    "z  "    dec  XDFAA
CCD8 : 54    "T"    lsrb
CCD9 : DB 76    " v"    addb  X0076
CCDB : 77 AB 94    "w  "    asr  XAB94
CCDE : BA AD 20    "   "    oraa  XAD20
CCE1 : 29 02    ") "    bvs  LCCE5
        ;
CCE3 : 00    " "    db  $00
        ;
CCE4 : 91 FF    "  "    cmpa  X00FF
CCE6 : FF 95 48    "  H"    stx  X9548
CCE9 : 24 A9    "$ "    bcc  LCC94
CCEB : EE BF    "  "    ldx  $BF,x
CCED : AA 54    " T"    oraa  $54,x
CCEF : AD ED    "  "    jsr  $ED,x            ;INFO: index jump
CCF1 : 6E AB    "n "    jmp  $AB,x            ;INFO: index jump
        ;
CCF3 : 94 5A    " Z"    anda  X005A
CCF5 : AB 88    "  "    adda  $88,x
CCF7 : 24 10    "$ "    bcc  LCD09
        ;
CCF9 : 00    " "    db  $00
        ;
CCFA : A4 FF    "  "    anda  $FF,x
CCFC : FF 2A 12    " * "    stx  X2A12
CCFF : 91 54    " T"    cmpa  X0054
CD01 : FB DF 2A    "  *"    addb  XDF2A
CD04 : A5 B6    "  "    bita  $B6,x
CD06 : 76 DB 56    "v V"    ror  XDB56
        ;
CD09        LCD09:
CD09 : 12 55 55    " UU"    db  $12, $55, $55
        ;
CD0C : A2 94    "  "    sbca  $94,x
        ;
CD0E : 00 00    "  "    db  $00, $00
        ;
CD10 : E2 FF    "  "    sbcb  $FF,x
CD12 : 7F 25 8A    " % "    clr  X258A
CD15 : 24 A9    "$ "    bcc  LCCC0
        ;
CD17 : FD    " "    db  $FD
        ;
CD18 : DF 4A    " J"    stx  X004A
CD1A : AA D6    "  "    oraa  $D6,x
CD1C : B6 6D AB    " m "    ldaa  X6DAB
        ;
CD1F : 42    "B"    db  $42
        ;
CD20 : AA 2A    " *"    oraa  $2A,x
CD22 : 49    "I"    rola
CD23 : 4A    "J"    deca
        ;
CD24 : 04 00    "  "    db  $04, $00
        ;
CD26 : E8 FF    "  "    eorb  $FF,x
CD28 : BF 8A 22    "  ""    sts  X8A22
        ;
CD2B : 51    "Q"    db  $51
        ;
CD2C : D4 FE    "  "    andb  X00FE
        ;
CD2E : 7B    "{"    db  $7B
        ;
CD2F : 95 52    " R"    bita  X0052
CD31 : AD AD    "  "    jsr  $AD,x            ;INFO: index jump
CD33 : 6D AD    "m "    tst  $AD,x
CD35 : 84 54    " T"    anda  #$54
        ;
CD37 : 55    "U"    db  $55
        ;
CD38 : 92 22    " ""    sbca  X0022
        ;
CD3A : 00    " "    db  $00
        ;
CD3B : 40    "@"    nega
CD3C : FA FF 5F    "  _"    orab  XFF5F
CD3F : 91 28    " ("    cmpa  X0028
CD41 : 49    "I"    rola
CD42 : 69 FF    "i "    rol  $FF,x
CD44 : 6F 25    "o%"    clr  $25,x
        ;
CD46 : 55    "U"    db  $55
        ;
CD47 : B5 B5 5A    "  Z"    bita  XB55A
CD4A : AB 44    " D"    adda  $44,x
        ;
CD4C : 52    "R"    db  $52
        ;
CD4D : 2A 91    "* "    bpl  LCCE0
CD4F : 20 00    "  "    bra  LCD51
        ;
CD51        LCD51:
CD51 : D0 FF    "  "    subb  X00FF
CD53 : 7F 4B 92    " K "    clr  X4B92
CD56 : 24 4A    "$J"    bcc  LCDA2
        ;
CD58 : FD    " "    db  $FD
        ;
CD59 : FB AD A4    "   "    addb  XADA4
CD5C : 54    "T"    lsrb
CD5D : DB 56    " V"    addb  X0056
CD5F : AD 2A    " *"    jsr  $2A,x            ;INFO: index jump
CD61 : 92 24    " $"    sbca  X0024
CD63 : 92 88    "  "    sbca  X0088
        ;
CD65 : 00    " "    db  $00
        ;
CD66 : A0 FB    "  "    suba  $FB,x
CD68 : FF 2B 25    " +%"    stx  X2B25
CD6B : 49    "I"    rola
CD6C : 92 DA    "  "    sbca  X00DA
CD6E : FF 57 55    " WU"    stx  X5755
CD71 : 4A    "J"    deca
CD72 : D5 B6    "  "    bitb  X00B6
CD74 : B5 AA 22    "  ""    bita  XAA22
CD77 : 89 08    "  "    adca  #$08
CD79 : 49    "I"    rola
CD7A : 08    " "    inx
CD7B : A0 F7    "  "    suba  $F7,x
CD7D : FF 2B 25    " +%"    stx  X2B25
CD80 : 29 49    ")I"    bvs  LCDCB
CD82 : DA FF    "  "    orab  X00FF
CD84 : DF 4A    " J"    stx  X004A
CD86 : E9 A4    "  "    adcb  $A4,x
CD88 : DA BE    "  "    orab  X00BE
CD8A : D6 2E    " ."    ldab  X002E
CD8C : 90 DE    "  "    suba  X00DE
        ;
CD8E : 00    " "    db  $00
        ;
CD8F : 6D 00    "m "    tst  $00,x
CD91 : FE EF AA    "   "    ldx  XEFAA
CD94 : 4A    "J"    deca
CD95 : 22 A9    "" "    bhi  LCD40
CD97 : D2 FE    "  "    sbcb  X00FE
CD99 : FF 4A 2A    " J*"    stx  X4A2A
        ;
CD9C : 75    "u"    db  $75
        ;
CD9D : AB BA    "  "    adda  $BA,x
CD9F : B5 AA 00    "   "    bita  XAA00
CDA2        LCDA2:
CDA2 : 88 04    "  "    eora  #$04
CDA4 : 01    " "    nop
CDA5 : A2 F6    "  "    sbca  $F6,x
CDA7 : BF 4A 80    " J "    sts  X4A80
CDAA : 10    " "    sba
CDAB : 91 FA    "  "    cmpa  X00FA
CDAD : FF DF 5B    "  ["    stx  XDF5B
CDB0 : 91 EA    "  "    cmpa  X00EA
CDB2 : DE DD    "  "    ldx  X00DD
CDB4 : DF 5B    " ["    stx  X005B
        ;
CDB6 : 55    "U"    db  $55
        ;
CDB7 : 44    "D"    lsra
CDB8 : 92 44    " D"    sbca  X0044
CDBA : 80 D4    "  "    suba  #$D4
CDBC : AD 00    "  "    jsr  $00,x            ;INFO: index jump
CDBE : F8 FF FB    "   "    eorb  XFFFB
CDC1 : 57    "W"    asrb
CDC2 : 08    " "    inx
        ;
CDC3 : FD    " "    db  $FD
        ;
CDC4 : A6 EA    "  "    ldaa  $EA,x
CDC6 : 5F    "_"    clrb
        ;
CDC7 : 52    "R"    db  $52
        ;
CDC8 : 6F 42    "oB"    clr  $42,x
        ;
CDCA : FD    " "    db  $FD
        ;
CDCB        LCDCB:
CDCB : 0A    " "    clv
        ;
CDCC : 52    "R"    db  $52
        ;
CDCD : 09    " "    dex
CDCE : 20 02    "  "    bra  LCDD2
        ;
CDD0 : 42    "B"    db  $42
        ;
CDD1 : B7 22 00    " " "    staa  X2200
        ;
CDD4 : 00 FC    "  "    db  $00, $FC
        ;
CDD6 : AF FD    "  "    sts  $FD,x
        ;
CDD8 : 03 00 00 41  "   A"    db  $03, $00, $00, $41
        ;
CDDC : FE 0A 45    "  E"    ldx  X0A45
        ;
CDDF : 00    " "    db  $00
        ;
CDE0 : 80 48    " H"    suba  #$48
        ;
CDE2 : 52    "R"    db  $52
        ;
CDE3 : 2B 22    "+""    bmi  LCE07
CDE5 : 44    "D"    lsra
CDE6 : A4 EA    "  "    anda  $EA,x
CDE8 : 56    "V"    rorb
        ;
CDE9 : 55    "U"    db  $55
        ;
CDEA : D2 FF    "  "    sbcb  X00FF
CDEC : FF FF BF    "   "    stx  XFFBF
CDEF : EA DB    "  "    orab  $DB,x
CDF1 : FE FF FF    "   "    ldx  XFFFF
CDF4 : FF 57 FF    " W "    stx  X57FF
CDF7 : FF FF FF 
CDFA : FF AD BA    "   "    stx  XADBA
CDFD : BD 55 01    " U "    jsr  L5501
CE00        XCE00:
CE00 : C0 FF    "  "    subb  #$FF
CE02 : FF FF 05    "   "    stx  XFF05
CE05 : 44    "D"    lsra
CE06 : 48    "H"    asla
CE07        LCE07:
CE07 : FF AF 55    "  U"    stx  XAF55
CE0A : 01    " "    nop
CE0B : 10    " "    sba
CE0C : 4A    "J"    deca
CE0D : 69 25    "i%"    rol  $25,x
CE0F : 08    " "    inx
        ;
CE10 : 00    " "    db  $00
        ;
CE11 : 40    "@"    nega
CE12 : 10    " "    sba
        ;
CE13 : 42 00 00    "B  "    db  $42, $00, $00
        ;
CE16 : 80 77    " w"    suba  #$77
        ;
CE18 : ED    " "    db  $ED
        ;
CE19 : 16    " "    tab
        ;
CE1A : 00 00    "  "    db  $00, $00
        ;
CE1C : A4 BE    "  "    anda  $BE,x
CE1E : D5 52    " R"    bitb  X0052
        ;
CE20 : 00    " "    db  $00
        ;
CE21 : 08    " "    inx
        ;
CE22 : 55    "U"    db  $55
        ;
CE23 : DB 4A    " J"    addb  X004A
        ;
CE25 : 02    " "    db  $02
        ;
CE26 : 40    "@"    nega
CE27 : 44    "D"    lsra
CE28 : 92 22    " ""    sbca  X0022
        ;
CE2A : 00 00    "  "    db  $00, $00
        ;
CE2C : C0 FF    "  "    subb  #$FF
CE2E : FF 0F 80    "   "    stx  X0F80
CE31 : A2 F4    "  "    sbca  $F4,x
CE33 : BF AB 2D    "  -"    sts  XAB2D
CE36 : F5 B7 75    "  u"    bitb  XB775
CE39 : 09    " "    dex
CE3A : AA DB    "  "    oraa  $DB,x
CE3C : 7D 15 11    "}  "    tst  X1511
        ;
CE3F : 00 00    "  "    db  $00, $00
        ;
CE41 : 80 FC    "  "    suba  #$FC
CE43 : FF FF 07    "   "    stx  XFF07
CE46 : D8 5A    " Z"    eorb  X005A
CE48 : BF D7 7E    "  ~"    sts  XD77E
CE4B : 7F FF B5    "   "    clr  XFFB5
CE4E : B5 AA FF    "   "    bita  XAAFF
CE51 : EE 5D    " ]"    ldx  $5D,x
CE53 : D5 55    " U"    bitb  X0055
CE55 : 29 21    ")!"    bvs  LCE78
CE57 : 48    "H"    asla
        ;
CE58 : FD    " "    db  $FD
        ;
CE59 : FF FF 17    "   "    stx  XFF17
        ;
CE5C : 75 DD    "u "    db  $75, $DD
        ;
CE5E : FE EA BF    "   "    ldx  XEABF
CE61 : FF EF 6A    "  j"    stx  XEF6A
CE64 : 2D F5    "- "    blt  LCE5B
CE66 : 77 DD 55    "w U"    asr  XDD55
CE69 : AA 25    " %"    oraa  $25,x
CE6B : 08    " "    inx
        ;
CE6C : 00    " "    db  $00
        ;
CE6D : 40    "@"    nega
CE6E : FE FF FF    "   "    ldx  XFFFF
        ;
CE71 : 00    " "    db  $00
        ;
CE72 : 35    "5"    txs
CE73 : 95 B5    "  "    bita  X00B5
CE75 : D4 BD    "  "    andb  X00BD
CE77 : FF 57 54    " WT"    stx  X5754
        ;
CE7A : 04    " "    db  $04
        ;
CE7B : D5 2A    " *"    bitb  X002A
        ;
CE7D : 55 21    "U!"    db  $55, $21
        ;
CE7F : 24 00    "$ "    bcc  LCE81
        ;
CE81        LCE81:
CE81 : 00 00 00    "   "    db  $00, $00, $00
        ;
CE84 : FE FF 57    "  W"    ldx  XFF57
        ;
CE87 : 00    " "    db  $00
        ;
CE88 : 9A 4A    " J"    oraa  X004A
CE8A : 53    "S"    comb
CE8B : 68 DF    "h "    asl  $DF,x
CE8D : FF 2B 2A    " +*"    stx  X2B2A
        ;
CE90 : 02    " "    db  $02
        ;
CE91 : B5 AA B6    "   "    bita  XAAB6
CE94 : 20 25    " %"    bra  LCEBB
        ;
CE96 : 00 00 00 00  "    "    db  $00, $00, $00, $00
CE9A : FC    " "    db  $FC
        ;
CE9B : FF BF 00    "   "    stx  XBF00
CE9E : 35    "5"    txs
CE9F : A5 A6    "  "    bita  $A6,x
CEA1 : E8 DF    "  "    eorb  $DF,x
CEA3        LCEA3:
CEA3 : FF AB A4    "   "    stx  XABA4
CEA6 : 10    " "    sba
CEA7 : D5 AA    "  "    bitb  X00AA
CEA9 : 5A    "Z"    decb
CEAA : 89 92    "  "    adca  #$92
        ;
CEAC : 00 00 00 00  "    "    db  $00, $00, $00, $00
CEB0 : FC    " "    db  $FC
        ;
CEB1        LCEB1:
CEB1 : FF 7F 01    "   "    stx  X7F01
CEB4 : B5 94 AA    "   "    bita  X94AA
CEB7 : D4 FF    "  "    andb  X00FF
CEB9 : FE 5F 2A    " _*"    ldx  X5F2A
        ;
CEBC : 21    "!"    db  $21
        ;
CEBD : AA AD    "  "    oraa  $AD,x
CEBF : AD 2A    " *"    jsr  $2A,x            ;INFO: index jump
        ;
CEC1        LCEC1:
CEC1 : 15 02 00 00  "    "    db  $15, $02, $00, $00
CEC5 : 00    " "    db  $00
        ;
CEC6 : F8 FF FF    "   "    eorb  XFFFF
        ;
CEC9 : 12    " "    db  $12
        ;
CECA : 6A 51    "jQ"    dec  $51,x
CECC : 2A D5    "* "    bpl  LCEA3
CECE : FF FF B7    "   "    stx  XFFB7
CED1 : 2A 21    "*!"    bpl  LCEF4
CED3 : AA B6    "  "    oraa  $B6,x
CED5 : B6 AA 4A    "  J"    ldaa  XAA4A
CED8 : 08    " "    inx
        ;
CED9 : 00 00 00    "   "    db  $00, $00, $00
        ;
CEDC : F0 FF FF    "   "    subb  XFFFF
CEDF : 0D    " "    sec
CEE0 : A9 A2    "  "    adca  $A2,x
CEE2 : 54    "T"    lsrb
CEE3 : B4 BF FF    "   "    anda  XBFFF
CEE6 : BF AA 82    "   "    sts  XAA82
CEE9 : 54    "T"    lsrb
        ;
CEEA : 55 5B    "U["    db  $55, $5B
        ;
CEEC : B5 4A 04    " J "    bita  X4A04
        ;
CEEF : 00 00 00    "   "    db  $00, $00, $00
        ;
CEF2 : E0 FF    "  "    subb  $FF,x
CEF4        LCEF4:
CEF4 : FF 57 54    " WT"    stx  X5754
CEF7 : A1 A4    "  "    cmpa  $A4,x
CEF9        XCEF9:
CEF9 : D4 DF    "  "    andb  X00DF
CEFB : FF 7F 55    "  U"    stx  X7F55
CEFE : 85 A8    "  "    bita  #$A8
CF00 : 2A AD    "* "    bpl  LCEAF
CF02 : AD 55    " U"    jsr  $55,x            ;INFO: index jump
CF04 : 11    " "    cba
        ;
CF05 : 00 00 00    "   "    db  $00, $00, $00
        ;
CF08 : C0 FF    "  "    subb  #$FF
CF0A : FF BF A8    "   "    stx  XBFA8
CF0D : 22 A2    "" "    bhi  LCEB1
CF0F : D4 7D    " }"    andb  X007D
CF11 : FF FF DA    "   "    stx  XFFDA
CF14 : 2A 48    "*H"    bpl  LCF5E
CF16 : 29 A9    ") "    bvs  LCEC1
CF18 : B5 B5 0A    "   "    bita  XB50A
CF1B : 01    " "    nop
        ;
CF1C : 00 00    "  "    db  $00, $00
        ;
CF1E : 80 FF    "  "    suba  #$FF
CF20 : FF BF DA    "   "    stx  XBFDA
CF23 : 2A 41    "*A"    bpl  LCF66
CF25 : 92 5A    " Z"    sbca  X005A
        ;
CF27 : FD    " "    db  $FD
        ;
CF28 : FF ED 5E    "  ^"    stx  XED5E
CF2B : 49    "I"    rola
CF2C : 2A 90    "* "    bpl  LCEBE
CF2E : AA AA    "  "    oraa  $AA,x
CF30 : 56    "V"    rorb
CF31 : 22 00    "" "    bhi  LCF33
        ;
CF33        LCF33:
CF33 : 00 00    "  "    db  $00, $00
        ;
CF35 : AF FE    "  "    sts  $FE,x
CF37 : FF BF B7    "   "    stx  XBFB7
CF3A : 4A    "J"    deca
        ;
CF3B : 12    " "    db  $12
        ;
CF3C : 4A    "J"    deca
CF3D : 54    "T"    lsrb
CF3E : BB AB FF    "   "    adda  XABFF
CF41 : DF 6E    " n"    stx  X006E
CF43 : 2D 02    "- "    blt  LCF47
CF45 : 22 45    ""E"    bhi  LCF8C
CF47        LCF47:
CF47 : 90 02    "  "    suba  X0002
        ;
CF49 : 00    " "    db  $00
        ;
CF4A : 80 56    " V"    suba  #$56
CF4C : FF FF DF    "   "    stx  XFFDF
        ;
CF4F : 5B 15    "[ "    db  $5B, $15
        ;
CF51 : 0A    " "    clv
CF52 : 0A    " "    clv
CF53 : AA 5A    " Z"    oraa  $5A,x
        ;
CF55 : 5B 5B    "[["    db  $5B, $5B
        ;
CF57 : FE DF D2    "   "    ldx  XDFD2
CF5A : 22 00    "" "    bhi  LCF5C
        ;
CF5C        LCF5C:
CF5C : 00    " "    db  $00
        ;
CF5D : 20 92    "  "    bra  LCEF1
        ;
CF5F : 00 00    "  "    db  $00, $00
        ;
CF61 : 0B    " "    sev
CF62 : DB FF    "  "    addb  X00FF
CF64 : AF AF    "  "    sts  $AF,x
        ;
CF66        LCF66:
CF66 : 05    " "    db  $05
        ;
CF67 : 09    " "    dex
        ;
CF68 : 12    " "    db  $12
        ;
CF69 : AA 6D    " m"    oraa  $6D,x
CF6B        LCF6B:
CF6B : 6F 6F    "oo"    clr  $6F,x
CF6D : FF FF BB    "   "    stx  XFFBB
        ;
CF70 : 05    " "    db  $05
        ;
CF71        LCF71:
CF71 : 11    " "    cba
CF72 : 95 D4    "  "    bita  X00D4
CF74 : BB 02 45    "  E"    adda  X0245
CF77 : 57    "W"    asrb
CF78 : FF FF FF 
CF7B : FF 1B 15    "   "    stx  X1B15
        ;
CF7E : 45    "E"    db  $45
        ;
CF7F : B5 DB 5B    "  ["    bita  XDB5B
CF82 : EF FF    "  "    stx  $FF,x
CF84 : DF AD    "  "    stx  X00AD
        ;
CF86 : 02 00    "  "    db  $02, $00
        ;
CF88 : 82 54    " T"    sbca  #$54
CF8A : 25 00    "% "    bcs  LCF8C
CF8C        LCF8C:
CF8C : 40    "@"    nega
CF8D : E5 FE    "  "    bitb  $FE,x
CF8F : FF B7 55    "  U"    stx  XB755
CF92 : 01    " "    nop
CF93 : 01    " "    nop
        ;
CF94 : 21    "!"    db  $21
        ;
CF95 : A9 AA    "  "    adca  $AA,x
CF97 : 92 AA    "  "    sbca  X00AA
CF99 : FF B5 15    "   "    stx  XB515
        ;
CF9C : 00 00 00    "   "    db  $00, $00, $00
        ;
CF9F : A9 04    "  "    adca  $04,x
        ;
CFA1 : 00    " "    db  $00
        ;
CFA2 : 88 74    " t"    eora  #$74
CFA4 : FF FF 6D    "  m"    stx  XFF6D
CFA7 : 35    "5"    txs
        ;
CFA8 : 02    " "    db  $02
        ;
CFA9 : 88 90    "  "    eora  #$90
CFAB : AA A5    "  "    oraa  $A5,x
CFAD : 6A F5    "j "    dec  $F5,x
CFAF : FF 77 15    " w "    stx  X7715
        ;
CFB2 : 00    " "    db  $00
        ;
CFB3 : 40    "@"    nega
CFB4 : 44    "D"    lsra
CFB5 : 95 08    "  "    bita  X0008
        ;
CFB7 : 00 72 FD    " r "    db  $00, $72, $FD
        ;
CFBA : FF FF BA    "   "    stx  XFFBA
CFBD : AD A2    "  "    jsr  $A2,x            ;INFO: index jump
CFBF : 44    "D"    lsra
CFC0 : 44    "D"    lsra
        ;
CFC1 : 55    "U"    db  $55
        ;
CFC2 : D5 FA    "  "    bitb  X00FA
        ;
CFC4 : FD    " "    db  $FD
        ;
CFC5 : FF BF 0A    "   "    stx  XBF0A
CFC8 : 40    "@"    nega
CFC9        LCFC9:
CFC9 : A1 28    " ("    cmpa  $28,x
        ;
CFCB        LCFCB:
CFCB : 45    "E"    db  $45
        ;
CFCC        LCFCC:
CFCC : 44    "D"    lsra
CFCD : 20 FA    "  "    bra  LCFC9
        ;
CFCF : F6 FF FF    "   "    ldab  XFFFF
CFD2 : FB B6 A2    "   "    addb  XB6A2
CFD5 : 48    "H"    asla
        ;
CFD6 : 52    "R"    db  $52
        ;
CFD7        LCFD7:
CFD7 : D5 B6    "  "    bitb  X00B6
CFD9 : F5 FF FF    "   "    bitb  XFFFF
CFDC : 5F    "_"    clrb
CFDD : 09    " "    dex
CFDE : 20 91    "  "    bra  LCF71
        ;
CFE0 : 28 89    "( "    bvc  LCF6B
CFE2 : 44    "D"    lsra
CFE3 : 20 FA    "  "    bra  LCFDF
        ;
CFE5 : FA FF FF    "   "    orab  XFFFF
CFE8 : F7 B6 48    "  H"    stab  XB648
CFEB : A4 48    " H"    anda  $48,x
CFED : B5 B5 FA    "   "    bita  XB5FA
CFF0 : FB FF AB    "   "    addb  XFFAB
        ;
CFF3 : 00    " "    db  $00
        ;
CFF4 : 40    "@"    nega
CFF5 : 88 24    " $"    eora  #$24
CFF7 : 91 54    " T"    cmpa  X0054
CFF9 : 28 D0    "( "    bvc  LCFCB
        ;
CFFB : C3    " "    db  $C3
        ;
CFFC : B7 FF F7    "   "    staa  XFFF7
CFFF : DA 45    " E"    orab  X0045
        ;
D001 : 45 45    "EE"    db  $45, $45
        ;
D003 : 54    "T"    lsrb
D004 : A5 A2    "  "    bita  $A2,x
D006 : FF 7F 95    "   "    stx  X7F95
        ;
D009 : 00    " "    db  $00
        ;
D00A : 40    "@"    nega
D00B : 88 44    " D"    eora  #$44
D00D : 44    "D"    lsra
        ;
D00E : 52    "R"    db  $52
        ;
D00F : 44    "D"    lsra
        ;
D010 : 02 55    " U"    db  $02, $55
        ;
D012 : EF FF    "  "    stx  $FF,x
D014 : FF DB 2D    "  -"    stx  XDB2D
        ;
D017 : 55 52    "UR"    db  $55, $52
        ;
D019 : A4 AA    "  "    anda  $AA,x
D01B : 4A    "J"    deca
D01C : FB FF 2D    "  -"    addb  XFF2D
D01F : 01    " "    nop
D020 : 80 10    "  "    suba  #$10
D022 : 92 48    " H"    sbca  X0048
D024 : AA 54    " T"    oraa  $54,x
        ;
D026 : 05    " "    db  $05
        ;
D027 : 54    "T"    lsrb
D028        LD028:
D028 : B5 FD FF    "   "    bita  XFDFF
D02B : DF 5D    " ]"    stx  X005D
        ;
D02D : 5B 55 52    "[UR"    db  $5B, $55, $52
        ;
D030 : A4 24    " $"    anda  $24,x
D032        LD032:
D032 : F6 FF AD    "   "    ldab  XFFAD
        ;
D035 : 02    " "    db  $02
        ;
D036 : 20 41    " A"    bra  LD079
        ;
D038 : 24 92    "$ "    bcc  LCFCC
D03A : AA 75    " u"    oraa  $75,x
        ;
D03C : 5B    "["    db  $5B
        ;
D03D : 80 24    " $"    suba  #$24
D03F : 6A 7F    "j "    dec  $7F,x
D041 : FF 7B EF    " { "    stx  X7BEF
D044 : 5A    "Z"    decb
        ;
D045 : 55    "U"    db  $55
        ;
D046 : 11    " "    cba
D047 : 22 E9    "" "    bhi  LD032
D049 : FF 75 15    " u "    stx  X7515
D04C : 24 89    "$ "    bcc  LCFD7
D04E : 44    "D"    lsra
D04F : A2 AA    "  "    sbca  $AA,x
        ;
D051 : ED    " "    db  $ED
        ;
D052 : 57    "W"    asrb
D053 : 49    "I"    rola
D054 : 08    " "    inx
D055 : A4 54    " T"    anda  $54,x
D057 : B5 EE EE    "   "    bita  XEEEE
D05A : BB 6D 95    " m "    adda  X6D95
        ;
D05D : 02    " "    db  $02
        ;
D05E : A9 FF    "  "    adca  $FF,x
D060 : B7 2B 91    " + "    staa  X2B91
D063 : 8A 2A    " *"    oraa  #$2A
D065 : A5 BA    "  "    bita  $BA,x
D067 : EE B7    "  "    ldx  $B7,x
D069 : 92 10    "  "    sbca  X0010
D06B : A2 AA    "  "    sbca  $AA,x
D06D : AA AA    "  "    oraa  $AA,x
D06F : 56    "V"    rorb
        ;
D070 : 55    "U"    db  $55
        ;
D071 : 25 04    "% "    bcs  LD077
        ;
D073 : 02    " "    db  $02
        ;
D074 : D1 FF    "  "    cmpb  X00FF
D076 : F7 AB 52    "  R"    stab  XAB52
        ;
D079        LD079:
D079 : 15    " "    db  $15
        ;
D07A : 95 AA    "  "    bita  X00AA
D07C : DE ED    "  "    ldx  X00ED
D07E : 6F 4B    "oK"    clr  $4B,x
        ;
D080 : 15    " "    db  $15
        ;
D081 : 24 A5    "$ "    bcc  LD028
D083 : AA AA    "  "    oraa  $AA,x
D085 : AA AA    "  "    oraa  $AA,x
        ;
D087 : 12    " "    db  $12
        ;
D088 : 20 40    " @"    bra  LD0CA
        ;
D08A : A0 FE    "  "    suba  $FE,x
D08C : BB AF A5    "   "    adda  XAFA5
D08F : 2A 29    "*)"    bpl  LD0BA
D091 : A5 F6    "  "    bita  $F6,x
        ;
D093 : ED    " "    db  $ED
        ;
D094 : DF 55    " U"    stx  X0055
D096 : AB 24    " $"    adda  $24,x
D098 : A9 A4    "  "    adca  $A4,x
D09A : AA 76    " v"    oraa  $76,x
D09C : AB 4A    " J"    adda  $4A,x
D09E : 10    " "    sba
D09F : 40    "@"    nega
D0A0 : 40    "@"    nega
D0A1 : 7D DD EF    "}  "    tst  XDDEF
D0A4 : 56    "V"    rorb
D0A5 : AD 2A    " *"    jsr  $2A,x            ;INFO: index jump
D0A7 : 49    "I"    rola
D0A8 : E9 DA    "  "    adcb  $DA,x
D0AA : 7D B7 DD    "}  "    tst  XB7DD
D0AD : AA 54    " T"    oraa  $54,x
D0AF : 91 54    " T"    cmpa  X0054
D0B1 : A9 AA    "  "    adca  $AA,x
D0B3 : 4A    "J"    deca
D0B4 : 82 00    "  "    sbca  #$00
        ;
D0B6 : 04    " "    db  $04
        ;
D0B7 : B9 DA FB    "   "    adca  XDAFB
D0BA        LD0BA:
D0BA : EE B6    "  "    ldx  $B6,x
D0BC : 56    "V"    rorb
D0BD : 29 51    ")Q"    bvs  LD110
D0BF : 49    "I"    rola
        ;
D0C0 : ED DD    "  "    db  $ED, $DD
        ;
D0C2 : FA 2A A8    " * "    orab  X2AA8
D0C5 : 6A FF    "j "    dec  $FF,x
D0C7 : 17    " "    tba
D0C8 : 40    "@"    nega
        ;
D0C9 : DD 42    " B"    db  $DD, $42
        ;
D0CB : B5 2B FA    " + "    bita  X2BFA
D0CE : 17    " "    tba
D0CF : A0 7F    "  "    suba  $7F,x
D0D1 : 81 F4    "  "    cmpa  #$F4
D0D3 : 95 A8    "  "    bita  X00A8
D0D5 : B7 80 6C    "  l"    staa  X806C
D0D8 : 57    "W"    asrb
D0D9 : 2A 55    "*U"    bpl  LD130
D0DB : 2B 84    "+ "    bmi  LD061
D0DD : EA AE    "  "    orab  $AE,x
D0DF : A2 7A    " z"    sbca  $7A,x
D0E1 : B7 00 A9    "   "    staa  $A9
D0E4 : EE 16    "  "    ldx  $16,x
D0E6 : E9 AF    "  "    adcb  $AF,x
D0E8 : AA 2A    " *"    oraa  $2A,x
D0EA : 48    "H"    asla
        ;
D0EB : FD DD    "  "    db  $FD, $DD
        ;
D0ED : AA AA    "  "    oraa  $AA,x
D0EF : 08    " "    inx
D0F0 : 29 55    ")U"    bvs  LD147
D0F2 : AD AA    "  "    jsr  $AA,x            ;INFO: index jump
D0F4 : AA 52    " R"    oraa  $52,x
        ;
D0F6        XD0F6:
D0F6 : 15    " "    db  $15
        ;
D0F7 : A8 AD    "  "    eora  $AD,x
D0F9 : 8A DA    "  "    oraa  #$DA
D0FB : 2B 48    "+H"    bmi  LD145
D0FD : AB 92    "  "    adda  $92,x
D0FF : B4 BE 28    "  ("    anda  XBE28
D102 : AB 63    " c"    adda  $63,x
D104 : A2 7A    " z"    sbca  $7A,x
D106 : 25 76    "%v"    bcs  LD17E
D108 : 57    "W"    asrb
        ;
D109 : 55    "U"    db  $55
        ;
D10A : AA 2A    " *"    oraa  $2A,x
D10C : B5 EA BB    "   "    bita  XEABB
D10F : D6 6A    " j"    ldab  X006A
        ;
D111 : 51    "Q"    db  $51
        ;
D112 : A8 F5    "  "    eora  $F5,x
D114 : 6A B5    "j "    dec  $B5,x
D116 : AA 52    " R"    oraa  $52,x
D118 : 25 D2    "% "    bcs  LD0EC
D11A : 5F    "_"    clrb
        ;
D11B : 51    "Q"    db  $51
        ;
D11C : BD 51 AA    " Q "    jsr  L51AA
D11F : AA 44    " D"    oraa  $44,x
D121 : A9 56    " V"    adca  $56,x
        ;
D123 : 45 52    "ER"    db  $45, $52
        ;
D125 : 2F 44    "/D"    ble  LD16B
        ;
D127 : 55 55    "UU"    db  $55, $55
        ;
D129 : AA 55    " U"    oraa  $55,x
D12B : A4 53    " S"    anda  $53,x
D12D : A9 DE    "  "    adca  $DE,x
D12F : 10    " "    sba
D130        LD130:
D130 : D5 15    "  "    bitb  X0015
D132 : AA 3A    " :"    oraa  $3A,x
        ;
D134 : 15    " "    db  $15
        ;
D135 : EA 9A    "  "    orab  $9A,x
        ;
D137 : 42 DD    "B "    db  $42, $DD
        ;
D139 : 4A    "J"    deca
D13A : AA 5E    " ^"    oraa  $5E,x
D13C : 49    "I"    rola
D13D : 4A    "J"    deca
        ;
D13E : 75    "u"    db  $75
        ;
D13F : 8D 55    " U"    bsr  LD196
D141 : 8B AA    "  "    adda  #$AA
        ;
D143 : 52    "R"    db  $52
        ;
D144 : 6A 25    "j%"    dec  $25,x
D146 : EA 4F    " O"    orab  $4F,x
D148 : 50    "P"    negb
        ;
D149 : DD    " "    db  $DD
        ;
D14A : AA EA    "  "    oraa  $EA,x
D14C : BA 42 75    " Bu"    oraa  X4275
D14F : A5 AA    "  "    bita  $AA,x
D151 : 57    "W"    asrb
D152 : 59    "Y"    rolb
D153 : AB A8    "  "    adda  $A8,x
        ;
D155 : 55 55 65    "UUe"    db  $55, $55, $65
        ;
D158 : AB A4    "  "    adda  $A4,x
        ;
D15A        LD15A:
D15A : 3A 05    ": "    db  $3A, $05
        ;
D15C : D9 EA    "  "    adcb  X00EA
D15E : AA 54    " T"    oraa  $54,x
D160 : A5 75    " u"    bita  $75,x
        ;
D162 : 55    "U"    db  $55
        ;
D163 : BD 55 71    " Uq"    jsr  L5571
D166        LD166:
D166 : AD 22    " ""    jsr  $22,x            ;INFO: index jump
D168        LD168:
D168 : F5 55 4A    " UJ"    bitb  X554A
D16B        LD16B:
D16B : F5 8A 32    "  2"    bitb  X8A32
D16E : AB 6A    " j"    adda  $6A,x
D170 : 85 52    " R"    bita  #$52
D172 : 95 B2    "  "    bita  X00B2
D174 : BA 22 B5    " " "    oraa  X22B5
D177 : 33    "3"    pulb
        ;
D178 : 12    " "    db  $12
        ;
D179 : D5 BE    "  "    bitb  X00BE
        ;
D17B : 55    "U"    db  $55
        ;
D17C : AD 42    " B"    jsr  $42,x            ;INFO: index jump
D17E        LD17E:
D17E : 54    "T"    lsrb
D17F : D5 AA    "  "    bitb  X00AA
D181 : FA 0A B5    "   "    orab  X0AB5
D184 : 96 A2    "  "    ldaa  $A2
D186 : AA 55    " U"    oraa  $55,x
D188 : A8 AB    "  "    eora  $AB,x
D18A : 22 DA    "" "    bhi  LD166
D18C : 95 A4    "  "    bita  X00A4
D18E : 5A    "Z"    decb
        ;
D18F : 55    "U"    db  $55
        ;
D190 : F5 AA AA    "   "    bitb  XAAAA
D193 : AA EA    "  "    oraa  $EA,x
D195 : AE 4B    " K"    lds  $4B,x
D197 : A9 77    " w"    adca  $77,x
        ;
D199 : 05    " "    db  $05
        ;
D19A : AA 5D    " ]"    oraa  $5D,x
        ;
D19C : 45    "E"    db  $45
        ;
D19D : AA AA    "  "    oraa  $AA,x
D19F : 48    "H"    asla
D1A0 : 4A    "J"    deca
D1A1 : 54    "T"    lsrb
D1A2 : A9 8A    "  "    adca  $8A,x
D1A4 : 44    "D"    lsra
D1A5 : 24 A9    "$ "    bcc  LD150
        ;
D1A7 : 52 55    "RU"    db  $52, $55
        ;
D1A9 : F7 FF 77    "  w"    stab  XFF77
D1AC : B7 AB AA    "   "    staa  XABAA
D1AF : 56    "V"    rorb
D1B0 : AB AA    "  "    adda  $AA,x
D1B2 : 4A    "J"    deca
        ;
D1B3 : 42    "B"    db  $42
        ;
D1B4 : 08    " "    inx
D1B5 : 82 10    "  "    sbca  #$10
D1B7 : 0A    " "    clv
D1B8 : 82 10    "  "    sbca  #$10
D1BA : 10    " "    sba
D1BB : F4 FF FF    "   "    andb  XFFFF
D1BE : B5 5A 42    " ZB"    bita  X5A42
D1C1 : A4 FD    "  "    anda  $FD,x
D1C3 : FB BB 55    "  U"    addb  XBB55
D1C6 : 22 92    "" "    bhi  LD15A
D1C8 : 4A    "J"    deca
D1C9 : 29 55    ")U"    bvs  LD220
        ;
D1CB : 02 00    "  "    db  $02, $00
        ;
D1CD : 08    " "    inx
        ;
D1CE : 02    " "    db  $02
        ;
D1CF : 80 E8    "  "    suba  #$E8
D1D1 : FF FF 57    "  W"    stx  XFF57
        ;
D1D4 : 55    "U"    db  $55
        ;
D1D5 : 84 48    " H"    anda  #$48
        ;
D1D7 : ED    " "    db  $ED
        ;
D1D8 : FF EF AD    "   "    stx  XEFAD
D1DB : 8A 24    " $"    oraa  #$24
        ;
D1DD : 55 55 55 45  "UUUE"    db  $55, $55, $55, $45
D1E1 : 00    " "    db  $00
        ;
D1E2 : 20 84    "  "    bra  LD168
D1E4 : 20 00    "  "    bra  LD1E6
        ;
D1E6        LD1E6:
D1E6 : 68 FF    "h "    asl  $FF,x
D1E8 : FF AF AA    "   "    stx  XAFAA
        ;
D1EB : 04    " "    db  $04
        ;
D1EC : A2 FA    "  "    sbca  $FA,x
D1EE : FF FB B6    "   "    stx  XFBB6
D1F1 : 8A A4    "  "    oraa  #$A4
D1F3 : 54    "T"    lsrb
D1F4 : A5 5A    " Z"    bita  $5A,x
        ;
D1F6 : 45 00    "E "    db  $45, $00
        ;
D1F8 : 08    " "    inx
        ;
D1F9 : 42 00    "B "    db  $42, $00
        ;
D1FB : 08    " "    inx
D1FC : E8 FF    "  "    eorb  $FF,x
D1FE : FF AB 55    "  U"    stx  XAB55
        ;
D201 : 04    " "    db  $04
        ;
D202        XD202:
D202 : 50    "P"    negb
D203 : FB FF EF    "   "    addb  XFFEF
D206 : AD 22    " ""    jsr  $22,x            ;INFO: index jump
D208 : 49    "I"    rola
        ;
D209 : 55 55    "UU"    db  $55, $55
        ;
D20B : B5 22 00    " " "    bita  X2200
D20E : 10    " "    sba
        ;
D20F : 02    " "    db  $02
        ;
D210 : 10    " "    sba
        ;
D211 : 00 FD    "  "    db  $00, $FD
        ;
D213 : FF 7F AD    "   "    stx  X7FAD
D216 : 0A    " "    clv
D217 : 40    "@"    nega
D218 : B4 FF FF    "   "    anda  XFFFF
D21B : DE 2A    " *"    ldx  X002A
D21D : 92 AA    "  "    sbca  X00AA
D21F : AA 6A    " j"    oraa  $6A,x
D221 : AB 00    "  "    adda  $00,x
D223 : 80 10    "  "    suba  #$10
        ;
D225 : 02 00    "  "    db  $02, $00
        ;
D227 : D0 FF    "  "    subb  X00FF
D229 : FF AF AA    "   "    stx  XAFAA
        ;
D22C : 00    " "    db  $00
        ;
D22D : 50    "P"    negb
        ;
D22E : FD    " "    db  $FD
        ;
D22F : FB FF AE    "   "    addb  XFFAE
D232 : 44    "D"    lsra
D233 : AA AA    "  "    oraa  $AA,x
D235 : D4 6E    " n"    andb  X006E
        ;
D237 : 05    " "    db  $05
        ;
D238 : 80 10    "  "    suba  #$10
D23A : 82 80    "  "    sbca  #$80
        ;
D23C : 00 FC    "  "    db  $00, $FC
        ;
D23E : FF FF 5A    "  Z"    stx  XFF5A
        ;
D241 : 05    " "    db  $05
        ;
D242 : 80 74    " t"    suba  #$74
D244 : FF EF BF    "   "    stx  XEFBF
D247 : 25 52    "%R"    bcs  LD29B
D249 : AD 92    "  "    jsr  $92,x            ;INFO: index jump
D24B : 7A 2B 40    "z+@"    dec  X2B40
D24E : 10    " "    sba
        ;
D24F : 04    " "    db  $04
        ;
D250 : 09    " "    dex
        ;
D251 : 00    " "    db  $00
        ;
D252 : E0 FF    "  "    subb  $FF,x
D254 : FF 57 4B    " WK"    stx  X574B
        ;
D257 : 00    " "    db  $00
        ;
D258 : A8 FF    "  "    eora  $FF,x
        ;
D25A : FD    " "    db  $FD
        ;
D25B : EF 25    " %"    stx  $25,x
D25D : A1 5A    " Z"    cmpa  $5A,x
D25F : AB ED    "  "    adda  $ED,x
D261 : 16    " "    tab
        ;
D262 : 00    " "    db  $00
        ;
D263 : 91 00    "  "    cmpa  X0000
D265 : 50    "P"    negb
D266 : 11    " "    cba
        ;
D267 : 00    " "    db  $00
        ;
D268 : FE FF 57    "  W"    ldx  XFF57
        ;
D26B : 3A 00    ": "    db  $3A, $00
        ;
D26D : F0 FF AF    "   "    subb  XFFAF
D270 : AF 00    "  "    sts  $00,x
D272 : F0 FF DA    "   "    subb  XFFDA
D275 : AE 00    "  "    lds  $00,x
D277 : E8 0A    "  "    eorb  $0A,x
D279 : A2 2D    " -"    sbca  $2D,x
        ;
D27B : 00 00    "  "    db  $00, $00
        ;
D27D : 80 FF    "  "    suba  #$FF
D27F : FF 11 0A    "   "    stx  X110A
D282 : 80 FF    "  "    suba  #$FF
D284 : FF D2 02    "   "    stx  XD202
D287 : C0 FF    "  "    subb  #$FF
D289 : BF B6 00    "   "    sts  XB600
D28C : E8 2E    " ."    eorb  $2E,x
D28E : A4 35    " 5"    anda  $35,x
        ;
D290 : 00 02 00    "   "    db  $00, $02, $00
        ;
D293 : F0 FF 1F    "   "    subb  XFF1F
D296 : 85 00    "  "    bita  #$00
D298 : F8 FF 97    "   "    eorb  XFF97
        ;
D29B        LD29B:
D29B : 1A 00    "  "    db  $1A, $00
        ;
D29D : FF FF AA    "   "    stx  XFFAA
        ;
D2A0 : 45    "E"    db  $45
        ;
D2A1 : 40    "@"    nega
D2A2 : 5F    "_"    clrb
D2A3 : 85 AA    "  "    bita  #$AA
        ;
D2A5 : 04    " "    db  $04
        ;
D2A6 : 80 00    "  "    suba  #$00
        ;
D2A8 : 00    " "    db  $00
        ;
D2A9 : FE FF 43    "  C"    ldx  XFF43
        ;
D2AC : 21 00    "! "    db  $21, $00
        ;
D2AE : FF FF 52    "  R"    stx  XFF52
        ;
D2B1 : 05    " "    db  $05
        ;
D2B2 : E0 FF    "  "    subb  $FF,x
D2B4 : 5F    "_"    clrb
D2B5 : DA 10    "  "    orab  X0010
D2B7 : D8 57    " W"    eorb  X0057
D2B9 : A0 AA    "  "    suba  $AA,x
        ;
D2BB : 00 02 02    "   "    db  $00, $02, $02
        ;
D2BE : 80 FF    "  "    suba  #$FF
D2C0 : FF 21 08    " ! "    stx  X2108
D2C3 : C0 FF    "  "    subb  #$FF
D2C5 : 7F A4 02    "   "    clr  XA402
D2C8 : F8 FF 97    "   "    eorb  XFF97
        ;
D2CB : 3A    ":"    db  $3A
        ;
D2CC : 01    " "    nop
D2CD : F5 15 A2    "   "    bitb  X15A2
        ;
D2D0 : 55 00 00    "U  "    db  $55, $00, $00
        ;
D2D3 : 01    " "    nop
D2D4 : E0 FF    "  "    subb  $FF,x
D2D6 : 3F    "?"    swi
        ;
D2D7 : 00    " "    db  $00
        ;
D2D8 : 01    " "    nop
D2D9 : F4 FF 0F    "   "    andb  XFF0F
D2DC : B2 00 FD    "   "    sbca  X00FD
D2DF : FF A3 96    "   "    stx  XA396
D2E2 : 80 EE    "  "    suba  #$EE
D2E4 : 85 A8    "  "    bita  #$A8
        ;
D2E6 : 15 00 00 00  "    "    db  $15, $00, $00, $00
        ;
D2EA : F8 FF 0F    "   "    eorb  XFF0F
D2ED : 40    "@"    nega
        ;
D2EE : 00    " "    db  $00
        ;
D2EF : FE FF 03    "   "    ldx  XFF03
        ;
D2F2 : 1A    " "    db  $1A
        ;
D2F3 : 44    "D"    lsra
D2F4 : FF 7F D1    "   "    stx  X7FD1
D2F7 : 4A    "J"    deca
D2F8 : 40    "@"    nega
D2F9 : BF 41 D8    " A "    sts  X41D8
D2FC : 0A    " "    clv
        ;
D2FD : 00 00    "  "    db  $00, $00
        ;
D2FF : 01    " "    nop
D300 : FE FF 03    "   "    ldx  XFF03
D303 : 10    " "    sba
D304 : 80 FF    "  "    suba  #$FF
D306 : FF 00 4B    "  K"    stx  X004B
D309 : 60 FF    "` "    neg  $FF,x
D30B : 7F D0 4A    "  J"    clr  XD04A
D30E : C0 EF    "  "    subb  #$EF
        ;
D310 : 02    " "    db  $02
        ;
D311 : EA 12    "  "    orab  $12,x
        ;
D313 : 00 00    "  "    db  $00, $00
        ;
D315 : 01    " "    nop
D316 : FF FF 01    "   "    stx  XFF01
D319 : 10    " "    sba
D31A : C0 FF    "  "    subb  #$FF
D31C : FF 00 8D    "   "    stx  X008D
D31F : D0 FF    "  "    subb  X00FF
D321 : 3F    "?"    swi
D322 : A2 12    "  "    sbca  $12,x
D324 : C8 DF    "  "    eorb  #$DF
        ;
D326 : 02    " "    db  $02
        ;
D327 : 6A 05    "j "    dec  $05,x
        ;
D329 : 00    " "    db  $00
        ;
D32A : 40    "@"    nega
        ;
D32B : 00    " "    db  $00
        ;
D32C : FF FF 01    "   "    stx  XFF01
D32F : 08    " "    inx
D330 : C0 FF    "  "    subb  #$FF
D332 : FF 00 26    "  &"    stx  X0026
D335 : D1 FF    "  "    cmpb  X00FF
D337 : 3F    "?"    swi
D338 : 90 24    " $"    suba  X0024
D33A : A4 BD    "  "    anda  $BD,x
D33C : 01    " "    nop
D33D : D2 15    "  "    sbcb  X0015
        ;
D33F        LD33F:
D33F : 00    " "    db  $00
        ;
D340 : 88 00    "  "    eora  #$00
D342 : FE FF 03    "   "    ldx  XFF03
D345 : 70 00 FF    "p  "    neg  X00FF
D348 : FF 03 54    "  T"    stx  X0354
D34B : 49    "I"    rola
D34C : FF FF 01    "   "    stx  XFF01
D34F : A4 42    " B"    anda  $42,x
D351 : DA 16    "  "    orab  X0016
D353 : E9 6E    " n"    adcb  $6E,x
        ;
D355        LD355:
D355 : 00 00    "  "    db  $00, $00
        ;
D357 : 08    " "    inx
D358 : F8 FF 0F    "   "    eorb  XFF0F
D35B : C0 10    "  "    subb  #$10
D35D : FE FF 0F    "   "    ldx  XFF0F
D360 : 50    "P"    negb
D361 : 95 FA    "  "    bita  X00FA
D363 : FF 03 C8    "   "    stx  X03C8
D366 : 0A    " "    clv
D367 : D2 B6    "  "    sbcb  X00B6
D369 : 54    "T"    lsrb
D36A : BB 00 00    "   "    adda  X0000
        ;
D36D : 00    " "    db  $00
        ;
D36E : F8 FF 3F    "  ?"    eorb  XFF3F
D371 : 80 41    " A"    suba  #$41
D373 : F4 FF 3F    "  ?"    andb  XFF3F
D376 : A0 2A    " *"    suba  $2A,x
D378 : EA FF    "  "    orab  $FF,x
D37A : 0F    " "    sei
D37B : 90 0A    "  "    suba  X000A
        ;
D37D : 51 DD    "Q "    db  $51, $DD
        ;
D37F        LD37F:
D37F : 5A    "Z"    decb
        ;
D380 : 5B    "["    db  $5B
        ;
D381 : 01    " "    nop
        ;
D382 : 00 00    "  "    db  $00, $00
        ;
D384 : F0 FF 7F    "   "    subb  XFF7F
        ;
D387 : 00 83    "  "    db  $00, $83
        ;
D389 : F0 FF 7F    "   "    subb  XFF7F
D38C : 81 2A    " *"    cmpa  #$2A
D38E : 54    "T"    lsrb
D38F : FF 3F 08    " ? "    stx  X3F08
D392 : 09    " "    dex
        ;
D393 : 41 FD    "A "    db  $41, $FD
        ;
D395 : BB AA 02    "   "    adda  XAA02
        ;
D398 : 00 00    "  "    db  $00, $00
        ;
D39A : A0 FF    "  "    suba  $FF,x
D39C : FF 01 0C    "   "    stx  X010C
D39F : C0 FF    "  "    subb  #$FF
D3A1 : FF 83 22    "  ""    stx  X8322
D3A4 : 91 FE    "  "    cmpa  X00FE
D3A6        LD3A6:
D3A6 : FF 10 88    "   "    stx  X1088
D3A9 : 20 FB    "  "    bra  LD3A6
        ;
D3AB : BF 15 09    "   "    sts  X1509
        ;
D3AE : 00 00    "  "    db  $00, $00
        ;
D3B0 : 40    "@"    nega
D3B1 : FF FF 17    "   "    stx  XFF17
D3B4 : 20 00    "  "    bra  LD3B6
        ;
D3B6        LD3B6:
D3B6 : FF FF 2F    "  /"    stx  XFF2F
D3B9 : 24 84    "$ "    bcc  LD33F
D3BB : F4 FF 87    "   "    andb  XFF87
D3BE : 80 28    " ("    suba  #$28
        ;
D3C0 : DD    " "    db  $DD
        ;
D3C1 : DF 55    " U"    stx  X0055
D3C3 : 11    " "    cba
        ;
D3C4 : 00 00    "  "    db  $00, $00
        ;
D3C6 : 20 FD    "  "    bra  LD3C5
        ;
D3C8 : FF 9F 00    "   "    stx  X9F00
        ;
D3CB : 00    " "    db  $00
        ;
D3CC : EE FF    "  "    ldx  $FF,x
D3CE : 7F 08 22    "  ""    clr  X0822
D3D1 : E2 FF    "  "    sbcb  $FF,x
D3D3 : 2F 80    "/ "    ble  LD355
D3D5 : AA 5A    " Z"    oraa  $5A,x
D3D7 : BD AD 80    "   "    jsr  LAD80
        ;
D3DA : 00 00    "  "    db  $00, $00
        ;
D3DC : 20 FF    "  "    bra  LD3DD
        ;
D3DE : FF 1F 80    "   "    stx  X1F80
        ;
D3E1 : 00    " "    db  $00
        ;
D3E2 : FA FF 7F    "   "    orab  XFF7F
D3E5 : 11    " "    cba
D3E6 : 08    " "    inx
D3E7 : D2 FF    "  "    sbcb  X00FF
D3E9        XD3E9:
D3E9 : 2F 94    "/ "    ble  LD37F
D3EB : 2E 91    ". "    bgt  LD37E
D3ED : DA 85    "  "    orab  X0085
D3EF : 50    "P"    negb
D3F0 : 0B    " "    sev
        ;
D3F1 : 00 00    "  "    db  $00, $00
        ;
D3F3 : FE FF 7F    "   "    ldx  XFF7F
D3F6 : 40    "@"    nega
        ;
D3F7 : 00    " "    db  $00
        ;
D3F8 : DA FF    "  "    orab  X00FF
D3FA : FF 05 41    "  A"    stx  X0541
D3FD : A8 FF    "  "    eora  $FF,x
D3FF : 2F B6    "/ "    ble  LD3B7
D401 : 17    " "    tba
D402 : 20 B9    "  "    bra  LD3BD
        ;
D404 : A4 FD    "  "    anda  $FD,x
        ;
D406 : 05 00 00    "   "    db  $05, $00, $00
        ;
D409 : FE FF 7F    "   "    ldx  XFF7F
        ;
D40C : 00 00    "  "    db  $00, $00
        ;
D40E : D4 FF    "  "    andb  X00FF
D410 : FF 15 00    "   "    stx  X1500
D413 : E2 FE    "  "    sbcb  $FE,x
D415 : D7 6F    " o"    stab  X006F
D417 : 01    " "    nop
D418 : 88 24    " $"    eora  #$24
D41A : F5 BF 00    "   "    bitb  XBF00
        ;
D41D : 00    " "    db  $00
        ;
D41E : 80 FF    "  "    suba  #$FF
D420 : FF 1F 08    "   "    stx  X1F08
        ;
D423 : 00 FC    "  "    db  $00, $FC
        ;
D425 : FF 7F 23    "  #"    stx  X7F23
        ;
D428 : 00    " "    db  $00
        ;
D429 : D8 7F    "  "    eorb  X007F
D42B : F7 3B 00    " ; "    stab  X3B00
D42E : 82 A4    "  "    sbca  #$A4
D430 : FE 17 00    "   "    ldx  X1700
        ;
D433 : 00    " "    db  $00
        ;
D434 : E8 FF    "  "    eorb  $FF,x
D436 : FF 43 00    " C "    stx  X4300
D439 : 80 FF    "  "    suba  #$FF
D43B : FF BF 02    "   "    stx  XBF02
D43E : 80 FA    "  "    suba  #$FA
D440 : BF FE 2E    "  ."    sts  XFE2E
        ;
D443 : 00    " "    db  $00
        ;
D444 : 50    "P"    negb
D445 : 54    "T"    lsrb
D446 : FF 0B 00    "   "    stx  X0B00
        ;
D449 : 00    " "    db  $00
        ;
D44A : FE FF 7F    "   "    ldx  XFF7F
D44D : 09    " "    dex
        ;
D44E : 00    " "    db  $00
        ;
D44F : E0 FF    "  "    subb  $FF,x
D451 : FF 5F 01    " _ "    stx  X5F01
D454 : 40    "@"    nega
D455 : FE B7 FF    "   "    ldx  XB7FF
        ;
D458 : 05 00 12    "   "    db  $05, $00, $12
        ;
D45B : F5 7F 01    "   "    bitb  X7F01
        ;
D45E : 00    " "    db  $00
        ;
D45F : E0 FF    "  "    subb  $FF,x
D461 : FF AF 02    "   "    stx  XAF02
        ;
D464 : 00 FC    "  "    db  $00, $FC
        ;
D466 : FF FF 2D    "  -"    stx  XFF2D
        ;
D469 : 00    " "    db  $00
        ;
D46A : C8 DF    "  "    eorb  #$DF
        ;
D46C : ED    " "    db  $ED
        ;
D46D : FF 02 00    "   "    stx  X0200
D470 : 91 FA    "  "    cmpa  X00FA
D472 : 5F    "_"    clrb
        ;
D473 : 00 00    "  "    db  $00, $00
        ;
D475 : FE FF FF    "   "    ldx  XFFFF
D478 : 0A    " "    clv
        ;
D479 : 02    " "    db  $02
        ;
D47A : C0 FF    "  "    subb  #$FF
D47C : FF 77 03    " w "    stx  X7703
        ;
D47F : 00    " "    db  $00
        ;
D480 : F6 B7 FA    "   "    ldab  XB7FA
D483 : BF 00 40    "  @"    sts  X0040
D486 : 91 FA    "  "    cmpa  X00FA
        ;
D488 : 8F 00    "  "    db  $8F, $00
        ;
D48A : E0 FF    "  "    subb  $FF,x
D48C : FF DF 00    "   "    stx  XDF00
        ;
D48F : 00 FD    "  "    db  $00, $FD
        ;
D491 : FF BF 5B    "  ["    stx  XBF5B
        ;
D494 : 02    " "    db  $02
        ;
D495 : C0 7E    " ~"    subb  #$7E
D497 : 9B FE    "  "    adda  X00FE
        ;
D499 : 1F 00    "  "    db  $1F, $00
        ;
D49B : 50    "P"    negb
        ;
D49C : 42    "B"    db  $42
        ;
D49D : 7D 17 00    "}  "    tst  X1700
        ;
D4A0 : FC    " "    db  $FC
        ;
D4A1 : FF FF 5E    "  ^"    stx  XFF5E
        ;
D4A4 : 00    " "    db  $00
        ;
D4A5 : C0 FE    "  "    subb  #$FE
D4A7 : FF DF 25    "  %"    stx  XDF25
        ;
D4AA : 00    " "    db  $00
        ;
D4AB : 6A EF    "j "    dec  $EF,x
D4AD : AA FE    "  "    oraa  $FE,x
D4AF : 0F    " "    sei
        ;
D4B0 : 00    " "    db  $00
        ;
D4B1 : 50    "P"    negb
D4B2 : 22 76    ""v"    bhi  LD52A
        ;
D4B4 : 03    " "    db  $03
        ;
D4B5 : F0 FF FF    "   "    subb  XFFFF
D4B8 : F5 15 00    "   "    bitb  X1500
D4BB : F8 FF FF    "   "    eorb  XFFFF
D4BE : B7 00 A1    "   "    staa  $A1
D4C1 : B6 DB 96    "   "    ldaa  XDB96
D4C4 : F8 2E 00    " . "    eorb  X2E00
D4C7 : 40    "@"    nega
D4C8 : 01    " "    nop
        ;
D4C9 : 14 FD    "  "    db  $14, $FD
        ;
D4CB : FF FF D5    "   "    stx  XFFD5
        ;
D4CE : 52 00    "R "    db  $52, $00
        ;
D4D0 : EA FF    "  "    orab  $FF,x
D4D2 : FF F7 05    "   "    stx  XF705
D4D5 : 80 76    " v"    suba  #$76
D4D7 : 57    "W"    asrb
        ;
D4D8 : DD    " "    db  $DD
        ;
D4D9 : 0A    " "    clv
D4DA : C0 7E    " ~"    subb  #$7E
D4DC : 01    " "    nop
D4DD : 80 04    "  "    suba  #$04
D4DF : C0 FF    "  "    subb  #$FF
D4E1 : FF B7 56    "  V"    stx  XB756
        ;
D4E4 : 00    " "    db  $00
        ;
D4E5 : E8 DF    "  "    eorb  $DF,x
D4E7 : BF FF 2D    "  -"    sts  XFF2D
D4EA : 08    " "    inx
D4EB : 54    "T"    lsrb
D4EC : BB DB 56    "  V"    adda  XDB56
        ;
D4EF : 04 00    "  "    db  $04, $00
        ;
D4F1 : FF 08 00    "   "    stx  X0800
        ;
D4F4 : 04    " "    db  $04
        ;
D4F5 : FA FF FF    "   "    orab  XFFFF
D4F8 : A9 00    "  "    adca  $00,x
D4FA : 40    "@"    nega
D4FB : FF FF FE    "   "    stx  XFFFE
D4FE : BE 00 D1    "   "    lds  X00D1
D501 : 5A    "Z"    decb
D502 : DB BF    "  "    addb  X00BF
        ;
D504 : 02 00    "  "    db  $02, $00
        ;
D506 : A0 F6    "  "    suba  $F6,x
D508 : 0A    " "    clv
        ;
D509 : 00    " "    db  $00
        ;
D50A        XD50A:
D50A : F0 FF FF    "   "    subb  XFFFF
D50D : 7F 03 00    "   "    clr  X0300
D510 : EA FE    "  "    orab  $FE,x
D512 : FF FF 45    "  E"    stx  XFF45
D515 : 40    "@"    nega
D516        XD516:
D516 : B5 B5 FE    "   "    bita  XB5FE
        ;
D519 : 5B 00 00    "[  "    db  $5B, $00, $00
        ;
D51C : 08    " "    inx
D51D : BA 0F 80    "   "    oraa  X0F80
D520 : FB FF F7    "   "    addb  XFFF7
D523 : DF 00    "  "    stx  X0000
D525 : 40    "@"    nega
D526 : EF FB    "  "    stx  $FB,x
D528 : FF 5F 80    " _ "    stx  X5F80
D52B : 54    "T"    lsrb
        ;
D52C : 55    "U"    db  $55
        ;
D52D        LD52D:
D52D : F7 BF 02    "   "    stab  XBF02
D530 : 40    "@"    nega
        ;
D531 : 00 00    "  "    db  $00, $00
        ;
D533 : BA 0D FA    "   "    oraa  X0DFA
D536 : FF 57 FD    " W "    stx  X57FD
D539 : 27 00    "' "    beq  LD53B
D53B        LD53B:
D53B : BA DB FF    "   "    oraa  XDBFF
D53E : FF 0B 48    "  H"    stx  X0B48
D541 : 25 EA    "% "    bcs  LD52D
D543 : FF 8B 20    "   "    stx  X8B20
D546 : 01    " "    nop
        ;
D547 : 00    " "    db  $00
        ;
D548 : 10    " "    sba
D549 : 24 F9    "$ "    bcc  LD544
D54B : FF BF B6    "   "    stx  XBFB6
        ;
D54E : 13    " "    db  $13
        ;
D54F : 80 BE    "  "    suba  #$BE
        ;
D551 : 55 FD    "U "    db  $55, $FD
        ;
D553 : FF 2F 55    " /U"    stx  X2F55
D556 : 09    " "    dex
D557        LD557:
D557 : 60 FF    "` "    neg  $FF,x
D559 : 57    "W"    asrb
D55A : 4A    "J"    deca
        ;
D55B : 05 00 00 02  "    "    db  $05, $00, $00, $02
        ;
D55F : 40    "@"    nega
D560 : FF FF B7    "   "    stx  XFFB7
D563 : 37    "7"    pshb
        ;
D564 : 00    " "    db  $00
        ;
D565 : F8 9B EA    "   "    eorb  X9BEA
D568 : FF AF F4    "   "    stx  XAFF4
D56B : 16    " "    tab
D56C : 40    "@"    nega
        ;
D56D : FD    " "    db  $FD
        ;
D56E : AD 6A    " j"    jsr  $6A,x            ;INFO: index jump
        ;
D570 : 4B 00 00    "K  "    db  $4B, $00, $00
        ;
D573 : 01    " "    nop
        ;
D574 : 00    " "    db  $00
        ;
D575 : D0 FF    "  "    subb  X00FF
D577 : FF DF 02    "   "    stx  XDF02
        ;
D57A : 00    " "    db  $00
        ;
D57B : BD EB FE    "   "    jsr  LEBFE
D57E : 7F 4D D7    " M "    clr  X4DD7
D581 : 24 D4    "$ "    bcc  LD557
D583        LD583:
D583 : 6D AD    "m "    tst  $AD,x
        ;
D585 : 5B 04 00 02  "[   "    db  $5B, $04, $00, $02
D589 : 00 00    "  "    db  $00, $00
        ;
D58B : D0 FF    "  "    subb  X00FF
D58D : FF 7F 03    "   "    stx  X7F03
        ;
D590 : 00    " "    db  $00
        ;
D591 : BD B5 FF    "   "    jsr  LB5FF
D594 : BF 6A 57    " jW"    sts  X6A57
D597 : A1 BA    "  "    cmpa  $BA,x
D599 : 4A    "J"    deca
        ;
D59A : ED 15    "  "    db  $ED, $15
        ;
D59C : 20 02    "  "    bra  LD5A0
        ;
D59E : 00 00 00 FC  "    "    db  $00, $00, $00, $FC
        ;
D5A2 : FF FF 5F    "  _"    stx  XFF5F
        ;
D5A5 : 00    " "    db  $00
        ;
D5A6 : 50    "P"    negb
D5A7 : B5 FE FF    "   "    bita  XFEFF
D5AA : EB 6E    " n"    addb  $6E,x
D5AC : 22 6D    ""m"    bhi  LD61B
        ;
D5AE : 13    " "    db  $13
        ;
D5AF : EA 5B    " ["    orab  $5B,x
D5B1 : 90 24    " $"    suba  X0024
        ;
D5B3 : 00 00 00    "   "    db  $00, $00, $00
        ;
D5B6 : 80 FF    "  "    suba  #$FF
D5B8 : FF FF 0B    "   "    stx  XFF0B
        ;
D5BB : 00    " "    db  $00
        ;
D5BC : 29 ED    ") "    bvs  LD5AB
D5BE : FF 7F 5F    "  _"    stx  X7F5F
D5C1 : 85 7A    " z"    bita  #$7A
D5C3 : 25 6A    "%j"    bcs  LD62F
D5C5 : 2F 49    "/I"    ble  LD610
D5C7 : 95 00    "  "    bita  X0000
D5C9 : 08    " "    inx
        ;
D5CA : 00 00    "  "    db  $00, $00
        ;
D5CC : E0 FF    "  "    subb  $FF,x
D5CE : FF FF 02    "   "    stx  XFF02
D5D1 : 20 A5    "  "    bra  LD578
        ;
D5D3 : EE FF    "  "    ldx  $FF,x
D5D5 : 7F 57 D5    " W "    clr  X57D5
D5D8 : AD 88    "  "    jsr  $88,x            ;INFO: index jump
D5DA : 6A 25    "j%"    dec  $25,x
D5DC : B5 42 10    " B "    bita  X4210
        ;
D5DF : 00 00 00 FC  "    "    db  $00, $00, $00, $FC
        ;
D5E3 : FF FF BF    "   "    stx  XFFBF
        ;
D5E6 : 00    " "    db  $00
        ;
D5E7 : 92 A8    "  "    sbca  X00A8
        ;
D5E9 : FD    " "    db  $FD
        ;
D5EA : FE FF B6    "   "    ldx  XFFB6
        ;
D5ED : DD    " "    db  $DD
        ;
D5EE : 4A    "J"    deca
D5EF : 24 92    "$ "    bcc  LD583
D5F1 : 54    "T"    lsrb
        ;
D5F2 : 55    "U"    db  $55
        ;
D5F3 : 49    "I"    rola
D5F4 : 08    " "    inx
        ;
D5F5 : 00 00 00    "   "    db  $00, $00, $00
        ;
D5F8 : FF FF FF 
D5FB : 2F 42    "/B"    ble  LD63F
        ;
D5FD : 51    "Q"    db  $51
        ;
D5FE : 94 DA    "  "    anda  X00DA
D600 : FF FB FF    "   "    stx  XFBFF
D603 : BB 2A 04    " * "    adda  X2A04
D606 : 11    " "    cba
        ;
D607 : 52    "R"    db  $52
        ;
D608 : AD A4    "  "    jsr  $A4,x            ;INFO: index jump
        ;
D60A : 12 00 00    "   "    db  $12, $00, $00
        ;
D60D : E0 7F    "  "    subb  $7F,x
D60F : FF FF 65    "  e"    stx  XFF65
D612 : 0D    " "    sec
D613 : A5 42    " B"    bita  $42,x
D615 : 78 5F FB    "x_ "    asl  X5FFB
D618 : FF FF 26    "  &"    stx  XFF26
D61B        LD61B:
D61B : 08    " "    inx
D61C : 01    " "    nop
        ;
D61D : 52    "R"    db  $52
        ;
D61E : 25 AB    "% "    bcs  LD5CB
D620        LD620:
D620 : 11    " "    cba
        ;
D621 : 00    " "    db  $00
        ;
D622 : 40    "@"    nega
D623 : F4 75 FB    " u "    andb  X75FB
D626 : FF F5 4F    "  O"    stx  XF54F
D629 : A5 04    "  "    bita  $04,x
D62B : AC 56    " V"    cpx  $56,x
D62D : FF FF FF 
        ;
D630 : 93    " "    db  $93
        ;
D631 : 20 00    "  "    bra  LD633
        ;
D633        LD633:
D633 : 51    "Q"    db  $51
        ;
D634 : 29 AB    ") "    bvs  LD5E1
        ;
D636 : 02    " "    db  $02
        ;
D637 : 28 A9    "( "    bvc  LD5E2
        ;
D639 : 00 CF    "  "    db  $00, $CF
        ;
D63B : E5 FF    "  "    bitb  $FF,x
D63D : FE FF 55    "  U"    ldx  XFF55
        ;
D640 : 15    " "    db  $15
        ;
D641 : 01    " "    nop
        ;
D642 : 65    "e"    db  $65
        ;
D643 : EF FF    "  "    stx  $FF,x
D645 : FF 56 04    " V "    stx  X5604
        ;
D648        LD648:
D648 : 42    "B"    db  $42
        ;
D649 : 48    "H"    asla
        ;
D64A : 52    "R"    db  $52
        ;
D64B : 2C 52    ",R"    bge  LD69F
D64D : F7 35 08    " 5 "    stab  X3508
        ;
D650 : 04    " "    db  $04
        ;
D651 : 20 75    " u"    bra  LD6C8
        ;
D653 : FF FF FF 
        ;
D656 : 4B    "K"    db  $4B
        ;
D657 : 88 A4    "  "    eora  #$A4
D659 : F6 FD DF    "   "    ldab  XFDDF
        ;
D65C : 55    "U"    db  $55
        ;
D65D : A9 10    "  "    adca  $10,x
D65F : 22 24    ""$"    bhi  LD685
D661 : 22 BD    "" "    bhi  LD620
D663 : FF 4A 24    " J$"    stx  X4A24
        ;
D666 : 02 00    "  "    db  $02, $00
        ;
D668 : CA FB    "  "    orab  #$FB
D66A : FE 7F AB    "   "    ldx  X7FAB
D66D        LD66D:
D66D : B6 AA 6D    "  m"    ldaa  XAA6D
D670 : FB AD 54    "  T"    addb  XAD54
D673 : AB 42    " B"    adda  $42,x
        ;
D675 : 42    "B"    db  $42
        ;
D676 : 08    " "    inx
D677 : 74 FF 6D    "t m"    lsr  XFF6D
D67A : 31    "1"    ins
D67B : 06    " "    tap
        ;
D67C : 00    " "    db  $00
        ;
D67D : AA 4D    " M"    oraa  $4D,x
D67F : 73 F5 2A    "s *"    com  XF52A
D682 : E9 FF    "  "    adcb  $FF,x
        ;
D684 : FD    " "    db  $FD
        ;
D685        LD685:
D685 : BD 5B 89    " [ "    jsr  L5B89
D688 : 54    "T"    lsrb
D689 : 29 65    ")e"    bvs  LD6F0
D68B : 29 E0    ") "    bvs  LD66D
        ;
D68D : FD    " "    db  $FD
        ;
D68E : 6F CD    "o "    clr  $CD,x
D690 : 2A 40    "*@"    bpl  LD6D2
D692 : 88 75    " u"    eora  #$75
D694 : AD 6F    " o"    jsr  $6F,x            ;INFO: index jump
D696        LD696:
D696 : 0D    " "    sec
D697 : 08    " "    inx
D698 : CA BA    "  "    orab  #$BA
        ;
D69A : FD    " "    db  $FD
        ;
D69B : FF 55 55    " UU"    stx  X5555
D69E : 95 22    " ""    bita  X0022
D6A0 : 9A 11    "  "    oraa  X0011
D6A2 : FF FF 66    "  f"    stx  XFF66
        ;
D6A5 : 55    "U"    db  $55
        ;
D6A6 : 24 A0    "$ "    bcc  LD648
D6A8 : E6 B5    "  "    ldab  $B5,x
D6AA : EE 33    " 3"    ldx  $33,x
D6AC : 0A    " "    clv
D6AD : 94 59    " Y"    anda  X0059
D6AF : A5 EF    "  "    bita  $EF,x
D6B1 : 34    "4"    des
D6B2 : 95 6A    " j"    bita  X006A
        ;
D6B4 : 51    "Q"    db  $51
        ;
D6B5 : EA 15    "  "    orab  $15,x
        ;
D6B7 : EC    " "    db  $EC
        ;
D6B8 : FF BF 35    "  5"    stx  XBF35
D6BB : 27 01    "' "    beq  LD6BE
D6BD : 66 DB    "f "    ror  $DB,x
D6BF : EE 6F    " o"    ldx  $6F,x
        ;
D6C1 : 45    "E"    db  $45
        ;
D6C2 : 90 25    " %"    suba  X0025
D6C4 : A6 F9    "  "    ldaa  $F9,x
D6C6 : AB 18    "  "    adda  $18,x
D6C8        LD6C8:
D6C8 : 43    "C"    coma
D6C9 : 08    " "    inx
D6CA : A5 44    " D"    bita  $44,x
D6CC : A8 FF    "  "    eora  $FF,x
D6CE : 7F DB 2D    "  -"    clr  XDB2D
D6D1 : 82 98    "  "    sbca  #$98
D6D3 : AD D9    "  "    jsr  $D9,x            ;INFO: index jump
D6D5 : FF 4E A8    " N "    stx  X4EA8
D6D8 : C6 C8    "  "    ldab  #$C8
        ;
D6DA : DC 8F    "  "    db  $DC, $8F
        ;
D6DC : 19    " "    daa
D6DD : 27 41    "'A"    beq  LD720
        ;
D6DF : 18 13    "  "    db  $18, $13
        ;
D6E1 : 81 FC    "  "    cmpa  #$FC
D6E3 : BF E6 DD    "   "    sts  XE6DD
        ;
D6E6        LD6E6:
D6E6 : 21    "!"    db  $21
        ;
D6E7 : C4 9A    "  "    andb  #$9A
D6E9 : F2 DE 9F    "   "    sbcb  XDE9F
D6EC : 96 32    " 2"    ldaa  $32
D6EE : A2 BA    "  "    sbca  $BA,x
D6F0        LD6F0:
D6F0 : 77 9A 2B    "w +"    asr  X9A2B
D6F3 : 09    " "    dex
D6F4 : 8C 94 20    "   "    cpx  #$9420
D6F7 : 84 F7    "  "    anda  #$F7
D6F9 : EF 6D    " m"    stx  $6D,x
D6FB : 3B    ";"    rti
        ;
D6FC        LD6FC:
D6FC : 42    "B"    db  $42
        ;
D6FD        LD6FD:
D6FD : 84 31    " 1"    anda  #$31
D6FF : EF DF    "  "    stx  $DF,x
D701 : 39    "9"    rts
        ;
D702        XD702:
D702 : 2B 95    "+ "    bmi  LD699
D704 : 30    "0"    tsx
        ;
D705 : CF 6B 5B 15  " k[ "    db  $CF, $6B, $5B, $15
        ;
D709 : A1 8C    "  "    cmpa  $8C,x
        ;
D70B : 21    "!"    db  $21
        ;
D70C : 26 88    "& "    bne  LD696
D70E : FB B7 FB    "   "    addb  XB7FB
D711 : 56    "V"    rorb
D712 : 20 26    " &"    bra  LD73A
        ;
D714 : C9 FE    "  "    adcb  #$FE
D716 : B7 AD 56    "  V"    staa  XAD56
D719 : 44    "D"    lsra
D71A : DA BA    "  "    orab  X00BA
D71C : 98 B7    "  "    eora  X00B7
D71E : 22 C6    "" "    bhi  LD6E6
D720        LD720:
D720 : 88 91    "  "    eora  #$91
        ;
D722 : 02    " "    db  $02
        ;
D723 : E4 FD    "  "    andb  $FD,x
D725        XD725:
D725 : F5 DB 12    "   "    bitb  XDB12
D728 : C4 12    "  "    andb  #$12
D72A        XD72A:
D72A : E9 DF    "  "    adcb  $DF,x
D72C : 67 7B    "g{"    asr  $7B,x
D72E : 26 CC    "& "    bne  LD6FC
D730 : 32    "2"    pula
        ;
D731 : 71    "q"    db  $71
        ;
D732 : 9F 13    "  "    sts  X0013
D734 : 29 31    ")1"    bvs  LD767
D736 : 98 22    " ""    eora  X0022
D738 : 10    " "    sba
D739 : EF 77    " w"    stx  $77,x
D73B : EF 95    "  "    stx  $95,x
D73D : 88 12    "  "    eora  #$12
        ;
D73F : 61 FD    "a "    db  $61, $FD
        ;
D741 : EB BD    "  "    addb  $BD,x
        ;
D743 : 93    " "    db  $93
        ;
D744 : A8 23    " #"    eora  $23,x
D746 : 6A 7B    "j{"    dec  $7B,x
        ;
D748 : 15    " "    db  $15
        ;
D749 : 67 42    "gB"    asr  $42,x
D74B : 54    "T"    lsrb
D74C : 46    "F"    rora
D74D : 44    "D"    lsra
D74E : 84 FB    "  "    anda  #$FB
D750 : 77 BF 13    "w  "    asr  XBF13
D753 : 31    "1"    ins
D754 : 22 B2    "" "    bhi  LD708
D756 : DE F5    "  "    ldx  X00F5
D758 : B7 A5 AA    "   "    staa  XA5AA
D75B : 88 56    " V"    eora  #$56
D75D        XD75D:
D75D : 33    "3"    pulb
D75E : 57    "W"    asrb
D75F : 53    "S"    comb
D760 : 28 22    "(""    bvc  LD784
        ;
D762 : 21 02    "! "    db  $21, $02
        ;
D764 : E1 7D    " }"    cmpb  $7D,x
D766 : F7 6F 63    " oc"    stab  X6F63
        ;
D769 : 14 21    " !"    db  $14, $21
        ;
D76B : 99 F3    "  "    adca  X00F3
D76D : FE 6E CD    " n "    ldx  X6ECD
D770 : 4A    "J"    deca
D771 : 8C 99 E6    "   "    cpx  #$99E6
D774 : 35    "5"    txs
D775 : 26 65    "&e"    bne  LD7DC
D777 : 24 84    "$ "    bcc  LD6FD
        ;
D779 : 00    " "    db  $00
        ;
D77A : B9 F7 DE    "   "    adca  XF7DE
D77D : 3F    "?"    swi
        ;
D77E        XD77E:
D77E : 55    "U"    db  $55
        ;
D77F : 8A 50    " P"    oraa  #$50
D781 : 64 ED    "d "    lsr  $ED,x
        ;
D783 : 7B    "{"    db  $7B
        ;
D784        LD784:
D784 : EF 56    " V"    stx  $56,x
D786 : 2B 31    "+1"    bmi  LD7B9
D788 : A4 45    " E"    anda  $45,x
D78A : 16    " "    tab
        ;
D78B : 00    " "    db  $00
        ;
D78C : F8 FF 02    "   "    eorb  XFF02
D78F : 40    "@"    nega
D790 : FF 8F 00    "   "    stx  X8F00
D793 : F4 7F 21    "  !"    andb  X7F21
D796 : 4A    "J"    deca
D797 : F5 15 00    "   "    bitb  X1500
D79A : FE BF 00    "   "    ldx  XBF00
D79D : A8 FF    "  "    eora  $FF,x
D79F : 0B    " "    sev
D7A0 : A0 BA    "  "    suba  $BA,x
D7A2 : A5 BC    "  "    bita  $BC,x
D7A4 : 53    "S"    comb
D7A5 : 88 EC    "  "    eora  #$EC
D7A7 : 7F A8 0A    "   "    clr  XA80A
D7AA : 5A    "Z"    decb
D7AB : 01    " "    nop
D7AC : FE 0F 90    "   "    ldx  X0F90
D7AF : E8 FF    "  "    eorb  $FF,x
D7B1 : 80 9A    "  "    suba  #$9A
D7B3 : EA 02    "  "    orab  $02,x
        ;
D7B5 : FC 1F    "  "    db  $FC, $1F
        ;
D7B7 : 20 E8    "  "    bra  LD7A1
        ;
D7B9        LD7B9:
D7B9 : FF 83 10    "   "    stx  X8310
D7BC : F0 B7 DF    "   "    subb  XB7DF
        ;
D7BF : 00    " "    db  $00
        ;
D7C0 : F0 FF 02    "   "    subb  XFF02
D7C3 : A4 35    " 5"    anda  $35,x
        ;
D7C5 : 45    "E"    db  $45
        ;
D7C6 : FB 67 00    " g "    addb  X6700
D7C9 : F9 BF 48    "  H"    adcb  XBF48
D7CC : 0A    " "    clv
D7CD        LD7CD:
D7CD : 20 FE    "  "    bra  LD7CD
        ;
D7CF : 3F    "?"    swi
D7D0 : 01    " "    nop
D7D1 : C8 FF    "  "    eorb  #$FF
D7D3 : 23 10    "# "    bls  LD7E5
D7D5 : 92 FC    "  "    sbca  X00FC
D7D7 : 7F 80 C8    "   "    clr  X80C8
D7DA : FF 03 F8    "   "    stx  X03F8
        ;
D7DD : 04    " "    db  $04
        ;
D7DE : F8 3F 62    " ?b"    eorb  X3F62
D7E1 : 88 FF    "  "    eora  #$FF
        ;
D7E3 : 05    " "    db  $05
        ;
D7E4 : F0 0B F8    "   "    subb  X0BF8
D7E7 : 17    " "    tba
D7E8 : 73 84 FF    "s  "    com  X84FF
        ;
D7EB : 00    " "    db  $00
        ;
D7EC : F4 0A FF    "   "    andb  X0AFF
        ;
D7EF : 00 FC    "  "    db  $00, $FC
        ;
D7F1 : 73 0F 00    "s  "    com  X0F00
D7F4 : FE E5 0E    "   "    ldx  XE50E
D7F7 : 80 FF    "  "    suba  #$FF
D7F9 : 6F 01    "o "    clr  $01,x
D7FB : 40    "@"    nega
D7FC : FF DC 01    "   "    stx  XDC01
D7FF : E4 DD    "  "    andb  $DD,x
D801 : 7F 00 C0    "   "    clr  X00C0
D804 : EF 3F    " ?"    stx  $3F,x
        ;
D806 : 00 DC    "  "    db  $00, $DC
        ;
D808 : FF 07 00    "   "    stx  X0700
D80B : EA FE    "  "    orab  $FE,x
D80D : 07    " "    tpa
D80E : A0 EC    "  "    suba  $EC,x
D810 : FF 01 00    "   "    stx  X0100
        ;
D813 : FD    " "    db  $FD
        ;
D814 : 7F 00 A6    "   "    clr  X00A6
D817 : FF 0F 00    "   "    stx  X0F00
D81A : 80 FF    "  "    suba  #$FF
D81C : 07    " "    tpa
D81D : 08    " "    inx
        ;
D81E : FC    " "    db  $FC
        ;
D81F : 7F 00 02    "   "    clr  X0002
D822 : FE 1F 70    "  p"    ldx  X1F70
D825 : C1 FF    "  "    cmpb  #$FF
D827 : 01    " "    nop
D828 : 0F    " "    sei
D829 : C0 FF    "  "    subb  #$FF
D82B : C0 07    "  "    subb  #$07
        ;
D82D : FC    " "    db  $FC
        ;
D82E : 07    " "    tpa
D82F : F8 00 FF    "   "    eorb  X00FF
        ;
D832 : 03 1E    "  "    db  $03, $1E
        ;
D834 : F8 1F E0    "   "    eorb  X1FE0
        ;
D837 : 03    " "    db  $03
        ;
D838 : F8 0F F8    "   "    eorb  X0FF8
D83B : C0 FF    "  "    subb  #$FF
        ;
D83D : 00 1E    "  "    db  $00, $1E
        ;
D83F : F0 3F C0    " ? "    subb  X3FC0
D842 : 17    " "    tba
D843 : FF 03 78    "  x"    stx  X0378
        ;
D846 : 00    " "    db  $00
        ;
D847 : FF 03 1E    "   "    stx  X031E
D84A : F8 1F D0    "   "    eorb  X1FD0
        ;
D84D : 00    " "    db  $00
        ;
D84E : FE 0F 70    "  p"    ldx  X0F70
D851 : E8 7F    "  "    eorb  $7F,x
D853 : 80 0F    "  "    suba  #$0F
D855 : E0 3F    " ?"    subb  $3F,x
D857 : E0 81    "  "    subb  $81,x
D859 : FF 01 1F    "   "    stx  X011F
D85C : 80 FF    "  "    suba  #$FF
D85E : 01    " "    nop
D85F : 8B FF    "  "    adda  #$FF
        ;
D861 : 03 1E    "  "    db  $03, $1E
        ;
D863 : 80 FF    "  "    suba  #$FF
D865 : 81 05    "  "    cmpa  #$05
D867 : FF 03 1F    "   "    stx  X031F
D86A : 80 FF    "  "    suba  #$FF
D86C : 81 A5    "  "    cmpa  #$A5
D86E : FF 00 FE    "   "    stx  X00FE
        ;
D871 : 00    " "    db  $00
        ;
D872 : FF C0 8F    "   "    stx  XC08F
D875 : FF 00 FC    "   "    stx  X00FC
D878 : 80 7F    "  "    suba  #$7F
D87A : 80 FE    "  "    suba  #$FE
D87C : 3F    "?"    swi
        ;
D87D : 00 FC    "  "    db  $00, $FC
        ;
D87F : 01    " "    nop
D880 : FF 00 7E    "  ~"    stx  X007E
D883 : FF 01 F0    "   "    stx  X01F0
D886 : 01    " "    nop
D887 : FF 01 FC    "   "    stx  X01FC
D88A : 7F 00 F8    "   "    clr  X00F8
D88D : 80 FF    "  "    suba  #$FF
D88F : 01    " "    nop
D890 : E8 FF    "  "    eorb  $FF,x
        ;
D892 : 03    " "    db  $03
        ;
D893 : 70 E0 FF    "p  "    neg  XE0FF
D896 : 80 C4    "  "    suba  #$C4
D898 : FF 03 F0    "   "    stx  X03F0
        ;
D89B : 03 FC 03    "   "    db  $03, $FC, $03
        ;
D89E : 16    " "    tab
        ;
D89F : FD 1F    "  "    db  $FD, $1F
        ;
D8A1 : C0 8F    "  "    subb  #$8F
D8A3 : F7 00 FE    "   "    stab  X00FE
        ;
D8A6 : 5B 03    "[ "    db  $5B, $03
        ;
D8A8 : C0 3F    " ?"    subb  #$3F
D8AA : 80 7F    "  "    suba  #$7F
D8AC : A8 C0    "  "    eora  $C0,x
D8AE : FF 01 7C    "  |"    stx  X017C
D8B1 : F4 15 D2    "   "    andb  X15D2
D8B4 : FE 03 C0    "   "    ldx  X03C0
D8B7 : FE 01 F0    "   "    ldx  X01F0
        ;
D8BA : 1F    " "    db  $1F
        ;
D8BB : A4 F5    "  "    anda  $F5,x
D8BD : 07    " "    tpa
D8BE : 60 E5    "` "    neg  $E5,x
D8C0 : 8B 1F    "  "    adda  #$1F
D8C2 : A0 7F    "  "    suba  $7F,x
        ;
D8C4 : 04 EC 1F 00  "    "    db  $04, $EC, $1F, $00
        ;
D8C8 : FF 11 F4    "   "    stx  X11F4
        ;
D8CB : 3D    "="    db  $3D
        ;
D8CC : 11    " "    cba
D8CD : 2A 08    "* "    bpl  LD8D7
D8CF : FF 03 F8    "   "    stx  X03F8
        ;
D8D2 : 1F    " "    db  $1F
        ;
D8D3 : C0 3F    " ?"    subb  #$3F
        ;
D8D5 : 00    " "    db  $00
        ;
D8D6 : FF 01 FC    "   "    stx  X01FC
D8D9 : 3F    "?"    swi
        ;
D8DA : 00    " "    db  $00
        ;
D8DB : 9E 1E    "  "    lds  X001E
D8DD : FE 01 FC    "   "    ldx  X01FC
D8E0 : 5F    "_"    clrb
        ;
D8E1 : 00 1F    "  "    db  $00, $1F
        ;
D8E3 : 80 FF    "  "    suba  #$FF
D8E5 : 01    " "    nop
D8E6 : F8 FF 00    "   "    eorb  XFF00
D8E9 : B8 FF 80    "   "    eora  XFF80
D8EC : 17    " "    tba
D8ED : EE 03    "  "    ldx  $03,x
D8EF : 3F    "?"    swi
D8F0 : 70 01 FC    "p  "    neg  X01FC
        ;
D8F3 : 1F    " "    db  $1F
        ;
D8F4 : 80 FF    "  "    suba  #$FF
D8F6        XD8F6:
D8F6 : 0F    " "    sei
D8F7 : C0 57    " W"    subb  #$57
D8F9 : 09    " "    dex
D8FA : FF 01 3F    "  ?"    stx  X013F
        ;
D8FD : FC 00 1F    "   "    db  $FC, $00, $1F
        ;
D900 : 80 FF    "  "    suba  #$FF
        ;
D902 : 00    " "    db  $00
        ;
D903 : FE 0F 80    "   "    ldx  X0F80
D906 : 4F    "O"    clra
        ;
D907 : 3D    "="    db  $3D
        ;
D908 : F0 0F F0    "   "    subb  X0FF0
D90B : 47    "G"    asra
D90C : 0F    " "    sei
D90D : 78 00 FE    "x  "    asl  X00FE
        ;
D910 : 03    " "    db  $03
        ;
D911 : F0 FF 03    "   "    subb  XFF03
D914 : E0 FA    "  "    subb  $FA,x
        ;
D916 : 83 05    "  "    db  $83, $05
        ;
D918 : FA 1F 01    "   "    orab  X1F01
D91B : F4 07 F0    "   "    andb  X07F0
        ;
D91E : 1F    " "    db  $1F
        ;
D91F : C0 FF    "  "    subb  #$FF
        ;
D921 : 1F 00    "  "    db  $1F, $00
        ;
D923 : EB 87    "  "    addb  $87,x
D925 : 8B F0    "  "    adda  #$F0
D927 : 3F    "?"    swi
        ;
D928 : 00    " "    db  $00
        ;
D929 : D6 1F    "  "    ldab  X001F
D92B : C0 7F    "  "    subb  #$7F
        ;
D92D : 00    " "    db  $00
        ;
D92E : BF 7F 00    "   "    sts  X7F00
D931 : 46    "F"    rora
D932 : FF 07 8C    "   "    stx  X078C
        ;
D935 : FD    " "    db  $FD
        ;
D936 : 01    " "    nop
D937 : F0 1F C0    "   "    subb  X1FC0
D93A : 7F 00 FF    "   "    clr  X00FF
D93D : 3F    "?"    swi
        ;
D93E : 00    " "    db  $00
        ;
D93F : 7E E9 0F    "~  "    jmp  LE90F
        ;
D942 : 58    "X"    aslb
D943 : 77 05 FE    "w  "    asr  X05FE
        ;
D946 : 03    " "    db  $03
        ;
D947 : C0 FF    "  "    subb  #$FF
        ;
D949 : 00 FC    "  "    db  $00, $FC
        ;
D94B : 3F    "?"    swi
        ;
D94C : 00    " "    db  $00
        ;
D94D : FE F8 07    "   "    ldx  XF807
D950 : F0 EF 03    "   "    subb  XEF03
D953 : F8 01 F8    "   "    eorb  X01F8
D956 : BF 00 F8    "   "    sts  X00F8
        ;
D959        LD959:
D959 : 1F 00    "  "    db  $1F, $00
        ;
D95B : FE B7 01    "   "    ldx  XB701
D95E : F8 3F 00    " ? "    eorb  X3F00
D961 : F4 0F F0    "   "    andb  X0FF0
        ;
D964 : 1F 00    "  "    db  $1F, $00
        ;
D966 : FF 3F 00    " ? "    stx  X3F00
D969 : F0 FF 03    "   "    subb  XFF03
D96C : E0 3F    " ?"    subb  $3F,x
D96E : 0F    " "    sei
D96F : C0 1F    "  "    subb  #$1F
D971 : C0 7F    "  "    subb  #$7F
D973 : 20 E4    "  "    bra  LD959
        ;
D975 : FF 00 C0    "   "    stx  X00C0
D978 : FF 8B 81    "   "    stx  X8B81
        ;
D97B : FD    " "    db  $FD
        ;
D97C : 0F    " "    sei
D97D : D0 17    "  "    subb  X0017
D97F : C0 7F    "  "    subb  #$7F
D981 : 74 80 FF    "t  "    lsr  X80FF
D984 : 80 92    "  "    suba  #$92
D986 : F5 0F C8    "   "    bitb  X0FC8
D989 : FF 03 E0    "   "    stx  X03E0
D98C : FB C0 1F    "   "    addb  XC01F
D98F : C0 FF    "  "    subb  #$FF
        ;
D991 : 1F 00    "  "    db  $1F, $00
        ;
D993 : F8 FF 07    "   "    eorb  XFF07
D996 : 80 FF    "  "    suba  #$FF
        ;
D998 : 1F 00    "  "    db  $1F, $00
        ;
D99A : 53    "S"    comb
D99B : F8 3F 00    " ? "    eorb  X3F00
        ;
D99E : ED    " "    db  $ED
        ;
D99F : FF 00 E0    "   "    stx  X00E0
D9A2 : FF 1F 80    "   "    stx  X1F80
D9A5 : 5F    "_"    clrb
D9A6 : CA 17    "  "    orab  #$17
D9A8 : 40    "@"    nega
D9A9 : E0 FF    "  "    subb  $FF,x
        ;
D9AB : 00 DC 1F    "   "    db  $00, $DC, $1F
        ;
D9AE : 68 C0    "h "    asl  $C0,x
D9B0 : FF 07 C4    "   "    stx  X07C4
D9B3 : FF 00 F0    "   "    stx  X00F0
        ;
D9B6 : 1F    " "    db  $1F
        ;
D9B7 : F0 1F 6A    "  j"    subb  X1F6A
D9BA : E0 3F    " ?"    subb  $3F,x
        ;
D9BC : 00 FD F3    "   "    db  $00, $FD, $F3
        ;
D9BF : 07    " "    tpa
D9C0 : F0 BF 00    "   "    subb  XBF00
D9C3 : C0 7F    "  "    subb  #$7F
D9C5 : E0 1F    "  "    subb  $1F,x
D9C7 : E0 EF    "  "    subb  $EF,x
D9C9 : 07    " "    tpa
        ;
D9CA : 00    " "    db  $00
        ;
D9CB : F8 FF 00    "   "    eorb  XFF00
D9CE : F0 FF 01    "   "    subb  XFF01
D9D1 : 50    "P"    negb
D9D2 : EA FE    "  "    orab  $FE,x
        ;
D9D4 : 03    " "    db  $03
        ;
D9D5 : 80 FF    "  "    suba  #$FF
D9D7 : 0F    " "    sei
        ;
D9D8 : 00    " "    db  $00
        ;
D9D9 : F0 FF 01    "   "    subb  XFF01
D9DC : F0 FF 03    "   "    subb  XFF03
D9DF : 70 01 FC    "p  "    neg  X01FC
D9E2 : 07    " "    tpa
D9E3 : A0 FC    "  "    suba  $FC,x
        ;
D9E5 : 1F 00 FC FC  "    "    db  $1F, $00, $FC, $FC
        ;
D9E9 : 07    " "    tpa
D9EA : E0 BF    "  "    subb  $BF,x
        ;
D9EC : 03    " "    db  $03
        ;
D9ED : E0 01    "  "    subb  $01,x
D9EF : F8 0F 70    "  p"    eorb  X0F70
D9F2 : F9 0F 00    "   "    adcb  X0F00
D9F5 : 3F    "?"    swi
        ;
D9F6 : FC    " "    db  $FC
        ;
D9F7 : 07    " "    tpa
D9F8 : F0 FF 01    "   "    subb  XFF01
D9FB : E0 03    "  "    subb  $03,x
        ;
D9FD : FC    " "    db  $FC
        ;
D9FE : 07    " "    tpa
D9FF : F0 FF 07    "   "    subb  XFF07
        ;
DA02 : 00    " "    db  $00
        ;
DA03 : FF F3 01    "   "    stx  XF301
DA06 : F8 FF 02    "   "    eorb  XFF02
DA09 : E0 0A    "  "    subb  $0A,x
DA0B : FE 0F C0    "   "    ldx  X0FC0
DA0E : FF 07 00    "   "    stx  X0700
DA11 : FE FD 03    "   "    ldx  XFD03
DA14 : E0 FF    "  "    subb  $FF,x
        ;
DA16 : 41 00    "A "    db  $41, $00
        ;
DA18 : C4 FF    "  "    andb  #$FF
DA1A : 07    " "    tpa
DA1B : C0 FF    "  "    subb  #$FF
DA1D : 07    " "    tpa
        ;
DA1E : 00    " "    db  $00
        ;
DA1F : FF FE 02    "   "    stx  XFE02
        ;
DA22 : FC    " "    db  $FC
        ;
DA23 : 73 1B 00    "s  "    com  X1B00
DA26 : C0 FF    "  "    subb  #$FF
DA28 : 0F    " "    sei
DA29 : E0 FF    "  "    subb  $FF,x
        ;
DA2B : 21 00    "! "    db  $21, $00
        ;
DA2D : FF 1F 05    "   "    stx  X1F05
DA30 : F8 7F 28    "  ("    eorb  X7F28
        ;
DA33 : 00    " "    db  $00
        ;
DA34 : F0 7F 60    "  `"    subb  X7F60
DA37 : EB 7F    "  "    addb  $7F,x
DA39 : 80 81    "  "    suba  #$81
DA3B : FF 0F 88    "   "    stx  X0F88
DA3E : FF 0F 38    "  8"    stx  X0F38
DA41 : 01    " "    nop
DA42 : E0 FF    "  "    subb  $FF,x
        ;
DA44 : 00    " "    db  $00
        ;
DA45 : FE 3F 00    " ? "    ldx  X3F00
DA48 : F2 F5 07    "   "    sbcb  XF507
DA4B : 06    " "    tap
DA4C : FE 1F 70    "  p"    ldx  X1F70
        ;
DA4F : 00    " "    db  $00
        ;
DA50 : F8 3F 00    " ? "    eorb  X3F00
DA53 : F8 3F 00    " ? "    eorb  X3F00
DA56 : F0 FF 03    "   "    subb  XFF03
DA59 : C0 FF    "  "    subb  #$FF
DA5B : 0F    " "    sei
DA5C : 80 03    "  "    suba  #$03
        ;
DA5E : FC    " "    db  $FC
        ;
DA5F : 0F    " "    sei
        ;
DA60 : 00 FC 1F 00  "    "    db  $00, $FC, $1F, $00
        ;
DA64 : F8 7F 80    "   "    eorb  X7F80
DA67 : E0 FF    "  "    subb  $FF,x
DA69 : 07    " "    tpa
        ;
DA6A : 00    " "    db  $00
        ;
DA6B        LDA6B:
DA6B : 2B FE    "+ "    bmi  LDA6B
DA6D : 07    " "    tpa
        ;
DA6E : 00 FC 1F 00  "    "    db  $00, $FC, $1F, $00
        ;
DA72 : F0 FF 00    "   "    subb  XFF00
DA75 : C1 FF    "  "    cmpb  #$FF
        ;
DA77 : 41 00    "A "    db  $41, $00
        ;
DA79 : A8 FF    "  "    eora  $FF,x
        ;
DA7B : 03    " "    db  $03
        ;
DA7C : E0 FF    "  "    subb  $FF,x
DA7E : 0F    " "    sei
        ;
DA7F : 00    " "    db  $00
        ;
DA80 : F0 FF 00    "   "    subb  XFF00
DA83 : 74 FF C0    "t  "    lsr  XFFC0
        ;
DA86 : 05    " "    db  $05
        ;
DA87 : C0 FF    "  "    subb  #$FF
DA89 : 10    " "    sba
DA8A : E0 FF    "  "    subb  $FF,x
DA8C : C0 01    "  "    subb  #$01
DA8E : E0 FF    "  "    subb  $FF,x
        ;
DA90 : 00    " "    db  $00
        ;
DA91 : F0 FF 01    "   "    subb  XFF01
DA94 : 24 E0    "$ "    bcc  LDA76
DA96 : FF 00 D8    "   "    stx  X00D8
DA99 : 7F 80 0F    "   "    clr  X800F
DA9C : E0 7F    "  "    subb  $7F,x
DA9E : 0A    " "    clv
DA9F : C0 FF    "  "    subb  #$FF
DAA1 : 01    " "    nop
        ;
DAA2 : 00    " "    db  $00
        ;
DAA3 : F1 FF 00    "   "    cmpb  XFF00
DAA6 : F8 FF 00    "   "    eorb  XFF00
DAA9 : 3E    ">"    wai
DAAA : E0 3F    " ?"    subb  $3F,x
DAAC : 2C 84    ", "    bge  LDA32
DAAE : FF 00 00    "   "    stx  X0000
DAB1 : FB 7F 00    "   "    addb  X7F00
        ;
DAB4 : FC    " "    db  $FC
        ;
DAB5 : FF 00 FC    "   "    stx  X00FC
DAB8 : C1 1F    "  "    cmpb  #$1F
DABA : FA 82 7F    "   "    orab  X827F
DABD : A0 10    "  "    suba  $10,x
DABF : F8 3F 02    " ? "    eorb  X3F02
        ;
DAC2 : FC    " "    db  $FC
        ;
DAC3 : FF 00 F8    "   "    stx  X00F8
DAC6 : F9 0F F0    "   "    adcb  X0FF0
DAC9 : 47    "G"    asra
DACA : 7F 00 F8    "   "    clr  X00F8
DACD : F8 1F 00    "   "    eorb  X1F00
DAD0 : FF 3F 00    " ? "    stx  X3F00
DAD3 : F8 FF 03    "   "    eorb  XFF03
DAD6 : F1 47 3F    " G?"    cmpb  X473F
        ;
DAD9 : 00 3D    " ="    db  $00, $3D
        ;
DADB : F0 3F 90    " ? "    subb  X3F90
DADE : F2 3F 00    " ? "    sbcb  X3F00
DAE1 : FE FC 03    "   "    ldx  XFC03
DAE4 : 5A    "Z"    decb
DAE5 : EB 0F    "  "    addb  $0F,x
        ;
DAE7 : 14    " "    db  $14
        ;
DAE8        LDAE8:
DAE8 : 20 FE    "  "    bra  LDAE8
        ;
DAEA : 7F 00 FA    "   "    clr  X00FA
DAED : 3F    "?"    swi
        ;
DAEE : 00    " "    db  $00
        ;
DAEF : 7E FC 07    "~  "    jmp  LFC07
        ;
DAF2 : F8 F3 03    "   "    eorb  XF303
        ;
DAF5 : 3C    "<"    db  $3C
        ;
DAF6 : C0 FD    "  "    subb  #$FD
        ;
DAF8 : 1F    " "    db  $1F
        ;
DAF9 : 80 FF    "  "    suba  #$FF
DAFB        XDAFB:
DAFB : 0F    " "    sei
        ;
DAFC : 00 FC    "  "    db  $00, $FC
        ;
DAFE : FF 03 F0    "   "    stx  X03F0
DB01 : FF 03 60    "  `"    stx  X0360
DB04 : F4 FC 07    "   "    andb  XFC07
DB07 : E8 FD    "  "    eorb  $FD,x
        ;
DB09 : 1F 00    "  "    db  $1F, $00
        ;
DB0B : F8 FF 07    "   "    eorb  XFF07
DB0E : E0 FF    "  "    subb  $FF,x
DB10 : 07    " "    tpa
        ;
DB11 : 00    " "    db  $00
        ;
DB12        XDB12:
DB12 : 7C FE 03    "|  "    inc  XFE03
DB15 : 6C FC    "l "    inc  $FC,x
        ;
DB17 : 1F 00    "  "    db  $1F, $00
        ;
DB19 : F8 FF 01    "   "    eorb  XFF01
DB1C : F8 DF 01    "   "    eorb  XDF01
DB1F : 20 3F    " ?"    bra  LDB60
        ;
DB21 : FE 03 F4    "   "    ldx  X03F4
        ;
DB24 : FD 03 00    "   "    db  $FD, $03, $00
        ;
DB27 : FE FF 00    "   "    ldx  XFF00
DB2A : F0 FF 00    "   "    subb  XFF00
DB2D        XDB2D:
DB2D : 40    "@"    nega
DB2E : FF 7F 00    "   "    stx  X7F00
DB31 : E0 FF    "  "    subb  $FF,x
DB33 : 07    " "    tpa
        ;
DB34 : 00    " "    db  $00
        ;
DB35 : FE FF 00    "   "    ldx  XFF00
DB38 : F0 FF 03    "   "    subb  XFF03
DB3B : 80 EE    "  "    suba  #$EE
DB3D : FF 00 31    "  1"    stx  X0031
DB40 : FE 1F 00    "   "    ldx  X1F00
DB43 : FE FF 00    "   "    ldx  XFF00
DB46 : F8 7F 01    "   "    eorb  X7F01
        ;
DB49 : 00    " "    db  $00
        ;
DB4A : FF FF 00    "   "    stx  XFF00
DB4D : F0 FF 84    "   "    subb  XFF84
        ;
DB50 : 00    " "    db  $00
        ;
DB51 : FE FF 00    "   "    ldx  XFF00
DB54 : F8 7F 00    "   "    eorb  X7F00
DB57 : 8C DE 7F    "   "    cpx  #$DE7F
DB5A : 50    "P"    negb
DB5B        XDB5B:
DB5B : 98 FF    "  "    eora  X00FF
        ;
DB5D : 03    " "    db  $03
        ;
DB5E : 80 DF    "  "    suba  #$DF
DB60        LDB60:
DB60 : 7F 00 7F    "   "    clr  X007F
DB63 : FF 00 F0    "   "    stx  X00F0
        ;
DB66 : 87    " "    db  $87
        ;
DB67 : 7F 80 3D    "  ="    clr  X803D
DB6A : FF 03 80    "   "    stx  X0380
DB6D : FF FF 00    "   "    stx  XFF00
DB70 : FE FF 00    "   "    ldx  XFF00
DB73 : E0 BF    "  "    subb  $BF,x
DB75        LDB75:
DB75 : 3F    "?"    swi
DB76 : 20 FD    "  "    bra  LDB75
        ;
DB78 : FE 03 80    "   "    ldx  X0380
DB7B : FF 7F 00    "   "    stx  X7F00
DB7E : FE FF 00    "   "    ldx  XFF00
DB81 : C0 FF    "  "    subb  #$FF
DB83 : 7F 00 FC    "   "    clr  X00FC
DB86 : FF 01 C0    "   "    stx  X01C0
DB89 : FF 1F 80    "   "    stx  X1F80
DB8C : FF 3B 00    " ; "    stx  X3B00
DB8F : 86 FF    "  "    ldaa  #$FF
DB91 : 3F    "?"    swi
        ;
DB92 : 00    " "    db  $00
        ;
DB93 : FE 7F 00    "   "    ldx  X7F00
DB96        XDB96:
DB96 : C0 FF    "  "    subb  #$FF
        ;
DB98 : 1F    " "    db  $1F
        ;
DB99 : 80 FF    "  "    suba  #$FF
        ;
DB9B : 1F 00    "  "    db  $1F, $00
        ;
DB9D : A4 FF    "  "    anda  $FF,x
        ;
DB9F : 1F 00    "  "    db  $1F, $00
        ;
DBA1 : FE 7F 00    "   "    ldx  X7F00
DBA4 : E0 FF    "  "    subb  $FF,x
DBA6 : 0F    " "    sei
DBA7 : C0 FF    "  "    subb  #$FF
        ;
DBA9 : 1F 00    "  "    db  $1F, $00
        ;
DBAB : F0 F7 1F    "   "    subb  XF71F
        ;
DBAE : 00    " "    db  $00
        ;
DBAF : FE 7F 00    "   "    ldx  X7F00
DBB2 : E0 FF    "  "    subb  $FF,x
DBB4 : 0F    " "    sei
DBB5 : 80 FF    "  "    suba  #$FF
DBB7 : 3F    "?"    swi
        ;
DBB8 : 00    " "    db  $00
        ;
DBB9 : E8 FA    "  "    eorb  $FA,x
        ;
DBBB : 1F 00    "  "    db  $1F, $00
        ;
DBBD : FF 7F 00    "   "    stx  X7F00
DBC0 : F8 F1 1F    "   "    eorb  XF11F
DBC3 : C0 E7    "  "    subb  #$E7
DBC5 : 7F 00 E0    "   "    clr  X00E0
DBC8 : FA 1F 00    "   "    orab  X1F00
DBCB : FF 7F 00    "   "    stx  X7F00
DBCE : F8 F3 8F    "   "    eorb  XF38F
DBD1 : 80 F7    "  "    suba  #$F7
DBD3 : 3F    "?"    swi
        ;
DBD4 : 00    " "    db  $00
        ;
DBD5 : B0 FC 1F    "   "    suba  XFC1F
        ;
DBD8 : 00    " "    db  $00
        ;
DBD9 : FB 7F 00    "   "    addb  X7F00
        ;
DBDC : FC    " "    db  $FC
DBDD        XDBDD:
DBDD : FD    " "    db  $FD
        ;
DBDE : 07    " "    tpa
DBDF : B8 F3 1F    "   "    eora  XF31F
        ;
DBE2 : 00 38    " 8"    db  $00, $38
        ;
DBE4 : FE 1F 80    "   "    ldx  X1F80
        ;
DBE7 : FD    " "    db  $FD
        ;
DBE8 : 7F 00 7C    "  |"    clr  X007C
        ;
DBEB : FC    " "    db  $FC
        ;
DBEC : 07    " "    tpa
DBED : AC E8    "  "    cpx  $E8,x
        ;
DBEF : 1F 00    "  "    db  $1F, $00
        ;
DBF1 : 08    " "    inx
DBF2 : FF 1F 00    "   "    stx  X1F00
DBF5 : FB 3F 00    " ? "    addb  X3F00
DBF8 : 3E    ">"    wai
        ;
DBF9 : FC    " "    db  $FC
        ;
DBFA : 07    " "    tpa
        ;
DBFB : DC    " "    db  $DC
        ;
DBFC : E1 1F    "  "    cmpb  $1F,x
DBFE : 80 06    "  "    suba  #$06
        ;
DC00 : FC    " "    db  $FC
DC01        XDC01:
DC01 : 1F 00    "  "    db  $1F, $00
        ;
DC03 : FF 1F 00    "   "    stx  X1F00
DC06 : 2F FC    "/ "    ble  LDC04
DC08 : 0F    " "    sei
DC09 : E0 F9    "  "    subb  $F9,x
DC0B : 07    " "    tpa
DC0C : C0 03    "  "    subb  #$03
DC0E : FE 0F 00    "   "    ldx  X0F00
        ;
DC11 : FD    " "    db  $FD
        ;
DC12 : 0F    " "    sei
DC13 : C0 11    "  "    subb  #$11
DC15 : FF 0F 80    "   "    stx  X0F80
DC18 : FE 0F C0    "   "    ldx  X0FC0
DC1B : 01    " "    nop
DC1C : FF 0F 00    "   "    stx  X0F00
DC1F : FE 0F C0    "   "    ldx  X0FC0
        ;
DC22 : 03    " "    db  $03
        ;
DC23 : FE 0F 00    "   "    ldx  X0F00
DC26 : FE 0F C0    "   "    ldx  X0FC0
DC29 : D0 FF    "  "    subb  X00FF
        ;
DC2B : 03    " "    db  $03
        ;
DC2C : C0 FF    "  "    subb  #$FF
DC2E : 07    " "    tpa
DC2F : C0 05    "  "    subb  #$05
DC31 : FE 27 00    " ' "    ldx  X2700
        ;
DC34 : FC 1F    "  "    db  $FC, $1F
        ;
DC36 : 40    "@"    nega
DC37 : D0 FF    "  "    subb  X00FF
        ;
DC39 : 03    " "    db  $03
        ;
DC3A : C0 FF    "  "    subb  #$FF
DC3C : 07    " "    tpa
DC3D : E0 09    "  "    subb  $09,x
DC3F : FE 07 01    "   "    ldx  X0701
DC42 : F8 3F 00    " ? "    eorb  X3F00
DC45 : F0 FF 03    "   "    subb  XFF03
DC48 : 80 FF    "  "    suba  #$FF
DC4A : 07    " "    tpa
DC4B : 60 2A    "`*"    neg  $2A,x
DC4D : FE 07 00    "   "    ldx  X0700
DC50 : FA 1F 00    "   "    orab  X1F00
DC53 : F4 FF 01    "   "    andb  XFF01
DC56 : C0 FF    "  "    subb  #$FF
DC58 : 07    " "    tpa
DC59 : 60 02    "` "    neg  $02,x
DC5B : FF 0F 00    "   "    stx  X0F00
        ;
DC5E : FC 1F 00 EC  "    "    db  $FC, $1F, $00, $EC
        ;
DC62 : FF 01 C0    "   "    stx  X01C0
DC65 : FF 07 E0    "   "    stx  X07E0
DC68 : 84 FF    "  "    anda  #$FF
        ;
DC6A : 03 00    "  "    db  $03, $00
        ;
DC6C : FE 1F 00    "   "    ldx  X1F00
DC6F : BC FF 03    "   "    cpx  XFF03
DC72 : C0 FF    "  "    subb  #$FF
        ;
DC74 : 03    " "    db  $03
        ;
DC75 : 70 05 FE    "p  "    neg  X05FE
DC78 : 07    " "    tpa
        ;
DC79 : 00    " "    db  $00
        ;
DC7A : FF 0F 00    "   "    stx  X0F00
DC7D : AC FF    "  "    cpx  $FF,x
        ;
DC7F : 03    " "    db  $03
        ;
DC80 : C0 FF    "  "    subb  #$FF
DC82 : 07    " "    tpa
DC83 : A0 03    "  "    suba  $03,x
DC85 : FF 07 00    "   "    stx  X0700
DC88 : FE 1F 00    "   "    ldx  X1F00
DC8B : A0 FF    "  "    suba  $FF,x
DC8D : 07    " "    tpa
DC8E : C0 FF    "  "    subb  #$FF
DC90 : 07    " "    tpa
DC91 : 40    "@"    nega
        ;
DC92 : 05    " "    db  $05
        ;
DC93 : FF 07 20    "   "    stx  X0720
        ;
DC96 : FC 1F    "  "    db  $FC, $1F
        ;
DC98 : 20 80    "  "    bra  LDC1A
        ;
DC9A : FF 07 00    "   "    stx  X0700
DC9D : FF 07 40    "  @"    stx  X0740
DCA0 : 86 FF    "  "    ldaa  #$FF
        ;
DCA2 : 03    " "    db  $03
        ;
DCA3 : A0 FA    "  "    suba  $FA,x
DCA5 : 0F    " "    sei
        ;
DCA6 : 00    " "    db  $00
        ;
DCA7 : A2 FF    "  "    sbca  $FF,x
        ;
DCA9 : 03    " "    db  $03
        ;
DCAA : C0 FF    "  "    subb  #$FF
DCAC : 07    " "    tpa
        ;
DCAD : 00    " "    db  $00
        ;
DCAE : 85 FF    "  "    bita  #$FF
        ;
DCB0 : 03 00    "  "    db  $03, $00
        ;
DCB2 : FF 0F 00    "   "    stx  X0F00
DCB5 : D0 FF    "  "    subb  X00FF
DCB7 : 01    " "    nop
DCB8 : E0 FF    "  "    subb  $FF,x
DCBA : 07    " "    tpa
        ;
DCBB : 00    " "    db  $00
        ;
DCBC : 85 FF    "  "    bita  #$FF
DCBE : 07    " "    tpa
        ;
DCBF : 00    " "    db  $00
        ;
DCC0 : FE 0F 00    "   "    ldx  X0F00
DCC3 : C0 FF    "  "    subb  #$FF
        ;
DCC5 : 03    " "    db  $03
        ;
DCC6 : E0 FF    "  "    subb  $FF,x
        ;
DCC8 : 03 00    "  "    db  $03, $00
        ;
DCCA : CB FF    "  "    addb  #$FF
        ;
DCCC : 03    " "    db  $03
        ;
DCCD : 80 FF    "  "    suba  #$FF
DCCF : 07    " "    tpa
        ;
DCD0 : 00    " "    db  $00
        ;
DCD1 : E8 FF    "  "    eorb  $FF,x
        ;
DCD3 : 00    " "    db  $00
        ;
DCD4 : F0 FF 01    "   "    subb  XFF01
DCD7 : 20 F0    "  "    bra  LDCC9
        ;
DCD9 : FF 00 88    "   "    stx  X0088
DCDC : FF 03 00    "   "    stx  X0300
DCDF : E9 FF    "  "    adcb  $FF,x
        ;
DCE1 : 00    " "    db  $00
        ;
DCE2 : F8 FF 01    "   "    eorb  XFF01
DCE5 : C0 E6    "  "    subb  #$E6
DCE7 : FF 00 E0    "   "    stx  X00E0
DCEA : FF 01 00    "   "    stx  X0100
DCED : FB 7F 00    "   "    addb  X7F00
DCF0 : F0 FF 00    "   "    subb  XFF00
DCF3 : 40    "@"    nega
DCF4 : FA 7F 00    "   "    orab  X7F00
DCF7 : C0 FF    "  "    subb  #$FF
        ;
DCF9 : 03 00    "  "    db  $03, $00
        ;
DCFB : F8 3F 00    " ? "    eorb  X3F00
DCFE : F0 FF 01    "   "    subb  XFF01
DD01        XDD01:
DD01 : 40    "@"    nega
DD02        XDD02:
DD02 : F9 7F 00    "   "    adcb  X7F00
DD05 : C0 FF    "  "    subb  #$FF
DD07 : 01    " "    nop
        ;
DD08 : 00    " "    db  $00
        ;
DD09 : F9 7F 00    "   "    adcb  X7F00
DD0C : F0 FF 00    "   "    subb  XFF00
DD0F : 10    " "    sba
        ;
DD10 : FC    " "    db  $FC
        ;
DD11 : 7F 00 C0    "   "    clr  X00C0
DD14 : FF 01 40    "  @"    stx  X0140
DD17 : FE 1F 00    "   "    ldx  X1F00
        ;
DD1A : FC    " "    db  $FC
        ;
DD1B : 7F 00 28    "  ("    clr  X0028
DD1E : F8 7F 00    "   "    eorb  X7F00
DD21 : E0 FF    "  "    subb  $FF,x
DD23 : 01    " "    nop
DD24 : 80 FE    "  "    suba  #$FE
DD26        XDD26:
DD26 : 3F    "?"    swi
        ;
DD27 : 00 FC    "  "    db  $00, $FC
        ;
DD29 : 7F 00 B0    "   "    clr  X00B0
DD2C : F8 7F 00    "   "    eorb  X7F00
DD2F : E0 FF    "  "    subb  $FF,x
        ;
DD31 : 00    " "    db  $00
        ;
DD32 : 80 FF    "  "    suba  #$FF
        ;
DD34 : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
DD37 : 7F 00 30    "  0"    clr  X0030
DD3A : F8 7F 00    "   "    eorb  X7F00
DD3D : F0 FF 01    "   "    subb  XFF01
DD40 : 80 FD    "  "    suba  #$FD
DD42 : 7F 00 FC    "   "    clr  X00FC
DD45 : 7F 00 58    "  X"    clr  X0058
DD48 : F8 7F 00    "   "    eorb  X7F00
DD4B : F0 7F 00    "   "    subb  X7F00
DD4E : A0 FB    "  "    suba  $FB,x
DD50 : 7F 00 FC    "   "    clr  X00FC
DD53 : 7F 00 28    "  ("    clr  X0028
DD56 : F8 7F 00    "   "    eorb  X7F00
DD59 : F0 7F 00    "   "    subb  X7F00
DD5C : 88 FD    "  "    eora  #$FD
DD5E : 7F 00 F8    "   "    clr  X00F8
DD61 : 7F 00 10    "   "    clr  X0010
DD64 : F9 7F 00    "   "    adcb  X7F00
DD67 : F8 FF 00    "   "    eorb  XFF00
DD6A : B0 F8 7F    "   "    suba  XF87F
        ;
DD6D : 00    " "    db  $00
        ;
DD6E : F8 7F 00    "   "    eorb  X7F00
DD71 : 20 FC    "  "    bra  LDD6F
        ;
DD73 : 7F 00 F8    "   "    clr  X00F8
DD76 : 7F 00 F0    "   "    clr  X00F0
DD79 : F8 3F 00    " ? "    eorb  X3F00
DD7C : FA FF 00    "   "    orab  XFF00
        ;
DD7F : 00    " "    db  $00
        ;
DD80 : FA 7F 00    "   "    orab  X7F00
        ;
DD83 : FC    " "    db  $FC
        ;
DD84 : 7F 00 F0    "   "    clr  X00F0
        ;
DD87 : FC    " "    db  $FC
        ;
DD88 : 3F    "?"    swi
        ;
DD89 : 00    " "    db  $00
        ;
DD8A : FE FF 00    "   "    ldx  XFF00
DD8D : 80 FC    "  "    suba  #$FC
DD8F : 3F    "?"    swi
        ;
DD90 : 00    " "    db  $00
        ;
DD91 : FE 3F 00    " ? "    ldx  X3F00
DD94 : D0 FE    "  "    subb  X00FE
        ;
DD96 : 1F 00    "  "    db  $1F, $00
        ;
DD98 : FF 7F 00    "   "    stx  X7F00
DD9B : 40    "@"    nega
        ;
DD9C : FC    " "    db  $FC
        ;
DD9D : 3F    "?"    swi
        ;
DD9E : 00    " "    db  $00
        ;
DD9F : FF 3F 00    " ? "    stx  X3F00
DDA2 : 28 FC    "( "    bvc  LDDA0
DDA4 : 3F    "?"    swi
        ;
DDA5 : 00    " "    db  $00
        ;
DDA6 : FF 7F 00    "   "    stx  X7F00
        ;
DDA9 : 00 FD    "  "    db  $00, $FD
        ;
DDAB : 3F    "?"    swi
        ;
DDAC : 00    " "    db  $00
        ;
DDAD : FF 3F 00    " ? "    stx  X3F00
DDB0 : 10    " "    sba
DDB1 : FE 1F 00    "   "    ldx  X1F00
DDB4 : FF 3F 00    " ? "    stx  X3F00
DDB7 : 20 FF    "  "    bra  LDDB8
        ;
DDB9 : 1F    " "    db  $1F
        ;
DDBA : 80 FF    "  "    suba  #$FF
        ;
DDBC : 1F 00 14    "   "    db  $1F, $00, $14
        ;
DDBF : FE 1F 00    "   "    ldx  X1F00
DDC2 : FF 3F 00    " ? "    stx  X3F00
DDC5        LDDC5:
DDC5 : 20 FE    "  "    bra  LDDC5
        ;
DDC7 : 1F    " "    db  $1F
        ;
DDC8 : 80 FF    "  "    suba  #$FF
        ;
DDCA : 1F 00    "  "    db  $1F, $00
        ;
DDCC : 54    "T"    lsrb
DDCD : FE 1F 00    "   "    ldx  X1F00
DDD0 : FF 3F 00    " ? "    stx  X3F00
DDD3 : 10    " "    sba
DDD4 : FE 1F 80    "   "    ldx  X1F80
DDD7 : FF 1F 00    "   "    stx  X1F00
        ;
DDDA : 04    " "    db  $04
        ;
DDDB : FF 1F 00    "   "    stx  X1F00
DDDE : FF 3F 00    " ? "    stx  X3F00
DDE1 : 10    " "    sba
DDE2 : FE 1F 80    "   "    ldx  X1F80
DDE5 : FF 1F 00    "   "    stx  X1F00
        ;
DDE8 : 02    " "    db  $02
        ;
DDE9 : FE 1F 00    "   "    ldx  X1F00
DDEC : FF 3F 00    " ? "    stx  X3F00
DDEF        XDDEF:
DDEF : 90 FE    "  "    suba  X00FE
        ;
DDF1 : 1F    " "    db  $1F
        ;
DDF2 : 80 FF    "  "    suba  #$FF
DDF4 : 3F    "?"    swi
        ;
DDF5 : 00    " "    db  $00
        ;
DDF6 : 08    " "    inx
DDF7 : FE 1F 80    "   "    ldx  X1F80
        ;
DDFA : FD    " "    db  $FD
        ;
DDFB : 3F    "?"    swi
        ;
DDFC : 00    " "    db  $00
        ;
DDFD : 20 FF    "  "    bra  LDDFE
        ;
DDFF : 0F    " "    sei
DE00        XDE00:
DE00 : 80 FF    "  "    suba  #$FF
        ;
DE02 : 1F 00 18    "   "    db  $1F, $00, $18
        ;
DE05 : FF 1F 80    "   "    stx  X1F80
DE08 : FF 1F 00    "   "    stx  X1F00
DE0B : 40    "@"    nega
DE0C : FF 0F 80    "   "    stx  X0F80
DE0F : FF 2F 00    " / "    stx  X2F00
DE12 : 90 FF    "  "    suba  X00FF
        ;
DE14 : 1F    " "    db  $1F
        ;
DE15 : 80 FF    "  "    suba  #$FF
DE17 : 2F 00    "/ "    ble  LDE19
        ;
DE19        LDE19:
DE19 : 00    " "    db  $00
        ;
DE1A : FF 0F 80    "   "    stx  X0F80
DE1D : FF 2F 00    " / "    stx  X2F00
DE20 : 30    "0"    tsx
DE21 : FF 1F 80    "   "    stx  X1F80
DE24 : FF 57 00    " W "    stx  X5700
DE27 : 80 FF    "  "    suba  #$FF
DE29 : 0F    " "    sei
DE2A : C0 FD    "  "    subb  #$FD
DE2C : 2F 00    "/ "    ble  LDE2E
DE2E        LDE2E:
DE2E : 10    " "    sba
DE2F : FF 1F 00    "   "    stx  X1F00
DE32 : FF 3F 00    " ? "    stx  X3F00
DE35 : 80 FF    "  "    suba  #$FF
DE37 : 0F    " "    sei
DE38 : 80 FF    "  "    suba  #$FF
DE3A : 3F    "?"    swi
        ;
DE3B : 00    " "    db  $00
        ;
DE3C : 08    " "    inx
DE3D : FF 0F 80    "   "    stx  X0F80
DE40 : FE 3F 00    " ? "    ldx  X3F00
DE43 : 80 FF    "  "    suba  #$FF
DE45 : 0F    " "    sei
DE46 : 80 FF    "  "    suba  #$FF
DE48 : 2F 00    "/ "    ble  LDE4A
DE4A        LDE4A:
DE4A : 88 FF    "  "    eora  #$FF
        ;
DE4C : 1F 00    "  "    db  $1F, $00
        ;
DE4E : FE 3F 00    " ? "    ldx  X3F00
        ;
DE51 : 00    " "    db  $00
        ;
DE52 : FF 0F 00    "   "    stx  X0F00
DE55 : FE 1F 00    "   "    ldx  X1F00
DE58 : 88 FE    "  "    eora  #$FE
DE5A : 0F    " "    sei
DE5B : 80 FC    "  "    suba  #$FC
DE5D : 7F 00 00    "   "    clr  X0000
DE60 : FF 0F 80    "   "    stx  X0F80
        ;
DE63 : FD    " "    db  $FD
        ;
DE64 : 3F    "?"    swi
        ;
DE65 : 00    " "    db  $00
        ;
DE66 : 40    "@"    nega
DE67 : FE 0F 00    "   "    ldx  X0F00
DE6A : FF 7F 00    "   "    stx  X7F00
DE6D : C0 FF    "  "    subb  #$FF
DE6F : 07    " "    tpa
DE70 : 80 FF    "  "    suba  #$FF
DE72 : 3F    "?"    swi
        ;
DE73 : 00    " "    db  $00
        ;
DE74 : 40    "@"    nega
DE75 : FF 0F 00    "   "    stx  X0F00
DE78 : FE 7F 00    "   "    ldx  X7F00
DE7B : 40    "@"    nega
DE7C : FF 07 80    "   "    stx  X0780
DE7F : FF 3F 00    " ? "    stx  X3F00
        ;
DE82 : 00    " "    db  $00
        ;
DE83 : FE 0F 00    "   "    ldx  X0F00
DE86 : F9 7F 00    "   "    adcb  X7F00
DE89 : 80 FE    "  "    suba  #$FE
DE8B : 0F    " "    sei
        ;
DE8C : 00    " "    db  $00
        ;
DE8D : FF 7F 00    "   "    stx  X7F00
DE90 : 80 FC    "  "    suba  #$FC
DE92 : 0F    " "    sei
DE93 : 80 FB    "  "    suba  #$FB
DE95 : 7F 00 80    "   "    clr  X0080
DE98 : FE 0F 00    "   "    ldx  X0F00
DE9B : F6 FF 00    "   "    ldab  XFF00
        ;
DE9E : 00    " "    db  $00
        ;
DE9F        XDE9F:
DE9F : FF 0F 00    "   "    stx  X0F00
DEA2 : FF 7F 00    "   "    stx  X7F00
DEA5 : 70 FF 0F    "p  "    neg  XFF0F
        ;
DEA8 : 00    " "    db  $00
        ;
DEA9 : F6 FF 00    "   "    ldab  XFF00
        ;
DEAC : 00    " "    db  $00
        ;
DEAD : FF 0F 00    "   "    stx  X0F00
DEB0 : FE 7F 00    "   "    ldx  X7F00
DEB3 : F0 FF 0F    "   "    subb  XFF0F
        ;
DEB6 : 00    " "    db  $00
        ;
DEB7 : F7 FF 00    "   "    stab  XFF00
        ;
DEBA : 00    " "    db  $00
        ;
DEBB : FF 0F 00    "   "    stx  X0F00
DEBE : FE 7F 00    "   "    ldx  X7F00
DEC1 : F0 FF 0F    "   "    subb  XFF0F
        ;
DEC4 : 00    " "    db  $00
        ;
DEC5 : E7 FF    "  "    stab  $FF,x
DEC7 : 01    " "    nop
DEC8 : 80 FE    "  "    suba  #$FE
        ;
DECA : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
DECD : FF 00 F0    "   "    stx  X00F0
DED0 : FF 1F 00    "   "    stx  X1F00
DED3 : EE FF    "  "    ldx  $FF,x
DED5 : 01    " "    nop
DED6 : C0 FF    "  "    subb  #$FF
        ;
DED8 : 1F 00 FC    "   "    db  $1F, $00, $FC
        ;
DEDB : FF 01 E0    "   "    stx  X01E0
DEDE : FF 3F 00    " ? "    stx  X3F00
        ;
DEE1 : EC    " "    db  $EC
        ;
DEE2 : FF 01 C0    "   "    stx  X01C0
DEE5 : FF 1F 00    "   "    stx  X1F00
DEE8 : F8 FF 01    "   "    eorb  XFF01
DEEB : E0 FF    "  "    subb  $FF,x
DEED : 3F    "?"    swi
        ;
DEEE : 00 DC    "  "    db  $00, $DC
        ;
DEF0 : FF 03 C0    "   "    stx  X03C0
DEF3 : FF 3F 00    " ? "    stx  X3F00
DEF6 : DA FF    "  "    orab  X00FF
DEF8 : 01    " "    nop
DEF9 : E0 FF    "  "    subb  $FF,x
DEFB : 7F 00 B8    "   "    clr  X00B8
DEFE : FF 03 C0    "   "    stx  X03C0
DF01        XDF01:
DF01 : FF 7F 00    "   "    stx  X7F00
DF04 : EA FF    "  "    orab  $FF,x
        ;
DF06 : 03    " "    db  $03
        ;
DF07 : C0 FF    "  "    subb  #$FF
DF09 : 7F 00 F0    "   "    clr  X00F0
DF0C : FF 03 C0    "   "    stx  X03C0
DF0F : FF 7F 00    "   "    stx  X7F00
DF12        XDF12:
DF12 : D6 FF    "  "    ldab  X00FF
        ;
DF14 : 03    " "    db  $03
        ;
DF15 : E0 FF    "  "    subb  $FF,x
DF17 : FF 00 E0    "   "    stx  X00E0
DF1A : FF 03 C0    "   "    stx  X03C0
DF1D : FF FF 00    "   "    stx  XFF00
DF20 : E8 FF    "  "    eorb  $FF,x
        ;
DF22 : 03    " "    db  $03
        ;
DF23 : C0 FF    "  "    subb  #$FF
DF25        XDF25:
DF25 : FF 00 E0    "   "    stx  X00E0
DF28 : FF 07 C0    "   "    stx  X07C0
DF2B : FF F9 01    "   "    stx  XF901
DF2E : E0 FF    "  "    subb  $FF,x
DF30 : 07    " "    tpa
DF31 : 80 FF    "  "    suba  #$FF
DF33 : FB 00 C0    "   "    addb  X00C0
DF36        XDF36:
DF36 : FF 07 80    "   "    stx  X0780
DF39 : FF F9 01    "   "    stx  XF901
DF3C : C0 FF    "  "    subb  #$FF
DF3E : 07    " "    tpa
DF3F : 80 FF    "  "    suba  #$FF
DF41 : BF 00 E0    "   "    sts  X00E0
DF44 : FF 07 80    "   "    stx  X0780
DF47 : FF B9 01    "   "    stx  XB901
DF4A : E0 FF    "  "    subb  $FF,x
DF4C : 07    " "    tpa
DF4D : 80 FF    "  "    suba  #$FF
DF4F : 7D 01 C0    "}  "    tst  X01C0
DF52 : FF 07 80    "   "    stx  X0780
DF55 : FF F1 03    "   "    stx  XF103
DF58 : C0 FF    "  "    subb  #$FF
DF5A : 07    " "    tpa
DF5B        XDF5B:
DF5B : 80 FF    "  "    suba  #$FF
DF5D : BD 00 E0    "   "    jsr  L00E0
DF60 : FF 07 80    "   "    stx  X0780
DF63 : FF F4 03    "   "    stx  XF403
DF66 : C0 FF    "  "    subb  #$FF
DF68 : 07    " "    tpa
DF69 : 80 FF    "  "    suba  #$FF
DF6B : B9 01 C0    "   "    adca  X01C0
DF6E : FF 07 80    "   "    stx  X0780
DF71 : FF B9 03    "   "    stx  XB903
DF74 : 80 FF    "  "    suba  #$FF
DF76 : 07    " "    tpa
DF77 : 80 FF    "  "    suba  #$FF
DF79 : B9 01 C0    "   "    adca  X01C0
DF7C : FF 07 80    "   "    stx  X0780
DF7F        XDF7F:
DF7F : FF B9 03    "   "    stx  XB903
DF82 : 80 FF    "  "    suba  #$FF
DF84 : 07    " "    tpa
DF85 : 80 FF    "  "    suba  #$FF
DF87 : 79 01 E0    "y  "    rol  X01E0
DF8A : FF 03 C0    "   "    stx  X03C0
DF8D : FF B8 03    "   "    stx  XB803
DF90 : C0 FF    "  "    subb  #$FF
DF92 : 07    " "    tpa
DF93 : 80 FF    "  "    suba  #$FF
DF95 : FA 01 C0    "   "    orab  X01C0
DF98 : FF 03 C0    "   "    stx  X03C0
DF9B : 7F FC 01    "   "    clr  XFC01
DF9E : C0 FF    "  "    subb  #$FF
DFA0 : 07    " "    tpa
DFA1 : 80 7F    "  "    suba  #$7F
DFA3 : FF 01 C0    "   "    stx  X01C0
DFA6 : FF 03 C0    "   "    stx  X03C0
DFA9 : 7F FD 01    "   "    clr  XFD01
DFAC : C0 FF    "  "    subb  #$FF
DFAE : 07    " "    tpa
DFAF : 80 FF    "  "    suba  #$FF
DFB1 : FE 00 E0    "   "    ldx  X00E0
DFB4 : FF 03 C0    "   "    stx  X03C0
DFB7 : 9F FE    "  "    sts  X00FE
DFB9 : 01    " "    nop
DFBA : C0 FF    "  "    subb  #$FF
DFBC : 07    " "    tpa
DFBD : 80 FF    "  "    suba  #$FF
        ;
DFBF : FC    " "    db  $FC
        ;
DFC0 : 01    " "    nop
DFC1 : E0 FF    "  "    subb  $FF,x
        ;
DFC3 : 03    " "    db  $03
        ;
DFC4 : C0 BF    "  "    subb  #$BF
DFC6 : F8 03 C0    "   "    eorb  X03C0
DFC9 : FF 07 80    "   "    stx  X0780
DFCC : FF F9 03    "   "    stx  XF903
DFCF : E0 FF    "  "    subb  $FF,x
        ;
DFD1 : 03    " "    db  $03
        ;
DFD2        XDFD2:
DFD2 : C0 5F    " _"    subb  #$5F
DFD4 : F1 07 C0    "   "    cmpb  X07C0
DFD7 : FF 0F 00    "   "    stx  X0F00
DFDA : FF F1 07    "   "    stx  XF107
DFDD : E0 FF    "  "    subb  $FF,x
        ;
DFDF : 05    " "    db  $05
        ;
DFE0 : C0 7F    "  "    subb  #$7F
DFE2 : E0 0F    "  "    subb  $0F,x
DFE4 : C0 FF    "  "    subb  #$FF
DFE6 : 07    " "    tpa
        ;
DFE7 : 00    " "    db  $00
        ;
DFE8 : FF 83 0F    "   "    stx  X830F
DFEB : E0 FF    "  "    subb  $FF,x
DFED : 08    " "    inx
DFEE : C0 FF    "  "    subb  #$FF
DFF0 : 80 1F    "  "    suba  #$1F
DFF2 : C0 FF    "  "    subb  #$FF
        ;
DFF4 : 13 00    "  "    db  $13, $00
        ;
DFF6 : FF 03 3E    "  >"    stx  X033E
DFF9 : E0 7F    "  "    subb  $7F,x
DFFB : 30    "0"    tsx
DFFC : 80 FF    "  "    suba  #$FF
        ;
DFFE : 00    " "    db  $00
        ;
DFFF : 3F    "?"    swi
E000 : E0 3F    " ?"    subb  $3F,x
        ;
E002 : 3D 00    "= "    db  $3D, $00
        ;
E004 : FF 01 7C    "  |"    stx  X017C
E007 : E0 7F    "  "    subb  $7F,x
E009 : 60 80    "` "    neg  $80,x
E00B : FF 01 FC    "   "    stx  X01FC
E00E : C0 3F    " ?"    subb  #$3F
E010 : F8 01 FE    "   "    eorb  X01FE
E013 : 01    " "    nop
        ;
E014 : FC    " "    db  $FC
        ;
E015 : C1 3F    " ?"    cmpb  #$3F
E017 : D8 01    "  "    eorb  X0001
E019 : FE 03 F8    "   "    ldx  X03F8
E01C : C1 3F    " ?"    cmpb  #$3F
E01E : E8 01    "  "    eorb  $01,x
E020        XE020:
E020 : FE 03 F0    "   "    ldx  X03F0
        ;
E023 : E3 1F    "  "    db  $E3, $1F
        ;
E025 : F0 03 FC    "   "    subb  X03FC
        ;
E028 : 03    " "    db  $03
        ;
E029 : F0 C3 3F    "  ?"    subb  XC33F
E02C : A0 07    "  "    suba  $07,x
E02E : FE 03 F0    "   "    ldx  X03F0
        ;
E031 : CF 1F    "  "    db  $CF, $1F
        ;
E033 : E0 1F    "  "    subb  $1F,x
E035 : F8 03 E0    "   "    eorb  X03E0
        ;
E038 : CF    " "    db  $CF
        ;
E039 : 3F    "?"    swi
E03A : C0 0F    "  "    subb  #$0F
E03C : FE 03 E0    "   "    ldx  X03E0
E03F        XE03F:
E03F : FF 1F 80    "   "    stx  X1F80
E042 : 3F    "?"    swi
        ;
E043 : FC 03    "  "    db  $FC, $03
        ;
E045 : 80 FF    "  "    suba  #$FF
        ;
E047 : 1F    " "    db  $1F
        ;
E048 : 80 7F    "  "    suba  #$7F
E04A : FB 04 80    "   "    addb  X0480
E04D : FF 3F 00    " ? "    stx  X3F00
E050 : 7F F3 06    "   "    clr  XF306
        ;
E053 : 00    " "    db  $00
        ;
E054 : FF 7F 00    "   "    stx  X7F00
E057 : FE DE 09    "   "    ldx  XDE09
        ;
E05A : 00    " "    db  $00
        ;
E05B : FF 7F 00    "   "    stx  X7F00
E05E : FE CF 09    "   "    ldx  XCF09
        ;
E061 : 00    " "    db  $00
        ;
E062 : FE 7F 00    "   "    ldx  X7F00
        ;
E065 : FC    " "    db  $FC
        ;
E066 : BF 01 00    "   "    sts  X0100
E069 : FE 7F 00    "   "    ldx  X7F00
        ;
E06C : FC    " "    db  $FC
        ;
E06D : 3F    "?"    swi
        ;
E06E : 05 00 FC    "   "    db  $05, $00, $FC
        ;
E071 : FF 00 F8    "   "    stx  X00F8
E074 : FF 02 00    "   "    stx  X0200
        ;
E077 : FC    " "    db  $FC
        ;
E078 : FF 00 F0    "   "    stx  X00F0
E07B : FF 01 00    "   "    stx  X0100
E07E : FE 7F 00    "   "    ldx  X7F00
        ;
E081 : FC    " "    db  $FC
        ;
E082 : FF 01 00    "   "    stx  X0100
E085 : F4 FF 01    "   "    andb  XFF01
E088 : C0 FF    "  "    subb  #$FF
        ;
E08A : 03 00    "  "    db  $03, $00
        ;
E08C : DE FF    "  "    ldx  X00FF
        ;
E08E : 00    " "    db  $00
        ;
E08F : B0 FF 07    "   "    suba  XFF07
        ;
E092 : 00    " "    db  $00
        ;
E093 : D0 FF    "  "    subb  X00FF
        ;
E095 : 03    " "    db  $03
        ;
E096 : 80 FF    "  "    suba  #$FF
E098 : 0F    " "    sei
        ;
E099 : 00    " "    db  $00
        ;
E09A : F6 FF 01    "   "    ldab  XFF01
E09D : C0 FF    "  "    subb  #$FF
E09F : 07    " "    tpa
E0A0 : 40    "@"    nega
E0A1 : C2 FF    "  "    sbcb  #$FF
E0A3 : 07    " "    tpa
        ;
E0A4 : 00    " "    db  $00
        ;
E0A5 : FF 1F 00    "   "    stx  X1F00
E0A8 : EF F8    "  "    stx  $F8,x
E0AA : 0F    " "    sei
        ;
E0AB : 00    " "    db  $00
        ;
E0AC : FF 1F 80    "   "    stx  X1F80
E0AF : 0A    " "    clv
E0B0 : F7 1F 00    "   "    stab  X1F00
E0B3 : FE 3F 00    " ? "    ldx  X3F00
E0B6 : FE E2 1F    "   "    ldx  XE21F
        ;
E0B9 : 00    " "    db  $00
        ;
E0BA : FE 3F 00    " ? "    ldx  X3F00
        ;
E0BD : 5E    "^"    db  $5E
        ;
E0BE : D0 7F    "  "    subb  X007F
        ;
E0C0 : 00 FC    "  "    db  $00, $FC
        ;
E0C2 : 7F 00 FC    "   "    clr  X00FC
E0C5 : 88 7F    "  "    eora  #$7F
        ;
E0C7 : 00    " "    db  $00
        ;
E0C8 : FE 3F 00    " ? "    ldx  X3F00
        ;
E0CB : FC    " "    db  $FC
        ;
E0CC : E0 FF    "  "    subb  $FF,x
        ;
E0CE : 00 FC    "  "    db  $00, $FC
        ;
E0D0 : 7F 00 F8    "   "    clr  X00F8
E0D3 : 43    "C"    coma
E0D4 : FE 01 FE    "   "    ldx  X01FE
E0D7 : 3F    "?"    swi
        ;
E0D8 : 00 FC    "  "    db  $00, $FC
        ;
E0DA : 80 FE    "  "    suba  #$FE
        ;
E0DC : 03    " "    db  $03
        ;
E0DD : B4 FF 01    "   "    anda  XFF01
E0E0 : F0 05 FD    "   "    subb  X05FD
        ;
E0E3 : 03 FC    "  "    db  $03, $FC
        ;
E0E5 : 7F 00 F8    "   "    clr  X00F8
        ;
E0E8 : 03    " "    db  $03
        ;
E0E9 : FA 07 5C    "  \"    orab  X075C
E0EC : FF 03 E0    "   "    stx  X03E0
E0EF : 23 F6    "# "    bls  LE0E7
E0F1 : 07    " "    tpa
        ;
E0F2 : FC    " "    db  $FC
        ;
E0F3 : 4F    "O"    clra
        ;
E0F4 : 00    " "    db  $00
        ;
E0F5 : F0 07 E8    "   "    subb  X07E8
E0F8 : 3F    "?"    swi
E0F9 : B4 BA 17    "   "    anda  XBA17
E0FC : C0 0F    "  "    subb  #$0F
E0FE : 98 3F    " ?"    eora  X003F
        ;
E100 : FC    " "    db  $FC
        ;
E101 : 19    " "    daa
        ;
E102 : 3A    ":"    db  $3A
        ;
E103 : C0 0F    "  "    subb  #$0F
E105        LE105:
E105 : 90 FF    "  "    suba  X00FF
E107 : AC 41    " A"    cpx  $41,x
E109 : 7F 80 1D    "   "    clr  X801D
E10C : 09    " "    dex
E10D : FE FF 01    "   "    ldx  XFF01
E110 : F8 08 37    "  7"    eorb  X0837
        ;
E113 : 00 FC    "  "    db  $00, $FC
        ;
E115 : FF 00 FC    "   "    stx  X00FC
        ;
E118 : 03    " "    db  $03
        ;
E119 : 6A 05    "j "    dec  $05,x
E11B : F0 FF 01    "   "    subb  XFF01
E11E : F0 0F F4    "   "    subb  X0FF4
E121 : 01    " "    nop
E122 : E0 FF    "  "    subb  $FF,x
        ;
E124 : 03    " "    db  $03
        ;
E125 : F0 1F E0    "   "    subb  X1FE0
E128 : 07    " "    tpa
E129 : C0 FF    "  "    subb  #$FF
E12B : 07    " "    tpa
E12C : C0 3F    " ?"    subb  #$3F
E12E : F0 07 80    "   "    subb  X0780
E131 : FF 07 E0    "   "    stx  X07E0
E134 : 3F    "?"    swi
E135 : C0 0F    "  "    subb  #$0F
        ;
E137 : 00    " "    db  $00
        ;
E138 : FF 0F 80    "   "    stx  X0F80
E13B : FF C0 1F    "   "    stx  XC01F
        ;
E13E : 00    " "    db  $00
        ;
E13F : FF 0F 80    "   "    stx  X0F80
E142 : FF 80 1F    "   "    stx  X801F
        ;
E145 : 00    " "    db  $00
        ;
E146 : FE 1F 00    "   "    ldx  X1F00
E149 : FE 07 1F    "   "    ldx  X071F
        ;
E14C : 00    " "    db  $00
        ;
E14D : FF 0F 00    "   "    stx  X0F00
E150 : FF 03 3D    "  ="    stx  X033D
        ;
E153 : 00    " "    db  $00
        ;
E154 : FF 3F 00    " ? "    stx  X3F00
        ;
E157 : FC    " "    db  $FC
        ;
E158 : 0F    " "    sei
        ;
E159 : 1C 00    "  "    db  $1C, $00
        ;
E15B : FF 3F 00    " ? "    stx  X3F00
        ;
E15E : FC    " "    db  $FC
        ;
E15F : 0F    " "    sei
E160 : 2A 00    "* "    bpl  LE162
E162        LE162:
E162 : FF FF 00    "   "    stx  XFF00
E165 : F8 3F 20    " ? "    eorb  X3F20
        ;
E168 : 00    " "    db  $00
        ;
E169 : FF 7F 00    "   "    stx  X7F00
E16C : F8 1F 58    "  X"    eorb  X1F58
E16F : 80 7E    " ~"    suba  #$7E
E171 : FF 01 F0    "   "    stx  X01F0
E174 : 9F 20    "  "    sts  X0020
E176 : A0 F7    "  "    suba  $F7,x
E178 : FE 01 F0    "   "    ldx  X01F0
E17B : 3F    "?"    swi
E17C : 44    "D"    lsra
E17D : 80 7F    "  "    suba  #$7F
E17F : F8 07 E0    "   "    eorb  X07E0
E182 : 3F    "?"    swi
E183 : 22 80    "" "    bhi  LE105
E185 : 3F    "?"    swi
        ;
E186 : FC    " "    db  $FC
        ;
E187 : 07    " "    tpa
E188 : F0 4F 15    " O "    subb  X4F15
E18B : 40    "@"    nega
E18C : 3F    "?"    swi
E18D : E0 3F    " ?"    subb  $3F,x
E18F : 60 CF    "` "    neg  $CF,x
        ;
E191 : 3C 00    "< "    db  $3C, $00
        ;
E193 : 7F E0 1F    "   "    clr  XE01F
E196 : E0 17    "  "    subb  $17,x
E198 : 7A 80 7F    "z  "    dec  X807F
E19B : 80 FF    "  "    suba  #$FF
E19D : C0 05    "  "    subb  #$05
E19F : F5 07 7E    "  ~"    bitb  X077E
E1A2 : 80 FF    "  "    suba  #$FF
E1A4 : A0 83    "  "    suba  $83,x
        ;
E1A6 : FC    " "    db  $FC
        ;
E1A7 : 07    " "    tpa
        ;
E1A8 : FC 00    "  "    db  $FC, $00
        ;
E1AA : FE 33 06    " 3 "    ldx  X3306
E1AD : F0 0F FC    "   "    subb  X0FFC
        ;
E1B0 : 00    " "    db  $00
        ;
E1B1 : FE 53 01    " S "    ldx  X5301
E1B4 : F4 1F 7C    "  |"    andb  X1F7C
        ;
E1B7 : 00    " "    db  $00
        ;
E1B8 : F6 FF 00    "   "    ldab  XFF00
E1BB : C0 FF    "  "    subb  #$FF
E1BD : 70 00 FC    "p  "    neg  X00FC
E1C0 : 7F 00 D0    "   "    clr  X00D0
E1C3 : FF C8 00    "   "    stx  XC800
E1C6 : 6E FE    "n "    jmp  $FE,x            ;INFO: index jump
        ;
E1C8 : 07    " "    tpa
        ;
E1C9 : 00    " "    db  $00
        ;
E1CA : FF 0F 20    "   "    stx  X0F20
E1CD : F8 FF 03    "   "    eorb  XFF03
        ;
E1D0 : 00    " "    db  $00
        ;
E1D1 : FF 4F 00    " O "    stx  X4F00
E1D4 : D5 F9    "  "    bitb  X00F9
E1D6 : 0F    " "    sei
        ;
E1D7 : 00    " "    db  $00
        ;
E1D8 : FE 3F 00    " ? "    ldx  X3F00
E1DB : EA FF    "  "    orab  $FF,x
E1DD : 07    " "    tpa
        ;
E1DE : 00 FC    "  "    db  $00, $FC
        ;
E1E0 : 7F 00 DC    "   "    clr  X00DC
E1E3 : EB 3F    " ?"    addb  $3F,x
        ;
E1E5 : 00    " "    db  $00
        ;
E1E6 : F8 FF 00    "   "    eorb  XFF00
E1E9 : B8 FB 5E    "  ^"    eora  XFB5E
        ;
E1EC : 00    " "    db  $00
        ;
E1ED : F0 FF 01    "   "    subb  XFF01
E1F0 : F0 BD FC    "   "    subb  XBDFC
        ;
E1F3 : 00    " "    db  $00
        ;
E1F4 : E0 FF    "  "    subb  $FF,x
        ;
E1F6 : 03    " "    db  $03
        ;
E1F7 : E0 FB    "  "    subb  $FB,x
        ;
E1F9 : 72 00    "r "    db  $72, $00
        ;
E1FB : E0 FF    "  "    subb  $FF,x
E1FD : 07    " "    tpa
E1FE : 80 FF    "  "    suba  #$FF
        ;
E200 : 61    "a"    db  $61
        ;
E201 : 07    " "    tpa
E202 : C0 FF    "  "    subb  #$FF
E204 : 0F    " "    sei
E205 : 80 FF    "  "    suba  #$FF
        ;
E207 : 05 18    "  "    db  $05, $18
        ;
E209 : A8 FF    "  "    eora  $FF,x
E20B : 07    " "    tpa
E20C : 80 FF    "  "    suba  #$FF
        ;
E20E : 03    " "    db  $03
        ;
E20F : F8 80 FF    "   "    eorb  X80FF
E212 : 67 00    "g "    asr  $00,x
        ;
E214 : FC    " "    db  $FC
        ;
E215 : 0F    " "    sei
E216 : 70 41 FF    "pA "    neg  X41FF
        ;
E219 : 87 00 FC 1F  "    "    db  $87, $00, $FC, $1F
        ;
E21D : C0 07    "  "    subb  #$07
        ;
E21F        XE21F:
E21F : FC 1F 02    "   "    db  $FC, $1F, $02
        ;
E222 : F8 3F 00    " ? "    eorb  X3F00
E225 : 3F    "?"    swi
E226 : E9 0F    "  "    adcb  $0F,x
        ;
E228 : 1C    " "    db  $1C
        ;
E229 : F0 3F 00    " ? "    subb  X3F00
E22C : 7F E0 3F    "  ?"    clr  XE03F
E22F : 30    "0"    tsx
E230 : E0 7F    "  "    subb  $7F,x
        ;
E232 : 00 FC 83    "   "    db  $00, $FC, $83
        ;
E235 : 3F    "?"    swi
E236 : E0 D1    "  "    subb  $D1,x
E238 : 7F 00 F8    "   "    clr  X00F8
        ;
E23B : 83    " "    db  $83
        ;
E23C : 7F 80 33    "  3"    clr  X8033
E23F : FF 01 E0    "   "    stx  X01E0
        ;
E242 : 1F    " "    db  $1F
        ;
E243 : 7E 80 FF    "~  "    jmp  L80FF
        ;
E246 : BC 00 E0    "   "    cpx  X00E0
        ;
E249 : 1F    " "    db  $1F
        ;
E24A : FA 01 7E    "  ~"    orab  X017E
E24D : FB 03 80    "   "    addb  X0380
E250 : 7F FC 00    "   "    clr  XFC00
        ;
E253 : FC    " "    db  $FC
        ;
E254 : 37    "7"    pshb
        ;
E255 : 02    " "    db  $02
        ;
E256 : 80 FF    "  "    suba  #$FF
E258 : D1 03    "  "    cmpb  X0003
        ;
E25A : FC 8F 12    "   "    db  $FC, $8F, $12
        ;
E25D : 80 FD    "  "    suba  #$FD
E25F : 47    "G"    asra
E260 : 0D    " "    sec
E261 : F0 3F 80    " ? "    subb  X3F80
E264 : 81 F1    "  "    cmpa  #$F1
E266 : 4F    "O"    clra
        ;
E267 : 1E    " "    db  $1E
        ;
E268 : F0 BF 40    "  @"    subb  XBF40
E26B : 01    " "    nop
E26C : CA FF    "  "    orab  #$FF
E26E : 09    " "    dex
E26F : F0 FF 00    "   "    subb  XFF00
E272 : 64 01    "d "    lsr  $01,x
E274 : FF 49 9C    " I "    stx  X499C
E277 : FB 03 B0    "   "    addb  X03B0
        ;
E27A : 00    " "    db  $00
        ;
E27B : FE 0F 78    "  x"    ldx  X0F78
E27E : FB 07 E0    "   "    addb  X07E0
        ;
E281 : 03    " "    db  $03
        ;
E282 : F0 5F DC    " _ "    subb  X5FDC
E285 : F0 0F C0    "   "    subb  X0FC0
E288 : 07    " "    tpa
E289 : E0 7F    "  "    subb  $7F,x
E28B : F0 85 BF    "   "    subb  X85BF
        ;
E28E : 00 1F    "  "    db  $00, $1F
        ;
E290 : 80 FF    "  "    suba  #$FF
E292 : F1 02 FE    "   "    cmpb  X02FE
E295 : 01    " "    nop
E296 : 3E    ">"    wai
        ;
E297 : 00    " "    db  $00
        ;
E298 : FE AF 0B    "   "    ldx  XAF0B
E29B : F0 0F F8    "   "    subb  X0FF8
        ;
E29E : 00    " "    db  $00
        ;
E29F : F8 BF 06    "   "    eorb  XBF06
E2A2 : E0 3F    " ?"    subb  $3F,x
E2A4 : E0 03    "  "    subb  $03,x
E2A6 : C0 FF    "  "    subb  #$FF
E2A8 : 0B    " "    sev
E2A9 : 80 FF    "  "    suba  #$FF
E2AB : C0 0F    "  "    subb  #$0F
E2AD : 80 FF    "  "    suba  #$FF
E2AF : 0B    " "    sev
E2B0 : 80 FF    "  "    suba  #$FF
E2B2 : 01    " "    nop
E2B3 : 7E 00 FE    "~  "    jmp  L00FE
        ;
E2B6 : 8F 00    "  "    db  $8F, $00
        ;
E2B8 : FE 07 7E    "  ~"    ldx  X077E
        ;
E2BB : 00 FC 1F    "   "    db  $00, $FC, $1F
        ;
E2BE : 80 FE    "  "    suba  #$FE
E2C0 : 07    " "    tpa
E2C1 : F8 00 F8    "   "    eorb  X00F8
E2C4 : 3F    "?"    swi
E2C5 : 80 F8    "  "    suba  #$F8
        ;
E2C7 : 1F    " "    db  $1F
        ;
E2C8 : F8 00 F8    "   "    eorb  X00F8
E2CB : 3F    "?"    swi
E2CC : 80 FE    "  "    suba  #$FE
        ;
E2CE : 1F    " "    db  $1F
        ;
E2CF : A0 0B    "  "    suba  $0B,x
E2D1 : E0 FF    "  "    subb  $FF,x
        ;
E2D3 : 00    " "    db  $00
        ;
E2D4 : DA FF    "  "    orab  X00FF
        ;
E2D6 : 00    " "    db  $00
        ;
E2D7        LE2D7:
E2D7 : 09    " "    dex
E2D8 : F8 FF 01    "   "    eorb  XFF01
        ;
E2DB : FC    " "    db  $FC
        ;
E2DC : EE 00    "  "    ldx  $00,x
E2DE : B8 82 FE    "   "    eora  X82FE
E2E1 : 07    " "    tpa
E2E2 : F8 EA 0F    "   "    eorb  XEA0F
E2E5 : 80 4B    " K"    suba  #$4B
E2E7 : FE 0F F0    "   "    ldx  X0FF0
E2EA : 47    "G"    asra
E2EB : 3F    "?"    swi
        ;
E2EC : 00 1F    "  "    db  $00, $1F
        ;
E2EE : F8 1F E0    "   "    eorb  X1FE0
E2F1 : 0F    " "    sei
        ;
E2F2 : FD 00 FC 41  "   A"    db  $FD, $00, $FC, $41
        ;
E2F6 : 7F A0 3F    "  ?"    clr  XA03F
E2F9 : E8 03    "  "    eorb  $03,x
        ;
E2FB : FC    " "    db  $FC
        ;
E2FC : 01    " "    nop
E2FD : 7F C2 3F    "  ?"    clr  XC23F
E300 : C0 0F    "  "    subb  #$0F
        ;
E302 : EC    " "    db  $EC
        ;
E303 : 07    " "    tpa
E304 : E0 1F    "  "    subb  $1F,x
E306 : 3F    "?"    swi
E307 : 80 5F    " _"    suba  #$5F
E309 : A8 27    " '"    eora  $27,x
        ;
E30B : 04    " "    db  $04
        ;
E30C : FF DE 00    "   "    stx  XDE00
E30F : F4 1F 7A    "  z"    andb  X1F7A
        ;
E312 : 00 FC    "  "    db  $00, $FC
        ;
E314 : 4F    "O"    clra
E315 : 27 C0    "' "    beq  LE2D7
E317 : 7F C0 0F    "   "    clr  XC00F
E31A : E0 3F    " ?"    subb  $3F,x
        ;
E31C : 75 00    "u "    db  $75, $00
        ;
E31E : FE C1 1F    "   "    ldx  XC11F
E321 : 80 7F    "  "    suba  #$7F
E323 : F4 00 FC    "   "    andb  X00FC
        ;
E326 : 03    " "    db  $03
        ;
E327 : 7F 00 FE    "   "    clr  X00FE
E32A : F1 07 F0    "   "    cmpb  X07F0
E32D : 0F    " "    sei
E32E : FA 01 FC    "   "    orab  X01FC
        ;
E331 : C7    " "    db  $C7
        ;
E332 : 0F    " "    sei
E333 : E0 2F    " /"    subb  $2F,x
E335 : F8 05 E0    "   "    eorb  X05E0
E338 : 9F 3F    " ?"    sts  X003F
E33A : 80 5F    " _"    suba  #$5F
E33C : DA 07    "  "    orab  X0007
        ;
E33E : 00    " "    db  $00
        ;
E33F : FF 6F 00    " o "    stx  X6F00
E342 : F2 0F FE    "   "    sbcb  X0FFE
        ;
E345 : 00    " "    db  $00
        ;
E346 : F8 FF 00    "   "    eorb  XFF00
E349 : E0 FF    "  "    subb  $FF,x
E34B : D4 01    "  "    andb  X0001
E34D : E0 FF    "  "    subb  $FF,x
E34F : 09    " "    dex
        ;
E350 : 00    " "    db  $00
        ;
E351 : FF F1 07    "   "    stx  XF107
        ;
E354 : 00    " "    db  $00
        ;
E355 : FF 4F 00    " O "    stx  X4F00
        ;
E358 : FC    " "    db  $FC
        ;
E359 : AF 0E    "  "    sts  $0E,x
        ;
E35B : 00    " "    db  $00
        ;
E35C : FE 3F 01    " ? "    ldx  X3F01
E35F : F0 7F 1D    "   "    subb  X7F1D
        ;
E362 : 00    " "    db  $00
        ;
E363 : F8 FF 00    "   "    eorb  XFF00
E366 : A0 FF    "  "    suba  $FF,x
E368 : 27 00    "' "    beq  LE36A
E36A        LE36A:
E36A : E0 FF    "  "    subb  $FF,x
        ;
E36C : 03    " "    db  $03
        ;
E36D : C0 FE    "  "    subb  #$FE
E36F : 5F    "_"    clrb
        ;
E370 : 00    " "    db  $00
        ;
E371 : E0 FF    "  "    subb  $FF,x
E373 : 07    " "    tpa
E374 : 40    "@"    nega
E375 : F6 7F 00    "   "    ldab  X7F00
E378 : 80 FF    "  "    suba  #$FF
E37A : 0F    " "    sei
E37B : 40    "@"    nega
E37C : F9 FF 00    "   "    adcb  XFF00
        ;
E37F : 00    " "    db  $00
        ;
E380 : FF 3F 00    " ? "    stx  X3F00
        ;
E383 : E3    " "    db  $E3
        ;
E384 : FE 03 00    "   "    ldx  X0300
E387 : FE 7F 00    "   "    ldx  X7F00
E38A : 8D FD    "  "    bsr  LE389
        ;
E38C : 1F 00    "  "    db  $1F, $00
        ;
E38E : 7A FF 01    "z  "    dec  XFF01
        ;
E391 : 5E    "^"    db  $5E
        ;
E392 : F0 3F 00    " ? "    subb  X3F00
E395 : D5 F5    "  "    bitb  X00F5
E397 : 07    " "    tpa
        ;
E398 : FC 00    "  "    db  $FC, $00
        ;
E39A : FE 03 9C    "   "    ldx  X039C
E39D : E8 3F    " ?"    eorb  $3F,x
E39F : F0 03 F8    "   "    subb  X03F8
E3A2 : 0F    " "    sei
E3A3 : B8 02 FF    "   "    eora  X02FF
E3A6 : E1 0F    "  "    cmpb  $0F,x
E3A8 : C0 3F    " ?"    subb  #$3F
E3AA : E0 07    "  "    subb  $07,x
E3AC : F8 EB 1F    "   "    eorb  XEB1F
        ;
E3AF : 00    " "    db  $00
        ;
E3B0 : FE 83 07    "   "    ldx  X8307
E3B3 : E0 7F    "  "    subb  $7F,x
E3B5 : 5F    "_"    clrb
        ;
E3B6 : 00 FC    "  "    db  $00, $FC
        ;
E3B8 : 07    " "    tpa
E3B9 : 3E    ">"    wai
E3BA : 80 FF    "  "    suba  #$FF
E3BC : BF 00 F0    "   "    sts  X00F0
E3BF : 3F    "?"    swi
E3C0 : B8 00 FE    "   "    eora  X00FE
E3C3 : 7F 00 E0    "   "    clr  X00E0
E3C6 : 7F D8 00    "   "    clr  XD800
E3C9 : F8 FF 03    "   "    eorb  XFF03
E3CC : 80 FF    "  "    suba  #$FF
E3CE : 43    "C"    coma
E3CF : 01    " "    nop
E3D0 : F0 FF 01    "   "    subb  XFF01
        ;
E3D3 : 00    " "    db  $00
        ;
E3D4 : FF 4F 08    " O "    stx  X4F08
E3D7 : E0 FF    "  "    subb  $FF,x
E3D9 : 07    " "    tpa
        ;
E3DA : 00    " "    db  $00
        ;
E3DB : FA FF 00    "   "    orab  XFF00
E3DE : 60 FF    "` "    neg  $FF,x
        ;
E3E0 : 1F 00    "  "    db  $1F, $00
        ;
E3E2 : F4 FF 01    "   "    andb  XFF01
E3E5 : 30    "0"    tsx
E3E6 : B7 7F 00    "   "    staa  X7F00
E3E9 : A4 FF    "  "    anda  $FF,x
E3EB : 0F    " "    sei
E3EC : C0 B6    "  "    subb  #$B6
        ;
E3EE : FC 03    "  "    db  $FC, $03
        ;
E3F0 : 08    " "    inx
        ;
E3F1 : FD    " "    db  $FD
        ;
E3F2 : 7F 00 2B    "  +"    clr  X002B
E3F5 : F1 1F 00    "   "    cmpb  X1F00
E3F8 : F6 FF 00    "   "    ldab  XFF00
E3FB : 76 A0 FF    "v  "    ror  XA0FF
        ;
E3FE : 00    " "    db  $00
        ;
E3FF : F8 FF 05    "   "    eorb  XFF05
E402 : E8 01    "  "    eorb  $01,x
E404 : FE 07 E0    "   "    ldx  X07E0
        ;
E407 : FD    " "    db  $FD
        ;
E408 : 0F    " "    sei
E409 : D0 06    "  "    subb  X0006
E40B : F0 1F 80    "   "    subb  X1F80
E40E : DF 7F    "  "    stx  X007F
        ;
E410 : 00    " "    db  $00
        ;
E411 : 1B    " "    aba
E412 : E0 7F    "  "    subb  $7F,x
        ;
E414 : 00    " "    db  $00
        ;
E415 : 7D FF 03    "}  "    tst  XFF03
E418 : F0 00 FF    "   "    subb  X00FF
E41B : 01    " "    nop
        ;
E41C : FC    " "    db  $FC
        ;
E41D : F2 1F E0    "   "    sbcb  X1FE0
        ;
E420 : 03 FC    "  "    db  $03, $FC
        ;
E422 : 07    " "    tpa
E423 : D0 D7    "  "    subb  X00D7
E425 : 7F 00 1F    "   "    clr  X001F
E428 : E0 3F    " ?"    subb  $3F,x
E42A : C0 1F    "  "    subb  #$1F
E42C : FF 00 3E    "  >"    stx  X003E
E42F : C0 FF    "  "    subb  #$FF
        ;
E431 : 00    " "    db  $00
        ;
E432 : FE F8 03    "   "    ldx  XF803
        ;
E435 : FC 00 FC 03  "    "    db  $FC, $00, $FC, $03
        ;
E439 : FE C1 2F    "  /"    ldx  XC12F
E43C : E8 01    "  "    eorb  $01,x
E43E : F8 27 E8    " ' "    eorb  X27E8
E441 : 0F    " "    sei
E442 : F6 C2 07    "   "    ldab  XC207
E445 : E0 1D    "  "    subb  $1D,x
E447 : F1 0F E0    "   "    cmpb  X0FE0
E44A : 7F 12 40    "  @"    clr  X1240
E44D : 6F E8    "o "    clr  $E8,x
E44F : 7F 00 FF    "   "    clr  X00FF
        ;
E452 : 15    " "    db  $15
        ;
E453 : 10    " "    sba
E454 : 01    " "    nop
E455 : FF BF 00    "   "    stx  XBF00
        ;
E458 : FC    " "    db  $FC
        ;
E459 : 4F    "O"    clra
E45A : 80 48    " H"    suba  #$48
E45C : F5 7F 02    "   "    bitb  X7F02
E45F : F8 7F 80    "   "    eorb  X7F80
        ;
E462 : 02    " "    db  $02
        ;
E463 : F8 FF 01    "   "    eorb  XFF01
E466 : E0 FF    "  "    subb  $FF,x
E468 : 01    " "    nop
E469 : 50    "P"    negb
E46A : 74 FF 03    "t  "    lsr  XFF03
E46D : 70 FF 0D    "p  "    neg  XFF0D
E470 : 40    "@"    nega
E471 : 11    " "    cba
E472 : FB 1F C0    "   "    addb  X1FC0
E475 : 79 FF 00    "y  "    rol  XFF00
E478 : 58    "X"    aslb
E479 : F1 3F C0    " ? "    cmpb  X3FC0
E47C : A7 FE    "  "    staa  $FE,x
        ;
E47E : 03    " "    db  $03
        ;
E47F : F0 40 FF    " @ "    subb  X40FF
E482 : 01    " "    nop
        ;
E483 : 1F    " "    db  $1F
        ;
E484 : F4 1F C0    "   "    andb  X1FC0
E487 : 07    " "    tpa
        ;
E488 : FC    " "    db  $FC
        ;
E489 : 07    " "    tpa
E48A : BE 01 FF    "   "    lds  X01FF
E48D : 80 0F    "  "    suba  #$0F
E48F : C0 FF    "  "    subb  #$FF
E491 : D0 01    "  "    subb  X0001
E493 : FE 03 BA    "   "    ldx  X03BA
E496 : 80 FC    "  "    suba  #$FC
E498 : 27 47    "'G"    beq  LE4E1
E49A : C0 7F    "  "    subb  #$7F
E49C : E0 03    "  "    subb  $03,x
E49E : E0 3F    " ?"    subb  $3F,x
E4A0 : 79 00 FF    "y  "    rol  X00FF
        ;
E4A3 : 03    " "    db  $03
        ;
E4A4 : 3E    ">"    wai
        ;
E4A5 : 00    " "    db  $00
        ;
E4A6 : FF C9 03    "   "    stx  XC903
E4A9 : F8 0F 7C    "  |"    eorb  X0F7C
        ;
E4AC : 00 FC 8F    "   "    db  $00, $FC, $8F
        ;
E4AF : 0D    " "    sec
E4B0 : E0 3F    " ?"    subb  $3F,x
E4B2 : E8 03    "  "    eorb  $03,x
E4B4 : F0 3F 9D    " ? "    subb  X3F9D
        ;
E4B7 : 00    " "    db  $00
        ;
E4B8 : FF E6 05    "   "    stx  XE605
E4BB : 80 FF    "  "    suba  #$FF
E4BD : 57    "W"    asrb
E4BE : 80 BC    "  "    suba  #$BC
E4C0 : 5F    "_"    clrb
E4C1 : 0D    " "    sec
        ;
E4C2 : 00 FC    "  "    db  $00, $FC
        ;
E4C4 : FF 80 88    "   "    stx  X8088
E4C7 : FB 9F 00    "   "    addb  X9F00
E4CA : E0 FF    "  "    subb  $FF,x
E4CC : 43    "C"    coma
E4CD : 88 FC    "  "    eora  #$FC
E4CF : F7 03 00    "   "    stab  X0300
E4D2 : FF 6F 00    " o "    stx  X6F00
        ;
E4D5 : DC    " "    db  $DC
        ;
E4D6 : BF 17 00    "   "    sts  X1700
E4D9 : FE E7 05    "   "    ldx  XE705
E4DC : B0 A7 7F    "   "    suba  XA77F
        ;
E4DF : 00    " "    db  $00
        ;
E4E0 : F8 B7 4E    "  N"    eorb  XB74E
E4E3 : 80 5F    " _"    suba  #$5F
E4E5 : FE 00 F0    "   "    ldx  X00F0
E4E8 : 5F    "_"    clrb
        ;
E4E9 : 15    " "    db  $15
        ;
E4EA : 89 7E    " ~"    adca  #$7E
E4EC : 7D 00 E8    "}  "    tst  X00E8
E4EF : 7F 08 39    "  9"    clr  X0839
E4F2 : FB 4E 01    " N "    addb  X4E01
E4F5 : D0 FF    "  "    subb  X00FF
E4F7 : 01    " "    nop
E4F8 : 68 FD    "h "    asl  $FD,x
E4FA : 97 08    "  "    staa  $08
E4FC : C0 FF    "  "    subb  #$FF
E4FE : 07    " "    tpa
E4FF : C0 CB    "  "    subb  #$CB
E501 : 7F 40 80    " @ "    clr  X4080
E504 : FE 1F 80    "   "    ldx  X1F80
E507 : D6 F7    "  "    ldab  X00F7
        ;
E509 : 03    " "    db  $03
        ;
E50A : 88 BC    "  "    eora  #$BC
E50C : FF 00 94    "   "    stx  X0094
E50F : FB 0F 10    "   "    addb  X0F10
E512 : F9 FE 01    "   "    adcb  XFE01
E515 : 29 E9    ") "    bvs  LE500
E517 : 3F    "?"    swi
E518 : 40    "@"    nega
E519 : AB FD    "  "    adda  $FD,x
        ;
E51B : 03    " "    db  $03
        ;
E51C : 7E 01 FE    "~  "    jmp  L01FE
        ;
E51F : 01    " "    nop
E520 : 7E C5 0F    "~  "    jmp  LC50F
        ;
E523 : F8 0F E0    "   "    eorb  X0FE0
E526 : 07    " "    tpa
E527 : DA 4E    " N"    orab  X004E
E529 : 7E C0 5F    "~ _"    jmp  LC05F
        ;
E52C : A0 1F    "  "    suba  $1F,x
E52E : E0 07    "  "    subb  $07,x
E530 : 7F 41 1F    " A "    clr  X411F
E533 : E0 3F    " ?"    subb  $3F,x
E535 : 80 3F    " ?"    suba  #$3F
E537 : E0 AF    "  "    subb  $AF,x
        ;
E539 : 5E 00    "^ "    db  $5E, $00
        ;
E53B : FE 07 54    "  T"    ldx  X0754
E53E : F0 77 57    " wW"    subb  X7757
        ;
E541 : 00    " "    db  $00
        ;
E542 : F8 3F A8    " ? "    eorb  X3FA8
        ;
E545 : 00    " "    db  $00
        ;
E546 : FF D7 02    "   "    stx  XD702
E549 : E0 7F    "  "    subb  $7F,x
E54B : 54    "T"    lsrb
E54C : 01    " "    nop
E54D : F4 FF 00    "   "    andb  XFF00
E550 : C8 FF    "  "    eorb  #$FF
        ;
E552 : 21    "!"    db  $21
        ;
E553 : 0B    " "    sev
E554 : E0 FF    "  "    subb  $FF,x
E556 : 07    " "    tpa
        ;
E557 : 00    " "    db  $00
        ;
E558 : FF 5B 01    " [ "    stx  X5B01
E55B : E8 FE    "  "    eorb  $FE,x
        ;
E55D : 03    " "    db  $03
        ;
E55E : 88 F8    "  "    eora  #$F8
E560 : 9F AC    "  "    sts  X00AC
        ;
E562 : 00    " "    db  $00
        ;
E563 : F7 3F 00    " ? "    stab  X3F00
        ;
E566 : FC    " "    db  $FC
        ;
E567 : EB 05    "  "    addb  $05,x
E569 : D4 4A    " J"    andb  X004A
E56B : 7F 04 C0    "   "    clr  X04C0
E56E : FF 03 D4    "   "    stx  X03D4
E571 : 7A B5 82    "z  "    dec  XB582
E574 : 8C F8 7F    "   "    cpx  #$F87F
        ;
E577 : 00    " "    db  $00
        ;
E578 : 5F    "_"    clrb
E579 : F2 07 28    "  ("    sbcb  X0728
E57C : 77 DD 01    "w  "    asr  XDD01
E57F : E2 86    "  "    sbcb  $86,x
E581 : FF 00 F8    "   "    stx  X00F8
E584 : FF 00 BE    "   "    stx  X00BE
E587 : 01    " "    nop
        ;
E588 : FD    " "    db  $FD
        ;
E589 : 19    " "    daa
E58A : C0 FD    "  "    subb  #$FD
E58C : 0F    " "    sei
E58D : C0 17    "  "    subb  #$17
E58F : E8 0F    "  "    eorb  $0F,x
E591        LE591:
E591 : D8 8B    "  "    eorb  X008B
E593 : 7F 02 15    "   "    clr  X0215
E596 : EA 1F    "  "    orab  $1F,x
E598 : 80 7F    "  "    suba  #$7F
        ;
E59A : ED 02    "  "    db  $ED, $02
        ;
E59C : 76 80 FF    "v  "    ror  X80FF
E59F : 01    " "    nop
        ;
E5A0 : FC EC    "  "    db  $FC, $EC
        ;
E5A2 : 0F    " "    sei
E5A3 : E0 05    "  "    subb  $05,x
E5A5 : FA 07 D0    "   "    orab  X07D0
        ;
E5A8 : 5B    "["    db  $5B
        ;
E5A9 : 7F 80 15    "   "    clr  X8015
E5AC : F4 2F C0    " / "    andb  X2FC0
E5AF : 8D FF    "  "    bsr  LE5B0
        ;
E5B1 : 02 1D    "  "    db  $02, $1D
        ;
E5B3 : E0 BF    "  "    subb  $BF,x
        ;
E5B5 : 00    " "    db  $00
        ;
E5B6 : 7F F8 0B    "   "    clr  XF80B
E5B9 : F8 00 FF    "   "    eorb  X00FF
        ;
E5BC : 02 FC    "  "    db  $02, $FC
        ;
E5BE : B2 47 D4    " G "    sbca  X47D4
        ;
E5C1 : 03    " "    db  $03
        ;
E5C2 : F4 17 F8    "   "    andb  X17F8
        ;
E5C5 : 03    " "    db  $03
        ;
E5C6 : BF 62 07    " b "    sts  X6207
E5C9 : F0 0F F1    "   "    subb  X0FF1
E5CC : 47    "G"    asra
E5CD : A8 2F    " /"    eora  $2F,x
E5CF : 2D C0    "- "    blt  LE591
E5D1 : 36    "6"    psha
E5D2 : E6 3F    " ?"    ldab  $3F,x
E5D4 : 80 FE    "  "    suba  #$FE
        ;
E5D6 : 15    " "    db  $15
        ;
E5D7 : 90 AA    "  "    suba  X00AA
E5D9 : E6 7F    "  "    ldab  $7F,x
        ;
E5DB : 00 FC    "  "    db  $00, $FC
        ;
E5DD : 57    "W"    asrb
E5DE : 92 00    "  "    sbca  X0000
        ;
E5E0 : FD    " "    db  $FD
        ;
E5E1 : 7F 00 F8    "   "    clr  X00F8
E5E4 : 5F    "_"    clrb
E5E5 : 22 22    """"    bhi  LE609
E5E7 : D4 FF    "  "    andb  X00FF
E5E9 : 01    " "    nop
E5EA : E8 FE    "  "    eorb  $FE,x
        ;
E5EC : 45    "E"    db  $45
        ;
E5ED : 40    "@"    nega
E5EE : A8 FF    "  "    eora  $FF,x
        ;
E5F0        LE5F0:
E5F0 : 03    " "    db  $03
        ;
E5F1 : B0 EF 0F    "   "    suba  XEF0F
E5F4 : 40    "@"    nega
E5F5 : A9 FF    "  "    adca  $FF,x
        ;
E5F7 : 03    " "    db  $03
        ;
E5F8 : E0 FD    "  "    subb  $FD,x
E5FA : 17    " "    tba
E5FB : 80 AD    "  "    suba  #$AD
E5FD : F4 1F A0    "   "    andb  X1FA0
E600 : B7 7D 01    " } "    staa  X7D01
        ;
E603 : EC 42    " B"    db  $EC, $42
        ;
E605        XE605:
E605 : 7F A0 1F    "   "    clr  XA01F
E608 : F1 07 F4    "   "    cmpb  X07F4
        ;
E60B : 02 FC    "  "    db  $02, $FC
        ;
E60D : 4F    "O"    clra
E60E : 2C E0    ", "    bge  LE5F0
E610 : 7F 00 0B    "   "    clr  X000B
        ;
E613 : FD    " "    db  $FD
        ;
E614 : 2F 70    "/p"    ble  LE686
        ;
E616 : 45    "E"    db  $45
        ;
E617 : 7F 02 7E    "  ~"    clr  X027E
E61A : 81 FE    "  "    cmpa  #$FE
E61C : D0 17    "  "    subb  X0017
E61E : D0 8B    "  "    subb  X008B
E620 : FE 00 F0    "   "    ldx  X00F0
E623 : BF 14 80    "   "    sts  X1480
E626 : FF 43 0B    " C "    stx  X430B
E629 : C0 FF    "  "    subb  #$FF
E62B : C0 80    "  "    subb  #$80
E62D : FF 07 78    "  x"    stx  X0778
E630 : 81 7F    "  "    cmpa  #$7F
        ;
E632 : 41    "A"    db  $41
        ;
E633 : 9F E0    "  "    sts  X00E0
E635 : 0F    " "    sei
        ;
E636 : FC    " "    db  $FC
        ;
E637 : 01    " "    nop
E638 : F8 5B 2F    " [/"    eorb  X5B2F
E63B : 80 BF    "  "    suba  #$BF
E63D : 6A 05    "j "    dec  $05,x
E63F : C0 FF    "  "    subb  #$FF
E641 : A9 00    "  "    adca  $00,x
E643 : FF AA 02    "   "    stx  XAA02
E646 : E8 BF    "  "    eorb  $BF,x
E648 : 0D    " "    sec
E649 : A1 2E    " ."    cmpa  $2E,x
        ;
E64B : 55    "U"    db  $55
        ;
E64C : 7D 05 F0    "}  "    tst  X05F0
E64F : FA 0B 42    "  B"    orab  X0B42
E652 : E8 FF    "  "    eorb  $FF,x
E654 : 01    " "    nop
E655 : 40    "@"    nega
E656 : FF 0F 01    "   "    stx  X0F01
E659 : EE DF    "  "    ldx  $DF,x
        ;
E65B : 05    " "    db  $05
        ;
E65C : 80 BF    "  "    suba  #$BF
E65E : 9B 00    "  "    adda  X0000
E660 : EB B7    "  "    addb  $B7,x
E662 : 2D 00    "- "    blt  LE664
E664        LE664:
E664 : FE 25 37    " %7"    ldx  X2537
E667 : C8 0F    "  "    eorb  #$0F
        ;
E669 : FD 00    "  "    db  $FD, $00
        ;
E66B : F4 AB 3A    "  :"    andb  XAB3A
E66E : 43    "C"    coma
E66F : 5D    "]"    tstb
E670 : F9 05 C0    "   "    adcb  X05C0
E673 : 3F    "?"    swi
        ;
E674 : 55    "U"    db  $55
        ;
E675 : 54    "T"    lsrb
        ;
E676 : 75    "u"    db  $75
        ;
E677 : F5 0A E0    "   "    bitb  X0AE0
E67A : BF 22 A4    " " "    sts  X22A4
E67D : FA 2B 05    " + "    orab  X2B05
E680 : 90 FF    "  "    suba  X00FF
        ;
E682 : 03    " "    db  $03
        ;
E683 : C8 FA    "  "    eorb  #$FA
E685 : 57    "W"    asrb
E686        LE686:
E686 : 24 40    "$@"    bcc  LE6C8
E688 : FF 0F 40    "  @"    stx  X0F40
E68B : AB FF    "  "    adda  $FF,x
E68D : 08    " "    inx
E68E : 22 FC    "" "    bhi  LE68C
E690 : 3F    "?"    swi
E691 : 80 AA    "  "    suba  #$AA
E693 : BB 1B A0    "   "    adda  X1BA0
E696 : D4 FF    "  "    andb  X00FF
E698 : 01    " "    nop
E699 : 54    "T"    lsrb
E69A : F6 4F 20    " O "    ldab  X4F20
E69D : A9 FF    "  "    adca  $FF,x
        ;
E69F : 03    " "    db  $03
        ;
E6A0 : AA 52    " R"    oraa  $52,x
E6A2 : FF 00 5B    "  ["    stx  X005B
E6A5 : F6 0B F4    "   "    ldab  X0BF4
        ;
E6A8 : 05    " "    db  $05
        ;
E6A9 : F9 03 EC    "   "    adcb  X03EC
        ;
E6AC : 15    " "    db  $15
        ;
E6AD : 3F    "?"    swi
E6AE : E0 37    " 7"    subb  $37,x
E6B0 : A0 1F    "  "    suba  $1F,x
E6B2 : 68 D6    "h "    asl  $D6,x
E6B4 : 7A 81 6E    "z n"    dec  X816E
        ;
E6B7 : 51    "Q"    db  $51
        ;
E6B8 : 5F    "_"    clrb
E6B9 : C0 17    "  "    subb  #$17
E6BB : FA 05 BB    "   "    orab  X05BB
E6BE : 40    "@"    nega
E6BF : FF 00 7D    "  }"    stx  X007D
        ;
E6C2 : 41    "A"    db  $41
        ;
E6C3 : 5F    "_"    clrb
E6C4 : 6D 01    "m "    tst  $01,x
E6C6 : F8 1F A8    "   "    eorb  X1FA8
E6C9 : A0 5F    " _"    suba  $5F,x
        ;
E6CB : 7B 02    "{ "    db  $7B, $02
        ;
E6CD : F0 3F 51    " ?Q"    subb  X3F51
        ;
E6D0 : 02    " "    db  $02
        ;
E6D1 : FE 4F 05    " O "    ldx  X4F05
E6D4 : E0 7F    "  "    subb  $7F,x
        ;
E6D6 : 51    "Q"    db  $51
        ;
E6D7 : 01    " "    nop
E6D8 : DA FF    "  "    orab  X00FF
        ;
E6DA : 02    " "    db  $02
        ;
E6DB : 50    "P"    negb
E6DC : FF 8A 2C    "  ,"    stx  X8A2C
E6DF : A0 FF    "  "    suba  $FF,x
E6E1 : 2B 00    "+ "    bmi  LE6E3
E6E3        LE6E3:
E6E3 : FE AB 0A    "   "    ldx  XAB0A
E6E6 : D0 FD    "  "    subb  X00FD
E6E8 : 07    " "    tpa
E6E9 : 48    "H"    asla
E6EA : E9 5F    " _"    adcb  $5F,x
E6EC : A2 02    "  "    sbca  $02,x
        ;
E6EE : ED    " "    db  $ED
        ;
E6EF        LE6EF:
E6EF : 3F    "?"    swi
        ;
E6F0 : 00    " "    db  $00
        ;
E6F1 : DA 5F    " _"    orab  X005F
        ;
E6F3 : 15    " "    db  $15
        ;
E6F4 : E4 9A    "  "    andb  $9A,x
E6F6 : BE 88 10    "   "    lds  X8810
E6F9 : FF 07 58    "  X"    stx  X0758
E6FC : F5 5A 09    " Z "    bitb  X5A09
        ;
E6FF : 55    "U"    db  $55
        ;
E700 : B1 FF 00    "   "    cmpa  XFF00
E703 : FA E4 1F    "   "    orab  XE41F
E706 : A0 DA    "  "    suba  $DA,x
        ;
E708 : 5B 45    "[E"    db  $5B, $45
        ;
E70A : A4 5A    " Z"    anda  $5A,x
E70C : FE 09 E0    "   "    ldx  X09E0
E70F : FF 01 F4    "   "    stx  X01F4
        ;
E712 : 03    " "    db  $03
        ;
E713 : F5 55 84    " U "    bitb  X5584
E716 : F5 2F 81    " / "    bitb  X2F81
E719 : 56    "V"    rorb
E71A : 49    "I"    rola
E71B : 3F    "?"    swi
E71C : A0 2F    " /"    suba  $2F,x
        ;
E71E : FD 12    "  "    db  $FD, $12
        ;
E720 : 4A    "J"    deca
E721 : E8 3F    " ?"    eorb  $3F,x
E723 : 40    "@"    nega
E724 : BE DD 0A    "   "    lds  XDD0A
        ;
E727 : EC 00 FD 03  "    "    db  $EC, $00, $FD, $03
        ;
E72B : D8 EB    "  "    eorb  X00EB
E72D : 2F C0    "/ "    ble  LE6EF
        ;
E72F : 15    " "    db  $15
        ;
E730 : EA 0F    "  "    orab  $0F,x
E732 : A2 AE    "  "    sbca  $AE,x
E734 : BF 01 2D    "  -"    sts  X012D
E737 : E8 AF    "  "    eorb  $AF,x
E739 : 80 3B    " ;"    suba  #$3B
E73B : FE 09 BC    "   "    ldx  X09BC
E73E : 40    "@"    nega
E73F : 7F 01 FD    "   "    clr  X01FD
E742 : 68 17    "h "    asl  $17,x
E744 : F4 09 F4    "   "    andb  X09F4
E747 : 0B    " "    sev
E748 : F4 C5 9D    "   "    andb  XC59D
E74B : B0 27 F0    " ' "    suba  X27F0
E74E : 2E E8    ". "    bgt  LE738
E750 : 07    " "    tpa
        ;
E751 : ED 45    " E"    db  $ED, $45
        ;
E753 : 17    " "    tba
E754 : E0 37    " 7"    subb  $37,x
E756 : C2 1F    "  "    sbcb  #$1F
        ;
E758 : 51    "Q"    db  $51
        ;
E759 : AF AA    "  "    sts  $AA,x
E75B : 10    " "    sba
E75C : AD 99    "  "    jsr  $99,x            ;INFO: index jump
E75E : 7F 00 FD    "   "    clr  X00FD
E761 : 2B 21    "+!"    bmi  LE784
E763 : 6A DA    "j "    dec  $DA,x
E765 : FB 02 E8    "   "    addb  X02E8
E768 : AF A4    "  "    sts  $A4,x
        ;
E76A : 02    " "    db  $02
        ;
E76B : EA FF    "  "    orab  $FF,x
E76D : 01    " "    nop
E76E : F0 BE 92    "   "    subb  XBE92
E771 : 24 51    "$Q"    bcc  LE7C4
E773 : FF 0B 50    "  P"    stx  X0B50
E776 : FB 56 22    " V""    addb  X5622
E779 : 90 FD    "  "    suba  X00FD
E77B : 0F    " "    sei
E77C : C0 DD    "  "    subb  #$DD
E77E : 37    "7"    pshb
E77F : 20 A5    "  "    bra  LE726
        ;
E781 : FA 1F 40    "  @"    orab  X1F40
E784        LE784:
E784 : D7 5F    " _"    stab  X005F
E786 : 01    " "    nop
E787 : 5A    "Z"    decb
        ;
E788 : 55    "U"    db  $55
        ;
E789 : 7F FF FF    "   "    clr  XFFFF
E78C : FF FF FF 
E78F : FF 
;*************************************;
; called by IRQ
E790 : 7E E7 A3   jmp  LE7A3          ;jump below
;****;
; called by NMI
;LE793:
E793 : 7E E7 96   jmp  LE796          ;jump (*)
;LE796:
E796 : CE 90 00    "   "    ldx  #$9000
E799 : DF 00    "  "    stx  X0000
E79B : CE E7 89    "   "    ldx  #$E789
E79E : DF 02    "  "    stx  X0002
E7A0 : 7E E7 FC    "~  "    jmp  LE7FC
;LE783
E7A3 : 84 0F    "  "    anda  #$0F
E7A5 : 48    "H"    asla
E7A6 : CE E8 43    "  C"    ldx  #$E843
E7A9        LE7A9:
E7A9 : 4D    "M"    tsta
E7AA : 27 04    "' "    beq  LE7B0
E7AC : 08    " "    inx
E7AD : 4A    "J"    deca
E7AE : 20 F9    "  "    bra  LE7A9
        ;
E7B0        LE7B0:
E7B0 : EE 00    "  "    ldx  $00,x
E7B2        LE7B2:
E7B2 : DF 05    "  "    stx  X0005
E7B4        LE7B4:
E7B4 : DE 05    "  "    ldx  X0005
E7B6 : A6 00    "  "    ldaa  $00,x
E7B8 : 2B 2A    "+*"    bmi  LE7E4
E7BA : E6 01    "  "    ldab  $01,x
E7BC : 27 14    "' "    beq  LE7D2
E7BE : A6 02    "  "    ldaa  $02,x
E7C0 : E6 03    "  "    ldab  $03,x
E7C2        LE7C2:
E7C2 : 6D 00    "m "    tst  $00,x
E7C4        LE7C4:
E7C4 : 6D 00    "m "    tst  $00,x
E7C6 : 5A    "Z"    decb
E7C7 : 26 F9    "& "    bne  LE7C2
E7C9 : 4A    "J"    deca
E7CA : 26 F6    "& "    bne  LE7C2
E7CC : 08    " "    inx
E7CD : 08    " "    inx
E7CE : 08    " "    inx
E7CF : 08    " "    inx
E7D0 : 20 E0    "  "    bra  LE7B2
        ;
E7D2        LE7D2:
E7D2 : DE 02    "  "    ldx  X0002
E7D4 : 8C 95 40    "  @"    cpx  #$9540
E7D7        LE7D7:
E7D7 : 27 FE    "' "    beq  LE7D7
E7D9 : 8C 9A 8A    "   "    cpx  #$9A8A
E7DC        LE7DC:
E7DC : 27 FE    "' "    beq  LE7DC
E7DE : 8C A0 91    "   "    cpx  #$A091
E7E1        LE7E1:
E7E1 : 27 FE    "' "    beq  LE7E1
E7E3 : 39    "9"    rts
        ;
E7E4        LE7E4:
E7E4 : 97 00    "  "    staa  $00
E7E6 : A6 01    "  "    ldaa  $01,x
E7E8 : 97 01    "  "    staa  $01
E7EA : A6 02    "  "    ldaa  $02,x
E7EC : 97 02    "  "    staa  $02
E7EE : A6 03    "  "    ldaa  $03,x
E7F0 : 97 03    "  "    staa  $03
E7F2 : 08    " "    inx
E7F3 : 08    " "    inx
E7F4 : 08    " "    inx
E7F5 : 08    " "    inx
E7F6 : DF 05    "  "    stx  X0005
E7F8 : 8D 02    "  "    bsr  LE7FC
E7FA : 20 B8    "  "    bra  LE7B4
        ;
E7FC        LE7FC:
E7FC : DE 00    "  "    ldx  X0000
E7FE : 5F    "_"    clrb
E7FF : 0D    " "    sec
E800        LE800:
E800 : 59    "Y"    rolb
E801 : 01    " "    nop
E802 : A6 00    "  "    ldaa  $00,x
E804 : 08    " "    inx
E805 : 97 04    "  "    staa  $04
E807        LE807:
E807 : 86 37    " 7"    ldaa  #$37
E809 : B7 20 01    "   "    staa  X2001
E80C : 86 34    " 4"    ldaa  #$34
E80E : D5 04    "  "    bitb  X0004
E810 : 26 15    "& "    bne  LE827
E812 : B7 20 03    "   "    staa  X2003
E815 : 01    " "    nop
E816 : 86 3F    " ?"    ldaa  #$3F
E818 : B7 20 01    "   "    staa  X2001
E81B : 58    "X"    aslb
E81C : 25 E2    "% "    bcs  LE800
E81E : 2A 1D    "* "    bpl  LE83D
E820 : A6 00    "  "    ldaa  $00,x
E822 : 9C 02    "  "    cpx  X0002
E824 : 26 E1    "& "    bne  LE807
E826 : 39    "9"    rts
        ;
E827        LE827:
E827 : 86 3C    " <"    ldaa  #$3C
E829 : B7 20 03    "   "    staa  X2003
E82C : 86 3F    " ?"    ldaa  #$3F
E82E : B7 20 01    "   "    staa  X2001
E831 : 58    "X"    aslb
E832 : 25 CC    "% "    bcs  LE800
E834 : 2A 07    "* "    bpl  LE83D
E836 : A6 00    "  "    ldaa  $00,x
E838 : 9C 02    "  "    cpx  X0002
E83A : 26 CB    "& "    bne  LE807
E83C : 39    "9"    rts
        ;
E83D        LE83D:
E83D : 01    " "    nop
E83E : 01    " "    nop
E83F : A6 00    "  "    ldaa  $00,x
E841 : 20 C4    "  "    bra  LE807
        ;
E843 : E8 63    " c"    eorb  $63,x
E845 : E8 69    " i"    eorb  $69,x
E847 : E8 6F    " o"    eorb  $6F,x
E849 : E8 75    " u"    eorb  $75,x
E84B : E8 7B    " {"    eorb  $7B,x
E84D : E8 85    "  "    eorb  $85,x
E84F : E8 8F    "  "    eorb  $8F,x
E851 : E8 9D    "  "    eorb  $9D,x
E853 : E8 A7    "  "    eorb  $A7,x
E855 : E8 B5    "  "    eorb  $B5,x
E857 : E8 CB    "  "    eorb  $CB,x
E859 : E8 E1    "  "    eorb  $E1,x
E85B : E8 F7    "  "    eorb  $F7,x
E85D : E9 09    "  "    adcb  $09,x
E85F : E9 1F    "  "    adcb  $1F,x
E861 : E9 2D    " -"    adcb  $2D,x
E863 : 90 00    "  "    suba  X0000
E865 : 95 40    " @"    bita  X0040
        ;
E867 : 00 00    "  "    db  $00, $00
        ;
E869 : 95 41    " A"    bita  X0041
E86B : 9A 8A    "  "    oraa  X008A
        ;
E86D : 00 00    "  "    db  $00, $00
        ;
E86F : 9A 8B    "  "    oraa  X008B
E871 : A0 91    "  "    suba  $91,x
        ;
E873 : 00 00    "  "    db  $00, $00
        ;
E875 : A0 92    "  "    suba  $92,x
E877 : A7 29    " )"    staa  $29,x
        ;
E879 : 00 00    "  "    db  $00, $00
        ;
E87B : B0 0B B6    "   "    suba  X0BB6
        ;
E87E : 65    "e"    db  $65
        ;
E87F : A7 2A    " *"    staa  $2A,x
E881 : B0 0A 00    "   "    suba  X0A00
        ;
E884 : 00    " "    db  $00
        ;
E885 : C1 C4    "  "    cmpb  #$C4
E887 : CA 52    " R"    orab  #$52
E889 : B6 66 BB    " f "    ldaa  X66BB
E88C : CA 00    "  "    orab  #$00
        ;
E88E : 00    " "    db  $00
        ;
E88F : CA 53    " S"    orab  #$53
E891 : D0 C2    "  "    subb  X00C2
        ;
E893 : 00    " "    db  $00
        ;
E894 : 01    " "    nop
        ;
E895 : 14 00    "  "    db  $14, $00
        ;
E897 : C1 C4    "  "    cmpb  #$C4
E899 : CA 52    " R"    orab  #$52
        ;
E89B : 00 00    "  "    db  $00, $00
        ;
E89D : C1 C4    "  "    cmpb  #$C4
E89F : CA 52    " R"    orab  #$52
E8A1 : CA 53    " S"    orab  #$53
E8A3 : D0 C2    "  "    subb  X00C2
        ;
E8A5 : 00 00    "  "    db  $00, $00
        ;
E8A7 : D0 C3    "  "    subb  X00C3
E8A9 : D7 88    "  "    stab  X0088
        ;
E8AB : 00    " "    db  $00
        ;
E8AC : 01    " "    nop
        ;
E8AD : 14 00    "  "    db  $14, $00
        ;
E8AF : C1 C4    "  "    cmpb  #$C4
E8B1 : CA 52    " R"    orab  #$52
        ;
E8B3 : 00 00    "  "    db  $00, $00
        ;
E8B5 : B6 66 BB    " f "    ldaa  X66BB
E8B8 : CA 00    "  "    orab  #$00
E8BA : 01    " "    nop
E8BB : 0C    " "    clc
        ;
E8BC : 00    " "    db  $00
        ;
E8BD : BB CB C1    "   "    adda  XCBC1
        ;
E8C0 : C3 00    "  "    db  $C3, $00
        ;
E8C2 : 01    " "    nop
E8C3 : 0C    " "    clc
        ;
E8C4 : 00    " "    db  $00
        ;
E8C5 : 90 00    "  "    suba  X0000
E8C7 : 95 3F    " ?"    bita  X003F
        ;
E8C9 : 00 00    "  "    db  $00, $00
        ;
E8CB : B6 66 BB    " f "    ldaa  X66BB
E8CE : CA 00    "  "    orab  #$00
E8D0 : 01    " "    nop
E8D1 : 0C    " "    clc
        ;
E8D2 : 00    " "    db  $00
        ;
E8D3 : BB CB C1    "   "    adda  XCBC1
        ;
E8D6 : C3 00    "  "    db  $C3, $00
        ;
E8D8 : 01    " "    nop
E8D9 : 0C    " "    clc
        ;
E8DA : 00    " "    db  $00
        ;
E8DB : 95 41    " A"    bita  X0041
E8DD : 9A 89    "  "    oraa  X0089
        ;
E8DF : 00 00    "  "    db  $00, $00
        ;
E8E1 : B6 66 BB    " f "    ldaa  X66BB
E8E4 : CA 00    "  "    orab  #$00
E8E6 : 01    " "    nop
E8E7 : 0C    " "    clc
        ;
E8E8 : 00    " "    db  $00
        ;
E8E9 : BB CB C1    "   "    adda  XCBC1
        ;
E8EC : C3 00    "  "    db  $C3, $00
        ;
E8EE : 01    " "    nop
E8EF : 0C    " "    clc
        ;
E8F0 : 00    " "    db  $00
        ;
E8F1 : 9A 8B    "  "    oraa  X008B
E8F3 : A0 90    "  "    suba  $90,x
        ;
E8F5 : 00    " "    db  $00
E8F6        XE8F6:
E8F6 : 00    " "    db  $00
        ;
E8F7 : B6 66 BB    " f "    ldaa  X66BB
E8FA : CA 00    "  "    orab  #$00
E8FC : 01    " "    nop
E8FD : 0C    " "    clc
        ;
E8FE : 00    " "    db  $00
        ;
E8FF : BB CB C1    "   "    adda  XCBC1
        ;
E902 : C3    " "    db  $C3
        ;
E903 : A0 D0    "  "    suba  $D0,x
E905 : A7 29    " )"    staa  $29,x
        ;
E907 : 00 00    "  "    db  $00, $00
        ;
E909 : B6 66 BB    " f "    ldaa  X66BB
E90C : CA 00    "  "    orab  #$00
E90E : 01    " "    nop
E90F        LE90F:
E90F : 0A    " "    clv
        ;
E910 : 00    " "    db  $00
        ;
E911 : A0 E0    "  "    suba  $E0,x
E913 : A7 29    " )"    staa  $29,x
        ;
E915 : 00    " "    db  $00
        ;
E916 : 01    " "    nop
E917 : 0A    " "    clv
        ;
E918 : 00    " "    db  $00
        ;
E919 : A7 2A    " *"    staa  $2A,x
E91B : B0 0A 00    "   "    suba  X0A00
        ;
E91E : 00    " "    db  $00
        ;
E91F : BB CB C1    "   "    adda  XCBC1
        ;
E922 : C3 00    "  "    db  $C3, $00
        ;
E924 : 01    " "    nop
E925 : 10    " "    sba
        ;
E926 : 00    " "    db  $00
        ;
E927 : B0 0B B6    "   "    suba  X0BB6
        ;
E92A : 65 00 00    "e  "    db  $65, $00, $00
        ;
E92D : D7 8A    "  "    stab  X008A
E92F : E7 89    "  "    stab  $89,x
        ;
E931 : 00 00    "  "    db  $00, $00
        ;
E933 : FF FF FF 
E936 : FF FF FF 
E939 : FF FF FF 
E93C : FF FF FF 
E93F : 96 
;*************************************;
; store SP and X reg
;*************************************;
;STRSPX
E940 : 9F 60      sts  $60            ;store stack pointer in addr 60
E942 : CE 20 00   ldx  #$2000         ;load X with 2000h PIA
E945 : 7E E9 58   jmp  LE958          ;jump SETUP1
;*************************************;
;zero padding
E948 : FF FF FF FF FF FF FF FF 
;*************************************;
;
E950 : A6                             ;checksum byte
;*************************************;
;RESET power on
;*************************************;
;SETUP
E951 : 0F         sei                 ;set interrupt mask   
E952 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
E955 : 7E E9 40   jmp  LE940          ;jump STRSPX
;SETUP1
E958 : 6F 01      clr  $01,x          ;clear addr X+01h (2001 PIA1 CR port A)
E95A : 6F 03      clr  $03,x          ;clear addr X+03h (2003 PIA1 CR port B)
E95C : 86 FF      ldaa  #$FF          ;load A with FFh
E95E : A7 02      staa  $02,x         ;store A in addr X+02h (2002 PIA1 PR/DDR port B out)
E960 : 6F 00      clr  $00,x          ;clear addr X+00h (2000 PIA1 PR/DDR port A in)
E962 : 86 37      ldaa  #$37          ;load A with 37h (CA2 low, IRQ allowed)
E964 : A7 01      staa  $01,x         ;store A in addr X+01h (2001 PIA1 CR port A)
E966 : 86 3C      ldaa  #$3C          ;load A with 3Ch (CB2 set init high, no IRQs)
E968 : A7 03      staa  $03,x         ;store A in addr X + 03h (2003 PIA1 CR port B)
E96A : 6F 00      clr  $00,x          ;clear addr X+00h (2000 PIA1 PR/DDR port A in)
E96C : 7F 00 63   clr  $0063          ;clear addr 0063
E96F : 7F 00 64   clr  $0064          ;clear addr 0064
E972 : 7F 00 62   clr  $0062          ;clear addr 0062
E975 : 7F 00 66   clr  $0066          ;clear addr 0066
E978 : 86 6C      ldaa  #$6C          ;load A with 6Ch
E97A : 97 08      staa  $08           ;store A in addr 08
E97C : 86 E6      ldaa  #$E6          ;load A with E6h
E97E : 97 09      staa  $09           ;store A in addr 09
E980 : 0E         cli                 ;clear interrupts I=0
;STDBY LE981:
E981 : 20 FE      bra  LE981          ;branch always STDBY (*-2)
;*************************************;
; reset located rts
;*************************************;
;RESRTS LE983:
E983 : 39         rts                 ;return subroutine
;*************************************;
; clear and pre-irq jump
;*************************************;
;PREJMP LE984:
E984 : 7F 00 62   clr  $0062          ;clear addr 0062
E987 : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; synth
;*************************************;
;LE98A:
E98A : CE 00 00   ldx  #$0000         ;load X with 0000h
E98D : 86 FF      ldaa  #$FF          ;load A with FFh
;LE98F:
E98F : A7 00      staa  $00,x         ;store A in addr X+00h
E991 : 08         inx                 ;incr X
E992 : 8C 00 07   cpx  #$0007         ;compare X with 0007h
E995 : 26 F8      bne  LE98F          ;branch Z=0
E997 : 7F 00 54   clr  $0054          ;clear addr 0054
E99A : 86 A5      ldaa  #$A5          ;load A with A5h
E99C : C6 5A      ldab  #$5A          ;load B with 5Ah
E99E : 97 56      staa  $56           ;store A in addr 56
E9A0 : D7 57      stab  $57           ;store B in addr 57
E9A2 : 86 C6      ldaa  #$C6          ;load A with C6h
E9A4 : 97 58      staa  $58           ;store A in addr 58
E9A6 : 97 59      staa  $59           ;store A in addr 59
;LE9A8:
E9A8 : 96 54      ldaa  $54           ;load A with addr 54
E9AA : D6 55      ldab  $55           ;load B with addr 55
E9AC : 53         comb                ;complement 1s B
E9AD : C5 09      bitb  #$09          ;bit test B with 09h
E9AF : 26 05      bne  LE9B6          ;branch Z=0
E9B1 : 53         comb                ;complement 1s B
;LE9B2:
E9B2 : 46         rora                ;rotate right A
E9B3 : 56         rorb                ;rotate right B
E9B4 : 20 09      bra  LE9BF          ;branch always
;
;LE9B6:
E9B6 : 53         comb                ;complement 1s B
E9B7 : C5 09      bitb  #$09          ;bit test B with 09h
E9B9 : 26 02      bne  LE9BD          ;branch Z=0
E9BB : 27 F5      beq  LE9B2          ;branch Z=1
;LE9BD:
E9BD : 44         lsra                ;logic shift right A
E9BE : 56         rorb                ;rotate right B
;LE9BF:
E9BF : 97 54      staa  $54           ;store A in addr 54
E9C1 : D7 55      stab  $55           ;store B in addr 55
E9C3 : A7 00      staa  $00,x         ;store A in addr X+00h
E9C5 : 08         inx                 ;incr X
E9C6 : 8C 00 3F   cpx  #$003F         ;compare X wtih 003Fh
E9C9 : 26 DD      bne  LE9A8          ;branch Z=0
;LE9CB:
E9CB : BD F1 63   jsr  LF163          ;jump sub
E9CE : CE 00 00   ldx  #$0000         ;load X with 0000h
;LE9D1:
E9D1 : 96 40      ldaa  $40           ;load A with addr 40
;LE9D3:
E9D3 : 4A         deca                ;decr A
E9D4 : 26 FD      bne  LE9D3          ;branch Z=0
E9D6 : A6 01      ldaa  $01,x         ;load A in addr X+01h
E9D8 : D6 59      ldab  $59           ;load B with addr 59
E9DA : 58         aslb                ;arith shift left B
E9DB : 24 02      bcc  LE9DF          ;branch C=0
E9DD : D8 58      eorb  $58           ;exclusive or B with addr 58
;LE9DF:
E9DF : D7 59      stab  $59           ;store B in addr 59
E9E1 : D4 4D      andb  $4D           ;and B with addr 4D
E9E3 : 26 05      bne  LE9EA          ;branch Z=0
E9E5 : AB 00      adda  $00,x         ;add A with addr X+00h
E9E7 : 44         lsra                ;logic shift right A
E9E8 : A7 00      staa  $00,x         ;store A in addr X+00h
;LE9EA:
E9EA : D6 59      ldab  $59           ;load B with addr 59
E9EC : 58         aslb                ;arith shift left B
E9ED : 24 02      bcc  LE9F1          ;branch C=0
E9EF : D8 58      eorb  $58           ;exclusive or B with addr 58
;LE9F1:
E9F1 : D7 59      stab  $59           ;store B in addr 59
E9F3 : D4 4C      andb  $4C           ;and B with addr 4C
E9F5 : 27 03      beq  LE9FA          ;branch Z=1
E9F7 : 40         nega                ;negate A
E9F8 : A7 00      staa  $00,x         ;store A in addr X+00h
;LE9FA:
E9FA : B6 20 02   ldaa  $2002         ;load A with DAC
E9FD : 16         tab                 ;transfer A to B
E9FE : 54         lsrb                ;logic shift right B
E9FF : 54         lsrb                ;logic shift right B
EA00 : 54         lsrb                ;logic shift right B
;LEA01:
EA01 : 10         sba                 ;sub B from A
EA02 : 7A 00 43   dec  $0043          ;decr addr 0043
EA05 : 26 FA      bne  LEA01          ;branch Z=0
EA07 : E6 00      ldab  $00,x         ;load B in addr X+00h
EA09 : 54         lsrb                ;logic shift right B
EA0A : 1B         aba                 ;add B to A
EA0B : 84 FC      anda  #$FC          ;and A with FCh
EA0D : D6 42      ldab  $42           ;load B with addr 42
EA0F : D7 43      stab  $43           ;store B in addr 43
EA11 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
EA14 : 08         inx                 ;incr X
EA15 : 8C 00 3F   cpx  #$003F
EA18 : 26 B7      bne  LE9D1          ;branch Z=0
EA1A : A6 00      ldaa  $00,x         ;load A in addr X+00h
EA1C : CE 00 00   ldx  #$0000         ;load X with 0000h
EA1F : D6 59      ldab  $59           ;load B with addr 59
EA21 : 58         aslb                ;arith shift left B
EA22 : 24 02      bcc  LEA26          ;branch C=0
EA24 : D8 58      eorb  $58           ;exclusive or B with addr 58
;LEA26:
EA26 : D7 59      stab  $59           ;store B in addr 59
EA28 : D4 4D      andb  $4D           ;and B with addr 4D
EA2A : 26 05      bne  LEA31          ;branch Z=0
EA2C : AB 00      adda  $00,x         ;add A wth addr X+00h
EA2E : 44         lsra                ;logic shift right A
EA2F : A7 3F      staa  $3F,x         ;store A in addr X+3Fh
;LEA31:
EA31 : D6 59      ldab  $59           ;load B with addr 59
EA33 : 58         aslb                ;arith shift left B
EA34 : 24 02      bcc  LEA38          ;branch C=0
EA36 : D8 58      eorb  $58           ;exclusive or B with addr 58
;LEA38:
EA38 : D7 59      stab  $59           ;store B in addr 59
EA3A : D4 4C      andb  $4C           ;and B with addr 4C
EA3C : 27 01      beq  LEA3F          ;branch Z=1
EA3E : 40         nega                ;negate A
;LEA3F:
EA3F : B7 20 02   staa  $2002         ;store A in DAC output SOUND
EA42 : BD F0 F2   jsr  LF0F2          ;jump sub
EA45 : 27 84      beq  LE9CB          ;branch Z=1
EA47 : 2B 03      bmi  LEA4C          ;branch Z=1
EA49 : 7E E9 8A   jmp  LE98A          ;jump 
;LEA4C:
EA4C : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
;GWAVE Loader 
;*************************************;
;GWLD:
EA4F : 16         tab                 ;transfer A to B
EA50 : 58         aslb
EA51 : 1B         aba
EA52 : 1B         aba
EA53 : 1B         aba
EA54 : CE F7 A5   ldx  #$F7A5         ;(SVTAB)(SOUND VECTOR TABLE)
EA57 : BD F0 4E    "  N"    jsr  LF04E          ;jump sub ADDX
EA5A : A6 00    "  "    ldaa  $00,x
EA5C : 16    " "    tab                 ;transfer A to B
EA5D : 84 0F    "  "    anda  #$0F
EA5F : 97 02    "  "    staa  $02
EA61 : 54    "T"    lsrb
EA62 : 54    "T"    lsrb
EA63 : 54    "T"    lsrb
EA64 : 54    "T"    lsrb
EA65 : D7 01    "  "    stab  X0001
EA67 : A6 01    "  "    ldaa  $01,x
EA69 : 16    " "    tab
EA6A : 54    "T"    lsrb
EA6B : 54    "T"    lsrb
EA6C : 54    "T"    lsrb
EA6D : 54    "T"    lsrb
EA6E : D7 03    "  "    stab  X0003
EA70 : 84 0F    "  "    anda  #$0F
EA72 : 97 6C    " l"    staa  $6C
EA74 : DF 6A      stx  $6A            ;store X in addr 6A (TEMPX)
EA76 : CE F7 2E   ldx  #$F72E         ;(GWVTAB)(CALC WAVEFORM ADDR)
;GWLD2:
EA79 : 7A 00 6C   dec  $006C          ;dec addr 006C (TEMPA)
EA7C : 2B 08    "+ "    bmi  LEA86
EA7E : A6 00    "  "    ldaa  $00,x
EA80 : 4C    "L"    inca
EA81 : BD F0 4E    "  N"    jsr  LF04E          ;jump sub ADDX
EA84 : 20 F3    "  "    bra  LEA79
;GWLD3
EA86 : DF 06    "  "    stx  X0006
EA88 : BD EB 3F    "  ?"    jsr  LEB3F   ;WVTRAN
EA8B : DE 6A    " j"    ldx  X006A
EA8D : A6 02    "  "    ldaa  $02,x
EA8F : 97 08    "  "    staa  $08
EA91 : BD EB 51    "  Q"    jsr  LEB51   ;WVDECA
EA94 : DE 6A    " j"    ldx  X006A
EA96 : A6 03    "  "    ldaa  $03,x
EA98 : 97 04    "  "    staa  $04
EA9A : A6 04    "  "    ldaa  $04,x
EA9C : 97 05    "  "    staa  $05
EA9E : A6 05    "  "    ldaa  $05,x
EAA0 : 16    " "    tab
EAA1 : A6 06    "  "    ldaa  $06,x
EAA3 : CE F7 BA   ldx  #$F7BA   ;(#GFRTAB)
EAA6 : BD F0 4E   jsr  LF04E          ;jump sub ADDX
EAA9 : 17         tba
EAAA : DF 09    "  "    stx  X0009
EAAC : 7F 00 11    "   "    clr  X0011
EAAF : BD F0 4E   jsr  LF04E          ;jump sub ADDX
EAB2 : DF 0B    "  "    stx  X000B
EAB4 : 39         rts
;*************************************;
;GWAVE routine 
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
EAB5 : 96 01    "  "    ldaa  $01
EAB7 : 97 10    "  "    staa  $10
EAB9        LEAB9:
EAB9 : DE 09    "  "    ldx  X0009
EABB        XEABB:
EABB : DF 68    " h"    stx  X0068
EABD        LEABD:
EABD : DE 68    " h"    ldx  X0068
EABF        XEABF:
EABF : A6 00    "  "    ldaa  $00,x
EAC1 : 9B 11    "  "    adda  X0011
EAC3 : 97 0F    "  "    staa  $0F
EAC5 : 9C 0B    "  "    cpx  X000B
EAC7 : 27 26    "'&"    beq  LEAEF
EAC9 : D6 02    "  "    ldab  X0002
EACB : 08    " "    inx
EACC : DF 68    " h"    stx  X0068
EACE        LEACE:
EACE : CE 00 12    "   "    ldx  #$0012
EAD1        LEAD1:
EAD1 : 96 0F    "  "    ldaa  $0F
EAD3        LEAD3:
EAD3 : 4A    "J"    deca
EAD4 : 26 FD    "& "    bne  LEAD3
EAD6 : A6 00    "  "    ldaa  $00,x
EAD8 : B7 20 02    "   "    staa  X2002
EADB : 08    " "    inx
EADC : 9C 0D    "  "    cpx  X000D
EADE : 26 F1    "& "    bne  LEAD1
EAE0 : 5A    "Z"    decb
EAE1 : 27 DA    "' "    beq  LEABD
EAE3 : 08    " "    inx
EAE4 : 09    " "    dex
EAE5 : 08    " "    inx
EAE6 : 09    " "    dex
EAE7 : 08    " "    inx
EAE8 : 09    " "    dex
EAE9 : 08    " "    inx
EAEA : 09    " "    dex
EAEB : 01    " "    nop
EAEC : 01    " "    nop
EAED : 20 DF    "  "    bra  LEACE
        ;
EAEF        LEAEF:
EAEF : 96 03    "  "    ldaa  $03
EAF1 : 8D 5E    " ^"    bsr  LEB51
EAF3 : 7A 00 10    "z  "    dec  X0010
EAF6 : 26 C1    "& "    bne  LEAB9
EAF8 : 96 04    "  "    ldaa  $04
EAFA : 27 42    "'B"    beq  LEB3E
EAFC : 7A 00 05    "z  "    dec  X0005
EAFF : 27 3D    "'="    beq  LEB3E
EB01 : 9B 11    "  "    adda  X0011
EB03 : 97 11    "  "    staa  $11
EB05 : DE 09    "  "    ldx  X0009
EB07 : 5F    "_"    clrb
EB08        LEB08:
EB08 : 96 11    "  "    ldaa  $11
EB0A : 7D 00 04    "}  "    tst  X0004
EB0D : 2B 06    "+ "    bmi  LEB15
EB0F : AB 00    "  "    adda  $00,x
EB11 : 25 08    "% "    bcs  LEB1B
EB13 : 20 0B    "  "    bra  LEB20
        ;
EB15        LEB15:
EB15 : AB 00    "  "    adda  $00,x
EB17 : 27 02    "' "    beq  LEB1B
EB19 : 25 05    "% "    bcs  LEB20
EB1B        LEB1B:
EB1B : 5D    "]"    tstb
EB1C : 27 08    "' "    beq  LEB26
EB1E : 20 0F    "  "    bra  LEB2F
        ;
EB20        LEB20:
EB20 : 5D    "]"    tstb
EB21 : 26 03    "& "    bne  LEB26
EB23 : DF 09    "  "    stx  X0009
EB25 : 5C    "\"    incb
EB26        LEB26:
EB26 : 08    " "    inx
EB27 : 9C 0B    "  "    cpx  X000B
EB29 : 26 DD    "& "    bne  LEB08
EB2B : 5D    "]"    tstb
EB2C : 26 01    "& "    bne  LEB2F
EB2E : 39    "9"    rts
        ;
EB2F        LEB2F:
EB2F : DF 0B    "  "    stx  X000B
EB31 : 96 03    "  "    ldaa  $03
EB33 : 27 06    "' "    beq  LEB3B
EB35 : 8D 08    "  "    bsr  LEB3F
EB37 : 96 08    "  "    ldaa  $08
EB39 : 8D 16    "  "    bsr  LEB51
EB3B        LEB3B:
EB3B : 7E EA B5    "~  "    jmp  LEAB5
EB3E        LEB3E:
EB3E : 39    "9"    rts
;*************************************;
;Wave Transfer Routine 
;*************************************;
;WVTRAN
EB3F : CE 00 12    "   "    ldx  #$0012
EB42 : DF 6E    " n"    stx  X006E
EB44 : DE 06    "  "    ldx  X0006
EB46 : E6 00    "  "    ldab  $00,x
EB48 : 08    " "    inx
EB49 : BD EB 80   jsr  LEB80          ;jump sub TRANS
EB4C : DE 6E    " n"    ldx  X006E
EB4E : DF 0D    "  "    stx  X000D
EB50 : 39    "9"    rts
;*************************************;
;Wave Decay Routinue 
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
EB51 : 4D    "M"    tsta
EB52 : 27 2B    "'+"    beq  LEB7F
EB54 : DE 06    "  "    ldx  X0006
EB56 : DF 68    " h"    stx  X0068
EB58 : CE 00 12    "   "    ldx  #$0012
EB5B : 97 6D    " m"    staa  $6D
EB5D        LEB5D:
EB5D : DF 6E    " n"    stx  X006E
EB5F : DE 68    " h"    ldx  X0068
EB61 : D6 6D    " m"    ldab  X006D
EB63 : D7 6C    " l"    stab  X006C
EB65 : E6 01    "  "    ldab  $01,x
EB67 : 54    "T"    lsrb
EB68 : 54    "T"    lsrb
EB69 : 54    "T"    lsrb
EB6A : 54    "T"    lsrb
EB6B : 08    " "    inx
EB6C : DF 68    " h"    stx  X0068
EB6E : DE 6E    " n"    ldx  X006E
EB70 : A6 00    "  "    ldaa  $00,x
EB72        LEB72:
EB72 : 10    " "    sba
EB73 : 7A 00 6C    "z l"    dec  X006C
EB76 : 26 FA    "& "    bne  LEB72
EB78 : A7 00    "  "    staa  $00,x
EB7A : 08    " "    inx
EB7B : 9C 0D    "  "    cpx  X000D
EB7D : 26 DE    "& "    bne  LEB5D
EB7F        LEB7F:
EB7F : 39    "9"    rts
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
EB80 : 36         psha
;LEB81:
EB81 : A6 00      ldaa  $00,x
EB83 : DF 68      stx  $68
EB85 : DE 6E      ldx  $6E
EB87 : A7 00      staa  $00,x
EB89 : 08         inx
EB8A : DF 6E      stx  $6E
EB8C : DE 68      ldx  $68
EB8E : 08         inx
EB8F : 5A         decb
EB90 : 26 EF      bne  LEB81
EB92 : 32         pula
EB93 : 39         rts
;*************************************;
; fnoise loader #1 table
;*************************************;
;FN1TBL 
EB94 : EB A4                          ;
EB96 : EB AF                          ;
EB98 : EB C2                          ;
EB9A : EB C6                          ;
EB9C : EB CA                          ;
;*************************************;
EB9E : 01 01 01 FF 03 E8              ;
;****;
;LEBA4
EBA4 : CE EB 9E   ldx  #$EB9E         ;load X with EB9Eh (table)
EBA7 : 20 09      bra  LEBB2          ;branch always FNLDR1
;
EBA9 : 01 01 01 40 10 00              ;
;****;
; param loader for fnoise #1
;****;
;LEBAF 
EBAF : CE EB A9   ldx  #$EBA9         ;load X with EBA9h (table)
;FNLDR1 LEBB2:
EBB2 : A6 00      ldaa  $00,x         ;load A with X+00h
EBB4 : 97 06      staa  $06           ;store A in addr 06
EBB6 : A6 01      ldaa  $01,x         ;load A with X+01h
EBB8 : 97 07      staa  $07           ;store A in addr 07
EBBA : A6 02      ldaa  $02,x         ;load A with X+02h
EBBC : E6 03      ldab  $03,x         ;load B with X+03h
EBBE : EE 04      ldx  $04,x          ;load X with X+04h
EBC0 : 20 0F      bra  LEBD1          ;branch always FNOISE
;****;
;FN1LB2 LEBC2
EBC2 : C6 02      ldab  #$02          ;load B with 02h
EBC4 : 20 06      bra  LEBCC          ;branch always FN1CLR
;****;
;FN1LB3 LEBC6
EBC6 : C6 03      ldab  #$03          ;load B with 03h
EBC8 : 20 02      bra  LEBCC          ;branch always FN1CLR
;****;
;FN1LB4 LEBCA
EBCA : C6 04      ldab  #$04          ;load B with 04h
;FN1CLR LEBCC:
EBCC : 4F         clra                ;clear A
EBCD : 97 07      staa  $07           ;store A in addr 07
EBCF : 97 06      staa  $06           ;store A in addr 07
;*************************************;
;Filtered Noise Routine #1
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
EBD1 : 97 05      staa  $05           ;store A in addr 05 (FDFLG)
EBD3 : D7 00      stab  $00           ;store B in addr 00 (FMAX)
EBD5 : DF 03      stx  $03            ;store X in addr 03 (SAMPC)
EBD7 : 7F 00 02   clr  $0002          ;clear addr 0002 (FLO)
;LEBDA:
EBDA : DE 03      ldx  $03
EBDC : B6 20 02   ldaa  $2002
;LEBDF:
EBDF : 16         tab
EBE0 : 54         lsrb
EBE1 : 54         lsrb
EBE2 : 54         lsrb
EBE3 : D8 61      eorb  $61
EBE5 : 54         lsrb
EBE6 : 76 00 60   ror  $0060         ;rotate right addr 0060 (HI)
EBE9 : 76 00 61   ror  $0061         ;rotate right addr 0061 (LO)
EBEC : D6 00    "  "    ldab  X0000
EBEE : 7D 00 06    "}  "    tst  X0006
EBF1 : 27 04    "' "    beq  LEBF7
EBF3 : D4 60    " `"    andb  X0060
EBF5 : DB 07    "  "    addb  X0007
EBF7        LEBF7:
EBF7 : D7 01    "  "    stab  X0001
EBF9 : D6 02    "  "    ldab  X0002
EBFB : 91 61    " a"    cmpa  X0061
EBFD : 22 12    "" "    bhi  LEC11
EBFF        LEBFF:
EBFF        XEBFF:
EBFF : 09    " "    dex
EC00 : 27 26    "'&"    beq  LEC28
EC02 : B7 20 02    "   "    staa  X2002
EC05 : DB 02    "  "    addb  X0002
EC07 : 99 01    "  "    adca  X0001
EC09 : 25 16    "% "    bcs  LEC21
EC0B : 91 61    " a"    cmpa  X0061
EC0D : 23 F0    "# "    bls  LEBFF
EC0F : 20 10    "  "    bra  LEC21
        ;
EC11        LEC11:
EC11 : 09    " "    dex
EC12 : 27 14    "' "    beq  LEC28
EC14 : B7 20 02    "   "    staa  X2002
EC17 : D0 02    "  "    subb  X0002
EC19 : 92 01    "  "    sbca  X0001
EC1B : 25 04    "% "    bcs  LEC21
EC1D : 91 61    " a"    cmpa  X0061
EC1F : 22 F0    "" "    bhi  LEC11
EC21        LEC21:
EC21 : 96 61    " a"    ldaa  $61
EC23 : B7 20 02    "   "    staa  X2002
EC26 : 20 B7    "  "    bra  LEBDF
        ;
EC28        LEC28:
EC28 : D6 05    "  "    ldab  X0005
EC2A : 27 B3    "' "    beq  LEBDF
EC2C : 96 00    "  "    ldaa  $00
EC2E : D6 02    "  "    ldab  X0002
EC30 : 44    "D"    lsra
EC31 : 56    "V"    rorb
EC32 : 44    "D"    lsra
EC33 : 56    "V"    rorb
EC34 : 44    "D"    lsra
EC35 : 56    "V"    rorb
EC36 : 43    "C"    coma
EC37 : 50    "P"    negb
EC38 : 82 FF    "  "    sbca  #$FF
EC3A : DB 02    "  "    addb  X0002
EC3C : 99 00    "  "    adca  X0000
EC3E : D7 02    "  "    stab  X0002
EC40 : 97 00    "  "    staa  $00
EC42 : 26 96    "& "    bne  LEBDA
EC44 : C1 07    "  "    cmpb  #$07
EC46 : 26 92    "& "    bne  LEBDA
EC48 : 39    "9"    rts
;*************************************;
; Liten calling routine
;*************************************;
;LTNCL1
EC49 : CE EC 62   ldx  #$EC62         ;load X with ECF2h (LTNTB1)
EC4C : 20 31      bra  LEC7F          ;branch always LITEN
;LTNCL2
EC4E : CE EC 65   ldx  #$EC65         ;load X with EC65h (LTNTB2)
EC51 : 20 2C      bra  LEC7F          ;branch always LITEN
;LTNCL3
EC53 : CE EC 68   ldx  #$EC68         ;load X with EC68h (LTNTB3)
EC56 : 20 27      bra  LEC7F          ;branch always LITEN
;LTNCL4
EC58 : CE EC 6B   ldx  #$EC6B         ;load X with EC6Bh (LTNTB4)
EC5B : 20 22      bra  LEC7F          ;branch always LITEN
;LTNCL5
EC5D : CE EC 6E   ldx  #$EC6E         ;load X with EC6Eh (LTNTB5)
EC60 : 20 1D      bra  LEC7F          ;branch always LITEN
;*************************************;
; liten tables
;*************************************;
EC62 : 01 03 20                       ;LTNTB1
;
EC65 : 01 03 30                       ;LTNTB2
;
EC68 : 01 03 40                       ;LTNTB3
;
EC6B : 01 03 50                       ;LTNTB4
;
EC6E : 01 03 60                       ;LTNTB5
;****;
EC71 : FF FF 60                       ;LTNTB6 ?
;****;
;LTNCL6
EC74 : CE EC 74   ldx  #$EC74         ;load X with EC74h (LTNTB6)
EC77 : 20 06      bra  LEC7F          ;branch always LITEN
;
EC79 : 01 00 01                       ;LTNTB7
;****;
;LTNCL7
EC7C : CE EC 79   ldx  #$EC79         ;load X with EC79h  (LTNTB7)
;*************************************;
;Lightning+Appear Noise Routine 
;*************************************;
;LITEN:
EC7F : A6 00    "  "    ldaa  $00,x
EC81 : 97 0D    "  "    staa  $0D
EC83 : E6 01    "  "    ldab  $01,x
EC85 : A6 02    "  "    ldaa  $02,x
EC87 : 97 0B    "  "    staa  $0B
EC89 : 86 FF    "  "    ldaa  #$FF
EC8B : B7 20 02    "   "    staa  X2002
EC8E : D7 0C    "  "    stab  X000C
EC90        LEC90:
EC90 : D6 0C    "  "    ldab  X000C
EC92        LEC92:
EC92 : 96 61    " a"    ldaa  $61
EC94 : 44    "D"    lsra
EC95 : 44    "D"    lsra
EC96 : 44    "D"    lsra
EC97 : 98 61    " a"    eora  X0061
EC99 : 44    "D"    lsra
EC9A : 76 00 60    "v `"    ror  X0060
EC9D : 76 00 61    "v a"    ror  X0061
ECA0 : 24 03    "$ "    bcc  LECA5
ECA2 : 73 20 02    "s  "    com  X2002
ECA5        LECA5:
ECA5 : 96 0B    "  "    ldaa  $0B
ECA7        LECA7:
ECA7 : 4A    "J"    deca
ECA8 : 26 FD    "& "    bne  LECA7
ECAA : 5A    "Z"    decb
ECAB : 26 E5    "& "    bne  LEC92
ECAD : 96 0B    "  "    ldaa  $0B
ECAF : 9B 0D    "  "    adda  X000D
ECB1 : 97 0B    "  "    staa  $0B
ECB3 : 26 DB    "& "    bne  LEC90
ECB5 : 39    "9"    rts
;*************************************;
;Vari Loader (only one vector)
;*************************************;
;VARILD
ECB6 : 16         tab
ECB7 : 48         asla
ECB8 : 48         asla
ECB9 : 48         asla
ECBA : 1B         aba
ECBB : 58         aslb
ECBC : 1B         aba
ECBD : CE 00 00   ldx  #$0000         ;load X with value 0000h (#LOCRAM)
ECC0 : DF 6E      stx  $6E            ;store X in addr 6E (XPTR)(SET XSFER)
ECC2 : CE F8 1A   ldx  #$F81A         ;load X with value F81Ah (VVECT)
ECC5 : BD F0 4E   jsr  LF04E          ;jump sub ADDX
ECC8 : C6 0B      ldab  #$0B          ;load B with value 0Bh (COUNT)( #11 !! )
ECCA : 7E EB 80   jmp  LEB80          ;jump TRANS
;*************************************;
;Variable Duty Cycle Square Wave Routine 
;*************************************;
;VARI
ECCD : 96 08      ldaa  $08           ;load A with addr 08 (VAMP)
ECCF : B7 20 02    "   "    staa  X2002
ECD2 : D6 0A    "  "    ldab  X000A
ECD4 : D7 0E    "  "    stab  X000E
ECD6        LECD6:
ECD6 : 96 00    "  "    ldaa  $00
ECD8 : 97 0B    "  "    staa  $0B
ECDA : 96 01    "  "    ldaa  $01
ECDC : 97 0C    "  "    staa  $0C
ECDE        LECDE:
ECDE : DE 05    "  "    ldx  X0005
ECE0        LECE0:
ECE0 : 96 0B    "  "    ldaa  $0B
ECE2 : 73 20 02    "s  "    com  X2002
ECE5        LECE5:
ECE5 : 09    " "    dex
ECE6 : 27 10    "' "    beq  LECF8
ECE8 : 4A    "J"    deca
ECE9 : 26 FA    "& "    bne  LECE5
ECEB : 73 20 02    "s  "    com  X2002
ECEE : 96 0C    "  "    ldaa  $0C
ECF0        LECF0:
ECF0 : 09    " "    dex
ECF1 : 27 05    "' "    beq  LECF8
ECF3 : 4A    "J"    deca
ECF4 : 26 FA    "& "    bne  LECF0
ECF6        XECF6:
ECF6 : 20 E8    "  "    bra  LECE0
;VSWEEP:
ECF8 : B6 20 02    "   "    ldaa  X2002
ECFB : 2B 01    "+ "    bmi  LECFE
ECFD : 43    "C"    coma
;VS1:
ECFE : 8B 00    "  "    adda  #$00
ED00 : B7 20 02    "   "    staa  X2002
ED03 : 96 0B    "  "    ldaa  $0B
ED05 : 9B 02    "  "    adda  X0002
ED07 : 97 0B    "  "    staa  $0B
ED09 : 96 0C    "  "    ldaa  $0C
ED0B : 9B 03    "  "    adda  X0003
ED0D : 97 0C    "  "    staa  $0C
ED0F : 7A 00 0E    "z  "    dec  X000E
ED12 : 26 09    "& "    bne  LED1D
ED14 : D6 0A    "  "    ldab  X000A
ED16 : D7 0E    "  "    stab  X000E
ED18 : 7A 00 09    "z  "    dec  X0009
ED1B : 27 0E    "' "    beq  LED2B
ED1D        LED1D:
ED1D : 91 04    "  "    cmpa  X0004
ED1F : 26 BD    "& "    bne  LECDE
ED21 : 96 07    "  "    ldaa  $07
ED23 : 27 06    "' "    beq  LED2B
ED25 : 9B 00    "  "    adda  X0000
ED27 : 97 00    "  "    staa  $00
ED29 : 26 AB    "& "    bne  LECD6
;VARX:
ED2B : 39    "9"    rts
;*************************************;
;
;*************************************;
;LED2C:
ED2C : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; synth
;*************************************;
;LED2F:
ED2F : 96 10      ldaa  $10           ;load A with addr 10
ED31 : 97 15      staa  $15           ;store A in addr 15
ED33 : 97 17      staa  $17           ;store A in addr 17
ED35 : 97 18      staa  $18           ;store A in addr 18
ED37 : 96 11      ldaa  $11           ;load A with addr 11
ED39 : 97 16      staa  $16           ;store A in addr 16
ED3B : 7F 20 02   clr  $2002          ;clear DAC output SOUND
ED3E : 7F 00 14   clr  $0014          ;clear addr 0014
ED41 : CE 00 00   ldx  #$0000         ;load X with 0000h
ED44 : DF 6E      stx  $6E            ;store X in addr 6E
ED46 : DF 19      stx  $19            ;store X in addr 19
ED48 : CE ED 95   ldx  #$ED95         ;load X with ED95h (data below)
ED4B : C6 10      ldab  #$10          ;load B with 10h (#16)
ED4D : BD EB 80   jsr  LEB80          ;jump sub TRANS
;LED50:
ED50 : 7A 00 15   dec  $0015          ;decr addr 0015
ED53 : 26 FB      bne  LED50          ;branch Z=0
ED55 : 96 10      ldaa  $10           ;load A with addr 10
ED57 : 97 15      staa  $15           ;store A in addr 15
ED59 : 96 14      ldaa  $14           ;load A with addr 14
ED5B : 9B 12      adda  $12           ;add A with addr 12
ED5D : 97 14      staa  $14           ;store A in addr 14
ED5F : F6 20 02   ldab  $2002         ;load B with DAC
ED62 : 54         lsrb                ;logic shift right B
ED63 : 54         lsrb                ;logic shift right B
ED64 : 1B         aba                 ;add B to A
ED65 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
ED68 : 7A 00 18   dec  $0018          ;decr addr 0018
ED6B : 26 E3      bne  LED50          ;branch Z=0
ED6D : 96 17      ldaa  $17           ;load A with addr 17
ED6F : 97 18      staa  $18           ;store A in addr 18
ED71 : 70 00 12   neg  $0012          ;negate addr 0012
ED74 : 7A 00 16   dec  $0016          ;decr addr 0016
ED77 : 26 D7      bne  LED50          ;branch Z=0
ED79 : 96 11      ldaa  $11           ;load A with addr 11
ED7B : 97 16      staa  $16           ;store A in addr 16
ED7D : DE 19      ldx  $19            ;load X with addr 19
ED7F : A6 00      ldaa  $00,x         ;load A with X+00h
ED81 : 97 17      staa  $17           ;store A in addr 17
ED83 : 97 18      staa  $18           ;store A in addr 18
ED85 : 96 12      ldaa  $12           ;load A with addr 12
ED87 : 9B 13      adda  $13           ;add A with addr 13
ED89 : 97 12      staa  $12           ;store A in addr 12
ED8B : 96 1A      ldaa  $1A           ;load A with addr 1A
ED8D : 4C         inca                ;incr A
ED8E : 84 0F      anda  #$0F          ;and A with 0Fh
ED90 : 97 1A      staa  $1A           ;store A in addr 1A
ED92 : 7E ED 50   jmp  LED50          ;jump 
;*************************************;
; data for synth above (16 bytes)
ED95 : 10 18 16 12 10 18 10 18        ;
ED9D : 10 18 10 18 10 18 10 18        ;
;*************************************;
; synth
;*************************************;
;LEDA5:
EDA5 : 7F 00 62   clr  $0062          ;clear addr 0062
EDA8 : 7E F2 97   jmp  LF297          ;jump PREIRQ
;LEDAB:
EDAB : CE EE 59   ldx  #$EE59         ;load X with EE59h (data below)
EDAE : 16         tab                 ;transfer A to B
EDAF : 86 0B      ldaa  #$0B          ;load A with 0Bh (#11)
EDB1 : BD F0 69   jsr  LF069          ;jump sub TRNSLD
;LEDB4:
EDB4 : 96 00      ldaa  $00           ;load A with addr 00
EDB6 : 97 0C      staa  $0C           ;store A in addr 0C
EDB8 : 97 67      staa  $67           ;store A in addr 67
EDBA : 86 00      ldaa  #$00          ;load A with 00h
EDBC : 97 0D      staa  $0D           ;store A in addr 0D
EDBE : 96 09      ldaa  $09           ;load A with addr 09
EDC0 : 97 16      staa  $16           ;store A in addr 16
EDC2 : 96 0A      ldaa  $0A           ;load A with addr 0A
EDC4 : 97 17      staa  $17           ;store A in addr 17
;LEDC6:
EDC6 : 96 01      ldaa  $01           ;load A with addr 01
EDC8 : 43         coma                ;complement 1s A
EDC9 : 97 0B      staa  $0B           ;store A in addr 0B
EDCB : 96 07      ldaa  $07           ;load A with addr 07
EDCD : 97 14      staa  $14           ;store A in addr 14
EDCF : 96 08      ldaa  $08           ;load A with addr 08
EDD1 : 97 15      staa  $15           ;store A in addr 15
;LEDD3:
EDD3 : 4F         clra                ;clear A
EDD4 : 97 0E      staa  $0E           ;store A in addr 0E
EDD6 : 97 0F      staa  $0F           ;store A in addr 0F
EDD8 : 96 0C      ldaa  $0C           ;load A with addr 0C
EDDA : 97 10      staa  $10           ;store A in addr 10
EDDC : 96 0D      ldaa  $0D           ;load A with addr 0D
EDDE : 97 11      staa  $11           ;store A in addr 11
EDE0 : D6 04      ldab  $04           ;load B with addr 04
EDE2 : DE 05      ldx  $05            ;load X with addr 05
EDE4 : DF 12      stx  $12
;LEDE6:
EDE6 : 96 0F      ldaa  $0F           ;load A with addr 0F
EDE8 : 9B 11      adda  $11           ;add A with addr 11
EDEA : 97 0F      staa  $0F           ;store A in addr 0F
EDEC : 96 0E      ldaa  $0E           ;load A with addr 0E
EDEE : 99 10      adca  $10           ;add C+A + addr 10
EDF0 : 97 0E      staa  $0E           ;store A in addr 0E
EDF2 : 81 80      cmpa  #$80          ;compare A with 80h
EDF4 : 22 03      bhi  LEDF9          ;branch C+Z=0
EDF6 : 4F         clra                ;clear A
EDF7 : 20 03      bra  LEDFC          ;branch always
;LEDF9:
EDF9 : 96 0B      ldaa  $0B           ;load A with addr 0B
EDFB : 01         nop                 ;
;LEDFC -output
EDFC : B7 20 02   staa  $2002         ;store A in DAC output SOUND
EDFF : 5A         decb                ;decr B
EE00 : 26 18      bne  LEE1A          ;branch Z=0
EE02 : 96 11      ldaa  $11           ;load A with addr 11
EE04 : 9B 03      adda  $03           ;add A with addr 03
EE06 : 97 11      staa  $11           ;store A in addr 11
EE08 : 96 10      ldaa  $10           ;load A with addr 10
EE0A : 99 02      adca  $02           ;add C+A + addr 02
EE0C : 97 10      staa  $10           ;store A in addr 10
EE0E : D6 04      ldab  $04           ;load B with addr 04
EE10 : DE 12      ldx  $12            ;load X with addr 12
EE12 : 09         dex                 ;decr X
EE13 : DF 12      stx  $12            ;store X in addr 12
EE15 : 27 14      beq  LEE2B          ;branch Z=1
EE17 : 7E ED E6   jmp  LEDE6          ;jump 
;
;LEE1A - cycle sync
EE1A : 08         inx                 ;incr X
EE1B : 09         dex                 ;decr X
EE1C : 08         inx                 ;incr X
EE1D : 09         dex                 ;decr X
EE1E : 08         inx                 ;incr X
EE1F : 09         dex                 ;decr X
EE20 : 08         inx                 ;incr X
EE21 : 09         dex                 ;decr X
EE22 : 08         inx                 ;incr X
EE23 : 09         dex                 ;decr X
EE24 : 08         inx                 ;incr X
EE25 : 09         dex                 ;decr X
EE26 : 01         nop                 ;
EE27 : 01         nop                 ;
EE28 : 01         nop                 ;
EE29 : 20 BB      bra  LEDE6          ;branch always
;
;LEE2B:
EE2B : 7A 00 14   dec  $0014          ;decr addr 0014
EE2E : 27 09      beq  LEE39          ;branch Z=1
EE30 : 96 0B      ldaa  $0B           ;load A with addr 0B
EE32 : 90 15      suba  $15           ;sub A with addr 15
EE34 : 97 0B      staa  $0B           ;store A in addr 0B
EE36 : 7E ED D3   jmp  LEDD3          ;jump 
;
;LEE39:
EE39 : 7A 00 16   dec  $0016          ;decr addr 0016
EE3C : 27 09      beq  LEE47          ;branch Z=1
EE3E : 96 0C      ldaa  $0C           ;load A with addr 0C
EE40 : 9B 17      adda  $17           ;add A with addr 17
EE42 : 97 0C      staa  $0C           ;store A in addr 0C
EE44 : 7E ED C6   jmp  LEDC6          ;jump 
;
;LEE47:
EE47 : CE EF B9   ldx  #$EFB9         ;load X with EFB9h (data below)
EE4A : A6 01      ldaa  $01,x         ;load A with X+00h
EE4C : D6 01      ldab  $01           ;load B with addr 01
EE4E : 11         cba                 ;compare B to A
EE4F : 26 05      bne  LEE56          ;branch Z=0
EE51 : 86 20      ldaa  #$20          ;load A with 20h
EE53 : 7E ED AB   jmp  LEDAB          ;jump 
;LEE56:
EE56 : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
;data used above (11 bytes)
EE59 : 01    " "    nop
EE5A : 23 01    "# "    bls  LEE5D
EE5C : 01    " "    nop
EE5D : 1A    " "    db  $1A
EE5E : FF FF 01    "   "    stx  XFF01
EE61 : 00    " "    db  $00
EE62 : 01    " "    nop
EE63 : 00    " "    db  $00
;
EE64 : 01    " "    nop
EE65 : 00 00    "  "    db  $00, $00
EE67 : 01    " "    nop
EE68 : 10    " "    sba
EE69 : FF FF 01    "   "    stx  XFF01
EE6C : 00    " "    db  $00
EE6D : 01    " "    nop
EE6E : 00 
;
EE6F : 00 00 00  "    "    db  $00, $00, $00, $00
EE72 : 20 20    "  "    bra  LEE94
EE74 : 00    " "    db  $00
EE75 : 80 01    "  "    suba  #$01
EE77 : 00    " "    db  $00
EE78 : 01    " "    nop
EE79 : 00    " "    db  $00
;
EE7A : 20 00    "  "    bra  LEE7C
EE7C : FF C0 20    "   "    stx  XC020
EE7F : 00    " "    db  $00
EE80 : 80 01    "  "    suba  #$01
EE82 : 00    " "    db  $00
EE83 : 01    " "    nop
EE84 : 00    " "    db  $00
;
EE85 : 10    " "    sba
EE86 : 00    " "    db  $00
EE87 : FF E0 20    "   "    stx  XE020
EE8A : 00    " "    db  $00
EE8B : 80 01    "  "    suba  #$01
EE8D : 00    " "    db  $00
EE8E : 01    " "    nop
EE8F : 00    " "    db  $00
;
EE90 : 08    " "    inx
EE91 : 00    " "    db  $00
EE92 : FF F0 20    "   "    stx  XF020
EE95 : 00    " "    db  $00
EE96 : 80 01    "  "    suba  #$01
EE98 : 00    " "    db  $00
EE99 : 01    " "    nop
EE9A : 00 
;
EE9B : 04 00    "   "    db  $00, $04, $00
EE9D : FF F8 20    "   "    stx  XF820
EEA0 : 00    " "    db  $00
EEA1 : 80 01    "  "    suba  #$01
EEA3 : 00    " "    db  $00
EEA4 : 01    " "    nop
EEA5 : 00    " "    db  $00
;
EEA6 : 40    "@"    nega
EEA7 : 00    " "    db  $00
EEA8 : FF 00 18    "   "    stx  X0018
EEAB : 00    " "    db  $00
EEAC : 40    "@"    nega
EEAD : 04    " "    db  $04
EEAE : 30    "0"    tsx
EEAF : 01    " "    nop
EEB0 : 00 
;
EEB1 : 04 00    "   "    db  $00, $04, $00
        ;
EEB3 : FF F8 08    "   "    stx  XF808
        ;
EEB6 : 00    " "    db  $00
        ;
EEB7 : 80 08    "  "    suba  #$08
        ;
EEB9 : 00    " "    db  $00
        ;
EEBA : 01    " "    nop
        ;
EEBB : 00    " "    db  $00
        ;
EEBC : 10    " "    sba
        ;
EEBD : 00    " "    db  $00
        ;
EEBE : FF E0 08    "   "    stx  XE008
        ;
EEC1 : 00    " "    db  $00
        ;
EEC2 : 80 04    "  "    suba  #$04
EEC4 : 20 01    "  "    bra  LEEC7
        ;
EEC6 : 00    " "    db  $00
        ;
EEC7        LEEC7:
EEC7 : 08    " "    inx
        ;
EEC8 : 00    " "    db  $00
        ;
EEC9 : FF F0 08    "   "    stx  XF008
        ;
EECC : 00    " "    db  $00
        ;
EECD : 80 08    "  "    suba  #$08
        ;
EECF : 00    " "    db  $00
        ;
EED0 : 01    " "    nop
        ;
EED1 : 00    " "    db  $00
        ;
EED2 : 08    " "    inx
        ;
EED3 : 00    " "    db  $00
        ;
EED4 : FF F0 08    "   "    stx  XF008
        ;
EED7 : 00    " "    db  $00
        ;
EED8 : 80 01    "  "    suba  #$01
        ;
EEDA : 00    " "    db  $00
        ;
EEDB : 70 01 04    "p  "    neg  X0104
        ;
EEDE : 00    " "    db  $00
        ;
EEDF : FF F8 02    "   "    stx  XF802
        ;
EEE2 : 00    " "    db  $00
        ;
EEE3 : 80 01    "  "    suba  #$01
        ;
EEE5 : 00    " "    db  $00
        ;
EEE6 : 78 01 04    "x  "    asl  X0104
        ;
EEE9 : 00    " "    db  $00
        ;
EEEA : FF F8 02    "   "    stx  XF802
        ;
EEED : 00    " "    db  $00
        ;
EEEE        XEEEE:
EEEE : 80 01    "  "    suba  #$01
        ;
EEF0 : 00    " "    db  $00
        ;
EEF1 : 30    "0"    tsx
EEF2 : 57    "W"    asrb
        ;
EEF3 : 04 00    "  "    db  $04, $00
        ;
EEF5 : FF F8 20    "   "    stx  XF820
        ;
EEF8 : 00    " "    db  $00
        ;
EEF9 : 80 01    "  "    suba  #$01
        ;
EEFB : 00    " "    db  $00
        ;
EEFC : 80 41    " A"    suba  #$41
        ;
EEFE : 04 00    "  "    db  $04, $00
        ;
EF00        XEF00:
EF00 : FF F8 08    "   "    stx  XF808
        ;
EF03        XEF03:
EF03 : 00    " "    db  $00
        ;
EF04 : 80 08    "  "    suba  #$08
EF06 : 20 80    "  "    bra  LEE88
        ;
EF08 : 41 04 00    "A  "    db  $41, $04, $00
        ;
EF0B : FF F8 02    "   "    stx  XF802
        ;
EF0E : 00    " "    db  $00
        ;
EF0F        XEF0F:
EF0F : 80 08    "  "    suba  #$08
EF11 : 20 80    "  "    bra  LEE93
        ;
EF13 : 1F 02    "  "    db  $1F, $02
EF15        XEF15:
EF15 : 00    " "    db  $00
        ;
EF16 : FF FC 10    "   "    stx  XFC10
        ;
EF19 : 00    " "    db  $00
        ;
EF1A : 80 08    "  "    suba  #$08
EF1C : 20 80    "  "    bra  LEE9E
        ;
EF1E : 63 01    "c "    com  $01,x
        ;
EF20 : 00    " "    db  $00
        ;
EF21 : FF FE 20    "   "    stx  XFE20
        ;
EF24 : 00    " "    db  $00
        ;
EF25 : 80 08    "  "    suba  #$08
EF27 : 20 80    "  "    bra  LEEA9
        ;
EF29 : 63 40    "c@"    com  $40,x
        ;
EF2B : 00    " "    db  $00
        ;
EF2C : FF 00 08    "   "    stx  X0008
        ;
EF2F : 00    " "    db  $00
        ;
EF30 : 40    "@"    nega
EF31 : 01    " "    nop
EF32 : 30    "0"    tsx
EF33 : 60 01    "` "    neg  $01,x
        ;
EF35 : 00 00    "  "    db  $00, $00
        ;
EF37 : FF F8 02    "   "    stx  XF802
        ;
EF3A : 00    " "    db  $00
        ;
EF3B : 80 08    "  "    suba  #$08
EF3D : 20 80    "  "    bra  LEEBF
        ;
EF3F : 01    " "    nop
        ;
EF40 : 03 00    "  "    db  $03, $00
        ;
EF42 : FF F8 01    "   "    stx  XF801
        ;
EF45 : 00    " "    db  $00
        ;
EF46 : 80 08    "  "    suba  #$08
EF48 : 20 80    "  "    bra  LEECA
        ;
EF4A : 01    " "    nop
EF4B : 49    "I"    rola
        ;
EF4C : 00    " "    db  $00
        ;
EF4D : FF F8 08    "   "    stx  XF808
        ;
EF50 : 00    " "    db  $00
        ;
EF51 : 80 08    "  "    suba  #$08
EF53 : 20 01    "  "    bra  LEF56
        ;
EF55 : 00    " "    db  $00
        ;
EF56        LEF56:
EF56 : 8E 00 FF    "   "    lds  #$00FF
EF59 : F8 08 00    "   "    eorb  X0800
EF5C : 80 08    "  "    suba  #$08
EF5E : 20 01    "  "    bra  LEF61
        ;
EF60 : 00    " "    db  $00
        ;
EF61        LEF61:
EF61 : 79 00 FF    "y  "    rol  X00FF
        ;
EF64 : FC    " "    db  $FC
        ;
EF65 : 10    " "    sba
        ;
EF66 : 00    " "    db  $00
        ;
EF67 : 80 08    "  "    suba  #$08
EF69 : 20 01    "  "    bra  LEF6C
        ;
EF6B : 00    " "    db  $00
        ;
EF6C        LEF6C:
EF6C : 31    "1"    ins
        ;
EF6D : 00    " "    db  $00
        ;
EF6E : FF FC 10    "   "    stx  XFC10
        ;
EF71 : 00    " "    db  $00
        ;
EF72 : 80 08    "  "    suba  #$08
EF74 : 20 01    "  "    bra  LEF77
        ;
EF76 : 00    " "    db  $00
        ;
EF77        LEF77:
EF77 : 53    "S"    comb
        ;
EF78 : 00    " "    db  $00
        ;
EF79 : FF FE 20    "   "    stx  XFE20
        ;
EF7C : 00    " "    db  $00
        ;
EF7D : 80 08    "  "    suba  #$08
EF7F : 20 01    "  "    bra  LEF82
        ;
EF81 : 00    " "    db  $00
        ;
EF82        LEF82:
EF82 : 47    "G"    asra
        ;
EF83 : 00    " "    db  $00
        ;
EF84 : FF FE 20    "   "    stx  XFE20
        ;
EF87 : 00    " "    db  $00
        ;
EF88 : 80 08    "  "    suba  #$08
EF8A : 20 01    "  "    bra  LEF8D
        ;
EF8C : 00    " "    db  $00
        ;
EF8D        LEF8D:
EF8D : 40    "@"    nega
        ;
EF8E : 00    " "    db  $00
        ;
EF8F : FF 00 04    "   "    stx  X0004
        ;
EF92 : 00    " "    db  $00
        ;
EF93 : 40    "@"    nega
EF94 : 01    " "    nop
EF95 : 30    "0"    tsx
EF96 : FF 04 40    "  @"    stx  X0440
        ;
EF99 : 00    " "    db  $00
        ;
EF9A : FF 00 08    "   "    stx  X0008
        ;
EF9D : 00    " "    db  $00
        ;
EF9E : 40    "@"    nega
EF9F : 01    " "    nop
EFA0 : 30    "0"    tsx
EFA1 : FF 04 40    "  @"    stx  X0440
        ;
EFA4 : 00    " "    db  $00
        ;
EFA5 : FF 00 01    "   "    stx  X0001
        ;
EFA8 : 00    " "    db  $00
        ;
EFA9 : 40    "@"    nega
EFAA        XEFAA:
EFAA : 01    " "    nop
EFAB : 30    "0"    tsx
EFAC : FF 01 00    "   "    stx  X0100
        ;
EFAF : 00    " "    db  $00
        ;
EFB0 : 57    "W"    asrb
        ;
EFB1 : 00    " "    db  $00
        ;
EFB2 : 08    " "    inx
        ;
EFB3 : 00    " "    db  $00
        ;
EFB4 : 10    " "    sba
EFB5 : 08    " "    inx
EFB6 : 20 FF    "  "    bra  LEFB7
        ;
EFB8 : 01    " "    nop
;*************************************;
;
EFB9 : 00    " "    db  $00
        ;
EFBA : 2F 01    "/ "    ble  LEFBD
EFBC : 30    "0"    tsx
EFBD        LEFBD:
EFBD : 08    " "    inx
        ;
EFBE : 00    " "    db  $00
        ;
EFBF        XEFBF:
EFBF : 10    " "    sba
EFC0 : 08    " "    inx
EFC1 : 20 FF    "  "    bra  LEFC2
        ;
EFC3 : 01    " "    nop
        ;
EFC4 : 00 00 00    "   "    db  $00, $00, $00
        ;
EFC7 : 01    " "    nop
EFC8 : 08    " "    inx
        ;
EFC9 : 00    " "    db  $00
        ;
EFCA : 10    " "    sba
EFCB : 08    " "    inx
EFCC : 20 FF    "  "    bra  LEFCD
        ;
EFCE : 01    " "    nop
        ;
EFCF : 00 00 00    "   "    db  $00, $00, $00
        ;
EFD2 : 01    " "    nop
EFD3 : 10    " "    sba
        ;
EFD4 : 00    " "    db  $00
        ;
EFD5 : 10    " "    sba
EFD6 : 08    " "    inx
EFD7 : 20 FF    "  "    bra  LEFD8
        ;
EFD9 : 01    " "    nop
        ;
EFDA : 00 00    "  "    db  $00, $00
        ;
EFDC : 57    "W"    asrb
EFDD : 01    " "    nop
EFDE : 20 00    "  "    bra  LEFE0
        ;
EFE0        LEFE0:
EFE0 : 10    " "    sba
EFE1 : 08    " "    inx
EFE2 : 20 FF    "  "    bra  LEFE3
        ;
EFE4 : 01    " "    nop
        ;
EFE5 : 00 00    "  "    db  $00, $00
        ;
EFE7 : 57    "W"    asrb
        ;
EFE8 : 00    " "    db  $00
        ;
EFE9 : 10    " "    sba
        ;
EFEA : 00 05 04 00  "    "    db  $00, $05, $04, $00
        ;
EFEE : FF 01 00    "   "    stx  X0100
        ;
EFF1 : 00    " "    db  $00
        ;
EFF2 : 57    "W"    asrb
        ;
EFF3 : 00    " "    db  $00
        ;
EFF4 : 20 00    "  "    bra  LEFF6
        ;
EFF6        LEFF6:
EFF6 : 05 04 00    "   "    db  $05, $04, $00
        ;
EFF9 : FF 01 00    "   "    stx  X0100
        ;
EFFC : 00    " "    db  $00
        ;
EFFD : 01    " "    nop
EFFE : 70 02 00    "p  "    neg  X0200
F001 : 10    " "    sba
F002 : 08    " "    inx
F003 : 20 FF    "  "    bra  LF004
        ;
F005 : 01    " "    nop
        ;
F006 : 00 00    "  "    db  $00, $00
        ;
F008        XF008:
F008 : 01    " "    nop
F009 : 01    " "    nop
        ;
F00A : 03 00    "  "    db  $03, $00
        ;
F00C : 10    " "    sba
F00D : 08    " "    inx
F00E : 20 FF    "  "    bra  LF00F
        ;
F010 : 01    " "    nop
        ;
F011 : 00 00    "  "    db  $00, $00
        ;
F013 : 01    " "    nop
F014 : 01    " "    nop
        ;
F015 : 03 00    "  "    db  $03, $00
        ;
F017 : 10    " "    sba
F018 : 08    " "    inx
        ;
F019 : 02    " "    db  $02
        ;
F01A : FF 01 00    "   "    stx  X0100
        ;
F01D : 00    " "    db  $00
        ;
F01E : 01    " "    nop
F01F : 01    " "    nop
        ;
F020        XF020:
F020 : 03 00    "  "    db  $03, $00
        ;
F022 : 10    " "    sba
F023 : 08    " "    inx
        ;
F024 : 04    " "    db  $04
        ;
F025 : FF 01 00    "   "    stx  X0100
        ;
F028 : 00    " "    db  $00
        ;
F029 : 01    " "    nop
F02A : 01    " "    nop
        ;
F02B : 03 00    "  "    db  $03, $00
        ;
F02D : 10    " "    sba
        ;
F02E : 02 04    "  "    db  $02, $04
        ;
F030 : FF 01 
;*************************************;
; either temp sp or random gen processing routine
;*************************************;
;TMPROC
F032 : 96 60      ldaa  $60           ;load A with addr 60
F034 : D6 61      ldab  $61           ;load B with addr 61
F036 : 53         comb                ;complement 1s B
F037 : C5 09      bitb  #$09          ;bit test B with 09h
F039 : 26 05      bne  LF040          ;branch Z=0 TMPRC2
F03B : 53         comb                ;complement 1s B
;TMPRC1 LF03C:
F03C : 46         rora                ;rotate right A
F03D : 56         rorb                ;rotate right B
F03E : 20 09      bra  LF049          ;branch always TMPRCX
;TMPRC2 LF040:
F040 : 53         comb                ;complement 1s B
F041 : C5 09      bitb  #$09          ;bit test B with 09h
F043 : 26 02      bne  LF047          ;branch Z=0 TMPRC3
F045 : 27 F5      beq  LF03C          ;branch Z=1 TMPRC1
;TMPRC3 LF047:
F047 : 44         lsra                ;logic shift right A
F048 : 56         rorb                ;rotate right B
;TMPRCX LF049:
F049 : 97 60      staa  $60           ;store A in addr 60
F04B : D7 61      stab  $61           ;store B in addr 61
F04D : 39         rts                 ;return subroutine
;*************************************;
;Add A to X register
;*************************************;
;ADDX LF04E:
F04E : DF 68      stx  $68            ;store X in addr 68 (XPLAY)
F050 : 9B 69      adda  $69           ;
F052 : 97 69      staa  $69
F054 : 24 03      bcc  LF059
F056 : 7C 00 68   inc  $0068
;ADDX1
F059 : DE 68      ldx  $68
F05B : 39         rts
;*************************************;
;Add B to X register
;*************************************;
;ADDBX LF05C:
F05C : DF 68    " h"    stx  X0068
F05E : DB 69    " i"    addb  X0069
F060 : D7 69    " i"    stab  X0069
F062 : 99 68    " h"    adca  X0068
F064 : 97 68    " h"    staa  $68
F066 : DE 68    " h"    ldx  X0068
F068 : 39    "9"    rts
;*************************************;
; parameter transfer loader
;*************************************;
;TRNSLD LF069:
F069 : 36         psha                ;push A into stack then SP-1
;TRLDLP LF06A:
F06A : 5A         decb                ;decr B
F06B : 2B 07      bmi  LF074          ;branch N=1 TRLD1
F06D : 32         pula                ;SP+1 pull stack into A
F06E : 36         psha                ;push A into stack then SP-1
F06F : BD F0 4E   jsr  LF04E          ;jump sub ADDX
F072 : 20 F6      bra  LF06A          ;branch always TRLDLP
;TRLD1 LF074:
F074 : DF 68      stx  $68            ;store X in addr 68
F076 : DF 70      stx  $70            ;store X in addr 70
F078 : CE 00 00   ldx  #$0000         ;load X with 0000h
F07B : DF 6E      stx  $6E            ;store X in addr 6E
F07D : DE 68      ldx  $68            ;load X with addr 68
F07F : 33         pulb                ;SP+1 pull stack into B
F080 : BD EB 80   jsr  LEB80          ;jump sub TRANS
F083 : 39         rts                 ;return subroutine
;*************************************;
;
;*************************************;
;LF084
F084 : 91 50      cmpa  X0050
F086 : 22 03      bhi  LF08B
F088 : 7F 00 52   clr  X0052
;LF08B:
F08B : 91 51      cmpa  X0051
F08D : 23 03      bls  LF092
F08F : 7C 00 52   inc  X0052
;LF092:
F092 : 4C         inca
F093 : D6 52      ldab  X0052
F095 : 27 02      beq  LF099
F097 : 80 02      suba  #$02
;LF099:
F099 : 97 53      staa  $53
F09B : 39         rts
;*************************************;
; jsr call
;*************************************;
;LF09C:
F09C : DE 6E      ldx  $6E            ;load X with addr 6E
F09E : A6 00      ldaa  $00,x         ;load A with X+00h
F0A0 : 97 40      staa  $40           ;store A in addr 40
F0A2 : 97 41      staa  $41           ;store A in addr 41
F0A4 : A6 01      ldaa  $01,x         ;load A with X+01h
F0A6 : 97 48      staa  $48           ;store A in addr 48
F0A8 : 97 49      staa  $49           ;store A in addr 49
F0AA : DE 70      ldx  $70            ;load X with addr 70
F0AC : A6 01      ldaa  $01,x         ;load A with X+01h
F0AE : 97 42      staa  $42           ;store A in addr 42
F0B0 : 97 43      staa  $43           ;store A in addr 43
F0B2 : A6 02      ldaa  $02,x         ;load A with X+02h
F0B4 : 97 44      staa  $44           ;store A in addr 44
F0B6 : 97 45      staa  $45           ;store A in addr 45
F0B8 : A6 03      ldaa  $03,x         ;load A with X+03h
F0BA : 97 46      staa  $46           ;store A in addr 46
F0BC : 97 47      staa  $47           ;store A in addr 47
F0BE : A6 05      ldaa  $05,x         ;load A with X+05h
F0C0 : 97 4A      staa  $4A           ;store A in addr 4A
F0C2 : A6 06      ldaa  $06,x         ;load A with X+06h
F0C4 : 97 4B      staa  $4B           ;store A in addr 4B
F0C6 : A6 07      ldaa  $07,x         ;load A with X+07h
F0C8 : 97 4C      staa  $4C           ;store A in addr 4C
F0CA : A6 08      ldaa  $08,x         ;load A with X+08h
F0CC : 97 4D      staa  $4D           ;store A in addr 4D
F0CE : A6 0A      ldaa  $0A,x         ;load A with X+0Ah
F0D0 : 97 4F      staa  $4F           ;store A in addr 4F
F0D2 : A6 09      ldaa  $09,x         ;load A with X+09h
F0D4 : 97 4E      staa  $4E           ;store A in addr 4E
F0D6 : 85 20      bita  #$20          ;bit test A with 20h
F0D8 : 27 07      beq  LF0E1          ;branch Z=1
F0DA : BD F0 32   jsr  LF032          ;jump sub TMPROC
F0DD : 97 4A      staa  $4A           ;store A in addr 4A
F0DF : 96 4E      ldaa  $4E           ;load A with addr 4E
;LF0E1:
F0E1 : 85 10      bita  #$10          ;bit test A with 10h
F0E3 : 27 0C      beq  LF0F1          ;branch Z=1
F0E5 : A6 00      ldaa  $00,x         ;load A with X+00h
F0E7 : 97 40      staa  $40           ;store A in addr 40
F0E9 : 97 41      staa  $41           ;store A in addr 41
F0EB : A6 04      ldaa  $04,x         ;load A with X+04h
F0ED : 97 48      staa  $48           ;store A in addr 48
F0EF : 97 49      staa  $49           ;store A in addr 49
;LF0F1:
F0F1 : 39         rts                 ;return subroutine
;*************************************;
; params
;*************************************;
;LF0F2:
F0F2 : DE 70      ldx  $70            ;load X with addr 70
F0F4 : A6 0B      ldaa  $0B,x         ;load A with X+0Bh (#11)
F0F6 : 27 0A      beq  LF102          ;branch Z=1
F0F8 : D6 6C      ldab  $6C           ;load B with addr 6C
F0FA : 5C         incb                ;incr B
F0FB : 11         cba                 ;compare B to A
F0FC : 27 04      beq  LF102          ;branch Z=1
F0FE : D7 6C      stab  $6C           ;store B in addr 6C
F100 : 20 32      bra  LF134          ;branch always
;LF102:
F102 : 7F 00 6C   clr  $006C          ;clear addr 006C
F105 : A6 0C      ldaa  $0C,x         ;load A with X+0Ch (#12)
F107 : 2B 11      bmi  LF11A          ;branch N=1
F109 : 27 0A      beq  LF115          ;branch Z=1
F10B : D6 6D      ldab  $6D           ;load B with addr 6D
F10D : 7C 00 6D   inc  $006D          ;incr addr 006D
F110 : 11         cba                 ;compare B to A
F111 : 27 02      beq  LF115          ;branch Z=1
F113 : 20 1F      bra  LF134          ;branch always
;LF115:
F115 : 7F 00 6D   clr  $6D            ;clear addr 006D
F118 : 20 46      bra  LF160          ;branch always
;LF11A:
F11A : 84 7F      anda  #$7F          ;and A with 7Fh
F11C : 27 0A      beq  LF128          ;branch Z=1
F11E : D6 6D      ldab  $6D           ;load B with addr 6D
F120 : 5C         incb                ;incr B
F121 : 11         cba                 ;compare B to A
F122 : 27 04      beq  LF128          ;branch Z=1
F124 : D7 6D      stab  $6D           ;store B in addr 6D
F126 : 20 0C      bra  LF134          ;branch always
;LF128:
F128 : EE 0D      ldx  $0D,x          ;load X with X+0Dh (#13)
F12A : DF 70      stx  $70            ;store X in addr 70
F12C : BD F0 9C   jsr  LF09C          ;jump sub
F12F : 7F 00 6D   clr  $006D          ;clear addr 006D
F132 : 20 29      bra  LF15D          ;branch always
;LF134:
F134 : 96 48      ldaa  $48           ;load A with addr 48
F136 : 27 05      beq  LF13D          ;branch Z=1
F138 : 7A 00 49   dec  $0049          ;decr addr 0049
F13B : 26 1E      bne  LF15B          ;branch Z=0
;LF13D:
F13D : DE 6E      ldx  $006E          ;load X with addr 6E
F13F : A6 01      ldaa  $01,x         ;load A with X+01h 
F141 : 97 48      staa  $48           ;store A in addr 48
F143 : 97 49      staa  $49           ;store A in addr 49
F145 : 27 0C      beq  LF153          ;branch Z=1
F147 : A6 00      ldaa  $00,x         ;load A with X+00h
F149 : 97 40      staa  $40           ;store A in addr 40
F14B : 08         inx                 ;incr X
F14C : 08         inx                 ;incr X
F14D : DF 6E      stx  $6E            ;store X in addr 6E
F14F : 20 0C      bra  LF15D          ;branch always
;unreachable?
F151 : 20 0D      bra  LF160          ;branch always
;LF153:
F153 : A6 00      ldaa  $00,x         ;load A with X+00h
F155 : 2C 09      bge  LF160          ;branch N(+)V=0
F157 : EE 02      ldx  $02,x          ;load X with X+02h
F159 : DF 6E      stx  $6E            ;store X in addr 6E
;LF15B - exit 0
F15B : 4F         clra                ;clear A
F15C : 39         rts                 ;return subroutine
;LF15D - exit 01
F15D : 86 01      ldaa  #$01          ;load A with 01h
F15F : 39         rts                 ;return subroutine
;LF160 - exit FF
F160 : 86 FF      ldaa  #$FF          ;load A with FFh
F162 : 39         rts                 ;return subroutine
;*************************************;
; param
;*************************************;
;LF163:
F163 : 96 4F      ldaa  $4F           ;load A with 4Fh
F165 : 44         lsra                ;logic shift right A
F166 : 24 03      bcc  LF16B          ;branch C=0
F168 : 7C 00 40   inc  $0040          ;incr addr 0040
;LF16B:
F16B : 44         lsra                ;logic shift right A
F16C : 24 03      bcc  LF171          ;branch C=0
F16E : 7C 00 42   inc  $0042          ;incr addr 0042
;LF171:
F171 : 44         lsra                ;logic shift right A
F172 : 24 03      bcc  LF177          ;branch C=0
F174 : 7C 00 44   inc  $0044          ;incr addr 0044
;LF177:
F177 : 44         lsra                ;logic shift right A
F178 : 24 03      bcc  LF17D          ;branch C=0
F17A : 7C 00 46   inc  $0046          ;incr addr 0046
;LF17D:
F17D : 44         lsra                ;logic shift right A
F17E : 24 03      bcc  LF183          ;branch C=0
F180 : 7C 00 48   inc  $0048          ;incr addr 0048
;LF183:
F183 : 44         lsra                ;logic shift right A
F184 : 24 03      bcc  LF189          ;branch C=0
F186 : 7C 00 4C   inc  $004C          ;incr addr 004C
;LF189:
F189 : 44         lsra                ;logic shift right A
F18A : 24 03      bcc  LF18F          ;branch C=0
F18C : 7C 00 4D   inc  $004D          ;incr addr 004D
;LF18F:
F18F : 39         rts                 ;retrun subroutine
;*************************************;
;Tilt sound, buzz saw down
;*************************************;
;TILT
F190 : CE 00 E0   ldx  #$00E0         ;load X with 00E0h
F193 : C6 80      ldab  #$80          ;load B with 80h
;TILT1
F195 : 86 20      ldaa  #$20          ;load A with 20h
F197 : BD F0 4E   jsr  LF04E          ;jump sub ADDX
;TILT2
F19A : 09         dex                 ;decr X
F19B : 26 FD      bne  LF19A          ;branch Z=0 TITL2
F19D : 7F 20 02   clr  $2002          ;clear DAC output SOUND
;TILT2
F1A0 : 5A         decb                ;decr B
F1A1 : 26 FD      bne  LF1A0          ;branch Z=0 TILT2
F1A3 : 73 20 02   com  $2002          ;complement 1s DAC output SOUND
F1A6 : DE 68      ldx  $68            ;load X with addr 68
F1A8 : 8C 10 00   cpx  #$1000         ;compare X with 1000h
F1AB : 26 E8      bne  LF195          ;branch Z=0 TILT1
F1AD : 39         rts                 ;return subroutine
;*************************************;
;Diagnostic Processing Here 
;*************************************;
;NMI
F1AE : 0F         sei                 ;set interrupt mask
F1AF : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
F1B2 : 4F         clra                ;clear A
F1B3 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
F1B6 : 5F         clrb                ;clear B
;NMI1 - 
F1B7 : E9 00      adcb  $00,x         ;add C+B + addr X+00h
F1B9 : 09         dex                 ;decr X
F1BA : 8C C0 00   cpx  #$C000         ;compare X with C000h (start ROM)
F1BD : 26 F8      bne  LF1B7          ;branch Z=0 NMI1
F1BF : C1 80      cmpb  #$80          ;compare B with 80h
;STDBY2
F1C1 : 26 FE      bne  LF1C1          ;branch Z=0 STDBY2 (*-2)
F1C3 : 4F         clra                ;clear A
F1C4 : BD EA 4F   jsr  LEA4F          ;jump sub GWLD
F1C7 : BD EA B5   jsr  LEAB5          ;jump sub GWAVE
F1CA : BD E7 93   jsr  LE793          ;jump sub (jmp to speech proc)
F1CD : 0E         cli                 ;clear interrupts I=0
F1CE : 20 DE      bra  LF1AE          ;branch always NMI
;*************************************;
; clear irq and wait (standby)
;*************************************;
;CLRWAI
F1D0 : 0E         cli                 ;clear interrupts I=0
;STDBY3
F1D1 : 20 FE      bra  LF1D1          ;branch always STDBY3 (*-2)
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
F1D3 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (ENDRAM)
F1D6 : B6 20 00   ldaa  $2000         ;load PIA sound select
F1D9 : 0E         cli                 ;clear interrupts I=0
F1DA : D6 62      ldab  $62           ;load B with addr 62
F1DC : C1 01      cmpb  #$01          ;compare B with 01h
F1DE : 26 06      bne  LF1E6          ;branch Z=0 IRQA
F1E0 : D6 12      ldab  $12           ;load B with addr 12
F1E2 : D7 63      stab  $63           ;store B in addr 63
F1E4 : 20 08      bra  LF1EE          ;branch always IRQB
;IRQA (irq params 1)
F1E6 : C1 02      cmpb  #$02          ;compare B with 02h
F1E8 : 26 04      bne  LF1EE          ;branch Z=0 IRQB
F1EA : D6 10      ldab  $10           ;load B with addr 10
F1EC : D7 64      stab  $64           ;store B in addr 64
;IRQB
F1EE : 4D         tsta                ;test A
;IRQC
F1EF : 27 DF      beq  LF1D0          ;branch Z=1 CLRWAI
F1F1 : 2B 3D      bmi  LF230          ;branch N=1 IRQ0
F1F3 : 81 6F      cmpa  #$6F          ;compare A with 6Fh
F1F5 : 23 0B      bls  LF202          ;branch C+Z=1 IRQ00
F1F7 : 7F 00 62   clr  $0062          ;clear addr 0062
F1FA : 80 70      suba  #$70          ;sub A with 70h
F1FC : BD E7 90   jsr  LE790          ;jump sub (jsr to speech proc)
F1FF : 7E F2 97   jmp  LF297          ;jump PREIRQ
;IRQ00 - jmptbl
F202 : 81 43      cmpa  #$43          ;compare A with 43h
F204 : 22 CA      bhi  LF1D0          ;branch C+Z=0 CLRWAI
F206 : 27 C8      beq  LF1D0          ;branch Z=1 CLRWAI
F208 : 97 72      staa  $72           ;store A in addr 72
F20A : CE F4 90   ldx  #$F490         ;load X with F490h (irq data below)
F20D : 4A         deca                ;decr A
F20E : 16         tab                 ;transfer A to B
F20F : 97 6C      staa  $6C           ;store A in addr 6C
F211 : 4F         clra                ;clear A
F212 : 58         aslb                ;arith shift left B
F213 : 89 00      adca  #$00          ;add C+A + 00h
F215 : DB 6C      addb  $6C           ;add B with addr 6C
F217 : 89 00      adca  #$00          ;add C+A + 00h
F219 : BD F0 5C   jsr  LF05C          ;jump sub ADDBX
F21C : A6 00      ldaa  $00,x         ;load A with X+00h
F21E : E6 02      ldab  $02,x         ;load B with X+02h
F220 : D7 65      stab  $65           ;store B in addr 65
F222 : E6 01      ldab  $01,x         ;load B with X+01h
F224 : 48         asla                ;arith shift left A
F225 : CE F4 74   ldx  #$F474         ;load X with F474h (JMPTBL)
F228 : BD F0 4E   jsr  LF04E          ;jump sub ADDX
F22B : EE 00      ldx  $00,x          ;load A with X+00h
F22D : 17         tba                 ;transfer B to A
F22E : 6E 00      jmp  $00,x          ;jump addr X+00h
;IRQ0 
F230 : 7F 00 62   clr  $0062          ;clear addr 0062
F233 : 7F 00 65   clr  $0065          ;clear addr 0065
F236 : 84 7F      anda  #$7F          ;and A with 7Fh
F238 : 85 40      bita  #$40          ;bit test A with 40h
F23A : 26 24      bne  LF260          ;branch Z=0 IRQ4
F23C : 84 3F      anda  #$3F          ;and A with 3Fh
F23E : 81 18      cmpa  #$18          ;compare A with 18h
F240 : 22 03      bhi  LF245          ;branch C+Z=0 IRQ1
F242 : 7E F8 9D   jmp  LF89D          ;jump 
;IRQ1 LF245:
F245 : 81 31      cmpa  #$31          ;compare A with 31h
F247 : 22 05      bhi  LF24E          ;branch C+Z=0 IRQ2
F249 : 80 19      suba  #$19          ;sub A with 19h
F24B : 7E FA 0E   jmp  LFA0E          ;jump 
;IRQ2 LF24E:
F24E : 81 32      cmpa  #$32          ;compare A with 32h
F250 : 22 05      bhi  LF257          ;branch C+Z=0 IRQ3
F252 : 80 32      suba  #$32          ;sub A with 32h
F254 : 7E FC 1A   jmp  LFC1A          ;jump 
;IRQ3 LF257:
F257 : 81 3D      cmpa  #$3D          ;compare A with 3Dh
F259 : 22 31      bhi  LF28C          ;branch C+Z=0 IRQX2
F25B : 80 33      suba  #$33          ;sub A with 33h
F25D : 7E FC BA   jmp  LFCBA          ;jump 
;IRQ4 LF260:
F260 : 84 3F      anda  #$3F          ;and A with 3Fh
F262 : 81 0E      cmpa  #$0E          ;compare A with 0Eh
F264 : 22 03      bhi  LF269          ;branch C+Z=0 IRQ5
F266 : 7E FD 94   jmp  LFD94          ;jump 
;IRQ5 LF269:
F269 : 81 13      cmpa  #$13          ;compare A with 13h
F26B : 22 05      bhi  LF272          ;branch C+Z=0 IRQ6
F26D : 80 0F      suba  #$0F          ;sub A with 0Fh
F26F : 7E FE D0   jmp  LFED0          ;jump 
;IRQ6 LF272:
F272 : 81 17      cmpa  #$17          ;compare A with 17h
F274 : 22 05      bhi  LF27B          ;branch C+Z=0 IRQ7
F276 : 80 14      suba  #$14          ;sub A with 14h
F278 : 7E FF 64   jmp  LFF64          ;jump 
;IRQ7 LF27B:
F27B : 81 43      cmpa  #$43          ;compare A with 43h
F27D : 22 0D      bhi  LF28C          ;branch C+Z=0 IRQX2
F27F : 80 18      suba  #$18          ;sub A with 18h
F281 : 81 07      cmpa  #$07          ;compare A with 07h
F283 : 26 04      bne  LF289          ;branch Z=0 IRQX1
F285 : C6 03      ldab  #$03          ;load B with 03h
F287 : D7 62      stab  $62           ;store B in addr 62
;IRQX1 LF289:
F289 : 7E ED AB   jmp  LEDAB          ;jump 
;IRQX2 LF28C:
F28C : 7E F1 D0   jmp  LF1D0          ;jump CLRWAI
;*************************************;
; data called below
F28F : 04 20 01 01 
F293 : 07 23 2A F1 
;*************************************;
; pre-irq processing, jmptbl call
;*************************************;
;PREIRQ LF297
F297 : CE 00 7F   ldx #$007F          ;load X with 007Fh (ENDRAM)
F29A : 96 65      ldaa  $65           ;load A with addr 65
F29C : 27 03      beq  LF2A1          ;branch Z=0 below
F29E : 7E F1 EF   jmp  LF1EF          ;jump IRQC
;*************************************;
;LF2A1:
;*************************************;
F2A1 : 7F 00 6C   clr  $006C          ;clear addr 006C
F2A4 : 96 62      ldaa  $62           ;load A with addr 62
F2A6 : 81 03      cmpa  #$03          ;compare A with 03h
F2A8 : 26 03      bne  LF2AD          ;branch Z=0 
F2AA : 7E F1 D0   jmp  LF1D0          ;jump CLRWAI
;LF2AD:
F2AD : 96 66      ldaa  $66           ;load A with addr 66
;LF2AF:
F2AF : 27 FE      beq  LF2AF          ;branch Z=1
F2B1 : 81 01      cmpa  #$01          ;compare A with 01h
F2B3 : 26 2A      bne  LF2DF          ;branch Z=0 
;LF2B5:
F2B5 : CE 00 10   ldx  #$0010         ;load X with 0010h
F2B8 : DF 6E      stx  $6E            ;store X in addr 6E
F2BA : CE F2 8F   ldx  #$F28F         ;load X with F28Fh (data above)
F2BD : C6 04      ldab  #$04          ;load B with 04h
F2BF : BD EB 80   jsr  LEB80          ;jump sub TRANS
F2C2 : 96 6C      ldaa  $6C           ;load A with addr 6C
F2C4 : 26 04      bne  LF2CA          ;branch Z=0 
F2C6 : D6 63      ldab  $63           ;load B with addr 63
F2C8 : D7 12      stab  $12           ;store B in addr 12
;LF2CA:
F2CA : 86 01      ldaa  #$01          ;load A with 01h
F2CC : 97 62      staa  $62           ;store A in addr 62
F2CE : BD ED 2F   jsr  LED2F          ;jump sub (synth above)
F2D1 : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; data called below
F2D4 : 00 2F 01 30 08 
F2D9 : 00 10 08 20 FF 
F2DE : 01 
;*************************************;
; param (synth above)
;*************************************;
;LF2DF:
F2DF : 81 02      cmpa  #$02          ;compare A with 02h
;LF2E1:
F2E1 : 26 FE      bne  LF2E1          ;branch Z=0 here (*-2)
F2E3 : 96 62      ldaa  $62           ;load A with addr 62
F2E5 : 84 02      anda  #$02          ;and A with 02h
F2E7 : 27 03      beq  LF2EC          ;branch Z=1 
F2E9 : 7C 00 6C   inc  $006C          ;incr addr 006C
;LF2EC:
F2EC : CE F2 D4   ldx  #$F2D4         ;load X with F2D4h (data above)
F2EF : C6 0B      ldab  #$0B          ;load B with 0Bh (#11)
F2F1 : DF 68      stx  $68            ;store X in addr 68
F2F3 : DF 70      stx  $70            ;store X in addr 70
F2F5 : CE 00 00   ldx  #$0000         ;load X with 0000h
F2F8 : DF 6E      stx  $6E            ;store X in addr 6E
F2FA : DE 68      ldx  $68            ;load X with addr 68
F2FC : BD EB 80   jsr  LEB80          ;jump sub TRANS
F2FF : 7D 00 6C   tst  $006C          ;test addr 006C
F302 : 26 04      bne  LF308          ;branch Z=0
F304 : D6 64      ldab  $64           ;load B with addr 64
F306 : D7 00      stab  $00           ;store B in addr 00
;LF308:
F308 : 86 02      ldaa  #$02          ;load A with 02h
F30A : 97 62      staa  $62           ;store A in addr 62
F30C : BD ED B4   jsr  LEDB4          ;jump sub (synth above)
;LF30F:
F30F : 86 01      ldaa  #$01          ;load A with 01h
F311 : 97 6C      staa  $6C           ;store A in addr 6C
F313 : 4C         inca                ;incr A
F314 : 97 66      staa  $66           ;store A in addr 66
F316 : 20 D4      bra  LF2EC          ;branch always 
;*************************************;
; jmptbl call
;*************************************;
F318 : 86 01      ldaa  #$01          ;load A with 01h
F31A : 97 6C      staa  $6C           ;store A in addr 6C
F31C : 20 97      bra  LF2B5          ;branch always 
;*************************************;
; jmptbl call
;*************************************;
F31E : 7F 00 62   clr  $0062          ;clear addr 0062
F321 : BD EA 4F   jsr  LEA4F          ;jump sub
F324 : BD EA B5   jsr  LEAB5          ;jump sub
F327 : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; liten loaders + tilt jump table 1
;*************************************;
;LTJTBL
F32A : EC 49                          ;LTNCL1
F32C : F1 90                          ;TILT
F32E : EC 4E                          ;LTNCL2
F330 : EC 53                          ;LTNCL3
F332 : EC 58                          ;LTNCL4
F334 : EC 5D                          ;LTNCL5
;*************************************;
; fnoise #1 loader table call - jmptbl call
;*************************************;
;FN1CAL
F336 : CE EB 94   ldx  #$EB94         ;load X with EB94h (FN1TBL)
F339 : 20 03      bra  LF33E          ;branch always FLTJMP
;****;
; - jmptbl call
;***;
F33B : CE F3 2A   ldx  #$F32A         ;load X with F32Ah (LTJTBL)
;*************************************;
; fnoise #1, liten, tilt jump processor - jmptbl call
;*************************************;
;FLTJMP LF33E:
F33E : 7F 00 62   clr  $0062          ;clear addr 0062
F341 : 48         asla                ;arith shift left A
F342 : BD F0 4E   jsr  LF04E          ;jump sub ADDX
F345 : EE 00      ldx  $00,x          ;load X with X+00h
F347 : AD 00      jsr  $00,x          ;jump sub addr X+00h
F349 : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; jmptbl call
;*************************************;
F34C : 97 66      staa  $66           ;store A in addr 66
F34E : 97 6C      staa  $6C           ;store A in addr 6C
F350 : 81 01      cmpa  #$01          ;compare A with 01h
F352 : 26 03      bne  LF357          ;branch Z=0
F354 : 7E F2 B5   jmp  LF2B5          ;jump 
;LF357:
F357 : 81 02      cmpa  #$02          ;compare A with 02h
F359 : 26 03      bne  LF35E          ;branch Z=0
F35B : 7E F3 0F   jmp  LF30F          ;jump 
;LF35E:
F35E : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; jmptbl call
;*************************************;
F361 : 7F 00 62   clr  $0062          ;clear addr 0062
F364 : BD EC B6   jsr  LECB6          ;jump sub
F367 : BD EC CD   jsr  LECCD          ;jump sub
F36A : 7E F2 97   jmp  LF297          ;jump PREIRQ
;*************************************;
; jmptbl call
;*************************************;
F36D : 7F 00 65   clr  $0065          ;clear addr 0065
F370 : 7F 00 62   clr  $0062          ;clear addr 0062
;LF373:
F373 : BD F0 32   jsr  LF032          ;jump sub TMPROC
F376 : 84 03      anda  #$03          ;and A with 03h
F378 : D6 65      ldab  $65           ;load B with addr 65
F37A : C5 01      bitb  #$01          ;bit test B with 01h
F37C : 27 02      beq  LF380          ;branch Z=1
F37E : 84 02      anda  #$02          ;and A with 02h
;LF380:
F380 : 97 65      staa  $65           ;store A in addr 65
F382 : 26 0C      bne  LF390          ;branch Z=0
F384 : BD EC B6   jsr  LECB6          ;jump sub
F387 : BD F0 32   jsr  LF032          ;jump sub TMPROC
F38A : 84 FF      anda  #$FF          ;and A with FFh
F38C : 97 04      staa  $04           ;store A in addr 04
F38E : 20 03      bra  LF393          ;branch always 
;LF390:
F390 : BD EC B6   jsr  LECB6          ;jump sub 
;LF393:
F393 : BD EC CD   jsr  LECCD          ;jump sub 
F396 : 20 DB      bra  LF373          ;branch always 
;*************************************;
; 
;*************************************;
;LF398
F398 : 7F 00 62   clr  $0062          ;clear addr 0062
F39B : CE F3 C2   ldx  #$F3C2         ;load X with F3C2h (
F39E : 48         asla                ;arith shift left A
F39F : 1B         aba                 ;add B to A
F3A0 : BD F0 4E   jsr  LF04E          ;jump sub ADDX
F3A3 : E6 00      ldab  $00,x         ;load B with X+00h
F3A5 : A6 01      ldaa  $01,x         ;load A with X+01h
F3A7 : 97 45      staa  $45           ;store A in addr 45
F3A9 : 97 46      staa  $46           ;store A in addr 46
F3AB : A6 02      ldaa  $02,x         ;load A with X+02h
F3AD : 97 48      staa  $48           ;store A in addr 48
F3AF : 2A 0C      bpl  LF3BD          ;branch N=0 
F3B1 : 96 40      ldaa  $40           ;load A with addr 40
F3B3 : 4A         deca                ;decr A
F3B4 : 27 07      beq  LF3BD          ;branch Z=1 
F3B6 : 11         cba                 ;compare B with A
F3B7 : 2A 04      bpl  LF3BD          ;branch N=0
F3B9 : 97 40      staa  $40           ;store A in addr 40
F3BB : 20 02      bra  LF3BF          ;branch always 
;LF3BD:
F3BD : D7 40      stab  $40           ;store B in addr 40
;LF3BF:
F3BF : 7E ED A5   jmp  LEDA5          ;jump 
;*************************************;
;
F3C2 : 20 04    "  "    bra  LF3C8
        ;
F3C4 : 00 1E    "  "    db  $00, $1E
        ;
F3C6 : 08    " "    inx
F3C7 : 01    " "    nop
        ;
F3C8        LF3C8:
F3C8 : 13    " "    db  $13
        ;
F3C9 : 09    " "    dex
F3CA : 01    " "    nop
F3CB : 20 04    "  "    bra  LF3D1
        ;
F3CD : 80 
;*************************************;
; jmptbl call
;*************************************;
F3CE : 7F 00 62   clr  $0062          ;clear addr 0062
;LF3D1:
F3D1 : CE ED 2C   ldx  #$ED2C         ;load X with ED2Ch (
F3D4 : DF 6A      stx  $6A            ;store X in addr 6A
F3D6 : 48         asla                ;arith shift left A
F3D7 : 9B 6B      adda  $6B           ;add A with addr 6B
F3D9 : 24 03      bcc  LF3DE          ;branch C=0 
F3DB : 7C 00 6A   inc  $006A          ;incr addr 006A
;LF3DE:
F3DE : 97 6B      staa  $6B           ;store B in addr 6B
F3E0 : DE 6A      ldx  $6A            ;load X with addr 6A
F3E2 : EE 00      ldx  $00,x          ;load X with X+00h
F3E4 : DF 70      stx  $70            ;store X in addr 70
F3E6 : 7E ED 2C   jmp  LED2C          ;jump 
;
;LF3E9:
F3E9 : 7E F1 D0   jmp  LF1D0          ;jump CLRWAI
;*************************************;
; params - jmptbl call
;*************************************;
F3EC : CE E9 83   ldx  #$E983         ;load X with E983h (RESRTS)
F3EF : 7F 00 62   clr  $0062          ;clear addr 0062
F3F2 : 4F         clra                ;clear A
F3F3 : 58         aslb                ;arith shift left B
F3F4 : 89 00      adca  #$00          ;add C+A + 00h 
F3F6 : 48         asla                ;arith shift left A
F3F7 : 58         aslb                ;arith shift left B
F3F8 : 89 00      adca  #$00          ;add C+A + 00h 
F3FA : 48         asla                ;arith shift left A
F3FB : 58         aslb                ;arith shift left B
F3FC : 89 00      adca  #$00          ;add C+A + 00h 
F3FE : BD F0 5C   jsr  LF05C          ;jump sub ADDBX
F401 : 8C E9 83   cpx  #$E983         ;compare X with E983h (RESRTS)
F404 : 27 E3      beq  LF3E9          ;branch Z=1 (jump to CLRWAI)
; load and store 7 params from X+00h
F406 : A6 00      ldaa  $00,x         ;load A with X+00h
F408 : 97 6E      staa  $6E           ;store A in addr 6E
F40A : A6 01      ldaa  $01,x         ;load A with X+01h
F40C : 97 6F      staa  $6F           ;store A in addr 6F
F40E : A6 02      ldaa  $02,x         ;load A with X+02h
F410 : 97 70      staa  $70           ;store A in addr 70
F412 : A6 03      ldaa  $03,x         ;load A with X+03h
F414 : 97 71      staa  $71           ;store A in addr 71
F416 : A6 04      ldaa  $04,x         ;load A with X+04h
F418 : 97 72      staa  $72           ;store A in addr 72
F41A : A6 05      ldaa  $05,x         ;load A with X+05h
F41C : 97 73      staa  $73           ;store A in addr 73
F41E : A6 06      ldaa  $06,x         ;load A with X+06h
F420 : 97 74      staa  $74           ;store A in addr 74
F422 : A6 07      ldaa  $07,x         ;load A with X+07h
F424 : 97 75      staa  $75           ;store A in addr 75
F426 : DE 6E      ldx  $6E            ;load X with addr 6E
F428 : BD E9 83   jsr  LE983          ;jump sub RESRTS
F42B : 7F 00 6D   clr  $006D          ;clear addr 006D
F42E : 7F 00 6C   clr  $006C          ;clear addr 006C
F431 : 7F 00 59   clr  $0059          ;clear addr 0059
F434 : 7F 00 5A   clr  $005A          ;clear addr 005A
F437 : 7E E9 84   jmp  LE984          ;jump PREJMP
;*************************************;
; jmptbl call
;*************************************;
F43A : 7F 00 62   clr  $0062          ;clear addr 0062
F43D : 4F         clra                ;clear A
F43E : 58         aslb                ;arith shift left B
F43F : 89 00      adca  #$00          ;add C+A + 00h
F441 : 48         asla                ;arith shift left A
F442 : 58         aslb                ;arith shift left B
F443 : 89 00      adca  #$00          ;add C+A + 00h
F445 : CE F6 5E   ldx  #$F65E         ;load X with F65Eh (data)
F448 : BD F0 5C   jsr  LF05C          ;jump sub ADDBX
F44B : 8C F7 2E   cpx  #$F72E         ;compare X with F72Eh (GWVTAB)
F44E : 27 99      beq  LF3E9          ;branch Z=1 (jump CLRWAI)
F450 : A6 00      ldaa  $00,x         ;load A with X+00h
F452 : 97 6E      staa  $6E           ;store A in addr 6E
F454 : A6 01      ldaa  $01,x         ;load A with X+01h
F456 : 97 6F      staa  $6F           ;store A in addr 6F
F458 : A6 02      ldaa  $02,x         ;load A with X+02h
F45A : 97 70      staa  $70           ;store A in addr 70
F45C : A6 03      ldaa  $03,x         ;load A with X+03h
F45E : 97 71      staa  $71           ;store A in addr 71
F460 : A6 04      ldaa  $04,x         ;load A with X+04h
F462 : BD F0 9C   jsr  LF09C          ;jump sub 
F465 : 7F 00 6D   clr  $006D          ;clear addr 006D
F468 : 7F 00 6C   clr  $006C          ;clear addr 006C
F46B : 7F 00 74   clr  $0074          ;clear addr 0074
F46E : 7F 00 75   clr  $0075          ;clear addr 0075
F471 : 7E E9 8A   jmp  LE98A          ;jump 
;*************************************;
;Special Routine Jump Table
;*************************************;
;JMPTBL
F474 : F3 1E                          ;val
F476 : F3 36                          ;FN1CAL
F478 : F3 EC                          ;val
F47A : F4 3A                          ;val
F47C : EC 49                          ;val 
F47E : EC 74                          ;val
F480 : EC 7C                          ;val
F482 : F3 61                          ;val
F484 : F3 CE                          ;val
F486 : F3 3B                          ;val
F488 : F3 18                          ;val
F48A : F3 6D                          ;val
F48C : F3 4C                          ;val
F48E : F2 97                          ;val
;*************************************;
; irq data
F490 : 07    "   "    sbcb  X9707
        ;
F491 : 00 00    "  "    db  $00, $00
        ;
F493 : 01    " "    nop
        ;
F494 : 00 00    "  "    db  $00, $00
        ;
F496 : 01    " "    nop
F497 : 01    " "    nop
        ;
F498 : 00 05 00 00  "    "    db  $00, $05, $00, $00
F49C : 03    " "    db  $03
        ;
F49D : 01    " "    nop
        ;
F49E : 00 00 00 00  "    "    db  $00, $00, $00, $00
F4A2 : 00    " "    db  $00
        ;
F4A3 : 01    " "    nop
        ;
F4A4 : 00 00 02 00  "    "    db  $00, $00, $02, $00
        ;
F4A8 : 09    " "    dex
        ;
F4A9 : 00 00    "  "    db  $00, $00
        ;
F4AB : 09    " "    dex
F4AC : 01    " "    nop
        ;
F4AD : 00    " "    db  $00
        ;
F4AE : 0C    " "    clc
        ;
F4AF : 00 00    "  "    db  $00, $00
        ;
F4B1 : 0C    " "    clc
F4B2 : 01    " "    nop
        ;
F4B3 : 00    " "    db  $00
        ;
F4B4 : 0C    " "    clc
        ;
F4B5 : 02 00    "  "    db  $02, $00
        ;
F4B7 : 0D    " "    sec
        ;
F4B8 : 00 00 03 02  "    "    db  $00, $00, $03, $02
F4BC : 00 03 03 00  "    "    db  $00, $03, $03, $00
F4C0 : 03 04 00 03  "    "    db  $03, $04, $00, $03
F4C4 : 05 00 03    "   "    db  $05, $00, $03
        ;
F4C7 : 06    " "    tap
        ;
F4C8 : 00 03    "  "    db  $00, $03
        ;
F4CA : 07    " "    tpa
        ;
F4CB : 00 03    "  "    db  $00, $03
        ;
F4CD : 08    " "    inx
        ;
F4CE : 00 03    "  "    db  $00, $03
        ;
F4D0 : 09    " "    dex
        ;
F4D1 : 00 03    "  "    db  $00, $03
        ;
F4D3 : 0A    " "    clv
        ;
F4D4 : 00 03    "  "    db  $00, $03
        ;
F4D6 : 0B    " "    sev
        ;
F4D7 : 00 03    "  "    db  $00, $03
        ;
F4D9 : 0C    " "    clc
        ;
F4DA : 00 03    "  "    db  $00, $03
        ;
F4DC : 0D    " "    sec
        ;
F4DD : 00 03    "  "    db  $00, $03
        ;
F4DF : 0E    " "    cli
        ;
F4E0 : 00 03    "  "    db  $00, $03
        ;
F4E2 : 0F    " "    sei
        ;
F4E3 : 00 03    "  "    db  $00, $03
        ;
F4E5 : 10    " "    sba
        ;
F4E6 : 00 03    "  "    db  $00, $03
        ;
F4E8 : 11    " "    cba
        ;
F4E9 : 00 03 12 00  "    "    db  $00, $03, $12, $00
F4ED : 03 13 00 03  "    "    db  $03, $13, $00, $03
F4F1 : 14 00 03 15  "    "    db  $14, $00, $03, $15
F4F5 : 00    " "    db  $00
F4F6        XF4F6:
F4F6 : 03    " "    db  $03
        ;
F4F7 : 16    " "    tab
        ;
F4F8 : 00 03    "  "    db  $00, $03
        ;
F4FA : 17    " "    tba
        ;
F4FB : 00 03 18 00  "    "    db  $00, $03, $18, $00
F4FF : 03    " "    db  $03
        ;
F500 : 19    " "    daa
        ;
F501 : 00 03 1A 00  "    "    db  $00, $03, $1A, $00
F505 : 03    " "    db  $03
        ;
F506 : 1B    " "    aba
        ;
F507        XF507:
F507 : 00 03 1C 00  "    "    db  $00, $03, $1C, $00
F50B : 03 1D 00 03  "    "    db  $03, $1D, $00, $03
F50F        XF50F:
F50F : 1E 00 03 1F  "    "    db  $1E, $00, $03, $1F
F513 : 00 03    "  "    db  $00, $03
        ;
F515 : 20 00    "  "    bra  LF517
        ;
F517        LF517:
F517 : 03 21 00 03  " !  "    db  $03, $21, $00, $03
        ;
F51B : 22 00    "" "    bhi  LF51D
        ;
F51D        LF51D:
F51D : 03    " "    db  $03
        ;
F51E : 23 00    "# "    bls  LF520
        ;
F520        LF520:
F520 : 03    " "    db  $03
        ;
F521 : 24 00    "$ "    bcc  LF523
        ;
F523        LF523:
F523 : 03    " "    db  $03
        ;
F524 : 25 00    "% "    bcs  LF526
        ;
F526        LF526:
F526 : 03    " "    db  $03
        ;
F527 : 26 00    "& "    bne  LF529
        ;
F529        LF529:
F529 : 03    " "    db  $03
        ;
F52A        XF52A:
F52A : 27 00    "' "    beq  LF52C
        ;
F52C        LF52C:
F52C : 03    " "    db  $03
        ;
F52D : 28 00    "( "    bvc  LF52F
        ;
F52F        LF52F:
F52F : 03    " "    db  $03
        ;
F530 : 29 00    ") "    bvs  LF532
        ;
F532        LF532:
F532 : 03    " "    db  $03
        ;
F533 : 2A 00    "* "    bpl  LF535
        ;
F535        LF535:
F535 : 03    " "    db  $03
        ;
F536 : 2B 00    "+ "    bmi  LF538
        ;
F538        LF538:
F538 : 03    " "    db  $03
        ;
F539 : 2C 00    ", "    bge  LF53B
        ;
F53B        LF53B:
F53B : 03    " "    db  $03
        ;
F53C : 2D 00    "- "    blt  LF53E
        ;
F53E        LF53E:
F53E : 03    " "    db  $03
        ;
F53F : 2E 00    ". "    bgt  LF541
        ;
F541        LF541:
F541 : 03    " "    db  $03
        ;
F542 : 2F 00    "/ "    ble  LF544
        ;
F544        LF544:
F544 : 03    " "    db  $03
        ;
F545 : 30    "0"    tsx
        ;
F546 : 00 03    "  "    db  $00, $03
        ;
F548 : 31    "1"    ins
        ;
F549 : 00    " "    db  $00
        ;
F54A : 09    " "    dex
        ;
F54B : 02 00    "  "    db  $02, $00
        ;
F54D : 09    " "    dex
        ;
F54E : 03    " "    db  $03
F54F        XF54F:
F54F : 00    " "    db  $00
        ;
F550 : 09    " "    dex
        ;
F551 : 04 00    "  "    db  $04, $00
        ;
F553 : 09    " "    dex
        ;
F554 : 05 00 00 00  "    "    db  $05, $00, $00, $00
        ;
F558 : FF 00 F5    "   "    stx  X00F5
F55B : 58    "X"    aslb
F55C : 01    " "    nop
F55D : D4 00    "  "    andb  X0000
        ;
F55F : 00 02    "  "    db  $00, $02
        ;
F561 : D4 00    "  "    andb  X0000
        ;
F563 : 00 03    "  "    db  $00, $03
        ;
F565 : D4 00    "  "    andb  X0000
        ;
F567 : 00 04    "  "    db  $00, $04
        ;
F569 : D4 00    "  "    andb  X0000
        ;
F56B : 00 05    "  "    db  $00, $05
        ;
F56D : D4 00    "  "    andb  X0000
        ;
F56F : 00    " "    db  $00
        ;
F570 : 06    " "    tap
F571 : D4 00    "  "    andb  X0000
        ;
F573 : 00    " "    db  $00
        ;
F574 : 07    " "    tpa
F575 : D4 00    "  "    andb  X0000
        ;
F577 : 00    " "    db  $00
;
F578 : 08    " "    inx
F579 : D4 00    "  "    andb  X0000
        ;
F57B : 00    " "    db  $00
        ;
F57C : 09    " "    dex
F57D : D4 00    "  "    andb  X0000
        ;
F57F : 00    " "    db  $00
        ;
F580 : 0A    " "    clv
F581 : D4 00    "  "    andb  X0000
        ;
F583 : 00    " "    db  $00
        ;
F584 : 0B    " "    sev
F585 : D4 00    "  "    andb  X0000
        ;
F587 : 00    " "    db  $00
        ;
F588 : 0C    " "    clc
F589 : D4 00    "  "    andb  X0000
        ;
F58B : 00    " "    db  $00
        ;
F58C : 0D    " "    sec
F58D : D4 00    "  "    andb  X0000
        ;
F58F : 00    " "    db  $00
        ;
F590 : 0E    " "    cli
F591 : D4 00    "  "    andb  X0000
        ;
F593 : 00    " "    db  $00
        ;
F594 : 0F    " "    sei
F595 : D4 00    "  "    andb  X0000
        ;
F597 : 00    " "    db  $00
        ;
F598 : 10    " "    sba
F599 : D4 00    "  "    andb  X0000
        ;
F59B : 00    " "    db  $00
        ;
F59C : 11    " "    cba
F59D : D4 00    "  "    andb  X0000
        ;
F59F : 00 12    "  "    db  $00, $12
        ;
F5A1 : D4 00    "  "    andb  X0000
        ;
F5A3 : 00 13    "  "    db  $00, $13
        ;
F5A5 : D4 00    "  "    andb  X0000
        ;
F5A7 : 00 14    "  "    db  $00, $14
        ;
F5A9 : D4 00    "  "    andb  X0000
        ;
F5AB : 00 15    "  "    db  $00, $15
        ;
F5AD : D4 00    "  "    andb  X0000
        ;
F5AF : 00    " "    db  $00
        ;
F5B0 : 16    " "    tab
F5B1 : D4 00    "  "    andb  X0000
        ;
F5B3 : 00    " "    db  $00
        ;
F5B4 : 17    " "    tba
F5B5 : D4 00    "  "    andb  X0000
        ;
F5B7 : 00 18    "  "    db  $00, $18
        ;
F5B9 : D4 00    "  "    andb  X0000
        ;
F5BB : 00    " "    db  $00
        ;
F5BC : 19    " "    daa
F5BD : D4 00    "  "    andb  X0000
        ;
F5BF        XF5BF:
F5BF : 00 1A    "  "    db  $00, $1A
        ;
F5C1 : D4 00    "  "    andb  X0000
        ;
F5C3 : 00    " "    db  $00
        ;
F5C4 : 1B    " "    aba
F5C5 : D4 00    "  "    andb  X0000
        ;
F5C7 : 00 1C    "  "    db  $00, $1C
        ;
F5C9 : D4 00    "  "    andb  X0000
        ;
F5CB : 00 1D    "  "    db  $00, $1D
        ;
F5CD : D4 00    "  "    andb  X0000
        ;
F5CF : 00 1E    "  "    db  $00, $1E
        ;
F5D1 : D4 00    "  "    andb  X0000
        ;
F5D3 : 00 1F    "  "    db  $00, $1F
        ;
F5D5 : D4 00    "  "    andb  X0000
        ;
F5D7 : 00    " "    db  $00
        ;
F5D8 : 20 D4    "  "    bra  LF5AE
        ;
F5DA        LF5DA:
F5DA : 00 00 21    "  !"    db  $00, $00, $21
        ;
F5DD : D4 00    "  "    andb  X0000
        ;
F5DF : 00    " "    db  $00
        ;
F5E0 : 22 D4    "" "    bhi  LF5B6
        ;
F5E2        LF5E2:
F5E2 : 00 00    "  "    db  $00, $00
        ;
F5E4 : 23 D4    "# "    bls  LF5BA
        ;
F5E6        LF5E6:
F5E6 : 00 00    "  "    db  $00, $00
        ;
F5E8 : 24 D4    "$ "    bcc  LF5BE
        ;
F5EA        LF5EA:
F5EA : 00 00    "  "    db  $00, $00
        ;
F5EC : 25 D4    "% "    bcs  LF5C2
        ;
F5EE : 00 00    "  "    db  $00, $00
        ;
F5F0        XF5F0:
F5F0 : 26 D4    "& "    bne  LF5C6
        ;
F5F2 : 00 00    "  "    db  $00, $00
        ;
F5F4 : 27 D4    "' "    beq  LF5CA
        ;
F5F6 : 00 00    "  "    db  $00, $00
        ;
F5F8 : 28 D4    "( "    bvc  LF5CE
        ;
F5FA : 00 00    "  "    db  $00, $00
        ;
F5FC : 29 D4    ") "    bvs  LF5D2
        ;
F5FE : 00    " "    db  $00
F5FF        XF5FF:
F5FF : 00    " "    db  $00
        ;
F600 : 2A D4    "* "    bpl  LF5D6
        ;
F602 : 00 00    "  "    db  $00, $00
        ;
F604 : 2B D4    "+ "    bmi  LF5DA
        ;
F606 : 00 00    "  "    db  $00, $00
        ;
F608 : 2C D4    ", "    bge  LF5DE
        ;
F60A : 00 00    "  "    db  $00, $00
        ;
F60C : 2D D4    "- "    blt  LF5E2
        ;
F60E : 00 00    "  "    db  $00, $00
        ;
F610 : 2E D4    ". "    bgt  LF5E6
        ;
F612 : 00 00    "  "    db  $00, $00
        ;
F614 : 2F D4    "/ "    ble  LF5EA
        ;
F616 : 00 00    "  "    db  $00, $00
        ;
F618 : 30    "0"    tsx
F619 : D4 00    "  "    andb  X0000
        ;
F61B : 00    " "    db  $00
        ;
F61C : 31    "1"    ins
F61D : D4 00    "  "    andb  X0000
        ;
F61F : 00    " "    db  $00
        ;
F620 : 32    "2"    pula
F621 : D4 00    "  "    andb  X0000
        ;
F623 : 00 04 04 04  "    "    db  $00, $04, $04, $04
F627 : 1E 00 00    "   "    db  $1E, $00, $00
        ;
F62A : 60 04    "` "    neg  $04,x
F62C : 60 08    "` "    neg  $08,x
F62E : 60 18    "` "    neg  $18,x
        ;
F630 : 00 00    "  "    db  $00, $00
        ;
F632 : 01    " "    nop
F633 : 20 02    "  "    bra  LF637
F635 : 20 03    "  "    bra  LF63A
        ;
F637        LF637:
F637 : 1D 02    "  "    db  $1D, $02
        ;
F639 : 20 04    "  "    bra  LF63F
        ;
F63B : 10    " "    sba
        ;
F63C : 03    " "    db  $03
        ;
F63D : 20 05    "  "    bra  LF644
        ;
F63F        LF63F:
F63F : 0A    " "    clv
F640 : 01    " "    nop
F641 : 40    "@"    nega
        ;
F642 : 00 00    "  "    db  $00, $00
        ;
F644        LF644:
F644 : 08    " "    inx
        ;
F645 : 02 00 00    "   "    db  $02, $00, $00
        ;
F648 : D4 00    "  "    andb  X0000
        ;
F64A : 00    " "    db  $00
        ;
F64B : 01    " "    nop
F64C : EF 01    "  "    stx  $01,x
        ;
F64E : 00    " "    db  $00
        ;
F64F : 77 00 21    "w !"    asr  X0021
        ;
F652 : 02    " "    db  $02
        ;
F653 : FF 0E 00    "   "    stx  X0E00
F656 : 01    " "    nop
F657 : 01    " "    nop
        ;
F658 : 00 D3    "  "    db  $00, $D3
        ;
F65A : 11    " "    cba
        ;
F65B : 00    " "    db  $00
        ;
F65C : 40    "@"    nega
        ;
F65D : 00    " "    db  $00
;*************************************;
;L565E data table  
F65E : F5 78 F6    " x "    bitb  X78F6
F661 : 44    "D"    lsra
F662 : F5 58 F6    " X "    bitb  X58F6
F665 : 51    "Q"    db  $51
F666 : F5 5C F6    " \ "    bitb  X5CF6
F669 : 44    "D"    lsra
F66A : F5 60 F6    " ` "    bitb  X60F6
F66D : 44    "D"    lsra
F66E : F5 64 F6    " d "    bitb  X64F6
F671 : 44    "D"    lsra
F672 : F5 68 F6    " h "    bitb  X68F6
F675 : 44    "D"    lsra
F676 : F5 6C F6    " l "    bitb  X6CF6
F679 : 44    "D"    lsra
F67A : F5 70 F6    " p "    bitb  X70F6
F67D : 44    "D"    lsra
F67E : F5 74 F6    " t "    bitb  X74F6
F681 : 44    "D"    lsra
F682 : F5 78 F6    " x "    bitb  X78F6
F685 : 44    "D"    lsra
F686 : F5 7C F6    " | "    bitb  X7CF6
F689 : 44    "D"    lsra
F68A : F5 80 F6    "   "    bitb  X80F6
F68D : 44    "D"    lsra
F68E : F5 84 F6    "   "    bitb  X84F6
F691 : 44    "D"    lsra
F692 : F5 88 F6    "   "    bitb  X88F6
F695 : 44    "D"    lsra
F696 : F5 8C F6    "   "    bitb  X8CF6
F699 : 44    "D"    lsra
F69A : F5 90 F6    "   "    bitb  X90F6
F69D : 44    "D"    lsra
F69E : F5 94 F6    "   "    bitb  X94F6
F6A1 : 44    "D"    lsra
F6A2 : F5 98 F6    "   "    bitb  X98F6
F6A5 : 44    "D"    lsra
F6A6 : F5 9C F6    "   "    bitb  X9CF6
F6A9 : 44    "D"    lsra
F6AA : F5 A0 F6    "   "    bitb  XA0F6
F6AD : 44    "D"    lsra
F6AE : F5 A4 F6    "   "    bitb  XA4F6
F6B1 : 44    "D"    lsra
F6B2 : F5 A8 F6    "   "    bitb  XA8F6
F6B5 : 44    "D"    lsra
F6B6 : F5 AC F6    "   "    bitb  XACF6
F6B9 : 44    "D"    lsra
F6BA : F5 B0 F6    "   "    bitb  XB0F6
F6BD : 44    "D"    lsra
F6BE : F5 B4 F6    "   "    bitb  XB4F6
F6C1 : 44    "D"    lsra
F6C2 : F5 B8 F6    "   "    bitb  XB8F6
F6C5 : 44    "D"    lsra
F6C6 : F5 BC F6    "   "    bitb  XBCF6
F6C9 : 44    "D"    lsra
F6CA : F5 C0 F6    "   "    bitb  XC0F6
F6CD : 44    "D"    lsra
F6CE : F5 C4 F6    "   "    bitb  XC4F6
F6D1 : 44    "D"    lsra
F6D2 : F5 C8 F6    "   "    bitb  XC8F6
F6D5 : 44    "D"    lsra
F6D6 : F5 CC F6    "   "    bitb  XCCF6
F6D9 : 44    "D"    lsra
F6DA : F5 D0 F6    "   "    bitb  XD0F6
F6DD : 44    "D"    lsra
F6DE : F5 D4 F6    "   "    bitb  XD4F6
F6E1 : 44    "D"    lsra
F6E2 : F5 D8 F6    "   "    bitb  XD8F6
F6E5 : 44    "D"    lsra
F6E6 : F5 DC F6    "   "    bitb  XDCF6
F6E9 : 44    "D"    lsra
F6EA : F5 E0 F6    "   "    bitb  XE0F6
F6ED : 44    "D"    lsra
F6EE : F5 E4 F6    "   "    bitb  XE4F6
F6F1 : 44    "D"    lsra
F6F2 : F5 E8 F6    "   "    bitb  XE8F6
F6F5 : 44    "D"    lsra
F6F6 : F5 EC F6    "   "    bitb  XECF6
F6F9 : 44    "D"    lsra
F6FA : F5 F0 F6    "   "    bitb  XF0F6
F6FD : 44    "D"    lsra
F6FE : F5 F4 F6    "   "    bitb  XF4F6
F701 : 44    "D"    lsra
F702 : F5 F8 F6    "   "    bitb  XF8F6
F705 : 44    "D"    lsra
F706 : F5 FC F6    "   "    bitb  XFCF6
F709 : 44    "D"    lsra
F70A : F6 00 F6    "   "    ldab  X00F6
F70D : 44    "D"    lsra
F70E : F6 04 F6    "   "    ldab  X04F6
F711 : 44    "D"    lsra
F712 : F6 08 F6    "   "    ldab  X08F6
F715 : 44    "D"    lsra
F716 : F6 0C F6    "   "    ldab  X0CF6
F719 : 44    "D"    lsra
F71A : F6 10 F6    "   "    ldab  X10F6
F71D : 44    "D"    lsra
F71E : F6 14 F6    "   "    ldab  X14F6
F721 : 44    "D"    lsra
F722 : F6 18 F6    "   "    ldab  X18F6
F725 : 44    "D"    lsra
F726 : F6 1C F6    "   "    ldab  X1CF6
F729 : 44    "D"    lsra
F72A : F6 20 F6    "   "    ldab  X20F6
F72D : 44    "D"    lsra
;*************************************;
;GWave table, 1st byte wavelength
;*************************************;
;GWVTAB
F72E : 1C                             ;(28)
F72F : 80 40 29 1B 10 09 06 04        ;
F737 : 07 0C 12 1E 30 49 A4 C9        ;
F73F : DF EB F6 FB FF FF FB F5        ;
F747 : EA DD C7 9B                    ;
;
F74B : 10                             ;MW1
F74C : 00 F4 00 E8 00 DC 00 E2        ;
F754 : 00 DC 00 E8 00 F4 00 00        ;
;
F75C : 48                             ;GS72
F75D : 8A 95 A0 AB B5 BF C8 D1        ;
F765 : DA E1 E8 EE F3 F7 FB FD        ;
F76D : FE FF FE FD FB F7 F3 EE        ;
F775 : E8 E1 DA D1 C8 BF B5 AB        ;
F77D : A0 95 8A 7F 75 6A 5F 54        ;
F785 : 4A 40 37 2E 25 1E 17 11        ;
F78D : 0C 08 04 02 01 00 01 02        ;
F795 : 04 08 0C 11 17 1E 25 2E        ;
F79D : 37 40 4A 54 5F 6A 75 7F        ;
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
F7A5 : F1 10 00 00 00 4D 00           ;(77)
;
F7AC : A3 11 00 01 01 10 4F           ;(16)
;
F7B3 : 11 02 11 01 0F 01 5F           ;(1)
;*************************************;
;GWAVE FREQ PATTERN TABLE
;*************************************; 
;GFRTAB
F7BA : 01 01 01 02 02 03 03 04        ;
F7C2 : 02 02 03 03 04 04 05 03        ;
F7CA : 03 03 04 04 05 05 06 02        ;
F7D2 : 02 02 03 03 04 04 05 03        ;
F7DA : 03 03 04 04 05 05 06 04        ;
F7E2 : 04 04 05 05 06 06 07 07        ;
F7EA : 07 07 08 08 09 09 0A 0C        ;
F7F2 : 0C 0C 0D 0D 0E 0E 0F 06        ;
F7FA : 06 06 07 07 08 08 09           ;
;
F801 : 02                             ;
;
F802 : 02 02 03 03 04 04 05 14        ;
F80A : 18 20 30 40 50 40 30 20        ;
;
F812 : 10 0C 0A 08 07 06 05 08        ;
;*************************************;
;VARI VECTORS (11 bytes not usual 9)
;*************************************;
;VVECT EQU *
F81A : 00 04 06 08 81 02 00 FF FF     ;
F823 : 04 7E                          ;
;*************************************;
;zero padding
F825 : FF FF FF FF FF FF 
F82B : FF FF FF FF FF FF 
F831 : FF FF FF FF FF FF 
F837 : FF FF FF FF FF FF 
F83D : FF FF FF FF FF FF 
F843 : FF FF FF FF FF FF 
F849 : FF FF FF FF FF FF 
F84F : FF FF FF FF FF FF 
F855 : FF FF FF FF FF FF 
F85B : FF FF FF FF FF FF 
F861 : FF FF FF FF FF FF 
F867 : FF FF FF FF FF FF 
F86D : FF FF FF FF FF FF 
F873 : FF FF FF FF FF FF 
F879 : FF FF FF FF FF FF 
F87F : FF FF FF FF FF FF 
F885 : FF FF FF FF FF FF 
F88B : FF FF FF FF FF FF 
F891 : FF FF FF FF FF FF 
F897 : FF FF FF FF FF FF 
;*************************************;
; SYNTH
;*************************************;
;
F89D : CE F9 2D   ldx  #$F92D         ;load X with F92Dh
F8A0 : 16         tab                 ;transfer A to B
F8A1 : 86 09      ldaa  #$09          ;load A with 09h
F8A3 : BD FF EF   jsr  LFFEF          ;jump sub (jump to TRNSLD)
F8A6 : CE 00 00   ldx  #$0000         ;load X with 0000h
F8A9 : DF 11      stx  $11            ;store X in addr 11
F8AB : DF 13      stx  $13            ;store X in addr 13
F8AD : 96 00      ldaa  $00           ;load A with addr 00
F8AF : 97 0F      staa  $0F           ;store A in addr 0F
F8B1 : 96 01      ldaa  $01           ;load A with addr 01
F8B3 : 97 10      staa  $10           ;store A in addr 10
F8B5 : 96 02      ldaa  $02           ;load A with addr 02
F8B7 : 97 15      staa  $15           ;store A in addr 15
F8B9 : 96 03      ldaa  $03           ;load A with addr 03
F8BB : 97 16      staa  $16           ;store A in addr 16
F8BD : 96 04      ldaa  $04           ;load A with addr 04
F8BF : 97 17      staa  $17           ;store A in addr 17
F8C1 : DE 07      ldx  $07            ;load X with addr 07
F8C3 : DF 0D      stx  $0D            ;store X in addr 0D
F8C5 : 96 05      ldaa  $05           ;load A with addr 05
F8C7 : 97 0B      staa  $0B           ;store A in addr 0B
F8C9 : 96 06      ldaa  $06           ;load A with addr 06
F8CB : 97 0C      staa  $0C           ;store A in addr 0C
F8CD : CE 55 AA   ldx  #$55AA         ;load X with 55AAh (walsh-like sqr wave?)
F8D0 : DF 09      stx  $09            ;store X in addr 09
F8D2 : D6 0E      ldab  $0E           ;load B with addr 0E
;LF8D4:
F8D4 : 96 0A      ldaa  $0A           ;load A with addr 0A
F8D6 : 44         lsra                ;logic shift right A
F8D7 : 44         lsra                ;logic shift right A
F8D8 : 44         lsra                ;logic shift right A
F8D9 : 98 0A      eora  $0A           ;exclusive or A with addr 0A
F8DB : 44         lsra                ;logic shift right A
F8DC : 76 00 09   ror  $0009          ;rotate right addr 0009
F8DF : 76 00 0A   ror  $000A          ;rotate right addr 000A
F8E2 : 96 0B      ldaa  $0B           ;load A with addr 0B
F8E4 : 24 01      bcc  LF8E7          ;branch C=0
F8E6 : 4F         clra                ;clear A
;LF8E7:
F8E7 : DE 13      ldx  $13            ;load X with addr 13
F8E9 : AB 18      adda  $18,x         ;add A with X+18h (#24)
F8EB : 46         rora                ;rotate right A
F8EC : DE 11      ldx  $11            ;load X with addr 11
F8EE : A7 18      staa  $18,x         ;store A in addr X+18h
F8F0 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
F8F3 : 96 12      ldaa  $12           ;load A with addr 12
F8F5 : 4C         inca                ;incr A
F8F6 : 84 3F      anda  #$3F          ;and A with 3Fh
F8F8 : 97 12      staa  $12           ;store A in addr 12
F8FA : 90 15      suba  $15           ;sub A with addr 15
F8FC : 84 3F      anda  #$3F          ;and A with 3Fh
F8FE : 97 14      staa  $14           ;store A in addr 14
F900 : 96 0F      ldaa  $0F           ;load A with addr 0F
;LF902:
F902 : 4A         deca                ;decr A
F903 : 26 FD      bne  LF902          ;branch Z=0
F905 : 5A         decb                ;decr B
F906 : 26 CC      bne  LF8D4          ;branch Z=0
F908 : 7A 00 0D   dec  $000D          ;decr addr 000D
F90B : 2A C7      bpl  LF8D4          ;branch N=0
F90D : 96 07      ldaa  $07           ;load A with addr 07
F90F : 97 0D      staa  $0D           ;store A in addr 0D
F911 : D6 0E      ldab  $0E           ;load B with addr 0E
F913 : 96 0F      ldaa  $0F           ;load A with addr 0F
F915 : 9B 10      adda  $10           ;add A with addr 10
F917 : 97 0F      staa  $0F           ;store A in addr 0F
F919 : 96 15      ldaa  $15           ;load A with addr 15
F91B : 9B 16      adda  $16           ;add A with addr 16
F91D : 97 15      staa  $15           ;store A in addr 15
F91F : 96 0B      ldaa  $0B           ;load A with addr 0B
F921 : 9B 0C      adda  $0C           ;add A with addr 0C
F923 : 97 0B      staa  $0B           ;store A in addr 0B
F925 : 7A 00 17   dec  $0017          ;decr addr 0017
F928 : 26 AA      bne  LF8D4          ;branch Z=0
F92A : 7E FF EC   jmp  LFFEC          ;jump 
;*************************************;
; data for above (9 bytes)
F92D : 01 00 00 01 40 FF FC 00 FF     ;
F936 : 01 00 00 01 40 FF FC 00 80     ;
F93F : 01 00 00 01 40 FF FC 00 40     ;
F948 : 01 01 00 01 40 FF 00 00 FF     ;
F951 : 40 FF 40 FF 40 FF 00 00 FF     ;
F95A : 20 FF 20 FF 20 FF 00 00 FF     ;
F963 : 01 00 00 01 40 FF 00 00 FF     ;
F96C : 10 00 00 01 40 FF FC 01 FF     ;
F975 : 01 00 40 FF 40 FF 00 00 FF     ;
F97E : 40 FF 00 01 40 FF FF 00 A0     ;
F987 : 01 01 00 01 40 FF FC 00 FF     ;
F990 : 01 01 3F FF 40 FF 00 00 80     ;
F999 : 01 00 00 01 40 FF 04 00 A0     ;
F9A2 : 01 00 00 01 40 FF FC 00 10     ;
F9AB : 01 00 00 01 40 FF FC 00 20     ;
F9B4 : 01 01 00 01 40 FF C0 00 80     ;
F9BD : 01 01 00 01 40 FF FC 01 FF     ;
F9C6 : 01 01 3F FF 40 FF FC 01 FF     ;
F9CF : 10 00 00 01 40 FF FC 00 08     ;
F9D8 : 20 00 00 01 40 FF FC 00 06     ;
F9E1 : 40 00 00 01 40 FF FC 00 03     ;
F9EA : 01 01 00 01 40 FF FC 00 06     ;
F9F3 : 10 01 00 01 40 FF FC 00 06     ;
F9FC : 20 01 00 01 40 FF FC 00 03     ;
FA05 : 40 01 00 01 40 FF FC 00 03     ;
;*************************************;
; synth
;*************************************;
;LFA0E:
FA0E : CE FB 10   ldx  #$FB10         ;load X with FB10h (data below)
FA11 : 16         tab                 ;transfer A to B
FA12 : 86 0A      ldaa  #$0A          ;load A with 0Ah (#10)
FA14 : BD FF EF   jsr  LFFEF          ;jump sub (jump to TRNSLD)
FA17 : CE 00 1A   ldx  #$001A         ;load X with 001Ah
FA1A : DF 6E      stx  $6E            ;store X in addr 6E
FA1C : C6 40      ldab  #$40          ;load B with 40h (#64)
FA1E : CE FA D0   ldx  #$FAD0         ;load X with FAD0h (data below)
FA21 : BD FF F2   jsr  LFFF2          ;jump sub (jump to TRANS)
FA24 : 86 00      ldaa  #$00          ;load A with 00h
FA26 : 97 0A      staa  $0A           ;store A in addr 0A
FA28 : 96 06      ldaa  $06           ;load A with addr 06
FA2A : 97 16      staa  $16           ;store A in addr 16
FA2C : 96 07      ldaa  $07           ;load A with addr 07
FA2E : 97 17      staa  $17           ;store A in addr 17
FA30 : 96 08      ldaa  $08           ;load A with addr 08
FA32 : 97 18      staa  $18           ;store A in addr 18
FA34 : 96 09      ldaa  $09           ;load A with addr 09
FA36 : 97 19      staa  $19           ;store A in addr 19
FA38 : 96 00      ldaa  $00           ;load A with addr 00
FA3A : 97 10      staa  $10           ;store A in addr 10
FA3C : 96 01      ldaa  $01           ;load A with addr 01
FA3E : 97 11      staa  $11           ;store A in addr 11
;LFA40:
FA40 : 86 00      ldaa  #$00          ;load A with 00h
FA42 : 97 0C      staa  $0C           ;store A in addr 0C
FA44 : 97 0D      staa  $0D           ;store A in addr 0D
FA46 : D6 02      ldab  $02           ;load B with addr 02
FA48 : D7 12      stab  $12           ;store B in addr 12
FA4A : 96 10      ldaa  $10           ;load A with addr 10
FA4C : 97 0E      staa  $0E           ;store A in addr 0E
FA4E : 96 11      ldaa  $11           ;load A with addr 11
FA50 : 97 0F      staa  $0F           ;store A in addr 0F
FA52 : 96 03      ldaa  $03           ;load A with addr 03
FA54 : 97 13      staa  $13           ;store A in addr 13
FA56 : 96 04      ldaa  $04           ;load A with addr 04
FA58 : 97 14      staa  $14           ;store A in addr 14
FA5A : 96 05      ldaa  $05           ;load A with addr 05
FA5C : 97 15      staa  $15           ;store A in addr 15
;LFA5E:
FA5E : 96 0D      ldaa  $0D           ;load A with addr 0D
FA60 : 9B 0F      adda  $0F           ;add A with addr 0F
FA62 : 97 0D      staa  $0D           ;store A in addr 0D
FA64 : 96 0C      ldaa  $0C           ;load A with addr 0C
FA66 : 99 0E      adca  $0E           ;add C+A + addr 0E
FA68 : 97 0C      staa  $0C           ;store A in addr 0C
FA6A : 84 3F      anda  #$3F          ;and A with 3Fh
FA6C : 8B 1A      adda  #$1A          ;add A with 1Ah
FA6E : 97 0B      staa  $0B           ;store A in addr 0B
FA70 : 86 00      ldaa  #$00          ;load A with 00h
FA72 : 99 0A      adca  $0A           ;add C+A + addr 0A
FA74 : 97 0A      staa  $0A           ;store A in addr 0A
FA76 : DE 0A      ldx  $0A            ;load X with addr 0A
FA78 : A6 00      ldaa  $00,x         ;load A with X+00h
FA7A : B7 20 02   staa  $2002         ;store A in DAC output SOUND
FA7D : 5A         decb                ;decr B
FA7E : 26 2D      bne  LFAAD          ;branch Z=0
FA80 : 96 0F      ldaa  $0F           ;load A with addr 0F
FA82 : 9B 14      adda  $14           ;add A with addr 14
FA84 : 97 0F      staa  $0F           ;store A in addr 0F
FA86 : 96 0E      ldaa  $0E           ;load A with addr 0E
FA88 : 99 13      adca  $13           ;add C+A + addr 13
FA8A : 97 0E      staa  $0E           ;store A in addr 0E
FA8C : D6 12      ldab  $12           ;load B with addr 12
FA8E : 7A 00 15   dec  $0015          ;decr addr 0015
FA91 : 26 CB      bne  LFA5E          ;branch Z=0
FA93 : 7A 00 16   dec  $0016          ;decr addr 0016
FA96 : 27 12      beq  LFAAA          ;branch Z=1
FA98 : BD FA B7   jsr  LFAB7          ;jump sub
FA9B : 96 19      ldaa  $19           ;load A with addr 19
FA9D : 9B 11      adda  $11           ;add A with addr 11
FA9F : 97 11      staa  $11           ;store A in addr 11
FAA1 : 96 18      ldaa  $18           ;load A with addr 18
FAA3 : 99 10      adca  $10           ;add C+A + addr 10
FAA5 : 97 10      staa  $10           ;store A in addr 10
FAA7 : 7E FA 40   jmp  LFA40          ;jump 
;LFAAA:
FAAA : 7E FF EC   jmp  LFFEC          ;jump 
;LFAAD:
FAAD : 08         inx                 ;incr X
FAAE : 09         dex                 ;decr X
FAAF : 08         inx                 ;incr X
FAB0 : 09         dex                 ;decr X
FAB1 : 08         inx                 ;incr X
FAB2 : 09         dex                 ;decr X
FAB3 : 01         nop                 ;
FAB4 : 01         nop                 ;
FAB5 : 20 A7      bra  LFA5E          ;branch always
;LFAB7:
FAB7 : CE 00 1A   ldx  #$001A         ;load X with 001Ah
;LFABA:
FABA : D6 17      ldab  $17           ;load B with addr 17
FABC : 27 11      beq  LFACF          ;branch Z=1
FABE : A6 00      ldaa  $00,x         ;load A with X+00h
;LFAC0:
FAC0 : 44         lsra                ;logic shift right A
FAC1 : 5A         decb                ;decr B
FAC2 : 26 FC      bne  LFAC0          ;branch Z=0
FAC4 : 40         nega                ;negate A
FAC5 : AB 00      adda  $00,x         ;add A with X+00h
FAC7 : A7 00      staa  $00,x         ;store A in addr X+00h
FAC9 : 08         inx                 ;incr X
FACA : 8C 00 5A   cpx  #$005A         ;compare X with 005Ah
FACD : 26 EB      bne  LFABA          ;branch Z=0
;LFACF:
FACF : 39         rts                 ;return subroutine
;*************************************;
;data for above (64 bytes) - sine wave
FAD0 : 80 8C 99 A5 B1 BC C7 D1 
FAD8 : DA E3 EA F1 F6 FA FD FF 
FAE0 : FF FF FD FA F5 F0 E9 E2 
FAE8 : D9 D0 C6 BB AF A3 97 8B 
FAF0 : 7E 71 65 59 4D 42 37 2D 
FAF8 : 24 1B 14 0E 08 04 02 00 
FB00 : 00 00 02 06 0A 10 17 1E 
FB08 : 27 31 3B 46 51 5D 6A 76 
;*************************************;
; data table for above (10 bytes)
FB10 : 06    " "    tap
FB11 : 00    " "    db  $00
FB12 : 20 FF    "  "    bra  LFB13
FB14 : E8 40    " @"    eorb  $40,x
FB16 : 03    " "    db  $03
FB17 : 01    " "    nop
FB18 : 00 00 
;
FB1A : 04 00  "    "    db  $00, $00, $04, $00
FB1C : 10    " "    sba
FB1D : FF F0 40    "  @"    stx  XF040
FB20 : 08    " "    inx
FB21 : 01    " "    nop
FB22 : 00 00 
;
FB24 : 04 00  "    "    db  $00, $00, $04, $00
FB26 : 08    " "    inx
FB27 : FF F0 40    "  @"    stx  XF040
FB2A : 20 02    "  "    bra  LFB2E
FB2C : 00 00 
;
FB2E : 00    "   "    db  $00, $00, $00
FB2F : 40    "@"    nega
FB30 : 04 00    "  "    db  $04, $00
FB32 : 40    "@"    nega
FB33 : FF 03 01    "   "    stx  X0301
FB36 : 00 00 
;
FB38 : 00    "   "    db  $00, $00, $00
FB39 : 40    "@"    nega
FB3A : 08    " "    inx
FB3B : 00    " "    db  $00
FB3C : 40    "@"    nega
FB3D : FF 07 01    "   "    stx  X0701
FB40 : 00 00    "  "    db  $00, $00
;
FB42 : 10    " "    sba
FB43 : 00 04    "  "    db  $00, $04
FB45 : FF C0 FF    "   "    stx  XC0FF
FB48 : 07    " "    tpa
FB49 : 01    " "    nop
FB4A : 00 00    "  "    db  $00, $00
;
FB4C : 10    " "    sba
FB4D : 00    " "    db  $00
FB4E : 10    " "    sba
FB4F : FF C0 FF    "   "    stx  XC0FF
FB52 : 07    " "    tpa
FB53 : 01    " "    nop
FB54 : 00 00    "  "    db  $00, $00
;
FB56 : 10    " "    sba
FB57 : 00    " "    db  $00
FB58 : 10    " "    sba
FB59 : FF C0 57    "  W"    stx  XC057
FB5C : 05 02    "  "    db  $05, $02
FB5E : 00 00    "  "    db  $00, $00
;
FB60 : 10    " "    sba
FB61 : 00 04    "  "    db  $00, $04
FB63 : FF C0 57    "  W"    stx  XC057
FB66 : 10    " "    sba
FB67 : 02 00 00    "   "    db  $02, $00, $00
;
FB6A : 10    " "    sba
FB6B : 00    " "    db  $00
FB6C : 10    " "    sba
FB6D : 57    "W"    asrb
FB6E : 00    " "    db  $00
FB6F : 20 04    "  "    bra  LFB75
FB71 : 02 00 00    "   "    db  $02, $00, $00
;
FB74 : 10    " "    sba
FB75 : 00    " "    db  $00
FB76 : 10    " "    sba
FB77 : 57    "W"    asrb
FB78 : 00    " "    db  $00
FB79 : C0 08    "  "    subb  #$08
FB7B : 01    " "    nop
FB7C : 00 00    "  "    db  $00, $00
;
FB7E : 10    " "    sba
FB7F : 00    " "    db  $00
FB80 : FF 57 00    " W "    stx  X5700
FB83 : 20 10    "  "    bra  LFB95
FB85 : 02 00 00    "   "    db  $02, $00, $00
;
FB88 : 10    " "    sba
FB89 : 00    " "    db  $00
FB8A : FF 57 00    " W "    stx  X5700
FB8D : 40    "@"    nega
FB8E : 08    " "    inx
FB8F : 01    " "    nop
FB90 : 00 00    "  "    db  $00, $00
;
FB92 : 10    " "    sba
FB93 : 00    " "    db  $00
FB94 : 40    "@"    nega
FB95 : 57    "W"    asrb
FB96 : 00    " "    db  $00
FB97 : 40    "@"    nega
FB98 : 08    " "    inx
FB99 : 01    " "    nop
FB9A : 00 00    "  "    db  $00, $00
;
FB9C : 10    " "    sba
FB9D : 00    " "    db  $00
FB9E : 40    "@"    nega
FB9F : 1F 00    "  "    db  $1F, $00
FBA1 : 40    "@"    nega
FBA2 : 04    " "    db  $04
FBA3 : 01    " "    nop
FBA4 : 00 00    "  "    db  $00, $00
;
FBA6 : 10    " "    sba
FBA7 : 00    " "    db  $00
FBA8 : 40    "@"    nega
FBA9 : 11    " "    cba
FBAA : 00    " "    db  $00
FBAB : 40    "@"    nega
FBAC : 08    " "    inx
FBAD : 01    " "    nop
FBAE : 00 00    "  "    db  $00, $00
;
FBB0 : 10    " "    sba
FBB1 : 00    " "    db  $00
FBB2 : FF 1F 00    "   "    stx  X1F00
FBB5 : 40    "@"    nega
FBB6 : 08    " "    inx
FBB7 : 01    " "    nop
FBB8 : 00 00    "  "    db  $00, $00
;
FBBA : 20 00    "  "    bra  LFBBC
FBBC : 01    " "    nop
FBBD : FF F0 FF    "   "    stx  XF0FF
FBC0 : 40    "@"    nega
FBC1 : 00    " "    db  $00
FBC2 : FF 80 
;
FBC4 : 20    "   "    stx  X8020
FBC5 : 00 04    "  "    db  $00, $04
FBC7 : FF F0 FF    "   "    stx  XF0FF
FBCA : 30    "0"    tsx
FBCB : 00    " "    db  $00
FBCC : FF 80 
;
FBCE : 04    "   "    stx  X8004
FBCF : 00    " "    db  $00
FBD0 : 08    " "    inx
FBD1 : FF F0 40    "  @"    stx  XF040
FBD4 : 20 02    "  "    bra  LFBD8
FBD6 : 01    " "    nop
FBD7 : 00 
;
FBD8 : 04 00    "   "    db  $00, $04, $00
FBDA : 08    " "    inx
FBDB : FF F0 40    "  @"    stx  XF040
FBDE : 20 02    "  "    bra  LFBE2
FBE0 : 00    " "    db  $00
FBE1 : 40    "@"    nega
;
FBE2 : 10    " "    sba
FBE3 : 00    " "    db  $00
FBE4 : FF 11 00    "   "    stx  X1100
FBE7 : 40    "@"    nega
FBE8 : 08    " "    inx
FBE9 : 01    " "    nop
;
FBEA : 00 00    "  "    db  $00, $00
FBEC : 20 00    "  "    bra  LFBEE
FBEE : 08    " "    inx
FBEF : FF C0 7F    "   "    stx  XC07F
FBF2 : 08    " "    inx
FBF3 : 01    " "    nop
;
FBF4 : 00    " "    db  $00
FBF5 : 00    " "    db  $00
FBF6 : 10    " "    sba
FBF7 : 00    " "    db  $00
FBF8 : 10    " "    sba
FBF9 : FF C0 3F    "  ?"    stx  XC03F
FBFC : 08    " "    inx
FBFD : 01    " "    nop
;
FBFE : 00    " "    db  $00
FBFF : 00    " "    db  $00
FC00 : 08    " "    inx
FC01 : 00    " "    db  $00
FC02 : 40    "@"    nega
FC03 : FF C0 20    "   "    stx  XC020
FC06 : 08    " "    inx
FC07 : 01    " "    nop
;
FC08 : 01    " "    nop
FC09 : 00    " "    db  $00
FC0A : 01    " "    nop
FC0B : 00    " "    db  $00
FC0C : 10    " "    sba
FC0D : 00    " "    db  $00
FC0E : 40    "@"    nega
FC0F : 7F 08 01    "   "    clr  X0801
;
FC12 : 00 00    "  "    db  $00, $00
FC14 : 01    " "    nop
FC15 : 00    " "    db  $00
FC16 : 80 00    "  "    suba  #$00
FC18 : 40    "@"    nega
FC19 : 7F 
;*************************************;
; param loader for fnoise #2
;*************************************;
;FNLDR2 LFC1A
FC1A : 86 55      ldaa  #$55          ;load A with 55h
FC1C : 97 01      staa  $01           ;store A in addr 01
FC1E : 97 02      staa  $02           ;store A in addr 02
FC20 : B6 FC B4   ldaa  $FCB4         ;load A with addr FCB4 
FC23 : 97 0A      staa  $0A           ;store A in addr 0A
FC25 : B6 FC B5   ldaa  $FCB5         ;load A with addr FCB5
FC28 : 97 03      staa  $03           ;store A in addr 03
FC2A : B6 FC B6   ldaa  $FCB6         ;load A with addr FCB6
FC2D : F6 FC B7   ldab  $FCB7         ;load A with addr FCB7
FC30 : FE FC B8   ldx  $FCB8          ;load X with addr FCB8 
;*************************************;
;Filtered Noise Routine #2
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE LFC33
FC33 : 97 09      staa  $09           ;store A in addr 09 (FDFLG)
FC35 : D7 04      stab  $04           ;store B in addr 04 (FMAX)
FC37 : DF 07      stx  $07            ;store X in addr 07 (SAMPC)
FC39 : 7F 00 06   clr  $0006          ;clear addr 0006 (FLO)
;FNOIS0:
FC3C : DE 07      ldx  X0007
FC3E : B6 20 02   ldaa  X2002
;FNOIS1:
FC41 : 16         tab
FC42 : 54         lsrb
FC43 : 54         lsrb
FC44 : 54         lsrb
FC45 : D8 02      eorb  X0002
FC47 : 54         lsrb
FC48 : 76 00 01   ror  X0001
FC4B : 76 00 02   ror  X0002
FC4E : D6 04      ldab  X0004
FC50 : 7D 00 0A   tst  X000A
FC53 : 27 06      beq  LFC5B
FC55 : D6 01      ldab  X0001
FC57 : DA 03      orab  X0003
FC59 : D4 04      andb  X0004
;FNOIS2:
FC5B : D7 05      stab  X0005
FC5D : D6 06      ldab  X0006
FC5F : 91 02      cmpa  X0002
FC61 : 22 12      bhi  LFC75
;FNOIS3:
FC63 : 09         dex
FC64 : 27 26      beq  LFC8C
FC66 : B7 20 02   staa  X2002
FC69 : DB 06      addb  X0006
FC6B : 99 05      adca  X0005
FC6D : 25 16      bcs  LFC85
FC6F : 91 02      cmpa  X0002
FC71 : 23 F0      bls  LFC63
FC73 : 20 10      bra  LFC85
;FNOIS4:
FC75 : 09         dex
FC76 : 27 14      beq  LFC8C
FC78 : B7 20 02   staa  X2002
FC7B : D0 06      subb  X0006
FC7D : 92 05      sbca  X0005
FC7F : 25 04      bcs  LFC85
FC81 : 91 02      cmpa  X0002
FC83 : 22 F0      bhi  LFC75
;FNOIS5:
FC85 : 96 02      ldaa  $02
FC87 : B7 20 02   staa  X2002
FC8A : 20 B5      bra  LFC41
;FNOIS6:
FC8C : D6 09      ldab  X0009
FC8E : 27 B1      beq  LFC41
FC90 : 96 04      ldaa  $04
FC92 : D6 06      ldab  X0006
FC94 : 44         lsra
FC95 : 56         rorb
FC96 : 44         lsra
FC97 : 56         rorb
FC98 : 44         lsra
FC99 : 56         rorb
FC9A : 7D 00 09   tst  X0009
FC9D : 2B 04      bmi  LFCA3
FC9F : 43         coma
FCA0 : 50         negb
FCA1 : 82 FF      sbca  #$FF
;FNOIS7 
FCA3 : DB 06      addb  X0006
FCA5 : 99 04      adca  X0004
FCA7 : D7 06      stab  X0006
FCA9 : 97 04      staa  $04
FCAB : 26 8F      bne  LFC3C
FCAD : C1 07      cmpb  #$07
FCAF : 26 8B      bne  LFC3C
FCB1 : 7E FF EC   jmp  LFFEC
;*************************************;
; data for FNOISE
;mem   0A 03 A  B  Xh Xl
FCB4 : 01 0F FF 01 08 00 
;*************************************;
; synth
;*************************************;
;LFCBA:
FCBA : CE FD 31   ldx  #$FD31         ;load X with FD31h (data below)
FCBD : 16         tab                 ;transfer A to B
FCBE : 86 09      ldaa  #$09          ;load A with 09h 
FCC0 : BD FF EF   jsr  LFFEF          ;jump sub (jump TRNSLD)
FCC3 : 86 55      ldaa  #$55
FCC5 : 97 09      staa  $09
FCC7 : 96 08      ldaa  $08
FCC9 : 97 11      staa  $11
FCCB : 96 01      ldaa  $01
FCCD : 97 0A      staa  $0A
FCCF : 96 02      ldaa  $02
FCD1 : 97 0B      staa  $0B
FCD3 : 96 03      ldaa  $03
FCD5 : 97 0C      staa  $0C
FCD7 : DE 06      ldx  $06
FCD9 : DF 0F      stx  $0F
FCDB : DE 04      ldx  $04
FCDD : DF 0D      stx  $0D
;LFCDF:
FCDF : D6 09      ldab  $09
FCE1 : 96 09      ldaa  $09
FCE3 : 48         asla
FCE4 : 24 02      bcc  LFCE8
FCE6 : 98 00      eora  $00
;LFCE8:
FCE8 : 97 09      staa  $09
FCEA : D1 09      cmpb  $09
FCEC : 24 2A      bcc  LFD18
;LFCEE:
FCEE : F7 20 02   stab  $2002
FCF1 : DB 0A      addb  $0A
FCF3 : 25 EA      bcs  LFCDF
FCF5 : D1 09      cmpb  $09
FCF7 : 24 E6      bcc  LFCDF
FCF9 : 96 0B      ldaa  $0B
;LFCFB:
FCFB : 4A         deca
FCFC : 26 FD      bne  LFCFB
FCFE : 09         dex
FCFF : 26 ED      bne  LFCEE
;LFD01:
FD01 : DE 0F      ldx  $0F
FD03 : 09         dex
FD04 : DF 0F      stx  $0F
FD06 : 27 26      beq  LFD2E
FD08 : 96 0B      ldaa  $0B
FD0A : 9B 0C      adda  $0C
FD0C : 97 0B      staa  $0B
FD0E : 96 0A      ldaa  $0A
FD10 : 9B 11      adda  $11
FD12 : 97 0A      staa  $0A
FD14 : DE 0D      ldx  $0D
FD16 : 20 C7      bra  LFCDF
;LFD18:
FD18 : F7 20 02   stab  $2002
FD1B : D0 0A      subb  $0A
FD1D : 24 C0      bcc  LFCDF
FD1F : D1 09      cmpb  $09
FD21 : 23 BC      bls  LFCDF
FD23 : 96 0B      ldaa  $0B
;LFD25:
FD25 : 4A         deca
FD26 : 26 FD      bne  LFD25
FD28 : 09         dex
FD29 : 26 ED      bne  LFD18
FD2B : 7E FD 01   jmp  LFD01
;LFD2E:
FD2E : 7E FF EC   jmp  LFFEC
;*************************************;
; data for above (9 bytes)
FD31 : 78 20 01 04 00 20 00 10 00     ;
FD3A : 5A 20 01 04 00 20 00 10 00     ;
FD43 : 4D 10 01 04 00 20 00 10 00     ;
FD4C : 4D 40 01 04 00 10 00 10 00     ;
FD55 : 4D 00 01 00 00 FF 00 10 01     ;
FD5E : 4D 10 01 00 00 FF 00 10 FF     ;
FD67 : 4D 20 01 00 02 FF 00 20 FF     ;
FD70 : 4D 00 01 00 02 FF 00 40 FF     ;
FD79 : 4D 00 20 00 02 FF 00 20 FF     ;
FD82 : 4D 00 08 00 02 FF 00 20 FF     ;
FD8B : 4D 20 08 00 00 40 00 20 FF     ;
;*************************************;
; synth
;*************************************;
;LFD94:
FD94 : CE FE 0D   ldx  #$FE0D         ;load X with FE0Dh (data below)
FD97 : 16         tab
FD98 : 86 0D      ldaa  #$0D          ;load A with 0Dh (#13)
FD9A : BD FF EF   jsr  LFFEF          ;jump sub (jump TRNSLD)
FD9D : 96 0B    "  "    ldaa  $0B
FD9F : 97 14    "  "    staa  $14
FDA1 : 96 09    "  "    ldaa  $09
FDA3 : 97 12    "  "    staa  $12
FDA5 : 96 0A    "  "    ldaa  $0A
FDA7 : 97 13    "  "    staa  $13
FDA9 : 96 06    "  "    ldaa  $06
FDAB : 97 11    "  "    staa  $11
FDAD : 96 04    "  "    ldaa  $04
FDAF : 97 16    "  "    staa  $16
FDB1 : 96 00    "  "    ldaa  $00
FDB3 : 97 17    "  "    staa  $17
;LFDB5:
FDB5 : 96 17    "  "    ldaa  $17
FDB7 : 97 0D    "  "    staa  $0D
FDB9 : 96 0C    "  "    ldaa  $0C
FDBB : 97 15    "  "    staa  $15
FDBD : 96 01    "  "    ldaa  $01
FDBF : 97 0E    "  "    staa  $0E
FDC1 : 96 02    "  "    ldaa  $02
FDC3 : 97 10    "  "    staa  $10
FDC5 : DE 07    "  "    ldx  X0007
FDC7 : 96 14    "  "    ldaa  $14
FDC9 : B7 20 02    "   "    staa  X2002
FDCC : 96 11    "  "    ldaa  $11
;LFDCE:
FDCE : D6 0E    "  "    ldab  X000E
FDD0 : D7 0F    "  "    stab  X000F
;LFDD2:
FDD2 : 48    "H"    asla
FDD3 : 24 05    "$ "    bcc  LFDDA
FDD5 : 73 20 02    "s  "    com  X2002
FDD8 : 98 11    "  "    eora  X0011
;LFDDA:
FDDA : D6 0D    "  "    ldab  X000D
;LFDDC:
FDDC : 5A    "Z"    decb
FDDD : 26 FD    "& "    bne  LFDDC
FDDF : 7A 00 0F    "z  "    dec  X000F
FDE2 : 26 EE    "& "    bne  LFDD2
FDE4 : D6 0D    "  "    ldab  X000D
FDE6 : DB 10    "  "    addb  X0010
FDE8 : D7 0D    "  "    stab  X000D
FDEA : D6 15    "  "    ldab  X0015
FDEC : DB 14    "  "    addb  X0014
FDEE : D7 14    "  "    stab  X0014
FDF0 : F7 20 02    "   "    stab  X2002
FDF3 : 09    " "    dex
FDF4 : 26 D8    "& "    bne  LFDCE
FDF6 : 7A 00 12    "z  "    dec  X0012
FDF9 : 27 0F    "' "    beq  LFE0A
FDFB : D6 14    "  "    ldab  X0014
FDFD : D0 13    "  "    subb  X0013
FDFF : D7 14    "  "    stab  X0014
;LFE01:
FE01 : D6 16    "  "    ldab  X0016
FE03 : DB 17    "  "    addb  X0017
FE05 : D7 17    "  "    stab  X0017
FE07 : 7E FD B5    "~  "    jmp  LFDB5
;LFE0A:
FE0A : 7E FF EC    "~  "    jmp  LFFEC
;*************************************;
; data for above (13 bytes)
FE0D : 01 FF 01 00 00 00 4D           ;
FE14 : 00 FF 01 00 FF 00              ;
;
FE1A : 01 FF 01 00 00 00 38           ;
FE21 : 00 FF 01 00 FF 00              ;
;
FE27 : 01 20 01 00 00 00 38           ;
FE2E : 00 40 01 00 FF 02              ;
;
FE34 : 01 10 01 00 00 00 38           ;
FE3B : 00 40 01 00 FF 02              ;
;
FE41 : 01 40 01 00 00 00 38           ;
FE48 : 00 20 01 00 FF 04              ;
;
FE4E : 01 40 01 00 00 01 4D           ;
FE55 : 00 20 04 20 FF 00              ;
;
FE5B : 20 40 FF 00 00 00 38           ;
FE62 : 00 20 08 10 FF 00              ;
;
FE68 : 40 40 FE 00 00 00 38           ;
FE6F : 00 20 08 10 FF 00              ;
;
FE75 : 01 08 01 00 00 00 4D           ;
FE7C : 00 40 05 10 FF 00              ;
;
FE82 : 01 02 01 00 00 00 4D           ;
FE89 : 00 80 08 10 FF 00              ;
;
FE8F : 01 FF 01 00 00 00 4D           ;
FE96 : 00 10 04 20 FF 00              ;
;
FE9C : 01 FF 01 00 00 00 4D           ;
FEA3 : 00 10 08 F0 80 00              ;
;
FEA9 : 01 10 01 00 00 00 38           ;
FEB0 : 00 20 04 20 FF 00              ;
;
FEB6 : 01 18 01 00 01 01 38           ;
FEBD : 00 10 1A 04 FF 00              ;
;
FEC3 : 40 18 01 00 FF 01 4D           ;
FECA : 00 10 40 00 FF 00              ;
;*************************************;
; synth
;*************************************;
;LFED0
FED0 : CE FF 37   ldx  #$FF37         ;load X with FF37h (data below)
FED3 : 16         tab                 ;transfer A to B
FED4 : 86 09      ldaa  #$09          ;load A with 09h
FED6 : BD FF EF   jsr  LFFEF          ;jump sub (jump TRNSLD)
FED9 : 86 55    " U"    ldaa  #$55
FEDB : 97 09    "  "    staa  $09
FEDD : 96 08    "  "    ldaa  $08
FEDF : 97 11    "  "    staa  $11
FEE1 : 96 01    "  "    ldaa  $01
FEE3 : 97 0A    "  "    staa  $0A
FEE5 : 96 02    "  "    ldaa  $02
FEE7 : 97 0B    "  "    staa  $0B
FEE9 : 96 03    "  "    ldaa  $03
FEEB : 97 0C    "  "    staa  $0C
FEED : DE 06    "  "    ldx  X0006
FEEF : DF 0F    "  "    stx  X000F
FEF1 : DE 04    "  "    ldx  X0004
FEF3 : DF 0D    "  "    stx  X000D
FEF5        LFEF5:
FEF5 : F6 20 02    "   "    ldab  X2002
FEF8 : 96 09    "  "    ldaa  $09
FEFA : 48    "H"    asla
FEFB : 24 02    "$ "    bcc  LFEFF
FEFD : 98 00    "  "    eora  X0000
FEFF        LFEFF:
FEFF        XFEFF:
FEFF : 97 09    "  "    staa  $09
FF01        XFF01:
FF01 : D1 09    "  "    cmpb  X0009
FF03        LFF03:
FF03        XFF03:
FF03 : 24 1F    "$ "    bcc  LFF24
FF05        LFF05:
FF05        XFF05:
FF05 : F7 20 02    "   "    stab  X2002
FF08 : DB 0A    "  "    addb  X000A
FF0A        XFF0A:
FF0A : 25 E9    "% "    bcs  LFEF5
FF0C : D1 09    "  "    cmpb  X0009
FF0E : 24 E5    "$ "    bcc  LFEF5
FF10 : 09    " "    dex
FF11 : 26 F2    "& "    bne  LFF05
FF13        LFF13:
FF13 : DE 0F    "  "    ldx  X000F
FF15 : 09    " "    dex
FF16 : DF 0F    "  "    stx  X000F
FF18 : 27 1A    "' "    beq  LFF34
FF1A : DE 0D    "  "    ldx  X000D
FF1C : 96 11    "  "    ldaa  $11
FF1E : 9B 0A    "  "    adda  X000A
FF20        XFF20:
FF20 : 97 0A    "  "    staa  $0A
FF22 : 20 D1    "  "    bra  LFEF5
;LFF24:
FF24 : F7 20 02    "   "    stab  X2002
FF27 : D0 0A    "  "    subb  X000A
FF29 : 25 CA    "% "    bcs  LFEF5
FF2B : D1 09    "  "    cmpb  X0009
FF2D : 23 C6    "# "    bls  LFEF5
FF2F : 09    " "    dex
FF30 : 26 F2    "& "    bne  LFF24
FF32 : 20 DF    "  "    bra  LFF13
;LFF34:
FF34 : 7E FF EC    "~  "    jmp  LFFEC
;*************************************;
;data for synth above (9 bytes)
FF37 : 84 01 01 01 00 80 00 40 01     ;
FF40 : 84 01 01 01 00 FF 00 40 01     ;
FF49 : 4D 40 01 01 00 40 00 40 FF     ;
FF52 : 84 40 01 01 00 40 00 40 FF     ;
FF5B : 4D 01 01 01 04 40 00 20 01     ;
;*************************************;
; synth
;*************************************;
;LFF64:
FF64 : CE FF C8   ldx  #$FFC8         ;load X with FFC8h (data below)
FF67 : 16         tab
FF68 : 86 09      ldaa  #$09          ;load A with 09h
FF6A : BD FF EF   jsr  LFFEF          ;jump sub (jump TRNSLD)
FF6D : 86 55    " U"    ldaa  #$55
FF6F : 97 09    "  "    staa  $09
FF71 : 96 08    "  "    ldaa  $08
FF73 : 97 11    "  "    staa  $11
FF75 : 96 01    "  "    ldaa  $01
FF77 : 97 0A    "  "    staa  $0A
FF79 : 96 02    "  "    ldaa  $02
FF7B : 97 0B    "  "    staa  $0B
FF7D : 96 03    "  "    ldaa  $03
FF7F : 97 0C    "  "    staa  $0C
FF81 : DE 06    "  "    ldx  X0006
FF83 : DF 0F    "  "    stx  X000F
FF85 : DE 04    "  "    ldx  X0004
FF87 : DF 0D    "  "    stx  X000D
;LFF89:
FF89 : 09    " "    dex
FF8A : 26 0F    "& "    bne  LFF9B
FF8C : DE 0F    "  "    ldx  X000F
FF8E : 09    " "    dex
FF8F : DF 0F    "  "    stx  X000F
FF91 : 27 32    "'2"    beq  LFFC5
FF93 : DE 0D    "  "    ldx  X000D
FF95 : 96 11    "  "    ldaa  $11
FF97 : 9B 0A    "  "    adda  X000A
FF99 : 97 0A    "  "    staa  $0A
;LFF9B:
FF9B : F6 20 02    "   "    ldab  X2002
FF9E : 96 09    "  "    ldaa  $09
FFA0 : 48    "H"    asla
FFA1 : 24 02    "$ "    bcc  LFFA5
FFA3 : 98 00    "  "    eora  X0000
;LFFA5:
FFA5 : 97 09    "  "    staa  $09
FFA7 : D1 09    "  "    cmpb  X0009
FFA9 : 24 0D    "$ "    bcc  LFFB8
;LFFAB:
FFAB : F7 20 02    "   "    stab  X2002
FFAE : DB 0A    "  "    addb  X000A
FFB0 : 25 D7    "% "    bcs  LFF89
FFB2 : D1 09    "  "    cmpb  X0009
FFB4 : 24 D3    "$ "    bcc  LFF89
FFB6 : 20 F3    "  "    bra  LFFAB
;LFFB8:
FFB8 : F7 20 02    "   "    stab  X2002
FFBB : D0 0A    "  "    subb  X000A
FFBD : 25 CA    "% "    bcs  LFF89
FFBF : D1 09    "  "    cmpb  X0009
FFC1 : 23 C6    "# "    bls  LFF89
FFC3 : 20 F3    "  "    bra  LFFB8
;LFFC5:
FFC5 : 7E FF EC    "~  "    jmp  LFFEC
;*************************************;
;data for synth above (9 bytes)
FFC8 : 4D 40 01 01 00 60 00 40 FF     ;
FFD1 : 84 40 01 01 00 18 00 40 FF     ;
FFDA : 85 40 01 01 00 30 00 40 FF     ;
FFE3 : 4D 01 01 01 00 60 00 40 01     ;
;*************************************;
; jumps
;*************************************;
;LFFEC:
FFEC : 7E F2 97   jmp  LF297          ;jump PREIRQ
;LFFEF:
FFEF : 7E F0 69   jmp  LF069          ;jump TRNSLD
;LFFF2:
FFF2 : 7E EB 80   jmp  LEB80          ;jump TRANS
;LFFF4
FFF5 : 7E F0 4E   jmp  LF04E          ;jump ADDX
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F1 D3                          ;IRQ
FFFA : E9 51                          ;RESET SWI (software) 
FFFC : F1 AE                          ;NMI 
FFFE : E9 51                          ;RESET (hardware) 

;--------------------------------------------------------------




