        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Sinistar.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  A822
        ;  CRC-32:    B82F4DDB
        ;
        ;  Date:    Sun May 16 11:17:56 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Video ROM 9/10 Sinistar, 1982 (stereo, with Speech), 
        ; Speech ROMS: IC 4,5,6,7 with Video Sound ROM 9
        ; ROM IC 4: TALK, TALKD
        ;
        ; updated 30 May 2021
        ;
org  $F000
        ;
F000 : AA                             ;checksum
;*************************************;
;Reset and setup power on
;*************************************;
;RESET
F001 : 0F         sei                 ;SET INTERRUPT MASK
F002 : 8E 00 7F   lds  #$007F
F005 : CE 04 00   ldx  #$0400
F008 : 6F 01      clr  $01,x
F00A : 6F 03      clr  $03,x
F00C : 86 FF      ldaa  #$FF
F00E : A7 00      staa  $00,x
F010 : C6 80      ldab  #$80
F012 : E7 02      stab  $02,x
F014 : 86 37      ldaa  #$37
F016 : A7 03      staa  $03,x
F018 : 86 3C      ldaa  #$3C
F01A : A7 01      staa  $01,x
F01C : E7 02      stab  $02,x
F01E : CE 00 7F   ldx  #$007F
;LF021:
F021 : 6F 00      clr  $00,x
F023 : 09         dex
F024 : 26 FB      bne  LF021
F026 : 86 3C      ldaa  #$3C
F028 : 97 01      staa  X0001
F02A : 0E         cli
;LF02B:
F02B : 20 FE      bra  LF02B
;*************************************;
;Organ Tune 
;*************************************;
;ORGANT
F02D : 7F 00 0E   clr  X000E
F030 : 97 0C      staa  X000C
F032 : 36         psha
F033 : CE F1 D0   ldx  #$F1D0
;ORGNT2:
F036 : A6 00      ldaa  $00,x
F038 : 27 2D      beq  LF067
F03A : 7A 00 0C   dec  X000C
F03D : 27 06      beq  LF045
F03F : 4C         inca
F040 : BD F1 A7   jsr  LF1A7
F043 : 20 F1      bra  LF036
;ORGNT3:
F045 : 08         inx
F046 : DF 0A      stx  X000A
F048 : BD F1 A7   jsr  LF1A7
F04B : DF 08      stx  X0008
F04D : DE 0A      ldx  X000A
;ORGNT4:
F04F : A6 00      ldaa  $00,x
F051 : 97 11      staa  X0011
F053 : A6 01      ldaa  $01,x
F055 : EE 02      ldx  $02,x
F057 : DF 0F      stx  X000F
F059 : 8D 0F      bsr  LF06A
F05B : DE 0A      ldx  X000A
F05D : 08         inx
F05E : 08         inx
F05F : 08         inx
F060 : 08         inx
F061 : DF 0A      stx  X000A
F063 : 9C 08      cpx  X0008
F065 : 26 E8      bne  LF04F
;ORGNT5:
F067 : 32         pula
F068 : 20 63      bra  LF0CD
;*************************************;
;Organ Loader
;*************************************;
;ORGANL
F06A : CE 00 12   ldx  #$0012
;LDLP:
F06D : 81 00      cmpa  #$00
F06F : 27 15      beq  LF086
F071 : 81 03      cmpa  #$03
F073 : 27 09      beq  LF07E
F075 : C6 01      ldab  #$01
F077 : E7 00      stab  $00,x
F079 : 08         inx
F07A : 80 02      suba  #$02
F07C : 20 EF      bra  LF06D
;LD2:
F07E : C6 91      ldab  #$91
F080 : E7 00      stab  $00,x
F082 : 6F 01      clr  $01,x
F084 : 08         inx
F085 : 08         inx
;LD1 - (stores 7E F094 jmp $F094)
F086 : C6 7E      ldab  #$7E
F088 : E7 00      stab  $00,x
F08A : C6 F0      ldab  #$F0
F08C : E7 01      stab  $01,x
F08E : C6 94      ldab  #$94
F090 : E7 02      stab  $02,x
;*************************************;
;Organ Routine 
;*************************************;
;DUR=DURATION, OSCILLATOR MASK
;ORGAN
F092 : DE 0F      ldx  X000F
;ORGAN1 
F094 : 4F         clra
F095 : F6 00 0D   ldab  X000D
F098 : 5C         incb
F099 : D7 0D      stab  X000D
F09B : D4 11      andb  X0011
F09D : 54         lsrb
F09E : 89 00      adca  #$00
F0A0 : 54         lsrb
F0A1 : 89 00      adca  #$00
F0A3 : 54         lsrb
F0A4 : 89 00      adca  #$00
F0A6 : 54         lsrb
F0A7 : 89 00      adca  #$00
F0A9 : 54         lsrb
F0AA : 89 00      adca  #$00
F0AC : 54         lsrb
F0AD : 89 00      adca  #$00
F0AF : 54         lsrb
F0B0 : 89 00      adca  #$00
F0B2 : 48         asla
F0B3 : 48         asla
F0B4 : 48         asla
F0B5 : 48         asla
F0B6 : 48         asla
F0B7 : B7 04 00   staa  X0400
F0BA : 09         dex
F0BB : 27 03      beq  LF0C0
F0BD : 7E 00 12   jmp  L0012
;ORGAN2:
F0C0 : 39         rts
;*************************************;
;* INTERRUPT PROCESSING
;*************************************;
;IRQ
F0C1 : 8E 00 7F   lds  #$007F         ;load SP with value 007Fh (#ENDRAM)
F0C4 : B6 04 02   ldaa  $0402         ;load A with addr 0402 (PIA sound select)
F0C7 : 0E         cli                 ;clear interrupts I=0
F0C8 : 43         coma                ;complement 1s A
F0C9 : 84 1F      anda  #$1F          ;and A with 1Fh
F0CB : 8D 08      bsr  LF0D5          ;branch sub IRQ1
;IRQA
F0CD : 7D 00 04   tst  $0004          ;test addr 0004
F0D0 : 27 FB      beq  LF0CD          ;branch Z=1 IRQA
F0D2 : 7E F7 8B   jmp  LF78B          ;jump 
;IRQ1
F0D5 : 81 01      cmpa  #$01          ;compare A with 01h
F0D7 : 2E 03      bgt  LF0DC          ;branch Z+(N(+)V)=0 IRQ3
F0D9 : 7E F0 2D   jmp  LF02D          ;jump ORGANT
;IRQ2 - CHECK FOR PRESENCE OF TALKING PROGRAM
F0DC : 81 02      cmpa  #$02          ;compare A with 02h
F0DE : 2E 0C      bgt  LF0EC          ;branch Z+(N(+)V)=0 IRQ3
F0E0 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK) ROM IC4
F0E3 : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F0E5 : 26 09      bne  LF0F0          ;branch Z=0 IRQ3A
F0E7 : 86 09      ldaa  #$09          ;load A with 09h
F0E9 : 7E EF FD   jmp  LEFFD          ;jump TALK (#09)
;IRQ3
F0EC : 81 03      cmpa  #$03          ;compare A with 03h
F0EE : 2E 05      bgt  LF0F5          ;branch Z+(N(+)V)=0 IRQ4
;IRQ3A
F0F0 : 80 02      suba  #$02          ;sub A with 02h
F0F2 : 7E F6 60   jmp  LF660          ;jump 
;IRQ4
F0F5 : 81 04      cmpa  #$04          ;compare A with 04h
F0F7 : 2E 04      bgt  LF0FD          ;branch Z+(N(+)V)=0 IRQ5
F0F9 : 7F 00 04   clr  $0004          ;clear addr 0004
F0FC : 39         rts                 ;return subroutine
;IRQ5
F0FD : 81 05      cmpa  #$05          ;compare A with 05h
F0FF : 2E 03      bgt  LF104          ;branch Z+(N(+)V)=0 IRQ6
F101 : 7E F7 7E   jmp  LF77E          ;jump 
;IRQ6
F104 : 81 06      cmpa  #$06          ;compare A with 06h
F106 : 2E 0F      bgt  LF117          ;branch Z+(N(+)V)=0 IRQ7
F108 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F10B : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F10D : 27 03      beq  LF112          ;branch Z=1 IRQ6A
F10F : 7E F1 A2   jmp  LF1A2          ;jump IRQX2
;IRQ6A
F112 : 86 08      ldaa  #$08          ;load A with 08h
F114 : 7E EF FD   jmp  LEFFD          ;jump TALK (#08)
;IRQ7
F117 : 81 07      cmpa  #$07          ;compare A with 02h
F119 : 2E 03      bgt  LF11E          ;branch Z+(N(+)V)=0 IRQ8
F11B : 7E FB 1D   jmp  LFB1D          ;jump 
;IRQ8
F11E : 81 08      cmpa  #$08          ;compare A with 08h
F120 : 2E 03      bgt  LF125          ;branch Z+(N(+)V)=0 IRQ0A
F122 : 7E FB 2A   jmp  LFB2A          ;jump 
;IRQ0A
F125 : 81 0A      cmpa  #$0A          ;compare A with 0Ah
F127 : 2E 05      bgt  LF12E          ;branch Z+(N(+)V)=0 IRQ0B
F129 : 80 09      suba  #$09          ;sub A with 09h
F12B : 7E F6 86   jmp  LF686          ;jump 
;IRQ0B
F12E : 81 0B      cmpa  #$0B          ;compare A with 0Bh
F130 : 2E 0C      bgt  LF13E          ;branch Z+(N(+)V)=0 IRQ0C
F132 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F135 : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F137 : 26 69      bne  LF1A2          ;branch Z=0 IRQX2
F139 : 86 06      ldaa  #$06          ;load A with 06h
F13B : 7E EF FD   jmp  LEFFD          ;jump TALK (#06)
;IRQ0C
F13E : 81 0C      cmpa  #$0C          ;compare A with 0Ch
F140 : 2E 03      bgt  LF145          ;branch Z+(N(+)V)=0 IRQ0D
F142 : 7E FB 10   jmp  LFB10          ;jump 
;IRQ0D
F145 : 81 0D      cmpa  #$0D          ;compare A with 0Dh
F147 : 2E 0C      bgt  LF155          ;branch Z+(N(+)V)=0 IRQ0E
F149 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F14C : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F14E : 26 52      bne  LF1A2          ;branch Z=0 IRQX2
F150 : 86 02      ldaa  #$02          ;load A with 02h
F152 : 7E EF FD   jmp  LEFFD          ;jump TALK (#02)
;IRQ0E
F155 : 81 0E      cmpa  #$0E          ;compare A with 0Eh
F157 : 2E 0C      bgt  LF165          ;branch Z+(N(+)V)=0 IRQ0F
F159 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F15C : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F15E : 26 42      bne  LF1A2          ;branch Z=0 IRQX2
F160 : 86 03      ldaa  #$03          ;load A with 03h
F162 : 7E EF FD   jmp  LEFFD          ;jump TALK (#03)
;IRQ0F
F165 : 81 0F      cmpa  #$0F          ;compare A with 0Fh
F167 : 2E 0C      bgt  LF175          ;branch Z+(N(+)V)=0 IRQ13
F169 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F16C : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F16E : 26 32      bne  LF1A2          ;branch Z=0 IRQX2
F170 : 86 04      ldaa  #$04          ;load A with 04h
F172 : 7E EF FD   jmp  LEFFD          ;jump TALK (#04)
;IRQ13
F175 : 81 13      cmpa  #$13          ;compare A with 13h
F177 : 26 0C      bne  LF185          ;branch Z=0 IRQ1C
F179 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F17C : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F17E : 26 22      bne  LF1A2          ;branch Z=0 IRQX2
F180 : 86 05      ldaa  #$05          ;load A with 05h
F182 : 7E EF FD   jmp  LEFFD          ;jump TALK (#05)
;IRQ1C
F185 : 81 1C      cmpa  #$1C          ;compare A with 1Ch
F187 : 2E 08      bgt  LF191          ;branch Z+(N(+)V)=0 IRQ1D
F189 : 80 0E      suba  #$0E          ;sub A with 0Eh
;IRQ1CA
F18B : BD F7 DA   jsr  LF7DA          ;jump sub GWLD
F18E : 7E F8 40   jmp  LF840          ;jump GWAVE
;IRQ1D
F191 : 81 1D      cmpa  #$1D          ;compare A with 1Dh
F193 : 2E 0C      bgt  LF1A1          ;branch Z+(N(+)V)=0 IRQX1
F195 : F6 EF FD   ldab  $EFFD         ;load B with addr EFFD (TALK)
F198 : C1 7E      cmpb  #$7E          ;compare B with 7Eh (jmp opcode)
F19A : 26 06      bne  LF1A2          ;branch Z=0 IRQX2
F19C : 86 07      ldaa  #$07          ;load A with 07h
F19E : 7E EF FD   jmp  LEFFD          ;jump TALK (#07)
;IRQX1
F1A1 : 39         rts                 ;return subroutine
;IRQX2
F1A2 : 86 01      ldaa  #$01          ;load A with 01h
F1A4 : 7E F1 8B   jmp  LF18B          ;jump IRQ1CA
;*************************************;
;Add A to Index Register
;*************************************;
;ADDX
F1A7 : DF 08      stx  $08
F1A9 : 9B 09      adda  $09
F1AB : 97 09      staa  $09
F1AD : 96 08      ldaa  $08
F1AF : 89 00      adca  #$00
F1B1 : 97 08      staa  $08
F1B3 : DE 08      ldx  $08
F1B5 : 39         rts
;*************************************;
;* DIAGNOSTIC PROCESSING HERE
;*************************************;
;NMI:
F1B6 : 0F         sei                 ;set interrupt mask
F1B7 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh
F1BA : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
F1BD : 5F         clrb                ;clear B
;NMI1
F1BE : E9 00      adcb  $00,x         ;add C+B + X+00h
F1C0 : 09         dex                 ;decr X
F1C1 : 8C F0 00   cpx  #$F000         ;compare X with F000h
F1C4 : 26 F8      bne  LF1BE          ;branch Z=0 NMI1
F1C6 : E1 00      cmpb  $00,x         ;compare B with X+00h
F1C8 : 27 01      beq  LF1CB          ;branch Z=1 NMI2
F1CA : 3E         wai                 ;wait interrupts, PC+1
;NMI2
F1CB : BD F6 F9   jsr  LF6F9          ;jump sub 
F1CE : 20 E6      bra  LF1B6          ;branch always NMI
;*************************************;
;
;*************************************;
F1D0 : 0C    " "    clc
        ;
F1D1 : 03    " "    db  $03
        ;
F1D2 : 47    "G"    asra
        ;
F1D3 : 05 FC 03 12  "    "    db  $05, $FC, $03, $12
        ;
F1D7 : 11    " "    cba
F1D8 : F0 03 29    "  )"    subb  X0329
F1DB : 07    " "    tpa
        ;
F1DC : 1E    " "    db  $1E
;*************************************;
; SUBTTL WAVE PLAYER AND PITCH MODIFICATION
;*************************************;
;* PLAY A SAMPLE, REMAINING DELAY IN B.  TOTAL DELAY = MIN (60,B*6) MICS.
;
;NTHRVC
F1DD : C0 0D    "  "    subb  #$0D
F1DF : 37    "7"    pshb
F1E0 : BD 00 2C    "  ,"    jsr  L002C
F1E3 : 33    "3"    pulb
;NXTSMP:
F1E4 : C1 14    "  "    cmpb  #$14
F1E6 : 22 F5    "" "    bhi  LF1DD
;
F1E8 : 01    " "    nop
F1E9 : 96 24    " $"    ldaa  X0024
F1EB : 9B 21    " !"    adda  X0021
F1ED : 97 24    " $"    staa  X0024
F1EF : C9 F6    "  "    adcb  #$F6
;
F1F1 : 5A    "Z"    decb
F1F2 : 2A FD    "* "    bpl  LF1F1
;
F1F4 : 96 28    " ("    ldaa  X0028
F1F6 : 4C    "L"    inca
F1F7 : 84 0F    "  "    anda  #$0F
F1F9 : 8A 10    "  "    oraa  #$10
F1FB : 97 28    " ("    staa  X0028
;
F1FD : DE 27    " '"    ldx  X0027
F1FF : E6 00    "  "    ldab  $00,x
F201 : F7 04 00    "   "    stab  X0400
;
F204 : 84 0F    "  "    anda  #$0F
F206 : 39    "9"    rts
;*************************************;
; Walsh Machine
;*************************************;
;* PLAYS WAVE AND ALTERS PITCH ACCORDING TO PITCH CMDS.
;* SMPPER IS INITIAL PITCH,  PCMDPT IS START PITCH PROGRAM,
;* FCMDPT IS START WAVE MODIFIER (FILTER) PROGRAM.
;
;WSM
F207 : 4F    "O"    clra
F208 : CE 00 10    "   "    ldx  #$0010
F20B : C6 61    " a"    ldab  #$61
;1$
F20D : A7 00    "  "    staa  $00,x
F20F : 08    " "    inx
F210 : 5A    "Z"    decb
F211 : 26 FA    "& "    bne  LF20D
F213 : C6 5F    " _"    ldab  #$5F
F215 : D7 26    " &"    stab  X0026
F217 : C6 37    " 7"    ldab  #$37
F219 : D7 30    " 0"    stab  X0030
F21B : C6 7E    " ~"    ldab  #$7E
F21D : D7 2C    " ,"    stab  X002C
F21F : CE F3 F2    "   "    ldx  #$F3F2
F222 : DF 2D    " -"    stx  X002D
F224 : D6 0C    "  "    ldab  X000C
F226 : D7 23    " #"    stab  X0023
;PPLPE1
F228 : C0 03    "  "    subb  #$03
F22A        LF22A:
F22A : BD F1 E4    "   "    jsr  LF1E4
F22D : 08    " "    inx
F22E        LF22E:
F22E : D6 23    " #"    ldab  X0023
F230 : C0 02    "  "    subb  #$02
F232 : BD F1 DD    "   "    jsr  LF1DD
F235 : 26 F7    "& "    bne  LF22E
F237 : D6 20    "  "    ldab  X0020
F239 : 96 21    " !"    ldaa  X0021
F23B : 9B 0D    "  "    adda  X000D
F23D : D9 0C    "  "    adcb  X000C
F23F : 97 0D    "  "    staa  X000D
F241 : D7 0C    "  "    stab  X000C
F243 : DB 22    " ""    addb  X0022
F245 : 86 19    "  "    ldaa  #$19
F247 : 11    " "    cba
F248 : 24 01    "$ "    bcc  LF24B
F24A : 81 16    "  "    cmpa  #$16
F24C : D7 23    " #"    stab  X0023
F24E : 01    " "    nop
F24F : C0 09    "  "    subb  #$09
F251 : BD F1 E4    "   "    jsr  LF1E4
F254 : 96 2F    " /"    ldaa  X002F
F256 : 16    " "    tab
F257 : 48    "H"    asla
F258 : C9 00    "  "    adcb  #$00
F25A : D7 2F    " /"    stab  X002F
F25C : D6 23    " #"    ldab  X0023
F25E : C0 05    "  "    subb  #$05
F260 : 96 25    " %"    ldaa  X0025
F262 : 2A 06    "* "    bpl  LF26A
F264 : 7C 00 25    "| %"    inc  X0025
F267 : 01    " "    nop
F268 : 20 BE    "  "    bra  LF228
        ;
F26A        LF26A:
F26A : 5A    "Z"    decb
F26B : BD F1 E4    "   "    jsr  LF1E4
F26E : DE 0A    "  "    ldx  X000A
F270 : A6 00    "  "    ldaa  $00,x
F272 : 2A 12    "* "    bpl  LF286
F274 : 81 80    "  "    cmpa  #$80
F276 : 27 5F    "'_"    beq  LF2D7
F278 : 4C    "L"    inca
F279 : 97 25    " %"    staa  X0025
F27B : 08    " "    inx
F27C : FF 00 0A    "   "    stx  X000A
F27F : D6 23    " #"    ldab  X0023
F281 : C0 06    "  "    subb  #$06
F283 : 7E F2 28    "~ ("    jmp  LF228
        ;
F286        LF286:
F286 : 08    " "    inx
F287 : E6 00    "  "    ldab  $00,x
F289 : 37    "7"    pshb
F28A : 08    " "    inx
F28B : DF 0A    "  "    stx  X000A
F28D : 97 29    " )"    staa  X0029
F28F : 84 70    " p"    anda  #$70
F291 : 44    "D"    lsra
F292 : 44    "D"    lsra
F293 : 44    "D"    lsra
F294 : 5F    "_"    clrb
F295 : 8B 6B    " k"    adda  #$6B
F297 : C9 F3    "  "    adcb  #$F3
F299 : 97 2B    " +"    staa  X002B
F29B : D7 2A    " *"    stab  X002A
F29D : D6 23    " #"    ldab  X0023
F29F : D6 23    " #"    ldab  X0023
F2A1 : C0 0D    "  "    subb  #$0D
F2A3 : BD F1 E4    "   "    jsr  LF1E4
F2A6 : 5F    "_"    clrb
F2A7 : DE 2A    " *"    ldx  X002A
F2A9 : EE 00    "  "    ldx  $00,x
F2AB : 6E 00    "n "    jmp  $00,x            ;INFO: index jump
        ;
F2AD : 96 29    " )"    ldaa  X0029
F2AF : 47    "G"    asra
F2B0 : C2 00    "  "    sbcb  #$00
F2B2 : D4 0C    "  "    andb  X000C
F2B4 : 32    "2"    pula
F2B5 : 10    " "    sba
F2B6 : 9B 0C    "  "    adda  X000C
F2B8 : 97 0C    "  "    staa  X000C
F2BA : 08    " "    inx
F2BB        LF2BB:
F2BB : D6 23    " #"    ldab  X0023
F2BD : C0 0A    "  "    subb  #$0A
F2BF : 7E F2 2A    "~ *"    jmp  LF22A
        ;
F2C2 : 96 29    " )"    ldaa  X0029
F2C4 : 47    "G"    asra
F2C5 : C2 00    "  "    sbcb  #$00
F2C7 : D4 22    " ""    andb  X0022
F2C9 : 32    "2"    pula
F2CA : 10    " "    sba
F2CB : 9B 22    " ""    adda  X0022
F2CD : 97 22    " ""    staa  X0022
F2CF : 20 EA    "  "    bra  LF2BB
        ;
F2D1 : 32    "2"    pula
F2D2 : DE 0A    "  "    ldx  X000A
F2D4 : 09    " "    dex
F2D5 : 6E 00    "n "    jmp  $00,x            ;INFO: index jump
        ;
F2D7        LF2D7:
F2D7 : 96 26    " &"    ldaa  X0026
F2D9 : 81 5F    " _"    cmpa  #$5F
F2DB : 2B 01    "+ "    bmi  LF2DE
F2DD : 39    "9"    rts
        ;
F2DE        LF2DE:
F2DE : D6 23    " #"    ldab  X0023
F2E0 : C0 07    "  "    subb  #$07
F2E2 : BD F1 E4    "   "    jsr  LF1E4
F2E5 : DE 25    " %"    ldx  X0025
F2E7 : 6A 02    "j "    dec  $02,x
F2E9 : 2B 12    "+ "    bmi  LF2FD
F2EB : EE 00    "  "    ldx  $00,x
F2ED : A6 00    "  "    ldaa  $00,x
F2EF : 36    "6"    psha
F2F0 : 08    " "    inx
F2F1 : DF 0A    "  "    stx  X000A
F2F3 : F6 00 23    "  #"    ldab  X0023
F2F6 : C0 09    "  "    subb  #$09
F2F8 : BD F1 E4    "   "    jsr  LF1E4
F2FB : 20 55    " U"    bra  LF352
        ;
F2FD        LF2FD:
F2FD : EE 00    "  "    ldx  $00,x
F2FF : 08    " "    inx
F300 : DF 0A    "  "    stx  X000A
F302 : 96 26    " &"    ldaa  X0026
F304 : 8B 03    "  "    adda  #$03
F306 : 97 26    " &"    staa  X0026
F308 : D6 23    " #"    ldab  X0023
F30A : C0 07    "  "    subb  #$07
F30C : 01    " "    nop
F30D : 7E F2 28    "~ ("    jmp  LF228
        ;
F310 : 08    " "    inx
F311 : 20 04    "  "    bra  LF317
        ;
F313 : D7 20    "  "    stab  X0020
F315 : D7 21    " !"    stab  X0021
F317        LF317:
F317 : D6 29    " )"    ldab  X0029
F319 : C4 0F    "  "    andb  #$0F
F31B : CB F8    "  "    addb  #$F8
F31D : C8 F8    "  "    eorb  #$F8
F31F : 32    "2"    pula
F320 : 9B 21    " !"    adda  X0021
F322 : D9 20    "  "    adcb  X0020
F324 : 97 21    " !"    staa  X0021
F326 : D7 20    "  "    stab  X0020
F328 : F6 00 23    "  #"    ldab  X0023
F32B : C0 09    "  "    subb  #$09
F32D : 7E F2 28    "~ ("    jmp  LF228
        ;
F330 : 96 26    " &"    ldaa  X0026
F332 : 80 03    "  "    suba  #$03
F334 : 97 26    " &"    staa  X0026
F336 : DE 25    " %"    ldx  X0025
F338 : 96 0B    "  "    ldaa  X000B
F33A : D6 0A    "  "    ldab  X000A
F33C : 8B FF    "  "    adda  #$FF
F33E : C9 FF    "  "    adcb  #$FF
F340 : E7 00    "  "    stab  $00,x
F342 : A7 01    "  "    staa  $01,x
F344 : D6 29    " )"    ldab  X0029
F346 : C4 0F    "  "    andb  #$0F
F348 : E7 02    "  "    stab  $02,x
F34A : D6 23    " #"    ldab  X0023
F34C : C0 0C    "  "    subb  #$0C
F34E : BD F1 E4    "   "    jsr  LF1E4
F351 : 08    " "    inx
F352        LF352:
F352 : 08    " "    inx
F353 : 08    " "    inx
F354 : 5F    "_"    clrb
F355 : 01    " "    nop
F356 : 32    "2"    pula
F357 : 47    "G"    asra
F358 : 49    "I"    rola
F359 : C2 00    "  "    sbcb  #$00
F35B : 9B 0B    "  "    adda  X000B
F35D : D9 0A    "  "    adcb  X000A
F35F : 97 0B    "  "    staa  X000B
F361 : F7 00 0A    "   "    stab  X000A
F364 : D6 23    " #"    ldab  X0023
F366 : C0 07    "  "    subb  #$07
F368 : 7E F2 28    "~ ("    jmp  LF228
        ;
F36B : F2 AD F2    "   "    sbcb  XADF2
F36E : C2 F3    "  "    sbcb  #$F3
        ;
F370 : 13 F3    "  "    db  $13, $F3
        ;
F372 : 10    " "    sba
F373 : F2 AD F2    "   "    sbcb  XADF2
F376 : D1 F3    "  "    cmpb  X00F3
F378 : 30    "0"    tsx
        ;
F379 : F3    " "    db  $F3
        ;
F37A : 56    "V"    rorb
F37B : F4 EF F5    "   "    andb  XEFF5
F37E : 78 F4 27    "x '"    asl  XF427
F381 : F5 20 F3    "   "    bitb  X20F3
F384 : A2 F5    "  "    sbca  $F5,x
F386 : 31    "1"    ins
        ;
F387 : F3 CD    "  "    db  $F3, $CD
        ;
F389 : F4 64 DE    " d "    andb  X64DE
F38C : 2F EE    "/ "    ble  LF37C
        ;
F38E : 03    " "    db  $03
        ;
F38F : 08    " "    inx
F390 : DF 08    "  "    stx  X0008
F392 : BD F4 5E    "  ^"    jsr  LF45E
F395 : 08    " "    inx
F396 : 39    "9"    rts
        ;
F397        LF397:
F397 : EE 00    "  "    ldx  $00,x
F399 : DF 08    "  "    stx  X0008
F39B : CE F4 64    "  d"    ldx  #$F464
F39E : DF 2D    " -"    stx  X002D
F3A0 : 01    " "    nop
F3A1 : 39    "9"    rts
        ;
F3A2 : 96 30    " 0"    ldaa  X0030
F3A4 : 81 37    " 7"    cmpa  #$37
F3A6 : 23 12    "# "    bls  LF3BA
F3A8 : DE 2F    " /"    ldx  X002F
F3AA : 6A 02    "j "    dec  $02,x
F3AC : 2A E9    "* "    bpl  LF397
F3AE : 80 03    "  "    suba  #$03
F3B0 : 97 30    " 0"    staa  X0030
F3B2 : CE F3 8B    "   "    ldx  #$F38B
F3B5 : DF 2D    " -"    stx  X002D
F3B7 : 6D 00    "m "    tst  $00,x
F3B9 : 39    "9"    rts
        ;
F3BA        LF3BA:
F3BA : CE F3 C2    "   "    ldx  #$F3C2
F3BD : DF 2D    " -"    stx  X002D
F3BF : 01    " "    nop
F3C0 : 20 05    "  "    bra  LF3C7
        ;
F3C2 : 08    " "    inx
F3C3 : 08    " "    inx
F3C4 : 01    " "    nop
F3C5        LF3C5:
F3C5 : 8D 05    "  "    bsr  LF3CC
F3C7        LF3C7:
F3C7 : 8D 03    "  "    bsr  LF3CC
F3C9        LF3C9:
F3C9 : 6D 00    "m "    tst  $00,x
F3CB : 01    " "    nop
F3CC        LF3CC:
F3CC : 39    "9"    rts
        ;
F3CD : DE 2F    " /"    ldx  X002F
F3CF : 96 08    "  "    ldaa  X0008
F3D1 : A7 03    "  "    staa  $03,x
F3D3 : 96 09    "  "    ldaa  X0009
F3D5 : A7 04    "  "    staa  $04,x
F3D7 : 96 39    " 9"    ldaa  X0039
F3D9 : 84 0F    "  "    anda  #$0F
F3DB : A7 05    "  "    staa  $05,x
F3DD : 08    " "    inx
F3DE : CE F3 E4    "   "    ldx  #$F3E4
F3E1 : DF 2D    " -"    stx  X002D
F3E3 : 39    "9"    rts
        ;
F3E4 : 96 30    " 0"    ldaa  X0030
F3E6 : 8B 03    "  "    adda  #$03
F3E8 : 97 30    " 0"    staa  X0030
F3EA : CE F4 64    "  d"    ldx  #$F464
F3ED : DF 2D    " -"    stx  X002D
F3EF : 01    " "    nop
F3F0 : 20 D5    "  "    bra  LF3C7
        ;
F3F2 : 7D 00 2F    "} /"    tst  X002F
F3F5 : 26 CE    "& "    bne  LF3C5
F3F7 : DE 08    "  "    ldx  X0008
F3F9 : A6 00    "  "    ldaa  $00,x
F3FB : 08    " "    inx
F3FC : DF 08    "  "    stx  X0008
F3FE : 97 39    " 9"    staa  X0039
F400 : 2A 05    "* "    bpl  LF407
F402 : 97 2F    " /"    staa  X002F
F404 : A6 00    "  "    ldaa  $00,x
F406 : 39    "9"    rts
        ;
F407        LF407:
F407 : CE F4 0E    "   "    ldx  #$F40E
F40A : FF 00 2D    "  -"    stx  X002D
F40D : 39    "9"    rts
        ;
F40E : 5F    "_"    clrb
F40F : 96 39    " 9"    ldaa  X0039
F411 : 84 70    " p"    anda  #$70
F413 : 44    "D"    lsra
F414 : 44    "D"    lsra
F415 : 44    "D"    lsra
F416 : 8B 7B    " {"    adda  #$7B
F418 : C9 F3    "  "    adcb  #$F3
F41A : D7 37    " 7"    stab  X0037
F41C : 97 38    " 8"    staa  X0038
F41E : DE 37    " 7"    ldx  X0037
F420 : EE 00    "  "    ldx  $00,x
F422 : DF 2D    " -"    stx  X002D
F424 : DF 2D    " -"    stx  X002D
F426 : 39    "9"    rts
        ;
F427        XF427:
F427 : 96 39    " 9"    ldaa  X0039
F429 : 84 0F    "  "    anda  #$0F
F42B : 4C    "L"    inca
F42C : 4C    "L"    inca
F42D : 97 2F    " /"    staa  X002F
F42F : 20 1D    "  "    bra  LF44E
        ;
F431 : 7C 00 32    "| 2"    inc  X0032
F434 : DE 31    " 1"    ldx  X0031
F436 : 8C 00 68    "  h"    cpx  #$0068
F439 : 27 13    "' "    beq  LF44E
F43B : A6 00    "  "    ldaa  $00,x
F43D : CE F4 78    "  x"    ldx  #$F478
F440 : 97 35    " 5"    staa  X0035
F442 : 27 03    "' "    beq  LF447
F444 : 7E F4 4A    "~ J"    jmp  LF44A
        ;
F447        LF447:
F447 : CE F4 31    "  1"    ldx  #$F431
F44A        LF44A:
F44A : DF 2D    " -"    stx  X002D
F44C : 08    " "    inx
F44D : 39    "9"    rts
        ;
F44E        LF44E:
F44E : 86 5E    " ^"    ldaa  #$5E
F450 : B7 00 32    "  2"    staa  X0032
F453 : CE F4 31    "  1"    ldx  #$F431
F456 : 7A 00 2F    "z /"    dec  X002F
F459 : 27 03    "' "    beq  LF45E
F45B : 7E F4 61    "~ a"    jmp  LF461
        ;
F45E        LF45E:
F45E : CE F3 F2    "   "    ldx  #$F3F2
F461        LF461:
F461 : DF 2D    " -"    stx  X002D
F463 : 39    "9"    rts
        ;
F464 : DE 08    "  "    ldx  X0008
F466 : 5F    "_"    clrb
F467 : A6 00    "  "    ldaa  $00,x
F469 : 4C    "L"    inca
F46A : 47    "G"    asra
F46B : 49    "I"    rola
F46C : C2 00    "  "    sbcb  #$00
F46E : 9B 09    "  "    adda  X0009
F470 : D9 08    "  "    adcb  X0008
F472 : 97 09    "  "    staa  X0009
F474 : D7 08    "  "    stab  X0008
F476 : 20 E6    "  "    bra  LF45E
        ;
F478 : 96 32    " 2"    ldaa  X0032
F47A : 80 5F    " _"    suba  #$5F
F47C : 48    "H"    asla
F47D : 5F    "_"    clrb
F47E : 9B 0F    "  "    adda  X000F
F480 : D9 0E    "  "    adcb  X000E
F482 : D7 37    " 7"    stab  X0037
F484 : 97 38    " 8"    staa  X0038
F486 : 86 80    "  "    ldaa  #$80
F488 : 97 36    " 6"    staa  X0036
F48A : CE F4 95    "   "    ldx  #$F495
F48D : DF 2D    " -"    stx  X002D
F48F : CE 00 10    "   "    ldx  #$0010
F492 : DF 33    " 3"    stx  X0033
F494 : 39    "9"    rts
        ;
F495 : DE 37    " 7"    ldx  X0037
F497 : EE 00    "  "    ldx  $00,x
F499 : DF 37    " 7"    stx  X0037
F49B : CE F4 AA    "   "    ldx  #$F4AA
F49E : DF 2D    " -"    stx  X002D
F4A0 : DE 31    " 1"    ldx  X0031
F4A2 : A6 09    "  "    ldaa  $09,x
F4A4 : 9B 35    " 5"    adda  X0035
F4A6 : A7 09    "  "    staa  $09,x
F4A8 : 08    " "    inx
F4A9 : 39    "9"    rts
        ;
F4AA : 96 36    " 6"    ldaa  X0036
F4AC : 27 1D    "' "    beq  LF4CB
F4AE : 74 00 36    "t 6"    lsr  X0036
F4B1 : DE 33    " 3"    ldx  X0033
F4B3 : E6 00    "  "    ldab  $00,x
F4B5 : 94 37    " 7"    anda  X0037
F4B7 : 26 09    "& "    bne  LF4C2
F4B9 : FB 00 35    "  5"    addb  X0035
F4BC : E7 00    "  "    stab  $00,x
F4BE : 7C 00 34    "| 4"    inc  X0034
F4C1 : 39    "9"    rts
        ;
F4C2        LF4C2:
F4C2 : F0 00 35    "  5"    subb  X0035
F4C5 : E7 00    "  "    stab  $00,x
F4C7 : 7C 00 34    "| 4"    inc  X0034
F4CA : 39    "9"    rts
        ;
F4CB        LF4CB:
F4CB : D6 34    " 4"    ldab  X0034
F4CD : C1 20    "  "    cmpb  #$20
F4CF : 27 0B    "' "    beq  LF4DC
F4D1 : D6 38    " 8"    ldab  X0038
F4D3 : D7 37    " 7"    stab  X0037
F4D5 : C6 80    "  "    ldab  #$80
F4D7 : F7 00 36    "  6"    stab  X0036
F4DA : 20 0F    "  "    bra  LF4EB
        ;
F4DC        LF4DC:
F4DC : CE F3 F2    "   "    ldx  #$F3F2
F4DF : D6 2F    " /"    ldab  X002F
F4E1 : 26 03    "& "    bne  LF4E6
F4E3 : 7E F4 E9    "~  "    jmp  LF4E9
        ;
F4E6        LF4E6:
F4E6 : CE F4 31    "  1"    ldx  #$F431
F4E9        LF4E9:
F4E9 : DF 2D    " -"    stx  X002D
F4EB        LF4EB:
F4EB : 6D 00    "m "    tst  $00,x
F4ED : 08    " "    inx
F4EE : 39    "9"    rts
        ;
F4EF : 96 39    " 9"    ldaa  X0039
F4F1 : 84 07    "  "    anda  #$07
F4F3 : 8B 60    " `"    adda  #$60
F4F5 : 97 32    " 2"    staa  X0032
F4F7 : DE 08    "  "    ldx  X0008
F4F9 : A6 00    "  "    ldaa  $00,x
F4FB : 08    " "    inx
F4FC : DF 08    "  "    stx  X0008
F4FE : 97 35    " 5"    staa  X0035
F500 : CE F5 07    "   "    ldx  #$F507
F503 : DF 2D    " -"    stx  X002D
F505 : 08    " "    inx
F506 : 39    "9"    rts
        ;
F507 : DE 31    " 1"    ldx  X0031
F509 : 5F    "_"    clrb
F50A : 96 39    " 9"    ldaa  X0039
F50C : 8B F8    "  "    adda  #$F8
F50E : C2 00    "  "    sbcb  #$00
F510 : E4 09    "  "    andb  $09,x
F512 : 50    "P"    negb
F513 : DB 35    " 5"    addb  X0035
F515        LF515:
F515 : D7 35    " 5"    stab  X0035
F517 : CE F4 78    "  x"    ldx  #$F478
F51A : DF 2D    " -"    stx  X002D
F51C : 08    " "    inx
F51D : 08    " "    inx
F51E : 01    " "    nop
F51F : 39    "9"    rts
        ;
F520 : D6 39    " 9"    ldab  X0039
F522 : 54    "T"    lsrb
F523 : C4 07    "  "    andb  #$07
F525 : CA 60    " `"    orab  #$60
F527 : D7 32    " 2"    stab  X0032
F529 : C6 FF    "  "    ldab  #$FF
F52B : C9 00    "  "    adcb  #$00
F52D : C9 00    "  "    adcb  #$00
F52F : 20 E4    "  "    bra  LF515
        ;
F531 : 96 39    " 9"    ldaa  X0039
F533 : 47    "G"    asra
F534 : 25 13    "% "    bcs  LF549
F536 : CE 00 00    "   "    ldx  #$0000
F539 : DF 60    " `"    stx  X0060
F53B : DF 62    " b"    stx  X0062
F53D : DF 64    " d"    stx  X0064
F53F : DF 66    " f"    stx  X0066
F541 : 08    " "    inx
F542 : CE F3 F2    "   "    ldx  #$F3F2
F545 : FF 00 2D    "  -"    stx  X002D
F548 : 39    "9"    rts
        ;
F549        LF549:
F549 : 85 02    "  "    bita  #$02
F54B : 26 0C    "& "    bne  LF559
F54D : C6 5F    " _"    ldab  #$5F
F54F : D7 32    " 2"    stab  X0032
F551 : CE F5 5E    "  ^"    ldx  #$F55E
F554        LF554:
F554 : DF 2D    " -"    stx  X002D
F556 : 7E F3 C9    "~  "    jmp  LF3C9
        ;
F559        LF559:
F559 : FE 00 08    "   "    ldx  X0008
F55C : 20 F6    "  "    bra  LF554
        ;
F55E : 5F    "_"    clrb
F55F : 96 39    " 9"    ldaa  X0039
F561 : 8B AE    "  "    adda  #$AE
F563 : C2 00    "  "    sbcb  #$00
F565 : D4 68    " h"    andb  X0068
F567 : DE 08    "  "    ldx  X0008
F569 : A6 00    "  "    ldaa  $00,x
F56B : 08    " "    inx
F56C : DF 08    "  "    stx  X0008
F56E : 10    " "    sba
F56F : 97 35    " 5"    staa  X0035
F571 : CE F4 78    "  x"    ldx  #$F478
F574 : FF 00 2D    "  -"    stx  X002D
F577 : 39    "9"    rts
        ;
F578 : C6 60    " `"    ldab  #$60
F57A : D7 32    " 2"    stab  X0032
F57C : DE 08    "  "    ldx  X0008
F57E : E6 00    "  "    ldab  $00,x
F580 : D7 37    " 7"    stab  X0037
F582 : 08    " "    inx
F583 : DF 08    "  "    stx  X0008
F585 : D6 39    " 9"    ldab  X0039
F587 : 54    "T"    lsrb
F588 : 24 18    "$ "    bcc  LF5A2
F58A : CE F5 BC    "   "    ldx  #$F5BC
F58D : DF 2D    " -"    stx  X002D
F58F : 39    "9"    rts
        ;
F590 : 5F    "_"    clrb
F591 : 96 38    " 8"    ldaa  X0038
F593 : 47    "G"    asra
F594 : C2 00    "  "    sbcb  #$00
F596 : DE 31    " 1"    ldx  X0031
F598 : E4 00    "  "    andb  $00,x
F59A : 1B    " "    aba
F59B : A7 00    "  "    staa  $00,x
F59D : 7C 00 32    "| 2"    inc  X0032
F5A0 : A6 00    "  "    ldaa  $00,x
F5A2        LF5A2:
F5A2 : CE F5 A8    "   "    ldx  #$F5A8
F5A5 : DF 2D    " -"    stx  X002D
F5A7 : 39    "9"    rts
        ;
F5A8 : 78 00 37    "x 7"    asl  X0037
F5AB : 25 13    "% "    bcs  LF5C0
F5AD : 27 06    "' "    beq  LF5B5
F5AF : 7C 00 32    "| 2"    inc  X0032
F5B2 : 7E F3 C7    "~  "    jmp  LF3C7
        ;
F5B5        LF5B5:
F5B5 : BD F4 5E    "  ^"    jsr  LF45E
F5B8 : 6D 00    "m "    tst  $00,x
F5BA : 01    " "    nop
F5BB : 39    "9"    rts
        ;
F5BC : 7A 00 32    "z 2"    dec  X0032
F5BF : 08    " "    inx
F5C0        LF5C0:
F5C0 : A6 00    "  "    ldaa  $00,x
F5C2 : DE 08    "  "    ldx  X0008
F5C4 : A6 00    "  "    ldaa  $00,x
F5C6 : 08    " "    inx
F5C7 : DF 08    "  "    stx  X0008
F5C9 : 97 38    " 8"    staa  X0038
F5CB : CE F5 90    "   "    ldx  #$F590
F5CE : DF 2D    " -"    stx  X002D
F5D0 : 39    "9"    rts
        ;
F5D1 : 00 00 00 00 
        ;
F5D5 : AA AA    "  "    oraa  $AA,x
F5D7 : 0F    " "    sei
F5D8 : F0 C3 F0    "   "    subb  XC3F0
        ;
F5DB : 18 CF C7    "   "    db  $18, $CF, $C7
        ;
F5DE : A1 FF    "  "    cmpa  $FF,x
        ;
F5E0 : 00 00    "  "    db  $00, $00
        ;
F5E2 : FF 53 80    " S "    stx  X5380
F5E5 : 08    " "    inx
F5E6 : 88 0A    "  "    eora  #$0A
F5E8 : 10    " "    sba
F5E9 : 09    " "    dex
F5EA : 08    " "    inx
F5EB : 0B    " "    sev
F5EC : 10    " "    sba
F5ED : 0C    " "    clc
F5EE : 20 0C    "  "    bra  LF5FC
        ;
F5F0 : 05    " "    db  $05
        ;
F5F1 : 10    " "    sba
F5F2 : 80 F0    "  "    suba  #$F0
F5F4 : 23 10    "# "    bls  LF606
F5F6 : 80 10    "  "    suba  #$10
F5F8 : 23 70    "#p"    bls  LF66A
F5FA : F6 96 2E    "  ."    ldab  X962E
        ;
F5FD : 00 EC    "  "    db  $00, $EC
        ;
F5FF : 22 00    "" "    bhi  LF601
        ;
F601        LF601:
F601 : EC    " "    db  $EC
        ;
F602 : 80 20    "  "    suba  #$20
F604 : F6 80 53    "  S"    ldab  X8053
        ;
F607 : 00    " "    db  $00
        ;
F608 : 0A    " "    clv
        ;
F609 : 05    " "    db  $05
        ;
F60A : FB 53 80    " S "    addb  X5380
F60D : 0A    " "    clv
        ;
F60E : 1F    " "    db  $1F
        ;
F60F : 6F 03    "o "    clr  $03,x
F611 : 6E 01    "n "    jmp  $01,x            ;INFO: index jump
        ;
F613 : 40    "@"    nega
F614 : 10    " "    sba
F615 : 60 00    "` "    neg  $00,x
        ;
F617 : 02    " "    db  $02
        ;
F618 : 23 10    "# "    bls  LF62A
F61A : 40    "@"    nega
F61B : FE 22 10    " " "    ldx  X2210
F61E        LF61E:
F61E : 20 FE    "  "    bra  LF61E
F620 : 20 40    " @"    bra  LF662
        ;
F622 : 64 6F    "do"    lsr  $6F,x
        ;
F624 : 03    " "    db  $03
        ;
F625 : 6F 01    "o "    clr  $01,x
F627 : 80 21    " !"    suba  #$21
        ;
F629 : 00 FC    "  "    db  $00, $FC
        ;
F62B : 2F 00    "/ "    ble  LF62D
        ;
F62D        LF62D:
F62D : FC    " "    db  $FC
        ;
F62E : 80 53    " S"    suba  #$53
        ;
F630 : 00    " "    db  $00
        ;
F631 : 09    " "    dex
F632 : FF FB 6F    "  o"    stx  XFB6F
        ;
F635 : 03    " "    db  $03
        ;
F636 : 6E 01    "n "    jmp  $01,x            ;INFO: index jump
        ;
F638 : 40    "@"    nega
F639 : 10    " "    sba
F63A : 40    "@"    nega
        ;
F63B : FC    " "    db  $FC
        ;
F63C : 20 10    "  "    bra  LF64E
        ;
F63E : 41 00 02    "A  "    db  $41, $00, $02
        ;
F641 : 23 10    "# "    bls  LF653
F643 : 01    " "    nop
F644 : FE 23 50    " #P"    ldx  X2350
F647 : 40    "@"    nega
F648 : 7D CE CE    "}  "    tst  XCECE
F64B : 80 F5    "  "    suba  #$F5
        ;
F64D        LF64D:
F64D : E3    " "    db  $E3
        ;
F64E        LF64E:
F64E : F5 FB F6    "   "    bitb  XFBF6
F651 : 06    " "    tap
F652 : F6 22 F6    " " "    ldab  X22F6
F655 : 2F F6    "/ "    ble  LF64D
F657 : 48    "H"    asla
F658 : F6 06 F6    "   "    ldab  X06F6
F65B : 48    "H"    asla
F65C : F6 06 F5    "   "    ldab  X06F5
F65F : FB 
;*************************************;
;
;*************************************;
F660 : 5F         clrb
F661 : D7 0D      stab  $0D
F663 : 48         asla
F664 : 48         asla
F665 : 8B 4C    " L"    adda  #$4C
F667 : C9 F6    "  "    adcb  #$F6
F669 : D7 0A    "  "    stab  X000A
F66B : 97 0B    "  "    staa  X000B
F66D : DE 0A    "  "    ldx  X000A
F66F : EE 00    "  "    ldx  $00,x
F671 : DF 08    "  "    stx  X0008
F673 : DE 0A    "  "    ldx  X000A
F675 : EE 02    "  "    ldx  $02,x
F677 : E6 00    "  "    ldab  $00,x
F679 : D7 0C    "  "    stab  X000C
F67B : 08    " "    inx
F67C : DF 0A    "  "    stx  X000A
F67E : CE F5 D1    "   "    ldx  #$F5D1
F681 : DF 0E    "  "    stx  X000E
F683 : 7E F2 07    "~  "    jmp  LF207
;*************************************;
;
;*************************************;
;LF686:
F686 : 16    " "    tab
F687 : 2E 25    ".%"    bgt  LF6AE
F689 : 58    "X"    aslb
F68A : 58    "X"    aslb
F68B : 58    "X"    aslb
F68C : 58    "X"    aslb
F68D : D7 03    "  "    stab  X0003
F68F : 16    " "    tab
F690 : 86 04    "  "    ldaa  #$04
F692 : 10    " "    sba
F693        LF693:
F693 : 36    "6"    psha
F694 : BD F6 C8    "   "    jsr  LF6C8
F697 : D6 03    "  "    ldab  X0003
F699 : CB 30    " 0"    addb  #$30
F69B : D7 03    "  "    stab  X0003
F69D : BD F6 C8    "   "    jsr  LF6C8
F6A0 : D6 03    "  "    ldab  X0003
F6A2 : C0 18    "  "    subb  #$18
F6A4 : D7 03    "  "    stab  X0003
F6A6 : BD F6 C8    "   "    jsr  LF6C8
F6A9 : 32    "2"    pula
F6AA : 4A    "J"    deca
F6AB : 26 E6    "& "    bne  LF693
F6AD : 39    "9"    rts
        ;
F6AE        LF6AE:
F6AE : C6 7F    "  "    ldab  #$7F
F6B0 : BD F6 CA    "   "    jsr  LF6CA
F6B3 : C6 C0    "  "    ldab  #$C0
F6B5 : BD F6 CA    "   "    jsr  LF6CA
F6B8 : C6 FF    "  "    ldab  #$FF
F6BA : BD F6 CA    "   "    jsr  LF6CA
F6BD : C6 7F    "  "    ldab  #$7F
F6BF : BD F6 CA    "   "    jsr  LF6CA
F6C2 : C6 3F    " ?"    ldab  #$3F
F6C4 : BD F6 CA    "   "    jsr  LF6CA
F6C7 : 39    "9"    rts
        ;
F6C8        LF6C8:
F6C8 : D6 03    "  "    ldab  X0003
F6CA        LF6CA:
F6CA : F7 04 00    "   "    stab  X0400
F6CD : CE 00 40    "  @"    ldx  #$0040
F6D0        LF6D0:
F6D0 : 8D 19    "  "    bsr  LF6EB
F6D2        LF6D2:
F6D2 : 36    "6"    psha
F6D3 : C6 03    "  "    ldab  #$03
F6D5        LF6D5:
F6D5 : 8D 14    "  "    bsr  LF6EB
F6D7 : 5A    "Z"    decb
F6D8 : 26 FB    "& "    bne  LF6D5
F6DA : 32    "2"    pula
F6DB : 4A    "J"    deca
F6DC : 26 F4    "& "    bne  LF6D2
F6DE : 8D 0B    "  "    bsr  LF6EB
F6E0 : 81 7F    "  "    cmpa  #$7F
F6E2 : 2E EC    ". "    bgt  LF6D0
F6E4 : 73 04 00    "s  "    com  X0400
F6E7 : 09    " "    dex
F6E8 : 26 E6    "& "    bne  LF6D0
F6EA : 39    "9"    rts
        ;
F6EB        LF6EB:
F6EB : 96 02    "  "    ldaa  X0002
F6ED : 44    "D"    lsra
F6EE : 98 02    "  "    eora  X0002
F6F0 : 44    "D"    lsra
F6F1 : 44    "D"    lsra
F6F2 : 76 00 01    "v  "    ror  X0001
F6F5 : 76 00 02    "v  "    ror  X0002
F6F8 : 39    "9"    rts
        ;
F6F9        LF6F9:
F6F9 : 4F    "O"    clra
F6FA : B7 04 00    "   "    staa  X0400
F6FD : CE 00 7F    "   "    ldx  #$007F
F700        LF700:
F700 : DF 0C    "  "    stx  X000C
F702 : 96 0D    "  "    ldaa  X000D
F704        LF704:
F704 : 4A    "J"    deca
F705 : 36    "6"    psha
F706 : 32    "2"    pula
F707 : 36    "6"    psha
F708 : 32    "2"    pula
F709 : 36    "6"    psha
F70A : 32    "2"    pula
F70B : 26 F7    "& "    bne  LF704
F70D : 73 04 00    "s  "    com  X0400
F710 : 96 0D    "  "    ldaa  X000D
F712        LF712:
F712 : 4A    "J"    deca
F713 : 36    "6"    psha
F714 : 32    "2"    pula
F715 : 36    "6"    psha
F716 : 32    "2"    pula
F717 : 36    "6"    psha
F718 : 32    "2"    pula
F719 : 26 F7    "& "    bne  LF712
F71B : 73 04 00    "s  "    com  X0400
F71E : 8D CB    "  "    bsr  LF6EB
F720 : 16    " "    tab
F721        LF721:
F721 : 5A    "Z"    decb
F722 : 26 FD    "& "    bne  LF721
F724 : 73 04 00    "s  "    com  X0400
F727 : 16    " "    tab
F728        LF728:
F728 : 5A    "Z"    decb
F729 : 26 FD    "& "    bne  LF728
F72B : 73 04 00    "s  "    com  X0400
F72E : 7C 04 00    "|  "    inc  X0400
F731 : 09    " "    dex
F732 : 26 CC    "& "    bne  LF700
F734 : 39    "9"    rts
        ;
F735 : 4F    "O"    clra
F736 : B7 04 00    "   "    staa  X0400
F739 : CE 00 01    "   "    ldx  #$0001
F73C        LF73C:
F73C : DF 0C    "  "    stx  X000C
F73E : 96 0D    "  "    ldaa  X000D
F740        LF740:
F740 : 4A    "J"    deca
F741 : 36    "6"    psha
F742 : 32    "2"    pula
F743 : 36    "6"    psha
F744 : 32    "2"    pula
F745 : 36    "6"    psha
F746 : 32    "2"    pula
F747 : 26 F7    "& "    bne  LF740
F749 : 73 04 00    "s  "    com  X0400
F74C : 96 0D    "  "    ldaa  X000D
F74E        LF74E:
F74E : 4A    "J"    deca
F74F : 36    "6"    psha
F750 : 32    "2"    pula
F751 : 36    "6"    psha
F752 : 32    "2"    pula
F753 : 36    "6"    psha
F754 : 32    "2"    pula
F755 : 26 F7    "& "    bne  LF74E
F757 : 73 04 00    "s  "    com  X0400
F75A : 8D 8F    "  "    bsr  LF6EB
F75C        LF75C:
F75C : C6 20    "  "    ldab  #$20
F75E        LF75E:
F75E : 5A    "Z"    decb
F75F : 26 FD    "& "    bne  LF75E
F761 : 4A    "J"    deca
F762 : 26 F8    "& "    bne  LF75C
F764 : 73 04 00    "s  "    com  X0400
F767 : 8D 82    "  "    bsr  LF6EB
F769        LF769:
F769 : C6 20    "  "    ldab  #$20
F76B        LF76B:
F76B : 5A    "Z"    decb
F76C : 26 FD    "& "    bne  LF76B
F76E : 4A    "J"    deca
F76F : 26 F8    "& "    bne  LF769
F771 : 73 04 00    "s  "    com  X0400
F774 : 7C 04 00    "|  "    inc  X0400
F777 : 08    " "    inx
F778 : 8C 00 10    "   "    cpx  #$0010
F77B : 26 BF    "& "    bne  LF73C
F77D : 39    "9"    rts
;*************************************;
;
;*************************************;
F77E        LF77E:
F77E : 7F 00 03    "   "    clr  X0003
F781 : 58    "X"    aslb
F782 : 58    "X"    aslb
F783 : 58    "X"    aslb
F784 : D7 05    "  "    stab  X0005
F786 : 86 01    "  "    ldaa  #$01
F788 : 97 04    "  "    staa  X0004
F78A : 39    "9"    rts
;*************************************;
;
;*************************************;
F78B        LF78B:
F78B : 86 60    " `"    ldaa  #$60
F78D : B7 04 00    "   "    staa  X0400
F790        LF790:
F790 : 96 05    "  "    ldaa  X0005
F792        LF792:
F792 : C6 13    "  "    ldab  #$13
F794        LF794:
F794 : 5A    "Z"    decb
F795 : 26 FD    "& "    bne  LF794
F797 : 4A    "J"    deca
F798 : 26 F8    "& "    bne  LF792
F79A : 73 04 00    "s  "    com  X0400
F79D : 96 05    "  "    ldaa  X0005
F79F        LF79F:
F79F : C6 13    "  "    ldab  #$13
F7A1        LF7A1:
F7A1 : 5A    "Z"    decb
F7A2 : 26 FD    "& "    bne  LF7A1
F7A4 : 4A    "J"    deca
F7A5 : 26 F8    "& "    bne  LF79F
F7A7 : 73 04 00    "s  "    com  X0400
F7AA : 7C 04 00    "|  "    inc  X0400
F7AD : 86 7F    "  "    ldaa  #$7F
F7AF : B1 04 00    "   "    cmpa  X0400
F7B2 : 26 DC    "& "    bne  LF790
F7B4        LF7B4:
F7B4 : 96 05    "  "    ldaa  X0005
F7B6        LF7B6:
F7B6 : C6 13    "  "    ldab  #$13
F7B8        LF7B8:
F7B8 : 5A    "Z"    decb
F7B9 : 26 FD    "& "    bne  LF7B8
F7BB : 4A    "J"    deca
F7BC : 26 F8    "& "    bne  LF7B6
F7BE : 73 04 00    "s  "    com  X0400
F7C1 : 96 05    "  "    ldaa  X0005
F7C3        LF7C3:
F7C3 : C6 13    "  "    ldab  #$13
F7C5        LF7C5:
F7C5 : 5A    "Z"    decb
F7C6 : 26 FD    "& "    bne  LF7C5
F7C8 : 4A    "J"    deca
F7C9 : 26 F8    "& "    bne  LF7C3
F7CB : 73 04 00    "s  "    com  X0400
F7CE : 7A 04 00    "z  "    dec  X0400
F7D1 : 86 60    " `"    ldaa  #$60
F7D3 : B1 04 00    "   "    cmpa  X0400
F7D6 : 26 DC    "& "    bne  LF7B4
F7D8 : 20 B6    "  "    bra  LF790
;*************************************;
;GWAVE Loader 
;*************************************;
;GWLD:
F7DA : 16    " "    tab
F7DB : 58    "X"    aslb
F7DC : 1B    " "    aba
F7DD : 1B    " "    aba
F7DE : 1B         aba
F7DF : CE F9 BB   ldx  #$F9BB         ;load X with F9BBh (SVTAB)(SOUND VECTOR TABLE)
F7E2 : BD F1 A7    "   "    jsr  LF1A7
F7E5 : A6 00    "  "    ldaa  $00,x
F7E7 : 16    " "    tab
F7E8 : 84 0F    "  "    anda  #$0F
F7EA : 97 0F    "  "    staa  X000F
F7EC : 54    "T"    lsrb
F7ED : 54    "T"    lsrb
F7EE : 54    "T"    lsrb
F7EF : 54    "T"    lsrb
F7F0 : D7 0E    "  "    stab  X000E
F7F2 : A6 01    "  "    ldaa  $01,x
F7F4 : 16    " "    tab
F7F5 : 54    "T"    lsrb
F7F6 : 54    "T"    lsrb
F7F7 : 54    "T"    lsrb
F7F8 : 54         lsrb
F7F9 : D7 10    "  "    stab  X0010
F7FB : 84 0F    "  "    anda  #$0F
F7FD : 97 0C    "  "    staa  X000C
F7FF : DF 06    "  "    stx  X0006
F801 : CE F9 0C   ldx  #$F90C         ;load X with F90Ch (GWVTAB)(CALC WAVEFORM ADDR)
;GWLD2:
F804 : 7A 00 0C    "z  "    dec  X000C
F807 : 2B 08    "+ "    bmi  LF811
F809 : A6 00    "  "    ldaa  $00,x
F80B : 4C    "L"    inca
F80C : BD F1 A7    "   "    jsr  LF1A7
F80F : 20 F3    "  "    bra  LF804
;GWLD3:
F811 : DF 13    "  "    stx  X0013
F813 : BD F8 CB    "   "    jsr  LF8CB
F816 : DE 06    "  "    ldx  X0006
F818 : A6 02    "  "    ldaa  $02,x
F81A : 97 15    "  "    staa  X0015
F81C : BD F8 DD    "   "    jsr  LF8DD
F81F : DE 06    "  "    ldx  X0006
F821 : A6 03    "  "    ldaa  $03,x
F823 : 97 11    "  "    staa  X0011
F825 : A6 04    "  "    ldaa  $04,x
F827 : 97 12    "  "    staa  X0012
F829 : A6 05    "  "    ldaa  $05,x
F82B : 16    " "    tab
F82C : A6 06    "  "    ldaa  $06,x
F82E : CE FA 24   ldx  #$FA24         ;load X with FA24h (#GFRTAB)
F831 : BD F1 A7   jsr  LF1A7          ;jump sub ADDX
F834 : 17         tba
F835 : DF 16    "  "    stx  X0016
F837 : 7F 00 1E    "   "    clr  X001E
F83A : BD F1 A7    "   "    jsr  LF1A7
F83D : DF 18    "  "    stx  X0018
F83F : 39    "9"    rts
;*************************************;
;GWAVE routine 
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
F840 : 96 0E    "  "    ldaa  X000E
F842 : 97 1D    "  "    staa  X001D
F844        LF844:
F844 : DE 16    "  "    ldx  X0016
F846 : DF 08    "  "    stx  X0008
F848        LF848:
F848 : DE 08    "  "    ldx  X0008
F84A : A6 00    "  "    ldaa  $00,x
F84C : 9B 1E    "  "    adda  X001E
F84E : 97 1C    "  "    staa  X001C
F850 : 9C 18    "  "    cpx  X0018
F852 : 27 27    "''"    beq  LF87B
F854 : D6 0F    "  "    ldab  X000F
F856 : 08    " "    inx
F857 : DF 08    "  "    stx  X0008
F859        LF859:
F859 : CE 00 20    "   "    ldx  #$0020
F85C        LF85C:
F85C : 96 1C    "  "    ldaa  X001C
F85E        LF85E:
F85E : 4A    "J"    deca
F85F : 26 FD    "& "    bne  LF85E
F861 : A6 00    "  "    ldaa  $00,x
F863 : 44    "D"    lsra
F864 : B7 04 00    "   "    staa  X0400
F867 : 08    " "    inx
F868 : 9C 1A    "  "    cpx  X001A
F86A : 26 F0    "& "    bne  LF85C
F86C : 5A    "Z"    decb
F86D : 27 D9    "' "    beq  LF848
F86F : 08    " "    inx
F870 : 09    " "    dex
F871 : 08    " "    inx
F872 : 09    " "    dex
F873 : 08    " "    inx
F874 : 09    " "    dex
F875 : 08    " "    inx
F876 : 09    " "    dex
F877 : 01    " "    nop
F878 : 01    " "    nop
F879 : 20 DE    "  "    bra  LF859
;
F87B : 96 10    "  "    ldaa  X0010
F87D : 8D 5E    " ^"    bsr  LF8DD
F87F : 7A 00 1D    "z  "    dec  X001D
F882 : 26 C0    "& "    bne  LF844
F884 : 96 11    "  "    ldaa  X0011
F886 : 27 42    "'B"    beq  LF8CA
F888 : 7A 00 12    "z  "    dec  X0012
F88B : 27 3D    "'="    beq  LF8CA
F88D : 9B 1E    "  "    adda  X001E
F88F : 97 1E    "  "    staa  X001E
F891 : DE 16    "  "    ldx  X0016
F893 : 5F    "_"    clrb
;LF894:
F894 : 96 1E    "  "    ldaa  X001E
F896 : 7D 00 11    "}  "    tst  X0011
F899 : 2B 06    "+ "    bmi  LF8A1
F89B : AB 00    "  "    adda  $00,x
F89D : 25 08    "% "    bcs  LF8A7
F89F : 20 0B    "  "    bra  LF8AC
;GW1
F8A1 : AB 00    "  "    adda  $00,x
F8A3 : 27 02    "' "    beq  LF8A7
F8A5 : 25 05    "% "    bcs  LF8AC
F8A7        LF8A7:
F8A7 : 5D    "]"    tstb
F8A8 : 27 08    "' "    beq  LF8B2
F8AA : 20 0F    "  "    bra  LF8BB
        ;
F8AC        LF8AC:
F8AC : 5D    "]"    tstb
F8AD : 26 03    "& "    bne  LF8B2
F8AF : DF 16    "  "    stx  X0016
F8B1 : 5C    "\"    incb
F8B2        LF8B2:
F8B2 : 08    " "    inx
F8B3 : 9C 18    "  "    cpx  X0018
F8B5 : 26 DD    "& "    bne  LF894
F8B7 : 5D    "]"    tstb
F8B8 : 26 01    "& "    bne  LF8BB
F8BA : 39    "9"    rts
        ;
F8BB        LF8BB:
F8BB : DF 18    "  "    stx  X0018
F8BD : 96 10    "  "    ldaa  X0010
F8BF : 27 06    "' "    beq  LF8C7
F8C1 : 8D 08    "  "    bsr  LF8CB
F8C3 : 96 15    "  "    ldaa  X0015
F8C5 : 8D 16    "  "    bsr  LF8DD
F8C7        LF8C7:
F8C7 : 7E F8 40    "~ @"    jmp  LF840
F8CA        LF8CA:
F8CA : 39    "9"    rts
;*************************************;
;Wave Transfer Routine 
;*************************************;
;WVTRAN
F8CB : CE 00 20    "   "    ldx  #$0020
F8CE : DF 0A    "  "    stx  X000A
F8D0 : DE 13    "  "    ldx  X0013
F8D2 : E6 00    "  "    ldab  $00,x
F8D4 : 08    " "    inx
F8D5 : BD FA 9A    "   "    jsr  LFA9A
F8D8 : DE 0A    "  "    ldx  X000A
F8DA : DF 1A    "  "    stx  X001A
F8DC : 39    "9"    rts
;*************************************;
;Wave Decay Routinue 
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
F8DD : 4D    "M"    tsta
F8DE : 27 2B    "'+"    beq  LF90B
F8E0 : DE 13    "  "    ldx  X0013
F8E2 : DF 08    "  "    stx  X0008
F8E4 : CE 00 20    "   "    ldx  #$0020
F8E7 : 97 0D    "  "    staa  X000D
F8E9        LF8E9:
F8E9 : DF 0A    "  "    stx  X000A
F8EB : DE 08    "  "    ldx  X0008
F8ED : D6 0D    "  "    ldab  X000D
F8EF : D7 0C    "  "    stab  X000C
F8F1 : E6 01    "  "    ldab  $01,x
F8F3 : 54    "T"    lsrb
F8F4 : 54    "T"    lsrb
F8F5 : 54    "T"    lsrb
F8F6 : 54    "T"    lsrb
F8F7 : 08    " "    inx
F8F8 : DF 08    "  "    stx  X0008
F8FA : DE 0A    "  "    ldx  X000A
F8FC : A6 00    "  "    ldaa  $00,x
F8FE        LF8FE:
F8FE : 10    " "    sba
F8FF : 7A 00 0C    "z  "    dec  X000C
F902 : 26 FA    "& "    bne  LF8FE
F904 : A7 00    "  "    staa  $00,x
F906 : 08    " "    inx
F907 : 9C 1A    "  "    cpx  X001A
F909 : 26 DE    "& "    bne  LF8E9
F90B        LF90B:
F90B : 39    "9"    rts
;*************************************;
;GWave table, 1st byte wavelength
;*************************************;
;GWVTAB
F90C : 08    " "    inx
F90D : 7F D9 FF    "   "    clr  XD9FF
F910 : D9 7F    "  "    adcb  X007F
F912 : 24 00    "$ "    bcc  LF914
F914        LF914:
F914 : 24 08    "$ "    bcc  LF91E
        ;
F916 : 00    " "    db  $00
        ;
F917 : 40    "@"    nega
F918 : 80 00    "  "    suba  #$00
F91A : FF 00 80    "   "    stx  X0080
F91D : 40    "@"    nega
F91E        LF91E:
F91E : 10    " "    sba
F91F : 7F B0 D9    "   "    clr  XB0D9
F922 : F5 FF F5    "   "    bitb  XFFF5
F925 : D9 B0    "  "    adcb  X00B0
F927 : 7F 4E 24    " N$"    clr  X4E24
F92A : 09    " "    dex
        ;
F92B : 00    " "    db  $00
        ;
F92C : 09    " "    dex
F92D : 24 4E    "$N"    bcc  LF97D
        ;
F92F : 1C    " "    db  $1C
        ;
F930 : 80 40    " @"    suba  #$40
F932 : 29 1B    ") "    bvs  LF94F
F934 : 10    " "    sba
F935 : 09    " "    dex
F936 : 06    " "    tap
        ;
F937 : 04    " "    db  $04
        ;
F938 : 07    " "    tpa
F939 : 0C    " "    clc
        ;
F93A : 12 1E    "  "    db  $12, $1E
        ;
F93C : 30    "0"    tsx
F93D : 49    "I"    rola
F93E : A4 C9    "  "    anda  $C9,x
F940 : DF EB    "  "    stx  X00EB
F942 : F6 FB FF    "   "    ldab  XFBFF
F945 : FF FB F5    "   "    stx  XFBF5
F948 : EA DD    "  "    orab  $DD,x
        ;
F94A : C7    " "    db  $C7
        ;
F94B : 9B 10    "  "    adda  X0010
F94D : FF FF FF    "   "    stx  XFFFF
F950 : FF 00 00    "   "    stx  X0000
        ;
F953 : 00 00    "  "    db  $00, $00
        ;
F955 : FF FF FF    "   "    stx  XFFFF
F958 : FF 00 00    "   "    stx  X0000
        ;
F95B : 00 00    "  "    db  $00, $00
        ;
F95D : 48    "H"    asla
F95E : 8A 95    "  "    oraa  #$95
F960 : A0 AB    "  "    suba  $AB,x
F962 : B5 BF C8    "   "    bita  XBFC8
F965 : D1 DA    "  "    cmpb  X00DA
F967 : E1 E8    "  "    cmpb  $E8,x
F969 : EE F3    "  "    ldx  $F3,x
F96B : F7 FB FD    "   "    stab  XFBFD
F96E : FE FF FE    "   "    ldx  XFFFE
        ;
F971 : FD    " "    db  $FD
        ;
F972 : FB F7 F3    "   "    addb  XF7F3
F975 : EE E8    "  "    ldx  $E8,x
F977 : E1 DA    "  "    cmpb  $DA,x
F979 : D1 C8    "  "    cmpb  X00C8
F97B : BF B5 AB    "   "    sts  XB5AB
F97E : A0 95    "  "    suba  $95,x
F980 : 8A 7F    "  "    oraa  #$7F
        ;
F982 : 75    "u"    db  $75
        ;
F983 : 6A 5F    "j_"    dec  $5F,x
F985 : 54    "T"    lsrb
F986 : 4A    "J"    deca
F987 : 40    "@"    nega
F988 : 37    "7"    pshb
F989 : 2E 25    ".%"    bgt  LF9B0
        ;
F98B : 1E    " "    db  $1E
        ;
F98C : 17    " "    tba
F98D : 11    " "    cba
F98E : 0C    " "    clc
F98F : 08    " "    inx
        ;
F990 : 04 02    "  "    db  $04, $02
        ;
F992 : 01    " "    nop
        ;
F993 : 00    " "    db  $00
        ;
F994 : 01    " "    nop
        ;
F995 : 02 04    "  "    db  $02, $04
        ;
F997 : 08    " "    inx
F998 : 0C    " "    clc
F999 : 11    " "    cba
F99A : 17    " "    tba
        ;
F99B : 1E    " "    db  $1E
        ;
F99C : 25 2E    "%."    bcs  LF9CC
F99E : 37    "7"    pshb
F99F : 40    "@"    nega
F9A0 : 4A    "J"    deca
F9A1 : 54    "T"    lsrb
F9A2 : 5F    "_"    clrb
F9A3 : 6A 75    "ju"    dec  $75,x
F9A5 : 7F 0C 00    "   "    clr  X0C00
F9A8 : 50    "P"    negb
F9A9 : 60 B0    "` "    neg  $B0,x
F9AB : 20 20    "  "    bra  LF9CD
        ;
F9AD : F0 90 80    "   "    subb  X9080
F9B0        LF9B0:
F9B0 : C0 50    " P"    subb  #$50
F9B2 : 70 07 40    "p @"    neg  X0740
F9B5 : 09    " "    dex
F9B6 : 35    "5"    txs
F9B7 : 0C    " "    clc
F9B8 : 29 0F    ") "    bvs  LF9C9
F9BA : 20 
;*************************************;
;GWAVE SOUND VECTOR TABLE
;*************************************;
;b0 GECHO,GCCNT
;b1 GECDEC,WAVE#
;b2 PREDECAY FACTOR
;b3 GDFINC
;b4 VARIABLE FREQ COUNTER
;b5 FREQ PATTERN LENGTH
;b6 FREQ PATTERN OFFSET
;SVTAB
F9BB : 71    " q"    bra  LFA2D
        ;
F9BC : 23 09    "# "    bls  LF9C7
        ;
F9BE : 00 00 1E 00  "    "    db  $00, $00, $1E, $00
        ;
F9C2 : 74 00 09    "t  "    lsr  X0009
        ;
F9C5 : 00 00 1A 1E  "    "    db  $00, $00, $1A, $1E
        ;
F9C9        LF9C9:
F9C9 : 74 12 09    "t  "    lsr  X1209
        ;
F9CC        LF9CC:
F9CC : 00 00    "  "    db  $00, $00
        ;
F9CE : 0A    " "    clv
        ;
F9CF : 38    "8"    db  $38
        ;
F9D0 : 11    " "    cba
F9D1 : 06    " "    tap
F9D2 : 06    " "    tap
        ;
F9D3 : 02    " "    db  $02
        ;
F9D4 : 20 03    "  "    bra  LF9D9
        ;
F9D6 : 42    "B"    db  $42
        ;
F9D7 : 11    " "    cba
        ;
F9D8 : 04    " "    db  $04
        ;
F9D9        LF9D9:
F9D9 : 0B    " "    sev
F9DA : 01    " "    nop
F9DB : 20 04    "  "    bra  LF9E1
        ;
F9DD : 42 12 03    "B  "    db  $42, $12, $03
        ;
F9E0 : 09    " "    dex
        ;
F9E1        LF9E1:
F9E1 : 00 00 04    "   "    db  $00, $00, $04
        ;
F9E4 : 46    "F"    rora
        ;
F9E5 : 12 03    "  "    db  $12, $03
        ;
F9E7 : 09    " "    dex
        ;
F9E8 : 00 00 04    "   "    db  $00, $00, $04
        ;
F9EB : 4A    "J"    deca
F9EC : 16    " "    tab
        ;
F9ED : 00    " "    db  $00
        ;
F9EE : 09    " "    dex
        ;
F9EF : 00 00    "  "    db  $00, $00
        ;
F9F1 : 16    " "    tab
        ;
F9F2 : 4E    "N"    db  $4E
        ;
F9F3 : 11    " "    cba
        ;
F9F4 : 05    " "    db  $05
        ;
F9F5 : 11    " "    cba
F9F6 : 01    " "    nop
F9F7 : 0F    " "    sei
F9F8 : 01    " "    nop
        ;
F9F9 : 38 1F 12    "8  "    db  $38, $1F, $12
        ;
F9FC : 09    " "    dex
F9FD : FF 05 04    "   "    stx  X0504
FA00 : 64 F1    "d "    lsr  $F1,x
FA02 : 07    " "    tpa
FA03 : 09    " "    dex
        ;
FA04 : 00 00    "  "    db  $00, $00
        ;
FA06 : 0E    " "    cli
FA07 : 68 68    "hh"    asl  $68,x
FA09 : 20 00    "  "    bra  LFA0B
        ;
FA0B        LFA0B:
FA0B : 02    " "    db  $02
        ;
FA0C : 26 03    "& "    bne  LFA11
        ;
FA0E : 04    " "    db  $04
        ;
FA0F : 08    " "    inx
FA10 : 47    "G"    asra
FA11        LFA11:
FA11 : 0B    " "    sev
FA12 : 40    "@"    nega
FA13 : 01    " "    nop
        ;
FA14 : 02 03    "  "    db  $02, $03
        ;
FA16 : 88 F3    "  "    eora  #$F3
FA18 : 90 13    "  "    suba  X0013
FA1A : B7 04 00    "   "    staa  X0400
        ;
FA1D : 18    " "    db  $18
        ;
FA1E : 11    " "    cba
FA1F : 09    " "    dex
        ;
FA20 : 00 00 14    "   "    db  $00, $00, $14
        ;
FA23 : 40    "@"    nega
;*************************************;
;GWAVE FREQ PATTERN TABLE
;*************************************; 
;GFRTAB
FA24 : 28 01    "( "    bvc  LFA27
        ;
FA26 : 02    " "    db  $02
        ;
FA27        LFA27:
FA27 : 26 03    "& "    bne  LFA2C
        ;
FA29 : 04    " "    db  $04
        ;
FA2A : 24 05    "$ "    bcc  LFA31
FA2C        LFA2C:
FA2C : 06    " "    tap
FA2D        LFA2D:
FA2D : 22 07    "" "    bhi  LFA36
FA2F : 08    " "    inx
FA30 : 20 09    "  "    bra  LFA3B
        ;
FA32 : 0A    " "    clv
        ;
FA33 : 1E    " "    db  $1E
        ;
FA34 : 0B    " "    sev
FA35 : 0C    " "    clc
        ;
FA36        LFA36:
FA36 : 1C    " "    db  $1C
        ;
FA37 : 0D    " "    sec
FA38 : 0E    " "    cli
        ;
FA39 : 1A    " "    db  $1A
        ;
FA3A : 0F    " "    sei
FA3B        LFA3B:
FA3B : 10    " "    sba
        ;
FA3C : 18    " "    db  $18
        ;
FA3D : 11    " "    cba
        ;
FA3E : 12    " "    db  $12
        ;
FA3F : 16    " "    tab
        ;
FA40 : 13 14    "  "    db  $13, $14
        ;
FA42 : 40    "@"    nega
FA43 : 01    " "    nop
FA44 : 3E    ">"    wai
        ;
FA45 : 03 3C 05 3A  " < :"    db  $03, $3C, $05, $3A
        ;
FA49 : 07    " "    tpa
        ;
FA4A : 38    "8"    db  $38
        ;
FA4B : 09    " "    dex
FA4C : 35    "5"    txs
FA4D : 0C    " "    clc
FA4E : 32    "2"    pula
FA4F : 0F    " "    sei
FA50 : 2F 12    "/ "    ble  LFA64
FA52 : 2C 15    ", "    bge  LFA69
FA54 : 28 19    "( "    bvc  LFA6F
FA56 : 24 1D    "$ "    bcc  LFA75
FA58 : 20 21    " !"    bra  LFA7B
FA5A : 20 21    " !"    bra  LFA7D
        ;
FA5C : 08    " "    inx
FA5D : 40    "@"    nega
FA5E : 08    " "    inx
FA5F : 40    "@"    nega
FA60 : 08    " "    inx
FA61 : 40    "@"    nega
FA62 : 08    " "    inx
FA63 : 40    "@"    nega
FA64        LFA64:
FA64 : 08    " "    inx
FA65 : 40    "@"    nega
FA66 : 01    " "    nop
        ;
FA67 : 02 03 04    "   "    db  $02, $03, $04
        ;
FA6A : 20 18    "  "    bra  LFA84
FA6C : 20 01    "  "    bra  LFA6F
        ;
FA6E : 01    " "    nop
FA6F        LFA6F:
FA6F : 30    "0"    tsx
FA70 : 28 30    "(0"    bvc  LFAA2
        ;
FA72 : 1E 02    "  "    db  $1E, $02
        ;
FA74 : 1B    " "    aba
        ;
FA75        LFA75:
FA75 : 04    " "    db  $04
        ;
FA76 : 23 07    "# "    bls  LFA7F
        ;
FA78 : 1D    " "    db  $1D
        ;
FA79 : 01    " "    nop
FA7A : 22 03    "" "    bhi  LFA7F
FA7C : 19    " "    daa
FA7D        LFA7D:
FA7D : 09    " "    dex
        ;
FA7E : 1F    " "    db  $1F
        ;
FA7F        LFA7F:
FA7F : 06    " "    tap
        ;
FA80 : 1A 05 1C    "   "    db  $1A, $05, $1C
        ;
FA83 : 0B    " "    sev
        ;
FA84        LFA84:
FA84 : 21    "!"    db  $21
        ;
FA85 : 08    " "    inx
FA86 : 20 0A    "  "    bra  LFA92
        ;
FA88 : 40    "@"    nega
FA89 : 10    " "    sba
FA8A : 08    " "    inx
FA8B : 01    " "    nop
FA8C : 08    " "    inx
FA8D : 80 10    "  "    suba  #$10
FA8F : 78 18 70    "x p"    asl  X1870
FA92        LFA92:
FA92 : 20 60    " `"    bra  LFAF4
        ;
FA94 : 28 58    "(X"    bvc  LFAEE
FA96 : 30    "0"    tsx
FA97 : 50    "P"    negb
FA98 : 40    "@"    nega
FA99 : 48    "H"    asla
FA9A        LFA9A:
FA9A : 36    "6"    psha
FA9B        LFA9B:
FA9B : A6 00    "  "    ldaa  $00,x
FA9D : DF 08    "  "    stx  X0008
FA9F : DE 0A    "  "    ldx  X000A
FAA1 : A7 00    "  "    staa  $00,x
FAA3 : 08    " "    inx
FAA4 : DF 0A    "  "    stx  X000A
FAA6 : DE 08    "  "    ldx  X0008
FAA8 : 08    " "    inx
FAA9 : 5A    "Z"    decb
FAAA : 26 EF    "& "    bne  LFA9B
FAAC : 32    "2"    pula
FAAD : 39    "9"    rts
        ;
FAAE : 48    "H"    asla
FAAF : 48    "H"    asla
FAB0 : 48    "H"    asla
FAB1 : 48    "H"    asla
FAB2 : 80 03    "  "    suba  #$03
FAB4 : 97 15    "  "    staa  X0015
FAB6 : C6 03    "  "    ldab  #$03
FAB8 : 97 14    "  "    staa  X0014
FABA : 86 01    "  "    ldaa  #$01
;*************************************;
;Lightning+Appear Noise Routine 
;*************************************;
;LITEN:
FABC : 97 1F    "  "    staa  X001F
FABE : 86 FF    "  "    ldaa  #$FF
FAC0 : 90 15    "  "    suba  X0015
FAC2 : B7 04 00    "   "    staa  X0400
FAC5 : D7 10    "  "    stab  X0010
;LITE0:
FAC7 : D6 10    "  "    ldab  X0010
;LITE1:
FAC9 : 96 02    "  "    ldaa  X0002
FACB : 44    "D"    lsra
FACC : 44    "D"    lsra
FACD : 44    "D"    lsra
FACE : 98 02    "  "    eora  X0002
FAD0 : 44    "D"    lsra
FAD1 : 76 00 01    "v  "    ror  X0001
FAD4 : 76 00 02    "v  "    ror  X0002
FAD7 : 24 07    "$ "    bcc  LFAE0
FAD9 : B6 04 00    "   "    ldaa  X0400
FADC : 43    "C"    coma
FADD : B7 04 00    "   "    staa  X0400
;LITE2:
FAE0 : 96 14    "  "    ldaa  X0014
;LITE3:
FAE2 : 4A    "J"    deca
FAE3 : 26 FD    "& "    bne  LFAE2
FAE5 : 5A    "Z"    decb
FAE6 : 26 E1    "& "    bne  LFAC9
FAE8 : 96 14    "  "    ldaa  X0014
FAEA : 9B 15    "  "    adda  X0015
FAEC : 97 14    "  "    staa  X0014
FAEE        LFAEE:
FAEE : 26 D7    "& "    bne  LFAC7
FAF0 : 39    "9"    rts
;*************************************;
;Hyper 
;*************************************;
;HYPER
FAF1 : 4F    "O"    clra
FAF2 : B7 04 00    "   "    staa  X0400
FAF5 : 97 0C    "  "    staa  X000C
;HYPER1:
FAF7 : 4F    "O"    clra
;HYPER2:
FAF8 : 91 0C    "  "    cmpa  X000C
FAFA : 26 03    "& "    bne  LFAFF
FAFC : 73 04 00    "s  "    com  X0400
;HYPER3:
FAFF : C6 12    "  "    ldab  #$12
;HYPER4:
FB01 : 5A    "Z"    decb
FB02 : 26 FD    "& "    bne  LFB01
FB04 : 4C    "L"    inca
FB05 : 2A F1    "* "    bpl  LFAF8
FB07 : 73 04 00    "s  "    com  X0400
FB0A : 7C 00 0C    "|  "    inc  X000C
FB0D : 2A E8    "* "    bpl  LFAF7
FB0F : 39    "9"    rts
;*************************************;
;Cannon 
;*************************************;
;CANNON
FB10 : 86 01    "  "    ldaa  #$01
FB12 : 97 14    "  "    staa  X0014
FB14 : CE 03 E8    "   "    ldx  #$03E8
FB17 : 86 01    "  "    ldaa  #$01
FB19 : C6 FF    "  "    ldab  #$FF
FB1B : 20 1A    "  "    bra  LFB37
;*************************************;
;
;*************************************;
;LFB1D:
FB1D : 86 00    "  "    ldaa  #$00
FB1F : 97 14    "  "    staa  X0014
FB21 : CE 00 80    "   "    ldx  #$0080
FB24 : 86 01    "  "    ldaa  #$01
FB26 : C6 C0    "  "    ldab  #$C0
FB28 : 20 0D    "  "    bra  LFB37
;*************************************;
;
;*************************************;
;LFB2A:
FB2A : 86 01    "  "    ldaa  #$01
FB2C : 97 14    "  "    staa  X0014
FB2E : CE 0F A0    "   "    ldx  #$0FA0
FB31 : 86 01    "  "    ldaa  #$01
FB33 : C6 FF    "  "    ldab  #$FF
FB35 : 20 00    "  "    bra  LFB37
;*************************************;
;Filtered Noise Routine 
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
FB37 : 97 13    "  "    staa  X0013
FB39 : D7 0E    "  "    stab  X000E
FB3B : DF 11    "  "    stx  X0011
FB3D : 7F 00 10    "   "    clr  X0010
;FNOIS0:
FB40 : DE 11    "  "    ldx  X0011
FB42 : B6 04 00    "   "    ldaa  X0400
;FNOIS1:
FB45 : 16    " "    tab
FB46 : 54    "T"    lsrb
FB47 : 54    "T"    lsrb
FB48 : 54    "T"    lsrb
FB49 : D8 02    "  "    eorb  X0002
FB4B : 54    "T"    lsrb
FB4C : 76 00 01    "v  "    ror  X0001
FB4F : 76 00 02    "v  "    ror  X0002
FB52 : D6 0E    "  "    ldab  X000E
FB54 : 7D 00 14    "}  "    tst  X0014
FB57 : 27 02    "' "    beq  LFB5B
FB59 : D4 01    "  "    andb  X0001
;FNOIS2:
FB5B : D7 0F    "  "    stab  X000F
FB5D : D6 10    "  "    ldab  X0010
FB5F : 91 02    "  "    cmpa  X0002
FB61 : 22 12    "" "    bhi  LFB75
;FNOIS3:
FB63 : 09    " "    dex
FB64 : 27 26    "'&"    beq  LFB8C
FB66 : B7 04 00    "   "    staa  X0400
FB69 : DB 10    "  "    addb  X0010
FB6B : 99 0F    "  "    adca  X000F
FB6D : 25 16    "% "    bcs  LFB85
FB6F : 91 02    "  "    cmpa  X0002
FB71 : 23 F0    "# "    bls  LFB63
FB73 : 20 10    "  "    bra  LFB85
;FNOIS4:
FB75 : 09    " "    dex
FB76 : 27 14    "' "    beq  LFB8C
FB78 : B7 04 00    "   "    staa  X0400
FB7B : D0 10    "  "    subb  X0010
FB7D : 92 0F    "  "    sbca  X000F
FB7F : 25 04    "% "    bcs  LFB85
FB81 : 91 02    "  "    cmpa  X0002
FB83 : 22 F0    "" "    bhi  LFB75
;FNOIS5:
FB85 : 96 02    "  "    ldaa  X0002
FB87 : B7 04 00    "   "    staa  X0400
FB8A : 20 B9    "  "    bra  LFB45
;FNOIS6:
FB8C : D6 13    "  "    ldab  X0013
FB8E : 27 B5    "' "    beq  LFB45
FB90 : 96 0E    "  "    ldaa  X000E
FB92 : D6 10    "  "    ldab  X0010
FB94 : 44    "D"    lsra
FB95 : 56    "V"    rorb
FB96 : 44    "D"    lsra
FB97 : 56    "V"    rorb
FB98 : 44    "D"    lsra
FB99 : 56    "V"    rorb
FB9A : 43    "C"    coma
FB9B : 50    "P"    negb
FB9C : 82 FF    "  "    sbca  #$FF
FB9E : DB 10    "  "    addb  X0010
FBA0 : 99 0E    "  "    adca  X000E
FBA2 : D7 10    "  "    stab  X0010
FBA4 : 97 0E    "  "    staa  X000E
FBA6 : 26 98    "& "    bne  LFB40
FBA8 : C1 07    "  "    cmpb  #$07
FBAA : 26 94    "& "    bne  LFB40
FBAC : 39    "9"    rts
        ;
FBAD : C6 FF    "  "    ldab  #$FF
FBAF : D7 18    "  "    stab  X0018
FBB1        LFBB1:
FBB1 : CE FB C6    "   "    ldx  #$FBC6
FBB4 : 8D 09    "  "    bsr  LFBBF
FBB6 : CE FB CC    "   "    ldx  #$FBCC
FBB9 : 8D 04    "  "    bsr  LFBBF
FBBB : 5A    "Z"    decb
FBBC : 26 F3    "& "    bne  LFBB1
FBBE : 39    "9"    rts
;*************************************;
;
;*************************************;
;LFBBF:
FBBF : BD FB D2    "   "    jsr  LFBD2
FBC2 : BD FB EB    "   "    jsr  LFBEB
FBC5 : 39    "9"    rts
FBC6 : 20 03    "  "    bra  LFBCB
        ;
FBC8 : FF 50 FF    " P "    stx  X50FF
        ;
FBCB        LFBCB:
FBCB : 00    " "    db  $00
        ;
FBCC : 50    "P"    negb
        ;
FBCD : 03    " "    db  $03
        ;
FBCE : 01    " "    nop
FBCF : 20 FF    "  "    bra  LFBD0
        ;
FBD1 : 00    " "    db  $00
;*************************************;
;* MOVE PARAMETERS
;*************************************;
;MOVE:
FBD2 : A6 00    "  "    ldaa  $00,x
FBD4 : 97 0F    "  "    staa  X000F
FBD6 : A6 01    "  "    ldaa  $01,x
FBD8 : 97 10    "  "    staa  X0010
FBDA : A6 02    "  "    ldaa  $02,x
FBDC : 97 11    "  "    staa  X0011
FBDE : A6 03    "  "    ldaa  $03,x
FBE0 : 97 12    "  "    staa  X0012
FBE2 : A6 04    "  "    ldaa  $04,x
FBE4 : 97 13    "  "    staa  X0013
FBE6 : A6 05    "  "    ldaa  $05,x
FBE8 : 97 14    "  "    staa  X0014
FBEA : 39    "9"    rts
;*************************************;
;* DELTA F, DELTA A ROUTINE
;*************************************;
;SING:
FBEB : 96 18    "  "    ldaa  X0018
FBED : 37    "7"    pshb
FBEE : D6 13    "  "    ldab  X0013
FBF0 : D7 15    "  "    stab  X0015
FBF2 : D6 10    "  "    ldab  X0010
FBF4 : D7 16    "  "    stab  X0016
FBF6        LFBF6:
FBF6        XFBF6:
FBF6 : 43    "C"    coma
FBF7 : D6 0F    "  "    ldab  X000F
FBF9 : B7 04 00    "   "    staa  X0400
FBFC        LFBFC:
FBFC : 5A    "Z"    decb
FBFD        XFBFD:
FBFD : 26 FD    "& "    bne  LFBFC
FBFF        XFBFF:
FBFF : 43    "C"    coma
FC00 : D6 0F    "  "    ldab  X000F
FC02 : 20 00    "  "    bra  LFC04
        ;
FC04        LFC04:
FC04 : 08    " "    inx
FC05 : 09    " "    dex
FC06 : 08    " "    inx
FC07 : 09    " "    dex
FC08 : B7 04 00    "   "    staa  X0400
FC0B        LFC0B:
FC0B : 5A    "Z"    decb
FC0C : 26 FD    "& "    bne  LFC0B
FC0E : 7A 00 16    "z  "    dec  X0016
FC11 : 27 16    "' "    beq  LFC29
FC13 : 7A 00 15    "z  "    dec  X0015
FC16 : 26 DE    "& "    bne  LFBF6
FC18 : 43    "C"    coma
FC19 : D6 13    "  "    ldab  X0013
FC1B : B7 04 00    "   "    staa  X0400
FC1E : D7 15    "  "    stab  X0015
FC20 : D6 0F    "  "    ldab  X000F
FC22 : 9B 14    "  "    adda  X0014
FC24 : 2B 1E    "+ "    bmi  LFC44
FC26 : 01    " "    nop
FC27 : 20 15    "  "    bra  LFC3E
        ;
FC29        LFC29:
FC29 : 08    " "    inx
FC2A : 09    " "    dex
FC2B : 01    " "    nop
FC2C : 43    "C"    coma
FC2D : D6 10    "  "    ldab  X0010
FC2F : B7 04 00    "   "    staa  X0400
FC32 : D7 16    "  "    stab  X0016
FC34 : D6 0F    "  "    ldab  X000F
FC36 : D0 11    "  "    subb  X0011
FC38 : D1 12    "  "    cmpb  X0012
FC3A : D1 12    "  "    cmpb  X0012
FC3C : 27 06    "' "    beq  LFC44
FC3E        LFC3E:
FC3E : D7 0F    "  "    stab  X000F
FC40 : C0 05    "  "    subb  #$05
FC42 : 20 B8    "  "    bra  LFBFC
;SING6:
FC44 : 33    "3"    pulb
FC45 : 39    "9"    rts
;*************************************;
;zero padding
FC46 : 00 00 00 00 
FC4A : 00 00 00 00 
FC4E : 00 00 00 00 
FC52 : 00 00 00 00 
FC56 : 00 00 00 00 
FC5A : 00 00 00 00 
FC5E : 00 00 00 00 
FC62 : 00 00 00 00 
FC66 : 00 00 00 00 
FC6A : 00 00 00 00 
FC6E : 00 00 00 00 
FC72 : 00 00 00 00 
FC76 : 00 00 00 00 
FC7A : 00 00 00 00 
FC7E : 00 00 00 00 
FC82 : 00 00 00 00 
FC86 : 00 00 00 00 
FC8A : 00 00 00 00 
FC8E : 00 00 00 00 
FC92 : 00 00 00 00 
FC96 : 00 00 00 00 
FC9A : 00 00 00 00 
FC9E : 00 00 00 00 
FCA2 : 00 00 00 00 
FCA6 : 00 00 00 00 
FCAA : 00 00 00 00 
FCAE : 00 00 00 00 
FCB2 : 00 00 00 00 
FCB6 : 00 00 00 00 
FCBA : 00 00 00 00 
FCBE : 00 00 00 00 
FCC2 : 00 00 00 00 
FCC6 : 00 00 00 00 
FCCA : 00 00 00 00 
FCCE : 00 00 00 00 
FCD2 : 00 00 00 00 
FCD6 : 00 00 00 00 
FCDA : 00 00 00 00 
FCDE : 00 00 00 00 
FCE2 : 00 00 00 00 
FCE6 : 00 00 00 00 
FCEA : 00 00 00 00 
FCEE : 00 00 00 00 
FCF2 : 00 00 00 00 
FCF6 : 00 00 00 00 
FCFA : 00 00 00 00 
FCFE : 00 00 00 00 
FD02 : 00 00 00 00 
FD06 : 00 00 00 00 
FD0A : 00 00 00 00 
FD0E : 00 00 00 00 
FD12 : 00 00 00 00 
FD16 : 00 00 00 00 
FD1A : 00 00 00 00 
FD1E : 00 00 00 00 
FD22 : 00 00 00 00 
FD26 : 00 00 00 00 
FD2A : 00 00 00 00 
FD2E : 00 00 00 00 
FD32 : 00 00 00 00 
FD36 : 00 00 00 00 
FD3A : 00 00 00 00 
FD3E : 00 00 00 00 
FD42 : 00 00 00 00 
FD46 : 00 00 00 00 
FD4A : 00 00 00 00 
FD4E : 00 00 00 00 
FD52 : 00 00 00 00 
FD56 : 00 00 00 00 
FD5A : 00 00 00 00 
FD5E : 00 00 00 00 
FD62 : 00 00 00 00 
FD66 : 00 00 00 00 
FD6A : 00 00 00 00 
FD6E : 00 00 00 00 
FD72 : 00 00 00 00 
FD76 : 00 00 00 00 
FD7A : 00 00 00 00 
FD7E : 00 00 00 00 
FD82 : 00 00 00 00 
FD86 : 00 00 00 00 
FD8A : 00 00 00 00 
FD8E : 00 00 00 00 
FD92 : 00 00 00 00 
FD96 : 00 00 00 00 
FD9A : 00 00 00 00 
FD9E : 00 00 00 00 
FDA2 : 00 00 00 00 
FDA6 : 00 00 00 00 
FDAA : 00 00 00 00 
FDAE : 00 00 00 00 
FDB2 : 00 00 00 00 
FDB6 : 00 00 00 00 
FDBA : 00 00 00 00 
FDBE : 00 00 00 00 
FDC2 : 00 00 00 00 
FDC6 : 00 00 00 00 
FDCA : 00 00 00 00 
FDCE : 00 00 00 00 
FDD2 : 00 00 00 00 
FDD6 : 00 00 00 00 
FDDA : 00 00 00 00 
FDDE : 00 00 00 00 
FDE2 : 00 00 00 00 
FDE6 : 00 00 00 00 
FDEA : 00 00 00 00 
FDEE : 00 00 00 00 
FDF2 : 00 00 00 00 
FDF6 : 00 00 00 00 
FDFA : 00 00 00 00 
FDFE : 00 00 00 00 
FE02 : 00 00 00 00 
FE06 : 00 00 00 00 
FE0A : 00 00 00 00 
FE0E : 00 00 00 00 
FE12 : 00 00 00 00 
FE16 : 00 00 00 00 
FE1A : 00 00 00 00 
FE1E : 00 00 00 00 
FE22 : 00 00 00 00 
FE26 : 00 00 00 00 
FE2A : 00 00 00 00 
FE2E : 00 00 00 00 
FE32 : 00 00 00 00 
FE36 : 00 00 00 00 
FE3A : 00 00 00 00 
FE3E : 00 00 00 00 
FE42 : 00 00 00 00 
FE46 : 00 00 00 00 
FE4A : 00 00 00 00 
FE4E : 00 00 00 00 
FE52 : 00 00 00 00 
FE56 : 00 00 00 00 
FE5A : 00 00 00 00 
FE5E : 00 00 00 00 
FE62 : 00 00 00 00 
FE66 : 00 00 00 00 
FE6A : 00 00 00 00 
FE6E : 00 00 00 00 
FE72 : 00 00 00 00 
FE76 : 00 00 00 00 
FE7A : 00 00 00 00 
FE7E : 00 00 00 00 
FE82 : 00 00 00 00 
FE86 : 00 00 00 00 
FE8A : 00 00 00 00 
FE8E : 00 00 00 00 
FE92 : 00 00 00 00 
FE96 : 00 00 00 00 
FE9A : 00 00 00 00 
FE9E : 00 00 00 00 
FEA2 : 00 00 00 00 
FEA6 : 00 00 00 00 
FEAA : 00 00 00 00 
FEAE : 00 00 00 00 
FEB2 : 00 00 00 00 
FEB6 : 00 00 00 00 
FEBA : 00 00 00 00 
FEBE : 00 00 00 00 
FEC2 : 00 00 00 00 
FEC6 : 00 00 00 00 
FECA : 00 00 00 00 
FECE : 00 00 00 00 
FED2 : 00 00 00 00 
FED6 : 00 00 00 00 
FEDA : 00 00 00 00 
FEDE : 00 00 00 00 
FEE2 : 00 00 00 00 
FEE6 : 00 00 00 00 
FEEA : 00 00 00 00 
FEEE : 00 00 00 00 
FEF2 : 00 00 00 00 
FEF6 : 00 00 00 00 
FEFA : 00 00 00 00 
FEFE : 00 00 00 00 
FF02 : 00 00 00 00 
FF06 : 00 00 00 00 
FF0A : 00 00 00 00 
FF0E : 00 00 00 00 
FF12 : 00 00 00 00 
FF16 : 00 00 00 00 
FF1A : 00 00 00 00 
FF1E : 00 00 00 00 
FF22 : 00 00 00 00 
FF26 : 00 00 00 00 
FF2A : 00 00 00 00 
FF2E : 00 00 00 00 
FF32 : 00 00 00 00 
FF36 : 00 00 00 00 
FF3A : 00 00 00 00 
FF3E : 00 00 00 00 
FF42 : 00 00 00 00 
FF46 : 00 00 00 00 
FF4A : 00 00 00 00 
FF4E : 00 00 00 00 
FF52 : 00 00 00 00 
FF56 : 00 00 00 00 
FF5A : 00 00 00 00 
FF5E : 00 00 00 00 
FF62 : 00 00 00 00 
FF66 : 00 00 00 00 
FF6A : 00 00 00 00 
FF6E : 00 00 00 00 
FF72 : 00 00 00 00 
FF76 : 00 00 00 00 
FF7A : 00 00 00 00 
FF7E : 00 00 00 00 
FF82 : 00 00 00 00 
FF86 : 00 00 00 00 
FF8A : 00 00 00 00 
FF8E : 00 00 00 00 
FF92 : 00 00 00 00 
FF96 : 00 00 00 00 
FF9A : 00 00 00 00 
FF9E : 00 00 00 00 
FFA2 : 00 00 00 00 
FFA6 : 00 00 00 00 
FFAA : 00 00 00 00 
FFAE : 00 00 00 00 
FFB2 : 00 00 00 00 
FFB6 : 00 00 00 00 
FFBA : 00 00 00 00 
FFBE : 00 00 00 00 
FFC2 : 00 00 00 00 
FFC6 : 00 00 00 00 
FFCA : 00 00 00 00 
FFCE : 00 00 00 00 
FFD2 : 00 00 00 00 
FFD6 : 00 00 00 00 
FFDA : 00 00 00 00 
FFDE : 00 00 00 00 
FFE2 : 00 00 00 00 
FFE6 : 00 00 00 00 
FFEA : 00 00 00 00 
FFEE : 00 00 00 00 
FFF2 : 00    " "    db  $00
;*************************************;
;Speech ROM6 jump sub destination
;*************************************;
FFF3 : 7E F1 A7    "~  "    jmp  LF1A7
;
FFF6 : 00 00    "  "    db  $00, $00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F0 C1                          ;IRQ 
FFFA : F0 01                          ;RESET SWI (software) 
FFFC : F1 B6                          ;NMI 
FFFE : F0 01                          ;RESET (hardware) 

;--------------------------------------------------------------








