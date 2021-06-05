        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    LaserCue.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  52FB
        ;  CRC-32:    1888C635
        ;
        ;  Date:    Sat May 22 21:46:37 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Sound ROM ?? Laser Cue, 1984
        ;
        ;
          org  $F800
        ;
F800 : 28 0F    "( "    bvc  LF811
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
F81C : 97 08    "  "    staa  X0008
F81E : E7 02    "  "    stab  $02,x
F820 : 97 00    "  "    staa  X0000
F822 : 4F    "O"    clra
F823 : 97 05    "  "    staa  X0005
F825 : 97 06    "  "    staa  X0006
F827 : 97 02    "  "    staa  X0002
F829 : 97 03    "  "    staa  X0003
F82B : 97 04    "  "    staa  X0004
F82D : 97 01    "  "    staa  X0001
F82F : 0E    " "    cli
F830        LF830:
F830 : 20 FE    "  "    bra  LF830
        ;
F832        LF832:
F832 : 16    " "    tab
F833 : 48    "H"    asla
F834 : 48    "H"    asla
F835 : 48    "H"    asla
F836 : 1B    " "    aba
F837 : CE 00 13    "   "    ldx  #$0013
F83A : DF 0F    "  "    stx  X000F
F83C : CE FB FB    "   "    ldx  #$FBFB
F83F : BD FB A9    "   "    jsr  LFBA9
F842 : C6 09    "  "    ldab  #$09
F844 : 7E F8 94    "~  "    jmp  LF894
        ;
F847        LF847:
F847 : 96 1B    "  "    ldaa  X001B
F849 : B7 04 00    "   "    staa  X0400
F84C        LF84C:
F84C : 96 13    "  "    ldaa  X0013
F84E : 97 1C    "  "    staa  X001C
F850 : 96 14    "  "    ldaa  X0014
F852 : 97 1D    "  "    staa  X001D
F854        LF854:
F854 : DE 18    "  "    ldx  X0018
F856        LF856:
F856 : 96 1C    "  "    ldaa  X001C
F858 : 73 04 00    "s  "    com  X0400
F85B        LF85B:
F85B : 09    " "    dex
F85C : 27 10    "' "    beq  LF86E
F85E : 4A    "J"    deca
F85F : 26 FA    "& "    bne  LF85B
F861 : 73 04 00    "s  "    com  X0400
F864 : 96 1D    "  "    ldaa  X001D
F866        LF866:
F866 : 09    " "    dex
F867 : 27 05    "' "    beq  LF86E
F869 : 4A    "J"    deca
F86A : 26 FA    "& "    bne  LF866
F86C : 20 E8    "  "    bra  LF856
        ;
F86E        LF86E:
F86E : B6 04 00    "   "    ldaa  X0400
F871 : 2B 01    "+ "    bmi  LF874
F873 : 43    "C"    coma
F874        LF874:
F874 : 8B 00    "  "    adda  #$00
F876 : B7 04 00    "   "    staa  X0400
F879 : 96 1C    "  "    ldaa  X001C
F87B : 9B 15    "  "    adda  X0015
F87D : 97 1C    "  "    staa  X001C
F87F : 96 1D    "  "    ldaa  X001D
F881 : 9B 16    "  "    adda  X0016
F883 : 97 1D    "  "    staa  X001D
F885 : 91 17    "  "    cmpa  X0017
F887 : 26 CB    "& "    bne  LF854
F889 : 96 1A    "  "    ldaa  X001A
F88B : 27 06    "' "    beq  LF893
F88D : 9B 13    "  "    adda  X0013
F88F : 97 13    "  "    staa  X0013
F891 : 26 B9    "& "    bne  LF84C
F893        LF893:
F893 : 39    "9"    rts
        ;
F894        LF894:
F894 : 36    "6"    psha
F895        LF895:
F895 : A6 00    "  "    ldaa  $00,x
F897 : DF 0D    "  "    stx  X000D
F899 : DE 0F    "  "    ldx  X000F
F89B : A7 00    "  "    staa  $00,x
F89D : 08    " "    inx
F89E : DF 0F    "  "    stx  X000F
F8A0 : DE 0D    "  "    ldx  X000D
F8A2 : 08    " "    inx
F8A3 : 5A    "Z"    decb
F8A4 : 26 EF    "& "    bne  LF895
F8A6 : 32    "2"    pula
F8A7 : 39    "9"    rts
        ;
F8A8        LF8A8:
F8A8 : CE FC 5E    "  ^"    ldx  #$FC5E
F8AB : DF 15    "  "    stx  X0015
F8AD        LF8AD:
F8AD : DE 15    "  "    ldx  X0015
F8AF : A6 00    "  "    ldaa  $00,x
F8B1 : 27 33    "'3"    beq  LF8E6
F8B3 : E6 01    "  "    ldab  $01,x
F8B5 : C4 F0    "  "    andb  #$F0
F8B7 : D7 14    "  "    stab  X0014
F8B9 : E6 01    "  "    ldab  $01,x
F8BB : 08    " "    inx
F8BC : 08    " "    inx
F8BD : DF 15    "  "    stx  X0015
F8BF : 97 13    "  "    staa  X0013
F8C1 : C4 0F    "  "    andb  #$0F
F8C3        LF8C3:
F8C3 : 96 14    "  "    ldaa  X0014
F8C5 : B7 04 00    "   "    staa  X0400
F8C8 : 96 13    "  "    ldaa  X0013
F8CA        LF8CA:
F8CA : CE 00 05    "   "    ldx  #$0005
F8CD        LF8CD:
F8CD : 09    " "    dex
F8CE : 26 FD    "& "    bne  LF8CD
F8D0 : 4A    "J"    deca
F8D1 : 26 F7    "& "    bne  LF8CA
F8D3 : 7F 04 00    "   "    clr  X0400
F8D6 : 96 13    "  "    ldaa  X0013
F8D8        LF8D8:
F8D8 : CE 00 05    "   "    ldx  #$0005
F8DB        LF8DB:
F8DB : 09    " "    dex
F8DC : 26 FD    "& "    bne  LF8DB
F8DE : 4A    "J"    deca
F8DF : 26 F7    "& "    bne  LF8D8
F8E1 : 5A    "Z"    decb
F8E2 : 26 DF    "& "    bne  LF8C3
F8E4 : 20 C7    "  "    bra  LF8AD
F8E6        LF8E6:
F8E6 : 39    "9"    rts
        ;
F8E7 : 7F 00 02    "   "    clr  X0002
F8EA : 7F 00 03    "   "    clr  X0003
F8ED : 39    "9"    rts
        ;
