				;
				;	Disassembled by:
				;		DASMx object code disassembler
				;		(c) Copyright 1996-2003   Conquest Consultants
				;		Version 1.40 (Oct 18 2003)
				;
				;	File:		varkon.716
				;	Size:		2048 bytes
				;	Checksum:	A694
				;	CRC-32:		D13DB2BB
				;	Date:		Tue Mar 16 17:02:20 2021
				;
				;	CPU:		Motorola 6800 (6800/6802/6808 family)
				;
				; UPDATED:: 17 Mar 2021
				;
					org	$F800
				;
F800 : 4A		      deca          ;hmmm
;*************************************;
;RESET
;*************************************;
F801 : 0F		      sei           ;set interrupt mask
F802 : 8E 00 7F		lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111)
F805 : CE 00 7F		ldx	#$007F    ;load X with 007Fh (0000 0000 0111 1111)
;LOOP1
F808 : 6F 00		  clr	$00,x
F80A : 09		      dex
F80B : 26 FB		  bne	LF808     ;branch !=0 LOOP1
F80D : CE 04 00		ldx	#$0400
F810 : 6F 01		  clr	$01,x
F812 : 6F 03		  clr	$03,x
F814 : 86 FF		  ldaa	#$FF
F816 : A7 00			staa	$00,x
F818 : C6 80			ldab	#$80
F81A : E7 02		  stab	$02,x
F81C : 86 37			ldaa	#$37
F81E : A7 03		  staa	$03,x
F820 : 86 3C		  ldaa	#$3C
F822 : A7 01		  staa	$01,x
F824 : 97 00		  staa	X0000
F826 : E7 02		  stab	$02,x
F828 : 0E		      cli           ;clear interrupt
;STDBY1:
F829 : 20 FE		  bra	LF829     ;branch always to STDBY1
;STDBY2:
F82B : 3E		      wai           ;wait for interrupt
;*************************************;
;NMI
;*************************************;
F82C : 0F		      sei           ;set interrupt mask
F82D : 8E 00 7F		lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111)
F830 : CE FF FF		ldx	#$FFFF
F833 : 4F		      clra
;LOOP2
F834 : AB 00		  adda	$00,x
F836 : 09		      dex
F837 : 8C F8 00		cpx	#$F800
F83A : 26 F8		  bne	LF834     ;LOOP2
F83C : A1 00		  cmpa	$00,x
F83E : 26 EB		  bne	LF82B     ;branch !=0 STDBY2
F840 : 8D 07		  bsr	LF849     ;branch sub PARAM12 
F842 : 8D 05		  bsr	LF849     ;branch sub PARAM12
F844 : BD FB 23		jsr	LFB23     ;jump sub SYNTH4
F847 : 20 E3		  bra	LF82C     ;branch always NMI
;*************************************;
;PARAM12
;*************************************;
F849 : 86 00		  ldaa	#$00
F84B : 7E FC 08		jmp	LFC08     ;jump PRM91
;*************************************;
;IRQ
;*************************************;
F84E : 8E 00 7F		lds	#$007F    ;load SP with 007F
F851 : B6 04 02		ldaa	X0402   ;load A with 0402 PIA sound select
F854 : C6 80		  ldab	#$80    ;load B with 80h (1000 0000)
F856 : F7 04 02		stab	X0402   ;store B into 0402 (PIA sound select)
F859 : 43		      coma
F85A : 84 1F		  anda	#$1F
F85C : 27 48		  beq	LF8A6     ;branch =0 IRQ1
F85E : 4A		      deca
F85F : 5F		      clrb
F860 : 81 16		  cmpa	#$16
F862 : 26 02		  bne	LF866     ;branch !=0 IRQ2
F864 : D7 0A		  stab	X000A
;IRQ2
F866 : 81 05		  cmpa	#$05
F868 : 27 06		  beq	LF870     ;branch =0 IRQ3
F86A : D7 08		  stab	X0008
F86C : D7 09		  stab	X0009
F86E : 20 02		  bra	LF872     ;branch always IRQ4
;IRQ3
F870 : D7 0A		  stab	X000A
;IRQ4
F872 : 81 1B		  cmpa	#$1B
F874 : 2D 02		  blt	LF878     ;branch if <0 IRQ5
F876 : D7 07		  stab	X0007
;IRQ5
F878 : 81 0B		  cmpa	#$0B
F87A : 2F 02		  ble	LF87E     ;branch if <=0 IRQ6
F87C : D7 03		  stab	X0003
;IRQ6
F87E : 9B 03		  adda	X0003
F880 : 0E		      cli
F881 : CE FC 2A		ldx	#$FC2A    ;wavetable
F884 : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
F887 : A6 00		  ldaa	$00,x
F889 : 16		      tab
F88A : 84 3F		  anda	#$3F
F88C : 58		      aslb
F88D : 25 14		  bcs	LF8A3     ;branch if Carry set IRQ7
F88F : 2B 0D		  bmi	LF89E     ;branch if Minus IRQ8
F891 : 48		      asla
F892 : CE FC 56		ldx	#$FC56    ;VWTAB for SYNTH3
F895 : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
F898 : EE 00		  ldx	$00,x
F89A : AD 00		  jsr	$00,x			;INFO: index jump
F89C : 20 08		  bra	LF8A6     ;branch always IRQ1
;IRQ8
F89E : BD F9 03		jsr	LF903     ;jump sub SYNTH1
F8A1 : 20 03		  bra	LF8A6     ;branch always IRQ1
;IRQ7
F8A3 : BD FC 08		jsr	LFC08     ;jump sub PRM91
;IRQ1
F8A6 : 0E		      cli
F8A7 : 96 07		  ldaa	X0007
;STDBY3:
F8A9 : 27 FE		  beq	LF8A9     ;branch if =0 here STDBY3
F8AB : 96 03		  ldaa	X0003
F8AD : 26 38		  bne	LF8E7     ;branch !=0 IRQ12
F8AF : 8D 20		  bsr	LF8D1     ;branch sub IRQ11
F8B1 : 8D 1E		  bsr	LF8D1     ;branch sub IRQ11
F8B3 : 8D 1C		  bsr	LF8D1     ;branch sub IRQ11
F8B5 : 96 04		  ldaa	X0004
F8B7 : 81 0E		  cmpa	#$0E
F8B9 : 2E 0E		  bgt	LF8C9     ;branch if >0 IRQ9
F8BB : 96 02		  ldaa	X0002
F8BD : 81 2B		  cmpa	#$2B
F8BF : 2E 02		  bgt	LF8C3     ;branch if >0 IRQ8
F8C1 : 86 36		  ldaa	#$36
;IRQ8
F8C3 : 4A		      deca
F8C4 : 97 02		  staa	X0002
F8C6 : 8B E3		  adda	#$E3
F8C8 : 4C		      inca
;IRQ9
F8C9 : 8B FF		  adda	#$FF
F8CB : 97 04		  staa	X0004
;IRQ10
F8CD : 8D 02		  bsr	LF8D1     ;branch sub IRQ11
F8CF : 20 FC		  bra	LF8CD     ;branch always IRQ10
;IRQ11
F8D1 : 86 06		  ldaa	#$06
F8D3 : BD F9 B9		jsr	LF9B9     ;jump sub PARAM6
F8D6 : CE 00 02		ldx	#$0002
F8D9 : DF 1C		  stx	X001C
F8DB : 08		      inx
F8DC : DF 1E		  stx	X001E
F8DE : 96 04		  ldaa	X0004
F8E0 : 97 18		  staa	X0018
F8E2 : 80 24		  suba	#$24
F8E4 : 7E FA 7C		jmp	LFA7C     ;jump PRM72
;IRQ12
F8E7 : 86 07		  ldaa	#$07
F8E9 : BD FC 08		jsr	LFC08     ;jump sub PRM91
F8EC : 20 F9		  bra	LF8E7     ;branch always IRQ12
;*************************************;
;PARAM1
;*************************************;
F8EE : 16		      tab
F8EF : 48		      asla
F8F0 : 48		      asla
F8F1 : 48		      asla
F8F2 : 1B		      aba
F8F3 : CE 00 14		ldx	#$0014
F8F6 : DF 10		  stx	X0010
F8F8 : CE FC 6C		ldx	#$FC6C    ;SAW wavetable
F8FB : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
F8FE : C6 09		  ldab	#$09
F900 : 7E F9 52		jmp	LF952     ;jump UTIL1
;*************************************;
;SYNTH1
;*************************************;
F903 : 8D E9		  bsr	LF8EE     ;branch sub PARAM1
F905 : 96 1C		  ldaa	X001C
F907 : B7 04 00		staa	X0400   ;DAC output SOUND
;SYN11
F90A : 96 14		  ldaa	X0014
F90C : 97 1D		  staa	X001D
F90E : 96 15		  ldaa	X0015
F910 : 97 1E		  staa	X001E
;SYN12
F912 : DE 19		  ldx	X0019
;LOOP3
F914 : 96 1D		  ldaa	X001D
F916 : 73 04 00		com	X0400     ;complement 1s DAC SOUND
;LOOP4
F919 : 09		      dex
F91A : 27 10		  beq	LF92C     ;branch =0 SYNTH2
F91C : 4A		      deca
F91D : 26 FA		  bne	LF919     ;branch !=0 LOOP4
F91F : 73 04 00		com	X0400     ;complement 1s DAC SOUND
F922 : 96 1E		  ldaa	X001E
;LOOP5
F924 : 09		      dex
F925 : 27 05		  beq	LF92C     ;branch =0 SYNTH2
F927 : 4A		      deca
F928 : 26 FA		  bne	LF924     ;branch !=0 LOOP5
F92A : 20 E8		  bra	LF914     ;branch always LOOP3
;*************************************;
;SYNTH2
;*************************************;
F92C : B6 04 00		ldaa	X0400   ;load A with DAC 0400
F92F : 2B 01		  bmi	LF932     ;branch if Minus SYN21
F931 : 43		      coma
;SYN21
F932 : 8B 00		  adda	#$00
F934 : B7 04 00		staa	X0400   ;DAC output SOUND
F937 : 96 1D		  ldaa	X001D
F939 : 9B 16		  adda	X0016
F93B : 97 1D		  staa	X001D
F93D : 96 1E		  ldaa	X001E
F93F : 9B 17		  adda	X0017
F941 : 97 1E		  staa	X001E
F943 : 91 18		  cmpa	X0018
F945 : 26 CB		  bne	LF912     ;branch !=0 SYN12
F947 : 96 1B		  ldaa	X001B
F949 : 27 06		  beq	LF951     ;branch =0 SYN22
F94B : 9B 14		  adda	X0014
F94D : 97 14		  staa	X0014
F94F : 26 B9		  bne	LF90A     ;branch !=0 SYN11
;SYN22
F951 : 39		      rts           ;return subroutine
;*************************************;
;UTIL1
;*************************************;
F952 : 36		      psha
;LOOP6
F953 : A6 00		  ldaa	$00,x
F955 : DF 0E		  stx	X000E
F957 : DE 10		  ldx	X0010
F959 : A7 00		  staa	$00,x
F95B : 08		      inx
F95C : DF 10		  stx	X0010
F95E : DE 0E		  ldx	X000E
F960 : 08		      inx
F961 : 5A		      decb
F962 : 26 EF		  bne	LF953     ;branch !=0 LOOP6
F964 : 32		      pula
F965 : 39		      rts           ;return subroutine
;*************************************;
;PARAM2 called from VWTAB
;*************************************;
F966 : 86 01		  ldaa	#$01
F968 : 97 07		  staa	X0007
F96A : 86 23		  ldaa	#$23
F96C : 97 04		  staa	X0004
F96E : 86 40		  ldaa	#$40
F970 : 97 02		  staa	X0002
;STDBY4
F972 : 20 FE		  bra	LF972     ;branch always to here STDBY4
;*************************************;
;PARAM3 called from VWTAB
;*************************************;
F974 : 7A 00 08		dec	X0008
F977 : 86 15		  ldaa	#$15
F979 : 8D 3E		  bsr	LF9B9     ;branch sub PARAM6
F97B : 96 08		  ldaa	X0008
F97D : BD FA 7C		jsr	LFA7C     ;jump sub PRM72
;STDBY5
F980 : 20 FE		  bra	LF980     ;branch always to here STDBY5
;*************************************;
;PARAM4 called from VWTAB
;*************************************;
F982 : 96 09		  ldaa	X0009
F984 : 26 08		  bne	LF98E     ;branch !=0 PRM41
F986 : 7C 00 09		inc	X0009
F989 : 86 14		  ldaa	#$14
F98B : 7E FC 08		jmp	LFC08     ;jump PRM91
;PRM41
F98E : 4A		      deca
F98F : 26 07		  bne	LF998     ;branch !=0 PRM42
F991 : 86 02		  ldaa	#$02
F993 : 97 09		  staa	X0009
F995 : 7E FA 71		jmp	LFA71     ;jump PARAM7
;PRM42
F998 : 97 09		  staa	X0009
F99A : 7E FA 23		jmp	LFA23     ;jump SYNTH3
;*************************************;
;PARAM5
;*************************************;
F99D : 7F 00 09		clr	X0009
F9A0 : 86 FC		  ldaa	#$FC
F9A2 : 9B 24		  adda	X0024
F9A4 : 97 24		  staa	X0024
F9A6 : 86 01		  ldaa	#$01
F9A8 : 97 18		  staa	X0018
F9AA : 86 10		  ldaa	#$10
F9AC : 97 14		  staa	X0014
F9AE : 86 02		  ldaa	#$02
F9B0 : 97 15		  staa	X0015
F9B2 : 86 01		  ldaa	#$01
F9B4 : 97 16		  staa	X0016
F9B6 : 7E FA 7E		jmp	LFA7E     ;jump PRM73
;*************************************;
;PARAM6
;*************************************;
F9B9 : CE FD D4		ldx	#$FDD4    ;wavetable
F9BC : 48		      asla
F9BD : 48		      asla
F9BE : 48		      asla
F9BF : 24 03		  bcc	LF9C4     ;branch if Carry clear PRM61
F9C1 : CE FE D4		ldx	#$FED4    ;wavetable
;PRM61
F9C4 : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
F9C7 : A6 00		  ldaa	$00,x
F9C9 : 16		      tab
F9CA : 84 0F		 	anda	#$0F
F9CC : 97 15		  staa	X0015
F9CE : 54		      lsrb
F9CF : 54		      lsrb
F9D0 : 54		      lsrb
F9D1 : 54		      lsrb
F9D2 : D7 14		  stab	X0014
F9D4 : A6 01		  ldaa	$01,x
F9D6 : 16		      tab
F9D7 : 54		      lsrb
F9D8 : 54		      lsrb
F9D9 : 54		      lsrb
F9DA : 54		    	lsrb
F9DB : D7 16		  stab	X0016
F9DD : 84 0F		  anda	#$0F
F9DF : 97 12		  staa	X0012
F9E1 : DF 0C		  stx	X000C
F9E3 : CE FC 90		ldx	#$FC90    ;wavetable
;LOOP7
F9E6 : 7A 00 12		dec	X0012
F9E9 : 2B 08		  bmi	LF9F3     ;branch if Minus PRM62
F9EB : A6 00		  ldaa	$00,x
F9ED : 4C		      inca
F9EE : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
F9F1 : 20 F3		  bra	LF9E6     ;branch always LOOP7
;PRM62
F9F3 : DF 19		  stx	X0019
F9F5 : BD FA B8		jsr	LFAB8     ;jump sub PRM7B
F9F8 : DE 0C		  ldx	X000C
F9FA : A6 02		  ldaa	$02,x
F9FC : 97 1B		  staa	X001B
F9FE : BD FA CA		jsr	LFACA     ;jump sub PRM7C
FA01 : DE 0C		  ldx	X000C
FA03 : A6 03		  ldaa	$03,x
FA05 : 97 17		  staa	X0017
FA07 : A6 04		  ldaa	$04,x
FA09 : 97 18		  staa	X0018
FA0B : A6 05		  ldaa	$05,x
FA0D : 97 24		  staa	X0024
FA0F : A6 06		  ldaa	$06,x
FA11 : 16		      tab
FA12 : A6 07		  ldaa	$07,x
FA14 : CE FE CC		ldx	#$FECC    ;wavetable
FA17 : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
FA1A : 17		      tba
FA1B : DF 1C		  stx	X001C
FA1D : BD FA F9		jsr	LFAF9     ;jump sub CALCOS
FA20 : DF 1E		  stx	X001E
FA22 : 39		      rts           ;return subroutine
;*************************************;
;SYNTH3 LFA23
;*************************************;
FA23 : 96 24		  ldaa	X0024
FA25 : 26 55		  bne	LFA7C     ;branch !=0 PRM72
;SYN31
FA27 : 96 14		  ldaa	X0014
FA29 : 97 23		  staa	X0023
;SYN32
FA2B : DE 1C		  ldx	X001C
FA2D : DF 0E		  stx	X000E
;LOOP8
FA2F : DE 0E		  ldx	X000E
FA31 : A6 00		  ldaa	$00,x
FA33 : 9B 24		  adda	X0024
FA35 : 97 22		  staa	X0022
FA37 : 9C 1E		  cpx	X001E
FA39 : 27 26		  beq	LFA61     ;branch =0 PARAM7
FA3B : D6 15		  ldab	X0015
FA3D : 08		      inx
FA3E : DF 0E		  stx	X000E
;LOOP9
FA40 : CE 00 25		ldx	#$0025
;LOOP10
FA43 : 96 22		  ldaa	X0022
;LOOP11
FA45 : 4A		      deca
FA46 : 26 FD		  bne	LFA45     ;branch !=0 LOOP11
FA48 : A6 00		  ldaa	$00,x
FA4A : B7 04 00		staa	X0400   ;DAC output SOUND
FA4D : 08		      inx
FA4E : 9C 20		  cpx	X0020
FA50 : 26 F1		  bne	LFA43     ;branch !=0 LOOP10
FA52 : 5A		      decb
FA53 : 27 DA		  beq	LFA2F     ;branch =0 LOOP8
FA55 : 08		      inx
FA56 : 09		      dex
FA57 : 08		      inx
FA58 : 09		      dex
FA59 : 08		      inx
FA5A : 09		      dex
FA5B : 08		      inx
FA5C : 09		      dex
FA5D : 01		      nop
FA5E : 01		      nop
FA5F : 20 DF		  bra	LFA40     ;branch always LOOP9
;*************************************;
;PARAM7
;*************************************;
FA61 : 96 16		  ldaa	X0016
FA63 : 8D 65		  bsr	LFACA     ;branch sub PRM7C
FA65 : 7A 00 23		dec	X0023
FA68 : 26 C1		  bne	LFA2B     ;branch !=0 SYN32
FA6A : 96 09		  ldaa	X0009
FA6C : 27 03		  beq	LFA71     ;branch =0 PRM71
FA6E : 7E F9 9D		jmp	LF99D     ;jump PARAM5
;PRM71
FA71 : 96 17		  ldaa	X0017
FA73 : 27 42		  beq	LFAB7     ;branch =0 PRM7A
FA75 : 7A 00 18		dec	X0018
FA78 : 27 3D		  beq	LFAB7     ;branch =0 PRM7A
FA7A : 9B 24		  adda	X0024
;PRM72
FA7C : 97 24		  staa	X0024
;PRM73
FA7E : DE 1C		  ldx	X001C
FA80 : 5F		      clrb
;LOOP12
FA81 : 96 24		  ldaa	X0024
FA83 : 7D 00 17		tst	X0017
FA86 : 2B 06		  bmi	LFA8E     ;branch if Minus PRM74
FA88 : AB 00		  adda	$00,x
FA8A : 25 08		  bcs	LFA94     ;branch if Carry set PRM75
FA8C : 20 0B		  bra	LFA99     ;branch always PRM76
;PRM74
FA8E : AB 00		  adda	$00,x
FA90 : 27 02		  beq	LFA94     ;branch =0 PRM75
FA92 : 25 05		  bcs	LFA99     ;branch if Carry set PRM76
;PRM75
FA94 : 5D		      tstb
FA95 : 27 08		  beq	LFA9F     ;branch =0 PRM77
FA97 : 20 0F		  bra	LFAA8     ;branch always PRM78
;PRM76
FA99 : 5D		      tstb
FA9A : 26 03		  bne	LFA9F     ;branch !=0 PRM77
FA9C : DF 1C		  stx	X001C
FA9E : 5C		      incb
;PRM77
FA9F : 08		      inx
FAA0 : 9C 1E		  cpx	X001E
FAA2 : 26 DD		  bne	LFA81     ;branch !=0 LOOP12
FAA4 : 5D		      tstb
FAA5 : 26 01		  bne	LFAA8     ;branch !=0 PRM78
FAA7 : 39		      rts           ;return subroutine
;PRM78
FAA8 : DF 1E		  stx	X001E
FAAA : 96 16		  ldaa	X0016
FAAC : 27 06		  beq	LFAB4     ;branch =0 PRM79
FAAE : 8D 08		  bsr	LFAB8     ;branch sub PRM7B
FAB0 : 96 1B		  ldaa	X001B
FAB2 : 8D 16		  bsr	LFACA     ;branch sub PRM7C
;PRM79
FAB4 : 7E FA 27		jmp	LFA27     ;jump SYN31
;PRM7A
FAB7 : 39		      rts           ;return subroutine
;PRM7B
FAB8 : CE 00 25		ldx	#$0025
FABB : DF 10		  stx	X0010
FABD : DE 19		  ldx	X0019
FABF : E6 00		  ldab	$00,x
FAC1 : 08		      inx
FAC2 : BD F9 52		jsr	LF952     ;jump sub UTIL1
FAC5 : DE 10		  ldx	X0010
FAC7 : DF 20		  stx	X0020
FAC9 : 39		      rts           ;return subroutine
;PRM7C
FACA : 4D		      tsta
FACB : 27 2B		  beq	LFAF8     ;branch =0 PRM7D
FACD : DE 19		  ldx	X0019
FACF : DF 0E		  stx	X000E
FAD1 : CE 00 25		ldx	#$0025
FAD4 : 97 13		  staa	X0013
;LOOP13
FAD6 : DF 10		  stx	X0010
FAD8 : DE 0E		  ldx	X000E
FADA : D6 13		  ldab	X0013
FADC : D7 12		  stab	X0012
FADE : E6 01		  ldab	$01,x
FAE0 : 54		      lsrb
FAE1 : 54		      lsrb
FAE2 : 54		      lsrb
FAE3 : 54		      lsrb
FAE4 : 08		      inx
FAE5 : DF 0E		  stx	X000E
FAE7 : DE 10		  ldx	X0010
FAE9 : A6 00		  ldaa	$00,x
;LOOP14
FAEB : 10		      sba
FAEC : 7A 00 12		dec	X0012
FAEF : 26 FA		  bne	LFAEB     ;branch !=0 LOOP14
FAF1 : A7 00		  staa	$00,x
FAF3 : 08		      inx
FAF4 : 9C 20		  cpx	X0020
FAF6 : 26 DE		  bne	LFAD6     ;branch !=0 LOOP13
;PRM7D
FAF8 : 39		      rts           ;return subroutine
;*************************************;
; CALCOS
;*************************************;
FAF9 : DF 0E		  stx	X000E
FAFB : 9B 0F		  adda	X000F
FAFD : 97 0F		  staa	X000F
FAFF : 96 0E		  ldaa	X000E
FB01 : 89 00		  adca	#$00
FB03 : 97 0E		  staa	X000E
FB05 : DE 0E		  ldx	X000E
FB07 : 39		      rts           ;return subroutine
;*************************************;
;SYNTH7
;*************************************;
FB08 : CE 00 E0		ldx	#$00E0
;LOOP15
FB0B : 86 20		  ldaa	#$20
FB0D : 8D EA		  bsr	LFAF9     ;branch sub CALCOS
;LOOP16
FB0F : 09		      dex
FB10 : 26 FD		  bne	LFB0F     ;branch !=0 LOOP16
FB12 : 7F 04 00		clr	X0400     ;clr (00) DAC output SOUND
;LOOP17
FB15 : 5A		      decb
FB16 : 26 FD		  bne	LFB15     ;branch !=0 LOOP17
FB18 : 73 04 00		com	X0400     ;complements 1s DAC output SOUND
FB1B : DE 0E		  ldx	X000E
FB1D : 8C 10 00		cpx	#$1000
FB20 : 26 E9		  bne	LFB0B     ;branch !=0 LOOP15
FB22 : 39		      rts           ;return subroutine
;*************************************;
;SYNTH4
;*************************************;
FB23 : 86 01		  ldaa	#$01
FB25 : 97 16		  staa	X0016
FB27 : C6 03		  ldab	#$03
FB29 : 97 15		  staa	X0015
FB2B : 86 FF		  ldaa	#$FF
FB2D : B7 04 00		staa	X0400   ;DAC output SOUND
FB30 : D7 14		  stab	X0014
;LOOP18
FB32 : D6 14		  ldab	X0014
;LOOP19
FB34 : 96 01		  ldaa	X0001
FB36 : 44		      lsra
FB37 : 44		      lsra
FB38 : 44		      lsra
FB39 : 98 01		  eora	X0001   ;exclusive OR A
FB3B : 44		      lsra
FB3C : 76 00 00		ror	X0000
FB3F : 76 00 01		ror	X0001
FB42 : 24 03		  bcc	LFB47     ;branch Carry clear SYN41
FB44 : 73 04 00		com	X0400     ;complements 1s DAC output SOUND
;SYN41
FB47 : 96 15		  ldaa	X0015
;LOOP20
FB49 : 4A		      deca
FB4A : 26 FD		  bne	LFB49     ;branch !=0 LOOP20
FB4C : 5A		      decb
FB4D : 26 E5		  bne	LFB34     ;branch !=0 LOOP19
FB4F : 96 15		  ldaa	X0015
FB51 : 9B 16		  adda	X0016
FB53 : 97 15		  staa	X0015
FB55 : 26 DB		  bne	LFB32     ;branch !=0 LOOP18
;synth4 can PC down to synth6 from here at FB55=0 ...
;SYN42
FB57 : 01		      nop
FB58 : 01		      nop
FB59 : 01		      nop
FB5A : 40		      nega          ;negate A
FB5B : 10		      sba           ;A=A-B
FB5C : 00		                    ;db 00 (illegal)
;*************************************;
;SYNTH6 called from VWTAB, PARAM11
;*************************************;
FB5D : CE FB 57		ldx	#$FB57    ;load IX with SYN42 (01 01)
FB60 : A6 00		  ldaa	$00,x
FB62 : 97 1B		  staa	X001B
FB64 : A6 01		  ldaa	$01,x
FB66 : 97 17		  staa	X0017
FB68 : A6 02		  ldaa	$02,x
FB6A : E6 03		  ldab	$03,x
FB6C : EE 04		  ldx	$04,x
FB6E : 97 1A		  staa	X001A
FB70 : D7 14		  stab	X0014
FB72 : DF 18		  stx	X0018
FB74 : 7F 00 16		clr	X0016
;SYN61
FB77 : DE 18		  ldx	X0018
FB79 : B6 04 00		ldaa	X0400   ;load A with DAC 0400
;SYN62
FB7C : 16		      tab
FB7D : 54		      lsrb
FB7E : 54		      lsrb
FB7F : 54		      lsrb
FB80 : D8 01		  eorb	X0001
FB82 : 54		      lsrb
FB83 : 76 00 00		ror	X0000
FB86 : 76 00 01		ror	X0001
FB89 : D6 14		  ldab	X0014
FB8B : 7D 00 1B		tst	X001B
FB8E : 27 04		  beq	LFB94     ;branch =0 SYN63
FB90 : D4 00		  andb	X0000
FB92 : DB 17		  addb	X0017
;SYN63
FB94 : D7 15		  stab	X0015
FB96 : D6 16		  ldab	X0016
FB98 : 91 01		  cmpa	X0001
FB9A : 22 12		  bhi	LFBAE     ;branch higher SYNTH5
;LOOP21
FB9C : 09		      dex
FB9D : 27 26		  beq	LFBC5     ;branch =0 SYN52
FB9F : B7 04 00		staa	X0400   ;DAC output SOUND
FBA2 : DB 16		  addb	X0016
FBA4 : 99 15		  adca	X0015
FBA6 : 25 16		  bcs	LFBBE     ;branch Carry set SYN51
FBA8 : 91 01		  cmpa	X0001
FBAA : 23 F0		  bls	LFB9C     ;branch <= LOOP21
FBAC : 20 10		  bra	LFBBE     ;branch always SYN51
;*************************************;
;SYNTH5 (prob continuation of SYNTH6, an extention of SYNTH4)
;*************************************;
FBAE : 09		      dex
FBAF : 27 14		  beq	LFBC5     ;branch =0 SYN52
FBB1 : B7 04 00		staa	X0400   ;DAC output SOUND
FBB4 : D0 16		  subb	X0016
FBB6 : 92 15		  sbca	X0015
FBB8 : 25 04		  bcs	LFBBE     ;branch Carry set SYN51
FBBA : 91 01		  cmpa	X0001
FBBC : 22 F0		  bhi	LFBAE     ;branch higher SYNTH5
;SYN51
FBBE : 96 01		  ldaa	X0001
FBC0 : B7 04 00		staa	X0400   ;DAC output SOUND
FBC3 : 20 B7		  bra	LFB7C     ;branch always SYN62
;SYN52
FBC5 : D6 1A		  ldab	X001A
FBC7 : 27 B3		  beq	LFB7C     ;branch =0 SYN62
FBC9 : 96 14		  ldaa	X0014
FBCB : D6 16		  ldab	X0016
FBCD : 44		      lsra
FBCE : 56		      rorb
FBCF : 44		      lsra
FBD0 : 56		      rorb
FBD1 : 44		      lsra
FBD2 : 56		      rorb
FBD3 : 43		      coma
FBD4 : 50		      negb
FBD5 : 82 FF		  sbca	#$FF
FBD7 : DB 16		  addb	X0016
FBD9 : 99 14		  adca	X0014
FBDB : D7 16		  stab	X0016
FBDD : 97 14		  staa	X0014
FBDF : 26 96		  bne	LFB77     ;branch !=0 SYN61
FBE1 : C1 07		  cmpb	#$07
FBE3 : 26 92		  bne	LFB77     ;branch !=0 SYN61
FBE5 : 39		      rts           ;return subroutine
;*************************************;
;PARAM8 called from VWTAB
;*************************************;
FBE6 : CE 3D 09		ldx	#$3D09
;LOOP22
FBE9 : 09		      dex
FBEA : 26 FD		  bne	LFBE9     ;branch !=0 LOOP22
FBEC : 86 16		  ldaa	#$16
FBEE : 8D 18		  bsr	LFC08     ;branch sub PRM91
FBF0 : 86 0D		  ldaa	#$0D
FBF2 : 97 14		  staa	X0014
FBF4 : 86 01		  ldaa	#$01
FBF6 : 97 16		  staa	X0016
FBF8 : 7F 00 17		clr	X0017
FBFB : 7E FA 27		jmp	LFA27     ;jump SYN31
;*************************************;
;PARAM9 called from VWTAB
;*************************************;
FBFE : 86 11		  ldaa	#$11
FC00 : 8D 06		  bsr	LFC08     ;branch sub PRM91
FC02 : 86 11		  ldaa	#$11
FC04 : 8D 02		  bsr	LFC08     ;branch sub PRM91
FC06 : 86 12		  ldaa	#$12
;PRM91
FC08 : BD F9 B9		jsr	LF9B9     ;jump sub PARAM6
FC0B : 7E FA 23		jmp	LFA23     ;jump SYNTH3
;*************************************;
;PARAM10 called from VWTAB
;*************************************;
FC0E : 86 03		  ldaa	#$03
FC10 : BD F9 B9		jsr	LF9B9     ;jump sub PARAM6
FC13 : 96 0A		  ldaa	X000A
FC15 : 8B 02		  adda	#$02
FC17 : 2A 02		  bpl	LFC1B     ;branch if plus PRM101
FC19 : 86 40		  ldaa	#$40
;PRM101:
FC1B : 97 0A		  staa	X000A
FC1D : 40		      nega
FC1E : 80 10		  suba	#$10
FC20 : 7E FA 7C		jmp	LFA7C     ;jump PRM72
;*************************************;
;PARAM11 called from VWTAB
;*************************************;
FC23 : 86 1F		  ldaa	#$1F
FC25 : 97 03		  staa	X0003
FC27 : 7E FB 5D		jmp	LFB5D     ;jump SYNTH6
;*************************************;
; wavetables (x44)
;*************************************;
;LFC6C IX called from F881 IRQ6
FC2A : 00	07
FC2C : 8A 88
FC2E : 84 03
FC30 : 8D 80
FC32 : 9D	
FC33 : 9E 08
FC35 : 8E 85 81	
FC38 : 82 06	
FC3A : 80 90
FC3C : 98 9B
FC3E : 0A	
FC3F : 40
FC40 : 43
FC41 : 09
FC42 : 01
FC43 : 02 8F 41 42
FC47 : 05	
FC48 : 97 00
FC4A : 80 8C
FC4C : 9A 89
FC4E : 04	
FC4F : 8D 9C
FC51 : 8B 99
FC53 : 08
FC54 : 8E 85 
;*************************************;
; VWTABs
;*************************************;
FC56 : FB	08                    ;SYNTH7
FC58 : F8 01                    ;RESET
FC5A : F9 66                    ;PARAM2
FC5C : F9 74                    ;PARAM3
FC5E : F9 82                    ;PARAM4
FC60 : FB E6                    ;PARAM8
FC62 : FB FE                    ;PARAM9
FC64 : FC 0E                    ;PARAM10
FC66 : FB 23                    ;SYNTH4
FC68 : FB 5D                    ;SYNTH6
FC6A : FC	23                    ;PARAM11
;*************************************;
; VARI VECTORS square wave pulse width modulator
; form constant byte, pseudo-op, single byte or word into object
;*************************************;
;LFC6C IX called from PARAM1
FC6C : 40 01 00	10 E1 00 80 FF FF     ;SAW
FC75 : 00 FF 08 FF 68 04 80 00 FF     ;CSCALE
FC7E : 28 81 00 FC 01 02 00 FC FF     ;QUASAR
FC87 : 05 FF C0 FF 00 06 B0 00 FF     ; 
;LFC90 IX called from PARAM6
FC90 : 08 7F D9 FF D9 7F 24 00 24     ;
FC99 : 0A D9 D9 D9 25 25 FF FF FF     ;
FCA2 : 00 00
FCA4 : 08
FCA5 : 00
FCA6 : 40
FCA7 : 80 00
FCA9 : FF 00 80
FCAC : 40
FCAD : 10
FCAE : 7F B0 D9
FCB1 : F5 FF F5
FCB4 : D9 B0
FCB6 : 7F 4E 24
FCB9 : 09
FCBA : 00
FCBB : 09
FCBC : 24 4E
FCBE : 3C CC
FCC0 : E8 F9
FCC2 : FF F9 E8
FCC5 : CF
FCC6 : B4 9A 84
FCC9 : 77 73 77
FCCC : 83 93 A3
FCCF : AF B5
FCD1 : B3
FCD2 : AA 9B
FCD4 : 88 76
FCD6 : 67 61
FCD8 : 63 6E
FCDA : 81 9A
FCDC : B4 CC DC
FCDF : E2 DC
FCE1 : CB AF
FCE3 : 8D 69
FCE5 : 46	

