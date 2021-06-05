        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    AlienPoker.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  EC44
        ;  CRC-32:    C9103A68
        ;
        ;  Date:    Fri May 21 11:46:19 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Sound ROM 2 w Speech - Alien Poker 1980, system 6a
        ;
          org  $F800
        ;
F800 : 99 0F    "  "    adca  X000F
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
F81C : 97 55    " U"    staa  X0055
F81E : 4F    "O"    clra
F81F : 97 4E    " N"    staa  X004E
F821 : 97 4F    " O"    staa  X004F
F823 : 97 53    " S"    staa  X0053
F825 : 97 54    " T"    staa  X0054
F827 : E7 02    "  "    stab  $02,x
F829 : 0E    " "    cli
F82A        LF82A:
F82A : 20 FE    "  "    bra  LF82A
        ;
F82C        LF82C:
F82C : DF 5C    " \"    stx  X005C
F82E : CE F8 CC    "   "    ldx  #$F8CC
F831 : DF 58    " X"    stx  X0058
F833 : 86 80    "  "    ldaa  #$80
F835        LF835:
F835 : D6 03    "  "    ldab  X0003
F837 : 2A 09    "* "    bpl  LF842
F839 : D6 55    " U"    ldab  X0055
F83B : 54    "T"    lsrb
F83C : 54    "T"    lsrb
F83D : 54    "T"    lsrb
F83E : 5C    "\"    incb
F83F        LF83F:
F83F : 5A    "Z"    decb
F840 : 26 FD    "& "    bne  LF83F
F842        LF842:
F842 : 7A 00 08    "z  "    dec  X0008
F845 : 27 4C    "'L"    beq  LF893
F847 : 7A 00 09    "z  "    dec  X0009
F84A : 27 4C    "'L"    beq  LF898
F84C : 7A 00 0A    "z  "    dec  X000A
F84F : 27 4C    "'L"    beq  LF89D
F851 : 7A 00 0B    "z  "    dec  X000B
F854 : 26 DF    "& "    bne  LF835
F856 : D6 03    "  "    ldab  X0003
F858 : 27 DB    "' "    beq  LF835
F85A : C4 7F    "  "    andb  #$7F
F85C : D7 0B    "  "    stab  X000B
F85E : D6 55    " U"    ldab  X0055
F860 : 58    "X"    aslb
F861 : DB 55    " U"    addb  X0055
F863 : CB 0B    "  "    addb  #$0B
F865 : D7 55    " U"    stab  X0055
F867 : 7A 00 1B    "z  "    dec  X001B
F86A : 26 0E    "& "    bne  LF87A
F86C : D6 0F    "  "    ldab  X000F
F86E : D7 1B    "  "    stab  X001B
F870 : DE 58    " X"    ldx  X0058
F872 : 09    " "    dex
F873 : 8C F8 C5    "   "    cpx  #$F8C5
F876 : 27 49    "'I"    beq  LF8C1
F878 : DF 58    " X"    stx  X0058
F87A        LF87A:
F87A : D6 55    " U"    ldab  X0055
F87C : 2B 06    "+ "    bmi  LF884
F87E : D4 07    "  "    andb  X0007
F880 : C4 7F    "  "    andb  #$7F
F882 : 20 05    "  "    bra  LF889
        ;
F884        LF884:
F884 : D4 07    "  "    andb  X0007
F886 : C4 7F    "  "    andb  #$7F
F888 : 50    "P"    negb
F889        LF889:
F889 : 36    "6"    psha
F88A : 1B    " "    aba
F88B : 16    " "    tab
F88C : 32    "2"    pula
F88D        LF88D:
F88D : DE 58    " X"    ldx  X0058
F88F : AD 00    "  "    jsr  $00,x            ;INFO: index jump
F891 : 20 A2    "  "    bra  LF835
        ;
F893        LF893:
F893 : CE 00 00    "   "    ldx  #$0000
F896 : 20 08    "  "    bra  LF8A0
        ;
F898        LF898:
F898 : CE 00 01    "   "    ldx  #$0001
F89B : 20 03    "  "    bra  LF8A0
        ;
F89D        LF89D:
F89D : CE 00 02    "   "    ldx  #$0002
F8A0        LF8A0:
F8A0 : 6D 18    "m "    tst  $18,x
F8A2 : 27 12    "' "    beq  LF8B6
F8A4 : 6A 18    "j "    dec  $18,x
F8A6 : 26 0E    "& "    bne  LF8B6
F8A8 : E6 0C    "  "    ldab  $0C,x
F8AA : E7 18    "  "    stab  $18,x
F8AC : E6 00    "  "    ldab  $00,x
F8AE : EB 10    "  "    addb  $10,x
F8B0 : E1 14    "  "    cmpb  $14,x
F8B2 : 27 0D    "' "    beq  LF8C1
F8B4 : E7 00    "  "    stab  $00,x
F8B6        LF8B6:
F8B6 : E6 00    "  "    ldab  $00,x
F8B8 : E7 08    "  "    stab  $08,x
F8BA : AB 04    "  "    adda  $04,x
F8BC : 60 04    "` "    neg  $04,x
F8BE : 16    " "    tab
F8BF : 20 CC    "  "    bra  LF88D
        ;
F8C1        LF8C1:
F8C1 : DE 5C    " \"    ldx  X005C
F8C3 : 39    "9"    rts
        ;
F8C4 : 54    "T"    lsrb
F8C5 : 54    "T"    lsrb
F8C6 : 54    "T"    lsrb
F8C7 : 54    "T"    lsrb
F8C8 : 54    "T"    lsrb
F8C9 : 54    "T"    lsrb
F8CA : 54    "T"    lsrb
F8CB : 54    "T"    lsrb
F8CC : F7 04 00    "   "    stab  X0400
F8CF : 39    "9"    rts
        ;
F8D0        XF8D0:
F8D0 : CE FD 12    "   "    ldx  #$FD12
F8D3        LF8D3:
F8D3 : C6 1C    "  "    ldab  #$1C
F8D5 : BD F9 18    "   "    jsr  LF918
F8D8 : BD F8 2C    "  ,"    jsr  LF82C
F8DB : 39    "9"    rts
        ;
F8DC        LF8DC:
F8DC : CE FD 2E    "  ."    ldx  #$FD2E
F8DF : 20 F2    "  "    bra  LF8D3
        ;
F8E1        LF8E1:
F8E1 : CE FD 4A    "  J"    ldx  #$FD4A
F8E4 : 20 ED    "  "    bra  LF8D3
        ;
F8E6 : C6 01    "  "    ldab  #$01
F8E8 : D7 00    "  "    stab  X0000
F8EA : C6 CF    "  "    ldab  #$CF
F8EC : D7 02    "  "    stab  X0002
F8EE        LF8EE:
F8EE : C6 03    "  "    ldab  #$03
F8F0 : D7 01    "  "    stab  X0001
F8F2        LF8F2:
F8F2 : D6 02    "  "    ldab  X0002
F8F4 : 96 56    " V"    ldaa  X0056
F8F6 : 44    "D"    lsra
F8F7 : 44    "D"    lsra
F8F8 : 44    "D"    lsra
F8F9 : 98 56    " V"    eora  X0056
F8FB : 44    "D"    lsra
F8FC : 76 00 55    "v U"    ror  X0055
F8FF : 76 00 56    "v V"    ror  X0056
F902 : 24 01    "$ "    bcc  LF905
F904 : 53    "S"    comb
F905        LF905:
F905 : F7 04 00    "   "    stab  X0400
F908 : D6 00    "  "    ldab  X0000
F90A        LF90A:
F90A : 5A    "Z"    decb
F90B : 26 FD    "& "    bne  LF90A
F90D : 7A 00 01    "z  "    dec  X0001
F910 : 26 E0    "& "    bne  LF8F2
F912 : 7C 00 00    "|  "    inc  X0000
F915 : 26 D7    "& "    bne  LF8EE
F917 : 39    "9"    rts
        ;
