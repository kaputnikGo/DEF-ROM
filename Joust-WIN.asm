; VIDEO SOUND ROM 4 (Joust) Noise with Whistle Routine CODE - 28 Apr 2021
; hack for Heathkit ET-3400 Audio Setup
; user RAM = 196 + 255 bytes = 453
; addr 0000 - 00C4 and 0100 - 01FF
; addr 00C5 to 00FF is Monitor RAM
; using PIA addr 8000, 4000 (DAC 8000 not 0400)
; mpu clock speed is default/low (quoted as 0.5 MHz), expecting ~894750 cycles per second
;
; using edited subroutines NINIT, NOISE1, NOISE2, TRIDR, RNA, RNT, TRICNT, TRIFRQ, NNW, NOISLD, CDR
;
; NINIT routines do not seem to be accessed within original Joust Pinball ROM code - unused routine?
; requires added calling routines and FDB tables from Rat Race ROM
;
; Video ROM 4 Sound 
;
;*
;*GLOBALS
;*
        ORG  0
HI      RMB  1       ;RANDOM SEED
LO      RMB  1       ;RANDOM SEED
;*
;*NOISE ROUTINE PARAMETERS
;*
;        ORG  LOCRAM
DECAY   RMB  1
NAMP    RMB  1
CYCNT   RMB  1
WHIS    RMB  1       ;CROWD ROAR AMP
WFRQ    RMB  1       ;CROWD WHISTLE FREQ
WCNT    RMB  1       ;WHISTLE PASSCOUNTER
PTRHI   RMB  2       ;WHIS ADR PTR
WFRQ2   RMB  1
WCNT2   RMB  1
CURVAL  RMB  1       ;WHISTLING NOISE OUTPUT
ATP     RMB  1       ;INTERM NOISE VAL
MINWIS  RMB  1       ;MIN WHISTLE FREQ
CY2     RMB  1       ;NOISE CYCLE COUNTER
DFRQ    RMB  1       ;WHISTLE FREQ CHANGE
DFRQ2   RMB  1       ;INIT WHISTLE FREQ CHANGE
NNOIS   RMB  1       ;NEXT NOISE VALUE
NFRQ    RMB  1       ;NOISE FREQ
NFRQ2   RMB  1       ;INIT NOISE FREQ
;
;
; SW demo :
; [---- ---- ---- ----]
;
;*************************************;
; Scratch RAM (0000-0013) (possible init values needed)
;*************************************;
0000 : nn nn                          ;HI, LO
0002 : nn nn                          ;PTRHI, PTRHI+1
0004 : nn nn                          ;DECAY, NAMP
0006 : nn nn                          ;CYCNT, MINWIS
0008 : nn nn                          ;ATP, CY2
000A : nn nn                          ;WHIS, WCNT2
000C : nn nn                          ;NFRQ, WFRQ2
000E : nn nn                          ;WFRQ, DFRQ
0010 : nn nn                          ;NNOIS, WCNT
0012 : nn nn                          ;NFRQ2, DFRQ2
0014 : nn nn                          ;CURVAL, NFFLG
;*************************************;
;INIT - 0016 -- new org below at 018C
;*************************************;
;0016 : 8E 01 FF   lds #$01FF          ; load SP with 01FFh
0016 : 01 01 01   nop nop nop         ; relocate to 018C
0019 : CE 80 00   ldx #$8000          ; load X with 8000h, PIA1 (DAC) addr
001C : 6F 02      clr $02,x           ; clear(00) addr X + 02h (set 8002 PIA1 PR/DDR port B in)
001E : 86 FF      ldaa  #$FF          ; load A with FFh (1111 1111)
0020 : A7 00      staa  $00,x         ; store A in addr X + 00h (set 8000 PIA1 PR/DDR port A out)
0022 : 86 3C      ldaa  #$3C          ; load A with 3Ch(0011 1100)
0024 : A7 01      staa  $01,x         ; store A in addr X + 01h (8001 PIA1 CR port A)
0026 : 86 37      ldaa  #$37          ; load A with 37h(0011 0111)
0028 : A7 03      staa  $03,x         ; store A in addr X + 03h (8003 PIA1 CR port B) 
002A : 7F 40 02   clr $4002           ; clear(00) 4002h (set PIA2 PR/DDR port B in)
002D : 86 04      ldaa  #$04          ; set CR bit 2 high for PIA2
002F : B7 40 03   staa $4003          ; store A in addr 4003 (PIA2 CR port B)
0032 : 39         rts                 ; back to LZYJSR- jump 018F
;*************************************;
;* NOISE WITH WHISTLE MAIN LOOP - 0033
;*************************************;
;NINIT
0033 : 7F 00 0E   clr  $000E          ;(WFRQ)
0036 : 7F 00 0F   clr  $000F          ;(DFRQ)
0039 : 86 0E      ldaa  #$0E          ;(#$E) CYCLE OFFSET FOR WHISTLE
003B : 97 11      staa  $11           ;(WCNT)
003D : 7F 00 14   clr  $0014          ;(CURVAL) CLR WHISTLE VALUES
;NINIT2
0040 : 8D 1F      bsr  L0061          ;(NSUB) CLR CYCNT AND INIT FREQ
;WIN:
0042 : 8D 28      bsr  L006C          ;(NOISE1)
0044 : 8D 45      bsr  L008B          ;(TRIDR)
0046 : 8D 31      bsr  L0079          ;(NOISE2)
0048 : 8D 41      bsr  L008B          ;(TRIDR)
004A : 8D 4D      bsr  L0099          ;(RNT)
004C : 8D 3D      bsr  L008B          ;(TRIDR)
004E : 8D 5D      bsr  L00AD          ;(RNA)
0050 : 8D 39      bsr  L008B          ;(TRIDR)
0052 : BD 01 00   jsr  L0100          ;(TRICNT)
0055 : 8D 34      bsr  L008B          ;(TRIDR)
0057 : BD 01 17   jsr  L0117          ;(TRIFRQ)
005A : 8D 2F      bsr  L008B          ;(TRIDR)
005C : BD 01 50   jsr  L0150          ;(NNW)
005F : 20 E1      bra  L0042          ;(WIN)
;*************************************;
;NSUB - 0061 (CY2&NFRQ2 TO CYCNT&NFRQ)
;*************************************;
0061 : 7F 00 06   clr  $0006          ;(CYCNT)
0064 : 96 12      ldaa  $12           ;(NFRQ2)
0066 : 97 0C      staa  $0C           ;(NFRQ) NOISE FREQ
0068 : 7F 00 10   clr  $0010          ;(NNOIS)
006B : 39         rts
;*************************************;
;NOISE1 - 006C
;*************************************;
006C : 96 01      ldaa  $01           ;LO GET RANDOM BIT
006E : 44         lsra                ;
006F : 44         lsra                ;
0070 : 44         lsra                ;
0071 : 98 01      eora  $01           ;(LO)
0073 : 97 08      staa  $08           ;(ATP) INTERMED RAND NO
0075 : 08         inx                 ;
0076 : 84 07      anda  #$07          ;FOR 3 BIT RANDOM NO
0078 : 39         rts                 ;
;*************************************;
;NOISE2 - 0079
;*************************************;
0079 : 96 08      ldaa  $08           ;(ATP)
007B : 44         lsra                ;
007C : 76 00 00   ror  $0000          ;(HI)
007F : 76 00 01   ror  $0001          ;(LO)
0082 : 86 00      ldaa  #$00          ;(#$0)
0084 : 24 02      bcc  L0088          ;NOISE3
0086 : 96 05      ldaa  $05           ;(NAMP)
;NOISE3:
0088 : 97 10      staa  $10           ;(NNOIS) NEXT NOISE VALUE
008A : 39         rts                 ;
;*************************************;
;TRIDR - 008B
;*************************************;
008B : 96 14      ldaa  $14           ;(CURVAL)
008D : 9B 0E      adda  $0E           ;(WFRQ)
008F : 97 14      staa  $14           ;(CURVAL)
0091 : 2A 01      bpl  L0094          ;(GO)
0093 : 43         coma                ;
;GO:
0094 : 1B         aba                 ;
0095 : B7 80 00   staa  $8000         ;(SOUND)
;NSEND:
0098 : 39         rts                 ;
;*************************************;
;RNT - 0099
;*************************************;
0099 : 96 12      ldaa  $12           ;(NFRQ2) NOISE FREQ
009B : 7A 00 0C   dec  $000C          ;(NFRQ)
009E : 27 04      beq  L00A4          ;(NW0)
00A0 : 08         inx                 ;
00A1 : 09         dex                 ;(TEQ)
00A2 : 20 08      bra  L00AC          ;(NNW1)
;NW0:
00A4 : 97 0C      staa  $0C           ;(NFRQ) REINIT FREQ
00A6 : D6 10      ldab  $10           ;(NNOIS) SAVE NEXT NOISE VAL IN B REG
00A8 : 54         lsrb                ;HALF AMPLITUDE
00A9 : 7C 00 06   inc  $0006          ;(CYCNT) NOISE CYCLE COUNT AT NAMP
;NNW1:
00AC : 39         rts                 ;
;*************************************;
;RNA - 00AD
;*************************************;
00AD : 96 09      ldaa  $09           ;(CY2) NOISE AMPL CHANGE
00AF : 91 06      cmpa  $06           ;(CYCNT)
00B1 : 27 04      beq  L00B7          ;(NW2)
00B3 : 08         inx                 ;
00B4 : 09         dex                 ;
00B5 : 20 09      bra  L00C0          ;(NW3) TEQ
;NW2:
00B7 : 7F 00 06   clr  $0006          ;(NW2) CYCNT
00BA : 96 05      ldaa  $05           ;(NAMP)
00BC : 90 04      suba  $04           ;(DECAY)
00BE : 97 05      staa  $05           ;(NAMP)
;NW3:
00C0 : 39         rts
;00C1 : end
;00C4 : last possible
;00C5 : monitor start
;*************************************;
;TRICNT - 0100
;*************************************;
0100 : 96 0B      ldaa  $0B           ;(WCNT2) #CYCLES AT WHISTLE FREQ
0102 : 7A 00 11   dec  $0011          ;(WCNT)
0105 : 27 07      beq  L010E          ;(NW4)
;F51E : B6 00 0E   ldaa  X000E        ; <- disasm error (FCB $B6 LDAA EXTENDED NAMP)
0107 : B6                             ;B6
0108 : 00                             ;00
0109 : 05                             ;NAMP
010A : 26 0A      bne  L0116          ;(NW5) TEQ
010C : 20 08      bra  L0116          ;(NSEND) END NOISE <-- use NW5 rts
;NW4:
010E : 97 11      staa  $11           ;(WCNT)
0110 : 96 0E      ldaa  $0E           ;(WFRQ)
0112 : 9B 0F      adda  $0F           ;(DFRQ)
0114 : 97 0E      staa  $0E           ;(WFRQ)
;*
;NW5:
0116 : 39         rts                 ;
;*************************************;
;TRIFRQ - 0117
;*************************************;
0117 : 96 0E      ldaa  $0E           ;(WFRQ) WHISTLE END TEST
0119 : 91 07      cmpa  $07           ;(MINWIS)
011B : 27 07      beq  L0124          ;(NW6)
011D : 08         inx                 ;(TEQ)
011E : 96 05      ldaa  $05           ;(NAMP) END TEST
0120 : 26 2A      bne  L014C          ;(NW7) TEQ
0122 : 20 29      bra  L014D          ;(PEND) END NOISE
;NW6:
0124 : 7F 00 0E   clr  $000E          ;(WFRQ)
0127 : 7F 00 0F   clr  $000F          ;(DFRQ)
012A : 7F 00 14   clr  $0014          ;(CURVAL)
012D : DE 02      ldx  $02            ;(PTRHI) SET UP FOR NEXT WHISTLE
;WISLD (expecting 5 byte data here, from X addr PTRHI)
012F : A6 00      ldaa  $00,x         ;(X)
0131 : 97 0A      staa  $0A           ;(WHIS)
0133 : 27 17      beq  L014C          ;(NW7)
0135 : A6 01      ldaa  $01,x         ;(1,X)
0137 : 97 0D      staa  $0D           ;(WFRQ2)
0139 : A6 02      ldaa  $02,x         ;(2,X)
013B : 97 13      staa  $13           ;(DFRQ2)
013D : A6 03      ldaa  $03,x         ;(3,X)
013F : 97 0B      staa  $0B           ;(WCNT2)
0141 : A6 04      ldaa  $04,x         ;(4,X)
0143 : 97 07      staa  $07           ;(MINWIS)
0145 : 86 05      ldaa  #$05          ;(#5)
0147 : BD 01 69   jsr  L0169          ;(ADDX)
014A : DF 02      stx  $02            ;(PTRHI)
;*
;NW7:
014C : 39         rts                 ;
;PEND:
014D : 32         pula                ;
014E : 32         pula                ;STACK ADJ
014F : 39         rts
;*************************************;
;NNW - 0150
;*************************************;
0150 : 96 0A      ldaa  $0A           ;(WHIS) WHISTLE INIT
0152 : 27 06      beq  L015A          ;(NW8) ALREADY INITED
0154 : 91 05      cmpa  $05           ;(NAMP)
0156 : 26 04      bne  L015C          ;(NW9)
0158 : 20 03      bra  L015D          ;(WINIT) GO INIT WHISTLE
;NW8:
015A : 08         inx                 ;
015B : 09         dex                 ;(TEQ)
;NW9:
015C : 39         rts                 ;
;WINIT:
015D : 7F 00 0A   clr  $000A          ;(WHIS)
0160 : 96 0D      ldaa  $0D           ;(WFRQ2)
0162 : 97 0E      staa  $0E           ;(WFRQ)
0164 : 96 13      ldaa  $13           ;(DFRQ2)
0166 : 97 0F      staa  $0F           ;(DFRQ)
0168 : 39         rts                 ;
;*************************************;
;* ADD A TO INDEX REGISTER - 0169
;*************************************;
;ADDX:
0169 : DF 02      stx  $02            ;(XPLAY)
006B : 9B 03      adda  $03           ;(XPLAY+1)
006D : 97 03      staa  $03           ;(XPLAY+1) 
016F : 24 03      bcc  L0174          ;(ADDX1)
0171 : 7C 00 02   inc  $0002          ;(XPLAY)
;ADDX1:
0174 : DE 02      ldx  $02            ;(XPLAY)
0176 : 39         rts                 ;
;**************************************;
;*LOAD NOISE AND GO - 0177
;**************************************;
;NOISLD 
0177 : A6 00      ldaa  $00,x         ;(X)
0179 : 97 09      staa  $09           ;(CY2)
017B : A6 01      ldaa  $01,x         ;(1,X)
017D : 97 05      staa  $05           ;(NAMP)
017F : A6 02      ldaa  $02,x         ;(2,X)
0181 : 97 04      staa  $04           ;(DECAY)
0183 : A6 03      ldaa  $03,x         ;(3,X)
0185 : 97 15      staa  $15           ;(NFFLG)
0187 : A6 04      ldaa  $04,x         ;(4,X)
0189 : 97 12      staa  $12           ;(NFRQ2)
018B : 39         rts                 ;
;*************************************;
;LZYJSR - org 018C
;*************************************;
018C : 8E 01 FF   lds #$01FF          ;load SP with 01FFh (need a SP)
018F : BD 00 16   jsr L0016           ;lazy jump sub to INIT
;*************************************;
;CROWD ROAR (Rat Race routine) - 0192
;*************************************;
;CDR
0192 : CE 01 B1   ldx #$01B1          ;load X with value 01B1h (#WS1)(1ST WHISTLE PARAMS)
0195 : DF 02      stx $02             ;store X in addr 02 (PTRHI)
0197 : BD 01 2F   jsr L012F           ;jump sub WISLD
019A : CE A5 00   ldx #$A500          ;load X with value A500h (SEED)
019D : DF 00      stx $00             ;store X in addr 00 (HI)
019F : CE 01 DA   ldx #$01DA          ;load X with value 01DAh (#CR1)(1ST CROWD ROAR NOISE PARAMS)
01A2 : BD 01 77   jsr L0177           ;jump sub NOISLD
01A5 : BD 00 33   jsr L0033           ;jump sub NINIT
01A8 : CE 01 DF   ldx #$01DF          ;load X with value 01DFh (#CR2)
01AB : BD 01 77   jsr L0177           ;jump sub NOISLD
01AE : 7E 00 40   jmp L0040           ;jump NINIT2
;*************************************;
;WHISTLE PARAMS - 01B1
;*************************************;
01B1 : 90 10 02 14 40                 ;WS1
01B6 : B4 40 FF 14 30                 ;
01BB : D0 32 02 10 60                 ;
01C0 : EE 20 02 08 54                 ;
01C5 : E9 54 FF 20 28                 ;
01CA : C0 30 02 14 58                 ;
01CF : AC 20 02 08 58                 ;
01D4 : A6 58 FF 18 22                 ;
01D9 : 00                             ;<-- this fade out results in mpu halt and reset
01DA : 30 10 FC 00 01                 ;CR1
01DF : 30 FC 01 00 01                 ;CR2
;01E4 : end
;*************************************;




