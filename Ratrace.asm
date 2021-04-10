				;
				;	Disassembled by:
				;		DASMx object code disassembler
				;		(c) Copyright 1996-2003   Conquest Consultants
				;		Version 1.40 (Oct 18 2003)
				;
				;	File:		Ratrace.532
				;
				;	Size:		8192 bytes
				;	Checksum:	B486
				;	CRC-32:		C54B9402
				;
				;	Date:		Sat Apr 10 01:45:00 2021
				;
				;	CPU:		Motorola 6800 (6800/6802/6808 family)
				;
        ; Ratrace, 10 made, no production, Sound ROM is 8k, PIA addr 2000, DAC output is portB 2002
				; January 1983, System 7
        ; probably sound rom has lots beta/unused/inactive code etc
				;
					org	$E000
;*************************************;
;FDB melody table pairs - NMI organ test
;*************************************;
;+ 2 more rows for hardware test
[29 07 1E 38][37 03 2B 00] 
[29 07 1E 38][29 07 1E 00]
;orig PARAM call below
[29 07 1E 38][37 03 2B 00]
[29 07 1E 38][3F 02 FE 00]
[29	07 1E 38][37 04 3A 00]
[29 07 1E 38][3F 02 FE 4F] ;end orig
;
[29 07 1E 38][04 05 55 00] ;1st of ROM mem space 
[29 07 1E 38][0D 04 C0 00] 
[29 07 1E 38][04 05 55 00]
[29 07 1E 38][3F 05 FC 00] 
[29 07 1E 38][04 05 55 00] 
[29 07 1E 38][0D 04 C0 00] ;end 1st
; alt +2 offset 1st X load -no
; alt +2 offset table start X load -no
; alt table original -no


;*************************************;
;FDB melody table - NMI organ ?
;*************************************;
E000 : CC 38 3F	05 FC 00 29 07
E008 : 1E 38 04 05 55 00 29 07
E010 : 1E 38 0D	04 C0 00 29 07
E018 : 1E 38 04 05 55 00 29 07
E020 : 1E 38 3F	05 FC 00 29 07	
E028 : 1E 38 04 05 55 00 29 07
E030 : 1E 38 0D	04 C0 00 29 07
E038 : 1E 38 04 05 55 00 29 07
E040 : 1E 38 3F	05 FC 00 29 07
E048 : 1E 38 04 05 55 00 29 07
E050 : 1E 38 0D 04 C0 00 29 07	
E058 : 1E 38 04	07 1C 00 29 07
E060 : 1E 38 0D	04 C0 00 29 07
E068 : 1E 38 29 07 1E 00 29 07
E070 : 1E 38 37	03 2B 00 29 07
E078 : 1E 38 3F	02 FE 00 29	07
E080 : 1E 38 37	03 2B 00 29 07
E088 : 1E 38 29 07 1E 00 29 07
E090 : 1E 38 37 03 2B 00 29 07
E098 : 1E 38 3F	02 FE 00 29 07
E0A0 : 1E 38 37	03 2B 00 29 07
E0A8 : 1E 38 29 07 1E 00 |29 07  ;first valid?
E0B0 : 1E 38 37	03 2B 00 29 07
E0B8 : 1E 38 3F 02 FE 00 29	07	
E0C0 : 1E 38 37 04 3A 00 29 07
E0C8 : 1E 38 3F	02 FE 4F 
;*************************************;
;PARAM (similar to ROM1 PARAM7 - NMI organ)
;*************************************;
;LE0CD
E0CD : 7F 00 90   clr	$0090     ;clr (00) addr 0090
E0D1 : 97 87		  staa	$87     ;store A in addr 87
E0D3 : CE E0 00   ldx	#$E000    ;load X with E000h (fdb wavetable melody)
;LE0D6:
E0D6 : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
E0D8 : 27 2D		  beq	LE107     ;branch Z=1
E0DA : 7A 00 87   dec	$0087     ;decr addr 0087
E0DD : 20 06		  bra	LE0E5     ;branch Z=1
E0DF : 4C				  inca          ;incr A
E0E0 : BD E1 89   jsr	LE189     ;jump sub CALCOS <-- 1st X=E0CD (this param!)
E0E3 : 20 F1		  bra	LE0D6     ;branch always PRM72
;LE0E5:
E0E5 : 08				  inx           ;incr X
E0E6 : DF 8E		  stx	$8E       ;store X in addr 8E
E0E8 : BD E1 89   jsr	LE189     ;jump sub CALCOS <-- 1st X=E0AE
E0EB : DF 8C		  stx	$8C       ;store X in addr 8C
E0ED : DE 8E		  ldx	$8E       ;load X in addr 8E
;LE0EF: - store melody location into mem 93, sets X with melody addr and A with X(lo)
E0EF : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
E0F1 : 97 93		  staa	$93     ;store A in addr 93
E0F3 : A6 01		  ldaa	$01,x   ;load A with addr X + 01h
E0F5 : EE 02		  ldx	$02,x     ;load X with addr X + 02h
E0F7 : DF 91		  stx	$91       ;store X in addr 0F
E0F9 : 8D 0D		  bsr	LE108     ;branch sub SYNTH
E0FB : DE 8E		  ldx	$8E       ;load X with addr 8E
E0FD : 08				  inx           ;incr X
E0FE : 08				  inx           ;incr X
E0FF : 08				  inx           ;incr X
E100 : 08				  inx           ;incr X
E101 : DF 8E		  stx	$8E       ;store X in addr 8E
E103 : 9C 8C		  cpx	$8C       ;comp X with addr 8C
E105 : 26 E8		  bne	LE0EF     ;branch Z=0
;LE107:
E107 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH (similar to ROM1 SYNTH8 - NMI organ)
;*************************************;
E108 : CE 00 94   ldx	#$0094    ;load X with 0094h (scratch mem locations)
;LE10B: - 01 nop length writer for freq/pitch
E10B : 81 00		  cmpa	#$00    ;compare A with 00h
E10D : 27 15		  beq	LE124     ;branch Z=1  <-- write loop from 0094
E10F : 81 03		  cmpa	#$03    ;compare A with 03h (needs 3 more bytes space for jmp write)
E111 : 27 09		  beq	LE11C     ;branch Z=1  <-- loop countdown =0
E113 : C6 01		  ldab	#$01    ;load B with 01h
E115 : E7 00		  stab	$00,x   ;store B in addr X + 00h <-- 01 nop writer
E117 : 08				  inx           ;incr X
E118 : 80 02		  suba	#$02    ;A = A - 02h
E11A : 20 EF		  bra	LE10B     ;branch always SYN81
;LE11C: - writes 91 00 (cmpa $00) gate for freq/pitch end jmp
E11C : C6 91		  ldab	#$91    ;load B with 91h
E11E : E7 00		  stab	$00,x   ;store B in addr X + 00h
E120 : 6F 01		  clr	$01,x     ;clear addr X + 01h
E122 : 08				  inx           ;incr X
E123 : 08				  inx           ;incr X
;LE124: - writes 7E E1 32 (jmp E132) end freq/pitch
E124 : C6 7E		  ldab	#$7E    ;load B with 7Eh
E126 : E7 00		  stab	$00,x   ;store B in addr X + 00h
E128 : C6 E1		  ldab	#$E1    ;load B with E1h
E12A : E7 01		  stab	$01,x   ;store B in addr X + 01h
E12C : C6 32		  ldab	#$32    ;load B with 32h
E12E : E7 02		  stab	$02,x   ;store B in addr X + 02h
E130 : DE 91		  ldx	$91       ;load X with addr 91
;E132 - synth output writer and loop reader
E132 : 4F				  clra          ;clear A
E133 : F6 00 88   ldab	$0088   ;load B with addr 88
E136 : 5C				  incb          ;incr B
E137 : D7 88		  stab	$88     ;store B in addr 88 <-- counter up
E139 : D4 93		  andb	$93     ;and B with value in addr 93
E13B : 54				  lsrb          ;logic shift right B (bit7=0)
E13C : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E13E : 54				  lsrb          ;logic shift right B (bit7=0)
E13F : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E141 : 54				  lsrb          ;logic shift right B (bit7=0)
E142 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E144 : 54				  lsrb          ;logic shift right B (bit7=0)
E145 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E147 : 54				  lsrb          ;logic shift right B (bit7=0)
E148 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E14A : 54				  lsrb          ;logic shift right B (bit7=0)
E14B : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E14D : 54				  lsrb          ;logic shift right B (bit7=0)
E14E : 89 00		  adca	#$00    ;A = Carry + A + 00h 
E150 : 48				  asla          ;arith shift left A (bit0 is 0)
E151 : 48				  asla          ;arith shift left A (bit0 is 0)
E152 : 48				  asla          ;arith shift left A (bit0 is 0)
E153 : 48				  asla          ;arith shift left A (bit0 is 0)
E154 : 48				  asla          ;arith shift left A (bit0 is 0)
E155 : B7 20 02   staa	$2002   ;store A in DAC output SOUND
E158 : 09				  dex           ;decr X
E159 : 27 03		  beq	LE15E     ;branch Z=1
E15B : 7E 00 94   jmp	L0094     ;jump to timer location 0094 (to jmp writes that set freq/pitch duration)
;LE15E:
E15E : 39				  rts           ;return subroutine
;*************************************;
;PARAM
;*************************************;
;LE15F:
E15F : 96 81		  ldaa	$81
E161 : 44				  lsra          ;logic shift right A(bit7=0)
E162 : 98 81		  eora	$81
E164 : 44				  lsra          ;logic shift right A(bit7=0)
E165 : 44				  lsra          ;logic shift right A(bit7=0)
E166 : 76 00 80   ror	$0080
E169 : 76 00 81   ror	$0081
E16C : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E16D : CE 00 E0		"   "		ldx	#$00E0
E170 : 5F		"_"		clrb
E171				LE171:
E171 : 86 20		"  "		ldaa	#$20
E173 : 8D 14		"  "		bsr	LE189
E175				LE175:
E175 : 09		" "		dex
E176 : 26 FD		"& "		bne	LE175
E178 : 7F 20 02		"   "		clr	X2002   ;clear DAC output SOUND
E17B				LE17B:
E17B : 5A		"Z"		decb
E17C : 26 FD		"& "		bne	LE17B
E17E : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E181 : DE 8C		"  "		ldx	X008C
E183 : 8C 12 00		"   "		cpx	#$1200
E186 : 26 E9		"& "		bne	LE171
E188 : 39				  rts           ;return subroutine
;*************************************;
;CALCOS 
;*************************************;
E189 : DF 8C		  stx	$8C       ;store X in addr 8C
E18B : 9B 8D		  adda	$8D     ;add A with value in addr 8D
E18D : 97 8D		  staa	$8D     ;store A in addr 8D
E18F : 96 8C		  ldaa	$8C     ;load A with value in addr 8C
E191 : 89 00		  adca	#$00    ;add A with C and value 00h
E193 : 97 8C		  staa	$8C     ;store A in addr 8C
E195 : DE 8C		  ldx	$8C       ;load X with value in addr 8C
E197 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E198 : C6 BF		"  "		ldab	#$BF
E19A				LE19A:
E19A : 4F		"O"		clra
E19B : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E19E : 17		" "		tba
E19F				LE19F:
E19F : 4A		"J"		deca
E1A0 : 26 FD		"& "		bne	LE19F
E1A2 : 17		" "		tba
E1A3 : 43		"C"		coma
E1A4 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E1A7 : 8D B6		"  "		bsr	LE15F
E1A9				LE1A9:
E1A9 : 4A		"J"		deca
E1AA : 26 FD		"& "		bne	LE1A9
E1AC : 5A		"Z"		decb
E1AD : 26 EB		"& "		bne	LE19A
E1AF : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E1B0 : C6 FF		"  "		ldab	#$FF
E1B2 : 7F 20 02		"   "		clr	X2002   ;clear DAC output SOUND
E1B5				LE1B5:
E1B5 : BD E1 5F		"  _"		jsr	LE15F
E1B8 : 96 81		"  "		ldaa	X0081
E1BA				LE1BA:
E1BA : 20 00		"  "		bra	LE1BC
				;
E1BC				LE1BC:
E1BC : 4A		"J"		deca
E1BD : 26 FB		"& "		bne	LE1BA
E1BF : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E1C2 : C5 01		"  "		bitb	#$01
E1C4 : 26 03		"& "		bne	LE1C9
E1C6 : 7A 20 02		"z  "		dec	X2002   ;decr value in DAC output SOUND
E1C9				LE1C9:
E1C9 : 17		" "		tba
E1CA				LE1CA:
E1CA : 4A		"J"		deca
E1CB : 26 FD		"& "		bne	LE1CA
E1CD : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E1D0 : 5A		"Z"		decb
E1D1 : 26 E2		"& "		bne	LE1B5
E1D3 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E1D4 : C6 01		"  "		ldab	#$01
E1D6 : 7F 20 02		"   "		clr	X2002   ;clear DAC output SOUND
E1D9				LE1D9:
E1D9 : BD E1 5F		"  _"		jsr	LE15F
E1DC : 96 81		"  "		ldaa	X0081
E1DE				LE1DE:
E1DE : 20 00		"  "		bra	LE1E0
				;
E1E0				LE1E0:
E1E0 : 4A		"J"		deca
E1E1 : 26 FB		"& "		bne	LE1DE
E1E3 : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E1E6 : C5 01		"  "		bitb	#$01
E1E8 : 26 03		"& "		bne	LE1ED
E1EA : 7A 20 02		"z  "		dec	X2002   ;decr value in DAC output SOUND
E1ED				LE1ED:
E1ED : 17		" "		tba
E1EE				LE1EE:
E1EE : 4A		"J"		deca
E1EF : 26 FD		"& "		bne	LE1EE
E1F1 : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E1F4 : 5C		"\"		incb
E1F5 : 26 E2		"& "		bne	LE1D9
E1F7 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
E1F8 : 01		" "		nop
				;
E1F9 : 03		" "		db	$03
				;
E1FA : FF 80 FF		"   "		stx	X80FF
				;
E1FD : 00		" "		db	$00
				;
E1FE : CE E1 F8		"   "		ldx	#$E1F8
E201				LE201:
E201 : BD F8 57		"  W"		jsr	LF857
E204 : 7E F8 70		"~ p"		jmp	LF870
				;
E207 : 48		"H"		asla
				;
E208 : 03		" "		db	$03
				;
E209 : 01		" "		nop
E20A : 0C		" "		clc
E20B : FF 00 86		"   "		stx	X0086
E20E : FF 97 89		"   "		stx	X9789
E211 : CE E2 07		"   "		ldx	#$E207
E214				LE214:
E214 : 8D EB		"  "		bsr	LE201
E216 : 8D 6E		" n"		bsr	LE286
E218 : 20 FA		"  "		bra	LE214
				;
E21A : E0 01		"  "		subb	$01,x
				;
E21C : 02		" "		db	$02
				;
E21D : 10		" "		sba
E21E : FF 00 86		"   "		stx	X0086
E221 : FF 97 89		"   "		stx	X9789
E224 : CE E2 1A		"   "		ldx	#$E21A
E227 : 20 EB		"  "		bra	LE214
;*************************************;
;
;*************************************;
E229 : 20 03 FF 50 FF	00
;
E22F : 50	03 01 20 FF	00
;*************************************;
;PARAM
;*************************************;
E235 : C6 2F		" /"		ldab	#$2F
E237 : D7 89		"  "		stab	X0089
E239				LE239:
E239 : CE E2 29		"  )"		ldx	#$E229
E23C : 8D C3		"  "		bsr	LE201
E23E : CE E2 2F		"  /"		ldx	#$E22F
E241 : 8D BE		"  "		bsr	LE201
E243 : 5A		"Z"		decb
E244 : 26 F3		"& "		bne	LE239
E246 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E247 : 86 FF		"  "		ldaa	#$FF
E249 : 97 97		"  "		staa	X0097
E24B : 86 60		" `"		ldaa	#$60
E24D : C6 FF		"  "		ldab	#$FF
E24F				LE24F:
E24F : 97 96		"  "		staa	X0096
E251 : 86 FF		"  "		ldaa	#$FF
E253 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E256 : D7 92		"  "		stab	X0092
E258				LE258:
E258 : D6 92		"  "		ldab	X0092
E25A				LE25A:
E25A : 96 81		"  "		ldaa	X0081
E25C : 44		"D"		lsra
E25D : 44		"D"		lsra
E25E : 44		"D"		lsra
E25F : 98 81		"  "		eora	X0081
E261 : 44		"D"		lsra
E262 : 76 00 80		"v  "		ror	X0080
E265 : 76 00 81		"v  "		ror	X0081
E268 : 24 03		"$ "		bcc	LE26D
E26A : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E26D				LE26D:
E26D : 96 96		"  "		ldaa	X0096
E26F				LE26F:
E26F : 4A		"J"		deca
E270 : 26 FD		"& "		bne	LE26F
E272 : 5A		"Z"		decb
E273 : 26 E5		"& "		bne	LE25A
E275 : 96 96		"  "		ldaa	X0096
E277 : 9B 97		"  "		adda	X0097
E279 : 97 96		"  "		staa	X0096
E27B : 26 DB		"& "		bne	LE258
E27D : 39				  rts           ;return subroutine
;*************************************;
;PARAM
;*************************************;
E27E : 86 01		"  "		ldaa	#$01
E280 : 97 97		"  "		staa	X0097
E282 : C6 03		"  "		ldab	#$03
E284 : 20 C9		"  "		bra	LE24F
;LE286:
E286 : 96 89		"  "		ldaa	X0089
E288 : 80 08		"  "		suba	#$08
E28A : 2A 03		"* "		bpl	LE28F
E28C : 97 89		"  "		staa	X0089
E28E : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LE28F:
E28F : 32		"2"		pula
E290 : 32		"2"		pula
E291 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E292 : C6 11		"  "		ldab	#$11
E294 : D7 AC		"  "		stab	X00AC
E296 : 86 FE		"  "		ldaa	#$FE
E298 : 97 91		"  "		staa	X0091
E29A : 86 9F		"  "		ldaa	#$9F
E29C : D6 AC		"  "		ldab	X00AC
E29E				LE29E:
E29E : CE 01 C0		"   "		ldx	#$01C0
E2A1				LE2A1:
E2A1 : 09		" "		dex
E2A2 : 27 20		"' "		beq	LE2C4
E2A4 : F7 00 90		"   "		stab	X0090
E2A7 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E2AA				LE2AA:
E2AA : 09		" "		dex
E2AB : 27 17		"' "		beq	LE2C4
E2AD : 7A 00 90		"z  "		dec	X0090
E2B0 : 26 F8		"& "		bne	LE2AA
E2B2 : 09		" "		dex
E2B3 : 27 0F		"' "		beq	LE2C4
E2B5 : D7 90		"  "		stab	X0090
E2B7 : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E2BA				LE2BA:
E2BA : 09		" "		dex
E2BB : 27 07		"' "		beq	LE2C4
E2BD : 7A 00 90		"z  "		dec	X0090
E2C0 : 26 F8		"& "		bne	LE2BA
E2C2 : 20 DD		"  "		bra	LE2A1
				;
