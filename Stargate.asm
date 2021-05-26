        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Stargate.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  A716
        ;  CRC-32:    2FCF6C4D
        ;
        ;  Date:    Sun May 16 10:59:21 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;basically identical to Sound ROM 15 except no Tilt, and Organ tune is different
        ;
        ;updated 23 May 2021
        ;
        ;
org  $F800
        ;
F800 : DF 
;*************************************;
;RESET power on
;*************************************;
;SETUP
F801 : 0F         sei                 ;set interrupt mask   
F802 : 8E 00 7F    "   "    lds  #$007F
F805 : CE 04 00    "   "    ldx  #$0400
F808 : 6F 01    "o "    clr  $01,x
F80A : 6F 03    "o "    clr  $03,x
F80C : 86 FF    "  "    ldaa  #$FF
F80E : A7 00    "  "    staa  $00,x
F810 : 6F 02    "o "    clr  $02,x
F812 : 86 37    " 7"    ldaa  #$37
F814 : A7 03    "  "    staa  $03,x
F816 : 86 3C    " <"    ldaa  #$3C
F818 : A7 01    "  "    staa  $01,x
F81A : 97 09    "  "    staa  X0009
F81C : 4F    "O"    clra
F81D        XF81D:
F81D : 97 07    "  "    staa  X0007
F81F : 97 04    "  "    staa  X0004
F821 : 97 05    "  "    staa  X0005
F823 : 97 06    "  "    staa  X0006
F825 : 97 08    "  "    staa  X0008
F827 : 0E    " "    cli
F828        LF828:
F828 : 20 FE    "  "    bra  LF828
;*************************************;
;Vari Loader 
;*************************************;
;VARILD
F82A : 16    " "    tab
F82B : 48    "H"    asla
F82C : 48    "H"    asla
F82D : 48    "H"    asla
F82E : 1B    " "    aba
F82F : CE 00 13    "   "    ldx  #$0013         ;load X with value 0013h (#LOCRAM)
F832 : DF 0F    "  "    stx  X000F
F834 : CE FD 3C    "  <"    ldx  #$FD3C         ;load X with value FD3Ch (VVECT SAW)
F837 : BD FC E7    "   "    jsr  LFCE7          ;jump sub ADDX
F83A : C6 09    "  "    ldab  #$09
F83C : 7E FA E0    "~  "    jmp  LFAE0          ;jump TRANS 
;*************************************;
;Variable Duty Cycle Square Wave Routine 
;*************************************;
;VARI
F83F : 96 1B    "  "    ldaa  X001B
F841 : B7 04 00    "   "    staa  X0400
F844        LF844:
F844 : 96 13    "  "    ldaa  X0013
F846 : 97 1C    "  "    staa  X001C
F848 : 96 14    "  "    ldaa  X0014
F84A : 97 1D    "  "    staa  X001D
F84C        LF84C:
F84C : DE 18    "  "    ldx  X0018
F84E        LF84E:
F84E : 96 1C    "  "    ldaa  X001C
F850 : 73 04 00    "s  "    com  X0400
F853        LF853:
F853 : 09    " "    dex
F854 : 27 10    "' "    beq  LF866
F856 : 4A    "J"    deca
F857 : 26 FA    "& "    bne  LF853
F859 : 73 04 00    "s  "    com  X0400
F85C : 96 1D    "  "    ldaa  X001D
F85E        LF85E:
F85E : 09    " "    dex
F85F : 27 05    "' "    beq  LF866
F861 : 4A    "J"    deca
F862 : 26 FA    "& "    bne  LF85E
F864 : 20 E8    "  "    bra  LF84E
        ;
