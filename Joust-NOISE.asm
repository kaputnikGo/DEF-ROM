; VIDEO SOUND ROM 4 (Joust) White Noise Routine CODE - 27 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 8400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
; using edited subroutines JKNOIS, JNOIST, ADDX, NOISLD, NOIN, NO1,NOISE1, NOISE2
; 
; Video ROM 4 Sound ?? 
;
; working, not very usable at present
; bird flaps and walking sounds.
;*
;*
;*WHITE NOISE ROUTINE
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA 
;*
;
;*
;*GLOBALS
;*
        ORG  0
HI      RMB  1       ;RANDOM SEED
LO      RMB  1       ;RANDOM SEED
;*
;*TEMPORARIES
;*
XPLAY   RMB  2
;*
;*NOISE ROUTINE PARAMETERS
;*
;        ORG  LOCRAM
DECAY   RMB  1
NAMP    RMB  1
CYCNT   RMB  1
NFFLG   RMB  1
ATP     RMB  1       ;INTERM NOISE VAL
CY2     RMB  1       ;NOISE CYCLE COUNTER
NNOIS   RMB  1       ;NEXT NOISE VALUE
NFRQ    RMB  1       ;NOISE FREQ
NFRQ2   RMB  1       ;INIT NOISE FREQ
;
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0013) (so far need 13 bytes LOCRAM)
;*************************************;
0000 : D9 39                          ;HI, LO
0002 : 01 A7                          ;XPLAY, XPLAY+1
0004 : 00 00                          ;DECAY, NAMP
0006 : 00 00                          ;CYCNT, NFFLG
0008 : 00 00                          ;ATP, CY2
0010 : 00 FF                          ;NNOIS, NFRQ
0012 : 00 00                          ;NFRQ2, -
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
;0033 : 97 12      staa  $12           ;store A in addr 12
0033 : 01 01      nop nop             ; temp nops
0035 : B6 40 02   ldaa  $4002         ;load A with PIA2 B
;0038 : 97 13      staa  $13           ;store A in addr 13 (temp nop 01 01)
0038 : 01 01      nop nop             ; temp nops
;*************************************;
;PREP preparation - 003A
;*************************************;
; within IRQ call to JKNOIS
003A : 86 20      ldaa  #$20           ;load A with value 20h (#$1E+2) NOISE REQUEST)
; is trigger to add via X reg and ADDX to arrive at correct mem location for desired JNOIST sound
;JKNOIS:
003C : CE D9 39   ldx  #$D939         ;(#$D939) GOOD SEED
003F : DF 00      stx  $00            ;(HI)
0041 : 16         tab                 ;
0042 : 48         asla                ;
0043 : 48         asla                ;
0044 : 1B         aba                 ;
0045 : CE 01 47   ldx  #$0147         ;(#JNOIST) <-- only loads first sound, needs a ldx $06,x 
;**************************************;
;* ADD A TO INDEX REGISTER - 0048
;**************************************;
;ADDX: <-- bypass this all together?
0048 : DF 02      stx  $02            ;(XPLAY)
;004A : 9B 03      adda  $03           ;(XPLAY+1) <-- this can create wrong X addr for TABLE 
004A : 01 01      nop nop             ; temp nops
;004C : 97 03      staa  $03           ;(XPLAY+1) <-- nop
004C : 01 01      nop nop             ; temp nops
004E : 24 03      bcc  L0048          ;(ADDX1)
0050 : 7C 00 02   inc  $0002          ;(XPLAY) <-- incrs to next table after NOISLD?
;ADDX1:
0053 : DE 02      ldx  $02            ;(XPLAY)
;**************************************;
;*LOAD NOISE AND GO - 0055 (stores 5 byte JNOIST)
;**************************************;
;NOISLD LF44F:
0055 : A6 00      ldaa  $00,x         ;(X)
0057 : 97 09      staa  $09           ;(CY2)
0059 : A6 01      ldaa  $01,x         ;(1,X)
005B : 97 05      staa  $05           ;(NAMP)
005D : A6 02      ldaa  $02,x         ;(2,X)
005F : 97 04      staa  $04           ;(DECAY)
0061 : A6 03      ldaa  $03,x         ;(3,X)
0063 : 97 07      staa  $07           ;(NFFLG)
0065 : A6 04      ldaa  $04,x         ;(4,X)
0067 : 97 12      staa  $12           ;(NFRQ2)
;**************************************;
;*NOISE INIT - 0069
;**************************************;
;NOIN
;(NSUB) CY2&NFRQ2 TO CYCNT&NFRQ
;NSUB:
0069 : 7F 00 06   clr  $0006          ;(CYCNT)
006C : 96 12      ldaa  $12           ;(NFRQ2)
006E : 97 11      staa  $11           ;(NFRQ) NOISE FREQ
0070 : 7F 00 10   clr  $0010          ;(NNOIS)
;**************************************;
;*NOISE LOOP - 0073 (move to 0100?)
;**************************************;
;NO1 LF468:
0073 : BD 01 1F   jsr  L011F          ;(RNT) FREQ CHECK
0076 : 96 11      ldaa  $11           ;(NFRQ) FREQ REINITED
0078 : 91 12      cmpa  $12           ;(NFRQ2)
007A : 26 F7      bne  L0073          ;(NO1) IF NOT KEEP DELAYING
007C : 59         rolb                ; RESTORE MAX AMPLITUDE TO NOISE
007D : F7 80 00   stab  $8000         ;(SOUND) OUTPUT TO DAC
0080 : BD 01 00   jsr  L0100          ;(NOISE1) PREPARE NEXT RAND NO
0083 : BD 01 0D   jsr  L010D          ;(NOISE2)
0086 : BD 01 33   jsr  L0133          ;(RNA) AMPLITUDE &CYCL3 COUNT CECK
0089 : 7D 00 05   tst  $0005          ;(NAMP) SEE IF DONE
008C : 27 19      beq  L00A7          ;(NEND) RTS IF FINSHED 
008E : 7D 00 06   tst  $0006          ;(CYCNT) SEE IF NEXT FREQ
0091 : 26 E0      bne  L0073          ;(NO1) IF NO SWEEP GO DELAY
0093 : 7D 00 07   tst  $0007          ;(NFFLG) SEE IF SWEEP MODE
0096 : 27 DB      beq  L0073          ;(NO1) IF NO SWEEP GO DELAY
0098 : 2B 05      bmi  L009F          ;(NO3) SWEEP DOWN
009A : 7C 00 12   inc  $0012          ;(NFRQ2)
009D : 20 D4      bra  L0073          ;(NO1)
;NO3:
009F : 7A 00 12   dec  $0012          ;(NFRQ2)
00A2 : 7A 00 11   dec  $0011          ;(NFRQ)
00A5 : 20 CC      bra  L0073          ;(NO1)
;NEND:
00A7 : 20 87      bra L0030           ;PIA
;00A9 : end
; spare for LOCRAM expansion
;00C4 : last
;
;**************************************;
;23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD (jsr(9 cycles) instead of bsr(8 cycles) changes this)
;NOISE1 - 0100
0100 : 96 01      ldaa  $01           ;LO GET RANDOM BIT
0102 : 44         lsra                ;
0103 : 44         lsra                ;
0104 : 44         lsra                ;
0105 : 98 01      eora  $01           ;(LO)
0107 : 97 08      staa  $08           ;(ATP) INTERMED RAND NO
0109 : 08         inx                 ;
010A : 84 07      anda  #$07          ;FOR 3 BIT RANDOM NO
010C : 39         rts                 ;
;*************************************;
;NOISE2 - 010D
010D : 96 08      ldaa  $08           ;(ATP)
010F : 44         lsra                ;
0110 : 76 00 00   ror  $0000          ;(HI)
0113 : 76 00 01   ror  $0001          ;(LO)
0116 : 86 00      ldaa  #$00          ;(#$0)
0118 : 24 02      bcc  L011C          ;NOISE3
011A : 96 05      ldaa  $05           ;(NAMP)
;NOISE3:
011C : 97 10      staa  $10           ;(NNOIS) NEXT NOISE VALUE
011E : 39         rts                 ;
;*************************************;
;RNT - 011F
011F : 96 12      ldaa  $12           ;(NFRQ2) NOISE FREQ
0121 : 7A 00 11   dec  $0011          ;(NFRQ)
0124 : 27 04      beq  L012A          ;(NW0)
0126 : 08         inx                 ;
0127 : 09         dex                 ;(TEQ)
0128 : 20 08      bra  L0132          ;(NNW1)
;NW0:
012A : 97 11      staa  $11           ;(NFRQ) REINIT FREQ
012C : D6 10      ldab  $10           ;(NNOIS) SAVE NEXT NOISE VAL IN B REG
012E : 54         lsrb                ;HALF AMPLITUDE
012F : 7C 00 06   inc  $0006          ;(CYCNT) NOISE CYCLE COUNT AT NAMP
;NNW1:
0132 : 39         rts                 ;
;*************************************;
;RNA - 0133
0133 : 96 09      ldaa  $09           ;(CY2) NOISE AMPL CHANGE
0135 : 91 06      cmpa  $06           ;(CYCNT)
0137 : 27 04      beq  L013D          ;(NW2)
0139 : 08         inx                 ;
013A : 09         dex                 ;
013B : 20 09      bra  L0146          ;(NW3) TEQ
;NW2:
013D : 7F 00 06   clr  $0006          ;(NW2) CYCNT
0140 : 96 05      ldaa  $05           ;(NAMP)
0142 : 90 04      suba  $04           ;(DECAY)
0144 : 97 05      staa  $05           ;(NAMP)
;NW3:
0146 : 39         rts
;*************************************;
;LIST FCB TABLE - 0147 (25 bytes)
;*************************************;
;JNOIST
0147 : 0D 40 F0 FF 12                 ;$1F WING UP
014C : 08 A8 18 01 08                 ; 20 CLIP
0151 : 04 A8 18 01 10                 ; 21 CLOP
0156 : 04 20 F8 FF 20                 ; 1E WING DOWN PART 1
015B : 10 F0 10 01 01                 ;  "            "   2
;0160 : end