F8EE : 96 03    "  "    ldaa  X0003
F8F0 : 8A 80    "  "    oraa  #$80
F8F2 : 97 03    "  "    staa  X0003
F8F4 : D6 02    "  "    ldab  X0002
F8F6 : C4 7F    "  "    andb  #$7F
F8F8 : C1 24    " $"    cmpb  #$24
F8FA : 26 01    "& "    bne  LF8FD
F8FC : 5F    "_"    clrb
F8FD        LF8FD:
F8FD : 5C    "\"    incb
F8FE : D7 02    "  "    stab  X0002
F900 : 39    "9"    rts
        ;
F901        LF901:
F901 : 86 0A    "  "    ldaa  #$0A
F903 : BD F8 32    "  2"    jsr  LF832
F906 : D6 02    "  "    ldab  X0002
F908 : C1 20    "  "    cmpb  #$20
F90A : 23 02    "# "    bls  LF90E
F90C : C6 20    "  "    ldab  #$20
F90E        LF90E:
F90E : CE 01 F0    "   "    ldx  #$01F0
F911 : 86 20    "  "    ldaa  #$20
F913 : 10    " "    sba
F914 : 16    " "    tab
F915        LF915:
F915 : C1 0F    "  "    cmpb  #$0F
F917 : 23 08    "# "    bls  LF921
F919 : 86 10    "  "    ldaa  #$10
F91B : BD FB A9    "   "    jsr  LFBA9
F91E : 5A    "Z"    decb
F91F : 20 F4    "  "    bra  LF915
        ;
F921        LF921:
F921 : 86 08    "  "    ldaa  #$08
F923 : BD FB A9    "   "    jsr  LFBA9
F926 : 5A    "Z"    decb
F927 : 26 F8    "& "    bne  LF921
F929 : DF 18    "  "    stx  X0018
F92B : 96 08    "  "    ldaa  X0008
F92D : 48    "H"    asla
F92E : 9B 08    "  "    adda  X0008
F930 : 8B 0B    "  "    adda  #$0B
F932 : 97 08    "  "    staa  X0008
F934 : 97 13    "  "    staa  X0013
F936        LF936:
F936 : BD F8 47    "  G"    jsr  LF847
F939 : 20 FB    "  "    bra  LF936
        ;
F93B : 86 09    "  "    ldaa  #$09
F93D : BD F8 32    "  2"    jsr  LF832
F940 : D6 04    "  "    ldab  X0004
F942 : C1 1F    "  "    cmpb  #$1F
F944 : 26 01    "& "    bne  LF947
F946 : 5F    "_"    clrb
F947        LF947:
F947 : 5C    "\"    incb
F948 : D7 04    "  "    stab  X0004
F94A : 86 20    "  "    ldaa  #$20
F94C : 10    " "    sba
F94D : 5F    "_"    clrb
F94E        LF94E:
F94E : 81 14    "  "    cmpa  #$14
F950 : 23 05    "# "    bls  LF957
F952 : CB 0E    "  "    addb  #$0E
F954 : 4A    "J"    deca
F955 : 20 F7    "  "    bra  LF94E
        ;
F957        LF957:
F957 : CB 05    "  "    addb  #$05
F959 : 4A    "J"    deca
F95A : 26 FB    "& "    bne  LF957
F95C : D7 13    "  "    stab  X0013
F95E        LF95E:
F95E : BD F8 47    "  G"    jsr  LF847
F961 : 20 FB    "  "    bra  LF95E
        ;
F963 : 96 05    "  "    ldaa  X0005
F965 : 26 0E    "& "    bne  LF975
F967 : 7C 00 05    "|  "    inc  X0005
F96A        LF96A:
F96A : 86 10    "  "    ldaa  #$10
F96C : BD FA 21    "  !"    jsr  LFA21
F96F : 7E FA 87    "~  "    jmp  LFA87
F972 : 7E FA D0    "~  "    jmp  LFAD0
        ;
F975        LF975:
F975 : 96 17    "  "    ldaa  X0017
F977 : 81 41    " A"    cmpa  #$41
F979 : 27 EF    "' "    beq  LF96A
F97B : 7E FA D0    "~  "    jmp  LFAD0
        ;
F97E : CE 00 E0    "   "    ldx  #$00E0
F981        LF981:
F981 : 86 20    "  "    ldaa  #$20
F983 : BD FB A9    "   "    jsr  LFBA9
F986        LF986:
F986 : 09    " "    dex
F987 : 26 FD    "& "    bne  LF986
F989 : 7F 04 00    "   "    clr  X0400
F98C        LF98C:
F98C : 5A    "Z"    decb
F98D : 26 FD    "& "    bne  LF98C
F98F : 73 04 00    "s  "    com  X0400
F992 : DE 0D    "  "    ldx  X000D
F994 : 8C 10 00    "   "    cpx  #$1000
F997 : 26 E8    "& "    bne  LF981
F999 : 39    "9"    rts
        ;
F99A : 86 01    "  "    ldaa  #$01
F99C : 97 1A    "  "    staa  X001A
F99E : C6 03    "  "    ldab  #$03
F9A0 : 20 0A    "  "    bra  LF9AC
        ;
F9A2 : 86 FF    "  "    ldaa  #$FF
F9A4 : 97 1A    "  "    staa  X001A
F9A6 : 86 60    " `"    ldaa  #$60
F9A8 : C6 FF    "  "    ldab  #$FF
F9AA : 20 00    "  "    bra  LF9AC
        ;
F9AC        LF9AC:
F9AC : 97 19    "  "    staa  X0019
F9AE : 86 FF    "  "    ldaa  #$FF
F9B0 : B7 04 00    "   "    staa  X0400
F9B3 : D7 15    "  "    stab  X0015
F9B5        LF9B5:
F9B5 : D6 15    "  "    ldab  X0015
F9B7        LF9B7:
F9B7 : 96 09    "  "    ldaa  X0009
F9B9 : 44    "D"    lsra
F9BA : 44    "D"    lsra
F9BB : 44    "D"    lsra
F9BC : 98 09    "  "    eora  X0009
F9BE : 44    "D"    lsra
F9BF : 76 00 08    "v  "    ror  X0008
F9C2 : 76 00 09    "v  "    ror  X0009
F9C5 : 24 03    "$ "    bcc  LF9CA
F9C7 : 73 04 00    "s  "    com  X0400
F9CA        LF9CA:
F9CA : 96 19    "  "    ldaa  X0019
F9CC        LF9CC:
F9CC : 4A    "J"    deca
F9CD : 26 FD    "& "    bne  LF9CC
F9CF : 5A    "Z"    decb
F9D0 : 26 E5    "& "    bne  LF9B7
F9D2 : 96 19    "  "    ldaa  X0019
F9D4 : 9B 1A    "  "    adda  X001A
F9D6 : 97 19    "  "    staa  X0019
F9D8 : 26 DB    "& "    bne  LF9B5
F9DA : 39    "9"    rts
        ;
