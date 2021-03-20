				;
				;	Disassembled by:
				;		DASMx object code disassembler
				;		(c) Copyright 1996-2003   Conquest Consultants
				;		Version 1.40 (Oct 18 2003)
				;
				;	File:		SolarFire.716
				;
				;	Size:		2048 bytes
				;	Checksum:	DA1D
				;	CRC-32:		05A2230C
				;
				;	Date:		Sat Mar 20 12:39:55 2021
				;
				;	CPU:		Motorola 6800 (6800/6802/6808 family)
				;
        ; NOTE: PIA DAC addr 0400
        ; Solar Fire dated 1981, using SoundROM 7, System 7 (square sound board)
				;
        ; updated 20 Mar 2021
				;
					org	$F800
F800 : FC		                    ;hmmm
;*************************************;
;RESET, power on
;*************************************; 
F801 : 0F         sei           ;set interrupt mask  
F802 : 8E 00 7F   lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111) 
F805 : CE 04 00   ldx	#$0400    ;load X with 0400h (0000 0100 0000 0000) PIA addr
F808 : 6F 01      clr	$01,x     ;clr (00) X + 01h (0401) PIA CR port A
F80A : 6F 03      clr	$03,x     ;clr (00) X + 03h (0403) PIA CR port B
F80C : 86 FF      ldaa	#$FF    ;load A with FFh (1111 1111)
F80E : A7 00      staa	$00,x   ;store A in addr X + 00h (0400) PIA port A out (DAC sound)
F810 : C6 80      ldab	#$80    ;load B with 80h (1000 0000)
F812 : E7 02      stab	$02,x   ;store B in addr X + 00h (0402) PIA port B in (sound select)
F814 : 86 37      ldaa	#$37    ;load A with 37h (0011 0111)
F816 : A7 03      staa	$03,x   ;store A in addr X + 03h (0403) PIA CR port B
F818 : 86 3C      ldaa	#$3C    ;load A with 3Ch(0011 1100)
F81A : A7 01      staa	$01,x   ;store A in addr X + 01h (0401) PIA1 CR port A
F81C : 97 14      staa	X0014   ;store A in addr 0014
F81E : E7 02      stab	$02,x   ;store A in addr X + 02h (0402) PIA port B
F820 : 4F         clra          ;clear (00) A
F821 : 97 11      staa	X0011   ;store A in addr 0011
F823 : 97 12      staa	X0012   ;store A in addr 0012
F825 : 97 0F      staa	X000F   ;store A in addr 000F
F827 : 97 10      staa	X0010   ;store A in addr 0010
F829 : 0E         cli           ;clear interrupt
;STDBY1
F82A : 20 FE      bra	LF82A     ;branch always here STDBY1
;*************************************;
; FDB Copyright Notice
;*************************************;
F82C : 43		"C"                 ;COPYRIGHT
F82D : 4F		"O"
F82E : 50		"P"
F82F : 59		"Y"
F830 : 52		"R"
F831 : 49		"I"
F832 : 47		"G"
F833 : 48		"H"
F834 : 54		"T"
F835 : 20 28		" ("            ; (C)
F837 : 43		"C"
F838 : 29 20		") "
F83A : 57		"W"                 ;WILLIAMS
F83B : 49		"I"
F83C : 4C		"L"
F83D : 4C		"L"
F83E : 49		"I"
F83F : 41		"A"
F840 : 4D		"M"
F841 : 53		"S"
F842 : 20 45		" E"            ;ELECTRONICS
F844 : 4C		"L"
F845 : 45		"E"
F846 : 43		"C"
F847 : 54		"T"
F848 : 52		"R"
F849 : 4F		"O"
F84A : 4E		"N"
F84B : 49		"I"
F84C : 43		"C"	
F84D : 53		"S"
F84E : 20 35		" 5"            ; 5/29/81
F850 : 2F 32		"/2"
F852 : 39		"9"
F853 : 2F 38		"/8"
F855 : 31		"1"
F856 : 20 45		" E"            ; EJS (Eugene Jarvis)
F858 : 4A		"J"
F859 : 53		"S"
;*************************************;
;PARAM1 jump sub destination from IRQ
;*************************************;
F85A : 16         tab           ;trans A to B
F85B : 48         asla          ;arith shift left A (bit0 is 0)
F85C : 48         asla          ;arith shift left A
F85D : 48         asla          ;arith shift left A (shifts all bits left x3)
F85E : 1B         aba           ;add A and B into A 
F85F : CE 00 1F   ldx	#$001F    ;load X with 001Fh
F862 : DF 1B      stx	X001B     ;store X in addr 1B
F864 : CE FD 6F   ldx	#$FD6F    ;load X with FD6Fh (VVECT table)
F867 : BD FC DF   jsr	LFCDF     ;jump sub CALCOS
F86A : C6 09      ldab	#$09    ;load B with 09h (0000 1001)
;LOOP1
F86C : A6 00      ldaa	$00,x   ;load A with addr X + 00h
F86E : DF 19      stx	X0019     ;store X in addr 19
F870 : DE 1B      ldx	X001B     ;load X with addr 1B
F872 : A7 00      staa	$00,x   ;store A in addr X + 00h
F874 : 08         inx           ;incr X
F875 : DF 1B      stx	X001B     ;store X in addr 1B
F877 : DE 19      ldx	X0019     ;load X with addr 19
F879 : 08         inx           ;incr X
F87A : 5A         decb          ;decr B
F87B : 26 EF      bne	LF86C     ;branch !=0 LOOP1
F87D : 39         rts           ;return subroutine
;*************************************;
;SYNTH1 similar to Varkon
;*************************************;
F87E : 96 27      ldaa	X0027   ;load A with addr 27
F880 : B7 04 00   staa	X0400   ;store A in DAC output SOUND
;SYN11
F883 : 96 1F      ldaa	X001F   ;load A with addr 1F
F885 : 97 28      staa	X0028   ;store A in addr 28
F887 : 96 20      ldaa	X0020   ;load A with addr 20
F889 : 97 29      staa	X0029   ;store A in addr 28
;SYN12
F88B : DE 24      ldx	X0024     ;load X with addr 24
;LOOP2
F88D : 96 28      ldaa	X0028   ;load A with addr 28
F88F : 73 04 00   com	X0400     ;complement 1s in DAC output SOUND
;LOOP3
F892 : 09         dex           ;decr X
F893 : 27 10      beq	LF8A5     ;branch =0 SYN13
F895 : 4A         deca          ;decr A
F896 : 26 FA      bne	LF892     ;branch !=0 LOOP3
F898 : 73 04 00   com	X0400     ;complement 1s in DAC output SOUND
F89B : 96 29      ldaa	X0029   ;load A with addr 29
;LOOP4
F89D : 09         dex           ;decr X
F89E : 27 05      beq	LF8A5     ;branch =0 SYN13
F8A0 : 4A         deca          ;decr A
F8A1 : 26 FA      bne	LF89D     ;branch !=0 LOOP4
F8A3 : 20 E8      bra	LF88D     ;branch always LOOP2
;SYN13 (SYNTH2 in Varkon)
F8A5 : B6 04 00   ldaa	X0400   ;load A with addr PIA DAC 
F8A8 : 2B 01      bmi	LF8AB     ;branch if minus SYN14
F8AA : 43         coma          ;complement 1s A
;SYN14
F8AB : 8B 00      adda	#$00    ;add A with 00h (0000 0000)
F8AD : B7 04 00   staa	X0400   ;store A in DAC output SOUND
F8B0 : 96 28      ldaa	X0028   ;load A with addr 28
F8B2 : 9B 21      adda	X0021   ;add A with addr 21
F8B4 : 97 28      staa	X0028   ;store A in addr 28
F8B6 : 96 29      ldaa	X0029   ;load A with addr 29
F8B8 : 9B 22      adda	X0022   ;add A with addr 22
F8BA : 97 29      staa	X0029   ;store A in addr 29
F8BC : 91 23      cmpa	X0023   ;comp A with addr 23
F8BE : 26 CB      bne	LF88B     ;branch !=0 SYN12
F8C0 : 96 26      ldaa	X0026   ;load A with addr 26
F8C2 : 27 06      beq	LF8CA     ;branch =0 SYN15 
F8C4 : 9B 1F      adda	X001F   ;add A with addr 1F
F8C6 : 97 1F      staa	X001F   ;store A in addr 1F
F8C8 : 26 B9      bne	LF883     ;branch !=0 SYN11
;SYN15
F8CA : 39         rts           ;return subroutine
;*************************************;
;PARAM2 
;*************************************;
F8CB : 10         sba           ;A = A - B
F8CC : FF 01 01   stx	X0101     ;store X in addr 0101 ( ? )
F8CF : 01         nop           ;
F8D0 : C0 FF      subb	#$FF    ;subtract B with FFh (1111 1111)
F8D2 : 01         nop           ;
F8D3 : 01         nop           ;
F8D4 : 01         nop           ;
;*************************************;
;SYNTH2 called from VWTAB
;*************************************;
F8D5 : 86 FF      ldaa	#$FF    ;load A with FFh (1111 1111)
F8D7 : 97 1F      staa	X001F   ;store A in addr 1F
F8D9 : CE FE C0   ldx	#$FEC0    ;load X with FEC0h (waveform data)
F8DC : DF 21      stx	X0021     ;store X in addr 21
F8DE : 86 20      ldaa	#$20    ;load A with 20h (0010 0000)
F8E0 : CE FF E0   ldx	#$FFE0    ;load X with FFE0h (waveform data)
F8E3 : 8D 05      bsr	LF8EA     ;branch sub SYN21 
F8E5 : 86 01      ldaa	#$01    ;load A with 01h (0000 0001)
F8E7 : CE 00 44   ldx	#$0044    ;load X with 0044h
;SYN21 LF8EA:
F8EA : 97 23      staa	X0023   ;store A in addr 23
F8EC : DF 24      stx	X0024     ;store X in addr 24
;LOOP5
F8EE : CE 00 10   ldx	#$0010    ;load X with 0010h
;LOOP6
F8F1 : 8D 21      bsr	LF914     ;branch sub SYN23
F8F3 : 96 20      ldaa	X0020   ;load A with addr 20  
F8F5 : 9B 22      adda	X0022   ;add A with addr 22
F8F7 : 97 20      staa	X0020   ;store A in addr 20
F8F9 : 96 1F      ldaa	X001F   ;load A with addr 1F
F8FB : 99 21      adca	X0021   ;A = Carry + A + addr 21 
F8FD : 97 1F      staa	X001F   ;store A in addr 1F
F8FF : 09         dex           ;decr X
F900 : 26 EF      bne	LF8F1     ;branch !=0 LOOP6
F902 : 96 22      ldaa	X0022   ;load A with addr 22
F904 : 9B 23     	adda	X0023   ;add A with addr 23
F906 : 97 22      staa	X0022   ;store A in addr 22
F908 : 24 03      bcc	LF90D     ;branch Carry clear SYN22
F90A : 7C 00 21   inc	X0021     ;incr  addr 21
;SYN22
F90D : DE 21      ldx	X0021     ;load X with addr 21
F90F : 9C 24      cpx	X0024     ;comp X with addr 24
F911 : 26 DB      bne	LF8EE     ;branch !=0 LOOP5
F913 : 39         rts           ;return subroutine
;SYN23
F914 : 4F         clra          ;clear A
;LOOP7
F915 : B7 04 00   staa	X0400   ;store A in DAC output SOUND
F918 : 8B 20      adda	#$20    ;add A with 20h (0010 0000)
F91A : 24 F9      bcc	LF915     ;branch Carry clear LOOP7
F91C : 8D 09      bsr	LF927     ;branch sub SYN24
F91E : 86 E0      ldaa	#$E0    ;load A with E0h (1110 0000)
;LOOP8 LF920:
F920 : B7 04 00   staa	X0400   ;store A in DAC output SOUND
F923 : 80 20      suba	#$20    ;A = A - 20h (0010 0000)
F925 : 24 F9      bcc	LF920     ;branch Carry clear LOOP8
;SYN24
F927 : D6 1F     	ldab	X001F   ;load B with addr 1F
;LOOP9
F929 : 86 02      ldaa	#$02    ;load A with 02h (0000 0010)    
;LOOP10
F92B : 4A         deca          ;decr B
F92C : 26 FD      bne	LF92B     ;branch !=0 LOOP10
F92E : 5A         decb          ;decr B
F92F : 26 F8      bne	LF929     ;branch !=0 LOOP9
F931 : 39         rts           ;return subroutine
;*************************************;
;SYNTH3 called from VWTAB
;*************************************;
F932 : 86 C0      ldaa	#$C0    ;load A with C0h (1100 0000) 
F934 : 97 27      staa	X0027   ;store A in addr 27
F936 : 86 FF      ldaa	#$FF    ;load A with FFh (1111 1111)    
F938 : B7 04 00   staa	X0400   ;store A in DAC output SOUND
;LOOP11
F93B : C6 10      ldab	#$10    ;load B with 10h (0001 0000)
;LOOP12
F93D : 8D 79      bsr	LF9B8     ;branch sub PARAM5
F93F : 44         lsra          ;logic shift right A (bit7=0)
F940 : 76 00 14   ror	X0014     ;rotate right addr 14 (bit7=C,C=bit0)
F943 : 76 00 15   ror	X0015     ;rotate right addr 15 (bit7=C,C=bit0)
F946 : 24 03      bcc	LF94B     ;branch Carry clear SYN31
F948 : 73 04 00   com	X0400     ;complement 1s in DAC output SOUND
;SYN31
F94B : 96 27      ldaa	X0027   ;load A with addr 27
;LOOP13
F94D : 4A         deca          ;decr A
F94E : 26 FD      bne	LF94D     ;branch !=0 LOOP13
F950 : 5A         decb          ;decr B
F951 : 26 EA      bne	LF93D     ;branch !=0 LOOP12
F953 : 96 27      ldaa	X0027   ;load A with addr 27
F955 : 8B FE      adda	#$FE    ;add A with FEh (1111 1110)
F957 : 97 27      staa	X0027   ;store A in addr 27
F959 : 26 E0      bne	LF93B     ;branch !=0 LOOP11
F95B : 39         rts           ;return subroutine
;*************************************;
;PARAM3
;*************************************;
;LF95C:
F95C : A6 00      ldaa	$00,x
F95E : 97 24      staa	X0024
F960 : A6 01      ldaa	$01,x
F962 : 97 20      staa	X0020
F964 : A6 02      ldaa	$02,x
F966 : 97 1F      staa	X001F
F968 : A6 03      ldaa	$03,x
F96A : 97 22      staa	X0022
F96C : A6 04      ldaa	$04,x
F96E : 97 27      staa	X0027
;LF970:
F970 : 39         rts
;*************************************;
;PARAM4 called from VWTAB
;*************************************;
F971				XF971:
F971 : CE F8 CB		"   "		ldx	#$F8CB  ;load X with F8CBh (addr of PARAM2)
F974 : 20 03		"  "		bra	LF979
;*************************************;
;SYNTH4 called from VWTAB
;*************************************;
F976 : CE F8 D0		"   "		ldx	#$F8D0
F979				LF979:
F979 : 8D E1		"  "		bsr	LF95C
F97B : 8D 30		" 0"		bsr	LF9AD
F97D				LF97D:
F97D : 8D 5B		" ["		bsr	LF9DA
F97F : 96 26		" &"		ldaa	X0026
F981 : 91 27		" '"		cmpa	X0027
F983 : 26 F8		"& "		bne	LF97D
F985 : 59		"Y"		rolb
F986 : F7 04 00   stab	X0400   ;store B in DAC output SOUND
F989 : 8D 35		" 5"		bsr	LF9C0
F98B : 8D 3B		" ;"		bsr	LF9C8
F98D : 8D 5F		" _"		bsr	LF9EE
F98F : 7D 00 20		"}  "		tst	X0020
F992 : 27 DC		"' "		beq	LF970
F994 : 7D 00 21		"} !"		tst	X0021
F997 : 26 E4		"& "		bne	LF97D
F999 : 7D 00 22		"} ""		tst	X0022
F99C : 27 DF		"' "		beq	LF97D
F99E : 2B 05		"+ "		bmi	LF9A5
F9A0 : 7C 00 27		"| '"		inc	X0027
F9A3 : 20 D8		"  "		bra	LF97D
				;
