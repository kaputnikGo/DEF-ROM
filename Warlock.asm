        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Warlock.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  FD04
        ;  CRC-32:    5D8E46D6
        ;
        ;  Date:    Sun May 16 10:38:51 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;
        ;
          org  $F800
        ;
F800 : 81 0F    "  "    cmpa  #$0F
F802 : 8E 00 7F    "   "    lds  #$007F
F805 : CE 04 00    "   "    ldx  #$0400
F808 : 6F 01    "o "    clr  $01,x
F80A : 6F 03    "o "    clr  $03,x
F80C : 86 FF    "  "    ldaa  #$FF
F80E : A7 00    "  "    staa  $00,x
F810 : 6F 02    "o "    clr  $02,x
F812 : 86 07    "  "    ldaa  #$07
F814 : A7 01    "  "    staa  $01,x
F816 : A7 03    "  "    staa  $03,x
F818 : 97 1C    "  "    staa  X001C
F81A : 7F 00 20    "   "    clr  X0020
F81D : 7F 00 1F    "   "    clr  X001F
F820 : 0E    " "    cli
F821        LF821:
F821 : 20 FE    "  "    bra  LF821
        ;
F823        LF823:
F823 : DF 24    " $"    stx  X0024
F825 : CE F8 C8    "   "    ldx  #$F8C8
F828 : DF 26    " &"    stx  X0026
F82A : 86 80    "  "    ldaa  #$80
F82C        LF82C:
F82C : D6 03    "  "    ldab  X0003
F82E : 2A 09    "* "    bpl  LF839
F830 : D6 1D    "  "    ldab  X001D
F832 : 54    "T"    lsrb
F833 : 54    "T"    lsrb
F834 : 54    "T"    lsrb
F835 : 5C    "\"    incb
F836        LF836:
F836 : 5A    "Z"    decb
F837 : 26 FD    "& "    bne  LF836
F839        LF839:
F839 : 7A 00 08    "z  "    dec  X0008
F83C : 27 4C    "'L"    beq  LF88A
F83E : 7A 00 09    "z  "    dec  X0009
F841 : 27 4C    "'L"    beq  LF88F
F843 : 7A 00 0A    "z  "    dec  X000A
F846 : 27 4C    "'L"    beq  LF894
F848 : 7A 00 0B    "z  "    dec  X000B
F84B : 26 DF    "& "    bne  LF82C
F84D : D6 03    "  "    ldab  X0003
F84F : 27 DB    "' "    beq  LF82C
F851 : C4 7F    "  "    andb  #$7F
F853 : D7 0B    "  "    stab  X000B
F855 : D6 1D    "  "    ldab  X001D
F857 : 58    "X"    aslb
F858 : DB 1D    "  "    addb  X001D
F85A : CB 0B    "  "    addb  #$0B
F85C : D7 1D    "  "    stab  X001D
F85E : 7A 00 1B    "z  "    dec  X001B
F861 : 26 0E    "& "    bne  LF871
F863 : D6 0F    "  "    ldab  X000F
F865 : D7 1B    "  "    stab  X001B
F867 : DE 26    " &"    ldx  X0026
F869 : 09    " "    dex
F86A : 8C F8 C1    "   "    cpx  #$F8C1
F86D : 27 4E    "'N"    beq  LF8BD
F86F : DF 26    " &"    stx  X0026
F871        LF871:
F871 : D6 1D    "  "    ldab  X001D
F873 : 2B 06    "+ "    bmi  LF87B
F875 : D4 07    "  "    andb  X0007
F877 : C4 7F    "  "    andb  #$7F
F879 : 20 05    "  "    bra  LF880
        ;
F87B        LF87B:
F87B : D4 07    "  "    andb  X0007
F87D : C4 7F    "  "    andb  #$7F
F87F : 50    "P"    negb
F880        LF880:
F880 : 36    "6"    psha
F881 : 1B    " "    aba
F882 : 16    " "    tab
F883 : 32    "2"    pula
F884 : DE 26    " &"    ldx  X0026
F886 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
F888 : 20 A2    "  "    bra  LF82C
        ;
F88A        LF88A:
F88A : CE 00 00    "   "    ldx  #$0000
F88D : 20 08    "  "    bra  LF897
        ;
F88F        LF88F:
F88F : CE 00 01    "   "    ldx  #$0001
F892 : 20 03    "  "    bra  LF897
        ;
F894        LF894:
F894 : CE 00 02    "   "    ldx  #$0002
F897        LF897:
F897 : 6D 18    "m "    tst  $18,x
F899 : 27 12    "' "    beq  LF8AD
F89B : 6A 18    "j "    dec  $18,x
F89D : 26 0E    "& "    bne  LF8AD
F89F : E6 0C    "  "    ldab  $0C,x
F8A1 : E7 18    "  "    stab  $18,x
F8A3 : E6 00    "  "    ldab  $00,x
F8A5 : EB 10    "  "    addb  $10,x
F8A7 : E1 14    "  "    cmpb  $14,x
F8A9 : 27 12    "' "    beq  LF8BD
F8AB : E7 00    "  "    stab  $00,x
F8AD        LF8AD:
F8AD : E6 00    "  "    ldab  $00,x
F8AF : E7 08    "  "    stab  $08,x
F8B1 : AB 04    "  "    adda  $04,x
F8B3 : 60 04    "` "    neg  $04,x
F8B5 : 16    " "    tab
F8B6 : DE 26    " &"    ldx  X0026
F8B8 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
F8BA : 7E F8 2C    "~ ,"    jmp  LF82C
        ;
