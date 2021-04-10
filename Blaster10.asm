				;
				;	Disassembled by:
				;		DASMx object code disassembler
				;		(c) Copyright 1996-2003   Conquest Consultants
				;		Version 1.40 (Oct 18 2003)
				;
				;	File:		Blaster10.532
				;
				;	Size:		4096 bytes
				;	Checksum:	D012
				;	CRC-32:		C33A3145
				;
				;	Date:		Fri Apr 09 11:29:47 2021
				;
				;	CPU:		Motorola 6800 (6800/6802/6808 family)
				;
				;assuming primary sound rom for ROM18 Blaster game, 
				;
			  ;org	$F000
				;
;*************************************;
;Copyright notice FDB
;*************************************;         
F000 : 89 28		" ("                  ;(C)
F002 : 43		"C"
F003 : 29 31		")1"                  ;1983
F005 : 39		"9"
F006 : 38		"8"
F007 : 33		"3"                       ;
F008 : 20 57		" W"                  ;WILLIAMS
F00A : 49		"I"
F00B : 4C		"L"
F00C : 4C		"L"
F00D : 49		"I"
F00E : 41		"A"
F00F : 4D		"M"
F010 : 53		"S"                       ;
F011 : 20 45		" E"                  ;ELECTRONICS
F013 : 4C		"L"
F014 : 45		"E"
F015 : 43		"C"
F016 : 54		"T"
F017 : 52		"R"
F018 : 4F		"O"
F019 : 4E		"N"
F01A : 49		"I"
F01B : 43		"C"
F01C : 53		"S"                       ;
;*************************************;
; RESET org F01D
;*************************************;
F01D : 0F         sei           ;set interrupt mask I=1  
F01E : 8E 00 7F   lds	#$007F    ;load stack pointer with 007Fh (0000 0000 0111 1111) 
F021 : CE 04 00   ldx	#$0400    ;load X with 0400h (0000 0100 0000 0000) PIA addr
F024 : 6F 01      clr $01,x     ;clr (00) X + 01h (0401) PIA CR port A
F026 : 6F 03      clr $03,x     ;clr (00) X + 03h (0403) PIA CR port B
F028 : 86 FF      ldaa  #$FF    ;load A with FFh (1111 1111)
F02A : A7 00      staa  $00,x   ;store A in addr X + 00h (0400) PIA port A out (DAC sound)
F02C : 6F 02      clr $02,x     ;clr (00) X + 02h (0402) PIA port B in (sound select)
F02E : 86 37      ldaa  #$37    ;load A with 37h (0011 0111)
F030 : A7 03      staa  $03,x   ;store A in addr X + 03h (0403) PIA CR port B
F032 : 86 3C      ldaa  #$3C    ;load A with 3Ch(0011 1100)
F034 : A7 01      staa  $01,x   ;store A in addr X + 01h (0401) PIA1 CR port A
F036 : 97 05      staa	$05     ;store A in addr 05
F038 : 4F         clra          ;clear A
F039 : 97 03      staa	$03     ;store A in addr 03
F03B : 97 00      staa	$00     ;store A in addr 00
F03D : 97 01      staa	$01     ;store A in addr 01
F03F : 97 02      staa	$02     ;store A in addr 02
F041 : 97 04      staa	$04     ;store A in addr 04
F043 : 0E         cli           ;clear interrupt I=0
;STDBY LF044:
F044 : 20 FE      bra	LF044     ;branch always STDBY
;*************************************;
;SYNTH1
;*************************************;
F046 : CE 00 01   ldx	#$0001    ;load X with value 0001h
F049 : DF 11      stx	$11       ;store X in addr 11
F04B : CE 03 80   ldx	#$0380    ;load X with value 0380h
F04E : DF 13      stx	$13       ;store X in addr 13
;SYN11 LF050:
F050 : 7F 04 00   clr	$0400     ;clear (00) DAC output SOUND
F053 : DE 11      ldx	$11       ;load X with value in addr 11
F055 : 08         inx           ;incr X
F056 : DF 11      stx	$11       ;store X in addr 11
;SYN12 LF058:
F058 : 09         dex           ;decr X
F059 : 26 FD      bne	LF058     ;branch Z=0 SYN12
F05B : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
F05E : DE 13      ldx	$13       ;load X with value in addr 13
;SYN13 LF060:
F060 : 09         dex           ;decr X
;SYN14 LF061:
F061 : 26 FD      bne	LF060     ;branch Z=0 SYN13
F063 : 20 EB      bra	LF050     ;branch always SYN11
;*************************************;
;SYNTH2
;*************************************;
F065 : 7F 04 02   clr	$0402     ;clear (00) PIA sound select
F068 : CE F0 AC   ldx	#$F0AC    ;load X with value F0ACh (vector jump table or FDB below)
F06B : DF 13      stx	$13       ;store X in addr 13
;SYN21 LF06D:
F06D : DE 13      ldx	$13       ;load X with value in addr 13
F06F : A6 00      ldaa	$00,x   ;load A with value in addr X + 00h
F071 : 27 33      beq	LF0A6     ;branch Z=1 PIASET
F073 : E6 01      ldab	$01,x   ;load B with value in addr X + 01h
F075 : C4 F0      andb	#$F0    ;and B with value F0h
F077 : D7 12      stab	$12     ;store B in addr 12
F079 : E6 01      ldab	$01,x   ;load B with value in addr X + 01h
F07B : 08         inx           ;incr X
F07C : 08         inx           ;incr X
F07D : DF 13      stx	$13       ;store X in addr 13
F07F : 97 11      staa	$11     ;store A in add 11
F081 : C4 0F      andb	#$0F    ;and B with value 0Fh
;SYN22 LF083:
F083 : 96 12      ldaa	$12     ;load A with value in addr 12
F085 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F088 : 96 11      ldaa	$11     ;load A with value in addr 11
;SYN23 LF08A:
F08A : CE 00 05   ldx	#$0005    ;load X with value in addr 0005
;SYN24 LF08D:
F08D : 09         dex           ;decr X
F08E : 26 FD      bne	LF08D     ;branch Z=0 SYN24
F090 : 4A         deca          ;decr A
F091 : 26 F7      bne	LF08A     ;branch Z=0 SYN23
F093 : 7F 04 00   clr	$0400     ;clear (00) DAC output SOUND
F096 : 96 11      ldaa	$11     ;load A with value in addr 11
;SYN25 LF098:
F098 : CE 00 05   ldx	#$0005    ;load X with value in addr 0005
;SYN26 LF09B:
F09B : 09         dex           ;decr X
F09C : 26 FD      bne	LF09B     ;branch Z=0 SYN26
F09E : 4A         deca          ;decr A
F09F : 26 F7      bne	LF098     ;branch Z=0 SYN25
F0A1 : 5A         decb          ;decr B
F0A2 : 26 DF      bne	LF083     ;branch Z=0 SYN22
F0A4 : 20 C7      bra	LF06D     ;branch always SYN21
;*************************************;
;PIASET
;*************************************;
;LF0A6:
F0A6 : 86 80      ldaa	#$80    ;load A with value 80h
F0A8 : B7 04 02   staa	$0402   ;store A in PIA sound select
F0AB : 39				  rts           ;return subroutine
;*************************************;
;vector jump table or FDB data
;*************************************;
F0AC : 01
F0AD : FC 02 
F0AF : FC 03
F0B1 : F8 04 
F0B3 : F8 06
F0B5 : F8 08 
F0B7 : F4 0C
F0B9 : F4 10 
F0BB : F4 20 
F0BD : F2 40
F0BF : F1 60 
F0C2 : F1 80 
F0C4 : F1 A0 
F0C6 : F1 C0 
F0C8 : F1 00 
F0CA : 00
;*************************************;
;PARAM1
;*************************************;
F0CA : 16				  tab           ;transfer A to B
F0CB : 48				  asla          ;arith shift left A (bit0 is 0)
F0CC : 48				  asla          ;arith shift left A (bit0 is 0)
F0CD : 48				  asla          ;arith shift left A (bit0 is 0)
F0CE : 1B				  aba           ;A = A + B
F0CF : CE 00 11   ldx	#$0011    ;load X with value 0011h
F0D2 : DF 0D      stx	$0D       ;store X in addr 0D
F0D4 : CE F6 23   ldx	#$F623    ;load X with value F623h (VWTAB ?)
F0D7 : BD F5 C3   jsr	LF5C3     ;jump sub CALCOS
F0DA : C6 09      ldab	#$09    ;load B with value in addr 09
F0DC : 7E F3 A8   jmp	LF3A8     ;jump UTIL1
;*************************************;
;SYNTH3 (similar to ROM1 SYNTH1)
;*************************************;
F0DF : 96 19      ldaa	$19     ;load A with value in addr 19
F0E1 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
;SYN31 LF0E4:
F0E4 : 96 11      ldaa	$11     ;load A with value in addr 11
F0E6 : 97 1A      staa	$1A     ;store A in addr 1A
F0E8 : 96 12      ldaa	$12     ;load A with value in addr 12
F0EA : 97 1B      staa	$1B     ;store A in addr 1B
;SYN32 LF0EC:
F0EC : DE 16      ldx	$16       ;load X with value in addr 16
;SYN33 LF0EE:
F0EE : 96 1A      ldaa	$1A     ;load A with value in addr 1A
F0F0 : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
;SYN34 LF0F3:
F0F3 : 09         dex           ;decr X
F0F4 : 27 10      beq	LF106     ;branch Z=1 SYN36
F0F6 : 4A         deca          ;decr A
F0F7 : 26 FA      bne	LF0F3     ;branch Z=0 SYN34
F0F9 : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
F0FC : 96 1B      ldaa	$1B     ;load A with value in addr 1B
;SYN35 LF0FE:
F0FE : 09         dex           ;decr X
F0FF : 27 05      beq	LF106     ;branch Z=1 SYN36
F101 : 4A         deca          ;decr A
F102 : 26 FA      bne	LF0FE     ;branch Z=0 SYN35
F104 : 20 E8      bra	LF0EE     ;branch always SYN33
;SYN36 LF106:
F106 : B6 04 00   ldaa	$0400   ;load A with value in DAC output SOUND
F109 : 2B 01      bmi	LF10C     ;branch N=1 SYN37
F10B : 43         coma          ;complement 1s in A
;SYN37 LF10C:
F10C : 8B 00      adda	#$00    ;add A with value 00h
F10E : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F111 : 96 1A      ldaa	$1A     ;load A with value in addr 1A
F113 : 9B 13      adda	$13     ;add A with value in addr 13
F115 : 97 1A      staa	$1A     ;store A in addr 1A
F117 : 96 1B      ldaa	$1B     ;load A with value in addr 1B
F119 : 9B 14      adda	$14     ;add A with value in addr 14
F11B : 97 1B      staa	$1B     ;store A in addr 1B
F11D : 91 15      cmpa	$15     ;compare A with value in addr 15
F11F : 26 CB      bne	LF0EC     ;branch Z=0 SYN32
F121 : 96 18      ldaa	$18     ;load A with value in addr 18
F123 : 27 06      beq	LF12B     ;branch Z=1 SYN38
F125 : 9B 11      adda	$11     ;add A with value in addr 11
F127 : 97 11      staa	$11     ;store A in addr 11
F129 : 26 B9      bne	LF0E4     ;branch Z=0 SYN31
;SYN38 LF12B:
F12B : 39				  rts           ;return subroutine
;*************************************;
;PRMSYN41 (params for SYNTH4)
;*************************************;
F12C : 86 FF      ldaa	#$FF    ;load A with value FFh
F12E : 97 18      staa	$18     ;store A in addr 18
F130 : 86 D0      ldaa	#$D0    ;load A with value D0h
F132 : C6 0E      ldab	#$0E    ;load B with value 0Eh
F134 : 20 10      bra	LF146     ;branch always SYN41
;*************************************;
;PRMSYN42 (params for SYNTH4)
;*************************************;
F136 : 86 01      ldaa	#$01    ;load A with value 01h
F138 : 97 18      staa	$18     ;store A in addr 18
F13A : C6 03      ldab	#$03    ;load A with value 03h
F13C : 20 08      bra	LF146     ;branch always SYN41
;*************************************;
;SYNTH4 (similar ROM1 SYNTH2)
;*************************************;
F13E : 86 FF      ldaa	#$FF    ;load A with value FFh
F140 : 97 18      staa	$18     ;store A in addr 18
F142 : 86 D0      ldaa	#$D0    ;load A with value D0h
F144 : C6 15      ldab	#$15    ;load B with value 15h
;SYN41 LF146:
F146 : 97 17      staa	$17     ;store A in addr 17
F148 : 86 FF      ldaa	#$FF    ;load A with value FFh
F14A : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F14D : D7 13      stab	$13     ;store B in addr 13
;SYN42 LF14F:
F14F : D6 13      ldab	$13     ;load B with value in addr 13
;SYN43 LF151:
F151 : 96 06      ldaa	$06     ;load A with value in addr 06
F153 : 44				  lsra          ;logic shift right A (bit7=0)
F154 : 44				  lsra          ;logic shift right A (bit7=0)
F155 : 44				  lsra          ;logic shift right A (bit7=0)
F156 : 98 06      eora	$06     ;exclusive OR with value in addr 06
F158 : 44				  lsra          ;logic shift right A (bit7=0)
F159 : 76 00 05   ror	$0005     ;rotate right in addr 0005 (bit7 = C then C = bit0)
F15C : 76 00 06   ror	$0006     ;rotate right in addr 0006 (bit7 = C then C = bit0)
F15F : 24 03      bcc	LF164     ;branch if C=0 SYN44
F161 : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
;SYN44 LF164:
F164 : 96 17      ldaa	$17     ;load A in addr 17
;SYN45 LF166:
F166 : 4A         deca          ;decr A
F167 : 26 FD      bne	LF166     ;branch Z=0 SYN45
F169 : 5A         decb          ;decr B
F16A : 26 E5      bne	LF151     ;branch Z=0 SYN43
F16C : 96 17      ldaa	$17     ;load A with value in addr 17
F16E : 9B 18      adda	$18     ;add A with value in addr 18
F170 : 97 17      staa	$17     ;store A in addr 17
F172 : 26 DB      bne	LF14F     ;branch Z=0 SYN42
F174 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH5 (similar ROM1 SYNTH3)
;*************************************;
F175 : 86 A0      ldaa	#$A0    ;load A with value A0h
F177 : 20 02      bra	LF17B     ;branch always SYN31
;SYN51 LF179:
F179 : 86 20      ldaa	#$20    ;load A with value 20h
;SYN52 LF17B:
F17B : 97 13      staa	$13     ;store A in addr 13
F17D : 97 16      staa	$16     ;store A in addr 16
F17F : 86 00      ldaa	#$00    ;load A with value 00h
F181 : CE 00 01   ldx	#$0001    ;load X with value 0001h
F184 : C6 FF      ldab	#$FF    ;load B with value FFh
F186 : 20 0D      bra	LF195     ;branch always SYN54
;SYN53 LF188:
F188 : 86 20      ldaa	#$20    ;load A with value 20h
F18A : 97 13      staa	$13     ;store A in addr 13
F18C : 97 16      staa	$16     ;store A in addr 16
F18E : 86 01      ldaa	#$01    ;load A with value 01h
F190 : CE 00 01   ldx	#$0001    ;load X with value 0001h
F193 : C6 C8      ldab	#$C8    ;load B with value C8h
;SYN54 LF195:
F195 : 97 11      staa	$11     ;store A in addr 11
;SYN55 LF197:
F197 : DF 14      stx	$14       ;store X in addr 14
;SYN56 LF199:
F199 : D7 12      stab	$12     ;store B in addr 12
F19B : D6 13      ldab	$13     ;load B with value in addr 13
;SYN57 LF19D:
F19D : 96 06      ldaa	$06     ;load A with value in addr 06
F19F : 44				  lsra          ;logic shift right A (bit7=0)
F1A0 : 44				  lsra          ;logic shift right A (bit7=0)
F1A1 : 44				  lsra          ;logic shift right A (bit7=0)
F1A2 : 98 06      eora	$06     ;exclusive OR with value in addr 06
F1A4 : 44				  lsra          ;logic shift right A (bit7=0)
F1A5 : 76 00 05   ror	$0005     ;rotate right in addr 0005 (bit7 = C then C = bit0)
F1A8 : 76 00 06   ror	$0006     ;rotate right in addr 0006 (bit7 = C then C = bit0)
F1AB : 86 00      ldaa	#$00    ;load A with value 00h
F1AD : 24 02      bcc	LF1B1     ;branch C=0 SYN58
F1AF : 96 12      ldaa	$12     ;load A with value in addr 12
;SYN58 LF1B1:
F1B1 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F1B4 : DE 14      ldx	$14       ;load X with value in addr 14
;SYN59 LF1B6:
F1B6 : 09				  dex           ;decr X
F1B7 : 26 FD      bne	LF1B6     ;branch Z=0 SYN59
F1B9 : 5A				  decb          ;decr B
F1BA : 26 E1      bne	LF19D     ;branch Z=0 SYN57
F1BC : D6 12      ldab	$12     ;load B with value in addr 12
F1BE : D0 11      subb	$11     ;B = B - value in addr 11
F1C0 : 27 09      beq	LF1CB     ;branch Z=1 SYN5A
F1C2 : DE 14      ldx	$14       ;load X with value in addr 14
F1C4 : 08				  inx           ;incr X
F1C5 : 96 16      ldaa	$16     ;load A with value in addr 16
F1C7 : 27 D0      beq	LF199     ;branch Z=1 SYN56
F1C9 : 20 CC      bra	LF197     ;branch always SYN55
;SYN5A LF1CB:
F1CB : 39				  rts           ;return subroutine
;*************************************;
;PRMSYN6 (loads X with var then bra SYNTH6)
;*************************************;
F1CC : C6 01      ldab	#$01    ;load B with value 01h
F1CE : D7 00      stab	$00     ;store B in addr 00
F1D0 : CE F1 F5   ldx	#$F1F5    ;load X with value F1F5h (6 byte vars below)
F1D3 : 20 3B      bra	LF210     ;branch always SYNTH6 - SYN61
F1D5 : CE F1 FB   ldx	#$F1FB    ;load X with value F1FBh
F1D8 : 20 36      bra	LF210     ;branch always SYNTH6 - SYN61
F1DA : CE F2 01   ldx	#$F201    ;load X with value F201h
F1DD : 20 31      bra	LF210     ;branch always SYNTH6 - SYN61
F1DF : CE F1 E9   ldx	#$F1E9    ;load X with value F1E9h
F1E2 : 20 2C      bra	LF210     ;branch always SYNTH6 - SYN61
F1E4 : CE F1 EF   ldx	#$F1EF    ;load X with value F1EFh
F1E7 : 20 27      bra	LF210     ;branch always SYNTH6 - SYN61
;*************************************;
;vars called by PRMSYN6
;*************************************;
;mem   18 14 17 11 Xl Xh
F1E9 : 00 00 01 C0 00 80
;
F1EF : 01 00 01 FF 0C 00
;
F1F5 : 00 00 00 01 00 00
; 
F1FB : 00 00 00 05 00 00
;
F201 : 01 00 01 FF 03 E8
;
F207 : 01 01 01 40 10 00
;*************************************;
;SYNTH6 (similar ROM1 SYNTH4, diff is added vars)
;*************************************;
;LF20D:
F20D : CE F2 07   ldx	#$F207    ;load X with value F207h
;SYN61 LF210:
F210 : A6 00      ldaa	$00,x   ;load A with value in addr X + 00h
F212 : 97 18      staa	$18     ;store A in addr 18
F214 : A6 01      ldaa	$01,x   ;load A with value in addr X + 01h
F216 : 97 14      staa	$14     ;store A in addr 14
F218 : A6 02      ldaa	$02,x   ;load A with value in addr X + 02h
F21A : E6 03      ldab	$03,x   ;load A with value in addr X + 03h
F21C : EE 04      ldx	$04,x     ;load X with value in addr X + 04h
F21E : 97 17      staa	$17     ;store A in addr 17
F220 : D7 11      stab	$11     ;store B in addr 11
F222 : DF 15      stx	$15       ;store X in addr 15
F224 : 7F 00 13   clr	$0013     ;clear addr 0013
;SYN62 LF227:
F227 : DE 15      ldx	$15       ;load X with value in addr 15
F229 : B6 04 00   ldaa	$0400   ;load A with value in DAC sound OUTPUT
;SYN63 LF22C:
F22C : 16				  tab           ;transfer A to B
F22D : 54				  lsrb          ;logic shift right B (bit7=0)
F22E : 54				  lsrb          ;logic shift right B (bit7=0)
F22F : 54				  lsrb          ;logic shift right B (bit7=0)
F230 : D8 06		  eorb	$06     ;exclusive OR with value in addr 06
F232 : 54				  lsrb          ;logic shift right B (bit7=0)
F233 : 76 00 05   ror	$0005     ;rotate right in addr 0005 (bit7 = C then C = bit0)
F236 : 76 00 06   ror	$0006     ;rotate right in addr 0006 (bit7 = C then C = bit0)
F239 : D6 11      ldab	$11     ;load B with value in addr 11
F23B : 7D 00 18   tst	$0018     ;test value in addr=00 (N=0(MSB), Z=1)
F23E : 27 04      beq	LF244     ;branch Z=1 SYN64
F240 : D4 05      andb	$05     ;and B with value in addr 05
F242 : DB 14      addb	$14     ;add B with value in addr 14
;SYN64 LF244:
F244 : D7 12      stab	$12     ;store B in addr 12
F246 : D6 13      ldab	$13     ;load B with value in addr 13
F248 : 91 06      cmpa	$06     ;compare A with value in addr 06
F24A : 22 12      bhi	LF25E     ;branch C=0 and Z=0 SYN66
;SYN65 LF24C:
F24C : 09				  dex           ;decr X
F24D : 27 26      beq	LF275     ;branch Z=1 SYN68
F24F : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F252 : DB 13      addb	$13     ;add B with value in addr 13
F254 : 99 12      adca	$12     ;A = A + C + value in addr 12
F256 : 25 16      bcs	LF26E     ;branch C=1 SYN67
F258 : 91 06      cmpa	$06     ;compare A with value in addr 06
F25A : 23 F0      bls	LF24C     ;branch C=1 and Z=1 SYN65
F25C : 20 10      bra	LF26E     ;branch always SYN67
;SYN66 LF25E:
F25E : 09				  dex           ;decr X
F25F : 27 14      beq	LF275     ;branch if Z=1 SYN68
F261 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F264 : D0 13      subb	$13     ;B = B - value in addr 13
F266 : 92 12      sbca	$12     ;A = A - C - value in addr 12
F268 : 25 04      bcs	LF26E     ;branch C=1 SYN67
F26A : 91 06      cmpa	$06     ;compare A with value in addr 06
F26C : 22 F0      bhi	LF25E     ;branch C=0 and Z=0 SYN66
;SYN67 LF26E:
F26E : 96 06      ldaa	$06     ;load A with value in addr 06
F270 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F273 : 20 B7      bra	LF22C     ;branch always SYN63
;SYN68 LF275:
F275 : D6 17      ldab	$17     ;load B with value in addr 17
F277 : 27 B3      beq	LF22C     ;branch Z=1 SYN63
F279 : 96 11      ldaa	$11     ;load A with value in addr 11
F27B : D6 13      ldab	$13
F27D : 44				  lsra          ;logic shift right A (bit7=0)
F27E : 56				  rorb          ;rotate right B (bit7=C and C=bit0)
F27F : 44				  lsra          ;logic shift right A (bit7=0)
F280 : 56				  rorb          ;rotate right B (bit7=C and C=bit0)
F281 : 44				  lsra          ;logic shift right A (bit7=0)
F282 : 56				  rorb          ;rotate right B (bit7=C and C=bit0)
F283 : 43				  coma          ;complement 1s A
F284 : 50				  negb          ;complement 2s B
F285 : 82 FF		  sbca	#$FF    ;A = A - C - value FFh
F287 : DB 13      addb	$13     ;add B with value in addr 13
F289 : 99 11      adca	$11     ;A = A + C + value in addr 11
F28B : D7 13      stab	$13     ;store B in addr 13
F28D : 97 11      staa	$11     ;store A in addr 11
F28F : 26 96      bne	LF227     ;branch Z=0 SYN62
F291 : C1 07      cmpb	#$07    ;compare B with value 07h
F293 : 26 92      bne	LF227     ;branch Z=0 SYN62
F295 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH7 (similar to ROM1 SYNTH5)
;*************************************;
F296 : 86 F6		  ldaa	#$F6    ;load A with value F6h
F298 : 97 0D		  staa	$0D     ;store B in addr 0D
F29A : CE 00 64   ldx	#$0064    ;load X with value 0064h
F29D : DF 09		  stx	$09       ;store X in addr 09
;SYN71 LF29F:
F29F : DB 0A		  addb	$0A     ;add B with value in addr 0A
F2A1 : 96 0F		  ldaa	$0F     ;load A with value in addr 0F
F2A3 : 99 09		  adca	$09     ;A = A + C + value in addr 09
F2A5 : 97 0F		  staa	$0F     ;store A in addr 0F
F2A7 : DE 09		  ldx	$09       ;load X with value in addr 09
F2A9 : 25 04		  bcs	LF2AF     ;branch C=1 SYN73
F2AB : 20 00		  bra	LF2AD     ;branch always SYN72
;SYN72 LF2AD:
F2AD : 20 03		  bra	LF2B2     ;branch always SYN74
;SYN73 LF2AF:
F2AF : 08				  inx           ;incr X
F2B0 : 27 11		  beq	LF2C3     ;branch Z=1 SYN75
;SYN74 LF2B2:
F2B2 : DF 09		  stx	$09       ;store X in addr 09
F2B4 : 84 0F		  anda	#$0F    ;and A with value 0Fh
F2B6 : 8B 62		  adda	#$62    ;add A with value 62h
F2B8 : 97 0E		  staa	$0E     ;store A in addr 0E
F2BA : DE 0D		  ldx	$0D       ;load X with value in addr 0D
F2BC : A6 00		  ldaa	$00,x   ;load A with value in addr X + 00h
F2BE : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F2C1 : 20 DC		  bra	LF29F     ;branch always SYN71
;SYN75 LF2C3:
F2C3 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH8 (similar ROM1 SYNTH6)
;*************************************;
F2C4 : 4F				  clra          ;clear A (00)
F2C5 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F2C8 : 97 0F		  staa	$0F     ;store A in addr 0F
;SYN81 LF2CA:
F2CA : 4F				  clra          ;clear A (00)
;SYN82 LF2CB:
F2CB : 91 0F		  cmpa	$0F     ;compare A with value in addr 0F
F2CD : 26 03		  bne	LF2D2     ;branch Z=0 SYN83
F2CF : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
;SYN83 LF2D2:
F2D2 : C6 12		  ldab	#$12    ;load B with value 12h
;SYN84 LF2D4:
F2D4 : 5A				  decb          ;decr B
F2D5 : 26 FD		  bne	LF2D4     ;branch Z=0 SYN84
F2D7 : 4C				  inca          ;incr A
F2D8 : 2A F1		  bpl	LF2CB     ;branch N=0 SYN82
F2DA : 73 04 00   com	$0400     ;complement 1s in DAC output SOUND
F2DD : 7C 00 0F   inc	$000F     ;incr value in addr 000F
F2E0 : 2A E8		  bpl	LF2CA     ;branch if N=0 SYN81
F2E2 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH9 (similar to ROM1 SYNTH7)
;*************************************;
F2E3 : CE 00 11   ldx	#$0011    ;load X with value 0011h
;SYN91 LF2E6:
F2E6 : 6F 00		  clr	$00,x     ;clear addr X + 00h
F2E8 : 08				  inx           ;incr X
F2E9 : 8C 00 19   cpx	#$0019    ;compare X with value 0019h
F2EC : 26 F8		  bne	LF2E6     ;branch Z=0 SYN91
F2EE : 86 40		  ldaa	#$40    ;load A with value 40h
F2F0 : 97 11		  staa	$11     ;store A in addr 11
;SYN92 LF2F2:
F2F2 : CE 00 11   ldx	#$0011    ;load X with value 0011h
F2F5 : 86 80		  ldaa	#$80    ;load A with value 80h
F2F7 : 97 0F		  staa	$0F     ;store A in addr 0F
F2F9 : 5F				  clrb          ;clear B
;SYN93 LF2FA:
F2FA : A6 01		  ldaa	$01,x   ;load A with value in addr X + 01h
F2FC : AB 00		  adda	$00,x   ;add A with value in addr X +00h
F2FE : A7 01		  staa	$01,x   ;store A in addr X + 01h
F300 : 2A 02		  bpl	LF304     ;branch N=0 SYN94
F302 : DB 0F		  addb	$0F     ;add B with value at addr 0F
;SYN94 LF304:
F304 : 74 00 0F   lsr	$000F     ;logic shift right (bit7=0) in addr 000F
F307 : 08				  inx           ;incr X
F308 : 08				  inx           ;incr X
F309 : 8C 00 19   cpx	#$0019    ;compare X with value 0019h
F30C : 26 EC		  bne	LF2FA     ;branch Z=0 SYN93
F30E : F7 04 00   stab	$0400   ;store B in DAC output SOUND
F311 : 7C 00 10   inc	$0010     ;incr value in addr 0010
F314 : 26 DC		  bne	LF2F2     ;branch Z=0 SYN92
F316 : CE 00 11   ldx	#$0011    ;load X with value 0011h
F319 : 5F				  clrb          ;clear B
;SYN95 LF31A:
F31A : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
F31C : 27 0B		  beq	LF329     ;branch Z=1 SYN97
F31E : 81 37		  cmpa	#$37    ;compare A with value 37h
F320 : 26 04		  bne	LF326     ;branch Z=0 SYN96
F322 : C6 41		  ldab	#$41    ;load B with value 41h
F324 : E7 02		  stab	$02,x   ;store B in addr X + 02h
;SYN96 LF326:
F326 : 6A 00		  dec	$00,x     ;decr value in addr X + 00h
F328 : 5C				  incb          ;incr B
;SYN97 LF329:
F329 : 08				  inx           ;incr X
F32A : 08				  inx           ;incr X
F32B : 8C 00 19   cpx	#$0019    ;compare X with value 0019h
F32E : 26 EA		  bne	LF31A     ;branch Z=0 SYN95
F330 : 5D				  tstb          ;test B=0
F331 : 26 BF		  bne	LF2F2     ;branch Z=0 SYN92
F333 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH10 (similar to ROM7 solarfire SYNTH5)
;*************************************;
F334 : 86 80		  ldaa	#$80    ;load A with 80h 
F336 : 97 1B		  staa	$1B     ;store A in addr 1B
F338 : 86 F3		  ldaa	#$F3    ;load A with F3h
F33A : 97 19		  staa	$19     ;store A in addr 19
;SYN101 LF33C:
F33C : 86 80		  ldaa	#$80    ;load A with 80h
F33E : 97 0F		  staa	$0F     ;store A in addr 0F
;SYN102 LF340:
F340 : 86 12		  ldaa	#$12    ;load A with 12h
;SYN103 LF342:
F342 : 4A				  deca          ;decr A
F343 : 26 FD		  bne	LF342     ;branch Z=0 SYN103
F345 : 96 18		  ldaa	$18     ;load A with addr 18
F347 : 9B 1B		  adda	$1B     ;add A with addr 1B
F349 : 97 18		  staa	$18     ;store A in addr 18
F34B : 44				  lsra          ;logic shift right A (bit7=0)
F34C : 44				  lsra          ;logic shift right A (bit7=0)
F34D : 44				  lsra          ;logic shift right A (bit7=0)
F34E : 8B 68		  adda	#$68    ;add A with 68h
F350 : 97 1A		  staa	$1A     ;store A in addr 1A
F352 : DE 19		  ldx	$19       ;load X with addr 19
F354 : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
F356 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F359 : 7A 00 0F   dec	$000F     ;decr value in addr 000F
F35C : 26 E2		  bne	LF340     ;branch Z=0 SYN102
F35E : 7A 00 1B   dec	$001B     ;decr value in addr 001B
F361 : 96 1B		  ldaa	$1B     ;load A with addr 1B
F363 : 81 20		  cmpa	#$20    ;comp A with 20h
F365 : 26 D5		  bne	LF33C     ;branch Z=0 SYN101
F367 : 39				  rts           ;return subroutine
;*************************************;
;FDB data
;*************************************;
F368 : 80 8C		"  "		suba	#$8C
F36A : 98 A5		"  "		eora	X00A5
F36C : B0 BC C6		"   "		suba	XBCC6
F36F : D0 DA		"  "		subb	X00DA
F371 : E2 EA		"  "		sbcb	$EA,x
F373 : F0 F5 FA		"   "		subb	XF5FA
				;
