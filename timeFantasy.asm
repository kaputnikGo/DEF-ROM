        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    timeFantasy.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  BDCA
        ;  CRC-32:    55A10D13
        ;
        ;  Date:    Sat Nov 02 20:40:33 2019
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Pinball Sound ROM 13, Time Fantasy, march 1983
        ; Note: same Checksum, CRC as Pinball Sound ROM 3 Firepower
        ;
        ;
          org  $F800
F800 : 45    "E"    db  $45
        ;
F801 : 0F    " "    sei
F802 : 8E 00 7F    "   "    lds  #$007F
F805 : CE 04 00    "   "    ldx  #$0400
F808 : 6F 01    "o "    clr  $01,x
F80A : 6F 03    "o "    clr  $03,x
F80C : 86 FF    "  "    ldaa  #$FF
F80E : A7 00    "  "    staa  $00,x
F810 : C6 80    "  "    ldab  #$80
F812 : E7 02    "  "    stab  $02,x
F814 : 86 37    " 7"    ldaa  #$37
F816 : A7 03    "  "    staa  $03,x
F818 : 86 3C    " <"    ldaa  #$3C
F81A : A7 01    "  "    staa  $01,x
F81C : 97 0A    "  "    staa  X000A
F81E : E7 02    "  "    stab  $02,x
F820 : 4F    "O"    clra
F821 : 97 07    "  "    staa  X0007
F823 : 97 08    "  "    staa  X0008
F825 : 97 04    "  "    staa  X0004
F827 : 97 05    "  "    staa  X0005
F829 : 97 06    "  "    staa  X0006
F82B : 0E    " "    cli
F82C        LF82C:
F82C : 20 FE    "  "    bra  LF82C
        ;
F82E        LF82E:
F82E : 16    " "    tab
F82F : 48    "H"    asla
F830 : 48    "H"    asla
F831 : 48    "H"    asla
F832 : 1B    " "    aba
F833 : CE 00 14    "   "    ldx  #$0014
F836 : DF 10    "  "    stx  X0010
F838 : CE FD 15    "   "    ldx  #$FD15
F83B : BD FC 55    "  U"    jsr  LFC55
F83E : C6 09    "  "    ldab  #$09
F840 : 7E F9 17    "~  "    jmp  LF917
        ;
F843        LF843:
F843 : 96 1C    "  "    ldaa  X001C
F845 : B7 04 00    "   "    staa  X0400
F848        LF848:
F848 : 96 14    "  "    ldaa  X0014
F84A : 97 1D    "  "    staa  X001D
F84C : 96 15    "  "    ldaa  X0015
F84E : 97 1E    "  "    staa  X001E
F850        LF850:
F850 : DE 19    "  "    ldx  X0019
F852        LF852:
F852 : 96 1D    "  "    ldaa  X001D
F854 : 73 04 00    "s  "    com  X0400
F857        LF857:
F857 : 09    " "    dex
F858 : 27 10    "' "    beq  LF86A
F85A : 4A    "J"    deca
F85B : 26 FA    "& "    bne  LF857
F85D : 73 04 00    "s  "    com  X0400
F860 : 96 1E    "  "    ldaa  X001E
F862        LF862:
F862 : 09    " "    dex
F863 : 27 05    "' "    beq  LF86A
F865 : 4A    "J"    deca
F866 : 26 FA    "& "    bne  LF862
F868 : 20 E8    "  "    bra  LF852
        ;
F86A        LF86A:
F86A : B6 04 00    "   "    ldaa  X0400
F86D : 2B 01    "+ "    bmi  LF870
F86F : 43    "C"    coma
F870        LF870:
F870 : 8B 00    "  "    adda  #$00
F872 : B7 04 00    "   "    staa  X0400
F875 : 96 1D    "  "    ldaa  X001D
F877 : 9B 16    "  "    adda  X0016
F879 : 97 1D    "  "    staa  X001D
F87B : 96 1E    "  "    ldaa  X001E
F87D : 9B 17    "  "    adda  X0017
F87F : 97 1E    "  "    staa  X001E
F881 : 91 18    "  "    cmpa  X0018
F883 : 26 CB    "& "    bne  LF850
F885 : 96 1B    "  "    ldaa  X001B
F887 : 27 06    "' "    beq  LF88F
F889 : 9B 14    "  "    adda  X0014
F88B : 97 14    "  "    staa  X0014
F88D : 26 B9    "& "    bne  LF848
F88F        LF88F:
F88F : 39    "9"    rts
        ;
F890        LF890:
F890 : 86 01    "  "    ldaa  #$01
F892 : 97 1B    "  "    staa  X001B
F894 : C6 03    "  "    ldab  #$03
F896 : 20 0A    "  "    bra  LF8A2
        ;
F898 : 86 FF    "  "    ldaa  #$FF
F89A : 97 1B    "  "    staa  X001B
F89C : 86 60    " `"    ldaa  #$60
F89E : C6 FF    "  "    ldab  #$FF
F8A0 : 20 00    "  "    bra  LF8A2
        ;
F8A2        LF8A2:
F8A2 : 97 1A    "  "    staa  X001A
F8A4 : 86 FF    "  "    ldaa  #$FF
F8A6 : B7 04 00    "   "    staa  X0400
F8A9 : D7 16    "  "    stab  X0016
F8AB        LF8AB:
F8AB : D6 16    "  "    ldab  X0016
F8AD        LF8AD:
F8AD : 96 0B    "  "    ldaa  X000B
F8AF : 44    "D"    lsra
F8B0 : 44    "D"    lsra
F8B1 : 44    "D"    lsra
F8B2 : 98 0B    "  "    eora  X000B
F8B4 : 44    "D"    lsra
F8B5 : 76 00 0A    "v  "    ror  X000A
F8B8 : 76 00 0B    "v  "    ror  X000B
F8BB : 24 03    "$ "    bcc  LF8C0
F8BD : 73 04 00    "s  "    com  X0400
F8C0        LF8C0:
F8C0 : 96 1A    "  "    ldaa  X001A
F8C2        LF8C2:
F8C2 : 4A    "J"    deca
F8C3 : 26 FD    "& "    bne  LF8C2
F8C5 : 5A    "Z"    decb
F8C6 : 26 E5    "& "    bne  LF8AD
F8C8 : 96 1A    "  "    ldaa  X001A
F8CA : 9B 1B    "  "    adda  X001B
F8CC : 97 1A    "  "    staa  X001A
F8CE : 26 DB    "& "    bne  LF8AB
F8D0 : 39    "9"    rts
        ;
F8D1 : 86 20    "  "    ldaa  #$20
F8D3 : 97 16    "  "    staa  X0016
F8D5 : 97 19    "  "    staa  X0019
F8D7 : 86 01    "  "    ldaa  #$01
F8D9 : CE 00 01    "   "    ldx  #$0001
F8DC : C6 FF    "  "    ldab  #$FF
F8DE : 20 00    "  "    bra  LF8E0
        ;
