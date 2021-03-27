							;
              ; updated 28/03/2021
              ;
							;	Disassembled by:
							;		DASMx object code disassembler
							;		(c) Copyright 1996-2003   Conquest Consultants
							;		Version 1.40 (Oct 18 2003)
							;
							;	File:		SOUND12.716
							;
							;	Size:		2048 bytes
							;	Checksum:	AF3F
							;	CRC-32:		CABAEC58
							;
							;	Date:		Tue Sep 17 17:59:50 2019
							;
							;	CPU:		Motorola 6802 (6800/6802/6808 family)
							;
              ; pinball Sound ROM 1 part no:5A-9198
              ; for games: Flash[Sys 4][1979], Time Warp[Sys 6][1979], Stellar Wars[Sys 4][1979], 
              ;            Scorpion[Sys 6][1980], Tri Zone[Sys 6][1979] 
							;
							;
org	$F800
							;
F800 : 78                       ;hmmm
;*************************************;
;RESET power on
;*************************************;
F801 : 0F         sei           ;set interrupt mask   
F802 : 8E	00 7F   lds	#$007F    ;load stack pointer with 007Fh 
F805 : CE 04 00   ldx	#$0400    ;load X with 0400h (PIA addr)
F808 : 6F 01      clr	$01,x     ;clear addr X + 01h (0401 PIA1 CR port A)
F80A : 6F 03			clr	$03,x     ;clear addr X + 03h (0403 PIA1 CR port B)
F80C : 86 FF			ldaa	#$FF    ;load A with value FFh
F80E : A7 00			staa	$00,x   ;store A in addr X + 00h (0400 PIA1 PR/DDR port A out)
F810 : 6F 02			clr	$02,x     ;clear addr X + 02h (0402 PIA1 PR/DDR port B in)
F812 : 86 37			ldaa	#$37    ;load A with value 37h
F814 : A7 03			staa	$03,x   ;store A ijn addr X + 03h (0403 PIA1 CR port B)
F816 : 86 3C			ldaa	#$3C    ;load A with value 3Ch
F818 : A7 01			staa	$01,x   ;store A in addr X + 01h (0401 PIA1 CR port A)
F81A : 97 05			staa	$05     ;store A in addr 05
F81C : 4F				  clra          ;clear (00) A
F81D : 97 03			staa	$03     ;store A in addr 03
F81F : 97 00			staa	$00     ;store A in addr 00
F821 : 97 01			staa	$01     ;store A in addr 01
F823 : 97 02			staa	$02     ;store A in addr 02
F825 : 97 04			staa	$04     ;store A in addr 04
F827 : 0E				  cli           ;clear interrupt
;LF828:
F828 : 20 FE			bra	LF828     ;branch always here
;*************************************;
;PARAM1
;*************************************;
F82A : 16				  tab           ;transfer A to B
F82B : 48				  asla          ;arith shift left A (bit0 is 0)          
F82C : 48				  asla          ;arith shift left A (bit0 is 0)
F82D : 48				  asla          ;arith shift left A (bit0 is 0)
F82E : 1B				  aba           ;A = A + B
F82F : CE 00 0F   ldx	#$000F    ;load X with value 000Fh
F832 : DF 0B			stx	$0B       ;store X in addr 0B
F834 : CE FD 60   ldx	#$FD60    ;load X with value FD60h (VVECT SAW)
F837 : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
F83A : C6 09			ldab	#$09    ;load B with value 09h
F83C : 7E FA E0   jmp	LFAE0     ;jump UTIL1 
;*************************************;
;SYNTH1
;*************************************;
F83F : 96 17		  ldaa	$17     ;load A with value in addr 17
F841 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
;SYN11 LF844:
F844 : 96 0F		  ldaa	$0F     ;load A with value in addr 0F
F846 : 97 18		  staa	$18     ;store A in addr 18
F848 : 96 10		  ldaa	$10     ;load A with value in addr 10
F84A : 97 19		  staa	$19     ;store A in addr 19
;SYN12 LF84C:
F84C : DE 14		  ldx	$14       ;load X with value in addr 14
;SYN13 LF84E:
F84E : 96 18		  ldaa	$18     ;load A with value in addr 18
F850 : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
;SYN14 LF853:
F853 : 09				  dex           ;decr X
F854 : 27 10		  beq	LF866     ;branch if Z=1 SYN16
F856 : 4A				  deca          ;decr A
F857 : 26 FA		  bne	LF853     ;branch if Z=0 SYN14
F859 : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
F85C : 96 19		  ldaa	$19     ;load A with value in addr 19
;SYN15 LF85E:
F85E : 09				  dex           ;decr X
F85F : 27 05		  beq	LF866     ;branch if Z=1 SYN16
F861 : 4A				  deca          ;decr A
F862 : 26 FA		  bne	LF85E     ;branch if Z=0 SYN15
F864 : 20 E8		  bra	LF84E     ;branch always SYN13
;SYN16 LF866:
F866 : B6 04 00   ldaa	$0400   ;load A with value in addr DAC output SOUND
F869 : 2B 01		  bmi	LF86C     ;branch if N=1 SYN17
F86B : 43				  coma          ;complement 1s in A
;SYN17 LF86C:
F86C : 8B 00		  adda	#$00    ;add A with value 00h
F86E : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F871 : 96 18		  ldaa	$18     ;load A with value in addr 18
F873 : 9B 11		  adda	$11     ;add A with value in addr 11
F875 : 97 18		  staa	$18     ;store A in addr 18
F877 : 96 19		  ldaa	$19     ;load A with value in addr 19
F879 : 9B 12		  adda	$12     ;add A with value in addr 12
F87B : 97 19		  staa	$19     ;store A in addr 19
F87D : 91 13		  cmpa	$13     ;compare A with value in addr 13
F87F : 26 CB		  bne	LF84C     ;branch if Z=0 SYN12
F881 : 96 16		  ldaa	$16     ;load A with value in addr 16
F883 : 27 06		  beq	LF88B     ;branch if Z=1 SYN18
F885 : 9B 0F		  adda	$0F     ;add A with value in addr 0F
F887 : 97 0F		  staa	$0F     ;store A in addr 0F
F889 : 26 B9		  bne	LF844     ;branch if Z=0 SYN11
;SYN18 LF88B:
F88B : 39				  rts           ;return subroutine
;*************************************;
;PARAM2
;*************************************;
F88C : 86 01		  ldaa	#$01    ;load A with value 01h
F88E : 97 16		  staa	$16     ;store A in addr 16
F890 : C6 03		  ldab	#$03    ;load B with value 03h
F892 : 20 0A		  bra	LF89E     ;branch always SYN21
;*************************************;
;SYNTH2
;*************************************;
F894 : 86 FE		  ldaa	#$FE    ;load A with value FEh
F896 : 97 16		  staa	$16     ;store A in addr 16
F898 : 86 C0		  ldaa	#$C0    ;load A with value C0h
F89A : C6 10		  ldab	#$10    ;load B with value 10h
F89C : 20 00		  bra	LF89E     ;branch always SYN21
;SYN21 LF89E
F89E : 97 15		  staa	$15     ;store A in addr 15
F8A0 : 86 FF		  ldaa	#$FF    ;load A with value FFh
F8A2 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F8A5 : D7 11		  stab	$11     ;store B in addr 11
;SYN22 LF8A7:
F8A7 : D6 11		  ldab	$11     ;load B with value in addr 11
;SYN23 LF8A9:
F8A9 : 96 06		  ldaa	$06     ;load A with value in addr 06
F8AB : 44				  lsra          ;logic shift right A (bit7=0)
F8AC : 44				  lsra          ;logic shift right A (bit7=0)
F8AD : 44				  lsra          ;logic shift right A (bit7=0)
F8AE : 98 06		  eora	$06     ;exclusive OR with value in addr 06
F8B0 : 44				  lsra          ;logic shift right A (bit7=0)
F8B1 : 76 00 05   ror	$0005     ;rotate right in addr 0005 (bit7 = C then C = bit0)
F8B4 : 76 00 06   ror	$0006     ;rotate right in addr 0006 (bit7 = C then C = bit0)
F8B7 : 24 03		  bcc	LF8BC     ;branch if C=0 SYN24
F8B9 : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
;SYN24 LF8BC:
F8BC : 96 15		  ldaa	$15     ;load A in addr 15
;SYN25 LF8BE:
F8BE : 4A				  deca          ;decr A
F8BF : 26 FD		  bne	LF8BE     ;branch if Z=0 SYN25
F8C1 : 5A				  decb          ;decr B
F8C2 : 26 E5		  bne	LF8A9     ;branch if Z=0 SYN23
F8C4 : 96 15		  ldaa	$15     ;load A with value in addr 15
F8C6 : 9B 16		  adda	$16     ;add A with value in addr 16
F8C8 : 97 15		  staa	$15     ;store A in addr 15
F8CA : 26 DB		  bne	LF8A7     ;branch if Z=0 SYN22
F8CC : 39				  rts           ;return subroutine
;*************************************;
;SYNTH3
;*************************************;
F8CD : 86 20		  ldaa	#$20    ;load A with value 20h
F8CF : 97 11		  staa	$11     ;store A in addr 11
F8D1 : 97 14		  staa	$14     ;store A in addr 14
F8D3 : 86 01		  ldaa	#$01    ;load A with value 01h
F8D5 : CE 00 01   ldx	#$0001    ;load X with value 0001h
F8D8 : C6 FF		  ldab	#$FF    ;load B with value FFh
F8DA : 20 00		  bra	LF8DC     ;branch always SYN31
;SYN31 LF8DC:
F8DC : 97 0F		  staa	$0F     ;store A in addr 0F
;SYN32 LF8DE:
F8DE : DF 12		  stx	$12       ;store X in addr 12
;SYN33 LF8E0: 
F8E0 : D7 10		  stab	$10     ;store B in addr 10
F8E2 : D6 11		  ldab	$11     ;load B with value in addr 11
;SYN34 LF8E4:
F8E4 : 96 06		  ldaa	$06     ;load A with value in addr 06
F8E6 : 44				  lsra          ;logic shift right A (bit7=0)
F8E7 : 44				  lsra          ;logic shift right A (bit7=0)
F8E8 : 44				  lsra          ;logic shift right A (bit7=0)
F8E9 : 98 06		  eora	$06     ;exclusive OR with value in addr 06
F8EB : 44				  lsra          ;logic shift right A (bit7=0)
F8EC : 76 00 05   ror	$0005     ;rotate right in addr 0005 (bit7 = C then C = bit0)
F8EF : 76 00 06   ror	$0006     ;rotate right in addr 0006 (bit7 = C then C = bit0)
F8F2 : 86 00		  ldaa	#$00    ;load A with value 00h
F8F4 : 24 02		  bcc	LF8F8     ;branch if C=0 SYN35
F8F6 : 96 10		  ldaa	$10     ;load A with value in addr 10
;SYN35 LF8F8:
F8F8 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F8FB : DE 12		  ldx	$12       ;load X with value in addr 12
;SYN36 LF8FD:
F8FD : 09				  dex           ;decr X
F8FE : 26 FD		  bne	LF8FD     ;branch if Z=0 SYN36
F900 : 5A				  decb          ;decr B
F901 : 26 E1		  bne	LF8E4     ;branch if Z=0 SYN34
F903 : D6 10		  ldab	$10     ;load B with value in addr 10
F905 : D0 0F		  subb	$0F     ;B = B - value in addr 0F   
F907 : 27 09		  beq	LF912     ;branch if Z=1 SYN37
F909 : DE 12		  ldx	$12       ;load X with value in addr 12
F90B : 08				  inx           ;incr X
F90C : 96 14		  ldaa	$14     ;load A with value in addr 14
F90E : 27 D0		  beq	LF8E0     ;branch if Z=1 SYN33
F910 : 20 CC		  bra	LF8DE     ;branch always SYN32
;SYN37 LF912:
F912 : 39				  rts           ;return subroutine
;*************************************;
;PARAM3
;*************************************;
;LF913:
F913 : C6 01		  ldab	#$01    ;load B with value 01h
F915 : D7 00		  stab	$00     ;store B in addr 00
F917 : 4F				  clra          ;clear A
F918 : 97 15		  staa	$15     ;store A in addr 15
F91A : 20 14		  bra	LF930     ;branch always SYNTH4
;*************************************;
;PARAM4
;*************************************;
F91C : 4F				  clra          ;clear A
F91D : 97 15		  staa	$15     ;store A with value in addr 15
F91F : C6 03		  ldab	#$03    ;load B with value 03h
F921 : 20 0D		  bra	LF930     ;branch always SYNTH4
;*************************************;
;PARAM5
;*************************************;
F923 : 86 01		  ldaa	#$01    ;load A with value 01h
F925 : 97 15		  staa	$15     ;store A in addr 15
F927 : CE 03 E8   ldx	#$03E8    ;load X with value 03E8h (0000 0011 1110 1000)
F92A : 86 01		  ldaa	#$01    ;load A with value 01h
F92C : C6 FF		  ldab	#$FF    ;load B with value FFh
F92E : 20 00		  bra	LF930     ;branch always SYNTH4
;*************************************;
;SYNTH4
;*************************************;
F930 : 97 14		  staa	$14     ;store A in addr 14
F932 : D7 0F		  stab	$0F     ;store B in addr 0F
F934 : DF 12		  stx	$12       ;store X in addr 12
F936 : 7F 00 11   clr	$0011     ;clear addr 0011
;SYN41 LF939:
F939 : DE 12		  ldx	$12       ;load X with value in addr 12
F93B : B6 04 00   ldaa	$0400   ;load A with value in DAC sound OUTPUT
;SYN42 LF93E:
F93E : 16				  tab           ;transfer A to B
F93F : 54				  lsrb          ;logic shift right B (bit7=0)
F940 : 54				  lsrb          ;logic shift right B (bit7=0)
F941 : 54				  lsrb          ;logic shift right B (bit7=0)
F942 : D8 06		  eorb	$06     ;exclusive OR with value in addr 06
F944 : 54				  lsrb          ;logic shift right B (bit7=0)
F945 : 76 00 05   ror	$0005     ;rotate right in addr 0005 (bit7 = C then C = bit0)
F948 : 76 00 06   ror	$0006     ;rotate right in addr 0006 (bit7 = C then C = bit0)
F94B : D6 0F		  ldab	$0F     ;load B with value in addr 0F
F94D : 7D 00 15   tst	$0015     ;test if value in addr = 0 (N=0(MSB), Z=1)
F950 : 27 02		  beq	LF954     ;branch if Z=1 SYN43
F952 : D4 05		  andb	$05     ;and B with value in addr 05
;SYN43 LF954:
F954 : D7 10		  stab	$10     ;store B in addr 10
F956 : D6 11		  ldab	$11     ;load B with value in addr 11
F958 : 91 06		  cmpa	$06     ;compare A with value in addr 06
F95A : 22 12		  bhi	LF96E     ;branch if C=0 and Z=0 SYN45
;SYN44 LF95C:
F95C : 09				  dex           ;decr X
F95D : 27 26		  beq	LF985     ;branch if Z=1 SYN47
F95F : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F962 : DB 11		  addb	$11     ;add B with value in addr 11
F964 : 99 10		  adca	$10     ;A = A + C + value in addr 10
F966 : 25 16		  bcs	LF97E     ;branch if C=1 SYn46
F968 : 91 06		  cmpa	$06     ;compare A with value in addr 06
F96A : 23 F0		  bls	LF95C     ;branch if C=1 and Z=1 SYN44
F96C : 20 10		  bra	LF97E     ;branch always SYN46
;SYN45 LF96E:
F96E : 09				  dex           ;decr X
F96F : 27 14		  beq	LF985     ;branch if Z=1 SYN47
F971 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F974 : D0 11		  subb	$11     ;B = B - value in addr 11
F976 : 92 10		  sbca	$10     ;A = A - C - value in addr 10
F978 : 25 04		  bcs	LF97E     ;branch if C=1 SYN46
F97A : 91 06		  cmpa	$06     ;compare A with value in addr 06     
F97C : 22 F0		  bhi	LF96E     ;branch if C=0 and Z=0 SYN45
;SYN46 LF97E:
F97E : 96 06		  ldaa	$06     ;load A with value in addr 06
F980 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F983 : 20 B9		  bra	LF93E     ;branch always SYN42
;SYN47 LF985:
F985 : D6 14		  ldab	$14     ;load B with value in addr 14
F987 : 27 B5		  beq	LF93E     ;branch if Z=1 SYN42
F989 : 96 0F		  ldaa	$0F     ;load A with value in addr 0F
F98B : D6 11		  ldab	$11     ;load B with value in addr 11
F98D : 44				  lsra          ;logic shift right A (bit7=0)
F98E : 56				  rorb          ;rotate right B (bit7=C and C=bit0)
F98F : 44				  lsra          ;logic shift right A (bit7=0)
F990 : 56				  rorb          ;rotate right B (bit7=C and C=bit0)
F991 : 44				  lsra          ;logic shift right A (bit7=0)
F992 : 56				  rorb          ;rotate right B (bit7=C and C=bit0)
F993 : 43				  coma          ;complement 1s A
F994 : 50				  negb          ;complement 2s B
F995 : 82 FF		  sbca	#$FF    ;A = A - C - value FFh
F997 : DB 11		  addb	$11     ;add B with value in addr 11
F999 : 99 0F		  adca	$0F     ;A = A + C + value in addr 0F     
F99B : D7 11		  stab	$11     ;store B in addr 11
F99D : 97 0F		  staa	$0F     ;store A in addr 0F
F99F : 26 98		  bne	LF939     ;branch if Z=0 SYN41
F9A1 : C1 07		  cmpb	#$07    ;compare B with value 07h
F9A3 : 26 94		  bne	LF939     ;branch if Z=0 SYN41
F9A5 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH5
;*************************************;
F9A6 : 86 FD		  ldaa	#$FD    ;load A with value FDh
F9A8 : 97 0B		  staa	$0B     ;store B in addr 0B
F9AA : CE 00 64   ldx	#$0064    ;load X with value 0064h
F9AD : DF 07		  stx	$07       ;store X in addr 07
;SYN51 LF9AF:
F9AF : DB 08		  addb	$08     ;add B with value in addr 08
F9B1 : 96 0D		  ldaa	$0D     ;load A with value in addr 0D
F9B3 : 99 07		  adca	$07     ;A = A + C + value in addr 07
F9B5 : 97 0D		  staa	$0D     ;store A in addr 0D
F9B7 : DE 07		  ldx	$07       ;load X with value in addr 07
F9B9 : 25 04		  bcs	LF9BF     ;branch if C=1 SYN53
F9BB : 20 00		  bra	LF9BD     ;branch always SYN52
;SYN52 LF9BD:
F9BD : 20 03		  bra	LF9C2     ;branch always SYN54
;SYN53 LF9BF:
F9BF : 08				  inx           ;incr X
F9C0 : 27 11		  beq	LF9D3     ;branch if Z=1 SYN55
;SYN54 LF9C2:
F9C2 : DF 07		  stx	$07       ;store X in addr 07
F9C4 : 84 0F		  anda	#$0F    ;and A with value 0Fh
F9C6 : 8B 84		  adda	#$84    ;add A with value 84h
F9C8 : 97 0C		  staa	$0C     ;store A in addr 0C
F9CA : DE 0B		  ldx	$0B       ;load X with value in addr 0B
F9CC : A6 00		  ldaa	$00,x   ;load A with value in addr X + 00h
F9CE : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F9D1 : 20 DC		  bra	LF9AF     ;branch always SYN51
;SYN55 LF9D3:
F9D3 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH6
;*************************************;
F9D4 : 4F				  clra          ;clear A (00)
F9D5 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F9D8 : 97 0D		  staa	$0D     ;store A in addr 0D
;SYN61 LF9DA:
F9DA : 4F				  clra          ;clear A
;SYN62 LF9DB:
F9DB : 91 0D		  cmpa	$0D     ;compare A with value in addr 0D
F9DD : 26 03		  bne	LF9E2     ;branch if Z=0 SYN63
F9DF : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
;SYN63 LF9E2:
F9E2 : C6 12		  ldab	#$12    ;load B with value 12h
;SYN64 LF9E4:
F9E4 : 5A				  decb          ;decr B
F9E5 : 26 FD		  bne	LF9E4     ;branch if Z=0 SYN64
F9E7 : 4C				  inca          ;incr A
F9E8 : 2A F1		  bpl	LF9DB     ;branch if N=0 SYN62
F9EA : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
F9ED : 7C 00 0D   inc	$000D     ;incr value in addr 000D
F9F0 : 2A E8		  bpl	LF9DA     ;branch if N=0 SYN61
F9F2 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH7
;*************************************;
F9F3 : CE 00 0F   ldx	#$000F    ;load X with value 000Fh
;SYN71 LF9F6:
F9F6 : 6F 00		  clr	$00,x     ;clear addr X + 00h
F9F8 : 08				  inx           ;incr X
F9F9 : 8C 00 17   cpx	#$0017    ;compare X with value 0017h
F9FC : 26 F8		  bne	LF9F6     ;branch if Z=0 SYN71
F9FE : 86 40		  ldaa	#$40    ;load A with value 40h
FA00 : 97 0F		  staa	$0F     ;store A in addr 0F
;SYN72 LFA02:
FA02 : CE 00 0F   ldx	#$000F    ;load X with value 000Fh
FA05 : 86 80		  ldaa	#$80    ;load A with value 80h
FA07 : 97 0D		  staa	$0D     ;store A in addr 0D
FA09 : 5F				  clrb          ;clear B
;SYN73 LFA0A:
FA0A : A6 01		  ldaa	$01,x   ;load A with value in addr X + 01h
FA0C : AB 00		  adda	$00,x   ;add A with value in addr X +00h
FA0E : A7 01		  staa	$01,x   ;store A in addr X + 01h
FA10 : 2A 02		  bpl	LFA14     ;branch if N=0 SYN74
FA12 : DB 0D		  addb	$0D     ;add B with value at addr 0D
;SYN74 LFA14:
FA14 : 74 00 0D   lsr	$000D     ;logic shift right (bit7=0) in addr 000D
FA17 : 08				  inx           ;incr X
FA18 : 08				  inx           ;incr X
FA19 : 8C 00 17   cpx	#$0017    ;compare X with value 0017h
FA1C : 26 EC		  bne	LFA0A     ;branch if Z=0 SYN73
FA1E : F7 04 00   stab	$0400   ;store B in DAC output SOUND
FA21 : 7C 00 0E   inc	$000E     ;incr value in addr 000E
FA24 : 26 DC		  bne	LFA02     ;branch if Z=0 SYN72
FA26 : CE 00 0F   ldx	#$000F    ;load X with value 000Fh
FA29 : 5F				  clrb          ;clear B
;SYN75 LFA2A:
FA2A : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
FA2C : 27 0B		  beq	LFA39     ;branch if Z=1 SYN77
FA2E : 81 37		  cmpa	#$37    ;compare A with value 37h
FA30 : 26 04		  bne	LFA36     ;branch if Z=0 SYN76
FA32 : C6 41		  ldab	#$41    ;load B with value 41h
FA34 : E7 02		  stab	$02,x   ;store B in addr X + 02h
;SYN76 LFA36:
FA36 : 6A 00		  dec	$00,x     ;decr value in addr X + 00h
FA38 : 5C				  incb          ;incr B
;SYN77 LFA39:
FA39 : 08				  inx           ;incr X
FA3A : 08				  inx           ;incr X
FA3B : 8C 00 17   cpx	#$0017    ;compare X with value 0017h
FA3E : 26 EA		  bne	LFA2A     ;branch if Z=0 SYN75
FA40 : 5D				  tstb          ;test B=0
FA41 : 26 BF		  bne	LFA02     ;branch if Z=0 SYN72
FA43 : 39				  rts           ;return subroutine
;*************************************;
;PARAM6
;*************************************;
FA44 : 7A 00 04   dec	$0004     ;decr value in addr 0004
FA47 : 39				  rts           ;return subroutine
;*************************************;
;PARAM7
;*************************************;
FA48 : 8D 03		  bsr	LFA4D     ;branch sub PRM71
FA4A : 7E FC DD   jmp	LFCDD     ;jump to within IRQ
;PRM71 LFA4D called from NMI:
FA4D : 7F 00 04   clr	$0004     ;clr (00) addr 04
FA50 : 97 0D		  staa	$0D     ;store A in addr 0D
FA52 : CE FD 94   ldx	#$FD94    ;load X with FD94 (wavetable)
;PRM72 LFA55:
FA55 : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
FA57 : 27 2D		  beq	LFA86     ;branch Z=1 PRM75
FA59 : 7A 00 0D   dec	$000D     ;decr addr 0D
FA5C : 27 06		  beq	LFA64     ;branch Z=1 PRM73
FA5E : 4C         inca          ;incr A
FA5F : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
FA62 : 20 F1		  bra	LFA55     ;branch always PRM72
;PRM73 LFA64:
FA64 : 08         inx           ;incr X
FA65 : DF 0B		  stx	$0B       ;store X in addr 0B
FA67 : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
FA6A : DF 09		  stx	$09       ;store X in addr 09
FA6C : DE 0B		  ldx	$0B       ;load X in addr 0B
;PRM74 LFA6E:
FA6E : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
FA70 : 97 11		  staa	$11     ;store A in addr 11
FA72 : A6 01		  ldaa	$01,x   ;load A with addr X + 01h
FA74 : EE 02		  ldx	$02,x     ;load X with addr X + 02h
FA76 : DF 0F		  stx	$0F       ;store X in addr 0F
FA78 : 8D 0E		  bsr	LFA88     ;branch sub SYNTH8
FA7A : DE 0B		  ldx	$0B       ;load X with addr 0B
FA7C : 08         inx           ;incr X
FA7D : 08         inx           ;incr X
FA7E : 08         inx           ;incr X
FA7F : 08         inx           ;incr X
FA80 : DF 0B		  stx	$0B       ;store X in addr 0B
FA82 : 9C 09		  cpx	$09       ;comp X with addr 09
FA84 : 26 E8		  bne	LFA6E     ;brnach !=0 PRM74
;PRM75 LFA86:
FA86 : 39         rts           ;return subroutine
FA87 : 39         rts           ;return subroutine
;*************************************;
;SYNTH8 LFA88
;*************************************;
FA88 : CE 00 12   ldx	#$0012    ;load X with 0012h (scratch mem locations)
FA8B : 80 02		  suba	#$02    ;A = A - 02h (0000 0010)
;SYN81 LFA8D:
FA8D : 23 15		  bls	LFAA4     ;branch if lower or same SYN83
FA8F : 81 03		  cmpa	#$03    ;compare A with 03h (0000 0011)
FA91 : 27 09		  beq	LFA9C     ;branch Z=1 SYN82
FA93 : C6 01		  ldab	#$01    ;load B with 01h (0000 0001)
FA95 : E7 00		  stab	$00,x   ;store B in addr X + 00h
FA97 : 08				  inx           ;incr X
FA98 : 80 02		  suba	#$02    ;A = A - 02h (0000 0010)
FA9A : 20 F1		  bra	LFA8D     ;branch always SYN81
;SYN82 LFA9C:
FA9C : C6 91		  ldab	#$91    ;load B with 91h (1001 0001)
FA9E : E7 00		  stab	$00,x   ;store B in addr X + 00h
FAA0 : 6F 01		  clr	$01,x     ;clear addr X + 01h
FAA2 : 08				  inx           ;incr X       
FAA3 : 08				  inx           ;incr X
;SYN83 LFAA4:
FAA4 : C6 7E		  ldab	#$7E    ;load B with 7Eh (0111 1110)
FAA6 : E7 00		  stab	$00,x   ;store B in addr X + 00h
FAA8 : C6 FA		  ldab	#$FA    ;load B with FAh (1111 1010)
FAAA : E7 01		  stab	$01,x   ;store B in addr X + 01h
FAAC : C6 B2		  ldab	#$B2    ;load B with B2h (1011 0010) 
FAAE : E7 02		  stab	$02,x   ;store B in addr X + 02h
FAB0 : DE 0F		  ldx	$0F       ;load X with addr 0F
;LFAB2 SYN83 stores 7E FAB2 jmp $FAB2
FAB2 : 4F				  clra          ;clear A
FAB3 : F6 00 0E   ldab	$000E   ;load B with addr 0E
FAB6 : 5C				  incb          ;incr B
FAB7 : D7 0E		  stab	$0E     ;store B in addr 0E
FAB9 : D4 11		  andb	$11     ;and B with addr 11
FABB : 54				  lsrb          ;logic shift right B (bit7=0)
FABC : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FABE : 54				  lsrb          ;logic shift right B (bit7=0)
FABF : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FAC1 : 54				  lsrb          ;logic shift right B (bit7=0)
FAC2 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FAC4 : 54				  lsrb          ;logic shift right B (bit7=0)
FAC5 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FAC7 : 54				  lsrb          ;logic shift right B (bit7=0)
FAC8 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FACA : 54				  lsrb          ;logic shift right B (bit7=0)
FACB : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FACD : 54				  lsrb          ;logic shift right B (bit7=0)
FACE : 89 00		  adca	#$00    ;A = Carry + A + 00h 
FAD0 : 1B				  aba           ;A = A + B 
FAD1 : 48				  asla          ;arith shift left A (bit0 is 0)
FAD2 : 48				  asla          ;arith shift left A (bit0 is 0)
FAD3 : 48				  asla          ;arith shift left A (bit0 is 0)
FAD4 : 48				  asla          ;arith shift left A (bit0 is 0)
FAD5 : 48				  asla          ;arith shift left A (bit0 is 0)
FAD6 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
FAD9 : 09				  dex           ;decr X
FADA : 27 03		  beq	LFADF     ;branch Z=1 SYN84
FADC : 7E 00 12   jmp	L0012     ;jump extended addr 0012 (scratch mem location?)
;SYN84 LFADF:
FADF : 39				  rts           ;return subroutine
;*************************************;
;UTIL1
;*************************************;
FAE0 : 36				  psha          ;push A into stack then SP - 1
;UTL11 LFAE1:
FAE1 : A6 00		  ldaa	$00,x   ;load A in addr X + 00h
FAE3 : DF 09		  stx	$09       ;store X in addr 09
FAE5 : DE 0B		  ldx	$0B       ;load X from value in addr 0B
FAE7 : A7 00		  staa	$00,x   ;store A in addr X + 00h
FAE9 : 08				  inx           ;incr X
FAEA : DF 0B		  stx	$0B       ;store X in addr 0B
FAEC : DE 09		  ldx	$09       ;load X from value in addr 09
FAEE : 08				  inx           ;incr X
FAEF : 5A				  decb          ;decr B
FAF0 : 26 EF		  bne	LFAE1     ;branch if Z=0 UTL11
FAF2 : 32				  pula          ;SP + 1 pull stack into A
FAF3 : 39				  rts           ;return subroutine
;*************************************;
;PARAM10
;*************************************;
FAF4 : 4F				  clra          ;clear A
FAF5 : 97 00		  staa	$00     ;store A in addr 00
FAF7 : 97 01		  staa	$01     ;store A in addr 01
FAF9 : 39				  rts           ;return subroutine
;*************************************;
;PARAM11
;*************************************;
FAFA : 7F 00 00   clr	$0000     ;clear addr 0000 (00)
FAFD : 96 01		  ldaa	$01     ;load A with value at addr 01
FAFF : 84 7F		  anda	#$7F    ;and A with value 7Fh
FB01 : 81 1D		  cmpa	#$1D    ;compare A with value 1Dh
FB03 : 26 01		  bne	LFB06     ;branch if Z=0 P111
FB05 : 4F				  clra          ;clear A
;P111 LFB06:
FB06 : 4C				  inca          ;incr A
FB07 : 97 01		  staa	$01     ;store A in addr 01
FB09 : 39				  rts           ;return subroutine
;*************************************;
;UTIL2
;*************************************;
FB0A : 86 0E		  ldaa	#$0E    ;load A with value 0Eh
FB0C : BD FB 57   jsr	LFB57     ;jump sub PRM132
FB0F : 96 01		  ldaa	$01     ;load A with value at addr 01
FB11 : 48				  asla          ;arith shift left A (bit0 is 0)
FB12 : 48				  asla          ;arith shift left A (bit0 is 0)
FB13 : 43				  coma          ;complement 1s A
FB14 : BD FC 0F   jsr	LFC0F     ;jump sub PRM142
;UTL1 LFB17:
FB17 : 7C 00 13   inc	$0013     ;incr value in addr 0013
FB1A : BD FC 11   jsr	LFC11     ;jump sub PRM143
FB1D : 20 F8		  bra	LFB17     ;branch always UTL1
;*************************************;
;PARAM12
;*************************************;
FB1F : 86 03		  ldaa	#$03    ;load A with value 03h
FB21 : BD F8 2A   jsr	LF82A     ;jump sub PARAM1
FB24 : D6 02		  ldab	$02     ;load B with value at addr 02
FB26 : C1 1F		  cmpb	#$1F    ;compare B with value 01h
FB28 : 26 01		  bne	LFB2B     ;branch if Z=0 PRM121
FB2A : 5F				  clrb          ;clear B
;PRM121 LFB2B:
FB2B : 5C				  incb          ;incr B
FB2C : D7 02		  stab	$02     ;store B in addr 02
FB2E : 86 20		  ldaa	#$20    ;load A with value 20h
FB30 : 10				  sba           ;A = A - B (B unchanged)
FB31 : 5F				  clrb          ;clear B
;PRM122 LFB32:
FB32 : 81 14		  cmpa	#$14    ;compare A with value 14h
FB34 : 23 05		  bls	LFB3B     ;branch if C and Z = 1 PRM123
FB36 : CB 0E		  addb	#$0E    ;add B with 0Eh
FB38 : 4A				  deca          ;decr A
FB39 : 20 F7		  bra	LFB32     ;branch always PRM122
;PRM123 LFB3B:
FB3B : CB 05		  addb	#$05    ;add B with 05h
FB3D : 4A				  deca          ;decr A
FB3E : 26 FB		  bne	LFB3B     ;branch if Z=0 PRM123
FB40 : D7 0F		  stab	$0F     ;store B in addr 0F
;PRM124 LFB42:
FB42 : BD F8 3F   jsr	LF83F     ;jump sub SYNTH1
FB45 : 20 FB		  bra	LFB42     ;branch always PRM124
;*************************************;
;PARAM13
;*************************************;
FB47 : 96 03		  ldaa	$03     ;load A with value at addr 03
FB49 : 26 09		  bne	LFB54     ;branch if Z=0 PRM131
FB4B : 7C 00 03   inc	$0003     ;incr value at addr 0003
FB4E : 86 0D		  ldaa	#$0D    ;load A with value 0Dh (0000 
FB50 : 8D 05		  bsr	LFB57     ;branch sub PRM132
FB52 : 20 69		  bra	LFBBD     ;branch always SYNTH9
;PRM131 LFB54:
FB54 : 7E FC 04   jmp	LFC04     ;jump to PARAM14 PRM141
;PRM132 LFB57:
FB57 : 16				  tab           ;transfer A to B (A unchanged)
FB58 : 58				  aslb          ;arith shift left B (bit0 is 0)
FB59 : 1B				  aba           ;A = A + B
FB5A : 1B				  aba           ;A = A + B
FB5B : 1B				  aba           ;A = A + B
FB5C : CE FE D6   ldx	#$FED6    ;load X with FED6h (wavetable fdb)
FB5F : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
FB62 : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
FB64 : 16				  tab           ;transfer A to B
FB65 : 84 0F		  anda	#$0F    ;and A with value 0Fh (0000 1111)
FB67 : 97 10		  staa	$10     ;store A in addr 10
FB69 : 54				  lsrb          ;logic shift right B (bit7=0)
FB6A : 54				  lsrb          ;logic shift right B (bit7=0)
FB6B : 54				  lsrb          ;logic shift right B (bit7=0)
FB6C : 54				  lsrb          ;logic shift right B (bit7=0)
FB6D : D7 0F		  stab $0F      ;store B in addr 0F
FB6F : A6 01		  ldaa	$01,x   ;load A with value at addr X + 01
FB71 : 16				  tab           ;transfer A to B
FB72 : 54				  lsrb          ;logic shift right B (bit7=0)
FB73 : 54				  lsrb          ;logic shift right B (bit7=0)
FB74 : 54				  lsrb          ;logic shift right B (bit7=0)
FB75 : 54				  lsrb          ;logic shift right B (bit7=0)
FB76 : D7 11		  stab	$11     ;store B in addr 11
FB78 : 84 0F		  anda	#$0F    ;and A with value 0Fh (0000 1111)
FB7A : 97 0D		  staa	$0D     ;store A in addr 0D
FB7C : DF 07		  stx	$07       ;store X in addr 07
FB7E : CE FE 37   ldx	#$FE37    ;load X with FE37h (wavetable fdb)
;PRM133 LFB81:
FB81 : 7A 00 0D   dec	$000D     ;decr value in addr 000D
FB84 : 2B 08		  bmi	LFB8E     ;branch if N=1 (negative) PRM134
FB86 : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
FB88 : 4C				  inca          ;incr A
FB89 : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
FB8C : 20 F3		  bra	LFB81     ;branch always PRM133
;PRM134 LFB8E:
FB8E : DF 14		  stx	$14       ;store X in addr 14
FB90 : BD FC 4B   jsr	LFC4B     ;jump sub PARAM18
FB93 : DE 07		  ldx	$07       ;load X with value at addr 07
FB95 : A6 02		  ldaa	$02,x   ;load A with value at addr X + 02h
FB97 : 97 16		  staa	$16     ;store A in addr 16
FB99 : BD FC 5D   jsr	LFC5D     ;jump sub PARAM19
FB9C : DE 07		  ldx	$07       ;load X with value at addr 07
FB9E : A6 03		  ldaa	$03,x   ;load A with value at addr X + 03h
FBA0 : 97 12		  staa	$12     ;store A in addr 12
FBA2 : A6 04		  ldaa	$04,x   ;load A with value at addr X + 04h
FBA4 : 97 13		  staa	$13     ;store A in addr 13
FBA6 : A6 05		  ldaa	$05,x   ;load A with value at addr X + 05h
FBA8 : 16				  tab           ;transfer A to B
FBA9 : A6 06		  ldaa	$06,x   ;load A with value at addr X + 06h
FBAB : CE FF 3F   ldx	#$FF3F    ;load X with FF3Fh (wavetable)
FBAE : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
FBB1 : 17				  tba           ;transfer B to A (B unchanged)
FBB2 : DF 17		  stx	$17       ;store X in addr 17
FBB4 : 7F 00 1F   clr	$001F     ;clear (00) addr 1F
FBB7 : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
FBBA : DF 19		  stx	$0019     ;store X in addr 0019
FBBC : 39				  rts           ;return subroutine
;*************************************;
;SYNTH9
;*************************************;
FBBD : 96 0F		  ldaa	$0F     ;load A in addr 0F
FBBF : 97 1E		  staa	$1E     ;store A in addr 1E
;SYN91 LFBC1:
FBC1 : DE 17		  ldx	$17       ;load X with value at addr 17
FBC3 : DF 09		  stx	$09       ;store X in addr 09
;SYN92 LFBC5:
FBC5 : DE 09		  ldx	$09       ;load X with value at addr 09
FBC7 : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
FBC9 : 9B 1F		  adda	$1F     ;add A with value at addr 1F
FBCB : 97 1D		  staa	$1D     ;store A in addr 1D
FBCD : 9C 19		  cpx	$19       ;compare X with value at addr 19
FBCF : 27 26		  beq	LFBF7     ;branch if Z=1 PARAM14
FBD1 : D6 10		  ldab	$10     ;load B with value at addr 10
FBD3 : 08				  inx           ;incr X
FBD4 : DF 09		  stx	$09       ;store X in addr 09
;SYN93 LFBD6:
FBD6 : CE 00 20   ldx	#$0020    ;load X with value 0020h
;SYN94 LFBD9:
FBD9 : 96 1D		  ldaa	$1D     ;load A with value at addr 1D
;SYN95 LFBDB:
FBDB : 4A				  deca          ;decr A
FBDC : 26 FD		  bne	LFBDB     ;branch if Z=0 SYN95
FBDE : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
FBE0 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
FBE3 : 08				  inx           ;incr X
FBE4 : 9C 1B		  cpx	X001B     ;compare X with value at addr 1B
FBE6 : 26 F1 		  bne	LFBD9     ;branch if Z=0 SYN94
FBE8 : 5A				  decb          ;decr B
FBE9 : 27 DA		  beq	LFBC5     ;branch if Z=1 SYN92
FBEB : 08				  inx           ;4 cycles
FBEC : 09				  dex           ;4 cycles
FBED : 08				  inx           ;4 cycles
FBEE : 09				  dex           ;4 cycles
FBEF : 08				  inx           ;4 cycles
FBF0 : 09				  dex           ;4 cycles
FBF1 : 08				  inx           ;4 cycles
FBF2 : 09				  dex           ;4 cycles (32 cycles total)
FBF3 : 01				  nop           ;2 cycles
FBF4 : 01				  nop           ;2 cycles (38, all is timer?)
FBF5 : 20 DF		  bra	LFBD6     ;branch always SYN93
;*************************************;
;PARAM14 called by PARAM13
;*************************************;
FBF7 : 96 11		  ldaa	$11     ;load A with value at addr 11
FBF9 : 8D 62		  bsr	LFC5D     ;branch sub PARAM19
FBFB : 7A 00 1E   dec	$001E     ;decr value at addr 001E
FBFE : 26 C1		  bne	LFBC1     ;branch if Z=0 SYN91
FC00 : 96 03		  ldaa	$03     ;load A with value at addr 03
FC02 : 26 46		  bne	LFC4A     ;branch if Z=0 PARAM17 rts
;PRM141 LFC04: called by PARAM13
FC04 : 96 12		  ldaa	$12     ;load A with value at addr 12
FC06 : 27 42		  beq	LFC4A     ;branch if Z=1 PARAM17 rts
FC08 : 7A 00 13   dec	$0013     ;decr value at addr 0013
FC0B : 27 3D		  beq	LFC4A     ;branch if Z=1 PARAM17 rts
FC0D : 9B 1F		  adda	$1F     ;add A with value at addr 1F
;PRM142 LFC0F: called by UTIL2
FC0F : 97 1F		  staa	$1F     ;store A in addr 1F
;PRM143 LFC11: called by UTIL2
FC11 : DE 17		  ldx	$17       ;load X with value at addr 17
FC13 : 5F				  clrb          ;clear B (00)
;PRM144 LFC14: called by PARAM16
FC14 : 96 1F		  ldaa	$1F     ;load A with value at addr 1F
FC16 : 7D 00 12   tst	$0012     ;test (if 12 MSB is 1s) and set N,Z
FC19 : 2B 06		  bmi	LFC21     ;branch if N=1
FC1B : AB 00		  adda	$00,x   ;add A with value at addr X + 00h
FC1D : 25 08		  bcs	LFC27     ;branch if C=1 PARAM15 PRM151
FC1F : 20 0B		  bra	LFC2C     ;branch always PARAM16
;*************************************;
;PARAM15
;*************************************;
FC21 : AB 00		  adda	$00,x   ;add A with value at addr X + 00h
FC23 : 27 02		  beq	LFC27     ;branch if Z=1 PRM151
FC25 : 25 05		  bcs	LFC2C     ;branch if C=1 PARAM16
;PRM151 LFC27:
FC27 : 5D		      tstb          ;test B and set N,Z
FC28 : 27 08		  beq	LFC32     ;branch if Z=1 PARAM16 PRM161
FC2A : 20 0F		  bra	LFC3B     ;branch always PARAM17
;*************************************;
;PARAM16
;*************************************;
FC2C : 5D		      tstb          ;test B and set N,Z
FC2D : 26 03		  bne	LFC32     ;branch if Z=0 PRM161
FC2F : DF 17		  stx	$17       ;store X in addr 17
FC31 : 5C		      incb          ;incr B
;PRM161 LFC32:
FC32 : 08		      inx           ;incr X
FC33 : 9C 19		  cpx	$19       ;compare X with value at addr 19
FC35 : 26 DD		  bne	LFC14     ;branch if Z=0 PARAM14 PRM144
FC37 : 5D		      tstb          ;test B and set N,Z
FC38 : 26 01		  bne	LFC3B     ;branch if Z=0 PARAM17
FC3A : 39				  rts           ;return subroutine
;*************************************;
;PARAM17
;*************************************;
FC3B : DF 19		  stx	$19       ;store X in addr 19
FC3D : 96 11		  ldaa	$11     ;load A with value at addr 11
FC3F : 27 06		  beq	LFC47     ;branch if Z=1 PRM171
FC41 : 8D 08		  bsr	LFC4B     ;branch sub PARAM18
FC43 : 96 16		  ldaa	$16     ;load A with value at addr 16
FC45 : 8D 16		  bsr	LFC5D     ;branch sub PARAM19
;PRM171 LFC47:
FC47 : 7E FB BD   jmp	LFBBD     ;jump SYNTH9
;LFC4A:
FC4A : 39				  rts           ;return subroutine, called by PARAM14
;*************************************;
;PARAM18 called by PARAM13
;*************************************;
FC4B : CE 00 20   ldx	#$0020    ;load X with value 0020h
FC4E : DF 0B		  stx	$0B       ;store X in addr 0B
FC50 : DE 14		  ldx	$14       ;load X with value at addr 14
FC52 : E6 00		  ldab	$00,x   ;load B with value at addr X + 00h
FC54 : 08				  inx           ;incr X
FC55 : BD FA E0   jsr	LFAE0     ;jump sub UTIL1
FC58 : DE 0B		  ldx	$0B       ;load X with value at addr 0B
FC5A : DF 1B		  stx	$1B       ;store X in addr 1B
FC5C : 39				  rts           ;return subroutine
;*************************************;
;PARAM19 called by PARAM13,PARAM14
;*************************************;
FC5D : 4D				  tsta          ;test B and set N,Z
FC5E : 27 2B		  beq	LFC8B     ;branch if Z=1 PRM191
FC60 : DE 14		  ldx	$14       ;load X with value at addr 14
FC62 : DF 09		  stx	$09       ;store X in addr 09  
FC64 : CE 00 20   ldx	#$0020    ;load X with value 0020h
FC67 : 97 0E		  staa	$0E     ;store A in addr 0E
;PRM191 LFC69:
FC69 : DF 0B		  stx	$0B       ;store X in addr 0B
FC6B : DE 09		  ldx	$09       ;load X with value in addr 09
FC6D : D6 0E		  ldab	$0E     ;load B with vlaue in addr 0E
FC6F : D7 0D		  stab	$0D     ;store B in addr 0D
FC71 : E6 01		  ldab	$01,x   ;load B with value in addr X + 01h
FC73 : 54				  lsrb          ;logic shift right B (bit7=0)
FC74 : 54				  lsrb          ;logic shift right B (bit7=0)
FC75 : 54				  lsrb          ;logic shift right B (bit7=0)
FC76 : 54				  lsrb          ;logic shift right B (bit7=0)
FC77 : 08				  inx           ;incr X
FC78 : DF 09		  stx	$09       ;store X in addr 09
FC7A : DE 0B		  ldx	$0B       ;load X with value at addr 0B
FC7C : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
;PRM192 LFC7E:
FC7E : 10				  sba           ;A = A - B (B unchanged)
FC7F : 7A 00 0D   dec	$000D     ;decr value in addr 000D
FC82 : 26 FA		  bne	LFC7E     ;branch if Z=0 PRM192
FC84 : A7 00		  staa	$00,x   ;store A in addr X + 00h
FC86 : 08				  inx           ;incr X
FC87 : 9C 1B		  cpx	$1B       ;compare X with value at addr 1B
FC89 : 26 DE		  bne	LFC69     ;branch if Z=0 PRM191
;PRM193 LFC8B:
FC8B : 39				  rts           ;return subroutine
;*************************************;
;IRQ
;*************************************;
FC8C : 8E 00 7F   lds	#$007F    ;load SP with value 007Fh
FC8F : B6 04 02   ldaa	$0402   ;load A with addr 0402 (PIA sound select)
FC92 : 0E				  cli           ;clear interrupt (I=0)
FC93 : 43				  coma          ;complement 1s A
FC94 : 84 1F		  anda	#$1F    ;and A with value 1F (0001 1111)
FC96 : D6 04		  ldab	$04     ;load B with value at addr 04
FC98 : 27 03		  beq	LFC9D     ;branch if Z=1 IRQ1
FC9A : BD FA 48   jsr	LFA48     ;jump sub PARAM7
;IRQ1 LFC9D:
FC9D : 5F				  clrb          ;clear B (00)
FC9E : 81 0E		  cmpa	#$0E    ;compare A with value 0Eh (0000 1110)
FCA0 : 27 02		  beq	LFCA4     ;branch if Z=1 IRQ2
FCA2 : D7 02		  stab	$02     ;store B in addr 02
;IRQ2 LFCA4:
FCA4 : 81 12		  cmpa	#$12    ;compare A with value 12h (0001 0010)
FCA6 : 27 02		  beq	LFCAA     ;branch if Z=1 IRQ3
FCA8 : D7 03		  stab	$03     ;store B in addr 03
;IRQ3 LFCAA:
FCAA : 4D				  tsta          ;test A and set N,Z
FCAB : 27 30      beq	LFCDD     ;branch if Z=1 IRQ7
FCAD : 4A				  deca          ;decr A
FCAE : 81 0C		  cmpa	#$0C    ;compare A with value 0Ch
FCB0 : 22 11		  bhi	LFCC3     ;branch if C and Z=0 IRQ5
FCB2 : 81 03		  cmpa	#$03    ;compare A with value 03h
FCB4 : 26 05		  bne	LFCBB     ;branch if Z=0 IRQ4
FCB6 : BD FC FE   jsr	LFCFE     ;jump sub SYNTH10
FCB9 : 20 22		  bra	LFCDD     ;branch always IRQ7
;IRQ4 LFCBB:
FCBB : BD FB 57   jsr	LFB57     ;jump sub PARAM13 PRM132
FCBE : BD FB BD   jsr	LFBBD     ;jump sub SYNTH9
FCC1 : 20 1A		  bra	LFCDD     ;branch always IRQ7
;IRQ5 LFCC3:
FCC3 : 81 1B		  cmpa	#$1B    ;compare A with value 1Bh
FCC5 : 22 0E		  bhi	LFCD5     ;branch if C and Z=0 IRQ6
FCC7 : 80 0D		  suba	#$0D    ;A = A - 0Dh
FCC9 : 48				  asla          ;arith shift left A (bit0 is 0)
FCCA : CE FD 42   ldx	#$FD42    ;load X with value FD42h (VWTAB)
FCCD : 8D 21		  bsr	LFCF0     ;branch sub CALCOS
FCCF : EE 00		  ldx	$00,x     ;load X with value at addr X + 00h
FCD1 : AD 00		  jsr	$00,x			;jump sub addr X + 00h
FCD3 : 20 08		  bra	LFCDD     ;branch always IRQ7
;IRQ6 LFCD5:
FCD5 : 80 1C		  suba	#$1C    ;A = A - 1Ch
FCD7 : BD F8 2A   jsr	LF82A     ;jump sub PARAM1
FCDA : BD F8 3F   jsr	LF83F     ;jump sub SYNTH1
;IRQ7 LFCDD:
FCDD : 96 00		  ldaa	$00     ;load A with value at addr 00
FCDF : 9A 01		  oraa	$01     ;OR A with value at addr 01
;IRQ8 LFCE1:
FCE1 : 27 FE		  beq	LFCE1     ;branch if Z=1 IRQ8
FCE3 : 4F					clra          ;clear A (00)
FCE4 : 97 03		  staa	$03     ;store A in addr 03
FCE6 : 96 00		  ldaa	$00     ;load A with value in addr 00
FCE8 : 27 03		  beq	LFCED     ;branch if Z=1 IRQ9
FCEA : 7E F9 13   jmp	LF913     ;jump PARAM3
;IRQ9 LFCED:
FCED : 7E FB 0A   jmp	LFB0A     ;jump UTIL2
;*************************************;
;CALCOS
;*************************************;
FCF0 : DF 09		  stx	$09       ;store X in addr 09
FCF2 : 9B 0A		  adda	$0A     ;add A with value in addr 0A
FCF4 : 97 0A		  staa	$0A     ;store A in addr 0A
FCF6 : 24 03		  bcc	LFCFB     ;branch if C=0 CAL1
FCF8 : 7C 00 09   inc	X0009     ;incr value in addr 0009
;CAL1 LFCFB:
FCFB : DE 09		  ldx	$09       ;load X with value at addr 09
FCFD : 39				  rts           ;return subroutine
;*************************************;
;SYNTH10
;*************************************;
FCFE : CE 00 E0   ldx	#$00E0    ;load X with 00E0h
;SYN101 LFD01:
FD01 : 86 20		  ldaa	#$20    ;load A with value 20h (0010 0000)
FD03 : 8D EB		  bsr	LFCF0     ;branch sub CALCOS
;SYN102 LFD05:
FD05 : 09				  dex           ;decr X
FD06 : 26 FD		  bne	LFD05     ;branch Z=0 SYN102
FD08 : 7F 04 00   clr	$0400     ;clear (00) in DAC output SOUND
;SYN103 LFD0B:
FD0B : 5A				  decb          ;decr B
FD0C : 26 FD		  bne	LFD0B     ;branch Z=0 SYN103
FD0E : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
FD11 : DE 09		  ldx	$09       ;load X with value in addr 09
FD13 : 8C 10 00   cpx	#$1000    ;compare X with value 1000h
FD16 : 26 E9		  bne	LFD01     ;branch Z=0 SYN101
FD18 : 39				  rts           ;return subroutine
;*************************************;
;NMI
;*************************************;
FD19 : 0F		      sei           ;set interrupt mask
FD1A : 8E 00 7F   lds	#$007F    ;load SP with 007Fh (0000 0000 0111 1111)
FD1D : CE FF FF   ldx	#$FFFF    ;load X with FFFFh (1111 1111 1111 1111)
FD20 : 5F         clrb          ;clear B
;NMI1
FD21 : E9 00		  adcb	$00,x   ;B = Carry + B + addr X +00h
FD23 : 09		      dex           ;decr X
FD24 : 8C F8 00   cpx	#$F800    ;comp X with F800h (78h)
FD27 : 26 F8		  bne	LFD21     ;branch !=0 NMI1
FD29 : E1 00		  cmpb	$00,x   ;comp B with addr X + 00h
FD2B : 27 01		  beq	LFD2E     ;branch =0 NMI2
FD2D : 3E		      wai           ;wait interrupt
;NMI2:
FD2E : 86 01		  ldaa	#$01    ;load A with 01h (0000 0001)
FD30 : BD F8 2A   jsr	LF82A     ;jump sub PARAM1
FD33 : BD F8 3F   jsr	LF83F     ;jump sub SYNTH1
FD36 : 86 02		  ldaa	#$02    ;load A with 02h (0000 0010)
FD38 : BD FA 4D   jsr	LFA4D     ;jump sub PRM71
FD3B : 86 01		  ldaa	#$01    ;load A with 01h (0000 0001)
FD3D : BD FA 4D   jsr	LFA4D     ;jump sub PRM71
FD40 : 20 D7		  bra	LFD19     ;branch always NMI
;*************************************;
;VWTAB x15
;*************************************;
FD42 : FB 1F                          ;PARAM12
FD44 : F9 13                          ;PARAM3
FD46 : FA FA                          ;PARAM11
FD48 : F8	8C                          ;PARAM2
FD4A : FB 47                          ;PARAM13
FD4C : FA F4                          ;PARAM10 
FD4E : F8	CD                          ;SYNTH3
FD50 : F8 94                          ;SYNTH2
FD52 : F9 1C                          ;PARAM4
FD54 : F9 23                          ;PARAM5 
FD56 : F9 A6                          ;SYNTH5 
FD58 : F9 D4                          ;SYNTH6 
FD5A : F9	F3                          ;SYNTH7
FD5C : FA 44                          ;PARAM6 
FD5E : FA 87                          ;PARAM8	
;*************************************;
;VVECT 9 bytes
;*************************************;
FD60 : 40 01 00	10 E1 00 80 FF FF     ;SAW
FD69 : 28 01 00 08 81 02 00 FF FF     ;FOSHIT 
FD72 : 28	81 00	FC 01 02 00 FC FF     ;QUASAR
FD7B : FF 01 00 18 41 04 80 00 FF     ;CABSHK 
FD84 : 8C 5B B6 40 BF	49 A4 73 73     ;? 
FD8D : A4 49
FD8F : BF 40 B6
FD92 : 5B
FD93 : 8C 
;*************************************;
;ORGAN MELODY - starts at 2nd half of 1st bar, rept octave down, then arp up to end chords
;*************************************;
;called by NMI -> PARAM7
FD94 : 0C 7F 1D 0F FB 7F 23	0F
FD9C : 15	FE 08 50 8A 88 3E	3F
FDA4 : 02	3E 7C 04 03	FF 3E 3F
FDAC : 2C E2 7C 12 0D	74 7C 0D
FDB4 : 0E	41 7C 23 0B	50 7C 1D 
FDBC : 29 F2 7C 3F 02	3E F8 04 
FDC4 : 03	FF 7C 3F 2C E2 F8 12 
FDCC : 0D	74 F8 0D 0E	41 F8 23 
FDD4 : 0B 50 F8 1D 2F	F2 F8 23
FDDC : 05 A8 F8 12 06	BA F8 04
FDE4 : 07	FF 7C 37 04	C1 7C	23 
FDEC : 05 A8 7C	12 06	BA 3E 04
FDF4 : 07	FF 3E 37 04	C1 3E	23 
FDFC : 05 A8 1F 12 06 BA 1F 04
FE04 : 07	FF 1F 37 04	C1 1F	23 
FD0C : 16 A0 FE	1D 17	F9 7F 37
FE14 : 13 06 7F 3F 08 FA FE 04
FE1C : 0F	FF FE 0D 0E 41 FE 23 
FE24 : 0B	50 FE 1D 5F	E4 00	47
FE2C : 3F	37 30	29 23	1D 17	12
FE34 : 0D 08 04
;FE36 - FD94 = A2h (162 bytes)
;*************************************;
;
;*************************************;
;called by PARAM13 PRM132 2nd time
FE37 : 08
FE38 : 7F D9 FF	
FE3B : D9 7F
FE3D : 24 00
FE3F : 24 08
;
FE41 : 00			    " "				db	$00
							;