F918        LF918:
F918 : 36    "6"    psha
F919        LF919:
F919 : A6 00    "  "    ldaa  $00,x
F91B : DF 5C    " \"    stx  X005C
F91D : DE 5E    " ^"    ldx  X005E
F91F : A7 00    "  "    staa  $00,x
F921 : 08    " "    inx
F922 : DF 5E    " ^"    stx  X005E
F924 : DE 5C    " \"    ldx  X005C
F926 : 08    " "    inx
F927 : 5A    "Z"    decb
F928 : 26 EF    "& "    bne  LF919
F92A : 32    "2"    pula
F92B : 39    "9"    rts
        ;
F92C        LF92C:
F92C : 84 0F    "  "    anda  #$0F
F92E        LF92E:
F92E : 27 FE    "' "    beq  LF92E
F930 : CE FC F4    "   "    ldx  #$FCF4
F933 : BD FC 55    "  U"    jsr  LFC55
F936 : A6 00    "  "    ldaa  $00,x
F938 : 97 18    "  "    staa  X0018
F93A : CE FC E4    "   "    ldx  #$FCE4
F93D : C6 10    "  "    ldab  #$10
F93F : BD F9 18    "   "    jsr  LF918
F942 : CE FD 04    "   "    ldx  #$FD04
F945 : E6 00    "  "    ldab  $00,x
F947        LF947:
F947 : D7 1A    "  "    stab  X001A
F949 : DF 5E    " ^"    stx  X005E
F94B        LF94B:
F94B : CE 00 00    "   "    ldx  #$0000
F94E : C6 08    "  "    ldab  #$08
F950 : D7 19    "  "    stab  X0019
F952        LF952:
F952 : A6 00    "  "    ldaa  $00,x
F954 : D6 18    "  "    ldab  X0018
F956 : 7D 00 1A    "}  "    tst  X001A
F959 : 26 06    "& "    bne  LF961
F95B : A0 08    "  "    suba  $08,x
F95D : A7 00    "  "    staa  $00,x
F95F : C0 03    "  "    subb  #$03
F961        LF961:
F961 : 08    " "    inx
F962 : B7 04 00    "   "    staa  X0400
F965        LF965:
F965 : 5A    "Z"    decb
F966 : 26 FD    "& "    bne  LF965
F968 : 7A 00 19    "z  "    dec  X0019
F96B : 26 E5    "& "    bne  LF952
F96D : 7A 00 1A    "z  "    dec  X001A
F970 : 2A D9    "* "    bpl  LF94B
F972 : DE 5E    " ^"    ldx  X005E
F974 : 08    " "    inx
F975 : E6 00    "  "    ldab  $00,x
F977 : 26 CE    "& "    bne  LF947
F979        LF979:
F979 : 20 FE    "  "    bra  LF979
        ;
F97B        LF97B:
F97B : 7F 04 02    "   "    clr  X0402
F97E : CE 40 00    " @ "    ldx  #$4000
F981        LF981:
F981 : 09    " "    dex
F982 : 26 FD    "& "    bne  LF981
F984 : CE FD 66    "  f"    ldx  #$FD66
F987 : DF 63    " c"    stx  X0063
F989        LF989:
F989 : DE 63    " c"    ldx  X0063
F98B : A6 00    "  "    ldaa  $00,x
F98D : 27 33    "'3"    beq  LF9C2
F98F : E6 01    "  "    ldab  $01,x
F991 : C4 F0    "  "    andb  #$F0
F993 : D7 62    " b"    stab  X0062
F995 : E6 01    "  "    ldab  $01,x
F997 : 08    " "    inx
F998 : 08    " "    inx
F999 : DF 63    " c"    stx  X0063
F99B : 97 61    " a"    staa  X0061
F99D : C4 0F    "  "    andb  #$0F
F99F        LF99F:
F99F : 96 62    " b"    ldaa  X0062
F9A1 : B7 04 00    "   "    staa  X0400
F9A4 : 96 61    " a"    ldaa  X0061
F9A6        LF9A6:
F9A6 : CE 00 05    "   "    ldx  #$0005
F9A9        LF9A9:
F9A9 : 09    " "    dex
F9AA : 26 FD    "& "    bne  LF9A9
F9AC : 4A    "J"    deca
F9AD : 26 F7    "& "    bne  LF9A6
F9AF : 7F 04 00    "   "    clr  X0400
F9B2 : 96 61    " a"    ldaa  X0061
F9B4        LF9B4:
F9B4 : CE 00 05    "   "    ldx  #$0005
F9B7        LF9B7:
F9B7 : 09    " "    dex
F9B8 : 26 FD    "& "    bne  LF9B7
F9BA : 4A    "J"    deca
F9BB : 26 F7    "& "    bne  LF9B4
F9BD : 5A    "Z"    decb
F9BE : 26 DF    "& "    bne  LF99F
F9C0 : 20 C7    "  "    bra  LF989
        ;
F9C2        LF9C2:
F9C2 : 86 80    "  "    ldaa  #$80
F9C4 : B7 04 02    "   "    staa  X0402
F9C7 : 39    "9"    rts
        ;
F9C8 : 96 4E    " N"    ldaa  X004E
F9CA : 26 0F    "& "    bne  LF9DB
F9CC        LF9CC:
F9CC : 7F 00 4E    "  N"    clr  X004E
F9CF : 86 16    "  "    ldaa  #$16
F9D1 : 97 51    " Q"    staa  X0051
F9D3 : 86 0B    "  "    ldaa  #$0B
F9D5 : 97 50    " P"    staa  X0050
F9D7 : 97 52    " R"    staa  X0052
F9D9 : 20 10    "  "    bra  LF9EB
        ;
F9DB        LF9DB:
F9DB : 81 1D    "  "    cmpa  #$1D
F9DD : 22 ED    "" "    bhi  LF9CC
F9DF : 96 50    " P"    ldaa  X0050
F9E1 : 27 05    "' "    beq  LF9E8
F9E3 : 4A    "J"    deca
F9E4 : 97 50    " P"    staa  X0050
F9E6 : 20 03    "  "    bra  LF9EB
        ;
F9E8        LF9E8:
F9E8 : 7A 00 51    "z Q"    dec  X0051
F9EB        LF9EB:
F9EB : 7C 00 4E    "| N"    inc  X004E
F9EE : 39    "9"    rts
        ;
F9EF : 96 4F    " O"    ldaa  X004F
F9F1 : 8B 04    "  "    adda  #$04
F9F3 : 97 4F    " O"    staa  X004F
F9F5 : 81 7D    " }"    cmpa  #$7D
F9F7 : 23 04    "# "    bls  LF9FD
F9F9 : 86 01    "  "    ldaa  #$01
F9FB : 97 4F    " O"    staa  X004F
F9FD        LF9FD:
F9FD : 39    "9"    rts
        ;
F9FE : 7F 00 4E    "  N"    clr  X004E
FA01 : 7F 00 4F    "  O"    clr  X004F
FA04 : 39    "9"    rts
        ;