F9A5				LF9A5:
F9A5 : 7A 00 27		"z '"		dec	X0027
F9A8 : 7A 00 26		"z &"		dec	X0026
F9AB : 20 D0		"  "		bra	LF97D
				;
F9AD				LF9AD:
F9AD : 7F 00 21		"  !"		clr	X0021
F9B0 : 96 27		" '"		ldaa	X0027
F9B2 : 97 26		" &"		staa	X0026
F9B4 : 7F 00 25		"  %"		clr	X0025
F9B7 : 39		"9"		rts
;*************************************;
;PARAM5
;*************************************;
F9B8				LF9B8:
F9B8 : 96 15		"  "		ldaa	X0015
F9BA : 44		"D"		lsra
F9BB : 44		"D"		lsra
F9BC : 44		"D"		lsra
F9BD : 98 15		"  "		eora	X0015
F9BF : 39		"9"		rts
;*************************************;
;PARAM6
;*************************************;
F9C0				LF9C0:
F9C0 : 8D F6		"  "		bsr	LF9B8
F9C2 : 97 23		" #"		staa	X0023
F9C4 : 08		" "		inx
F9C5 : 84 07		"  "		anda	#$07
F9C7 : 39		"9"		rts
;*************************************;
;PARAM7
;*************************************;
F9C8				LF9C8:
F9C8 : 96 23		" #"		ldaa	X0023
F9CA : 44		"D"		lsra
F9CB : 76 00 14		"v  "		ror	X0014
F9CE : 76 00 15		"v  "		ror	X0015
F9D1 : 86 00		"  "		ldaa	#$00
F9D3 : 24 02		"$ "		bcc	LF9D7
F9D5 : 96 20		"  "		ldaa	X0020
F9D7				LF9D7:
F9D7 : 97 25		" %"		staa	X0025
F9D9 : 39		"9"		rts
;*************************************;
;PARAM8
;*************************************;
F9DA				LF9DA:
F9DA : 96 27		" '"		ldaa	X0027
F9DC : 7A 00 26		"z &"		dec	X0026
F9DF : 27 04		"' "		beq	LF9E5
F9E1 : 08		" "		inx
F9E2 : 09		" "		dex
F9E3 : 20 08		"  "		bra	LF9ED
;LF9E5:
F9E5 : 97 26		" &"		staa	X0026
F9E7 : D6 25		" %"		ldab	X0025
F9E9 : 54		"T"		lsrb
F9EA : 7C 00 21		"| !"		inc	X0021
F9ED				LF9ED:
F9ED : 39		"9"		rts
;*************************************;
;PARAM9
;*************************************;
F9EE				LF9EE:
F9EE : 96 24		" $"		ldaa	X0024
F9F0 : 91 21		" !"		cmpa	X0021
F9F2 : 27 04		"' "		beq	LF9F8
F9F4 : 08		" "		inx
F9F5 : 09		" "		dex
F9F6 : 20 09		"  "		bra	LFA01
;LF9F8:
F9F8 : 7F 00 21		"  !"		clr	X0021
F9FB : 96 20		"  "		ldaa	X0020
F9FD : 90 1F		"  "		suba	X001F
F9FF : 97 20		"  "		staa	X0020
FA01				LFA01:
FA01 : 39		"9"		rts
;*************************************;
;SYNTH5 called from VWTAB
;*************************************;
FA02 : 86 80		"  "		ldaa	#$80
FA04 : 97 22		" ""		staa	X0022
FA06 : 86 FA		"  "		ldaa	#$FA
FA08 : 97 20		"  "		staa	X0020
FA0A				LFA0A:
FA0A : 86 80		"  "		ldaa	#$80
FA0C : 97 1D		"  "		staa	X001D
FA0E				LFA0E:
FA0E : 86 12		"  "		ldaa	#$12
FA10				LFA10:
FA10 : 4A		"J"		deca
FA11 : 26 FD		"& "		bne	LFA10
FA13 : 96 1F		"  "		ldaa	X001F
FA15 : 9B 22		" ""		adda	X0022
FA17 : 97 1F		"  "		staa	X001F
FA19 : 44		"D"		lsra
FA1A : 44		"D"		lsra
FA1B : 44		"D"		lsra
FA1C : 8B 36		" 6"		adda	#$36
FA1E : 97 21		" !"		staa	X0021
FA20 : DE 20		"  "		ldx	X0020
FA22 : A6 00		"  "		ldaa	$00,x
FA24 : B7 04 00   staa	X0400   ;store A in DAC output SOUND
FA27 : 7A 00 1D		"z  "		dec	X001D
FA2A : 26 E2		"& "		bne	LFA0E
FA2C : 7A 00 22		"z ""		dec	X0022
FA2F : 96 22		" ""		ldaa	X0022
FA31 : 81 20		"  "		cmpa	#$20
FA33 : 26 D5		"& "		bne	LFA0A
FA35 : 39		"9"		rts
				;