F8E0        LF8E0:
F8E0 : 97 14    "  "    staa  X0014
F8E2        LF8E2:
F8E2 : DF 17    "  "    stx  X0017
F8E4        LF8E4:
F8E4 : D7 15    "  "    stab  X0015
F8E6 : D6 16    "  "    ldab  X0016
F8E8        LF8E8:
F8E8 : 96 0B    "  "    ldaa  X000B
F8EA : 44    "D"    lsra
F8EB : 44    "D"    lsra
F8EC : 44    "D"    lsra
F8ED : 98 0B    "  "    eora  X000B
F8EF : 44    "D"    lsra
F8F0 : 76 00 0A    "v  "    ror  X000A
F8F3 : 76 00 0B    "v  "    ror  X000B
F8F6 : 86 00    "  "    ldaa  #$00
F8F8 : 24 02    "$ "    bcc  LF8FC
F8FA : 96 15    "  "    ldaa  X0015
F8FC        LF8FC:
F8FC : B7 04 00    "   "    staa  X0400
F8FF : DE 17    "  "    ldx  X0017
F901        LF901:
F901 : 09    " "    dex
F902 : 26 FD    "& "    bne  LF901
F904 : 5A    "Z"    decb
F905 : 26 E1    "& "    bne  LF8E8
F907 : D6 15    "  "    ldab  X0015
F909 : D0 14    "  "    subb  X0014
F90B : 27 09    "' "    beq  LF916
F90D : DE 17    "  "    ldx  X0017
F90F : 08    " "    inx
F910 : 96 19    "  "    ldaa  X0019
F912 : 27 D0    "' "    beq  LF8E4
F914 : 20 CC    "  "    bra  LF8E2
F916        LF916:
F916 : 39    "9"    rts
        ;
F917        LF917:
F917 : 36    "6"    psha
F918        LF918:
F918 : A6 00    "  "    ldaa  $00,x
F91A : DF 0E    "  "    stx  X000E
F91C : DE 10    "  "    ldx  X0010
F91E : A7 00    "  "    staa  $00,x
F920 : 08    " "    inx
F921 : DF 10    "  "    stx  X0010
F923 : DE 0E    "  "    ldx  X000E
F925 : 08    " "    inx
F926 : 5A    "Z"    decb
F927 : 26 EF    "& "    bne  LF918
F929 : 32    "2"    pula
F92A : 39    "9"    rts
        ;
F92B        LF92B:
F92B : 84 1F    "  "    anda  #$1F
F92D        LF92D:
F92D : 27 FE    "' "    beq  LF92D
F92F : 84 0F    "  "    anda  #$0F
F931 : CE 00 14    "   "    ldx  #$0014
F934 : DF 10    "  "    stx  X0010
F936 : CE FC F7    "   "    ldx  #$FCF7
F939 : BD FC 55    "  U"    jsr  LFC55
F93C : A6 00    "  "    ldaa  $00,x
F93E : 97 24    " $"    staa  X0024
F940 : CE FC E7    "   "    ldx  #$FCE7
F943 : C6 10    "  "    ldab  #$10
F945 : BD F9 17    "   "    jsr  LF917
F948 : CE FD 07    "   "    ldx  #$FD07
F94B : E6 00    "  "    ldab  $00,x
F94D        LF94D:
F94D : D7 26    " &"    stab  X0026
F94F : DF 10    "  "    stx  X0010
F951        LF951:
F951 : CE 00 14    "   "    ldx  #$0014
F954 : C6 08    "  "    ldab  #$08
F956 : D7 25    " %"    stab  X0025
F958        LF958:
F958 : A6 00    "  "    ldaa  $00,x
F95A : D6 24    " $"    ldab  X0024
F95C : 7D 00 26    "} &"    tst  X0026
F95F : 26 06    "& "    bne  LF967
F961 : A0 08    "  "    suba  $08,x
F963 : A7 00    "  "    staa  $00,x
F965 : C0 03    "  "    subb  #$03
F967        LF967:
F967 : 08    " "    inx
F968 : B7 04 00    "   "    staa  X0400
F96B        LF96B:
F96B : 5A    "Z"    decb
F96C : 26 FD    "& "    bne  LF96B
F96E : 7A 00 25    "z %"    dec  X0025
F971 : 26 E5    "& "    bne  LF958
F973 : 7A 00 26    "z &"    dec  X0026
F976 : 2A D9    "* "    bpl  LF951
F978 : DE 10    "  "    ldx  X0010
F97A : 08    " "    inx
F97B : E6 00    "  "    ldab  $00,x
F97D : 26 CE    "& "    bne  LF94D
F97F        LF97F:
F97F : 20 FE    "  "    bra  LF97F
        ;
F981        LF981:
F981 : CE FD 6F    "  o"    ldx  #$FD6F
F984 : DF 16    "  "    stx  X0016
F986        LF986:
F986 : DE 16    "  "    ldx  X0016
F988 : A6 00    "  "    ldaa  $00,x
F98A : 27 33    "'3"    beq  LF9BF
F98C : E6 01    "  "    ldab  $01,x
F98E : C4 F0    "  "    andb  #$F0
F990 : D7 15    "  "    stab  X0015
F992 : E6 01    "  "    ldab  $01,x
F994 : 08    " "    inx
F995 : 08    " "    inx
F996 : DF 16    "  "    stx  X0016
F998 : 97 14    "  "    staa  X0014
F99A : C4 0F    "  "    andb  #$0F
F99C        LF99C:
F99C : 96 15    "  "    ldaa  X0015
F99E : B7 04 00    "   "    staa  X0400
F9A1 : 96 14    "  "    ldaa  X0014
F9A3        LF9A3:
F9A3 : CE 00 05    "   "    ldx  #$0005
F9A6        LF9A6:
F9A6 : 09    " "    dex
F9A7 : 26 FD    "& "    bne  LF9A6
F9A9 : 4A    "J"    deca
F9AA : 26 F7    "& "    bne  LF9A3
F9AC : 7F 04 00    "   "    clr  X0400
F9AF : 96 14    "  "    ldaa  X0014
F9B1        LF9B1:
F9B1 : CE 00 05    "   "    ldx  #$0005
F9B4        LF9B4:
F9B4 : 09    " "    dex
F9B5 : 26 FD    "& "    bne  LF9B4
F9B7 : 4A    "J"    deca
F9B8 : 26 F7    "& "    bne  LF9B1
F9BA : 5A    "Z"    decb
F9BB : 26 DF    "& "    bne  LF99C
F9BD : 20 C7    "  "    bra  LF986
F9BF        LF9BF:
F9BF : 39    "9"    rts
        ;
F9C0 : 96 05    "  "    ldaa  X0005
F9C2 : 8A 80    "  "    oraa  #$80
F9C4 : 97 05    "  "    staa  X0005
F9C6 : D6 04    "  "    ldab  X0004
F9C8 : C4 7F    "  "    andb  #$7F
F9CA : C1 24    " $"    cmpb  #$24
F9CC : 26 01    "& "    bne  LF9CF
F9CE : 5F    "_"    clrb
F9CF        LF9CF:
F9CF : 5C    "\"    incb
F9D0 : D7 04    "  "    stab  X0004
F9D2 : 39    "9"    rts
        ;
F9D3        LF9D3:
F9D3 : 86 07    "  "    ldaa  #$07
F9D5 : BD F8 2E    "  ."    jsr  LF82E
F9D8 : D6 04    "  "    ldab  X0004
F9DA : C1 20    "  "    cmpb  #$20
F9DC : 23 02    "# "    bls  LF9E0
F9DE : C6 20    "  "    ldab  #$20
F9E0        LF9E0:
F9E0 : CE 00 38    "  8"    ldx  #$0038
F9E3 : 86 20    "  "    ldaa  #$20
F9E5 : 10    " "    sba
F9E6 : 16    " "    tab
F9E7        LF9E7:
F9E7 : C1 0F    "  "    cmpb  #$0F
F9E9 : 23 08    "# "    bls  LF9F3
F9EB : 86 10    "  "    ldaa  #$10
F9ED : BD FC 55    "  U"    jsr  LFC55
F9F0 : 5A    "Z"    decb
F9F1 : 20 F4    "  "    bra  LF9E7
        ;