FA05        LFA05:
FA05 : CE 00 0D    "   "    ldx  #$000D
FA08 : DF 5E    " ^"    stx  X005E
FA0A : CE FF 4D    "  M"    ldx  #$FF4D
FA0D : DF 5C    " \"    stx  X005C
FA0F        LFA0F:
FA0F : DE 5C    " \"    ldx  X005C
FA11 : A6 00    "  "    ldaa  $00,x
FA13 : 08    " "    inx
FA14 : DF 5C    " \"    stx  X005C
FA16 : DE 5E    " ^"    ldx  X005E
FA18 : 4D    "M"    tsta
FA19 : 27 09    "' "    beq  LFA24
FA1B : D6 4F    " O"    ldab  X004F
FA1D : 10    " "    sba
FA1E : 27 02    "' "    beq  LFA22
FA20 : 2A 02    "* "    bpl  LFA24
FA22        LFA22:
FA22 : 86 01    "  "    ldaa  #$01
FA24        LFA24:
FA24 : 08    " "    inx
FA25 : DF 5E    " ^"    stx  X005E
FA27 : A7 00    "  "    staa  $00,x
FA29 : 26 E4    "& "    bne  LFA0F
FA2B        LFA2B:
FA2B : 86 17    "  "    ldaa  #$17
FA2D : BD FA 7F    "   "    jsr  LFA7F
FA30 : 20 F9    "  "    bra  LFA2B
        ;
FA32        LFA32:
FA32 : 96 52    " R"    ldaa  X0052
FA34 : 26 06    "& "    bne  LFA3C
FA36        LFA36:
FA36 : 96 50    " P"    ldaa  X0050
FA38 : 27 0D    "' "    beq  LFA47
FA3A : 97 52    " R"    staa  X0052
FA3C        LFA3C:
FA3C : CE 32 00    " 2 "    ldx  #$3200
FA3F        LFA3F:
FA3F : 09    " "    dex
FA40 : 26 FD    "& "    bne  LFA3F
FA42 : 7A 00 52    "z R"    dec  X0052
FA45 : 26 F5    "& "    bne  LFA3C
FA47        LFA47:
FA47 : CE FE 16    "   "    ldx  #$FE16
FA4A : 8D 07    "  "    bsr  LFA53
FA4C : CE FE 5E    "  ^"    ldx  #$FE5E
FA4F : 8D 02    "  "    bsr  LFA53
FA51 : 20 E3    "  "    bra  LFA36
        ;
FA53        LFA53:
FA53 : C6 01    "  "    ldab  #$01
FA55 : D7 04    "  "    stab  X0004
FA57 : 86 01    "  "    ldaa  #$01
FA59 : 97 0D    "  "    staa  X000D
FA5B : 4F    "O"    clra
FA5C : 97 06    "  "    staa  X0006
FA5E : 97 53    " S"    staa  X0053
FA60 : 97 05    "  "    staa  X0005
FA62 : DF 0A    "  "    stx  X000A
FA64 : 86 48    " H"    ldaa  #$48
FA66 : BD FC 55    "  U"    jsr  LFC55
FA69 : DF 01    "  "    stx  X0001
FA6B : CE 00 0E    "   "    ldx  #$000E
FA6E : DF 5E    " ^"    stx  X005E
FA70 : D6 51    " Q"    ldab  X0051
FA72 : CE FF 37    "  7"    ldx  #$FF37
FA75 : BD F9 18    "   "    jsr  LF918
FA78 : DE 5E    " ^"    ldx  X005E
FA7A : 6F 00    "o "    clr  $00,x
FA7C : 7E FB 4A    "~ J"    jmp  LFB4A
        ;
FA7F        LFA7F:
FA7F : 97 00    "  "    staa  X0000
FA81 : 16    " "    tab
FA82 : 1B    " "    aba
FA83 : 1B    " "    aba
FA84 : CE FE A3    "   "    ldx  #$FEA3
FA87 : BD FC 55    "  U"    jsr  LFC55
FA8A : A6 00    "  "    ldaa  $00,x
FA8C : 16    " "    tab
FA8D : 84 0F    "  "    anda  #$0F
FA8F : 97 04    "  "    staa  X0004
FA91 : 54    "T"    lsrb
FA92 : 54    "T"    lsrb
FA93 : 54    "T"    lsrb
FA94 : 54    "T"    lsrb
FA95 : D7 03    "  "    stab  X0003
FA97 : 5F    "_"    clrb
FA98 : A6 01    "  "    ldaa  $01,x
FA9A : 2A 08    "* "    bpl  LFAA4
FA9C : 5C    "\"    incb
FA9D : 85 40    " @"    bita  #$40
FA9F : 27 01    "' "    beq  LFAA2
FAA1 : 50    "P"    negb
FAA2        LFAA2:
FAA2 : D7 07    "  "    stab  X0007
FAA4        LFAA4:
FAA4 : D7 06    "  "    stab  X0006
FAA6 : 16    " "    tab
FAA7 : 54    "T"    lsrb
FAA8 : 54    "T"    lsrb
FAA9 : 54    "T"    lsrb
FAAA : 54    "T"    lsrb
FAAB : C4 03    "  "    andb  #$03
FAAD : D7 05    "  "    stab  X0005
FAAF : E6 02    "  "    ldab  $02,x
FAB1 : 84 0F    "  "    anda  #$0F
FAB3 : 97 60    " `"    staa  X0060
FAB5 : CE FD 84    "   "    ldx  #$FD84
FAB8        LFAB8:
FAB8 : 7A 00 60    "z `"    dec  X0060
FABB : 2B 08    "+ "    bmi  LFAC5
FABD : A6 00    "  "    ldaa  $00,x
FABF : 4C    "L"    inca
FAC0 : BD FC 55    "  U"    jsr  LFC55
FAC3 : 20 F3    "  "    bra  LFAB8
        ;
FAC5        LFAC5:
FAC5 : DF 08    "  "    stx  X0008
FAC7 : 17    " "    tba
FAC8 : CE FE EB    "   "    ldx  #$FEEB
FACB : BD FC 55    "  U"    jsr  LFC55
FACE : 96 00    "  "    ldaa  X0000
FAD0 : 81 17    "  "    cmpa  #$17
FAD2 : 27 2F    "'/"    beq  LFB03
FAD4 : 96 53    " S"    ldaa  X0053
FAD6 : 27 05    "' "    beq  LFADD
FAD8 : 4A    "J"    deca
FAD9 : 27 28    "'("    beq  LFB03
FADB : 97 53    " S"    staa  X0053
FADD        LFADD:
FADD : 96 54    " T"    ldaa  X0054
FADF : 27 0B    "' "    beq  LFAEC
FAE1 : 4A    "J"    deca
FAE2 : 26 06    "& "    bne  LFAEA
FAE4 : 96 0D    "  "    ldaa  X000D
FAE6 : 26 62    "&b"    bne  LFB4A
FAE8 : 20 19    "  "    bra  LFB03
        ;
FAEA        LFAEA:
FAEA : 97 54    " T"    staa  X0054
FAEC        LFAEC:
FAEC : DF 5E    " ^"    stx  X005E
FAEE : CE 00 0D    "   "    ldx  #$000D
FAF1 : DF 5C    " \"    stx  X005C
FAF3        LFAF3:
FAF3 : DE 5E    " ^"    ldx  X005E
FAF5 : A6 00    "  "    ldaa  $00,x
FAF7 : 08    " "    inx
FAF8 : DF 5E    " ^"    stx  X005E
FAFA : DE 5C    " \"    ldx  X005C
FAFC : 08    " "    inx
FAFD : DF 5C    " \"    stx  X005C
FAFF : A7 00    "  "    staa  $00,x
FB01 : 26 F0    "& "    bne  LFAF3
FB03        LFB03:
FB03 : 96 03    "  "    ldaa  X0003
FB05 : 97 0D    "  "    staa  X000D
FB07 : CE 00 2C    "  ,"    ldx  #$002C
FB0A : DF 0A    "  "    stx  X000A
FB0C : 96 06    "  "    ldaa  X0006
FB0E : 27 0E    "' "    beq  LFB1E
FB10 : CE 00 0E    "   "    ldx  #$000E
FB13        LFB13:
FB13 : A6 00    "  "    ldaa  $00,x
FB15 : 27 07    "' "    beq  LFB1E
FB17 : 9B 07    "  "    adda  X0007
FB19 : A7 00    "  "    staa  $00,x
FB1B : 08    " "    inx
FB1C : 20 F5    "  "    bra  LFB13
        ;