FA36 : 80 8C		"  "		suba	#$8C
FA38 : 98 A5		"  "		eora	X00A5
FA3A : B0 BC C6		"   "		suba	XBCC6
FA3D : D0 DA		"  "		subb	X00DA
FA3F : E2 EA		"  "		sbcb	$EA,x
FA41 : F0 F5 FA		"   "		subb	XF5FA
				;
FA44 : FD		" "		db	$FD
				;
FA45 : FE FF FE		"   "		ldx	XFFFE
				;
FA48 : FD		" "		db	$FD
				;
FA49 : FA F5 F0		"   "		orab	XF5F0
FA4C : EA E2		"  "		orab	$E2,x
FA4E : DA D0		"  "		orab	X00D0
FA50 : C6 BC		"  "		ldab	#$BC
FA52 : B0 A5 98		"   "		suba	XA598
FA55 : 8C 80 73		"  s"		cpx	#$8073
FA58 : 67 5A		"gZ"		asr	$5A,x
FA5A : 4F		"O"		clra
FA5B : 43		"C"		coma
FA5C : 39		"9"		rts
				;
FA5D : 2F 25		"/%"		ble	LFA84
				;
FA5F : 1D 15		"  "		db	$1D, $15
				;
FA61 : 0F		" "		sei
FA62 : 0A		" "		clv
				;
FA63 : 05 02		"  "		db	$05, $02
				;
FA65 : 01		" "		nop
				;
FA66 : 00		" "		db	$00
				;
FA67 : 01		" "		nop
				;
FA68 : 02 05		"  "		db	$02, $05
				;
FA6A : 0A		" "		clv
FA6B : 0F		" "		sei
				;
FA6C : 15 1D		"  "		db	$15, $1D
				;
FA6E : 25 2F		"%/"		bcs	LFA9F
FA70 : 39		"9"		rts
				;
FA71 : 43		"C"		coma
FA72 : 4F		"O"		clra
FA73 : 5A		"Z"		decb
FA74 : 67 73		"gs"		asr	$73,x
; called from VWTAB
FA76 : 7F 00 0F		"   "		clr	X000F
FA79 : 7F 00 10		"   "		clr	X0010
FA7C : 39		"9"		rts
;*************************************;
; PARAM called from VWTAB
;*************************************;
FA7D : 96 10		"  "		ldaa	X0010
FA7F : 8A 80		"  "		oraa	#$80
FA81 : 97 10		"  "		staa	X0010
FA83 : 96 0F		"  "		ldaa	X000F
FA85 : 84 7F		"  "		anda	#$7F
FA87 : 81 7F		"  "		cmpa	#$7F
FA89 : 26 01		"& "		bne	LFA8C
FA8B : 4F		"O"		clra
FA8C				LFA8C:
FA8C : 4C		"L"		inca
FA8D : 97 0F		"  "		staa	X000F
FA8F : 39		"9"		rts
;*************************************;
; jump destination from IRQ
;*************************************;
;LFA90:
FA90 : 86 0E		"  "		ldaa	#$0E
FA92 : 8D 5C		" \"		bsr	LFAF0
FA94 : 96 0F		"  "		ldaa	X000F
FA96 : 43		"C"		coma
FA97 : BD FB AB		"   "		jsr	LFBAB
FA9A				LFA9A:
FA9A : 7C 00 23		"| #"		inc	X0023
FA9D : BD FB AD		"   "		jsr	LFBAD
FAA0 : 20 F8		"  "		bra	LFA9A
;*************************************;
; PARAM called from VWTAB
;*************************************;
FAA2 : 96 0F		"  "		ldaa	X000F
FAA4 : 8A 80		"  "		oraa	#$80
FAA6 : 97 0F		"  "		staa	X000F
FAA8 : 96 10		"  "		ldaa	X0010
FAAA : 84 7F		"  "		anda	#$7F
FAAC : 81 7F		"  "		cmpa	#$7F
FAAE : 26 01		"& "		bne	LFAB1
FAB0 : 4F		"O"		clra
FAB1				LFAB1:
FAB1 : 4C		"L"		inca
FAB2 : 97 10		"  "		staa	X0010
FAB4 : 39		"9"		rts
;*************************************;
; jump sub destination from IRQ
;*************************************;
;LFAB5:
FAB5 : 86 0F		"  "		ldaa	#$0F
FAB7 : 8D 37		" 7"		bsr	LFAF0
FAB9 : 96 10		"  "		ldaa	X0010
FABB : 43		"C"		coma
FABC : BD FB AB		"   "		jsr	LFBAB
FABF				LFABF:
FABF : 7C 00 23		"| #"		inc	X0023
FAC2 : BD FB AD		"   "		jsr	LFBAD
FAC5 : 20 F8		"  "		bra	LFABF
;*************************************;
; PARAM called from VWTAB
;*************************************;
FAC7				XFAC7:
FAC7 : 96 11		"  "		ldaa	X0011
FAC9 : 26 07		"& "		bne	LFAD2
FACB : 7C 00 11		"|  "		inc	X0011
FACE				LFACE:
FACE : 86 10		"  "		ldaa	#$10
FAD0 : 20 11		"  "		bra	LFAE3
				;