E2C4				LE2C4:
E2C4 : D0 91		"  "		subb	X0091
E2C6 : C1 10		"  "		cmpb	#$10
E2C8 : 22 D4		"" "		bhi	LE29E
E2CA : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E2CB : 4F		"O"		clra
E2CC : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E2CF : 97 87		"  "		staa	X0087
E2D1				LE2D1:
E2D1 : 4F		"O"		clra
E2D2				LE2D2:
E2D2 : 91 87		"  "		cmpa	X0087
E2D4 : 26 03		"& "		bne	LE2D9
E2D6 : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E2D9				LE2D9:
E2D9 : C6 12		"  "		ldab	#$12
E2DB				LE2DB:
E2DB : 5A		"Z"		decb
E2DC : 26 FD		"& "		bne	LE2DB
E2DE : 4C		"L"		inca
E2DF : 2A F1		"* "		bpl	LE2D2
E2E1 : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E2E4 : 7C 00 87		"|  "		inc	X0087
E2E7 : 2A E8		"* "		bpl	LE2D1
E2E9 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
E2EA : CE 00 90		"   "		ldx	#$0090
E2ED				LE2ED:
E2ED : 6F 00		"o "		clr	$00,x
E2EF : 08		" "		inx
E2F0 : 8C 00 A0		"   "		cpx	#$00A0
E2F3 : 26 F8		"& "		bne	LE2ED
E2F5 : 86 18		"  "		ldaa	#$18
E2F7 : 97 90		"  "		staa	X0090
E2F9				LE2F9:
E2F9 : CE 00 90		"   "		ldx	#$0090
E2FC : 86 C0		"  "		ldaa	#$C0
E2FE : 97 87		"  "		staa	X0087
E300 : 5F		"_"		clrb
E301				LE301:
E301 : A6 01		"  "		ldaa	$01,x
E303 : AB 00		"  "		adda	$00,x
E305 : A7 01		"  "		staa	$01,x
E307 : 2A 02		"* "		bpl	LE30B
E309 : DB 87		"  "		addb	X0087
E30B				LE30B:
E30B : 74 00 87		"t  "		lsr	X0087
E30E : 08		" "		inx
E30F : 08		" "		inx
E310 : 8C 00 A0		"   "		cpx	#$00A0
E313 : 26 EC		"& "		bne	LE301
E315 : F7 20 02		"   "		stab	X2002   ;store B in DAC output SOUND
E318 : 7C 00 88		"|  "		inc	X0088
E31B : 26 DC		"& "		bne	LE2F9
E31D : CE 00 90		"   "		ldx	#$0090
E320 : 5F		"_"		clrb
E321				LE321:
E321 : A6 00		"  "		ldaa	$00,x
E323 : 27 0B		"' "		beq	LE330
E325 : 81 37		" 7"		cmpa	#$37
E327 : 26 04		"& "		bne	LE32D
E329 : C6 19		"  "		ldab	#$19
E32B : E7 02		"  "		stab	$02,x
E32D				LE32D:
E32D : 6A 00		"j "		dec	$00,x
E32F : 5C		"\"		incb
E330				LE330:
E330 : 08		" "		inx
E331 : 08		" "		inx
E332 : 8C 00 A0		"   "		cpx	#$00A0
E335 : 26 EA		"& "		bne	LE321
E337 : 5D		"]"		tstb
E338 : 26 BF		"& "		bne	LE2F9
E33A : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
;LE33B:
E33B : 96 98		"  "		ldaa	X0098
E33D : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E340				LE340:
E340 : 96 90		"  "		ldaa	X0090
E342 : 97 99		"  "		staa	X0099
E344 : 96 91		"  "		ldaa	X0091
E346 : 97 9A		"  "		staa	X009A
E348				LE348:
E348 : DE 95		"  "		ldx	X0095
E34A				LE34A:
E34A : 96 99		"  "		ldaa	X0099
E34C : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E34F				LE34F:
E34F : 09		" "		dex
E350 : 27 10		"' "		beq	LE362
E352 : 4A		"J"		deca
E353 : 26 FA		"& "		bne	LE34F
E355 : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
E358 : 96 9A		"  "		ldaa	X009A
E35A				LE35A:
E35A : 09		" "		dex
E35B : 27 05		"' "		beq	LE362
E35D : 4A		"J"		deca
E35E : 26 FA		"& "		bne	LE35A
E360 : 20 E8		"  "		bra	LE34A
;LE362:
E362 : B6 20 02		"   "		ldaa	X2002   ;load A with value in DAC output SOUND
E365 : 2B 01		"+ "		bmi	LE368
E367 : 43		"C"		coma
E368				LE368:
E368 : 8B 00		"  "		adda	#$00
E36A : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E36D : 96 99		"  "		ldaa	X0099
E36F : 9B 92		"  "		adda	X0092
E371 : 97 99		"  "		staa	X0099
E373 : 96 9A		"  "		ldaa	X009A
E375 : 9B 93		"  "		adda	X0093
E377 : 97 9A		"  "		staa	X009A
E379 : 91 94		"  "		cmpa	X0094
E37B : 26 CB		"& "		bne	LE348
E37D : 96 97		"  "		ldaa	X0097
E37F : 27 06		"' "		beq	LE387
E381 : 9B 90		"  "		adda	X0090
E383 : 97 90		"  "		staa	X0090
E385 : 26 B9		"& "		bne	LE340
E387				LE387:
E387 : 39				  rts           ;return subroutine
;*************************************;
;VVECTs ?
;*************************************;
E388 : 58	01 00	08 81 02 00	FF FF 
;
E391 : 48	91 00	FC 01	02 00 FC FF 
;*************************************;
;
;*************************************;
E39A : 86 20		"   "		ldaa	#$20
E39C : 97 92		"  "		staa	X0092
E39E : 97 95		"  "		staa	X0095
E3A0 : 86 01		"  "		ldaa	#$01
E3A2 : CE 00 01		"   "		ldx	#$0001
E3A5 : C6 FF		"  "		ldab	#$FF
E3A7 : 97 90		"  "		staa	X0090
E3A9				LE3A9:
E3A9 : DF 93		"  "		stx	X0093
E3AB				LE3AB:
E3AB : D7 91		"  "		stab	X0091
E3AD : D6 92		"  "		ldab	X0092
E3AF				LE3AF:
E3AF : 96 81		"  "		ldaa	X0081
E3B1 : 44		"D"		lsra
E3B2 : 44		"D"		lsra
E3B3 : 44		"D"		lsra
E3B4 : 98 81		"  "		eora	X0081
E3B6 : 44		"D"		lsra
E3B7 : 76 00 80		"v  "		ror	X0080
E3BA : 76 00 81		"v  "		ror	X0081
E3BD : 86 00		"  "		ldaa	#$00
E3BF : 24 02		"$ "		bcc	LE3C3
E3C1 : 96 91		"  "		ldaa	X0091
E3C3				LE3C3:
E3C3 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
E3C6 : DE 93		"  "		ldx	X0093
E3C8				LE3C8:
E3C8 : 09		" "		dex
E3C9 : 26 FD		"& "		bne	LE3C8
E3CB : 5A		"Z"		decb
E3CC : 26 E1		"& "		bne	LE3AF
E3CE : D6 91		"  "		ldab	X0091
E3D0 : D0 90		"  "		subb	X0090
E3D2 : 27 09		"' "		beq	LE3DD
E3D4 : DE 93		"  "		ldx	X0093
E3D6 : 08		" "		inx
E3D7 : 96 95		"  "		ldaa	X0095
E3D9 : 27 D0		"' "		beq	LE3AB
E3DB : 20 CC		"  "		bra	LE3A9
E3DD				LE3DD:
E3DD : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LE3DE: called by NMI lo mem
E3DE : 8D 03		"  "		bsr	LE3E3
E3E0 : 7E F1 70		"~ p"		jmp	LF170
				;
E3E3				LE3E3:
E3E3 : 16		" "		tab
E3E4 : 58		"X"		aslb
E3E5 : 1B		" "		aba
E3E6 : 1B		" "		aba
E3E7 : 1B		" "		aba
E3E8 : CE E4 49		"  I"		ldx	#$E449
E3EB : BD E1 89		"   "		jsr	LE189
E3EE : A6 00		"  "		ldaa	$00,x
E3F0 : 16		" "		tab
E3F1 : 84 0F		"  "		anda	#$0F
E3F3 : 97 92		"  "		staa	X0092
E3F5 : 54		"T"		lsrb
E3F6 : 54		"T"		lsrb
E3F7 : 54		"T"		lsrb
E3F8 : 54		"T"		lsrb
E3F9 : D7 91		"  "		stab	X0091
E3FB : A6 01		"  "		ldaa	$01,x
E3FD : 16		" "		tab
E3FE : 54		"T"		lsrb
E3FF : 54		"T"		lsrb
E400 : 54		"T"		lsrb
E401 : 54		"T"		lsrb
E402 : D7 93		"  "		stab	X0093
E404 : 84 0F		"  "		anda	#$0F
E406 : 97 87		"  "		staa	X0087
E408 : DF 8A		"  "		stx	X008A
E40A : CE F2 4F		"  O"		ldx	#$F24F
E40D				LE40D:
E40D : 7A 00 87		"z  "		dec	X0087
E410 : 2B 08		"+ "		bmi	LE41A
E412 : A6 00		"  "		ldaa	$00,x
E414 : 4C		"L"		inca
E415 : BD E1 89		"   "		jsr	LE189
E418 : 20 F3		"  "		bra	LE40D
				;
E41A				LE41A:
E41A : DF 96		"  "		stx	X0096
E41C : BD F1 FA		"   "		jsr	LF1FA
E41F : DE 8A		"  "		ldx	X008A
E421 : A6 02		"  "		ldaa	$02,x
E423 : 97 98		"  "		staa	X0098
E425 : BD F2 0C		"   "		jsr	LF20C
E428 : DE 8A		"  "		ldx	X008A
E42A : A6 03		"  "		ldaa	$03,x
E42C : 97 94		"  "		staa	X0094
E42E : A6 04		"  "		ldaa	$04,x
E430 : 97 95		"  "		staa	X0095
E432 : A6 05		"  "		ldaa	$05,x
E434 : 16		" "		tab
E435 : A6 06		"  "		ldaa	$06,x
E437 : CE E4 E3		"   "		ldx	#$E4E3
E43A : BD E1 89		"   "		jsr	LE189
E43D : 17		" "		tba
E43E : DF 99		"  "		stx	X0099
E440 : 7F 00 A1		"   "		clr	X00A1
E443 : BD E1 89		"   "		jsr	LE189
E446 : DF 9B		"  "		stx	X009B
E448 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
E449 : 81 24		" $"		cmpa	#$24
				;
E44B : 03 00 00		"   "		db	$03, $00, $00
				;
E44E : 16		" "		tab
E44F : 31		"1"		ins
				;
E450 : 41 45 00 00	"AE  "		db	$41, $45, $00, $00
E454 : 00		" "		db	$00
				;
E455 : 0F		" "		sei
				;
E456 : 5B		"["		db	$5B
				;
E457 : F4 12 00		"   "		andb	X1200
				;
E45A : 00 00 14		"   "		db	$00, $00, $14
				;
E45D : 47		"G"		asra
				;
E45E : 21		"!"		db	$21
				;
E45F : 3F		"?"		swi
				;
E460 : 12		" "		db	$12
				;
E461 : FE 01 20		"   "		ldx	X0120
E464 : 1B		" "		aba
E465 : F8 5B 07		" [ "		eorb	X5B07
				;
E468 : 03		" "		db	$03
				;
E469 : 01		" "		nop
				;
E46A : 05		" "		db	$05
				;
E46B : 94 E3		"  "		anda	X00E3
				;
E46D : 12 03 00 02	"    "		db	$12, $03, $00, $02
				;
E471 : 06		" "		tap
E472 : 9A 16		"  "		oraa	X0016
E474 : 17		" "		tba
				;
E475 : 00 00 00		"   "		db	$00, $00, $00
				;
E478 : 0A		" "		clv
E479 : 10		" "		sba
E47A : A4 25		" %"		anda	$25,x
E47C : FE FE 01		"   "		ldx	XFE01
				;
E47F : 02		" "		db	$02
				;
E480 : FE FE 1A		"   "		ldx	XFE1A
				;
E483 : 00 00 00		"   "		db	$00, $00, $00
				;
E486 : 08		" "		inx
E487 : 6E 82		"n "		jmp	$82,x						;INFO: index jump
				;
E489 : 22 00		"" "		bhi	LE48B
				;
E48B				LE48B:
E48B : 00 00 18		"   "		db	$00, $00, $18
				;
E48E : C6 21		" !"		ldab	#$21
E490 : 30		"0"		tsx
				;
E491 : 00		" "		db	$00
				;
E492 : FF 30 20		" 0 "		stx	X3020
E495 : 0D		" "		sec
E496 : B2 10 05		"   "		sbca	X1005
				;
E499 : 00 00 14		"   "		db	$00, $00, $14
				;
E49C : A4 FF		"  "		anda	$FF,x
				;
E49E : 1F 14		"  "		db	$1F, $14
				;
E4A0 : 01		" "		nop
E4A1 : 01		" "		nop
				;
E4A2 : 04 1C 1C 1F	"    "		db	$04, $1C, $1C, $1F
E4A6 : 00		" "		db	$00
				;
E4A7 : FF FF 08		"   "		stx	XFF08
E4AA : 88 3D		" ="		eora	#$3D
E4AC : 5C		"\"		incb
E4AD : 01		" "		nop
E4AE : 01		" "		nop
E4AF : 01		" "		nop
				;
E4B0 : 02		" "		db	$02
				;
E4B1 : 01		" "		nop
E4B2 : F4 15 00		"   "		andb	X1500
				;
E4B5 : 00 00		"  "		db	$00, $00
				;
E4B7 : 08		" "		inx
E4B8 : 1B		" "		aba
				;
E4B9 : 72		"r"		db	$72
				;
E4BA : 28 03		"( "		bvc	LE4BF
				;
E4BC : 00 02		"  "		db	$00, $02
				;
E4BE : 07		" "		tpa
E4BF				LE4BF:
E4BF : 9A D1		"  "		oraa	X00D1
				;
E4C1 : 12 00 00 00	"    "		db	$12, $00, $00, $00
				;
E4C5 : 0C		" "		clc
				;
E4C6 : 00 3A 1F		" : "		db	$00, $3A, $1F
				;
E4C9 : 11		" "		cba
E4CA : 01		" "		nop
E4CB : 10		" "		sba
				;
E4CC : 04 1C 1F		"   "		db	$04, $1C, $1F
				;
E4CF : F6 FE FE		"   "		ldab	XFEFE
E4D2 : FE 01 21		"  !"		ldx	X0121
E4D5 : FF 15 01		"   "		stx	X1501
E4D8 : 0A		" "		clv
E4D9 : 01		" "		nop
				;
E4DA : 03		" "		db	$03
				;
E4DB : BC FF 16		"   "		cpx	XFF16
				;
E4DE : 00 00 00		"   "		db	$00, $00, $00
				;
E4E1 : 08		" "		inx
E4E2 : 88 A0		"  "		eora	#$A0
E4E4 : 98 90		"  "		eora	X0090
E4E6 : 88 80		"  "		eora	#$80
E4E8 : 78 70 68		"xph"		asl	X7068
E4EB : 60 58		"`X"		neg	$58,x
E4ED : 50		"P"		negb
E4EE : 44		"D"		lsra
E4EF : 40		"@"		nega
E4F0 : 01		" "		nop
E4F1 : 01		" "		nop
				;
E4F2 : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
E4F6 : 08		" "		inx
E4F7 : 08		" "		inx
E4F8 : 10		" "		sba
E4F9 : 10		" "		sba
E4FA : 30		"0"		tsx
E4FB : 60 C0		"` "		neg	$C0,x
E4FD : E0 01		"  "		subb	$01,x
E4FF : 01		" "		nop
				;
E500 : 02 02 03 04	"    "		db	$02, $02, $03, $04
E504 : 05		" "		db	$05
				;
E505 : 06		" "		tap
E506 : 07		" "		tpa
E507 : 08		" "		inx
E508 : 09		" "		dex
E509 : 0A		" "		clv
E50A : 0C		" "		clc
E50B : 80 7C		" |"		suba	#$7C
E50D : 78 74 70		"xtp"		asl	X7470
E510 : 74 78 7C		"tx|"		lsr	X787C
E513 : 80 01		"  "		suba	#$01
E515 : 01		" "		nop
				;
E516 : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
E51A : 08		" "		inx
E51B : 08		" "		inx
E51C : 10		" "		sba
E51D : 20 28		" ("		bra	LE547
				;
E51F : 30		"0"		tsx
				;
E520 : 38		"8"		db	$38
				;
E521 : 40		"@"		nega
E522 : 48		"H"		asla
E523 : 50		"P"		negb
E524 : 60 70		"`p"		neg	$70,x
E526 : 80 A0		"  "		suba	#$A0
E528 : B0 C0 08		"   "		suba	XC008
E52B : 40		"@"		nega
E52C : 08		" "		inx
E52D : 40		"@"		nega
E52E : 08		" "		inx
E52F : 40		"@"		nega
E530 : 08		" "		inx
E531 : 40		"@"		nega
E532 : 08		" "		inx
E533 : 40		"@"		nega
E534 : 08		" "		inx
E535 : 40		"@"		nega
E536 : 08		" "		inx
E537 : 40		"@"		nega
E538 : 08		" "		inx
E539 : 40		"@"		nega
E53A : 08		" "		inx
E53B : 40		"@"		nega
E53C : 08		" "		inx
E53D : 40		"@"		nega
E53E : 01		" "		nop
				;
E53F : 02 04		"  "		db	$02, $04
				;
E541 : 08		" "		inx
E542 : 09		" "		dex
E543 : 0A		" "		clv
E544 : 0B		" "		sev
E545 : 0C		" "		clc
E546 : 0E		" "		cli
E547				LE547:
E547 : 0F		" "		sei
E548 : 10		" "		sba
				;
E549 : 12 14		"  "		db	$12, $14
				;
E54B : 16		" "		tab
E54C : 40		"@"		nega
E54D : 10		" "		sba
E54E : 08		" "		inx
E54F : 01		" "		nop
E550 : 01		" "		nop
E551 : 01		" "		nop
E552 : 01		" "		nop
E553 : 01		" "		nop
				;
E554 : 02 02 03 03	"    "		db	$02, $02, $03, $03
E558 : 04 04 05		"   "		db	$04, $04, $05
				;
E55B : 06		" "		tap
E55C : 08		" "		inx
E55D : 0A		" "		clv
E55E : 0C		" "		clc
E55F : 10		" "		sba
				;
E560 : 14 18		"  "		db	$14, $18
				;
E562 : 20 30		" 0"		bra	LE594
				;
E564 : 40		"@"		nega
E565 : 50		"P"		negb
E566 : 40		"@"		nega
E567 : 30		"0"		tsx
E568 : 20 10		"  "		bra	LE57A
				;
E56A : 0C		" "		clc
E56B : 0A		" "		clv
E56C : 08		" "		inx
E56D : 07		" "		tpa
E56E : 06		" "		tap
				;
E56F : 05 04 03 02	"    "		db	$05, $04, $03, $02
E573 : 02		" "		db	$02
				;
E574 : 01		" "		nop
E575 : 01		" "		nop
E576 : 01		" "		nop
E577 : 07		" "		tpa
E578 : 08		" "		inx
E579 : 09		" "		dex
E57A				LE57A:
E57A : 0A		" "		clv
E57B : 0C		" "		clc
E57C : 08		" "		inx
E57D : 17		" "		tba
				;
E57E : 18		" "		db	$18
				;
E57F : 19		" "		daa
				;
E580 : 1A		" "		db	$1A
				;
E581 : 1B		" "		aba
				;
E582 : 1C 00 00 00	"    "		db	$1C, $00, $00, $00
E586 : 00		" "		db	$00
				;
E587 : 08		" "		inx
E588 : 80 10		"  "		suba	#$10
E58A : 78 18 70		"x p"		asl	X1870
E58D : 20 60		" `"		bra	LE5EF
				;
E58F : 28 58		"(X"		bvc	LE5E9
E591 : 30		"0"		tsx
E592 : 50		"P"		negb
E593 : 40		"@"		nega
E594				LE594:
E594 : 48		"H"		asla
				;
E595 : 00		" "		db	$00
				;
E596 : 01		" "		nop
E597 : 08		" "		inx
E598 : 10		" "		sba
E599 : 01		" "		nop
E59A : 08		" "		inx
E59B : 10		" "		sba
E59C : 01		" "		nop
E59D : 08		" "		inx
E59E : 10		" "		sba
E59F : 01		" "		nop
E5A0 : 08		" "		inx
E5A1 : 10		" "		sba
E5A2 : 01		" "		nop
E5A3 : 08		" "		inx
E5A4 : 10		" "		sba
E5A5 : 01		" "		nop
E5A6 : 08		" "		inx
E5A7 : 10		" "		sba
				;
E5A8 : 00		" "		db	$00
				;
E5A9 : 10		" "		sba
E5AA : 20 40		" @"		bra	LE5EC
				;
E5AC : 10		" "		sba
E5AD : 20 40		" @"		bra	LE5EF
				;
E5AF : 10		" "		sba
E5B0 : 20 40		" @"		bra	LE5F2
				;
E5B2 : 10		" "		sba
E5B3 : 20 40		" @"		bra	LE5F5
				;
E5B5 : 10		" "		sba
E5B6 : 20 40		" @"		bra	LE5F8
				;
E5B8 : 10		" "		sba
E5B9 : 20 40		" @"		bra	LE5FB
				;
E5BB : 10		" "		sba
E5BC : 20 40		" @"		bra	LE5FE
				;
E5BE : 10		" "		sba
E5BF : 20 40		" @"		bra	LE601
				;
E5C1 : 00		" "		db	$00
				;
E5C2 : 01		" "		nop
E5C3 : 40		"@"		nega
				;
E5C4 : 02 42 03		" B "		db	$02, $42, $03
				;
E5C7 : 43		"C"		coma
				;
E5C8 : 04		" "		db	$04
				;
E5C9 : 44		"D"		lsra
				;
E5CA : 05 45		" E"		db	$05, $45
				;
E5CC : 06		" "		tap
E5CD : 46		"F"		rora
E5CE : 07		" "		tpa
E5CF : 47		"G"		asra
E5D0 : 08		" "		inx
E5D1 : 48		"H"		asla
E5D2 : 09		" "		dex
E5D3 : 49		"I"		rola
E5D4 : 0A		" "		clv
E5D5 : 4A		"J"		deca
E5D6 : 0B		" "		sev
				;
E5D7 : 4B 00		"K "		db	$4B, $00
				;
E5D9 : 01		" "		nop
				;
E5DA : 02 03 04 05	"    "		db	$02, $03, $04, $05
				;
E5DE : 06		" "		tap
E5DF : 07		" "		tpa
E5E0 : 08		" "		inx
				;
E5E1 : 18		" "		db	$18
				;
E5E2 : 19		" "		daa
				;