F8BD        LF8BD:
F8BD : DE 24    " $"    ldx  X0024
F8BF : 39    "9"    rts
        ;
F8C0 : 54    "T"    lsrb
F8C1 : 54    "T"    lsrb
F8C2 : 54    "T"    lsrb
F8C3 : 54    "T"    lsrb
F8C4 : 54    "T"    lsrb
F8C5 : 54    "T"    lsrb
F8C6 : 54    "T"    lsrb
F8C7 : 54    "T"    lsrb
F8C8 : F7 04 00    "   "    stab  X0400
F8CB : 39    "9"    rts
        ;
F8CC : CE FC 15    "   "    ldx  #$FC15
F8CF        LF8CF:
F8CF : C6 1C    "  "    ldab  #$1C
F8D1 : BD FA 19    "   "    jsr  LFA19
F8D4 : BD F8 23    "  #"    jsr  LF823
F8D7 : 39    "9"    rts
        ;
F8D8 : CE FC 31    "  1"    ldx  #$FC31
F8DB : 20 F2    "  "    bra  LF8CF
        ;
F8DD : CE FC 4D    "  M"    ldx  #$FC4D
F8E0 : 20 ED    "  "    bra  LF8CF
        ;
F8E2 : CE FC 69    "  i"    ldx  #$FC69
F8E5 : 20 E8    "  "    bra  LF8CF
        ;
F8E7 : CE FC 85    "   "    ldx  #$FC85
F8EA : 20 E3    "  "    bra  LF8CF
        ;
F8EC        XF8EC:
F8EC : 7C 00 20    "|  "    inc  X0020
F8EF : CE 00 30    "  0"    ldx  #$0030
F8F2 : DF 22    " ""    stx  X0022
F8F4 : CE FC A1    "   "    ldx  #$FCA1
F8F7 : C6 1C    "  "    ldab  #$1C
F8F9 : BD FA 19    "   "    jsr  LFA19
F8FC : CE 00 00    "   "    ldx  #$0000
F8FF : DF 22    " ""    stx  X0022
F901 : CE FC A1    "   "    ldx  #$FCA1
F904 : 20 C9    "  "    bra  LF8CF
        ;
F906 : 7F 00 20    "   "    clr  X0020
F909 : C6 88    "  "    ldab  #$88
F90B : D7 21    " !"    stab  X0021
F90D : CE 00 60    "  `"    ldx  #$0060
F910 : DF 22    " ""    stx  X0022
F912 : CE FC F3    "   "    ldx  #$FCF3
F915 : C6 06    "  "    ldab  #$06
F917 : BD FA 19    "   "    jsr  LFA19
F91A : 39    "9"    rts
        ;
F91B : CE 00 31    "  1"    ldx  #$0031
F91E : C6 06    "  "    ldab  #$06
F920 : A6 00    "  "    ldaa  $00,x
F922 : 81 36    " 6"    cmpa  #$36
F924 : 22 08    "" "    bhi  LF92E
F926 : C6 04    "  "    ldab  #$04
F928 : 81 10    "  "    cmpa  #$10
F92A : 22 02    "" "    bhi  LF92E
F92C : C6 02    "  "    ldab  #$02
F92E        LF92E:
F92E : 10    " "    sba
F92F : A7 00    "  "    staa  $00,x
F931 : A6 01    "  "    ldaa  $01,x
F933 : 10    " "    sba
F934 : A7 01    "  "    staa  $01,x
F936 : 32    "2"    pula
F937 : 32    "2"    pula
F938 : 7E FB A1    "~  "    jmp  LFBA1
        ;
F93B : CE 00 60    "  `"    ldx  #$0060
F93E : A6 00    "  "    ldaa  $00,x
F940 : 80 02    "  "    suba  #$02
F942 : A7 00    "  "    staa  $00,x
F944 : BD FA 98    "   "    jsr  LFA98
F947 : 7E FA B1    "~  "    jmp  LFAB1
        ;
F94A : CE 00 01    "   "    ldx  #$0001
F94D : DF 00    "  "    stx  X0000
F94F : CE 03 80    "   "    ldx  #$0380
F952 : DF 02    "  "    stx  X0002
F954        LF954:
F954 : 7F 04 00    "   "    clr  X0400
F957 : DE 00    "  "    ldx  X0000
F959 : 08    " "    inx
F95A : DF 00    "  "    stx  X0000
F95C        LF95C:
F95C : 09    " "    dex
F95D : 26 FD    "& "    bne  LF95C
F95F : 73 04 00    "s  "    com  X0400
F962 : DE 02    "  "    ldx  X0002
F964        LF964:
F964 : 09    " "    dex
F965 : 26 FD    "& "    bne  LF964
F967 : 20 EB    "  "    bra  LF954
        ;
