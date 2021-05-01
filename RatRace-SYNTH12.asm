; SOUND ROM ?? (Rat Race) Synth12 CODE - 01 May 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 8400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines SYNTH12, PARAM13
;
; working, short siren-like loop, similar to SYNTH13 and 14
;
; SW demo (inverted + reversed):
; [---- ---- | ---- ----]
;
;*************************************;
; Scratch RAM (0000-0009)
;*************************************;
0000 : 00 00                          ;-, -
0002 : 00 00                          ; HI, LO
0004 : 00 00                          ;-, -
0006 : 00 00                          ;-, -
0008 : nn nn                          ;PIA reads
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
;SYNTH12 - 0030
;*************************************;
0030 : C6 BF      ldab #$BF           ;load B with value BFh <-- param: E0, 5F
;SYN121
0032 : 4F         clra                ;clear A
0033 : B7 80 00   staa $8000          ;store A in DAC output SOUND
0036 : 17         tba                 ;transfer B to A
;SYN122
0037 : 4A         deca                ;decr A
0038 : 26 FD      bne L0037           ;branch Z=0 SYN122
003A : 17         tba                 ;transfer B to A
003B : 43         coma                ;complement 1s A
003C : B7 80 00   staa $8000          ;store A in DAC output SOUND
003F : 8D 08      bsr L0049           ;branch sub PARAM13
;SYN123
0041 : 4A         deca                ;decr A
0042 : 26 FD      bne L0041           ;branch Z=0 SYN123
0044 : 5A         decb                ;decr B
0045 : 26 EB      bne L0032           ;branch Z=0 SYN121
0047 : 20 DD      bra  L0026          ;branch always PIA
;*************************************;
;PARAM13 - 0049
;*************************************;
0049 : 96 03      ldaa $03            ;load A with value in addr 03
004B : 44         lsra                ;logic shift right A(bit7=0)
004C : 98 03      eora $03            ;exclusive OR A with value in addr 03
004E : 44         lsra                ;logic shift right A(bit7=0)
004F : 44         lsra                ;logic shift right A(bit7=0)
0050 : 76 00 02   ror $0002           ;rotate right in addr 0080 (bit7 = C then C = bit0) (HI)
0053 : 76 00 03   ror $0003           ;rotate right in addr 0081 (bit7 = C then C = bit0) (LO)
0056 : 39         rts                 ;return subroutine
; nnnn : end