F9DB : 86 20    "  "    ldaa  #$20
F9DD : 97 15    "  "    staa  X0015
F9DF : 97 18    "  "    staa  X0018
F9E1 : 86 01    "  "    ldaa  #$01
F9E3 : CE 00 01    "   "    ldx  #$0001
F9E6 : C6 FF    "  "    ldab  #$FF
F9E8 : 20 00    "  "    bra  LF9EA
        ;
F9EA        LF9EA:
F9EA : 97 13    "  "    staa  X0013
F9EC        LF9EC:
F9EC : DF 16    "  "    stx  X0016
F9EE        LF9EE:
F9EE : D7 14    "  "    stab  X0014
F9F0 : D6 15    "  "    ldab  X0015
F9F2        LF9F2:
F9F2 : 96 09    "  "    ldaa  X0009
F9F4 : 44    "D"    lsra
F9F5 : 44    "D"    lsra
F9F6 : 44    "D"    lsra
F9F7 : 98 09    "  "    eora  X0009
F9F9 : 44    "D"    lsra
F9FA : 76 00 08    "v  "    ror  X0008
F9FD : 76 00 09    "v  "    ror  X0009
FA00 : 86 00    "  "    ldaa  #$00
FA02 : 24 02    "$ "    bcc  LFA06
FA04 : 96 14    "  "    ldaa  X0014
FA06        LFA06:
FA06 : B7 04 00    "   "    staa  X0400
FA09 : DE 16    "  "    ldx  X0016
FA0B        LFA0B:
FA0B : 09    " "    dex
FA0C : 26 FD    "& "    bne  LFA0B
FA0E : 5A    "Z"    decb
FA0F : 26 E1    "& "    bne  LF9F2
FA11 : D6 14    "  "    ldab  X0014
FA13 : D0 13    "  "    subb  X0013
FA15 : 27 09    "' "    beq  LFA20
FA17 : DE 16    "  "    ldx  X0016
FA19 : 08    " "    inx
FA1A : 96 18    "  "    ldaa  X0018
FA1C : 27 D0    "' "    beq  LF9EE
FA1E : 20 CC    "  "    bra  LF9EC
FA20        LFA20:
FA20 : 39    "9"    rts
        ;
FA21        LFA21:
FA21 : 16    " "    tab
FA22 : 58    "X"    aslb
FA23 : 1B    " "    aba
FA24 : 1B    " "    aba
FA25 : 1B    " "    aba
FA26 : CE FD 57    "  W"    ldx  #$FD57
FA29 : BD FB A9    "   "    jsr  LFBA9
FA2C : A6 00    "  "    ldaa  $00,x
FA2E : 16    " "    tab
FA2F : 84 0F    "  "    anda  #$0F
FA31 : 97 14    "  "    staa  X0014
FA33 : 54    "T"    lsrb
FA34 : 54    "T"    lsrb
FA35 : 54    "T"    lsrb
FA36 : 54    "T"    lsrb
FA37 : D7 13    "  "    stab  X0013
FA39 : A6 01    "  "    ldaa  $01,x
FA3B : 16    " "    tab
FA3C : 54    "T"    lsrb
FA3D : 54    "T"    lsrb
FA3E : 54    "T"    lsrb
FA3F : 54    "T"    lsrb
FA40 : D7 15    "  "    stab  X0015
FA42 : 84 0F    "  "    anda  #$0F
FA44 : 97 11    "  "    staa  X0011
FA46 : DF 0B    "  "    stx  X000B
FA48 : CE FC 7C    "  |"    ldx  #$FC7C
FA4B        LFA4B:
FA4B : 7A 00 11    "z  "    dec  X0011
FA4E : 2B 08    "+ "    bmi  LFA58
FA50 : A6 00    "  "    ldaa  $00,x
FA52 : 4C    "L"    inca
FA53 : BD FB A9    "   "    jsr  LFBA9
FA56 : 20 F3    "  "    bra  LFA4B
        ;
FA58        LFA58:
FA58 : DF 18    "  "    stx  X0018
FA5A : BD FB 17    "   "    jsr  LFB17
FA5D : DE 0B    "  "    ldx  X000B
FA5F : A6 02    "  "    ldaa  $02,x
FA61 : 97 1A    "  "    staa  X001A
FA63 : BD FB 29    "  )"    jsr  LFB29
FA66 : DE 0B    "  "    ldx  X000B
FA68 : A6 03    "  "    ldaa  $03,x
FA6A : 97 16    "  "    staa  X0016
FA6C : A6 04    "  "    ldaa  $04,x
FA6E : 97 17    "  "    staa  X0017
FA70 : A6 05    "  "    ldaa  $05,x
FA72 : 16    " "    tab
FA73 : A6 06    "  "    ldaa  $06,x
FA75 : CE FD CE    "   "    ldx  #$FDCE
FA78 : BD FB A9    "   "    jsr  LFBA9
FA7B : 17    " "    tba
FA7C : DF 1B    "  "    stx  X001B
FA7E : 7F 00 23    "  #"    clr  X0023
FA81 : BD FB A9    "   "    jsr  LFBA9
FA84 : DF 1D    "  "    stx  X001D
FA86 : 39    "9"    rts
        ;
FA87        LFA87:
FA87 : 96 13    "  "    ldaa  X0013
FA89 : 97 22    " ""    staa  X0022
FA8B        LFA8B:
FA8B : DE 1B    "  "    ldx  X001B
FA8D : DF 0D    "  "    stx  X000D
FA8F        LFA8F:
FA8F : DE 0D    "  "    ldx  X000D
FA91 : A6 00    "  "    ldaa  $00,x
FA93 : 9B 23    " #"    adda  X0023
FA95 : 97 21    " !"    staa  X0021
FA97 : 9C 1D    "  "    cpx  X001D
FA99 : 27 26    "'&"    beq  LFAC1
FA9B : D6 14    "  "    ldab  X0014
FA9D : 08    " "    inx
FA9E : DF 0D    "  "    stx  X000D
FAA0        LFAA0:
FAA0 : CE 00 24    "  $"    ldx  #$0024
FAA3        LFAA3:
FAA3 : 96 21    " !"    ldaa  X0021
FAA5        LFAA5:
FAA5 : 4A    "J"    deca
FAA6 : 26 FD    "& "    bne  LFAA5
FAA8 : A6 00    "  "    ldaa  $00,x
FAAA : B7 04 00    "   "    staa  X0400
FAAD : 08    " "    inx
FAAE : 9C 1F    "  "    cpx  X001F
FAB0 : 26 F1    "& "    bne  LFAA3
FAB2 : 5A    "Z"    decb
FAB3 : 27 DA    "' "    beq  LFA8F
FAB5 : 08    " "    inx
FAB6 : 09    " "    dex
FAB7 : 08    " "    inx
FAB8 : 09    " "    dex
FAB9 : 08    " "    inx
FABA : 09    " "    dex
FABB : 08    " "    inx
FABC : 09    " "    dex
FABD : 01    " "    nop
FABE : 01    " "    nop
FABF : 20 DF    "  "    bra  LFAA0
        ;