F969 : 5F    "_"    clrb
F96A : F7 04 00    "   "    stab  X0400
F96D : CE 00 DF    "   "    ldx  #$00DF
F970        LF970:
F970 : 86 20    "  "    ldaa  #$20
F972 : BD FB B7    "   "    jsr  LFBB7
F975        LF975:
F975 : 09    " "    dex
F976 : 26 FD    "& "    bne  LF975
F978 : 73 04 00    "s  "    com  X0400
F97B        LF97B:
F97B : 5A    "Z"    decb
F97C : 26 FD    "& "    bne  LF97B
F97E : 73 04 00    "s  "    com  X0400
F981 : 96 24    " $"    ldaa  X0024
F983 : DE 24    " $"    ldx  X0024
F985 : 85 10    "  "    bita  #$10
F987 : 27 E7    "' "    beq  LF970
F989 : 39    "9"    rts
        ;
F98A : C6 01    "  "    ldab  #$01
F98C : D7 00    "  "    stab  X0000
F98E : C6 FF    "  "    ldab  #$FF
F990 : 20 06    "  "    bra  LF998
        ;
F992 : C6 01    "  "    ldab  #$01
F994 : D7 00    "  "    stab  X0000
F996 : C6 AF    "  "    ldab  #$AF
F998        LF998:
F998 : D7 02    "  "    stab  X0002
F99A        LF99A:
F99A : C6 03    "  "    ldab  #$03
F99C : D7 01    "  "    stab  X0001
F99E        LF99E:
F99E : D6 02    "  "    ldab  X0002
F9A0 : 96 1D    "  "    ldaa  X001D
F9A2 : 44    "D"    lsra
F9A3 : 44    "D"    lsra
F9A4 : 44    "D"    lsra
F9A5 : 98 1D    "  "    eora  X001D
F9A7 : 44    "D"    lsra
F9A8 : 76 00 1C    "v  "    ror  X001C
F9AB : 76 00 1D    "v  "    ror  X001D
F9AE : 24 01    "$ "    bcc  LF9B1
F9B0 : 53    "S"    comb
F9B1        LF9B1:
F9B1 : F7 04 00    "   "    stab  X0400
F9B4 : D6 00    "  "    ldab  X0000
F9B6        LF9B6:
F9B6 : 5A    "Z"    decb
F9B7 : 26 FD    "& "    bne  LF9B6
F9B9 : 7A 00 01    "z  "    dec  X0001
F9BC : 26 E0    "& "    bne  LF99E
F9BE : 7C 00 00    "|  "    inc  X0000
F9C1 : 26 D7    "& "    bne  LF99A
F9C3 : 39    "9"    rts
        ;
F9C4 : 96 1F    "  "    ldaa  X001F
F9C6 : 27 05    "' "    beq  LF9CD
F9C8 : 7A 00 1F    "z  "    dec  X001F
F9CB : 20 07    "  "    bra  LF9D4
        ;
F9CD        LF9CD:
F9CD : 7A 00 21    "z !"    dec  X0021
F9D0 : 86 01    "  "    ldaa  #$01
F9D2 : 97 1F    "  "    staa  X001F
F9D4        LF9D4:
F9D4 : 20 04    "  "    bra  LF9DA
        ;
F9D6        LF9D6:
F9D6 : C6 A0    "  "    ldab  #$A0
F9D8 : D7 21    " !"    stab  X0021
F9DA        LF9DA:
F9DA : 86 04    "  "    ldaa  #$04
F9DC : 97 01    "  "    staa  X0001
F9DE        LF9DE:
F9DE : 86 9F    "  "    ldaa  #$9F
F9E0 : D6 21    " !"    ldab  X0021
F9E2        LF9E2:
F9E2 : CE 01 C0    "   "    ldx  #$01C0
F9E5        LF9E5:
F9E5 : 09    " "    dex
F9E6 : 27 20    "' "    beq  LFA08
F9E8 : F7 00 00    "   "    stab  X0000
F9EB : B7 04 00    "   "    staa  X0400
F9EE        LF9EE:
F9EE : 09    " "    dex
F9EF : 27 17    "' "    beq  LFA08
F9F1 : 7A 00 00    "z  "    dec  X0000
F9F4 : 26 F8    "& "    bne  LF9EE
F9F6 : 09    " "    dex
F9F7 : 27 0F    "' "    beq  LFA08
F9F9 : D7 00    "  "    stab  X0000
F9FB : 73 04 00    "s  "    com  X0400
F9FE        LF9FE:
F9FE : 09    " "    dex
F9FF : 27 07    "' "    beq  LFA08
FA01 : 7A 00 00    "z  "    dec  X0000
FA04 : 26 F8    "& "    bne  LF9FE
FA06 : 20 DD    "  "    bra  LF9E5
        ;
FA08        LFA08:
FA08 : D0 01    "  "    subb  X0001
FA0A : C1 10    "  "    cmpb  #$10
FA0C : 22 D4    "" "    bhi  LF9E2
FA0E : 39    "9"    rts
        ;