F9F3        LF9F3:
F9F3 : 86 08    "  "    ldaa  #$08
F9F5 : BD FC 55    "  U"    jsr  LFC55
F9F8 : 5A    "Z"    decb
F9F9 : 26 F8    "& "    bne  LF9F3
F9FB : DF 19    "  "    stx  X0019
F9FD : 96 0A    "  "    ldaa  X000A
F9FF : 48    "H"    asla
FA00 : 9B 0A    "  "    adda  X000A
FA02 : 8B 0B    "  "    adda  #$0B
FA04 : 97 0A    "  "    staa  X000A
FA06 : 97 14    "  "    staa  X0014
FA08        LFA08:
FA08 : BD F8 43    "  C"    jsr  LF843
FA0B : 20 FB    "  "    bra  LFA08
        ;
FA0D : 7F 00 04    "   "    clr  X0004
FA10 : 7F 00 05    "   "    clr  X0005
FA13 : 39    "9"    rts
        ;
FA14 : 96 04    "  "    ldaa  X0004
FA16 : 8A 80    "  "    oraa  #$80
FA18 : 97 04    "  "    staa  X0004
FA1A : 96 05    "  "    ldaa  X0005
FA1C : 84 7F    "  "    anda  #$7F
FA1E : 81 1D    "  "    cmpa  #$1D
FA20 : 26 01    "& "    bne  LFA23
FA22 : 4F    "O"    clra
FA23        LFA23:
FA23 : 4C    "L"    inca
FA24 : 97 05    "  "    staa  X0005
FA26 : 39    "9"    rts
        ;
FA27        LFA27:
FA27 : 86 0F    "  "    ldaa  #$0F
FA29 : BD FA 88    "   "    jsr  LFA88
FA2C : 96 05    "  "    ldaa  X0005
FA2E : 48    "H"    asla
FA2F : 48    "H"    asla
FA30 : 43    "C"    coma
FA31 : BD FB 42    "  B"    jsr  LFB42
FA34        LFA34:
FA34 : 7C 00 18    "|  "    inc  X0018
FA37 : BD FB 44    "  D"    jsr  LFB44
FA3A : 20 F8    "  "    bra  LFA34
        ;
FA3C : 86 08    "  "    ldaa  #$08
FA3E : BD F8 2E    "  ."    jsr  LF82E
FA41 : D6 06    "  "    ldab  X0006
FA43 : C1 1F    "  "    cmpb  #$1F
FA45 : 26 01    "& "    bne  LFA48
FA47 : 5F    "_"    clrb
FA48        LFA48:
FA48 : 5C    "\"    incb
FA49 : D7 06    "  "    stab  X0006
FA4B : 86 20    "  "    ldaa  #$20
FA4D : 10    " "    sba
FA4E : 5F    "_"    clrb
FA4F        LFA4F:
FA4F : 81 14    "  "    cmpa  #$14
FA51 : 23 05    "# "    bls  LFA58
FA53 : CB 0E    "  "    addb  #$0E
FA55 : 4A    "J"    deca
FA56 : 20 F7    "  "    bra  LFA4F
        ;
FA58        LFA58:
FA58 : CB 05    "  "    addb  #$05
FA5A : 4A    "J"    deca
FA5B : 26 FB    "& "    bne  LFA58
FA5D : D7 14    "  "    stab  X0014
FA5F        LFA5F:
FA5F : BD F8 43    "  C"    jsr  LF843
FA62 : 20 FB    "  "    bra  LFA5F
        ;
FA64 : 96 07    "  "    ldaa  X0007
FA66 : 26 0B    "& "    bne  LFA73
FA68 : 7C 00 07    "|  "    inc  X0007
FA6B : 86 0D    "  "    ldaa  #$0D
FA6D : BD FA 88    "   "    jsr  LFA88
FA70 : 7E FA EE    "~  "    jmp  LFAEE
FA73        LFA73:
FA73 : 7E FB 37    "~ 7"    jmp  LFB37
        ;
FA76 : 96 08    "  "    ldaa  X0008
FA78 : 26 0B    "& "    bne  LFA85
FA7A : 7C 00 08    "|  "    inc  X0008
FA7D : 86 0E    "  "    ldaa  #$0E
FA7F : BD FA 88    "   "    jsr  LFA88
FA82 : 7E FA EE    "~  "    jmp  LFAEE
FA85        LFA85:
FA85 : 7E FB 37    "~ 7"    jmp  LFB37
        ;
FA88        LFA88:
FA88 : 16    " "    tab
FA89 : 58    "X"    aslb
FA8A : 1B    " "    aba
FA8B : 1B    " "    aba
FA8C : 1B    " "    aba
FA8D : CE FE 68    "  h"    ldx  #$FE68
FA90 : BD FC 55    "  U"    jsr  LFC55
FA93 : A6 00    "  "    ldaa  $00,x
FA95 : 16    " "    tab
FA96 : 84 0F    "  "    anda  #$0F
FA98 : 97 15    "  "    staa  X0015
FA9A : 54    "T"    lsrb
FA9B : 54    "T"    lsrb
FA9C : 54    "T"    lsrb
FA9D : 54    "T"    lsrb
FA9E : D7 14    "  "    stab  X0014
FAA0 : A6 01    "  "    ldaa  $01,x
FAA2 : 16    " "    tab
FAA3 : 54    "T"    lsrb
FAA4 : 54    "T"    lsrb
FAA5 : 54    "T"    lsrb
FAA6 : 54    "T"    lsrb
FAA7 : D7 16    "  "    stab  X0016
FAA9 : 84 0F    "  "    anda  #$0F
FAAB : 97 12    "  "    staa  X0012
FAAD : DF 0C    "  "    stx  X000C
FAAF : CE FD 8D    "   "    ldx  #$FD8D
FAB2        LFAB2:
FAB2 : 7A 00 12    "z  "    dec  X0012
FAB5 : 2B 08    "+ "    bmi  LFABF
FAB7 : A6 00    "  "    ldaa  $00,x
FAB9 : 4C    "L"    inca
FABA : BD FC 55    "  U"    jsr  LFC55
FABD : 20 F3    "  "    bra  LFAB2
        ;
FABF        LFABF:
FABF : DF 19    "  "    stx  X0019
FAC1 : BD FB 7E    "  ~"    jsr  LFB7E
FAC4 : DE 0C    "  "    ldx  X000C
FAC6 : A6 02    "  "    ldaa  $02,x
FAC8 : 97 1B    "  "    staa  X001B
FACA : BD FB 90    "   "    jsr  LFB90
FACD : DE 0C    "  "    ldx  X000C
FACF : A6 03    "  "    ldaa  $03,x
FAD1 : 97 17    "  "    staa  X0017
FAD3 : A6 04    "  "    ldaa  $04,x
FAD5 : 97 18    "  "    staa  X0018
FAD7 : A6 05    "  "    ldaa  $05,x
FAD9 : 16    " "    tab
FADA : A6 06    "  "    ldaa  $06,x
FADC : CE FE D8    "   "    ldx  #$FED8
FADF : BD FC 55    "  U"    jsr  LFC55
FAE2 : 17    " "    tba
FAE3 : DF 1C    "  "    stx  X001C
FAE5 : 7F 00 24    "  $"    clr  X0024
FAE8 : BD FC 55    "  U"    jsr  LFC55
FAEB : DF 1E    "  "    stx  X001E
FAED : 39    "9"    rts
        ;
