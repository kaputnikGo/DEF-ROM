; DEF-ROM NMI-ORGAN SOUNDS CODE - 4 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines NMI, PARAM7, CALCOS, SYNTH8 - revert mem locations.
;
; Full NMI reset is 1st 2 bars JS Bach's Toccata and Fugue in D Minor + Williams Boot Carpet
; orig starts at last half 1st bar, repeat lower octave, then no more valid melody FDB
; current: A2, G2, A2, E2, F2, C#2, D2 || A1 stuck and held
; note: 01BE change from F8 to CC for last jmp write location means mem length broken here.
; duration + pair pitch values for samp freq/counter
; added SoundROM6 melody FDB for testing
;
; figure why use CALCOS to skip 13 bytes in fdb melody, ie can recover that mem?
;
; SW demo :
; [---- ----][---- ----]
; note from older SYNTH8.asm file: if write flood starts at $0016, PIA2 write to $0022 (001E here) adds inner loop, and
; PIA1 writes to $0011 (000D here) changes pitch
;
;possible addition to make programming heathkit easier (from SoundROM6):
;F81E : CE 00 7F   ldx #$007F    ;load X with value 007F
;RST1:
;F821 : 6F 00      clr	$00,x     ;clear addr X + 00h
;F823 : 09         dex           ;decr X
;F824 : 26 FB      bne	LF821     ;branch if Z=0 RST1 (loop clears mem addr 007F down to 0000)
;
;*************************************;
; Scratch RAM (0000-0007F) (with typical values) (clear 00 at start)
;*************************************;
0000 : 00 00                          ; PIAs
0002 : 00 00                          ;not used <-- not used?
0004 : 00 00                          ; PRM71
0006 : 00 00                          ;not used
0008 : 00 01                          ; -,PRM71 X
000A : 29 01                          ; X CAL A (vals 29,A0), PRM71 X ()
000C : FC 00                          ; X,A (counter)
000E : A8 3C                          ; SYN8, PRM71 X, 000E rapid counter up
0010 : 00 00                          ; X SYN8, A
0012 : 00 00                          ; write flood, should contain several 7E 01 65 writes for PC jmps
; ~                                   ; last jmp write at 0077: 7E 01 65
007A : 00                             ;not used
; ~
007F : 00                             ;not used (21 bytes)
;*************************************;
;INIT (POWER-ON) org 0080 
;*************************************;
0080 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0083 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
0086 : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0088 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
008A : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
008C : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
008E : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0090 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0092 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
0094 : 7F 40 02   clr $4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
0097 : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
0099 : B7 40 03   staa $4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads
;*************************************;
009C : B6 80 02   ldaa  $8002         ;load A with PIA1 B
009F : 97 00      staa  $00           ;store A in addr 00
00A1 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
00A4 : 97 01      staa  $01           ;store A in addr 01
;*************************************;
;NMI
;*************************************;
00A6 : 86 02      ldaa  #$02          ;load A with 02h (0000 0010)
00A8 : BD 01 00   jsr L0100           ;jump sub PRM71
00AB : 86 01      ldaa  #$01          ;load A with 01h (0000 0001)
00AD : BD 01 00   jsr L0100           ;jump sub PRM71
00B0 : 20 F4      bra L003E           ;branch always NMI <-- for endless loop
;*************************************;
;CALCOS 00B2
;*************************************;
00B2 : DF 09      stx $09             ;store X in addr 09
00B4 : 9B 0A      adda  $0A           ;add A with addr 0A
00B6 : 97 0A      staa  $0A           ;store A in addr 0A
00B8 : 24 03      bcc L008F           ;branch Carry clear CAL1
00BA : 7C 00 09   inc $0009           ;incr addr 09
;CAL1:
00BD : DE 09      ldx $09             ;load X from addr 09
00BF : 39         rts                 ;return subroutine 
;00C0 : end
;00C4 
;*************************************;
;PRM71 0100
;*************************************;
0100 : 7F 00 04   clr $0004           ;clr (00) addr 04 <-- not used?
0103 : 97 0D      staa  $0D           ;store A in addr 0D
0105 : CE 01 93   ldx #$0193          ;load X with 0193 (addr of melody data)
;PRM72
0108 : A6 00      ldaa  $00,x         ;load A with value at addr X + 00h
010A : 27 2E      beq L0083           ;branch if Z=1(in accum all bits are 0) to PRM75
010C : 7A 00 0D   dec $000D           ;decr value in addr 0D
010F : 27 06      beq L0061           ;branch if Z=1 PRM73
0111 : 4C         inca                ;incr A
0112 : BD 00 B2   jsr L00B2           ;jump sub CALCOS (shifts X start addr 0193 to 01A0)
0115 : 20 F1      bra L0052           ;branch always PRM72
;PRM73
0117 : 08         inx                 ;incr X
0118 : DF 0B      stx $0B             ;store X in addr 0B
011A : BD 00 B2   jsr L00B2           ;jump sub CALCOS
011D : DF 09      stx $09             ;store X in addr 09
011F : DE 0B      ldx $0B             ;load X in addr 0B
;PRM74 - store melody location into mem 11, sets X with melody addr and A with X(lo)
0121 : A6 00      ldaa  $00,x         ;load A with addr X + 00h
0123 : 97 11      staa  X0011         ;store A in addr 11
0125 : A6 01      ldaa  $01,x         ;load A with addr X + 01h
0127 : EE 02      ldx $02,x           ;load X with addr X + 02h
0129 : DF 0F      stx $0F             ;store X in addr 0F
012B : BD 01 3B   jsr L013B           ;jump sub SYNTH8 013B
012E : DE 0B      ldx $0B             ;load X with addr 0B
0130 : 08         inx                 ;incr X
0131 : 08         inx                 ;incr X
0132 : 08         inx                 ;incr X
0133 : 08         inx                 ;incr X
0134 : DF 0B      stx $0B             ;store X in addr 0B
0136 : 9C 09      cpx $09             ;comp X with addr 09
0138 : 26 E7      bne L0121           ;branch Z=0 PRM74
;PRM75
013A : 39         rts                 ;return subroutine
;*************************************;
;SYNTH8 013B
;*************************************;
013B : CE 00 12   ldx #$0012          ;load X with 0012h flood start
013E : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
;SYN81 - 01 nop length writer for freq/pitch
0140 : 23 15      bls L0157           ;branch if lower or same(C and Z = 1) SYN83 <-- write loop from 0012
0142 : 81 03      cmpa  #$03          ;compare A with 03h (0000 0011) (needs 3 more bytes space for jmp write)
0144 : 27 09      beq L014F           ;branch Z=1 SYN82 <-- loop countdown =0
0146 : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
0148 : E7 00      stab  $00,x         ;store B in addr X + 00h <-- 01 nop writer
014A : 08         inx                 ;incr X
014B : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
014D : 20 F1      bra L0140           ;branch always SYN81
;SYN82 - writes 91 00 (cmpa $00) gate for freq/pitch end jmp
014F : C6 91      ldab  #$91          ;load B with 91h (1001 0001)
0151 : E7 00      stab  $00,x         ;store B in addr X + 00h
0153 : 6F 01      clr $01,x           ;clear addr X + 01h
0155 : 08         inx                 ;incr X       
0156 : 08         inx                 ;incr X
;SYN83 - writes 7E 01 65 (jmp 0165) end freq/pitch
0157 : C6 7E      ldab  #$7E          ;load B with 7Eh (1111 1110)
0159 : E7 00      stab  $00,x         ;store B in addr X + 00h
015B : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
015D : E7 01      stab  $01,x         ;store B in addr X + 01h
015F : C6 65      ldab  #$65          ;load B with 65h (1110 0010) 
0161 : E7 02      stab  $02,x         ;store B in addr X + 02h
0163 : DE 0F      ldx $0F             ;load X with addr 0F
;0165 - synth output writer and loop reader
0165 : 4F         clra                ;clear A
0166 : F6 00 0E   ldab  $000E         ;load B with addr 0E
0169 : 5C         incb                ;incr B
016A : D7 0E      stab  $0E           ;store B in addr 0E <-- counter up
016C : D4 11      andb  $11           ;and B with value in addr 11 (3E in 1st run)
016E : 54         lsrb                ;logic shift right B (bit7=0)
016F : 89 00      adca  #$00          ;A = Carry + A + 00h 
0171 : 54         lsrb                ;logic shift right B (bit7=0)
0172 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0174 : 54         lsrb                ;logic shift right B (bit7=0)
0175 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0177 : 54         lsrb                ;logic shift right B (bit7=0)
0178 : 89 00      adca  #$00          ;A = Carry + A + 00h 
017A : 54         lsrb                ;logic shift right B (bit7=0)
017B : 89 00      adca  #$00          ;A = Carry + A + 00h 
017D : 54         lsrb                ;logic shift right B (bit7=0)
017E : 89 00      adca  #$00          ;A = Carry + A + 00h 
0180 : 54         lsrb                ;logic shift right B (bit7=0) (shift down till C set for adca to count up, A to DAC)
0181 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0183 : 1B         aba                 ;A = A + B 
0184 : 48         asla                ;arith shift left A (bit0 is 0)
0185 : 48         asla                ;arith shift left A (bit0 is 0)
0186 : 48         asla                ;arith shift left A (bit0 is 0)
0187 : 48         asla                ;arith shift left A (bit0 is 0)
0188 : 48         asla                ;arith shift left A (bit0 is 0) (increases value in A)
0189 : B7 80 00   staa  $8000         ;store A in DAC output SOUND
018C : 09         dex                 ;decr X
018D : 27 03      beq  L019F          ;branch Z=1 SYN84
018F : 7E 00 12   jmp  L0012          ;jump to timer location 0012 (to jmp writes that set freq/pitch duration)
;SYN84
0192 : 39         rts                 ;return subroutine
;*************************************;
;ORGAN 0193 melody table (total FDB 162 bytes, A2h length)
;*************************************;
0193 : 0C 7F 1D 0F FB 7F 23 0F        ;notes on fdb below
019B : 15 FE 08 50 8A 88 3E 3F        ;
01A3 : 02 3E 7C 04 03 FF 3E 3F        ;
01AB : 2C E2 7C 12 0D 74 7C 0D        ;
01B3 : 0E 41 7C 23 0B 50 7C 1D        ;
01BB : 29 F2 7C 3F;02 3E F8 04        ;
01C3 :                                ;
;01C4 end                             ; 
;*************************************;
;melody fdb X pairs for freq and length
;*************************************;
0193 : [0C 7F] 1D 0F FB 7F 23 0F             ;PRM72 start X val 0193, +13 bytes to 01A0 after CALCOS
019B : 15 FE 08 50 8A [88] | [3E 3F]         ;skipped, [88] called via CALCOS ldx $09 (01A0), 1st
01A3 : [02 3E] | [7C 04] [03 FF] | [3E 3F]   ; 
01AB : [2C E2] | [7C 12] [0D 74] | [7C 0D]   ;
01B3 : [0E 41] | [7C 23] [0B 50] | [7C 1D]   ;
01BB : [29 F2] | [7C 3F] ;[?? ??]            ; ?? ?? is [02 3E]
;*************************************;
; alt melody from Pharaoh ROM
;*************************************;
FECD : 34 7C 29 05 56 7C 1D 05        ;
FED5 : FE 7C 17 0C B2 7C 1D 0B        ;
FEDD : FC 7C 29 05 56 F8 04 07        ;
FEE5 : FF 7C 29 05 56 7C 1D 05        ;
FEED : FE 7C 17 06 59 7C 04 07        ;
FEF5 : FF 7C 1D 05 ;FE 7C 17 06
;*************************************;
;original ROM1:
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
; SoundROM 6 (Pharaoh) melody fdb
;*************************************;
FECD : 34 7C 29 05 56 7C 1D 05
FED5 : FE 7C 17 0C B2 7C 1D 0B
FEDD : FC 7C 29 05 56 F8 04 07
FEE5 : FF 7C 29 05 56 7C 1D 05
FEED : FE 7C 17 06 59 7C 04 07
FEF5 : FF 7C 1D 05 ;FE 7C 17 06
;
FEFD : 59	7C 29 2A B6 18 F8	04 
FF05 : 02	FF 00 23 06	01 F8 04 
FF0D : 03	FF 00 23 02	AB F8	04
FF15 : 07 FF 7C 29 15 5B 60 7C
FF1D : 1D 05 FE F8 04 1F FF 7C 
FF25 : 04	1F FF 7C 1D 11 FA 00 
FF2D : 1D 02 FF 7C 1D	02 FF 7C 
FF35 : 17 0C B2 7C 1D	0B FC	7C 
FF3D : 23 0A AD 7C 37	09 83	7C 
FF45 : 3F 11 F5 3E 3F	11 F5 7C 
FF4D : 17	16 34	7C 1D 02 FF 7C 
FF55 : 17	0C B2 7C 1D 0B FC 7C 
FF5D : 29 0A AD 7C 3F	04 7D 7C 
FF65 : 37 04 C1 7C 3F 14 36	F8 
FF6D : 1D 14 FF F8 04 03 FF 00 
FF75 : 04 03 F8 F8 04 3F FF 00 
;*************************************;
;melody fdb X pairs for freq and length
;*************************************;
0193 : [0C 7F] 1D 0F FB 7F 23 0F   ;PRM72 start X value 0193, jumps to 01A0 after CALCOS, rest skipped
019B : 15 FE 08 50 8A [88] 
note| [?  nop][? length]
A2  | [3E 3F] [02 3E] 
G2  | [7C 04] [03 FF] 
A2  | [3E 3F] [2C E2] 
E2  | [7C 12] [0D 74] 
F2  | [7C 0D] [0E 41] 
C#2 | [7C 23] [0B 50] 
D2  | [7C 1D] [29 02] 
A1  | [3E CC] [?? ??]  ;?? ?? is [04 03]