F866        LF866:
F866 : B6 04 00    "   "    ldaa  X0400
F869 : 2B 01    "+ "    bmi  LF86C
F86B : 43    "C"    coma
F86C        LF86C:
F86C : 8B 00    "  "    adda  #$00
F86E : B7 04 00    "   "    staa  X0400
F871 : 96 1C    "  "    ldaa  X001C
F873 : 9B 15    "  "    adda  X0015
F875 : 97 1C    "  "    staa  X001C
F877 : 96 1D    "  "    ldaa  X001D
F879 : 9B 16    "  "    adda  X0016
F87B : 97 1D    "  "    staa  X001D
F87D : 91 17    "  "    cmpa  X0017
F87F : 26 CB    "& "    bne  LF84C
F881 : 96 1A    "  "    ldaa  X001A
F883 : 27 06    "' "    beq  LF88B
F885 : 9B 13    "  "    adda  X0013
F887 : 97 13    "  "    staa  X0013
F889 : 26 B9    "& "    bne  LF844
;VARX
F88B : 39    "9"    rts
;*************************************;
;Lightning 
;*************************************;
;LITE
F88C : 86 01    "  "    ldaa  #$01
F88E : 97 1A    "  "    staa  X001A
F890 : C6 03    "  "    ldab  #$03
F892 : 20 0A    "  "    bra  LF89E
;*************************************;
;Appear 
;*************************************;
;APPEAR
F894 : 86 FE    "  "    ldaa  #$FE
F896 : 97 1A    "  "    staa  X001A
F898 : 86 C0    "  "    ldaa  #$C0
F89A : C6 10    "  "    ldab  #$10
F89C : 20 00    "  "    bra  LF89E
;*************************************;
;Lightning+Appear Noise Routine 
;*************************************;
;LITEN:
F89E : 97 19    "  "    staa  X0019
F8A0 : 86 FF    "  "    ldaa  #$FF
F8A2 : B7 04 00    "   "    staa  X0400
F8A5 : D7 15    "  "    stab  X0015
F8A7        LF8A7:
F8A7 : D6 15    "  "    ldab  X0015
F8A9        LF8A9:
F8A9 : 96 0A    "  "    ldaa  X000A
F8AB : 44    "D"    lsra
F8AC : 44    "D"    lsra
F8AD : 44    "D"    lsra
F8AE : 98 0A    "  "    eora  X000A
F8B0 : 44    "D"    lsra
F8B1 : 76 00 09    "v  "    ror  X0009
F8B4 : 76 00 0A    "v  "    ror  X000A
F8B7 : 24 03    "$ "    bcc  LF8BC
F8B9 : 73 04 00    "s  "    com  X0400
F8BC        LF8BC:
F8BC : 96 19    "  "    ldaa  X0019
F8BE        LF8BE:
F8BE : 4A    "J"    deca
F8BF : 26 FD    "& "    bne  LF8BE
F8C1 : 5A    "Z"    decb
F8C2 : 26 E5    "& "    bne  LF8A9
F8C4 : 96 19    "  "    ldaa  X0019
F8C6 : 9B 1A    "  "    adda  X001A
F8C8 : 97 19    "  "    staa  X0019
F8CA : 26 DB    "& "    bne  LF8A7
F8CC : 39    "9"    rts
;*************************************;
;Turbo 
;*************************************;
;TURBO
F8CD : 86 20    "  "    ldaa  #$20
F8CF : 97 15    "  "    staa  X0015
F8D1 : 97 18    "  "    staa  X0018
F8D3 : 86 01    "  "    ldaa  #$01
F8D5 : CE 00 01    "   "    ldx  #$0001
F8D8 : C6 FF    "  "    ldab  #$FF
F8DA : 20 00    "  "    bra  LF8DC
;*************************************;
;White Noise Routine 
;*************************************;
;X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;NOISE:
F8DC : 97 13    "  "    staa  X0013
F8DE        LF8DE:
F8DE : DF 16    "  "    stx  X0016
F8E0        LF8E0:
F8E0 : D7 14    "  "    stab  X0014
F8E2 : D6 15    "  "    ldab  X0015
F8E4        LF8E4:
F8E4 : 96 0A    "  "    ldaa  X000A
F8E6 : 44    "D"    lsra
F8E7 : 44    "D"    lsra
F8E8 : 44    "D"    lsra
F8E9 : 98 0A    "  "    eora  X000A
F8EB : 44    "D"    lsra
F8EC : 76 00 09    "v  "    ror  X0009
F8EF : 76 00 0A    "v  "    ror  X000A
F8F2 : 86 00    "  "    ldaa  #$00
F8F4 : 24 02    "$ "    bcc  LF8F8
F8F6 : 96 14    "  "    ldaa  X0014
F8F8        LF8F8:
F8F8 : B7 04 00    "   "    staa  X0400
F8FB : DE 16    "  "    ldx  X0016
F8FD        LF8FD:
F8FD : 09    " "    dex
F8FE : 26 FD    "& "    bne  LF8FD
F900 : 5A    "Z"    decb
F901 : 26 E1    "& "    bne  LF8E4
F903 : D6 14    "  "    ldab  X0014
F905 : D0 13    "  "    subb  X0013
F907 : 27 09    "' "    beq  LF912
F909 : DE 16    "  "    ldx  X0016
F90B : 08    " "    inx
F90C : 96 18    "  "    ldaa  X0018
F90E : 27 D0    "' "    beq  LF8E0
F910 : 20 CC    "  "    bra  LF8DE
F912        LF912:
F912 : 39    "9"    rts
;*************************************;
;Background 1 Routine 
;*************************************;
;BG1:
F913 : C6 01    "  "    ldab  #$01
F915 : D7 04    "  "    stab  X0004
F917 : 4F    "O"    clra
F918 : 97 19    "  "    staa  X0019
F91A : 20 14    "  "    bra  LF930
;*************************************;
;Thrust 
;*************************************;
;THRUST
F91C : 4F    "O"    clra
F91D : 97 19    "  "    staa  X0019
F91F : C6 03    "  "    ldab  #$03
F921 : 20 0D    "  "    bra  LF930
;*************************************;
;Cannon 
;*************************************;
;CANNON
F923 : 86 01    "  "    ldaa  #$01
F925 : 97 19    "  "    staa  X0019
F927 : CE 03 E8    "   "    ldx  #$03E8
F92A : 86 01    "  "    ldaa  #$01
F92C : C6 FF    "  "    ldab  #$FF
F92E : 20 00    "  "    bra  LF930
;*************************************;
;Filtered Noise Routine 
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
F930 : 97 18    "  "    staa  X0018
F932 : D7 13    "  "    stab  X0013
F934 : DF 16    "  "    stx  X0016
F936 : 7F 00 15    "   "    clr  X0015
F939        LF939:
F939 : DE 16    "  "    ldx  X0016
F93B : B6 04 00    "   "    ldaa  X0400
F93E        LF93E:
F93E : 16    " "    tab
F93F : 54    "T"    lsrb
F940 : 54    "T"    lsrb
F941 : 54    "T"    lsrb
F942 : D8 0A    "  "    eorb  X000A
F944 : 54    "T"    lsrb
F945 : 76 00 09    "v  "    ror  X0009
F948 : 76 00 0A    "v  "    ror  X000A
F94B : D6 13    "  "    ldab  X0013
F94D : 7D 00 19    "}  "    tst  X0019
F950 : 27 02    "' "    beq  LF954
F952 : D4 09    "  "    andb  X0009
F954        LF954:
F954 : D7 14    "  "    stab  X0014
F956 : D6 15    "  "    ldab  X0015
F958 : 91 0A    "  "    cmpa  X000A
F95A : 22 12    "" "    bhi  LF96E
F95C        LF95C:
F95C : 09    " "    dex
F95D : 27 26    "'&"    beq  LF985
F95F : B7 04 00    "   "    staa  X0400
F962 : DB 15    "  "    addb  X0015
F964 : 99 14    "  "    adca  X0014
F966 : 25 16    "% "    bcs  LF97E
F968 : 91 0A    "  "    cmpa  X000A
F96A : 23 F0    "# "    bls  LF95C
F96C : 20 10    "  "    bra  LF97E
        ;
F96E        LF96E:
F96E : 09    " "    dex
F96F : 27 14    "' "    beq  LF985
F971 : B7 04 00    "   "    staa  X0400
F974 : D0 15    "  "    subb  X0015
F976 : 92 14    "  "    sbca  X0014
F978 : 25 04    "% "    bcs  LF97E
F97A : 91 0A    "  "    cmpa  X000A
F97C : 22 F0    "" "    bhi  LF96E
F97E        LF97E:
F97E : 96 0A    "  "    ldaa  X000A
F980 : B7 04 00    "   "    staa  X0400
F983 : 20 B9    "  "    bra  LF93E
        ;