FB1E        LFB1E:
FB1E : CE 00 2C    "  ,"    ldx  #$002C
FB21 : DF 5E    " ^"    stx  X005E
FB23 : DE 08    "  "    ldx  X0008
FB25 : A6 00    "  "    ldaa  $00,x
FB27 : 08    " "    inx
FB28 : DF 5A    " Z"    stx  X005A
FB2A : CE 00 2C    "  ,"    ldx  #$002C
FB2D : BD FC 55    "  U"    jsr  LFC55
FB30 : DF 01    "  "    stx  X0001
FB32        LFB32:
FB32 : DE 5A    " Z"    ldx  X005A
FB34 : A6 00    "  "    ldaa  $00,x
FB36 : 08    " "    inx
FB37 : DF 5A    " Z"    stx  X005A
FB39 : DE 5E    " ^"    ldx  X005E
FB3B : A7 00    "  "    staa  $00,x
FB3D : 44    "D"    lsra
FB3E : 44    "D"    lsra
FB3F : 44    "D"    lsra
FB40 : 44    "D"    lsra
FB41 : A7 10    "  "    staa  $10,x
FB43 : 08    " "    inx
FB44 : DF 5E    " ^"    stx  X005E
FB46 : 9C 01    "  "    cpx  X0001
FB48 : 26 E8    "& "    bne  LFB32
FB4A        LFB4A:
FB4A : CE 00 0E    "   "    ldx  #$000E
FB4D : DF 5C    " \"    stx  X005C
FB4F        LFB4F:
FB4F : DE 5C    " \"    ldx  X005C
FB51 : A6 00    "  "    ldaa  $00,x
FB53 : 97 0C    "  "    staa  X000C
FB55 : 27 22    "'""    beq  LFB79
FB57 : D6 04    "  "    ldab  X0004
FB59 : 7C 00 5D    "| ]"    inc  X005D
FB5C        LFB5C:
FB5C : DE 0A    "  "    ldx  X000A
FB5E        LFB5E:
FB5E : 96 0C    "  "    ldaa  X000C
FB60        LFB60:
FB60 : 4A    "J"    deca
FB61 : 26 FD    "& "    bne  LFB60
FB63 : A6 00    "  "    ldaa  $00,x
FB65 : B7 04 00    "   "    staa  X0400
FB68 : 08    " "    inx
FB69 : 9C 01    "  "    cpx  X0001
FB6B : 26 F1    "& "    bne  LFB5E
FB6D : 5A    "Z"    decb
FB6E : 27 DF    "' "    beq  LFB4F
FB70 : 08    " "    inx
FB71 : 09    " "    dex
FB72 : 08    " "    inx
FB73 : 09    " "    dex
FB74 : 01    " "    nop
FB75 : 01    " "    nop
FB76 : 01    " "    nop
FB77 : 20 E3    "  "    bra  LFB5C
        ;
FB79        LFB79:
FB79 : D6 05    "  "    ldab  X0005
FB7B : 27 12    "' "    beq  LFB8F
FB7D        LFB7D:
FB7D : CE 00 2C    "  ,"    ldx  #$002C
FB80        LFB80:
FB80 : A6 00    "  "    ldaa  $00,x
FB82 : A0 10    "  "    suba  $10,x
FB84 : A7 00    "  "    staa  $00,x
FB86 : 08    " "    inx
FB87 : 8C 00 3C    "  <"    cpx  #$003C
FB8A : 26 F4    "& "    bne  LFB80
FB8C : 5A    "Z"    decb
FB8D : 26 EE    "& "    bne  LFB7D
FB8F        LFB8F:
FB8F : 96 54    " T"    ldaa  X0054
FB91 : 27 04    "' "    beq  LFB97
FB93 : 7A 00 0D    "z  "    dec  X000D
FB96 : 39    "9"    rts
        ;
FB97        LFB97:
FB97 : 7A 00 0D    "z  "    dec  X000D
FB9A : 26 AE    "& "    bne  LFB4A
FB9C : 96 53    " S"    ldaa  X0053
FB9E : 26 07    "& "    bne  LFBA7
FBA0 : 96 06    "  "    ldaa  X0006
FBA2 : 27 03    "' "    beq  LFBA7
FBA4 : 7E FB 03    "~  "    jmp  LFB03
FBA7        LFBA7:
FBA7 : 39    "9"    rts
        ;
FBA8 : 8E 00 7F    "   "    lds  #$007F
FBAB : CE F8 CC    "   "    ldx  #$F8CC
FBAE : DF 58    " X"    stx  X0058
FBB0 : B6 04 02    "   "    ldaa  X0402
FBB3 : BD FC CA    "   "    jsr  LFCCA
FBB6 : C6 80    "  "    ldab  #$80
FBB8 : F7 04 02    "   "    stab  X0402
FBBB : 43    "C"    coma
FBBC : 84 7F    "  "    anda  #$7F
FBBE : 16    " "    tab
FBBF : 36    "6"    psha
FBC0 : C4 1F    "  "    andb  #$1F
FBC2 : C1 10    "  "    cmpb  #$10
FBC4 : 27 4A    "'J"    beq  LFC10
FBC6 : 84 5F    " _"    anda  #$5F
FBC8 : 5F    "_"    clrb
FBC9 : 81 06    "  "    cmpa  #$06
FBCB : 26 06    "& "    bne  LFBD3
FBCD : D6 53    " S"    ldab  X0053
FBCF : 26 02    "& "    bne  LFBD3
FBD1 : C6 02    "  "    ldab  #$02
FBD3        LFBD3:
FBD3 : D7 53    " S"    stab  X0053
FBD5 : 5F    "_"    clrb
FBD6 : 81 08    "  "    cmpa  #$08
FBD8 : 26 06    "& "    bne  LFBE0
FBDA : D6 54    " T"    ldab  X0054
FBDC : 26 02    "& "    bne  LFBE0
FBDE : C6 02    "  "    ldab  #$02
FBE0        LFBE0:
FBE0 : D7 54    " T"    stab  X0054
FBE2 : 32    "2"    pula
FBE3 : 85 20    "  "    bita  #$20
FBE5 : 27 1B    "' "    beq  LFC02
FBE7 : 16    " "    tab
FBE8 : C4 1F    "  "    andb  #$1F
FBEA : C1 17    "  "    cmpb  #$17
FBEC : 23 14    "# "    bls  LFC02
FBEE : 97 00    "  "    staa  X0000
FBF0 : F6 DE C0    "   "    ldab  XDEC0
FBF3 : C1 43    " C"    cmpb  #$43
FBF5 : 26 0B    "& "    bne  LFC02
FBF7 : BD DE EE    "   "    jsr  LDEEE
FBFA : B6 04 02    "   "    ldaa  X0402
FBFD        XFBFD:
FBFD : 0E    " "    cli
FBFE : 96 00    "  "    ldaa  X0000
FC00 : 27 39    "'9"    beq  LFC3B
FC02        LFC02:
FC02 : 0E    " "    cli
FC03 : 85 40    " @"    bita  #$40
FC05 : 27 09    "' "    beq  LFC10
FC07 : 84 1F    "  "    anda  #$1F
FC09 : 81 01    "  "    cmpa  #$01
FC0B : 27 03    "' "    beq  LFC10
FC0D : 7E F9 2C    "~ ,"    jmp  LF92C
        ;