FAC1        LFAC1:
FAC1 : 96 15    "  "    ldaa  X0015
FAC3 : 8D 64    " d"    bsr  LFB29
FAC5 : 7A 00 22    "z ""    dec  X0022
FAC8 : 26 C1    "& "    bne  LFA8B
FACA : 96 05    "  "    ldaa  X0005
FACC : 9A 06    "  "    oraa  X0006
FACE : 26 46    "&F"    bne  LFB16
FAD0        LFAD0:
FAD0 : 96 16    "  "    ldaa  X0016
FAD2 : 27 42    "'B"    beq  LFB16
FAD4 : 7A 00 17    "z  "    dec  X0017
FAD7 : 27 3D    "'="    beq  LFB16
FAD9 : 9B 23    " #"    adda  X0023
FADB : 97 23    " #"    staa  X0023
FADD : DE 1B    "  "    ldx  X001B
FADF : 5F    "_"    clrb
FAE0        LFAE0:
FAE0 : 96 23    " #"    ldaa  X0023
FAE2 : 7D 00 16    "}  "    tst  X0016
FAE5 : 2B 06    "+ "    bmi  LFAED
FAE7 : AB 00    "  "    adda  $00,x
FAE9 : 25 08    "% "    bcs  LFAF3
FAEB : 20 0B    "  "    bra  LFAF8
        ;
FAED        LFAED:
FAED : AB 00    "  "    adda  $00,x
FAEF : 27 02    "' "    beq  LFAF3
FAF1 : 25 05    "% "    bcs  LFAF8
FAF3        LFAF3:
FAF3 : 5D    "]"    tstb
FAF4 : 27 08    "' "    beq  LFAFE
FAF6 : 20 0F    "  "    bra  LFB07
        ;
FAF8        LFAF8:
FAF8 : 5D    "]"    tstb
FAF9 : 26 03    "& "    bne  LFAFE
FAFB : DF 1B    "  "    stx  X001B
FAFD : 5C    "\"    incb
FAFE        LFAFE:
FAFE : 08    " "    inx
FAFF : 9C 1D    "  "    cpx  X001D
FB01 : 26 DD    "& "    bne  LFAE0
FB03 : 5D    "]"    tstb
FB04 : 26 01    "& "    bne  LFB07
FB06 : 39    "9"    rts
        ;
FB07        LFB07:
FB07 : DF 1D    "  "    stx  X001D
FB09 : 96 15    "  "    ldaa  X0015
FB0B : 27 06    "' "    beq  LFB13
FB0D : 8D 08    "  "    bsr  LFB17
FB0F : 96 1A    "  "    ldaa  X001A
FB11 : 8D 16    "  "    bsr  LFB29
FB13        LFB13:
FB13 : 7E FA 87    "~  "    jmp  LFA87
FB16        LFB16:
FB16 : 39    "9"    rts
        ;
FB17        LFB17:
FB17 : CE 00 24    "  $"    ldx  #$0024
FB1A : DF 0F    "  "    stx  X000F
FB1C : DE 18    "  "    ldx  X0018
FB1E : E6 00    "  "    ldab  $00,x
FB20 : 08    " "    inx
FB21 : BD F8 94    "   "    jsr  LF894
FB24 : DE 0F    "  "    ldx  X000F
FB26 : DF 1F    "  "    stx  X001F
FB28 : 39    "9"    rts
        ;
FB29        LFB29:
FB29 : 4D    "M"    tsta
FB2A : 27 2B    "'+"    beq  LFB57
FB2C : DE 18    "  "    ldx  X0018
FB2E : DF 0D    "  "    stx  X000D
FB30 : CE 00 24    "  $"    ldx  #$0024
FB33 : 97 12    "  "    staa  X0012
FB35        LFB35:
FB35 : DF 0F    "  "    stx  X000F
FB37 : DE 0D    "  "    ldx  X000D
FB39 : D6 12    "  "    ldab  X0012
FB3B : D7 11    "  "    stab  X0011
FB3D : E6 01    "  "    ldab  $01,x
FB3F : 54    "T"    lsrb
FB40 : 54    "T"    lsrb
FB41 : 54    "T"    lsrb
FB42 : 54    "T"    lsrb
FB43 : 08    " "    inx
FB44 : DF 0D    "  "    stx  X000D
FB46 : DE 0F    "  "    ldx  X000F
FB48 : A6 00    "  "    ldaa  $00,x
FB4A        LFB4A:
FB4A : 10    " "    sba
FB4B : 7A 00 11    "z  "    dec  X0011
FB4E : 26 FA    "& "    bne  LFB4A
FB50 : A7 00    "  "    staa  $00,x
FB52 : 08    " "    inx
FB53 : 9C 1F    "  "    cpx  X001F
FB55 : 26 DE    "& "    bne  LFB35
FB57        LFB57:
FB57 : 39    "9"    rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FB58 : 8E 00 7F    "   "    lds  #$007F
FB5B : B6 04 02    "   "    ldaa  X0402
FB5E : 7C 00 07    "|  "    inc  X0007
FB61 : 43    "C"    coma
FB62 : 84 1F    "  "    anda  #$1F
FB64 : 81 02    "  "    cmpa  #$02
FB66 : 27 03    "' "    beq  LFB6B
FB68 : 7F 00 05    "   "    clr  X0005
FB6B        LFB6B:
FB6B : 81 1F    "  "    cmpa  #$1F
FB6D : 27 03    "' "    beq  LFB72
FB6F : 7F 00 06    "   "    clr  X0006
FB72        LFB72:
FB72 : 0E    " "    cli
FB73 : 4A    "J"    deca
FB74 : 2B 26    "+&"    bmi  LFB9C
FB76 : 81 05    "  "    cmpa  #$05
FB78 : 22 0C    "" "    bhi  LFB86
FB7A : 48    "H"    asla
FB7B : CE FB EF    "   "    ldx  #$FBEF
FB7E : 8D 29    " )"    bsr  LFBA9
FB80 : EE 00    "  "    ldx  $00,x
FB82 : AD 00    "  "    jsr  $00,x            ;INFO: index jump
FB84 : 20 16    "  "    bra  LFB9C
        ;
FB86        LFB86:
FB86 : 81 0E    "  "    cmpa  #$0E
FB88 : 22 0A    "" "    bhi  LFB94
FB8A : 80 06    "  "    suba  #$06
FB8C : BD F8 32    "  2"    jsr  LF832
FB8F : BD F8 47    "  G"    jsr  LF847
FB92 : 20 08    "  "    bra  LFB9C
        ;