FCE6 : 29 15
FCE8 : 0C
FCE9 : 0C
FCEA : 15
FCEB : 23 32
FCED : 3F	
FCEE : 47
FCEF : 48
FCF0 : 43	
FCF1 : 39
FCF2 : 2D 22
FCF4 : 1C 1E
FCF6 : 2A 3F
FCF8 : 5F
FCF9 : 83
FCFA : A8 24
FCFC : 7F BA E6
FCFF : FC
FD00 : F6 D7 AA
FD03 : 7B
FD04 : 59
FD05 : 4C	
FD06 : 59
FD07 : 7B
FD08 : AA D7
FD0A : F6 FC E6	
FD0D : BA 7F 43
FD10 : 17
FD11 : 01
FD12 : 07
FD13 : 26 53
FD15 : 82 A4
FD17 : B1 A4 82
FD1A : 53	
FD1B : 26 07
FD1D : 01
FD1E : 17
FD1F : 43
FD20 : 06
FD21 : 7F FF FF
FD24 : AA 55
FD26 : 00
FD27 : 10
;
FD28 : FF FF FF	
FD2B : FF 00 00
FD2E : 00 00
FD30 : FF FF FF
FD33 : FF 00 00	
FD36 : 00 00
;
FD38 : 10
FD39 : 00
FD3A : F4 00 E8
FD3D : 00 DC 00
FD40 : E2 00
FD42 : DC 00
FD44 : E8 00	
FD46 : F4 00 00
FD49 : 48
FD4A : 8A 95
FD4C : A0 AB
FD4E : B5 BF C8
FD51 : D1 DA
FD53 : E1 E8
FD55 : EE F3
FD57 : F7 FB FD
FD5A : FE FF FE
FD5D : FD	
FD5E : FB F7 F3
FD61 : EE E8
FD63 : E1 DA
FD65 : D1 C8
FD67 : BF B5 AB	
FD6A : A0 95
FD6C : 8A 7F
FD6E : 75
FD6F : 6A 5F
FD71 : 54
FD72 : 4A	
FD73 : 40
FD74 : 37
FD75 : 2E 25
FD77 : 1E
FD78 : 17
FD79 : 11	
FD7A : 0C
FD7B : 08	
FD7C : 04 02
FD7E : 01
FD7F : 00	
FD80 : 01
FD81 : 02 04
FD83 : 08
FD84 : 0C	
FD85 : 11
FD86 : 17	
FD87 : 1E
FD88 : 25 2E
FD8A : 37
FD8B : 40
FD8C : 4A
FD8D : 54
FD8E : 5F
FD8F : 6A 75
FD91 : 7F 13 8A
FD94 : AB D1
FD96 : EE FD
FD98 : FD	
FD99 : EE D1
FD9B : AB 7F
FD9D : 54
FD9E : 2E 11
FDA0 : 02 02
FDA2 : 11	
FDA3 : 2E 54
FDA5 : 7F 0B 00
FDA8 : FF 00 FF	
FDAB : 00	
FDAC : 2B 55
FDAE : 80 AA
FDB0 : D5 FF
FDB2 : 0A	
FDB3 : 00
FDB4 : 64 96
FDB6 : C8 00
FDB8 : 32
FDB9 : 64 C8
FDBB : FA 00 00
FDBE : 05	
FDBF : 7F FF CE	
FDC2 : 30
FDC3 : 01	
FDC4 : 0F
FDC5 : 7F FF EA
FDC8 : D5 C0
FDCA : AB 96
FDCC : 81 6C
FDCE : 57	
FDCF : 42
FDD0 : 2D 18
FDD2 : 03	
FDD3 : 7F 
;LFDD4 called for IX from PARAM6
FDD4 : 81 27 00 00 
FDD8 : 00 00 16 3C 
;
FDDC : 15 12 00	"<   "		db	$3C, $15, $12, $00
FDDF : 00 00 00		"   "		db	$00, $00, $00
				;