E5E3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5E7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5EB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5EF				LE5EF:
E5EF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5F3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5F7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5FB				LE5FB:
E5FB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E5FF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E603 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E607 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E60B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E60F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E613 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E617 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E61B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E61F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E623 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E627 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E62B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E62F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E633 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E637 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E63B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E63F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E643 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E647 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E64B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E64F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E653 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E657 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E65B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E65F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E663 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E667 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E66B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E66F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E673 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E677 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E67B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E67F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E683 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E687 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E68B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E68F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E693 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E697 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E69B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E69F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6A3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6A7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6AB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6AF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6B3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6B7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6BB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6BF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6C3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6C7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6CB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6CF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6D3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6D7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6DB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6DF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6E3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6E7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6EB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6EF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6F3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6F7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6FB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E6FF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E703 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E707 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E70B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E70F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E713 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E717 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E71B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E71F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E723 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E727 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E72B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E72F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E733 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E737 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E73B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E73F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E743 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E747 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E74B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E74F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E753 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E757 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E75B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E75F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E763 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E767 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E76B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E76F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E773 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E777 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E77B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E77F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E783 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E787 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E78B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E78F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E793 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E797 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E79B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E79F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7A3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7A7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7AB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7AF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7B3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7B7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7BB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7BF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7C3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7C7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7CB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7CF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7D3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7D7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7DB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7DF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7E3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7E7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7EB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7EF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7F3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7F7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7FB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E7FF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E803 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E807 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E80B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E80F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E813 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E817 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E81B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E81F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E823 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E827 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E82B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E82F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E833 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E837 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E83B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E83F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E843 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E847 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E84B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E84F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E853 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E857 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E85B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E85F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E863 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E867 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E86B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E86F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E873 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E877 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E87B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E87F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E883 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E887 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E88B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E88F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E893 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E897 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E89B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E89F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8A3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8A7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8AB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8AF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8B3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8B7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8BB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8BF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8C3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8C7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8CB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8CF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8D3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8D7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8DB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8DF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8E3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8E7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8EB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8EF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8F3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8F7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8FB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E8FF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E903 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E907 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E90B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E90F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E913 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E917 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E91B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E91F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E923 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E927 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E92B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E92F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E933 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E937 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E93B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E93F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E943 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E947 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E94B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E94F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E953 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E957 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E95B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E95F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E963 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E967 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E96B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E96F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E973 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E977 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E97B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E97F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E983 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E987 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E98B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E98F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E993 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E997 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E99B : 00 00 00 00	"    "		db	$00, $00, $00, $00
E99F : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9A3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9A7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9AB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9AF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9B3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9B7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9BB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9BF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9C3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9C7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9CB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9CF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9D3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9D7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9DB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9DF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9E3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9E7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9EB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9EF : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9F3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9F7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9FB : 00 00 00 00	"    "		db	$00, $00, $00, $00
E9FF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA03 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA07 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA0B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA0F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA13 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA17 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA1B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA1F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA23 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA27 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA2B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA2F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA33 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA37 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA3B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA3F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA43 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA47 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA4B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA4F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA53 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA57 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA5B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA5F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA63 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA67 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA6B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA6F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA73 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA77 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA7B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA7F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA83 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA87 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA8B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA8F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA93 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA97 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA9B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EA9F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAA3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAA7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAAB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAAF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAB3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAB7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EABB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EABF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAC3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAC7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EACB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EACF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAD3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAD7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EADB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EADF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAE3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAE7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAEB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAEF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAF3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAF7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAFB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EAFF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB03 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB07 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB0B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB0F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB13 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB17 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB1B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB1F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB23 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB27 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB2B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB2F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB33 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB37 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB3B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB3F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB43 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB47 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB4B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB4F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB53 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB57 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB5B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB5F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB63 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB67 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB6B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB6F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB73 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB77 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB7B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB7F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB83 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB87 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB8B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB8F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB93 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB97 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB9B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EB9F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBA3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBA7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBAB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBAF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBB3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBB7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBBB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBBF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBC3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBC7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBCB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBCF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBD3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBD7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBDB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBDF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBE3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBE7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBEB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBEF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBF3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBF7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBFB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EBFF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC03 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC07 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC0B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC0F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC13 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC17 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC1B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC1F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC23 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC27 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC2B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC2F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC33 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC37 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC3B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC3F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC43 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC47 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC4B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC4F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC53 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC57 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC5B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC5F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC63 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC67 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC6B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC6F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC73 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC77 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC7B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC7F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC83 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC87 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC8B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC8F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC93 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC97 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC9B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EC9F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECA3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECA7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECAB : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECAF : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECB3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECB7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECBB : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECBF : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECC3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECC7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECCB : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECCF : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECD3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECD7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECDB : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECDF : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECE3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECE7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECEB : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECEF : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECF3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECF7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECFB : 00 00 00 00	"    "		db	$00, $00, $00, $00
ECFF : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED03 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED07 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED0B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED0F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED13 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED17 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED1B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED1F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED23 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED27 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED2B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED2F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED33 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED37 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED3B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED3F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED43 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED47 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED4B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED4F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED53 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED57 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED5B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED5F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED63 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED67 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED6B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED6F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED73 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED77 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED7B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED7F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED83 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED87 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED8B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED8F : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED93 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED97 : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED9B : 00 00 00 00	"    "		db	$00, $00, $00, $00
ED9F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDA3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDA7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDAB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDAF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDB3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDB7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDBB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDBF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDC3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDC7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDCB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDCF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDD3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDD7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDDB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDDF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDE3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDE7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDEB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDEF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDF3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDF7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDFB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EDFF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE03 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE07 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE0B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE0F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE13 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE17 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE1B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE1F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE23 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE27 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE2B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE2F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE33 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE37 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE3B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE3F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE43 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE47 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE4B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE4F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE53 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE57 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE5B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE5F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE63 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE67 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE6B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE6F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE73 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE77 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE7B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE7F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE83 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE87 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE8B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE8F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE93 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE97 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE9B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EE9F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEA3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEA7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEAB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEAF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEB3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEB7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEBB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEBF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEC3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEC7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EECB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EECF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EED3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EED7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEDB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEDF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEE3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEE7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEEB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEEF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEF3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEF7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEFB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EEFF : 00		" "		db	$00
				;
EF00 : CE FF FF		"   "		ldx	#$FFFF
EF03 : 5F		"_"		clrb
EF04				LEF04:
EF04 : E9 00		"  "		adcb	$00,x
EF06 : 09		" "		dex
EF07 : 8C F0 00		"   "		cpx	#$F000
EF0A : 26 F8		"& "		bne	LEF04
EF0C : E7 00		"  "		stab	$00,x
EF0E : 3E		">"		wai
				;
EF0F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF13 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF17 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF1B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF1F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF23 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF27 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF2B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF2F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF33 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF37 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF3B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF3F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF43 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF47 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF4B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF4F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF53 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF57 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF5B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF5F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF63 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF67 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF6B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF6F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF73 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF77 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF7B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF7F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF83 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF87 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF8B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF8F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF93 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF97 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF9B : 00 00 00 00	"    "		db	$00, $00, $00, $00
EF9F : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFA3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFA7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFAB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFAF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFB3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFB7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFBB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFBF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFC3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFC7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFCB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFCF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFD3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFD7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFDB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFDF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFE3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFE7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFEB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFEF : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFF3 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFF7 : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFFB : 00 00 00 00	"    "		db	$00, $00, $00, $00
EFFF : 00		" "		db	$00
				;
F000 : D2
;*************************************;
; RESET org F001
;*************************************; 
F001 : 0F         sei           ;set interrupt mask I=1  
F002 : 8E 00 FF   lds	#$00FF    ;load stack pointer with 00FFh
F005 : CE 20 00   ldx	#$2000    ;load X with 2000h PIA addr (2002 is DAC output SOUND)
F008 : 6F 01      clr	$01,x     ;clr (00) X + 01h (2001) PIA CR port A
F00A : 6F 03      clr	$03,x     ;clr (00) X + 03h (2003) PIA CR port B
F00C : 86 FF      ldaa	#$FF    ;load A with FFh
F00E : A7 02      staa	$02,x   ;store A in addr X + 02h (2002) PIA port B out (DAC sound)
F010 : 6F 00      clr	$00,x     ;clr (00) X + 00h (2000) PIA port A in (sound select)
F012 : 86 37      ldaa	#$37    ;load A with 37h
F014 : A7 01      staa	$01,x   ;store A in addr X + 01h (2001) PIA CR port A
F016 : 86 3C      ldaa	#$3C    ;load A with 3Ch
F018 : A7 03      staa	$03,x   ;store A in addr X + 03h (2003) PIA CR port B
F01A : CE 00 FF   ldx	#$00FF    ;load X with 00FFh
;RSTCLR LF01D:
F01D : 6F 00      clr	$00,x     ;clear addr X + 00h
F01F : 09         dex           ;decr X
F020 : 26 FB      bne	LF01D     ;branch Z=0 RSTCLR
F022 : 7A 00 81   dec	$0081     ;decr value in addr 0081
F025 : 7A 00 80   dec	$0080     ;decr value in addr 0080
F028 : 7A 00 80   dec	$0080     ;decr value in addr 0080
F02B : 0E         cli           ;clear interrupt I=0
F02C : 20 09      bra	LF037     ;branch always IRQ1
;*************************************;
;IRQ
;*************************************; 
F02E : 8E 00 FF   lds	#$00FF    ;load stack pointer with 00FFh
F031 : B6 20 00   ldaa	$2000   ;load A with value in addr 2000
F034 : 0E         cli           ;clear interrupt I=0
F035 : 8D 20      bsr	LF057     ;branch sub
;IRQ1 LF037:
F037 : 20 FE      bra	LF037     ;branch always IRQ1
;*************************************;
;NMI
;*************************************; 
F039 : 0F         sei           ;set interrupt mask I=1  
F03A : 8E 00 FF   lds	#$00FF    ;load stack pointer with 00FFh
F03D : 4F         clra          ;clear A
;NMI1 LF03E:
F03E : CE FF FF   ldx	#$FFFF    ;load X with FFFFh
F041 : 5F         clrb          ;clear A
;NMI2 LF042:
F042 : E9 00      adcb	$00,x   ;B = Carry + B + addr X +00h
F044 : 09         dex           ;decr X
F045 : 8C F0 00   cpx	#$F000    ;compare X with value F000h
F048 : 26 F8      bne	LF042     ;branch Z=0 NMI2
F04A : E1 00      cmpb	$00,x   ;compare B with value in addr X + 00h
F04C : 27 01      beq	LF04F     ;branch Z=1 NMI3
F04E : 3E		      wai           ;wait interrupt
;NMI3 LF04F:
F04F : 4C         inca          ;incr A
F050 : 36         psha          ;push A into stack then SP - 1
F051 : BD F0 57   jsr	LF057     ;jump sub NMI4
F054 : 32         pula          ;SP + 1 pull stack into A
F055 : 20 E7      bra	LF03E     ;branch always NMI1
;NMI4 LF057:
F057 : 81 01      cmpa	#$01    ;compare A with value 01h
F059 : 25 4A      bcs	LF0A5     ;branch C=1 NMIC
F05B : 22 03      bhi	LF060     ;branch C=0 and Z=0 NMI5
F05D : 7E F0 EC   jmp	LF0EC     ;jump PARAM below
;NMI5 LF060:
F060 : 81 19      cmpa	#$19    ;compare A with value 19h
F062 : 22 08      bhi	LF06C     ;branch C=0 and Z=0 NMI6
F064 : 80 02      suba	#$02    ;subtract A with value 02h
F066 : BD F1 0A   jsr	LF10A     ;jump sub PARAM below
F069 : 7E F1 70   jmp	LF170     ;jump SYNTH below
;NMI6 LF06C:
F06C : 81 2F      cmpa	#$2F    ;compare A with value 2Fh
F06E : 22 05      bhi	LF075     ;branch C=0 and Z=0 NMI7
F070 : 80 1A      suba	#$1A    ;subtract A with value 1Ah
F072 : 7E E3 DE   jmp	LE3DE     ;jump PARAM top mem
;NMI7 LF075:
F075 : 81 52      cmpa	#$52    ;compare A with value 52h
F077 : 22 0D      bhi	LF086     ;branch C=0 and Z=0 NMI8
F079 : 80 30      suba	#$30    ;subtract A with value 30h
F07B : CE F0 A6   ldx	#$F0A6    ;load X with value F0A6h (vect jump table below) (F54E) 
F07E : 48         asla          ;arith shift left A (bit0 is 0)
F07F : BD E1 89   jsr	LE189     ;jump sub CALCOS top mem
F082 : EE 00      ldx	$00,x     ;load X with addr X + 00h
F084 : 6E 00      jmp	$00,x     ;jump addr X + 00h
;NMI8 LF086:
F086 : 81 54      cmpa	#$54    ;compare A with value 54h
F088 : 22 1B      bhi	LF0A5     ;branch C=0 and Z=0 NMIC
F08A : CE 00 90   ldx	#$0090    ;load X with value 0090h
F08D : DF 8E      stx	$8E       ;store X in addr 8E
F08F : 81 53      cmpa	#$53    ;compare A with value 53h
F091 : 26 05      bne	LF098     ;branch Z=0 NMI9
F093 : CE E3 88   ldx	#$E388    ;load X with value E388h (VVECT tables?)    
F096 : 20 03      bra	LF09B     ;branch always NMIA
;NMI9 LF098:
F098 : CE E3 91   ldx	#$E391    ;load X with value E391h (VVECT tables?)
;NMIA LF09B:
F09B : C6 09      ldab	#$09    ;load B with value 09h
F09D : BD F2 3B   jsr	LF23B     ;jump sub UTIL1
F0A0 : BD E3 3B   jsr	LE33B     ;jump sub SYNTH top mem
;NMIB LF0A3:
F0A3 : 20 FE      bra	LF0A3     ;branch always NMIB
;NMIC LF0A5:
F0A5 : 39				  rts           ;return subroutine
;*************************************;
;vect jump table to locations
;*************************************;
F0A6 : F5 4E                    ;PRMSYNx1
F0A8 : F5 59                    ;PRMCLRDAC
F0AA : F5 F3                    ;PRMCLRDAC 
F0AC : F6 B5                    ;PRMLDXx1
F0AE : F5 6C                    ;PRMSYNx3
F0B0 : F5 70                    ;PRMSYNx4 
F0B2 : F5 74                    ;SYNTH below 
F0B4 : F6 BD                    ;PRMLDXx2
F0B6 : F6 C5                    ;PRMLDXx3 
F0B8 : F7 44                    ;SYNTH below
F0BA : F7 BB                    ;SYNTH below
F0BC : F8 26                    ;PRMSYNx5 
F0BE : F8 38                    ;PRMSYNx6
F0C0 : F8 CB                    ;SYNTH 
F0C2 : F9 3F                    ;PRMJSR
F0C4 : E1 98                    ;SYNTH above
F0C6 : F9 00                    ;PARAM below
F0C8 : F9 04                    ;PARAM below
F0CA : F9 08                    ;PARAM below
F0CC : F9 0C                    ;PARAM below
F0CE : FF 94 
F0D0 : E2	20 
F0D2 : E2 35		"5"		txs
F0D4 : E2 47		" G"		sbcb	$47,x
F0D6 : E2 7E		" ~"		sbcb	$7E,x
F0D8 : E1 6D		" m"		cmpb	$6D,x
F0DA : E1 B0		"  "		cmpb	$B0,x
F0DC : E1 D4		"  "		cmpb	$D4,x
F0DE : E1 FE		"  "		cmpb	$FE,x
F0E0 : E2 0D		"  "		sbcb	$0D,x
F0E2 : E2 92		"  "		sbcb	$92,x
F0E4 : E2 CB		"  "		sbcb	$CB,x
F0E6 : E2 EA		"  "		sbcb	$EA,x
F0E8 : E3	9A
F0EA : E0	CD		" "		db	$CD
;*************************************;
;PARAM
;*************************************;
;LF0EC:
F0EC : CE F1 02   ldx	#$F102    ;load X with value F102h (FDB data below)
;LF0EF:
F0EF : A6 00		  ldaa	$00,x
F0F1 : 26 01		  bne	LF0F4
F0F3 : 39				  rts           ;return subroutine
;*************************************;
;PARAM 
;*************************************;
;LF0F4:
F0F4 : 81 01		  cmpa	#$01
F0F6 : 27 07		  beq	LF0FF     ;branch Z=1 
F0F8 : DF 82		  stx	X0082
F0FA : BD F0 57   jsr	LF057     ;jump sub NMI4
F0FD : DE 82		  ldx	X0082
;LF0FF:
F0FF : 08		" "		inx
F100 : 20 ED		  bra	LF0EF     ;branch always PARAM above
;*************************************;
;FDB data
;*************************************;
F102 : 03 06 0A	04 0E	05 09	00
;*************************************;
;PARAM
;*************************************;
;LF10A:
F10A : 16		" "		tab
F10B : 58		"X"		aslb
F10C : 1B		" "		aba
F10D : 1B		" "		aba
F10E : 1B		" "		aba
F10F : CE F3 87   ldx	#$F387    ;load X with value F387h (FDB data below)
F112 : BD E1 89   jsr	LE189     ;jump sub CALCOS top mem
F115 : A6 00		  ldaa	$00,x
F117 : 16		" "		tab
F118 : 84 0F		  anda	#$0F
F11A : 97 92		  staa	X0092
F11C : 54		"T"		lsrb
F11D : 54		"T"		lsrb
F11E : 54		"T"		lsrb
F11F : 54		"T"		lsrb
F120 : D7 91		  stab	X0091
F122 : A6 01		  ldaa	$01,x
F124 : 16		" "		tab
F125 : 54		"T"		lsrb
F126 : 54		"T"		lsrb
F127 : 54		"T"		lsrb
F128 : 54		"T"		lsrb
F129 : D7 93		  stab	X0093
F12B : 84 0F		  anda	#$0F
F12D : 97 87		  staa	X0087
F12F : DF 8A		  stx	X008A
F131 : CE F2 4F   ldx	#$F24F    ;load X with value F24Fh (FDB data below)
;LF134:
F134 : 7A 00 87   dec	X0087
F137 : 2B 08		  bmi	LF141     ;branch N=1 PARAM below
F139 : A6 00		  ldaa	$00,x
F13B : 4C		"L"		inca
F13C : BD E1 89   jsr	LE189     ;jump sub CALCOS top mem
F13F : 20 F3		  bra	LF134     ;
;*************************************;
; PARAM
;*************************************;
;LF141:
F141 : DF 96		  stx	X0096
F143 : BD F1 FA   jsr	LF1FA     ;jump sub PARAM below
F146 : DE 8A		  ldx	X008A
F148 : A6 02		  ldaa	$02,x
F14A : 97 98		  staa	X0098
F14C : BD F2 0C   jsr	LF20C     ;jump sub PARAM below
F14F : DE 8A		  ldx	X008A
F151 : A6 03		  ldaa	$03,x
F153 : 97 94		  staa	X0094
F155 : A6 04		  ldaa	$04,x
F157 : 97 95		  staa	X0095
F159 : A6 05		  ldaa	$05,x
F15B : 16		" "		tab
F15C : A6 06		  ldaa	$06,x
F15E : CE F4 2F   ldx	#$F42F    ;load X with value F42Fh (FDB data)
F161 : BD E1 89   jsr	LE189     ;jump sub CALCOS top mem
F164 : 17		" "		tba
F165 : DF 99		  stx	X0099
F167 : 7F 00 A1   clr	X00A1
F16A : BD E1 89   jsr	LE189     ;jump sub CALCOS top mem
F16D : DF 9B		  stx	X009B
F16F : 39				  rts           ;return subroutine
;*************************************;
;SYNTH (same as ROM1 SYNTH9)
;*************************************;
;LF170:
F170 : 96 91		  ldaa	X0091
F172 : 97 A0		  staa	X00A0
;LF174:
F174 : DE 99		  ldx	X0099
F176 : DF 8C		  stx	X008C
;LF178:
F178 : DE 8C		  ldx	X008C
F17A : A6 00		  ldaa	$00,x
F17C : 9B A1		  adda	X00A1
F17E : 97 9F		  staa	X009F
F180 : 9C 9B		  cpx	X009B
F182 : 27 26		  beq	LF1AA     ;branch Z=1 PRMCSC
F184 : D6 92		  ldab	X0092
F186 : 08				  inx
F187 : DF 8C		  stx	X008C
;LF189:
F189 : CE 00 A2   ldx	#$00A2
;LF18C:
F18C : 96 9F		  ldaa	X009F
;LF18E:
F18E : 4A				  deca
F18F : 26 FD		  bne	LF18E
F191 : A6 00		  ldaa	$00,x
F193 : B7 20 02   staa	X2002   ;store A in DAC output SOUND
F196 : 08				  inx           ;incr X
F197 : 9C 9D		  cpx	X009D
F199 : 26 F1		  bne	LF18C
F19B : 5A				  decb
F19C : 27 DA		  beq	LF178
F19E : 08				  inx           ;incr X
F19F : 09				  dex           ;decr X
F1A0 : 08				  inx           ;incr X
F1A1 : 09				  dex           ;decr X
F1A2 : 08				  inx           ;incr X
F1A3 : 09				  dex           ;decr X
F1A4 : 08				  inx           ;incr X
F1A5 : 09				  dex           ;decr X
F1A6 : 01				  nop
F1A7 : 01				  nop
F1A8 : 20 DF		  bra	LF189
;*************************************;
;PRMCSC (param cascade) (similar to ROM1 PARAM14)
;*************************************;
;LF1AA:
F1AA : 96 93		  ldaa	$93     ;load A with value at addr 93
F1AC : 8D 5E		  bsr	LF20C     ;branch sub PARAM19
F1AE : 7A 00 A0   dec	$00A0
F1B1 : 26 C1		  bne	LF174     ;branch Z=0 SYNTH above
F1B3 : 96 94		  ldaa	$94
F1B5 : 27 42		  beq	LF1F9     ;branch Z=1 PARAM below rts
F1B7 : 7A 00 95   dec	$0095
F1BA : 27 3D		  beq	LF1F9     ;branch Z=1 PARAM below rts
F1BC : 9B A1		  adda	$A1
F1BE : 97 A1		  staa	$A1
F1C0 : DE 99		  ldx	$99
F1C2 : 5F				  clrb
;LF1C3:
F1C3 : 96 A1		  ldaa	$A1
F1C5 : 7D 00 94   tst	$0094
F1C8 : 2B 06		  bmi	LF1D0     ;branch N=1 
F1CA : AB 00		  adda	$00,x
F1CC : 25 08		  bcs	LF1D6     ;branch C=1 
F1CE : 20 0B		  bra	LF1DB     ;branch always
;LF1D0:
F1D0 : AB 00		  adda	$00,x
F1D2 : 27 02		  beq	LF1D6     ;branch Z=1 
F1D4 : 25 05		  bcs	LF1DB     ;branch C=1
;LF1D6:
F1D6 : 5D				  tstb
F1D7 : 27 08		  beq	LF1E1     ;branch Z=1 
F1D9 : 20 0F		  bra	LF1EA     ;branch always PARAM below
;LF1DB:
F1DB : 5D				  tstb
F1DC : 26 03		  bne	LF1E1     ;branch Z=0 
F1DE : DF 99		  stx	$99
F1E0 : 5C				  incb
;LF1E1:
F1E1 : 08				  inx
F1E2 : 9C 9B		  cpx	$9B
F1E4 : 26 DD		  bne	LF1C3     ;branch Z=0
F1E6 : 5D				  tstb
F1E7 : 26 01		  bne	LF1EA     ;branch Z=0 PARAM below
F1E9 : 39				  rts           ;return subroutine
;*************************************;
;PARAM 
;*************************************;
;LF1EA:
F1EA : DF 9B		  stx	X009B
F1EC : 96 93		  ldaa	X0093
F1EE : 27 06		  beq	LF1F6     ;branch Z=1
F1F0 : 8D 08		  bsr	LF1FA     ;branch sub PARAM below
F1F2 : 96 98		  ldaa	X0098
F1F4 : 8D 16		  bsr	LF20C     ;branch sub PARAM below
;LF1F6:
F1F6 : 7E F1 70   jmp	LF170     ;jump SYNTH above
;LF1F9:
F1F9 : 39				  rts           ;return subroutine
;*************************************;
;PARAM 
;*************************************;
;LF1FA:
F1FA : CE 00 A2   ldx	#$00A2
F1FD : DF 8E		  stx	X008E
F1FF : DE 96		  ldx	X0096
F201 : E6 00		  ldab	$00,x
F203 : 08		" "		inx
F204 : BD F2 3B   jsr	LF23B     ;jump sub UTIL1
F207 : DE 8E		  ldx	X008E
F209 : DF 9D		  stx	X009D
F20B : 39				  rts           ;return subroutine
;*************************************;
;PARAM (similar to ROM1 PARAM19)
;*************************************;
;LF20C:
F20C : 4D				  tsta
F20D : 27 2B		  beq	LF23A
F20F : DE 96		  ldx	X0096
F211 : DF 8C		  stx	X008C
F213 : CE 00 A2   ldx	#$00A2
F216 : 97 88		  staa	X0088
;LF218:
F218 : DF 8E		  stx	X008E
F21A : DE 8C		  ldx	X008C
F21C : D6 88		  ldab	X0088
F21E : D7 87		  stab	X0087
F220 : E6 01		  ldab	$01,x
F222 : 54				  lsrb
F223 : 54				  lsrb
F224 : 54				  lsrb
F225 : 54				  lsrb
F226 : 08				  inx
F227 : DF 8C		  stx	X008C
F229 : DE 8E		  ldx	X008E
F22B : A6 00		  ldaa	$00,x
;LF22D:
F22D : 10				  sba
F22E : 7A 00 87   dec	X0087
F231 : 26 FA		  bne	LF22D
F233 : A7 00		  staa	$00,x
F235 : 08				  inx
F236 : 9C 9D		  cpx	X009D
F238 : 26 DE		  bne	LF218
;LF23A:
F23A : 39				  rts           ;return subroutine
;*************************************;
;UTIL1 (same as ROM1 UTIL1)
;*************************************;
F23B : 36				  psha          ;push A into stack then SP - 1
;UTL11 LF23C:
F23C : A6 00      ldaa	$00,x   ;load A in addr X + 00h
F23E : DF 8C      stx	$8C       ;store X in addr 0C
F240 : DE 8E      ldx	$8E       ;load X from value in addr 8E
F242 : A7 00      staa	$00,x   ;store A in addr X + 00h
F244 : 08				  inx           ;incr X
F245 : DF 8E      stx	$8E       ;store X in addr 8E
F247 : DE 8C      ldx	$8C       ;load X from value in addr 8C
F249 : 08				  inx           ;incr X
F24A : 5A				  decb          ;decr B
F24B : 26 EF		  bne	LF23C     ;branch Z=0 UTL11
F24D : 32				  pula          ;SP + 1 pull stack into A
F24E : 39				  rts           ;return subroutine
;*************************************;
; FDB data
;*************************************;
F24F : 08		" "		inx
F250 : 7F D9 FF		"   "		clr	XD9FF
F253 : D9 7F		"  "		adcb	X007F
F255 : 24 00		"$ "		bcc	LF257
F257				LF257:
F257 : 24 08		"$ "		bcc	LF261
				;