FA0F : C6 11    "  "    ldab  #$11
FA11 : D7 21    " !"    stab  X0021
FA13 : 86 FE    "  "    ldaa  #$FE
FA15 : 97 01    "  "    staa  X0001
FA17 : 20 C5    "  "    bra  LF9DE
        ;
FA19        LFA19:
FA19 : 36    "6"    psha
FA1A        LFA1A:
FA1A : A6 00    "  "    ldaa  $00,x
FA1C : DF 24    " $"    stx  X0024
FA1E : DE 22    " ""    ldx  X0022
FA20 : A7 00    "  "    staa  $00,x
FA22 : 08    " "    inx
FA23 : DF 22    " ""    stx  X0022
FA25 : DE 24    " $"    ldx  X0024
FA27 : 08    " "    inx
FA28 : 5A    "Z"    decb
FA29 : 26 EF    "& "    bne  LFA1A
FA2B : 32    "2"    pula
FA2C : 39    "9"    rts
        ;
FA2D : CE FC BD    "   "    ldx  #$FCBD
FA30 : 20 26    " &"    bra  LFA58
        ;
FA32        LFA32:
FA32 : BD FA 98    "   "    jsr  LFA98
FA35 : BD FA B1    "   "    jsr  LFAB1
FA38 : 39    "9"    rts
        ;
FA39 : CE FC C3    "   "    ldx  #$FCC3
FA3C : 20 F4    "  "    bra  LFA32
        ;
FA3E : C6 FF    "  "    ldab  #$FF
FA40 : D7 1E    "  "    stab  X001E
FA42        LFA42:
FA42 : CE FC C9    "   "    ldx  #$FCC9
FA45 : 8D EB    "  "    bsr  LFA32
FA47 : CE FC CF    "   "    ldx  #$FCCF
FA4A : 8D E6    "  "    bsr  LFA32
FA4C : 5A    "Z"    decb
FA4D : 26 F3    "& "    bne  LFA42
FA4F : 39    "9"    rts
        ;
FA50 : CE FC D5    "   "    ldx  #$FCD5
FA53 : 20 DD    "  "    bra  LFA32
        ;
FA55 : CE FC E1    "   "    ldx  #$FCE1
FA58        LFA58:
FA58 : 8D D8    "  "    bsr  LFA32
FA5A : 8D 30    " 0"    bsr  LFA8C
FA5C : 20 FA    "  "    bra  LFA58
        ;
FA5E : 86 FF    "  "    ldaa  #$FF
FA60 : 97 1E    "  "    staa  X001E
FA62 : CE FC E7    "   "    ldx  #$FCE7
FA65 : 20 F1    "  "    bra  LFA58
        ;
FA67 : 86 FF    "  "    ldaa  #$FF
FA69 : 97 1E    "  "    staa  X001E
FA6B : CE FC DB    "   "    ldx  #$FCDB
FA6E : 20 E8    "  "    bra  LFA58
        ;
FA70 : C6 30    " 0"    ldab  #$30
FA72 : CE FC ED    "   "    ldx  #$FCED
FA75 : 8D 21    " !"    bsr  LFA98
FA77        LFA77:
FA77 : 96 1D    "  "    ldaa  X001D
FA79 : 48    "H"    asla
FA7A : 9B 1D    "  "    adda  X001D
FA7C : 8B 0B    "  "    adda  #$0B
FA7E : 97 1D    "  "    staa  X001D
FA80 : 44    "D"    lsra
FA81 : 44    "D"    lsra
FA82 : 8B 0C    "  "    adda  #$0C
FA84 : 97 01    "  "    staa  X0001
FA86 : 8D 29    " )"    bsr  LFAB1
FA88 : 5A    "Z"    decb
FA89 : 26 EC    "& "    bne  LFA77
FA8B : 39    "9"    rts
        ;
FA8C        LFA8C:
FA8C : 96 1E    "  "    ldaa  X001E
FA8E : 80 08    "  "    suba  #$08
FA90 : 2A 03    "* "    bpl  LFA95
FA92 : 97 1E    "  "    staa  X001E
FA94 : 39    "9"    rts
        ;
FA95        LFA95:
FA95 : 32    "2"    pula
FA96 : 32    "2"    pula
FA97 : 39    "9"    rts
        ;
FA98        LFA98:
FA98 : A6 00    "  "    ldaa  $00,x
FA9A : 97 01    "  "    staa  X0001
FA9C : A6 01    "  "    ldaa  $01,x
FA9E : 97 02    "  "    staa  X0002
FAA0 : A6 02    "  "    ldaa  $02,x
FAA2 : 97 03    "  "    staa  X0003
FAA4 : A6 03    "  "    ldaa  $03,x
FAA6 : 97 04    "  "    staa  X0004
FAA8 : A6 04    "  "    ldaa  $04,x
FAAA : 97 05    "  "    staa  X0005
FAAC : A6 05    "  "    ldaa  $05,x
FAAE : 97 06    "  "    staa  X0006
FAB0 : 39    "9"    rts
        ;