FE42 : 40			    "@"		[2]		nega
FE43 : 80 00			    "  "	[2]		suba	#$00
FE45 : FF 00 80			    "   "	[6]		stx	X0080
FE48 : 40			    "@"		[2]		nega
FE49							LFE49:
FE49 : 10			    " "		[2]		sba
FE4A : 7F B0 D9			    "   "	[6]		clr	XB0D9
FE4D : F5 FF F5			    "   "	[4]		bitb	XFFF5
FE50 : D9 B0			    "  "	[3]		adcb	X00B0
FE52 : 7F 4E 24			    " N$"	[6]		clr	X4E24
FE55 : 09			    " "		[4]		dex
							;
FE56 : 00			    " "				db	$00
							;
FE57 : 09			    " "		[4]		dex
FE58 : 24 4E			    "$N"	[4]		bcc	LFEA8
FE5A : 10			    " "		[2]		sba
FE5B : 7F C5 EC			    "   "	[6]		clr	XC5EC
FE5E : E7 BF			    "  "	[6]		stab	$BF,x
FE60 : 8D 6D			    " m"	[8]		bsr	LFECF
FE62 : 6A 7F			    "j "	[7]		dec	$7F,x
FE64 : 94 92			    "  "	[3]		anda	X0092
							;
FE66 : 71			    "q"				db	$71
							;