FAEE        LFAEE:
FAEE : 96 14    "  "    ldaa  X0014
FAF0 : 97 23    " #"    staa  X0023
FAF2        LFAF2:
FAF2 : DE 1C    "  "    ldx  X001C
FAF4 : DF 0E    "  "    stx  X000E
FAF6        LFAF6:
FAF6 : DE 0E    "  "    ldx  X000E
FAF8 : A6 00    "  "    ldaa  $00,x
FAFA : 9B 24    " $"    adda  X0024
FAFC : 97 22    " ""    staa  X0022
FAFE : 9C 1E    "  "    cpx  X001E
FB00 : 27 26    "'&"    beq  LFB28
FB02 : D6 15    "  "    ldab  X0015
FB04 : 08    " "    inx
FB05 : DF 0E    "  "    stx  X000E
FB07        LFB07:
FB07 : CE 00 25    "  %"    ldx  #$0025
FB0A        LFB0A:
FB0A : 96 22    " ""    ldaa  X0022
FB0C        LFB0C:
FB0C : 4A    "J"    deca
FB0D : 26 FD    "& "    bne  LFB0C
FB0F : A6 00    "  "    ldaa  $00,x
FB11 : B7 04 00    "   "    staa  X0400
FB14 : 08    " "    inx
FB15 : 9C 20    "  "    cpx  X0020
FB17 : 26 F1    "& "    bne  LFB0A
FB19 : 5A    "Z"    decb
FB1A : 27 DA    "' "    beq  LFAF6
FB1C : 08    " "    inx
FB1D : 09    " "    dex
FB1E : 08    " "    inx
FB1F : 09    " "    dex
FB20 : 08    " "    inx
FB21 : 09    " "    dex
FB22 : 08    " "    inx
FB23 : 09    " "    dex
FB24 : 01    " "    nop
FB25 : 01    " "    nop
FB26 : 20 DF    "  "    bra  LFB07
        ;
FB28        LFB28:
FB28 : 96 16    "  "    ldaa  X0016
FB2A : 8D 64    " d"    bsr  LFB90
FB2C : 7A 00 23    "z #"    dec  X0023
FB2F : 26 C1    "& "    bne  LFAF2
FB31 : 96 07    "  "    ldaa  X0007
FB33 : 9A 08    "  "    oraa  X0008
FB35 : 26 46    "&F"    bne  LFB7D
FB37        LFB37:
FB37 : 96 17    "  "    ldaa  X0017
FB39 : 27 42    "'B"    beq  LFB7D
FB3B : 7A 00 18    "z  "    dec  X0018
FB3E : 27 3D    "'="    beq  LFB7D
FB40 : 9B 24    " $"    adda  X0024
FB42        LFB42:
FB42 : 97 24    " $"    staa  X0024
FB44        LFB44:
FB44 : DE 1C    "  "    ldx  X001C
FB46 : 5F    "_"    clrb
FB47        LFB47:
FB47 : 96 24    " $"    ldaa  X0024
FB49 : 7D 00 17    "}  "    tst  X0017
FB4C : 2B 06    "+ "    bmi  LFB54
FB4E : AB 00    "  "    adda  $00,x
FB50 : 25 08    "% "    bcs  LFB5A
FB52 : 20 0B    "  "    bra  LFB5F
        ;
FB54        LFB54:
FB54 : AB 00    "  "    adda  $00,x
FB56 : 27 02    "' "    beq  LFB5A
FB58 : 25 05    "% "    bcs  LFB5F
FB5A        LFB5A:
FB5A : 5D    "]"    tstb
FB5B : 27 08    "' "    beq  LFB65
FB5D : 20 0F    "  "    bra  LFB6E
        ;
FB5F        LFB5F:
FB5F : 5D    "]"    tstb
FB60 : 26 03    "& "    bne  LFB65
FB62 : DF 1C    "  "    stx  X001C
FB64 : 5C    "\"    incb
FB65        LFB65:
FB65 : 08    " "    inx
FB66 : 9C 1E    "  "    cpx  X001E
FB68 : 26 DD    "& "    bne  LFB47
FB6A : 5D    "]"    tstb
FB6B : 26 01    "& "    bne  LFB6E
FB6D : 39    "9"    rts
        ;
FB6E        LFB6E:
FB6E : DF 1E    "  "    stx  X001E
FB70 : 96 16    "  "    ldaa  X0016
FB72 : 27 06    "' "    beq  LFB7A
FB74 : 8D 08    "  "    bsr  LFB7E
FB76 : 96 1B    "  "    ldaa  X001B
FB78 : 8D 16    "  "    bsr  LFB90
FB7A        LFB7A:
FB7A : 7E FA EE    "~  "    jmp  LFAEE
FB7D        LFB7D:
FB7D : 39    "9"    rts
        ;
FB7E        LFB7E:
FB7E : CE 00 25    "  %"    ldx  #$0025
FB81 : DF 10    "  "    stx  X0010
FB83 : DE 19    "  "    ldx  X0019
FB85 : E6 00    "  "    ldab  $00,x
FB87 : 08    " "    inx
FB88 : BD F9 17    "   "    jsr  LF917
FB8B : DE 10    "  "    ldx  X0010
FB8D : DF 20    "  "    stx  X0020
FB8F : 39    "9"    rts
        ;
FB90        LFB90:
FB90 : 4D    "M"    tsta
FB91 : 27 2B    "'+"    beq  LFBBE
FB93 : DE 19    "  "    ldx  X0019
FB95 : DF 0E    "  "    stx  X000E
FB97 : CE 00 25    "  %"    ldx  #$0025
FB9A : 97 13    "  "    staa  X0013
FB9C        LFB9C:
FB9C : DF 10    "  "    stx  X0010
FB9E : DE 0E    "  "    ldx  X000E
FBA0 : D6 13    "  "    ldab  X0013
FBA2 : D7 12    "  "    stab  X0012
FBA4 : E6 01    "  "    ldab  $01,x
FBA6 : 54    "T"    lsrb
FBA7 : 54    "T"    lsrb
FBA8 : 54    "T"    lsrb
FBA9 : 54    "T"    lsrb
FBAA : 08    " "    inx
FBAB : DF 0E    "  "    stx  X000E
FBAD : DE 10    "  "    ldx  X0010
FBAF : A6 00    "  "    ldaa  $00,x
FBB1        LFBB1:
FBB1 : 10    " "    sba
FBB2 : 7A 00 12    "z  "    dec  X0012
FBB5 : 26 FA    "& "    bne  LFBB1
FBB7 : A7 00    "  "    staa  $00,x
FBB9 : 08    " "    inx
FBBA : 9C 20    "  "    cpx  X0020
FBBC : 26 DE    "& "    bne  LFB9C
FBBE        LFBBE:
FBBE : 39    "9"    rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FBBF : 8E 00 7F    "   "    lds  #$007F
FBC2 : B6 04 02    "   "    ldaa  X0402
FBC5 : C6 80    "  "    ldab  #$80
FBC7 : F7 04 02    "   "    stab  X0402
FBCA : 7C 00 09    "|  "    inc  X0009
FBCD : 43    "C"    coma
FBCE : 84 7F    "  "    anda  #$7F
FBD0 : 36    "6"    psha
FBD1 : 84 5F    " _"    anda  #$5F
FBD3 : 81 16    "  "    cmpa  #$16
FBD5 : 27 03    "' "    beq  LFBDA
FBD7 : 7F 00 07    "   "    clr  X0007
FBDA        LFBDA:
FBDA : 81 18    "  "    cmpa  #$18
FBDC : 27 03    "' "    beq  LFBE1
FBDE : 7F 00 08    "   "    clr  X0008
FBE1        LFBE1:
FBE1 : 32    "2"    pula
FBE2 : 85 20    "  "    bita  #$20
FBE4 : 27 1C    "' "    beq  LFC02
FBE6 : F6 DF FD    "   "    ldab  XDFFD
FBE9 : C1 7E    " ~"    cmpb  #$7E
FBEB : 26 15    "& "    bne  LFC02
FBED : BD DF FD    "   "    jsr  LDFFD
FBF0 : 0E    " "    cli
FBF1 : F6 04 02    "   "    ldab  X0402
FBF4 : D6 13    "  "    ldab  X0013
FBF6 : 26 0A    "& "    bne  LFC02
FBF8 : 81 14    "  "    cmpa  #$14
FBFA : 27 06    "' "    beq  LFC02
FBFC : CE 2E E0    " . "    ldx  #$2EE0
FBFF        LFBFF:
FBFF : 09    " "    dex
FC00 : 26 FD    "& "    bne  LFBFF
FC02        LFC02:
FC02 : 0E    " "    cli
FC03 : 85 40    " @"    bita  #$40
FC05 : 27 09    "' "    beq  LFC10
FC07 : 84 1F    "  "    anda  #$1F
FC09 : 81 01    "  "    cmpa  #$01
FC0B : 27 03    "' "    beq  LFC10
FC0D : 7E F9 2B    "~ +"    jmp  LF92B
        ;
