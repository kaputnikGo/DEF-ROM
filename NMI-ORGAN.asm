; DEF-ROM NMI-ORGAN SOUNDS CODE - 23 Mar 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines NMI, PARAM7, CALCOS, SYNTH8
; jmp,jsr,bsr addrs done
; runs in emu, hardware single blip then silent looping
; total program (208) of 121(init,nmi,param,calcos) +  87(synth8) bytes
;
; attempting to get the NMI organ melody...
; move all prog to 0100+, leave 00-C4 as RAM (orig hardware has 00-7F RAM)
;
; SW demo :
; [---- ----][---- ----]
;
;*************************************;
; Scratch RAM (0000-0007F) (with typical values)
;*************************************;
0000 : 00 00                          ; PIAs
0002 : 00 00                          ;not used
0004 : 00 00                          ; PRM71
0006 : 00 00                          ;not used
0008 : 00 01                          ; -,PRM71 X
000A : 91 01                          ; X CAL A, PRM71 X (000B loop counter start 01)
000C : FC 00                          ; X,A (000C ++4 counter, 00 - FC(n0 n4 n8 nC), ~second counter)
000E : A8 3C                          ; SYN8, PRM71 X, 000E rapid counter up
0010 : 00 00                          ; X SYN8, A
0012 : 00 00                          ; write flood timer here
0014 : 00 00                          ;
0016 : 00 00                          ; should contain 7E 01 72 writes for PC jmps
; ~
007F : 00                             ; last scratch mem address
;*************************************;
;INIT (POWER-ON) org 0080 
;*************************************;
0080 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0084 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
0087 : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0089 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
008B : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
008D : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
008F : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0091 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0093 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
0095 : 7F 40 02   clr X4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
0098 : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
009A : B7 40 03   staa X4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads
;*************************************;
009D : B6 80 02   ldaa  $8002         ;load A with PIA1 B
00A0 : 97 00      staa  $00           ;store A in addr 00
00A2 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
00A5 : 97 01      staa  $01           ;store A in addr 01
;*************************************;
;NMI
;*************************************;
00A7 : 86 02      ldaa  #$02          ;load A with 02h (0000 0010)
00A9 : BD 01 00   jsr L0100           ;jump sub PRM71
00AC : 86 01      ldaa  #$01          ;load A with 01h (0000 0001)
00AE : BD 01 00   jsr L0100           ;jump sub PRM71
00B1 : 20 F4      bra L003E           ;branch always NMI <-- for endless loop
;00B3 end 
; ~
;00C4 : 17 bytes free space to here
;*************************************;
;PRM71 org 0100
;*************************************;
0100 : 7F 00 04   clr X0004           ;clr (00) addr 04
0103 : 97 0D      staa  X000D         ;store A in addr 0D
0105 : CE 01 A0   ldx #$01A0          ;load X with 01A0 (wavetable)
;PRM72
0108 : A6 00      ldaa  $00,x         ;load A with addr X + 00h
010A : 27 2D      beq L0083           ;branch =0 PRM75
010C : 7A 00 0D   dec X000D           ;decr addr 0D
010F : 27 06      beq L0061           ;branch =0 PRM73
0111 : 4C         inca                ;incr A
0112 : 8D 26      bsr L013A           ;branch sub CALCOS
0114 : 01         nop                 ;
0115 : 20 F1      bra L0052           ;branch always PRM72
;PRM73
0117 : 08         inx                 ;incr X
0118 : DF 0B      stx X000B           ;store X in addr 0B
011A : 8D 1E      bsr L013A           ;branch sub CALCOS 
011C : DF 09      stx X0009           ;store X in addr 09
011E : DE 0B      ldx X000B           ;load X in addr 0B
;PRM74
0120 : A6 00      ldaa  $00,x         ;load A with addr X + 00h
0122 : 97 11      staa  X0011         ;store A in addr 11
0124 : A6 01      ldaa  $01,x         ;load A with addr X + 01h
0126 : EE 02      ldx $02,x           ;load X with addr X + 02h
0128 : DF 0F      stx X000F           ;store X in addr 0F
012A : BD 01 48   jsr L0148           ;jump sub SYNTH8 0148
012D : DE 0B      ldx X000B           ;load X with addr 0B
012F : 08         inx                 ;incr X
0130 : 08         inx                 ;incr X
0131 : 08         inx                 ;incr X
0132 : 08         inx                 ;incr X
0133 : DF 0B      stx X000B           ;store X in addr 0B
0135 : 9C 09      cpx X0009           ;comp X with addr 09
0137 : 26 E7      bne L0120           ;branch !=0 PRM74
;PRM75
0139 : 39         rts                 ;return subroutine
;*************************************;
;CALCOS 013A
;*************************************;
013A : DF 09      stx X0009           ;store X in addr 09
013C : 9B 0A      adda  X000A         ;add A with addr 0A
013E : 97 0A      staa  X000A         ;store A in addr 0A
0140 : 24 03      bcc L008F           ;branch Carry clear CAL1
0142 : 7C 00 09   inc X0009           ;incr addr 09
;CAL1:
0145 : DE 09      ldx X0009           ;load X from addr 09
0147 : 39         rts                 ;return subroutine
; end 0092 (50 bytes remain up to 00C4) 
;*************************************;
;SYNTH8 org 0148 (up to 01FF)
;*************************************;
0148 : CE 00 12   ldx #$0012          ;load X with 0012h flood start
014B : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
;SYN81
014D : 23 15      bls L011C           ;branch if lower or same SYN83
014F : 81 03      cmpa  #$03          ;compare A with 03h (0000 0011)
0151 : 27 09      beq L0114           ;branch =0 SYN82
0153 : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
0155 : E7 00      stab  $00,x         ;store B in addr X + 00h
0157 : 08         inx                 ;incr X
0158 : 80 02      suba  #$02          ;A = A - 02h (0000 0010)
015A : 20 F1      bra L014D           ;branch always SYN81
;SYN82
015C : C6 91      ldab  #$91          ;load B with 91h (1001 0001)
015E : E7 00      stab  $00,x         ;store B in addr X + 00h
0160 : 6F 01      clr $01,x           ;clear addr X + 01h
0162 : 08         inx                 ;incr X       
0163 : 08         inx                 ;incr X
;SYN83 a timer with stored jmp(s)?
0164 : C6 7E      ldab  #$7E          ;load B with 7Eh (1111 1110) <-- later changes to a 77h (1110 1110)(asr, not jmp! -7)
0166 : E7 00      stab  $00,x         ;store B in addr X + 00h
0168 : C6 01      ldab  #$01          ;load B with 01h (0000 0001)
016A : E7 01      stab  $01,x         ;store B in addr X + 01h
016C : C6 72      ldab  #$72          ;load B with 72h (1110 0010) 
016E : E7 02      stab  $02,x         ;store B in addr X + 02h
0170 : DE 0F      ldx X000F           ;load X with addr 0F
;0172 SYN83 stores jmp $FAB2, change to 7E 01 72
0172 : 4F         clra                ;clear A <-- always 00 to DAC here ?
0173 : F6 00 0E   ldab  X000E         ;load B with addr 0E
0176 : 5C         incb                ;incr B
0177 : D7 0E      stab  X000E         ;store B in addr 0E
0179 : D4 11      andb  X0011         ;and B with addr 11
017B : 54         lsrb                ;logic shift right B (bit7=0)
017C : 89 00      adca  #$00          ;A = Carry + A + 00h 
017E : 54         lsrb                ;logic shift right B (bit7=0)
017F : 89 00      adca  #$00          ;A = Carry + A + 00h 
0181 : 54         lsrb                ;logic shift right B (bit7=0)
0182 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0184 : 54         lsrb                ;logic shift right B (bit7=0)
0185 : 89 00      adca  #$00          ;A = Carry + A + 00h 
0187 : 54         lsrb                ;logic shift right B (bit7=0)
0188 : 89 00      adca  #$00          ;A = Carry + A + 00h 
018A : 54         lsrb                ;logic shift right B (bit7=0)
018B : 89 00      adca  #$00          ;A = Carry + A + 00h 
018D : 54         lsrb                ;logic shift right B (bit7=0)
018E : 89 00      adca  #$00          ;A = Carry + A + 00h 
0190 : 1B         aba                 ;A = A + B 
0191 : 48         asla                ;arith shift left A (bit0 is 0)
0192 : 48         asla                ;arith shift left A (bit0 is 0)
0193 : 48         asla                ;arith shift left A (bit0 is 0)
0194 : 48         asla                ;arith shift left A (bit0 is 0)
0195 : 48         asla                ;arith shift left A (bit0 is 0)
0196 : B7 80 00   staa  X8000         ;store A in DAC output SOUND
0199 : 09         dex                 ;decr X
019A : 27 03      beq  L019F          ;branch =0 SYN84 <-- this bne not triggered?
019C : 7E 00 12   jmp  L0012          ;jump to timer location 0012
;SYN84
019F : 39         rts                 ;return subroutine
;*************************************;
;ORGAN MELODY LFD94 wave/melody table ?
;*************************************;
01A0 : 0C 7F 1D 0F FB 7F 23 0F
01A8 : 15 FE 08 50 8A 88 3E 3F
01B0 : 02 3E 7C 04 03 FF 3E 3F
01B8 : 2C E2 7C 12 0D 74 7C 0D
01CO : 0E 41 7C 23 0B 
;01C4 end
;*************************************;
;01C5 monitor RAM
; remainder from orig ROM below
; ignore line numbers
017F : 50 7C 1D 29 02 3E F8 04
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