FE67 : 40			    "@"		[2]		nega
FE68 : 17			    " "		[2]		tba
							;
FE69 : 12			    " "				db	$12
							;
FE6A : 39			    "9"		[5]		rts
							;
FE6B : 10			    " "		[2]		sba
FE6C : FF FF FF			    "   "	[6]		stx	XFFFF
FE6F : FF 00 00			    "   "	[6]		stx	X0000
							;
FE72 : 00 00			    "  "			db	$00, $00
							;
FE74 : FF FF FF			    "   "	[6]		stx	XFFFF
FE77 : FF 00 00			    "   "	[6]		stx	X0000
							;
FE7A : 00 00			    "  "			db	$00, $00
							;
FE7C : 48			    "H"		[2]		asla
FE7D : 8A 95			    "  "	[2]		oraa	#$95
FE7F : A0 AB			    "  "	[5]		suba	$AB,x
FE81 : B5 BF C8			    "   "	[4]		bita	XBFC8
FE84 : D1 DA			    "  "	[3]		cmpb	X00DA
FE86 : E1 E8			    "  "	[5]		cmpb	$E8,x
FE88 : EE F3			    "  "	[6]		ldx	$F3,x
FE8A : F7 FB FD			    "   "	[5]		stab	XFBFD
FE8D : FE FF FE			    "   "	[5]		ldx	XFFFE
							;