FC10        LFC10:
FC10 : 84 1F    "  "    anda  #$1F
FC12 : 27 2A    "'*"    beq  LFC3E
FC14 : 4A    "J"    deca
FC15 : 27 4D    "'M"    beq  LFC64
FC17 : 81 0D    "  "    cmpa  #$0D
FC19 : 22 09    "" "    bhi  LFC24
FC1B : 4A    "J"    deca
FC1C : BD FA 88    "   "    jsr  LFA88
FC1F : BD FA EE    "   "    jsr  LFAEE
FC22 : 20 1A    "  "    bra  LFC3E
        ;
FC24        LFC24:
FC24 : 81 17    "  "    cmpa  #$17
FC26 : 22 0E    "" "    bhi  LFC36
FC28 : 80 0E    "  "    suba  #$0E
FC2A : 48    "H"    asla
FC2B : CE FC D3    "   "    ldx  #$FCD3
FC2E : 8D 25    " %"    bsr  LFC55
FC30 : EE 00    "  "    ldx  $00,x
FC32 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
FC34 : 20 08    "  "    bra  LFC3E
        ;
FC36        LFC36:
FC36 : 80 18    "  "    suba  #$18
FC38 : BD F8 2E    "  ."    jsr  LF82E
FC3B : BD F8 43    "  C"    jsr  LF843
FC3E        LFC3E:
FC3E : 96 04    "  "    ldaa  X0004
FC40 : 9A 05    "  "    oraa  X0005
FC42        LFC42:
FC42 : 27 FE    "' "    beq  LFC42
FC44 : 4F    "O"    clra
FC45 : 97 07    "  "    staa  X0007
FC47 : 97 08    "  "    staa  X0008
FC49 : 96 04    "  "    ldaa  X0004
FC4B : 27 05    "' "    beq  LFC52
FC4D : 2B 03    "+ "    bmi  LFC52
FC4F : 7E F9 D3    "~  "    jmp  LF9D3
FC52        LFC52:
FC52 : 7E FA 27    "~ '"    jmp  LFA27
        ;
FC55        LFC55:
FC55 : DF 0E    "  "    stx  X000E
FC57 : 9B 0F    "  "    adda  X000F
FC59 : 97 0F    "  "    staa  X000F
FC5B : 96 0E    "  "    ldaa  X000E
FC5D : 89 00    "  "    adca  #$00
FC5F : 97 0E    "  "    staa  X000E
FC61 : DE 0E    "  "    ldx  X000E
FC63 : 39    "9"    rts
        ;
FC64        LFC64:
FC64 : CE 00 E0    "   "    ldx  #$00E0
FC67        LFC67:
FC67 : 86 20    "  "    ldaa  #$20
FC69 : 8D EA    "  "    bsr  LFC55
FC6B        LFC6B:
FC6B : 09    " "    dex
FC6C : 26 FD    "& "    bne  LFC6B
FC6E : 7F 04 00    "   "    clr  X0400
FC71        LFC71:
FC71 : 5A    "Z"    decb
FC72 : 26 FD    "& "    bne  LFC71
FC74 : 73 04 00    "s  "    com  X0400
FC77 : DE 0E    "  "    ldx  X000E
FC79 : 8C 10 00    "   "    cpx  #$1000
FC7C : 26 E9    "& "    bne  LFC67
FC7E : 20 BE    "  "    bra  LFC3E
        ;
FC80        LFC80:
FC80 : 0F    " "    sei
FC81 : 8E 00 7F    "   "    lds  #$007F
FC84 : CE FF FF    "   "    ldx  #$FFFF
FC87 : 5F    "_"    clrb
FC88        LFC88:
FC88 : E9 00    "  "    adcb  $00,x
FC8A : 09    " "    dex
FC8B : 8C F8 00    "   "    cpx  #$F800
FC8E : 26 F8    "& "    bne  LFC88
FC90 : E1 00    "  "    cmpb  $00,x
FC92 : 27 01    "' "    beq  LFC95
FC94 : 3E    ">"    wai
FC95        LFC95:
FC95 : 7F 04 02    "   "    clr  X0402
FC98 : CE 2E E0    " . "    ldx  #$2EE0
FC9B        LFC9B:
FC9B : 09    " "    dex
FC9C : 26 FD    "& "    bne  LFC9B
FC9E : BD F9 81    "   "    jsr  LF981
FCA1 : BD F9 81    "   "    jsr  LF981
FCA4 : BD F9 81    "   "    jsr  LF981
FCA7 : 86 80    "  "    ldaa  #$80
FCA9 : B7 04 02    "   "    staa  X0402
FCAC : 86 01    "  "    ldaa  #$01
FCAE : BD FA 88    "   "    jsr  LFA88
FCB1 : BD FA EE    "   "    jsr  LFAEE
FCB4 : 86 0B    "  "    ldaa  #$0B
FCB6 : BD FA 88    "   "    jsr  LFA88
FCB9 : BD FA EE    "   "    jsr  LFAEE
FCBC : BD F8 90    "   "    jsr  LF890
FCBF : 86 02    "  "    ldaa  #$02
FCC1 : BD F8 2E    "  ."    jsr  LF82E
FCC4 : BD F8 43    "  C"    jsr  LF843
FCC7 : F6 DF FA    "   "    ldab  XDFFA
FCCA : C1 7E    " ~"    cmpb  #$7E
FCCC : 26 B2    "& "    bne  LFC80
FCCE : BD DF FA    "   "    jsr  LDFFA
FCD1 : 20 AD    "  "    bra  LFC80
        ;
FCD3 : F8 98 F9    "   "    eorb  X98F9
FCD6 : 81 F9    "  "    cmpa  #$F9
FCD8 : C0 FA    "  "    subb  #$FA
        ;
FCDA : 3C    "<"    db  $3C
        ;
