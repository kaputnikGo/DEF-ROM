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
        ;Pinball Sound ROM 14, Warlok, October 1982
        ; code routines and order identical to ROM 1 Flash, some params diff
        ; checksums are different
        ;
        ;apparently has : W12 - PB7 Status (input sound select #8)(used in Warlok)
        ; manual has it jumpered, yet IRQ masks out bit 7, never reads it
        ;PIA |b7|b6|b5|b4|b3|b2|b1|b0|
        ;pcb|W12|SW|W4|...
        ;J3- |8 |SW|6 |7 |4 |5 |2 |3 |
        ;0402|1 |1 |0 |1 |1 |1 |1 |1 |
        ; 
        ;
        ;
org  $F800
        ;
F800 : 81                             ;checksum
;*************************************;
;RESET power on
;*************************************;
;SETUP
F801 : 0F         sei                 ;set interrupt mask   
F802 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh  
F805 : CE 04 00   ldx  #$0400         ;load X with 0400h (PIA addr)
F808 : 6F 01      clr  $01,x          ;clear X+01h (0401) PIA CR port A
F80A : 6F 03      clr  $03,x          ;clear X+03h (0403) PIA CR port B
F80C : 86 FF      ldaa  #$FF          ;load A with FFh
F80E : A7 00      staa  $00,x         ;store A in addr X+00h (0400) PIA port A out (DAC sound)
F810 : 6F 02      clr  $02,x          ;clear X+02h (0402) PIA port B in (sound select)
F812 : 86 07      ldaa  #$07          ;load A with 07h
F814 : A7 01      staa  $01,x         ;store A in addr X+01h (0401) PIA CR port A
F816 : A7 03      staa  $03,x         ;store A in addr X+03h (0403) PIA CR port B
F818 : 97 1C      staa  $1C           ;store A in addr 1C (HI)(START RANDOM GENERATOR)
F81A : 7F 00 20   clr  $0020          ;clear addr 0020
F81D : 7F 00 1F   clr  $001F          ;clear addr 001F
F820 : 0E         cli                 ;clear interrupts I=0
;STDBY
F821 : 20 FE      bra  LF821          ;branch always STDBY (*-2)
;*************************************;
;Three Oscillator Sound Generator
;*************************************;
;PLAY:
F823 : DF 24      stx  X0024
F825 : CE F8 C8   ldx  #$F8C8
F828 : DF 26      stx  X0026
F82A : 86 80      ldaa  #$80
;PLAY1:
F82C : D6 03      ldab  X0003
F82E : 2A 09      bpl  LF839
F830 : D6 1D      ldab  X001D
F832 : 54         lsrb
F833 : 54         lsrb
F834 : 54         lsrb
F835 : 5C         incb
;PLAY2:
F836 : 5A         decb
F837 : 26 FD      bne  LF836
;PLAY3:
F839 : 7A 00 08   dec  X0008
F83C : 27 4C      beq  LF88A
F83E : 7A 00 09   dec  X0009
F841 : 27 4C      beq  LF88F
F843 : 7A 00 0A   dec  X000A
F846 : 27 4C      beq  LF894
F848 : 7A 00 0B   dec  X000B
F84B : 26 DF      bne  LF82C
F84D : D6 03      ldab  X0003
F84F : 27 DB      beq  LF82C
F851 : C4 7F      andb  #$7F
F853 : D7 0B      stab  X000B
F855 : D6 1D      ldab  X001D
F857 : 58         aslb
F858 : DB 1D      addb  X001D
F85A : CB 0B      addb  #$0B
F85C : D7 1D      stab  X001D
F85E : 7A 00 1B   dec  X001B
F861 : 26 0E      bne  LF871
F863 : D6 0F      ldab  X000F
F865 : D7 1B      stab  X001B
F867 : DE 26      ldx  X0026
F869 : 09         dex
F86A : 8C F8 C1   cpx  #$F8C1
F86D : 27 4E      beq  LF8BD
F86F : DF 26      stx  X0026
;PLAY6:
F871 : D6 1D      ldab  X001D
F873 : 2B 06      bmi  LF87B
F875 : D4 07      andb  X0007
F877 : C4 7F      andb  #$7F
F879 : 20 05      bra  LF880
;PLAY6A:
F87B : D4 07      andb  X0007
F87D : C4 7F      andb  #$7F
F87F : 50         negb
;PLAY6B:
F880 : 36         psha
F881 : 1B         aba
F882 : 16         tab
F883 : 32         pula
F884 : DE 26      ldx  X0026
F886 : AD 00      jsr  $00,x            ;INFO: index jump
F888 : 20 A2      bra  LF82C
;PLAY7:
F88A : CE 00 00   ldx  #$0000
F88D : 20 08      bra  LF897
;PLAY8:
F88F : CE 00 01   ldx  #$0001
F892 : 20 03      bra  LF897
;PLAY9:
F894 : CE 00 02   ldx  #$0002
;PLAY10:
F897 : 6D 18      tst  $18,x
F899 : 27 12      beq  LF8AD
F89B : 6A 18      dec  $18,x
F89D : 26 0E      bne  LF8AD
F89F : E6 0C      ldab  $0C,x
F8A1 : E7 18      stab  $18,x
F8A3 : E6 00      ldab  $00,x
F8A5 : EB 10      addb  $10,x
F8A7 : E1 14      cmpb  $14,x
F8A9 : 27 12      beq  LF8BD
F8AB : E7 00      stab  $00,x
;PLAY11:
F8AD : E6 00      ldab  $00,x
F8AF : E7 08      stab  $08,x
F8B1 : AB 04      adda  $04,x
F8B3 : 60 04      neg  $04,x
F8B5 : 16         tab
F8B6 : DE 26      ldx  X0026
F8B8 : AD 00      jsr  $00,x            ;INFO: index jump
F8BA : 7E F8 2C   jmp  LF82C
;PLAY12:
F8BD : DE 24      ldx  X0024
F8BF : 39         rts
;*************************************;
;Echo And Decay Routine
;*************************************;
;RDECAY
F8C0 : 54         lsrb
F8C1 : 54         lsrb
F8C2 : 54         lsrb
F8C3 : 54         lsrb
F8C4 : 54         lsrb
F8C5 : 54         lsrb
F8C6 : 54         lsrb
F8C7 : 54         lsrb
;DECAYZ
F8C8 : F7 04 00   stab  X0400
F8CB : 39         rts
;*************************************;
;3 Oscillator Calling Routines 
;*************************************;
;THNDR
F8CC : CE FC 15   ldx  #$FC15
;THNDR1:
F8CF : C6 1C      ldab  #$1C
F8D1 : BD FA 19   jsr  LFA19
F8D4 : BD F8 23   jsr  LF823
F8D7 : 39         rts
;SND2
F8D8 : CE FC 31   ldx  #$FC31
F8DB : 20 F2      bra  LF8CF
;SND3
F8DD : CE FC 4D   ldx  #$FC4D
F8E0 : 20 ED      bra  LF8CF
;SND4
F8E2 : CE FC 69   ldx  #$FC69
F8E5 : 20 E8      bra  LF8CF
;SND5
F8E7 : CE FC 85   ldx  #$FC85
F8EA : 20 E3      bra  LF8CF
;SND6
F8EC : 7C 00 20   inc  X0020
F8EF : CE 00 30   ldx  #$0030
F8F2 : DF 22      stx  X0022
F8F4 : CE FC A1   ldx  #$FCA1
F8F7 : C6 1C      ldab  #$1C
F8F9 : BD FA 19   jsr  LFA19
F8FC : CE 00 00   ldx  #$0000
F8FF : DF 22      stx  X0022
F901 : CE FC A1   ldx  #$FCA1
F904 : 20 C9      bra  LF8CF
;*************************************;
;load VEC010X vector(6 bytes) (for SING?)
;*************************************;
;VECLD1
F906 : 7F 00 20   clr  X0020
F909 : C6 88      ldab  #$88
F90B : D7 21      stab  X0021
F90D : CE 00 60   ldx  #$0060
F910 : DF 22      stx  X0022
F912 : CE FC F3   ldx  #$FCF3
F915 : C6 06      ldab  #$06
F917 : BD FA 19   jsr  LFA19
F91A : 39         rts
;*************************************;
;load params then ,IRQ2,PLAY 
;*************************************;
;PARAM6
F91B : CE 00 31   ldx  #$0031
F91E : C6 06      ldab  #$06
F920 : A6 00      ldaa  $00,x
F922 : 81 36      cmpa  #$36
F924 : 22 08      bhi  LF92E
F926 : C6 04      ldab  #$04
F928 : 81 10      cmpa  #$10
F92A : 22 02      bhi  LF92E
F92C : C6 02      ldab  #$02
;PRM61 
F92E : 10         sba
F92F : A7 00      staa  $00,x
F931 : A6 01      ldaa  $01,x
F933 : 10         sba
F934 : A7 01      staa  $01,x
;PRM62 (ECHO1)
F936 : 32         pula
F937 : 32         pula
F938 : 7E FB A1   jmp  LFBA1
;*************************************;
;Progressive Pitch Countdown
;*************************************;
;BONUS$
F93B : CE 00 60   ldx  #$0060
F93E : A6 00      ldaa  $00,x
F940 : 80 02      suba  #$02
F942 : A7 00      staa  $00,x
F944 : BD FA 98   jsr  LFA98
F947 : 7E FA B1   jmp  LFAB1
;*************************************;
;Diving Plane Sound
;*************************************;
;PLANE
F94A : CE 00 01   ldx  #$0001
F94D : DF 00      stx  X0000
F94F : CE 03 80   ldx  #$0380
F952 : DF 02      stx  X0002
;PLANE1:
F954 : 7F 04 00   clr  X0400
F957 : DE 00      ldx  X0000
F959 : 08         inx
F95A : DF 00      stx  X0000
;PLANE2
F95C : 09         dex
F95D : 26 FD      bne  LF95C
F95F : 73 04 00   com  X0400
F962 : DE 02      ldx  X0002
;PLANE3
F964 : 09         dex
F965 : 26 FD      bne  LF964
F967 : 20 EB      bra  LF954
;*************************************;
;early version (pre) of Tilt sound
;*************************************;
;PTILT
F969 : 5F         clrb
F96A : F7 04 00   stab  X0400
F96D : CE 00 DF   ldx  #$00DF
;PTILT1
F970 : 86 20      ldaa  #$20
F972 : BD FB B7   jsr  LFBB7
;PTILT2
F975 : 09         dex
F976 : 26 FD      bne  LF975
F978 : 73 04 00   com  X0400
;PTILT3
F97B : 5A         decb
F97C : 26 FD      bne  LF97B
F97E : 73 04 00   com  X0400
F981 : 96 24      ldaa  X0024
F983 : DE 24      ldx  X0024
F985 : 85 10      bita  #$10
F987 : 27 E7      beq  LF970
F989 : 39         rts
;*************************************;
;param #1 for PLiten (high amp)
;*************************************;
;PLPRM1
F98A : C6 01      ldab  #$01
F98C : D7 00      stab  X0000
F98E : C6 FF      ldab  #$FF
F990 : 20 06      bra  LF998
;*************************************;
;param #2 for PLiten (half amp)
;*************************************;
;PLPRM2
F992 : C6 01      ldab  #$01
F994 : D7 00      stab  X0000
F996 : C6 AF      ldab  #$AF
;*************************************;
;early version (pre) of Liten
;*************************************;
;PLITEN
F998 : D7 02      stab  X0002
;LITE0
F99A : C6 03      ldab  #$03
F99C : D7 01      stab  X0001
;LITE1
F99E : D6 02      ldab  X0002
F9A0 : 96 1D      ldaa  X001D
F9A2 : 44         lsra
F9A3 : 44         lsra
F9A4 : 44         lsra
F9A5 : 98 1D      eora  X001D
F9A7 : 44         lsra
F9A8 : 76 00 1C   ror  X001C
F9AB : 76 00 1D   ror  X001D
F9AE : 24 01      bcc  LF9B1
F9B0 : 53         comb
;LITE2
F9B1 : F7 04 00   stab  X0400
F9B4 : D6 00      ldab  X0000
;LITE3
F9B6 : 5A         decb
F9B7 : 26 FD      bne  LF9B6
F9B9 : 7A 00 01   dec  X0001
F9BC : 26 E0      bne  LF99E
F9BE : 7C 00 00   inc  X0000
F9C1 : 26 D7      bne  LF99A
F9C3 : 39         rts
;*************************************;
;Bonus + param loader
;*************************************;
;BONLDR
F9C4 : 96 1F      ldaa  $1F           ;load A with addr 1F
F9C6 : 27 05      beq  LF9CD          ;branch Z=1 BONUS
F9C8 : 7A 00 1F   dec  $001F          ;decr addr 001F
F9CB : 20 07      bra  LF9D4          ;branch always SNDBRA
;*************************************;
;Funny "Electric Sound"
;*************************************;
;* SUPPOSED TO GENERATE A PHASED OUTPUT AT
;* A CHANGING FREQUENCY. IT DOESN'T, AND
;* I'M NOT SURE EXACTLY WHAT IT DOES DO.
;* BEST LEAVE THIS ALONE.
;BONUS
F9CD : 7A 00 21   dec  X0021
F9D0 : 86 01      ldaa  #$01
F9D2 : 97 1F      staa  X001F
;SNDBRA
F9D4 : 20 04      bra  LF9DA
;SND1
F9D6 : C6 A0      ldab  #$A0
F9D8 : D7 21      stab  X0021
;SND1$:
F9DA : 86 04      ldaa  #$04
F9DC : 97 01      staa  X0001
;SND1$$:
F9DE : 86 9F      ldaa  #$9F
F9E0 : D6 21      ldab  X0021
;SND1A
F9E2 : CE 01 C0   ldx  #$01C0
;SND1B
F9E5 : 09         dex
F9E6 : 27 20      beq  LFA08
F9E8 : F7 00 00   stab  X0000
F9EB : B7 04 00   staa  X0400
;SND1C
F9EE : 09         dex
F9EF : 27 17      beq  LFA08
F9F1 : 7A 00 00   dec  X0000
F9F4 : 26 F8      bne  LF9EE
F9F6 : 09         dex
F9F7 : 27 0F      beq  LFA08
F9F9 : D7 00      stab  X0000
F9FB : 73 04 00   com  X0400
;SND1D
F9FE : 09         dex
F9FF : 27 07      beq  LFA08
FA01 : 7A 00 00   dec  X0000
FA04 : 26 F8      bne  LF9FE
FA06 : 20 DD      bra  LF9E5
;SSND1E:
FA08 : D0 01      subb  X0001
FA0A : C1 10      cmpb  #$10
FA0C : 22 D4      bhi  LF9E2
FA0E : 39         rts
;START
FA0F : C6 11      ldab  #$11
FA11 : D7 21      stab  X0021
FA13 : 86 FE      ldaa  #$FE
FA15 : 97 01      staa  X0001
FA17 : 20 C5      bra  LF9DE
;*************************************;
;Parameter Transfer
;*************************************;
;TRANS
FA19 : 36         psha
;TRANS1
FA1A : A6 00      ldaa  $00,x
FA1C : DF 24      stx  X0024
FA1E : DE 22      ldx  X0022
FA20 : A7 00      staa  $00,x
FA22 : 08         inx
FA23 : DF 22      stx  X0022
FA25 : DE 24      ldx  X0024
FA27 : 08         inx
FA28 : 5A         decb
FA29 : 26 EF      bne  LFA1A
FA2B : 32         pula
FA2C : 39         rts
;*************************************;
;Single Oscillator Sound Calls
;*************************************;
;PERK
FA2D : CE FC BD   ldx  #$FCBD
FA30 : 20 26      bra  LFA58
;PERK1:
FA32 : BD FA 98   jsr  LFA98
FA35 : BD FA B1   jsr  LFAB1
FA38 : 39         rts
;ATARI
FA39 : CE FC C3   ldx  #$FCC3
FA3C : 20 F4      bra  LFA32
;SIREN
FA3E : C6 FF      ldab  #$FF
FA40 : D7 1E      stab  X001E
;SIREN1
FA42 : CE FC C9   ldx  #$FCC9
FA45 : 8D EB      bsr  LFA32
FA47 : CE FC CF   ldx  #$FCCF
FA4A : 8D E6      bsr  LFA32
FA4C : 5A         decb
FA4D : 26 F3      bne  LFA42
FA4F : 39         rts
;ORRRR
FA50 : CE FC D5   ldx  #$FCD5
FA53 : 20 DD      bra  LFA32
;PERK$
FA55 : CE FC E1   ldx  #$FCE1
;PERK$1:
FA58 : 8D D8      bsr  LFA32
FA5A : 8D 30      bsr  LFA8C
FA5C : 20 FA      bra  LFA58
;HSTD
FA5E : 86 FF      ldaa  #$FF
FA60 : 97 1E      staa  X001E
FA62 : CE FC E7   ldx  #$FCE7
FA65 : 20 F1      bra  LFA58
;PERK$$
FA67 : 86 FF      ldaa  #$FF
FA69 : 97 1E      staa  X001E
FA6B : CE FC DB   ldx  #$FCDB
FA6E : 20 E8      bra  LFA58
;*************************************;
;Random Squirts 
;*************************************;
;SQRT
FA70 : C6 30      ldab  #$30
;SQRT1
FA72 : CE FC ED   ldx  #$FCED
FA75 : 8D 21      bsr  LFA98
;SQRT2
FA77 : 96 1D      ldaa  X001D
FA79 : 48         asla
FA7A : 9B 1D      adda  X001D
FA7C : 8B 0B      adda  #$0B
FA7E : 97 1D      staa  X001D
FA80 : 44         lsra
FA81 : 44         lsra
FA82 : 8B 0C      adda  #$0C
FA84 : 97 01      staa  X0001
FA86 : 8D 29      bsr  LFAB1
FA88 : 5A         decb
FA89 : 26 EC      bne  LFA77
FA8B : 39         rts
;*************************************;
;Echo Function 
;*************************************;
;ECHO:
FA8C : 96 1E      ldaa  X001E
FA8E : 80 08      suba  #$08
FA90 : 2A 03      bpl  LFA95
FA92 : 97 1E      staa  X001E
FA94 : 39         rts
;ECHO1:
FA95 : 32         pula
FA96 : 32         pula
FA97 : 39         rts
;*************************************;
;Move Parameters
;*************************************;
;MOVE:
FA98 : A6 00      ldaa  $00,x
FA9A : 97 01      staa  X0001
FA9C : A6 01      ldaa  $01,x
FA9E : 97 02      staa  X0002
FAA0 : A6 02      ldaa  $02,x
FAA2 : 97 03      staa  X0003
FAA4 : A6 03      ldaa  $03,x
FAA6 : 97 04      staa  X0004
FAA8 : A6 04      ldaa  $04,x
FAAA : 97 05      staa  X0005
FAAC : A6 05      ldaa  $05,x
FAAE : 97 06      staa  X0006
FAB0 : 39         rts
;*************************************;
;Delta F, Delta A Routine (Single Osc)
;*************************************;
;SING:
FAB1 : 96 1E      ldaa  X001E
FAB3 : 37         pshb
FAB4 : D6 05      ldab  X0005
FAB6 : D7 07      stab  X0007
FAB8 : D6 02      ldab  X0002
FABA : D7 08      stab  X0008
;SING1:
FABC : 43         coma
FABD : D6 01      ldab  X0001
FABF : B7 04 00   staa  X0400
;SING2:
FAC2 : 5A         decb
FAC3 : 26 FD      bne  LFAC2
FAC5 : 43         coma
FAC6 : D6 01      ldab  X0001
FAC8 : 20 00      bra  LFACA
FACA : 08         inx
FACB : 09         dex
FACC : 08         inx
FACD : 09         dex
FACE : B7 04 00   staa  X0400
;SING3
FAD1 : 5A         decb
FAD2 : 26 FD      bne  LFAD1
FAD4 : 7A 00 08   dec  X0008
FAD7 : 27 16      beq  LFAEF
FAD9 : 7A 00 07   dec  X0007
FADC : 26 DE      bne  LFABC
FADE : 43         coma
FADF : D6 05      ldab  X0005
FAE1 : B7 04 00   staa  X0400
FAE4 : D7 07      stab  X0007
FAE6 : D6 01      ldab  X0001
FAE8 : 9B 06      adda  X0006
FAEA : 2B 1E      bmi  LFB0A
FAEC : 01         nop
FAED : 20 15      bra  LFB04
;SING4
FAEF : 08         inx
FAF0 : 09         dex
FAF1 : 01         nop
FAF2 : 43         coma
FAF3 : D6 02      ldab  X0002
FAF5 : B7 04 00   staa  X0400
FAF8 : D7 08      stab  X0008
FAFA : D6 01      ldab  X0001
FAFC : D0 03      subb  X0003
FAFE : D1 04      cmpb  X0004
FB00 : D1 04      cmpb  X0004
FB02 : 27 06      beq  LFB0A
;SING5
FB04 : D7 01      stab  X0001
FB06 : C0 05      subb  #$05
FB08 : 20 B8      bra  LFAC2
;SING6
FB0A : 33         pulb
FB0B : 39         rts
;*************************************;
;CHIME synth uses NOTTBL,SNDTBL,WAVFRM tables
;*************************************;
;CHIME
FB0C : 84 1F      anda  #$1F
;CHIME1
FB0E : 27 FE      beq  LFB0E
FB10 : 81 11      cmpa  #$11
;CHIME2
FB12 : 27 FE      beq  LFB12
FB14 : 81 12      cmpa  #$12
;CHIME3
FB16 : 27 FE      beq  LFB16
FB18 : 84 0F      anda  #$0F
FB1A : CE FB F7   ldx  #$FBF7
FB1D : BD FB B7   jsr  LFBB7
FB20 : A6 00      ldaa  $00,x
FB22 : 97 18      staa  X0018
FB24 : CE FB E7   ldx  #$FBE7
FB27 : C6 10      ldab  #$10
FB29 : BD FA 19   jsr  LFA19
FB2C : CE FC 07   ldx  #$FC07
FB2F : E6 00      ldab  $00,x
;CHIME4
FB31 : D7 1A      stab  X001A
FB33 : DF 22      stx  X0022
;CHIME5
FB35 : CE 00 00   ldx  #$0000
FB38 : C6 08      ldab  #$08
FB3A : D7 19      stab  X0019
;CHIME6
FB3C : A6 00      ldaa  $00,x
FB3E : D6 18      ldab  X0018
FB40 : 7D 00 1A   tst  X001A
FB43 : 26 06      bne  LFB4B
FB45 : A0 08      suba  $08,x
FB47 : A7 00      staa  $00,x
FB49 : C0 03      subb  #$03
;CHIME7
FB4B : 08         inx
FB4C : B7 04 00   staa  X0400
;CHIME8
FB4F : 5A         decb
FB50 : 26 FD      bne  LFB4F
FB52 : 7A 00 19   dec  X0019
FB55 : 26 E5      bne  LFB3C
FB57 : 7A 00 1A   dec  X001A
FB5A : 2A D9      bpl  LFB35
FB5C : DE 22      ldx  X0022
FB5E : 08         inx
FB5F : E6 00      ldab  $00,x
FB61 : 26 CE      bne  LFB31
FB63 : 86 80      ldaa  #$80
FB65 : B7 04 00   staa  X0400
FB68 : 3E         wai
;CHIMEX
FB69 : 20 A1      bra  LFB0C
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FB6B : 8E 00 7F   lds  #$007F         ;load SP with value 007Fh (#ENDRAM) RE-INITIALIZE STACK
FB6E : CE F8 C8   ldx  #$F8C8         ;load X with F8C8h
FB71 : DF 26      stx  $26            ;store X in addr 26
FB73 : B6 04 02   ldaa  $0402         ;load A with PIA sound select
FB76 : CE 00 00   ldx  #$0000         ;load X with 0000h
FB79 : DF 22      stx  $22            ;store X in addr 22
FB7B : C6 AF      ldab  #$AF          ;load B with AFh
FB7D : D7 1E      stab  $1E           ;store B in addr 1E
FB7F : 0E         cli                 ;clear interrupts I=0
FB80 : 43         coma                ;complement 1s A
FB81 : 81 46      cmpa  #$46          ;compare A with 46h
FB83 : 27 04      beq  LFB89          ;branch Z=1 IRQ1
FB85 : 85 40      bita  #$40          ;bit test A with 40h
FB87 : 26 83      bne  LFB0C          ;branch Z=0 CHIME
;IRQ1
FB89 : 84 1F      anda  #$1F          ;and A with 1Fh
FB8B : 27 14      beq  LFBA1          ;branch Z=1 IRQ2
FB8D : 81 18      cmpa  #$18          ;compare A with 18h
FB8F : 22 D8      bhi  LFB69          ;branch C+Z=0 CHIMEX
FB91 : 4A         deca                ;decr A
FB92 : 48         asla                ;arith shift left A
FB93 : CE FC F9   ldx  #$FCF9         ;load X with FCF9h (JMPTBL)
FB96 : 8D 1F      bsr  LFBB7          ;branch sub ADDX
FB98 : EE 00      ldx  $00,x          ;load X with X+00h
FB9A : AD 00      jsr  $00,x          ;jump sub X+00h
FB9C : 86 80      ldaa  #$80          ;load A with 80h
FB9E : B7 04 00   staa  $0400         ;store A in PIA
;IRQ2
FBA1 : 96 20      ldaa  $20           ;load A with 20h
;IRQW1
FBA3 : 27 FE      beq  LFBA3          ;branch Z=1 IRQW1 (*-2)
;
FBA5 : CE 00 00   ldx  #$0000         ;load X with 0000h
FBA8 : DF 22      stx  $22            ;store X in addr 22
FBAA : CE 00 30   ldx  #$0030         ;load X with 0030h
FBAD : C6 1C      ldab  #$1C          ;load B with 1Ch
FBAF : BD FA 19   jsr  LFA19          ;jump sub TRANS
FBB2 : BD F8 23   jsr  LF823          ;jump sub PLAY
;IRQW2
FBB5 : 20 FE      bra  LFBB5          ;branch always IRQW2 (*-2)
;*************************************;
;* ADD A TO INDEX REGISTER
;*************************************;
;ADDX
FBB7 : DF 24      stx  X0024
FBB9 : 9B 25      adda  X0025
FBBB : 97 25      staa  X0025
FBBD : 96 24      ldaa  X0024
FBBF : 89 00      adca  #$00
FBC1 : 97 24      staa  X0024
FBC3 : DE 24      ldx  X0024
FBC5 : 39         rts
;*************************************;
;Diagnostic Processing
;*************************************;
;NMI
FBC6 : 0F         sei                 ;set interrupt mask I=1
FBC7 : CE FF FF   ldx  #$FFFF         ;load X with value 7FFFh (end of ROM)
FBCA : 5F         clrb                ;clear B
;NMI1
FBCB : E9 00      adcb  $00,x         ;add C+B + X+00h
FBCD : 09         dex                 ;decr X
FBCE : 8C F8 00   cpx  #$F800         ;compare X with value F800h (PIA sound select)
FBD1 : 26 F8      bne  LFBCB          ;branch Z=0 NMI1
FBD3 : E1 00      cmpb  $00,x         ;compare B with X+00h
FBD5 : 27 01      beq  LFBD8          ;branch Z=1 NMI2
FBD7 : 3E         wai                 ;wait for interrupt, PC+1
;NMI2
FBD8 : CE F8 C8   ldx  #$F8C8         ;load X with value F8C8h (DECAYZ)
FBDB : DF 26      stx  $26            ;store X in addr 26
FBDD : CE 00 00   ldx  #$0000         ;load X with value 0000h
FBE0 : DF 22      stx  $22            ;store X in addr 22
FBE2 : BD F9 D6   jsr  LF9D6          ;jump sub SND1
FBE5 : 20 F1      bra  LFBD8          ;branch always NMI2
;*************************************;
;data tables for CHIME
;*************************************;
;SNDTBL
FBE7 : DA FF DA 80 26 01 26 80        ;
FBEF : 07 0A 07 00 F9 F6 F9 00        ;
;NOTTBL
FBF7 : 3A 3E 50 46 33 2C 27 20        ;
FBFF : 25 1C 1A 17 14 11 10 33        ;
;WAVFRM
FC07 : 08 03 02 01 02 03 04 05        ;
FC0F : 06 0A 1E 32 70 00              ;
;*************************************;
;data tables for PLAY (Three Osc) - 28 bytes
;*************************************;
;VEC01 
FC15 : FFFF FF90 FFFF FFFF FFFF       ;
FC1F : FF90 FFFF FFFF FFFF FFFF       ;
FC29 : 0000 0000 0000 0000            ;
;VEC02 
FC31 : 4801 0000 3F3F 0000 4801       ;
FC3B : 0000 0108 0000 8101 0000       ;
FC45 : 01FF 0000 0108 0000            ;
;VEC03 
FC4D : 0110 0000 3F3F 0000 0110       ;
FC57 : 0000 0505 0000 0101 0000       ;
FC61 : 31FF 0000 0505 0000            ;
;VEC04 
FC69 : 3000 0000 7F00 0000 3000       ;
FC73 : 0000 0100 0000 7F00 0000       ;
FC7D : 0200 0000 0100 0000            ;
;VEC05 
FC85 : 0400 0004 7F00 007F 0400       ;
FC8F : 0004 FF00 00A0 0000 0000       ;
FC99 : 0000 0000 FF00 00A0            ;
;VEC06 
FCA1 : 0C68 6800 071F 0F00 0C80       ;
FCAB : 8000 FFFF FF00 0000 0000       ;
FCB5 : 0000 0000 FFFF FF00            ;
;*************************************;
; data tables for SING (Single Osc)
;*************************************;
;VEC01X 
FCBD : FF01 02C3 FF00                 ;
;VEC02X 
FCC3 : 0103 FF80 FF00                 ;
;VEC03X
FCC9 : 2003 FF50 FF00                 ;
;VEC04X
FCCF : 5003 0120 FF00                 ;
;VEC05X 
FCD5 : FE04 0204 FF00                 ;
;VEC06X
FCDB : 4803 010C FF00                 ;
;VEC07X 
FCE1 : 4802 010C FF00                 ;
;VEC08X
FCE7 : E001 0210 FF00                 ;
;VEC09X
FCED : 50FF 0000 6080                 ;
;VEC010X
FCF3 : FF02 0106 FF00                 ;
;*************************************;
;*SPECIAL ROUTINE JUMP TABLE - FDB
;*************************************;
;JMPTBL
FCF9 : F9 D6                          ;SND1
FCFB : F8 D8                          ;SND2
FCFD : F8 DD                          ;SND3
FCFF : F8 E2                          ;SND4
FD01 : F8 E7                          ;SND5
FD03 : F9 69                          ;PTILT
FD05 : F9 92                          ;PLPRM2
FD07 : F8 CC                          ;THNDR
FD09 : FA 5E                          ;HSTD
FD0B : FA 39                          ;ATARI
FD0D : FA 3E                          ;SIREN
FD0F : FA 50                          ;ORRRR
FD11 : FA 55                          ;PERK$
FD13 : FA 2D                          ;PERK
FD15 : FA 67                          ;PERK$$
FD19 : F8 EC                          ;SND6
FD1B : F9 1B                          ;PARAM6
FD1D : F9 06                          ;VECLD1
FD1F : F9 C4                          ;BONLDR
FD21 : F9 3B                          ;BONUS$
FD23 : F9 8A                          ;PLPRM1
FD25 : FA 0F                          ;START
FD27 : F9 4A                          ;PLANE
;*************************************;
; zero padding
FD29 : 00 
FD2A : 00 00 00 00 
FD2E : 00 00 00 00 
FD32 : 00 00 00 00 
FD36 : 00 00 00 00 
FD3A : 00 00 00 00 
FD3E : 00 00 00 00 
FD42 : 00 00 00 00 
FD46 : 00 00 00 00 
FD4A : 00 00 00 00 
FD4E : 00 00 00 00 
FD52 : 00 00 00 00 
FD56 : 00 00 00 00 
FD5A : 00 00 00 00 
FD5E : 00 00 00 00 
FD62 : 00 00 00 00 
FD66 : 00 00 00 00 
FD6A : 00 00 00 00 
FD6E : 00 00 00 00 
FD72 : 00 00 00 00 
FD76 : 00 00 00 00 
FD7A : 00 00 00 00 
FD7E : 00 00 00 00 
FD82 : 00 00 00 00 
FD86 : 00 00 00 00 
FD8A : 00 00 00 00 
FD8E : 00 00 00 00 
FD92 : 00 00 00 00 
FD96 : 00 00 00 00 
FD9A : 00 00 00 00 
FD9E : 00 00 00 00 
FDA2 : 00 00 00 00 
FDA6 : 00 00 00 00 
FDAA : 00 00 00 00 
FDAE : 00 00 00 00 
FDB2 : 00 00 00 00 
FDB6 : 00 00 00 00 
FDBA : 00 00 00 00 
FDBE : 00 00 00 00 
FDC2 : 00 00 00 00 
FDC6 : 00 00 00 00 
FDCA : 00 00 00 00 
FDCE : 00 00 00 00 
FDD2 : 00 00 00 00 
FDD6 : 00 00 00 00 
FDDA : 00 00 00 00 
FDDE : 00 00 00 00 
FDE2 : 00 00 00 00 
FDE6 : 00 00 00 00 
FDEA : 00 00 00 00 
FDEE : 00 00 00 00 
FDF2 : 00 00 00 00 
FDF6 : 00 00 00 00 
FDFA : 00 00 00 00 
FDFE : 00 00 00 00 
FE02 : 00 00 00 00 
FE06 : 00 00 00 00 
FE0A : 00 00 00 00 
FE0E : 00 00 00 00 
FE12 : 00 00 00 00 
FE16 : 00 00 00 00 
FE1A : 00 00 00 00 
FE1E : 00 00 00 00 
FE22 : 00 00 00 00 
FE26 : 00 00 00 00 
FE2A : 00 00 00 00 
FE2E : 00 00 00 00 
FE32 : 00 00 00 00 
FE36 : 00 00 00 00 
FE3A : 00 00 00 00 
FE3E : 00 00 00 00 
FE42 : 00 00 00 00 
FE46 : 00 00 00 00 
FE4A : 00 00 00 00 
FE4E : 00 00 00 00 
FE52 : 00 00 00 00 
FE56 : 00 00 00 00 
FE5A : 00 00 00 00 
FE5E : 00 00 00 00 
FE62 : 00 00 00 00 
FE66 : 00 00 00 00 
FE6A : 00 00 00 00 
FE6E : 00 00 00 00 
FE72 : 00 00 00 00 
FE76 : 00 00 00 00 
FE7A : 00 00 00 00 
FE7E : 00 00 00 00 
FE82 : 00 00 00 00 
FE86 : 00 00 00 00 
FE8A : 00 00 00 00 
FE8E : 00 00 00 00 
FE92 : 00 00 00 00 
FE96 : 00 00 00 00 
FE9A : 00 00 00 00 
FE9E : 00 00 00 00 
FEA2 : 00 00 00 00 
FEA6 : 00 00 00 00 
FEAA : 00 00 00 00 
FEAE : 00 00 00 00 
FEB2 : 00 00 00 00 
FEB6 : 00 00 00 00 
FEBA : 00 00 00 00 
FEBE : 00 00 00 00 
FEC2 : 00 00 00 00 
FEC6 : 00 00 00 00 
FECA : 00 00 00 00 
FECE : 00 00 00 00 
FED2 : 00 00 00 00 
FED6 : 00 00 00 00 
FEDA : 00 00 00 00 
FEDE : 00 00 00 00 
FEE2 : 00 00 00 00 
FEE6 : 00 00 00 00 
FEEA : 00 00 00 00 
FEEE : 00 00 00 00 
FEF2 : 00 00 00 00 
FEF6 : 00 00 00 00 
FEFA : 00 00 00 00 
FEFE : 00 00 00 00 
FF02 : 00 00 00 00 
FF06 : 00 00 00 00 
FF0A : 00 00 00 00 
FF0E : 00 00 00 00 
FF12 : 00 00 00 00 
FF16 : 00 00 00 00 
FF1A : 00 00 00 00 
FF1E : 00 00 00 00 
FF22 : 00 00 00 00 
FF26 : 00 00 00 00 
FF2A : 00 00 00 00 
FF2E : 00 00 00 00 
FF32 : 00 00 00 00 
FF36 : 00 00 00 00 
FF3A : 00 00 00 00 
FF3E : 00 00 00 00 
FF42 : 00 00 00 00 
FF46 : 00 00 00 00 
FF4A : 00 00 00 00 
FF4E : 00 00 00 00 
FF52 : 00 00 00 00 
FF56 : 00 00 00 00 
FF5A : 00 00 00 00 
FF5E : 00 00 00 00 
FF62 : 00 00 00 00 
FF66 : 00 00 00 00 
FF6A : 00 00 00 00 
FF6E : 00 00 00 00 
FF72 : 00 00 00 00 
FF76 : 00 00 00 00 
FF7A : 00 00 00 00 
FF7E : 00 00 00 00 
FF82 : 00 00 00 00 
FF86 : 00 00 00 00 
FF8A : 00 00 00 00 
FF8E : 00 00
FF90 : 00 00 00 00 
FF94 : 00 00 00 00 
FF98 : 00 00 00 00 
FF9C : 00 00 00 00 
FFA0 : 00 00 00 00 
FFA4 : 00 00 00 00 
FFA8 : 00 00 00 00 
FFAC : 00 00 00 00 
FFB0 : 00 00 00 00 
FFB4 : 00 00 00 00 
FFB8 : 00 00 00 00 
FFBC : 00 00 00 00 
FFC0 : 00 00 00 00 
FFC4 : 00 00 00 00 
FFC8 : 00 00 00 00 
FFCC : 00 00 00 00 
FFD0 : 00 00 00 00 
FFD4 : 00 00 00 00 
FFD8 : 00 00 00 00 
FFDC : 00 00 00 00 
FFE0 : 00 00 00 00 
FFE4 : 00 00 00 00 
FFE8 : 00 00 00 00 
FFEC : 00 00 00 00 
FFF0 : 00 00 00 00 
FFF4 : 00 00 00 00 
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FB 6B                          ;IRQ
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FB C6                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------