FDE2 : 16		" "		tab
				;
FDE3 : 3C 21		"<!"		db	$3C, $21
				;
FDE5 : 88 00		"  "		eora	#$00
				;
FDE7 : 00 00 00		"   "		db	$00, $00, $00
				;
FDEA				LFDEA:
FDEA : 16		" "		tab
				;
FDEB : 3C		"<"		db	$3C
				;
FDEC : C8 1E		"  "		eorb	#$1E
				;
FDEE : 00		" "		db	$00
				;
FDEF : FF 01 00		"   "		stx	X0100
FDF2 : 16		" "		tab
				;
FDF3 : 3C 38		"<8"		db	$3C, $38
				;
FDF5 : 6E 00		"n "		jmp	$00,x						;INFO: index jump
				;
FDF7 : FF 01 B9		"   "		stx	X01B9
FDFA : 16		" "		tab
				;
FDFB : 3C		"<"		db	$3C
				;
FDFC : 91 24		" $"		cmpa	X0024
				;
FDFE : 00 00 05 00	"    "		db	$00, $00, $05, $00
				;
FE02 : 0F		" "		sei
				;
FE03				LFE03:
FE03 : 52		"R"		db	$52
				;
FE04 : 11		" "		cba
FE05 : 0A		" "		clv
				;