FAD2				LFAD2:
FAD2 : 96 23		" #"		ldaa	X0023
FAD4 : 81 B2		"  "		cmpa	#$B2
FAD6 : 27 F6		"' "		beq	LFACE
FAD8 : 20 13		"  "		bra	LFAED
;*************************************;
; PARAM called from VWTAB
;*************************************;
FADA : 96 12		"  "		ldaa	X0012
FADC : 26 09		"& "		bne	LFAE7
FADE : 7C 00 12		"|  "		inc	X0012
FAE1				LFAE1:
FAE1 : 86 11		"  "		ldaa	#$11
FAE3				LFAE3:
FAE3 : 8D 0B		"  "		bsr	LFAF0
FAE5 : 20 70		" p"		bra	LFB57
				;
FAE7				LFAE7:
FAE7 : 96 23		" #"		ldaa	X0023
FAE9 : 81 C0		"  "		cmpa	#$C0
FAEB : 27 F4		"' "		beq	LFAE1
FAED				LFAED:
FAED : 7E FB A0		"~  "		jmp	LFBA0
;*************************************;
; jump sub destination from IRQ
;*************************************;
;LFAF0:
FAF0 : 16		" "		tab
FAF1 : 58		"X"		aslb
FAF2 : 1B		" "		aba
FAF3 : 1B		" "		aba
FAF4 : 1B		" "		aba
FAF5 : CE FE 66		"  f"		ldx	#$FE66
FAF8 : BD FC DF		"   "		jsr	LFCDF
FAFB : A6 00		"  "		ldaa	$00,x
FAFD : 16		" "		tab
FAFE : 84 0F		"  "		anda	#$0F
FB00 : 97 20		"  "		staa	X0020
FB02 : 8D 4E		" N"		bsr	LFB52
FB04 : D7 1F		"  "		stab	X001F
FB06 : A6 01		"  "		ldaa	$01,x
FB08 : 16		" "		tab
FB09 : 8D 47		" G"		bsr	LFB52
FB0B : D7 21		" !"		stab	X0021
FB0D : 84 0F		"  "		anda	#$0F
FB0F : 97 1D		"  "		staa	X001D
FB11 : DF 17		"  "		stx	X0017
FB13 : CE FD 9C		"   "		ldx	#$FD9C
FB16				LFB16:
FB16 : 7A 00 1D		"z  "		dec	X001D
FB19 : 2B 08		"+ "		bmi	LFB23
FB1B : A6 00		"  "		ldaa	$00,x
FB1D : 4C		"L"		inca
FB1E : BD FC DF		"   "		jsr	LFCDF
FB21 : 20 F3		"  "		bra	LFB16
				;
FB23				LFB23:
FB23 : DF 24		" $"		stx	X0024
FB25 : BD FB E7		"   "		jsr	LFBE7
FB28 : DE 17		"  "		ldx	X0017
FB2A : A6 02		"  "		ldaa	$02,x
FB2C : 97 26		" &"		staa	X0026
FB2E : BD FB F9		"   "		jsr	LFBF9
FB31 : DE 17		"  "		ldx	X0017
FB33 : A6 03		"  "		ldaa	$03,x
FB35 : 97 22		" ""		staa	X0022
FB37 : A6 04		"  "		ldaa	$04,x
FB39 : 97 23		" #"		staa	X0023
FB3B : A6 05		"  "		ldaa	$05,x
FB3D : 16		" "		tab
FB3E : A6 06		"  "		ldaa	$06,x
FB40 : CE FE E4		"   "		ldx	#$FEE4
FB43 : BD FC DF		"   "		jsr	LFCDF
FB46 : 17		" "		tba
FB47 : DF 27		" '"		stx	X0027
FB49 : 7F 00 2F		"  /"		clr	X002F
FB4C : BD FC DF		"   "		jsr	LFCDF
FB4F : DF 29		" )"		stx	X0029
FB51 : 39		"9"		rts
				;
FB52				LFB52:
FB52 : 54		"T"		lsrb
FB53 : 54		"T"		lsrb
FB54 : 54		"T"		lsrb
FB55 : 54		"T"		lsrb
FB56 : 39		"9"		rts
;*************************************;
; SYNTH jump sub destination from IRQ
;*************************************;
;LFB57:
FB57 : 96 1F		"  "		ldaa	X001F
FB59 : 97 2E		" ."		staa	X002E
FB5B				LFB5B:
FB5B : DE 27		" '"		ldx	X0027
FB5D : DF 19		"  "		stx	X0019
FB5F				LFB5F:
FB5F : DE 19		"  "		ldx	X0019
FB61 : A6 00		"  "		ldaa	$00,x
FB63 : 9B 2F		" /"		adda	X002F
FB65 : 97 2D		" -"		staa	X002D
FB67 : 9C 29		" )"		cpx	X0029
FB69 : 27 26		"'&"		beq	LFB91
FB6B : D6 20		"  "		ldab	X0020
FB6D : 08		" "		inx
FB6E : DF 19		"  "		stx	X0019
FB70				LFB70:
FB70 : CE 00 30		"  0"		ldx	#$0030
FB73				LFB73:
FB73 : 96 2D		" -"		ldaa	X002D
FB75				LFB75:
FB75 : 4A		"J"		deca
FB76 : 26 FD		"& "		bne	LFB75
FB78 : A6 00		"  "		ldaa	$00,x
FB7A : B7 04 00   staa	X0400   ;store A in DAC output SOUND
FB7D : 08		" "		inx
FB7E : 9C 2B		" +"		cpx	X002B
FB80 : 26 F1		"& "		bne	LFB73
FB82 : 5A		"Z"		decb
FB83 : 27 DA		"' "		beq	LFB5F
FB85 : 08		" "		inx
FB86 : 09		" "		dex
FB87 : 08		" "		inx
FB88 : 09		" "		dex
FB89 : 08		" "		inx
FB8A : 09		" "		dex
FB8B : 08		" "		inx
FB8C : 09		" "		dex
FB8D : 01		" "		nop
FB8E : 01		" "		nop
FB8F : 20 DF		"  "		bra	LFB70
;*************************************;
;PARAM
;*************************************;
FB91				LFB91:
FB91 : 96 21		" !"		ldaa	X0021
FB93 : 8D 64		" d"		bsr	LFBF9
FB95 : 7A 00 2E		"z ."		dec	X002E
FB98 : 26 C1		"& "		bne	LFB5B
FB9A : 96 11		"  "		ldaa	X0011
FB9C : 9A 12		"  "		oraa	X0012
FB9E : 26 46		"&F"		bne	LFBE6
FBA0				LFBA0:
FBA0 : 96 22		" ""		ldaa	X0022
FBA2 : 27 42		"'B"		beq	LFBE6
FBA4 : 7A 00 23		"z #"		dec	X0023
FBA7 : 27 3D		"'="		beq	LFBE6
FBA9 : 9B 2F		" /"		adda	X002F
FBAB				LFBAB:
FBAB : 97 2F		" /"		staa	X002F
FBAD				LFBAD:
FBAD : DE 27		" '"		ldx	X0027
FBAF : 5F		"_"		clrb
FBB0				LFBB0:
FBB0 : 96 2F		" /"		ldaa	X002F
FBB2 : 7D 00 22		"} ""		tst	X0022
FBB5 : 2B 06		"+ "		bmi	LFBBD
FBB7 : AB 00		"  "		adda	$00,x
FBB9 : 25 08		"% "		bcs	LFBC3
FBBB : 20 0B		"  "		bra	LFBC8
				;