;note mapping ROM1
FDA2 : 3E 3F 02	3E 
FDA6 : 7C 04 03	FF 
FDAA : 3E 3F 2C E2 
FDAE : 7C 12 0D 74 
FDB2 : 7C 0D 0E	41 
FDB6 : 7C 23 0B	50 
FDBA : 7C 1D 29 F2 
FDBE : 7C 3F 02	3E 
FDC2 : F8 04 03	FF 
FDC6 : 7C 3F 2C E2 
FDCA : F8 12 0D	74 
FDCE : F8 0D 0E	41 
FDD2 : F8 23 0B 50 
FDD6 : F8 1D 2F	F2 
FDDA : F8 23 05 A8 
FDDE : F8 12 06	BA 
FDE2 : F8 04 07	FF 
FDE6 : 7C 37 04	C1 
FDEA : 7C	23 05 A8 
FDEE : 7C	12 06	BA 
FDF2 : 3E 04 07	FF 
FDF6 : 3E 37 04	C1 
FDFA : 3E	23 05 A8 
FDFE : 1F 12 06 BA 
FE02 : 1F 04 07	FF 
FE06 : 1F 37 04	C1 
FE0A : 1F	23 16 A0 
FE0E : FE	1D 17	F9 
FE12 : 7F 37 13 06 
FE16 : 7F 3F 08 FA 
FE1A : FE 04 0F	FF 
FE1E : FE 0D 0E 41 
FE22 : FE 23 0B	50 
FE26 : FE 1D 5F	E4 
FE2A : 00	47 3F	37 
FE2E : 30	29 23	1D 
FE32 : 17	12 0D 08 
FE36 : 04