FE90 : FD			    " "				db	$FD
							;
FE91 : FB F7 F3			    "   "	[4]		addb	XF7F3
FE94 : EE E8			    "  "	[6]		ldx	$E8,x
FE96 : E1 DA			    "  "	[5]		cmpb	$DA,x
FE98 : D1 C8			    "  "	[3]		cmpb	X00C8
FE9A : BF B5 AB			    "   "	[6]		sts	XB5AB
FE9D : A0 95			    "  "	[5]		suba	$95,x
FE9F : 8A 7F			    "  "	[2]		oraa	#$7F
							;
FEA1 : 75			    "u"				db	$75
							;
FEA2 : 6A 5F			    "j_"	[7]		dec	$5F,x
FEA4 : 54			    "T"		[2]		lsrb
FEA5 : 4A			    "J"		[2]		deca
FEA6 : 40			    "@"		[2]		nega
FEA7 : 37			    "7"		[4]		pshb
FEA8							LFEA8:
FEA8 : 2E 25			    ".%"	[4]		bgt	LFECF
							;
FEAA : 1E			    " "				db	$1E
							;
FEAB : 17			    " "		[2]		tba
FEAC : 11			    " "		[2]		cba
FEAD : 0C			    " "		[2]		clc
FEAE : 08			    " "		[4]		inx
							;