FE06 : 04		" "		db	$04
				;
FE07				LFE07:
FE07 : FF 23 00		" # "		stx	X2300
FE0A : 01		" "		nop
				;
FE0B : 00		" "		db	$00
				;
FE0C : 28 19		"( "		bvc	LFE27
				;
FE0E : 00		" "		db	$00
				;
FE0F : 01		" "		nop
				;
FE10 : 02 00		"  "		db	$02, $00
				;
FE12 : 01		" "		nop
FE13 : 2E 11		". "		bgt	LFE26
FE15 : 09		" "		dex
FE16				XFE16:
FE16 : 11		" "		cba
FE17 : 01		" "		nop
FE18 : 0F		" "		sei
				;
FE19 : 00		" "		db	$00
				;
FE1A : 01		" "		nop
FE1B : 2E 61		".a"		bgt	LFE7E
FE1D : 35		"5"		txs
				;
FE1E : 00 00		"  "		db	$00, $00
				;
FE20 : 20 00		"  "		bra	LFE22
				;
FE22				LFE22:
FE22 : 27 64		"'d"		beq	LFE88
FE24 : 92 2B		" +"		sbca	X002B
				;
FE26				LFE26:
FE26 : 00 00 00 00	"    "		db	$00, $00, $00, $00
				;