F259 : 00		" "		db	$00
				;
F25A : 40		"@"		nega
F25B : 80 00		"  "		suba	#$00
F25D : FF 00 80		"   "		stx	X0080
F260 : 40		"@"		nega
F261				LF261:
F261 : 10		" "		sba
F262 : 7F B0 D9		"   "		clr	XB0D9
F265 : F5 FF F5		"   "		bitb	XFFF5
F268 : D9 B0		"  "		adcb	X00B0
F26A : 7F 4E 24		" N$"		clr	X4E24
F26D : 09		" "		dex
				;
F26E : 00		" "		db	$00
				;
F26F : 09		" "		dex
F270 : 24 4E		"$N"		bcc	LF2C0
F272 : 10		" "		sba
F273 : 7F C5 EC		"   "		clr	XC5EC
F276 : E7 BF		"  "		stab	$BF,x
F278 : 8D 6D		" m"		bsr	LF2E7
F27A : 6A 7F		"j "		dec	$7F,x
F27C : 94 92		"  "		anda	X0092
				;
F27E : 71		"q"		db	$71
				;
F27F : 40		"@"		nega
F280 : 17		" "		tba
				;
F281 : 12		" "		db	$12
				;
F282 : 39		"9"		rts
				;
F283 : 10		" "		sba
F284 : FF FF FF		"   "		stx	XFFFF
F287 : FF 00 00		"   "		stx	X0000
				;
F28A : 00 00		"  "		db	$00, $00
				;
F28C : FF FF FF		"   "		stx	XFFFF
F28F : FF 00 00		"   "		stx	X0000
				;
F292 : 00 00		"  "		db	$00, $00
				;
F294 : 48		"H"		asla
F295 : 8A 95		"  "		oraa	#$95
F297 : A0 AB		"  "		suba	$AB,x
F299 : B5 BF C8		"   "		bita	XBFC8
F29C : D1 DA		"  "		cmpb	X00DA
F29E : E1 E8		"  "		cmpb	$E8,x
F2A0 : EE F3		"  "		ldx	$F3,x
F2A2 : F7 FB FD		"   "		stab	XFBFD
F2A5 : FE FF FE		"   "		ldx	XFFFE
				;
F2A8 : FD		" "		db	$FD
				;
F2A9 : FB F7 F3		"   "		addb	XF7F3
F2AC : EE E8		"  "		ldx	$E8,x
F2AE : E1 DA		"  "		cmpb	$DA,x
F2B0 : D1 C8		"  "		cmpb	X00C8
F2B2 : BF B5 AB		"   "		sts	XB5AB
F2B5 : A0 95		"  "		suba	$95,x
F2B7 : 8A 7F		"  "		oraa	#$7F
				;
F2B9 : 75		"u"		db	$75
				;
F2BA : 6A 5F		"j_"		dec	$5F,x
F2BC : 54		"T"		lsrb
F2BD : 4A		"J"		deca
F2BE : 40		"@"		nega
F2BF : 37		"7"		pshb
F2C0				LF2C0:
F2C0 : 2E 25		".%"		bgt	LF2E7
				;
F2C2 : 1E		" "		db	$1E
				;
F2C3 : 17		" "		tba
F2C4 : 11		" "		cba
F2C5 : 0C		" "		clc
F2C6 : 08		" "		inx
				;
F2C7 : 04 02		"  "		db	$04, $02
				;
F2C9 : 01		" "		nop
				;
F2CA : 00		" "		db	$00
				;
F2CB : 01		" "		nop
				;
F2CC : 02 04		"  "		db	$02, $04
				;
F2CE : 08		" "		inx
F2CF : 0C		" "		clc
F2D0 : 11		" "		cba
F2D1 : 17		" "		tba
				;
F2D2 : 1E		" "		db	$1E
				;
F2D3 : 25 2E		"%."		bcs	LF303
F2D5 : 37		"7"		pshb
F2D6 : 40		"@"		nega
F2D7 : 4A		"J"		deca
F2D8 : 54		"T"		lsrb
F2D9 : 5F		"_"		clrb
F2DA : 6A 75		"ju"		dec	$75,x
F2DC : 7F 10 59		"  Y"		clr	X1059
				;
F2DF : 7B		"{"		db	$7B
				;
F2E0 : 98 AC		"  "		eora	X00AC
				;
F2E2 : B3		" "		db	$B3
				;
F2E3 : AC 98		"  "		cpx	$98,x
				;
F2E5 : 7B		"{"		db	$7B
				;
F2E6 : 59		"Y"		rolb
F2E7				LF2E7:
F2E7 : 37		"7"		pshb
F2E8 : 19		" "		daa
F2E9 : 06		" "		tap
				;
F2EA : 00		" "		db	$00
				;
F2EB : 06		" "		tap
F2EC : 19		" "		daa
F2ED : 37		"7"		pshb
F2EE : 08		" "		inx
F2EF : FF FF FF		"   "		stx	XFFFF
F2F2 : FF 00 00		"   "		stx	X0000
				;
F2F5 : 00 00		"  "		db	$00, $00
				;
F2F7 : 10		" "		sba
F2F8 : 76 FF B8		"v  "		ror	XFFB8
F2FB : D0 9D		"  "		subb	X009D
F2FD : E6 6A		" j"		ldab	$6A,x
F2FF : 82 76		" v"		sbca	#$76
F301 : EA 81		"  "		orab	$81,x
F303				LF303:
F303 : 86 4E		" N"		ldaa	#$4E
F305 : 9C 32		" 2"		cpx	X0032
F307 : 63 10		"c "		com	$10,x
				;
F309 : 00		" "		db	$00
				;
F30A : F4 00 E8		"   "		andb	X00E8
				;
F30D : 00 DC 00		"   "		db	$00, $DC, $00
				;
F310 : E2 00		"  "		sbcb	$00,x
				;
F312 : DC 00		"  "		db	$DC, $00
				;
F314 : E8 00		"  "		eorb	$00,x
F316 : F4 00 00		"   "		andb	X0000
				;
F319 : 1C		" "		db	$1C
				;
F31A : 80 40		" @"		suba	#$40
F31C : 29 1B		") "		bvs	LF339
F31E : 10		" "		sba
F31F : 09		" "		dex
F320 : 06		" "		tap
				;
F321 : 04		" "		db	$04
				;
F322 : 07		" "		tpa
F323 : 0C		" "		clc
				;
F324 : 12 1E		"  "		db	$12, $1E
				;
F326 : 30		"0"		tsx
F327 : 49		"I"		rola
F328 : A4 C9		"  "		anda	$C9,x
F32A : DF EB		"  "		stx	X00EB
F32C : F6 FB FF		"   "		ldab	XFBFF
F32F : FF FB F5		"   "		stx	XFBF5
F332 : EA DD		"  "		orab	$DD,x
				;
F334 : C7		" "		db	$C7
				;
F335 : 9B 0C		"  "		adda	X000C
				;
F337 : 00		" "		db	$00
				;
F338 : 50		"P"		negb
F339				LF339:
F339 : 60 B0		"` "		neg	$B0,x
F33B : 20 20		"  "		bra	LF35D
				;
F33D : F0 90 80		"   "		subb	X9080
F340 : C0 50		" P"		subb	#$50
F342 : 70 10 3C		"p <"		neg	X103C
F345 : 10		" "		sba
F346 : 17		" "		tba
F347 : 3F		"?"		swi
F348 : 70 92 95		"p  "		neg	X9295
F34B : 7F 7C 7E		" |~"		clr	X7C7E
F34E : 8A BE		"  "		oraa	#$BE
F350 : E7 EF		"  "		stab	$EF,x
F352 : C5 7F		"  "		bitb	#$7F
F354 : 08		" "		inx
				;
F355 : 00		" "		db	$00
				;
F356 : 20 40		" @"		bra	LF398
				;
F358 : 60 80		"` "		neg	$80,x
F35A : A0 C0		"  "		suba	$C0,x
F35C : E0 08		"  "		subb	$08,x
F35E : FF DF BF		"   "		stx	XDFBF
F361 : 9F 7F		"  "		sts	X007F
F363 : 5F		"_"		clrb
F364 : 3F		"?"		swi
				;
F365 : 1F		" "		db	$1F
				;
F366 : 20 4C		" L"		bra	LF3B4
				;
F368 : 45 41 41		"EAA"		db	$45, $41, $41
				;
F36B : 43		"C"		coma
F36C : 47		"G"		asra
F36D : 77 87 90		"w  "		asr	X8790
F370 : 97 A1		"  "		staa	X00A1
F372 : A7 AE		"  "		staa	$AE,x
F374 : B5 B8 BC		"   "		bita	XB8BC
F377 : BE BF C1		"   "		lds	XBFC1
F37A : C2 C2		"  "		sbcb	#$C2
F37C : C2 C1		"  "		sbcb	#$C1
F37E : BF BE BB		"   "		sts	XBEBB
F381 : B6 B1 AC		"   "		ldaa	XB1AC
F384 : A4 9E		"  "		anda	$9E,x
				;
F386 : 93 
;*************************************;
; FDB data
;*************************************;
F387 : 03 15		"   "		db	$93, $03, $15
				;
F389 : 11		" "		cba
F38A : FF 00 0D		"   "		stx	X000D
F38D : 26 14		"& "		bne	LF3A3
F38F : 0A		" "		clv
				;
F390 : 00 00 00 04	"    "		db	$00, $00, $00, $04
F394 : 1E 14		"  "		db	$1E, $14
				;
F396 : 0A		" "		clv
				;
F397 : 00 00 00 04	"    "		db	$00, $00, $00, $04
				;
F39B : 22 14		"" "		bhi	LF3B1
				;
F39D : 02		" "		db	$02
				;
F39E : 09		" "		dex
				;
F39F : 00 00		"  "		db	$00, $00
				;
F3A1 : 09		" "		dex
F3A2 : 33		"3"		pulb
F3A3				LF3A3:
F3A3 : 11		" "		cba
				;
F3A4 : 02 00 00 00	"    "		db	$02, $00, $00, $00
				;
F3A8 : 28 3C		"(<"		bvc	LF3E6
				;
F3AA : 1F		" "		db	$1F
				;
F3AB : 0B		" "		sev
F3AC : 09		" "		dex
				;
F3AD : 00 00		"  "		db	$00, $00
				;
F3AF : 0F		" "		sei
F3B0 : 64 18		"d "		lsr	$18,x
				;
F3B2 : 00 05 02		"   "		db	$00, $05, $02
				;
F3B5 : 01		" "		nop
F3B6 : 20 73		" s"		bra	LF42B
				;
F3B8 : 11		" "		cba
				;
F3B9 : 02 00 00 00	"    "		db	$02, $00, $00, $00
F3BD : 18 93 15 02	"    "		db	$18, $93, $15, $02
F3C1 : 05 00 00		"   "		db	$05, $00, $00
				;
F3C4 : 16		" "		tab
F3C5 : AB 81		"  "		adda	$81,x
				;
F3C7 : 02 00 00 00	"    "		db	$02, $00, $00, $00
F3CB : 04		" "		db	$04
				;
F3CC : C1 81		"  "		cmpb	#$81
F3CE : 24 00		"$ "		bcc	LF3D0
				;
F3D0				LF3D0:
F3D0 : 00 00		"  "		db	$00, $00
				;
F3D2 : 16		" "		tab
F3D3 : E2 11		"  "		sbcb	$11,x
				;
F3D5 : 15 00 00 00	"    "		db	$15, $00, $00, $00
				;
F3D9 : 63 1E		"c "		com	$1E,x
F3DB : 81 29		" )"		cmpa	#$29
				;
F3DD : 00 00 00		"   "		db	$00, $00, $00
				;
F3E0 : 16		" "		tab
F3E1 : E2 11		"  "		sbcb	$11,x
F3E3 : 11		" "		cba
				;
F3E4 : 00 00 00		"   "		db	$00, $00, $00
				;
F3E7 : 63 1E		"c "		com	$1E,x
F3E9 : 16		" "		tab
				;
F3EA : 02 00 00 00	"    "		db	$02, $00, $00, $00
				;
F3EE : 7C 64 6A		"|dj"		inc	X646A
F3F1 : 10		" "		sba
				;
F3F2 : 02 00 02		"   "		db	$02, $00, $02
				;
F3F5 : 06		" "		tap
				;
F3F6				XF3F6:
F3F6 : 14		" "		db	$14
				;
F3F7 : F1 19 01		"   "		cmpb	X1901
				;
F3FA : 00 00		"  "		db	$00, $00
				;
F3FC : 20 6A		" j"		bra	LF468
				;
F3FE : 52		"R"		db	$52
				;
F3FF : 36		"6"		psha
				;
F400 : 00 00 00		"   "		db	$00, $00, $00
				;
F403 : 10		" "		sba
F404 : E2 A3		"  "		sbcb	$A3,x
F406 : 19		" "		daa
				;
F407 : 05		" "		db	$05
				;
F408 : 01		" "		nop
F409 : 01		" "		nop
F40A : 10		" "		sba
F40B : F8 16 82		"   "		eorb	X1682
				;
F40E : 03		" "		db	$03
				;
F40F : 0E		" "		cli
F410 : 01		" "		nop
F411 : 0E		" "		cli
F412 : F8 63 26		" c&"		eorb	X6326
F415 : 06		" "		tap
				;
F416 : 00 00		"  "		db	$00, $00
				;
F418 : 10		" "		sba
F419 : F8 23 15		" # "		eorb	X2315
				;
F41C : 00 02		"  "		db	$00, $02
				;
F41E : 07		" "		tpa
				;
F41F : 03 1E		"  "		db	$03, $1E
				;
F421 : 11		" "		cba
				;
F422 : 05		" "		db	$05
				;
F423 : 11		" "		cba
F424 : 01		" "		nop
F425 : 0F		" "		sei
F426 : 01		" "		nop
				;
F427 : 00		" "		db	$00
				;
F428				XF428:
F428 : F1 19 00		"   "		cmpb	X1900
				;
F42B				LF42B:
F42B : 00 00		"  "		db	$00, $00
				;
F42D : 0E		" "		cli
				;
F42E : 1E		" "		db	$1E
;*************************************;
; FDB data
;*************************************;
F42F : 08		" "		inx
F430 : 40		"@"		nega
F431 : 08		" "		inx
F432 : 40		"@"		nega
F433 : 08		" "		inx
F434 : 40		"@"		nega
F435 : 08		" "		inx
F436 : 40		"@"		nega
F437 : 08		" "		inx
F438 : 40		"@"		nega
F439 : 08		" "		inx
F43A : 40		"@"		nega
F43B : 08		" "		inx
F43C : 40		"@"		nega
F43D : 08		" "		inx
F43E : 40		"@"		nega
F43F : 08		" "		inx
F440 : 40		"@"		nega
F441 : 08		" "		inx
F442 : 40		"@"		nega
F443 : 17		" "		tba
				;
F444 : 18		" "		db	$18
				;
F445 : 19		" "		daa
				;
F446 : 1A		" "		db	$1A
				;
F447 : 1B		" "		aba
				;
F448 : 1C 00 00 00	"    "		db	$1C, $00, $00, $00
F44C : 00		" "		db	$00
				;
F44D : 20 18		"  "		bra	LF467
F44F : 20 01		"  "		bra	LF452
				;
F451 : 01		" "		nop
F452				LF452:
F452 : 30		"0"		tsx
F453 : 28 30		"(0"		bvc	LF485
F455 : 01		" "		nop
F456 : 01		" "		nop
				;
F457 : 02 02 03 04	"    "		db	$02, $02, $03, $04
F45B : 05		" "		db	$05
				;
F45C : 06		" "		tap
F45D : 07		" "		tpa
F45E : 08		" "		inx
F45F : 09		" "		dex
F460 : 0A		" "		clv
F461 : 0C		" "		clc
F462 : 20 10		"  "		bra	LF474
				;
F464 : 0C		" "		clc
F465 : 0A		" "		clv
F466 : 08		" "		inx
F467				LF467:
F467 : 07		" "		tpa
F468				LF468:
F468 : 06		" "		tap
				;
F469 : 05 04		"  "		db	$05, $04
				;
F46B : 60 45		"`E"		neg	$45,x
F46D : 28 21		"(!"		bvc	LF490
F46F : 5D		"]"		tstb
				;
F470 : 42		"B"		db	$42
				;
F471 : 25 1E		"% "		bcs	LF491
F473 : 58		"X"		aslb
				;
F474				LF474:
F474 : 3D		"="		db	$3D
				;
F475 : 20 19		"  "		bra	LF490
				;
F477 : 60 38		"`8"		neg	$38,x
F479 : 28 14		"( "		bvc	LF48F
F47B : 4C		"L"		inca
F47C : 31		"1"		ins
				;
F47D : 14		" "		db	$14
				;
F47E : 0D		" "		sec
F47F : 40		"@"		nega
F480 : 25 08		"% "		bcs	LF48A
F482 : 01		" "		nop
F483 : 4C		"L"		inca
F484 : 31		"1"		ins
				;
F485				LF485:
F485 : 14		" "		db	$14
				;
F486 : 0D		" "		sec
F487 : 40		"@"		nega
F488 : 25 08		"% "		bcs	LF492
F48A				LF48A:
F48A : 01		" "		nop
F48B : 4C		"L"		inca
F48C : 31		"1"		ins
				;
F48D : 14		" "		db	$14
				;
F48E : 0D		" "		sec
F48F				LF48F:
F48F : 40		"@"		nega
F490				LF490:
F490 : 25 08		"% "		bcs	LF49A
F492				LF492:
F492 : 01		" "		nop
F493 : 0A		" "		clv
F494 : 09		" "		dex
F495 : 08		" "		inx
F496 : 07		" "		tpa
F497 : 06		" "		tap
				;
F498 : 05		" "		db	$05
				;
F499 : 06		" "		tap
F49A				LF49A:
F49A : 07		" "		tpa
F49B : 08		" "		inx
F49C : 09		" "		dex
F49D : 0A		" "		clv
F49E : 0A		" "		clv
F49F : 0A		" "		clv
F4A0 : 0A		" "		clv
F4A1 : 0A		" "		clv
F4A2 : 20 1F		"  "		bra	LF4C3
				;
F4A4 : 1E 1D 1C		"   "		db	$1E, $1D, $1C
				;
F4A7 : 1B		" "		aba
				;
F4A8 : 1A		" "		db	$1A
				;
F4A9 : 19		" "		daa
				;