FC10        LFC10:
FC10 : 0E    " "    cli
FC11 : 84 1F    "  "    anda  #$1F
FC13 : 27 26    "'&"    beq  LFC3B
FC15 : 4A    "J"    deca
FC16 : 27 4C    "'L"    beq  LFC64
FC18 : 81 06    "  "    cmpa  #$06
FC1A : 23 0E    "# "    bls  LFC2A
FC1C : 81 0E    "  "    cmpa  #$0E
FC1E : 22 04    "" "    bhi  LFC24
FC20 : 8B 08    "  "    adda  #$08
FC22 : 20 06    "  "    bra  LFC2A
        ;
FC24        LFC24:
FC24 : 81 16    "  "    cmpa  #$16
FC26 : 23 07    "# "    bls  LFC2F
FC28 : 84 0F    "  "    anda  #$0F
FC2A        LFC2A:
FC2A : BD FA 7F    "   "    jsr  LFA7F
FC2D : 20 0C    "  "    bra  LFC3B
        ;
FC2F        LFC2F:
FC2F : 80 0F    "  "    suba  #$0F
FC31 : 48    "H"    asla
FC32 : CE FC D4    "   "    ldx  #$FCD4
FC35 : 8D 1E    "  "    bsr  LFC55
FC37 : EE 00    "  "    ldx  $00,x
FC39 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
FC3B        LFC3B:
FC3B : 86 80    "  "    ldaa  #$80
FC3D : B7 04 02    "   "    staa  X0402
FC40 : 96 4E    " N"    ldaa  X004E
FC42 : 9A 4F    " O"    oraa  X004F
FC44        LFC44:
FC44 : 27 FE    "' "    beq  LFC44
FC46 : 4F    "O"    clra
FC47 : 97 53    " S"    staa  X0053
FC49 : 97 54    " T"    staa  X0054
FC4B : 96 4E    " N"    ldaa  X004E
FC4D : 27 03    "' "    beq  LFC52
FC4F : 7E FA 32    "~ 2"    jmp  LFA32
FC52        LFC52:
FC52 : 7E FA 05    "~  "    jmp  LFA05
        ;
FC55        LFC55:
FC55 : DF 5C    " \"    stx  X005C
FC57 : 9B 5D    " ]"    adda  X005D
FC59 : 97 5D    " ]"    staa  X005D
FC5B : 96 5C    " \"    ldaa  X005C
FC5D : 89 00    "  "    adca  #$00
FC5F : 97 5C    " \"    staa  X005C
FC61 : DE 5C    " \"    ldx  X005C
FC63 : 39    "9"    rts
        ;
FC64        LFC64:
FC64 : CE 00 E0    "   "    ldx  #$00E0
FC67        LFC67:
FC67 : 86 20    "  "    ldaa  #$20
FC69 : 8D EA    "  "    bsr  LFC55
FC6B        LFC6B:
FC6B : 09    " "    dex
FC6C        LFC6C:
FC6C : 26 FD    "& "    bne  LFC6B
FC6E : 7F 04 00    "   "    clr  X0400
FC71        LFC71:
FC71 : 5A    "Z"    decb
FC72 : 26 FD    "& "    bne  LFC71
FC74 : 73 04 00    "s  "    com  X0400
FC77 : DE 5C    " \"    ldx  X005C
FC79 : 8C 10 00    "   "    cpx  #$1000
FC7C : 26 E9    "& "    bne  LFC67
FC7E : 20 BB    "  "    bra  LFC3B
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
FC95 : BD F9 7B    "  {"    jsr  LF97B
FC98 : BD F9 7B    "  {"    jsr  LF97B
FC9B : BD F9 7B    "  {"    jsr  LF97B
FC9E : 8D 2A    " *"    bsr  LFCCA
FCA0 : BD F8 DC    "   "    jsr  LF8DC
FCA3 : 8D 25    " %"    bsr  LFCCA
FCA5 : BD F8 E1    "   "    jsr  LF8E1
FCA8 : 86 01    "  "    ldaa  #$01
FCAA : BD FA 7F    "   "    jsr  LFA7F
FCAD : 86 02    "  "    ldaa  #$02
FCAF : BD FA 7F    "   "    jsr  LFA7F
FCB2 : 86 0E    "  "    ldaa  #$0E
FCB4 : BD FA 7F    "   "    jsr  LFA7F
FCB7 : 86 06    "  "    ldaa  #$06
FCB9 : BD FA 7F    "   "    jsr  LFA7F
FCBC : F6 DE C0    "   "    ldab  XDEC0
FCBF : C1 43    " C"    cmpb  #$43
FCC1 : 26 BD    "& "    bne  LFC80
FCC3 : 86 08    "  "    ldaa  #$08
FCC5 : BD DE F2    "   "    jsr  LDEF2
FCC8 : 20 B6    "  "    bra  LFC80
        ;
FCCA        LFCCA:
FCCA : C6 AF    "  "    ldab  #$AF
FCCC : D7 57    " W"    stab  X0057
FCCE : CE 00 00    "   "    ldx  #$0000
FCD1 : DF 5E    " ^"    stx  X005E
FCD3 : 39    "9"    rts
        ;
FCD4 : F9 7B F9    " { "    adcb  X7BF9
FCD7 : EF F9    "  "    stx  $F9,x
FCD9 : C8 F9    "  "    eorb  #$F9
FCDB : FE F8 D0    "   "    ldx  XF8D0
FCDE : F8 E6 F8    "   "    eorb  XE6F8
        ;
FCE1 : DC    " "    db  $DC
        ;
FCE2 : F8 E1 DA    "   "    eorb  XE1DA
FCE5 : FF DA 80    "   "    stx  XDA80
FCE8 : 26 01    "& "    bne  LFCEB
FCEA : 26 80    "& "    bne  LFC6C
FCEC : 07    " "    tpa
FCED : 0A    " "    clv
FCEE : 07    " "    tpa
        ;
FCEF : 00    " "    db  $00
        ;
FCF0 : F9 F6 F9    "   "    adcb  XF6F9
        ;
FCF3 : 00 3A    " :"    db  $00, $3A
        ;
FCF5 : 3E    ">"    wai
FCF6 : 50    "P"    negb
FCF7 : 46    "F"    rora
FCF8 : 33    "3"    pulb
FCF9 : 2C 27    ",'"    bge  LFD22
FCFB : 20 25    " %"    bra  LFD22
        ;
FCFD : 1C 1A    "  "    db  $1C, $1A
        ;
FCFF : 17    " "    tba
        ;
FD00 : 14    " "    db  $14
        ;
FD01 : 11    " "    cba
FD02 : 10    " "    sba
FD03 : 33    "3"    pulb
FD04 : 08    " "    inx
        ;
FD05 : 03 02    "  "    db  $03, $02
        ;
FD07 : 01    " "    nop
        ;
FD08 : 02 03 04 05  "    "    db  $02, $03, $04, $05
        ;
FD0C : 06    " "    tap
FD0D : 0A    " "    clv
        ;
FD0E : 1E    " "    db  $1E
        ;
