; Stellar Wars SYNTH5 demo - 20 Mar 2021
; hack for Heathkit ET-3400 Audio Setup - 2x PIA input params
; user RAM = 197 + 256 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; using PIA1 addr 8000-8003 (DAC, param1)
; and PIA2 addr 4000-4003 (param2)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines NMI, PARAM7, SYNTH5 - working
; 
; PIA1 and PIA2 init, mem relocation,
; ram alloc, PIA1,2 param reads, no params yet
;
; SW demo:
; [---- ----][---- ----]
;
;*************************************;
; USED RAM ADDR LOCATIONS (typical values)
;*************************************;
0000 : nn 04                          ; B counter, A
0002 : A0 00                          ; B (21)
0004 : nn nn                          ; X (22,23)
0006 : 00 88                          ; X (26,27)
0008 : nn 00                          ; PIA1 store
000A : nn 00                          ; PIA2 store
000C : 00 00                          ;not used
000E : 00 00                          ;not used
;*************************************;
;RESET INIT (POWER-ON) org 0010
;*************************************; 
0010 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0013 : CE 80 00	  ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
0016 : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0018 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
001A : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
001C : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
001E : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0020 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0022 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
0024 : 7F 40 02   clr X4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
0027 : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
0029 : B7 40 03   staa X4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;NMI 002C
;*************************************; 
;002C : 0F	        sei                 ;set interrupt mask
002C : 01	        nop                 ;
002D : CE 7F FF   ldx	#$7FFF          ;load X with 7FFFh (0111 1111 1111 1111)
0030 : 5F         clrb                ;clear (00) B
;LOOP1
0031 : CE 00 88   ldx	#$0088          ;load X with 0088h (was 78C5/F8C5h) (0088 SYNTH1 output)
0034 : DF 06      stx	X0006           ;store X in addr 06
0036 : CE 00 00   ldx	#$0000          ;load X with 0000h
0039 : DF 04      stx	X0004           ;store X in addr 04
003B : BD 00 45   jsr	L0045           ;jump sub PIA read (was SYNTH5)
003E : 20 F1      bra	L0031           ;branch always LOOP1
;*************************************;
;PARAM7 0040 not used?
;*************************************;
0040 : 7A 00 02   dec	X0002           ;decr addr 02
0043 : 20 0E      bra	L0053           ;branch always SYN51
;*************************************;
;PIA reads 0045, main loop
;*************************************;
0045 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0048 : 97 08      staa  $08           ;store A in addr 08
004A : B6 40 02   ldaa  $4002         ;load A with PIA2 B
004D : 97 0A      staa  $0A           ;store A in addr 0A
;*************************************;
;SYNTH5 004F
;*************************************;
004F : C6 A0      ldab	#$A0          ;load B with A0h (1010 0000)
0051 : D7 02      stab	X0002         ;store B in addr 02
;SYN51
0053 : 86 04      ldaa	#$04          ;load A with 04h (0000 0100)
0055 : 97 01      staa	X0001         ;store A in addr 01
;SYN52
0057 : 86 9F      ldaa	#$9F          ;load A with 9Fh (1001 1111)
0059 : D6 02      ldab	X0002         ;load B with addr 02
;LOOP2
005B : CE 01 C0   ldx	#$01C0          ;load X with 01C0h (0000 0001 1100 0000)
;LOOP3
005E : 09         dex                 ;decr X
005F : 27 20      beq	L0081           ;branch =0 SYN53
0061 : F7 00 00   stab	X0000         ;store B in addr 00
0064 : B7 80 00   staa	X8000         ;store A in DAC output SOUND
;LOOP4
0067 : 09         dex                 ;decr X
0068 : 27 17      beq	L0081           ;branch =0 SYN53     
006A : 7A 00 00   dec	X0000           ;decr addr 00
006D : 26 F8      bne	L0067           ;branch !=0 LOOP4
006F : 09         dex                 ;decr X
0070 : 27 0F      beq	L0081           ;branch =0 SYN53
0072 : D7 00      stab	X0000         ;store B in addr 00
0074 : 73 80 00   com	X8000           ;complements 1s in DAC output SOUND
;LOOP5
0077 : 09         dex                 ;decr X
0078 : 27 07      beq	L0081           ;branch =0 SYN53
007A : 7A 00 00   dec	X0000           ;decr addr 00
007D : 26 F8      bne	L0077           ;branch !=0 LOOP5
007F : 20 DD      bra	L005E           ;branch always LOOP3
;SYN53
0081 : D0 01      subb	X0001         ;B = B - addr 01
0083 : C1 10      cmpb	#$10          ;comp B with 10h (0001 0000)
0085 : 22 D4      bhi	L005B           ;branch if higher LOOP2
0087 : 39         rts                 ;return subroutine (NMI)
;*************************************;
;SYNTH1 edited
;*************************************;
0088 : F7 80 00   stab	X8000         ;store B in DAC output SOUND 
008B : 39         rts                 ;return subroutine <-- not accessed ?
;*************************************;
;008C : end
; up to 00C4
;*************************************;