FAB1        LFAB1:
FAB1 : 96 1E    "  "    ldaa  X001E
FAB3 : 37    "7"    pshb
FAB4 : D6 05    "  "    ldab  X0005
FAB6 : D7 07    "  "    stab  X0007
FAB8 : D6 02    "  "    ldab  X0002
FABA : D7 08    "  "    stab  X0008
FABC        LFABC:
FABC : 43    "C"    coma
FABD : D6 01    "  "    ldab  X0001
FABF : B7 04 00    "   "    staa  X0400
FAC2        LFAC2:
FAC2 : 5A    "Z"    decb
FAC3 : 26 FD    "& "    bne  LFAC2
FAC5 : 43    "C"    coma
FAC6 : D6 01    "  "    ldab  X0001
FAC8 : 20 00    "  "    bra  LFACA
        ;
FACA        LFACA:
FACA : 08    " "    inx
FACB : 09    " "    dex
FACC : 08    " "    inx
FACD : 09    " "    dex
FACE : B7 04 00    "   "    staa  X0400
FAD1        LFAD1:
FAD1 : 5A    "Z"    decb
FAD2 : 26 FD    "& "    bne  LFAD1
FAD4 : 7A 00 08    "z  "    dec  X0008
FAD7 : 27 16    "' "    beq  LFAEF
FAD9 : 7A 00 07    "z  "    dec  X0007
FADC : 26 DE    "& "    bne  LFABC
FADE : 43    "C"    coma
FADF : D6 05    "  "    ldab  X0005
FAE1 : B7 04 00    "   "    staa  X0400
FAE4 : D7 07    "  "    stab  X0007
FAE6 : D6 01    "  "    ldab  X0001
FAE8 : 9B 06    "  "    adda  X0006
FAEA : 2B 1E    "+ "    bmi  LFB0A
FAEC : 01    " "    nop
FAED : 20 15    "  "    bra  LFB04
        ;
FAEF        LFAEF:
FAEF : 08    " "    inx
FAF0 : 09    " "    dex
FAF1 : 01    " "    nop
FAF2 : 43    "C"    coma
FAF3 : D6 02    "  "    ldab  X0002
FAF5 : B7 04 00    "   "    staa  X0400
FAF8 : D7 08    "  "    stab  X0008
FAFA : D6 01    "  "    ldab  X0001
FAFC : D0 03    "  "    subb  X0003
FAFE : D1 04    "  "    cmpb  X0004
FB00 : D1 04    "  "    cmpb  X0004
FB02 : 27 06    "' "    beq  LFB0A
FB04        LFB04:
FB04 : D7 01    "  "    stab  X0001
FB06 : C0 05    "  "    subb  #$05
FB08 : 20 B8    "  "    bra  LFAC2
        ;
FB0A        LFB0A:
FB0A : 33    "3"    pulb
FB0B : 39    "9"    rts
        ;
