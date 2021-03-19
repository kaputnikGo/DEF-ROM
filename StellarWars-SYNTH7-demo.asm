; Stellar Wars SYNTH7 demo - 19 Mar 2021
; hack for Heathkit ET-3400 Audio Setup - 2x PIA input params
; user RAM = 197 + 256 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; using PIA1 addr 8000-8003 (DAC, param1)
; and PIA2 addr 4000-4003 (param2)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines IRQ, IRQ4, UTIL1, SYNTH7, VSYN7 tables - functioning
; 
; PIA1 and PIA2 init, mem relocation,
; ram alloc, PIA1,2 param reads
; loop PIA reads not working, requires restart
;
; SW demo:
; [0011 1111][1000 0000] (coma to FE)
;
;*************************************;
; USED RAM ADDR LOCATIONS (typical values)
;*************************************;
0000 : nn nn                          ; ?, B
0002 : nn nn                          ; X
0004 : nn nn                          ; A, B
0006 : nn 80                          ; B countdown, ?
0008 : 01 nn                          ; X count up 0182 - 0140 changes values in 00-03
000A : nn nn                          ; X,B
000C : nn 00                          ; PIA1 store 00-02 pitch/loop up/dwn speed slow to faster
000E : FF                             ; PIA2, makes good sound
;*************************************;
;RESET INIT (POWER-ON) org 000F
;*************************************;
000F : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0012 : CE 80 00	  ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
0015 : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0017 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0019 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
001B : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
001D : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
001F : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0021 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
0023 : 7F 40 02   clr X4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
0026 : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
0028 : B7 40 03   staa X4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;IRQ - MAIN LOOP 002B
;*************************************;
002B : B6 80 02   ldaa  $8002         ;load A with PIA1 B
002E : 97 0C      staa  $0C           ;store A in addr 0C
0030 : 01         nop                 ; 
0031 : CE 00 00   ldx	#$0000          ;load X with 0000h
0034 : DF 02      stx	X0002           ;store X in addr 02
0036 : C6 AF      ldab	#$AF          ;load B with AFh (1010 1111)
0038 : D7 01      stab	X0001         ;store B in addr 01
;*************************************;
;SYNTH7
;*************************************;
003A : 84 0F      anda	#$0F          ;and A with 0Fh (0000 1111) 1+1=1, all else =0
003C : CE 01 33   ldx	#$0133          ;load X with 0133h (VSYN7 data 2)
003F : BD 01 00   jsr	L0100           ;jump sub IRQ4
0042 : A6 00      ldaa	$00,x         ;load A with addr X + 00h
0044 : 97 04      staa	X0004         ;store A in addr 04
0046 : CE 01 23	  ldx	#$0123          ;load X with 0123h (VSYN7 data 1)
0049 : C6 10      ldab	#$10          ;load B with 10h (0001 0000)
004B : BD 01 0F   jsr	L010F           ;jump sub UTIL1
004E : CE 01 43   ldx	#$0143          ;load X with 0143h (VSYN7 data 3)
0051 : E6 00      ldab	$00,x         ;load B with addr X + 00h
0053 : 01 01      nop nop             ;
;LOOP1
0055 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0058 : 97 0C      staa  $0C           ;store A in addr 0C
005A : B6 40 02   ldaa  $4002         ;load A with PIA2 B
005D : 97 0E      staa  $0E           ;store A in addr 0E
005F : D7 06      stab	X0006         ;store B in addr 06
0061 : DF 08      stx	X0008           ;store X in addr 08
;LOOP2
0063 : CE 00 00   ldx	#$0000          ;load X with 0000h
0066 : C6 08      ldab	#$08          ;load B with 08h (0000 1000)
0068 : D7 05      stab	X0005         ;store B in addr 05
;LOOP3
006A : A6 00      ldaa	$00,x         ;load A with addr X + 00h
006C : D6 04      ldab	X0004         ;load B with addr 04
006E : 7D 00 06   tst	X0006           ;test addr 06
0071 : 26 06      bne	L0079           ;branch !=0 SYN71
0073 : A0 08      suba	$08,x         ;sub A with addr X + 08h
0075 : A7 00      staa	$00,x         ;store A in addr X + 00h
0077 : C0 03      subb	#$03          ;sub B with 03h (0000 0011)
;SYN71
0079 : 08         inx                 ;incr X
007A : B7 80 00   staa	X8000         ;store A in DAC output SOUND
;LOOP4
007D : 5A         decb                ;decr B
007E : 26 FD      bne	L007D           ;branch !=0 LOOP4
0080 : 7A 00 05   dec	X0005           ;dec addr 05
0083 : 26 E5      bne	L006A           ;branch !=0 LOOP3
0085 : 7A 00 06   dec	X0006           ;decr addr 06
0088 : 2A CB      bpl	L0055           ;branch if plus LOOP1 (from LOOP2)
008A : DE 08      ldx	X0008           ;load X with addr 08
008C : 08         inx                 ;incr X
008D : E6 00      ldab	$00,x         ;load B with addr X + 00h
008F : 26 C4      bne	L0055           ;branch !=0 LOOP1
0091 : 86 80      ldaa	#$80          ;load A with 80h (1000 0000)
0093 : B7 80 00   staa	X8000         ;store A in DAC output SOUND
0096 : 20 A2      bra	L003A           ;branch always SYNTH7
; 0098 : end synth7, up to 00C4
;*************************************;
; IRQ4 org 0100
;*************************************;
0100 : DF 0A      stx	X000A           ;store X in addr 0A
0102 : 9B 0B      adda	X000B         ;add A with addr 0B
0104 : 97 0B      staa	X000B         ;store A in addr 0B
0106 : 96 0A      ldaa	X000A         ;load A with addr 0A
0108 : 89 00      adca	#$00          ;A = Carry + A + 00h 
010A : 97 0A      staa	X000A         ;store A in addr 0A
010C : DE 0A      ldx	X000A           ;load X with addr 0A
010E : 39         rts                 ;return subroutine
;*************************************;
;UTIL1
;*************************************;
010F : 36         psha                ;push A into stack then SP - 1
;LOOP5
0110 : A6 00      ldaa	$00,x         ;load A with addr X + 00h
0112 : DF 0A      stx	X000A           ;store X in addr 0A
0114 : DE 08      ldx	X0008           ;load X with addr 08
0116 : A7 00      staa	$00,x         ;store A in addr X + 00h
0118 : 08         inx                 ;incr X
0119 : DF 08      stx	X0008           ;store X in addr 08
011B : DE 0A      ldx	X000A           ;load X with addr 0A
011D : 08         inx                 ;incr X
011E : 5A         decb                ;decr B
011F : 26 EF      bne	L0110           ;branch !=0 LOOP5
0121 : 32         pula                ;SP + 1 pull stack into A
0122 : 39         rts                 ;return subroutine
;*************************************;
; VSYN7 data below
;*************************************; 
; 1 called by SYNTH7
0123 : DA FF DA 80
0127 : 26 01 26 80
012B : 07 0A 07 00
012F : F9 F6 F9 00
; 2 called by SYNTH7 
0133 : 3A 3E 50 46
0137 : 33 2C 27 20 
013B : 25 1C 1A 17
013F : 14 11 10 33
; 3 called by SYNTH7 (last 2 bytes, FF, added from next in ROM)
0143 : 08 03 02 01
0147 : 02 03 04 05
014B : 06 0A 1E 32
014F : 70 00 FF FF
;*************************************;
; 0153 : end (01FF)
;*************************************;