FB94        LFB94:
FB94 : 80 0F    "  "    suba  #$0F
FB96 : BD FA 21    "  !"    jsr  LFA21
FB99 : BD FA 87    "   "    jsr  LFA87
FB9C        LFB9C:
FB9C : 96 02    "  "    ldaa  X0002
FB9E : 9A 03    "  "    oraa  X0003
FBA0        LFBA0:
FBA0 : 27 FE    "' "    beq  LFBA0
FBA2 : 96 05    "  "    ldaa  X0005
FBA4        LFBA4:
FBA4 : 26 FE    "& "    bne  LFBA4
FBA6 : 7E F9 01    "~  "    jmp  LF901
        ;
FBA9        LFBA9:
FBA9 : DF 0D    "  "    stx  X000D
FBAB : 9B 0E    "  "    adda  X000E
FBAD : 97 0E    "  "    staa  X000E
FBAF : 96 0D    "  "    ldaa  X000D
FBB1 : 89 00    "  "    adca  #$00
FBB3 : 97 0D    "  "    staa  X000D
FBB5 : DE 0D    "  "    ldx  X000D
FBB7 : 39    "9"    rts
        ;
FBB8 : 0F    " "    sei
FBB9 : 8E 00 7F    "   "    lds  #$007F
FBBC : CE FF FF    "   "    ldx  #$FFFF
FBBF : 5F    "_"    clrb
FBC0        LFBC0:
FBC0 : E9 00    "  "    adcb  $00,x
FBC2 : 09    " "    dex
FBC3 : 8C F8 00    "   "    cpx  #$F800
FBC6 : 26 F8    "& "    bne  LFBC0
FBC8 : E1 00    "  "    cmpb  $00,x
FBCA : 27 01    "' "    beq  LFBCD
FBCC : 3E    ">"    wai
FBCD        LFBCD:
FBCD : BD F8 A8    "   "    jsr  LF8A8
FBD0 : BD F8 A8    "   "    jsr  LF8A8
FBD3 : BD F8 A8    "   "    jsr  LF8A8
FBD6 : 86 01    "  "    ldaa  #$01
FBD8 : BD FA 21    "  !"    jsr  LFA21
FBDB : BD FA 87    "   "    jsr  LFA87
FBDE : 86 03    "  "    ldaa  #$03
FBE0 : BD FA 21    "  !"    jsr  LFA21
FBE3 : BD FA 87    "   "    jsr  LFA87
FBE6 : 4F    "O"    clra
FBE7 : BD F8 32    "  2"    jsr  LF832
FBEA : BD F8 47    "  G"    jsr  LF847
FBED : 20 DE    "  "    bra  LFBCD
        ;
FBEF : F9 7E F9    " ~ "    adcb  X7EF9
FBF2 : 63 F9    "c "    com  $F9,x
FBF4 : DB F8    "  "    addb  X00F8
FBF6 : EE F9    "  "    ldx  $F9,x
FBF8 : 3B    ";"    rti
        ;
FBF9 : F8 E7 40    "  @"    eorb  XE740
FBFC : 01    " "    nop
        ;
FBFD        XFBFD:
FBFD : 00    " "    db  $00
        ;
FBFE : 10    " "    sba
FBFF : E1 00    "  "    cmpb  $00,x
FC01 : 80 FF    "  "    suba  #$FF
FC03 : FF 28 01    " ( "    stx  X2801
        ;
FC06 : 00    " "    db  $00
        ;
FC07 : 08    " "    inx
FC08 : 81 02    "  "    cmpa  #$02
        ;
FC0A : 00    " "    db  $00
        ;
FC0B : FF FF 40    "  @"    stx  XFF40
FC0E : 0F    " "    sei
        ;
FC0F : 00    " "    db  $00
        ;
FC10 : 99 09    "  "    adca  X0009
        ;
FC12 : 02 00    "  "    db  $02, $00
        ;
FC14 : F8 FF F0    "   "    eorb  XFFF0
FC17 : 0F    " "    sei
        ;
FC18 : 02 21    " !"    db  $02, $21
        ;
FC1A : 26 02    "& "    bne  LFC1E
FC1C : 80 00    "  "    suba  #$00
FC1E        LFC1E:
FC1E : FF 05 01    "   "    stx  X0501
FC21 : 01    " "    nop
FC22 : 01    " "    nop
FC23 : 20 01    "  "    bra  LFC26
        ;
FC25 : 08    " "    inx
FC26        LFC26:
FC26 : FF FF FF    "   "    stx  XFFFF
FC29 : 01    " "    nop
FC2A : 01    " "    nop
FC2B : 0F    " "    sei
        ;
FC2C : 02    " "    db  $02
        ;
FC2D : 01    " "    nop
FC2E : 80 00    "  "    suba  #$00
FC30 : FF 01 20    "   "    stx  X0120
FC33 : 01    " "    nop
FC34 : 23 00    "# "    bls  LFC36
        ;
FC36        LFC36:
FC36 : 03    " "    db  $03
        ;
FC37 : 20 00    "  "    bra  LFC39
        ;
FC39        LFC39:
FC39 : FF 0E E7    "   "    stx  X0EE7
FC3C : 35    "5"    txs
FC3D : 33    "3"    pulb
FC3E : 79 03 80    "y  "    rol  X0380
FC41 : F2 FF 36    "  6"    sbcb  XFF36
        ;
FC44 : 21    "!"    db  $21
        ;
FC45 : 09    " "    dex
FC46 : 06    " "    tap
FC47 : EF 03    "  "    stx  $03,x
FC49 : C0 00    "  "    subb  #$00
FC4B : FF FF 01    "   "    stx  XFF01
        ;
FC4E : 00 18 41 04  "  A "    db  $00, $18, $41, $04
        ;
FC52 : 80 00    "  "    suba  #$00
FC54 : FF 20 11    "   "    stx  X2011
FC57 : 07    " "    tpa
FC58 : 07    " "    tpa
        ;
FC59 : 04 00    "  "    db  $04, $00
        ;
FC5B : D0 00    "  "    subb  X0000
FC5D : BB 01 FC    "   "    adda  X01FC
        ;
FC60 : 02 FC 03    "   "    db  $02, $FC, $03
        ;
FC63 : F8 04 F8    "   "    eorb  X04F8
FC66 : 06    " "    tap
FC67 : F8 08 F4    "   "    eorb  X08F4
FC6A : 0C    " "    clc
FC6B : F4 10 F4    "   "    andb  X10F4
FC6E : 20 F2    "  "    bra  LFC62
        ;
FC70 : 40    "@"    nega
FC71 : F1 60 F1    " ` "    cmpb  X60F1
FC74 : 80 F1    "  "    suba  #$F1
FC76 : A0 F1    "  "    suba  $F1,x
FC78 : C0 F1    "  "    subb  #$F1
        ;
FC7A : 00 00    "  "    db  $00, $00
        ;
