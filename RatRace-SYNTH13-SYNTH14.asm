; SOUND ROM ?? (Rat Race) Synth13,14 CODE - 24 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 8400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines SYNTH13, SYNTH14 PARAM13
; working but glitchy loopings: amplitude fades and wrong freq blips
; SYNTH13 and 14 are identical except for start ldab (#$FF,  or #$01) and a decb or incb
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0009)
;*************************************;
0000 : 00 00                          ;-, -
0002 : 00 00                          ;-, -
0004 : nn nn                          ;HI, LO
0006 : 00 00                          ;-, -
0008 : 00 00                          ;PIA reads
;*************************************;
;INIT - org 000A
;*************************************;
000A : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
000D : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
0010 : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0012 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0014 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0016 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0018 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
001A : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
001C : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
001E : 7F 40 02   clr $4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
0021 : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
0023 : B7 40 03   staa $4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads - 0026
;*************************************;
;PIA
0026 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0029 : 97 08      staa  $08           ;store A in addr 08
002B : B6 40 02   ldaa  $4002         ;load A with PIA2 B
002E : 97 09      staa  $09           ;store A in addr 09
;*************************************;
;SYNTH13 - 0030
;*************************************;
0030 : C6 FF      ldab #$FF           ;load B with value FFh <-- SYNTH14 : C6 01 #$01
0032 : 7F 80 00   clr $8000           ;clear DAC output SOUND
;SYN131
0035 : BD 00 79   jsr L0079           ;jump sub PARAM13 <-- change to direct addr
0038 : 96 05      ldaa $05            ;load A with value in addr 05
;SYN132
003A : 20 00      bra L003C           ;branch always SYN133 <-- can save with a nop, unless for timing
;SYN133
003C : 4A         deca                ;decr A
003D : 26 FB      bne L003A           ;branch Z=0 SYN132
003F : 73 80 00   com $8000           ;complement 1s SOUND
0042 : C5 01      bitb #$01           ;bit test B with value 01h
0044 : 26 03      bne L0049           ;branch Z=0 SYN134
0046 : 7A 80 00   dec $8000           ;decr value SOUND
;SYN134
0049 : 17         tba                 ;transfer B to A
;SYN135
004A : 4A         deca                ;decr A
004B : 26 FD      bne L004A           ;branch Z=0 SYN135
004D : 73 80 00   com $8000           ;complement 1s SOUND
0050 : 5A         decb                ;decr B <-- SYNTH14 : 5C incb
0051 : 26 E2      bne L0035           ;branch Z=0 SYN131
;0053 : 39         rts                 ;return subroutine
;0053 : 01         nop                 ;skip, filler opcode
0053 : 20 D1      bra L0026           ;branch always PIA
;*************************************;
;SYNTH14 - 0054
;*************************************;
0054 : C6 01      ldab #$01           ;load B with value 01h
0056 : 7F 80 00   clr $8000           ;clear SOUND
;SYN141
0059 : BD 00 79   jsr L0079           ;jump sub PARAM13 <-- use direct addr?
005C : 96 05      ldaa $05            ;load A with value in addr 05
;SYN142
005E : 20 00      bra L0060           ;branch always SYN143
;SYN143 LE1E0:
0060 : 4A         deca                ;decr A
0061 : 26 FB      bne L005E           ;branch Z=0 SYN142
0063 : 73 80 00   com $8000           ;complement 1s SOUND
0066 : C5 01      bitb #$01           ;bit test B with value 01h
0068 : 26 03      bne L006D           ;branch Z=0 SYN144
006A : 7A 80 00   dec $8000           ;decr value SOUND
;SYN144 LE1ED:
006D : 17         tba                 ;transfer B to A
;SYN145 LE1EE:
006E : 4A         deca                ;decr A
006F : 26 FD      bne L006E           ;branch Z=0 SYN145
0071 : 73 80 00   com $8000           ;complement 1s SOUND
0074 : 5C         incb                ;incr B
0075 : 26 E2      bne L0059           ;branch Z=0 SYN141
;0077 : 39         rts                 ;return subroutine
0077 : 20 CB      bra L0026           ;PIA or so
;*************************************;
;PARAM13 - 0079
;*************************************;
0079 : 96 05      ldaa $05            ;load A with value in addr 05
007B : 44         lsra                ;logic shift right A(bit7=0)
007C : 98 05      eora $05            ;exclusive OR A with value in addr 05
007E : 44         lsra                ;logic shift right A(bit7=0)
007F : 44         lsra                ;logic shift right A(bit7=0)
0080 : 76 00 04   ror $0004           ;rotate right in addr 0004 (bit7 = C then C = bit0)(HI) 04
0083 : 76 00 05   ror $0005           ;rotate right in addr 0005 (bit7 = C then C = bit0)(LO) 05
0086 : 39         rts                 ;return subroutine
;0087 : end




