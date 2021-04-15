; FLASH SOUND ROM 1 SOUNDS CODE - 15 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines IRQ, PARAM12, PARAM21 SYNTH5
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0007F) (with typical values) (clear 00 at start)
;*************************************;
0000 : 00 00                          ;- , VECT
0002 : 00 00                          ;VECT
0004 : 00 00                          ;VECT
0006 : 00 00                          ;VECT, -
0008 : 00 00                          ;val, 
000A : 00 00                          ; 
000C : 00 00                          ;PIAs
000E : 00 00                          ;not used
;*************************************;
;INIT 0010 - org 0010
;*************************************;
0010 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0013 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
0016 : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
0018 : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
001A : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
001C : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
001E : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0020 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0022 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
0024 : 7F 40 02   clr $4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
0027 : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
0029 : B7 40 03   staa $4003          ; store A in addr 4003 (PIA2 CR port B)
;*************************************;
;PIA reads - 002C
;*************************************;
002C : B6 80 02   ldaa  $8002         ;load A with PIA1 B
002F : 97 0C      staa  $0C           ;store A in addr 0C
0031 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
0034 : 97 0D      staa  $0D           ;store A in addr 0D
;*************************************;
;PARAM12 - 0036 (alt PARAM14, PARAM15)
;*************************************;
;L7A33
0036 : CE 00 AC   ldx #$00AC          ;load X with value 00ACh (FDBVECT2)
;*************************************;
;PARAM21 - 0039
;*************************************;
;L7A92:
0039 : A6 00      ldaa $00,x          ;load A with value in addr X+00h
003B : 97 01      staa $01            ;store A in addr 01
003D : A6 01      ldaa $01,x          ;load A with value in addr X+01h
003F : 97 02      staa $02            ;store A in addr 02
0041 : A6 02      ldaa $02,x          ;load A with value in addr X+02h
0043 : 97 03      staa $03            ;store A in addr 03
0045 : A6 03      ldaa $03,x          ;load A with value in addr X+03h
0047 : 97 04      staa $04            ;store A in addr 04
0049 : A6 04      ldaa $04,x          ;load A with value in addr X+04h
004B : 97 05      staa $05            ;store A in addr 05
004D : A6 05      ldaa $05,x          ;load A with value in addr X+05h
004F : 97 06      staa $06            ;store A in addr 06
;*************************************;
;SYNTH5 - 0051
;*************************************;
;L7AAB:
0051 : 86 AF      ldaa $AF            ;load A with value AFh  <-- FFh is amp?, IRQ sets AFh
0053 : 37         pshb                ;push B into stack then SP - 1
0054 : D6 05      ldab $05            ;load B with value in addr 05
0056 : D7 07      stab $07            ;store B in addr 07
0058 : D6 02      ldab $02            ;load B with value in addr 02
005A : D7 08      stab $08            ;store B in addr 08
;SYN51 L7AB6:
005C : 43         coma                ;complement 1s A
005D : D6 01      ldab $01            ;load B with value in addr 01
005F : B7 80 00   staa $8000          ;store A in DAC output SOUND
;SYN52 L7ABC:
0062 : 5A         decb                ;decr B
0063 : 26 FD      bne L7ABC           ;branch Z=0 SYN52
0065 : 43         coma                ;complement 1s A
0066 : D6 01      ldab $01            ;load B with value in addr 01
0068 : 20 00      bra L7AC4           ;branch always SYN53
;SYN53 L7AC4:
006A : 08         inx                 ;incr X
006B : 09         dex                 ;decr X
006C : 08         inx                 ;incr X
006D : 09         dex                 ;decr X
006E : B7 80 00   staa $8000          ;store A in DAC output SOUND
;SYN54 L7ACB:
0071 : 5A         decb                ;decr B
0072 : 26 FD      bne L7ACB           ;branch Z=0 SYN54
0074 : 7A 00 08   dec $0008           ;decr addr 0008
0077 : 27 16      beq L7AE9           ;branch Z=1 SYN55
0079 : 7A 00 07   dec $0007           ;decr addr 0007
007C : 26 DE      bne L7AB6           ;branch Z=0 SYN51
007E : 43         coma                ;complement 1s A
007F : D6 05      ldab $05            ;load B with value in addr 05
0081 : B7 80 00   staa $8000          ;store A in DAC output SOUND
0084 : D7 07      stab $07            ;store B in addr 07
0086 : D6 01      ldab $01            ;load B with value in addr 01
0088 : 9B 06      adda $06            ;add A with value in addr 06
008A : 2B 1E      bmi L7B04           ;branch N=1 SYN57
008C : 01         nop                 ;
008D : 20 14      bra L7AFE           ;branch always SYN56
;SYN55 L7AE9:
008F : 08         inx                 ;incr X
0090 : 09         dex                 ;decr X
0091 : 43         coma                ;complement 1s A
0092 : D6 02      ldab $02            ;load B with value in addr 02
0094 : B7 80 00   staa $8000          ;store A in DAC output SOUND
0097 : D7 08      stab $08            ;store B in addr 08
0099 : D6 01      ldab $01            ;load B with value in addr 01
009B : D0 03      subb $03            ;subtract B with value in addr 03
009D : D1 04      cmpb $04            ;compare B with value in addr 04
009F : D1 04      cmpb $04            ;compare B with value in addr 04
00A1 : 27 06      beq L7B04           ;branch Z=1 SYN57
;SYN56 L7AFE:
00A3 : D7 01      stab $01            ;store B in addr 01
00A5 : C0 05      subb #$05           ;subtract B with value 05h
00A7 : 20 B9      bra L7ABC           ;branch always SYN52
;SYN57 L7B04:
00A9 : 33         pulb                ;SP + 1 pull stack into B
00AA : 20 8A      bra L0036           ;branch always 0036
;*************************************;
; Vectors - 00AC
;*************************************;
;      p1 p2 p3 p4 p5 p6 
;p1: pitch/freq
;p2: speed
;p3: 2nd half loop
;L7CBA   FDBVECT1
00AC : FF 01 02 C3 FF 00 
;*************************************;
;L7CC0   FDBVECT2
00AC : 01 03 FF 80 FF 00
;*************************************;
;L7CC6   FDBVECT3
00AC : 20 03 FF 50 FF 00
;*************************************;
;L7CCC   FDBVECT4
00AC : 50 03 01 20 FF 00
;*************************************;
;L7CD2   FDBVECT5
00AC : FE 04 02 04 FF 00 
;*************************************;
;L7CD8   FDBVECT6
00AC : 48 03 01 0C FF 00 
;*************************************;
;L7CDE   FDBVECT7
00AC : 48 02 01 0C FF 00 
;*************************************;
;L7CE4   FDBVECT8
00AC : E0 01 02 10 FF 00 
;*************************************;
;L7CEA   FDBVECT9
00AC : 50 FF 00 00 60 80              ;<- not really
;*************************************;
;L7CF0   FDBVECT10
00AC : FF 02 01 06 FF 00 
;*************************************;
00B1 : ;end

;VARIATIONS:
; VARY1
00AC : FF 04 FF 80 60 80


;NOTES:
;PARAM12 (load VECT) -> PARAM11 (jump subs) -> jsr PARAM21(store 6 bytes VECT), JSR SYNTH5, rts
;
;PARAM13 (load VECT) -> PARAM11 (jump subs) -> jsr PARAM21(store 6 bytes VECT), JSR SYNTH5,
;     L->(load VECT) -> PARAM11 (jump subs) -> jsr PARAM21(store 6 bytes VECT), JSR SYNTH5, rts
;
;PARAM14 (load VECT) -> PARAM11 (jump subs) -> jsr PARAM21(store 6 bytes VECT), JSR SYNTH5, rts
;
;PARAM15 (load VECT) -> PARAM11 (jump subs) -> jsr PARAM21(store 6 bytes VECT), JSR SYNTH5, bsr PARAM19, -> 
;                       loops to repeat PARAM11 etc, endless
;
;PARAM18 (load VECT) -> bsr PARAM21 -> SYNTH5 -> PRM181 loop
;