FC7C : 08    " "    inx
FC7D : 7F D9 FF    "   "    clr  XD9FF
FC80 : D9 7F    "  "    adcb  X007F
FC82 : 24 00    "$ "    bcc  LFC84
FC84        LFC84:
FC84 : 24 08    "$ "    bcc  LFC8E
FC86 : FF FF FF    "   "    stx  XFFFF
FC89 : FF 00 00    "   "    stx  X0000
        ;
FC8C : 00 00    "  "    db  $00, $00
        ;
FC8E        LFC8E:
FC8E : 08    " "    inx
        ;
FC8F : 00    " "    db  $00
        ;
FC90 : 40    "@"    nega
FC91 : 80 00    "  "    suba  #$00
FC93 : FF 00 80    "   "    stx  X0080
FC96 : 40    "@"    nega
FC97 : 10    " "    sba
FC98 : 7F B0 D9    "   "    clr  XB0D9
FC9B : F5 FF F5    "   "    bitb  XFFF5
FC9E : D9 B0    "  "    adcb  X00B0
FCA0 : 7F 4E 24    " N$"    clr  X4E24
FCA3 : 09    " "    dex
        ;
FCA4 : 00    " "    db  $00
        ;
FCA5 : 09    " "    dex
FCA6 : 24 4E    "$N"    bcc  LFCF6
FCA8 : 10    " "    sba
FCA9 : 7F C5 EC    "   "    clr  XC5EC
FCAC : E7 BF    "  "    stab  $BF,x
FCAE : 8D 6D    " m"    bsr  LFD1D
FCB0 : 6A 7F    "j "    dec  $7F,x
FCB2 : 94 92    "  "    anda  X0092
        ;
FCB4 : 71    "q"    db  $71
        ;
FCB5 : 40    "@"    nega
FCB6 : 17    " "    tba
        ;
FCB7 : 12    " "    db  $12
        ;
FCB8 : 39    "9"    rts
        ;
FCB9 : 10    " "    sba
FCBA : 76 FF B8    "v  "    ror  XFFB8
FCBD : D0 9D    "  "    subb  X009D
FCBF : E6 6A    " j"    ldab  $6A,x
FCC1 : 82 76    " v"    sbca  #$76
FCC3 : EA 81    "  "    orab  $81,x
FCC5 : 86 4E    " N"    ldaa  #$4E
FCC7 : 9C 32    " 2"    cpx  X0032
FCC9 : 63 10    "c "    com  $10,x
FCCB : FF FF FF    "   "    stx  XFFFF
FCCE : FF FF FF    "   "    stx  XFFFF
FCD1 : FF FF 00    "   "    stx  XFF00
        ;
FCD4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FCD8 : 00 00 00    "   "    db  $00, $00, $00
        ;
FCDB : 10    " "    sba
FCDC : FF FF FF    "   "    stx  XFFFF
FCDF : FF 00 00    "   "    stx  X0000
        ;
FCE2 : 00 00    "  "    db  $00, $00
        ;
FCE4 : FF FF FF    "   "    stx  XFFFF
FCE7 : FF 00 00    "   "    stx  X0000
        ;
FCEA : 00 00    "  "    db  $00, $00
        ;
FCEC : 10    " "    sba
        ;
FCED : 00    " "    db  $00
        ;
FCEE : F4 00 E8    "   "    andb  X00E8
        ;
FCF1 : 00 DC 00    "   "    db  $00, $DC, $00
        ;
FCF4 : E2 00    "  "    sbcb  $00,x
        ;
FCF6        LFCF6:
FCF6 : DC 00    "  "    db  $DC, $00
        ;
FCF8 : E8 00    "  "    eorb  $00,x
FCFA : F4 00 00    "   "    andb  X0000
FCFD : 48    "H"    asla
FCFE : 8A 95    "  "    oraa  #$95
FD00 : A0 AB    "  "    suba  $AB,x
FD02 : B5 BF C8    "   "    bita  XBFC8
FD05 : D1 DA    "  "    cmpb  X00DA
FD07 : E1 E8    "  "    cmpb  $E8,x
FD09 : EE F3    "  "    ldx  $F3,x
FD0B : F7 FB FD    "   "    stab  XFBFD
FD0E : FE FF FE    "   "    ldx  XFFFE
        ;
FD11 : FD    " "    db  $FD
        ;
FD12 : FB F7 F3    "   "    addb  XF7F3
FD15 : EE E8    "  "    ldx  $E8,x
FD17 : E1 DA    "  "    cmpb  $DA,x
FD19 : D1 C8    "  "    cmpb  X00C8
FD1B : BF B5 AB    "   "    sts  XB5AB
FD1E : A0 95    "  "    suba  $95,x
FD20 : 8A 7F    "  "    oraa  #$7F
        ;
FD22 : 75    "u"    db  $75
        ;
FD23 : 6A 5F    "j_"    dec  $5F,x
FD25 : 54    "T"    lsrb
FD26 : 4A    "J"    deca
FD27 : 40    "@"    nega
FD28 : 37    "7"    pshb
FD29 : 2E 25    ".%"    bgt  LFD50
        ;
FD2B : 1E    " "    db  $1E
        ;
FD2C : 17    " "    tba
FD2D : 11    " "    cba
FD2E : 0C    " "    clc
FD2F : 08    " "    inx
        ;
FD30 : 04 02    "  "    db  $04, $02
        ;
FD32 : 01    " "    nop
        ;
FD33 : 00    " "    db  $00
        ;
FD34 : 01    " "    nop
        ;
FD35 : 02 04    "  "    db  $02, $04
        ;
FD37 : 08    " "    inx
FD38 : 0C    " "    clc
FD39 : 11    " "    cba
FD3A : 17    " "    tba
        ;
FD3B : 1E    " "    db  $1E
        ;
FD3C : 25 2E    "%."    bcs  LFD6C
FD3E : 37    "7"    pshb
FD3F : 40    "@"    nega
FD40 : 4A    "J"    deca
FD41 : 54    "T"    lsrb
FD42 : 5F    "_"    clrb
FD43 : 6A 75    "ju"    dec  $75,x
FD45 : 7F 10 59    "  Y"    clr  X1059
        ;
FD48 : 7B    "{"    db  $7B
        ;
FD49 : 98 AC    "  "    eora  X00AC
        ;
FD4B : B3    " "    db  $B3
        ;
FD4C : AC 98    "  "    cpx  $98,x
        ;
FD4E : 7B    "{"    db  $7B
        ;
FD4F : 59    "Y"    rolb
FD50        LFD50:
FD50 : 37    "7"    pshb
FD51 : 19    " "    daa
FD52 : 06    " "    tap
        ;
FD53 : 00    " "    db  $00
        ;
FD54 : 06    " "    tap
FD55 : 19    " "    daa
FD56 : 37    "7"    pshb
        ;
FD57 : 14    " "    db  $14
        ;
FD58        LFD58:
FD58 : 10    " "    sba
        ;
