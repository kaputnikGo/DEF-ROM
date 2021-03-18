				;
				;	Disassembled by:
				;		DASMx object code disassembler
				;		(c) Copyright 1996-2003   Conquest Consultants
				;		Version 1.40 (Oct 18 2003)
				;
				;	File:		StellarWars.716
				;
				;	Size:		2048 bytes
				;	Checksum:	E106
				;	CRC-32:		F4190CA3
				;
				;	Date:		Thu Mar 18 08:13:38 2021
				;
				;	CPU:		Motorola 6800 (6800/6802/6808 family)
				;
				; NOTE: PIA DAC addr 8400
        ; Stellar Wars dated 1979, using SoundROM 1
        ; for System [4]-[6] sound boards (rectangular)
        ; for pinball games Flash[4][1979], Time Warp[6][1979], Stellar Wars[4][1979], Scorpion[6][1980], Tri Zone[6][1979] 
        ;
        ; L7BB4 is bad read?, '7' should be 'F' as in LFBB4
        ; bytes that use '7BB4' et al are annotated with replacement 'F'
        ; and logic checked. Mostly occurs with ldx bytes, mostly.
        ;
        ; updated 18 Mar 2021
				;
					org	$F800
				;     
F800 : 74                       ;hmmm
;*************************************;
;RESET
;*************************************; 
F801 : 0F         sei           ;set interrupt mask      
F802 : 8E 00 7F		lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111) 
F805 : CE 84 00		ldx	#$8400    ;load X with 8400h (1000 0100 0000 0000) PIA addr
F808 : 6F 01      clr	$01,x     ;clr (00) X + 01h (8401) PIA CR port A
F80A : 6F 03      clr	$03,x     ;clr (00) X + 03h (8403) PIA CR port B
F80C : 86 FF      ldaa	#$FF    ;load A with FFh (1111 1111)
F80E : A7 00      staa	$00,x   ;store A in addr X + 00h (8400) PIA port A out (DAC sound)
F810 : 6F 02      clr	$02,x     ;clr (00) X + 01h (8402) PIA port B in (sound select)
F812 : 86 07      ldaa	#$07    ;load A with 07h (0000 0111)
F814 : A7 01      staa	$01,x   ;store A in addr X + 01h (8401) PIA CR port A
F816 : A7 03      staa	$03,x   ;store A in addr X + 03h (8403) PIA CR port B
F818 : 97 1C      staa	X001C   ;store A in addr 1C
F81A : 7F 00 20   clr	X0020     ;clr (00) addr 20
F81D : 0E         cli           ;clear interrupt
;STDBY1
F81E : 20 FE      bra	LF81E     ;branch always here STDBY1
;*************************************;
;PARAM1
;*************************************;
F820 : DF 24      stx	X0024     ;store X in addr 24
F822 : CE 78 C5   ldx	#$78C5    ;load X with 78C5h (LF8C5 is valid)
F825 : DF 26      stx	X0026     ;store X in addr 26
F827 : 86 80      ldaa	#$80    ;load A with 80h (1000 0000)
;LOOP1
F829 : D6 03      ldab	X0003   ;load B with addr 03
F82B : 2A 09      bpl	LF836     ;branch if plus GOTO1
F82D : D6 1D      ldab	X001D   ;load B with addr 1D
F82F : 54         lsrb          ;logic shift right B (bit7=0)
F830 : 54         lsrb          ;logic shift right B
F831 : 54         lsrb          ;logic shift right B (shifts all bits right x3)
F832 : 5C         incb          ;incr B
;LOOP2
F833 : 5A         decb          ;decr B
F834 : 26 FD      bne	LF833     ;branch !=0 LOOP2
;GOTO1
F836 : 7A 00 08   dec	X0008     ;decr addr 08
F839 : 27 4C      beq	LF887     ;branch =0 GOTO5
F83B : 7A 00 09   dec	X0009     ;decr addr 09
F83E : 27 4C      beq	LF88C     ;branch =0 GOTO6
F840 : 7A 00 0A   dec	X000A     ;decr addr 0A
F843 : 27 4C      beq	LF891     ;branch =0 GOTO7
F845 : 7A 00 0B   dec	X000B     ;decr addr 0B
F848 : 26 DF      bne	LF829     ;branch !=0 LOOP1
F84A : D6 03      ldab	X0003   ;load B with addr 03
F84C : 27 DB      beq	LF829     ;branch =0 LOOP1
F84E : C4 7F      andb	#$7F    ;and B with 7Fh (0111 1111)
F850 : D7 0B      stab	X000B   ;store B in addr 0B
F852 : D6 1D      ldab	X001D   ;load B with addr 1D
F854 : 58         aslb          ;arith shift left B (bit0=0)          
F855 : DB 1D      addb	X001D   ;B = B + addr 1D
F857 : CB 0B      addb	#$0B    ;B = B + 0Bh (0000 1011)
F859 : D7 1D      stab	X001D   ;store B in addr 1D
F85B : 7A 00 1B   dec	X001B     ;decr addr 1B
F85E : 26 0E      bne	LF86E     ;branch !=0 GOTO2
F860 : D6 0F      ldab	X000F   ;load B with addr 0F
F862 : D7 1B      stab	X001B   ;store B in addr 1B
F864 : DE 26      ldx	X0026     ;load X with addr 26
F866 : 09         dex           ;decr X
F867 : 8C 78 BE   cpx	#$78BE    ;comp X with 78BEh
F86A : 27 4E      beq	LF8BA     ;branch =0 GOTO10
F86C : DF 26      stx	X0026     ;store X in addr 26
;GOTO2
F86E : D6 1D      ldab	X001D   ;load B with addr 1D
F870 : 2B 06      bmi	LF878     ;branch if minus GOTO3
F872 : D4 07      andb	X0007   ;and B with addr 07
F874 : C4 7F      andb	#$7F    ;and B with 7Fh (0111 1111)
F876 : 20 05      bra	LF87D     ;branch always GOTO4 
;GOTO3
F878 : D4 07      andb	X0007   ;and B with addr 07
F87A : C4 7F      andb	#$7F    ;and B with 7Fh (0111 1111)
F87C : 50         negb          ;negate B
;GOTO4
F87D : 36         psha          ;push A into stack then SP - 1
F87E : 1B         aba           ;A = B + A
F87F : 16         tab           ;trans A to B
F880 : 32         pula          ;SP + 1 pull stack into A          
F881 : DE 26      ldx	X0026     ;load X with addr 26
F883 : AD 00      jsr	$00,x     ;jump sub X + 00h
F885 : 20 A2      bra	LF829     ;branch always LOOP1
;GOTO5
F887 : CE 00 00   ldx	#$0000    ;load X with 0000h
F88A : 20 08      bra	LF894     ;branch always GOTO8
;GOTO6
F88C : CE 00 01   ldx	#$0001    ;load X with 0001h
F88F : 20 03      bra	LF894     ;branch always GOTO8
;GOTO7
F891 : CE 00 02   ldx	#$0002    ;load X with 0002h
;GOTO8
F894 : 6D 18      tst	$18,x     ;test addr X + 18h
F896 : 27 12      beq	LF8AA     ;branch +0 GOTO9
F898 : 6A 18      dec	$18,x     ;decr addr X + 18h
F89A : 26 0E      bne	LF8AA     ;branch !=0 GOTO9
F89C : E6 0C      ldab	$0C,x   ;load B with addr X + 0Ch
F89E : E7 18      stab	$18,x   ;store B in addr X + 18h
F8A0 : E6 00      ldab	$00,x   ;load B with addr X + 00h
F8A2 : EB 10      addb	$10,x   ;B = B + (X + 10h)
F8A4 : E1 14      cmpb	$14,x   ;comp B with addr X + 14h
F8A6 : 27 12      beq	LF8BA     ;branch =0 GOTO10
F8A8 : E7 00      stab	$00,x   ;store B in addr X + 00h
;GOTO9
F8AA : E6 00      ldab	$00,x   ;load B with addr X + 00h
F8AC : E7 08      stab	$08,x   ;store B in addr X + 08h
F8AE : AB 04      adda	$04,x   ;A = A + (X + 04h)
F8B0 : 60 04      neg	$04,x     ;negate addr X + 04h
F8B2 : 16         tab           ;trans A to B
F8B3 : DE 26      ldx	X0026     ;load X with addr 26
F8B5 : AD 00      jsr	$00,x     ;jump sub to addr X + 00h
F8B7 : 7E 78 29   jmp	L7829     ;jump L7829 (LF829 is valid LOOP1)
;GOTO10
F8BA : DE 24      ldx	X0024     ;load X with addr 24
F8BC : 39         rts           ;return subroutine
;*************************************;
;SYNTH1
;*************************************;
F8BD : 54         lsrb          ;logic shift right B (bit7=0)
F8BE : 54         lsrb          ;logic shift right B
F8BF : 54         lsrb          ;logic shift right B
F8C0 : 54         lsrb          ;logic shift right B
F8C1 : 54         lsrb          ;logic shift right B
F8C2 : 54         lsrb          ;logic shift right B
F8C3 : 54         lsrb          ;logic shift right B
F8C4 : 54         lsrb          ;logic shift right B (shifts all bits right x8)
F8C5 : F7 84 00   stab	X8400   ;store B in DAC output SOUND 
F8C8 : 39         rts           ;return subroutine
;*************************************;
;PARAM2
;*************************************;
F8C9 : CE 7C 12   ldx	#$7C12    ;load X with 7C12h (FC12 is data table?)
;LOOP3
F8CC : C6 1C      ldab	#$1C    ;load B with 1Ch (0001 1100)
F8CE : BD 7A 13   jsr	L7A13     ;jump sub L7A13 (FA13 is valid UTIL1)
F8D1 : BD 78 20   jsr	L7820     ;jump sub L7820 (F820 is valid PARAM1)
F8D4 : 39         rts           ;return subroutine
;*************************************; 1C (28 bits)
;PRM21
F8D5 : CE 7C 2E   ldx	#$7C2E    ;load X with 7C2Eh (FC2E is data)
F8D8 : 20 F2      bra	LF8CC     ;branch always LOOP3
;*************************************; 1C (28 bits)
;PRM22
F8DA : CE 7C 4A   ldx	#$7C4A    ;load X with 7C4Ah (FC4A is data)  
F8DD : 20 ED      bra	LF8CC     ;branch always LOOP3
;*************************************; 1C (28 bits)
;PRM23
F8DF : CE 7C 66   ldx	#$7C66    ;load X with 7C66h (FC66 is data)
F8E2 : 20 E8      bra	LF8CC     ;branch always LOOP3
;*************************************; 1C (28 bits)
;PRM24
F8E4 : CE 7C 82   ldx	#$7C82    ;load X with 7C82h (FC82 is data)
F8E7 : 20 E3      bra	LF8CC     ;branch always LOOP3
;*************************************; 1C (28 bits)
;PRM25
F8E9 : 7C 00 20   inc	X0020     ;incr addr 20
F8EC : 7C 00 1F   inc	X001F     ;incr addr 1F
F8EF : CE 00 30   ldx	#$0030    ;load X with 0030h (0011 0000)
F8F2 : DF 22      stx	X0022     ;store X in addr 22
F8F4 : CE 7C 9E   ldx	#$7C9E    ;load X with 7C9Eh (FC9E is data) 
F8F7 : C6 1C      ldab	#$1C    ;load B with 1C (0001 1100) (is data bits gap)
F8F9 : BD 7A 13   jsr	L7A13     ;jump sub L7A13 (FA13 is valid UTIL1)
F8FC : CE 00 00   ldx	#$0000    ;load X with 0000h
F8FF : DF 22      stx	X0022     ;store X in addr 22
F901 : CE 7C 9E   ldx	#$7C9E    ;load X with 7C9Eh (FC9E is data) 
F904 : 20 C6      bra	LF8CC     ;branch always LOOP3
;*************************************;
;PARAM3
;*************************************;
F906 : 7F 00 20   clr	X0020     ;clr (00) addr 20
F909 : C6 88      ldab	#$88    ;load B with 88h (1000 1000)
F90B : D7 21      stab	X0021   ;store B in addr 21
F90D : CE 00 60   ldx	#$0060    ;load X with 00060h
F910 : DF 22      stx	X0022     ;store X in addr 22
F912 : CE 7C F0   ldx	#$7CF0    ;load X with 7CF0h (FCF0 is data)
F915 : C6 06      ldab	#$06    ;load B with 06h (0000 0110)
F917 : BD 7A 13   jsr	L7A13     ;jump sub L7A13 (FA13 is valid UTIL1)
F91A : 39         rts           ;return subroutine
;*************************************;
;PARAM4
;*************************************;
F91B : 96 1F      ldaa	X001F   ;load A with addr 1F
F91D : 27 1E      beq	LF93D     ;branch =0 GOTO12
F91F : 7F 00 1F   clr	X001F     ;clr (00) addr 1F
F922 : CE 00 31   ldx	#$0031    ;load X with 0031h (0011 0001)
F925 : C6 06      ldab	#$06    ;load B with 06h (0000 0110)
F927 : A6 00      ldaa	$00,x   ;load A with addr X + 00h
F929 : 81 36      cmpa	#$36    ;comp A with 36h (0011 0110)
F92B : 22 08      bhi	LF935     ;branch if higher GOTO11
F92D : C6 04      ldab	#$04    ;load B with 04h (0000 0100)
F92F : 81 10      cmpa	#$10    ;comp A with 10h (0001 0000)
F931 : 22 02      bhi	LF935     ;branch if higher GOTO11
F933 : C6 02      ldab	#$02    ;load B with 02h (0000 0010)
;GOTO11
F935 : 10         sba           ;A = A - B
F936 : A7 00      staa	$00,x   ;store A in addr X + 00h
F938 : A6 01      ldaa	$01,x   ;load A from addr X + 01h
F93A : 10         sba           ;A = A - B
F93B : A7 01      staa	$01,x   ;store A in addr X + 01h
;GOTO12
F93D : 32         pula          ;SP + 1 pull stack into A
F93E : 32         pula          ;SP + 1 pull stack into A
F93F : 7E 7B 9E   jmp	L7B9E     ;jump L7B9E (FB9E is valid IRQ3)
;*************************************;
;PARAM5
;*************************************;
F942 : CE 00 60   ldx	#$0060    ;load X with 0060h (0000 0110)
F945 : A6 00      ldaa	$00,x   ;load A with addr X + 00h
F947 : 80 02      suba	#$02    ;A = A - 02h (0000 0010)
F949 : A7 00      staa	$00,x   ;store A in addr X + 00h
F94B : BD 7A 92   jsr	L7A92     ;jump sub L7A92 (FA92 is valid)
F94E : 7E 7A AB   jmp	L7AAB     ;jump L7AAB (FAAB is valid)
;*************************************;
;SYNTH2
;*************************************;
F951 : CE 00 01   ldx	#$0001    ;load X with 0001
F954 : DF 00      stx	X0000     ;store X in addr 00
F956 : CE 03 80   ldx	#$0380    ;load X with 0380h (0000 0011 1000 0000)
F959 : DF 02      stx	X0002     ;store X in addr 02
;LOOP4
F95B : 7F 84 00   clr	X8400     ;clear (00) in DAC output SOUND
F95E : DE 00      ldx	X0000     ;load X with addr 00 
F960 : 08         inx           ;incr X
F961 : DF 00      stx	X0000     ;store X in addr 00
;LOOP5
F963 : 09         dex           ;decr X
F964 : 26 FD      bne	LF963     ;branch !=0 LOOP5 
F966 : 73 84 00   com	X8400     ;complement 1s in DAC output SOUND
F969 : DE 02      ldx	X0002     ;load X with addr 02
;LOOP6
F96B : 09         dex           ;decr X
F96C : 26 FD      bne	LF96B     ;branch !=0 LOOP6 
F96E : 20 EB      bra	LF95B     ;branch always LOOP4
;*************************************;
;SYNTH3
;*************************************;
F970 : 5F	        clrb          ;clr (00) B
F971 : F7 84 00   stab	X8400   ;store B in DAC output SOUND
F974 : CE 00 DF   ldx	#$00DF    ;load X with 00DF (1101 1111)
;LOOP7
F977 : 86 20      ldaa	#$20    ;load A with 20h (0010 0000)
F979 : BD 7B B4   jsr	L7BB4     ;jump sub L7BB4 (FBB4 is valid IRQ4)
;LOOP8
F97C : 09         dex           ;decr X
F97D : 26 FD      bne	LF97C     ;branch !=0 LOOP8
F97F : 73 84 00   com	X8400     ;complements 1s in DAC output SOUND
;LOOP9
F982 : 5A         decb          ;decr B
F983 : 26 FD      bne	LF982     ;branch !=0 LOOP9
F985 : 73 84 00   com	X8400     ;complements 1s in DAC output SOUND
F988 : 96 24      ldaa	X0024   ;load A with addr 24
F98A : DE 24      ldx	X0024     ;load X with addr 24
F98C : 85 10      bita	#$10    ;bit test A with 10h (0001 0000)
F98E : 27 E7      beq	LF977     ;branch =0 LOOP7
F990 : 39         rts           ;return subroutine
;*************************************;
;PARAM6
;*************************************;
F991 : C6 01      ldab	#$01    ;load B with 01h (0000 0001)
F993 : D7 00      stab	X0000   ;store B in addr 00
F995 : C6 FF      ldab	#$FF    ;load B with FFh (1111 1111)
F997 : 20 06      bra	LF99F     ;branch always SYN41
;*************************************;
;SYNTH4 (similar to SYNTH4 in Varkon)
;*************************************;
F999 : C6 01      ldab	#$01    ;load B with 01h (0000 0001)
F99B : D7 00      stab	X0000   ;store B in addr 00
F99D : C6 AF      ldab	#$AF    ;load B with AFh (1010 1111)
;SYN41
F99F : D7 02      stab	X0002   ;store B in addr 02
;LOOP10
F9A1 : C6 03      ldab	#$03    ;load B with 03h (0000 0011)
F9A3 : D7 01      stab	X0001   ;store B in addr 01
;LOOP11
F9A5 : D6 02      ldab	X0002   ;load B with addr 02
F9A7 : 96 1D      ldaa	X001D   ;load A with addr 1D
F9A9 : 44         lsra          ;logic shift right A (bit7=0)
F9AA : 44         lsra          ;logic shift right A
F9AB : 44         lsra          ;logic shift right A
F9AC : 98 1D      eora	X001D   ;exclusive OR A with addr 1D
F9AE : 44         lsra          ;logic shift right A (bit7=0)
F9AF : 76 00 1C   ror	X001C     ;rotate right addr 1C (bit7=C,C=bit0)
F9B2 : 76 00 1D   ror	X001D     ;rotate right addr 1D (bit7=C,C=bit0)
F9B5 : 24 01      bcc	LF9B8     ;branch Carry clear SYN42 
F9B7 : 53         comb          ;complement 1s B
;SYN42
F9B8 : F7 84 00   stab	X8400   ;store B in DAC output SOUND
F9BB : D6 00      ldab	X0000   ;load B with addr 00
;LOOP12
F9BD : 5A         decb          ;decr B
F9BE : 26 FD      bne	LF9BD     ;branch !=0 LOOP12
F9C0 : 7A 00 01   dec	X0001     ;decr addr 01
F9C3 : 26 E0      bne	LF9A5     ;branch !=0 LOOP11
F9C5 : 7C 00 00   inc	X0000     ;incr addr 00
F9C8 : 26 D7      bne	LF9A1     ;branch !=0 LOOP10
F9CA : 39         rts           ;return subroutine
;*************************************;
;PARAM7
;*************************************;
F9CB : 7A 00 21   dec	X0021     ;decr addr 21
F9CE : 20 04      bra	LF9D4     ;branch always SYN51
;*************************************;
;SYNTH5
;*************************************;
F9D0 : C6 A0      ldab	#$A0    ;load B with A0h (1010 0000)
F9D2 : D7 21      stab	X0021   ;store B in addr 21
;SYN51
F9D4 : 86 04      ldaa	#$04    ;load A with 04h (0000 0100)
F9D6 : 97 01      staa	X0001   ;store A in addr 01
;SYN52
F9D8 : 86 9F      ldaa	#$9F    ;load A with 9Fh (1001 1111)
F9DA : D6 21      ldab	X0021   ;load B with addr 21
;LOOP13
F9DC : CE 01 C0   ldx	#$01C0    ;load X with 01C0h (0000 0001 1100 0000)
;LOOP14
F9DF : 09         dex           ;decr X
F9E0 : 27 20      beq	LFA02     ;branch =0 SYN53
F9E2 : F7 00 00   stab	X0000   ;store B in addr 00
F9E5 : B7 84 00   staa	X8400   ;store A in DAC output SOUND
;LOOP15
F9E8 : 09         dex           ;decr X
F9E9 : 27 17      beq	LFA02     ;branch =0 SYN53     
F9EB : 7A 00 00   dec	X0000     ;decr addr 00
F9EE : 26 F8      bne	LF9E8     ;branch !=0 LOOP15
F9F0 : 09         dex           ;decr X
F9F1 : 27 0F      beq	LFA02     ;branch =0 SYN53
F9F3 : D7 00      stab	X0000   ;store B in addr 00
F9F5 : 73 84 00   com	X8400     ;complements 1s in DAC output SOUND
;LOOP16
F9F8 : 09         dex           ;decr X
F9F9 : 27 07      beq	LFA02     ;branch =0 SYN53
F9FB : 7A 00 00   dec	X0000     ;decr addr 00
F9FE : 26 F8      bne	LF9F8     ;branch !=0 LOOP16
FA00 : 20 DD      bra	LF9DF     ;branch always LOOP14
;SYN53
FA02 : D0 01      subb	X0001   ;B = B - addr 01
FA04 : C1 10      cmpb	#$10    ;comp B with 10h (0001 0000)
FA06 : 22 D4      bhi	LF9DC     ;branch if higher LOOP13
FA08 : 39         rts           ;return subroutine
;*************************************;
;PARAM8
;*************************************;
FA09 : C6 11      ldab	#$11    ;load B with 11h (0001 0001)
FA0B : D7 21      stab	X0021   ;store B in addr 21
FA0D : 86 FE      ldaa	#$FE    ;load A with FEh (1111 1110)
FA0F : 97 01      staa	X0001   ;store A in addr 01
FA11 : 20 C5      bra	LF9D8     ;branch always SYN52
;*************************************;
;UTIL1
;*************************************;
FA13 : 36         psha          ;push A into stack then SP - 1
;LOOP17
FA14 : A6 00      ldaa	$00,x   ;load A with addr X + 00h
FA16 : DF 24      stx	X0024     ;store X in addr 24
FA18 : DE 22      ldx	X0022     ;load X with addr 22
FA1A : A7 00      staa	$00,x   ;store A in addr X + 00h
FA1C : 08         inx           ;incr X
FA1D : DF 22      stx	X0022     ;store X in addr 22
FA1F : DE 24      ldx	X0024     ;load X with addr 24
FA21 : 08         inx           ;incr X
FA22 : 5A         decb          ;decr B
FA23 : 26 EF      bne	LFA14     ;branch !=0 LOOP17
FA25 : 32         pula          ;SP + 1 pull stack into A
FA26 : 39         rts           ;return subroutine
;*************************************;
;PARAM9
;*************************************;
FA27 : CE 7C BA   ldx	#$7CBA    ;load X with 7CBAh (FCBA is data)
FA2A : 20 26      bra	LFA52     ;branch always below
;*************************************;
;PARAM10
;*************************************;
FA2C : BD 7A 92   jsr	L7A92     ;jump sub L7A92 (FA92 is valid)
FA2F : BD 7A AB   jsr	L7AAB     ;jump sub L7AAB (FAAB is valid SYNTH6)
FA32 : 39         rts           ;return subroutine
;*************************************;
;PRM101
FA33 : CE 7C C0   ldx	#$7CC0    ;load X with 7CC0h (FCC0 is data)
FA36 : 20 F4      bra	LFA2C     ;branch always PARAM10
;*************************************;
;PRM102
FA38 : C6 FF      ldab	#$FF    ;load B with FFh (1111 1111)
FA3A : D7 1E      stab	X001E   ;store B inaddr 1E
;LOOP19
FA3C : CE 7C C6   ldx	#$7CC6    ;load X with 7CC6h (FCC6 is data)
FA3F : 8D EB      bsr	LFA2C     ;branch sub PARAM10
FA41 : CE 7C CC   ldx	#$7CCC    ;load X with 7CCCh (FCCC is data)
FA44 : 8D E6      bsr	LFA2C     ;branch sub PARAM10
FA46 : 5A         decb          ;decr B
FA47 : 26 F3      bne	LFA3C     ;branch !=0 LOOP19
FA49 : 39         rts           ;return subroutine
;*************************************;
;PARAM11
;*************************************;
FA4A : CE 7C D2   ldx	#$7CD2    ;load X with 7CD2h (FCD2 is data)
FA4D : 20 DD      bra	LFA2C     ;branch always PARAM10
;*************************************;
;PRM111
FA4F : CE 7C DE   ldx	#$7CDE    ;load X with 7CDEh (FCDE is data)
;LOOP20
FA52 : 8D D8      bsr	LFA2C     ;branch sub PARAM10
FA54 : 8D 30      bsr	LFA86     ;branch sub PARAM15
FA56 : 20 FA      bra	LFA52     ;branch always LOOP20
;*************************************;
;PARAM12
;*************************************;
FA58 : 86 FF      ldaa	#$FF    ;load A with FFh (1111 1111)
FA5A : 97 1E      staa	X001E   ;store A in addr 1E
FA5C : CE 7C E4   ldx	#$7CE4    ;load X with 7CE4h (FCE4 is data)
FA5F : 20 F1      bra	LFA52     ;branch always LOOP20
;*************************************;
;PARAM13
;*************************************;
FA61 : 86 FF      ldaa	#$FF    ;load A with FFh (1111 1111)
FA63 : 97 1E      staa	X001E   ;store A in addr 1E
FA65 : CE 7C D8   ldx	#$7CD8    ;load X with 7CD8h (FCD8 is data) 
FA68 : 20 E8      bra	LFA52     ;branch always LOOP20
;*************************************;
;PARAM14
;*************************************;
FA6A : C6 30      ldab	#$30    ;load B with 30h (0011 0000)
FA6C : CE 7C EA   ldx	#$7CEA    ;load X with 7CEAh (FCEA is data)
FA6F : 8D 21      bsr	LFA92     ;branch sub PARAM16
;LOOP21
FA71 : 96 1D      ldaa	X001D   ;load A with addr 1D
FA73 : 48         asla          ;arith shift left A (bit0 is 0)
FA74 : 9B 1D      adda	X001D   ;add A with addr 1D
FA76 : 8B 0B      adda	#$0B    ;add A with 0Bh (0000 1011)
FA78 : 97 1D      staa	X001D   ;store A in addr 1D
FA7A : 44         lsra          ;logic shift right A (bit7=0)
FA7B : 44         lsra          ;logic shift right A (bit7=0)
FA7C : 8B 0C      adda	#$0C    ;add A with 0Ch (0000 1100)
FA7E : 97 01      staa	X0001   ;store A in addr 01
FA80 : 8D 29      bsr	LFAAB     ;branch sub SYNTH6
FA82 : 5A         decb          ;decr B
FA83 : 26 EC      bne	LFA71     ;branch !=0 LOOP21
FA85 : 39         rts           ;return subroutine
;*************************************;
;PARAM15
;*************************************;
FA86 : 96 1E      ldaa	X001E   ;load A with addr 1E
FA88 : 80 08      suba	#$08    ;A = A - 08h (0000 1000)
FA8A : 2A 03      bpl	LFA8F     ;branch if plus GOTO13
FA8C : 97 1E      staa	X001E   ;store A in addr 1E
FA8E : 39         rts           ;return subroutine
;GOTO13
FA8F : 32         pula          ;SP + 1 pull stack into A
FA90 : 32         pula          ;SP + 1 pull stack into A
FA91 : 39         rts           ;return subroutine
;*************************************;
;PARAM16 (6 bytes is the length of a data wavetable)
;*************************************;
FA92 : A6 00      ldaa	$00,x   ;load A addr X + 00h
FA94 : 97 01      staa	X0001   ;store A in addr 01
FA96 : A6 01      ldaa	$01,x   ;load A addr X + 01h
FA98 : 97 02      staa	X0002   ;store A in addr 02
FA9A : A6 02      ldaa	$02,x   ;load A addr X + 02h
FA9C : 97 03      staa	X0003   ;store A in addr 03
FA9E : A6 03      ldaa	$03,x   ;load A addr X + 03h
FAA0 : 97 04      staa	X0004   ;store A in addr 04
FAA2 : A6 04      ldaa	$04,x   ;load A addr X + 04h
FAA4 : 97 05      staa	X0005   ;store A in addr 05
FAA6 : A6 05      ldaa	$05,x   ;load A addr X + 05h
FAA8 : 97 06      staa	X0006   ;store A in addr 06
FAAA : 39         rts           ;return subroutine
;*************************************;
;SYNTH6
;*************************************;
FAAB : 96 1E      ldaa	X001E   ;load A with addr 1E
FAAD : 37         pshb          ;push B into stack then SP - 1
FAAE : D6 05      ldab	X0005   ;load B with addr 05
FAB0 : D7 07      stab	X0007   ;store B in addr 07
FAB2 : D6 02      ldab	X0002   ;load B with addr 02
FAB4 : D7 08      stab	X0008   ;store B in addr 08
;LOOP22
FAB6 : 43         coma          ;complement 1s A
FAB7 : D6 01      ldab	X0001   ;load B with addr 01
FAB9 : B7 84 00   staa	X8400   ;store A in DAC output SOUND
;LOOP23
FABC : 5A         decb          ;decr B
FABD : 26 FD      bne	LFABC     ;branch !=0 LOOP23
FABF : 43         coma          ;complement 1s A
FAC0 : D6 01      ldab	X0001   ;load B with addr 01
FAC2 : 20 00      bra	LFAC4     ;branch always below 1
FAC4 : 08         inx           ;incr X
FAC5 : 09         dex           ;decr X
FAC6 : 08         inx           ;incr X
FAC7 : 09         dex           ;decr X
FAC8 : B7 84 00   staa	X8400   ;store A in DAC output SOUND
;LOOP23
FACB : 5A         decb          ;decr B
FACC : 26 FD      bne	LFACB     ;branch !=0 LOOP23
FACE : 7A 00 08   dec	X0008     ;decr addr 08
FAD1 : 27 16      beq	LFAE9     ;branch =0 SYN61
FAD3 : 7A 00 07   dec	X0007     ;decr addr 07
FAD6 : 26 DE      bne	LFAB6     ;branch !=0 LOOP22
FAD8 : 43         coma          ;complement 1s A
FAD9 : D6 05      ldab	X0005   ;load B with addr 05
FADB : B7 84 00   staa	X8400   ;store A in DAC output SOUND
FADE : D7 07      stab	X0007   ;store B in addr 07
FAE0 : D6 01      ldab	X0001   ;load B with addr 01
FAE2 : 9B 06      adda	X0006   ;add A with addr 06
FAE4 : 2B 1E      bmi	LFB04     ;branch if minus SYN63
FAE6 : 01         nop           ;
FAE7 : 20 15      bra	LFAFE     ;branch always SYN62
;SYN61:
FAE9 : 08         inx           ;incr X
FAEA : 09         dex           ;decr X
FAEB : 01         nop           ;
FAEC : 43         coma          ;complement 1s A
FAED : D6 02      ldab	X0002   ;load B with addr 02
FAEF : B7 84 00   staa	X8400   ;store A in DAC output SOUND
FAF2 : D7 08      stab	X0008   ;store B in addr 08
FAF4 : D6 01      ldab	X0001   ;load B with addr 01
FAF6 : D0 03      subb	X0003   ;B = B - addr 03
FAF8 : D1 04      cmpb	X0004   ;comp B with addr 04
FAFA : D1 04      cmpb	X0004   ;comp B with addr 04
FAFC : 27 06      beq	LFB04     ;branch =0 SYN63
;SYN62
FAFE : D7 01      stab	X0001   ;store A in addr 01
FB00 : C0 05      subb	#$05    ;B = B - 05h (0000 0101)
FB02 : 20 B8      bra	LFABC     ;branch always LOOP23
;SYN63
FB04 : 33         pulb          ;SP + 1 pull stack into B
FB05 : 39         rts           ;return subroutine
;*************************************;
;SYNTH7
;*************************************;
FB06 : 84 1F      anda	#$1F    ;and A with 1Fh (0001 1111)
FB08 : 27 FE      beq	LFB08     ;branch =0 to here
FB0A : 81 11      cmpa	#$11    ;comp A with 11h (0001 0001)
FB0C : 27 FE      beq	LFB0C     ;branch =0 to here
FB0E : 81 12      cmpa	#$12    ;comp A with 12h (0001 0010)
FB10 : 27 FE      beq	LFB10     ;branch =0 to here
FB12 : 84 0F      anda	#$0F    ;and A with 0Fh (0000 1111)
FB14 : CE 7B F4 	ldx	#$7BF4    ;load X with 7BF4h (FBF4 is data)
FB17 : BD 7B B4   jsr	L7BB4     ;jump sub L7BB4 (FBB4 is valid IRQ4)
FB1A : A6 00      ldaa	$00,x   ;load A with addr X + 00h
FB1C : 97 18      staa	X0018   ;store A in addr 18
FB1E : CE 7B E4	  ldx	#$7BE4    ;load X with 7BE4h (FBE4 is data)
FB21 : C6 10      ldab	#$10    ;load B with 10h (0001 0000)
FB23 : BD 7A 13   jsr	L7A13     ;jump sub UTIL1
FB26 : CE 7C 04   ldx	#$7C04    ;load X with 7C04h (FC04 is data)
FB29 : E6 00      ldab	$00,x   ;load B with addr X + 00h
;LOOP24
FB2B : D7 1A      stab	X001A   ;store B in addr 1A
FB2D : DF 22      stx	X0022     ;store X in addr 22
;LOOP25 LFB2F:
FB2F : CE 00 00   ldx	#$0000    ;load X with 0000h
FB32 : C6 08      ldab	#$08    ;load B with 08h (0000 1000)
FB34 : D7 19      stab	X0019   ;store B in addr 19
;LOOP26
FB36 : A6 00      ldaa	$00,x   ;load A with addr X + 00h
FB38 : D6 18      ldab	X0018   ;load B with addr 18
FB3A : 7D 00 1A   tst	X001A     ;test addr 1A
FB3D : 26 06      bne	LFB45     ;branch !=0 SYN71
FB3F : A0 08      suba	$08,x   ;sub A with addr X + 08h
FB41 : A7 00      staa	$00,x   ;store A in addr X + 00h
FB43 : C0 03      subb	#$03    ;sub B with 03h (0000 0011)
;SYN71
FB45 : 08         inx           ;incr X
FB46 : B7 84 00   staa	X8400   ;store A in DAC output SOUND
;LOOP27
FB49 : 5A         decb          ;decr B
FB4A : 26 FD      bne	LFB49     ;branch !=0 LOOP27
FB4C : 7A 00 19   dec	X0019     ;dec addr 19
FB4F : 26 E5      bne	LFB36     ;branch !=0 LOOP26
FB51 : 7A 00 1A 	dec	X001A     ;decr addr 1A
FB54 : 2A D9      bpl	LFB2F     ;branch if plus LOOP25
FB56 : DE 22      ldx	X0022     ;load X with addr 22
FB58 : 08         inx           ;incr X
FB59 : E6 00      ldab	$00,x   ;load B with addr X + 00h
FB5B : 26 CE      bne	LFB2B     ;branch !=0 LOOP24
FB5D : 86 80      ldaa	#$80    ;load A with 80h (1000 0000)
FB5F : B7 84 00 	staa	X8400   ;store A in DAC output SOUND
FB62 : 3E         wai           ;wait for interrupt
;SYN81
FB63 : 20 A1      bra	LFB06     ;branch always SYNTH7
;*************************************;
;IRQ
;*************************************; 
FB65 : 8E 00 7F   lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111)
FB68 : CE 78 C5   ldx	#$78C5    ;load X with 78C5h (LF8C5 is valid)
FB6B : DF 26      stx	X0026     ;store X in addr 26
FB6D : B6 84 02   ldaa	X8402   ;load A with 8402 PIA sound select
FB70 : CE 00 00   ldx	#$0000    ;load X with 0000h
FB73 : DF 22      stx	X0022     ;store X in addr 22
FB75 : C6 AF      ldab	#$AF    ;load B with AFh (1010 1111
FB77 : D7 1E      stab	X001E   ;store B in addr 1E
FB79 : 0E         cli           ;clear interrupt
FB7A : 43         coma          ;complements 1s in A (sound select value)
FB7B : 81 46      cmpa	#$46    ;comp A to 46h (0100 0110)
FB7D : 27 04      beq	LFB83     ;branch =0 IRQ2 
FB7F : 85 40      bita	#$40    ;bit test A with 40h (0100 0000)
FB81 : 26 83      bne	LFB06     ;branch !=0 above SYNTH7
;IRQ2
FB83 : 84 1F      anda	#$1F    ;and A with 1Fh (0001 1111)
FB85 : 27 17      beq	LFB9E     ;branch =0 IRQ3 
FB87 : 81 18      cmpa	#$18    ;comp A with 18h (0001 1000)
FB89 : 22 D8      bhi	LFB63     ;branch if higher SYN81
FB8B : 4A         deca          ;decr A
FB8C : 48         asla          ;arith shift left A (bit0=0)
FB8D : CE 7C F6   ldx	#$7CF6    ;load X with 7CF6h
FB90 : 8D 22      bsr	LFBB4     ;branch sub IRQ4 
FB92 : EE 00      ldx	$00,x     ;load X with addr X + 00h
FB94 : AD 00      jsr	$00,x     ;jump sub addr X + 00h
FB96 : 86 80      ldaa	#$80    ;load A with 80h (1000 0000)
FB98 : B7 84 00   staa	X8400   ;store A in DAC output SOUND
FB9B : 7C 00 1F   inc	X001F     ;incr addr 1F
;IRQ3
FB9E : 96 20      ldaa	X0020   ;load A with addr 20
;STDBY2
FBA0 : 27 FE      beq	LFBA0     ;branch =0 STDBY2 
FBA2 : CE 00 00   ldx	#$0000    ;load X with 0000h
FBA5 : DF 22      stx	X0022     ;store X in addr 22
FBA7 : CE 00 30   ldx	#$0030    ;load X with 0030h
FBAA : C6 1C      ldab	#$1C    ;load B with 1Ch (0001 1100)
FBAC : BD 7A 13   jsr	L7A13     ;jump sub L7A13 ? (LFA13 is valid)
FBAF : BD 78 20   jsr	L7820     ;jump sub L7820 ? (LF820 is valid PARAM1)
;STDBY3
FBB2 : 20 FE      bra	LFBB2     ;branch always here STDBY3
;IRQ4
FBB4 : DF 24      stx	X0024     ;store X in addr 24
FBB6 : 9B 25      adda	X0025   ;add A with addr 25
FBB8 : 97 25      staa	X0025   ;store A in addr 25
FBBA : 96 24      ldaa	X0024   ;load A with addr 24
FBBC : 89 00      adca	#$00    ;A = Carry + A + 00h 
FBBE : 97 24      staa	X0024   ;store A in addr 24
FBC0 : DE 24      ldx	X0024     ;load X with addr 24
FBC2 : 39         rts           ;return subroutine
;*************************************;
;NMI
;*************************************; 
FBC3 : 0F	        sei           ;set interrupt mask
FBC4 : CE 7F FF   ldx	#$7FFF    ;load X with 7FFFh (0111 1111 1111 1111)
FBC7 : 5F         clrb          ;clear (00) B
;LFBC8:
FBC8 : E9 00      adcb	$00,x   ;B = Carry + B + 00h 
FBCA : 09         dex           ;decr X
FBCB : 8C 78 00   cpx	#$7800    ;comp X with 7800h (PIA addr)
FBCE : 26 F8      bne	LFBC8     ;branch !=0 above
FBD0 : E1 00      cmpb	$00,x   ;comp B with addr X + 00h
FBD2 : 27 01      beq	LFBD5     ;branch =0 below
FBD4 : 3E         wai           ;wait for interrupt
;LFBD5:
FBD5 : CE 78 C5   ldx	#$78C5    ;load X with 78C5h (LF8C5 is valid)
FBD8 : DF 26      stx	X0026     ;store X in addr 26
FBDA : CE 00 00   ldx	#$0000    ;load X with 0000h
FBDD : DF 22      stx	X0022     ;store X in addr 22
FBDF : BD 79 D0   jsr	L79D0     ;jump sub L79D0 (LF9D0 is valid) 
FBE2 : 20 F1      bra	LFBD5     ;branch always above
;*************************************;
; data below (16 bytes?)
;*************************************; 
; called by X
FBE4 : DA FF DA 80
FBE8 : 26 01 26 80
FBEC : 07 0A 07 00
FBF0 : F9 F6 F9	00
; called by X 
FBF4 : 3A	3E 50 46
FBF8 : 33	2C 27	20 
FBFC : 25	1C 1A	17
FC00 : 14	11 10	33
; called by X (shorter?)
FC04 : 08 03 02 01
FC08 : 02 03 04 05
FC0C : 06	0A 1E	32
FC10 : 70 00
;*************************************;
; data below called by X (range of 1Ch or 28 bits?) 
; (version of Vari Vectors? 4x7 bits)
;*************************************; 
FC12 : FF	FF
FC14 : FF 90
FC16 : FF FF FF	FF FF FF FF 90 
FC1E : FF	FF FF FF FF FF FF FF 
FC26 : 00 00 00 00 00 00 00 00
; called by X
FC2E : 48 01
FC30 : 00 00
FC32 : 3F	3F 00 00 48	01 00 00
FC3A : 01	08 00 00 81 01 00 00
FC42 : 01 FF 00 00 01	08 00 00
; called by X
FC4A : 01	10
FC4C : 00 00
FC4E : 3F	3F 00 00 01	10 00 00 
FC56 : 05 05 00 00 01 01 00 00
FC5E : 31 FF 00 00 05 05 00 00
; called by X
FC66 : 30	00 
FC68 : 00 00
FC6A : 7F 00 00	00 30	00 00 00
FC72 : 01	00 00 00 7F 00 00	00 
FC7A : 02 00 00	00 01	00 00 00 
; called by X
FC82 : 04	00 
FC84 : 00 04 
FC86 : 7F 00 00	7F 04 00 00 04 
FC8E : FF 00 00 A0 00 00 00 00 
FC96 : 00 00 00 00 FF 00 00	A0 
; called by X
FC9E : 0C 68 
FCA0 : 68	00
FCA2 : 07	1F 0F	00 0C	80 80	00
FCAA : FF FF FF 00 00 00 00	00 
FCB2 : 00 00 00 00 FF FF FF	00
; called by X 
FCBA : FF 01 02 C3 FF 00 
; called by X
FCC0 : 01 03 FF 80 FF	00
; called by X
FCC6 : 20 03 FF 50 FF 00
; called by X 
FCCC : 50 03 01 20 FF 00
; called by X
FCD2 : FE 04 02 04 FF 00 
; called by X
FCD8 : 48 03 01	0C FF 00 
; called by X
FCDE : 48 02 01 0C FF 00 
; called by X
FCE4 : E0 01 02 10 FF 00 
; called by X
FCEA : 50	FF 00 00 60 80
; called by X
FCF0 : FF 02 01	06 FF 00 
;*************************************;
; Vector Table VWTAB
;*************************************; 
FCF6 : 79	D0                    ;F9D0 SYNTH5
FCF8 : 78	D5                    ;F8D5 PRM21
FCFA : 78	DA                    ;F8DA PRM22
FCFC : 78 DF                    ;F8DF PRM23
FCFE : 78	E4                    ;F8E4 PRM24
FD00 : 79	70                    ;F970 SYNTH3 
FD02 : 79 99                    ;F999 SYNTH4
FD04 : 78 C9                    ;F8C9 PARAM2
FD06 : 7A	58                    ;FA58 PARAM12
FD08 : 7A 33                    ;FA33 PRM101
FD0A : 7A	38                    ;FA38 PRM102
FD0C : 7A 4A                    ;FA4A PARAM11 
FD0E : 7A	4F                    ;FA4F PRM111
FD10 : 7A 27                    ;FA27 PARAM9
FD12 : 7A 61                    ;FA61 PARAM13
FD14 : 7A 6A                    ;FA6A PARAM14 
FD16 : 78 E9                    ;F8E9 PRM25
FD18 : 79 1B                    ;F91B PARAM4
FD1A : 79 06                    ;F906 PARAM3 
FD1C : 79	CB                    ;F9CB PARAM7 
FD1E : 79	42                    ;F942 PARAM5
FD20 : 79 91                    ;F991 PARAM6 
FD22 : 7A	09                    ;FA09 PARAM8
FD24 : 79 51                    ;F951 SYNTH2 
; zero padding below
FD26 : 00
FD27 : 00 00 00 00 00 00 00 00
FD2F : 00 00 00 00 00 00 00 00
FD37 : 00 00 00 00 00 00 00 00
FD3F : 00 00 00 00 00 00 00 00
FD47 : 00 00 00 00 00 00 00 00
FD4F : 00 00 00 00 00 00 00 00
FD57 : 00 00 00 00 00 00 00 00
FD5F : 00 00 00 00 00 00 00 00
FD67 : 00 00 00 00 00 00 00 00
FD6F : 00 00 00 00 00 00 00 00
FD77 : 00 00 00 00 00 00 00 00
FD7F : 00 00 00 00 00 00 00 00
FD87 : 00 00 00 00 00 00 00 00
FD8F : 00 00 00 00 00 00 00 00
FD97 : 00 00 00 00 00 00 00 00
FD9F : 00 00 00 00 00 00 00 00
FDA7 : 00 00 00 00 00 00 00 00
FDAF : 00 00 00 00 00 00 00 00
FDB7 : 00 00 00 00 00 00 00 00
FDBF : 00 00 00 00 00 00 00 00
FDC7 : 00 00 00 00 00 00 00 00
FDCF : 00 00 00 00 00 00 00 00
FDD7 : 00 00 00 00 00 00 00 00
FDDF : 00 00 00 00 00 00 00 00
FDE7 : 00 00 00 00 00 00 00 00
FDEF : 00 00 00 00 00 00 00 00
FDF7 : 00 00 00 00 00 00 00 00
FDFF : 00 00 00 00 00 00 00 00
FE07 : 00 00 00 00 00 00 00 00
FE0F : 00 00 00 00 00 00 00 00
FE17 : 00 00 00 00 00 00 00 00
FE1F : 00 00 00 00 00 00 00 00
FE27 : 00 00 00 00 00 00 00 00
FE2F : 00 00 00 00 00 00 00 00
FE37 : 00 00 00 00 00 00 00 00
FE3F : 00 00 00 00 00 00 00 00
FE47 : 00 00 00 00 00 00 00 00
FE4F : 00 00 00 00 00 00 00 00
FE57 : 00 00 00 00 00 00 00 00
FE5F : 00 00 00 00 00 00 00 00
FE67 : 00 00 00 00 00 00 00 00
FE6F : 00 00 00 00 00 00 00 00
FE77 : 00 00 00 00 00 00 00 00
FE7F : 00 00 00 00 00 00 00 00
FE87 : 00 00 00 00 00 00 00 00
FE8F : 00 00 00 00 00 00 00 00
FE97 : 00 00 00 00 00 00 00 00
FE9F : 00 00 00 00 00 00 00 00
FEA7 : 00 00 00 00 00 00 00 00
FEAF : 00 00 00 00 00 00 00 00
FEB7 : 00 00 00 00 00 00 00 00
FEBF : 00 00 00 00 00 00 00 00
FEC7 : 00 00 00 00 00 00 00 00
FECF : 00 00 00 00 00 00 00 00
FED7 : 00 00 00 00 00 00 00 00
FEDF : 00 00 00 00 00 00 00 00
FEE7 : 00 00 00 00 00 00 00 00
FEEF : 00 00 00 00 00 00 00 00
FEF7 : 00 00 00 00 00 00 00 00
FEFF : 00 00 00 00 00 00 00 00
FF07 : 00 00 00 00 00 00 00 00
FF0F : 00 00 00 00 00 00 00 00
FF17 : 00 00 00 00 00 00 00 00
FF1F : 00 00 00 00 00 00 00 00
FF27 : 00 00 00 00 00 00 00 00
FF2F : 00 00 00 00 00 00 00 00
FF37 : 00 00 00 00 00 00 00 00
FF3F : 00 00 00 00 00 00 00 00
FF47 : 00 00 00 00 00 00 00 00
FF4F : 00 00 00 00 00 00 00 00
FF57 : 00 00 00 00 00 00 00 00
FF5F : 00 00 00 00 00 00 00 00
FF67 : 00 00 00 00 00 00 00 00
FF6F : 00 00 00 00 00 00 00 00
FF77 : 00 00 00 00 00 00 00 00
FF7F : 00 00 00 00 00 00 00 00
FF87 : 00 00 00 00 00 00 00 00
FF8F : 00	
FF90 : 00 00 00 00 00 00 00 00
FF98 : 00 00 00 00 00 00 00 00
FFA0 : 00 00 00 00 00 00 00 00
FFA8 : 00 00 00 00 00 00 00 00
FFB0 : 00 00 00 00 00 00 00 00
FFB8 : 00 00 00 00 00 00 00 00
FFC0 : 00 00 00 00 00 00 00 00
FFC8 : 00 00 00 00 00 00 00 00
FFD0 : 00 00 00 00 00 00 00 00
FFD8 : 00 00 00 00 00 00 00 00
FFE0 : 00 00 00 00 00 00 00 00
FFE8 : 00 00 00 00 00 00 00 00
FFF0 : 00 00 00 00 00 00 00 00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : 7B 65	                ;IRQ	(FB65)
FFFA : 78 01                  ;RESET (software) (FB01)
FFFC : 7B C3                  ;NMI (FBC3)
FFFE : 78 01                  ;RESET (hardware) (FB01)

;--------------------------------------------------------------
