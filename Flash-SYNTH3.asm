; FLASH SOUND ROM 1 SYNTH3 CODE - 16 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 8400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines SYNTH3 only
; working as a white noise, explosion/blaster ramp down effect
;
; ldaa #$07, staa $1C
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0025)
;*************************************;
0000 : 00 00                          ;B,
0002 : 00 00                          ;B, PIA1
0004 : 00 00                          ;
0006 : 00 00                          ;
0008 : 00 00                          ; 
000A : 00 00                          ; 
000C : 00 00                          ;
000E : 00 00                          ;not used 
; ./cont
0016 : 00 00                          ;not used
0018 : 00 00                          ;
001A : 00 00                          ;
001C : 07 00                          ;HI,LO <-- needs init values here
0022 : 00 00                          ;
0024 : 00 00                          ;
;*************************************;
;INIT - org 0026
;*************************************;
0026 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0029 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
002C : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
002E : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0030 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0032 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0034 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0036 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0038 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
003A : 7F 40 02   clr $4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
003D : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
003F : B7 40 03   staa $4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads - 0042
;*************************************;
0042 : B6 80 02   ldaa  $8002         ;load A with PIA1 B
0045 : 97 03      staa  $03           ;store A in addr 03
0047 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
004A : 97 0B      staa  $0B           ;store A in addr 0B
;*************************************;
;SYNTH3 - 004C - possible version of Lightning+Appear Noise Routine
;*************************************;
004C : C6 01      ldab #$01           ;load B with value 01h <-- C6 80 lowers
004E : D7 00      stab $00            ;store B in addr 00 (LFREQ)
0050 : C6 FF      ldab #$FF           ;load B with value FFh (HIGHEST AMP)
0052 : 20 06      bra L799F           ;branch always SYN31
;SYN30 L7999
0054 : C6 01      ldab #$01           ;load B with value 01h
0056 : D7 00      stab $00            ;store B in addr 00
0058 : C6 AF      ldab #$AF           ;load B with value AFh
;SYN31 L799F:
005A : D7 02      stab $02            ;store B in addr 02
;SYN32 L79A1:
005C : D6 03      ldab $03            ;load B with value in addr 03 (was C6 03) <-- C6 80 big diff!
005E : D7 01      stab $01            ;store B in addr 01
;SYN33 L79A5:
0060 : D6 02      ldab $02            ;load B with value in addr 02
0062 : 96 1D      ldaa $1D            ;load A with value in addr 1D
0064 : 44         lsra                ;logic shift right A
0065 : 44         lsra                ;logic shift right A
0066 : 44         lsra                ;logic shift right A
0067 : 98 1D      eora $1D            ;exclusive OR A with value 1Dh
0069 : 44         lsra                ;logic shift right A
006A : 76 00 1C   ror $001C           ;rotate right addr 001C (HI)
006D : 76 00 1D   ror $001D           ;rotate right addr 001D (LO)
0070 : 24 01      bcc L79B8           ;branch C=0 SYN34
0072 : 53         comb                ;complement 1s B
;SYN34 L79B8:
0073 : F7 80 00   stab $8000          ;store B in DAC output SOUND 
0076 : D6 00      ldab $00            ;load B with value in addr 00
;SYN35 L79BD:
0078 : 5A         decb                ;decr B
0079 : 26 FD      bne L79BD           ;branch Z=0 SYN35
007B : 7A 00 01   dec $0001           ;decr addr 0001
007E : 26 E0      bne L79A5           ;branch Z=0 SYN33
0080 : 7C 00 00   inc $0000           ;incr addr 0000
0083 : 26 D7      bne L79A1           ;branch Z=0 SYN32 <-- needs a PIA read jsr here?
;0085 : 39         rts                 ;return subroutine
0085 : 20 BB      bra L0042           ;branch always SYNTH3 (PIA read 20 BB L0042)
;*************************************;
0087 : ;end



