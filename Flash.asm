    ;
    ; Disassembled by:
    ;  DASMx object code disassembler
    ;  (c) Copyright 1996-2003   Conquest Consultants
    ;  Version 1.40 (Oct 18 2003)
    ;
    ; File:  Flash.716
    ;
    ; Size:  2048 bytes
    ; Checksum: E106
    ; CRC-32:  F4190CA3
    ;
    ; Date:  Tue Apr 13 19:00:04 2021
    ;
    ; CPU:  Motorola 6800 (6800/6802/6808 family)
    ;
        ; NOTE: PIA DAC addr 8400
        ;
        ; 
        ; Stellar Wars dated 1979, using SoundROM 1
        ; for System [4]-[6] sound boards (rectangular)
        ; for pinball games Flash[4][1979], Time Warp[6][1979], Stellar Wars[4][1979], Scorpion[6][1980], Tri Zone[6][1979] 
        ;
    ; Flash[System 4][1979] - programmed by Randy Pfeiffer
        ; 8x bell tones 
        ; possible WhiteNoise routine
    ;
     org $7800
    ;
7800 : 74                        ;Checksum byte
;*************************************;
;RESET power on
;*************************************; 
7801 : 0F         sei            ;set interrupt mask   
7802 : 8E 00 7F   lds  #$007F    ;load stack pointer with 007Fh  
7805 : CE 84 00   ldx  #$8400    ;load X with 8400h (PIA addr)
7808 : 6F 01      clr $01,x      ;clr (00) X + 01h (8401) PIA CR port A
780A : 6F 03      clr $03,x      ;clr (00) X + 03h (8403) PIA CR port B
780C : 86 FF      ldaa #$FF      ;load A with FFh
780E : A7 00      staa $00,x     ;store A in addr X + 00h (8400) PIA port A out (DAC sound)
7810 : 6F 02      clr $02,x      ;clr (00) X + 01h (8402) PIA port B in (sound select)
7812 : 86 07      ldaa #$07      ;load A with 07h
7814 : A7 01      staa $01,x     ;store A in addr X + 01h (8401) PIA CR port A
7816 : A7 03      staa $03,x     ;store A in addr X + 03h (8403) PIA CR port B
7818 : 97 1C      staa $1C       ;store A in addr 1C
781A : 7F 00 20   clr $0020      ;clr (00) addr 20
781D : 0E         cli            ;clear interrupt
;STDBY L781E:
781E : 20 FE      bra LF81E      ;branch always here STDBY1
;*************************************;
;PARAM1
;*************************************;
;L7820:
7820 : DF 24      stx $24        ;store X in addr 24
7822 : CE 78 C5   ldx #$78C5     ;load X with 78C5h (SYN02)
7825 : DF 26      stx $26        ;store X in addr 26
7827 : 86 80      ldaa #$80      ;load A with value 80h
;PRM11 L7829:
7829 : D6 03      ldab $03       ;load B with value in addr 03
782B : 2A 09      bpl L7836      ;branch N=0 PRM13
782D : D6 1D      ldab $1D       ;load B with value in addr 1D
782F : 54         lsrb           ;logic shift right B
7830 : 54         lsrb           ;logic shift right B
7831 : 54         lsrb           ;logic shift right B
7832 : 5C         incb           ;incr B
;PRM12 L7833:
7833 : 5A         decb           ;decr B
7834 : 26 FD      bne L7833      ;branch Z=0 PRM12
;PRM13 L7836:
7836 : 7A 00 08   dec $0008      ;decr addr 0008
7839 : 27 4C      beq L7887      ;branch Z=1 PRM17
783B : 7A 00 09   dec $0009      ;decr addr 0009
783E : 27 4C      beq L788C      ;branch Z=1 PRM18
7840 : 7A 00 0A   dec $000A      ;decr addr 000A
7843 : 27 4C      beq L7891      ;branch Z=1 PRM19
7845 : 7A 00 0B   dec $000B      ;decr addr 000B
7848 : 26 DF      bne L7829      ;branch Z=0 PRM11
784A : D6 03      ldab $03       ;load B with value in addr 03
784C : 27 DB      beq L7829      ;branch Z=1 PRM11
784E : C4 7F      andb #$7F      ;and B with value 7Fh
7850 : D7 0B      stab $0B       ;store B in addr 0B
7852 : D6 1D      ldab $1D       ;load B with value in addr 1D
7854 : 58         aslb           ;arith shift left B
7855 : DB 1D      addb $1D       ;add B with value in addr 1D
7857 : CB 0B      addb #$0B      ;add B with value 0Bh
7859 : D7 1D      stab $1D       ;store B in addr 1D
785B : 7A 00 1B   dec $001B      ;decr addr 001B
785E : 26 0E      bne L786E      ;branch Z=0 PRM14
7860 : D6 0F      ldab $0F       ;load B with value in addr 0F
7862 : D7 1B      stab $1B       ;store B in addr 1B
7864 : DE 26      ldx $26        ;load X with value in addr 26 (has 78C5h, SYN02)
7866 : 09         dex            ;decr X
7867 : 8C 78 BE   cpx #$78BE     ;compare X with value 78BEh (SYN01)
786A : 27 4E      beq L78BA      ;branch Z=1 PRM1C
786C : DF 26      stx $26        ;store X in addr 26
;PRM14 L786E:
786E : D6 1D      ldab $1D       ;load B with value in addr 1D
7870 : 2B 06      bmi L7878      ;branch N=1 PRM15
7872 : D4 07      andb $07       ;and B with value in addr 07
7874 : C4 7F      andb #$7F      ;and B with value 7Fh
7876 : 20 05      bra L787D      ;branch always PRM16
;PRM15 L7878:
7878 : D4 07      andb $07       ;and B with value in addr 07
787A : C4 7F      andb #$7F      ;and B with value 7Fh
787C : 50         negb           ;complement 2s B (negate)
;PRM16 L787D:
787D : 36         psha           ;push A into stack then SP - 1
787E : 1B         aba            ;A = A + B
787F : 16         tab            ;transfer A to B
7880 : 32         pula           ;SP + 1 pull stack into A
7881 : DE 26      ldx $26        ;load X with value in addr 26
7883 : AD 00      jsr $00,x      ;jump sub addr X (78BE, SYN01)
7885 : 20 A2      bra L7829      ;branch always PRM11
;PRM17 L7887:
7887 : CE 00 00   ldx #$0000     ;load X with value 0000h
788A : 20 08      bra L7894      ;branch always PRM1A
;PRM18 L788C:
788C : CE 00 01   ldx #$0001     ;load X with value 0001h
788F : 20 03      bra L7894      ;branch always PRM1A
;PRM19 L7891:
7891 : CE 00 02   ldx #$0002     ;load X with value 0002h
;PRM1A L7894:
7894 : 6D 18      tst $18,x      ;test value in X+18h
7896 : 27 12      beq L78AA      ;branch Z=1 PRM1B
7898 : 6A 18      dec $18,x      ;decr addr X+18h
789A : 26 0E      bne L78AA      ;branch Z=0 PRM1B
789C : E6 0C      ldab $0C,x     ;load B with value in addr X+0Ch
789E : E7 18      stab $18,x     ;store B in addr X+18h
78A0 : E6 00      ldab $00,x     ;load B with value in X
78A2 : EB 10      addb $10,x     ;add B with value in addr X+10h
78A4 : E1 14      cmpb $14,x     ;compare B with value in addr X+14h
78A6 : 27 12      beq L78BA      ;branch Z=1 PRM1C
78A8 : E7 00      stab $00,x     ;store B in addr X
;PRM1B L78AA:
78AA : E6 00      ldab $00,x     ;load B with value in addr X
78AC : E7 08      stab $08,x     ;store B in addr X+08h
78AE : AB 04      adda $04,x     ;add A with value in addr X+04h
78B0 : 60 04      neg $04,x      ;complement 2s in X+04h (negate)
78B2 : 16         tab            ;transfer A to B
78B3 : DE 26      ldx $26        ;load X with value in addr 26
78B5 : AD 00      jsr $00,x      ;jump sub addr X
78B7 : 7E 78 29   jmp L7829      ;jump PRM11
;PRM1C L78BA:
78BA : DE 24      ldx $24        ;load X with value in addr 24
78BC : 39         rts            ;return subroutine
;*************************************;
;SYNTH0
;*************************************;
78BD : 54         lsrb           ;logical shift right B
;SYN01 L78BE
78BE : 54         lsrb           ;logical shift right B (0nnn nnnn)
78BF : 54         lsrb           ;logical shift right B (00nn nnnn)
78C0 : 54         lsrb           ;logical shift right B (000n nnnn)
78C1 : 54         lsrb           ;logical shift right B (0000 nnnn)
78C2 : 54         lsrb           ;logical shift right B (0000 0nnn)
78C3 : 54         lsrb           ;logical shift right B (0000 00nn)
78C4 : 54         lsrb           ;logical shift right B (0000 000n)
;SYN02 L78C5 - called by IRQ,NMI,PARAM1 to store in addr 26
78C5 : F7 84 00   stab $8400     ;store B in DAC output SOUND 
78C8 : 39         rts            ;return subroutine
;*************************************;
;PARAM2
;*************************************;
78C9 : CE 7C 12   ldx #$7C12     ;load X with value 7C12h (FDBTBL4)
;PRM21 L78CC:
78CC : C6 1C      ldab #$1C      ;load B with value 1Ch
78CE : BD 7A 13   jsr L7A13      ;jump sub TRANS
78D1 : BD 78 20   jsr L7820      ;jump sub PARAM1
78D4 : 39         rts            ;return subroutine
;*************************************;
;PARAM3 - not called ?  <---- eh?
;*************************************;
;L78D5
78D5 : CE 7C 2E   ldx #$7C2E     ;load X with value 7C2Eh (FDBTBL5)
78D8 : 20 F2      bra L78CC      ;branch always PRM21
;L78DA
78DA : CE 7C 4A   ldx #$7C4A     ;load X with value 7C4Ah (FDBTBL6)
78DD : 20 ED      bra L78CC      ;branch always PRM21
;L78DF
78DF : CE 7C 66   ldx #$7C66     ;load X with value 7C66h (FDBTBL7)
78E2 : 20 E8      bra L78CC      ;branch alwyas PRM21
;L78E4
78E4 : CE 7C 82   ldx #$7C82     ;load X with value 7C82h (FDBTBL8)
78E7 : 20 E3      bra L78CC      ;branch always PRM21
;*************************************;
;PARAM4
;*************************************;
;L78E9
78E9 : 7C 00 20   inc $0020      ;incr addr 0020
78EC : 7C 00 1F   inc $001F      ;incr addr 001F
78EF : CE 00 30   ldx #$0030     ;load X with value in addr 0030
78F2 : DF 22      stx $22        ;store X in addr 22
78F4 : CE 7C 9E   ldx #$7C9E     ;load X with value 7C9Eh (FDBTBL9)
78F7 : C6 1C      ldab #$1C      ;load B with value 1Ch
78F9 : BD 7A 13   jsr L7A13      ;jump sub TRANS
78FC : CE 00 00   ldx #$0000     ;load X with value 0000h
78FF : DF 22      stx $22        ;store X in addr 22
7901 : CE 7C 9E   ldx #$7C9E     ;load X with value 7C9Eh (FDBTBL9)
7904 : 20 C6      bra L78CC      ;branch always PRM21
;*************************************;
;PARAM5
;*************************************;
;L7906
7906 : 7F 00 20   clr $0020      ;clear addr 0020
7909 : C6 88      ldab #$88      ;load B with value 88h
790B : D7 21      stab $21       ;store B with value in addr 21
790D : CE 00 60   ldx #$0060     ;load X with value 0060h
7910 : DF 22      stx $22        ;store X in addr 22
7912 : CE 7C F0   ldx #$7CF0     ;load X with value 7CF0h (data)
7915 : C6 06      ldab #$06      ;load B with value 06h
7917 : BD 7A 13   jsr L7A13      ;jump sub TRANS
791A : 39         rts            ;return subroutine
;*************************************;
;PARAM6
;*************************************;
;L791B
791B : 96 1F      ldaa $1F       ;load A with value in addr 1F
791D : 27 1E      beq L793D      ;branch Z=1 PRM62
791F : 7F 00 1F   clr $001F      ;clear addr 001F
7922 : CE 00 31   ldx #$0031     ;load X with value 0031h
7925 : C6 06      ldab #$06      ;load B with value 06h
7927 : A6 00      ldaa $00,x     ;load A with vvalue in addr X
7929 : 81 36      cmpa #$36      ;compare A with value 36h
792B : 22 08      bhi L7935      ;branch C+Z=0 PRM61
792D : C6 04      ldab #$04      ;load B with value 04h
792F : 81 10      cmpa #$10      ;compare A with value 10h
7931 : 22 02      bhi L7935      ;branch C+Z=0 PRM61
7933 : C6 02      ldab #$02      ;load B with value 02h
;PRM61 L7935:
7935 : 10         sba            ;A = A - B
7936 : A7 00      staa $00,x     ;store A in addr X
7938 : A6 01      ldaa $01,x     ;load A with value in addr X+01h
793A : 10         sba            ;A = A - B
793B : A7 01      staa $01,x     ;store A in addr X+01h
;PRM62 L793D:
793D : 32         pula           ;SP + 1 pull stack into A
793E : 32         pula           ;SP + 1 pull stack into A
793F : 7E 7B 9E   jmp L7B9E      ;jump IRQ2
;*************************************;
;PARAM7
;*************************************;
;L7942
7942 : CE 00 60   ldx #$0060     ;load X with value 0060h
7945 : A6 00      ldaa $00,x     ;load A with value in addr X
7947 : 80 02      suba #$02      ;subtract B with value 02h
7949 : A7 00      staa $00,x     ;store A in addr X
794B : BD 7A 92   jsr L7A92      ;jump sub PARAM21
794E : 7E 7A AB   jmp L7AAB      ;jump SYNTH5
;*************************************;
;SYNTH1
;*************************************;
7951 : CE 00 01   ldx #$0001     ;load X with value 0001h
7954 : DF 00      stx $00        ;store X in addr 00
7956 : CE 03 80   ldx #$0380     ;load X with value 0380h
7959 : DF 02      stx $02        ;store X in addr 02
;SYN11 L795B:
795B : 7F 84 00   clr $8400      ;clear DAC output SOUND 
795E : DE 00      ldx $00        ;load X with value in addr 00
7960 : 08         inx            ;incr X
7961 : DF 00      stx $00        ;store X in addr 00
;SYN12 L7963:
7963 : 09         dex            ;decr X
7964 : 26 FD      bne L7963      ;branch Z=0 SYN12
7966 : 73 84 00   com $8400      ;complement 1s DAC output SOUND 
7969 : DE 02      ldx $02        ;load X with value in addr 02
;SYN13 L796B:
796B : 09         dex            ;decr X
796C : 26 FD      bne L796B      ;branch Z=0 SYN13
796E : 20 EB      bra L795B      ;branch always SYN11 
;*************************************;
;SYNTH2
;*************************************;
7970 : 5F         clrb           ;clear B
7971 : F7 84 00   stab $8400     ;store B in DAC output SOUND 
7974 : CE 00 DF   ldx #$00DF     ;load X with value 00DFh
;SYN21 L7977:
7977 : 86 20      ldaa #$20      ;load A with value 20h
7979 : BD 7B B4   jsr L7BB4      ;jump sub CALCOS
;SYN22 L797C:
797C : 09         dex            ;decr X
797D : 26 FD      bne L797C      ;branch Z=0 SYN22
797F : 73 84 00   com $8400      ;complement 1s DAC output SOUND 
;SYN23 L7982:
7982 : 5A         decb           ;decr B
7983 : 26 FD      bne L7982      ;branch Z=0 SYN23
7985 : 73 84 00   com $8400      ;complement 1s DAC output SOUND 
7988 : 96 24      ldaa $24       ;load A with value in addr 24
798A : DE 24      ldx $24        ;load X with value in addr 24
798C : 85 10      bita #$10      ;bit test A with value 10h
798E : 27 E7      beq L7977      ;branch Z=1 SYN21
7990 : 39         rts            ;return subroutine
;*************************************;
;SYNTH3 - possible version of Lightning+Appear Noise Routine
;*************************************;
7991 : C6 01      ldab #$01      ;load B with value 01h
7993 : D7 00      stab $00       ;store B in addr 00 (LFREQ)
7995 : C6 FF      ldab #$FF      ;load B with value FFh (HIGHEST AMP)
7997 : 20 06      bra L799F      ;branch always SYN31
7999 : C6 01      ldab #$01      ;load B with value 01h
799B : D7 00      stab $00       ;store B in addr 00
799D : C6 AF      ldab #$AF      ;load B with value AFh
;SYN31 L799F:
799F : D7 02      stab $02       ;store B in addr 02
;SYN32 L79A1:
79A1 : C6 03      ldab #$03      ;load B with value 03h
79A3 : D7 01      stab $01       ;store B in addr 01
;SYN33 L79A5:
79A5 : D6 02      ldab $02       ;load B with value in addr 02
79A7 : 96 1D      ldaa $1D       ;load A with value in addr 1D
79A9 : 44         lsra           ;logic shift right A
79AA : 44         lsra           ;logic shift right A
79AB : 44         lsra           ;logic shift right A
79AC : 98 1D      eora $1D       ;exclusive OR A with value 1Dh
79AE : 44         lsra           ;logic shift right A
79AF : 76 00 1C   ror $001C      ;rotate right addr 001C (HI)
79B2 : 76 00 1D   ror $001D      ;rotate right addr 001D (LO)
79B5 : 24 01      bcc L79B8      ;branch C=0 SYN34
79B7 : 53         comb           ;complement 1s B
;SYN34 L79B8:
79B8 : F7 84 00   stab $8400     ;store B in DAC output SOUND 
79BB : D6 00      ldab $00       ;load B with value in addr 00
;SYN35 L79BD:
79BD : 5A         decb           ;decr B
79BE : 26 FD      bne L79BD      ;branch Z=0 SYN35
79C0 : 7A 00 01   dec $0001      ;decr addr 0001
79C3 : 26 E0      bne L79A5      ;branch Z=0 SYN33
79C5 : 7C 00 00   inc $0000      ;incr addr 0000
79C8 : 26 D7      bne L79A1      ;branch Z=0 SYN32
79CA : 39         rts            ;return subroutine
;*************************************;
;PARAM8
;*************************************;
;L79CB
79CB : 7A 00 21   dec $0021      ;decr addr 0021
79CE : 20 04      bra L79D4      ;branch always SYN41
;*************************************;
;SYNTH4
;*************************************;
;L79D0:
79D0 : C6 A0      ldab #$A0      ;load B with value A0h
79D2 : D7 21      stab $21       ;store B in addr 21
;SYN41 L79D4:
79D4 : 86 04      ldaa #$04      ;load A with value 04h
79D6 : 97 01      staa $01       ;store A in addr 01
;SYN42 L79D8:
79D8 : 86 9F      ldaa #$9F      ;load A with value 9Fh
79DA : D6 21      ldab $21       ;load B with value in addr 21
;SYN43 L79DC:
79DC : CE 01 C0   ldx #$01C0     ;load X with value 01C0h
;SYN44 L79DF:
79DF : 09         dex            ;decr X
79E0 : 27 20      beq L7A02      ;branch Z=1 SYN47
79E2 : F7 00 00   stab $0000     ;store B with in addr 0000h
79E5 : B7 84 00   staa $8400     ;store A in DAC output SOUND 
;SYN45 L79E8:
79E8 : 09         dex            ;decr X
79E9 : 27 17      beq L7A02      ;branch Z=1 SYN47
79EB : 7A 00 00   dec $0000      ;decr addr 0000h
79EE : 26 F8      bne L79E8      ;branch Z=0 SYN45
79F0 : 09         dex            ;decr X
79F1 : 27 0F      beq L7A02      ;branch Z=1 SYN47
79F3 : D7 00      stab $00       ;store B in addr 00
79F5 : 73 84 00   com $8400      ;complement 1s DAC output SOUND 
;SYN46 L79F8:
79F8 : 09         dex            ;decr X
79F9 : 27 07      beq L7A02      ;branch Z=1 SYN47
79FB : 7A 00 00   dec $0000      ;decr addr 0000
79FE : 26 F8      bne L79F8      ;branch Z=0 SYN46
7A00 : 20 DD      bra L79DF      ;branch always SYN44
;SYN47 L7A02:
7A02 : D0 01      subb $01       ;subtract B with value in addr 01
7A04 : C1 10      cmpb #$10      ;compare B with value 10h
7A06 : 22 D4      bhi L79DC      ;branch C+Z=0 SYN43
7A08 : 39         rts            ;return subroutine
;*************************************;
;PARAM9
;*************************************;
;L7A09
7A09 : C6 11      ldab #$11      ;load B with value 11h
7A0B : D7 21      stab $21       ;store B in addr 21
7A0D : 86 FE      ldaa #$FE      ;load A with value FEh
7A0F : 97 01      staa $01       ;store A in addr 01
7A11 : 20 C5      bra L79D8      ;branch always SYN42
;*************************************;
;TRANS - PARAMETER TRANSFER
;*************************************;
;L7A13:
7A13 : 36         psha           ;push A into stack then SP - 1
;TRNS1 L7A14:
7A14 : A6 00      ldaa $00,x     ;load A with X
7A16 : DF 24      stx $24        ;store X in addr 24 (XPLAY)
7A18 : DE 22      ldx $22        ;load X with value in addr 22 (XPTR)
7A1A : A7 00      staa $00,x     ;store A in addr X
7A1C : 08         inx            ;incr X
7A1D : DF 22      stx $22        ;store X in addr 22 (XPTR)
7A1F : DE 24      ldx $24        ;load X with value in addr 24 (XPLAY)
7A21 : 08         inx            ;incr X
7A22 : 5A         decb           ;decr B
7A23 : 26 EF      bne L7A14      ;branch Z=0 TRNS1
7A25 : 32         pula           ;SP + 1 pull stack into A
7A26 : 39         rts            ;return subroutine
;*************************************;
;PARAM10
;*************************************;
;L7A27
7A27 : CE 7C BA   ldx #$7CBA     ;load X with value 7CBAh (FDBVECT1)
7A2A : 20 26      bra L7A52      ;branch always PRM151
;*************************************;
;PARAM11 not called ?
;*************************************;
;L7A2C:
7A2C : BD 7A 92   jsr L7A92      ;jump sub PARAM21
7A2F : BD 7A AB   jsr L7AAB      ;jump sub SYNTH5
7A32 : 39         rts            ;return subroutine
;*************************************;
;PARAM12
;*************************************;
;L7A33
7A33 : CE 7C C0   ldx #$7CC0     ;load X with value 7CC0h (FDBVECT2)
7A36 : 20 F4      bra L7A2C      ;branch always PARAM11
;*************************************;
;PARAM13
;*************************************;
;L7A38
7A38 : C6 FF      ldab #$FF      ;load B with value FFh
7A3A : D7 1E      stab $1E       ;store X in addr 1E
;PRM131 L7A3C:
7A3C : CE 7C C6   ldx #$7CC6     ;load X with value 7CC6h (FDBVECT3)
7A3F : 8D EB      bsr L7A2C      ;branch sub PARAM11
7A41 : CE 7C CC   ldx #$7CCC     ;load X with value 7CCCh (FDBVECT4)
7A44 : 8D E6      bsr L7A2C      ;branch sub PARAM11
7A46 : 5A         decb           ;decr B
7A47 : 26 F3      bne L7A3C      ;branch Z=0 PRM131
7A49 : 39         rts            ;return subroutine
;*************************************;
;PARAM14
;*************************************;
;L7A4A
7A4A : CE 7C D2   ldx #$7CD2     ;load X with value 7CD2h (FDBVECT5)
7A4D : 20 DD      bra L7A2C      ;branch always PARAM11
;*************************************;
;PARAM15
;*************************************;
;L7A4F
7A4F : CE 7C DE   ldx #$7CDE     ;load X with value 7CDEh (FDBVECT7)
;PRM151 L7A52:
7A52 : 8D D8      bsr L7A2C      ;branch sub PARAM11
7A54 : 8D 30      bsr L7A86      ;branch sub PARAM19
7A56 : 20 FA      bra L7A52      ;branch always PRM151
;*************************************;
;PARAM16
;*************************************;
;L7A58
7A58 : 86 FF      ldaa #$FF      ;load A with value FFh
7A5A : 97 1E      staa $1E       ;store A in addr 1E
7A5C : CE 7C E4   ldx #$7CE4     ;load X with value 7CE4h (FDBVECT8)
7A5F : 20 F1      bra L7A52      ;branch always PRM151
;*************************************;
;PARAM17
;*************************************;
;L7A61
7A61 : 86 FF      ldaa #$FF      ;load A with value FFh
7A63 : 97 1E      staa $1E       ;store A in addr 1E
7A65 : CE 7C D8   ldx #$7CD8     ;load X with value 7CD8h (FDBVECT6)
7A68 : 20 E8      bra L7A52      ;branch always PRM151
;*************************************;
;PARAM18
;*************************************;
;L7A6A
7A6A : C6 30      ldab #$30      ;load B with value 30h
7A6C : CE 7C EA   ldx #$7CEA     ;load X with value 7CEAh (FDBVECT9)
7A6F : 8D 21      bsr L7A92      ;branch sub PARAM21
;PRM181 L7A71:
7A71 : 96 1D      ldaa $1D       ;load A with value in addr 1D
7A73 : 48         asla           ;arith shift left A
7A74 : 9B 1D      adda $1D       ;add A with value in addr 1D
7A76 : 8B 0B      adda #$0B      ;add A with value 0Bh
7A78 : 97 1D      staa $1D       ;store A in addr 1D
7A7A : 44         lsra           ;logic shift right
7A7B : 44         lsra           ;logic shift right
7A7C : 8B 0C      adda #$0C      ;add A with value 0Ch
7A7E : 97 01      staa $01       ;store A in addr 01
7A80 : 8D 29      bsr L7AAB      ;branch sub SYNTH5
7A82 : 5A         decb           ;decr B
7A83 : 26 EC      bne L7A71      ;branch Z=0 PRM181
7A85 : 39         rts            ;return subroutine
;*************************************;
;PARAM19
;*************************************;
;L7A86:
7A86 : 96 1E      ldaa $1E       ;load A with value in addr 1E
7A88 : 80 08      suba #$08      ;subtract A with value 08h
7A8A : 2A 03      bpl L7A8F      ;branch N=0 PARAM20
7A8C : 97 1E      staa $1E       ;store A in addr 1E
7A8E : 39         rts            ;return subroutine
;*************************************;
;PARAM20
;*************************************;
;L7A8F:
7A8F : 32         pula           ;SP + 1 pull stack into A
7A90 : 32         pula           ;SP + 1 pull stack into A
7A91 : 39         rts            ;return subroutine
;*************************************;
;PARAM21
;*************************************;
;L7A92:
7A92 : A6 00      ldaa $00,x     ;load A with value in addr X+00h
7A94 : 97 01      staa $01       ;store A in addr 01
7A96 : A6 01      ldaa $01,x     ;load A with value in addr X+01h
7A98 : 97 02      staa $02       ;store A in addr 02
7A9A : A6 02      ldaa $02,x     ;load A with value in addr X+02h
7A9C : 97 03      staa $03       ;store A in addr 03
7A9E : A6 03      ldaa $03,x     ;load A with value in addr X+03h
7AA0 : 97 04      staa $04       ;store A in addr 04
7AA2 : A6 04      ldaa $04,x     ;load A with value in addr X+04h
7AA4 : 97 05      staa $05       ;store A in addr 05
7AA6 : A6 05      ldaa $05,x     ;load A with value in addr X+05h
7AA8 : 97 06      staa $06       ;store A in addr 06
7AAA : 39         rts            ;return subroutine
;*************************************;
;SYNTH5
;*************************************;
;L7AAB:
7AAB : 96 1E      ldaa $1E       ;load A with value in addr 1E
7AAD : 37         pshb           ;push B into stack then SP - 1
7AAE : D6 05      ldab $05       ;load B with value in addr 05
7AB0 : D7 07      stab $07       ;store B in addr 07
7AB2 : D6 02      ldab $02       ;load B with value in addr 02
7AB4 : D7 08      stab $08       ;store B in addr 08
;SYN51 L7AB6:
7AB6 : 43         coma           ;complement 1s A
7AB7 : D6 01      ldab $01       ;load B with value in addr 01
7AB9 : B7 84 00   staa $8400     ;store A in DAC output SOUND 
;SYN52 L7ABC:
7ABC : 5A         decb           ;decr B
7ABD : 26 FD      bne L7ABC      ;branch Z=0 SYN52
7ABF : 43         coma           ;complement 1s A
7AC0 : D6 01      ldab $01       ;load B with value in addr 01
7AC2 : 20 00      bra L7AC4      ;branch always SYN53
;SYN53 L7AC4:
7AC4 : 08         inx            ;incr X
7AC5 : 09         dex            ;decr X
7AC6 : 08         inx            ;incr X
7AC7 : 09         dex            ;decr X
7AC8 : B7 84 00   staa $8400     ;store A in DAC output SOUND 
;SYN54 L7ACB:
7ACB : 5A         decb           ;decr B
7ACC : 26 FD      bne L7ACB      ;branch Z=0 SYN54
7ACE : 7A 00 08   dec $0008      ;decr addr 0008
7AD1 : 27 16      beq L7AE9      ;branch Z=1 SYN55
7AD3 : 7A 00 07   dec $0007      ;decr addr 0007
7AD6 : 26 DE      bne L7AB6      ;branch Z=0 SYN51
7AD8 : 43         coma           ;complement 1s A
7AD9 : D6 05      ldab $05       ;load B with value in addr 05
7ADB : B7 84 00   staa $8400     ;store A in DAC output SOUND 
7ADE : D7 07      stab $07       ;store B in addr 07
7AE0 : D6 01      ldab $01       ;load B with value in addr 01
7AE2 : 9B 06      adda $06       ;add A with value in addr 06
7AE4 : 2B 1E      bmi L7B04      ;branch N=1 SYN57
7AE6 : 01         nop            ;
7AE7 : 20 15      bra L7AFE      ;branch always SYN56
;SYN55 L7AE9:
7AE9 : 08         inx            ;incr X
7AEA : 09         dex            ;decr X
7AEB : 01         nop            ;
7AEC : 43         coma           ;complement 1s A
7AED : D6 02      ldab $02       ;load B with value in addr 02
7AEF : B7 84 00   staa X8400     ;store A in DAC output SOUND 
7AF2 : D7 08      stab $08       ;store B in addr 08
7AF4 : D6 01      ldab $01       ;load B with value in addr 01
7AF6 : D0 03      subb $03       ;subtract B with value in addr 03
7AF8 : D1 04      cmpb $04       ;compare B with value in addr 04
7AFA : D1 04      cmpb $04       ;compare B with value in addr 04
7AFC : 27 06      beq L7B04      ;branch Z=1 SYN57
;SYN56 L7AFE:
7AFE : D7 01      stab $01       ;store B in addr 01
7B00 : C0 05      subb #$05      ;subtract B with value 05h
7B02 : 20 B8      bra L7ABC      ;branch always SYN52
;SYN57 L7B04:
7B04 : 33         pulb           ;SP + 1 pull stack into B
7B05 : 39         rts            ;return subroutine
;*************************************;
;SYNTH6
;*************************************;
;L7B06:
7B06 : 84 1F      anda #$1F      ;and A with value 1Fh
;SYN61 L7B08:
7B08 : 27 FE      beq L7B08      ;branch Z=1 SYN61
7B0A : 81 11      cmpa #$11      ;compare A with value 11h
;SYN62 L7B0C:
7B0C : 27 FE      beq L7B0C      ;branch Z=1 SYN62
7B0E : 81 12      cmpa #$12      ;compare A with value 12h
;SYN63 L7B10:
7B10 : 27 FE      beq L7B10      ;branch Z=1 SYN63
7B12 : 84 0F      anda #$0F      ;and A with value 0Fh
7B14 : CE 7B F4   ldx #$7BF4     ;load X with value 7BF4h (FDBTBL2)
7B17 : BD 7B B4   jsr L7BB4      ;jump sub CALCOS
7B1A : A6 00      ldaa $00,x     ;load A with addr X
7B1C : 97 18      staa $18       ;store A in addr 18 
7B1E : CE 7B E4   ldx #$7BE4     ;load X with value 7BE4h (FDBTBL1)
7B21 : C6 10      ldab #$10      ;load B with value 10h
7B23 : BD 7A 13   jsr L7A13      ;jump sub TRANS
7B26 : CE 7C 04   ldx #$7C04     ;load X with value 7C04h (FDBTBL3)
7B29 : E6 00      ldab $00,x     ;load B with addr X
;SYN64 L7B2B:
7B2B : D7 1A      stab $1A       ;store B in addr 1A
7B2D : DF 22      stx $22        ;store X in addr 22
;SYN65 L7B2F:
7B2F : CE 00 00   ldx #$0000     ;load X with value 0000h
7B32 : C6 08      ldab #$08      ;load B with value 08h
7B34 : D7 19      stab $19       ;store B in addr 19
;SYN66 L7B36:
7B36 : A6 00      ldaa $00,x     ;load A with value in addr X
7B38 : D6 18      ldab $18       ;load B with value in addr 18
7B3A : 7D 00 1A   tst $001A      ;test value in addr 001A
7B3D : 26 06      bne L7B45      ;branch Z=0 SYN67
7B3F : A0 08      suba $08,x     ;subtract B with value in X,08h
7B41 : A7 00      staa $00,x     ;store A in addr X
7B43 : C0 03      subb #$03      ;subtract B with value 03h
;SYN67 L7B45:
7B45 : 08         inx            ;increment X
7B46 : B7 84 00   staa $8400     ;store A in DAC output SOUND 
;SYN68 L7B49:
7B49 : 5A         decb           ;decr B
7B4A : 26 FD      bne L7B49      ;branch Z=0 SYN68
7B4C : 7A 00 19   dec $0019      ;decr value in addr 0019
7B4F : 26 E5      bne L7B36      ;branch Z=0 SYN36
7B51 : 7A 00 1A   dec $001A      ;decr value in addr 001A
7B54 : 2A D9      bpl L7B2F      ;branch N=0 SYN65
7B56 : DE 22      ldx $22        ;load X with value in addr 22
7B58 : 08         inx            ;incr X
7B59 : E6 00      ldab $00,x     ;load B with value in addr X
7B5B : 26 CE      bne L7B2B      ;branch Z=0 SYN64
7B5D : 86 80      ldaa #$80      ;load A with value 80h
7B5F : B7 84 00   staa X8400     ;store A in DAC output SOUND 
7B62 : 3E         wai            ;wait for interrupt
;SYN69 L7B63:
7B63 : 20 A1      bra L7B06      ;branch always SYNTH6
;*************************************;
;IRQ
;*************************************;
7B65 : 8E 00 7F   lds  #$007F    ;load SP with value 007Fh (#ENDRAM)
7B68 : CE 78 C5   ldx #$78C5     ;load X with value 78C5h (SYN02)
7B6B : DF 26      stx $26        ;store X in addr 26
7B6D : B6 84 02   ldaa $8402     ;load A with addr 8402 (PIA sound select)
7B70 : CE 00 00   ldx #$0000     ;load X with value 0000h
7B73 : DF 22      stx $22        ;store X in addr 22
7B75 : C6 AF      ldab #$AF      ;load B with value AFh
7B77 : D7 1E      stab $1E       ;store B in addr 1E
7B79 : 0E         cli            ;clear interrupts I=0
7B7A : 43         coma           ;complement 1s A, invert bits
7B7B : 81 46      cmpa #$46      ;compare A with value 46h
7B7D : 27 04      beq L7B83      ;branch Z=1 IRQ1
7B7F : 85 40      bita #$40      ;bit test A with value 40h
7B81 : 26 83      bne L7B06      ;branch Z=0 SYNTH6
;IRQ1 L7B83:
7B83 : 84 1F      anda #$1F      ;and A with value 1Fh
7B85 : 27 17      beq L7B9E      ;branch Z=1 IRQ2
7B87 : 81 18      cmpa #$18      ;compare A with value 18h
7B89 : 22 D8      bhi L7B63      ;branch C+Z=0
7B8B : 4A         deca           ;decr A
7B8C : 48         asla           ;arith shift left A
7B8D : CE 7C F6   ldx #$7CF6     ;load X with value 7CF6h ( )
7B90 : 8D 22      bsr L7BB4      ;branch sub CALCOS
7B92 : EE 00      ldx $00,x      ;load X with addr X
7B94 : AD 00      jsr $00,x      ;jump sub to addr X
7B96 : 86 80      ldaa #$80      ;load A with value 80h
7B98 : B7 84 00   staa $8400     ;store A in DAC output SOUND 
7B9B : 7C 00 1F   inc $001F      ;incr value in addr 001F
;IRQ2 L7B9E:
7B9E : 96 20      ldaa $20       ;load A with value in addr 20
;IRQ3 L7BA0:
7BA0 : 27 FE      beq L7BA0      ;branch Z=1 IRQ3
7BA2 : CE 00 00   ldx #$0000     ;load X with value 0000h
7BA5 : DF 22      stx $22        ;store X in addr 22
7BA7 : CE 00 30   ldx #$0030     ;load X with value 0030h
7BAA : C6 1C      ldab #$1C      ;load B with value 1Ch
7BAC : BD 7A 13   jsr L7A13      ;jump sub TRANS
7BAF : BD 78 20   jsr L7820      ;jump sub PARAM1
;IRQ4 L7BB2:
7BB2 : 20 FE      bra L7BB2      ;branch always IRQ4
;*************************************;
;CALCOS - ADDX - ADD A TO INDEX REGISTER
;*************************************;
;L7BB4:
7BB4 : DF 24      stx $24        ;store X in addr 24 (XPLAY)
7BB6 : 9B 25      adda $25       ;add A with value in addr 25 (XPLAY+1)
7BB8 : 97 25      staa $25       ;store A in addr 25 (XPLAY+1)
7BBA : 96 24      ldaa $24       ;load A with value in addr 24 (XPLAY)
7BBC : 89 00      adca #$00      ;A = C + A + 00h
7BBE : 97 24      staa $24       ;store A in addr 24 (XPLAY)
7BC0 : DE 24      ldx $24        ;load X with value at addr 09 (XPLAY)
7BC2 : 39         rts            ;return subroutine
;*************************************;
;NMI
;*************************************;
7BC3 : 0F         sei            ;set interrupt mask I=1
7BC4 : CE 7F FF   ldx #$7FFF     ;load X with value 7FFFh ( )
7BC7 : 5F         clrb           ;clear B
;NMI1 L7BC8:
7BC8 : E9 00      adcb $00,x     ;A = C + A + X,00h
7BCA : 09         dex            ;decr X
7BCB : 8C 78 00   cpx #$7800     ;compare X with value 7800h (PIA sound select)
7BCE : 26 F8      bne L7BC8      ;branch Z=0 NMI1
7BD0 : E1 00      cmpb $00,x     ;compare B with X
7BD2 : 27 01      beq L7BD5      ;branch Z=1 NMI2
7BD4 : 3E         wai            ;wait for interrupt
;NMI2 L7BD5:
7BD5 : CE 78 C5   ldx #$78C5     ;load X with value 78C5h (SYN02)
7BD8 : DF 26      stx $26        ;store X in addr 26
7BDA : CE 00 00   ldx #$0000     ;load X with value 0000h
7BDD : DF 22      stx $22        ;store X in addr 22
7BDF : BD 79 D0   jsr L79D0      ;jump sub SYNTH above
7BE2 : 20 F1      bra L7BD5      ;branch always NMI2
;*************************************;
;FDB tables below
;*************************************;
;L7BE4 16 bytes  FDBTBL1
7BE4 : DA FF
7BE6 : DA 80
7BE8 : 26 01
7BEA : 26 80
7BEC : 07 0A
7BEE : 07 00
7BF0 : F9 F6 
7BF2 : F9 00 
;*************************************;
;L7BF4 16 bytes  FDBTBL2
7BF4 : 3A 3E
7BF6 : 50 46
7BF8 : 33 2C 
7BFA : 27 20 
7BFC : 25 1C 
7BFE : 1A 17
7C00 : 14 11
7C02 : 10 33
;*************************************;
;L7C04 14 bytes  FDBTBL3
7C04 : 08
7C05 : 03 02
7C07 : 01
7C08 : 02 03 04 05
7C0C : 06 
7C0D : 0A 
7C0E : 1E
7C0F : 32
7C10 : 70 00 
;*************************************;
;L7C12 28 bytes  FDBTBL4
7C12 : FF
7C13 : FF FF 90
7C16 : FF FF FF
7C19 : FF FF FF
7C1C : FF 90 FF
7C1F : FF FF FF
7C22 : FF FF FF
7C25 : FF 00 00
7C28 : 00 00 00 00
7C2C : 00 00
;*************************************;
;L7C2E 28 bytes  FDBTBL5
7C2E : 48
7C2F : 01
7C30 : 00 00
7C32 : 3F
7C33 : 3F
7C34 : 00 00
7C36 : 48
7C37 : 01
7C38 : 00 00
7C3A : 01
7C3B : 08
7C3C : 00 00
7C3E : 81 01
7C40 : 00 00
7C42 : 01
7C43 : FF 00 00
7C46 : 01
7C47 : 08
7C48 : 00 00
;*************************************;
;L7C4A 28 bytes  FDBTBL6
7C4A : 01
7C4B : 10
7C4C : 00 00
7C4E : 3F
7C4F : 3F
7C50 : 00 00
7C52 : 01
7C53 : 10
7C54 : 00 00 05 05
7C58 : 00 00
7C5A : 01
7C5B : 01
7C5C : 00 00
7C5E : 31
7C5F : FF 00 00
7C62 : 05 05 00 00
;*************************************;
;L7C66 28 bytes  FDBTBL7
7C66 : 30
7C67 : 00 00 00
7C6A : 7F 00 00
7C6D : 00
7C6E : 30
7C6F : 00 00 00
7C72 : 01
7C73 : 00 00 00
7C76 : 7F 00 00
7C79 : 00 02 00 00
7C7D : 00
7C7E : 01
7C7F : 00 00 00 
;*************************************;
;L7C82 28 bytes  FDBTBL8
7C82 : 04
7C83 : 00 00 04
7C86 : 7F 00 00
7C89 : 7F 04 00
7C8C : 00 04
7C8E : FF 00 00
7C91 : A0 00
7C93 : 00 00 00 00
7C97 : 00 00 00
7C9A : FF 00 00
7C9D : A0 
;*************************************;
;L7C9E ??   FDBTBL9
7C9E : 0C
7C9F : 68 68
7CA1 : 00
7CA2 : 07
7CA3 : 1F
7CA4 : 0F
7CA5 : 00
7CA6 : 0C
7CA7 : 80 80
7CA9 : 00
7CAA : FF FF FF
7CAD : 00 00 00 00
7CB1 : 00 00 00 00
7CB5 : 00
7CB6 : FF FF FF
7CB9 : 00
;*************************************;
; possible Vectors
;*************************************;
;L7CBA   FDBVECT1
7CBA : FF 01 02 C3 FF 00 
;*************************************;
;L7CC0   FDBVECT2
7CC0 : 01 03 FF 80 FF 00
;*************************************;
;L7CC6   FDBVECT3
7CC6 : 20 03 FF 50 FF 00
;*************************************;
;L7CCC   FDBVECT4
7CCC : 50 03 01 20 FF 00
;*************************************;
;L7CD2   FDBVECT5
7CD2 : FE 04 02 04 FF 00 
;*************************************;
;L7CD8   FDBVECT6
7CD8 : 48 03 01 0C FF 00 
;*************************************;
;L7CDE   FDBVECT7
7CDE : 48 02 01 0C FF 00 
;*************************************;
;L7CE4   FDBVECT8
7CE4 : E0 01 02 10 FF 00 
;*************************************;
;L7CEA   FDBVECT9
7CEA : 50 FF 00 00 60 80
;*************************************;
;L7CF0
7CF0 : FF 02 01   stx X0201
7CF3 : 06         tap
7CF4 : FF 00 79   stx X0079
7CF7 : D0 78      subb X0078
7CF9 : D5 78      bitb X0078
7CFB : DA 78      orab X0078
7CFD : DF 78      stx X0078
7CFF : E4 79      andb $79,x
7D01 : 70 79 99   neg X7999
;*************************************;
;SPECIAL ROUTINE JUMP TABLE
;*************************************;
;JMPTBL
7D04 : 78 C9                     ;PARAM2
7D06 : 7A 58                     ;PARAM16
7D08 : 7A 33                     ;PARAM12 
7D0A : 7A 38                     ;PARAM13
7D0C : 7A 4A                     ;PARAM14 
7D0E : 7A 4F                     ;PARAM15
7D10 : 7A 27                     ;PARAM10 
7D12 : 7A 61                     ;PARAM17
7D14 : 7A 6A                     ;PARAM18 
7D16 : 78 E9                     ;PARAM4 
7D18 : 79 1B                     ;PARAM6
7D1A : 79 06                     ;PARAM5
7D1C : 79 CB                     ;PARAM8 
7D1E : 79 42                     ;PARAM7
7D20 : 79 91                     ;SYNTH3 
7D22 : 7A 09                     ;PARAM9
7D24 : 79 51                     ;SYNTH1
;*************************************;
;zero padding
;*************************************;
7D26 : 00
7D27 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D2B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D2F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D33 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D37 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D3B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D3F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D43 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D47 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D4B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D4F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D53 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D57 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D5B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D5F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D63 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D67 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D6B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D6F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D73 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D77 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D7B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D7F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D83 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D87 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D8B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D8F : 00 00 00 00 "    "  db $00, $00, $00, $00
7D93 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D97 : 00 00 00 00 "    "  db $00, $00, $00, $00
7D9B : 00 00 00 00 "    "  db $00, $00, $00, $00
7D9F : 00 00 00 00 "    "  db $00, $00, $00, $00
7DA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DAB : 00 00 00 00 "    "  db $00, $00, $00, $00
7DAF : 00 00 00 00 "    "  db $00, $00, $00, $00
7DB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DBB : 00 00 00 00 "    "  db $00, $00, $00, $00
7DBF : 00 00 00 00 "    "  db $00, $00, $00, $00
7DC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DCB : 00 00 00 00 "    "  db $00, $00, $00, $00
7DCF : 00 00 00 00 "    "  db $00, $00, $00, $00
7DD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DDB : 00 00 00 00 "    "  db $00, $00, $00, $00
7DDF : 00 00 00 00 "    "  db $00, $00, $00, $00
7DE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DEB : 00 00 00 00 "    "  db $00, $00, $00, $00
7DEF : 00 00 00 00 "    "  db $00, $00, $00, $00
7DF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7DFB : 00 00 00 00 "    "  db $00, $00, $00, $00
7DFF : 00 00 00 00 "    "  db $00, $00, $00, $00
7E03 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E07 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E0B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E0F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E13 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E17 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E1B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E1F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E23 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E27 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E2B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E2F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E33 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E37 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E3B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E3F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E43 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E47 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E4B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E4F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E53 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E57 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E5B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E5F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E63 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E67 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E6B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E6F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E73 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E77 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E7B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E7F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E83 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E87 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E8B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E8F : 00 00 00 00 "    "  db $00, $00, $00, $00
7E93 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E97 : 00 00 00 00 "    "  db $00, $00, $00, $00
7E9B : 00 00 00 00 "    "  db $00, $00, $00, $00
7E9F : 00 00 00 00 "    "  db $00, $00, $00, $00
7EA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EAB : 00 00 00 00 "    "  db $00, $00, $00, $00
7EAF : 00 00 00 00 "    "  db $00, $00, $00, $00
7EB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EBB : 00 00 00 00 "    "  db $00, $00, $00, $00
7EBF : 00 00 00 00 "    "  db $00, $00, $00, $00
7EC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7ECB : 00 00 00 00 "    "  db $00, $00, $00, $00
7ECF : 00 00 00 00 "    "  db $00, $00, $00, $00
7ED3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7ED7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EDB : 00 00 00 00 "    "  db $00, $00, $00, $00
7EDF : 00 00 00 00 "    "  db $00, $00, $00, $00
7EE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EEB : 00 00 00 00 "    "  db $00, $00, $00, $00
7EEF : 00 00 00 00 "    "  db $00, $00, $00, $00
7EF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7EFB : 00 00 00 00 "    "  db $00, $00, $00, $00
7EFF : 00 00 00 00 "    "  db $00, $00, $00, $00
7F03 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F07 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F0B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F0F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F13 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F17 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F1B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F1F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F23 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F27 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F2B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F2F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F33 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F37 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F3B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F3F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F43 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F47 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F4B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F4F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F53 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F57 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F5B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F5F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F63 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F67 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F6B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F6F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F73 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F77 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F7B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F7F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F83 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F87 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F8B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F8F : 00 00 00 00 "    "  db $00, $00, $00, $00
7F93 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F97 : 00 00 00 00 "    "  db $00, $00, $00, $00
7F9B : 00 00 00 00 "    "  db $00, $00, $00, $00
7F9F : 00 00 00 00 "    "  db $00, $00, $00, $00
7FA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FAB : 00 00 00 00 "    "  db $00, $00, $00, $00
7FAF : 00 00 00 00 "    "  db $00, $00, $00, $00
7FB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FBB : 00 00 00 00 "    "  db $00, $00, $00, $00
7FBF : 00 00 00 00 "    "  db $00, $00, $00, $00
7FC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FCB : 00 00 00 00 "    "  db $00, $00, $00, $00
7FCF : 00 00 00 00 "    "  db $00, $00, $00, $00
7FD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FDB : 00 00 00 00 "    "  db $00, $00, $00, $00
7FDF : 00 00 00 00 "    "  db $00, $00, $00, $00
7FE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FEB : 00 00 00 00 "    "  db $00, $00, $00, $00
7FEF : 00 00 00 00 "    "  db $00, $00, $00, $00
7FF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
7FF7 : 00
;*************************************;
;Motorola vector table
;*************************************; 
7FF8 : 7B 65                  ;IRQ 
7FFA : 78 01                  ;RESET SWI (software)  
7FFC : 7B C3                  ;NMI  
7FFE : 78 01                  ;RESET (hardware)

;--------------------------------------------------------------




