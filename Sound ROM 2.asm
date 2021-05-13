        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Gorgar.716
        ;
        ;  Size:    2048 bytes
        ;  Checksum:  EC44
        ;  CRC-32:    C9103A68
        ;
        ;  Date:    Tue May 11 23:31:55 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;Pinball Sound ROM 2 Gorgar 1979 - 3 speech ROMS, first production pinball with speech (7 words)
        ;although a Disco Fever (Sys 3) 1978 prototype was the first game Williams engineered to have speech
        ;
        ;"Gorgar" "Me" "Speak" "Hear" "first"? "You" "Got" - monosyllabic.
        ;
        ;updated 13 May 2021
        ;
;
org  $F800
;
F800 : 99                             ;checksum byte
;*************************************;
;RESET power on
;*************************************;
;SETUP
F801 : 0F         sei                 ;set interrupt mask   
F802 : 8E 00 7F   lds  #$007F         ;load stack pointer 007F (#ENDRAM)
F805 : CE 04 00   ldx  #$0400         ;load X with addr 0400 PIA
F808 : 6F 01      clr  $01,x          ;clear X+01h 0401 PIA1 CR port A (ACCESS DDRA)
F80A : 6F 03      clr  $03,x          ;clear X+03h 0403 PIA1 CR port B (ACCESS DDRB)
F80C : 86 FF      ldaa  #$FF          ;load A with FFh
F80E : A7 00      staa  $00,x         ;store A in X+00h 0400 PIA1 PR/DDR port A out
F810 : C6 80      ldab  #$80          ;load B with 80h
F812 : E7 02      stab  $02,x         ;store B in X+02h 0402 PIA1 PR/DDR port B in
F814 : 86 37      ldaa  #$37          ;load A with 37h (CB2 low, IRQ allowed)
F816 : A7 03      staa  $03,x         ;store A in X+03h 0403 PIA1 CR port B
F818 : 86 3C      ldaa  #$3C          ;load A with 3Ch (CA2 set init high, no IRQs)
F81A : A7 01      staa  $01,x         ;store A in X+01h 0401 PIA1 CR port A
F81C : 97 55      staa  $55           ;store A in addr 55 (HI, start Random Generator)
F81E : 4F         clra                ;clear A
F81F : 97 4E      staa  $4E           ;store A in addr 4E (? FLG)
F821 : 97 4F      staa  $4F           ;store A in addr 4F (? FLG)
F823 : 97 53      staa  $53           ;store A in addr 53 (? FLG)
F825 : 97 54      staa  $54           ;store A in addr 54 (? FLG)
F827 : E7 02      stab  $02,x         ;store B in X+02h 0402 PIA1 port B sound select
F829 : 0E         cli                 ;clear interrupts I=0
;STDBY
F82A : 20 FE      bra  LF82A          ;branch always STDBY
;*************************************;
;Three Oscillator Sound Generator
;*************************************;
;PLAY:
F82C : DF 5C      stx  $5C            ;store X in addr 5C
F82E : CE F8 CC   ldx  #$F8CC         ;load X with F8CCh (DECAYZ)
F831 : DF 58      stx  $58            ;store X in addr 58
F833 : 86 80      ldaa  #$80          ;load A with 80h
;PLAY1 LF835:
F835 : D6 03      ldab  $03           ;load B with addr 30
F837 : 2A 09      bpl  LF842          ;branch N=0 PLAY3
F839 : D6 55      ldab  $55           ;load B with addr 55
F83B : 54         lsrb                ;left shift right B
F83C : 54         lsrb                ;left shift right B
F83D : 54         lsrb                ;left shift right B
F83E : 5C         incb                ;left shift right B
;PLAY2 LF83F count down B
F83F : 5A         decb                ;decr B
F840 : 26 FD      bne  LF83F          ;branch Z=0 PLAY2
;PLAY3 LF842:
F842 : 7A 00 08   dec  $0008          ;decr addr 0008
F845 : 27 4C      beq  LF893          ;branch Z=1 PLAY7
F847 : 7A 00 09   dec  $0009          ;decr addr 0009
F84A : 27 4C      beq  LF898          ;branch Z=1 PLAY8
F84C : 7A 00 0A   dec  $000A          ;decr addr 000A
F84F : 27 4C      beq  LF89D          ;branch Z=1 PLAY9
F851 : 7A 00 0B   dec  $000B          ;decr addr 000B
F854 : 26 DF      bne  LF835          ;branch Z=0 PLAY1
F856 : D6 03      ldab  $03           ;load B with addr 03
F858 : 27 DB      beq  LF835          ;branch Z=1 PLAY1
F85A : C4 7F      andb  #$7F          ;and B with 7Fh
F85C : D7 0B      stab  $0B           ;store B in addr 0B
F85E : D6 55      ldab  $55           ;load B with addr 55
F860 : 58         aslb                ;arith shift left B
F861 : DB 55      addb  $55           ;add B with addr 55
F863 : CB 0B      addb  #$0B          ;add B with 0Bh
F865 : D7 55      stab  $55           ;store B in addr 55
F867 : 7A 00 1B   dec  $001B          ;decr addr 001B
F86A : 26 0E      bne  LF87A          ;branch Z=0 PLAY6
F86C : D6 0F      ldab  $0F           ;load B with addr 0F
F86E : D7 1B      stab  $1B           ;store B with addr 1B
F870 : DE 58      ldx  $58            ;load X with addr 58
F872 : 09         dex                 ;decr X
F873 : 8C F8 C5   cpx  #$F8C5         ;compare X with F8C5h (54h)
F876 : 27 49      beq  LF8C1          ;branch Z=1 PLAY12
F878 : DF 58      stx  $58            ;store X in addr 58
;PLAY6 LF87A:
F87A : D6 55      ldab  $55           ;load B with addr 55
F87C : 2B 06      bmi  LF884          ;branch N=1 PLAY6A
F87E : D4 07      andb  $07           ;and B with addr 07
F880 : C4 7F      andb  #$7F          ;and B with 7Fh
F882 : 20 05      bra  LF889          ;branch always PLAY6B
;PLAY6A LF884:
F884 : D4 07      andb  $07           ;and B with addr 07
F886 : C4 7F      andb  #$7F          ;and B with 7Fh
F888 : 50         negb                ;negate B (complement 2s)
;PLAY6B LF889:
F889 : 36         psha                ;push A into stack then SP-1
F88A : 1B         aba                 ;add B to A
F88B : 16         tab                 ;transfer A to B
F88C : 32         pula                ;SP+1 pull stack into A
;PLYLP1 LF88D:
F88D : DE 58      ldx  $58            ;load X with addr 58
F88F : AD 00      jsr  $00,x          ;jump sub X+00h
F891 : 20 A2      bra  LF835          ;branch always PLAY1
;PLAY7 LF893:
F893 : CE 00 00   ldx  #$0000         ;load X with 0000h
F896 : 20 08      bra  LF8A0          ;branch always PLAY10
;PLAY8 LF898:
F898 : CE 00 01   ldx  #$0001         ;load X with 0001h
F89B : 20 03      bra  LF8A0          ;branch always PLAY10
;PLAY9 LF89D:
F89D : CE 00 02   ldx  #$0002         ;load X with 0002h
;PLAY10 LF8A0:
F8A0 : 6D 18      tst  $18,x          ;test X+18h
F8A2 : 27 12      beq  LF8B6          ;branch Z=1 PLAY11
F8A4 : 6A 18      dec  $18,x          ;decr X+18h
F8A6 : 26 0E      bne  LF8B6          ;branch Z=0 PLAY11
F8A8 : E6 0C      ldab  $0C,x         ;load B with X+0C;
F8AA : E7 18      stab  $18,x         ;store B in addr X+18h
F8AC : E6 00      ldab  $00,x         ;load B with X+00h
F8AE : EB 10      addb  $10,x         ;add B with X+10h
F8B0 : E1 14      cmpb  $14,x         ;compare B with X+14h
F8B2 : 27 0D      beq  LF8C1          ;branch Z=1 PLAY12
F8B4 : E7 00      stab  $00,x         ;store B in X+00h
;PLAY11 LF8B6:
F8B6 : E6 00      ldab  $00,x         ;load B with X+00h
F8B8 : E7 08      stab  $08,x         ;store B in X+08h
F8BA : AB 04      adda  $04,x         ;add A with X+04h
F8BC : 60 04      neg  $04,x          ;negate X+04h (complement 2s)
F8BE : 16         tab                 ;transfer A to B
F8BF : 20 CC      bra  LF88D          ;branch always PLYLP1
;PLAY12 LF8C1:
F8C1 : DE 5C      ldx  $5C            ;load X with addr 05
F8C3 : 39         rts                 ;return subroutine
;*************************************;
;Echo And Decay Routine 
;*************************************;
;RDECAY
F8C4 : 54         lsrb                ;logical shift right B(0xxx xxxx -> x) C
F8C5 : 54         lsrb                ;logical shift right B(00xx xxxx -> x) C
F8C6 : 54         lsrb                ;logical shift right B(000x xxxx -> x) C
F8C7 : 54         lsrb                ;logical shift right B(0000 xxxx -> x) C
F8C8 : 54         lsrb                ;logical shift right B(0000 0xxx -> x) C
F8C9 : 54         lsrb                ;logical shift right B(0000 00xx -> x) C
F8CA : 54         lsrb                ;logical shift right B(0000 000x -> x) C
F8CB : 54         lsrb                ;logical shift right B(0000 0000 -> x) C
;DECAYZ
F8CC : F7 04 00   stab  $0400         ;store B in DAC output SOUND
F8CF : 39         rts                 ;return subroutine
;*************************************;
;3 Oscillator Calling Routines
;*************************************;
;THNDR
F8D0 : CE FD 12   ldx  #$FD12         ;load X with FD12h VEC01(THUNDER SOUND)
;THNDR1
F8D3 : C6 1C      ldab  #$1C          ;load B with 1Ch(NEED TO TRANSFER)
F8D5 : BD F9 18   jsr  LF918          ;jump sub TRANS(28 BYTES FOR PLAY)
F8D8 : BD F8 2C   jsr  LF82C          ;jump sub PLAY
F8DB : 39         rts                 ;return subroutine
;SND2
F8DC : CE FD 2E   ldx  #$FD2E         ;load X with FD2Eh VEC02
F8DF : 20 F2      bra  LF8D3          ;branch always THNDR1
;SND3
F8E1 : CE FD 4A   ldx  #$FD4A         ;load X with FD4Ah VEC03
F8E4 : 20 ED      bra  LF8D3          ;branch always THNDR1
;*************************************;
;Lightning+Appear Noise Routine version
;*************************************;
;LITEN
F8E6 : C6 01      ldab  #$01          ;load B with 01h
F8E8 : D7 00      stab  $00           ;store B in addr 00
F8EA : C6 CF      ldab  #$CF          ;load B with CFh
F8EC : D7 02      stab  $02           ;store B in addr 02
;LITE0
F8EE : C6 03      ldab  #$03          ;load B with 03h
F8F0 : D7 01      stab  $01           ;store B in addr 01
;LITE1
F8F2 : D6 02      ldab  $02           ;load B in addr 02
F8F4 : 96 56      ldaa  $56           ;load A with addr 56
F8F6 : 44         lsra                ;logic shift right A
F8F7 : 44         lsra                ;logic shift right A
F8F8 : 44         lsra                ;logic shift right A
F8F9 : 98 56      eora  $56           ;exclusive OR with value in addr 56 (LO)
F8FB : 44         lsra                ;logic shift right A
F8FC : 76 00 55   ror  $0055          ;rotate right in addr 0055 (HI)
F8FF : 76 00 56   ror  $0056          ;rotate right in addr 0056 (LO)
F902 : 24 01      bcc  LF905          ;branch C=0 LITE2
F904 : 53         comb                ;complement 1s B
;LITE2
F905 : F7 04 00   stab  $0400         ;store B in DAC output SOUND
F908 : D6 00      ldab  $00           ;load B with addr 00
;LITE3 - count down B
F90A : 5A         decb                ;decr B
F90B : 26 FD      bne  LF90A          ;branch Z=0 LITE3
;
F90D : 7A 00 01   dec  $0001          ;decr addr 0001
F910 : 26 E0      bne  LF8F2          ;branch Z=0 LITE1
F912 : 7C 00 00   inc  $0000          ;incr addr 0000
F915 : 26 D7      bne  LF8EE          ;branch Z=0 LITE0
F917 : 39         rts                 ;return subroutine
;*************************************;
;Parameter Transfer
;*************************************;
;TRANS:
F918 : 36         psha                ;push A into stack then SP-1
;TRANS1 
F919 : A6 00      ldaa  $00,x         ;load A with X+00h
F91B : DF 5C      stx  $5C            ;store X in addr 5C
F91D : DE 5E      ldx  $5E            ;load X with addr 5E
F91F : A7 00      staa  $00,x         ;store A in X+00h
F921 : 08         inx                 ;incr X
F922 : DF 5E      stx  $5E            ;store X in addr 5E
F924 : DE 5C      ldx  $5C            ;load X with addr 5C
F926 : 08         inx                 ;incr X
F927 : 5A         decb                ;decr B
F928 : 26 EF      bne  LF919          ;branch Z=0 TRANS1
F92A : 32         pula                ;SP+1 pull stack into A
F92B : 39         rts                 ;return subroutine
;*************************************;
; uses NOTTBL,SNDTBL,WAVFRM, named from Flash ROM
;*************************************;
;SYNTH6
F92C : 84 0F      anda  #$0F          ;and A with 0Fh
;SN6WT
F92E : 27 FE      beq  LF92E          ;branch Z=1 SN6WT
F930 : CE FC F4   ldx  #$FCF4         ;load X with FCF4h NOTTBL
F933 : BD FC 55   jsr  LFC55          ;jump sub ADDX
F936 : A6 00      ldaa  $00,x         ;load A with X+00h
F938 : 97 18      staa  $18           ;store A in addr 18
F93A : CE FC E4   ldx  #$FCE4         ;load X with FCE4h SNDTBL
F93D : C6 10      ldab  #$10          ;load B with 10h
F93F : BD F9 18   jsr  LF918          ;jump sub TRANS
F942 : CE FD 04   ldx  #$FD04         ;load X with FD04h WAVFRM
F945 : E6 00      ldab  $00,x         ;load B with X+00h
;SN6LP1
F947 : D7 1A      stab  $1A           ;store B in addr 1A
F949 : DF 5E      stx  $5E            ;store X in addr 5E
;SN6LP2
F94B : CE 00 00   ldx  #$0000         ;load X with 0000h
F94E : C6 08      ldab  #$08          ;load B with 08h
F950 : D7 19      stab  $19           ;store B in addr 19
;SN6LP3
F952 : A6 00      ldaa  $00,x         ;load A with X+00h
F954 : D6 18      ldab  $18           ;load B with addr 18
F956 : 7D 00 1A   tst  $001A          ;test addr 001A
F959 : 26 06      bne  LF961          ;branch Z=0 SYN61
F95B : A0 08      suba  $08,x         ;sub A with addr X+08h
F95D : A7 00      staa  $00,x         ;store A in addr X+00h
F95F : C0 03      subb  #$03          ;sub B with 03h
;SYN61
F961 : 08         inx                 ;incr X
F962 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
;SN6LP4 - count down B
F965 : 5A         decb                ;decr B
F966 : 26 FD      bne  LF965          ;branch Z=0 SN6LP4
;
F968 : 7A 00 19   dec  $0019          ;decr addr 0019
F96B : 26 E5      bne  LF952          ;branch Z=0 SN6LP3
;
F96D : 7A 00 1A   dec  $001A          ;decr addr 001A
F970 : 2A D9      bpl  LF94B          ;branch N=0 SN6LP2
;
F972 : DE 5E      ldx  $5E            ;load X with addr 5E
F974 : 08         inx                 ;incr X
F975 : E6 00      ldab  $00,x         ;load B with X+00h
F977 : 26 CE      bne  LF947          ;branch Z=0 SN6LP1
;SYN6X 
F979 : 20 FE      bra  LF979          ;branch always SYN6X
;*************************************;
;Knocker routine
;*************************************;
;KNOCK:
F97B : 7F 04 02   clr  $0402          ;clear PIA
F97E : CE 40 00   ldx  #$4000         ;load X with 4000h
;KNKLP1 - count down X timer
F981 : 09         dex                 ;decr X
F982 : 26 FD      bne  LF981          ;branch Z=0 KNKLP1
;
F984 : CE FD 66   ldx  #$FD66         ;load X with FD66h KNKTAB
F987 : DF 63      stx  $63            ;store X in addr 63(SNDTMP)
;SQLP - main loop
F989 : DE 63      ldx  $63            ;load X with addr 63(SNDTMP)
F98B : A6 00      ldaa  $00,x         ;load A with X+00h(GET PERIOD)
F98D : 27 33      beq  LF9C2          ;branch Z=1 END (END ON ZERO)
F98F : E6 01      ldab  $01,x         ;load B with X+01h(GET AMP)
F991 : C4 F0      andb  #$F0          ;and B with F0h
F993 : D7 62      stab  $62           ;store B in addr 62(AMP)
F995 : E6 01      ldab  $01,x         ;load B with X+01h
F997 : 08         inx                 ;incr X
F998 : 08         inx                 ;incr X
F999 : DF 63      stx  $63            ;store X in addr 63(SNDTMP) (SAVE X)
F99B : 97 61      staa  $61           ;store A in addr 61(PERIOD)
F99D : C4 0F      andb  #$0F          ;and B with 0Fh
;LP0 - 2nd loop
F99F : 96 62      ldaa  $62           ;load A with addr 62(AMP)
F9A1 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F9A4 : 96 61      ldaa  $61           ;load A with addr 61(PERIOD)
;LP1 
F9A6 : CE 00 05   ldx  #$0005         ;load X with 0005h(DELAY)
;LP11 - count down X delay
F9A9 : 09         dex                 ;decr X
F9AA : 26 FD      bne  LF9A9          ;branch Z=0 LP11
;
F9AC : 4A         deca                ;decr A
F9AD : 26 F7      bne  LF9A6          ;branch Z=0 LP1
;
F9AF : 7F 04 00   clr  $0400          ;clear DAC output SOUND
F9B2 : 96 61      ldaa  $61           ;load A with addr 61(PERIOD)
;LP2 
F9B4 : CE 00 05   ldx  #$0005         ;load X with 0005h(DELAY)
;LP22 - count down X delay
F9B7 : 09         dex                 ;decr X
F9B8 : 26 FD      bne  LF9B7          ;branch Z=0 LP22
;
F9BA : 4A         deca                ;decr A
F9BB : 26 F7      bne  LF9B4          ;branch Z=0 LP2
;
F9BD : 5A         decb                ;decr B
F9BE : 26 DF      bne  LF99F          ;branch Z=0 LP0
;
F9C0 : 20 C7      bra  LF989          ;branch always SQLP
;END 
F9C2 : 86 80      ldaa  #$80          ;load A with 80h
F9C4 : B7 04 02   staa  $0402         ;store A in PIA sound select
F9C7 : 39         rts                 ;return subroutine
;*************************************;
;parameter routine
;*************************************;
;PARAM1 
F9C8 : 96 4E      ldaa  $4E           ;load A with addr 4E
F9CA : 26 0F      bne  LF9DB          ;branch Z=0 PRM11
;PM1LP1 - loop
F9CC : 7F 00 4E   clr  $004E          ;clear addr 004E
F9CF : 86 16      ldaa  #$16          ;load A with 16h
F9D1 : 97 51      staa  $51           ;store A in addr 51
F9D3 : 86 0B      ldaa  #$0B          ;load A with 0Bh
F9D5 : 97 50      staa  $50           ;store A in addr 50
F9D7 : 97 52      staa  $52           ;store A in addr 52
F9D9 : 20 10      bra  LF9EB          ;branch always PRM13
;PRM11 
F9DB : 81 1D      cmpa  #$1D          ;compare A with 1Dh
F9DD : 22 ED      bhi  LF9CC          ;branch C+Z=0 PM1LP1
;
F9DF : 96 50      ldaa  $50           ;load A with addr 50
F9E1 : 27 05      beq  LF9E8          ;branch Z=1 PRM12
F9E3 : 4A         deca                ;decr A
F9E4 : 97 50      staa  $50           ;store A in addr 50
F9E6 : 20 03      bra  LF9EB          ;branch always PRM13
;PRM12 
F9E8 : 7A 00 51   dec  $0051          ;decr addr 0051
;PRM13 
F9EB : 7C 00 4E   inc  $004E          ;incr addr 004E
F9EE : 39         rts                 ;return subroutine
;*************************************;
;add A and comparator parameter routine
;*************************************;
;ADDCOM
F9EF : 96 4F      ldaa  $4F           ;load A with addr 4F
F9F1 : 8B 04      adda  #$04          ;add A with 04h
F9F3 : 97 4F      staa  $4F           ;store A in addr 4F
F9F5 : 81 7D      cmpa  #$7D          ;compare A with 7Dh
F9F7 : 23 04      bls  LF9FD          ;branch C+Z=1 ADCOMX
F9F9 : 86 01      ldaa  #$01          ;load A with 01h
F9FB : 97 4F      staa  $4F           ;store A in addr 4F
;ADCOMX:
F9FD : 39         rts                 ;return subroutine
;*************************************;
;background end routine ? 
;*************************************;
;BGEND
F9FE : 7F 00 4E   clr  $004E          ;(BG1FLG)
FA01 : 7F 00 4F   clr  $004F          ;(BG2FLG)
FA04 : 39         rts                 ;return subroutine
;*************************************;
;data loader #1 and params
;*************************************;
;DL1PRM 
FA05 : CE 00 0D   ldx  #$000D         ;load X with addr 000D
FA08 : DF 5E      stx  $5E            ;store X in addr 5E
FA0A : CE FF 4D   ldx  #$FF4D         ;load X with FF4Dh (data tables)
FA0D : DF 5C      stx  $5C            ;store X in 5C
;DL1LP1
FA0F : DE 5C      ldx  $5C            ;load X with addr 5C
FA11 : A6 00      ldaa  $00,x         ;load A with X+00h
FA13 : 08         inx                 ;incr X
FA14 : DF 5C      stx  $5C            ;store X in addr 5C
FA16 : DE 5E      ldx  $5E            ;load X with addr 5E
FA18 : 4D         tsta                ;test A
FA19 : 27 09      beq  LFA24          ;branch Z=1 DL12
FA1B : D6 4F      ldab  $4F           ;load B with addr 4F
FA1D : 10         sba                 ;A=A-B
FA1E : 27 02      beq  LFA22          ;branch Z=1 DL11
FA20 : 2A 02      bpl  LFA24          ;branch N=0 DL12
;DL11 
FA22 : 86 01      ldaa  #$01          ;load A with 01h
;DL12
FA24 : 08         inx                 ;incr X
FA25 : DF 5E      stx  $5E            ;store X in addr 5E
FA27 : A7 00      staa  $00,x         ;store A in X+00h
FA29 : 26 E4      bne  LFA0F          ;branch Z=0 DL1LP1
;DL1LP2 
FA2B : 86 17      ldaa  #$17          ;load A with 17h
FA2D : BD FA 7F   jsr  LFA7F          ;jump sub DL4PRM
FA30 : 20 F9      bra  LFA2B          ;branch always DL1LP2
;*************************************;
;data loader #2 and params
;*************************************;
;DL2PRM
FA32 : 96 52      ldaa  $52           ;load A with addr 52
FA34 : 26 06      bne  LFA3C          ;branch Z=0 DL2LP2
;DL2LP1 - main loop
FA36 : 96 50      ldaa  $50           ;load A with addr 50
FA38 : 27 0D      beq  LFA47          ;branch Z=1 DL21
FA3A : 97 52      staa  $52           ;store A in addr 52
;DL2LP2 - decr 0052
FA3C : CE 32 00   ldx  #$3200         ;load X with 3200h (timer value)
;DL2LP3 - count down X
FA3F : 09         dex                 ;decr X
FA40 : 26 FD      bne  LFA3F          ;branch Z=0 DL2LP3
;
FA42 : 7A 00 52   dec  $0052          ;decr addr 0052
FA45 : 26 F5      bne  LFA3C          ;branch Z=0 DL2LP2
;
;DL21 
FA47 : CE FE 16   ldx  #$FE16         ;load X with FE16h (data tables)
FA4A : 8D 07      bsr  LFA53          ;branch sub DL3PRM
FA4C : CE FE 5E   ldx  #$FE5E         ;load X with FE5Eh (data tables)
FA4F : 8D 02      bsr  LFA53          ;branch sub DL3PRM
FA51 : 20 E3      bra  LFA36          ;branch always DL2LP1
;*************************************;
;data loader #3 and params, jump to synth1
;*************************************;
;DL3PRM 
FA53 : C6 01      ldab  #$01          ;load B with 01h
FA55 : D7 04      stab  $04           ;store B in addr 04
FA57 : 86 01      ldaa  #$01          ;load A with 01h
FA59 : 97 0D      staa  $0D           ;store A in addr 0D
FA5B : 4F         clra                ;clear A
FA5C : 97 06      staa  $06           ;store A in addr 06
FA5E : 97 53      staa  $53           ;store A in addr 53
FA60 : 97 05      staa  $05           ;store A in addr 05
FA62 : DF 0A      stx  $0A            ;store X in addr 0A
FA64 : 86 48      ldaa  #$48          ;load A with 48h
FA66 : BD FC 55   jsr  LFC55          ;jump sub ADDX
FA69 : DF 01      stx  $01            ;store X in addr 01
FA6B : CE 00 0E   ldx  #$000E         ;load X with 000Eh
FA6E : DF 5E      stx  $5E            ;store X in addr 5E
FA70 : D6 51      ldab  $51           ;load B with addr 51
FA72 : CE FF 37   ldx  #$FF37         ;load X with FF37h (data tables)
FA75 : BD F9 18   jsr  LF918          ;jump sub TRANS
FA78 : DE 5E      ldx  $5E            ;load X with addr 5E
FA7A : 6F 00      clr  $00,x          ;clear addr X+00h
FA7C : 7E FB 4A   jmp  LFB4A          ;jump SYNTH1
;*************************************;
;data loader #4 and params
;*************************************;
;DL4PRM 
FA7F : 97 00      staa  $00           ;store A in addr 00
FA81 : 16         tab                 ;transfer A to B
FA82 : 1B         aba                 ;A=A+B
FA83 : 1B         aba                 ;A=A+B
FA84 : CE FE A3   ldx  #$FEA3         ;load X with FEA3h (data table)
FA87 : BD FC 55   jsr  LFC55          ;jump sub ADDX
FA8A : A6 00      ldaa  $00,x         ;load A with X+00h
FA8C : 16         tab                 ;transfer A to B
FA8D : 84 0F      anda  #$0F          ;and A with 0Fh
FA8F : 97 04      staa  $04           ;store A in addr 04
FA91 : 54         lsrb                ;logic shift right B
FA92 : 54         lsrb                ;logic shift right B
FA93 : 54         lsrb                ;logic shift right B
FA94 : 54         lsrb                ;logic shift right B
FA95 : D7 03      stab  $03           ;store B in addr 03
FA97 : 5F         clrb                ;clear B
FA98 : A6 01      ldaa  $01,x         ;load A with X+01h
FA9A : 2A 08      bpl  LFAA4          ;branch N=0 DL42
FA9C : 5C         incb                ;incr B
FA9D : 85 40      bita  #$40          ;bit test A with 40h
FA9F : 27 01      beq  LFAA2          ;branch Z=1 DL41
FAA1 : 50         negb                ;negate B (complement 2s)
;DL41 
FAA2 : D7 07      stab  $07           ;store B in addr 07
;DL42 
FAA4 : D7 06      stab  $06           ;store B in addr 06
FAA6 : 16         tab                 ;transfer A to B
FAA7 : 54         lsrb                ;logic shift right B
FAA8 : 54         lsrb                ;logic shift right B
FAA9 : 54         lsrb                ;logic shift right B
FAAA : 54         lsrb                ;logic shift right B
FAAB : C4 03      andb  #$03          ;and B with 03h
FAAD : D7 05      stab  $05           ;store B in addr 05
FAAF : E6 02      ldab  $02,x         ;load B with X+02h
FAB1 : 84 0F      anda  #$0F          ;and A with 0Fh
FAB3 : 97 60      staa  $60           ;store A in addr 60
FAB5 : CE FD 84   ldx  #$FD84         ;load X with FD84h (data tables)
;DL4LP1 - count down 0060 + inca
FAB8 : 7A 00 60   dec  $0060          ;decr addr 0060
FABB : 2B 08      bmi  LFAC5          ;branch N=1 DL5PRM
FABD : A6 00      ldaa  $00,x         ;load A with X+00h
FABF : 4C         inca                ;incr A
FAC0 : BD FC 55   jsr  LFC55          ;jump sub ADDX
FAC3 : 20 F3      bra  LFAB8          ;branch always DL4LP1
;*************************************;
;data loader #5 and params bne to synth1 (early version of GWave loader?)
;*************************************;
;DL5PRM 
FAC5 : DF 08      stx  $08            ;store X in addr 08
FAC7 : 17         tba
FAC8 : CE FE EB   ldx  #$FEEB         ;load X with FEEBh (data table)
FACB : BD FC 55   jsr  LFC55          ;jump sub ADDX
FACE : 96 00      ldaa  $00           ;load A with addr 00
FAD0 : 81 17      cmpa  #$17          ;compare A with 17h
FAD2 : 27 2F      beq  LFB03          ;branch Z=1 DL54
FAD4 : 96 53      ldaa  $53           ;load A with addr 53
FAD6 : 27 05      beq  LFADD          ;branch Z=1 DL51
FAD8 : 4A         deca                ;decr A
FAD9 : 27 28      beq  LFB03          ;branch Z=1 DL54
FADB : 97 53      staa  $53           ;store A in addr 53
;DL51
FADD : 96 54      ldaa  $54           ;load A with addr 54
FADF : 27 0B      beq  LFAEC          ;branch Z=1 DL53
FAE1 : 4A         deca                ;decr A
FAE2 : 26 06      bne  LFAEA          ;branch Z=0 DL52
FAE4 : 96 0D      ldaa  $0D           ;load A with addr 0D
FAE6 : 26 62      bne  LFB4A          ;branch Z=0 SYNTH1
FAE8 : 20 19      bra  LFB03          ;branch always DL54
;DL52 
FAEA : 97 54      staa  $54           ;store A in addr 54
;DL53
FAEC : DF 5E      stx  $5E            ;store X in addr 5E
FAEE : CE 00 0D   ldx  #$000D         ;load X with 000Dh
FAF1 : DF 5C      stx  $5C            ;store X in addr 5C
;DL5LP1 - incr X and store loop
FAF3 : DE 5E      ldx  $5E            ;load X with addr 5E
FAF5 : A6 00      ldaa  $00,x         ;load A with X+00h
FAF7 : 08         inx                 ;incr X
FAF8 : DF 5E      stx  $5E            ;store X in addr 5E
FAFA : DE 5C      ldx  $5C            ;load X with addr 5C
FAFC : 08         inx                 ;incr X
FAFD : DF 5C      stx  $5C            ;store X in addr 5C
FAFF : A7 00      staa  $00,x         ;store A in X+00h
FB01 : 26 F0      bne  LFAF3          ;branch Z=0 DL5LP1
;
;DL54 
FB03 : 96 03      ldaa  $03           ;load A with addr 03
FB05 : 97 0D      staa  $0D           ;store A in addr 0D
FB07 : CE 00 2C   ldx  #$002C         ;load X with 002Ch
FB0A : DF 0A      stx  $0A            ;store X in addr 0A
FB0C : 96 06      ldaa  $06           ;load A with addr 06
FB0E : 27 0E      beq  LFB1E          ;branch Z=1 PARAM2
FB10 : CE 00 0E   ldx  #$000E         ;load X with 000Eh
;DL5LP2 - load and incr loop
FB13 : A6 00      ldaa  $00,x         ;load A with X+00h
FB15 : 27 07      beq  LFB1E          ;branch Z=1 PARAM2
FB17 : 9B 07      adda  $07           ;add A with addr 07
FB19 : A7 00      staa  $00,x         ;store A in addr X+00h
FB1B : 08         inx                 ;incr X
FB1C : 20 F5      bra  LFB13          ;branch always DL5LP2
;*************************************;
;params, thru to synth1
;*************************************;
;PARAM2 
FB1E : CE 00 2C   ldx  #$002C         ;load X with 002Ch
FB21 : DF 5E      stx  $5E            ;store X in addr 5E
FB23 : DE 08      ldx  $08            ;load X with addr 08
FB25 : A6 00      ldaa  $00,x         ;load A with X+00h
FB27 : 08         inx                 ;incr X
FB28 : DF 5A      stx  $5A            ;store X in addr 5A
FB2A : CE 00 2C   ldx  #$002C         ;load X with 002C
FB2D : BD FC 55   jsr  LFC55          ;jump sub ADDX
FB30 : DF 01      stx  $01            ;store X in addr 01
;PM2LP1 
FB32 : DE 5A      ldx  $5A            ;load X with addr 5A
FB34 : A6 00      ldaa  $00,x         ;load A with X+00h
FB36 : 08         inx                 ;incr X
FB37 : DF 5A      stx  $5A            ;store X in addr 5A
FB39 : DE 5E      ldx  $5E            ;load X with addr 5E
FB3B : A7 00      staa  $00,x         ;store A in addr X+00h
FB3D : 44         lsra                ;logic shift right A
FB3E : 44         lsra                ;logic shift right A
FB3F : 44         lsra                ;logic shift right A
FB40 : 44         lsra                ;logic shift right A
FB41 : A7 10      staa  $10,x         ;store A in addr X+10h
FB43 : 08         inx                 ;incr X
FB44 : DF 5E      stx  $5E            ;store X in addr 5E
FB46 : 9C 01      cpx  $01            ;compare X with addr 01
FB48 : 26 E8      bne  LFB32          ;branch Z=0 PM2LP1, else fall thru to synth1
;*************************************;
;synth type not in other ROMs, 4 loops, 1 output
;*************************************;
;SYNTH1 
FB4A : CE 00 0E   ldx  #$000E         ;load X with addr 000E
FB4D : DF 5C      stx  $5C            ;store X in addr 5C
;SN1LP1 
FB4F : DE 5C      ldx  $5C            ;load X with addr 5C
FB51 : A6 00      ldaa  $00,x         ;load A with X+00h
FB53 : 97 0C      staa  $0C           ;store A in addr 0C
FB55 : 27 22      beq  LFB79          ;branch Z=1 PARAM3
FB57 : D6 04      ldab  $04           ;load B with addr 04
FB59 : 7C 00 5D   inc  $005D          ;incr addr 005D
;SN1LP2 
FB5C : DE 0A      ldx  $0A            ;load X with addr 0A
;SN1LP3 
FB5E : 96 0C      ldaa  $0C           ;load A with addr 0C
;SN1LP4
FB60 : 4A         deca                ;decr A
FB61 : 26 FD      bne  LFB60          ;branch Z=0 SN1LP4
FB63 : A6 00      ldaa  $00,x         ;load A with X+00h
FB65 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
FB68 : 08         inx                 ;incr X
FB69 : 9C 01      cpx  $01            ;compare X with addr 01
FB6B : 26 F1      bne  LFB5E          ;branch Z=0 SN1LP3
FB6D : 5A         decb                ;decr B
FB6E : 27 DF      beq  LFB4F          ;branch Z=1 SN1LP1
;
FB70 : 08         inx                 ;incr X (4 cycles)
FB71 : 09         dex                 ;decr X (4 cycles)
FB72 : 08         inx                 ;incr X (4 cycles)
FB73 : 09         dex                 ;decr X (4 cycles)
FB74 : 01         nop                 ;nop (2 cycles)
FB75 : 01         nop                 ;nop (2 cycles)
FB76 : 01         nop                 ;nop (2 cycles) (sync 22 cycles)
FB77 : 20 E3      bra  LFB5C          ;branch always SN1LP2
;*************************************;
;param
;*************************************;
;PARAM3 
FB79 : D6 05      ldab  $05           ;load B with addr 05
FB7B : 27 12      beq  LFB8F          ;branch Z=1 PRM31
;PM3LP1 
FB7D : CE 00 2C   ldx  #$002C         ;load X with 002Ch
;PM3LP2 
FB80 : A6 00      ldaa  $00,x         ;load A with X+00h
FB82 : A0 10      suba  $10,x         ;sub A with X+10h
FB84 : A7 00      staa  $00,x         ;store A in X+00h
FB86 : 08         inx                 ;incr X
FB87 : 8C 00 3C   cpx  #$003C         ;compare X with addr 003C
FB8A : 26 F4      bne  LFB80          ;branch Z=0 PM3LP2
;
FB8C : 5A         decb                ;decr B
FB8D : 26 EE      bne  LFB7D          ;branch Z=0 PM3LP1
;PRM31 
FB8F : 96 54      ldaa  $54           ;load A with addr 54
FB91 : 27 04      beq  LFB97          ;branch Z=1 PARAM4
FB93 : 7A 00 0D   dec  $000D          ;decr addr 000D
FB96 : 39         rts                 ;return subroutine
;*************************************;
;param, to synth1
;*************************************;
;PARAM4
FB97 : 7A 00 0D   dec  $000D          ;decr addr 000D
FB9A : 26 AE      bne  LFB4A          ;branch Z=0 SYNTH1
FB9C : 96 53      ldaa  $53           ;load A with addr 53
FB9E : 26 07      bne  LFBA7          ;branch Z=0 PRM41
FBA0 : 96 06      ldaa  $06           ;load A with addr 06
FBA2 : 27 03      beq  LFBA7          ;branch Z=1 PRM41
FBA4 : 7E FB 03   jmp  LFB03          ;jump DL54
;PRM41 
FBA7 : 39         rts                 ;return subroutine
;*************************************;
;Interrupt Processing
;*************************************;
;IRQ
FBA8 : 8E 00 7F   lds  #$007F         ;load SP with value 007Fh (#ENDRAM)
FBAB : CE F8 CC   ldx  #$F8CC         ;load X with F8CCh (DECAYZ -stab 0400)
FBAE : DF 58      stx  $58            ;store X in addr 58
FBB0 : B6 04 02   ldaa  $0402         ;load A with PIA sound select
FBB3 : BD FC CA   jsr  LFCCA          ;jump sub SETMEM
FBB6 : C6 80      ldab  #$80          ;load B with 80h
FBB8 : F7 04 02   stab  $0402         ;store B in PIA sound select
FBBB : 43         coma                ;complement 1s A (INVERT SELECT)
FBBC : 84 7F      anda  #$7F          ;and A with 7Fh (MASK)
FBBE : 16         tab                 ;transfer A to B
FBBF : 36         psha                ;push A into stack SP-1
FBC0 : C4 1F      andb  #$1F          ;and B with 1Fh (MASK)
FBC2 : C1 10      cmpb  #$10          ;compare B with 10h
FBC4 : 27 4A      beq  LFC10          ;branch Z=1 IRQ4
FBC6 : 84 5F      anda  #$5F          ;and A with 5Fh
FBC8 : 5F         clrb                ;clear B
FBC9 : 81 06      cmpa  #$06          ;compare A with 06h
FBCB : 26 06      bne  LFBD3          ;branch Z=0 IRQ1
FBCD : D6 53      ldab  $53           ;load B with addr 53
FBCF : 26 02      bne  LFBD3          ;branch Z=0 IRQ1
FBD1 : C6 02      ldab  #$02          ;load B with 02h
;IRQ1 
FBD3 : D7 53      stab  $53           ;store B in addr 53
FBD5 : 5F         clrb                ;clear B
FBD6 : 81 08      cmpa  #$08          ;compare A with 08h
FBD8 : 26 06      bne  LFBE0          ;branch Z=0 IRQ2
FBDA : D6 54      ldab  $54           ;load B with addr 54
FBDC : 26 02      bne  LFBE0          ;branch Z=0 IRQ2
FBDE : C6 02      ldab  #$02          ;load B with 02h
;IRQ2 
FBE0 : D7 54      stab  $54           ;store B in addr 54
FBE2 : 32         pula                ;SP+1 pull stack into A
FBE3 : 85 20      bita  #$20          ;bit test A with 20h
FBE5 : 27 1B      beq  LFC02          ;branch Z=1 IRQ3
FBE7 : 16         tab                 ;transfer A to B
FBE8 : C4 1F      andb  #$1F          ;and B with 1Fh
FBEA : C1 17      cmpb  #$17          ;compare B with 17h
FBEC : 23 14      bls  LFC02          ;branch C+Z=1 IRQ3
FBEE : 97 00      staa  $00           ;store A in addr 00
FBF0 : F6 DE C0   ldab  $DEC0         ;load B with addr DECO ("C" in Copyright message)
FBF3 : C1 43      cmpb  #$43          ;compare B with 43h (has found "C")
FBF5 : 26 0B      bne  LFC02          ;branch Z=0 IRQ3 (NO, go irq)
FBF7 : BD DE EE   jsr  LDEEE          ;jump sub DEEE (YES, go speech ROM)
FBFA : B6 04 02   ldaa  $0402         ;load A with PIA sound select
FBFD : 0E         cli                 ;clear interrupts I=0
FBFE : 96 00      ldaa  $00           ;load A with addr 00
FC00 : 27 39      beq  LFC3B          ;branch Z=1 IRQ8
;IRQ3 
FC02 : 0E         cli                 ;clear interrupts I=0
FC03 : 85 40      bita  #$40          ;bit test A with 40h
FC05 : 27 09      beq  LFC10          ;branch Z=1 IRQ4
FC07 : 84 1F      anda  #$1F          ;and A with 1Fh
FC09 : 81 01      cmpa  #$01          ;compare A with 01h
FC0B : 27 03      beq  LFC10          ;branch Z=1 IRQ4
FC0D : 7E F9 2C   jmp  LF92C          ;jump SYNTH6
;IRQ4
FC10 : 0E         cli                 ;clear interrupt I=0
FC11 : 84 1F      anda  #$1F          ;and A with 1Fh
FC13 : 27 26      beq  LFC3B          ;branch Z=1 IRQ8
FC15 : 4A         deca                ;decr A
FC16 : 27 4C      beq  LFC64          ;branch Z=1 SYNTH10
FC18 : 81 06      cmpa  #$06          ;compare A with 06h
FC1A : 23 0E      bls  LFC2A          ;branch C+Z=1 IRQ6
FC1C : 81 0E      cmpa  #$0E          ;compare A with 0Eh
FC1E : 22 04      bhi  LFC24          ;branch C+Z=0 IRQ5
FC20 : 8B 08      adda  #$08          ;add A with 08h
FC22 : 20 06      bra  LFC2A          ;branch always IRQ6
;IRQ5 
FC24 : 81 16      cmpa  #$16          ;compare A with 16h
FC26 : 23 07      bls  LFC2F          ;branch C+Z=1 IRQ7
FC28 : 84 0F      anda  #$0F          ;and A with 0Fh
;IRQ6
FC2A : BD FA 7F   jsr  LFA7F          ;jump sub DL4PRM
FC2D : 20 0C      bra  LFC3B          ;branch always IRQ8
;IRQ7 
FC2F : 80 0F      suba  #$0F          ;sub A with 0Fh
FC31 : 48         asla                ;arith shift left A
FC32 : CE FC D4   ldx  #$FCD4         ;load X with FCD4h (JMPTBL)
FC35 : 8D 1E      bsr  LFC55          ;branch sub ADDX
FC37 : EE 00      ldx  $00,x          ;load X with X+00h
FC39 : AD 00      jsr  $00,x          ;jump sub X+00h (JMPTBL derived)
;IRQ8 
FC3B : 86 80      ldaa  #$80          ;load A with 80h
FC3D : B7 04 02   staa  $0402         ;store A in PIA sound select
FC40 : 96 4E      ldaa  $4E           ;load A with addr 4E
FC42 : 9A 4F      oraa  $4F           ;or A with addr 4F
;IRQW
FC44 : 27 FE      beq  LFC44          ;branch Z=1 IRQW
;
FC46 : 4F         clra                ;clear A
FC47 : 97 53      staa  $53           ;store A in addr 53
FC49 : 97 54      staa  $54           ;store A in addr 54
FC4B : 96 4E      ldaa  $4E           ;load A with addr 4E
FC4D : 27 03      beq  LFC52          ;branch Z=1 IRQX
FC4F : 7E FA 32   jmp  LFA32          ;jump DL2PRM
;IRQX 
FC52 : 7E FA 05   jmp  LFA05          ;jump DL1PRM
;*************************************;
;ADD A TO INDEX REGISTER
;*************************************;
;ADDX
FC55 : DF 5C      stx  $5C            ;store X in addr 5C (XPLAY)
FC57 : 9B 5D      adda  $5D           ;add A with addr 5D (XPLAY+1) 
FC59 : 97 5D      staa  $5D           ;store A in addr 5D(XPLAY+1)
FC5B : 96 5C      ldaa  $5C           ;load A with addr 5C(XPLAY) 
FC5D : 89 00      adca  #$00          ;add C with A and 00h
FC5F : 97 5C      staa  $5C           ;store A in add 5C(XPLAY)
FC61 : DE 5C      ldx  $5C            ;load X with addr 5C(XPLAY)
FC63 : 39         rts                 ;return subroutine
;*************************************;
;named as ROM 15 synth10
;*************************************;
;SYNTH10 
FC64 : CE 00 E0   ldx  #$00E0         ;load X with 00E0h
;S10LP1 
FC67 : 86 20      ldaa  #$20          ;load A with 20h
FC69 : 8D EA      bsr  LFC55          ;branch sub ADDX
;S10LP2 - count down decr X
FC6B : 09         dex                 ;decr X
FC6C : 26 FD      bne  LFC6B          ;branch Z=0 S10LP2
;
FC6E : 7F 04 00   clr  $0400          ;clear DAC output SOUND (00)
;S10LP3 - count down decr B
FC71 : 5A         decb                ;decr B
FC72 : 26 FD      bne  LFC71          ;branch Z=0 S10LP3
;
FC74 : 73 04 00   com  $0400          ;complement 1s DAC output SOUND (FF)
FC77 : DE 5C      ldx  $5C            ;load X with addr 5C
FC79 : 8C 10 00   cpx  #$1000         ;compare X with 1000h
FC7C : 26 E9      bne  LFC67          ;branch Z=0 S10LP1
;
FC7E : 20 BB      bra  LFC3B          ;branch always IRQ8
;*************************************;
;Diagnostic Processing Here
;*************************************;
;NMI
FC80 : 0F         sei                 ;set interrupt mask I=1
FC81 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
FC84 : CE FF FF   ldx  #$FFFF         ;load X with value FFFFh (end ROM addr)
FC87 : 5F         clrb                ;clear B
;NMI1 
FC88 : E9 00      adcb  $00,x         ;add C with B and X+00h
FC8A : 09         dex                 ;decr X
FC8B : 8C F8 00   cpx  #$F800         ;compare X with F800h
FC8E : 26 F8      bne  LFC88          ;branch Z=0 NMI1
FC90 : E1 00      cmpb  $00,x         ;compare B with X+00h
FC92 : 27 01      beq  LFC95          ;branch Z=1 NMI2
FC94 : 3E         wai                 ;wait for interrupt, PC+1 (NMI2)
;NMI2 
FC95 : BD F9 7B   jsr  LF97B          ;jump sub KNOCK
FC98 : BD F9 7B   jsr  LF97B          ;jump sub KNOCK
FC9B : BD F9 7B   jsr  LF97B          ;jump sub KNOCK
FC9E : 8D 2A      bsr  LFCCA          ;branch sub SETMEM
FCA0 : BD F8 DC   jsr  LF8DC          ;jump sub SND2
FCA3 : 8D 25      bsr  LFCCA          ;branch sub SETMEM
FCA5 : BD F8 E1   jsr  LF8E1          ;jump sub SND3
FCA8 : 86 01      ldaa  #$01          ;load A with 01h
FCAA : BD FA 7F   jsr  LFA7F          ;jump sub DL4PRM
FCAD : 86 02      ldaa  #$02          ;load A with 02h
FCAF : BD FA 7F   jsr  LFA7F          ;jump sub DL4PRM
FCB2 : 86 0E      ldaa  #$0E          ;load A with 0Eh
FCB4 : BD FA 7F   jsr  LFA7F          ;jump sub DL4PRM
FCB7 : 86 06      ldaa  #$06          ;load A with 06h
FCB9 : BD FA 7F   jsr  LFA7F          ;jump sub DL4PRM
FCBC : F6 DE C0   ldab  $DEC0         ;load B with addr DEC0 (Speech ROM6)
FCBF : C1 43      cmpb  #$43          ;compare B with 43h ("C" in Copyright message)
FCC1 : 26 BD      bne  LFC80          ;branch Z=0 NMI
FCC3 : 86 08      ldaa  #$08          ;load A with 08h
FCC5 : BD DE F2   jsr  LDEF2          ;jump sub TALKD
FCC8 : 20 B6      bra  LFC80          ;branch always NMI
;*************************************;
;set memory addrs 57, 5E-5F
;*************************************;
;SETMEM 
FCCA : C6 AF      ldab  #$AF          ;load B with AFh
FCCC : D7 57      stab  $57           ;store B in addr 57
FCCE : CE 00 00   ldx  #$0000         ;load X with 0000h
FCD1 : DF 5E      stx  $5E            ;store X in addr 5E
FCD3 : 39         rts                 ;return subroutine
;*************************************;
;irq jump table
;*************************************;
;JMPTBL
FCD4 : F9 7B                          ;KNOCK
FCD6 : F9 EF                          ;ADDCOM
FCD8 : F9 C8                          ;PARAM1
FCDA : F9 FE                          ;BGEND
FCDC : F8 D0                          ;THNDR
FCDE : F8 E6                          ;LITEN
FCE0 : F8 DC                          ;SND2
FCE2 : F8 E1                          ;SND3
;*************************************;
;SNDTBL
FCE4 : DA FF DA 80 26 01 26 80        ;
FCEC : 07 0A 07 00 F9 F6 F9 00        ;
;*************************************;
;NOTTBL
FCF4 : 3A 3E 50 46 33 2C 27 20        ;
FCFC : 25 1C 1A 17 14 11 10 33        ;
;*************************************;
;WAVFRM
FD04 : 08 03 02 01 02 03 04 05        ;
FD0C : 06 0A 1E 32 70 00              ;
;*************************************;
;VEC01
FD12 : FFFF FF90 FFFF FFFF FFFF       ;
FD1C : FF90 FFFF FFFF FFFF FFFF       ;
FD26 : 0000 0000 0000 0000            ;
;*************************************;
;VEC02
FD2E : 0104 0000 3F7F 0000 0104       ;
FD38 : 0000 05FF 0000 0100 0000       ;
FD42 : 4800 0000 05FF 0000            ;
;*************************************;
;VEC03
FD4A : 0280 0030 0A7F 007F 0280       ;
FD54 : 0030 C080 0020 0110 0015       ;
FD5E : C010 0000 C080 0000            ;
;*************************************;
;* Knocker Pattern
;*************************************;
;KNKTAB
FD66 : 01FC 02FC 03F8 04F8 06F8 08F4  ;
FD72 : 0CF4 10F4 20F2 40F1 60F1 80F1  ;
FD7E : A0F1 C0F1                      ;
FD82 : 00 00                          ;
;*************************************;
;DL4PRM
FD84 : 08 7F D9 FF D9 7F 24 00        ;
FD8C : 24 08 FF FF FF FF 00 00        ;
FD94 : 00 00 08 00 40 80 00 FF        ;
FD9C : 00 80 40 10 7F B0 D9 F5        ;
FDA4 : FF F5 D9 B0 7F 4E 24 09        ;
FDAC : 00 09 24 4E 10 7F C5 EC        ;
FDB4 : E7 BF 8D 6D 6A 7F 94 92        ;
FDBC : 71 40 17 12 39 10 76 FF        ;
FDC4 : B8 D0 9D E6 6A 82 76 EA        ;
FDCC : 81 86 4E 9C 32 63 10 FF        ;
FDD4 : FF FF FF FF FF FF FF 00        ;
FDDC : 00 00 00 00 00 00 00 10        ;
FDE4 : FF FF FF FF 00 00 00 00        ;
FDEC : FF FF FF FF 00 00 00 00        ;
FDF4 : 10 00 F4 00 E8 00 DC 00        ;
FDFC : E2 00 DC 00 E8 00 F4 00        ;
FE04 : 00 10 4C 6A 82 93 99 93        ;
FE0C : 82 6A 4C 2F 16 05 00 05        ;
FE14 : 16 2F                          ;
;*************************************;
;DL2PRM
FE16 : 8A 95 A0 AB B5 BF C8 D1        ;
FE1E : DA E1 E8 EE F3 F7 FB FD        ;
FE26 : FE FF FE FD FB F7 F3 EE        ;
FE2E : E8 E1 DA D1 C8 BF B5 AB        ;
FE38 : 8A 7F 75 6A 5F  54 4A 40       ;
FE40 : 37 2E 25 1E 17 11 0C 08        ;
FE48 : 04 02 01 00 01 02 04 08        ;
FE50 : 0C 11 17 1E 25 2E 37 40        ;
FE58 : 4A 54 5F 6A 75 7F              ;
;*************************************;
;DL2PRM
FE5E : 45 4B 50 56 5B 60 64 69        ;
FE66 : 6D 71 74 77 7A 7C 7E 7F        ;
FE6E : 7F 80 7F 7F 7E 7C 7A 77        ;
FE76 : 74 71 6D 69 64 60 5B 56        ;
FE7E : 50 4B 45 40 3B 35 30 2A        ;
FE86 : 25 20 1C 17 13 0F 0C 09        ;
FE8E : 06 04 02 01 01 00 01 01        ;
FE96 : 02 04 06 09 0C 0F 13 17        ;
FE9E : 1C 20 25 2A 30                 ;
;*************************************;
;DL4PRM
FEA3 : 35 3B 40 88 20 0F 14 11        ;
FEAB : 00 F3 10 30 53 32 1D 31        ;
FEB3 : D2 1D F4 12 00 11 B2 0F        ;
FEBB : F6 10 3D F5 11 2B F4 12        ;
FEC3 : 2B 21 B0 0F F4 12 18 13        ;
FECB : D0 42 F4 12 42 51 D4 6C        ;
FED3 : 51 37 79 11 08 79 F4 15        ;
FEDB : 92 82 23 A5 F2 18 BE 14        ;
FEE3 : 90 90 42 36 3D 12 09 62        ;
;*************************************;
;DL5PRM - assuming layout with 00 as end
FEEB : 01 01 02 02 04 04 08 08        ;
FEF3 : 10 10 30 60 C0 E0              ;
FEF9 : 00                             ;
;
FEFA : 01 01 02 02 03 04 05 06        ;
FF02 : 07 08 09 0A 0C 00 A0 98        ;
FF0A : 90 88 80 78 70 68 60 58        ;
FF12 : 50 48 40                       ;
FF15 : 00                             ;
;
FF16 : 10 90 10 90 00 80 78 70        ;
FF1E : 68 60 58 50 58 60 70 78        ;
FF26 : 80 00 08 80 10 78 18 70        ;
FF2E : 20 60 28 58 30 50 40 48        ;
FF36 : 00                             ;
;*************************************;
;DL3PRM - assuming layout with 00 as end
FF37 : 04 05 06 07 08 0A 0C 0E        ;
FF3F : 10 11 12 13 14 15 16 17        ;
FF47 : 18 19 1A 1B 1C                 ;
FF4C : 00                             ;
;
FF4D : 80 7C 78 74 70 74 78 7C 80     ;
FF56 : 00                             ;
;
FF57 : 20 22 24 26 28 2A 2E 2C        ;
FF5F : 2A 28 26 24                    ;
FF63 : 00                             ;
;
FF64 : 01 01 02 02 04 04 08 08        ;
FF6C : 10 20 28 30 38 40 48 50        ;
FF74 : 60 70 80 A0 B0 C0              ;
FF7A : 00                             ;
;
FF7B : 01                             ;
FF7C : 00                             ;
;
FF7D : 01 08 10 01 08 10 01 08        ;
FF85 : 10 01 08 10 01 08 10 01        ;
FF8D : 08 10                          ;
FF8F : 00                             ;
;
FF90 : 10 20 40 10 20 40              ;
FF96 : 10 20 40 10 20 40              ;
FF9C : 10 20 40 10 20 40              ;
FFA2 : 10 20 40 10 20 40              ;
FFA8 : 00                             ;
;
FFA9 : 01 40 02 42 03 43 04 44        ;
FFB1 : 05 45 06 46 07 47 08 48        ;
FFB9 : 09 49 0A 4A 0B 4B              ;
FFBF : 00                             ;
;*************************************;
; zero padding
FFC0 : 00 00  "   "    db  $00, $00
FFC2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFC6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFCA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFCE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFD6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFDA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFDE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFE6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFEA : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFEE : 00 00 00 00  "    "    db  $00, $00, $00, $00
FFF2 : 00    " "    db  $00
;*************************************;
;Speech ROM6 jump sub destination
;*************************************;
FFF3 : 7E FC 55   jmp  LFC55          ;jump ADDX
;
FFF6 : DFEE                           ;JMPTBL addr in ROM6
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FB A8                          ;IRQ 
FFFA : F8 01                          ;RESET SWI (software) 
FFFC : FC 80                          ;NMI 
FFFE : F8 01                          ;RESET (hardware) 

;--------------------------------------------------------------




