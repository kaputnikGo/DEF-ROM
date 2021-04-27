; VIDEO SOUND ROM 4 (Joust) The Bomb CODE - 24 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 8400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines WHIST, SINTBL
; Video ROM 4 Sound 29
; working, param at WHIST1 (12h-FFh) controls frequency length (40h 16s,7Fh 29s,FFh 55s)
;
;* BOMB RAM
;        ORG  LOCRAM
;TIME    RMB  1
;TABLE   RMB  2
;FREQZ   RMB  1
;
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0009)
;*************************************;
0000 : nn 00                          ;TEMPA, -
0002 : nn 00                          ;TIME, -
0004 : nn nn                          ;TABLE,TABLE+1
0006 : nn 00                          ;FREQZ, -
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
;* THE BOMB OOOOOH NOOOOO! - 0030
;*************************************;
;WHIST
0030 : 86 80      ldaa  #$80          ;
0032 : 97 06      staa  $06           ;(FREQZ)
0034 : 86 00      ldaa  #$00          ;(#SINTBL/$100) (1st byte of addr)(F1)
0036 : 97 04      staa  $04           ;(TABLE)
;WHIST0:
0038 : 86 80      ldaa  #$80          ;
003A : 97 00      staa  $00           ;(TEMPA)
;WHIST1:
003C : 86 12      ldaa  #$12          ;(#18) <-- param? (robotron has #$18)
;WHIST2:
003E : 4A         deca                ;
003F : 26 FD      bne  L003E          ;(WHIST2)
0041 : 96 02      ldaa  $02           ;(TIME)
0043 : 9B 06      adda  $06           ;(FREQZ)
0045 : 97 02      staa  $02           ;(TIME)
0047 : 44         lsra                ;
0048 : 44         lsra                ;
0049 : 44         lsra                ;
004A : 8B 65      adda  #$65          ;(#SINTBL!.$FF) (2nd byte of addr)(12)
004C : 97 05      staa  $05           ;(TABLE+1)
004E : DE 04      ldx  $04            ;(TABLE)
0050 : A6 00      ldaa  $00,x         ;(,X)
0052 : B7 80 00   staa  $8000         ;(SOUND)
0055 : 7A 00 00   dec  $0000          ;(TEMPA)
0058 : 26 E2      bne  L003C          ;(WHIST1)
005A : 7A 00 06   dec  $0006          ;(FREQZ)
005D : 96 06      ldaa  $06           ;(FREQZ)
005F : 81 20      cmpa  #$20          ;
0061 : 26 D5      bne  L0038          ;(WHIST0)
0063 : 20 CB      bra L0030           ;branch always WHIST (else PIA)
;*************************************;
;*     SINE TABLE - 0065
;*************************************;
;SINTBL (F112)
0065 : 80 8C 98 A5 B0 BC C6 D0 
006D : DA E2 EA F0 F5 FA FD FE 
0075 : FF FE FD FA F5 F0 EA E2 
007D : DA D0 C6 BC B0 A5 98 8C 
0085 : 80 73 67 5A 4F 43 39 2F 
008D : 25 1D 15 0F 0A 05 02 01
0095 : 00 01 02 05 0A 0F 15 1D 
009D : 25 2F 39 43 4F 5A 67 73 
;00A5 : end