FBBD				LFBBD:
FBBD : AB 00		"  "		adda	$00,x
FBBF : 27 02		"' "		beq	LFBC3
FBC1 : 25 05		"% "		bcs	LFBC8
FBC3				LFBC3:
FBC3 : 5D		"]"		tstb
FBC4 : 27 08		"' "		beq	LFBCE
FBC6 : 20 0F		"  "		bra	LFBD7
				;
FBC8				LFBC8:
FBC8 : 5D		"]"		tstb
FBC9 : 26 03		"& "		bne	LFBCE
FBCB : DF 27		" '"		stx	X0027
FBCD : 5C		"\"		incb
FBCE				LFBCE:
FBCE : 08		" "		inx
FBCF : 9C 29		" )"		cpx	X0029
FBD1 : 26 DD		"& "		bne	LFBB0
FBD3 : 5D		"]"		tstb
FBD4 : 26 01		"& "		bne	LFBD7
FBD6 : 39		"9"		rts
				;
FBD7				LFBD7:
FBD7 : DF 29		" )"		stx	X0029
FBD9 : 96 21		" !"		ldaa	X0021
FBDB : 27 06		"' "		beq	LFBE3
FBDD : 8D 08		"  "		bsr	LFBE7
FBDF : 96 26		" &"		ldaa	X0026
FBE1 : 8D 16		"  "		bsr	LFBF9
FBE3				LFBE3:
FBE3 : 7E FB 57		"~ W"		jmp	LFB57
FBE6				LFBE6:
FBE6 : 39		"9"		rts
				;