FEAF : 04 02			    "  "			db	$04, $02
							;
FEB1 : 01			    " "		[2]		nop
							;
FEB2 : 00			    " "				db	$00
							;
FEB3 : 01			    " "		[2]		nop
							;
FEB4 : 02 04			    "  "			db	$02, $04
							;
FEB6 : 08			    " "		[4]		inx
FEB7 : 0C			    " "		[2]		clc
FEB8 : 11			    " "		[2]		cba
FEB9 : 17			    " "		[2]		tba
							;
FEBA : 1E			    " "				db	$1E
							;
FEBB : 25 2E			    "%."	[4]		bcs	LFEEB
FEBD : 37			    "7"		[4]		pshb
FEBE : 40			    "@"		[2]		nega
FEBF : 4A			    "J"		[2]		deca
FEC0 : 54			    "T"		[2]		lsrb
FEC1 : 5F			    "_"		[2]		clrb
FEC2 : 6A 75			    "ju"	[7]		dec	$75,x
FEC4 : 7F 10 59			    "  Y"	[6]		clr	X1059
							;
FEC7 : 7B			    "{"				db	$7B
							;
FEC8 : 98 AC			    "  "	[3]		eora	X00AC
							;
FECA : B3			    " "				db	$B3
							;
FECB : AC 98			    "  "	[6]		cpx	$98,x
							;