FD0F : 32    "2"    pula
FD10 : 70 00 FF    "p  "    neg  X00FF
FD13 : FF FF 90    "   "    stx  XFF90
FD16 : FF FF FF    "   "    stx  XFFFF
FD19 : FF FF FF    "   "    stx  XFFFF
FD1C : FF 90 FF    "   "    stx  X90FF
FD1F : FF FF FF    "   "    stx  XFFFF
FD22        LFD22:
FD22 : FF FF FF    "   "    stx  XFFFF
FD25 : FF 00 00    "   "    stx  X0000
        ;
FD28 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FD2C : 00 00    "  "    db  $00, $00
        ;
FD2E : 01    " "    nop
        ;
FD2F : 04 00 00    "   "    db  $04, $00, $00
        ;
FD32 : 3F    "?"    swi
FD33 : 7F 00 00    "   "    clr  X0000
FD36 : 01    " "    nop
        ;
FD37 : 04 00 00 05  "    "    db  $04, $00, $00, $05
        ;
FD3B : FF 00 00    "   "    stx  X0000
FD3E : 01    " "    nop
        ;
FD3F : 00 00 00    "   "    db  $00, $00, $00
        ;
FD42 : 48    "H"    asla
        ;
FD43 : 00 00 00 05  "    "    db  $00, $00, $00, $05
        ;
FD47 : FF 00 00    "   "    stx  X0000
        ;
FD4A : 02    " "    db  $02
        ;
FD4B : 80 00    "  "    suba  #$00
FD4D : 30    "0"    tsx
FD4E : 0A    " "    clv
FD4F : 7F 00 7F    "   "    clr  X007F
        ;
FD52 : 02    " "    db  $02
        ;
FD53 : 80 00    "  "    suba  #$00
FD55 : 30    "0"    tsx
FD56 : C0 80    "  "    subb  #$80
        ;
FD58 : 00    " "    db  $00
        ;
FD59 : 20 01    "  "    bra  LFD5C
        ;
FD5B : 10    " "    sba
        ;
FD5C        LFD5C:
FD5C : 00 15    "  "    db  $00, $15
        ;
FD5E : C0 10    "  "    subb  #$10
        ;
FD60 : 00 00    "  "    db  $00, $00
        ;
FD62 : C0 80    "  "    subb  #$80
        ;
FD64 : 00 00    "  "    db  $00, $00
        ;
FD66 : 01    " "    nop
        ;
FD67 : FC 02 FC 03  "    "    db  $FC, $02, $FC, $03
        ;
FD6B : F8 04 F8    "   "    eorb  X04F8
FD6E : 06    " "    tap
FD6F : F8 08 F4    "   "    eorb  X08F4
FD72 : 0C    " "    clc
FD73 : F4 10 F4    "   "    andb  X10F4
FD76 : 20 F2    "  "    bra  LFD6A
        ;
FD78 : 40    "@"    nega
FD79 : F1 60 F1    " ` "    cmpb  X60F1
FD7C : 80 F1    "  "    suba  #$F1
FD7E : A0 F1    "  "    suba  $F1,x
FD80 : C0 F1    "  "    subb  #$F1
        ;
FD82 : 00 00    "  "    db  $00, $00
        ;
FD84 : 08    " "    inx
FD85 : 7F D9 FF    "   "    clr  XD9FF
FD88 : D9 7F    "  "    adcb  X007F
FD8A : 24 00    "$ "    bcc  LFD8C
FD8C        LFD8C:
FD8C : 24 08    "$ "    bcc  LFD96
FD8E : FF FF FF    "   "    stx  XFFFF
FD91 : FF 00 00    "   "    stx  X0000
        ;
FD94 : 00 00    "  "    db  $00, $00
        ;
FD96        LFD96:
FD96 : 08    " "    inx
        ;
FD97 : 00    " "    db  $00
        ;
FD98 : 40    "@"    nega
FD99 : 80 00    "  "    suba  #$00
FD9B : FF 00 80    "   "    stx  X0080
FD9E : 40    "@"    nega
FD9F : 10    " "    sba
FDA0 : 7F B0 D9    "   "    clr  XB0D9
FDA3 : F5 FF F5    "   "    bitb  XFFF5
FDA6 : D9 B0    "  "    adcb  X00B0
FDA8 : 7F 4E 24    " N$"    clr  X4E24
FDAB : 09    " "    dex
        ;
FDAC : 00    " "    db  $00
        ;
FDAD : 09    " "    dex
FDAE : 24 4E    "$N"    bcc  LFDFE
FDB0 : 10    " "    sba
FDB1 : 7F C5 EC    "   "    clr  XC5EC
FDB4 : E7 BF    "  "    stab  $BF,x
FDB6 : 8D 6D    " m"    bsr  LFE25
FDB8 : 6A 7F    "j "    dec  $7F,x
FDBA : 94 92    "  "    anda  X0092
        ;
FDBC : 71    "q"    db  $71
        ;
FDBD : 40    "@"    nega
FDBE : 17    " "    tba
        ;
FDBF : 12    " "    db  $12
        ;
FDC0 : 39    "9"    rts
        ;
FDC1 : 10    " "    sba
FDC2 : 76 FF B8    "v  "    ror  XFFB8
FDC5 : D0 9D    "  "    subb  X009D
FDC7 : E6 6A    " j"    ldab  $6A,x
FDC9 : 82 76    " v"    sbca  #$76
FDCB : EA 81    "  "    orab  $81,x
FDCD : 86 4E    " N"    ldaa  #$4E
FDCF : 9C 32    " 2"    cpx  X0032
FDD1 : 63 10    "c "    com  $10,x
FDD3 : FF FF FF    "   "    stx  XFFFF
FDD6 : FF FF FF    "   "    stx  XFFFF
FDD9 : FF FF 00    "   "    stx  XFF00
        ;
FDDC : 00 00 00 00  "    "    db  $00, $00, $00, $00
FDE0 : 00 00 00    "   "    db  $00, $00, $00
        ;
FDE3 : 10    " "    sba
FDE4 : FF FF FF    "   "    stx  XFFFF
FDE7 : FF 00 00    "   "    stx  X0000
        ;
FDEA : 00 00    "  "    db  $00, $00
        ;
FDEC : FF FF FF    "   "    stx  XFFFF
FDEF : FF 00 00    "   "    stx  X0000
        ;
FDF2 : 00 00    "  "    db  $00, $00
        ;
FDF4 : 10    " "    sba
        ;
FDF5 : 00    " "    db  $00
        ;
FDF6 : F4 00 E8    "   "    andb  X00E8
        ;
FDF9 : 00 DC 00    "   "    db  $00, $DC, $00
        ;
FDFC : E2 00    "  "    sbcb  $00,x
        ;
FDFE        LFDFE:
FDFE : DC 00    "  "    db  $DC, $00
        ;
FE00 : E8 00    "  "    eorb  $00,x
FE02 : F4 00 00    "   "    andb  X0000
FE05 : 10    " "    sba
FE06 : 4C    "L"    inca
FE07 : 6A 82    "j "    dec  $82,x
        ;
FE09 : 93    " "    db  $93
        ;
FE0A : 99 93    "  "    adca  X0093
FE0C : 82 6A    " j"    sbca  #$6A
FE0E : 4C    "L"    inca
FE0F : 2F 16    "/ "    ble  LFE27
        ;
FE11 : 05 00 05    "   "    db  $05, $00, $05
        ;