F4AA : 18		" "		db	$18
				;
F4AB : 17		" "		tba
F4AC : 16		" "		tab
				;
F4AD : 15 14 13 12	"    "		db	$15, $14, $13, $12
				;
F4B1 : 11		" "		cba
F4B2 : 10		" "		sba
F4B3 : 0F		" "		sei
F4B4 : 0E		" "		cli
F4B5 : 0D		" "		sec
F4B6 : 0C		" "		clc
F4B7 : 0B		" "		sev
F4B8 : 0A		" "		clv
F4B9 : 09		" "		dex
F4BA : 08		" "		inx
F4BB : 07		" "		tpa
F4BC : 06		" "		tap
				;
F4BD : 05 05 05 05	"    "		db	$05, $05, $05, $05
F4C1 : 05		" "		db	$05
				;
F4C2 : 60 45		"`E"		neg	$45,x
F4C4 : 28 21		"(!"		bvc	LF4E7
F4C6 : 58		"X"		aslb
				;
F4C7 : 3D		"="		db	$3D
				;
F4C8 : 20 19		"  "		bra	LF4E3
				;
F4CA : 4C		"L"		inca
F4CB : 31		"1"		ins
				;
F4CC : 14		" "		db	$14
				;
F4CD : 0D		" "		sec
F4CE : 40		"@"		nega
F4CF : 25 08		"% "		bcs	LF4D9
F4D1 : 01		" "		nop
F4D2 : 34		"4"		des
				;
F4D3 : 1C		" "		db	$1C
				;
F4D4 : 08		" "		inx
F4D5 : 01		" "		nop
F4D6 : 28 15		"( "		bvc	LF4ED
F4D8 : 08		" "		inx
F4D9				LF4D9:
F4D9 : 01		" "		nop
				;
F4DA : 1E 02		"  "		db	$1E, $02
				;
F4DC : 1B		" "		aba
				;
F4DD : 04		" "		db	$04
				;
F4DE : 23 07		"# "		bls	LF4E7
				;
F4E0 : 1D		" "		db	$1D
				;
F4E1 : 01		" "		nop
F4E2 : 22 03		"" "		bhi	LF4E7
F4E4 : 19		" "		daa
F4E5 : 09		" "		dex
				;
F4E6 : 1F		" "		db	$1F
				;
F4E7				LF4E7:
F4E7 : 06		" "		tap
				;
F4E8 : 1A 05 1C		"   "		db	$1A, $05, $1C
				;
F4EB : 0B		" "		sev
				;
F4EC : 21		"!"		db	$21
				;
F4ED				LF4ED:
F4ED : 08		" "		inx
F4EE : 20 0A		"  "		bra	LF4FA
				;
F4F0 : 60 45		"`E"		neg	$45,x
F4F2 : 28 21		"(!"		bvc	LF515
F4F4 : 07		" "		tpa
F4F5 : 08		" "		inx
F4F6 : 09		" "		dex
F4F7 : 0A		" "		clv
F4F8 : 0C		" "		clc
F4F9 : 08		" "		inx
F4FA				LF4FA:
F4FA : 01		" "		nop
F4FB : 40		"@"		nega
				;
F4FC : 02 42 03		" B "		db	$02, $42, $03
				;
F4FF : 43		"C"		coma
				;
F500 : 04		" "		db	$04
				;
F501 : 44		"D"		lsra
				;
F502 : 05 45		" E"		db	$05, $45
				;
F504 : 06		" "		tap
F505 : 46		"F"		rora
F506 : 07		" "		tpa
F507 : 47		"G"		asra
F508 : 08		" "		inx
F509 : 48		"H"		asla
F50A : 09		" "		dex
F50B : 49		"I"		rola
F50C : 0A		" "		clv
F50D : 4A		"J"		deca
F50E : 0B		" "		sev
				;
F50F : 4B 00		"K "		db	$4B, $00
				;
F511 : 01		" "		nop
F512 : 01		" "		nop
				;
F513 : 02 02 04 04	"    "		db	$02, $02, $04, $04
				;
F517 : 08		" "		inx
F518 : 08		" "		inx
F519 : 10		" "		sba
F51A : 20 28		" ("		bra	LF544
				;
F51C : 30		"0"		tsx
				;
F51D : 38		"8"		db	$38
				;
F51E : 40		"@"		nega
F51F : 48		"H"		asla
F520 : 50		"P"		negb
F521 : 60 70		"`p"		neg	$70,x
F523 : 80 A0		"  "		suba	#$A0
F525 : B0 C0 14		"   "		suba	XC014
				;
F528 : 18		" "		db	$18
				;
F529 : 20 30		" 0"		bra	LF55B
				;
F52B : 40		"@"		nega
F52C : 50		"P"		negb
F52D : 40		"@"		nega
F52E : 30		"0"		tsx
F52F : 20 10		"  "		bra	LF541
				;
F531 : 0C		" "		clc
F532 : 0A		" "		clv
F533 : 08		" "		inx
F534 : 07		" "		tpa
F535 : 06		" "		tap
				;
F536 : 05		" "		db	$05
				;
F537 : 0C		" "		clc
F538 : 08		" "		inx
F539 : 80 10		"  "		suba	#$10
F53B : 78 18 70		"x p"		asl	X1870
F53E : 20 60		" `"		bra	LF5A0
				;
F540 : 28 58		"(X"		bvc	LF59A
F542 : 30		"0"		tsx
F543 : 50		"P"		negb
F544				LF544:
F544 : 40		"@"		nega
F545 : 10		" "		sba
F546 : 08		" "		inx
F547 : 01		" "		nop
F548 : 01		" "		nop
F549 : 01		" "		nop
F54A : 01		" "		nop
F54B : FF 03 E8		"   "		stx	X03E8
;*************************************;
;PRMSYNx1
;*************************************;
F54E : CE F5 48   ldx	#$F548
F551 : 20 09      bra	LF55C
;*************************************;
; 
;*************************************;
F553 : 01		" "		nop
F554 : 01		" "		nop
F555 : 01		" "		nop
F556 : 40		"@"		nega
F557 : 10		" "		sba
				;
F558 : 00		" "		db	$00
;*************************************;
;PRMSYNx2
;*************************************;
F559 : CE F5 53		"  S"		ldx	#$F553
;LF55C:
F55C : A6 00		"  "		ldaa	$00,x
F55E : 97 96		"  "		staa	X0096
F560 : A6 01		"  "		ldaa	$01,x
F562 : 97 97		"  "		staa	X0097
F564 : A6 02		"  "		ldaa	$02,x
F566 : E6 03		"  "		ldab	$03,x
F568 : EE 04		"  "		ldx	$04,x
F56A : 20 0F		"  "		bra	LF57B
;*************************************;
;PRMSYNx3
;*************************************;
F56C : C6 02		"  "		ldab	#$02
F56E : 20 06		"  "		bra	LF576
;*************************************;
;PRMSYNx4
;*************************************;
F570 : C6 03		"  "		ldab	#$03
F572 : 20 02		"  "		bra	LF576
;*************************************;
;SYNTH (similar to ROM1 SYNTH4)
;*************************************;
F574 : C6 04		  ldab	#$04    ;load B with value 04h
;LF576:
F576 : 4F				  clra          ;clear A
F577 : 97 97		  staa	$97     ;store A in addr 97
F579 : 97 96		  staa	$96     ;store A in addr 96
;LF57B:
F57B : 97 95		  staa	$95     ;store A in addr 95
F57D : D7 90		  stab	$90     ;store B in addr 90
F57F : DF 93		  stx	$93       ;store X in addr 93
F581 : 7F 00 92   clr	$0092     ;clear addr 0092
;LF584:
F584 : DE 93		  ldx	$93       ;load X with value in addr 93
F586 : B6 20 02   ldaa	$2002   ;load A from DAC output SOUND
;LF589:
F589 : 16				  tab           ;transfer A to B
F58A : 54				  lsrb          ;logic shift right B (bit7=0)
F58B : 54				  lsrb          ;logic shift right B (bit7=0)
F58C : 54				  lsrb          ;logic shift right B (bit7=0)
F58D : D8 81		  eorb	$81     ;exclusive OR with value in addr 81
F58F : 54				  lsrb          ;logic shift right B (bit7=0)
F590 : 76 00 80   ror	$0080     ;rotate right in addr 0080 (bit7 = C then C = bit0)
F593 : 76 00 81   ror	$0081     ;rotate right in addr 0081 (bit7 = C then C = bit0)
F596 : D6 90		  ldab	$90     ;load B with value in addr 90
F598 : 7D 00 96   tst	$0096     ;test value in addr 0096=00 (N=0(MSB), Z=1)
F59B : 27 04		  beq	LF5A1     ;branch Z=1
F59D : D4 80		  andb	$80     ;and B with value in addr 80
F59F : DB 97		  addb	$97     ;add B with value in addr 97
;LF5A1:
F5A1 : D7 91		  stab	$91     ;store B in addr 91
F5A3 : D6 92		  ldab	$92     ;load B with value in addr 92
F5A5 : 91 81		  cmpa	$81     ;compare A with value in addr 81
F5A7 : 22 12		  bhi	LF5BB     ;branch C=0 and Z=0
;LF5A9:
F5A9 : 09         dex           ;decr X
F5AA : 27 26		  beq	LF5D2     ;branch Z=1
F5AC : B7 20 02   staa	$2002   ;store A in DAC output SOUND
F5AF : DB 92		  addb	$92     ;add B with value in addr 92
F5B1 : 99 91		  adca	$91     ;A = A + C + value in addr 91
F5B3 : 25 16		  bcs	LF5CB     ;branch C=1
F5B5 : 91 81		  cmpa	$81     ;compare A with value in addr 81
F5B7 : 23 F0		  bls	LF5A9     ;branch C=1 and Z=1
F5B9 : 20 10		  bra	LF5CB     ;branch always below
;LF5BB:
F5BB : 09         dex           ;decr X
F5BC : 27 14		  beq	LF5D2     ;branch Z=1
F5BE : B7 20 02   staa	$2002   ;store A in DAC output SOUND
F5C1 : D0 92		  subb	$92     ;B = B - value in addr 92
F5C3 : 92 91		  sbca	$91     ;A = A - C - value in addr 91
F5C5 : 25 04		  bcs	LF5CB     ;branch C=1
F5C7 : 91 81		  cmpa	$81     ;compare A with value in addr 81
F5C9 : 22 F0		  bhi	LF5BB     ;branch C=0 and Z=0
;LF5CB:
F5CB : 96 81		  ldaa	$81     ;load A with value in addr 81
F5CD : B7 20 02   staa	$2002   ;store A in DAC output SOUND
F5D0 : 20 B7		  bra	LF589     ;branch always above
;LF5D2:
F5D2 : D6 95		  ldab	$95     ;load B with value in addr 95
F5D4 : 27 B3		  beq	LF589     ;branch Z=1
F5D6 : 96 90		  ldaa	$90     ;load A with value in addr 90
F5D8 : D6 92		  ldab	$92     ;load B with value in addr 92
F5DA : 44         lsra          ;logic shift right A (bit7=0)
F5DB : 56         rorb          ;rotate right B (bit7=C and C=bit0)
F5DC : 44         lsra          ;logic shift right A (bit7=0)
F5DD : 56         rorb          ;rotate right B (bit7=C and C=bit0)
F5DE : 44         lsra          ;logic shift right A (bit7=0)
F5DF : 56         rorb          ;rotate right B (bit7=C and C=bit0)
F5E0 : 43         coma          ;complement 1s A
F5E1 : 50         negb          ;complement 2s B
F5E2 : 82 FF		  sbca	#$FF    ;A = A - C - value FFh
F5E4 : DB 92		  addb	$92     ;add B with value in addr 92
F5E6 : 99 90		  adca	$90     ;A = A + C + value in addr 90
F5E8 : D7 92		  stab	$92     ;store B in addr 92
F5EA : 97 90		  staa	$90     ;store A in addr 90
F5EC : 26 96		  bne	LF584     ;branch Z=0 above
F5EE : C1 07		  cmpb	#$07    ;compare B with value 07h
;XF5F0:
F5F0 : 26 92		  bne	LF584     ;branch Z=0 above
F5F2 : 39				  rts           ;return subroutine
;*************************************;
;PRMCLRDAC (clear DAC and wait X=1000)
;*************************************;
F5F3 : 7F 20 02   clr	$2002     ;clear DAC output SOUND
F5F6 : CE 10 00   ldx	#$1000    ;load X with value 1000h
;PMCLDC1 LF5F9:
F5F9 : 09         dex           ;decr X
;XF5FA:
F5FA : 26 FD      bne	LF5F9     ;branch Z=0 PMCLDC1
F5FC : 39				  rts           ;return subroutine
;*************************************;
;PRMLOAD
;*************************************;
;LF5FD:
F5FD : CE F6 B1   ldx	#$F6B1    ;load X with value F6B1h (FDB ?)
F600 : DF 84      stx	$84       ;store X in addr 84
F602 : CE 00 90   ldx	#$0090    ;load X with value 0090h
F605 : DF 8E      stx	$8E       ;store X in addr 8E
F607 : C6 AF      ldab	#$AF    ;load B with value AFh
F609 : D7 89      stab	$89     ;store B in addr 89
F60B : 39				  rts           ;return subroutine
;*************************************;
;PARAM
;*************************************;
;LF60C:
F60C : DF 8C      stx	$8C
F60E : CE F6 B1   ldx	#$F6B1
F611 : DF 84      stx	$84
F613 : 86 80      ldaa	#$80
;LF615:
F615 : D6 93      ldab	$93
F617 : 2A 09      bpl	LF622
F619 : D6 81      ldab	$081
F61B : 54				  lsrb
F61C : 54				  lsrb
F61D : 54				  lsrb
F61E : 5C				  incb
;LF61F:
F61F : 5A				  decb
F620 : 26 FD      bne	LF61F
;LF622:
F622 : 7A 00 98   dec	$0098
F625 : 27 4C      beq	LF673
F627 : 7A 00 99   dec	$0099
F62A : 27 4C      beq	LF678
F62C : 7A 00 9A   dec	$009A
F62F : 27 4C      beq	LF67D
F631 : 7A 00 9B   dec	$009B
F634 : 26 DF      bne	LF615
F636 : D6 93      ldab	$93
F638 : 27 DB      beq	LF615
F63A : C4 7F      andb	#$7F
F63C : D7 9B      stab	$9B
F63E : D6 81      ldab	$81
F640 : 58				  aslb
F641 : DB 81      addb	$81
F643 : CB 0B      addb	#$0B
F645 : D7 81      stab	$81
F647 : 7A 00 AB   dec	$00AB
F64A : 26 0E      bne	LF65A
F64C : D6 9F      ldab	$9F
F64E : D7 AB      stab	$AB
F650 : DE 84      ldx	$84
F652 : 09				  dex
F653 : 8C F6 AA   cpx	#$F6AA
F656 : 27 4E      beq	LF6A6
F658 : DF 84      stx	$84
;LF65A:
F65A : D6 81      ldab	$81
F65C : 2B 06      bmi	LF664
F65E : D4 97      andb	$97
F660 : C4 7F      andb	#$7F
F662 : 20 05      bra	LF669
;LF664:
F664 : D4 97      andb	$97
F666 : C4 7F      andb	#$7F
F668 : 50				  negb
;LF669:
F669 : 36				  psha
F66A : 1B				  aba
F66B : 16				  tab
F66C : 32				  pula
F66D : DE 84      ldx	$84
F66F : AD 00      jsr	$00,x						;INFO: index jump
F671 : 20 A2      bra	LF615
;LF673:
F673 : CE 00 90   ldx	#$0090
F676 : 20 08      bra	LF680
;LF678:
F678 : CE 00 91   ldx	#$0091
F67B : 20 03      bra	LF680
;LF67D:
F67D : CE 00 92   ldx	#$0092
;LF680:
F680 : 6D 18      tst	$18,x
F682 : 27 12      beq	LF696
F684 : 6A 18      dec	$18,x
F686 : 26 0E      bne	LF696
F688 : E6 0C      ldab	$0C,x
F68A : E7 18      stab	$18,x
F68C : E6 00      ldab	$00,x
F68E : EB 10      addb	$10,x
F690 : E1 14      cmpb	$14,x
F692 : 27 12      beq	LF6A6
F694 : E7 00      stab	$00,x
;LF696:
F696 : E6 00      ldab	$00,x
F698 : E7 08      stab	$08,x
F69A : AB 04      adda	$04,x
F69C : 60 04      neg	$04,x
F69E : 16				  tab
F69F : DE 84      ldx	$84
F6A1 : AD 00      jsr	$00,x						;INFO: index jump
F6A3 : 7E F6 15   jmp	LF615
;LF6A6:
F6A6 : DE 8C      ldx	$8C
F6A8 : 39				  rts           ;return subroutine
;*************************************;
; FDB tables for X
;*************************************;
F6A9 : 54	54
F6AB : 54	54
F6AD : 54	54
F6AF : 54	54
F6B1 : F7 20 
F6B3 : 02 39
;*************************************;
;PRMLDXx1
;*************************************;
F6B5 : BD F5 FD		"   "		jsr	LF5FD
F6B8 : CE F7 28		"  ("		ldx	#$F728
F6BB : 20 0E		"  "		bra	LF6CB
;*************************************;
;PRMLDXx2
;*************************************;
F6BD : BD F5 FD		"   "		jsr	LF5FD
F6C0 : CE F7 0C		"   "		ldx	#$F70C
F6C3 : 20 06		"  "		bra	LF6CB
;*************************************;
;PRMLDXx3
;*************************************;
;LF6C5
F6C5 : BD F5 FD		"   "		jsr	LF5FD
F6C8 : CE F6 F0		"   "		ldx	#$F6F0
;LF6CB:
F6CB : C6 1C		"  "		ldab	#$1C
F6CD : BD F2 3B		"  ;"		jsr	LF23B
F6D0 : 7E F6 0C		"~  "		jmp	LF60C
F6D3 : 39				  rts           ;return subroutine
;*************************************;
;FDB tables
;*************************************;
F6D4 : FF FF FF		"   "		stx	XFFFF
F6D7 : 90 FF		"  "		suba	X00FF
F6D9 : FF FF FF		"   "		stx	XFFFF
F6DC : FF FF FF		"   "		stx	XFFFF
F6DF : 90 FF		"  "		suba	X00FF
F6E1 : FF FF FF		"   "		stx	XFFFF
F6E4 : FF FF FF		"   "		stx	XFFFF
F6E7 : FF 00 00		"   "		stx	X0000
				;
F6EA : 00 00 00 00	"    "		db	$00, $00, $00, $00
F6EE : 00 00		"  "		db	$00, $00
				;
F6F0 : 30		"0"		tsx
				;
F6F1 : 00 00 00		"   "		db	$00, $00, $00
				;
F6F4 : 7F 00 00		"   "		clr	X0000
				;
F6F7 : 00		" "		db	$00
				;
F6F8 : 30		"0"		tsx
				;
F6F9 : 00 00 00		"   "		db	$00, $00, $00
				;
F6FC : 01		" "		nop
				;
F6FD : 00 00 00		"   "		db	$00, $00, $00
				;
F700 : 7F 00 00		"   "		clr	X0000
				;
F703 : 00 02 00 00	"    "		db	$00, $02, $00, $00
F707 : 00		" "		db	$00
				;
F708 : 01		" "		nop
				;
F709 : 00 00 00 04	"    "		db	$00, $00, $00, $04
F70D : 00 00 04		"   "		db	$00, $00, $04
				;
F710 : 7F 00 00		"   "		clr	X0000
F713 : 7F 04 00		"   "		clr	X0400
				;
F716 : 00 04		"  "		db	$00, $04
				;
F718 : FF 00 00		"   "		stx	X0000
F71B : A0 00		"  "		suba	$00,x
				;
F71D : 00 00 00 00	"    "		db	$00, $00, $00, $00
F721 : 00 00 00		"   "		db	$00, $00, $00
				;
F724 : FF 00 00		"   "		stx	X0000
F727 : A0 02		"  "		suba	$02,x
F729 : 80 00		"  "		suba	#$00
F72B : 30		"0"		tsx
F72C : 0A		" "		clv
F72D : 7F 00 7F		"   "		clr	X007F
				;
F730 : 02		" "		db	$02
				;
F731 : 80 00		"  "		suba	#$00
F733 : 30		"0"		tsx
F734 : C0 80		"  "		subb	#$80
				;
F736 : 00		" "		db	$00
				;
F737 : 20 01		"  "		bra	LF73A
				;
F739 : 10		" "		sba
				;
F73A				LF73A:
F73A : 00 15		"  "		db	$00, $15
				;
F73C : C0 10		"  "		subb	#$10
				;
F73E : 00 00		"  "		db	$00, $00
				;
F740 : C0 80		"  "		subb	#$80
				;
F742 : 00 00		"  "		db	$00, $00
;*************************************;
;SYNTH
;*************************************;
F744 : BD F5 FD		"   "		jsr	LF5FD
F747 : 86 80		"  "		ldaa	#$80
F749 : 97 9A		"  "		staa	X009A
F74B : 86 F7		"  "		ldaa	#$F7
F74D : 97 98		"  "		staa	X0098
F74F				LF74F:
F74F : 86 80		"  "		ldaa	#$80
F751 : 97 87		"  "		staa	X0087
F753				LF753:
F753 : 86 12		"  "		ldaa	#$12
F755				LF755:
F755 : 4A		"J"		deca
F756 : 26 FD		"& "		bne	LF755
F758 : 96 97		"  "		ldaa	X0097
F75A : 9B 9A		"  "		adda	X009A
F75C : 97 97		"  "		staa	X0097
F75E : 44		"D"		lsra
F75F : 44		"D"		lsra
F760 : 44		"D"		lsra
F761 : 8B 7B		" {"		adda	#$7B
F763 : 97 99		"  "		staa	X0099
F765 : DE 98		"  "		ldx	X0098
F767 : A6 00		"  "		ldaa	$00,x
F769 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
F76C : 7A 00 87		"z  "		dec	X0087
F76F : 26 E2		"& "		bne	LF753
F771 : 7A 00 9A		"z  "		dec	X009A
F774 : 96 9A		"  "		ldaa	X009A
F776 : 81 20		"  "		cmpa	#$20
F778 : 26 D5		"& "		bne	LF74F
F77A : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
F77B : 80 8C		"  "		suba	#$8C
F77D : 98 A5		"  "		eora	X00A5
F77F : B0 BC C6		"   "		suba	XBCC6
F782 : D0 DA		"  "		subb	X00DA
F784 : E2 EA		"  "		sbcb	$EA,x
F786 : F0 F5 FA		"   "		subb	XF5FA
				;