FECD : 7B			    "{"				db	$7B
							;
FECE : 59			    "Y"		[2]		rolb
FECF							LFECF:
FECF : 37			    "7"		[4]		pshb
FED0 : 19			    " "		[2]		daa
FED1 : 06			    " "		[2]		tap
							;
FED2 : 00			    " "				db	$00
							;
FED3 : 06			    " "		[2]		tap
FED4 : 19			    " "		[2]		daa
FED5 : 37			    "7"		[4]		pshb
;*************************************;
;
;*************************************;
;called by PARAM13 - PRM132 1st time
FED6 : 81 24
FED8 : 00 00 00
FEDB : 16
FEDC : 31
FEDD : 12 05 1A
FEE0 : FF 00 27
FEE3 : 6D 11
FEE5 : 05			    " "				db	$05
							;
FEE6 : 11			    " "		[2]		cba
FEE7 : 01			    " "		[2]		nop
FEE8 : 0F			    " "		[2]		sei
FEE9 : 01			    " "		[2]		nop
FEEA : 47			    "G"		[2]		asra
FEEB							LFEEB:
FEEB : 11			    " "		[2]		cba
FEEC : 31			    "1"		[4]		ins
							;
FEED : 00			    " "				db	$00
							;
FEEE : 01			    " "		[2]		nop
							;