FB0C        LFB0C:
FB0C : 84 1F    "  "    anda  #$1F
FB0E        LFB0E:
FB0E : 27 FE    "' "    beq  LFB0E
FB10 : 81 11    "  "    cmpa  #$11
FB12        LFB12:
FB12 : 27 FE    "' "    beq  LFB12
FB14 : 81 12    "  "    cmpa  #$12
FB16        LFB16:
FB16 : 27 FE    "' "    beq  LFB16
FB18 : 84 0F    "  "    anda  #$0F
FB1A : CE FB F7    "   "    ldx  #$FBF7
FB1D : BD FB B7    "   "    jsr  LFBB7
FB20 : A6 00    "  "    ldaa  $00,x
FB22 : 97 18    "  "    staa  X0018
FB24 : CE FB E7    "   "    ldx  #$FBE7
FB27 : C6 10    "  "    ldab  #$10
FB29 : BD FA 19    "   "    jsr  LFA19
FB2C : CE FC 07    "   "    ldx  #$FC07
FB2F : E6 00    "  "    ldab  $00,x
FB31        LFB31:
FB31 : D7 1A    "  "    stab  X001A
FB33 : DF 22    " ""    stx  X0022
FB35        LFB35:
FB35 : CE 00 00    "   "    ldx  #$0000
FB38 : C6 08    "  "    ldab  #$08
FB3A : D7 19    "  "    stab  X0019
FB3C        LFB3C:
FB3C : A6 00    "  "    ldaa  $00,x
FB3E : D6 18    "  "    ldab  X0018
FB40 : 7D 00 1A    "}  "    tst  X001A
FB43 : 26 06    "& "    bne  LFB4B
FB45 : A0 08    "  "    suba  $08,x
FB47 : A7 00    "  "    staa  $00,x
FB49 : C0 03    "  "    subb  #$03
FB4B        LFB4B:
FB4B : 08    " "    inx
FB4C : B7 04 00    "   "    staa  X0400
FB4F        LFB4F:
FB4F : 5A    "Z"    decb
FB50 : 26 FD    "& "    bne  LFB4F
FB52 : 7A 00 19    "z  "    dec  X0019
FB55 : 26 E5    "& "    bne  LFB3C
FB57 : 7A 00 1A    "z  "    dec  X001A
FB5A : 2A D9    "* "    bpl  LFB35
FB5C : DE 22    " ""    ldx  X0022
FB5E : 08    " "    inx
FB5F : E6 00    "  "    ldab  $00,x
FB61 : 26 CE    "& "    bne  LFB31
FB63 : 86 80    "  "    ldaa  #$80
FB65 : B7 04 00    "   "    staa  X0400
FB68 : 3E    ">"    wai
FB69        LFB69:
FB69 : 20 A1    "  "    bra  LFB0C
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FB6B : 8E 00 7F    "   "    lds  #$007F
FB6E : CE F8 C8    "   "    ldx  #$F8C8
FB71 : DF 26    " &"    stx  X0026
FB73 : B6 04 02    "   "    ldaa  X0402
FB76 : CE 00 00    "   "    ldx  #$0000
FB79 : DF 22    " ""    stx  X0022
FB7B : C6 AF    "  "    ldab  #$AF
FB7D : D7 1E    "  "    stab  X001E
FB7F : 0E    " "    cli
FB80 : 43    "C"    coma
FB81 : 81 46    " F"    cmpa  #$46
FB83 : 27 04    "' "    beq  LFB89
FB85 : 85 40    " @"    bita  #$40
FB87 : 26 83    "& "    bne  LFB0C
FB89        LFB89:
FB89 : 84 1F    "  "    anda  #$1F
FB8B : 27 14    "' "    beq  LFBA1
FB8D : 81 18    "  "    cmpa  #$18
FB8F : 22 D8    "" "    bhi  LFB69
FB91 : 4A    "J"    deca
FB92 : 48    "H"    asla
FB93 : CE FC F9    "   "    ldx  #$FCF9
FB96 : 8D 1F    "  "    bsr  LFBB7
FB98 : EE 00    "  "    ldx  $00,x
FB9A : AD 00    "  "    jsr  $00,x            ;INFO: index jump
FB9C : 86 80    "  "    ldaa  #$80
FB9E : B7 04 00    "   "    staa  X0400
FBA1        LFBA1:
FBA1 : 96 20    "  "    ldaa  X0020
FBA3        LFBA3:
FBA3 : 27 FE    "' "    beq  LFBA3
FBA5 : CE 00 00    "   "    ldx  #$0000
FBA8 : DF 22    " ""    stx  X0022
FBAA : CE 00 30    "  0"    ldx  #$0030
FBAD : C6 1C    "  "    ldab  #$1C
FBAF : BD FA 19    "   "    jsr  LFA19
FBB2 : BD F8 23    "  #"    jsr  LF823
FBB5        LFBB5:
FBB5 : 20 FE    "  "    bra  LFBB5
        ;
FBB7        LFBB7:
FBB7 : DF 24    " $"    stx  X0024
FBB9 : 9B 25    " %"    adda  X0025
FBBB : 97 25    " %"    staa  X0025
FBBD : 96 24    " $"    ldaa  X0024
FBBF : 89 00    "  "    adca  #$00
FBC1 : 97 24    " $"    staa  X0024
FBC3 : DE 24    " $"    ldx  X0024
FBC5 : 39    "9"    rts
        ;
FBC6 : 0F    " "    sei
FBC7 : CE FF FF    "   "    ldx  #$FFFF
FBCA : 5F    "_"    clrb
FBCB        LFBCB:
FBCB : E9 00    "  "    adcb  $00,x
FBCD : 09    " "    dex
FBCE : 8C F8 00    "   "    cpx  #$F800
FBD1 : 26 F8    "& "    bne  LFBCB
FBD3 : E1 00    "  "    cmpb  $00,x
FBD5 : 27 01    "' "    beq  LFBD8
FBD7 : 3E    ">"    wai
FBD8        LFBD8:
FBD8 : CE F8 C8    "   "    ldx  #$F8C8
FBDB : DF 26    " &"    stx  X0026
FBDD : CE 00 00    "   "    ldx  #$0000
FBE0 : DF 22    " ""    stx  X0022
FBE2 : BD F9 D6    "   "    jsr  LF9D6
FBE5 : 20 F1    "  "    bra  LFBD8
        ;
FBE7 : DA FF    "  "    orab  X00FF
FBE9 : DA 80    "  "    orab  X0080
FBEB : 26 01    "& "    bne  LFBEE
FBED : 26 80    "& "    bne  LFB6F
FBEF : 07    " "    tpa
FBF0 : 0A    " "    clv
FBF1 : 07    " "    tpa
        ;
FBF2 : 00    " "    db  $00
        ;
FBF3 : F9 F6 F9    "   "    adcb  XF6F9
        ;
FBF6 : 00 3A    " :"    db  $00, $3A
        ;
FBF8 : 3E    ">"    wai
FBF9 : 50    "P"    negb
FBFA : 46    "F"    rora
FBFB : 33    "3"    pulb
FBFC : 2C 27    ",'"    bge  LFC25
FBFE : 20 25    " %"    bra  LFC25
        ;
FC00 : 1C 1A    "  "    db  $1C, $1A
        ;
FC02 : 17    " "    tba
        ;
FC03 : 14    " "    db  $14
        ;