F789 : FD		" "		db	$FD
				;
F78A : FE FF FE		"   "		ldx	XFFFE
				;
F78D : FD		" "		db	$FD
				;
F78E : FA F5 F0		"   "		orab	XF5F0
F791 : EA E2		"  "		orab	$E2,x
F793 : DA D0		"  "		orab	X00D0
F795 : C6 BC		"  "		ldab	#$BC
F797 : B0 A5 98		"   "		suba	XA598
F79A : 8C 80 73		"  s"		cpx	#$8073
F79D : 67 5A		"gZ"		asr	$5A,x
F79F : 4F		"O"		clra
F7A0 : 43		"C"		coma
F7A1 : 39		"9"		rts
				;
F7A2 : 2F 25		"/%"		ble	LF7C9
				;
F7A4 : 1D 15		"  "		db	$1D, $15
				;
F7A6 : 0F		" "		sei
F7A7 : 0A		" "		clv
				;
F7A8 : 05 02		"  "		db	$05, $02
				;
F7AA : 01		" "		nop
				;
F7AB : 00		" "		db	$00
				;
F7AC : 01		" "		nop
				;
F7AD : 02 05		"  "		db	$02, $05
				;
F7AF : 0A		" "		clv
F7B0 : 0F		" "		sei
				;
F7B1 : 15 1D		"  "		db	$15, $1D
				;
F7B3 : 25 2F		"%/"		bcs	LF7E4
F7B5 : 39		"9"		rts
				;
F7B6 : 43		"C"		coma
F7B7 : 4F		"O"		clra
F7B8 : 5A		"Z"		decb
F7B9 : 67 73		"gs"		asr	$73,x
;*************************************;
;SYNTH
;*************************************;
F7BB : 7F 20 02   clr	$2002     ;clear DAC output SOUND
F7BE : CE F8 02   ldx	#$F802    ;load X with value F802h (FDB below)
F7C1 : DF 92      stx	$92       ;store X in addr 92
;LF7C3:
F7C3 : DE 92      ldx	$92       ;load X with value in addr 92
F7C5 : A6 00      ldaa	$00,x   ;load A with value in addr X + 00h
F7C7 : 27 33      beq	LF7FC     ;branch Z=1 
;LF7C9:
F7C9 : E6 01      ldab	$01,x   ;load B with value in addr X + 01h
F7CB : C4 F0      andb	#$F0    ;and B with value F0h
F7CD : D7 91      stab	$91     ;store B in addr 91
F7CF : E6 01      ldab	$01,x   ;load B with value in addr X + 01h
F7D1 : 08				  inx           ;incr X
F7D2 : 08				  inx           ;incr X
F7D3 : DF 92      stx	$92       ;store X in addr 92
F7D5 : 97 90      staa	$90     ;store A in addr 90
F7D7 : C4 0F      andb	#$0F    ;and B with value 0Fh
;LF7D9:
F7D9 : 96 91      ldaa	$91     ;load A with value in addr 91
F7DB : B7 20 00   staa	$2000   ;store A in PIA sound select ?
F7DE : 96 90      ldaa	$90     ;load A with value in addr 90
;LF7E0:
F7E0 : CE 00 05   ldx	#$0005    ;load X with value 0005h
;LF7E3:
F7E3 : 09				  dex           ;decr X
;LF7E4:
F7E4 : 26 FD      bne	LF7E3     ;branch Z=0 
F7E6 : 4A				  deca          ;decr A
F7E7 : 26 F7      bne	LF7E0     ;branch Z=0
F7E9 : 7F 20 00   clr	$2000     ;clear (00) PIA sound select
F7EC : 96 90      ldaa	$90     ;load A with value in addr 90
;LF7EE:
F7EE : CE 00 05   ldx	#$0005    ;load X with value 0005h
;LF7F1:
F7F1 : 09				  dex           ;decr X
F7F2 : 26 FD      bne	LF7F1     ;branch Z=0 
F7F4 : 4A				  deca          ;decr A
F7F5 : 26 F7      bne	LF7EE     ;branch Z=0
F7F7 : 5A				  decb          ;decr B
F7F8 : 26 DF      bne	LF7D9     ;branch Z=0 
F7FA : 20 C7      bra	LF7C3     ;branch always
;LF7FC:
F7FC : 86 80      ldaa	#$80    ;load A with value 80h
F7FE : B7 20 02   staa	$2002   ;store A in DAC output SOUND
F801 : 39				  rts           ;return subroutine
;*************************************;
;FDB
;*************************************;
F802 : 01		" "		nop
				;
F803 : FC 02 FC 03	"    "		db	$FC, $02, $FC, $03
				;
F807 : F8 04 F8		"   "		eorb	X04F8
F80A : 06		" "		tap
F80B : F8 08 F4		"   "		eorb	X08F4
F80E : 0C		" "		clc
F80F : F4 10 F4		"   "		andb	X10F4
F812 : 20 F2		"  "		bra	LF806
				;
F814 : 40		"@"		nega
F815 : F1 60 F1		" ` "		cmpb	X60F1
F818 : 80 F1		"  "		suba	#$F1
F81A : A0 F1		"  "		suba	$F1,x
F81C : C0 F1		"  "		subb	#$F1
				;
F81E : 00 00		"  "		db	$00, $00
;
F820 : FE 04 02	04 FF 00 
;*************************************;
;PRMSYNx5
;*************************************;
F826 : BD	F5 FD   jsr LF5FD     ;jump sub PRMLOAD
F829 : CE F8 20   ldx #$F820    ;load X with value F820h (fdb above) 
F82C : BD F8 57   jsr LF857     ;jump sub PRMXLD 
F82F : 7E F8 70   jmp LF870     ;jump SYNTH below
;*************************************;
;FDB data
;*************************************;
F832 : 50	FF 00 00 60 80
;*************************************;
;PRMSYNx6
;*************************************;
F838 : BD F5 FD   jsr	LF5FD     ;jump sub PRMLOAD
F83B : C6 30      ldab	#$30    ;load B with value 30h
F83D : CE F8 32   ldx	#$F832    ;load X with value F832h (FDB data above)
F840 : 8D 15      bsr	LF857     ;branch sub PRMXLD
;LF842:
F842 : 96 81      ldaa	X0081
F844 : 48				  asla
F845 : 9B 81      adda	X0081
F847 : 8B 0B      adda	#$0B
F849 : 97 81      staa	X0081
F84B : 44				  lsra
F84C : 44				  lsra
F84D : 8B 0C      adda	#$0C
F84F : 97 91      staa	X0091
F851 : 8D 1D      bsr	LF870     ;branch sub SYNTH below
F853 : 5A				  decb
F854 : 26 EC      bne	LF842     ;branch Z=0 
F856 : 39				  rts           ;return subroutine
;*************************************;
;PRMXLD (X load and store)
;*************************************;
;LF857:
F857 : A6 00      ldaa	$00,x
F859 : 97 91      staa	X0091
F85B : A6 01      ldaa	$01,x
F85D : 97 92      staa	X0092
F85F : A6 02      ldaa	$02,x
F861 : 97 93      staa	X0093
F863 : A6 03      ldaa	$03,x
F865 : 97 94      staa	X0094
F867 : A6 04      ldaa	$04,x
F869 : 97 95      staa	X0095
F86B : A6 05      ldaa	$05,x
F86D : 97 96      staa	X0096
F86F : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
;LF870:
F870 : 96 89		"  "		ldaa	X0089
F872 : 37		"7"		pshb
F873 : D6 95		"  "		ldab	X0095
F875 : D7 97		"  "		stab	X0097
F877 : D6 92		"  "		ldab	X0092
F879 : D7 98		"  "		stab	X0098
F87B				LF87B:
F87B : 43		"C"		coma
F87C : D6 91		"  "		ldab	X0091
F87E : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
F881				LF881:
F881 : 5A		"Z"		decb
F882 : 26 FD		"& "		bne	LF881
F884 : 43		"C"		coma
F885 : D6 91		"  "		ldab	X0091
F887 : 20 00		"  "		bra	LF889
				;
F889				LF889:
F889 : 08		" "		inx
F88A : 09		" "		dex
F88B : 08		" "		inx
F88C : 09		" "		dex
F88D : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
F890				LF890:
F890 : 5A		"Z"		decb
F891 : 26 FD		"& "		bne	LF890
F893 : 7A 00 98		"z  "		dec	X0098
F896 : 27 16		"' "		beq	LF8AE
F898 : 7A 00 97		"z  "		dec	X0097
F89B : 26 DE		"& "		bne	LF87B
F89D : 43		"C"		coma
F89E : D6 95		"  "		ldab	X0095
F8A0 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
F8A3 : D7 97		"  "		stab	X0097
F8A5 : D6 91		"  "		ldab	X0091
F8A7 : 9B 96		"  "		adda	X0096
F8A9 : 2B 1E		"+ "		bmi	LF8C9
F8AB : 01		" "		nop
F8AC : 20 15		"  "		bra	LF8C3
;LF8AE:
F8AE : 08		" "		inx
F8AF : 09		" "		dex
F8B0 : 01		" "		nop
F8B1 : 43		"C"		coma
F8B2 : D6 92		"  "		ldab	X0092
F8B4 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
F8B7 : D7 98		"  "		stab	X0098
F8B9 : D6 91		"  "		ldab	X0091
F8BB : D0 93		"  "		subb	X0093
F8BD : D1 94		"  "		cmpb	X0094
F8BF : D1 94		"  "		cmpb	X0094
F8C1 : 27 06		"' "		beq	LF8C9
F8C3				LF8C3:
F8C3 : D7 91		"  "		stab	X0091
F8C5 : C0 05		"  "		subb	#$05
F8C7 : 20 B8		"  "		bra	LF881
				;
F8C9				LF8C9:
F8C9 : 33		"3"		pulb
F8CA : 39				  rts           ;return subroutine
;*************************************;
;SYNTH
;*************************************;
F8CB : 86 01		"  "		ldaa	#$01
F8CD : 97 97		"  "		staa	X0097
F8CF : C6 03		"  "		ldab	#$03
F8D1 : 97 96		"  "		staa	X0096
F8D3 : 86 FF		"  "		ldaa	#$FF
F8D5 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
F8D8 : D7 92		"  "		stab	X0092
F8DA				LF8DA:
F8DA : D6 92		"  "		ldab	X0092
F8DC				LF8DC:
F8DC : 96 81		"  "		ldaa	X0081
F8DE : 44		"D"		lsra
F8DF : 44		"D"		lsra
F8E0 : 44		"D"		lsra
F8E1 : 98 81		"  "		eora	X0081
F8E3 : 44		"D"		lsra
F8E4 : 76 00 80		"v  "		ror	X0080
F8E7 : 76 00 81		"v  "		ror	X0081
F8EA : 24 03		"$ "		bcc	LF8EF
F8EC : 73 20 02		"s  "		com	X2002   ;complement 1s in DAC output SOUND
F8EF				LF8EF:
F8EF : 96 96		"  "		ldaa	X0096
F8F1				LF8F1:
F8F1 : 4A		"J"		deca
F8F2 : 26 FD		"& "		bne	LF8F1
F8F4 : 5A		"Z"		decb
F8F5 : 26 E5		"& "		bne	LF8DC
F8F7 : 96 96		"  "		ldaa	X0096
F8F9 : 9B 97		"  "		adda	X0097
F8FB : 97 96		"  "		staa	X0096
F8FD : 26 DB		"& "		bne	LF8DA
F8FF : 39				  rts           ;return subroutine
;*************************************;
;PARAM
;*************************************;
F900 : 86 00		"  "		ldaa	#$00
F902 : 20 29		" )"		bra	LF92D
;LF904
F904 : 86 01		"  "		ldaa	#$01
F906 : 20 25		" %"		bra	LF92D
;LF908
F908 : 86 02		"  "		ldaa	#$02
F90A : 20 21		" !"		bra	LF92D
;LF90C
F90C : 86 03		"  "		ldaa	#$03
F90E : 8D 1D		"  "		bsr	LF92D
F910 : 86 04		"  "		ldaa	#$04
F912 : 20 19		"  "		bra	LF92D
				;
F914 : 0D		" "		sec
F915 : 40		"@"		nega
F916 : F0 FF 12		"   "		subb	XFF12
F919 : 08		" "		inx
F91A : A8 18		"  "		eora	$18,x
F91C : 01		" "		nop
F91D : 08		" "		inx
				;
F91E				LF91E:
F91E : 04		" "		db	$04
				;
F91F : A8 18		"  "		eora	$18,x
F921 : 01		" "		nop
F922 : 10		" "		sba
				;
F923 : 04		" "		db	$04
				;
F924 : 20 F8		"  "		bra	LF91E
				;
F926 : FF 20 10		"   "		stx	X2010
F929 : F0 10 01		"   "		subb	X1001
F92C : 01		" "		nop
F92D				LF92D:
F92D : CE D9 39		"  9"		ldx	#$D939
F930 : DF 80		"  "		stx	X0080
F932 : 16		" "		tab
F933 : 48		"H"		asla
F934 : 48		"H"		asla
F935 : 1B		" "		aba
F936 : CE F9 14		"   "		ldx	#$F914
F939 : BD E1 89		"   "		jsr	LE189
F93C : 7E F9 A6		"~  "		jmp	LF9A6
;*************************************;
;PRMJSR
;*************************************;
F93F : CE F9 5E   ldx	#$F95E     ;load X with value F95Eh (FDB data)
F942 : DF A1      stx	$A1        ;store X in addr A1
F944 : BD FA 88   jsr	LFA88      ;jump sub PRMLDXx5
F947 : CE A5 00   ldx	#$A500     ;load X with value A500h
F94A : DF 80      stx	$80        ;store X in addr 80
F94C : CE F9 87   ldx	#$F987     ;load X with value F987h (FDB data)
F94F : BD F9 91   jsr	LF991      ;jump sub PRMLDXx4
F952 : BD FA 2C   jsr	LFA2C      ;jump sub PRMCLRx1
F955 : CE F9 8C   ldx	#$F98C     ;load X with value F98Ch (FDB data)
F958 : BD F9 91   jsr	LF991      ;jump sub PRMLDXx4
F95B : 7E FA 39   jmp	LFA39      ;jump PRMBSR
;*************************************;
;FDB data
;*************************************;
F95E : 90 10		"  "		suba	X0010
				;
F960 : 02 14		"  "		db	$02, $14
				;
F962 : 40		"@"		nega
F963 : B4 40 FF		" @ "		anda	X40FF
				;
F966 : 14		" "		db	$14
				;
F967 : 30		"0"		tsx
F968 : D0 32		" 2"		subb	X0032
				;
F96A : 02		" "		db	$02
				;
F96B : 10		" "		sba
F96C : 60 EE		"` "		neg	$EE,x
F96E : 20 02		"  "		bra	LF972
				;
F970 : 08		" "		inx
F971 : 54		"T"		lsrb
F972				LF972:
F972 : E9 54		" T"		adcb	$54,x
F974 : FF 20 28		"  ("		stx	X2028
F977 : C0 30		" 0"		subb	#$30
				;
F979 : 02 14		"  "		db	$02, $14
				;
F97B : 58		"X"		aslb
F97C : AC 20		"  "		cpx	$20,x
				;
F97E : 02		" "		db	$02
				;
F97F : 08		" "		inx
F980 : 58		"X"		aslb
F981 : A6 58		" X"		ldaa	$58,x
F983 : FF 18 22		"  ""		stx	X1822
				;
F986 : 00		" "		db	$00
;*************************************;
;FDB data
;*************************************;
F987 : 30 10 FC 00 01
;
F98C : 30 FC 01	00 01	
;*************************************;
;PRMLDXx4 jsr dest
;*************************************;
;LF991:
F991 : A6 00		"  "		ldaa	$00,x
F993 : 97 A8		"  "		staa	X00A8
F995 : A6 01		"  "		ldaa	$01,x
F997 : 97 91		"  "		staa	X0091
F999 : A6 02		"  "		ldaa	$02,x
F99B : 97 90		"  "		staa	X0090
F99D : A6 03		"  "		ldaa	$03,x
F99F : 97 95		"  "		staa	X0095
F9A1 : A6 04		"  "		ldaa	$04,x
F9A3 : 97 AD		"  "		staa	X00AD
;LF9A5:
F9A5 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LF9A6:
F9A6 : 8D E9		"  "		bsr	LF991
F9A8 : 8D 30		" 0"		bsr	LF9DA
F9AA				LF9AA:
F9AA : 8D 58		" X"		bsr	LFA04
F9AC : 96 AC		"  "		ldaa	X00AC
F9AE : 91 AD		"  "		cmpa	X00AD
F9B0 : 26 F8		"& "		bne	LF9AA
F9B2 : 59		"Y"		rolb
F9B3 : F7 20 02		"   "		stab	X2002   ;store B in DAC output SOUND
F9B6 : 8D 2D		" -"		bsr	LF9E5
F9B8 : 8D 38		" 8"		bsr	LF9F2
F9BA : 8D 5C		" \"		bsr	LFA18
F9BC : 7D 00 91		"}  "		tst	X0091
F9BF : 27 E4		"' "		beq	LF9A5
F9C1 : 7D 00 92		"}  "		tst	X0092
F9C4 : 26 E4		"& "		bne	LF9AA
F9C6 : 7D 00 95		"}  "		tst	X0095
F9C9 : 27 DF		"' "		beq	LF9AA
F9CB : 2B 05		"+ "		bmi	LF9D2
F9CD : 7C 00 AD		"|  "		inc	X00AD
F9D0 : 20 D8		"  "		bra	LF9AA
				;
F9D2				LF9D2:
F9D2 : 7A 00 AD		"z  "		dec	X00AD
F9D5 : 7A 00 AC		"z  "		dec	X00AC
F9D8 : 20 D0		"  "		bra	LF9AA
				;
F9DA				LF9DA:
F9DA : 7F 00 92		"   "		clr	X0092
F9DD : 96 AD		"  "		ldaa	X00AD
F9DF : 97 AC		"  "		staa	X00AC
F9E1 : 7F 00 AB		"   "		clr	X00AB
F9E4 : 39		"9"		rts
				;
F9E5				LF9E5:
F9E5 : 96 81		"  "		ldaa	X0081
F9E7 : 44		"D"		lsra
F9E8 : 44		"D"		lsra
F9E9 : 44		"D"		lsra
F9EA : 98 81		"  "		eora	X0081
F9EC : 97 A6		"  "		staa	X00A6
F9EE : 08		" "		inx
F9EF : 84 07		"  "		anda	#$07
F9F1 : 39		"9"		rts
				;
F9F2				LF9F2:
F9F2 : 96 A6		"  "		ldaa	X00A6
F9F4 : 44		"D"		lsra
F9F5 : 76 00 80		"v  "		ror	X0080
F9F8 : 76 00 81		"v  "		ror	X0081
F9FB : 86 00		"  "		ldaa	#$00
F9FD : 24 02		"$ "		bcc	LFA01
F9FF : 96 91		"  "		ldaa	X0091
FA01				LFA01:
FA01 : 97 AB		"  "		staa	X00AB
FA03 : 39		"9"		rts
				;
FA04				LFA04:
FA04 : 96 AD		"  "		ldaa	X00AD
FA06 : 7A 00 AC		"z  "		dec	X00AC
FA09 : 27 04		"' "		beq	LFA0F
FA0B : 08		" "		inx
FA0C : 09		" "		dex
FA0D : 20 08		"  "		bra	LFA17
				;
FA0F				LFA0F:
FA0F : 97 AC		"  "		staa	X00AC
FA11 : D6 AB		"  "		ldab	X00AB
FA13 : 54		"T"		lsrb
FA14 : 7C 00 92		"|  "		inc	X0092
FA17				LFA17:
FA17 : 39		"9"		rts
				;
FA18				LFA18:
FA18 : 96 A8		"  "		ldaa	X00A8
FA1A : 91 92		"  "		cmpa	X0092
FA1C : 27 04		"' "		beq	LFA22
FA1E : 08		" "		inx
FA1F : 09		" "		dex
FA20 : 20 09		"  "		bra	LFA2B
				;
FA22				LFA22:
FA22 : 7F 00 92		"   "		clr	X0092
FA25 : 96 91		"  "		ldaa	X0091
FA27 : 90 90		"  "		suba	X0090
FA29 : 97 91		"  "		staa	X0091
FA2B				LFA2B:
FA2B : 39		"9"		rts
;*************************************;
;PRMCLRx1 jump dest
;*************************************;
;LFA2C:
FA2C : 7F 00 9F		"   "		clr	X009F
FA2F : 7F 00 A9		"   "		clr	X00A9
FA32 : 86 0E		"  "		ldaa	#$0E
FA34 : 97 A0		"  "		staa	X00A0
FA36 : 7F 00 A5		"   "		clr	X00A5
;*************************************;
;PRMBSR jump dest
;*************************************;
;LFA39:
FA39 : 8D 9F		"  "		bsr	LF9DA
;LFA3B:
FA3B : 8D A8		"  "		bsr	LF9E5
FA3D : BD FA C2		"   "		jsr	LFAC2
FA40 : 8D B0		"  "		bsr	LF9F2
FA42 : BD FA C2		"   "		jsr	LFAC2
FA45 : 8D BD		"  "		bsr	LFA04
FA47 : 8D 79		" y"		bsr	LFAC2
FA49 : 8D CD		"  "		bsr	LFA18
FA4B : 8D 75		" u"		bsr	LFAC2
FA4D : 8D 0A		"  "		bsr	LFA59
FA4F : 8D 71		" q"		bsr	LFAC2
FA51 : 8D 1D		"  "		bsr	LFA70
FA53 : 8D 6D		" m"		bsr	LFAC2
FA55 : 8D 52		" R"		bsr	LFAA9
FA57 : 20 E2		"  "		bra	LFA3B
				;