FCDB : FA 0D F8    "   "    orab  X0DF8
FCDE : D1 FA    "  "    cmpb  X00FA
        ;
FCE0 : 14    " "    db  $14
        ;
FCE1 : FA 64 F8    " d "    orab  X64F8
FCE4 : 90 FA    "  "    suba  X00FA
FCE6 : 76 DA FF    "v  "    ror  XDAFF
FCE9 : DA 80    "  "    orab  X0080
FCEB : 26 01    "& "    bne  LFCEE
FCED : 26 80    "& "    bne  LFC6F
FCEF : 07    " "    tpa
FCF0 : 0A    " "    clv
FCF1 : 07    " "    tpa
        ;
FCF2 : 00    " "    db  $00
        ;
FCF3 : F9 F6 F9    "   "    adcb  XF6F9
        ;
FCF6 : 00 3A    " :"    db  $00, $3A
        ;
FCF8 : 3E    ">"    wai
FCF9 : 50    "P"    negb
FCFA : 46    "F"    rora
FCFB : 33    "3"    pulb
FCFC : 2C 27    ",'"    bge  LFD25
FCFE : 20 25    " %"    bra  LFD25
        ;
FD00 : 1C 1A    "  "    db  $1C, $1A
        ;
FD02 : 17    " "    tba
        ;
FD03 : 14    " "    db  $14
        ;
FD04 : 11    " "    cba
FD05 : 10    " "    sba
FD06 : 33    "3"    pulb
FD07 : 08    " "    inx
        ;
FD08 : 03 02    "  "    db  $03, $02
        ;
FD0A : 01    " "    nop
        ;
FD0B : 02 03 04 05  "    "    db  $02, $03, $04, $05
        ;
FD0F : 06    " "    tap
FD10 : 0A    " "    clv
        ;
FD11 : 1E    " "    db  $1E
        ;
FD12 : 32    "2"    pula
FD13 : 70 00 40    "p @"    neg  X0040
FD16 : 01    " "    nop
        ;
FD17 : 00    " "    db  $00
        ;
FD18 : 10    " "    sba
FD19 : E1 00    "  "    cmpb  $00,x
FD1B : 80 FF    "  "    suba  #$FF
FD1D : FF 20 01    "   "    stx  X2001
        ;
FD20 : 00    " "    db  $00
        ;
FD21 : 08    " "    inx
FD22 : E1 00    "  "    cmpb  $00,x
FD24 : 80 FF    "  "    suba  #$FF
FD26 : FF 28 01    " ( "    stx  X2801
        ;
FD29 : 00    " "    db  $00
        ;
FD2A : 08    " "    inx
FD2B : 81 02    "  "    cmpa  #$02
        ;
FD2D : 00    " "    db  $00
        ;
FD2E : FF FF 00    "   "    stx  XFF00
FD31 : FF 08 FF    "   "    stx  X08FF
FD34 : 68 04    "h "    asl  $04,x
FD36 : 80 00    "  "    suba  #$00
FD38 : FF 28 81    " ( "    stx  X2881
        ;
FD3B : 00 FC    "  "    db  $00, $FC
        ;
FD3D : 01    " "    nop
        ;
FD3E : 02 00 FC    "   "    db  $02, $00, $FC
        ;
FD41 : FF 01 01    "   "    stx  X0101
        ;
FD44 : 00    " "    db  $00
        ;
FD45 : 08    " "    inx
FD46 : 81 02    "  "    cmpa  #$02
        ;
FD48 : 00    " "    db  $00
        ;
FD49 : 01    " "    nop
FD4A : FF 01 08    "   "    stx  X0108
        ;
FD4D : 00    " "    db  $00
        ;
FD4E : 01    " "    nop
FD4F : 20 01    "  "    bra  LFD52
        ;
FD51 : 00    " "    db  $00
        ;
FD52        LFD52:
FD52 : 01    " "    nop
FD53 : FF 60 01    " ` "    stx  X6001
FD56 : 57    "W"    asrb
FD57 : 08    " "    inx
FD58 : E1 02    "  "    cmpb  $02,x
        ;
FD5A : 00    " "    db  $00
        ;
FD5B : FE B0 FF    "   "    ldx  XB0FF
FD5E : 01    " "    nop
        ;
FD5F : 00 18 41 04  "  A "    db  $00, $18, $41, $04
        ;
FD63 : 80 00    "  "    suba  #$00
FD65 : FF FF 01    "   "    stx  XFF01
        ;
FD68 : 00    " "    db  $00
        ;
FD69 : 50    "P"    negb
        ;
FD6A : 41 04    "A "    db  $41, $04
        ;
FD6C : 80 FF    "  "    suba  #$FF
FD6E : FF 01 FC    "   "    stx  X01FC
        ;
FD71 : 02 FC 03    "   "    db  $02, $FC, $03
        ;
FD74 : F8 04 F8    "   "    eorb  X04F8
FD77 : 06    " "    tap
FD78 : F8 08 F4    "   "    eorb  X08F4
FD7B : 0C    " "    clc
FD7C : F4 10 F4    "   "    andb  X10F4
FD7F : 20 F2    "  "    bra  LFD73
        ;
FD81 : 40    "@"    nega
FD82 : F1 60 F1    " ` "    cmpb  X60F1
FD85 : 80 F1    "  "    suba  #$F1
FD87 : A0 F1    "  "    suba  $F1,x
FD89 : C0 F1    "  "    subb  #$F1
        ;
FD8B : 00 00    "  "    db  $00, $00
        ;
FD8D : 08    " "    inx
FD8E : 7F D9 FF    "   "    clr  XD9FF
FD91 : D9 7F    "  "    adcb  X007F
FD93 : 24 00    "$ "    bcc  LFD95
FD95        LFD95:
FD95 : 24 08    "$ "    bcc  LFD9F
FD97 : FF FF FF    "   "    stx  XFFFF
FD9A : FF 00 00    "   "    stx  X0000
        ;
FD9D : 00 00    "  "    db  $00, $00
        ;
FD9F        LFD9F:
FD9F : 08    " "    inx
        ;
FDA0 : 00    " "    db  $00
        ;
FDA1 : 40    "@"    nega
FDA2 : 80 00    "  "    suba  #$00
FDA4 : FF 00 80    "   "    stx  X0080
FDA7 : 40    "@"    nega
FDA8 : 10    " "    sba
FDA9 : 7F B0 D9    "   "    clr  XB0D9
FDAC : F5 FF F5    "   "    bitb  XFFF5
FDAF : D9 B0    "  "    adcb  X00B0
FDB1 : 7F 4E 24    " N$"    clr  X4E24
FDB4 : 09    " "    dex
        ;
FDB5 : 00    " "    db  $00
        ;
FDB6 : 09    " "    dex
FDB7 : 24 4E    "$N"    bcc  LFE07
FDB9 : 10    " "    sba
FDBA : 7F C5 EC    "   "    clr  XC5EC
FDBD : E7 BF    "  "    stab  $BF,x
FDBF : 8D 6D    " m"    bsr  LFE2E
FDC1 : 6A 7F    "j "    dec  $7F,x
FDC3 : 94 92    "  "    anda  X0092
        ;
FDC5 : 71    "q"    db  $71
        ;
FDC6 : 40    "@"    nega
FDC7 : 17    " "    tba
        ;
FDC8 : 12    " "    db  $12
        ;
FDC9 : 39    "9"    rts
        ;