FEEF : 00			    " "				db	$00
							;
FEF0 : 0D			    " "		[2]		sec
FEF1 : 1B			    " "		[2]		aba
FEF2 : F4 12 00			    "   "	[4]		andb	X1200
							;
FEF5 : 00 00 14			    "   "			db	$00, $00, $14
							;
FEF8 : 47			    "G"		[2]		asra
							;
FEF9 : 41 45 00 00 00		    "AE   "			db	$41, $45, $00, $00, $00
							;
FEFE : 0F			    " "		[2]		sei
							;
FEFF : 5B 21			    "[!"			db	$5B, $21
							;
FF01							XFF01:
FF01 : 35			    "5"		[4]		txs
FF02 : 11			    " "		[2]		cba
FF03 : FF 00 0D			    "   "	[6]		stx	X000D
FF06 : 1B			    " "		[2]		aba
							;
FF07 : 15 00 00 FD 00		    "     "			db	$15, $00, $00, $FD, $00
							;
FF0C : 01			    " "		[2]		nop
FF0D : 69 31			    "i1"	[7]		rol	$31,x
FF0F : 11			    " "		[2]		cba
							;
FF10 : 00			    " "				db	$00
							;
FF11 : 01			    " "		[2]		nop
							;
FF12 : 00 03			    "  "			db	$00, $03
							;