FBE7				LFBE7:
FBE7 : CE 00 30		"  0"		ldx	#$0030
FBEA : DF 1B		"  "		stx	X001B
FBEC : DE 24		" $"		ldx	X0024
FBEE : E6 00		"  "		ldab	$00,x
FBF0 : 08		" "		inx
FBF1 : BD F8 6C		"  l"		jsr	LF86C
FBF4 : DE 1B		"  "		ldx	X001B
FBF6 : DF 2B		" +"		stx	X002B
FBF8 : 39		"9"		rts
;*************************************;
;PARAM
;*************************************;
FBF9				LFBF9:
FBF9 : 4D		"M"		tsta
FBFA : 27 2A		"'*"		beq	LFC26
FBFC : DE 24		" $"		ldx	X0024
FBFE : DF 19		"  "		stx	X0019
FC00 : CE 00 30		"  0"		ldx	#$0030
FC03 : 97 1E		"  "		staa	X001E
FC05				LFC05:
FC05 : DF 1B		"  "		stx	X001B
FC07 : DE 19		"  "		ldx	X0019
FC09 : D6 1E		"  "		ldab	X001E
FC0B : D7 1D		"  "		stab	X001D
FC0D : E6 01		"  "		ldab	$01,x
FC0F : BD FB 52		"  R"		jsr	LFB52
FC12 : 08		" "		inx
FC13 : DF 19		"  "		stx	X0019
FC15 : DE 1B		"  "		ldx	X001B
FC17 : A6 00		"  "		ldaa	$00,x
FC19				LFC19:
FC19 : 10		" "		sba
FC1A : 7A 00 1D		"z  "		dec	X001D
FC1D : 26 FA		"& "		bne	LFC19
FC1F : A7 00		"  "		staa	$00,x
FC21 : 08		" "		inx
FC22 : 9C 2B		" +"		cpx	X002B
FC24 : 26 DF		"& "		bne	LFC05
FC26				LFC26:
FC26 : 39		"9"		rts
;*************************************;
;SYNTH called from VWTAB
;*************************************;
FC27 : CE FF 9C		"   "		ldx	#$FF9C
FC2A : DF 21		" !"		stx	X0021
;LFC2C:
FC2C : DE 21		" !"		ldx	X0021
FC2E : A6 00		"  "		ldaa	$00,x
FC30 : 27 33		"'3"		beq	LFC65
FC32 : E6 01		"  "		ldab	$01,x
FC34 : C4 F0		"  "		andb	#$F0
FC36 : D7 20		"  "		stab	X0020
FC38 : E6 01		"  "		ldab	$01,x
FC3A : 08		" "		inx
FC3B : 08		" "		inx
FC3C : DF 21		" !"		stx	X0021
FC3E : 97 1F		"  "		staa	X001F
FC40 : C4 0F		"  "		andb	#$0F
;LFC42:
FC42 : 96 20		"  "		ldaa	X0020
FC44 : B7 04 00   staa	X0400   ;store A in DAC output SOUND
FC47 : 96 1F		"  "		ldaa	X001F
;LFC49:
FC49 : CE 00 05		"   "		ldx	#$0005
;LFC4C:
FC4C : 09		" "		dex
FC4D : 26 FD		"& "		bne	LFC4C
FC4F : 4A		"J"		deca
FC50 : 26 F7		"& "		bne	LFC49
FC52 : 7F 04 00   clr	X0400     ;clr (00) in DAC output SOUND
FC55 : 96 1F		"  "		ldaa	X001F
;LFC57:
FC57 : CE 00 05		"   "		ldx	#$0005
;LFC5A:
FC5A : 09		" "		dex
FC5B : 26 FD		"& "		bne	LFC5A
FC5D : 4A		"J"		deca
FC5E : 26 F7		"& "		bne	LFC57
FC60 : 5A		"Z"		decb
FC61 : 26 DF		"& "		bne	LFC42
FC63 : 20 C7		"  "		bra	LFC2C
;LFC65:
FC65 : 39		"9"		rts
;*************************************;
;IRQ
;*************************************;
FC66 : 8E 00 7F   lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111)
FC69 : B6 04 02   ldaa	X0402   ;load A with 0402 PIA sound select
FC6C : C6 80      ldab	#$80    ;load B with 80h (1000 0000)
FC6E : F7 04 02   stab	X0402   ;store B into 0402 (PIA sound select)
FC71 : 7C 00 13   inc	X0013     ;incr addr 13
FC74 : 43         coma          ;complement 1s A (sound select is grounded pins)
FC75 : 84 7F      anda	#$7F    ;and A with 7Fh (0111 1111)
FC77 : 36         psha          ;push A into stack then SP - 1
FC78 : 84 1F      anda	#$1F    ;and A with 1Fh (0001 1111)
FC7A : 81 14      cmpa	#$14    ;comp A with 14h (0001 0100)
FC7C : 27 0A      beq	LFC88     ;branch !=0 IRQ2
FC7E : 7F 00 11   clr	X0011     ;clr (00) addr 11
FC81 : 81 15      cmpa	#$15    ;comp A with 15h (0001 0101)
FC83 : 27 03      beq	LFC88     ;branch !=0 IRQ2
FC85 : 7F 00 12   clr	X0012     ;clr (00) addr 12
;IRQ2 LFC88:
FC88 : 32         pula          ;SP + 1 pull stack into A
FC89 : 85 20      bita	#$20    ;bit test A with 20h (0010 0000)
FC8B : 27 0F      beq	LFC9C     ;branch =0 IRQ4
FC8D : C6 7E      ldab	#$7E    ;load B with 7Eh (0111 1110)
FC8F : F1 EF FD   cmpb	XEFFD   ;comp B with EFFDh (extended)
FC92 : 27 05      beq	LFC99     ;branch =0 IRQ3
FC94 : F1 DF FD   cmpb	XDFFD   ;comp B with DFFDh (extended)
FC97 : 26 03      bne	LFC9C     ;branch !=0 IRQ4
;IRQ3 LFC99:
FC99 : BD EF FD   jsr	LEFFD     ;jump sub EFFD
;IRQ4 LFC9C:
FC9C : 0E         cli           ;clear interrupt
FC9D : 84 1F      anda	#$1F    ;and A with 1Fh (0001 1111)
FC9F : 27 27      beq	LFCC8     ;branch =0 IRQ7
FCA1 : 4A		"J"		deca          ;decr A
FCA2 : 81 0D      cmpa	#$0D    ;comp A with 0Dh (0000 1101)
FCA4 : 22 08      bhi	LFCAE     ;branch if higher IRQ5
FCA6 : BD FA F0   jsr	LFAF0     ;jump sub above
FCA9 : BD FB 57   jsr	LFB57     ;jump sub above
FCAC : 20 1A      bra	LFCC8     ;branch always IRQ7
;IRQ5 LFCAE:
FCAE : 81 19      cmpa	#$19    ;comp A with 19h (0001 1001)
FCB0 : 22 0E      bhi	LFCC0     ;branch if higher IRQ6
FCB2 : 80 0E      suba	#$0E    ;A = A - 0Eh (0000 1110)
FCB4 : 48         asla          ;arith shift left A (bit0=0)
FCB5 : CE FD 57   ldx	#$FD57    ;load X with FD57h (data tables start?)
FCB8 : 8D 25      bsr	LFCDF     ;branch sub CALCOS
FCBA : EE 00      ldx	$00,x     ;load X with addr X + 00h
FCBC : AD 00      jsr	$00,x	    ;jump sub addr X + 00h
FCBE : 20 08      bra	LFCC8     ;branch always IRQ7
;IRQ6 LFCC0:
FCC0 : 80 1A      suba	#$1A    ;A = A - 1Ah (0001 1010)
FCC2 : BD F8 5A   jsr	LF85A     ;jump sub above
FCC5 : BD F8 7E   jsr	LF87E     ;jump sub SYNTH1
;IRQ7 LFCC8:
FCC8 : 96 0F      ldaa	X000F   ;load A with addr 0F
FCCA : 9A 10      oraa	X0010   ;OR A with addr 10
;IRQSTDY LFCCC:
FCCC : 27 FE      beq	LFCCC     ;branch =0 here IRQSTDBY
FCCE : 4F         clra          ;clr (00) A
FCCF : 97 11      staa	X0011   ;store A in addr 11
FCD1 : 97 12      staa	X0012   ;store A in addr 12
FCD3 : 96 0F      ldaa	X000F   ;load A with addr 0F
FCD5 : 27 05      beq	LFCDC     ;branch =0 IRQ8
FCD7 : 2B 03      bmi	LFCDC     ;branch if minus IRQ8
FCD9 : 7E FA 90   jmp	LFA90     ;jump above
;IRQ8 LFCDC:
FCDC : 7E FA B5   jmp	LFAB5     ;jump above
;*************************************;
;CALCOS
;*************************************;
;LFCDF:
FCDF : DF 19      stx	X0019     ;store X in addr 19
FCE1 : 9B 1A      adda	X001A   ;add A with addr 1A
FCE3 : 97 1A      staa	X001A   ;store A in addr 1A
FCE5 : 96 19      ldaa	X0019   ;load A with addr 19
FCE7 : 89 00      adca	#$00    ;A = Carry + A + 00h
FCE9 : 97 19      staa	X0019   ;store A in addr 19
FCEB : DE 19      ldx	X0019     ;load X with addr 19
FCED : 39         rts           ;return subroutine
;*************************************;
;SYNTH called from VWTAB
;*************************************;
FCEE : CE 00 E0   ldx	#$00E0    ;load X with 00E0h
;LFCF1:
FCF1 : 86 20      ldaa	#$20    ;load A with 20h (0010 0000)
FCF3 : 8D EA      bsr	LFCDF     ;branch sub CALCOS
;LFCF5:
FCF5 : 09         dex           ;decr X
FCF6 : 26 FD      bne	LFCF5     ;branch !=0 above
FCF8 : 7F 04 00   clr	X0400     ;clr (00) in DAC output SOUND
;LFCFB:
FCFB : 5A         decb          ;decr B
FCFC : 26 FD      bne	LFCFB     ;branch !=0 above
FCFE : 73 04 00   com	X0400     ;complement 1s in DAC output SOUND
FD01 : DE 19      ldx	X0019     ;load X with addr 19
FD03 : 8C 10 00   cpx	#$1000    ;comp X with 1000h
FD06 : 26 E9      bne	LFCF1     ;branch !=0 above
FD08 : 39         rts           ;return subroutine
;*************************************;
;NMI
;*************************************;
FD09 : 0F	        sei           ;set interrupt mask
FD0A : 8E 00 7F   lds	#$007F    ;load SP with 007Fh (0000 0000 0111 1111)
FD0D : CE FF FF   ldx	#$FFFF    ;load X with FFFFh (1111 1111 1111 1111)
FD10 : 5F         clrb          ;clear B
;LFD11:
FD11 : E9 00      adcb	$00,x   ;B = Carry + B + 00h 
FD13 : 09         dex           ;decr X
FD14 : 8C F8 00   cpx	#$F800    ;comp X with F800h (ROM start addr ?)
FD17 : 26 F8      bne	LFD11     ;branch !=0 above
FD19 : E1 00      cmpb	$00,x   ;comp B with addr X + 00h
FD1B : 27 01      beq	LFD1E     ;branch =0 below
FD1D : 3E         wai           ;wait for interrupt
;LFD1E:
FD1E : 7F 04 02   clr	X0402     ;clr (00) in addr 0402 (PIA sound select)
FD21 : CE 2E E0   ldx	#$2EE0    ;load X with 2EE0h
;LFD24:
FD24 : 09         dex           ;decr X
FD25 : 26 FD      bne	LFD24     ;branch !=0
FD27 : 86 80      ldaa	#$80    ;load A with 80h (1000 0000)
FD29 : B7 04 02   staa	X0402   ;store A in addr 0402 (PIA sound select)
FD2C : 86 0A      ldaa	#$0A    ;load A with 0Ah (0000 1010)
FD2E : BD FA F0   jsr	LFAF0     ;jump sub
FD31 : BD FB 57   jsr	LFB57     ;jump sub
FD34 : 86 0B      ldaa	#$0B    ;load A with 0Bh (0000 1011)
FD36 : BD FA F0   jsr	LFAF0     ;jump sub
FD39 : BD FB 57   jsr	LFB57     ;jump sub
FD3C : 4F         clra          ;clear A
FD3D : BD F8 5A   jsr	LF85A     ;jump sub
FD40 : BD F8 7E   jsr	LF87E     ;jump sub SYNTH1
FD43 : CE EF FA   ldx	#$EFFA    ;load X with EFFAh
FD46 : C6 7E      ldab	#$7E    ;load B with 7Eh (0111 1110)
FD48 : E1 00      cmpb	$00,x   ;comp B with addr X + 00h
FD4A : 27 07      beq	LFD53     ;branch =0
FD4C : CE DF FA   ldx	#$DFFA    ;load X with DFFAh
FD4F : E1 00      cmpb	$00,x   ;comp B with addr X + 00h
FD51 : 26 B6      bne	LFD09     ;branch !=0
;LFD53:
FD53 : AD 00      jsr	$00,x     ;jump sub addr X + 00h
FD55 : 20 B2      bra	LFD09     ;branch always NMI
;*************************************;
; VWTAB data below
;*************************************;
FD57 : F8 D5                    ;SYNTH2 
FD59 : FA 02                    ;SYNTH5	
FD5B : FA 7D 
FD5D : FA A2 
FD5F : FA 76 
FD61 : FA C7	
FD63 : FA DA 
FD65 : FC EE 
FD67 : F9 76                    ;SYNTH4 
FD69 : F9 71                    ;PARAM4
FD6B : F9 32                    ;SYNTH3 
FD6D : FC 27
;*************************************;
;VVECT    EQU *
;*************************************;
;LFD6F called from PARAM1 
FD6F : 40	01 00	10 E1 00 80 FF FF     ;SAW
FD78 : 28 01 00	08 81 02 00 FF FF     ;FOSHIT
FD81 : 00	FF 08 FF 68 04 80 00 FF     ;CSCALE
FD8A : 36 21		" 6!"		stx	X3621
FD8C : 09		" "		dex
FD8D : 06		" "		tap
FD8E : EF 03		"  "		stx	$03,x
FD90 : C0 00		"  "		subb	#$00
FD92 : FF 0E E7		"   "		stx	X0EE7
FD95 : 35		"5"		txs
FD96 : 33		"3"		pulb
FD97 : 79 03 80		"y  "		rol	X0380
FD9A : F2 FF 08		"   "		sbcb	XFF08
FD9D : 7F D9 FF		"   "		clr	XD9FF
FDA0 : D9 7F		"  "		adcb	X007F
FDA2 : 24 00		"$ "		bcc	LFDA4
FDA4				LFDA4:
FDA4 : 24 08		"$ "		bcc	LFDAE
FDA6 : FF FF FF		"   "		stx	XFFFF
FDA9 : FF 00 00		"   "		stx	X0000
				;
