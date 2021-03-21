; DEF-ROM NMI-ORGAN SOUNDS CODE - 21 Mar 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; using PIA addr 8000, 4000 (not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines NMI, PARAM7, CALCOS, SYNTH8
;
; attempting to get the NMI organ melody...
;
; SW demo :
; [---- ----][---- ----]
;
;*************************************;
; Main loop scratch memory reserves
;*************************************;
0000 : 00 00                          ; PIAs
0002 : 00 00                          ;not used
0004 : 00 00                          ; PRM71
0006 : 00 00                          ;
0008 : 00 00                          ; -,PRM71
000A : 00 00                          ; CAL,PRM71
000C : 00 00                          ;
000E : 00 00                          ; SYN8,PRM71
0010 : 00 00                          ; SYN8
0012 : 00 00                          ; SYN8
0014 : 00 00                          ;not used
;*************************************;
;INIT (POWER-ON) org 0016 
;*************************************;
0016 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0019 : CE 80 00	  ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
001C : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
001E : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0020 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0022 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0024 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0026 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0028 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
002A : 7F 40 02   clr X4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
002D : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
002F : B7 40 03   staa X4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads
;*************************************;
0032 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0035 : 97 00      staa  $00           ;store A in addr 00
0037 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
003A : 97 01      staa  $01           ;store A in addr 01
;*************************************;
;NMI
;*************************************;
003C : 86 02		  ldaa	#$02    ;load A with 02h (0000 0010)
003E : BD FA 4D   jsr	LFA4D     ;jump sub PRM71
0041 : 86 01		  ldaa	#$01    ;load A with 01h (0000 0001)
0043 : BD FA 4D   jsr	LFA4D     ;jump sub PRM71
0046 : 20 D7		  bra	LFD19     ;branch always NMI <-- for endless loop
;*************************************;
;PRM71 
;*************************************;
0048 : 7F 00 04   clr	X0004     ;clr (00) addr 04
004B : 97 0D		  staa	X000D   ;store A in addr 0D
004D : CE FD 94   ldx	#$FD94    ;load X with FD94 (wavetable)
;PRM72
0050 : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
0052 : 27 2D		  beq	LFA86     ;branch =0 PRM75
0054 : 7A 00 0D   dec	X000D     ;decr addr 0D
0057 : 27 06		  beq	LFA64     ;branch =0 PRM73
0059 : 4C         inca          ;incr A
005A : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
005D : 20 F1		  bra	LFA55     ;branch always PRM72
;PRM73
005F : 08         inx           ;incr X
0060 : DF 0B		  stx	X000B     ;store X in addr 0B
0062 : BD FC F0   jsr	LFCF0     ;jump sub CALCOS
0065 : DF 09		  stx	X0009     ;store X in addr 09
0067 : DE 0B		  ldx	X000B     ;load X in addr 0B
;PRM74
0069 : A6 00		  ldaa	$00,x   ;load A with addr X + 00h
006B : 97 11		  staa	X0011   ;store A in addr 11
006D : A6 01		  ldaa	$01,x   ;load A with addr X + 01h
006F : EE 02		  ldx	$02,x     ;load X with addr X + 02h
0071 : DF 0F		  stx	X000F     ;store X in addr 0F
0073 : 8D 0E		  bsr	LFA88     ;branch sub SYNTH8
0075 : DE 0B		  ldx	X000B     ;load X with addr 0B
0077 : 08         inx           ;incr X
0078 : 08         inx           ;incr X
0079 : 08         inx           ;incr X
007A : 08         inx           ;incr X
007B : DF 0B		  stx	X000B     ;store X in addr 0B
007D : 9C 09		  cpx	X0009     ;comp X with addr 09
007F : 26 E8		  bne	LFA6E     ;brnach !=0 PRM74
;PRM75
0081 : 39         rts           ;return subroutine
;*************************************;
;CALCOS
;*************************************;
0082 : DF 09		  stx	X0009     ;store X in addr 09
0084 : 9B 0A		  adda	X000A   ;add A with addr 0A
0086 : 97 0A		  staa	X000A   ;store A in addr 0A
0088 : 24 03		  bcc	LFCFB     ;branch Carry clear CAL1
008A : 7C 00 09   inc	X0009     ;incr addr 09
;CAL1:
008D : DE 09		  ldx	X0009     ;load X from addr 09
008F : 39         rts           ;return subroutine
; end 0090 (52 bytes remain up to 00C4)
;*************************************;
;SYNTH8 org 0100 (up to 01FF)
;*************************************;
0100 : CE 00 12   ldx	#$0012    ;load X with 0012h
0103 : 80 02		  suba	#$02    ;A = A - 02h (0000 0010)
;SYN81
0105 : 23 15		  bls	LFAA4     ;branch if lower or same SYN83
0107 : 81 03		  cmpa	#$03    ;compare A with 03h (0000 0011)
0109 : 27 09		  beq	LFA9C     ;branch =0 SYN82
010B : C6 01		  ldab	#$01    ;load B with 01h (0000 0001)
010D : E7 00		  stab	$00,x   ;store B in addr X + 00h
010F : 08				  inx           ;incr X
0110 : 80 02		  suba	#$02    ;A = A - 02h (0000 0010)
0112 : 20 F1		  bra	LFA8D     ;branch always SYN81
;SYN82
0114 : C6 91		  ldab	#$91    ;load B with 91h (1001 0001)
0116 : E7 00		  stab	$00,x   ;store B in addr X + 00h
0118 : 6F 01		  clr	$01,x     ;clear addr X + 01h
011A : 08				  inx           ;incr X       
011B : 08				  inx           ;incr X
;SYN83
011C : C6 7E		  ldab	#$7E    ;load B with 7Eh (0111 1110)
011E : E7 00		  stab	$00,x   ;store B in addr X + 00h
0120 : C6 FA		  ldab	#$FA    ;load B with FAh (1111 1010)
0122 : E7 01		  stab	$01,x   ;store B in addr X + 01h
0124 : C6 B2		  ldab	#$B2    ;load B with B2h (1011 0010) 
0126 : E7 02		  stab	$02,x   ;store B in addr X + 02h
0128 : DE 0F		  ldx	X000F     ;load X with addr 0F
012A : 4F				  clra          ;clear A
012B : F6 00 0E   ldab	X000E   ;load B with addr 0E
012E : 5C				  incb          ;incr B
012F : D7 0E		  stab	X000E   ;store B in addr 0E
0131 : D4 11		  andb	X0011   ;and B with addr 11
0133 : 54				  lsrb          ;logic shift right B (bit7=0)
0134 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
0136 : 54				  lsrb          ;logic shift right B (bit7=0)
0137 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
0139 : 54				  lsrb          ;logic shift right B (bit7=0)
013A : 89 00		  adca	#$00    ;A = Carry + A + 00h 
013C : 54				  lsrb          ;logic shift right B (bit7=0)
013D : 89 00		  adca	#$00    ;A = Carry + A + 00h 
013F : 54				  lsrb          ;logic shift right B (bit7=0)
0140 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
0142 : 54				  lsrb          ;logic shift right B (bit7=0)
0143 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
0145 : 54				  lsrb          ;logic shift right B (bit7=0)
0146 : 89 00		  adca	#$00    ;A = Carry + A + 00h 
0148 : 1B				  aba           ;A = A + B 
0149 : 48				  asla          ;arith shift left A (bit0 is 0)
014A : 48				  asla          ;arith shift left A (bit0 is 0)
014B : 48				  asla          ;arith shift left A (bit0 is 0)
014C : 48				  asla          ;arith shift left A (bit0 is 0)
014D : 48				  asla          ;arith shift left A (bit0 is 0)
014E : B7 04 00   staa	X0400   ;store A in DAC output SOUND
0151 : 09				  dex           ;decr X
0152 : 27 03		  beq	LFADF     ;branch =0 SYN84
;SYN84
0154 : 39				  rts           ;return subroutine
;*************************************;
;ORGAN MELODY LFD94 wavetable, maybe, somewhere
;*************************************;
0155 : 0C 7F 1D 0F FB 7F 23	0F
015D : 15 FE 08 50 8A 88 3E	3F
0165 : 02	3E 7C 04 03	FF 3E 3F
016D : 2C E2 7C 12 0D	74 7C 0D
0175 : 0E	41 7C 23 0B	50 7C 1D 
017D : 29	F2 7C 3F 02	3E F8 04 
0185 : 03	FF 7C 3F 2C E2 F8 12 
018D : 0D	74 F8 0D 0E	41 F8 23 
0195 : 0B	50 F8 1D 2F	F2 F8 23
019D : 05	A8 F8	12 06 BA F8 04
01A5 : 07	FF 7C 37 04	C1 7C	23 
01AD : 05	A8 7C	12 06	BA 3E 04
01B5 : 07	FF 3E 37 04	C1 3E	23 
01BD : 05 A8 1F	12 06 BA 1F 04
01C5 : 07	FF 1F 37 04	C1 1F	23 
01CD : 16	A0 FE	1D 17 F9 7F 37
01D5 : 13	06 7F 3F 08	FA FE 04
01DD : 0F	FF FE 0D 0E 41 FE 23 
01E5 : 0B 50 FE 1D 5F E4 00	47
01ED : 3F	37 30	29 23	1D 17	12
01F5 : 0D	08 04
;*************************************;
; 01F7 : end, up to 01FF