FD59 : 00    " "    db  $00
        ;
FD5A : 01    " "    nop
        ;
FD5B : 00    " "    db  $00
        ;
FD5C : 01    " "    nop
FD5D : 6A 81    "j "    dec  $81,x
FD5F : 27 00    "' "    beq  LFD61
        ;
FD61        LFD61:
FD61 : 00 00    "  "    db  $00, $00
        ;
FD63 : 16    " "    tab
FD64 : 54    "T"    lsrb
FD65 : 11    " "    cba
FD66 : 09    " "    dex
FD67 : 11    " "    cba
FD68 : 01    " "    nop
FD69 : 0F    " "    sei
FD6A : 01    " "    nop
FD6B : 6A 61    "ja"    dec  $61,x
        ;
FD6D : 38 00 00 00  "8   "    db  $38, $00, $00, $00
        ;
FD71 : 20 00    "  "    bra  LFD73
        ;
FD73        LFD73:
FD73 : 15 00    "  "    db  $15, $00
        ;
FD75 : 11    " "    cba
        ;
FD76 : 00 00 13    "   "    db  $00, $00, $13
        ;
FD79 : 54    "T"    lsrb
FD7A : F2 17 03    "   "    sbcb  X1703
        ;
FD7D : 00 00    "  "    db  $00, $00
        ;
FD7F : 0E    " "    cli
        ;
FD80 : 51    "Q"    db  $51
        ;
FD81 : 31    "1"    ins
        ;
FD82 : 18 00    "  "    db  $18, $00
        ;
FD84 : 01    " "    nop
        ;
FD85 : 00 03    "  "    db  $00, $03
        ;
FD87 : 8D 14    "  "    bsr  LFD9D
FD89 : 11    " "    cba
        ;
FD8A : 00 00 00    "   "    db  $00, $00, $00
        ;
FD8D : 0E    " "    cli
FD8E : 0D    " "    sec
FD8F : F4 12 00    "   "    andb  X1200
        ;
FD92 : 00 00    "  "    db  $00, $00
        ;
FD94 : 0E    " "    cli
FD95 : 0D    " "    sec
        ;
FD96 : 21    "!"    db  $21
        ;
FD97 : 30    "0"    tsx
        ;
FD98 : 00    " "    db  $00
        ;
FD99        LFD99:
FD99 : 01    " "    nop
        ;
FD9A : 00    " "    db  $00
        ;
FD9B : 0D    " "    sec
FD9C : 1B    " "    aba
        ;
FD9D        LFD9D:
FD9D : 13    " "    db  $13
        ;
FD9E : 10    " "    sba
        ;
FD9F : 00    " "    db  $00
        ;
FDA0 : FF 00 09    "   "    stx  X0009
FDA3 : 28 F4    "( "    bvc  LFD99
        ;
FDA5 : 15 00 00 00  "    "    db  $15, $00, $00, $00
FDA9 : 12    " "    db  $12
        ;
FDAA : B8 82 23    "  #"    eora  X8223
        ;
FDAD : 00 00 00 18  "    "    db  $00, $00, $00, $18
        ;
FDB1 : CB F2    "  "    addb  #$F2
        ;
FDB3 : 18 00 00 00  "    "    db  $18, $00, $00, $00
        ;
FDB7 : 16    " "    tab
FDB8 : E4 F1    "  "    andb  $F1,x
        ;
FDBA : 18 00 00 00  "    "    db  $18, $00, $00, $00
        ;
FDBE : 0E    " "    cli
FDBF : 28 41    "(A"    bvc  LFE02
        ;
FDC1 : 03    " "    db  $03
        ;
FDC2 : D0 00    "  "    subb  X0000
        ;
FDC4 : 00    " "    db  $00
        ;
FDC5 : 27 91    "' "    beq  LFD58
        ;
FDC7 : 18 03 00    "   "    db  $18, $03, $00
        ;
FDCA : FF 00 16    "   "    stx  X0016
FDCD : 54    "T"    lsrb
FDCE : A0 98    "  "    suba  $98,x
FDD0 : 90 88    "  "    suba  X0088
FDD2 : 80 78    " x"    suba  #$78
FDD4 : 70 68 60    "ph`"    neg  X6860
FDD7 : 58    "X"    aslb
FDD8 : 50    "P"    negb
FDD9 : 44    "D"    lsra
FDDA : 40    "@"    nega
FDDB : 01    " "    nop
FDDC : 01    " "    nop
        ;
FDDD : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FDE1 : 08    " "    inx
FDE2 : 08    " "    inx
FDE3 : 10    " "    sba
FDE4 : 10    " "    sba
FDE5 : 30    "0"    tsx
FDE6 : 60 C0    "` "    neg  $C0,x
FDE8 : E0 01    "  "    subb  $01,x
FDEA : 01    " "    nop
        ;
FDEB : 02 02 03 04  "    "    db  $02, $02, $03, $04
FDEF : 05    " "    db  $05
        ;
FDF0 : 06    " "    tap
FDF1 : 07    " "    tpa
FDF2 : 08    " "    inx
FDF3 : 09    " "    dex
FDF4 : 0A    " "    clv
FDF5 : 0C    " "    clc
FDF6 : 08    " "    inx
FDF7 : 80 10    "  "    suba  #$10
FDF9 : 78 18 70    "x p"    asl  X1870
FDFC : 20 60    " `"    bra  LFE5E
        ;
FDFE : 28 58    "(X"    bvc  LFE58
FE00 : 30    "0"    tsx
FE01 : 50    "P"    negb
FE02        LFE02:
FE02 : 40    "@"    nega
FE03 : 48    "H"    asla
        ;
FE04 : 04 05    "  "    db  $04, $05
        ;
FE06 : 06    " "    tap
FE07 : 07    " "    tpa
FE08 : 08    " "    inx
FE09 : 0A    " "    clv
FE0A : 0C    " "    clc
FE0B : 0E    " "    cli
FE0C : 10    " "    sba
FE0D : 11    " "    cba
        ;
FE0E : 12 13 14 15  "    "    db  $12, $13, $14, $15
        ;
FE12 : 16    " "    tab
FE13 : 17    " "    tba
        ;
FE14 : 18    " "    db  $18
        ;
FE15 : 19    " "    daa
        ;
FE16 : 1A    " "    db  $1A
        ;
FE17 : 1B    " "    aba
        ;
FE18 : 1C    " "    db  $1C
        ;
FE19 : 80 7C    " |"    suba  #$7C
FE1B : 78 74 70    "xtp"    asl  X7470
FE1E : 74 78 7C    "tx|"    lsr  X787C
FE21 : 80 01    "  "    suba  #$01
FE23 : 01    " "    nop
        ;
FE24 : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FE28 : 08    " "    inx
FE29 : 08    " "    inx
FE2A : 10    " "    sba
FE2B : 20 28    " ("    bra  LFE55
        ;