FC04 : 11    " "    cba
FC05 : 10    " "    sba
FC06 : 33    "3"    pulb
FC07 : 08    " "    inx
        ;
FC08 : 03 02    "  "    db  $03, $02
        ;
FC0A : 01    " "    nop
        ;
FC0B : 02 03 04 05  "    "    db  $02, $03, $04, $05
        ;
FC0F : 06    " "    tap
FC10 : 0A    " "    clv
        ;
FC11 : 1E    " "    db  $1E
        ;
FC12 : 32    "2"    pula
FC13 : 70 00 FF    "p  "    neg  X00FF
FC16 : FF FF 90    "   "    stx  XFF90
FC19 : FF FF FF    "   "    stx  XFFFF
FC1C : FF FF FF    "   "    stx  XFFFF
FC1F : FF 90 FF    "   "    stx  X90FF
FC22 : FF FF FF    "   "    stx  XFFFF
FC25        LFC25:
FC25 : FF FF FF    "   "    stx  XFFFF
FC28 : FF 00 00    "   "    stx  X0000
        ;
FC2B : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC2F : 00 00    "  "    db  $00, $00
        ;
FC31 : 48    "H"    asla
FC32 : 01    " "    nop
        ;
FC33 : 00 00    "  "    db  $00, $00
        ;
FC35 : 3F    "?"    swi
FC36 : 3F    "?"    swi
        ;
FC37 : 00 00    "  "    db  $00, $00
        ;
FC39 : 48    "H"    asla
FC3A : 01    " "    nop
        ;
FC3B : 00 00    "  "    db  $00, $00
        ;
FC3D : 01    " "    nop
FC3E : 08    " "    inx
        ;
FC3F : 00 00    "  "    db  $00, $00
        ;
FC41 : 81 01    "  "    cmpa  #$01
        ;
FC43 : 00 00    "  "    db  $00, $00
        ;
FC45 : 01    " "    nop
FC46 : FF 00 00    "   "    stx  X0000
FC49 : 01    " "    nop
FC4A : 08    " "    inx
        ;
FC4B : 00 00    "  "    db  $00, $00
        ;
FC4D : 01    " "    nop
FC4E : 10    " "    sba
        ;
FC4F : 00 00    "  "    db  $00, $00
        ;
FC51 : 3F    "?"    swi
FC52 : 3F    "?"    swi
        ;
FC53 : 00 00    "  "    db  $00, $00
        ;
FC55 : 01    " "    nop
FC56 : 10    " "    sba
        ;
FC57 : 00 00 05 05  "    "    db  $00, $00, $05, $05
FC5B : 00 00    "  "    db  $00, $00
        ;
FC5D : 01    " "    nop
FC5E : 01    " "    nop
        ;
FC5F : 00 00    "  "    db  $00, $00
        ;
FC61 : 31    "1"    ins
FC62 : FF 00 00    "   "    stx  X0000
        ;
FC65 : 05 05 00 00  "    "    db  $05, $05, $00, $00
        ;
FC69 : 30    "0"    tsx
        ;
FC6A : 00 00 00    "   "    db  $00, $00, $00
        ;
FC6D : 7F 00 00    "   "    clr  X0000
        ;
FC70 : 00    " "    db  $00
        ;
FC71 : 30    "0"    tsx
        ;
FC72 : 00 00 00    "   "    db  $00, $00, $00
        ;
FC75 : 01    " "    nop
        ;
FC76 : 00 00 00    "   "    db  $00, $00, $00
        ;
FC79 : 7F 00 00    "   "    clr  X0000
        ;
FC7C : 00 02 00 00  "    "    db  $00, $02, $00, $00
FC80 : 00    " "    db  $00
        ;
FC81 : 01    " "    nop
        ;
FC82 : 00 00 00 04  "    "    db  $00, $00, $00, $04
FC86 : 00 00 04    "   "    db  $00, $00, $04
        ;
FC89 : 7F 00 00    "   "    clr  X0000
FC8C : 7F 04 00    "   "    clr  X0400
        ;
FC8F : 00 04    "  "    db  $00, $04
        ;
FC91 : FF 00 00    "   "    stx  X0000
FC94 : A0 00    "  "    suba  $00,x
        ;
FC96 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FC9A : 00 00 00    "   "    db  $00, $00, $00
        ;
FC9D : FF 00 00    "   "    stx  X0000
FCA0 : A0 0C    "  "    suba  $0C,x
FCA2 : 68 68    "hh"    asl  $68,x
        ;
FCA4 : 00    " "    db  $00
        ;
FCA5 : 07    " "    tpa
        ;
FCA6 : 1F    " "    db  $1F
        ;
FCA7 : 0F    " "    sei
        ;
FCA8 : 00    " "    db  $00
        ;
FCA9 : 0C    " "    clc
FCAA : 80 80    "  "    suba  #$80
        ;
FCAC : 00    " "    db  $00
        ;
FCAD : FF FF FF    "   "    stx  XFFFF
        ;
FCB0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCB4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCB8 : 00    " "    db  $00
        ;
FCB9 : FF FF FF    "   "    stx  XFFFF
        ;
