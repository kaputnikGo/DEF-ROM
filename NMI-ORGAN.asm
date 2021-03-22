; DEF-ROM NMI-ORGAN SOUNDS CODE - 22 Mar 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines NMI, PARAM7, CALCOS, SYNTH8
; jmp,jsr,bsr addrs done
; runs in emu
;
; attempting to get the NMI organ melody...
;
; SW demo :
; [---- ----][---- ----]
;
;*************************************;
; Main loop scratch memory reserves (with halt values)
;*************************************;
0000 : 00 00                          ; PIAs
0002 : 00 00                          ;not used
0004 : 00 00                          ; PRM71
0006 : 00 00                          ;not used
0008 : 00 01                          ; -,PRM71 X
000A : EB 7F                          ; X CAL A, PRM71 X
000C : FF 00                          ; X,A
000E : A8 3C                          ; SYN8, PRM71 X
0010 : 00 00                          ; X SYN8, A
0012 : 00 00                          ;
0014 : 00 00                          ;
0016 : 00 00                          ;
;*************************************;
;INIT (POWER-ON) org 0018 
;*************************************;
0018 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
001B : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
001E : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0020 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0022 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0024 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0026 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0028 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
002A : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
002C : 7F 40 02   clr X4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
002F : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
0031 : B7 40 03   staa X4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads
;*************************************;
0034 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0037 : 97 00      staa  $00           ;store A in addr 00
0039 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
003C : 97 01      staa  $01           ;store A in addr 01
;*************************************;
;NMI
;*************************************;
003E : 86 02      ldaa  #$02          ;load A with 02h (0000 0010)
0040 : BD 00 4A   jsr L004A           ;jump sub PRM71
0043 : 86 01      ldaa  #$01          ;load A with 01h (0000 0001)
0045 : BD 00 4A   jsr L004A           ;jump sub PRM71
0048 : 20 F4      bra L003E           ;branch always NMI <-- for endless loop
;*************************************;
;PRM71 
;*************************************;
004A : 7F 00 04   clr X0004           ;clr (00) addr 04
004D : 97 0D      staa  X000D         ;store A in addr 0D
004F : CE 01 55   ldx #$0155          ;load X with 0155 (wavetable)
;PRM72
0052 : A6 00      ldaa  $00,x         ;load A with addr X + 00h
0054 : 27 2D      beq L0083           ;branch =0 PRM75
0056 : 7A 00 0D   dec X000D           ;decr addr 0D
0059 : 27 06      beq L0061           ;branch =0 PRM73
005B : 4C         inca                ;incr A
005C : BD 00 84   jsr L0084           ;jump sub CALCOS
005F : 20 F1      bra L0052           ;branch always PRM72
;PRM73
0061 : 08         inx                 ;incr X
0062 : DF 0B      stx X000B           ;store X in addr 0B
0064 : 8D 1E      bsr L0084           ;branch sub CALCOS 
0066 : DF 09      stx X0009           ;store X in addr 09
0068 : DE 0B      ldx X000B           ;load X in addr 0B
;PRM74
006A : A6 00      ldaa  $00,x         ;load A with addr X + 00h
006C : 97 11      staa  X0011         ;store A in addr 11
006E : A6 01      ldaa  $01,x         ;load A with addr X + 01h
0070 : EE 02      ldx $02,x           ;load X with addr X + 02h
0072 : DF 0F      stx X000F           ;store X in addr 0F
0074 : BD 01 00   jsr L0100           ;jump sub SYNTH8 0100
0077 : DE 0B      ldx X000B           ;load X with addr 0B
0079 : 08         inx                 ;incr X
007A : 08         inx                 ;incr X
007B : 08         inx                 ;incr X
007C : 08         inx                 ;incr X
007D : DF 0B      stx X000B           ;store X in addr 0B
; original hardware has $0000 - $007F RAM 
007F : 9C 09      cpx X0009           ;comp X with addr 09
0081 : 26 E7      bne LFA6E           ;branch !=0 PRM74
;PRM75
0083 : 39         rts                 ;return subroutine
;*************************************;
;CALCOS
;*************************************;
0084 : DF 09      stx X0009           ;store X in addr 09
0086 : 9B 0A      adda  X000A         ;add A with addr 0A
0088 : 97 0A      staa  X000A         ;store A in addr 0A
008A : 24 03      bcc L008F           ;branch Carry clear CAL1
008C : 7C 00 09   inc X0009           ;incr addr 09
;CAL1:
008F : DE 09      ldx X0009           ;load X from addr 09
0091 : 39         rts                 ;return subroutine
; end 0092 (50 bytes remain up to 00C4)
;*************************************;
;SYNTH8 org 0100 (up to 01FF)
;*************************************;
0100 : CE 01 81   ldx #$0181          ;load X with flood start, move to wavetable area 0181-01FF
0103 : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
;SYN81
0105 : 23 15      bls L011C           ;branch if lower or same SYN83
0107 : 81 03      cmpa  #$03          ;compare A with 03h (0000 0011)
0109 : 27 09      beq L0114           ;branch =0 SYN82
010B : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
010D : E7 00      stab  $00,x         ;store B in addr X + 00h
010F : 08         inx                 ;incr X
0110 : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
0112 : 20 F1      bra L0105           ;branch always SYN81
;SYN82
0114 : C6 91      ldab  #$91          ;load B with 91h (1001 0001)
0116 : E7 00      stab  $00,x         ;store B in addr X + 00h
0118 : 6F 01      clr $01,x           ;clear addr X + 01h
011A : 08         inx                 ;incr X       
011B : 08         inx                 ;incr X
;SYN83 a timer with a stored jmp?
011C : C6 7E      ldab  #$7E          ;load B with 7Eh (0111 1110)
011E : E7 00      stab  $00,x         ;store B in addr X + 00h
0120 : C6 01      ldab  #$01          ;load B with (was FAh (1111 1010)) <-- change to 01h (0000 0001)
0122 : E7 01      stab  $01,x         ;store B in addr X + 01h
0124 : C6 2A      ldab  #$2A          ;load B with B2h (1011 0010) <-- change to 2Ah (0010 1010) 
0126 : E7 02      stab  $02,x         ;store B in addr X + 02h
0128 : DE 0F      ldx X000F           ;load X with addr 0F
;012A SYN83 stores 7E FA B2 jmp $FAB2, change to 7E 01 2A
012A : 4F         clra                ;clear A
012B : F6 00 0E   ldab  X000E         ;load B with addr 0E
012E : 5C         incb                ;incr B
012F : D7 0E      stab  X000E         ;store B in addr 0E
0131 : D4 11      andb  X0011         ;and B with addr 11
0133 : 54         lsrb                ;logic shift right B (bit7=0)
0134 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0136 : 54         lsrb                ;logic shift right B (bit7=0)
0137 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0139 : 54         lsrb                ;logic shift right B (bit7=0)
013A : 89 00      adca  #$00          ;A = Carry + A + 00h 
013C : 54         lsrb                ;logic shift right B (bit7=0)
013D : 89 00      adca  #$00          ;A = Carry + A + 00h 
013F : 54         lsrb                ;logic shift right B (bit7=0)
0140 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0142 : 54         lsrb                ;logic shift right B (bit7=0)
0143 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0145 : 54         lsrb                ;logic shift right B (bit7=0)
0146 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0148 : 1B         aba                 ;A = A + B 
0149 : 48         asla                ;arith shift left A (bit0 is 0)
014A : 48         asla                ;arith shift left A (bit0 is 0)
014B : 48         asla                ;arith shift left A (bit0 is 0)
014C : 48         asla                ;arith shift left A (bit0 is 0)
014D : 48         asla                ;arith shift left A (bit0 is 0)
014E : B7 04 00   staa  X0400         ;store A in DAC output SOUND
0151 : 09         dex                 ;decr X
; in here is a beq to a jmp 0012 (mem location) so is it executable?
;0152 : 27 03      beq  LFADF     ;branch =0 SYN84
;0154 : 7E 00 12   jmp  L0012     ;jump extended addr 0012 (scratch mem location?)
;SYN84 LFADF:
0152 : 39         rts                 ;return subroutine
0153 : 01 01      nop nop             ;spare
;*************************************;
;ORGAN MELODY LFD94 wave/melody table ?
;*************************************;
0155 : 0C 7F 1D 0F FB 7F 23 0F
015D : 15 FE 08 50 8A 88 3E 3F
0165 : 02 3E 7C 04 03 FF 3E 3F
016D : 2C E2 7C 12 0D 74 7C 0D
0175 : 0E 41 7C 23 0B 50 7C 1D
017D : 29 F2 7C 3F 
;0181 : write flood zone below 
;(01 with some var (7E 01 2A) values at :
; 0181,0183-0186,0189,018B,018D-018F,0190-0192,0194,019E-019F,01A0,01A2)
;7E 01 2A write at 01BF
0181 : 02 3E F8 04
0185 : 03 FF 7C 3F 2C E2 F8 12
018D : 0D 74 F8 0D 0E 41 F8 23
0195 : 0B 50 F8 1D 2F F2 F8 23
019D : 05 A8 F8 12 06 BA F8 04
01A5 : 07 FF 7C 37 04 C1 7C 23
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
; 01F8 : end, up to 01FF