FF14 : 6A 01			    "j "	[7]		dec	$01,x
							;
FF16 : 15			    " "				db	$15
							;
FF17 : 01			    " "		[2]		nop
FF18 : 01			    " "		[2]		nop
FF19 : 01			    " "		[2]		nop
FF1A : 01			    " "		[2]		nop
FF1B : 47			    "G"		[2]		asra
FF1C : F6 53 03			    " S "	[4]		ldab	X5303
							;
FF1F : 00 02			    "  "			db	$00, $02
							;
FF21 : 06			    " "		[2]		tap
FF22 : 94 6A			    " j"	[3]		anda	X006A
FF24 : 10			    " "		[2]		sba
							;
FF25 : 02 00 02			    "   "			db	$02, $00, $02
							;
FF28							XFF28:
FF28 : 06			    " "		[2]		tap
FF29 : 9A 1F			    "  "	[3]		oraa	X001F
							;
FF2B : 12 00			    "  "			db	$12, $00
							;
FF2D : FF 10 04			    "   "	[6]		stx	X1004
FF30 : 69 31			    "i1"	[7]		rol	$31,x
FF32 : 11			    " "		[2]		cba
							;
FF33 : 00			    " "				db	$00
							;
FF34 : FF 00 0D			    "   "	[6]		stx	X000D
							;
FF37 : 00 12			    "  "			db	$00, $12
							;
FF39 : 06			    " "		[2]		tap
							;
FF3A : 00			    " "				db	$00
							;
FF3B : FF 01 09			    "   "	[6]		stx	X0109
FF3E : 28
;*************************************;
;
;*************************************; 
;called by PARAM13 PRM134
FF3F : A0			    "( "	[4]		bvc	LFEE0
FF40 : 98 90			    "  "	[3]		eora	X0090
FF42 : 88 80			    "  "	[2]		eora	#$80
FF44 : 78 70 68			    "xph"	[6]		asl	X7068
FF47 : 60 58			    "`X"	[7]		neg	$58,x
FF49 : 50			    "P"		[2]		negb
FF4A : 44			    "D"		[2]		lsra
FF4B : 40			    "@"		[2]		nega
FF4C : 01			    " "		[2]		nop
FF4D : 01			    " "		[2]		nop
							;
FF4E : 02 02 04 04		    "    "			db	$02, $02, $04, $04
							;
FF52 : 08			    " "		[4]		inx
FF53 : 08			    " "		[4]		inx
FF54 : 10			    " "		[2]		sba
FF55 : 10			    " "		[2]		sba
FF56 : 30			    "0"		[4]		tsx
FF57 : 60 C0			    "` "	[7]		neg	$C0,x
FF59 : E0 01			    "  "	[5]		subb	$01,x
FF5B : 01			    " "		[2]		nop
							;
FF5C : 02 02 03 04 05		    "     "			db	$02, $02, $03, $04, $05
							;
FF61 : 06			    " "		[2]		tap
FF62 : 07			    " "		[2]		tpa
FF63 : 08			    " "		[4]		inx
FF64 : 09			    " "		[4]		dex
FF65 : 0A			    " "		[2]		clv
FF66 : 0C			    " "		[2]		clc
FF67 : 80 7C			    " |"	[2]		suba	#$7C
FF69 : 78 74 70			    "xtp"	[6]		asl	X7470
FF6C : 74 78 7C			    "tx|"	[6]		lsr	X787C
FF6F : 80 01			    "  "	[2]		suba	#$01
FF71 : 01			    " "		[2]		nop
							;
FF72 : 02 02 04 04		    "    "			db	$02, $02, $04, $04
							;
FF76 : 08			    " "		[4]		inx
FF77 : 08			    " "		[4]		inx
FF78 : 10			    " "		[2]		sba
FF79 : 20 28			    " ("	[4]		bra	LFFA3
							;
FF7B : 30			    "0"		[4]		tsx
							;
FF7C : 38			    "8"				db	$38
							;
FF7D : 40			    "@"		[2]		nega
FF7E : 48			    "H"		[2]		asla
FF7F : 50			    "P"		[2]		negb
FF80 : 60 70			    "`p"	[7]		neg	$70,x
FF82 : 80 A0			    "  "	[2]		suba	#$A0
FF84 : B0 C0 08			    "   "	[4]		suba	XC008
FF87 : 40			    "@"		[2]		nega
FF88 : 08			    " "		[4]		inx
FF89 : 40			    "@"		[2]		nega
FF8A : 08			    " "		[4]		inx
FF8B : 40			    "@"		[2]		nega
FF8C : 08			    " "		[4]		inx
FF8D : 40			    "@"		[2]		nega
FF8E : 08			    " "		[4]		inx
FF8F : 40			    "@"		[2]		nega
FF90 : 08			    " "		[4]		inx
FF91 : 40			    "@"		[2]		nega
FF92 : 08			    " "		[4]		inx
FF93 : 40			    "@"		[2]		nega
FF94 : 08			    " "		[4]		inx
FF95 : 40			    "@"		[2]		nega
FF96 : 08			    " "		[4]		inx
FF97 : 40			    "@"		[2]		nega
FF98 : 08			    " "		[4]		inx
FF99 : 40			    "@"		[2]		nega
FF9A : 01			    " "		[2]		nop
							;
FF9B : 02 04			    "  "			db	$02, $04
							;
FF9D : 08			    " "		[4]		inx
FF9E : 09			    " "		[4]		dex
FF9F : 0A			    " "		[2]		clv
FFA0 : 0B			    " "		[2]		sev
FFA1 : 0C			    " "		[2]		clc
FFA2 : 0E			    " "		[2]		cli
FFA3							LFFA3:
FFA3 : 0F			    " "		[2]		sei
FFA4 : 10			    " "		[2]		sba
							;
FFA5 : 12 14			    "  "			db	$12, $14
							;
FFA7 : 16			    " "		[2]		tab
FFA8 : 40			    "@"		[2]		nega
FFA9 : 10			    " "		[2]		sba
FFAA : 08			    " "		[4]		inx
FFAB : 01			    " "		[2]		nop
FFAC : 01			    " "		[2]		nop
FFAD : 01			    " "		[2]		nop
FFAE : 01			    " "		[2]		nop
FFAF : 01			    " "		[2]		nop
							;
FFB0 : 02 02 03 03 04 04 05	    "       "			db	$02, $02, $03, $03, $04, $04, $05
							;
FFB7 : 06			    " "		[2]		tap
FFB8 : 08			    " "		[4]		inx
FFB9 : 0A			    " "		[2]		clv
FFBA : 0C			    " "		[2]		clc
FFBB : 10			    " "		[2]		sba
							;
FFBC : 14 18			    "  "			db	$14, $18
							;
FFBE : 20 30			    " 0"	[4]		bra	LFFF0
							;
FFC0 : 40			    "@"		[2]		nega
FFC1 : 50			    "P"		[2]		negb
FFC2 : 40			    "@"		[2]		nega
FFC3 : 30			    "0"		[4]		tsx
FFC4 : 20 10			    "  "	[4]		bra	LFFD6
							;
FFC6 : 0C			    " "		[2]		clc
FFC7 : 0A			    " "		[2]		clv
FFC8 : 08			    " "		[4]		inx
FFC9 : 07			    " "		[2]		tpa
FFCA : 06			    " "		[2]		tap
							;
FFCB : 05 04 03 02 02		    "     "			db	$05, $04, $03, $02, $02
							;
FFD0 : 01			    " "		[2]		nop
FFD1 : 01			    " "		[2]		nop
FFD2 : 01			    " "		[2]		nop
FFD3 : 07			    " "		[2]		tpa
FFD4 : 08			    " "		[4]		inx
FFD5 : 09			    " "		[4]		dex
FFD6							LFFD6:
FFD6 : 0A			    " "		[2]		clv
FFD7 : 0C			    " "		[2]		clc
FFD8 : 08			    " "		[4]		inx
FFD9 : 17			    " "		[2]		tba
							;
FFDA : 18			    " "				db	$18
							;
FFDB : 19			    " "		[2]		daa
							;
FFDC : 1A			    " "				db	$1A
							;
FFDD : 1B			    " "		[2]		aba
							;
FFDE : 1C 00 00 00 00 00 00 00	    "        "			db	$1C, $00, $00, $00, $00, $00, $00, $00
FFE6 : 00 00 00 00 00 00 00 00	    "        "			db	$00, $00, $00, $00, $00, $00, $00, $00
FFEE : 00 00 00 00 00 00 00	    "       "			db	$00, $00, $00, $00, $00, $00, $00
FFF5 : 00 00 00 
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : FC 8C 	                ;IRQ 
FFFA : F8 01                  ;RESET SWI (software) 
FFFC : FD 19                  ;NMI 
FFFE : F8	01                  ;RESET (hardware) 

;--------------------------------------------------------------
