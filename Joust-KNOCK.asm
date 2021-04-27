; VIDEO SOUND ROM 4 (Joust) Knocker Routine CODE - 24 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 8400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines KNOCK, KNKTAB
; first byte of KNKTAB FDBs is the PERIOD, 2nd is AMP
; Video ROM 4 Sound 30 (with background hum)
;
;*
;* KNOCKER RAM
;*
;        ORG  LOCRAM
;PERIOD  RMB  1
;AMP     RMB  1
;SNDTMP  RMB  2       ;INDEX TMEP
;
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0013)
;*************************************;
0000 : 00 00                          ;-, -
0002 : 00 00                          ;-, -
0004 : F0 nn                          ;AMP,PERIOD
0006 : 00 82                          ;SNDTMP,SNDTMP+1 (KNKTAB addr)
0008 : 00 00                          ;
;
0012 : nn nn                          ;PIA reads
;*************************************;
;INIT - org 0014
;*************************************;
0014 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0017 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
001A : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
001C : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
001E : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0020 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0022 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0024 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0026 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
0028 : 7F 40 02   clr $4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
002B : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
002D : B7 40 03   staa $4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads - 0030
;*************************************;
;PIA
0030 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0033 : 97 12      staa  $12           ;store A in addr 12
0035 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
0038 : 97 13      staa  $13           ;store A in addr 13
;*************************************
;* KNOCKER ROUTINE - 003A
;*************************************
;KNOCK:
003A : 7F 80 02   clr  $8002          ;(SOUND+2) FULL BLAST (due to NMI call - nop it)
003D : CE 00 82   ldx  #$0082         ;(#KNKTAB)
0040 : DF 06      stx  $06            ;(SNDTMP)
;SQLP:
0042 : DE 06      ldx  $06            ;(SNDTMP) RESTORE X REG
0044 : A6 00      ldaa  $00,x         ;(,X) GET PERIOD
0046 : 27 33      beq  L007B          ;(END) END ON ZERO
0048 : E6 01      ldab  $01,x         ;(1,X) GET AMP
004A : C4 F0      andb  #$F0          ;
004C : D7 04      stab  $04           ;(AMP)
004E : E6 01      ldab  $01,x         ;(1,X)
0050 : 08         inx                 ;
0051 : 08         inx                 ;
0052 : DF 06      stx  $06            ;(SNDTMP) SAVE X
0054 : 97 05      staa  $05           ;(PERIOD)
0056 : C4 0F      andb  #$0F          ;(#$F)
;LP0:
0058 : 96 04      ldaa  $04           ;(AMP)
005A : B7 80 00   staa  $8000         ;(SOUND)
005D : 96 05      ldaa  $05           ;(PERIOD)
;LP1:
005F : CE 00 05   ldx  #$0005         ;(#5) DELAY
;LP11:
0062 : 09         dex                 ;
0063 : 26 FD      bne  L0062          ;(LP11)
0065 : 4A         deca                ;
0066 : 26 F7      bne  L005F          ;(LP1)
0068 : 7F 80 00   clr  $8000          ;(SOUND)
006B : 96 05      ldaa  $05           ;(PERIOD)
;LP2:
006D : CE 00 05   ldx  #$0005         ;(#5) DELAY
;LP22:
0070 : 09         dex                 ;
0071 : 26 FD      bne  L0070          ;(LP22)
0073 : 4A         deca                ;
0074 : 26 F7      bne  L006D          ;(LP2)
0076 : 5A         decb                ;
0077 : 26 DF      bne  L0058          ;(LP0)
0079 : 20 C7      bra  L0042          ;(SQLP)
;END:
007B : 86 80      ldaa  #$80          ;OVERRIDE OFF
007D : B7 80 02   staa  $8002         ;(SOUND+2) (due to NMI call - nop it)
0080 : 20 B8      bra L003A           ;branch always KNOCK
;*************************************
;* KNOCKER PATTERN - 0082
;*************************************
;KNKTAB (ROM F199)
0082 : 01FC 02FC 03F8 04F8 06F8 08F4 0CF4 ;FDB
0090 : 10F4 20F2 40F1 60F1 80F1 A0F1 C0F1 ;FDB
009E : 0000                               ;FDB
;*
; 00A0 : end