FE14 : 16    " "    tab
FE15 : 2F 8A    "/ "    ble  LFDA1
FE17 : 95 A0    "  "    bita  X00A0
FE19 : AB B5    "  "    adda  $B5,x
FE1B : BF C8 D1    "   "    sts  XC8D1
FE1E : DA E1    "  "    orab  X00E1
FE20 : E8 EE    "  "    eorb  $EE,x
        ;
FE22 : F3    " "    db  $F3
        ;
FE23 : F7 FB FD    "   "    stab  XFBFD
FE26 : FE FF FE    "   "    ldx  XFFFE
        ;
FE29 : FD    " "    db  $FD
        ;
FE2A : FB F7 F3    "   "    addb  XF7F3
FE2D : EE E8    "  "    ldx  $E8,x
FE2F : E1 DA    "  "    cmpb  $DA,x
FE31 : D1 C8    "  "    cmpb  X00C8
FE33 : BF B5 AB    "   "    sts  XB5AB
FE36 : A0 95    "  "    suba  $95,x
FE38 : 8A 7F    "  "    oraa  #$7F
        ;
FE3A : 75    "u"    db  $75
        ;
FE3B : 6A 5F    "j_"    dec  $5F,x
FE3D : 54    "T"    lsrb
FE3E : 4A    "J"    deca
FE3F : 40    "@"    nega
FE40 : 37    "7"    pshb
FE41 : 2E 25    ".%"    bgt  LFE68
        ;
FE43 : 1E    " "    db  $1E
        ;
FE44 : 17    " "    tba
FE45 : 11    " "    cba
FE46 : 0C    " "    clc
FE47 : 08    " "    inx
        ;
FE48 : 04 02    "  "    db  $04, $02
        ;
FE4A : 01    " "    nop
        ;
FE4B : 00    " "    db  $00
        ;
FE4C : 01    " "    nop
        ;
FE4D : 02 04    "  "    db  $02, $04
        ;
FE4F : 08    " "    inx
FE50 : 0C    " "    clc
FE51 : 11    " "    cba
FE52 : 17    " "    tba
        ;
FE53 : 1E    " "    db  $1E
        ;
FE54 : 25 2E    "%."    bcs  LFE84
FE56 : 37    "7"    pshb
FE57 : 40    "@"    nega
FE58 : 4A    "J"    deca
FE59 : 54    "T"    lsrb
FE5A : 5F    "_"    clrb
FE5B : 6A 75    "ju"    dec  $75,x
FE5D : 7F 45 4B    " EK"    clr  X454B
FE60 : 50    "P"    negb
FE61 : 56    "V"    rorb
        ;
FE62 : 5B    "["    db  $5B
        ;
FE63 : 60 64    "`d"    neg  $64,x
FE65 : 69 6D    "im"    rol  $6D,x
        ;
FE67 : 71    "q"    db  $71
        ;
FE68        LFE68:
FE68 : 74 77 7A    "twz"    lsr  X777A
FE6B : 7C 7E 7F    "|~ "    inc  X7E7F
FE6E : 7F 80 7F    "   "    clr  X807F
FE71 : 7F 7E 7C    " ~|"    clr  X7E7C
FE74 : 7A 77 74    "zwt"    dec  X7774
        ;
FE77 : 71    "q"    db  $71
        ;
FE78 : 6D 69    "mi"    tst  $69,x
FE7A : 64 60    "d`"    lsr  $60,x
        ;
FE7C : 5B    "["    db  $5B
        ;
FE7D : 56    "V"    rorb
FE7E : 50    "P"    negb
        ;
FE7F : 4B 45    "KE"    db  $4B, $45
        ;
FE81 : 40    "@"    nega
FE82 : 3B    ";"    rti
        ;
FE83 : 35    "5"    txs
FE84        LFE84:
FE84 : 30    "0"    tsx
FE85 : 2A 25    "*%"    bpl  LFEAC
FE87 : 20 1C    "  "    bra  LFEA5
        ;
FE89 : 17    " "    tba
        ;
FE8A : 13    " "    db  $13
        ;
FE8B : 0F    " "    sei
FE8C : 0C    " "    clc
FE8D : 09    " "    dex
FE8E : 06    " "    tap
        ;
FE8F : 04 02    "  "    db  $04, $02
        ;
FE91 : 01    " "    nop
FE92 : 01    " "    nop
        ;
FE93 : 00    " "    db  $00
        ;
FE94 : 01    " "    nop
FE95 : 01    " "    nop
        ;
FE96 : 02 04    "  "    db  $02, $04
        ;
FE98 : 06    " "    tap
FE99 : 09    " "    dex
FE9A : 0C    " "    clc
FE9B : 0F    " "    sei
        ;
FE9C : 13    " "    db  $13
        ;
FE9D : 17    " "    tba
        ;
FE9E : 1C    " "    db  $1C
        ;
FE9F : 20 25    " %"    bra  LFEC6
        ;
FEA1 : 2A 30    "*0"    bpl  LFED3
FEA3 : 35    "5"    txs
FEA4 : 3B    ";"    rti
        ;
FEA5        LFEA5:
FEA5 : 40    "@"    nega
FEA6 : 88 20    "  "    eora  #$20
FEA8 : 0F    " "    sei
        ;
FEA9 : 14    " "    db  $14
        ;
FEAA : 11    " "    cba
        ;
FEAB : 00 F3    "  "    db  $00, $F3
        ;
FEAD : 10    " "    sba
FEAE : 30    "0"    tsx
FEAF : 53    "S"    comb
FEB0 : 32    "2"    pula
        ;
FEB1 : 1D    " "    db  $1D
        ;
FEB2 : 31    "1"    ins
FEB3 : D2 1D    "  "    sbcb  X001D
FEB5 : F4 12 00    "   "    andb  X1200
FEB8 : 11    " "    cba
FEB9 : B2 0F F6    "   "    sbca  X0FF6
FEBC : 10    " "    sba
        ;
FEBD : 3D    "="    db  $3D
        ;
FEBE : F5 11 2B    "  +"    bitb  X112B
FEC1 : F4 12 2B    "  +"    andb  X122B
        ;
FEC4 : 21    "!"    db  $21
        ;
FEC5 : B0 0F F4    "   "    suba  X0FF4
        ;
FEC8 : 12 18 13    "   "    db  $12, $18, $13
        ;
FECB : D0 42    " B"    subb  X0042
FECD : F4 12 42    "  B"    andb  X1242
        ;
FED0 : 51    "Q"    db  $51
        ;
FED1 : D4 6C    " l"    andb  X006C
        ;
FED3        LFED3:
FED3 : 51    "Q"    db  $51
        ;
FED4 : 37    "7"    pshb
FED5 : 79 11 08    "y  "    rol  X1108
FED8 : 79 F4 15    "y  "    rol  XF415
FEDB : 92 82    "  "    sbca  X0082
FEDD : 23 A5    "# "    bls  LFE84
FEDF : F2 18 BE    "   "    sbcb  X18BE
        ;
FEE2 : 14    " "    db  $14
        ;
FEE3 : 90 90    "  "    suba  X0090
        ;
FEE5 : 42    "B"    db  $42
        ;
FEE6 : 36    "6"    psha
        ;
FEE7 : 3D 12    "= "    db  $3D, $12
        ;
FEE9 : 09    " "    dex
        ;
FEEA : 62    "b"    db  $62
        ;
FEEB : 01    " "    nop
FEEC : 01    " "    nop
        ;
FEED : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FEF1 : 08    " "    inx
FEF2 : 08    " "    inx
FEF3 : 10    " "    sba
FEF4 : 10    " "    sba
FEF5 : 30    "0"    tsx
FEF6 : 60 C0    "` "    neg  $C0,x
FEF8 : E0 00    "  "    subb  $00,x
FEFA : 01    " "    nop
FEFB : 01    " "    nop
        ;