FE2A : 27 64		"'d"		beq	LFE90
FE2C : 84 24		" $"		anda	#$24
				;
FE2E : 00 00 03 00	"    "		db	$00, $00, $03, $00
				;
FE32 : 0D		" "		sec
				;
FE33 : 21		"!"		db	$21
				;
FE34 : E2 14		"  "		sbcb	$14,x
				;
FE36				LFE36:
FE36 : 00 00 00 00	"    "		db	$00, $00, $00, $00
				;
FE3A : 0D		" "		sec
				;
FE3B : 21		"!"		db	$21
				;
FE3C : F1 18 00		"   "		cmpb	X1800
				;
FE3F : 00 00 00		"   "		db	$00, $00, $00
				;
FE42 : 0E		" "		cli
FE43 : 2E F1		". "		bgt	LFE36
FE45 : 17		" "		tba
				;
FE46 : 00 00		"  "		db	$00, $00
				;
FE48 : 06		" "		tap
				;
FE49 : 00		" "		db	$00
				;
FE4A : 0E		" "		cli
FE4B : 2E 93		". "		bgt	LFDE0
				;
FE4D : 21 00 00		"!  "		db	$21, $00, $00
				;
FE50 : 50		"P"		negb
				;
FE51 : 00		" "		db	$00
				;
