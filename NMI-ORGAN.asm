; DEF-ROM NMI-ORGAN SOUNDS CODE - 24 Mar 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines NMI, PARAM7, CALCOS, SYNTH8
; total program (208) of ram1(init,pia,nmi,calcos,prm71init) +  ram2(prm71, synth8, melodyFDB)
;
; Full NMI reset is 1st 2 bars JS Bach's Toccata and Fugue in D Minor + Williams Boot Carpet
; orig starts at last half 1st bar, repeat lower octave, then no more valid melody FDB
; works, FDB write floods constrained.
; pitch is way up now :( pitch is product of jmp position in scratch mem)
; so current last jmp at 002D means it should be back at 0063
;
; SW demo :
; [---- ----][---- ----]
;
;*************************************;
; Scratch RAM (0000-00065) (with typical values)
;*************************************;
0000 : nn nn                          ; PIAs
0002 : nn 00                          ; PRM71 just clr'd?
0004 : 00 01                          ; -,PRM71 X (09 to 05)
0006 : 91 01                          ; X CAL A, PRM71 X (000B loop counter start 01)
0008 : FC 00                          ; X,A (++4 counter, 00 - FC(n0 n4 n8 nC), ~second counter)
000A : A8 3C                          ; SYN8 (count up), PRM71 X, 000E rapid counter up
000C : 3E 3E                          ; X SYN8, A
000E : 01 01                          ; jmp write here, write flood timer here with multiple jmp writes throughout
;~ all nops, then jmp writes:
002A : 01
002B : 91 00      cmpa $00            ;comp A with addr 00 (only sets condition codes NZVC)
002D : 7E 01 4D   jmp $014D           ;jump to addr 014D <-- this should be at 0063
0030 : 00                             ;not used unless FDB change
; ~                                   ; ./cont
0065 : 00                             ;not used unless FDB change
; mem locations derived from X
; ensure hardware has zero'd (00) data to 0066
;*************************************;
;INIT (POWER-ON) org 0066 
;*************************************;
0066 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0069 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
006C : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
006E : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0070 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0072 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0074 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0076 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0078 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
007A : 7F 40 02   clr X4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
007D : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
007F : B7 40 03   staa X4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads
;*************************************;
0082 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0085 : 97 00      staa  $00           ;store A in addr 00
0087 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
008A : 97 01      staa  $01           ;store A in addr 01
;*************************************;
;NMI flood ends at PIA end
;*************************************;
008C : 86 02      ldaa  #$02          ;load A with 02h (0000 0010)
008E : 8D 14      bsr L00A4           ;branch sub PRM71 INIT
0090 : 86 01      ldaa  #$01          ;load A with 01h (0000 0001)
0092 : 8D 10      bsr L00A4           ;branch sub PRM71 INIT
0094 : 20 F6      bra L008C           ;branch always NMI <-- for endless loop
;*************************************;
;CALCOS (0096)
;*************************************;
0096 : DF 05      stx X0005           ;store X in addr (09) 05
0098 : 9B 06      adda  X0006         ;add A with addr (0A) 06
009A : 97 06      staa  X0006         ;store A in addr (0A) 06
009C : 24 03      bcc L00A1           ;branch Carry clear CAL1
009E : 7C 00 05   inc X0005           ;incr addr (09) 05
;CAL1:
00A1 : DE 05      ldx X0005           ;load X from addr (09) 05
00A3 : 39         rts                 ;return subroutine
;*************************************;
;PRM71 INIT (00A4)
;*************************************;
00A4 : 7F 00 02   clr X0002           ;clr (00) addr 02 (04) <-- not used?
00A7 : 97 09      staa  X0009         ;store A in addr (0D) 09
00A9 : CE 01 7B   ldx #$017B          ;load X with 017B (melody data)
;PRM72
00AC : A6 00      ldaa  $00,x         ;load A with addr X + 00h
00AE : 27 0D      beq L00BD           ;branch =0 to rts
00B0 : 7A 00 09   dec X0009           ;decr addr (0D) 09
00B3 : 27 05      beq L00BA           ;branch =0 to jmp to PRM73
00B5 : 4C         inca                ;incr A
00B6 : 8D DE      bsr L0096           ;branch sub CALCOS
00B8 : 20 F2      bra L00AC           ;branch always PRM72
;00BA 
00BA : 7E 01 00   jmp L0100           ;jump to PRM73
00BD : 39         rts                 ;return subroutine
;00BE end
;00C4 : 6 bytes free (+ poss 5 if rem clr addr 02)
;*************************************;
;PRM73 (0100)
;*************************************;
;PRM73
0100 : 08         inx                 ;incr X
0101 : DF 07      stx X0007           ;store X in addr (0B) 07
0103 : BD 00 96   jsr L0096           ;jump sub CALCOS 
0106 : DF 05      stx X0005           ;store X in addr (09) 05
0108 : DE 07      ldx X0007           ;load X in addr (0B) 07
;PRM74
010A : A6 00      ldaa  $00,x         ;load A with addr X + 00h
010C : 97 0D      staa  X000D         ;store A in addr (11) 0D
010E : A6 01      ldaa  $01,x         ;load A with addr X + 01h
0110 : EE 02      ldx $02,x           ;load X with addr X + 02h
0112 : DF 0B      stx X000B           ;store X in addr (0F) 0B
0114 : 8D 0D      bsr L0123           ;branch sub SYNTH8
0116 : DE 07      ldx X0007           ;load X with addr (0B) 07
0118 : 08         inx                 ;incr X
0119 : 08         inx                 ;incr X
011A : 08         inx                 ;incr X
011B : 08         inx                 ;incr X
011C : DF 07      stx X0007           ;store X in addr (0B) 07
011E : 9C 05      cpx X0005           ;comp X with addr (09)
0120 : 26 E8      bne L010A           ;branch !=0 PRM74
;PRM75
0122 : 39         rts                 ;return subroutine
;*************************************;
;SYNTH8 (0123)
;*************************************;
0123 : CE 00 0E   ldx #$000E          ;load X with 000Eh flood start <-- ldx DE 0E direct ?
0126 : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
;SYN81
0128 : 23 15      bls L013F           ;branch if lower or same SYN83 <-- write loop from X000E
012A : 81 03      cmpa  #$03          ;compare A with 03h (0000 0011)
012C : 27 09      beq L0137           ;branch =0 SYN82 
012E : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
0130 : E7 00      stab  $00,x         ;store B in addr X + 00h
0132 : 08         inx                 ;incr X
0133 : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
0135 : 20 F1      bra L0128           ;branch always SYN81
;SYN82
0137 : C6 91      ldab  #$91          ;load B with 91h (1001 0001) <-- poss param ?
0139 : E7 00      stab  $00,x         ;store B in addr X + 00h
013B : 6F 01      clr $01,x           ;clear addr X + 01h
013D : 08         inx                 ;incr X       
013E : 08         inx                 ;incr X
;SYN83 a timer with stored jmp(s)?
013F : C6 7E      ldab  #$7E          ;load B with 7Eh (1111 1110)
0141 : E7 00      stab  $00,x         ;store B in addr X + 00h
0143 : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
0145 : E7 01      stab  $01,x         ;store B in addr X + 01h
0147 : C6 4D      ldab  #$4D          ;load B with 4Dh (0100 1101) 
0149 : E7 02      stab  $02,x         ;store B in addr X + 02h
014B : DE 0B      ldx X000B           ;load X with addr (0F) 0B
;014D - SYN83 stores jmp 7E 01 4D
014D : 4F         clra                ;clear A
014E : F6 00 0A   ldab  X000A         ;load B with addr (0E) 0A <-- ldab D6 0A direct?
0151 : 5C         incb                ;incr B
0152 : D7 0A      stab  X000A         ;store B in addr (0E) 0A
0154 : D4 0D      andb  X000D         ;and B with addr (11) 0D
0156 : 54         lsrb                ;logic shift right B (bit7=0)
0157 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0159 : 54         lsrb                ;logic shift right B (bit7=0)
015A : 89 00      adca  #$00          ;A = Carry + A + 00h 
015C : 54         lsrb                ;logic shift right B (bit7=0)
015D : 89 00      adca  #$00          ;A = Carry + A + 00h 
015F : 54         lsrb                ;logic shift right B (bit7=0)
0160 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0162 : 54         lsrb                ;logic shift right B (bit7=0)
0163 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0165 : 54         lsrb                ;logic shift right B (bit7=0)
0166 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0168 : 54         lsrb                ;logic shift right B (bit7=0)
0169 : 89 00      adca  #$00          ;A = Carry + A + 00h 
016B : 1B         aba                 ;A = A + B 
016C : 48         asla                ;arith shift left A (bit0 is 0)
016D : 48         asla                ;arith shift left A (bit0 is 0)
016E : 48         asla                ;arith shift left A (bit0 is 0)
016F : 48         asla                ;arith shift left A (bit0 is 0)
0170 : 48         asla                ;arith shift left A (bit0 is 0)
0171 : B7 80 00   staa  X8000         ;store A in DAC output SOUND
0174 : 09         dex                 ;decr X
0175 : 27 03      beq  L017A          ;branch =0 SYN84
0177 : 7E 00 0E   jmp  L000E          ;jump to timer location 000E
;SYN84
017A : 39         rts                 ;return subroutine
;*************************************;
;ORGAN MELODY (017B)(orig LFD94) wave/melody table
;*************************************;
017B : 0C 7F 1D 0F FB 7F 23 0F        ;01A0 sound mod, octave info?
0183 : 15 FE 08 50 8A 88 3E 3F        ;018A 3F 1st note pitch 
018B : 02 3E 7C 04 03 FF 3E 3F        ;018B X=02 3E (1st length), 01BF X=03 FF(2nd length), 7C 04 2nd note, 3F 
0193 : 2C E2 7C 12 0D 74 7C 0D        ;0193 X=2C E2(3rd length)
019B : 0E 41 7C 23 0B 50 7C 1D        ;
01A3 : 29 F2 7C 3F 02 3E F8 04        ;
01AB : 03	FF 7C 3F 2C E2 F8 12        ;
01B3 : 0D	74 F8 0D 0E	41 F8 23        ;
01BB : 0B 50 F8 1D 2F	F2 F8 23        ;
01C3 : 
; scratch mem for flood should be within 0012 to 007F on orig hardware.
;01C4 end
;*************************************;
;01C5 monitor RAM
; remainder from orig ROM below (83 bytes)
; ignore line numbers
01AD : 05 A8 7C 12 06 BA 3E 04
01B5 : 07 FF 3E 37 04 C1 3E 23
01BD : 05 A8 1F 12 06 BA 1F 04
01C5 : 07 FF 1F 37 04 C1 1F 23
01CD : 16 A0 FE 1D 17 F9 7F 37
01D5 : 13 06 7F 3F 08 FA FE 04
01DD : 0F FF FE 0D 0E 41 FE 23
01E5 : 0B 50 FE 1D 5F E4 00 47
01ED : 3F 37 30 29 23 1D 17 12
01F5 : 0D 08 04
;*************************************;