FEFC : 02 02 03 04  "    "    db  $02, $02, $03, $04
FF00        XFF00:
FF00 : 05    " "    db  $05
        ;
FF01 : 06    " "    tap
FF02 : 07    " "    tpa
FF03 : 08    " "    inx
FF04 : 09    " "    dex
FF05 : 0A    " "    clv
FF06 : 0C    " "    clc
        ;
FF07 : 00    " "    db  $00
        ;
FF08 : A0 98    "  "    suba  $98,x
FF0A : 90 88    "  "    suba  X0088
FF0C : 80 78    " x"    suba  #$78
FF0E : 70 68 60    "ph`"    neg  X6860
FF11 : 58    "X"    aslb
FF12 : 50    "P"    negb
FF13 : 48    "H"    asla
FF14 : 40    "@"    nega
        ;
FF15 : 00    " "    db  $00
        ;
FF16 : 10    " "    sba
FF17 : 90 10    "  "    suba  X0010
FF19 : 90 00    "  "    suba  X0000
FF1B : 80 78    " x"    suba  #$78
FF1D : 70 68 60    "ph`"    neg  X6860
FF20 : 58    "X"    aslb
FF21 : 50    "P"    negb
FF22 : 58    "X"    aslb
FF23 : 60 70    "`p"    neg  $70,x
FF25 : 78 80 00    "x  "    asl  X8000
FF28 : 08    " "    inx
FF29 : 80 10    "  "    suba  #$10
FF2B : 78 18 70    "x p"    asl  X1870
FF2E : 20 60    " `"    bra  LFF90
        ;
FF30 : 28 58    "(X"    bvc  LFF8A
FF32 : 30    "0"    tsx
FF33 : 50    "P"    negb
FF34 : 40    "@"    nega
FF35 : 48    "H"    asla
        ;
FF36 : 00 04 05    "   "    db  $00, $04, $05
        ;
FF39 : 06    " "    tap
FF3A : 07    " "    tpa
FF3B : 08    " "    inx
FF3C : 0A    " "    clv
FF3D : 0C    " "    clc
FF3E : 0E    " "    cli
FF3F : 10    " "    sba
FF40 : 11    " "    cba
        ;
FF41 : 12 13 14 15  "    "    db  $12, $13, $14, $15
        ;
FF45 : 16    " "    tab
FF46 : 17    " "    tba
        ;
FF47 : 18    " "    db  $18
        ;
FF48 : 19    " "    daa
        ;
FF49 : 1A    " "    db  $1A
        ;
FF4A : 1B    " "    aba
        ;
FF4B : 1C 00    "  "    db  $1C, $00
        ;
FF4D : 80 7C    " |"    suba  #$7C
FF4F : 78 74 70    "xtp"    asl  X7470
FF52 : 74 78 7C    "tx|"    lsr  X787C
FF55 : 80 00    "  "    suba  #$00
FF57 : 20 22    " ""    bra  LFF7B
        ;
FF59 : 24 26    "$&"    bcc  LFF81
FF5B : 28 2A    "(*"    bvc  LFF87
FF5D : 2E 2C    ".,"    bgt  LFF8B
FF5F : 2A 28    "*("    bpl  LFF89
FF61 : 26 24    "&$"    bne  LFF87
        ;
FF63 : 00    " "    db  $00
        ;
FF64 : 01    " "    nop
FF65 : 01    " "    nop
        ;
FF66 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FF6A : 08    " "    inx
FF6B : 08    " "    inx
FF6C : 10    " "    sba
FF6D : 20 28    " ("    bra  LFF97
        ;
FF6F : 30    "0"    tsx
        ;
FF70 : 38    "8"    db  $38
        ;
FF71 : 40    "@"    nega
FF72 : 48    "H"    asla
FF73 : 50    "P"    negb
FF74 : 60 70    "`p"    neg  $70,x
FF76 : 80 A0    "  "    suba  #$A0
FF78 : B0 C0 00    "   "    suba  XC000
FF7B        LFF7B:
FF7B : 01    " "    nop
        ;
FF7C : 00    " "    db  $00
        ;
FF7D : 01    " "    nop
FF7E : 08    " "    inx
FF7F : 10    " "    sba
FF80 : 01    " "    nop
FF81        LFF81:
FF81 : 08    " "    inx
FF82 : 10    " "    sba
FF83 : 01    " "    nop
FF84 : 08    " "    inx
FF85 : 10    " "    sba
FF86 : 01    " "    nop
FF87        LFF87:
FF87 : 08    " "    inx
FF88 : 10    " "    sba
FF89        LFF89:
FF89 : 01    " "    nop
FF8A        LFF8A:
FF8A : 08    " "    inx
FF8B        LFF8B:
FF8B : 10    " "    sba
FF8C : 01    " "    nop
FF8D : 08    " "    inx
FF8E : 10    " "    sba
        ;
FF8F : 00    " "    db  $00
        ;
FF90        LFF90:
FF90        XFF90:
FF90 : 10    " "    sba
FF91 : 20 40    " @"    bra  LFFD3
        ;
FF93 : 10    " "    sba
FF94 : 20 40    " @"    bra  LFFD6
        ;
FF96 : 10    " "    sba
FF97        LFF97:
FF97 : 20 40    " @"    bra  LFFD9
        ;
FF99 : 10    " "    sba
FF9A : 20 40    " @"    bra  LFFDC
        ;
FF9C : 10    " "    sba
FF9D : 20 40    " @"    bra  LFFDF
        ;
FF9F : 10    " "    sba
FFA0 : 20 40    " @"    bra  LFFE2
        ;
FFA2 : 10    " "    sba
FFA3 : 20 40    " @"    bra  LFFE5
        ;
FFA5 : 10    " "    sba
FFA6 : 20 40    " @"    bra  LFFE8
        ;
FFA8 : 00    " "    db  $00
        ;
FFA9 : 01    " "    nop
FFAA : 40    "@"    nega
        ;
FFAB : 02 42 03    " B "    db  $02, $42, $03
        ;
FFAE : 43    "C"    coma
        ;
FFAF : 04    " "    db  $04
        ;
FFB0 : 44    "D"    lsra
        ;
FFB1 : 05 45    " E"    db  $05, $45
        ;
FFB3 : 06    " "    tap
FFB4 : 46    "F"    rora
FFB5 : 07    " "    tpa
FFB6 : 47    "G"    asra
FFB7 : 08    " "    inx
FFB8        XFFB8:
FFB8 : 48    "H"    asla
FFB9 : 09    " "    dex
FFBA : 49    "I"    rola
FFBB : 0A    " "    clv
FFBC : 4A    "J"    deca
FFBD : 0B    " "    sev
        ;
FFBE : 4B 00 00 00  "K   "    db  $4B, $00, $00, $00
FFC2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFC6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFCA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFCE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD6        LFFD6:
FFD6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFDA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFDE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE2        LFFE2:
FFE2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFEA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFEE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFF2 : 00    " "    db  $00
        ;
FFF3 : 7E FC 55    "~ U"    jmp  LFC55
        ;
FFF6 : DF EE    "  "    stx  X00EE
FFF8 : FB A8 F8    "   "    addb  XA8F8
FFFB : 01    " "    nop
        ;
FFFC : FC    " "    db  $FC
        ;
FFFD : 80 F8    "  "    suba  #$F8
FFFF        XFFFF:
FFFF : 01    " "    nop

;--------------------------------------------------------------