F985        LF985:
F985 : D6 18    "  "    ldab  X0018
F987 : 27 B5    "' "    beq  LF93E
F989 : 96 13    "  "    ldaa  X0013
F98B : D6 15    "  "    ldab  X0015
F98D : 44    "D"    lsra
F98E : 56    "V"    rorb
F98F : 44    "D"    lsra
F990 : 56    "V"    rorb
F991 : 44    "D"    lsra
F992 : 56    "V"    rorb
F993 : 43    "C"    coma
F994 : 50    "P"    negb
F995 : 82 FF    "  "    sbca  #$FF
F997 : DB 15    "  "    addb  X0015
F999 : 99 13    "  "    adca  X0013
F99B : D7 15    "  "    stab  X0015
F99D : 97 13    "  "    staa  X0013
F99F : 26 98    "& "    bne  LF939
F9A1 : C1 07    "  "    cmpb  #$07
F9A3 : 26 94    "& "    bne  LF939
F9A5 : 39    "9"    rts
;*************************************;
;Radio 
;*************************************;
;RADIO
F9A6 : 86 FD    "  "    ldaa  #$FD          ;load A with value FDh (#RADSND/$100 SOUND TABLE)(1st byte of addr:FD)
F9A8 : 97 0F    "  "    staa  X000F
F9AA : CE 00 64    "  d"    ldx  #$0064
F9AD : DF 0B    "  "    stx  X000B
F9AF        LF9AF:
F9AF : DB 0C    "  "    addb  X000C
F9B1 : 96 11    "  "    ldaa  X0011
F9B3 : 99 0B    "  "    adca  X000B
F9B5 : 97 11    "  "    staa  X0011
F9B7 : DE 0B    "  "    ldx  X000B
F9B9 : 25 04    "% "    bcs  LF9BF
F9BB : 20 00    "  "    bra  LF9BD
F9BD        LF9BD:
F9BD : 20 03    "  "    bra  LF9C2
        ;
F9BF        LF9BF:
F9BF : 08    " "    inx
F9C0 : 27 11    "' "    beq  LF9D3
F9C2        LF9C2:
F9C2 : DF 0B    "  "    stx  X000B
F9C4 : 84 0F    "  "    anda  #$0F
F9C6 : 8B 60    " `"    adda  #$60          ;add A with value 84h (RADSND!.$FF)(2nd byte of addr:60)
F9C8 : 97 10    "  "    staa  X0010
F9CA : DE 0F    "  "    ldx  X000F
F9CC : A6 00    "  "    ldaa  $00,x
F9CE : B7 04 00    "   "    staa  X0400
F9D1 : 20 DC    "  "    bra  LF9AF
F9D3        LF9D3:
F9D3 : 39    "9"    rts
;*************************************;
;Hyper 
;*************************************;
;HYPER
F9D4 : 4F    "O"    clra
F9D5 : B7 04 00    "   "    staa  X0400
F9D8 : 97 11    "  "    staa  X0011
F9DA        LF9DA:
F9DA : 4F    "O"    clra
F9DB        LF9DB:
F9DB : 91 11    "  "    cmpa  X0011
F9DD : 26 03    "& "    bne  LF9E2
F9DF : 73 04 00    "s  "    com  X0400
F9E2        LF9E2:
F9E2 : C6 12    "  "    ldab  #$12
F9E4        LF9E4:
F9E4 : 5A    "Z"    decb
F9E5 : 26 FD    "& "    bne  LF9E4
F9E7 : 4C    "L"    inca
F9E8 : 2A F1    "* "    bpl  LF9DB
F9EA : 73 04 00    "s  "    com  X0400
F9ED : 7C 00 11    "|  "    inc  X0011
F9F0 : 2A E8    "* "    bpl  LF9DA
F9F2 : 39    "9"    rts
;*************************************;
;Scream 
;*************************************;
;SCREAM
F9F3 : CE 00 13    "   "    ldx  #$0013
F9F6        LF9F6:
F9F6 : 6F 00    "o "    clr  $00,x
F9F8 : 08    " "    inx
F9F9 : 8C 00 1B    "   "    cpx  #$001B
F9FC : 26 F8    "& "    bne  LF9F6
F9FE : 86 40    " @"    ldaa  #$40
FA00 : 97 13    "  "    staa  X0013
FA02        LFA02:
FA02 : CE 00 13    "   "    ldx  #$0013
FA05 : 86 80    "  "    ldaa  #$80
FA07 : 97 11    "  "    staa  X0011
FA09 : 5F    "_"    clrb
FA0A        LFA0A:
FA0A : A6 01    "  "    ldaa  $01,x
FA0C : AB 00    "  "    adda  $00,x
FA0E : A7 01    "  "    staa  $01,x
FA10 : 2A 02    "* "    bpl  LFA14
FA12 : DB 11    "  "    addb  X0011
FA14        LFA14:
FA14 : 74 00 11    "t  "    lsr  X0011
FA17 : 08    " "    inx
FA18 : 08    " "    inx
FA19 : 8C 00 1B    "   "    cpx  #$001B
FA1C : 26 EC    "& "    bne  LFA0A
FA1E : F7 04 00    "   "    stab  X0400
FA21 : 7C 00 12    "|  "    inc  X0012
FA24 : 26 DC    "& "    bne  LFA02
FA26 : CE 00 13    "   "    ldx  #$0013
FA29 : 5F    "_"    clrb
FA2A        LFA2A:
FA2A : A6 00    "  "    ldaa  $00,x
FA2C : 27 0B    "' "    beq  LFA39
FA2E : 81 37    " 7"    cmpa  #$37
FA30 : 26 04    "& "    bne  LFA36
FA32 : C6 41    " A"    ldab  #$41
FA34 : E7 02    "  "    stab  $02,x
FA36        LFA36:
FA36 : 6A 00    "j "    dec  $00,x
FA38 : 5C    "\"    incb
FA39        LFA39:
FA39 : 08    " "    inx
FA3A : 08    " "    inx
FA3B : 8C 00 1B    "   "    cpx  #$001B
FA3E : 26 EA    "& "    bne  LFA2A
FA40 : 5D    "]"    tstb
FA41 : 26 BF    "& "    bne  LFA02
FA43 : 39    "9"    rts
;*************************************;
;Organ Tune 
;*************************************;
;ORGANT
FA44 : 7A 00 08    "z  "    dec  X0008
FA47 : 39    "9"    rts
        ;
FA48        LFA48:
FA48 : 8D 03    "  "    bsr  LFA4D
FA4A : 7E FC D4    "~  "    jmp  LFCD4
        ;
FA4D        LFA4D:
FA4D : 7F 00 08    "   "    clr  X0008
FA50 : 97 11    "  "    staa  X0011
FA52 : CE FD 70    "  p"    ldx  #$FD70         ;load X with FD70 (ORGTAB)
FA55        LFA55:
FA55 : A6 00    "  "    ldaa  $00,x
FA57 : 27 2D    "'-"    beq  LFA86
FA59 : 7A 00 11    "z  "    dec  X0011
FA5C : 27 06    "' "    beq  LFA64
FA5E : 4C    "L"    inca
FA5F : BD FC E7    "   "    jsr  LFCE7
FA62 : 20 F1    "  "    bra  LFA55
        ;