FDAC : 00 00		"  "		db	$00, $00
				;
FDAE				LFDAE:
FDAE : 08		" "		inx
				;
FDAF : 00		" "		db	$00
				;
FDB0				LFDB0:
FDB0 : 40		"@"		nega
FDB1 : 80 00		"  "		suba	#$00
FDB3 : FF 00 80		"   "		stx	X0080
FDB6 : 40		"@"		nega
FDB7 : 10		" "		sba
FDB8 : 7F B0 D9		"   "		clr	XB0D9
FDBB : F5 FF F5		"   "		bitb	XFFF5
FDBE : D9 B0		"  "		adcb	X00B0
FDC0 : 7F 4E 24		" N$"		clr	X4E24
FDC3 : 09		" "		dex
				;
FDC4 : 00		" "		db	$00
				;
FDC5 : 09		" "		dex
FDC6 : 24 4E		"$N"		bcc	LFE16
FDC8 : 10		" "		sba
				;
FDC9 : 00		" "		db	$00
				;
FDCA : FF FF FF		"   "		stx	XFFFF
FDCD : FA D0 C0		"   "		orab	XD0C0
FDD0 : A0 90		"  "		suba	$90,x
FDD2 : 80 70		" p"		suba	#$70
				;
FDD4 : 00 00 00		"   "		db	$00, $00, $00
				;
FDD7 : 30		"0"		tsx
FDD8 : C0 10		"  "		subb	#$10
FDDA : 76 FF B8		"v  "		ror	XFFB8
FDDD : D0 9D		"  "		subb	X009D
FDDF : E6 6A		" j"		ldab	$6A,x
FDE1 : 82 76		" v"		sbca	#$76
FDE3 : EA 81		"  "		orab	$81,x
FDE5 : 86 4E		" N"		ldaa	#$4E
FDE7 : 9C 32		" 2"		cpx	X0032
FDE9 : 63 10		"c "		com	$10,x
FDEB : FF FF FF		"   "		stx	XFFFF
FDEE : FF FF FF		"   "		stx	XFFFF
FDF1 : FF FF 00		"   "		stx	XFF00
				;
FDF4 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FDF8 : 00 00 00		"   "		db	$00, $00, $00
				;
FDFB : 10		" "		sba
FDFC : FF FF FF		"   "		stx	XFFFF
FDFF : FF 00 00		"   "		stx	X0000
				;
FE02 : 00 00		"  "		db	$00, $00
				;
FE04 : FF FF FF		"   "		stx	XFFFF
FE07 : FF 00 00		"   "		stx	X0000
				;
FE0A : 00 00		"  "		db	$00, $00
				;
FE0C : 10		" "		sba
				;
FE0D : 00		" "		db	$00
				;
FE0E : F4 00 E8		"   "		andb	X00E8
				;
FE11 : 00 DC 00		"   "		db	$00, $DC, $00
				;
FE14 : E2 00		"  "		sbcb	$00,x
				;
FE16				LFE16:
FE16 : DC 00		"  "		db	$DC, $00
				;
FE18 : E8 00		"  "		eorb	$00,x
FE1A : F4 00 00		"   "		andb	X0000
FE1D : 48		"H"		asla
FE1E : 8A 95		"  "		oraa	#$95
FE20 : A0 AB		"  "		suba	$AB,x
FE22 : E7 E7		"  "		stab	$E7,x
FE24 : E7 E7		"  "		stab	$E7,x
FE26 : DA E1		"  "		orab	X00E1
FE28 : E8 EE		"  "		eorb	$EE,x
FE2A : 25 25		"%%"		bcs	LFE51
FE2C : 25 25		"%%"		bcs	LFE53
FE2E : FE FF FE		"   "		ldx	XFFFE
				;
FE31 : FD		" "		db	$FD
				;
FE32 : 2D 2D		"--"		blt	LFE61
FE34 : 2D 2D		"--"		blt	LFE63
FE36 : E8 E1		"  "		eorb	$E1,x
FE38 : DA D1		"  "		orab	X00D1
FE3A : FA FA FA		"   "		orab	XFAFA
FE3D				LFE3D:
FE3D : FA A0 95		"   "		orab	XA095
FE40 : 8A 7F		"  "		oraa	#$7F
FE42 : A7 A7		"  "		staa	$A7,x
FE44 : A7 A7		"  "		staa	$A7,x
FE46 : 4A		"J"		deca
FE47 : 40		"@"		nega
FE48 : 37		"7"		pshb
FE49 : 2E 57		".W"		bgt	LFEA2
FE4B : 57		"W"		asrb
FE4C : 57		"W"		asrb
FE4D : 57		"W"		asrb
FE4E : 0C		" "		clc
FE4F : 08		" "		inx
				;
FE50 : 04 02		"  "		db	$04, $02
				;
FE52 : 33		"3"		pulb
FE53				LFE53:
FE53 : 33		"3"		pulb
FE54 : 33		"3"		pulb
FE55 : 33		"3"		pulb
				;
FE56 : 04		" "		db	$04
				;
FE57 : 08		" "		inx
FE58 : 0C		" "		clc
FE59 : 11		" "		cba
FE5A : 49		"I"		rola
FE5B : 49		"I"		rola
FE5C : 49		"I"		rola
FE5D : 49		"I"		rola
FE5E : 37		"7"		pshb
FE5F : 40		"@"		nega
FE60 : 4A		"J"		deca
FE61				LFE61:
FE61 : 54		"T"		lsrb
FE62 : 91 91		"  "		cmpa	X0091
FE64 : 91 91		"  "		cmpa	X0091
FE66 : F6 54 03		" T "		ldab	X5403
				;
FE69 : 00 02		"  "		db	$00, $02
				;
FE6B : 06		" "		tap
FE6C : 23 14		"# "		bls	LFE82
FE6E : 10		" "		sba
				;
FE6F : 00		" "		db	$00
				;
FE70 : 01		" "		nop
				;
FE71 : 00		" "		db	$00
				;
FE72 : 01		" "		nop
FE73 : 6A 99		"j "		dec	$99,x
FE75 : 23 0F		"# "		bls	LFE86
				;
FE77 : 00 00		"  "		db	$00, $00
				;
FE79 : 07		" "		tpa
FE7A : A8 61		" a"		eora	$61,x
FE7C : 31		"1"		ins
				;
FE7D : 00 00 00		"   "		db	$00, $00, $00
				;
FE80 : 50		"P"		negb
FE81 : 20 31		" 1"		bra	LFEB4
				;
FE83 : 12		" "		db	$12
				;
FE84 : 11		" "		cba
FE85 : FF 25 13		" % "		stx	X2513
				;
FE88 : 3A		":"		db	$3A
				;
FE89 : 17		" "		tba
				;
FE8A : 14 00 00 00	"    "		db	$14, $00, $00, $00
				;
FE8E : 10		" "		sba
FE8F : 20 11		"  "		bra	LFEA2
				;
FE91 : 08		" "		inx
				;
FE92 : 02 00 00		"   "		db	$02, $00, $00
				;
FE95 : 20 27		" '"		bra	LFEBE
				;
FE97 : 81 27		" '"		cmpa	#$27
				;
FE99 : 00 00 00		"   "		db	$00, $00, $00
				;
FE9C : 16		" "		tab
FE9D : 60 81		"` "		neg	$81,x
FE9F : 27 00		"' "		beq	LFEA1
				;
FEA1				LFEA1:
FEA1 : 00 00		"  "		db	$00, $00
				;
FEA3 : 16		" "		tab
				;
FEA4 : 15 41 03		" A "		db	$15, $41, $03
				;
FEA7 : D0 00		"  "		subb	X0000
				;
FEA9 : 00		" "		db	$00
				;
FEAA : 27 91		"' "		beq	LFE3D
FEAC : F2 29 80		" ) "		sbcb	X2980
				;
FEAF : 00 00		"  "		db	$00, $00
				;
FEB1 : 0D		" "		sec
FEB2 : 1B		" "		aba
FEB3 : 81 27		" '"		cmpa	#$27
				;
FEB5 : 00 00 00		"   "		db	$00, $00, $00
				;
FEB8 : 16		" "		tab
FEB9 : 54		"T"		lsrb
FEBA : 24 21		"$!"		bcc	LFEDD
				;
FEBC : 03		" "		db	$03
				;
FEBD : FF 10 09		"   "		stx	X1009
;*************************************;
;synth data - next is 32 bytes below
;*************************************;
;called by X from SYNTH2
FEC0 : 39	11