FA59				LFA59:
FA59 : 96 A4		"  "		ldaa	X00A4
FA5B : 7A 00 A0		"z  "		dec	X00A0
FA5E : 27 07		"' "		beq	LFA67
FA60 : B6 00 91		"   "		ldaa	X0091
FA63 : 26 0A		"& "		bne	LFA6F
FA65 : 20 68		" h"		bra	LFACF
				;
FA67				LFA67:
FA67 : 97 A0		"  "		staa	X00A0
FA69 : 96 9F		"  "		ldaa	X009F
FA6B : 9B A9		"  "		adda	X00A9
FA6D : 97 9F		"  "		staa	X009F
FA6F				LFA6F:
FA6F : 39		"9"		rts
				;
FA70				LFA70:
FA70 : 96 9F		"  "		ldaa	X009F
FA72 : 91 A7		"  "		cmpa	X00A7
FA74 : 27 07		"' "		beq	LFA7D
FA76 : 08		" "		inx
FA77 : 96 91		"  "		ldaa	X0091
FA79 : 26 2A		"&*"		bne	LFAA5
FA7B : 20 29		" )"		bra	LFAA6
				;
FA7D				LFA7D:
FA7D : 7F 00 9F		"   "		clr	X009F
FA80 : 7F 00 A9		"   "		clr	X00A9
FA83 : 7F 00 A5		"   "		clr	X00A5
FA86 : DE A1		"  "		ldx	X00A1
;*************************************;
;PRMLDXx5 jsr dest
;*************************************;
;LFA88:
FA88 : A6 00		"  "		ldaa	$00,x
FA8A : 97 9E		"  "		staa	X009E
FA8C : 27 17		"' "		beq	LFAA5
FA8E : A6 01		"  "		ldaa	$01,x
FA90 : 97 A3		"  "		staa	X00A3
FA92 : A6 02		"  "		ldaa	$02,x
FA94 : 97 AA		"  "		staa	X00AA
FA96 : A6 03		"  "		ldaa	$03,x
FA98 : 97 A4		"  "		staa	X00A4
FA9A : A6 04		"  "		ldaa	$04,x
FA9C : 97 A7		"  "		staa	X00A7
FA9E : 86 05		"  "		ldaa	#$05
FAA0 : BD E1 89		"   "		jsr	LE189
FAA3 : DF A1		"  "		stx	X00A1
;LFAA5:
FAA5 : 39				  rts           ;return subroutine
;
;LFAA6:
FAA6 : 32		"2"		pula
FAA7 : 32		"2"		pula
FAA8 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFAA9:
FAA9 : 96 9E		"  "		ldaa	X009E
FAAB : 27 06		"' "		beq	LFAB3
FAAD : 91 91		"  "		cmpa	X0091
FAAF : 26 04		"& "		bne	LFAB5
FAB1 : 20 03		"  "		bra	LFAB6
;LFAB3:
FAB3 : 08		" "		inx
FAB4 : 09		" "		dex
FAB5				LFAB5:
FAB5 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFAB6:
FAB6 : 7F 00 9E		"   "		clr	X009E
FAB9 : 96 A3		"  "		ldaa	X00A3
FABB : 97 9F		"  "		staa	X009F
FABD : 96 AA		"  "		ldaa	X00AA
FABF : 97 A9		"  "		staa	X00A9
FAC1 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFAC2:
FAC2 : 96 A5		"  "		ldaa	X00A5
FAC4 : 9B 9F		"  "		adda	X009F
FAC6 : 97 A5		"  "		staa	X00A5
FAC8 : 2A 01		"* "		bpl	LFACB
FACA : 43		"C"		coma
;LFACB:
FACB : 1B		" "		aba
FACC : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
;LFACF:
FACF : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
;LFAD0:
FAD0 : C0 0D		"  "		subb	#$0D
FAD2 : 37		"7"		pshb
FAD3 : BD 00 AC		"   "		jsr	L00AC
FAD6 : 33		"3"		pulb
FAD7				LFAD7:
FAD7 : C1 14		"  "		cmpb	#$14
FAD9 : 22 F5		"" "		bhi	LFAD0
FADB : 01		" "		nop
FADC : 96 A4		"  "		ldaa	X00A4
FADE : 9B A1		"  "		adda	X00A1
FAE0 : 97 A4		"  "		staa	X00A4
FAE2 : C9 F6		"  "		adcb	#$F6
FAE4				LFAE4:
FAE4 : 5A		"Z"		decb
FAE5 : 2A FD		"* "		bpl	LFAE4
FAE7 : 96 A8		"  "		ldaa	X00A8
FAE9 : 4C		"L"		inca
FAEA : 84 0F		"  "		anda	#$0F
FAEC : 8A 90		"  "		oraa	#$90
FAEE : 97 A8		"  "		staa	X00A8
FAF0 : DE A7		"  "		ldx	X00A7
FAF2 : E6 00		"  "		ldab	$00,x
FAF4 : F7 20 02		"   "		stab	X2002   ;store B in DAC output SOUND
FAF7 : 84 0F		"  "		anda	#$0F
FAF9 : 39		"9"		rts
;*************************************;
;
;*************************************;
				;
FAFA : 4F		"O"		clra
FAFB : CE 00 90		"   "		ldx	#$0090
FAFE : C6 61		" a"		ldab	#$61
FB00				LFB00:
FB00 : A7 00		"  "		staa	$00,x
FB02 : 08		" "		inx
FB03 : 5A		"Z"		decb
FB04 : 26 FA		"& "		bne	LFB00
FB06 : C6 DF		"  "		ldab	#$DF
FB08 : D7 A6		"  "		stab	X00A6
FB0A : C6 B7		"  "		ldab	#$B7
FB0C : D7 B0		"  "		stab	X00B0
FB0E : C6 7E		" ~"		ldab	#$7E
FB10 : D7 AC		"  "		stab	X00AC
FB12 : CE FC E5		"   "		ldx	#$FCE5
FB15 : DF AD		"  "		stx	X00AD
FB17 : D6 8C		"  "		ldab	X008C
FB19 : D7 A3		"  "		stab	X00A3
FB1B				LFB1B:
FB1B : C0 03		"  "		subb	#$03
FB1D				LFB1D:
FB1D : BD FA D7		"   "		jsr	LFAD7
FB20 : 08		" "		inx
FB21				LFB21:
FB21 : D6 A3		"  "		ldab	X00A3
FB23 : C0 02		"  "		subb	#$02
FB25 : BD FA D0		"   "		jsr	LFAD0
FB28 : 26 F7		"& "		bne	LFB21
FB2A : D6 A0		"  "		ldab	X00A0
FB2C : 96 A1		"  "		ldaa	X00A1
FB2E : 9B 8D		"  "		adda	X008D
FB30 : D9 8C		"  "		adcb	X008C
FB32 : 97 8D		"  "		staa	X008D
FB34 : D7 8C		"  "		stab	X008C
FB36 : DB A2		"  "		addb	X00A2
FB38 : 86 19		"  "		ldaa	#$19
FB3A : 11		" "		cba
FB3B : 24 01		"$ "		bcc	LFB3E
FB3D : 81 16		"  "		cmpa	#$16
FB3F : D7 A3		"  "		stab	X00A3
FB41 : 01		" "		nop
FB42 : C0 09		"  "		subb	#$09
FB44 : BD FA D7		"   "		jsr	LFAD7
FB47 : 96 AF		"  "		ldaa	X00AF
FB49 : 16		" "		tab
FB4A : 48		"H"		asla
FB4B : C9 00		"  "		adcb	#$00
FB4D : D7 AF		"  "		stab	X00AF
FB4F : D6 A3		"  "		ldab	X00A3
FB51 : C0 05		"  "		subb	#$05
FB53 : 96 A5		"  "		ldaa	X00A5
FB55 : 2A 06		"* "		bpl	LFB5D
FB57 : 7C 00 A5		"|  "		inc	X00A5
FB5A : 01		" "		nop
FB5B : 20 BE		"  "		bra	LFB1B
				;
FB5D				LFB5D:
FB5D : 5A		"Z"		decb
FB5E : BD FA D7		"   "		jsr	LFAD7
FB61 : DE 8A		"  "		ldx	X008A
FB63 : A6 00		"  "		ldaa	$00,x
FB65 : 2A 12		"* "		bpl	LFB79
FB67 : 81 80		"  "		cmpa	#$80
FB69 : 27 5F		"'_"		beq	LFBCA
FB6B : 4C		"L"		inca
FB6C : 97 A5		"  "		staa	X00A5
FB6E : 08		" "		inx
FB6F : FF 00 8A		"   "		stx	X008A
FB72 : D6 A3		"  "		ldab	X00A3
FB74 : C0 06		"  "		subb	#$06
FB76 : 7E FB 1B		"~  "		jmp	LFB1B
				;
FB79				LFB79:
FB79 : 08		" "		inx
FB7A : E6 00		"  "		ldab	$00,x
FB7C : 37		"7"		pshb
FB7D : 08		" "		inx
FB7E : DF 8A		"  "		stx	X008A
FB80				XFB80:
FB80 : 97 A9		"  "		staa	X00A9
FB82 : 84 70		" p"		anda	#$70
FB84 : 44		"D"		lsra
FB85 : 44		"D"		lsra
FB86 : 44		"D"		lsra
FB87 : 5F		"_"		clrb
FB88 : 8B 5E		" ^"		adda	#$5E
FB8A : C9 FC		"  "		adcb	#$FC
FB8C : 97 AB		"  "		staa	X00AB
FB8E : D7 AA		"  "		stab	X00AA
FB90 : D6 A3		"  "		ldab	X00A3
FB92 : D6 A3		"  "		ldab	X00A3
FB94 : C0 0D		"  "		subb	#$0D
FB96 : BD FA D7		"   "		jsr	LFAD7
FB99 : 5F		"_"		clrb
FB9A : DE AA		"  "		ldx	X00AA
FB9C : EE 00		"  "		ldx	$00,x
FB9E : 6E 00		"n "		jmp	$00,x						;INFO: index jump
				;
FBA0 : 96 A9		"  "		ldaa	X00A9
FBA2 : 47		"G"		asra
FBA3 : C2 00		"  "		sbcb	#$00
FBA5 : D4 8C		"  "		andb	X008C
FBA7 : 32		"2"		pula
FBA8 : 10		" "		sba
FBA9 : 9B 8C		"  "		adda	X008C
FBAB : 97 8C		"  "		staa	X008C
FBAD : 08		" "		inx
FBAE				LFBAE:
FBAE : D6 A3		"  "		ldab	X00A3
FBB0 : C0 0A		"  "		subb	#$0A
FBB2 : 7E FB 1D		"~  "		jmp	LFB1D
				;
FBB5 : 96 A9		"  "		ldaa	X00A9
FBB7 : 47		"G"		asra
FBB8 : C2 00		"  "		sbcb	#$00
FBBA : D4 A2		"  "		andb	X00A2
FBBC : 32		"2"		pula
FBBD : 10		" "		sba
FBBE : 9B A2		"  "		adda	X00A2
FBC0 : 97 A2		"  "		staa	X00A2
FBC2 : 20 EA		"  "		bra	LFBAE
				;
FBC4 : 32		"2"		pula
FBC5 : DE 8A		"  "		ldx	X008A
FBC7 : 09		" "		dex
FBC8 : 6E 00		"n "		jmp	$00,x						;INFO: index jump
				;
FBCA				LFBCA:
FBCA : 96 A6		"  "		ldaa	X00A6
FBCC : 81 DF		"  "		cmpa	#$DF
FBCE : 2B 01		"+ "		bmi	LFBD1
FBD0 : 39		"9"		rts
				;
FBD1				LFBD1:
FBD1 : D6 A3		"  "		ldab	X00A3
FBD3 : C0 07		"  "		subb	#$07
FBD5 : BD FA D7		"   "		jsr	LFAD7
FBD8 : DE A5		"  "		ldx	X00A5
FBDA : 6A 02		"j "		dec	$02,x
FBDC : 2B 12		"+ "		bmi	LFBF0
FBDE : EE 00		"  "		ldx	$00,x
FBE0 : A6 00		"  "		ldaa	$00,x
FBE2 : 36		"6"		psha
FBE3 : 08		" "		inx
FBE4 : DF 8A		"  "		stx	X008A
FBE6 : F6 00 A3		"   "		ldab	X00A3
FBE9 : C0 09		"  "		subb	#$09
FBEB : BD FA D7		"   "		jsr	LFAD7
FBEE : 20 55		" U"		bra	LFC45
				;
FBF0				LFBF0:
FBF0 : EE 00		"  "		ldx	$00,x
FBF2 : 08		" "		inx
FBF3 : DF 8A		"  "		stx	X008A
FBF5				XFBF5:
FBF5 : 96 A6		"  "		ldaa	X00A6
FBF7 : 8B 03		"  "		adda	#$03
FBF9 : 97 A6		"  "		staa	X00A6
FBFB : D6 A3		"  "		ldab	X00A3
FBFD				XFBFD:
FBFD : C0 07		"  "		subb	#$07
FBFF				XFBFF:
FBFF : 01		" "		nop
FC00 : 7E FB 1B		"~  "		jmp	LFB1B
				;
FC03 : 08		" "		inx
FC04 : 20 04		"  "		bra	LFC0A
				;
FC06				XFC06:
FC06 : D7 A0		"  "		stab	X00A0
FC08 : D7 A1		"  "		stab	X00A1
FC0A				LFC0A:
FC0A : D6 A9		"  "		ldab	X00A9
FC0C : C4 0F		"  "		andb	#$0F
FC0E : CB F8		"  "		addb	#$F8
FC10 : C8 F8		"  "		eorb	#$F8
FC12 : 32		"2"		pula
FC13 : 9B A1		"  "		adda	X00A1
FC15 : D9 A0		"  "		adcb	X00A0
FC17 : 97 A1		"  "		staa	X00A1
FC19 : D7 A0		"  "		stab	X00A0
FC1B : F6 00 A3		"   "		ldab	X00A3
FC1E : C0 09		"  "		subb	#$09
FC20 : 7E FB 1B		"~  "		jmp	LFB1B
				;
FC23 : 96 A6		"  "		ldaa	X00A6
FC25 : 80 03		"  "		suba	#$03
FC27 : 97 A6		"  "		staa	X00A6
FC29 : DE A5		"  "		ldx	X00A5
FC2B : 96 8B		"  "		ldaa	X008B
FC2D : D6 8A		"  "		ldab	X008A
FC2F : 8B FF		"  "		adda	#$FF
FC31 : C9 FF		"  "		adcb	#$FF
FC33 : E7 00		"  "		stab	$00,x
FC35 : A7 01		"  "		staa	$01,x
FC37 : D6 A9		"  "		ldab	X00A9
FC39 : C4 0F		"  "		andb	#$0F
FC3B : E7 02		"  "		stab	$02,x
FC3D : D6 A3		"  "		ldab	X00A3
FC3F : C0 0C		"  "		subb	#$0C
FC41 : BD FA D7		"   "		jsr	LFAD7
FC44 : 08		" "		inx
FC45				LFC45:
FC45 : 08		" "		inx
FC46 : 08		" "		inx
FC47 : 5F		"_"		clrb
FC48 : 01		" "		nop
FC49 : 32		"2"		pula
FC4A : 47		"G"		asra
FC4B : 49		"I"		rola
FC4C : C2 00		"  "		sbcb	#$00
FC4E : 9B 8B		"  "		adda	X008B
FC50 : D9 8A		"  "		adcb	X008A
FC52 : 97 8B		"  "		staa	X008B
FC54 : F7 00 8A		"   "		stab	X008A
FC57 : D6 A3		"  "		ldab	X00A3
FC59 : C0 07		"  "		subb	#$07
FC5B : 7E FB 1B		"~  "		jmp	LFB1B
				;
FC5E : FB A0 FB		"   "		addb	XA0FB
FC61 : B5 FC 06		"   "		bita	XFC06
				;
FC64 : FC 03		"  "		db	$FC, $03
				;
FC66 : FB A0 FB		"   "		addb	XA0FB
FC69				LFC69:
FC69 : C4 FC		"  "		andb	#$FC
FC6B : 23 FC		"# "		bls	LFC69
FC6D : 49		"I"		rola
				;
FC6E : FD		" "		db	$FD
				;
FC6F : E2 FE		"  "		sbcb	$FE,x
				;
FC71 : 6B FD 1A		"k  "		db	$6B, $FD, $1A
				;
FC74 : FE 13 FC		"   "		ldx	X13FC
FC77				LFC77:
FC77 : 95 FE		"  "		bita	X00FE
FC79 : 24 FC		"$ "		bcc	LFC77
FC7B : C0 FD		"  "		subb	#$FD
FC7D : 57		"W"		asrb
FC7E : DE AF		"  "		ldx	X00AF
FC80 : EE 03		"  "		ldx	$03,x
FC82 : 08		" "		inx
FC83 : DF 88		"  "		stx	X0088
FC85 : BD FD 51		"  Q"		jsr	LFD51
FC88 : 08		" "		inx
FC89 : 39		"9"		rts
				;
FC8A				LFC8A:
FC8A : EE 00		"  "		ldx	$00,x
FC8C : DF 88		"  "		stx	X0088
FC8E : CE FD 57		"  W"		ldx	#$FD57
FC91 : DF AD		"  "		stx	X00AD
FC93 : 01		" "		nop
FC94 : 39		"9"		rts
				;
FC95 : 96 B0		"  "		ldaa	X00B0
FC97 : 81 B7		"  "		cmpa	#$B7
FC99 : 23 12		"# "		bls	LFCAD
FC9B : DE AF		"  "		ldx	X00AF
FC9D : 6A 02		"j "		dec	$02,x
FC9F : 2A E9		"* "		bpl	LFC8A
FCA1 : 80 03		"  "		suba	#$03
FCA3 : 97 B0		"  "		staa	X00B0
FCA5 : CE FC 7E		"  ~"		ldx	#$FC7E
FCA8 : DF AD		"  "		stx	X00AD
FCAA : 6D 00		"m "		tst	$00,x
FCAC : 39		"9"		rts
				;
FCAD				LFCAD:
FCAD : CE FC B5		"   "		ldx	#$FCB5
FCB0 : DF AD		"  "		stx	X00AD
FCB2 : 01		" "		nop
FCB3 : 20 05		"  "		bra	LFCBA
				;
FCB5 : 08		" "		inx
FCB6 : 08		" "		inx
FCB7 : 01		" "		nop
FCB8				LFCB8:
FCB8 : 8D 05		"  "		bsr	LFCBF
FCBA				LFCBA:
FCBA : 8D 03		"  "		bsr	LFCBF
FCBC				LFCBC:
FCBC : 6D 00		"m "		tst	$00,x
FCBE : 01		" "		nop
FCBF				LFCBF:
FCBF : 39		"9"		rts
				;
FCC0 : DE AF		"  "		ldx	X00AF
FCC2 : 96 88		"  "		ldaa	X0088
FCC4 : A7 03		"  "		staa	$03,x
FCC6 : 96 89		"  "		ldaa	X0089
FCC8 : A7 04		"  "		staa	$04,x
FCCA : 96 B9		"  "		ldaa	X00B9
FCCC : 84 0F		"  "		anda	#$0F
FCCE : A7 05		"  "		staa	$05,x
FCD0 : 08		" "		inx
FCD1 : CE FC D7		"   "		ldx	#$FCD7
FCD4 : DF AD		"  "		stx	X00AD
FCD6 : 39		"9"		rts
				;
FCD7 : 96 B0		"  "		ldaa	X00B0
FCD9 : 8B 03		"  "		adda	#$03
FCDB : 97 B0		"  "		staa	X00B0
FCDD : CE FD 57		"  W"		ldx	#$FD57
FCE0 : DF AD		"  "		stx	X00AD
FCE2 : 01		" "		nop
FCE3 : 20 D5		"  "		bra	LFCBA
				;
FCE5 : 7D 00 AF		"}  "		tst	X00AF
FCE8 : 26 CE		"& "		bne	LFCB8
FCEA : DE 88		"  "		ldx	X0088
FCEC : A6 00		"  "		ldaa	$00,x
FCEE : 08		" "		inx
FCEF : DF 88		"  "		stx	X0088
FCF1 : 97 B9		"  "		staa	X00B9
FCF3 : 2A 05		"* "		bpl	LFCFA
FCF5 : 97 AF		"  "		staa	X00AF
FCF7 : A6 00		"  "		ldaa	$00,x
FCF9 : 39		"9"		rts
				;
FCFA				LFCFA:
FCFA : CE FD 01		"   "		ldx	#$FD01
FCFD : FF 00 AD		"   "		stx	X00AD
FD00 : 39		"9"		rts
				;
FD01 : 5F		"_"		clrb
FD02 : 96 B9		"  "		ldaa	X00B9
FD04 : 84 70		" p"		anda	#$70
FD06 : 44		"D"		lsra
FD07 : 44		"D"		lsra
FD08 : 44		"D"		lsra
FD09 : 8B 6E		" n"		adda	#$6E
FD0B : C9 FC		"  "		adcb	#$FC
FD0D : D7 B7		"  "		stab	X00B7
FD0F : 97 B8		"  "		staa	X00B8
FD11 : DE B7		"  "		ldx	X00B7
FD13 : EE 00		"  "		ldx	$00,x
FD15 : DF AD		"  "		stx	X00AD
FD17 : DF AD		"  "		stx	X00AD
FD19 : 39		"9"		rts
				;
FD1A : 96 B9		"  "		ldaa	X00B9
FD1C : 84 0F		"  "		anda	#$0F
FD1E : 4C		"L"		inca
FD1F : 4C		"L"		inca
FD20 : 97 AF		"  "		staa	X00AF
FD22 : 20 1D		"  "		bra	LFD41
				;