FE52 : 0E		" "		cli
				;
FE53 : 13 15		"  "		db	$13, $15
				;
FE55 : 10		" "		sba
				;
FE56 : 00		" "		db	$00
				;
FE57 : 0C		" "		clc
FE58 : 01		" "		nop
				;
FE59 : 00		" "		db	$00
				;
FE5A : 0E		" "		cli
				;
FE5B : 13		" "		db	$13
				;
FE5C : 31		"1"		ins
				;
FE5D : 03 00 03		"   "		db	$03, $00, $03
				;
FE60 : 06		" "		tap
				;
FE61 : 00 03 61		"  a"		db	$00, $03, $61
				;
FE64 : 31		"1"		ins
				;
FE65 : 03 00 03		"   "		db	$03, $00, $03
				;
FE68 : 0A		" "		clv
				;
FE69 : 00 03 61		"  a"		db	$00, $03, $61
				;
FE6C : 26 0F		"& "		bne	LFE7D
				;
FE6E : 87		" "		db	$87
				;
FE6F : 06		" "		tap
FE70 : 20 00		"  "		bra	LFE72
				;
FE72				LFE72:
FE72 : 03 61 12		" a "		db	$03, $61, $12
				;
FE75 : 08		" "		inx
				;
FE76 : 00		" "		db	$00
				;