FCBC : 00    " "    db  $00
        ;
FCBD : FF 01 02    "   "    stx  X0102
        ;
FCC0 : C3    " "    db  $C3
        ;
FCC1 : FF 00 01    "   "    stx  X0001
        ;
FCC4 : 03    " "    db  $03
        ;
FCC5 : FF 80 FF    "   "    stx  X80FF
        ;
FCC8 : 00    " "    db  $00
        ;
FCC9 : 20 03    "  "    bra  LFCCE
        ;
FCCB : FF 50 FF    " P "    stx  X50FF
        ;
FCCE        LFCCE:
FCCE : 00    " "    db  $00
        ;
FCCF : 50    "P"    negb
        ;
FCD0 : 03    " "    db  $03
        ;
FCD1 : 01    " "    nop
FCD2 : 20 FF    "  "    bra  LFCD3
        ;
FCD4 : 00    " "    db  $00
        ;
FCD5 : FE 04 02    "   "    ldx  X0402
        ;
FCD8 : 04    " "    db  $04
        ;
FCD9 : FF 00 48    "  H"    stx  X0048
        ;
FCDC : 03    " "    db  $03
        ;
FCDD : 01    " "    nop
FCDE : 0C    " "    clc
FCDF : FF 00 48    "  H"    stx  X0048
        ;
FCE2 : 02    " "    db  $02
        ;
FCE3 : 01    " "    nop
FCE4 : 0C    " "    clc
FCE5 : FF 00 E0    "   "    stx  X00E0
FCE8 : 01    " "    nop
        ;
FCE9 : 02    " "    db  $02
        ;
FCEA : 10    " "    sba
FCEB : FF 00 50    "  P"    stx  X0050
FCEE : FF 00 00    "   "    stx  X0000
FCF1 : 60 80    "` "    neg  $80,x
FCF3 : FF 02 01    "   "    stx  X0201
FCF6 : 06    " "    tap
FCF7 : FF 00 F9    "   "    stx  X00F9
FCFA : D6 F8    "  "    ldab  X00F8
FCFC : D8 F8    "  "    eorb  X00F8
        ;
FCFE : DD    " "    db  $DD
        ;
FCFF : F8 E2 F8    "   "    eorb  XE2F8
FD02 : E7 F9    "  "    stab  $F9,x
FD04 : 69 F9    "i "    rol  $F9,x
FD06 : 92 F8    "  "    sbca  X00F8
        ;
FD08 : CC    " "    db  $CC
        ;
FD09 : FA 5E FA    " ^ "    orab  X5EFA
FD0C : 39    "9"    rts
        ;
FD0D : FA 3E FA    " > "    orab  X3EFA
FD10        LFD10:
FD10 : 50    "P"    negb
FD11 : FA 55 FA    " U "    orab  X55FA
FD14 : 2D FA    "- "    blt  LFD10
FD16 : 67 FA    "g "    asr  $FA,x
FD18 : 70 F8 EC    "p  "    neg  XF8EC
FD1B : F9 1B F9    "   "    adcb  X1BF9
FD1E : 06    " "    tap
FD1F : F9 C4 F9    "   "    adcb  XC4F9
FD22 : 3B    ";"    rti
        ;
FD23 : F9 8A FA    "   "    adcb  X8AFA
FD26 : 0F    " "    sei
FD27 : F9 4A 00    " J "    adcb  X4A00
        ;
FD2A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD2E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD32 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD36 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD3A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD3E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD42 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD46 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD4A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD4E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD52 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD56 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD5A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD5E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD62 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD66 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD6A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD6E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD72 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD76 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD7A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD7E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD82 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD86 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD8A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD8E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD92 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD96 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD9A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD9E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDA2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDA6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDAA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDAE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDB2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDB6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDBA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDBE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDC2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDC6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDCA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDCE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDD2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDD6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDDA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDDE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDE2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDE6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDEA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDEE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDF2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDF6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDFA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDFE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE02 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE06 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE0A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE0E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE12 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE16 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE1A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE1E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE22 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE26 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE2A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE2E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE32 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE36 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE3A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE3E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE42 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE46 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE4A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE4E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE52 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE56 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE5A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE5E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE62 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE66 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE6A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE6E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE72 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE76 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE7A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE7E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE82 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE86 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE8A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE8E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE92 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE96 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE9A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FE9E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEA2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEA6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEAA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEAE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEB2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEB6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEBA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEBE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEC2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEC6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FECA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FECE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FED2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FED6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEDA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEDE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEE2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEE6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEEA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEEE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEF2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEF6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEFA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEFE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF02 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF06 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF0A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF0E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF12 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF16 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF1A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF1E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF22 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF26 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF2A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF2E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF32 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF36 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF3A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF3E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF42 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF46 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF4A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF4E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF52 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF56 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF5A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF5E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF62 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF66 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF6A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF6E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF72 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF76 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF7A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF7E : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF82 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF86 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF8A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF8E : 00 00    "  "    db  $00, $00
FF90        XFF90:
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
FFF0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFF4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FB 6B                          ;IRQ
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FB C6                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------