F376 : FD		" "		db	$FD
				;
F377 : FE FF FE		"   "		ldx	XFFFE
				;
F37A : FD		" "		db	$FD
				;
F37B : FA F5 F0		"   "		orab	XF5F0
F37E : EA E2		"  "		orab	$E2,x
F380 : DA D0		"  "		orab	X00D0
F382 : C6 BC		"  "		ldab	#$BC
F384 : B0 A5 98		"   "		suba	XA598
F387 : 8C 80 73		"  s"		cpx	#$8073
F38A : 67 5A		"gZ"		asr	$5A,x
F38C : 4F		"O"		clra
F38D : 43		"C"		coma
F38E : 39		"9"		rts
				;
F38F : 2F 25		"/%"		ble	LF3B6
				;
F391 : 1D 15		"  "		db	$1D, $15
				;
F393 : 0F		" "		sei
F394 : 0A		" "		clv
				;
F395 : 05 02		"  "		db	$05, $02
				;
F397 : 01		" "		nop
				;
F398 : 00		" "		db	$00
				;
F399 : 01		" "		nop
				;
F39A : 02 05		"  "		db	$02, $05
				;
F39C : 0A		" "		clv
F39D : 0F		" "		sei
				;
F39E : 15 1D		"  "		db	$15, $1D
				;