FDCA : 10    " "    sba
FDCB : 76 FF B8    "v  "    ror  XFFB8
FDCE : D0 9D    "  "    subb  X009D
FDD0 : E6 6A    " j"    ldab  $6A,x
FDD2 : 82 76    " v"    sbca  #$76
FDD4 : EA 81    "  "    orab  $81,x
FDD6 : 86 4E    " N"    ldaa  #$4E
FDD8 : 9C 32    " 2"    cpx  X0032
FDDA : 63 10    "c "    com  $10,x
FDDC : FF FF FF    "   "    stx  XFFFF
FDDF : FF FF FF    "   "    stx  XFFFF
FDE2 : FF FF 00    "   "    stx  XFF00
        ;
FDE5 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDE9 : 00 00 00    "   "    db  $00, $00, $00
        ;
FDEC : 10    " "    sba
FDED : FF FF FF    "   "    stx  XFFFF
FDF0 : FF 00 00    "   "    stx  X0000
        ;
FDF3 : 00 00    "  "    db  $00, $00
        ;
FDF5 : FF FF FF    "   "    stx  XFFFF
FDF8 : FF 00 00    "   "    stx  X0000
        ;
FDFB : 00 00    "  "    db  $00, $00
        ;
FDFD : 10    " "    sba
        ;
FDFE : 00    " "    db  $00
        ;
FDFF : F4 00 E8    "   "    andb  X00E8
        ;
FE02 : 00 DC 00    "   "    db  $00, $DC, $00
        ;
FE05 : E2 00    "  "    sbcb  $00,x
        ;
FE07        LFE07:
FE07 : DC 00    "  "    db  $DC, $00
        ;
FE09 : E8 00    "  "    eorb  $00,x
FE0B : F4 00 00    "   "    andb  X0000
FE0E : 48    "H"    asla
FE0F : 8A 95    "  "    oraa  #$95
FE11 : A0 AB    "  "    suba  $AB,x
FE13 : B5 BF C8    "   "    bita  XBFC8
FE16 : D1 DA    "  "    cmpb  X00DA
FE18 : E1 E8    "  "    cmpb  $E8,x
FE1A : EE F3    "  "    ldx  $F3,x
FE1C : F7 FB FD    "   "    stab  XFBFD
FE1F : FE FF FE    "   "    ldx  XFFFE
        ;
FE22 : FD    " "    db  $FD
        ;
FE23 : FB F7 F3    "   "    addb  XF7F3
FE26 : EE E8    "  "    ldx  $E8,x
FE28 : E1 DA    "  "    cmpb  $DA,x
FE2A : D1 C8    "  "    cmpb  X00C8
FE2C : BF B5 AB    "   "    sts  XB5AB
FE2F : A0 95    "  "    suba  $95,x
FE31 : 8A 7F    "  "    oraa  #$7F
        ;
FE33 : 75    "u"    db  $75
        ;
FE34 : 6A 5F    "j_"    dec  $5F,x
FE36 : 54    "T"    lsrb
FE37 : 4A    "J"    deca
FE38 : 40    "@"    nega
FE39 : 37    "7"    pshb
FE3A : 2E 25    ".%"    bgt  LFE61
        ;
FE3C : 1E    " "    db  $1E
        ;
FE3D : 17    " "    tba
FE3E : 11    " "    cba
FE3F : 0C    " "    clc
FE40 : 08    " "    inx
        ;
FE41 : 04 02    "  "    db  $04, $02
        ;
FE43 : 01    " "    nop
        ;
FE44 : 00    " "    db  $00
        ;
FE45        LFE45:
FE45 : 01    " "    nop
        ;
FE46 : 02 04    "  "    db  $02, $04
        ;
FE48 : 08    " "    inx
FE49 : 0C    " "    clc
FE4A : 11    " "    cba
FE4B : 17    " "    tba
        ;
FE4C : 1E    " "    db  $1E
        ;
FE4D : 25 2E    "%."    bcs  LFE7D
FE4F : 37    "7"    pshb
FE50 : 40    "@"    nega
FE51 : 4A    "J"    deca
FE52 : 54    "T"    lsrb
FE53 : 5F    "_"    clrb
FE54 : 6A 75    "ju"    dec  $75,x
FE56 : 7F 10 59    "  Y"    clr  X1059
        ;
FE59 : 7B    "{"    db  $7B
        ;
FE5A : 98 AC    "  "    eora  X00AC
        ;
FE5C : B3    " "    db  $B3
        ;
FE5D : AC 98    "  "    cpx  $98,x
        ;
FE5F : 7B    "{"    db  $7B
        ;
FE60 : 59    "Y"    rolb
FE61        LFE61:
FE61 : 37    "7"    pshb
FE62 : 19    " "    daa
FE63 : 06    " "    tap
        ;
FE64 : 00    " "    db  $00
        ;
FE65 : 06    " "    tap
FE66 : 19    " "    daa
FE67 : 37    "7"    pshb
        ;
FE68 : 14    " "    db  $14
        ;
FE69 : 10    " "    sba
        ;
FE6A : 00    " "    db  $00
        ;
FE6B : 01    " "    nop
        ;
FE6C : 00    " "    db  $00
        ;
FE6D : 01    " "    nop
FE6E : 6A 81    "j "    dec  $81,x
FE70 : 27 00    "' "    beq  LFE72
        ;
FE72        LFE72:
FE72 : 00 00    "  "    db  $00, $00
        ;
FE74 : 16    " "    tab
FE75 : 54    "T"    lsrb
        ;
FE76 : 12    " "    db  $12
        ;
FE77 : 09    " "    dex
        ;
FE78 : 1A    " "    db  $1A
        ;
FE79 : FF 00 27    "  '"    stx  X0027
FE7C : 91 11    "  "    cmpa  X0011
FE7E : 09    " "    dex
FE7F : 11    " "    cba
FE80 : 01    " "    nop
FE81 : 0F    " "    sei
FE82 : 01    " "    nop
FE83 : 6A 11    "j "    dec  $11,x
FE85 : 32    "2"    pula
        ;
FE86 : 00    " "    db  $00
        ;
FE87 : 01    " "    nop
        ;
FE88 : 00    " "    db  $00
        ;
FE89 : 0D    " "    sec
FE8A : 1B    " "    aba
        ;
FE8B : 14    " "    db  $14
        ;
FE8C : 11    " "    cba
        ;
FE8D : 00 00 00    "   "    db  $00, $00, $00
        ;
FE90 : 0E    " "    cli
FE91 : 0D    " "    sec
FE92 : F4 13 00    "   "    andb  X1300
        ;
FE95 : 00 00 14    "   "    db  $00, $00, $14
        ;
FE98 : 6A 41    "jA"    dec  $41,x
FE9A : 49    "I"    rola
        ;
FE9B : 00 00 00    "   "    db  $00, $00, $00
        ;
FE9E : 0F    " "    sei
FE9F : 7E 21 39    "~!9"    jmp  L2139
        ;
FEA2 : 11    " "    cba
FEA3 : FF 00 0D    "   "    stx  X000D
FEA6 : 1B    " "    aba
        ;
FEA7 : 42    "B"    db  $42
        ;
FEA8 : 46    "F"    rora
        ;
FEA9 : 00 00 00    "   "    db  $00, $00, $00
        ;
FEAC : 0E    " "    cli
FEAD : 28 15    "( "    bvc  LFEC4
        ;
FEAF : 00 00 FD 00  "    "    db  $00, $00, $FD, $00
        ;