FE77 : FF 00 00		"   "		stx	X0000
FE7A : 20 8B		"  "		bra	LFE07
				;
FE7C : 92 2E		" ."		sbca	X002E
				;
FE7E				LFE7E:
FE7E : 00		" "		db	$00
				;
FE7F : FF 01 00		"   "		stx	X0100
FE82 : 10		" "		sba
FE83 : EE 22		" ""		ldx	$22,x
FE85 : 23 00		"# "		bls	LFE87
				;
FE87				LFE87:
FE87 : 02		" "		db	$02
				;
FE88				LFE88:
FE88 : 2F 00		"/ "		ble	LFE8A
FE8A				LFE8A:
FE8A : 10		" "		sba
FE8B : AB 12		"  "		adda	$12,x
				;
FE8D : 05 00 00 00	"    "		db	$05, $00, $00, $00
FE91 : 00		" "		db	$00
				;
FE92 : 23 CB		"# "		bls	LFE5F
				;
FE94 : 12		" "		db	$12
				;
FE95 : 0C		" "		clc
				;
FE96 : 00		" "		db	$00
				;
FE97 : FF 30 00		" 0 "		stx	X3000
FE9A : 09		" "		dex
FE9B : 0A		" "		clv
FE9C : 86 2E		" ."		ldaa	#$2E
				;
FE9E : 00 00 00 00	"    "		db	$00, $00, $00, $00
				;
FEA2 : 10		" "		sba
FEA3 : BB 12 0A		"   "		adda	X120A
				;
FEA6 : 00		" "		db	$00
				;
FEA7 : 01		" "		nop
FEA8 : 0C		" "		clc
				;
FEA9 : 00		" "		db	$00
				;
FEAA : 10		" "		sba
FEAB : BB 42 2C		" B,"		adda	X422C
				;
FEAE : 00 00 00 00	"    "		db	$00, $00, $00, $00
				;
FEB2 : 10		" "		sba
FEB3 : BB 35 7C		" 5|"		adda	X357C
				;
FEB6 : 00		" "		db	$00
				;
FEB7 : FF 01 00		"   "		stx	X0100
FEBA : 10		" "		sba
FEBB : BB FE 16		"   "		adda	XFE16
				;
FEBE : 00 00 00 00	"    "		db	$00, $00, $00, $00
				;