F3A0 : 25 2F		"%/"		bcs	LF3D1
F3A2 : 39		"9"		rts
				;
F3A3 : 43		"C"		coma
F3A4 : 4F		"O"		clra
F3A5 : 5A		"Z"		decb
F3A6 : 67 73		"gs"		asr	$73,x
;*************************************;
;UTIL1 (similar to ROM1 UTIL1)
;*************************************;
;LF3A8:
F3A8 : 36				  psha          ;push A into stack then SP - 1
;UTL1 LF3A9:
F3A9 : A6 00      ldaa	$00,x   ;load A in addr X + 00h
F3AB : DF 0B      stx	$0B       ;store X in addr 0B
F3AD : DE 0D      ldx	$0D       ;load X from value in addr 0D
F3AF : A7 00      staa	$00,x   ;store A in addr X + 00h
F3B1 : 08         inx           ;incr X
F3B2 : DF 0D      stx	$0D       ;store X in addr 0D
F3B4 : DE 0B      ldx	$0B       ;load X from value in addr 0B
F3B6 : 08         inx           ;incr X
F3B7 : 5A         decb          ;decr B
F3B8 : 26 EF      bne	LF3A9     ;branch Z=0 UTL1
F3BA : 32				  pula          ;SP + 1 pull stack into A
F3BB : 39				  rts           ;return subroutine
;*************************************;
;PRMCLR (param clear)
;*************************************;
F3BC : 4F         clra          ;clear A
F3BD : 97 00      staa	$00     ;store A in addr 00
F3BF : 97 01      staa	$01     ;store A in addr 01
F3C1 : 97 04      staa	$04     ;store A in addr 04
F3C3 : 39				  rts           ;return subroutine
;*************************************;
;PRMCHK (param check)
;*************************************;
F3C4 : 7F 00 00   clr	$0000     ;clear addr 0000
F3C7 : 96 01      ldaa	$01     ;load A with value in addr 01
F3C9 : 84 7F      anda	#$7F    ;and A with value 7Fh
F3CB : 81 7F      cmpa	#$7F    ;compare A with value 7Fh
F3CD : 26 01      bne	LF3D0     ;branch Z=0 PMCK1    
F3CF : 4F         clra          ;clear A
;PMCK1 LF3D0:
F3D0 : 4C         inca          ;incr A
F3D1 : 97 01      staa	$01     ;store A in addr 01
F3D3 : 39				  rts           ;return subroutine
;*************************************;
;PARAM2 
;*************************************;
F3D4 : 86 0E      ldaa	#$0E    ;load A with value 0Eh
F3D6 : BD F4 1F   jsr	LF41F     ;jump sub PARAM3
F3D9 : 96 01      ldaa	$01     ;load A with value at addr 01
F3DB : 43         coma          ;complement 1s in A
F3DC : BD F4 D7   jsr	LF4D7     ;jump sub PARAM below
;PRM21 LF3DF:
F3DF : 7C 00 15   inc	$0015     ;incr value in addr 0015
F3E2 : BD F4 D9   jsr	LF4D9     ;jump sub PARAM below
F3E5 : 20 F8      bra	LF3DF     ;branch always PRM21
;*************************************;
;PRMSYN3 (params for SYNTH3) (similar to ROM1 PARAM12)
;*************************************; 
F3E7 : 86 03      ldaa	#$03    ;load A with value 03h
F3E9 : BD F0 CA   jsr	LF0CA     ;jump sub PARAM1
F3EC : D6 02      ldab	$02     ;load B with value at addr 02
F3EE : C1 1F      cmpb	#$1F    ;compare B with value 01h
F3F0 : 26 01      bne	LF3F3     ;branch Z=0
F3F2 : 5F				  clrb          ;clear B
;PRM31 LF3F3:
F3F3 : 5C				  incb          ;incr B
F3F4 : D7 02      stab	$02     ;store B in addr 02
F3F6 : 86 20      ldaa	#$20    ;load A with value 20h
F3F8 : 10				  sba           ;A = A - B (B unchanged)
F3F9 : 5F				  clrb          ;clear B
;PRM32 LF3FA:
F3FA : 81 14      cmpa	#$14    ;compare A with value 14h
F3FC : 23 05      bls	LF403     ;branch if C=1 and Z=1
F3FE : CB 0E      addb	#$0E    ;add B with 0Eh
F400 : 4A				  deca          ;decr A
F401 : 20 F7      bra	LF3FA     ;branch always
;PRM33 LF403:
F403 : CB 05      addb	#$05    ;add B with 05h
F405 : 4A				  deca          ;decr A
F406 : 26 FB      bne	LF403     ;branch Z=0
F408 : D7 11      stab	$11     ;store B in addr 11
;LF40A:
F40A : BD F0 DF   jsr	LF0DF     ;jump sub SYNTH3
F40D : 20 FB      bra	LF40A     ;branch always
;*************************************;
;PRMSYN11 (similar to ROM1 PARAM13)
;*************************************;
F40F : 96 03      ldaa	$03     ;load A with value at addr 03
F411 : 26 09      bne	LF41C     ;branch Z=0
F413 : 7C 00 03   inc	$0003     ;incr value at addr 0003
F416 : 86 0D      ldaa	#$0D    ;load A with value 0Dh
F418 : 8D 05      bsr	LF41F     ;branch sub PARAM3
F41A : 20 69      bra	LF485     ;branch always SYNTH11
;LF41C:
F41C : 7E F4 CC   jmp	LF4CC     ;jump PARAM below
;*************************************;
;PARAM3 (similar to ROM1 PRM132)
;*************************************;
F41F : 16				  tab           ;transfer A to B (A unchanged
F420 : 58				  aslb          ;arith shift left B (bit0 is 0)
F421 : 1B				  aba           ;A = A + B
F422 : 1B				  aba           ;A = A + B
F423 : 1B				  aba           ;A = A + B
F424 : CE F7 BF   ldx	#$F7BF    ;load X with F7BFh (wavetable fdb)
F427 : BD F5 C3   jsr	LF5C3     ;jump sub CALCOS
F42A : A6 00      ldaa	$00,x   ;load A with value at addr X + 00h
F42C : 16				  tab           ;transfer A to B (A unchanged
F42D : 84 0F      anda	#$0F    ;and A with value 0Fh
F42F : 97 12      staa	$12     ;store A in addr 12
F431 : 54				  lsrb          ;logic shift right B (bit7=0)
F432 : 54				  lsrb          ;logic shift right B (bit7=0)
F433 : 54				  lsrb          ;logic shift right B (bit7=0)
F434 : 54				  lsrb          ;logic shift right B (bit7=0)
F435 : D7 11      stab	$11     ;store B in addr 11
F437 : A6 01      ldaa	$01,x   ;load A with value at addr X + 01
F439 : 16				  tab           ;transfer A to B (A unchanged
F43A : 54				  lsrb          ;logic shift right B (bit7=0)
F43B : 54				  lsrb          ;logic shift right B (bit7=0)
F43C : 54				  lsrb          ;logic shift right B (bit7=0)
F43D : 54				  lsrb          ;logic shift right B (bit7=0)
F43E : D7 13      stab	$13     ;store B in addr 13
F440 : 84 0F      anda	#$0F    ;and A with value 0Fh
F442 : 97 0F      staa	$0F     ;store A in addr 0F
F444 : DF 09      stx	$09       ;store X in addr 09
F446 : CE F6 72   ldx	#$F672    ;load X with F672h (wavetable fdb)
;PRM31 LF449:
F449 : 7A 00 0F   dec	$000F     ;decr value in addr 000F
F44C : 2B 08      bmi	LF456     ;branch N=1 (negative) PRM32 
F44E : A6 00      ldaa	$00,x   ;load A with value at addr X + 00h
F450 : 4C				  inca          ;incr A
F451 : BD F5 C3   jsr	LF5C3     ;jump sub CALCOS
F454 : 20 F3      bra	LF449     ;branch always
;PRM32 LF456:
F456 : DF 16      stx	$16       ;store X in addr 16
F458 : BD F5 13   jsr	LF513     ;jump sub PARAM
F45B : DE 09      ldx	$09       ;load X with value at addr 09
F45D : A6 02      ldaa	$02,x   ;load A with value at addr X + 02h
F45F : 97 18      staa	$18     ;store A in addr 18
F461 : BD F5 25   jsr	LF525     ;jump sub PARAM
F464 : DE 09      ldx	$09       ;load X with value at addr 09
F466 : A6 03      ldaa	$03,x   ;load A with value at addr X + 03h
F468 : 97 14      staa	$14     ;store A in addr 14
F46A : A6 04      ldaa	$04,x   ;load A with value at addr X + 04h
F46C : 97 15      staa	$15     ;store A in addr 15
F46E : A6 05      ldaa	$05,x   ;load A with value at addr X + 05h
F470 : 16				  tab           ;transfer A to B (A unchanged
F471 : A6 06      ldaa	$06,x   ;load A with value at addr X + 06h
F473 : CE F8 7C   ldx	#$F87C    ;load X with F87Ch (wavetable fdb)
F476 : BD F5 C3   jsr	LF5C3     ;jump sub CALCOS
F479 : 17				  tba           ;transfer B to A (B unchanged)
F47A : DF 19      stx	$19       ;store X in addr 19
F47C : 7F 00 21   clr	$0021     ;clear (00) addr 21
F47F : BD F5 C3   jsr	LF5C3     ;jump sub CALCOS
F482 : DF 1B      stx	$1B       ;store X in addr 1B
F484 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH11 (similar to ROM1 SYNTH9)
;*************************************;
F485 : 96 11		  ldaa	$11     ;load A in addr 11
F487 : 97 20		  staa	$20     ;store A in addr 20
;SYN111 LF489:
F489 : DE 19		  ldx	$19       ;load X with value at addr 19
F48B : DF 0B		  stx	$0B       ;store X in addr 0B
;SYN112 LF48D:
F48D : DE 0B		  ldx	$0B       ;load X with value at addr 0B
F48F : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
F491 : 9B 21		  adda	$21     ;add A with value at addr 21
F493 : 97 1F		  staa	$1F     ;store A in addr 1F
F495 : 9C 1B		  cpx	$1B       ;compare X with value at addr 1B
F497 : 27 26		  beq	LF4BF7    ;branch Z=1 PARAM
F499 : D6 12		  ldab	$12     ;load B with value at addr 12
F49B : 08         inx           ;incr X
F49C : DF 0B		  stx	$0B       ;store X in addr 0B
;SYN113 LF49E:
F49E : CE 00 22   ldx	#$0022    ;load X with value 0022h
;SYN114 LF4A1:
F4A1 : 96 1F		  ldaa	$1F     ;load A with value at addr 1F
;SYN115 LF4A3:
F4A3 : 4A         deca          ;decr A
F4A4 : 26 FD		  bne	LF4A3     ;branch Z=0 SYN115
F4A6 : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
F4A8 : B7 04 00   staa	$0400   ;store A in DAC output SOUND
F4AB : 08         inx           ;incr X
F4AC : 9C 1D		  cpx	$1D       ;compare X with value at addr 1D
F4AE : 26 F1		  bne	LF4A1     ;branch Z=0 SYN114
F4B0 : 5A		"Z"		decb          ;decr B
F4B1 : 27 DA		  beq	LF48D     ;branch Z=1 SYN112
F4B3 : 08				  inx           ;incr X 4 cycles
F4B4 : 09				  dex           ;decr X 4 cycles
F4B5 : 08				  inx           ;incr X 4 cycles
F4B6 : 09				  dex           ;decr X 4 cycles
F4B7 : 08				  inx           ;incr X 4 cycles
F4B8 : 09				  dex           ;decr X 4 cycles
F4B9 : 08				  inx           ;incr X 4 cycles
F4BA : 09				  dex           ;decr X 4 cycles
F4BB : 01				  nop           ;2 cycles
F4BC : 01				  nop           ;2 cycles
F4BD : 20 DF		  bra	LF49E     ;branch always SYN113
;*************************************;
;PARAM4 (similar to ROM1 PARAM14)
;*************************************;
F4BF : 96 13		  ldaa	$13     ;load A with value at addr 13
F4C1 : 8D 62		  bsr	LF525     ;branch sub PARAM
F4C3 : 7A 00 20   dec	$0020     ;decr value at addr 0020
F4C6 : 26 C1		  bne	LF489     ;branch Z=0 SYN111
F4C8 : 96 03		  ldaa	$03     ;load A with value at addr 03
F4CA : 26 46		  bne	LF512     ;branch Z=0 PARAM below rts
;LF4CC:
F4CC : 96 14		  ldaa	$14     ;load A with value at addr 14
F4CE : 27 42		  beq	LF512     ;branch Z=1 PARAM below rts
F4D0 : 7A 00 15   dec	$0015     ;decr value at addr 0015
F4D3 : 27 3D		  beq	LF512     ;branch Z=1 PARAM below rts
F4D5 : 9B 21		  adda	$21     ;add A with value at addr 21
;LF4D7:
F4D7 : 97 21		  staa	$21     ;store A in addr 21
;LF4D9:
F4D9 : DE 19		  ldx	$19       ;load X with value at addr 19
F4DB : 5F				  clrb          ;clear B (00)
;LF4DC:
F4DC : 96 21		  ldaa	$21     ;load A with value at addr 21
F4DE : 7D 00 14   tst	$0014     ;test (if 14 MSB is 1s) and set N,Z
F4E1 : 2B 06		  bmi	LF4E9     ;branch N=1 below
F4E3 : AB 00		  adda	$00,x   ;add A with value at addr X + 00h
F4E5 : 25 08		  bcs	LF4EF     ;branch C=1 below
F4E7 : 20 0B		  bra	LF4F4     ;branch always below
;LF4E9:
F4E9 : AB 00		  adda	$00,x   ;add A with value at addr X + 00h
F4EB : 27 02		  beq	LF4EF     ;branch Z=1 below
F4ED : 25 05		  bcs	LF4F4     ;branch C=1 below
;LF4EF:
F4EF : 5D				  tstb          ;test B and set N,Z
F4F0 : 27 08		  beq	LF4FA     ;branch Z=1 below
F4F2 : 20 0F		  bra	LF503     ;branch always below
;LF4F4:
F4F4 : 5D				  tstb          ;test B and set N,Z
F4F5 : 26 03		  bne	LF4FA     ;branch Z=0 below
F4F7 : DF 19		  stx	$19       ;store X in addr 19
F4F9 : 5C				  incb          ;incr B
;LF4FA:
F4FA : 08				  inx           ;incr X
F4FB : 9C 1B		  cpx	$1B       ;compare X with value at addr 1B
F4FD : 26 DD		  bne	LF4DC     ;branch Z=0 above
F4FF : 5D				  tstb          ;test B and set N,Z
F500 : 26 01		  bne	LF503     ;branch Z=0 below
F502 : 39				  rts           ;return subroutine
;*************************************;
;PRMSYN11 (similar to ROM1 PARAM17)
;*************************************;
F503 : DF 1B		  stx	$1B       ;store X in addr 1B
F505 : 96 13		  ldaa	$13     ;load A with value at addr 13
F507 : 27 06		  beq	LF50F     ;branch Z=1 below
F509 : 8D 08		  bsr	LF513     ;branch sub below
F50B : 96 18		  ldaa	$18     ;load A with value at addr 18
F50D : 8D 16		  bsr	LF525     ;branch sub below
;LF50F:
F50F : 7E F4 85   jmp	LF485     ;jump SYNTH11
;LF512:
F512 : 39				  rts           ;return subroutine
;*************************************;
;PARAM5 (similar to ROM1 PARAM18)
;*************************************;
F513 : CE 00 22   ldx	#$0022    ;load X with value 0022h
F516 : DF 0D		  stx	$0D       ;store X in addr 0D
F518 : DE 16		  ldx	$16       ;load X with value at addr 16
F51A : E6 00		  ldab	$00,x   ;load B with value at addr X + 00h
F51C : 08		      inx           ;incr X
F51D : BD F3 A8   jsr	LF3A8     ;jump sub UTIL1
F520 : DE 0D		  ldx	$0D       ;load X with value at addr 0B
F522 : DF 1D		  stx	$1D
F524 : 39				  rts           ;return subroutine
;*************************************;
;PARAM6 (similar to ROM1 PARAM19)
;*************************************;
F525 : 4D				  tsta          ;test A and set N,Z
F526 : 27 2B		  beq	LF553     ;branch Z=1 PRM191
F528 : DE 16		  ldx	$16       ;load X with value at addr 16
F52A : DF 0B		  stx	$0B       ;store X in addr 0B
F52C : CE 00 22   ldx	#$0022    ;load X with value 0022h
F52F : 97 10		  staa	$10     ;store A in addr 10
;LF531:
F531 : DF 0D		  stx	$0D       ;store X in addr 0D
F533 : DE 0B		  ldx	$0B       ;load X with value in addr 0B
F535 : D6 10		  ldab	$10     ;load B with vlaue in addr 10
F537 : D7 0F		  stab	$0F     ;store B in addr 0F
F539 : E6 01		  ldab	$01,x   ;load B with value in addr X + 01h
F53B : 54				  lsrb          ;logic shift right B (bit7=0)
F53C : 54				  lsrb          ;logic shift right B (bit7=0)
F53D : 54				  lsrb          ;logic shift right B (bit7=0)
F53E : 54				  lsrb          ;logic shift right B (bit7=0)
F53F : 08				  inx           ;incr X
F540 : DF 0B		  stx	$0B       ;store X in addr 0B
F542 : DE 0D		  ldx	$0D       ;load X with value at addr 0D
F544 : A6 00		  ldaa	$00,x   ;load A with value at addr X + 00h
;LF546:
F546 : 10				  sba           ;A = A - B (B unchanged)
F547 : 7A 00 0F   dec	$000F     ;decr value in addr 000F
F54A : 26 FA		  bne	LF546     ;branch Z=0
F54C : A7 00		  staa	$00,x   ;store A in addr X + 00h
F54E : 08				  inx           ;incr X
F54F : 9C 1D		  cpx	$1D       ;compare X with value at addr 1D
F551 : 26 DE		  bne	LF531     ;branch Z=0 PRM191
;LF553:
F553 : 39				  rts           ;return subroutine
;*************************************;
;IRQ
;*************************************; 
F554 : 8E 00 7F   lds	#$007F    ;load SP with value 007Fh
F557 : B6 04 02   ldaa	$0402   ;load A with value at addr 0402 (PIA sound select)
F55A : 0E				  cli           ;clear interrupt I=0
F55B : 43				  coma          ;complement 1s A
F55C : 84 3F      anda	#$3F    ;and A with value 3Fh
F55E : 5F         clrb          ;clear B
F55F : 81 0E      cmpa	#$0E    ;compare A with value 0Eh
F561 : 27 02      beq	LF565     ;branch Z=1 IRQ1
F563 : D7 02      stab	$02     ;store B in addr 02
;IRQ1 LF565:
F565 : 81 12      cmpa	#$12    ;compare A with value 12h
F567 : 27 02      beq	LF56B     ;branch Z=1 IRQ2 
F569 : D7 03      stab	$03     ;store B in addr 03
;IRQ2 LF56B:
F56B : 4D				  tsta          ;test A
F56C : 27 42      beq	LF5B0     ;branch Z=1 IRQ10
F56E : 4A				  deca          ;decr A
F56F : 81 1F      cmpa	#$1F    ;compare A with value 1Fh
F571 : 2D 17      blt	LF58A     ;branch N+V=1 IRQ5
F573 : 81 2A      cmpa	#$2A    ;compare A with value 2Ah
F575 : 22 04      bhi	LF57B     ;branch C=0 and Z=0 IRQ3
F577 : 80 10      suba	#$10    ;subtract A with value 10h
F579 : 20 13      bra	LF58E     ;branch always IRQ6
;IRQ3 LF57B:
F57B : 81 31      cmpa	#$31    ;compare A with value 31h
F57D : 22 07      bhi	LF586     ;branch C=0 and Z=0 IRQ4
F57F : 80 2B      suba	#$2B    ;subtract A with value 2Bh
F581 : BD FD 8F   jsr	LFD8F     ;jump sub way below
F584 : 20 2A      bra	LF5B0     ;branch always IRQ10
;IRQ4 LF586:
F586 : 80 23      suba	#$23    ;subtract A with value 23h   
F588 : 20 12      bra	LF59C     ;branch always IRQ8
;IRQ5 LF58A:
F58A : 81 0C      cmpa	#$0C    ;compare A with value 0Ch
F58C : 22 08      bhi	LF596     ;branch C=0 and Z=0 IRQ7
;IRQ6 LF58E:
F58E : BD F4 1F   jsr	LF41F     ;jump sub PARAM above
F591 : BD F4 85   jsr	LF485     ;jump sub SYNTH above
F594 : 20 1A      bra	LF5B0     ;branch always IRQ10
;IRQ7 LF596:
F596 : 81 1B      cmpa	#$1B    ;compare A with value 1Bh
F598 : 22 0E      bhi	LF5A8     ;branch C=0 and Z=0 IRQ9
F59A : 80 0D      suba	#$0D    ;subtract A with value 0Dh
;IRQ8 LF59C:
F59C : 48				  asla          ;arith shift left A (bit0 is 0)
F59D : CE F5 EB   ldx	#$F5EB    ;load X with value F5EBh (vector jump tables below)
F5A0 : 8D 21      bsr	LF5C3     ;branch sub CALCOS
F5A2 : EE 00      ldx	$00,x     ;load X with value X +00h
F5A4 : AD 00      jsr	$00,x     ;jump sub addr X + 00h (from vector jump table)
F5A6 : 20 08      bra	LF5B0     ;branch always IRQ10
;IRQ9 LF5A8:
F5A8 : 80 1C      suba	#$1C    ;subtract A from value 1Ch
F5AA : BD F0 CA   jsr	LF0CA     ;jump sub PARAM1
F5AD : BD F0 DF   jsr	LF0DF     ;jump sub SYNTH3
;IRQ10 LF5B0:
F5B0 : 96 00      ldaa	$00     ;load A with value in addr 00
F5B2 : 9A 01      oraa	$01     ;OR A with value in addr 01
;IRQ11 LF5B4:
F5B4 : 27 FE      beq	LF5B4     ;branch Z=1 IRQ11
F5B6 : 4F				  clra          ;clear A (00)
F5B7 : 97 03      staa	$03     ;store A in addr 03
F5B9 : 96 00      ldaa	$00     ;load A with value in addr 00
F5BB : 27 03      beq	LF5C0     ;branch Z=1 IRQ12
F5BD : 7E F1 CC   jmp	LF1CC     ;jump PRMSYN6
;IRQ12 LF5C0:
F5C0 : 7E F3 D4   jmp	LF3D4     ;jump PARAM above
;*************************************;
;CALCOS
;*************************************;
F5C3 : DF 0B      stx	$0B       ;store X in addr 0B
F5C5 : 9B 0C      adda	$0C     ;add A with value in 0C
F5C7 : 97 0C      staa	$0C     ;store A in addr 0C
F5C9 : 24 03      bcc	LF5CE     ;branch C=0 CAL1
F5CB : 7C 00 0B   inc	$000B     ;incr value in addr 000B
;CAL1 LF5CE:
F5CE : DE 0B      ldx	$0B       ;load X with value in 0B
F5D0 : 39				  rts           ;return subroutine
;*************************************;
;NMI
;*************************************; 
F5D1 : 0F		      sei           ;set interrupt mask I=1
F5D2 : 8E 00 7F   lds	#$007F    ;load SP with 007Fh
F5D5 : CE FF FF   ldx	#$FFFF    ;load X with FFFFh
F5D8 : 5F		      clrb          ;clear B
;NMI1 LF5D9:
F5D9 : EB 00      addb	$00,x   ;add B with value in addr X = 00h
F5DB : 09		      dex           ;decr X
F5DC : 8C F0 00   cpx	#$F000    ;comp X with F000h (ROM start addr) 
F5DF : 26 F8      bne	LF5D9     ;branch if Z=0 NMI1
F5E1 : E1 00      cmpb	$00,x   ;comp B with addr X + 00h
F5E3 : 27 01      beq	LF5E6     ;branch if Z=1 NMI2
F5E5 : 3E		      wai           ;wait interrupt, CCodes to Stack, PC+1 and halt
;NMI2 LF5E6:
F5E6 : BD F2 0D   jsr	LF20D     ;jump sub SYNTH above
F5E9 : 20 E6      bra	LF5D1     ;branch always NMI
;*************************************;
;vector jump tables below
;*************************************;
F5EB : F3 E7                    ;called by IRQ8
F5ED : F1 CC                    ; 
F5EF : F3 C4                    ; 
F5F1 : F1 36                    ;
F5F3 : F4 0F                    ; 
F5F5 : F3 BC                    ; 
F5F7 : F1 79                    ;
F5F9 : F1 3E                    ;
F5FB : F1 D5                    ; 
F5FD : F1 DA                    ; 
F5FF : F2 96                    ; 
F601 : F2 C4                    ; 
F603 : F2 E3                    ;
F605 : F1 75                    ; 
F607 : FE 8A                    ; 
F609 : FF 3B                    ;
F60B : FF 6A                    ; 
F60D : FF	54                    ;
F60F : FF 80                    ; 
F611 : FE FF                    ; 
F613 : F1 88                    ;	
F615 : F0 46                    ; 
F617 : F1	2C                    ; 
F619 : F0 65                    ;
F61B : F1 DF                    ; 
F61D : F3 34                    ;
F61F : F2 0D                    ; 
F621 : F1 E4                    ; 
;*************************************;
;called by PARAM1
;*************************************;
;LF623
F623 : 40		" @"		andb	$40,x
F624 : 01		" "		nop
				;
F625 : 00		" "		db	$00
				;
F626 : 10		" "		sba
F627 : E1 00		"  "		cmpb	$00,x
F629 : 80 FF		"  "		suba	#$FF
F62B : FF 28 01		" ( "		stx	X2801
				;
F62E : 00		" "		db	$00
				;
F62F : 08		" "		inx
F630 : 81 02		"  "		cmpa	#$02
				;
F632 : 00		" "		db	$00
				;
F633 : FF FF 28		"  ("		stx	XFF28
F636 : 81 00		"  "		cmpa	#$00
				;
F638 : FC		" "		db	$FC
				;
F639 : 01		" "		nop
				;
F63A : 02 00 FC		"   "		db	$02, $00, $FC
				;
F63D : FF FF 01		"   "		stx	XFF01
				;
F640 : 00 18 41 04	"  A "		db	$00, $18, $41, $04
				;
F644 : 80 00		"  "		suba	#$00
F646 : FF 00 FF		"   "		stx	X00FF
F649 : 08		" "		inx
F64A : FF 68 04		" h "		stx	X6804
F64D : 80 00		"  "		suba	#$00
F64F : FF 28 81		" ( "		stx	X2881
				;
F652 : 00 FC		"  "		db	$00, $FC
				;
F654 : 01		" "		nop
				;
F655 : 02 00 FC		"   "		db	$02, $00, $FC
				;
F658 : FF 60 01		" ` "		stx	X6001
F65B : 57		"W"		asrb
F65C : 08		" "		inx
F65D : E1 02		"  "		cmpb	$02,x
				;
F65F : 00		" "		db	$00
				;
F660 : FE 80 8C		"   "		ldx	X808C
				;
F663 : 5B		"["		db	$5B
				;
F664 : B6 40 BF		" @ "		ldaa	X40BF
F667 : 49		"I"		rola
F668 : A4 73		" s"		anda	$73,x
F66A : 73 A4 49		"s I"		com	XA449
F66D : BF 40 B6		" @ "		sts	X40B6
				;
F670 : 5B		"["		db	$5B
F671 : 8C 
;*************************************;
;wavetable FDB
;*************************************;
F672 : 08 7F		"   "		cpx	#$087F
F674 : D9 FF		"  "		adcb	X00FF
F676 : D9 7F		"  "		adcb	X007F
F678 : 24 00		"$ "		bcc	LF67A
F67A				LF67A:
F67A : 24 08		"$ "		bcc	LF684
				;
F67C : 00		" "		db	$00
				;
F67D : 40		"@"		nega
F67E : 80 00		"  "		suba	#$00
F680 : FF 00 80		"   "		stx	X0080
F683 : 40		"@"		nega
F684				LF684:
F684 : 10		" "		sba
F685 : 7F B0 D9		"   "		clr	XB0D9
F688 : F5 FF F5		"   "		bitb	XFFF5
F68B : D9 B0		"  "		adcb	X00B0
F68D : 7F 4E 24		" N$"		clr	X4E24
F690 : 09		" "		dex
				;
F691 : 00		" "		db	$00
				;
F692 : 09		" "		dex
F693 : 24 4E		"$N"		bcc	LF6E3
F695 : 10		" "		sba
F696 : 7F C5 EC		"   "		clr	XC5EC
F699 : E7 BF		"  "		stab	$BF,x
F69B : 8D 6D		" m"		bsr	LF70A
F69D : 6A 7F		"j "		dec	$7F,x
F69F : 94 92		"  "		anda	X0092
				;
F6A1 : 71		"q"		db	$71
				;
F6A2 : 40		"@"		nega
F6A3 : 17		" "		tba
				;
F6A4 : 12		" "		db	$12
				;
F6A5 : 39		"9"		rts
				;
F6A6 : 10		" "		sba
F6A7 : FF FF FF		"   "		stx	XFFFF
F6AA : FF 00 00		"   "		stx	X0000
				;
F6AD : 00 00		"  "		db	$00, $00
				;
F6AF : FF FF FF		"   "		stx	XFFFF
F6B2 : FF 00 00		"   "		stx	X0000
				;
F6B5 : 00 00		"  "		db	$00, $00
				;
F6B7 : 48		"H"		asla
F6B8 : 8A 95		"  "		oraa	#$95
F6BA : A0 AB		"  "		suba	$AB,x
F6BC : B5 BF C8		"   "		bita	XBFC8
F6BF : D1 DA		"  "		cmpb	X00DA
F6C1 : E1 E8		"  "		cmpb	$E8,x
F6C3 : EE F3		"  "		ldx	$F3,x
F6C5 : F7 FB FD		"   "		stab	XFBFD
F6C8 : FE FF FE		"   "		ldx	XFFFE
				;
F6CB : FD		" "		db	$FD
				;
F6CC : FB F7 F3		"   "		addb	XF7F3
F6CF : EE E8		"  "		ldx	$E8,x
F6D1 : E1 DA		"  "		cmpb	$DA,x
F6D3 : D1 C8		"  "		cmpb	X00C8
F6D5 : BF B5 AB		"   "		sts	XB5AB
F6D8 : A0 95		"  "		suba	$95,x
F6DA : 8A 7F		"  "		oraa	#$7F
				;
F6DC : 75		"u"		db	$75
				;
F6DD : 6A 5F		"j_"		dec	$5F,x
F6DF : 54		"T"		lsrb
F6E0 : 4A		"J"		deca
F6E1 : 40		"@"		nega
F6E2 : 37		"7"		pshb
F6E3				LF6E3:
F6E3 : 2E 25		".%"		bgt	LF70A
				;
F6E5 : 1E		" "		db	$1E
				;
F6E6 : 17		" "		tba
F6E7 : 11		" "		cba
F6E8 : 0C		" "		clc
F6E9 : 08		" "		inx
				;
F6EA : 04 02		"  "		db	$04, $02
				;
F6EC : 01		" "		nop
				;
F6ED : 00		" "		db	$00
				;
F6EE : 01		" "		nop
				;
F6EF : 02 04		"  "		db	$02, $04
				;
F6F1 : 08		" "		inx
F6F2 : 0C		" "		clc
F6F3 : 11		" "		cba
F6F4 : 17		" "		tba
				;
F6F5 : 1E		" "		db	$1E
				;
F6F6 : 25 2E		"%."		bcs	LF726
F6F8 : 37		"7"		pshb
F6F9 : 40		"@"		nega
F6FA : 4A		"J"		deca
F6FB : 54		"T"		lsrb
F6FC : 5F		"_"		clrb
F6FD : 6A 75		"ju"		dec	$75,x
F6FF : 7F 10 59		"  Y"		clr	X1059
				;
F702 : 7B		"{"		db	$7B
				;
F703 : 98 AC		"  "		eora	X00AC
				;
F705 : B3		" "		db	$B3
				;
F706 : AC 98		"  "		cpx	$98,x
				;
F708 : 7B		"{"		db	$7B
				;
F709 : 59		"Y"		rolb
F70A				LF70A:
F70A : 37		"7"		pshb
F70B : 19		" "		daa
F70C : 06		" "		tap
				;
F70D : 00		" "		db	$00
				;
F70E : 06		" "		tap
F70F : 19		" "		daa
F710 : 37		"7"		pshb
F711 : 08		" "		inx
F712 : FF FF FF		"   "		stx	XFFFF
F715 : FF 00 00		"   "		stx	X0000
				;
F718 : 00 00		"  "		db	$00, $00
				;
F71A : 10		" "		sba
F71B : 76 FF B8		"v  "		ror	XFFB8
F71E : D0 9D		"  "		subb	X009D
F720 : E6 6A		" j"		ldab	$6A,x
F722 : 82 76		" v"		sbca	#$76
F724 : EA 81		"  "		orab	$81,x
F726				LF726:
F726 : 86 4E		" N"		ldaa	#$4E
F728 : 9C 32		" 2"		cpx	X0032
F72A : 63 10		"c "		com	$10,x
				;
F72C : 00		" "		db	$00
				;
F72D : F4 00 E8		"   "		andb	X00E8
				;
F730 : 00 DC 00		"   "		db	$00, $DC, $00
				;
F733 : E2 00		"  "		sbcb	$00,x
				;
F735 : DC 00		"  "		db	$DC, $00
				;
F737 : E8 00		"  "		eorb	$00,x
F739 : F4 00 00		"   "		andb	X0000
F73C : 48		"H"		asla
				;
F73D : 45 4B		"EK"		db	$45, $4B
				;
F73F : 50		"P"		negb
F740 : 56		"V"		rorb
				;
F741 : 5B		"["		db	$5B
				;
F742 : 60 64		"`d"		neg	$64,x
F744 : 69 6D		"im"		rol	$6D,x
				;
F746 : 71		"q"		db	$71
				;
F747 : 74 77 7A		"twz"		lsr	X777A
F74A : 7C 7E 7F		"|~ "		inc	X7E7F
F74D : 7F 80 7F		"   "		clr	X807F
F750 : 7F 7E 7C		" ~|"		clr	X7E7C
F753 : 7A 77 74		"zwt"		dec	X7774
				;
F756 : 71		"q"		db	$71
				;
F757 : 6D 69		"mi"		tst	$69,x
F759 : 64 60		"d`"		lsr	$60,x
				;
F75B : 5B		"["		db	$5B
				;
F75C : 56		"V"		rorb
F75D : 50		"P"		negb
				;
F75E : 4B 45		"KE"		db	$4B, $45
				;
F760 : 40		"@"		nega
F761 : 3B		";"		rti
				;
F762 : 35		"5"		txs
F763 : 30		"0"		tsx
F764 : 2A 25		"*%"		bpl	LF78B
F766 : 20 1C		"  "		bra	LF784
				;
F768 : 17		" "		tba
				;
F769 : 13		" "		db	$13
				;
F76A : 0F		" "		sei
F76B : 0C		" "		clc
F76C : 09		" "		dex
F76D : 06		" "		tap
				;
F76E : 04 02		"  "		db	$04, $02
				;
F770 : 01		" "		nop
F771 : 01		" "		nop
				;
F772 : 00		" "		db	$00
				;
F773 : 01		" "		nop
F774 : 01		" "		nop
				;
F775 : 02 04		"  "		db	$02, $04
				;
F777 : 06		" "		tap
F778 : 09		" "		dex
F779 : 0C		" "		clc
F77A : 0F		" "		sei
				;
F77B : 13		" "		db	$13
				;
F77C : 17		" "		tba
				;
F77D : 1C		" "		db	$1C
				;
F77E : 20 25		" %"		bra	LF7A5
				;
F780 : 2A 30		"*0"		bpl	LF7B2
F782 : 35		"5"		txs
F783 : 3B		";"		rti
				;
F784				LF784:
F784 : 40		"@"		nega
F785 : 0C		" "		clc
				;
F786 : 00		" "		db	$00
				;
F787 : 50		"P"		negb
F788 : 60 B0		"` "		neg	$B0,x
F78A : 20 20		"  "		bra	LF7AC
				;
F78C : F0 90 80		"   "		subb	X9080
F78F : C0 50		" P"		subb	#$50
F791 : 70 07 40		"p @"		neg	X0740
F794 : 09		" "		dex
F795 : 35		"5"		txs
F796 : 0C		" "		clc
F797 : 29 0F		") "		bvs	LF7A8
F799 : 20 24		" $"		bra	LF7BF
				;
F79B : 7F B0 D6		"   "		clr	XB0D6
F79E : E8 E3		"  "		eorb	$E3,x
F7A0 : C9 A3		"  "		adcb	#$A3
				;
F7A2 : 7B 5E		"{^"		db	$7B, $5E
				;
F7A4 : 54		"T"		lsrb
				;
F7A5				LF7A5:
F7A5 : 5E 7B A3		"^{ "		db	$5E, $7B, $A3
				;
F7A8				LF7A8:
F7A8 : C9 E3		"  "		adcb	#$E3
F7AA : E8 D6		"  "		eorb	$D6,x
F7AC				LF7AC:
F7AC : B0 7F 4C		"  L"		suba	X7F4C
F7AF : 26 14		"& "		bne	LF7C5
F7B1 : 19		" "		daa
F7B2				LF7B2:
F7B2 : 33		"3"		pulb
F7B3 : 5A		"Z"		decb
F7B4 : 81 9E		"  "		cmpa	#$9E
F7B6 : A8 9E		"  "		eora	$9E,x
F7B8 : 81 5A		" Z"		cmpa	#$5A
F7BA : 33		"3"		pulb
F7BB : 19		" "		daa
				;
F7BC : 14		" "		db	$14
				;
F7BD : 26 4C		"&L"		bne	LF80B
;*************************************;
;wavetable FDB
;*************************************;
;LF7BF:
F7BF : 81 24		" $"		cmpa	#$24
				;
F7C1 : 00 00 00		"   "		db	$00, $00, $00
				;
F7C4 : 16		" "		tab
F7C5				LF7C5:
F7C5 : 31		"1"		ins
				;
F7C6 : 12 05 1A		"   "		db	$12, $05, $1A
				;
F7C9 : FF 00 27		"  '"		stx	X0027
F7CC : 6D 11		"m "		tst	$11,x
				;
F7CE : 05		" "		db	$05
				;
F7CF : 11		" "		cba
F7D0 : 01		" "		nop
F7D1 : 0F		" "		sei
F7D2 : 01		" "		nop
F7D3 : 47		"G"		asra
F7D4 : 11		" "		cba
F7D5 : 31		"1"		ins
				;
F7D6 : 00		" "		db	$00
				;
F7D7 : 01		" "		nop
				;
F7D8 : 00		" "		db	$00
				;
F7D9 : 0D		" "		sec
F7DA : 1B		" "		aba
F7DB : F1 18 00		"   "		cmpb	X1800
F7DE : 01		" "		nop
F7DF : 01		" "		nop
F7E0 : 08		" "		inx
F7E1 : FB 41 45		" AE"		addb	X4145
				;
F7E4 : 00 00 00		"   "		db	$00, $00, $00
				;
F7E7 : 0F		" "		sei
				;
F7E8 : 5B 21		"[!"		db	$5B, $21
				;
F7EA : 35		"5"		txs
F7EB : 11		" "		cba
F7EC : FF 00 0D		"   "		stx	X000D
F7EF : 1B		" "		aba
F7F0 : 46		"F"		rora
F7F1 : 59		"Y"		rolb
				;
F7F2 : 00		" "		db	$00
F7F3				XF7F3:
F7F3 : 00 00		"  "		db	$00, $00
				;
F7F5 : 08		" "		inx
F7F6 : 85 31		" 1"		bita	#$31
F7F8 : 11		" "		cba
				;
F7F9 : 00		" "		db	$00
				;
F7FA : 01		" "		nop
				;
F7FB : 00 03		"  "		db	$00, $03
				;
F7FD : 6A 63		"jc"		dec	$63,x
F7FF : 25 00		"% "		bcs	LF801
				;
F801				LF801:
F801 : 03		" "		db	$03
				;
F802 : 0A		" "		clv
				;
F803 : 03		" "		db	$03
				;
F804 : 6A 43		"jC"		dec	$43,x
F806 : 0D		" "		sec
				;
F807 : 00 04 02		"   "		db	$00, $04, $02
				;
F80A : 0D		" "		sec
F80B				LF80B:
F80B : 1B		" "		aba
F80C : 08		" "		inx
F80D : 4C		"L"		inca
F80E : 0B		" "		sev
F80F : 40		"@"		nega
F810 : 01		" "		nop
				;
F811 : 02 F3 1F 12	"    "		db	$02, $F3, $1F, $12
F815 : 00		" "		db	$00
				;
F816 : FF 10 04		"   "		stx	X1004
F819 : 69 F1		"i "		rol	$F1,x
F81B : 11		" "		cba
				;
F81C : 00		" "		db	$00
				;
F81D : FF 00 0D		"   "		stx	X000D
				;
F820 : 00 12		"  "		db	$00, $12
				;
F822 : 06		" "		tap
				;
F823 : 00		" "		db	$00
				;
F824 : FF 01 09		"   "		stx	X0109
F827 : 28 14		"( "		bvc	LF83D
F829 : 17		" "		tba
				;
F82A : 00 00 00		"   "		db	$00, $00, $00
				;
F82D : 0E		" "		cli
F82E : 0D		" "		sec
F82F : F4 11 00		"   "		andb	X1100
				;
F832 : 00 00		"  "		db	$00, $00
				;
F834 : 0E		" "		cli
F835 : 0D		" "		sec
				;
F836 : 21		"!"		db	$21
				;
F837 : 30		"0"		tsx
				;
F838 : 00		" "		db	$00
				;
F839 : 01		" "		nop
				;
F83A : 00		" "		db	$00
				;
F83B : 0D		" "		sec
F83C : 1B		" "		aba
F83D				LF83D:
F83D : 11		" "		cba
F83E : 0B		" "		sev
F83F : 06		" "		tap
				;
F840 : 02		" "		db	$02
				;
F841 : 20 03		"  "		bra	LF846
				;
F843 : EF F4		"  "		stx	$F4,x
				;
F845 : 18 00 00 00	"    "		db	$18, $00, $00, $00
F849 : 12 B3 52		"  R"		db	$12, $B3, $52
				;
F84C : 32		"2"		pula
				;
F84D : 12 00 00		"   "		db	$12, $00, $00
				;
F850 : 10		" "		sba
F851 : DF 1F		"  "		stx	X001F
				;
F853 : 14 02 00 00	"    "		db	$14, $02, $00, $00
F857 : 05		" "		db	$05
				;
F858 : F6 21 30		" !0"		ldab	X2130
				;
F85B : 00		" "		db	$00
				;
F85C : FF 00 1B		"   "		stx	X001B
F85F : 0D		" "		sec
F860 : F1 19 00		"   "		cmpb	X1900
				;
F863 : 00 00		"  "		db	$00, $00
				;
F865 : 0E		" "		cli
F866 : A4 31		" 1"		anda	$31,x
F868 : 19		" "		daa
				;
F869 : 00		" "		db	$00
				;
F86A : 01		" "		nop
				;
F86B : 00 03		"  "		db	$00, $03
				;
F86D : 6A 41		"jA"		dec	$41,x
				;
F86F : 02		" "		db	$02
				;
F870 : D0 00		"  "		subb	X0000
				;
F872 : 00		" "		db	$00
				;
F873 : 27 6D		"'m"		beq	LF8E2
				;
F875 : 03 15		"  "		db	$03, $15
				;
F877 : 11		" "		cba
F878 : FF 00 0D		"   "		stx	X000D
F87B : 1B		" "		aba
;*************************************;
;wavetable FDB
;*************************************;
F87C : A0 98		"  "		suba	$98,x
F87E : 90 88		"  "		suba	X0088
F880 : 80 78		" x"		suba	#$78
F882 : 70 68 60		"ph`"		neg	X6860
F885 : 58		"X"		aslb
F886 : 50		"P"		negb
F887 : 44		"D"		lsra
F888 : 40		"@"		nega
F889 : 01		" "		nop
F88A : 01		" "		nop
				;
F88B : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
F88F : 08		" "		inx
F890 : 08		" "		inx
F891 : 10		" "		sba
F892 : 10		" "		sba
F893 : 30		"0"		tsx
F894 : 60 C0		"` "		neg	$C0,x
F896 : E0 01		"  "		subb	$01,x
F898 : 01		" "		nop
				;
F899 : 02 02 03 04	"    "		db	$02, $02, $03, $04
F89D : 05		" "		db	$05
				;
F89E : 06		" "		tap
F89F : 07		" "		tpa
F8A0 : 08		" "		inx
F8A1 : 09		" "		dex
F8A2 : 0A		" "		clv
F8A3 : 0C		" "		clc
F8A4 : 80 7C		" |"		suba	#$7C
F8A6 : 78 74 70		"xtp"		asl	X7470
F8A9 : 74 78 7C		"tx|"		lsr	X787C
F8AC : 80 01		"  "		suba	#$01
F8AE : 01		" "		nop
				;
F8AF : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
F8B3 : 08		" "		inx
F8B4 : 08		" "		inx
F8B5 : 10		" "		sba
F8B6 : 20 28		" ("		bra	LF8E0
				;
F8B8 : 30		"0"		tsx
				;
F8B9 : 38		"8"		db	$38
				;
F8BA : 40		"@"		nega
F8BB : 48		"H"		asla
F8BC : 50		"P"		negb
F8BD : 60 70		"`p"		neg	$70,x
F8BF : 80 A0		"  "		suba	#$A0
F8C1 : B0 C0 08		"   "		suba	XC008
F8C4 : 40		"@"		nega
F8C5 : 08		" "		inx
F8C6 : 40		"@"		nega
F8C7 : 08		" "		inx
F8C8 : 40		"@"		nega
F8C9 : 08		" "		inx
F8CA : 40		"@"		nega
F8CB : 08		" "		inx
F8CC : 40		"@"		nega
F8CD : 08		" "		inx
F8CE : 40		"@"		nega
F8CF : 08		" "		inx
F8D0 : 40		"@"		nega
F8D1 : 08		" "		inx
F8D2 : 40		"@"		nega
F8D3 : 08		" "		inx
F8D4 : 40		"@"		nega
F8D5 : 08		" "		inx
F8D6 : 40		"@"		nega
F8D7 : 01		" "		nop
				;
F8D8 : 02 04		"  "		db	$02, $04
				;
F8DA : 08		" "		inx
F8DB : 09		" "		dex
F8DC : 0A		" "		clv
F8DD : 0B		" "		sev
F8DE : 0C		" "		clc
F8DF : 0E		" "		cli
F8E0				LF8E0:
F8E0 : 0F		" "		sei
F8E1 : 10		" "		sba
				;
F8E2				LF8E2:
F8E2 : 12 14		"  "		db	$12, $14
				;
F8E4 : 16		" "		tab
F8E5 : 40		"@"		nega
F8E6 : 10		" "		sba
F8E7 : 08		" "		inx
F8E8 : 01		" "		nop
F8E9 : 01		" "		nop
F8EA : 01		" "		nop
F8EB : 01		" "		nop
F8EC : 01		" "		nop
				;
F8ED : 02 02 03 03	"    "		db	$02, $02, $03, $03
F8F1 : 04 04 05		"   "		db	$04, $04, $05
				;
F8F4 : 06		" "		tap
F8F5 : 08		" "		inx
F8F6 : 0A		" "		clv
F8F7 : 0C		" "		clc
F8F8 : 10		" "		sba
				;
F8F9 : 14 18		"  "		db	$14, $18
				;
F8FB : 20 30		" 0"		bra	LF92D
				;
F8FD : 40		"@"		nega
F8FE : 50		"P"		negb
F8FF : 40		"@"		nega
F900 : 30		"0"		tsx
F901 : 20 10		"  "		bra	LF913
				;
F903 : 0C		" "		clc
F904 : 0A		" "		clv
F905 : 08		" "		inx
F906 : 07		" "		tpa
F907 : 06		" "		tap
				;
F908 : 05 04 03 02	"    "		db	$05, $04, $03, $02
F90C : 02		" "		db	$02
				;
F90D : 01		" "		nop
F90E : 01		" "		nop
F90F : 01		" "		nop
F910 : 07		" "		tpa
F911 : 08		" "		inx
F912 : 09		" "		dex
F913				LF913:
F913 : 0A		" "		clv
F914 : 0C		" "		clc
F915 : 08		" "		inx
F916 : 17		" "		tba
				;
F917 : 18		" "		db	$18
				;
F918 : 19		" "		daa
				;
F919 : 1A		" "		db	$1A
				;
F91A : 1B		" "		aba
				;
F91B : 1C 00 00 00	"    "		db	$1C, $00, $00, $00
F91F : 00		" "		db	$00
				;
F920 : 08		" "		inx
F921 : 80 10		"  "		suba	#$10
F923 : 78 18 70		"x p"		asl	X1870
F926 : 20 60		" `"		bra	LF988
				;
F928 : 28 58		"(X"		bvc	LF982
F92A : 30		"0"		tsx
F92B : 50		"P"		negb
F92C : 40		"@"		nega
F92D				LF92D:
F92D : 48		"H"		asla
				;
F92E : 00		" "		db	$00
				;
F92F : 01		" "		nop
F930 : 08		" "		inx
F931 : 10		" "		sba
F932 : 01		" "		nop
F933 : 08		" "		inx
F934 : 10		" "		sba
F935 : 01		" "		nop
F936 : 08		" "		inx
F937 : 10		" "		sba
F938 : 01		" "		nop
F939 : 08		" "		inx
F93A : 10		" "		sba
F93B : 01		" "		nop
F93C : 08		" "		inx
F93D : 10		" "		sba
F93E : 01		" "		nop
F93F : 08		" "		inx
F940 : 10		" "		sba
				;
F941 : 00		" "		db	$00
				;
F942 : 10		" "		sba
F943 : 20 40		" @"		bra	LF985
				;
F945 : 10		" "		sba
F946 : 20 40		" @"		bra	LF988
				;
F948 : 10		" "		sba
F949 : 20 40		" @"		bra	LF98B
				;
F94B : 10		" "		sba
F94C : 20 40		" @"		bra	LF98E
				;
F94E : 10		" "		sba
F94F : 20 40		" @"		bra	LF991
				;
F951 : 10		" "		sba
F952 : 20 40		" @"		bra	LF994
				;
F954 : 10		" "		sba
F955 : 20 40		" @"		bra	LF997
				;
F957 : 10		" "		sba
F958 : 20 40		" @"		bra	LF99A
				;
F95A : 00		" "		db	$00
				;
F95B : 01		" "		nop
				;
F95C : 02 02 03 03	"    "		db	$02, $02, $03, $03
F960 : 03		" "		db	$03
				;
F961 : 06		" "		tap
F962 : 06		" "		tap
F963 : 06		" "		tap
F964 : 06		" "		tap
F965 : 0F		" "		sei
				;
F966 : 1F		" "		db	$1F
				;
F967 : 36		"6"		psha
				;
F968 : 55		"U"		db	$55
				;
F969 : 74 91 01		"t  "		lsr	X9101
				;
F96C : 02 03 04		"   "		db	$02, $03, $04
				;
F96F : 26 03		"& "		bne	LF974
				;
F971 : 04 05 05 05	"    "		db	$04, $05, $05, $05
F975 : 05 05		"  "		db	$05, $05
				;
F977 : FF 01 00		"   "		stx	X0100
				;
F97A : 18 41 04		" A "		db	$18, $41, $04
				;
F97D : 80 00		"  "		suba	#$00
;*************************************;
;SYNTH12
;*************************************;
;LF97F:
F97F : C0 0D      subb	#$0D
F981 : 37				  pshb          ;push B into stack then SP - 1
;LF982:
F982 : BD 00 2C   jsr	L002C
;LF985:
F985 : 33				  pulb          ;SP + 1 pull stack into B
;SYN121 LF986:
F986 : C1 14      cmpb	#$14
;LF988:
F988 : 22 F5      bhi	LF97F
F98A : 01				  nop
;LF98B:
F98B : 96 24      ldaa	X0024
F98D : 9B 21      adda	X0021
F98F : 97 24      staa	X0024
;LF991:
F991 : C9 F6      adcb	#$F6
;LF993:
F993 : 5A				  decb
;LF994:
F994 : 2A FD      bpl	LF993
F996 : 96 28      ldaa	X0028
F998 : 4C				  inca
F999 : 84 0F      anda	#$0F
F99B : 8A 10      oraa	#$10
F99D : 97 28      staa	X0028
F99F : DE 27      ldx	X0027
F9A1 : E6 00      ldab	$00,x
F9A3 : F7 04 00   stab	$0400   ;store B in DAC output SOUND
F9A6 : 84 0F      anda	#$0F
F9A8 : 39				  rts           ;return subroutine
;*************************************;
;PARAM7
;*************************************;
;LF9A9:
F9A9 : 4F         clra
F9AA : CE 00 10   ldx	#$0010
F9AD : C6 61      ldab	#$61
;LF9AF:
F9AF : A7 00		"  "		staa	$00,x
F9B1 : 08		" "		inx
F9B2 : 5A		"Z"		decb
F9B3 : 26 FA		"& "		bne	LF9AF
F9B5 : C6 5F		" _"		ldab	#$5F
F9B7 : D7 26		" &"		stab	X0026
F9B9 : C6 37		" 7"		ldab	#$37
F9BB : D7 30		" 0"		stab	X0030
F9BD : C6 7E		" ~"		ldab	#$7E
F9BF : D7 2C		" ,"		stab	X002C
F9C1 : CE FB 94		"   "		ldx	#$FB94
F9C4 : DF 2D		" -"		stx	X002D
F9C6 : D6 0C		"  "		ldab	X000C
F9C8 : D7 23		" #"		stab	X0023
;LF9CA:
F9CA : C0 03		"  "		subb	#$03
;LF9CC:
F9CC : BD F9 86		"   "		jsr	LF986
F9CF : 08		" "		inx
;LF9D0:
F9D0 : D6 23		" #"		ldab	X0023
F9D2 : C0 02		"  "		subb	#$02
F9D4 : BD F9 7F		"   "		jsr	LF97F
F9D7 : 26 F7		"& "		bne	LF9D0
F9D9 : D6 20		"  "		ldab	X0020
F9DB : 96 21		" !"		ldaa	X0021
F9DD : 9B 0D		"  "		adda	X000D
F9DF : D9 0C		"  "		adcb	X000C
F9E1 : 97 0D		"  "		staa	X000D
F9E3 : D7 0C		"  "		stab	X000C
F9E5 : DB 22		" ""		addb	X0022
F9E7 : 86 19		"  "		ldaa	#$19
F9E9 : 11		" "		cba
F9EA : 24 01		"$ "		bcc	LF9ED
F9EC : 81 16		"  "		cmpa	#$16
F9EE : D7 23		" #"		stab	X0023
F9F0 : 01		" "		nop
F9F1 : C0 09		"  "		subb	#$09
F9F3 : BD F9 86		"   "		jsr	LF986
F9F6 : 96 2F		" /"		ldaa	X002F
F9F8 : 16		" "		tab
F9F9 : 48		"H"		asla
F9FA : C9 00		"  "		adcb	#$00
;XF9FC:
F9FC : D7 2F		" /"		stab	X002F
F9FE : D6 23		" #"		ldab	X0023
FA00 : C0 05		"  "		subb	#$05
FA02 : 96 25		" %"		ldaa	X0025
FA04 : 2A 06		"* "		bpl	LFA0C
FA06 : 7C 00 25		"| %"		inc	X0025
FA09 : 01		" "		nop
FA0A : 20 BE		"  "		bra	LF9CA
;*************************************;
;
;*************************************;
;LFA0C:
FA0C : 5A		"Z"		decb
FA0D : BD F9 86		"   "		jsr	LF986
FA10 : DE 0A		"  "		ldx	X000A
FA12 : A6 00		"  "		ldaa	$00,x
FA14 : 2A 12		"* "		bpl	LFA28
FA16 : 81 80		"  "		cmpa	#$80
FA18 : 27 5F		"'_"		beq	LFA79
FA1A : 4C		"L"		inca
FA1B : 97 25		" %"		staa	X0025
FA1D : 08		" "		inx
FA1E : FF 00 0A		"   "		stx	X000A
FA21 : D6 23		" #"		ldab	X0023
FA23 : C0 06		"  "		subb	#$06
FA25 : 7E F9 CA		"~  "		jmp	LF9CA
;LFA28:
FA28 : 08		" "		inx
FA29 : E6 00		"  "		ldab	$00,x
FA2B : 37		"7"		pshb
FA2C : 08		" "		inx
FA2D : DF 0A		"  "		stx	X000A
FA2F : 97 29		" )"		staa	X0029
FA31 : 84 70		" p"		anda	#$70
FA33 : 44		"D"		lsra
FA34 : 44		"D"		lsra
FA35 : 44		"D"		lsra
FA36 : 5F		"_"		clrb
FA37 : 8B 0D		"  "		adda	#$0D
FA39 : C9 FB		"  "		adcb	#$FB
FA3B : 97 2B		" +"		staa	X002B
FA3D : D7 2A		" *"		stab	X002A
FA3F : D6 23		" #"		ldab	X0023
FA41 : D6 23		" #"		ldab	X0023
FA43 : C0 0D		"  "		subb	#$0D
FA45 : BD F9 86		"   "		jsr	LF986
FA48 : 5F		"_"		clrb
FA49 : DE 2A		" *"		ldx	X002A
FA4B : EE 00		"  "		ldx	$00,x
FA4D : 6E 00		"n "		jmp	$00,x						;INFO: index jump
				;
FA4F : 96 29		" )"		ldaa	X0029
FA51 : 47		"G"		asra
FA52 : C2 00		"  "		sbcb	#$00
FA54 : D4 0C		"  "		andb	X000C
FA56 : 32		"2"		pula
FA57 : 10		" "		sba
FA58 : 9B 0C		"  "		adda	X000C
FA5A : 97 0C		"  "		staa	X000C
FA5C : 08		" "		inx
;LFA5D:
FA5D : D6 23		" #"		ldab	X0023
FA5F : C0 0A		"  "		subb	#$0A
FA61 : 7E F9 CC		"~  "		jmp	LF9CC
				;
FA64 : 96 29		" )"		ldaa	X0029
;XFA66:
FA66 : 47		"G"		asra
FA67 : C2 00		"  "		sbcb	#$00
FA69 : D4 22		" ""		andb	X0022
FA6B : 32		"2"		pula
FA6C : 10		" "		sba
FA6D : 9B 22		" ""		adda	X0022
FA6F : 97 22		" ""		staa	X0022
FA71 : 20 EA		"  "		bra	LFA5D
				;
FA73 : 32		"2"		pula
FA74 : DE 0A		"  "		ldx	X000A
FA76 : 09		" "		dex
FA77 : 6E 00		"n "		jmp	$00,x						;INFO: index jump
;LFA79:
FA79 : 96 26		" &"		ldaa	X0026
FA7B : 81 5F		" _"		cmpa	#$5F
FA7D : 2B 01		"+ "		bmi	LFA80
FA7F : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFA80:
FA80 : D6 23		" #"		ldab	X0023
FA82 : C0 07		"  "		subb	#$07
FA84 : BD F9 86		"   "		jsr	LF986
FA87 : DE 25		" %"		ldx	X0025
FA89 : 6A 02		"j "		dec	$02,x
FA8B : 2B 12		"+ "		bmi	LFA9F
FA8D : EE 00		"  "		ldx	$00,x
FA8F : A6 00		"  "		ldaa	$00,x
FA91 : 36		"6"		psha
FA92 : 08		" "		inx
FA93 : DF 0A		"  "		stx	X000A
FA95 : F6 00 23		"  #"		ldab	X0023
FA98 : C0 09		"  "		subb	#$09
FA9A : BD F9 86		"   "		jsr	LF986
FA9D : 20 55		" U"		bra	LFAF4
				;
FA9F				LFA9F:
FA9F : EE 00		"  "		ldx	$00,x
FAA1 : 08		" "		inx
FAA2 : DF 0A		"  "		stx	X000A
FAA4 : 96 26		" &"		ldaa	X0026
FAA6 : 8B 03		"  "		adda	#$03
FAA8 : 97 26		" &"		staa	X0026
FAAA : D6 23		" #"		ldab	X0023
FAAC : C0 07		"  "		subb	#$07
FAAE : 01		" "		nop
FAAF : 7E F9 CA		"~  "		jmp	LF9CA
				;
FAB2				XFAB2:
FAB2 : 08		" "		inx
FAB3 : 20 04		"  "		bra	LFAB9
				;
FAB5 : D7 20		"  "		stab	X0020
FAB7 : D7 21		" !"		stab	X0021
FAB9				LFAB9:
FAB9 : D6 29		" )"		ldab	X0029
FABB : C4 0F		"  "		andb	#$0F
FABD : CB F8		"  "		addb	#$F8
FABF : C8 F8		"  "		eorb	#$F8
FAC1 : 32		"2"		pula
FAC2 : 9B 21		" !"		adda	X0021
FAC4 : D9 20		"  "		adcb	X0020
FAC6 : 97 21		" !"		staa	X0021
FAC8 : D7 20		"  "		stab	X0020
FACA : F6 00 23		"  #"		ldab	X0023
FACD : C0 09		"  "		subb	#$09
FACF : 7E F9 CA		"~  "		jmp	LF9CA
				;
FAD2				XFAD2:
FAD2 : 96 26		" &"		ldaa	X0026
FAD4 : 80 03		"  "		suba	#$03
FAD6 : 97 26		" &"		staa	X0026
FAD8 : DE 25		" %"		ldx	X0025
FADA : 96 0B		"  "		ldaa	X000B
FADC : D6 0A		"  "		ldab	X000A
FADE : 8B FF		"  "		adda	#$FF
FAE0 : C9 FF		"  "		adcb	#$FF
FAE2 : E7 00		"  "		stab	$00,x
FAE4 : A7 01		"  "		staa	$01,x
FAE6 : D6 29		" )"		ldab	X0029
FAE8 : C4 0F		"  "		andb	#$0F
FAEA : E7 02		"  "		stab	$02,x
FAEC : D6 23		" #"		ldab	X0023
FAEE : C0 0C		"  "		subb	#$0C
FAF0 : BD F9 86		"   "		jsr	LF986
FAF3 : 08		" "		inx
FAF4				LFAF4:
FAF4 : 08		" "		inx
FAF5 : 08		" "		inx
FAF6 : 5F		"_"		clrb
FAF7 : 01		" "		nop
FAF8 : 32		"2"		pula
FAF9 : 47		"G"		asra
FAFA : 49		"I"		rola
FAFB : C2 00		"  "		sbcb	#$00
FAFD : 9B 0B		"  "		adda	X000B
FAFF : D9 0A		"  "		adcb	X000A
FB01 : 97 0B		"  "		staa	X000B
FB03 : F7 00 0A		"   "		stab	X000A
FB06 : D6 23		" #"		ldab	X0023
FB08 : C0 07		"  "		subb	#$07
FB0A : 7E F9 CA		"~  "		jmp	LF9CA
				;
FB0D : FA 4F FA		" O "		orab	X4FFA
FB10 : 64 FA		"d "		lsr	$FA,x
FB12 : B5 FA B2		"   "		bita	XFAB2
FB15 : FA 4F FA		" O "		orab	X4FFA
FB18 : 73 FA D2		"s  "		com	XFAD2
FB1B : FA F8 FC		"   "		orab	XF8FC
FB1E : 91 FD		"  "		cmpa	X00FD
				;
FB20 : 1A		" "		db	$1A
				;
FB21 : FB C9 FC		"   "		addb	XC9FC
FB24 : C2 FB		"  "		sbcb	#$FB
FB26 : 44		"D"		lsra
				;
FB27 : FC D3		"  "		db	$FC, $D3
				;
FB29 : FB 6F FC		" o "		addb	X6FFC
FB2C : 06		" "		tap
FB2D : DE 2F		" /"		ldx	X002F
FB2F : EE 03		"  "		ldx	$03,x
FB31 : 08		" "		inx
FB32 : DF 08		"  "		stx	X0008
FB34 : BD FC 00		"   "		jsr	LFC00
FB37 : 08		" "		inx
FB38 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFB39:
FB39 : EE 00		"  "		ldx	$00,x
FB3B : DF 08		"  "		stx	X0008
FB3D : CE FC 06		"   "		ldx	#$FC06
FB40 : DF 2D		" -"		stx	X002D
FB42 : 01		" "		nop
FB43 : 39		"9"		rts
				;
FB44 : 96 30		" 0"		ldaa	X0030
FB46 : 81 37		" 7"		cmpa	#$37
FB48 : 23 12		"# "		bls	LFB5C
FB4A : DE 2F		" /"		ldx	X002F
FB4C : 6A 02		"j "		dec	$02,x
FB4E : 2A E9		"* "		bpl	LFB39
FB50 : 80 03		"  "		suba	#$03
FB52 : 97 30		" 0"		staa	X0030
FB54 : CE FB 2D		"  -"		ldx	#$FB2D
FB57 : DF 2D		" -"		stx	X002D
FB59 : 6D 00		"m "		tst	$00,x
FB5B : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFB5C:
FB5C : CE FB 64		"  d"		ldx	#$FB64
FB5F : DF 2D		" -"		stx	X002D
FB61 : 01		" "		nop
FB62 : 20 05		"  "		bra	LFB69
				;
FB64 : 08		" "		inx
FB65 : 08		" "		inx
FB66 : 01		" "		nop
FB67				LFB67:
FB67 : 8D 05		"  "		bsr	LFB6E
FB69				LFB69:
FB69 : 8D 03		"  "		bsr	LFB6E
FB6B				LFB6B:
FB6B : 6D 00		"m "		tst	$00,x
FB6D : 01		" "		nop
FB6E				LFB6E:
FB6E : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FB6F : DE 2F		" /"		ldx	X002F
FB71 : 96 08		"  "		ldaa	X0008
FB73 : A7 03		"  "		staa	$03,x
FB75 : 96 09		"  "		ldaa	X0009
FB77 : A7 04		"  "		staa	$04,x
FB79 : 96 39		" 9"		ldaa	X0039
FB7B : 84 0F		"  "		anda	#$0F
FB7D : A7 05		"  "		staa	$05,x
FB7F : 08		" "		inx
FB80 : CE FB 86		"   "		ldx	#$FB86
FB83 : DF 2D		" -"		stx	X002D
FB85 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FB86 : 96 30		" 0"		ldaa	X0030
FB88 : 8B 03		"  "		adda	#$03
FB8A : 97 30		" 0"		staa	X0030
FB8C : CE FC 06		"   "		ldx	#$FC06
FB8F : DF 2D		" -"		stx	X002D
FB91 : 01		" "		nop
FB92 : 20 D5		"  "		bra	LFB69
				;
FB94 : 7D 00 2F		"} /"		tst	X002F
FB97 : 26 CE		"& "		bne	LFB67
FB99 : DE 08		"  "		ldx	X0008
FB9B : A6 00		"  "		ldaa	$00,x
FB9D : 08		" "		inx
FB9E : DF 08		"  "		stx	X0008
FBA0 : 97 39		" 9"		staa	X0039
FBA2 : 2A 05		"* "		bpl	LFBA9
FBA4 : 97 2F		" /"		staa	X002F
FBA6 : A6 00		"  "		ldaa	$00,x
FBA8 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFBA9:
FBA9 : CE FB B0		"   "		ldx	#$FBB0
FBAC : FF 00 2D		"  -"		stx	X002D
FBAF : 39		"9"		rts
				;
FBB0 : 5F		"_"		clrb
FBB1 : 96 39		" 9"		ldaa	X0039
FBB3 : 84 70		" p"		anda	#$70
FBB5 : 44		"D"		lsra
FBB6 : 44		"D"		lsra
FBB7 : 44		"D"		lsra
FBB8 : 8B 1D		"  "		adda	#$1D
FBBA : C9 FB		"  "		adcb	#$FB
FBBC : D7 37		" 7"		stab	X0037
FBBE : 97 38		" 8"		staa	X0038
FBC0 : DE 37		" 7"		ldx	X0037
FBC2 : EE 00		"  "		ldx	$00,x
FBC4 : DF 2D		" -"		stx	X002D
FBC6 : DF 2D		" -"		stx	X002D
FBC8 : 39		"9"		rts
				;
FBC9 : 96 39		" 9"		ldaa	X0039
FBCB : 84 0F		"  "		anda	#$0F
FBCD : 4C		"L"		inca
FBCE : 4C		"L"		inca
FBCF : 97 2F		" /"		staa	X002F
FBD1 : 20 1D		"  "		bra	LFBF0
				;
FBD3 : 7C 00 32		"| 2"		inc	X0032
FBD6 : DE 31		" 1"		ldx	X0031
FBD8 : 8C 00 68		"  h"		cpx	#$0068
FBDB : 27 13		"' "		beq	LFBF0
FBDD : A6 00		"  "		ldaa	$00,x
FBDF : CE FC 1A		"   "		ldx	#$FC1A
FBE2 : 97 35		" 5"		staa	X0035
FBE4 : 27 03		"' "		beq	LFBE9
FBE6 : 7E FB EC		"~  "		jmp	LFBEC
				;
FBE9				LFBE9:
FBE9 : CE FB D3		"   "		ldx	#$FBD3
FBEC				LFBEC:
FBEC : DF 2D		" -"		stx	X002D
FBEE : 08		" "		inx
FBEF : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFBF0:
FBF0 : 86 5E		" ^"		ldaa	#$5E
FBF2 : B7 00 32		"  2"		staa	X0032
FBF5 : CE FB D3		"   "		ldx	#$FBD3
FBF8 : 7A 00 2F		"z /"		dec	X002F
FBFB : 27 03		"' "		beq	LFC00
FBFD				XFBFD:
FBFD : 7E FC 03		"~  "		jmp	LFC03
				;
FC00				LFC00:
FC00 : CE FB 94		"   "		ldx	#$FB94
FC03				LFC03:
FC03 : DF 2D		" -"		stx	X002D
FC05 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FC06 : DE 08		"  "		ldx	X0008
FC08 : 5F		"_"		clrb
FC09 : A6 00		"  "		ldaa	$00,x
FC0B : 4C		"L"		inca
FC0C : 47		"G"		asra
FC0D : 49		"I"		rola
FC0E : C2 00		"  "		sbcb	#$00
FC10 : 9B 09		"  "		adda	X0009
FC12 : D9 08		"  "		adcb	X0008
FC14 : 97 09		"  "		staa	X0009
FC16 : D7 08		"  "		stab	X0008
FC18 : 20 E6		"  "		bra	LFC00
				;
FC1A : 96 32		" 2"		ldaa	X0032
FC1C : 80 5F		" _"		suba	#$5F
FC1E : 48		"H"		asla
FC1F : 5F		"_"		clrb
FC20 : 9B 0F		"  "		adda	X000F
FC22 : D9 0E		"  "		adcb	X000E
FC24 : D7 37		" 7"		stab	X0037
FC26 : 97 38		" 8"		staa	X0038
FC28 : 86 80		"  "		ldaa	#$80
FC2A : 97 36		" 6"		staa	X0036
FC2C : CE FC 37		"  7"		ldx	#$FC37
FC2F : DF 2D		" -"		stx	X002D
FC31 : CE 00 10		"   "		ldx	#$0010
FC34 : DF 33		" 3"		stx	X0033
FC36 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FC37 : DE 37		" 7"		ldx	X0037
FC39 : EE 00		"  "		ldx	$00,x
FC3B : DF 37		" 7"		stx	X0037
FC3D : CE FC 4C		"  L"		ldx	#$FC4C
FC40 : DF 2D		" -"		stx	X002D
FC42 : DE 31		" 1"		ldx	X0031
FC44 : A6 09		"  "		ldaa	$09,x
FC46 : 9B 35		" 5"		adda	X0035
FC48 : A7 09		"  "		staa	$09,x
FC4A : 08		" "		inx
FC4B : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FC4C : 96 36		" 6"		ldaa	X0036
FC4E : 27 1D		"' "		beq	LFC6D
FC50 : 74 00 36		"t 6"		lsr	X0036
FC53 : DE 33		" 3"		ldx	X0033
FC55 : E6 00		"  "		ldab	$00,x
FC57 : 94 37		" 7"		anda	X0037
FC59 : 26 09		"& "		bne	LFC64
FC5B : FB 00 35		"  5"		addb	X0035
FC5E : E7 00		"  "		stab	$00,x
FC60 : 7C 00 34		"| 4"		inc	X0034
FC63 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFC64:
FC64 : F0 00 35		"  5"		subb	X0035
FC67 : E7 00		"  "		stab	$00,x
FC69 : 7C 00 34		"| 4"		inc	X0034
FC6C : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFC6D:
FC6D : D6 34		" 4"		ldab	X0034
FC6F : C1 20		"  "		cmpb	#$20
FC71 : 27 0B		"' "		beq	LFC7E
FC73 : D6 38		" 8"		ldab	X0038
FC75 : D7 37		" 7"		stab	X0037
FC77 : C6 80		"  "		ldab	#$80
FC79 : F7 00 36		"  6"		stab	X0036
FC7C : 20 0F		"  "		bra	LFC8D
;
;LFC7E:
FC7E : CE FB 94		"   "		ldx	#$FB94
FC81 : D6 2F		" /"		ldab	X002F
FC83 : 26 03		"& "		bne	LFC88
FC85 : 7E FC 8B		"~  "		jmp	LFC8B
;LFC88:
FC88 : CE FB D3		"   "		ldx	#$FBD3
;LFC8B:
FC8B : DF 2D		" -"		stx	X002D
;LFC8D:
FC8D : 6D 00		"m "		tst	$00,x
FC8F : 08		" "		inx
FC90 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FC91 : 96 39		" 9"		ldaa	X0039
FC93 : 84 07		"  "		anda	#$07
FC95 : 8B 60		" `"		adda	#$60
FC97 : 97 32		" 2"		staa	X0032
FC99 : DE 08		"  "		ldx	X0008
FC9B : A6 00		"  "		ldaa	$00,x
FC9D : 08		" "		inx
FC9E : DF 08		"  "		stx	X0008
FCA0 : 97 35		" 5"		staa	X0035
FCA2 : CE FC A9		"   "		ldx	#$FCA9
FCA5 : DF 2D		" -"		stx	X002D
FCA7 : 08		" "		inx
FCA8 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FCA9 : DE 31		" 1"		ldx	X0031
FCAB : 5F		"_"		clrb
FCAC : 96 39		" 9"		ldaa	X0039
FCAE : 8B F8		"  "		adda	#$F8
FCB0 : C2 00		"  "		sbcb	#$00
FCB2 : E4 09		"  "		andb	$09,x
FCB4 : 50		"P"		negb
FCB5 : DB 35		" 5"		addb	X0035
FCB7				LFCB7:
FCB7 : D7 35		" 5"		stab	X0035
FCB9 : CE FC 1A		"   "		ldx	#$FC1A
FCBC : DF 2D		" -"		stx	X002D
FCBE : 08		" "		inx
FCBF : 08		" "		inx
FCC0 : 01		" "		nop
FCC1 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FCC2 : D6 39		" 9"		ldab	X0039
FCC4 : 54		"T"		lsrb
FCC5 : C4 07		"  "		andb	#$07
FCC7 : CA 60		" `"		orab	#$60
FCC9 : D7 32		" 2"		stab	X0032
FCCB : C6 FF		"  "		ldab	#$FF
FCCD : C9 00		"  "		adcb	#$00
FCCF : C9 00		"  "		adcb	#$00
FCD1 : 20 E4		"  "		bra	LFCB7
				;
FCD3 : 96 39		" 9"		ldaa	X0039
FCD5 : 47		"G"		asra
FCD6 : 25 13		"% "		bcs	LFCEB
FCD8 : CE 00 00		"   "		ldx	#$0000
FCDB : DF 60		" `"		stx	X0060
FCDD : DF 62		" b"		stx	X0062
FCDF : DF 64		" d"		stx	X0064
FCE1 : DF 66		" f"		stx	X0066
FCE3 : 08		" "		inx
FCE4 : CE FB 94		"   "		ldx	#$FB94
FCE7 : FF 00 2D		"  -"		stx	X002D
FCEA : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFCEB:
FCEB : 85 02		"  "		bita	#$02
FCED : 26 0C		"& "		bne	LFCFB
FCEF : C6 5F		" _"		ldab	#$5F
FCF1 : D7 32		" 2"		stab	X0032
FCF3 : CE FD 00		"   "		ldx	#$FD00
FCF6				LFCF6:
FCF6 : DF 2D		" -"		stx	X002D
FCF8 : 7E FB 6B		"~ k"		jmp	LFB6B
				;
FCFB				LFCFB:
FCFB : FE 00 08		"   "		ldx	X0008
FCFE : 20 F6		"  "		bra	LFCF6
				;
FD00 : 5F		"_"		clrb
FD01 : 96 39		" 9"		ldaa	X0039
FD03 : 8B AE		"  "		adda	#$AE
FD05 : C2 00		"  "		sbcb	#$00
FD07 : D4 68		" h"		andb	X0068
FD09 : DE 08		"  "		ldx	X0008
FD0B : A6 00		"  "		ldaa	$00,x
FD0D : 08		" "		inx
FD0E : DF 08		"  "		stx	X0008
FD10 : 10		" "		sba
FD11 : 97 35		" 5"		staa	X0035
FD13 : CE FC 1A		"   "		ldx	#$FC1A
FD16 : FF 00 2D		"  -"		stx	X002D
FD19 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FD1A : C6 60		" `"		ldab	#$60
FD1C : D7 32		" 2"		stab	X0032
FD1E : DE 08		"  "		ldx	X0008
FD20 : E6 00		"  "		ldab	$00,x
FD22 : D7 37		" 7"		stab	X0037
FD24 : 08		" "		inx
FD25 : DF 08		"  "		stx	X0008
FD27 : D6 39		" 9"		ldab	X0039
FD29 : 54		"T"		lsrb
FD2A : 24 18		"$ "		bcc	LFD44
FD2C : CE FD 5E		"  ^"		ldx	#$FD5E
FD2F : DF 2D		" -"		stx	X002D
FD31 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FD32 : 5F		"_"		clrb
FD33 : 96 38		" 8"		ldaa	X0038
FD35 : 47		"G"		asra
FD36 : C2 00		"  "		sbcb	#$00
FD38 : DE 31		" 1"		ldx	X0031
FD3A : E4 00		"  "		andb	$00,x
FD3C : 1B		" "		aba
FD3D : A7 00		"  "		staa	$00,x
FD3F : 7C 00 32		"| 2"		inc	X0032
FD42 : A6 00		"  "		ldaa	$00,x
FD44				LFD44:
FD44 : CE FD 4A		"  J"		ldx	#$FD4A
FD47 : DF 2D		" -"		stx	X002D
FD49 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FD4A : 78 00 37		"x 7"		asl	X0037
FD4D : 25 13		"% "		bcs	LFD62
FD4F : 27 06		"' "		beq	LFD57
FD51 : 7C 00 32		"| 2"		inc	X0032
FD54 : 7E FB 69		"~ i"		jmp	LFB69
;LFD57:
FD57 : BD FC 00		"   "		jsr	LFC00
FD5A : 6D 00		"m "		tst	$00,x
FD5C : 01		" "		nop
FD5D : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FD5E : 7A 00 32		"z 2"		dec	X0032
FD61 : 08		" "		inx
FD62				LFD62:
FD62 : A6 00		"  "		ldaa	$00,x
FD64 : DE 08		"  "		ldx	X0008
FD66 : A6 00		"  "		ldaa	$00,x
FD68 : 08		" "		inx
FD69 : DF 08		"  "		stx	X0008
FD6B : 97 38		" 8"		staa	X0038
FD6D : CE FD 32		"  2"		ldx	#$FD32
FD70 : DF 2D		" -"		stx	X002D
FD72 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FD73 : FE 26 FE		" & "		ldx	X26FE
FD76 : 6A FD		"j "		dec	$FD,x
				;
FD78 : C7		" "		db	$C7
				;
FD79 : FE 58 FD		" X "		ldx	X58FD
				;
FD7C : C7		" "		db	$C7
				;
FD7D : FE 70 FE		" p "		ldx	X70FE
FD80 : 01		" "		nop
FD81 : FE 70 FE		" p "		ldx	X70FE
FD84 : 0A		" "		clv
FD85 : FE 58 FE		" X "		ldx	X58FE
FD88 : 0A		" "		clv
FD89 : FE 5C FE		" \ "		ldx	X5CFE
FD8C : 0A		" "		clv
FD8D : FE 70
;*************************************;
;
;*************************************; 
; called by IRQ3 jsr
FD8F : 5F         clrb          ;clear B
FD90 : D7 0D      stab	$0D     ;store B in addr 0D
FD92 : 48         asla          ;arith shift left A (bit0 is 0) 
FD93 : 48         asla          ;arith shift left A (bit0 is 0) 
FD94 : 8B 73      adda	#$73    ;add A with value 73h
FD96 : C9 FD      adcb	#$FD    ;A = A + C + value FDh
FD98 : D7 0A      stab	$0A     ;store B in addr 0A
FD9A : 97 0B      staa	$0B     ;store A in addr 0B
FD9C : DE 0A      ldx	$0A       ;load X with value in addr 0A
FD9E : EE 00      ldx	$00,x     ;load X with value in X + 00h
FDA0 : DF 08      stx	$08       ;store X in addr 08
FDA2 : DE 0A      ldx	$0A       ;load X with value in addr 0A
FDA4 : EE 02      ldx	$02,x     ;load X with value in addr X + 02
FDA6 : E6 00      ldab	$00,x   ;load B with value in addr X + 00h
FDA8 : D7 0C      stab	$0C     ;store B in addr 0C
FDAA : 08         inx           ;incr X
FDAB : DF 0A      stx	$0A       ;store X in addr 0A
FDAD : CE FD B5   ldx	#$FDB5    ;load X with value FDB5h (FDB table below)
FDB0 : DF 0E      stx	$0E       ;store X in addr 0E
FDB2 : 7E F9 A9   jmp	LF9A9     ;jump 
;*************************************;
;FDB tables
;*************************************; 
FDB5 : 00 00 55 55	"  UU"		db	$00, $00, $55, $55
				;
FDB9 : AA 55		" U"		oraa	$55,x
FDBB : 5A		"Z"		decb
FDBC : 5A		"Z"		decb
FDBD : 96 69		" i"		ldaa	X0069
FDBF : 66 66		"ff"		ror	$66,x
				;
FDC1 : CC		" "		db	$CC
				;
FDC2 : 33		"3"		pulb
				;
FDC3 : 3C 3C		"<<"		db	$3C, $3C
				;
FDC5 : 0F		" "		sei
FDC6 : F0 53 80		" S "		subb	X5380
FDC9 : 10		" "		sba
FDCA : 8B 08		"  "		adda	#$08
FDCC : 06		" "		tap
				;
FDCD : 04 02		"  "		db	$04, $02
				;
FDCF : 69 28		"i("		rol	$28,x
FDD1 : 10		" "		sba
FDD2 : 80 F8		"  "		suba	#$F8
				;
FDD4 : 62		"b"		db	$62
				;
FDD5 : 23 10		"# "		bls	LFDE7
FDD7 : 88 00		"  "		eora	#$00
FDD9 : FA 63 1D		" c "		orab	X631D
FDDC : 10		" "		sba
FDDD : 88 FC		"  "		eora	#$FC
				;
FDDF : 00		" "		db	$00
				;
FDE0 : 63 17		"c "		com	$17,x
FDE2 : 10		" "		sba
FDE3 : 0B		" "		sev
				;
FDE4 : FC FC		"  "		db	$FC, $FC
				;
FDE6 : FE 69 10		" i "		ldx	X6910
FDE9 : 10		" "		sba
FDEA : 8A 00		"  "		oraa	#$00
FDEC : FE FA 66		"  f"		ldx	XFA66
FDEF : 09		" "		dex
				;
FDF0 : 3C		"<"		db	$3C
				;
FDF1 : 07		" "		tpa
				;
FDF2 : FC		" "		db	$FC
				;
FDF3 : 70 2D FF		"p- "		neg	X2DFF
FDF6 : FF FF FF		"   "		stx	XFFFF
FDF9 : FF FF FF		"   "		stx	XFFFF
FDFC : FF FF FF		"   "		stx	XFFFF
FDFF : 20 40		" @"		bra	LFE41
				;
FE01 : 10		" "		sba
FE02 : 0F		" "		sei
				;
FE03 : 02		" "		db	$02
				;
FE04 : FE 02 FE		"   "		ldx	X02FE
FE07 : 2F 70		"/p"		ble	LFE79
				;
FE09 : FD		" "		db	$FD
				;
FE0A : 0F		" "		sei
FE0B : 28 10		"( "		bvc	LFE1D
FE0D : 74 02 02		"t  "		lsr	X0202
				;
FE10 : 02 02		"  "		db	$02, $02
				;
FE12 : 2F 10		"/ "		ble	LFE24
FE14				LFE14:
FE14 : 24 FE		"$ "		bcc	LFE14
FE16 : FE 2F 10		" / "		ldx	X2F10
FE19 : 50		"P"		negb
FE1A : FE FE 2F		"  /"		ldx	XFE2F
FE1D				LFE1D:
FE1D : 10		" "		sba
FE1E : 24 02		"$ "		bcc	LFE22
				;
FE20 : 02		" "		db	$02
				;
FE21 : 2F 55		"/U"		ble	LFE78
FE23 : 7E F5 B0		"~  "		jmp	LF5B0
				;
FE26 : 0F		" "		sei
FE27 : 08		" "		inx
FE28 : 6F 10		"o "		clr	$10,x
FE2A : 6F 1D		"o "		clr	$1D,x
FE2C : 0B		" "		sev
FE2D : 28 0D		"( "		bvc	LFE3C
				;
FE2F				XFE2F:
FE2F : 00		" "		db	$00
				;
FE30 : 0C		" "		clc
FE31 : 28 0B		"( "		bvc	LFE3E
				;
FE33 : 00		" "		db	$00
				;
FE34 : 0D		" "		sec
FE35 : 28 0C		"( "		bvc	LFE43
				;
FE37 : 00		" "		db	$00
				;
FE38 : 70 F2 6F		"p o"		neg	XF26F
				;
FE3B : 00		" "		db	$00
				;
FE3C				LFE3C:
FE3C : 0B		" "		sev
				;
FE3D : 05		" "		db	$05
				;
FE3E				LFE3E:
FE3E : 0D		" "		sec
				;
FE3F : 00		" "		db	$00
				;
FE40 : 0C		" "		clc
				;
FE41				LFE41:
FE41 : 05		" "		db	$05
				;
FE42 : 0B		" "		sev
				;
FE43				LFE43:
FE43 : 00		" "		db	$00
				;
FE44 : 0D		" "		sec
				;
FE45 : 05		" "		db	$05
				;
FE46 : 0C		" "		clc
				;
FE47 : 00		" "		db	$00
				;
FE48 : 40		"@"		nega
FE49 : 6F 00		"o "		clr	$00,x
FE4B : 0B		" "		sev
FE4C : 0A		" "		clv
FE4D : 0D		" "		sec
				;
FE4E : 00		" "		db	$00
				;
FE4F : 0C		" "		clc
FE50 : 0A		" "		clv
FE51 : 0B		" "		sev
				;
FE52				LFE52:
FE52 : 00		" "		db	$00
				;
FE53 : 0D		" "		sec
FE54 : 0A		" "		clv
FE55 : 0C		" "		clc
				;
FE56 : 00		" "		db	$00
				;
FE57 : 40		"@"		nega
				;
FE58 : 3C		"<"		db	$3C
				;
FE59 : 81 70		" p"		cmpa	#$70
				;
FE5B : FD		" "		db	$FD
				;
FE5C : 2A 21		"*!"		bpl	LFE7F
				;
FE5E : 00		" "		db	$00
				;
FE5F : 01		" "		nop
FE60 : 2A F0		"* "		bpl	LFE52
FE62 : 01		" "		nop
				;
FE63 : 1F		" "		db	$1F
				;
FE64 : EB 01		"  "		addb	$01,x
FE66 : 19		" "		daa
FE67 : F5 70 F3		" p "		bitb	X70F3
FE6A : 19		" "		daa
FE6B : 20 28		" ("		bra	LFE95
				;
FE6D : 81 70		" p"		cmpa	#$70
				;
FE6F : FD		" "		db	$FD
				;
FE70 : 37		"7"		pshb
FE71 : 2F 00		"/ "		ble	LFE73
FE73				LFE73:
FE73 : 01		" "		nop
FE74 : 37		"7"		pshb
FE75 : F5 01 2D		"  -"		bitb	X012D
FE78				LFE78:
FE78 : F5 01 46		"  F"		bitb	X0146
FE7B : FA 70 F5		" p "		orab	X70F5
FE7E : F6 F9 FC		"   "		ldab	XF9FC
FE81 : FF 3F C1		" ? "		stx	X3FC1
FE84 : 3F		"?"		swi
FE85 : C1 FF		"  "		cmpb	#$FF
FE87 : FF FF FF		"   "		stx	XFFFF
FE8A : CE FE 7E		"  ~"		ldx	#$FE7E
FE8D : C6 15		"  "		ldab	#$15
FE8F : 4F		"O"		clra
FE90 : 97 0D		"  "		staa	X000D
FE92 : D7 0E		"  "		stab	X000E
FE94 : C6 0C		"  "		ldab	#$0C
FE96 : BD F3 A8		"   "		jsr	LF3A8
FE99 : 7C 00 04		"|  "		inc	X0004
FE9C : D6 04		"  "		ldab	X0004
FE9E				LFE9E:
FE9E : 96 15		"  "		ldaa	X0015
FEA0 : 9B 1D		"  "		adda	X001D
FEA2 : 97 15		"  "		staa	X0015
FEA4 : 96 16		"  "		ldaa	X0016
FEA6 : 9B 1E		"  "		adda	X001E
FEA8 : 97 16		"  "		staa	X0016
FEAA : 96 17		"  "		ldaa	X0017
FEAC : 9B 1F		"  "		adda	X001F
FEAE : 97 17		"  "		staa	X0017
FEB0 : 96 18		"  "		ldaa	X0018
FEB2 : 9B 20		"  "		adda	X0020
FEB4 : 97 18		"  "		staa	X0018
FEB6 : 5A		"Z"		decb
FEB7 : 26 E5		"& "		bne	LFE9E
FEB9 : DE 15		"  "		ldx	X0015
FEBB : DF 11		"  "		stx	X0011
FEBD : DE 17		"  "		ldx	X0017
FEBF : DF 13		"  "		stx	X0013
FEC1				LFEC1:
FEC1 : F7 04 00		"   "		stab	X0400
FEC4 : 7A 00 11		"z  "		dec	X0011
FEC7 : 26 09		"& "		bne	LFED2
FEC9 : 96 15		"  "		ldaa	X0015
FECB : 97 11		"  "		staa	X0011
FECD : 70 00 19		"p  "		neg	X0019
FED0 : DB 19		"  "		addb	X0019
FED2				LFED2:
FED2 : 7A 00 12		"z  "		dec	X0012
FED5 : 26 09		"& "		bne	LFEE0
FED7 : 96 16		"  "		ldaa	X0016
FED9 : 97 12		"  "		staa	X0012
FEDB : 70 00 1A		"p  "		neg	X001A
FEDE : DB 1A		"  "		addb	X001A
FEE0				LFEE0:
FEE0 : 7A 00 13		"z  "		dec	X0013
FEE3 : 26 09		"& "		bne	LFEEE
FEE5 : 96 17		"  "		ldaa	X0017
FEE7 : 97 13		"  "		staa	X0013
FEE9 : 70 00 1B		"p  "		neg	X001B
FEEC : DB 1B		"  "		addb	X001B
FEEE				LFEEE:
FEEE : 7A 00 14		"z  "		dec	X0014
FEF1 : 26 CE		"& "		bne	LFEC1
FEF3 : 96 18		"  "		ldaa	X0018
FEF5 : 97 14		"  "		staa	X0014
FEF7 : 70 00 1C		"p  "		neg	X001C
FEFA : DB 1C		"  "		addb	X001C
FEFC : 7E FE C1		"~  "		jmp	LFEC1
				;
FEFF : 86 A5		"  "		ldaa	#$A5
FF01				XFF01:
FF01 : 97 11		"  "		staa	X0011
FF03 : 86 85		"  "		ldaa	#$85
FF05 : 97 12		"  "		staa	X0012
FF07 : 86 01		"  "		ldaa	#$01
FF09 : 97 13		"  "		staa	X0013
FF0B : 86 80		"  "		ldaa	#$80
FF0D : 97 1D		"  "		staa	X001D
FF0F : 86 FF		"  "		ldaa	#$FF
FF11 : 97 14		"  "		staa	X0014
FF13 : CE 04 00		"   "		ldx	#$0400
FF16				LFF16:
FF16 : DF 15		"  "		stx	X0015
FF18 : 96 11		"  "		ldaa	X0011
FF1A				LFF1A:
FF1A : 48		"H"		asla
FF1B : 24 02		"$ "		bcc	LFF1F
FF1D : 98 12		"  "		eora	X0012
FF1F				LFF1F:
FF1F : B7 04 00		"   "		staa	X0400
FF22 : D6 13		"  "		ldab	X0013
FF24				LFF24:
FF24 : 09		" "		dex
FF25 : 27 05		"' "		beq	LFF2C
FF27 : 5A		"Z"		decb
FF28				XFF28:
FF28 : 26 FA		"& "		bne	LFF24
FF2A : 20 EE		"  "		bra	LFF1A
				;
FF2C				LFF2C:
FF2C : D6 13		"  "		ldab	X0013
FF2E : D0 14		"  "		subb	X0014
FF30 : D7 13		"  "		stab	X0013
FF32 : D1 1D		"  "		cmpb	X001D
FF34 : 27 04		"' "		beq	LFF3A
FF36 : DE 15		"  "		ldx	X0015
FF38 : 20 E0		"  "		bra	LFF1A
FF3A				LFF3A:
FF3A : 39		"9"		rts
				;
FF3B : 86 A5		"  "		ldaa	#$A5
FF3D : 97 11		"  "		staa	X0011
FF3F : 86 85		"  "		ldaa	#$85
FF41 : 97 12		"  "		staa	X0012
FF43 : 86 03		"  "		ldaa	#$03
FF45 : 97 13		"  "		staa	X0013
FF47 : 86 80		"  "		ldaa	#$80
FF49 : 97 1D		"  "		staa	X001D
FF4B : 86 FF		"  "		ldaa	#$FF
FF4D : 97 14		"  "		staa	X0014
FF4F : CE 03 00		"   "		ldx	#$0300
FF52 : 20 C2		"  "		bra	LFF16
				;
FF54 : 86 01		"  "		ldaa	#$01
FF56 : 97 19		"  "		staa	X0019
FF58 : 86 01		"  "		ldaa	#$01
FF5A : 97 1C		"  "		staa	X001C
FF5C : 86 6C		" l"		ldaa	#$6C
FF5E : 97 12		"  "		staa	X0012
FF60 : 86 FF		"  "		ldaa	#$FF
FF62 : 97 1B		"  "		staa	X001B
FF64 : 86 01		"  "		ldaa	#$01
FF66 : C6 6C		" l"		ldab	#$6C
FF68 : 20 2A		" *"		bra	LFF94
				;
FF6A : 86 02		"  "		ldaa	#$02
FF6C : 97 19		"  "		staa	X0019
FF6E : 86 1D		"  "		ldaa	#$1D
FF70 : 97 12		"  "		staa	X0012
FF72 : 86 01		"  "		ldaa	#$01
FF74 : 97 1C		"  "		staa	X001C
FF76 : 86 C8		"  "		ldaa	#$C8
FF78 : 97 1B		"  "		staa	X001B
FF7A : 86 01		"  "		ldaa	#$01
FF7C : C6 6C		" l"		ldab	#$6C
FF7E : 20 14		"  "		bra	LFF94
				;
FF80 : 86 01		"  "		ldaa	#$01
FF82 : 97 19		"  "		staa	X0019
FF84 : 86 1D		"  "		ldaa	#$1D
FF86 : 97 12		"  "		staa	X0012
FF88 : 86 01		"  "		ldaa	#$01
FF8A : 97 1C		"  "		staa	X001C
FF8C : 86 FF		"  "		ldaa	#$FF
FF8E : 97 1B		"  "		staa	X001B
FF90 : 86 01		"  "		ldaa	#$01
FF92 : C6 6C		" l"		ldab	#$6C
FF94				LFF94:
FF94 : 97 18		"  "		staa	X0018
FF96 : 7F 04 00		"   "		clr	X0400
FF99 : 96 12		"  "		ldaa	X0012
FF9B : D7 1A		"  "		stab	X001A
FF9D				LFF9D:
FF9D : D6 1A		"  "		ldab	X001A
FF9F : D7 17		"  "		stab	X0017
FFA1				LFFA1:
FFA1 : 48		"H"		asla
FFA2 : 24 0A		"$ "		bcc	LFFAE
FFA4 : F6 04 00		"   "		ldab	X0400
FFA7 : D8 1B		"  "		eorb	X001B
FFA9 : F7 04 00		"   "		stab	X0400
FFAC : 98 12		"  "		eora	X0012
FFAE				LFFAE:
FFAE : D6 18		"  "		ldab	X0018
FFB0				LFFB0:
FFB0 : 5A		"Z"		decb
FFB1 : 26 FD		"& "		bne	LFFB0
FFB3 : 7A 00 17		"z  "		dec	X0017
FFB6 : 26 E9		"& "		bne	LFFA1
FFB8				XFFB8:
FFB8 : 7F 04 00		"   "		clr	X0400
FFBB : D6 1B		"  "		ldab	X001B
FFBD : D0 1C		"  "		subb	X001C
FFBF : D7 1B		"  "		stab	X001B
FFC1 : 27 08		"' "		beq	LFFCB
FFC3 : D6 18		"  "		ldab	X0018
FFC5 : DB 19		"  "		addb	X0019
FFC7 : D7 18		"  "		stab	X0018
FFC9 : 26 D2		"& "		bne	LFF9D
FFCB				LFFCB:
FFCB : 39		"9"		rts
				;
FFCC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFD0 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFD4 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFD8 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFDC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFE0 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFE4 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFE8 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFEC : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFF0 : 00 00 00 00	"    "		db	$00, $00, $00, $00
FFF4 : 00	00 00 00	"    "		db	$00, $00, $00, $00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F5 54	                ;IRQ   
FFFA : F0 1D                  ;RESET SWI (software) 	
FFFC : F5 D1                  ;NMI  
FFFE : F0 1D                  ;RESET (hardware) 

;--------------------------------------------------------------