FEB3 : 01    " "    nop
FEB4 : 8C F1 18    "   "    cpx  #$F118
        ;
FEB7 : 00 00 00    "   "    db  $00, $00, $00
        ;
FEBA : 0E    " "    cli
FEBB : 28 31    "(1"    bvc  LFEEE
        ;
FEBD : 12 00    "  "    db  $12, $00
        ;
FEBF : 01    " "    nop
        ;
FEC0 : 00 03    "  "    db  $00, $03
        ;
FEC2 : 8D 81    "  "    bsr  LFE45
FEC4        LFEC4:
FEC4 : 09    " "    dex
FEC5 : 11    " "    cba
FEC6 : FF 00 01    "   "    stx  X0001
FEC9 : 90 31    " 1"    suba  X0031
        ;
FECB : 12 00    "  "    db  $12, $00
        ;
FECD : FF 00 0D    "   "    stx  X000D
        ;
FED0 : 00 12    "  "    db  $00, $12
        ;
FED2 : 0A    " "    clv
        ;
FED3 : 00    " "    db  $00
        ;
FED4 : FF 01 09    "   "    stx  X0109
        ;
FED7 : 4B    "K"    db  $4B
        ;
FED8 : A0 98    "  "    suba  $98,x
FEDA : 90 88    "  "    suba  X0088
FEDC : 80 78    " x"    suba  #$78
FEDE : 70 68 60    "ph`"    neg  X6860
FEE1 : 58    "X"    aslb
FEE2 : 50    "P"    negb
FEE3 : 44    "D"    lsra
FEE4 : 40    "@"    nega
FEE5 : 01    " "    nop
FEE6 : 01    " "    nop
        ;
FEE7 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FEEB : 08    " "    inx
FEEC : 08    " "    inx
FEED : 10    " "    sba
FEEE        LFEEE:
FEEE : 10    " "    sba
FEEF : 30    "0"    tsx
FEF0 : 60 C0    "` "    neg  $C0,x
FEF2 : E0 01    "  "    subb  $01,x
FEF4 : 01    " "    nop
        ;
FEF5 : 02 02 03 04  "    "    db  $02, $02, $03, $04
FEF9 : 05    " "    db  $05
        ;
FEFA : 06    " "    tap
FEFB : 07    " "    tpa
FEFC : 08    " "    inx
FEFD : 09    " "    dex
FEFE : 0A    " "    clv
FEFF : 0C    " "    clc
FF00        XFF00:
FF00 : 08    " "    inx
FF01        XFF01:
FF01 : 80 10    "  "    suba  #$10
FF03 : 78 18 70    "x p"    asl  X1870
FF06 : 20 60    " `"    bra  LFF68
        ;
FF08 : 28 58    "(X"    bvc  LFF62
FF0A : 30    "0"    tsx
FF0B : 50    "P"    negb
FF0C : 40    "@"    nega
FF0D : 48    "H"    asla
        ;
FF0E : 04 05    "  "    db  $04, $05
        ;
FF10 : 06    " "    tap
FF11 : 07    " "    tpa
FF12 : 08    " "    inx
FF13 : 0A    " "    clv
FF14 : 0C    " "    clc
FF15 : 0E    " "    cli
FF16 : 10    " "    sba
FF17 : 11    " "    cba
        ;
FF18 : 12 13 14 15  "    "    db  $12, $13, $14, $15
        ;
FF1C : 16    " "    tab
FF1D : 17    " "    tba
        ;
FF1E : 18    " "    db  $18
        ;
FF1F : 19    " "    daa
        ;
FF20 : 1A    " "    db  $1A
        ;
FF21 : 1B    " "    aba
        ;
FF22 : 1C    " "    db  $1C
        ;
FF23 : 80 7C    " |"    suba  #$7C
FF25 : 78 74 70    "xtp"    asl  X7470
FF28 : 74 78 7C    "tx|"    lsr  X787C
FF2B : 80 01    "  "    suba  #$01
FF2D : 01    " "    nop
        ;
FF2E : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FF32 : 08    " "    inx
FF33 : 08    " "    inx
FF34 : 10    " "    sba
FF35 : 20 28    " ("    bra  LFF5F
        ;
FF37 : 30    "0"    tsx
        ;
FF38 : 38    "8"    db  $38
        ;
FF39 : 40    "@"    nega
FF3A : 48    "H"    asla
FF3B : 50    "P"    negb
FF3C : 60 70    "`p"    neg  $70,x
FF3E : 80 A0    "  "    suba  #$A0
FF40 : B0 C0 08    "   "    suba  XC008
FF43 : 40    "@"    nega
FF44 : 08    " "    inx
FF45 : 40    "@"    nega
FF46 : 08    " "    inx
FF47 : 40    "@"    nega
FF48 : 08    " "    inx
FF49 : 40    "@"    nega
FF4A : 08    " "    inx
FF4B : 40    "@"    nega
FF4C : 08    " "    inx
FF4D : 40    "@"    nega
FF4E : 08    " "    inx
FF4F : 40    "@"    nega
FF50 : 08    " "    inx
FF51 : 40    "@"    nega
FF52 : 08    " "    inx
FF53 : 40    "@"    nega
FF54 : 08    " "    inx
FF55 : 40    "@"    nega
FF56 : 01    " "    nop
        ;
FF57 : 02 04    "  "    db  $02, $04
        ;
FF59 : 08    " "    inx
FF5A : 09    " "    dex
FF5B : 0A    " "    clv
FF5C : 0B    " "    sev
FF5D : 0C    " "    clc
FF5E : 0E    " "    cli
FF5F        LFF5F:
FF5F : 0F    " "    sei
FF60 : 10    " "    sba
        ;
FF61 : 12 14    "  "    db  $12, $14
        ;
FF63 : 16    " "    tab
FF64 : 40    "@"    nega
FF65 : 10    " "    sba
FF66 : 08    " "    inx
FF67 : 01    " "    nop
FF68        LFF68:
FF68 : 92 01    "  "    sbca  X0001
FF6A : 01    " "    nop
FF6B : 01    " "    nop
FF6C : 01    " "    nop
        ;
FF6D : 02 02 03 03  "    "    db  $02, $02, $03, $03
FF71 : 04 04 05    "   "    db  $04, $04, $05
        ;
FF74 : 06    " "    tap
FF75 : 08    " "    inx
FF76 : 0A    " "    clv
FF77 : 0C    " "    clc
FF78 : 10    " "    sba
        ;
FF79 : 14 18    "  "    db  $14, $18
        ;
FF7B : 20 30    " 0"    bra  LFFAD
        ;
FF7D : 40    "@"    nega
FF7E : 50    "P"    negb
FF7F : 40    "@"    nega
FF80 : 30    "0"    tsx
FF81 : 20 10    "  "    bra  LFF93
        ;
FF83 : 0C    " "    clc
FF84 : 0A    " "    clv
FF85 : 08    " "    inx
FF86 : 07    " "    tpa
FF87 : 06    " "    tap
        ;
FF88 : 05 04 03 02  "    "    db  $05, $04, $03, $02
FF8C : 02    " "    db  $02
        ;
FF8D : 01    " "    nop
FF8E : 01    " "    nop
FF8F : 01    " "    nop
        ;
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
FFB8        XFFB8:
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
FFF0 : 00 00 00    "   "    db  $00, $00, $00
        ;
FFF3 : 7E FC 55    "~ U"    jmp  LFC55
        ;
FFF6 : DF DA    "  "    stx  X00DA
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FB BF                          ;IRQ 
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FC 80                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------