FD24 : 7C 00 B2		"|  "		inc	X00B2
FD27 : DE B1		"  "		ldx	X00B1
FD29 : 8C 00 E8		"   "		cpx	#$00E8
FD2C : 27 13		"' "		beq	LFD41
FD2E : A6 00		"  "		ldaa	$00,x
FD30 : CE FD 6B		"  k"		ldx	#$FD6B
FD33 : 97 B5		"  "		staa	X00B5
FD35 : 27 03		"' "		beq	LFD3A
FD37 : 7E FD 3D		"~ ="		jmp	LFD3D
				;
FD3A				LFD3A:
FD3A : CE FD 24		"  $"		ldx	#$FD24
FD3D				LFD3D:
FD3D : DF AD		"  "		stx	X00AD
FD3F : 08		" "		inx
FD40 : 39		"9"		rts
				;
FD41				LFD41:
FD41 : 86 DE		"  "		ldaa	#$DE
FD43 : B7 00 B2		"   "		staa	X00B2
FD46 : CE FD 24		"  $"		ldx	#$FD24
FD49 : 7A 00 AF		"z  "		dec	X00AF
FD4C : 27 03		"' "		beq	LFD51
FD4E : 7E FD 54		"~ T"		jmp	LFD54
				;
FD51				LFD51:
FD51 : CE FC E5		"   "		ldx	#$FCE5
FD54				LFD54:
FD54 : DF AD		"  "		stx	X00AD
FD56 : 39		"9"		rts
				;
FD57 : DE 88		"  "		ldx	X0088
FD59 : 5F		"_"		clrb
FD5A : A6 00		"  "		ldaa	$00,x
FD5C : 4C		"L"		inca
FD5D : 47		"G"		asra
FD5E : 49		"I"		rola
FD5F : C2 00		"  "		sbcb	#$00
FD61 : 9B 89		"  "		adda	X0089
FD63 : D9 88		"  "		adcb	X0088
FD65 : 97 89		"  "		staa	X0089
FD67 : D7 88		"  "		stab	X0088
FD69 : 20 E6		"  "		bra	LFD51
				;
FD6B : 96 B2		"  "		ldaa	X00B2
FD6D : 80 DF		"  "		suba	#$DF
FD6F : 48		"H"		asla
FD70 : 5F		"_"		clrb
FD71 : 9B 8F		"  "		adda	X008F
FD73 : D9 8E		"  "		adcb	X008E
FD75 : D7 B7		"  "		stab	X00B7
FD77 : 97 B8		"  "		staa	X00B8
FD79 : 86 80		"  "		ldaa	#$80
FD7B : 97 B6		"  "		staa	X00B6
FD7D : CE FD 88		"   "		ldx	#$FD88
FD80 : DF AD		"  "		stx	X00AD
FD82 : CE 00 90		"   "		ldx	#$0090
FD85 : DF B3		"  "		stx	X00B3
FD87 : 39		"9"		rts
				;
FD88 : DE B7		"  "		ldx	X00B7
FD8A : EE 00		"  "		ldx	$00,x
FD8C : DF B7		"  "		stx	X00B7
FD8E : CE FD 9D		"   "		ldx	#$FD9D
FD91 : DF AD		"  "		stx	X00AD
FD93 : DE B1		"  "		ldx	X00B1
FD95 : A6 09		"  "		ldaa	$09,x
FD97 : 9B B5		"  "		adda	X00B5
FD99 : A7 09		"  "		staa	$09,x
FD9B : 08		" "		inx
FD9C : 39		"9"		rts
				;
FD9D : 96 B6		"  "		ldaa	X00B6
FD9F : 27 1D		"' "		beq	LFDBE
FDA1 : 74 00 B6		"t  "		lsr	X00B6
FDA4 : DE B3		"  "		ldx	X00B3
FDA6 : E6 00		"  "		ldab	$00,x
FDA8 : 94 B7		"  "		anda	X00B7
FDAA : 26 09		"& "		bne	LFDB5
FDAC : FB 00 B5		"   "		addb	X00B5
FDAF : E7 00		"  "		stab	$00,x
FDB1 : 7C 00 B4		"|  "		inc	X00B4
FDB4 : 39		"9"		rts
				;
FDB5				LFDB5:
FDB5 : F0 00 B5		"   "		subb	X00B5
FDB8 : E7 00		"  "		stab	$00,x
FDBA : 7C 00 B4		"|  "		inc	X00B4
FDBD : 39		"9"		rts
				;
FDBE				LFDBE:
FDBE : D6 B4		"  "		ldab	X00B4
FDC0 : C1 A0		"  "		cmpb	#$A0
FDC2 : 27 0B		"' "		beq	LFDCF
FDC4 : D6 B8		"  "		ldab	X00B8
FDC6 : D7 B7		"  "		stab	X00B7
FDC8 : C6 80		"  "		ldab	#$80
FDCA : F7 00 B6		"   "		stab	X00B6
FDCD : 20 0F		"  "		bra	LFDDE
				;
FDCF				LFDCF:
FDCF : CE FC E5		"   "		ldx	#$FCE5
FDD2 : D6 AF		"  "		ldab	X00AF
FDD4 : 26 03		"& "		bne	LFDD9
FDD6 : 7E FD DC		"~  "		jmp	LFDDC
				;
FDD9				LFDD9:
FDD9 : CE FD 24		"  $"		ldx	#$FD24
FDDC				LFDDC:
FDDC : DF AD		"  "		stx	X00AD
FDDE				LFDDE:
FDDE : 6D 00		"m "		tst	$00,x
FDE0 : 08		" "		inx
FDE1 : 39		"9"		rts
				;
FDE2 : 96 B9		"  "		ldaa	X00B9
FDE4 : 84 07		"  "		anda	#$07
FDE6 : 8B E0		"  "		adda	#$E0
FDE8 : 97 B2		"  "		staa	X00B2
FDEA : DE 88		"  "		ldx	X0088
FDEC : A6 00		"  "		ldaa	$00,x
FDEE : 08		" "		inx
FDEF : DF 88		"  "		stx	X0088
FDF1 : 97 B5		"  "		staa	X00B5
FDF3 : CE FD FA		"   "		ldx	#$FDFA
FDF6 : DF AD		"  "		stx	X00AD
FDF8 : 08		" "		inx
FDF9 : 39		"9"		rts
				;
FDFA : DE B1		"  "		ldx	X00B1
FDFC : 5F		"_"		clrb
FDFD : 96 B9		"  "		ldaa	X00B9
FDFF : 8B F8		"  "		adda	#$F8
FE01				XFE01:
FE01 : C2 00		"  "		sbcb	#$00
FE03 : E4 09		"  "		andb	$09,x
FE05 : 50		"P"		negb
FE06 : DB B5		"  "		addb	X00B5
FE08				LFE08:
FE08 : D7 B5		"  "		stab	X00B5
FE0A : CE FD 6B		"  k"		ldx	#$FD6B
FE0D : DF AD		"  "		stx	X00AD
FE0F : 08		" "		inx
FE10 : 08		" "		inx
FE11 : 01		" "		nop
FE12 : 39		"9"		rts
				;
FE13 : D6 B9		"  "		ldab	X00B9
FE15 : 54		"T"		lsrb
FE16 : C4 07		"  "		andb	#$07
FE18 : CA E0		"  "		orab	#$E0
FE1A				XFE1A:
FE1A : D7 B2		"  "		stab	X00B2
FE1C : C6 FF		"  "		ldab	#$FF
FE1E : C9 00		"  "		adcb	#$00
FE20 : C9 00		"  "		adcb	#$00
FE22 : 20 E4		"  "		bra	LFE08
				;
FE24 : 96 B9		"  "		ldaa	X00B9
FE26 : 47		"G"		asra
FE27 : 25 13		"% "		bcs	LFE3C
FE29 : CE 00 00		"   "		ldx	#$0000
FE2C : DF E0		"  "		stx	X00E0
FE2E : DF E2		"  "		stx	X00E2
FE30 : DF E4		"  "		stx	X00E4
FE32 : DF E6		"  "		stx	X00E6
FE34 : 08		" "		inx
FE35 : CE FC E5		"   "		ldx	#$FCE5
FE38 : FF 00 AD		"   "		stx	X00AD
FE3B : 39		"9"		rts
				;
FE3C				LFE3C:
FE3C : 85 02		"  "		bita	#$02
FE3E : 26 0C		"& "		bne	LFE4C
FE40 : C6 DF		"  "		ldab	#$DF
FE42 : D7 B2		"  "		stab	X00B2
FE44 : CE FE 51		"  Q"		ldx	#$FE51
FE47				LFE47:
FE47 : DF AD		"  "		stx	X00AD
FE49 : 7E FC BC		"~  "		jmp	LFCBC
				;
FE4C				LFE4C:
FE4C : FE 00 88		"   "		ldx	X0088
FE4F : 20 F6		"  "		bra	LFE47
				;
FE51 : 5F		"_"		clrb
FE52 : 96 B9		"  "		ldaa	X00B9
FE54 : 8B AE		"  "		adda	#$AE
FE56 : C2 00		"  "		sbcb	#$00
FE58 : D4 E8		"  "		andb	X00E8
FE5A : DE 88		"  "		ldx	X0088
FE5C : A6 00		"  "		ldaa	$00,x
FE5E : 08		" "		inx
FE5F : DF 88		"  "		stx	X0088
FE61 : 10		" "		sba
FE62 : 97 B5		"  "		staa	X00B5
FE64 : CE FD 6B		"  k"		ldx	#$FD6B
FE67 : FF 00 AD		"   "		stx	X00AD
FE6A : 39		"9"		rts
				;
FE6B : C6 E0		"  "		ldab	#$E0
FE6D : D7 B2		"  "		stab	X00B2
FE6F : DE 88		"  "		ldx	X0088
FE71 : E6 00		"  "		ldab	$00,x
FE73 : D7 B7		"  "		stab	X00B7
FE75 : 08		" "		inx
FE76 : DF 88		"  "		stx	X0088
FE78 : D6 B9		"  "		ldab	X00B9
FE7A : 54		"T"		lsrb
FE7B : 24 18		"$ "		bcc	LFE95
FE7D : CE FE AF		"   "		ldx	#$FEAF
FE80 : DF AD		"  "		stx	X00AD
FE82 : 39		"9"		rts
				;
FE83 : 5F		"_"		clrb
FE84 : 96 B8		"  "		ldaa	X00B8
FE86 : 47		"G"		asra
FE87 : C2 00		"  "		sbcb	#$00
FE89 : DE B1		"  "		ldx	X00B1
FE8B : E4 00		"  "		andb	$00,x
FE8D : 1B		" "		aba
FE8E				LFE8E:
FE8E : A7 00		"  "		staa	$00,x
FE90 : 7C 00 B2		"|  "		inc	X00B2
FE93 : A6 00		"  "		ldaa	$00,x
FE95				LFE95:
FE95 : CE FE 9B		"   "		ldx	#$FE9B
FE98				LFE98:
FE98 : DF AD		"  "		stx	X00AD
FE9A : 39		"9"		rts
				;
FE9B : 78 00 B7		"x  "		asl	X00B7
FE9E				LFE9E:
FE9E : 25 13		"% "		bcs	LFEB3
FEA0 : 27 06		"' "		beq	LFEA8
FEA2 : 7C 00 B2		"|  "		inc	X00B2
FEA5 : 7E FC BA		"~  "		jmp	LFCBA
				;
FEA8				LFEA8:
FEA8 : BD FD 51		"  Q"		jsr	LFD51
FEAB : 6D 00		"m "		tst	$00,x
FEAD : 01		" "		nop
FEAE : 39		"9"		rts
				;
FEAF : 7A 00 B2		"z  "		dec	X00B2
FEB2 : 08		" "		inx
FEB3				LFEB3:
FEB3 : A6 00		"  "		ldaa	$00,x
FEB5 : DE 88		"  "		ldx	X0088
FEB7 : A6 00		"  "		ldaa	$00,x
FEB9 : 08		" "		inx
FEBA : DF 88		"  "		stx	X0088
FEBC : 97 B8		"  "		staa	X00B8
FEBE : CE FE 83		"   "		ldx	#$FE83
FEC1 : DF AD		"  "		stx	X00AD
FEC3 : 39		"9"		rts
				;
FEC4 : 00 00 55 55	"  UU"		db	$00, $00, $55, $55
				;
FEC8 : 33		"3"		pulb
FEC9 : 33		"3"		pulb
FECA : 25 DA		"% "		bcs	LFEA6
FECC : DA 25		" %"		orab	X0025
				;
FECE : C7		" "		db	$C7
				;
FECF : 31		"1"		ins
				;
FED0 : 00 00		"  "		db	$00, $00
				;
FED2 : FF FF 01		"   "		stx	XFF01
FED5 : FE 53 00		" S "		ldx	X5300
FED8 : 66 16		"f "		ror	$16,x
FEDA : 66 1A		"f "		ror	$1A,x
FEDC : 66 1E		"f "		ror	$1E,x
FEDE : 66 21		"f!"		ror	$21,x
FEE0 : 66 24		"f$"		ror	$24,x
FEE2 : 08		" "		inx
FEE3 : FF E2 66		"  f"		stx	XE266
				;
FEE6 : 1F		" "		db	$1F
				;
FEE7 : 66 18		"f "		ror	$18,x
FEE9 : 66 11		"f "		ror	$11,x
FEEB : 66 09		"f "		ror	$09,x
FEED : 66 01		"f "		ror	$01,x
FEEF : 40		"@"		nega
FEF0 : 08		" "		inx
FEF1 : 5A		"Z"		decb
FEF2 : 08		" "		inx
				;
FEF3 : 00		" "		db	$00
				;
FEF4 : FF 40 08		" @ "		stx	X4008
FEF7 : 96 08		"  "		ldaa	X0008
				;
FEF9 : 00		" "		db	$00
				;
FEFA : FF 40 08		" @ "		stx	X4008
FEFD : C8 08		"  "		eorb	#$08
				;
FEFF : 00		" "		db	$00
				;
FF00 : 40		"@"		nega
FF01				XFF01:
FF01 : 08		" "		inx
FF02 : E6 08		"  "		ldab	$08,x
				;
FF04 : 00		" "		db	$00
				;
FF05 : 40		"@"		nega
FF06 : 08		" "		inx
FF07 : FF 08 00		"   "		stx	X0800
FF0A : 40		"@"		nega
FF0B : 10		" "		sba
FF0C : 20 80		"  "		bra	LFE8E
				;
FF0E : CC CC		"  "		db	$CC, $CC
				;
FF10 : 2F 80		"/ "		ble	LFE92
FF12				XFF12:
FF12 : E2 20		"  "		sbcb	$20,x
FF14 : 80 EC		"  "		suba	#$EC
FF16				XFF16:
FF16 : 2F 80		"/ "		ble	LFE98
FF18 : E2 20		"  "		sbcb	$20,x
FF1A : 80 EC		"  "		suba	#$EC
FF1C : 2F 80		"/ "		ble	LFE9E
FF1E : E2 80		"  "		sbcb	$80,x
FF20 : 64 C4		"d "		lsr	$C4,x
FF22 : 80 53		" S"		suba	#$53
				;
FF24 : 00		" "		db	$00
				;
FF25 : 08		" "		inx
				;
FF26 : 05		" "		db	$05
				;
FF27 : 0E		" "		cli
				;
FF28 : 00		" "		db	$00
				;
FF29 : 0D		" "		sec
				;
FF2A : 05 FD		"  "		db	$05, $FD
				;
FF2C : 0D		" "		sec
				;
FF2D : 00		" "		db	$00
				;
FF2E : 0E		" "		cli
				;
FF2F : 05 FD		"  "		db	$05, $FD
				;
FF31 : 70 F4 28		"p ("		neg	XF428
FF34 : 20 40		" @"		bra	LFF76
				;
FF36 : CE 20 00		"   "		ldx	#$2000
FF39 : 80 10		"  "		suba	#$10
FF3B : 07		" "		tpa
				;
FF3C : 02 02 02 02	"    "		db	$02, $02, $02, $02
FF40 : 02 02		"  "		db	$02, $02
				;
FF42 : 2F 50		"/P"		ble	LFF94
FF44 : 10		" "		sba
				;
FF45 : 05		" "		db	$05
				;
FF46 : FE 27 10		" ' "		ldx	X2710
				;
FF49 : 04		" "		db	$04
				;
FF4A : FE 27 10		" ' "		ldx	X2710
FF4D : 07		" "		tpa
				;
FF4E : 00		" "		db	$00
				;
FF4F : FE 27 10		" ' "		ldx	X2710
FF52 : 06		" "		tap
				;
FF53 : 00		" "		db	$00
				;
FF54 : FE 27 10		" ' "		ldx	X2710
FF57 : 07		" "		tpa
				;
FF58 : 00		" "		db	$00
				;
FF59 : FE 27 10		" ' "		ldx	X2710
FF5C : 06		" "		tap
				;
FF5D : 00		" "		db	$00
				;
FF5E : FE 27 10		" ' "		ldx	X2710
FF61 : 01		" "		nop
				;
FF62 : 00		" "		db	$00
				;
FF63 : 27 10		"' "		beq	LFF75
				;
FF65 : 02 00		"  "		db	$02, $00
				;
FF67 : 70 D1 3C		"p <"		neg	XD13C
FF6A : 20 78		" x"		bra	LFFE4
				;
FF6C : 60 01		"` "		neg	$01,x
FF6E : 80 00		"  "		suba	#$00
FF70 : 01		" "		nop
				;
FF71 : 00		" "		db	$00
				;
FF72 : FF 00 FF		"   "		stx	X00FF
				;
FF75				LFF75:
FF75 : 00		" "		db	$00
				;
FF76				LFF76:
FF76 : 01		" "		nop
FF77 : 80 53		" S"		suba	#$53
				;
FF79 : 00		" "		db	$00
				;
FF7A : 0C		" "		clc
				;
FF7B : 1E		" "		db	$1E
				;
FF7C : 0B		" "		sev
				;
FF7D : 00		" "		db	$00
				;
FF7E : 0A		" "		clv
				;
FF7F : 1E		" "		db	$1E
				;
FF80 : FE 0A 00		"   "		ldx	X0A00
FF83 : 0B		" "		sev
				;
FF84 : 1E		" "		db	$1E
				;
FF85 : FE 70 F4		" p "		ldx	X70F4
FF88 : 96 2F		" /"		ldaa	X002F
FF8A : D0 D0		"  "		subb	X00D0
FF8C : 20 00		"  "		bra	LFF8E
				;
FF8E				LFF8E:
FF8E : EC EC EC		"   "		db	$EC, $EC, $EC
				;
FF91 : 70 FB 80		"p  "		neg	XFB80
;*************************************;
;PARAM
;*************************************;
;LFF94:
FF94 : 86 FF		"  "		ldaa	#$FF
FF96 : 97 90		"  "		staa	X0090
FF98 : CE FE C0		"   "		ldx	#$FEC0
FF9B : DF 92		"  "		stx	X0092
FF9D : 86 20		"  "		ldaa	#$20
FF9F : CE FF E0		"   "		ldx	#$FFE0
FFA2 : 8D 05		"  "		bsr	LFFA9
FFA4 : 86 01		"  "		ldaa	#$01
FFA6 : CE 00 44		"  D"		ldx	#$0044
;LFFA9:
FFA9 : 97 94		"  "		staa	X0094
FFAB : DF 95		"  "		stx	X0095
;LFFAD:
FFAD : CE 00 10		"   "		ldx	#$0010
;LFFB0:
FFB0 : 8D 21		" !"		bsr	LFFD3
FFB2 : 96 91		"  "		ldaa	X0091
FFB4 : 9B 93		"  "		adda	X0093
FFB6 : 97 91		"  "		staa	X0091
;XFFB8:
FFB8 : 96 90		"  "		ldaa	X0090
FFBA : 99 92		"  "		adca	X0092
FFBC : 97 90		"  "		staa	X0090
FFBE : 09		" "		dex
FFBF : 26 EF		"& "		bne	LFFB0
FFC1 : 96 93		"  "		ldaa	X0093
FFC3 : 9B 94		"  "		adda	X0094
FFC5 : 97 93		"  "		staa	X0093
FFC7 : 24 03		"$ "		bcc	LFFCC
FFC9 : 7C 00 92		"|  "		inc	X0092
;LFFCC:
FFCC : DE 92		"  "		ldx	X0092
FFCE : 9C 95		"  "		cpx	X0095
FFD0 : 26 DB		"& "		bne	LFFAD
FFD2 : 39				  rts           ;return subroutine
;*************************************;
;SYNTH 
;*************************************;
;LFFD3:
FFD3 : 4F		"O"		clra
;LFFD4:
FFD4 : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
FFD7 : 8B 20		"  "		adda	#$20
FFD9 : 24 F9		"$ "		bcc	LFFD4
FFDB : 8D 09		"  "		bsr	LFFE6
FFDD : 86 E0		"  "		ldaa	#$E0
;LFFDF:
FFDF : B7 20 02		"   "		staa	X2002   ;store A in DAC output SOUND
FFE2 : 80 20		"  "		suba	#$20
;LFFE4:
FFE4 : 24 F9		"$ "		bcc	LFFDF
;LFFE6:
FFE6 : D6 90		"  "		ldab	X0090
;LFFE8:
FFE8 : 86 02		"  "		ldaa	#$02
;LFFEA:
FFEA : 4A		"J"		deca
FFEB : 26 FD		"& "		bne	LFFEA
FFED : 5A		"Z"		decb
FFEE : 26 F8		"& "		bne	LFFE8
FFF0 : 39				  rts           ;return subroutine
;*************************************;
;
;*************************************;
FFF1 : 00 00 00 00 00 00 00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F0 2E	                ;IRQ    
FFFA : F0 01                  ;RESET SWI (software) 
FFFC : F0 39                  ;NMI   
FFFE : F0 01                  ;RESET (hardware) 

;--------------------------------------------------------------