FEC2 : 17		" "		tba
				;
FEC3 : 00		" "		db	$00
				;
FEC4 : 01		" "		nop
FEC5 : 20 09		"  "		bra	LFED0
				;
FEC7 : 14		" "		db	$14
				;
FEC8 : F2 F6 00		"   "		sbcb	XF600
FECB : FF 01 15		"   "		stx	X0115
FECE : 39		"9"		rts
				;
FECF : 93		" "		db	$93
				;
FED0				LFED0:
FED0 : 35		"5"		txs
FED1 : F0 FF 01		"   "		subb	XFF01
FED4 : 07		" "		tpa
				;
FED5 : 15 13		"  "		db	$15, $13
				;
FED7 : 09		" "		dex
FED8 : 11		" "		cba
FED9 : FF 00 05		"   "		stx	X0005
FEDC : 31		"1"		ins
				;
FEDD				LFEDD:
FEDD : 18 03 00		"   "		db	$18, $03, $00
;
;called by X from SYNTH2
FEE0 : FF 00 16		"   "		stx	X0016
FEE3 : 54		"T"		lsrb
FEE4 : A0 98		"  "		suba	$98,x
FEE6 : 90 88		"  "		suba	X0088
FEE8 : 80 78		" x"		suba	#$78
FEEA : 70 68 60		"ph`"		neg	X6860
FEED : 58		"X"		aslb
FEEE : 50		"P"		negb
FEEF : 44		"D"		lsra
FEF0 : 40		"@"		nega
FEF1 : 01		" "		nop
FEF2 : 01		" "		nop
				;
FEF3 : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
FEF7 : 08		" "		inx
FEF8 : 08		" "		inx
FEF9 : 10		" "		sba
FEFA : 10		" "		sba
FEFB : 30		"0"		tsx
FEFC : 60 C0		"` "		neg	$C0,x
FEFE : E0 01		"  "		subb	$01,x
FF00				XFF00:
FF00 : 01		" "		nop
				;
FF01				XFF01:
FF01 : 02 02 03 04	"    "		db	$02, $02, $03, $04
FF05 : 05		" "		db	$05
				;
FF06 : 06		" "		tap
FF07 : 07		" "		tpa
FF08				XFF08:
FF08 : 08		" "		inx
FF09 : 09		" "		dex
FF0A : 0A		" "		clv
FF0B : 0C		" "		clc
FF0C : 08		" "		inx
FF0D : 80 10		"  "		suba	#$10
FF0F : 78 18 70		"x p"		asl	X1870
FF12 : 20 60		" `"		bra	LFF74
				;
FF14 : 28 58		"(X"		bvc	LFF6E
FF16 : 30		"0"		tsx
FF17 : 50		"P"		negb
FF18 : 40		"@"		nega
FF19 : 48		"H"		asla
				;
FF1A : 04 05		"  "		db	$04, $05
				;
FF1C : 06		" "		tap
FF1D : 07		" "		tpa
FF1E : 08		" "		inx
FF1F : 0A		" "		clv
FF20 : 0C		" "		clc
FF21 : 0E		" "		cli
FF22 : 10		" "		sba
FF23 : 11		" "		cba
				;
FF24 : 12 13 14 15	"    "		db	$12, $13, $14, $15
				;
FF28 : 16		" "		tab
FF29 : 17		" "		tba
				;
FF2A : 18		" "		db	$18
				;
FF2B : 19		" "		daa
				;
FF2C : 1A		" "		db	$1A
				;
FF2D : 1B		" "		aba
				;
FF2E : 1C		" "		db	$1C
				;
FF2F : 80 7C		" |"		suba	#$7C
FF31 : 78 74 70		"xtp"		asl	X7470
FF34 : 74 78 7C		"tx|"		lsr	X787C
FF37 : 80 01		"  "		suba	#$01
FF39 : 01		" "		nop
				;
FF3A : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
FF3E : 08		" "		inx
FF3F : 08		" "		inx
FF40 : 10		" "		sba
FF41 : 20 28		" ("		bra	LFF6B
				;
FF43 : 30		"0"		tsx
				;
FF44 : 38		"8"		db	$38
				;
FF45 : 40		"@"		nega
FF46 : 48		"H"		asla
FF47 : 50		"P"		negb
FF48 : 60 70		"`p"		neg	$70,x
FF4A : 80 A0		"  "		suba	#$A0
FF4C : B0 C0 08		"   "		suba	XC008
FF4F : 40		"@"		nega
FF50 : 08		" "		inx
FF51 : 40		"@"		nega
FF52 : 08		" "		inx
FF53 : 40		"@"		nega
FF54 : 08		" "		inx
FF55 : 40		"@"		nega
FF56 : 08		" "		inx
FF57 : 40		"@"		nega
FF58 : 08		" "		inx
FF59 : 40		"@"		nega
FF5A : 08		" "		inx
FF5B : 40		"@"		nega
FF5C : 08		" "		inx
FF5D : 40		"@"		nega
FF5E : 08		" "		inx
FF5F : 40		"@"		nega
FF60 : 08		" "		inx
FF61 : 40		"@"		nega
FF62 : 01		" "		nop
				;
FF63 : 02 04		"  "		db	$02, $04
				;
FF65 : 08		" "		inx
FF66 : 09		" "		dex
FF67 : 0A		" "		clv
FF68 : 0B		" "		sev
FF69 : 0C		" "		clc
FF6A : 0E		" "		cli
FF6B				LFF6B:
FF6B : 0F		" "		sei
FF6C : 10		" "		sba
				;
FF6D : 12 14		"  "		db	$12, $14
				;
FF6F : 16		" "		tab
FF70 : 40		"@"		nega
FF71 : 10		" "		sba
FF72 : 08		" "		inx
FF73 : 01		" "		nop
FF74				LFF74:
FF74 : 92 01		"  "		sbca	X0001
FF76 : 01		" "		nop
FF77 : 01		" "		nop
FF78 : 01		" "		nop
				;
FF79 : 02 02 03 03	"    "		db	$02, $02, $03, $03
FF7D : 04 04 05		"   "		db	$04, $04, $05
				;
FF80 : 06		" "		tap
FF81 : 08		" "		inx
FF82 : 0A		" "		clv
FF83 : 0C		" "		clc
FF84 : 10		" "		sba
				;
FF85 : 14 18		"  "		db	$14, $18
				;
FF87 : 20 30		" 0"		bra	LFFB9
				;
FF89 : 40		"@"		nega
FF8A : 50		"P"		negb
FF8B : 40		"@"		nega
FF8C : 30		"0"		tsx
FF8D : 20 10		"  "		bra	LFF9F
				;
FF8F : 0C		" "		clc
FF90 : 0A		" "		clv
FF91 : 08		" "		inx
FF92 : 07		" "		tpa
FF93 : 06		" "		tap
				;
FF94 : 05 04 03 02	"    "		db	$05, $04, $03, $02
FF98 : 02		" "		db	$02
				;
FF99 : 01		" "		nop
FF9A : 01		" "		nop
FF9B : 01		" "		nop
FF9C : 01		" "		nop
				;
FF9D : FC 02 FC 03	"    "		db	$FC, $02, $FC, $03
				;
FFA1 : F8 04 F8		"   "		eorb	X04F8
FFA4 : 06		" "		tap
FFA5 : F8 08 F4		"   "		eorb	X08F4
FFA8 : 0C		" "		clc
FFA9 : F4 10 F4		"   "		andb	X10F4
FFAC : 20 F2		"  "		bra	LFFA0
				;
FFAE : 40		"@"		nega
FFAF : F1 60 F1		" ` "		cmpb	X60F1
FFB2 : 80 F1		"  "		suba	#$F1
FFB4 : A0 F1		"  "		suba	$F1,x
FFB6 : C0 F1		"  "		subb	#$F1
				;
FFB8				XFFB8:
FFB8 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFBC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFC0 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFC4 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFC8 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFCC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFD0 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFD4 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFD8 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFDC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFE0 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFE4 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFE8 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFEC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFF0 : 00 00 00		"   "		db	$00, $00, $00
				;
FFF3 : 7E FC DF		"~  "		jmp	LFCDF
				;
FFF6 : DF DA		"  "		stx	X00DA
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FC	66	                ;IRQ 
FFFA : F8	01                  ;RESET (software) 
FFFC : FD	09                  ;NMI 
FFFE : F8	01                  ;RESET (hardware) 

;--------------------------------------------------------------