FA64        LFA64:
FA64 : 08    " "    inx
FA65 : DF 0F    "  "    stx  X000F
FA67 : BD FC E7    "   "    jsr  LFCE7
FA6A : DF 0D    "  "    stx  X000D
FA6C : DE 0F    "  "    ldx  X000F
FA6E        LFA6E:
FA6E : A6 00    "  "    ldaa  $00,x
FA70 : 97 15    "  "    staa  X0015
FA72 : A6 01    "  "    ldaa  $01,x
FA74 : EE 02    "  "    ldx  $02,x
FA76 : DF 13    "  "    stx  X0013
FA78 : 8D 0E    "  "    bsr  LFA88
FA7A : DE 0F    "  "    ldx  X000F
FA7C : 08    " "    inx
FA7D : 08    " "    inx
FA7E : 08    " "    inx
FA7F : 08    " "    inx
FA80 : DF 0F    "  "    stx  X000F
FA82 : 9C 0D    "  "    cpx  X000D
FA84 : 26 E8    "& "    bne  LFA6E
;ORGNT5:
FA86 : 39    "9"    rts
;*
;*ORGAN NOTE
;*4 BYTES(MODE,OSCILLATOR MASK HI+1,LO+1,NOTE#)
;ORGANN
FA87 : 39    "9"    rts
;*************************************;
;Organ Loader
;*************************************;
;ORGANL
FA88 : CE 00 16    "   "    ldx  #$0016
FA8B : 80 02    "  "    suba  #$02
FA8D        LFA8D:
FA8D : 23 15    "# "    bls  LFAA4
FA8F : 81 03    "  "    cmpa  #$03
FA91 : 27 09    "' "    beq  LFA9C
FA93 : C6 01    "  "    ldab  #$01
FA95 : E7 00    "  "    stab  $00,x
FA97 : 08    " "    inx
FA98 : 80 02    "  "    suba  #$02
FA9A : 20 F1    "  "    bra  LFA8D
        ;
FA9C        LFA9C:
FA9C : C6 91    "  "    ldab  #$91
FA9E : E7 00    "  "    stab  $00,x
FAA0 : 6F 01    "o "    clr  $01,x
FAA2 : 08    " "    inx
FAA3 : 08    " "    inx
FAA4        LFAA4:
FAA4 : C6 7E    " ~"    ldab  #$7E
FAA6 : E7 00    "  "    stab  $00,x
FAA8 : C6 FA    "  "    ldab  #$FA
FAAA : E7 01    "  "    stab  $01,x
FAAC : C6 B2    "  "    ldab  #$B2
FAAE : E7 02    "  "    stab  $02,x
;*************************************;
;Organ Routine 
;*************************************;
;DUR=DURATION, OSCILLATOR MASK
;ORGAN
FAB0 : DE 13    "  "    ldx  X0013
FAB2 : 4F    "O"    clra
FAB3 : F6 00 12    "   "    ldab  X0012
FAB6 : 5C    "\"    incb
FAB7 : D7 12    "  "    stab  X0012
FAB9 : D4 15    "  "    andb  X0015
FABB : 54    "T"    lsrb
FABC : 89 00    "  "    adca  #$00
FABE : 54    "T"    lsrb
FABF : 89 00    "  "    adca  #$00
FAC1 : 54    "T"    lsrb
FAC2 : 89 00    "  "    adca  #$00
FAC4 : 54    "T"    lsrb
FAC5 : 89 00    "  "    adca  #$00
FAC7 : 54    "T"    lsrb
FAC8 : 89 00    "  "    adca  #$00
FACA : 54    "T"    lsrb
FACB : 89 00    "  "    adca  #$00
FACD : 54    "T"    lsrb
FACE : 89 00    "  "    adca  #$00
FAD0 : 1B    " "    aba
FAD1 : 48    "H"    asla
FAD2 : 48    "H"    asla
FAD3 : 48    "H"    asla
FAD4 : 48    "H"    asla
FAD5 : 48    "H"    asla
FAD6 : B7 04 00    "   "    staa  X0400
FAD9 : 09    " "    dex
FADA : 27 03    "' "    beq  LFADF
FADC : 7E 00 16    "~  "    jmp  L0016
FADF        LFADF:
FADF : 39    "9"    rts
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
FAE0 : 36    "6"    psha
FAE1        LFAE1:
FAE1 : A6 00    "  "    ldaa  $00,x
FAE3 : DF 0D    "  "    stx  X000D
FAE5 : DE 0F    "  "    ldx  X000F
FAE7 : A7 00    "  "    staa  $00,x
FAE9 : 08    " "    inx
FAEA : DF 0F    "  "    stx  X000F
FAEC : DE 0D    "  "    ldx  X000D
FAEE : 08    " "    inx
FAEF : 5A    "Z"    decb
FAF0 : 26 EF    "& "    bne  LFAE1
FAF2 : 32    "2"    pula
FAF3 : 39    "9"    rts
;*************************************;
;Background End Routine 
;*************************************;
;BGEND
FAF4 : 4F    "O"    clra
FAF5 : 97 04    "  "    staa  X0004
FAF7 : 97 05    "  "    staa  X0005
FAF9 : 39    "9"    rts
;*************************************;
;Background Sound #2 increment 
;*************************************;
;BG2INC
FAFA : 7F 00 04    "   "    clr  X0004
FAFD : 96 05    "  "    ldaa  X0005
FAFF : 84 7F    "  "    anda  #$7F
FB01 : 81 1D    "  "    cmpa  #$1D
FB03 : 26 01    "& "    bne  LFB06
FB05 : 4F    "O"    clra
FB06        LFB06:
FB06 : 4C    "L"    inca
FB07 : 97 05    "  "    staa  X0005
FB09 : 39    "9"    rts
;*************************************;
;Background 2 Routine 
;*************************************;
;BG2
FB0A : 86 0E    "  "    ldaa  #$0E
FB0C : BD FB 57    "  W"    jsr  LFB57
FB0F : 96 05    "  "    ldaa  X0005
FB11 : 48    "H"    asla
FB12 : 48    "H"    asla
FB13 : 43    "C"    coma
FB14 : BD FC 0F    "   "    jsr  LFC0F
FB17        LFB17:
FB17 : 7C 00 17    "|  "    inc  X0017
FB1A : BD FC 11    "   "    jsr  LFC11
FB1D : 20 F8    "  "    bra  LFB17
;*************************************;
;Spinner #1 Sound 
;*************************************;
;SP1
FB1F : 86 03    "  "    ldaa  #$03          ;load A with value 03h (#(CABSHK-VVECT)/9)
FB21 : BD F8 2A    "  *"    jsr  LF82A
FB24 : D6 06    "  "    ldab  X0006
FB26 : C1 1F    "  "    cmpb  #$1F
FB28 : 26 01    "& "    bne  LFB2B
FB2A : 5F    "_"    clrb
FB2B        LFB2B:
FB2B : 5C    "\"    incb
FB2C : D7 06    "  "    stab  X0006
FB2E : 86 20    "  "    ldaa  #$20
FB30 : 10    " "    sba
FB31 : 5F    "_"    clrb
FB32        LFB32:
FB32 : 81 14    "  "    cmpa  #$14
FB34 : 23 05    "# "    bls  LFB3B
FB36 : CB 0E    "  "    addb  #$0E
FB38 : 4A    "J"    deca
FB39 : 20 F7    "  "    bra  LFB32
        ;
FB3B        LFB3B:
FB3B : CB 05    "  "    addb  #$05
FB3D : 4A    "J"    deca
FB3E : 26 FB    "& "    bne  LFB3B
FB40 : D7 13    "  "    stab  X0013
FB42        LFB42:
FB42 : BD F8 3F    "  ?"    jsr  LF83F
FB45 : 20 FB    "  "    bra  LFB42
;*************************************;
;Laser Ball Bonus #2 
;*************************************;
;BON2
FB47 : 96 07    "  "    ldaa  X0007
FB49 : 26 09    "& "    bne  LFB54
FB4B : 7C 00 07    "|  "    inc  X0007
FB4E : 86 0D    "  "    ldaa  #$0D
FB50 : 8D 05    "  "    bsr  LFB57
FB52 : 20 69    " i"    bra  LFBBD
FB54        LFB54:
FB54 : 7E FC 04    "~  "    jmp  LFC04
;*************************************;
;GWAVE Loader 
;*************************************;
;GWLD:
FB57 : 16    " "    tab
FB58 : 58    "X"    aslb
FB59 : 1B    " "    aba
FB5A : 1B    " "    aba
FB5B : 1B    " "    aba
FB5C : CE FE EA    "   "    ldx  #$FEEA    ;(SVTAB)(SOUND VECTOR TABLE)
FB5F : BD FC E7    "   "    jsr  LFCE7
FB62 : A6 00    "  "    ldaa  $00,x
FB64 : 16    " "    tab
FB65 : 84 0F    "  "    anda  #$0F
FB67 : 97 14    "  "    staa  X0014
FB69 : 54    "T"    lsrb
FB6A : 54    "T"    lsrb
FB6B : 54    "T"    lsrb
FB6C : 54    "T"    lsrb
FB6D : D7 13    "  "    stab  X0013
FB6F : A6 01    "  "    ldaa  $01,x
FB71 : 16    " "    tab
FB72 : 54    "T"    lsrb
FB73 : 54    "T"    lsrb
FB74 : 54    "T"    lsrb
FB75 : 54    "T"    lsrb
FB76 : D7 15    "  "    stab  X0015
FB78 : 84 0F    "  "    anda  #$0F
FB7A : 97 11    "  "    staa  X0011
FB7C : DF 0B    "  "    stx  X000B
FB7E : CE FE 4B    "  K"    ldx  #$FE4B   ;GWVTAB
;GWLD2
FB81 : 7A 00 11    "z  "    dec  X0011
FB84 : 2B 08    "+ "    bmi  LFB8E
FB86 : A6 00    "  "    ldaa  $00,x
FB88 : 4C    "L"    inca
FB89 : BD FC E7    "   "    jsr  LFCE7
FB8C : 20 F3    "  "    bra  LFB81
        ;
FB8E        LFB8E:
FB8E : DF 18    "  "    stx  X0018
FB90 : BD FC 4B    "  K"    jsr  LFC4B
FB93 : DE 0B    "  "    ldx  X000B
FB95 : A6 02    "  "    ldaa  $02,x
FB97 : 97 1A    "  "    staa  X001A
FB99 : BD FC 5D    "  ]"    jsr  LFC5D
FB9C : DE 0B    "  "    ldx  X000B
FB9E : A6 03    "  "    ldaa  $03,x
FBA0 : 97 16    "  "    staa  X0016
FBA2 : A6 04    "  "    ldaa  $04,x
FBA4 : 97 17    "  "    staa  X0017
FBA6 : A6 05    "  "    ldaa  $05,x
FBA8 : 16    " "    tab
FBA9 : A6 06    "  "    ldaa  $06,x
FBAB : CE FF 53    "  S"    ldx  #$FF53    ;GFRTAB
FBAE : BD FC E7    "   "    jsr  LFCE7
FBB1 : 17    " "    tba
FBB2 : DF 1B    "  "    stx  X001B
FBB4 : 7F 00 23    "  #"    clr  X0023
FBB7 : BD FC E7    "   "    jsr  LFCE7
FBBA : DF 1D    "  "    stx  X001D
FBBC : 39    "9"    rts
;*************************************;
;GWAVE routine 
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
FBBD : 96 13    "  "    ldaa  X0013
FBBF : 97 22    " ""    staa  X0022
FBC1        LFBC1:
FBC1 : DE 1B    "  "    ldx  X001B
FBC3 : DF 0D    "  "    stx  X000D
FBC5        LFBC5:
FBC5 : DE 0D    "  "    ldx  X000D
FBC7 : A6 00    "  "    ldaa  $00,x
FBC9 : 9B 23    " #"    adda  X0023
FBCB : 97 21    " !"    staa  X0021
FBCD : 9C 1D    "  "    cpx  X001D
FBCF : 27 26    "'&"    beq  LFBF7
FBD1 : D6 14    "  "    ldab  X0014
FBD3 : 08    " "    inx
FBD4 : DF 0D    "  "    stx  X000D
FBD6        LFBD6:
FBD6 : CE 00 24    "  $"    ldx  #$0024
FBD9        LFBD9:
FBD9 : 96 21    " !"    ldaa  X0021
FBDB        LFBDB:
FBDB : 4A    "J"    deca
FBDC : 26 FD    "& "    bne  LFBDB
FBDE : A6 00    "  "    ldaa  $00,x
FBE0 : B7 04 00    "   "    staa  X0400
FBE3 : 08    " "    inx
FBE4 : 9C 1F    "  "    cpx  X001F
FBE6 : 26 F1    "& "    bne  LFBD9
FBE8 : 5A    "Z"    decb
FBE9 : 27 DA    "' "    beq  LFBC5
FBEB : 08    " "    inx
FBEC : 09    " "    dex
FBED : 08    " "    inx
FBEE : 09    " "    dex
FBEF : 08    " "    inx
FBF0 : 09    " "    dex
FBF1 : 08    " "    inx
FBF2 : 09    " "    dex
FBF3 : 01    " "    nop
FBF4 : 01    " "    nop
FBF5 : 20 DF    "  "    bra  LFBD6
        ;
FBF7        LFBF7:
FBF7 : 96 15    "  "    ldaa  X0015
FBF9 : 8D 62    " b"    bsr  LFC5D
FBFB : 7A 00 22    "z ""    dec  X0022
FBFE : 26 C1    "& "    bne  LFBC1
FC00 : 96 07    "  "    ldaa  X0007
FC02 : 26 46    "&F"    bne  LFC4A
FC04        LFC04:
FC04 : 96 16    "  "    ldaa  X0016
FC06 : 27 42    "'B"    beq  LFC4A
FC08 : 7A 00 17    "z  "    dec  X0017
FC0B : 27 3D    "'="    beq  LFC4A
FC0D : 9B 23    " #"    adda  X0023
FC0F        LFC0F:
FC0F : 97 23    " #"    staa  X0023
FC11        LFC11:
FC11 : DE 1B    "  "    ldx  X001B
FC13 : 5F    "_"    clrb
FC14        LFC14:
FC14 : 96 23    " #"    ldaa  X0023
FC16 : 7D 00 16    "}  "    tst  X0016
FC19 : 2B 06    "+ "    bmi  LFC21
FC1B : AB 00    "  "    adda  $00,x
FC1D : 25 08    "% "    bcs  LFC27
FC1F : 20 0B    "  "    bra  LFC2C
        ;
FC21        LFC21:
FC21 : AB 00    "  "    adda  $00,x
FC23 : 27 02    "' "    beq  LFC27
FC25 : 25 05    "% "    bcs  LFC2C
FC27        LFC27:
FC27 : 5D    "]"    tstb
FC28 : 27 08    "' "    beq  LFC32
FC2A : 20 0F    "  "    bra  LFC3B
        ;
FC2C        LFC2C:
FC2C : 5D    "]"    tstb
FC2D : 26 03    "& "    bne  LFC32
FC2F : DF 1B    "  "    stx  X001B
FC31 : 5C    "\"    incb
FC32        LFC32:
FC32 : 08    " "    inx
FC33 : 9C 1D    "  "    cpx  X001D
FC35 : 26 DD    "& "    bne  LFC14
FC37 : 5D    "]"    tstb
FC38 : 26 01    "& "    bne  LFC3B
FC3A : 39    "9"    rts
        ;
FC3B        LFC3B:
FC3B : DF 1D    "  "    stx  X001D
FC3D : 96 15    "  "    ldaa  X0015
FC3F : 27 06    "' "    beq  LFC47
FC41 : 8D 08    "  "    bsr  LFC4B
FC43 : 96 1A    "  "    ldaa  X001A
FC45 : 8D 16    "  "    bsr  LFC5D
FC47        LFC47:
FC47 : 7E FB BD    "~  "    jmp  LFBBD
FC4A        LFC4A:
FC4A : 39    "9"    rts
;*************************************;
;Wave Transfer Routine 
;*************************************;
;WVTRAN
FC4B : CE 00 24    "  $"    ldx  #$0024
FC4E : DF 0F    "  "    stx  X000F
FC50 : DE 18    "  "    ldx  X0018
FC52 : E6 00    "  "    ldab  $00,x
FC54 : 08    " "    inx
FC55 : BD FA E0    "   "    jsr  LFAE0
FC58 : DE 0F    "  "    ldx  X000F
FC5A : DF 1F    "  "    stx  X001F
FC5C : 39    "9"    rts
;*************************************;
;Wave Decay Routinue 
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
FC5D : 4D    "M"    tsta
FC5E : 27 2B    "'+"    beq  LFC8B
FC60 : DE 18    "  "    ldx  X0018
FC62 : DF 0D    "  "    stx  X000D
FC64 : CE 00 24    "  $"    ldx  #$0024
FC67 : 97 12    "  "    staa  X0012
FC69        LFC69:
FC69 : DF 0F    "  "    stx  X000F
FC6B : DE 0D    "  "    ldx  X000D
FC6D : D6 12    "  "    ldab  X0012
FC6F : D7 11    "  "    stab  X0011
FC71 : E6 01    "  "    ldab  $01,x
FC73 : 54    "T"    lsrb
FC74 : 54    "T"    lsrb
FC75 : 54    "T"    lsrb
FC76 : 54    "T"    lsrb
FC77 : 08    " "    inx
FC78 : DF 0D    "  "    stx  X000D
FC7A : DE 0F    "  "    ldx  X000F
FC7C : A6 00    "  "    ldaa  $00,x
FC7E        LFC7E:
FC7E : 10    " "    sba
FC7F : 7A 00 11    "z  "    dec  X0011
FC82 : 26 FA    "& "    bne  LFC7E
FC84 : A7 00    "  "    staa  $00,x
FC86 : 08    " "    inx
FC87 : 9C 1F    "  "    cpx  X001F
FC89 : 26 DE    "& "    bne  LFC69
FC8B        LFC8B:
FC8B : 39         rts
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FC8C : 8E 00 7F   lds  #$007F         ;load SP with value 007Fh (#ENDRAM)
FC8F : B6 04 02   ldaa  $0402         ;load A with addr 0402 (PIA sound select)
FC92 : 0E         cli                 ;clear interrupt (I=0) (NOW ALLOW IRQS)
FC93 : 43         coma                ;complement 1s A (INVERT INPUT)
FC94 : 84 1F      anda  #$1F          ;and A with value 1F (MASK GARB)
FC96 : D6 08      ldab  $08           ;load B with value at addr 08 (ORGFLG)
FC98 : 27 03      beq  LFC9D          ;branch Z=1 IRQ1
FC9A : BD FA 48   jsr  LFA48          ;jump sub ORGNT1(ORGAN TUNE)
;IRQ1
FC9D : 5F         clrb                ;clear B
FC9E : 81 0E      cmpa  #$0E          ;compare A with 0Eh
FCA0 : 27 02      beq  LFCA4          ;branch Z=1 IRQ2
FCA2 : D7 06      stab  $06           ;store B in addr 06
;IRQ2
FCA4 : 81 12      cmpa  #$12          ;compare A with 12h
FCA6 : 27 02      beq  LFCAA          ;branch Z=1 IRQ3
FCA8 : D7 07      stab  $07           ;store B in addr 07
;IRQ3
FCAA : 4D         tsta                ;test A
FCAB : 27 27      beq  LFCD4          ;branch Z=1 IRQ6
FCAD : 4A         deca                ;decr A
FCAE : 81 0C      cmpa  #$0C          ;compare A with 0Ch
FCB0 : 22 08      bhi  LFCBA          ;branch C+Z=0 IRQ4
FCB2 : BD FB 57   jsr  LFB57          ;jump sub GWLD
FCB5 : BD FB BD   jsr  LFBBD          ;jump sub GWAVE
FCB8 : 20 1A      bra  LFCD4          ;branch always IRQ6
;IRQ4
FCBA : 81 1B      cmpa  #$1B          ;compare A with 1Bh
FCBC : 22 0E      bhi  LFCCC          ;branch C+Z=0 IRQ5
FCBE : 80 0D      suba  #$0D          ;sub A with 0Dh
FCC0 : 48         asla                ;arith shift left A
FCC1 : CE FD 1E   ldx  #$FD1E         ;load X with FD1Eh (JMPTBL)
FCC4 : 8D 21      bsr  LFCE7          ;branch sub ADDX
FCC6 : EE 00      ldx  $00,x          ;load X with X+00h
FCC8 : AD 00      jsr  $00,x          ;jump sub X+00h
FCCA : 20 08      bra  LFCD4          ;branch always IRQ6
;IRQ5
FCCC : 80 1C      suba  #$1C          ;sub A with 1Ch
FCCE : BD F8 2A   jsr  LF82A          ;jump sub VARILD
FCD1 : BD F8 3F   jsr  LF83F          ;jump sub VARI
;IRQ6
FCD4 : 96 04      ldaa  $04           ;load A with addr 04
FCD6 : 9A 05      oraa  $05           ;or A with addr 05
;IRQ7
FCD8 : 27 FE      beq  LFCD8          ;branch Z=1 IRQ7
FCDA : 4F         clra                ;clear A
FCDB : 97 07      staa  $07           ;store A with addr 07
FCDD : 96 04      ldaa  $04           ;load A with addr 04
FCDF : 27 03      beq  LFCE4          ;branch Z=1 IRQX
FCE1 : 7E F9 13   jmp  LF913          ;jump BG1
;IRQX
FCE4 : 7E FB 0A   jmp  LFB0A          ;jump BG2
;*************************************;
;Add A to Index Register 
;*************************************;
;ADDX
FCE7 : DF 0D      stx  X000D
FCE9 : 9B 0E      adda  X000E
FCEB : 97 0E      staa  X000E
FCED : 24 03      bcc  LFCF2
FCEF : 7C 00 0D   inc  X000D
;ADDX1
FCF2 : DE 0D      ldx  X000D
FCF4 : 39         rts
;*************************************;
;Diagnostic Processing Here 
;*************************************;
;NMI
FCF5 : 0F         sei                 ;set interrupt mask
FCF6 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
FCF9 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
FCFC : 5F         clrb                ;clear B
;NMI1
FCFD : E9 00      adcb  $00,x         ;add C+B + X+00h
FCFF : 09         dex                 ;decr X
FD00 : 8C F8 00   cpx  #$F800         ;compare X with F800h 
FD03 : 26 F8      bne  LFCFD          ;branch Z=0 NMI1
FD05 : E1 00      cmpb  $00,x         ;compare B with addr X+00h
FD07 : 27 01      beq  LFD0A          ;branch Z=1 NMI2
FD09 : 3E         wai                 ;wait interrupt, PC+1
;NMI2
FD0A : 86 01      ldaa  #$01          ;load A with 01h 
FD0C : BD F8 2A   jsr  LF82A          ;jump sub (VARILD)
FD0F : BD F8 3F   jsr  LF83F          ;jump sub (VARI)
FD12 : 86 02      ldaa  #$02          ;load A with 02h
FD14 : BD FA 4D   jsr  LFA4D          ;jump sub (ORGNT1)
FD17 : 86 01      ldaa  #$01          ;load A with 01h 
FD19 : BD FA 4D   jsr  LFA4D          ;jump sub (ORGNT1)
FD1C : 20 D7      bra  LFCF5          ;branch always NMI (KEEP LOOPING)
;*************************************;
;Special Routine Jump Table
;*************************************;
;JMPTBL
FD1E : FB 1F                          ;(SP1)
FD20 : F9 13                          ;(BG1)
FD22 : FA FA                          ;(BG2INC)
FD24 : F8 8C                          ;(LITE)
FD26 : FB 47                          ;(BON2)
FD28 : FA F4                          ;(BGEND)
FD2A : F8 CD                          ;(TURBO)
FD2C : F8 94                          ;(APPEAR)
FD2E : F9 1C                          ;(THRUST)
FD30 : F9 23                          ;(CANNON)
FD32 : F9 A6                          ;(RADIO)
FD34 : F9 D4                          ;(HYPER)
FD36 : F9 F3                          ;(SCREAM)
FD38 : FA 44                          ;(ORGANT)
FD3A : FA 87                          ;(ORGANN)
;*************************************;
;VARI VECTORS
;*************************************;
;VVECT EQU *
FD3C : 40 01 00 10 E1 00 80 FF FF     ;SAW
FD46 : 28 01 00 08 81 02 00 FF FF     ;FOSHIT 
FD4E : 28 81 00 FC 01 02 00 FC FF     ;QUASAR
FD57 : FF 01 00 18 41 04 80 00 FF     ;CABSHK 
;*************************************;
;Radio Sound Waveform
;*************************************;
FD60 : 8C 5B B6 40 BF 49 A4 73        ;RADSND
FD68 : 73 A4 49 BF 40 B6 5B 8C        ;
;*************************************;
;Organ Tune Table
;*************************************;
; Oscillator Mask(1), Delay(1), Duration(2)
;ORGTAB
FD70 : 1C                             ;FDB 7*4
FD71 : F8 04 05 55 
FD75 : 00 04 05 55 
FD79 : F8 04 05 55 
FD79 : 00 04 05 55 
FD81 : F8 04 05 55 
FD85 : 00 04 05 55 
FD89 : F8 17 3B 41 
;
FD8D : B0                             ;
FD8E : 1F 1D 04 CB 
FD92 : 00 04 06 66 
FD96 : 3E 1D 04 CB 
FD9A : 00 04 1F FE 
FD9E : 3E 3F 03 97 
FDA2 : 00 04 06 66 
FDA6 : 7C 3F 03 97 
FDAA : 00 04 1F FE 
FDAE : 7C 1D 04 CB 
FDB2 : 00 04 06 66 
FDB6 : F8 1D 04 CB 
FDBA : 00 04 06 66 
FDBE : 7C 3F 03 97 
FDC2 : 00 04 06 66 
FDC6 : F8 3F 03 97 
FDCA : 00 04 2C CA 
FDCE : 7C 3F 03 97 
FDD2 : 7C 1D 04 CB 
FDD6 : 7C 12 05 61 
FDDA : 7C 0D 05 B3 
FDDE : 7C 12 05 61 
FDE2 : 7C 0D 05 B3 
FDE6 : 7C 04 06 66 
FDEA : 7C 0D 05 B3 
FDEE : 7C 12 05 61 
FDF2 : 7C 1D 04 CB 
FDF6 : 3E 37 03 CE 
FDFA : 3E 3F 03 97 
FDFE : 7C 04 06 66 
FE02 : 7C 0D 05 B3 
FE06 : 7C 12 05 61 
FE0A : 7C 1D 04 CB 
FE0E : 7C 23 04 86 
FE12 : 7C 1D 04 CB 
FE16 : 7C 12 05 61 
FE1A : 3E 1D 04 CB 
FE1E : 00 04 06 66 
FE22 : 7C 1D 04 CB 
FE26 : 00 04 06 66 
FE2A : 3E 3F 03 97
FE2E : 00 04 06 66 
FE32 : 7C 3F 03 97 
FE36 : 00 04 1F FE 
FE3A : F8 1D 2F EE 
FE3E : 00                             ;LAST TUNE
;*************************************;
;Organ Note Table
;*************************************;
;NOTTAB
FE3F : 47 3F 37 30 29 23              ;
;note  AF A  BF B  C  CS
FE45 : 1D 17 12 0D 08 04              ;
;note  D  E  FE F  FS G
;*************************************;
;GWVTAB - Wave table, 1st byte wavelength
;*************************************;
FE4B : 08                             ;
FE4C : 7F D9 FF D9 7F 24 00 24        ;
;
FE54 : 08                             ;
FE55 : 00 40 80 00 FF 00 80 40        ;
;
FE5D : 10                             ;
FE5E : 7F B0 D9 F5 FF F5 D9 B0        ;
FE66 : 7F 4E 24 09 00 09 24 4E        ;
;
FE6E : 10                             ;
FE6F : 7F C5 EC E7 BF 8D 6D 6A        ;
FE77 : 7F 94 92 71 40 17 12 39        ;
;
FE7F : 10                             ;
FE80 : FF FF FF FF 00 00 00 00        ;
FE88 : FF FF FF FF 00 00 00 00        ;
;
FE90 : 48                             ;
FE91 : 8A 95 A0 AB B5 BF C8 D1        ;
FE99 : DA E1 E8 EE F3 F7 FB FD        ;
FEA1 : FE FF FE FD FB F7 F3 EE        ;
FEA9 : E8 E1 DA D1 C8 BF B5 AB        ;
FEB1 : A0 95 8A 7F 75 6A 5F 54        ;
FEB9 : 4A 40 37 2E 25 1E 17 11        ;
FEC1 : 0C 08 04 02 01 00 01 02        ;
FEC9 : 04 08 0C 11 17 1E 25 2E        ;
FED1 : 37 40 4A 54 5F 6A 75 7F        ;
;
FED9 : 10                             ;
FEDA : 59 7B 98 AC B3 AC 98 7B        ;
FEE2 : 59 37 19 06 00 06 19 37        ;
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
;HBDSND-GFRTAB 1
FEEA : 81 24 00 00 00 16 31           ;HBDV
;STDSND-GFRTAB 2
FEF1 : 12 05 1A FF 00 27 6D           ;STDV 
;SWPAT-GFRTAB 3
FEF8 : 11 05 11 01 0F 01 47           ;DP1V
;SPNSND-GFRTAB 4
FEFF : 11 31 00 01 00 0D 1B           ;XBV
;BBSND-GFRTAB 5
FF06 : F4 12 00 00 00 14 47           ;BBSV
;HBESND-GFRTAB 6
FF0D : 41 45 00 00 00 0F 5B           ;HBEV
;SPNSND-GFRTAB 7
FF14 : 21 35 11 FF 00 0D 1B           ;PROTV
;SPNR-GFRTAB 8
FF1B : 15 00 00 FD 00 01 69           ;SPNRV
;COOLDN-GFRTAB 9
FF22 : 31 11 00 01 00 03 6A           ;CLDWNV
;BBSND-GFRTAB 10
FF29 : 01 15 01 01 01 01 47           ;SV3
;ED10FP-GFRTAB 11 
FF30 : F6 53 03 00 02 06 94           ;ED10
;ED13FP-GFRTAB 12
FF37 : 6A 10 02 00 02 06 9A           ;ED12
;SPNR-GFRTAB 13 
FF3E : 1F 12 00 FF 10 04 69           ;ED17
;BONSND-GFRTAB
FF45 : 31 11 00 FF 00 0D 00           ;BONV
;TRBPAT-GFRTAB
FF4C : 12 06 00 FF 01 09 28           ;TRBV
;*************************************;
;GFRTAB - GWAVE FREQ PATTERN TABLE
;*************************************; 
;Bonus Sound
FF53 : A0 98 90 88 80 78 70 68        ;BONSND
FF5B : 60 58 50 44 40                 ;
;Hundred Point Sound
FF60 : 01 01 02 02 04 04 08 08        ;HBTSND
FF68 : 10 10 30 60 C0 E0              ;
;Spinner Sound
FF6E : 01 01 02 02 03 04 05 06        ;SPNSND
FF76 : 07 08 09 0A 0C                 ;
;Turbine Start Up
FF7B : 80 7C 78 74 70 74 78 7C        ;TRBPAT
FF83 : 80                             ;
;Heartbeat Distorto 
FF84 : 01 01 02 02 04 04 08 08        ;HBDSND
FF8C : 10 20 28 30 38 40 48 50        ;
FF94 : 60 70 80 A0 B0 C0              ;
;*
;SWPAT - SWEEP PATTERN
;*
;BigBen Sounds
FF99 : 08 40 08 40 08 40 08 40        ;BBSND
FFA2 : 08 40 08 40 08 40 08 40        ;
FFAA : 08 40 08 40                    ;
;Heartbeat Echo
FFAE : 01 02 04 08 09 0A 0B 0C        ;HBESND
FFB6 : 0E 0F 10 12 14 16              ;
;Spinner Sound "Drip"
FFBC : 40                             ;SPNR
;Cool Downer
FFBD : 10 08 01                       ;COOLDN 
;Start Distorto Sound
FFC0 : 01 01 01 01 02 02 03 03        ;STDSND 
FFC8 : 04 04 05 06 08 0A 0C 10        ;
FFD0 : 14 18 20 30 40 50 40 30        ;
FFD8 : 20 10 0C 0A 08 07 06 05        ;
FFE0 : 04 03 02 02 01 01 01           ;
;Ed's Sound 10
FFE7 : 07 08 09 0A 0C 08              ;ED10FP
;Ed's Sound 13
FFED : 17 18 19 1A 1B 1C 00 00        ;ED13FP - MATCH THE PROMS  
FFF5 : 00 00 00                       ;
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FC 8C                          ;IRQ 
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FC F5                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------