FEC2 : 0A		" "		clv
				;
FEC3 : 00		" "		db	$00
				;
FEC4 : 95 2C		" ,"		bita	X002C
				;
FEC6 : 00 00 00 00	"    "		db	$00, $00, $00, $00
				;
FECA : 0A		" "		clv
				;
FECB : 00		" "		db	$00
;wavetable IX called from PARAM6
FECC : 40 08 40	08
FED0 : 40 01 02 04
;wavetable IX called from PARAM6
FED4 : 08 09 80 7C
FED8 : 78 74 70 74 
;
FEDC : 78 7C
FEDE : 80 01
FEE0 : 01

FEE1 : 02 02 04 04
FEE5 : 08
FEE6 : 08	
FEE7 : 10	
FEE8 : 10
FEE9 : 30
FEEA : 60 C0
FEEC : E0 01
FEEE : 01
FEEF : 02 02 03 04
FEF3 : 05
FEF4 : 06
FEF5 : 07
FEF6 : 08
FEF7 : 09
FEF8 : 0A
FEF9 : 0C
FEFA : 08
FEFB : 80 10
FEFD : 78 18 70
FF00 : 20 60
FF02 : 28 58
FF04 : 30
FF05 : 50
FF06 : 40	
FF07 : 48
FF08 : 01
FF09 : 01
FF0A : 02 02 04 04
FF0E : 08
FF0F : 08	
FF10 : 10

FF11 : 20 28
FF13 : 30 38
FF15 : 40	48
FF17 : 50 60 
FF19 : 70 80 
FF1B : A0 B0 
FF1D : C0 01
FF1F : 02 04
				;
FF21 : 08		" "		inx
FF22 : 09		" "		dex
FF23 : 0A		" "		clv
FF24 : 0B		" "		sev
FF25 : 0C		" "		clc
FF26 : 0E		" "		cli
FF27 : 0F		" "		sei
FF28 : 10		" "		sba
				;
FF29 : 12 14		"  "		db	$12, $14
				;
FF2B : 16		" "		tab
FF2C : 40		"@"		nega
FF2D : 10		" "		sba
FF2E : 08		" "		inx
FF2F : 01		" "		nop
FF30 : 01		" "		nop
FF31 : 01		" "		nop
FF32 : 01		" "		nop
FF33 : 01		" "		nop
				;
FF34 : 02 02 03 03	"    "		db	$02, $02, $03, $03
FF38 : 04 04 05		"   "		db	$04, $04, $05
				;
FF3B				LFF3B:
FF3B : 06		" "		tap
FF3C : 08		" "		inx
FF3D : 0A		" "		clv
FF3E : 0C		" "		clc
FF3F : 10		" "		sba
				;
FF40 : 14 18		"  "		db	$14, $18
				;
FF42 : 20 30		" 0"		bra	LFF74
				;
FF44 : 40		"@"		nega
FF45 : 50		"P"		negb
FF46 : 40		"@"		nega
FF47 : 30		"0"		tsx
FF48 : 20 10		"  "		bra	LFF5A
				;
FF4A : 0C		" "		clc
FF4B : 0A		" "		clv
FF4C : 08		" "		inx
FF4D : 07		" "		tpa
FF4E : 06		" "		tap
				;
FF4F : 05 04 03 02	"    "		db	$05, $04, $03, $02
FF53 : 02		" "		db	$02
				;
FF54 : 01		" "		nop
FF55 : 01		" "		nop
FF56 : 01		" "		nop
FF57 : 06		" "		tap
FF58 : 06		" "		tap
FF59 : 06		" "		tap
FF5A				LFF5A:
FF5A : 06		" "		tap
FF5B : 07		" "		tpa
FF5C				LFF5C:
FF5C : 07		" "		tpa
FF5D : 08		" "		inx
FF5E : 08		" "		inx
FF5F : 09		" "		dex
FF60 : 09		" "		dex
FF61 : 0A		" "		clv
FF62				LFF62:
FF62 : 0B		" "		sev
FF63 : 0D		" "		sec
FF64 : 0F		" "		sei
FF65 : 11		" "		cba
				;
FF66 : 15		" "		db	$15
				;
FF67 : 17		" "		tba
				;
FF68 : 1D		" "		db	$1D
				;
FF69 : 25 35		"%5"		bcs	LFFA0
				;
FF6B : 45 55 65 75	"EUeu"		db	$45, $55, $65, $75
				;
FF6F : 85 95		"  "		bita	#$95
FF71 : A5 B5		"  "		bita	$B5,x
FF73 : C5 D5		"  "		bitb	#$D5
FF75 : E5 F5		"  "		bitb	$F5,x
				;
FF77 : 1A		" "		db	$1A
				;
FF78 : 32		"2"		pula
				;
FF79 : 1A		" "		db	$1A
				;
FF7A : 11		" "		cba
				;
FF7B : 1A		" "		db	$1A
				;
FF7C : 1B		" "		aba
				;
FF7D : 1C		" "		db	$1C
				;
FF7E : 1B		" "		aba
				;
FF7F : 1A		" "		db	$1A
				;
FF80 : 19		" "		daa
FF81 : 11		" "		cba
FF82 : 19		" "		daa
				;
FF83 : 1A 1E		"  "		db	$1A, $1E
				;
FF85 : 26 30		"&0"		bne	LFFB7
FF87 : 01		" "		nop
				;
FF88 : 18 02		"  "		db	$18, $02
				;
FF8A : 20 03		"  "		bra	LFF8F
				;
FF8C : 28 04		"( "		bvc	LFF92
FF8E : 30		"0"		tsx

FF8F : 05 38

FF91 : 06

FF92 : 40
FF93 : 07
FF94 : 48
FF95 : 08
FF96 : 78 01 01
FF99 : 11
FF9A : 11
FF9B : 11
FF9C : 11

FF9D : 12 12 13 13
FFA1 : 14 14 15	

FFA4 : 16

FFA5 : 18 1A 1C

FFA8 : 20 24
FFAA : 28 30
FFAC : 40
FFAD : 50
FFAE : 60 50
FFB0 : 40	
FFB1 : 30
FFB2 : 20 1C

FFB4 : 1A 18
FFB6 : 17	
FFB7 : 16
FFB8 : 15 14
FFBA : A0 C0

FFBC : A0 C0
FFBE : A0 C0

FFC0 : A0 C0
FFC2 : C0 C0

FFC4 : C0 C0
FFC6 : FF C0 

FFC8 : FF FF 
FFCA : 00 00

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
FFF4 : 00 00 00	00

;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F8 4E	                ;IRQ	
FFFB : F8	01                  ;RESET (software)
FFFC : F8 2C                  ;NMI
FFFE : F8 01                  ;RESET (hardware)

;--------------------------------------------------------------