FE2D : 30    "0"    tsx
        ;
FE2E : 38    "8"    db  $38
        ;
FE2F : 40    "@"    nega
FE30 : 48    "H"    asla
FE31 : 50    "P"    negb
FE32 : 60 70    "`p"    neg  $70,x
FE34 : 80 A0    "  "    suba  #$A0
FE36 : B0 C0 08    "   "    suba  XC008
FE39 : 40    "@"    nega
FE3A : 08    " "    inx
FE3B : 40    "@"    nega
FE3C : 08    " "    inx
FE3D : 40    "@"    nega
FE3E : 08    " "    inx
FE3F : 40    "@"    nega
FE40 : 08    " "    inx
FE41 : 40    "@"    nega
FE42 : 08    " "    inx
FE43 : 40    "@"    nega
FE44 : 08    " "    inx
FE45 : 40    "@"    nega
FE46 : 08    " "    inx
FE47 : 40    "@"    nega
FE48 : 08    " "    inx
FE49 : 40    "@"    nega
FE4A : 08    " "    inx
FE4B : 40    "@"    nega
FE4C : 01    " "    nop
        ;
FE4D : 02 04    "  "    db  $02, $04
        ;
FE4F : 08    " "    inx
FE50 : 09    " "    dex
FE51 : 0A    " "    clv
FE52 : 0B    " "    sev
FE53 : 0C    " "    clc
FE54 : 0E    " "    cli
FE55        LFE55:
FE55 : 0F    " "    sei
FE56 : 10    " "    sba
        ;
FE57 : 12 14    "  "    db  $12, $14
        ;
FE59 : 16    " "    tab
FE5A : 40    "@"    nega
FE5B : 10    " "    sba
FE5C : 08    " "    inx
FE5D : 01    " "    nop
FE5E        LFE5E:
FE5E : 92 01    "  "    sbca  X0001
FE60 : 01    " "    nop
FE61 : 01    " "    nop
FE62 : 01    " "    nop
        ;
FE63 : 02 02 03 03  "    "    db  $02, $02, $03, $03
FE67 : 04 04 05    "   "    db  $04, $04, $05
        ;
FE6A : 06    " "    tap
FE6B : 08    " "    inx
FE6C : 0A    " "    clv
FE6D : 0C    " "    clc
FE6E : 10    " "    sba
        ;
FE6F : 14 18    "  "    db  $14, $18
        ;
FE71 : 20 30    " 0"    bra  LFEA3
        ;
FE73 : 40    "@"    nega
FE74 : 50    "P"    negb
FE75 : 40    "@"    nega
FE76 : 30    "0"    tsx
FE77 : 20 10    "  "    bra  LFE89
        ;
FE79 : 0C    " "    clc
FE7A : 0A    " "    clv
FE7B : 08    " "    inx
FE7C : 07    " "    tpa
FE7D : 06    " "    tap
        ;
FE7E : 05 04 03 02  "    "    db  $05, $04, $03, $02
FE82 : 02    " "    db  $02
        ;
FE83 : 01    " "    nop
FE84 : 01    " "    nop
FE85 : 01    " "    nop
FE86 : 01    " "    nop
FE87 : 08    " "    inx
FE88 : 10    " "    sba
FE89        LFE89:
FE89 : 01    " "    nop
FE8A : 08    " "    inx
FE8B : 10    " "    sba
FE8C : 01    " "    nop
FE8D : 08    " "    inx
FE8E : 10    " "    sba
FE8F : 01    " "    nop
FE90 : 08    " "    inx
FE91 : 10    " "    sba
FE92 : 01    " "    nop
FE93 : 08    " "    inx
FE94 : 10    " "    sba
FE95 : 01    " "    nop
FE96 : 08    " "    inx
FE97 : 10    " "    sba
        ;
FE98 : 00    " "    db  $00
        ;
FE99 : 10    " "    sba
FE9A : 20 40    " @"    bra  LFEDC
        ;
FE9C : 10    " "    sba
FE9D : 20 40    " @"    bra  LFEDF
        ;
FE9F : 10    " "    sba
FEA0 : 20 40    " @"    bra  LFEE2
        ;
FEA2 : 10    " "    sba
FEA3        LFEA3:
FEA3 : 20 40    " @"    bra  LFEE5
        ;
FEA5 : 10    " "    sba
FEA6 : 20 40    " @"    bra  LFEE8
        ;
FEA8 : 10    " "    sba
FEA9 : 20 40    " @"    bra  LFEEB
        ;
FEAB : 10    " "    sba
FEAC : 20 40    " @"    bra  LFEEE
        ;
FEAE : 10    " "    sba
FEAF : 20 40    " @"    bra  LFEF1
        ;
FEB1 : 00    " "    db  $00
        ;
FEB2 : 01    " "    nop
FEB3 : 40    "@"    nega
        ;
FEB4 : 02 42 03    " B "    db  $02, $42, $03
        ;
FEB7 : 43    "C"    coma
        ;
FEB8 : 04    " "    db  $04
        ;
FEB9 : 44    "D"    lsra
        ;
FEBA : 05 45    " E"    db  $05, $45
        ;
FEBC : 06    " "    tap
FEBD : 46    "F"    rora
FEBE : 07    " "    tpa
FEBF : 47    "G"    asra
FEC0 : 08    " "    inx
FEC1 : 48    "H"    asla
FEC2 : 09    " "    dex
FEC3 : 49    "I"    rola
FEC4 : 0A    " "    clv
FEC5 : 4A    "J"    deca
FEC6 : 0B    " "    sev
        ;
FEC7 : 4B 00 00 00  "K   "    db  $4B, $00, $00, $00
FECB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FECF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FED3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FED7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEDB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEDF        LFEDF:
FEDF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEE3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEE7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEEB        LFEEB:
FEEB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEEF : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEF3 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEF7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEFB : 00 00 00 00  "    "    db  $00, $00, $00, $00
FEFF : 00    " "    db  $00
FF00        XFF00:
FF00 : 00    " "    db  $00
FF01        XFF01:
FF01 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF05 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF09 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF0D : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF11 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF15 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF19 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF1D : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF21 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF25 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF29 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF2D : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF31 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF35 : 00    " "    db  $00
FF36        XFF36:
FF36 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF3A : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF3E : 00 00    "  "    db  $00, $00
FF40        XFF40:
FF40 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF44 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF48 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF4C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF50 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF54 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF58 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF5C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF60 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF64 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF68 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF6C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF70 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF74 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF78 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF7C : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF80 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF84 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF88 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FF8C : 00 00 00 00  "    "    db  $00, $00, $00, $00
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
FFF0        XFFF0:
FFF0 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFF4 : 00    " "    db  $00
FFF5        XFFF5:
FFF5 : 00 00 00    "   "    db  $00, $00, $00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FB 58                          ;IRQ
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FB B8                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------






