    ;
    ; Disassembled by:
    ;  DASMx object code disassembler
    ;  (c) Copyright 1996-2003   Conquest Consultants
    ;  Version 1.40 (Oct 18 2003)
    ;
    ; File:  Ratrace.532
    ;
    ; Size:  8192 bytes
    ; Checksum: B486
    ; CRC-32:  C54B9402
    ;
    ; Date:  Sat Apr 10 01:45:00 2021
    ;
    ; CPU:  Motorola 6800 (6800/6802/6808 family)
    ;
        ; Rat Race, 10 made, no production, Sound ROM is 8k, PIA addr 2000, DAC output is portB 2002
        ; January 1983, System 7 (8k in sys 7 board? should be sys9?)
        ;
        ; possibly a development ROM with ability to switch to different sound routines (IRQ jump table has 35)
        ;
        ; Upper part of ROM is E000 - EFFF and has 0-padding from E5E3 (0A1Ch, 2588d, 2.5K bytes)
        ; Lower part of ROM is F000 - FFFF and is full
        ; MotVects load lower half F001
        ;
        ; NMI organ FDBs not sounding good in ROM1 SYNTH
        ; x20 SYNTH routines !
        ;
        ;IRQ is split
        ;
        ;ENDRAM is $00FF(255 bytes) and not $007F(127 bytes)
        ;
        ; update 27 May 2021
        ;
;Mapping of ROM addresses and key functions:
; ROM   ADDR 
; Low   E000 ORGTAB
;       E0CD routines
;       E449 FDB data
;
; Mid   E5E3 zero padding
;       EF00 checksum calculator
;       EF0F zero padding
;
; HI    F000 reset, irq, nmi
;       F0A6 JMPTBL
;       F0EC routines
;       F24F FDB data
;       F54E routines
;       FAD0 Walsh
;       ...
;       FFF8 MOTVECT
;
     org $E000
;
;*************************************;
;Organ table
;*************************************;
;ORGTAB
;bits: OSCILLATOR MASK(1),DELAY(1),DURATION(2)
;example: $383F [mask,delay] $05FC [duration]
;   and : $0029 [mask,delay] $071E [duration]
E000 : CC                             ;CCh = 33h * 4h (51 * 4) - notes * bytes = length
E001 : 38 3F 05 FC 00 29 07 1E        ;1st and 2nd note
E009 : 38 04 05 55 00 29 07 1E        ;
E010 : 38 0D 04 C0 00 29 07 1E        ;
E018 : 38 04 05 55 00 29 07 1E        ;
E020 : 38 3F 05 FC 00 29 07 1E        ;
E028 : 38 04 05 55 00 29 07 1E        ;
E030 : 38 0D 04 C0 00 29 07 1E        ;
E038 : 38 04 05 55 00 29 07 1E        ;
E040 : 38 3F 05 FC 00 29 07 1E        ;
E048 : 38 04 05 55 00 29 07 1E        ;
E050 : 38 0D 04 C0 00 29 07 1E        ;
E058 : 38 04 07 1C 00 29 07 1E        ;
E060 : 38 0D 04 C0 00 29 07 1E        ;
E068 : 38 29 07 1E 00 29 07 1E        ;
E070 : 38 37 03 2B 00 29 07 1E        ;
E078 : 38 3F 02 FE 00 29 07 1E        ;
E080 : 38 37 03 2B 00 29 07 1E        ;
E088 : 38 29 07 1E 00 29 07 1E        ;
E090 : 38 37 03 2B 00 29 07 1E        ;
E098 : 38 3F 02 FE 00 29 07 1E        ;
E0A0 : 38 37 03 2B 00 29 07 1E        ;
E0A8 : 38 29 07 1E 00 29 07 1E        ;
E0B0 : 38 37 03 2B 00 29 07 1E        ;
E0B8 : 38 3F 02 FE 00 29 07 1E        ;
E0C0 : 38 37 04 3A 00 29 07 1E        ;
E0C8 : 38 3F 02 FE                    ;51st note
E0CC : 4F                             ;null note (clra) ?
;*************************************;
;Organ Tune 
;*************************************;
;ORGNT1
E0CD : 7F 00 90   clr $0090           ;clr (00) addr 0090 (ORGFLG)
E0D1 : 97 87      staa $87            ;store A in addr 87 (TEMPA) (TUNE NUMBER)
E0D3 : CE E0 00   ldx #$E000          ;load X with E000h (ORGTAB)
;ORGNT2:
E0D6 : A6 00      ldaa $00,x          ;load A with addr X+00h (TUNE TABLE LENGTH)
E0D8 : 27 2D      beq LE107           ;branch Z=1 PRM124(ORGNT5) (INVALID TUNE)
E0DA : 7A 00 87   dec $0087           ;decr addr 0087 (TEMPA)
E0DD : 20 06      bra LE0E5           ;branch Z=1 PRM122 (ORGNT3)
E0DF : 4C         inca                ;incr A 
E0E0 : BD E1 89   jsr LE189           ;jump sub ADDX 
E0E3 : 20 F1      bra LE0D6           ;branch always PRM121 (ORGNT2)
;ORGNT3:
E0E5 : 08         inx                 ;incr X
E0E6 : DF 8E      stx $8E             ;store X in addr 8E (XPTR)(NOTE POINTER)
E0E8 : BD E1 89   jsr LE189           ;jump sub ADDX 
E0EB : DF 8C      stx $8C             ;store X in addr 8C (XPLAY)(TUNE END)
E0ED : DE 8E      ldx $8E             ;load X in addr 8E (XPTR)
;ORGNT4: - store melody location into mem 93, sets X with melody addr and A with X(lo)
E0EF : A6 00      ldaa $00,x          ;load A with addr X+00h (TUNE LOOP)
E0F1 : 97 93      staa $93            ;store A in addr 93 (OSCIL)
E0F3 : A6 01      ldaa $01,x          ;load A with addr X + 01h
E0F5 : EE 02      ldx $02,x           ;load X with addr X + 02h
E0F7 : DF 91      stx $91             ;store X in addr 0F (DUR)
E0F9 : 8D 0D      bsr LE108           ;branch sub SYNTH10 (ORGANL)
E0FB : DE 8E      ldx $8E             ;load X with addr 8E (XPTR)
E0FD : 08         inx                 ;incr X
E0FE : 08         inx                 ;incr X
E0FF : 08         inx                 ;incr X
E100 : 08         inx                 ;incr X
E101 : DF 8E      stx $8E             ;store X in addr 8E (XPTR)
E103 : 9C 8C      cpx $8C             ;comp X with addr 8C (XPLAY)
E105 : 26 E8      bne LE0EF           ;branch Z=0 PRM123 (ORGNT4)
;ORGNT5:
E107 : 39         rts                 ;return subroutine
;*************************************;
;Organ Loader
;*************************************;
;ORGANL
E108 : CE 00 94   ldx #$0094          ;load X with 0094h (scratch mem locations)
;ALT : 80 02      suba  #$02          ;A = A - 02h from ROM15
;LDLP: - 01 nop length writer for freq/pitch
E10B : 81 00      cmpa #$00           ;compare A with 00h <- instead of suba
E10D : 27 15      beq LE124           ;branch Z=1 SYN103  <-- write loop from 0094
E10F : 81 03      cmpa #$03           ;compare A with 03h (needs 3 more bytes space for jmp write)
E111 : 27 09      beq LE11C           ;branch Z=1 SYN102 (LD2) <-- loop countdown =0
E113 : C6 01      ldab #$01           ;load B with 01h (NOP)
E115 : E7 00      stab $00,x          ;store B in addr X+00h <-- 01 nop writer
E117 : 08         inx                 ;incr X
E118 : 80 02      suba #$02           ;A = A - 02h
E11A : 20 EF      bra LE10B           ;branch always SYN101 (LDLP)
;LD2: - writes 91 00 (cmpa $00) gate for freq/pitch end jmp
E11C : C6 91      ldab #$91           ;load B with 91h
E11E : E7 00      stab $00,x          ;store B in addr X+00h
E120 : 6F 01      clr $01,x           ;clear addr X + 01h
E122 : 08         inx                 ;incr X
E123 : 08         inx                 ;incr X
;LD1: - writes 7E E1 32 (jmp E132) end freq/pitch
E124 : C6 7E      ldab #$7E           ;load B with 7Eh (JMP START2)
E126 : E7 00      stab $00,x          ;store B in addr X+00h
E128 : C6 E1      ldab #$E1           ;load B with E1h (#ORGAN1!>8 MSB)
E12A : E7 01      stab $01,x          ;store B in addr X + 01h
E12C : C6 32      ldab #$32           ;load B with 32h (#ORGAN1!.$FF LSB)
E12E : E7 02      stab $02,x          ;store B in addr X + 02h
;*************************************;
;Organ Routine 
;*************************************;
;* DUR=DURATION, OSCILLATOR MASK
;ORGAN
E130 : DE 91      ldx $91             ;load X with addr 91 (DUR)
;ORGAN1 - synth output writer and loop reader
E132 : 4F         clra                ;clear A
E133 : F6 00 88   ldab $0088          ;load B with addr 88 (LOAD B EXTEND TEMPB)
E136 : 5C         incb                ;incr B
E137 : D7 88      stab $88            ;store B in addr 88 (TEMPB) <-- counter up
E139 : D4 93      andb $93            ;and B with addr 93 (OSCIL)(MASK OSCILLATORS)
E13B : 54         lsrb                ;logic shift right B (bit7=0)
E13C : 89 00      adca #$00           ;A = Carry + A + 00h 
E13E : 54         lsrb                ;logic shift right B (bit7=0)
E13F : 89 00      adca #$00           ;A = Carry + A + 00h 
E141 : 54         lsrb                ;logic shift right B (bit7=0)
E142 : 89 00      adca #$00           ;A = Carry + A + 00h 
E144 : 54         lsrb                ;logic shift right B (bit7=0)
E145 : 89 00      adca #$00           ;A = Carry + A + 00h 
E147 : 54         lsrb                ;logic shift right B (bit7=0)
E148 : 89 00      adca #$00           ;A = Carry + A + 00h 
E14A : 54         lsrb                ;logic shift right B (bit7=0)
E14B : 89 00      adca #$00           ;A = Carry + A + 00h 
E14D : 54         lsrb                ;logic shift right B (bit7=0)
E14E : 89 00      adca #$00           ;A = Carry + A + 00h 
E150 : 48         asla                ;arith shift left A (bit0 is 0)
E151 : 48         asla                ;arith shift left A (bit0 is 0)
E152 : 48         asla                ;arith shift left A (bit0 is 0)
E153 : 48         asla                ;arith shift left A (bit0 is 0)
E154 : 48         asla                ;arith shift left A (bit0 is 0)
E155 : B7 20 02   staa $2002          ;store A in DAC output SOUND
E158 : 09         dex                 ;decr X
E159 : 27 03      beq LE15E           ;branch Z=1 SYN105 (NOTE OVER?)
E15B : 7E 00 94   jmp L0094           ;jump to timer location 0094 (RDELAY)(to jmp writes that set freq/pitch duration)
;ORGAN2:
E15E : 39         rts                 ;return subroutine
;*************************************;
;param shift and rotate, used by synth 12,13,14
;*************************************;
;PARAM13
E15F : 96 81      ldaa $81            ;load A with addr 81
E161 : 44         lsra                ;logic shift right A(bit7=0)
E162 : 98 81      eora $81            ;exclusive OR A with addr 81
E164 : 44         lsra                ;logic shift right A(bit7=0)
E165 : 44         lsra                ;logic shift right A(bit7=0)
E166 : 76 00 80   ror $0080           ;rotate right in addr 0080 (bit7 = C then C = bit0)
E169 : 76 00 81   ror $0081           ;rotate right in addr 0081 (bit7 = C then C = bit0)
E16C : 39         rts                 ;return subroutine
;*************************************;
;Tilt
;*************************************;
;TILT
E16D : CE 00 E0   ldx #$00E0          ;load X with 00E0h
E170 : 5F         clrb                ;clear B
;TILT1
E171 : 86 20      ldaa #$20           ;load A with 20h
E173 : 8D 14      bsr LE189           ;branch sub ADDX
;TILT2
E175 : 09         dex                 ;decr X
E176 : 26 FD      bne LE175           ;branch Z=0 TILT2
E178 : 7F 20 02   clr X2002           ;clear DAC output SOUND
;TILT3
E17B : 5A         decb                ;decr B
E17C : 26 FD      bne LE17B           ;branch Z=0 TILT3
E17E : 73 20 02   com X2002           ;complement 1s in DAC output SOUND
E181 : DE 8C      ldx $8C             ;load X with addr 8C
E183 : 8C 12 00   cpx #$1200          ;compare X with 1200h
E186 : 26 E9      bne LE171           ;branch Z=0 TILT1
E188 : 39         rts                 ;return subroutine
;*************************************;
;Add A to X Register
;*************************************;
;ADDX
E189 : DF 8C      stx $8C             ;store X in addr 8C
E18B : 9B 8D      adda $8D            ;add A with addr 8D
E18D : 97 8D      staa $8D            ;store A in addr 8D
E18F : 96 8C      ldaa $8C            ;load A with addr 8C
E191 : 89 00      adca #$00           ;add A with C and value 00h
E193 : 97 8C      staa $8C            ;store A in addr 8C
E195 : DE 8C      ldx $8C             ;load X with addr 8C
E197 : 39         rts                 ;return subroutine
;*************************************;
;DAC clr/staa, com/staa
;*************************************;
;SYNTH12
E198 : C6 BF      ldab #$BF           ;load B with BFh
;SYN121 outer B loop
E19A : 4F         clra                ;clear A
E19B : B7 20 02   staa $2002          ;store A in DAC output SOUND
E19E : 17         tba                 ;transfer B to A
;SYN122 decr A loop 1
E19F : 4A         deca                ;decr A
E1A0 : 26 FD      bne LE19F           ;branch Z=0 SYN122
;
E1A2 : 17         tba                 ;transfer B to A
E1A3 : 43         coma                ;complement 1s A
E1A4 : B7 20 02   staa $2002          ;store A in DAC output SOUND
E1A7 : 8D B6      bsr LE15F           ;branch sub PARAM13 (lsra, ror)
;SYN123 decr A loop 2
E1A9 : 4A         deca                ;decr A
E1AA : 26 FD      bne LE1A9           ;branch Z=0 SYN123
;
E1AC : 5A         decb                ;decr B
E1AD : 26 EB      bne LE19A           ;branch Z=0 SYN121
;
E1AF : 39         rts                 ;return subroutine
;*************************************;
;SYNTH13 DAC clr, com, dec, com
;*************************************;
E1B0 : C6 FF      ldab #$FF           ;load B with FFh
E1B2 : 7F 20 02   clr $2002           ;clear DAC output SOUND
;SYN131 LE1B5:
E1B5 : BD E1 5F   jsr LE15F           ;jump sub PARAM13
E1B8 : 96 81      ldaa $81            ;load A with addr 81
;SYN132 LE1BA:
E1BA : 20 00      bra LE1BC           ;branch always SYN133
;SYN133 LE1BC:
E1BC : 4A         deca                ;decr A
E1BD : 26 FB      bne LE1BA           ;branch Z=0 SYN132
E1BF : 73 20 02   com $2002           ;complement 1s in DAC output SOUND
E1C2 : C5 01      bitb #$01           ;bit test B with 01h
E1C4 : 26 03      bne LE1C9           ;branch Z=0 SYN134
E1C6 : 7A 20 02   dec $2002           ;decr value in DAC output SOUND
;SYN134 LE1C9:
E1C9 : 17         tba                 ;transfer B to A
;SYN135 LE1CA:
E1CA : 4A         deca                ;decr A
E1CB : 26 FD      bne LE1CA           ;branch Z=0 SYN135
E1CD : 73 20 02   com $2002           ;complement 1s in DAC output SOUND
E1D0 : 5A         decb                ;decr B
E1D1 : 26 E2      bne LE1B5           ;branch Z=0 SYN131
E1D3 : 39         rts                 ;return subroutine
;*************************************;
;SYNTH14 DAC clr, com, dec, com
;*************************************;
E1D4 : C6 01      ldab #$01           ;load B with 01h
E1D6 : 7F 20 02   clr $2002           ;clear DAC output SOUND
;SYN141 LE1D9:
E1D9 : BD E1 5F   jsr LE15F           ;jump sub PARAM13
E1DC : 96 81      ldaa $81            ;load A with addr 81
;SYN142 LE1DE:
E1DE : 20 00      bra LE1E0           ;branch always SYN143
;SYN143 LE1E0:
E1E0 : 4A         deca                ;decr A
E1E1 : 26 FB      bne LE1DE           ;branch Z=0 SYN142
E1E3 : 73 20 02   com $2002           ;complement 1s in DAC output SOUND
E1E6 : C5 01      bitb #$01           ;bit test B with 01h
E1E8 : 26 03      bne LE1ED           ;branch Z=0 SYN144
E1EA : 7A 20 02   dec $2002           ;decr value in DAC output SOUND
;SYN144 LE1ED:
E1ED : 17         tba                 ;transfer B to A
;SYN145 LE1EE:
E1EE : 4A         deca                ;decr A
E1EF : 26 FD      bne LE1EE           ;branch Z=0 SYN145
E1F1 : 73 20 02   com $2002           ;complement 1s in DAC output SOUND
E1F4 : 5C         incb                ;incr B
E1F5 : 26 E2      bne LE1D9           ;branch Z=0 SYN141
E1F7 : 39         rts                 ;return subroutine
;*************************************;
;Single Oscillator Sound Calls
;*************************************;
E1F8 : 01 03 FF 80 FF 00              ;VEC02X 
;*
;ATARI
E1FE : CE E1 F8   ldx #$E1F8          ;load X with E1F8h (VEC02X)
;PERK1
E201 : BD F8 57   jsr LF857           ;jump sub MOVE
E204 : 7E F8 70   jmp LF870           ;jump SYNTH6 SING
;
E207 : 48 03 01 0C FF 00              ;VEC06X 
;PERK$$
E20D : 86 FF      ldaa #$FF           ;load A with FFh
E20F : 97 89      staa $89            ;store A in addr 89 
E211 : CE E2 07   ldx #$E207          ;load X with E207h (VEC06X)
;PERK$1:
E214 : 8D EB      bsr LE201           ;branch sub PERK1
E216 : 8D 6E      bsr LE286           ;branch sub ECHO
E218 : 20 FA      bra LE214           ;branch always PERK$1
;
E21A : E0 01 02 10 FF 00              ;VEC08X
;HSTD
E220 : 86 FF      ldaa #$FF           ;load A with FFh
E222 : 97 89      staa $89            ;store A in addr 89
E224 : CE E2 1A   ldx #$E21A          ;load X with E21Ah (VEC08X)
E227 : 20 EB      bra LE214           ;branch always PERK$1
;
E229 : 20 03 FF 50 FF 00              ;VEC03X 
E22F : 50 03 01 20 FF 00              ;VEC04X
;SIREN
E235 : C6 2F      ldab #$2F           ;load B with 2Fh
E237 : D7 89      stab $89            ;store B in addr 89
;SIREN1
E239 : CE E2 29   ldx #$E229          ;load X with E229h (VEC03X)
E23C : 8D C3      bsr LE201           ;branch sub PERK1
E23E : CE E2 2F   ldx #$E22F          ;load X with E22Fh (VEC04X)
E241 : 8D BE      bsr LE201           ;branch sub PERK1
E243 : 5A         decb                ;decr B
E244 : 26 F3      bne LE239           ;branch Z=0 SIREN1
E246 : 39         rts                 ;return subroutine
;*************************************;
;Appear - Liten routine params
;*************************************;
;APPEAR
E247 : 86 FF      ldaa #$FF           ;load A with FFh
E249 : 97 97      staa $97            ;store A in addr 97
E24B : 86 60      ldaa #$60           ;load A with 60h
E24D : C6 FF      ldab #$FF           ;load B with FFh
;*************************************;
;Lightning+Appear Noise Routine
;*************************************;
;LITEN:
E24F : 97 96      staa $96            ;store A in addr 96 (LFREQ)
E251 : 86 FF      ldaa #$FF           ;load A with FFh (HIGHEST AMP)
E253 : B7 20 02   staa $2002          ;store A in DAC output SOUND
E256 : D7 92      stab $92            ;store B in addr 92 (CYCNT)
;LITE0:
E258 : D6 92      ldab $92            ;load B with addr 92 (CYCNT)
;LITE1:
E25A : 96 81      ldaa $81            ;load A with addr 81 (LO) (GET RANDOM)
E25C : 44         lsra                ;logic shift right A (bit7=0)
E25D : 44         lsra                ;logic shift right A (bit7=0)
E25E : 44         lsra                ;logic shift right A (bit7=0)
E25F : 98 81      eora $81            ;exclusive OR with addr 81 (LO)
E261 : 44         lsra                ;logic shift right A (bit7=0)
E262 : 76 00 80   ror $0080           ;rotate right in addr 0080 (bit7 = C then C = bit0) (HI)
E265 : 76 00 81   ror $0081           ;rotate right in addr 0081 (bit7 = C then C = bit0) (LO)
E268 : 24 03      bcc LE26D           ;branch C=0 SYN154(LITE2)
E26A : 73 20 02   com $2002           ;complement 1s in DAC output SOUND
;LITE2:
E26D : 96 96      ldaa $96            ;load A with addr 96 (LFREQ)(COUNT FREQ)
;LITE3:
E26F : 4A         deca                ;decr A
E270 : 26 FD      bne LE26F           ;branch Z=0 SYN155 (LITE3)
E272 : 5A         decb                ;decr B (COUNT CYCLES)
E273 : 26 E5      bne LE25A           ;branch Z=0 SYN153 (LITE1)
E275 : 96 96      ldaa $96            ;load A with addr 96 (LFREQ)
E277 : 9B 97      adda $97            ;add A with addr 97 (DFREQ)
E279 : 97 96      staa $96            ;store A in addr 96 (LFREQ)
E27B : 26 DB      bne LE258           ;branch Z=0 SYN152 (LITE0)
E27D : 39         rts                 ;return subroutine
;*************************************;
;Lightning 
;*************************************;
;LITE
E27E : 86 01      ldaa #$01           ;load A with 01h
E280 : 97 97      staa $97            ;store A in addr 97
E282 : C6 03      ldab #$03           ;load B with 03h
E284 : 20 C9      bra LE24F           ;branch always SYN151
;*************************************;
;Echo Function 
;*************************************;
;ECHO:
E286 : 96 89      ldaa $89            ;load A with addr 89
E288 : 80 08      suba #$08           ;subtract A with 08h
E28A : 2A 03      bpl LE28F           ;branch N=0 PRMSTK1
E28C : 97 89      staa $89            ;store A in addr 89
E28E : 39         rts                 ;return subroutine
;ECHO1
E28F : 32         pula                ;SP + 1 pull stack into A
E290 : 32         pula                ;SP + 1 pull stack into A
E291 : 39         rts                 ;return subroutine
;*************************************;
;Funny "Electric Sound"
;*************************************;
;* SUPPOSED TO GENERATE A PHASED OUTPUT AT
;* A CHANGING FREQUENCY. IT DOESN'T, AND
;* I'M NOT SURE EXACTLY WHAT IT DOES DO.
;* BEST LEAVE THIS ALONE.
;SND1
E292 : C6 11      ldab #$11    ;load B with 11h
E294 : D7 AC      stab $AC     ;store B in addr AC
;SND1$
E296 : 86 FE      ldaa #$FE    ;load A with FEh
E298 : 97 91      staa $91     ;store A in addr 91
;SND1$$
E29A : 86 9F      ldaa #$9F    ;load A with 9Fh
E29C : D6 AC      ldab $AC     ;load B with addr AC
;SND1A
E29E : CE 01 C0   ldx #$01C0    ;load X with 01C0h
;SND1B
E2A1 : 09         dex           ;decr X
E2A2 : 27 20      beq LE2C4     ;branch Z=1 SYN165
E2A4 : F7 00 90   stab $0090   ;store B in addr 0090
E2A7 : B7 20 02   staa $2002   ;store A in DAC output SOUND
;SND1C
E2AA : 09         dex           ;decr X
E2AB : 27 17      beq LE2C4     ;branch Z=1 SYN165
E2AD : 7A 00 90   dec $0090     ;decr value in addr 0090
E2B0 : 26 F8      bne LE2AA     ;branch Z=0 SYN163
E2B2 : 09         dex           ;decr X
E2B3 : 27 0F      beq LE2C4     ;branch Z=1 SYN165
E2B5 : D7 90      stab $90     ;store B in addr 90
E2B7 : 73 20 02   com $2002     ;complement 1s in DAC output SOUND
;SND1D
E2BA : 09         dex           ;decr X
E2BB : 27 07      beq LE2C4     ;branch Z=1 SYN165
E2BD : 7A 00 90   dec $0090     ;decr value in addr 0090
E2C0 : 26 F8      bne LE2BA     ;branch Z=0 SYN164
E2C2 : 20 DD      bra LE2A1     ;branch always SYN162
;SSND1E
E2C4 : D0 91      subb $91     ;subtract B with addr 91
E2C6 : C1 10      cmpb #$10    ;compare B with 10h
E2C8 : 22 D4      bhi LE29E     ;branch C=0 and Z=0 SYN161
E2CA : 39         rts           ;return subroutine
;*************************************;
;Hyper 
;*************************************;
;HYPER
E2CB : 4F         clra          ;clear A
E2CC : B7 20 02   staa $2002    ;store A in DAC output SOUND
E2CF : 97 87      staa $87      ;store A in addr 87 (TEMPA)(ZERO PHASE)
;HYPER1:
E2D1 : 4F         clra          ;clear A (ZERO TIME COUNTER)
;HYPER2:
E2D2 : 91 87      cmpa $87      ;compare A with addr 87 (TEMPA)
E2D4 : 26 03      bne LE2D9     ;branch Z=0 SYN173 (HYPER3)
E2D6 : 73 20 02   com $2002     ;complement 1s in DAC output SOUND (PHASE EDGE?)
;HYPER3:
E2D9 : C6 12      ldab #$12     ;load B with 12h (DELAY)
;HYPER4:
E2DB : 5A         decb          ;decr B
E2DC : 26 FD      bne LE2DB     ;branch Z=0 SYN174 (HYPER4)
E2DE : 4C         inca          ;incr A (ADVANCE TIME COUNTER)
E2DF : 2A F1      bpl LE2D2     ;branch N=0 SYN172 (HYPER2)
E2E1 : 73 20 02   com $2002     ;complement 1s in DAC output SOUND (CYCLE DONE?, CYCLE EDGE)
E2E4 : 7C 00 87   inc $0087     ;incr value in addr 0087 (TEMPA)(NEXT PHASE)
E2E7 : 2A E8      bpl LE2D1     ;branch N=0 SYN171 (HYPER1)(DONE?)
E2E9 : 39         rts           ;return subroutine
;*************************************;
;Scream 
;*************************************;
;SCREAM
E2EA : CE 00 90   ldx #$0090    ;load X with 0090h (#STABLE ZERO FREQS AND TIMES)
;SCREM1:
E2ED : 6F 00      clr $00,x     ;clear value in addr X+00h
E2EF : 08         inx           ;incr X
E2F0 : 8C 00 A0   cpx #$00A0    ;compare X with 00A0h (#SRMEND)
E2F3 : 26 F8      bne LE2ED     ;branch Z=0 SYN181 (SCREM1)
E2F5 : 86 18      ldaa #$18     ;load A with 18h (START FIRST ECHO)
E2F7 : 97 90      staa $90      ;store A in addr 90 (STABLE+FREQ)
;SCREM2:
E2F9 : CE 00 90   ldx #$0090    ;load X with 0090h (#STABLE INITIALIZE COUNTER)
E2FC : 86 C0      ldaa #$C0     ;load A with C0h (INITIALIZE AMPLITUDE)
E2FE : 97 87      staa $87      ;store A in addr 87 (TEMPA)
E300 : 5F         clrb          ;clear B (ZERO OUTPUT BUFFER)
;SCREM3:
E301 : A6 01      ldaa $01,x    ;load A with addr X + 01h (TIMER,X ADD FREQ TO TIMER)
E303 : AB 00      adda $00,x    ;add A with addr X+00h (FREQ)
E305 : A7 01      staa $01,x    ;store A in addr X + 01h (TIMER)
E307 : 2A 02      bpl LE30B     ;branch N=0 SYN184 (SCREM4)(ADD AMPLITUDE IF MINUS)
E309 : DB 87      addb $87      ;add B with addr 87 (TEMPA)
;SCREM4:
E30B : 74 00 87   lsr $0087     ;logic shift right (bit7=0) in addr 0087 (TEMPA)(DECAY AMPLITUDE)
E30E : 08         inx           ;incr X (NEXT ECHO)
E30F : 08         inx           ;incr X
E310 : 8C 00 A0   cpx #$00A0    ;compare X with 00A0h (#SRMEND LAST ECHO?)
E313 : 26 EC      bne LE301     ;branch Z=0 SYN183 (SCREM3)
E315 : F7 20 02   stab $2002    ;store B in DAC output SOUND
E318 : 7C 00 88   inc $0088     ;incr value in addr 0088 (TEMPB)(ADVANCE TIMER)
E31B : 26 DC      bne LE2F9     ;branch Z=0 SYN182 (SCREM2)
E31D : CE 00 90   ldx #$0090    ;load X with 0090h (#STABLE LOWER NON-ZERO FREQS)
E320 : 5F         clrb          ;clear B (ALL ZERO NOT FLAG)
;SCREM5:
E321 : A6 00      ldaa $00,x    ;load A with addr X+00h (FREQ)
E323 : 27 0B      beq LE330     ;branch Z=1 SYN187 (SCREM7)
E325 : 81 37      cmpa #$37     ;compare A with 37h
E327 : 26 04      bne LE32D     ;branch Z=0 SYN186 (SCREM6)
E329 : C6 19      ldab #$19     ;load B with 19h (START NEXT ECHO)
E32B : E7 02      stab $02,x    ;store B in addr X + 02h (FREQ+2)
;SCREM6:
E32D : 6A 00      dec $00,x     ;decr value in addr X+00h (FREQ)
E32F : 5C         incb          ;incr B (SET FLAG)
;SCREM7
E330 : 08         inx           ;incr X
E331 : 08         inx           ;incr X
E332 : 8C 00 A0   cpx #$00A0    ;compare X with 00A0h (#SRMEND)
E335 : 26 EA      bne LE321     ;branch Z=0 SYN185 (SCREM5)
E337 : 5D         tstb          ;test B=0 (DONE?)
E338 : 26 BF      bne LE2F9     ;branch Z=0 SYN182 (SCREM2)
E33A : 39         rts           ;return subroutine
;*************************************;
;Variable Duty Cycle Square Wave Routine
;*************************************;
;VARI
E33B : 96 98      ldaa $98      ;load A with addr 98 (VAMP)
E33D : B7 20 02   staa $2002    ;store A in DAC output SOUND
;VAR0:
E340 : 96 90      ldaa $90      ;load A with addr 90 (LOPER)
E342 : 97 99      staa $99      ;store A in addr 99 (LOCNT)
E344 : 96 91      ldaa $91      ;load A with addr 91 (HIPER)
E346 : 97 9A      staa $9A      ;store A in addr 9A (HICNT)
;V0:
E348 : DE 95      ldx $95       ;load X with addr 95 (SWPDT)
;V0LP:
E34A : 96 99      ldaa $99      ;load A with addr 99 (LOCNT) (LO CYCLE)
E34C : 73 20 02   com $2002     ;complement 1s in DAC output SOUND
;V1:
E34F : 09         dex           ;decr X
E350 : 27 10      beq LE362     ;branch Z=1 SYN196 (VSWEEP)
E352 : 4A         deca          ;decr A
E353 : 26 FA      bne LE34F     ;branch Z=0 SYN194 (V1)
E355 : 73 20 02   com $2002     ;complement 1s in DAC output SOUND
E358 : 96 9A      ldaa $9A      ;load A with addr 9A (HICNT) (HI CYCLE)
;V2:
E35A : 09         dex           ;decr X
E35B : 27 05      beq LE362     ;branch Z=1 SYN196 (VSWEEP)
E35D : 4A         deca          ;decr A
E35E : 26 FA      bne LE35A     ;branch Z=0 SYN195 (V2)
E360 : 20 E8      bra LE34A     ;branch always SYN193 (V0LP) (LOOP BACK)
;VSWEEP:
E362 : B6 20 02   ldaa $2002    ;load A with in DAC output SOUND
E365 : 2B 01      bmi LE368     ;branch N=1 SYN197 (VS1)
E367 : 43         coma          ;complement 1s A
;VS1
E368 : 8B 00      adda #$00     ;add A with 00h
E36A : B7 20 02   staa $2002    ;store A in DAC output SOUND
E36D : 96 99      ldaa $99      ;load A with addr 99 (LOCNT)
E36F : 9B 92      adda $92      ;add A with addr 92 (LODT)
E371 : 97 99      staa $99      ;store A in addr 99 (LOCNT)
E373 : 96 9A      ldaa $9A      ;load A with addr 9A (HICNT)
E375 : 9B 93      adda $93      ;add A with addr 93 (HIDT)
E377 : 97 9A      staa $9A      ;store A in addr 9A (HICNT)
E379 : 91 94      cmpa $94      ;compare A with addr 94 (HIEN)
E37B : 26 CB      bne LE348     ;branch Z=0 SYN192 (V0)
E37D : 96 97      ldaa $97      ;load A with addr 97 (LOMOD)
E37F : 27 06      beq LE387     ;branch Z=1 SYN198 (VARX)
E381 : 9B 90      adda $90      ;add A with addr 90 (LOPER)
E383 : 97 90      staa $90      ;store A in addr 90 (LOPER)
E385 : 26 B9      bne LE340     ;branch Z=0 SYN191 (VAR0)
;VARX:
E387 : 39         rts           ;return subroutine
;*************************************;
;Vari Vectors
;*************************************;
;VVECT1
E388 : 58 01 00 08 81 02 00 FF FF     ;
E391 : 48 91 00 FC 01 02 00 FC FF     ;
;*************************************;
;Turbo
;*************************************;
;TURBO
E39A : 86 20      ldaa #$20           ;load A with 20h
E39C : 97 92      staa $92            ;store A in addr 92 (CYCNT)
E39E : 97 95      staa $95            ;store A in addr 95 (NFFLG)
E3A0 : 86 01      ldaa #$01           ;load A with 01h
E3A2 : CE 00 01   ldx #$0001          ;load X with 0001h
E3A5 : C6 FF      ldab #$FF           ;load B with FFh
;*************************************;
;White Noise Routine 
;*************************************;
;*X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*
;NOISE
E3A7 : 97 90      staa $90           ;store A in addr 90 (DECAY)
;NOISE0:
E3A9 : DF 93      stx $93            ;store X in addr 93 (NFRQ1)
;NOIS00:
E3AB : D7 91      stab $91           ;store B in addr 91 (NAMP)
E3AD : D6 92      ldab $92           ;load B with addr 92 (CYCNT)
;NOISE1:
E3AF : 96 81      ldaa $81           ;load A with addr 81 (LO)(GET RANDOM BIT)
E3B1 : 44         lsra               ;logic shift right A (bit7=0)
E3B2 : 44         lsra               ;logic shift right A (bit7=0)
E3B3 : 44         lsra               ;logic shift right A (bit7=0)
E3B4 : 98 81      eora $81           ;exclusive OR with addr 81 (LO)
E3B6 : 44         lsra               ;logic shift right A (bit7=0)
E3B7 : 76 00 80   ror $0080          ;rotate right in addr 0080 (bit7 = C then C = bit0) (HI)
E3BA : 76 00 81   ror $0081          ;rotate right in addr 0081 (bit7 = C then C = bit0) (LO)
E3BD : 86 00      ldaa #$00          ;load A with 00h
E3BF : 24 02      bcc LE3C3          ;branch C=0 SYN204 (NOISE2)
E3C1 : 96 91      ldaa $91           ;load A with addr 91 (NAMP)
;NOISE2:
E3C3 : B7 20 02   staa $2002         ;store A in DAC output SOUND
E3C6 : DE 93      ldx $93            ;load X with addr 93 (NFRQ1)(INCREASING DELAY)
;NOISE3:
E3C8 : 09         dex                ;decr X
E3C9 : 26 FD      bne LE3C8          ;branch Z=0 SYN205 (NOISE3)
E3CB : 5A         decb               ;decr B (FIN CYCLE COUNT?)
E3CC : 26 E1      bne LE3AF          ;branch Z=0 SYN203 (NOISE1)(NO)
E3CE : D6 91      ldab $91           ;load B with addr 91 (NAMP)(DECAY AMP)
E3D0 : D0 90      subb $90           ;subtract B with addr 90 (DECAY) 
E3D2 : 27 09      beq LE3DD          ;branch Z=1 SYN206 (NSEND)
E3D4 : DE 93      ldx $93            ;load X with addr 93 (NFRQ1)(INC FREQ)
E3D6 : 08         inx                ;incr X
E3D7 : 96 95      ldaa $95           ;load A with addr 95 (NFFLG)(DECAY FREQ?)
E3D9 : 27 D0      beq LE3AB          ;branch Z=1 SYN202 (NOIS00)(NO)
E3DB : 20 CC      bra LE3A9          ;branch always SYN201(NOISE0)
;NSEND:
E3DD : 39         rts                ;return subroutine
;*************************************;
;GWave jump
;*************************************;
;GWJMP
E3DE : 8D 03      bsr LE3E3           ;branch sub GWLD
E3E0 : 7E F1 70   jmp LF170           ;jump GWAVE
;*************************************;
;GWAVE Loader #1 (2nd is F10A)
;*************************************;
;GWLD:
E3E3 : 16         tab                 ;transfer A to B (A unchanged)
E3E4 : 58         aslb                ;arith shift left B (bit0 is 0)
E3E5 : 1B         aba                 ;A = A + B
E3E6 : 1B         aba                 ;A = A + B
E3E7 : 1B         aba                 ;A = A + B
E3E8 : CE E4 49   ldx #$E449          ;load X with E449h (SVTAB SOUND VECTOR TABLE FDBdata5)
E3EB : BD E1 89   jsr LE189           ;jump sub ADDX
E3EE : A6 00      ldaa $00,x          ;load A with addr X+00h
E3F0 : 16         tab                 ;transfer A to B (A unchanged)
E3F1 : 84 0F      anda #$0F           ;and A with 0Fh
E3F3 : 97 92      staa $92            ;store A in addr 92
E3F5 : 54         lsrb                ;logic shift right B (bit7=0)
E3F6 : 54         lsrb                ;logic shift right B (bit7=0)
E3F7 : 54         lsrb                ;logic shift right B (bit7=0)
E3F8 : 54         lsrb                ;logic shift right B (bit7=0)
E3F9 : D7 91      stab $91            ;store B in addr 91
E3FB : A6 01      ldaa $01,x          ;load A with addr X + 01h
E3FD : 16         tab                 ;transfer A to B (A unchanged)
E3FE : 54         lsrb                ;logic shift right B (bit7=0)
E3FF : 54         lsrb                ;logic shift right B (bit7=0)
E400 : 54         lsrb                ;logic shift right B (bit7=0)
E401 : 54         lsrb                ;logic shift right B (bit7=0)
E402 : D7 93      stab $93            ;store B in addr 93
E404 : 84 0F      anda #$0F           ;and A with 0Fh
E406 : 97 87      staa $87            ;store A in addr 87
E408 : DF 8A      stx $8A             ;store X in addr 8A
E40A : CE F2 4F   ldx #$F24F          ;load X with F24Fh (GWVTAB CALC WAVEFORM ADDR FDBdata8)
;GWLD2:
E40D : 7A 00 87   dec $0087           ;decr value in addr 0087
E410 : 2B 08      bmi LE41A           ;branch N=1 PRM133
E412 : A6 00      ldaa $00,x          ;load A with addr X+00h
E414 : 4C         inca                ;incr A
E415 : BD E1 89   jsr LE189           ;jump sub ADDX
E418 : 20 F3      bra LE40D           ;branch always PRM132
;GWLD3:
E41A : DF 96      stx $96             ;store X in addr 96
E41C : BD F1 FA   jsr LF1FA           ;jump sub PARAM4
E41F : DE 8A      ldx $8A             ;load X with addr 8A
E421 : A6 02      ldaa $02,x          ;load A with addr X + 02h
E423 : 97 98      staa $98            ;store A in addr 98
E425 : BD F2 0C   jsr LF20C           ;jump sub PARAM5
E428 : DE 8A      ldx $8A             ;load X with addr 8A
E42A : A6 03      ldaa $03,x          ;load A with addr X + 03h
E42C : 97 94      staa $94            ;store A in addr 94
E42E : A6 04      ldaa $04,x          ;load A with addr X + 04h
E430 : 97 95      staa $95            ;store A in addr 95
E432 : A6 05      ldaa $05,x          ;load A with addr X + 05h
E434 : 16         tab                 ;transfer A to B
E435 : A6 06      ldaa $06,x          ;load A with addr X + 06h
E437 : CE E4 E3   ldx #$E4E3          ;load X with E4E3h (#GFRTAB)
E43A : BD E1 89   jsr LE189           ;jump sub ADDX
E43D : 17         tba                 ;transfer B to A
E43E : DF 99      stx $99             ;store X in addr 99
E440 : 7F 00 A1   clr $00A1           ;clear addr 00A1
E443 : BD E1 89   jsr LE189           ;jump sub ADDX
E446 : DF 9B      stx $9B             ;store X in addr 9B
E448 : 39         rts                 ;return subroutine
;*************************************;
;;SVTAB - GWAVE SOUND VECTOR TABLE -
;*************************************;
;b0 GECHO,GCCNT
;b1 GECDEC,WAVE#
;b2 PREDECAY FACTOR
;b3 GDFINC
;b4 VARIABLE FREQ COUNTER
;b5 FREQ PATTERN LENGTH
;b6 FREQ PATTERN OFFSET
; E4E3 + offset
E449 : 81 24 03 00 00 16 31           ;HBDV - E514
;$81,$24,0,0,0,22,HBDSND-GFRTAB 1
E450 : 41 45 00 00 00 0F 5B           ;HBEV - E53E
;$41,$45,0,0,0,15,HBESND-GFRTAB 6
E457 : F4 12 00 00 00 14 47           ;BBSV - E52A
;$F4,$12,$0,0,0,20,BBSND-GFRTAB 5
E45E : 21 3F 12 FE 01 20 1B           ; - E4FE
;
E465 : F8 5B 07 03 01 05 94           ; - E577
;
E46C : E3 12 03 00 02 06 9A           ; - E57D
;
E473 : 16 17 00 00 00 0A 10           ; - E4F3
;
E47A : A4 25 FE FE 01 02 FE           ; - E5E1
;
E481 : FE 1A 00 00 00 08 6E           ; - E551
;
E488 : 82 22 00 00 00 18 C6           ; SSPSND- E5A9
;
E48F : 21 30 00 FF 30 20 0D           ; - E4F0
;
E496 : B2 10 05 00 00 14 A4           ; YUKSND - E587
;
E49D : FF 1F 14 01 01 04 1C           ; - E4FF not valid
;
E4A4 : 1C 1F 00 FF FF 08 88           ; - E56B not valid
;
E4AB : 3D 5C 01 01 01 02 01           ; - E4E4 not valid
;
E4B2 : F4 15 00 00 00 08 1B           ; - E4FE
;
E4B9 : 72 28 03 00 02 07 9A           ; - E57D
;
E4C0 : D1 12 00 00 00 0C 00           ; BONSND - E4E3
;
E4C7 : 3A 1F 11 01 10 04 1C           ; - E4FF not valid
;
E4CE : 1F F6 FE FE FE 01 21           ; - E504 not valid
;
E4D5 : FF 15 01 0A 01 03 BC           ; - E59F 2nd part SP2SND
;
E4DC : FF 16 00 00 00 08 88           ; - E56B not valid
;*************************************;
;GFRTAB - GWAVE FREQ PATTERN TABLE
;*************************************;
;Bonus Sound
E4E3 : A0 98 90 88 80 78 70 68        ;BONSND
E4EB : 60 58 50 44 40                 ;
;Hundred Point Sound
E4F0 : 01 01 02 02 04 04 08 08        ;HBTSND
E4F8 : 10 10 30 60 C0 E0              ;
;Spinner Sound
E4FE : 01 01 02 02 03 04 05 06        ;SPNSND
E506 : 07 08 09 0A 0C 
;Turbine Start Up
E50B : 80 7C 78 74 70 74 78 7C        ;TRBPAT
E513 : 80                             ;
;Heartbeat Distorto 
E514 : 01 01 02 02 04 04 08 08        ;HBDSND
E51C : 10 20 28 30 38 40 48 50        ;
E524 : 60 70 80 A0 B0 C0              ;
;*SWEEP PATTERN
;SWPAT  EQU  *
;BigBen Sounds
E52A : 08 40 08 40 08 40 08 40 08 40  ;BBSND
E534 : 08 40 08 40 08 40 08 40 08 40  ;
;Heartbeat Echo
E53E : 01 02 04 08 09 0A 0B 0C        ;HBESND
E546 : 0E 0F 10 12 14 16              ;
;Spinner Sound "Drip"
E54C : 40                             ;SPNR
;Cool Downer
E54D : 10 08 01                       ;COOLDN 
;Start Distorto Sound
E551 : 01 01 01 01 02 02 03 03        ;STDSND 
E558 : 04 04 05 06 08 0A 0C 10        ;
E560 : 14 18 20 30 40 50 40 30        ;
E568 : 20 10 0C 0A 08 07 06 05        ;
E570 : 04 03 02 02 01 01 01           ;
;Ed's Sound 10
E577 : 07 08 09 0A 0C 08              ;ED10FP
;Ed's Sound 13
E57D : 17 18 19 1A 1B 1C 00 00 00 00  ;ED13FP - MATCH THE PROMS
;below from Robotron
E587 : 08 80 10 78 18 70 20 60 28 58 30 ;YUKSND
E592 : 50 40 48 00                    ;
;
E596 : 01 08 10 01 08 10 01 08 10     ;SP2SND
E59F : 01 08 10 01 08 10 01 08 10 00  ;
;
E5A9 : 10 20 40 10 20 40 10 20 40 10 20 40 ;SSPSND
E5B5 : 10 20 40 10 20 40 10 20 40 10 20 40 00 ;
;
E5C2 : 01 40 02 42 03 43 04 44 05 45 06 46 07 47 ;BWSSND
E5D0 : 08 48 09 49 0A 4A 0B 4B 00     ;
;
E5D9 : 01 02 03 04 05 06 07 08        ;??
;
E5E1 : 18 19                          ;??
;*************************************;
;zero padding
;*************************************;
E5E3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E5E7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E5EB : 00 00 00 00 "    "  db $00, $00, $00, $00
E5EF : 00 00 00 00 "    "  db $00, $00, $00, $00
E5F3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E5F7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E5FB : 00 00 00 00 "    "  db $00, $00, $00, $00
E5FF : 00 00 00 00 "    "  db $00, $00, $00, $00
E603 : 00 00 00 00 "    "  db $00, $00, $00, $00
E607 : 00 00 00 00 "    "  db $00, $00, $00, $00
E60B : 00 00 00 00 "    "  db $00, $00, $00, $00
E60F : 00 00 00 00 "    "  db $00, $00, $00, $00
E613 : 00 00 00 00 "    "  db $00, $00, $00, $00
E617 : 00 00 00 00 "    "  db $00, $00, $00, $00
E61B : 00 00 00 00 "    "  db $00, $00, $00, $00
E61F : 00 00 00 00 "    "  db $00, $00, $00, $00
E623 : 00 00 00 00 "    "  db $00, $00, $00, $00
E627 : 00 00 00 00 "    "  db $00, $00, $00, $00
E62B : 00 00 00 00 "    "  db $00, $00, $00, $00
E62F : 00 00 00 00 "    "  db $00, $00, $00, $00
E633 : 00 00 00 00 "    "  db $00, $00, $00, $00
E637 : 00 00 00 00 "    "  db $00, $00, $00, $00
E63B : 00 00 00 00 "    "  db $00, $00, $00, $00
E63F : 00 00 00 00 "    "  db $00, $00, $00, $00
E643 : 00 00 00 00 "    "  db $00, $00, $00, $00
E647 : 00 00 00 00 "    "  db $00, $00, $00, $00
E64B : 00 00 00 00 "    "  db $00, $00, $00, $00
E64F : 00 00 00 00 "    "  db $00, $00, $00, $00
E653 : 00 00 00 00 "    "  db $00, $00, $00, $00
E657 : 00 00 00 00 "    "  db $00, $00, $00, $00
E65B : 00 00 00 00 "    "  db $00, $00, $00, $00
E65F : 00 00 00 00 "    "  db $00, $00, $00, $00
E663 : 00 00 00 00 "    "  db $00, $00, $00, $00
E667 : 00 00 00 00 "    "  db $00, $00, $00, $00
E66B : 00 00 00 00 "    "  db $00, $00, $00, $00
E66F : 00 00 00 00 "    "  db $00, $00, $00, $00
E673 : 00 00 00 00 "    "  db $00, $00, $00, $00
E677 : 00 00 00 00 "    "  db $00, $00, $00, $00
E67B : 00 00 00 00 "    "  db $00, $00, $00, $00
E67F : 00 00 00 00 "    "  db $00, $00, $00, $00
E683 : 00 00 00 00 "    "  db $00, $00, $00, $00
E687 : 00 00 00 00 "    "  db $00, $00, $00, $00
E68B : 00 00 00 00 "    "  db $00, $00, $00, $00
E68F : 00 00 00 00 "    "  db $00, $00, $00, $00
E693 : 00 00 00 00 "    "  db $00, $00, $00, $00
E697 : 00 00 00 00 "    "  db $00, $00, $00, $00
E69B : 00 00 00 00 "    "  db $00, $00, $00, $00
E69F : 00 00 00 00 "    "  db $00, $00, $00, $00
E6A3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6A7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6AB : 00 00 00 00 "    "  db $00, $00, $00, $00
E6AF : 00 00 00 00 "    "  db $00, $00, $00, $00
E6B3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6B7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6BB : 00 00 00 00 "    "  db $00, $00, $00, $00
E6BF : 00 00 00 00 "    "  db $00, $00, $00, $00
E6C3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6C7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6CB : 00 00 00 00 "    "  db $00, $00, $00, $00
E6CF : 00 00 00 00 "    "  db $00, $00, $00, $00
E6D3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6D7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6DB : 00 00 00 00 "    "  db $00, $00, $00, $00
E6DF : 00 00 00 00 "    "  db $00, $00, $00, $00
E6E3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6E7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6EB : 00 00 00 00 "    "  db $00, $00, $00, $00
E6EF : 00 00 00 00 "    "  db $00, $00, $00, $00
E6F3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6F7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E6FB : 00 00 00 00 "    "  db $00, $00, $00, $00
E6FF : 00 00 00 00 "    "  db $00, $00, $00, $00
E703 : 00 00 00 00 "    "  db $00, $00, $00, $00
E707 : 00 00 00 00 "    "  db $00, $00, $00, $00
E70B : 00 00 00 00 "    "  db $00, $00, $00, $00
E70F : 00 00 00 00 "    "  db $00, $00, $00, $00
E713 : 00 00 00 00 "    "  db $00, $00, $00, $00
E717 : 00 00 00 00 "    "  db $00, $00, $00, $00
E71B : 00 00 00 00 "    "  db $00, $00, $00, $00
E71F : 00 00 00 00 "    "  db $00, $00, $00, $00
E723 : 00 00 00 00 "    "  db $00, $00, $00, $00
E727 : 00 00 00 00 "    "  db $00, $00, $00, $00
E72B : 00 00 00 00 "    "  db $00, $00, $00, $00
E72F : 00 00 00 00 "    "  db $00, $00, $00, $00
E733 : 00 00 00 00 "    "  db $00, $00, $00, $00
E737 : 00 00 00 00 "    "  db $00, $00, $00, $00
E73B : 00 00 00 00 "    "  db $00, $00, $00, $00
E73F : 00 00 00 00 "    "  db $00, $00, $00, $00
E743 : 00 00 00 00 "    "  db $00, $00, $00, $00
E747 : 00 00 00 00 "    "  db $00, $00, $00, $00
E74B : 00 00 00 00 "    "  db $00, $00, $00, $00
E74F : 00 00 00 00 "    "  db $00, $00, $00, $00
E753 : 00 00 00 00 "    "  db $00, $00, $00, $00
E757 : 00 00 00 00 "    "  db $00, $00, $00, $00
E75B : 00 00 00 00 "    "  db $00, $00, $00, $00
E75F : 00 00 00 00 "    "  db $00, $00, $00, $00
E763 : 00 00 00 00 "    "  db $00, $00, $00, $00
E767 : 00 00 00 00 "    "  db $00, $00, $00, $00
E76B : 00 00 00 00 "    "  db $00, $00, $00, $00
E76F : 00 00 00 00 "    "  db $00, $00, $00, $00
E773 : 00 00 00 00 "    "  db $00, $00, $00, $00
E777 : 00 00 00 00 "    "  db $00, $00, $00, $00
E77B : 00 00 00 00 "    "  db $00, $00, $00, $00
E77F : 00 00 00 00 "    "  db $00, $00, $00, $00
E783 : 00 00 00 00 "    "  db $00, $00, $00, $00
E787 : 00 00 00 00 "    "  db $00, $00, $00, $00
E78B : 00 00 00 00 "    "  db $00, $00, $00, $00
E78F : 00 00 00 00 "    "  db $00, $00, $00, $00
E793 : 00 00 00 00 "    "  db $00, $00, $00, $00
E797 : 00 00 00 00 "    "  db $00, $00, $00, $00
E79B : 00 00 00 00 "    "  db $00, $00, $00, $00
E79F : 00 00 00 00 "    "  db $00, $00, $00, $00
E7A3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7A7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7AB : 00 00 00 00 "    "  db $00, $00, $00, $00
E7AF : 00 00 00 00 "    "  db $00, $00, $00, $00
E7B3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7B7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7BB : 00 00 00 00 "    "  db $00, $00, $00, $00
E7BF : 00 00 00 00 "    "  db $00, $00, $00, $00
E7C3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7C7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7CB : 00 00 00 00 "    "  db $00, $00, $00, $00
E7CF : 00 00 00 00 "    "  db $00, $00, $00, $00
E7D3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7D7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7DB : 00 00 00 00 "    "  db $00, $00, $00, $00
E7DF : 00 00 00 00 "    "  db $00, $00, $00, $00
E7E3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7E7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7EB : 00 00 00 00 "    "  db $00, $00, $00, $00
E7EF : 00 00 00 00 "    "  db $00, $00, $00, $00
E7F3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7F7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E7FB : 00 00 00 00 "    "  db $00, $00, $00, $00
E7FF : 00 00 00 00 "    "  db $00, $00, $00, $00
E803 : 00 00 00 00 "    "  db $00, $00, $00, $00
E807 : 00 00 00 00 "    "  db $00, $00, $00, $00
E80B : 00 00 00 00 "    "  db $00, $00, $00, $00
E80F : 00 00 00 00 "    "  db $00, $00, $00, $00
E813 : 00 00 00 00 "    "  db $00, $00, $00, $00
E817 : 00 00 00 00 "    "  db $00, $00, $00, $00
E81B : 00 00 00 00 "    "  db $00, $00, $00, $00
E81F : 00 00 00 00 "    "  db $00, $00, $00, $00
E823 : 00 00 00 00 "    "  db $00, $00, $00, $00
E827 : 00 00 00 00 "    "  db $00, $00, $00, $00
E82B : 00 00 00 00 "    "  db $00, $00, $00, $00
E82F : 00 00 00 00 "    "  db $00, $00, $00, $00
E833 : 00 00 00 00 "    "  db $00, $00, $00, $00
E837 : 00 00 00 00 "    "  db $00, $00, $00, $00
E83B : 00 00 00 00 "    "  db $00, $00, $00, $00
E83F : 00 00 00 00 "    "  db $00, $00, $00, $00
E843 : 00 00 00 00 "    "  db $00, $00, $00, $00
E847 : 00 00 00 00 "    "  db $00, $00, $00, $00
E84B : 00 00 00 00 "    "  db $00, $00, $00, $00
E84F : 00 00 00 00 "    "  db $00, $00, $00, $00
E853 : 00 00 00 00 "    "  db $00, $00, $00, $00
E857 : 00 00 00 00 "    "  db $00, $00, $00, $00
E85B : 00 00 00 00 "    "  db $00, $00, $00, $00
E85F : 00 00 00 00 "    "  db $00, $00, $00, $00
E863 : 00 00 00 00 "    "  db $00, $00, $00, $00
E867 : 00 00 00 00 "    "  db $00, $00, $00, $00
E86B : 00 00 00 00 "    "  db $00, $00, $00, $00
E86F : 00 00 00 00 "    "  db $00, $00, $00, $00
E873 : 00 00 00 00 "    "  db $00, $00, $00, $00
E877 : 00 00 00 00 "    "  db $00, $00, $00, $00
E87B : 00 00 00 00 "    "  db $00, $00, $00, $00
E87F : 00 00 00 00 "    "  db $00, $00, $00, $00
E883 : 00 00 00 00 "    "  db $00, $00, $00, $00
E887 : 00 00 00 00 "    "  db $00, $00, $00, $00
E88B : 00 00 00 00 "    "  db $00, $00, $00, $00
E88F : 00 00 00 00 "    "  db $00, $00, $00, $00
E893 : 00 00 00 00 "    "  db $00, $00, $00, $00
E897 : 00 00 00 00 "    "  db $00, $00, $00, $00
E89B : 00 00 00 00 "    "  db $00, $00, $00, $00
E89F : 00 00 00 00 "    "  db $00, $00, $00, $00
E8A3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8A7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8AB : 00 00 00 00 "    "  db $00, $00, $00, $00
E8AF : 00 00 00 00 "    "  db $00, $00, $00, $00
E8B3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8B7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8BB : 00 00 00 00 "    "  db $00, $00, $00, $00
E8BF : 00 00 00 00 "    "  db $00, $00, $00, $00
E8C3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8C7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8CB : 00 00 00 00 "    "  db $00, $00, $00, $00
E8CF : 00 00 00 00 "    "  db $00, $00, $00, $00
E8D3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8D7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8DB : 00 00 00 00 "    "  db $00, $00, $00, $00
E8DF : 00 00 00 00 "    "  db $00, $00, $00, $00
E8E3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8E7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8EB : 00 00 00 00 "    "  db $00, $00, $00, $00
E8EF : 00 00 00 00 "    "  db $00, $00, $00, $00
E8F3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8F7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E8FB : 00 00 00 00 "    "  db $00, $00, $00, $00
E8FF : 00 00 00 00 "    "  db $00, $00, $00, $00
E903 : 00 00 00 00 "    "  db $00, $00, $00, $00
E907 : 00 00 00 00 "    "  db $00, $00, $00, $00
E90B : 00 00 00 00 "    "  db $00, $00, $00, $00
E90F : 00 00 00 00 "    "  db $00, $00, $00, $00
E913 : 00 00 00 00 "    "  db $00, $00, $00, $00
E917 : 00 00 00 00 "    "  db $00, $00, $00, $00
E91B : 00 00 00 00 "    "  db $00, $00, $00, $00
E91F : 00 00 00 00 "    "  db $00, $00, $00, $00
E923 : 00 00 00 00 "    "  db $00, $00, $00, $00
E927 : 00 00 00 00 "    "  db $00, $00, $00, $00
E92B : 00 00 00 00 "    "  db $00, $00, $00, $00
E92F : 00 00 00 00 "    "  db $00, $00, $00, $00
E933 : 00 00 00 00 "    "  db $00, $00, $00, $00
E937 : 00 00 00 00 "    "  db $00, $00, $00, $00
E93B : 00 00 00 00 "    "  db $00, $00, $00, $00
E93F : 00 00 00 00 "    "  db $00, $00, $00, $00
E943 : 00 00 00 00 "    "  db $00, $00, $00, $00
E947 : 00 00 00 00 "    "  db $00, $00, $00, $00
E94B : 00 00 00 00 "    "  db $00, $00, $00, $00
E94F : 00 00 00 00 "    "  db $00, $00, $00, $00
E953 : 00 00 00 00 "    "  db $00, $00, $00, $00
E957 : 00 00 00 00 "    "  db $00, $00, $00, $00
E95B : 00 00 00 00 "    "  db $00, $00, $00, $00
E95F : 00 00 00 00 "    "  db $00, $00, $00, $00
E963 : 00 00 00 00 "    "  db $00, $00, $00, $00
E967 : 00 00 00 00 "    "  db $00, $00, $00, $00
E96B : 00 00 00 00 "    "  db $00, $00, $00, $00
E96F : 00 00 00 00 "    "  db $00, $00, $00, $00
E973 : 00 00 00 00 "    "  db $00, $00, $00, $00
E977 : 00 00 00 00 "    "  db $00, $00, $00, $00
E97B : 00 00 00 00 "    "  db $00, $00, $00, $00
E97F : 00 00 00 00 "    "  db $00, $00, $00, $00
E983 : 00 00 00 00 "    "  db $00, $00, $00, $00
E987 : 00 00 00 00 "    "  db $00, $00, $00, $00
E98B : 00 00 00 00 "    "  db $00, $00, $00, $00
E98F : 00 00 00 00 "    "  db $00, $00, $00, $00
E993 : 00 00 00 00 "    "  db $00, $00, $00, $00
E997 : 00 00 00 00 "    "  db $00, $00, $00, $00
E99B : 00 00 00 00 "    "  db $00, $00, $00, $00
E99F : 00 00 00 00 "    "  db $00, $00, $00, $00
E9A3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9A7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9AB : 00 00 00 00 "    "  db $00, $00, $00, $00
E9AF : 00 00 00 00 "    "  db $00, $00, $00, $00
E9B3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9B7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9BB : 00 00 00 00 "    "  db $00, $00, $00, $00
E9BF : 00 00 00 00 "    "  db $00, $00, $00, $00
E9C3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9C7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9CB : 00 00 00 00 "    "  db $00, $00, $00, $00
E9CF : 00 00 00 00 "    "  db $00, $00, $00, $00
E9D3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9D7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9DB : 00 00 00 00 "    "  db $00, $00, $00, $00
E9DF : 00 00 00 00 "    "  db $00, $00, $00, $00
E9E3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9E7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9EB : 00 00 00 00 "    "  db $00, $00, $00, $00
E9EF : 00 00 00 00 "    "  db $00, $00, $00, $00
E9F3 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9F7 : 00 00 00 00 "    "  db $00, $00, $00, $00
E9FB : 00 00 00 00 "    "  db $00, $00, $00, $00
E9FF : 00 00 00 00 "    "  db $00, $00, $00, $00
EA03 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA07 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA0B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA0F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA13 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA17 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA1B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA1F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA23 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA27 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA2B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA2F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA33 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA37 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA3B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA3F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA43 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA47 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA4B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA4F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA53 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA57 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA5B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA5F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA63 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA67 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA6B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA6F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA73 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA77 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA7B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA7F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA83 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA87 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA8B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA8F : 00 00 00 00 "    "  db $00, $00, $00, $00
EA93 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA97 : 00 00 00 00 "    "  db $00, $00, $00, $00
EA9B : 00 00 00 00 "    "  db $00, $00, $00, $00
EA9F : 00 00 00 00 "    "  db $00, $00, $00, $00
EAA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAAB : 00 00 00 00 "    "  db $00, $00, $00, $00
EAAF : 00 00 00 00 "    "  db $00, $00, $00, $00
EAB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EABB : 00 00 00 00 "    "  db $00, $00, $00, $00
EABF : 00 00 00 00 "    "  db $00, $00, $00, $00
EAC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EACB : 00 00 00 00 "    "  db $00, $00, $00, $00
EACF : 00 00 00 00 "    "  db $00, $00, $00, $00
EAD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EADB : 00 00 00 00 "    "  db $00, $00, $00, $00
EADF : 00 00 00 00 "    "  db $00, $00, $00, $00
EAE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAEB : 00 00 00 00 "    "  db $00, $00, $00, $00
EAEF : 00 00 00 00 "    "  db $00, $00, $00, $00
EAF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EAFB : 00 00 00 00 "    "  db $00, $00, $00, $00
EAFF : 00 00 00 00 "    "  db $00, $00, $00, $00
EB03 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB07 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB0B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB0F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB13 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB17 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB1B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB1F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB23 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB27 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB2B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB2F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB33 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB37 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB3B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB3F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB43 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB47 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB4B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB4F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB53 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB57 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB5B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB5F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB63 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB67 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB6B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB6F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB73 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB77 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB7B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB7F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB83 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB87 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB8B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB8F : 00 00 00 00 "    "  db $00, $00, $00, $00
EB93 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB97 : 00 00 00 00 "    "  db $00, $00, $00, $00
EB9B : 00 00 00 00 "    "  db $00, $00, $00, $00
EB9F : 00 00 00 00 "    "  db $00, $00, $00, $00
EBA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBAB : 00 00 00 00 "    "  db $00, $00, $00, $00
EBAF : 00 00 00 00 "    "  db $00, $00, $00, $00
EBB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBBB : 00 00 00 00 "    "  db $00, $00, $00, $00
EBBF : 00 00 00 00 "    "  db $00, $00, $00, $00
EBC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBCB : 00 00 00 00 "    "  db $00, $00, $00, $00
EBCF : 00 00 00 00 "    "  db $00, $00, $00, $00
EBD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBDB : 00 00 00 00 "    "  db $00, $00, $00, $00
EBDF : 00 00 00 00 "    "  db $00, $00, $00, $00
EBE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBEB : 00 00 00 00 "    "  db $00, $00, $00, $00
EBEF : 00 00 00 00 "    "  db $00, $00, $00, $00
EBF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EBFB : 00 00 00 00 "    "  db $00, $00, $00, $00
EBFF : 00 00 00 00 "    "  db $00, $00, $00, $00
EC03 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC07 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC0B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC0F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC13 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC17 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC1B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC1F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC23 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC27 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC2B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC2F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC33 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC37 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC3B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC3F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC43 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC47 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC4B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC4F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC53 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC57 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC5B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC5F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC63 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC67 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC6B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC6F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC73 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC77 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC7B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC7F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC83 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC87 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC8B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC8F : 00 00 00 00 "    "  db $00, $00, $00, $00
EC93 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC97 : 00 00 00 00 "    "  db $00, $00, $00, $00
EC9B : 00 00 00 00 "    "  db $00, $00, $00, $00
EC9F : 00 00 00 00 "    "  db $00, $00, $00, $00
ECA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECAB : 00 00 00 00 "    "  db $00, $00, $00, $00
ECAF : 00 00 00 00 "    "  db $00, $00, $00, $00
ECB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECBB : 00 00 00 00 "    "  db $00, $00, $00, $00
ECBF : 00 00 00 00 "    "  db $00, $00, $00, $00
ECC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECCB : 00 00 00 00 "    "  db $00, $00, $00, $00
ECCF : 00 00 00 00 "    "  db $00, $00, $00, $00
ECD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECDB : 00 00 00 00 "    "  db $00, $00, $00, $00
ECDF : 00 00 00 00 "    "  db $00, $00, $00, $00
ECE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECEB : 00 00 00 00 "    "  db $00, $00, $00, $00
ECEF : 00 00 00 00 "    "  db $00, $00, $00, $00
ECF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
ECFB : 00 00 00 00 "    "  db $00, $00, $00, $00
ECFF : 00 00 00 00 "    "  db $00, $00, $00, $00
ED03 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED07 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED0B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED0F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED13 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED17 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED1B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED1F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED23 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED27 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED2B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED2F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED33 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED37 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED3B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED3F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED43 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED47 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED4B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED4F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED53 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED57 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED5B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED5F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED63 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED67 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED6B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED6F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED73 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED77 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED7B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED7F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED83 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED87 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED8B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED8F : 00 00 00 00 "    "  db $00, $00, $00, $00
ED93 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED97 : 00 00 00 00 "    "  db $00, $00, $00, $00
ED9B : 00 00 00 00 "    "  db $00, $00, $00, $00
ED9F : 00 00 00 00 "    "  db $00, $00, $00, $00
EDA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDAB : 00 00 00 00 "    "  db $00, $00, $00, $00
EDAF : 00 00 00 00 "    "  db $00, $00, $00, $00
EDB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDBB : 00 00 00 00 "    "  db $00, $00, $00, $00
EDBF : 00 00 00 00 "    "  db $00, $00, $00, $00
EDC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDCB : 00 00 00 00 "    "  db $00, $00, $00, $00
EDCF : 00 00 00 00 "    "  db $00, $00, $00, $00
EDD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDDB : 00 00 00 00 "    "  db $00, $00, $00, $00
EDDF : 00 00 00 00 "    "  db $00, $00, $00, $00
EDE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDEB : 00 00 00 00 "    "  db $00, $00, $00, $00
EDEF : 00 00 00 00 "    "  db $00, $00, $00, $00
EDF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EDFB : 00 00 00 00 "    "  db $00, $00, $00, $00
EDFF : 00 00 00 00 "    "  db $00, $00, $00, $00
EE03 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE07 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE0B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE0F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE13 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE17 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE1B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE1F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE23 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE27 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE2B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE2F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE33 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE37 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE3B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE3F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE43 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE47 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE4B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE4F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE53 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE57 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE5B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE5F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE63 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE67 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE6B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE6F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE73 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE77 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE7B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE7F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE83 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE87 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE8B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE8F : 00 00 00 00 "    "  db $00, $00, $00, $00
EE93 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE97 : 00 00 00 00 "    "  db $00, $00, $00, $00
EE9B : 00 00 00 00 "    "  db $00, $00, $00, $00
EE9F : 00 00 00 00 "    "  db $00, $00, $00, $00
EEA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEAB : 00 00 00 00 "    "  db $00, $00, $00, $00
EEAF : 00 00 00 00 "    "  db $00, $00, $00, $00
EEB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEBB : 00 00 00 00 "    "  db $00, $00, $00, $00
EEBF : 00 00 00 00 "    "  db $00, $00, $00, $00
EEC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EECB : 00 00 00 00 "    "  db $00, $00, $00, $00
EECF : 00 00 00 00 "    "  db $00, $00, $00, $00
EED3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EED7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEDB : 00 00 00 00 "    "  db $00, $00, $00, $00
EEDF : 00 00 00 00 "    "  db $00, $00, $00, $00
EEE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEEB : 00 00 00 00 "    "  db $00, $00, $00, $00
EEEF : 00 00 00 00 "    "  db $00, $00, $00, $00
EEF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EEFB : 00 00 00 00 "    "  db $00, $00, $00, $00
EEFF : 00         db $00
;*************************************;
; CHECKSUM (decr X from FFFF to F000, starts at Motorola Vectors)
;*************************************;
;CKSUM
EF00 : CE FF FF   ldx #$FFFF    ;load X with FFFFh - INDEX TO END OF ROM
EF03 : 5F         clrb          ;clear B - ZERO CHECKSUM
;CKSUM1 LEF04:
EF04 : E9 00      adcb $00,x    ;B = Carry + B + value in addr X+00h - ADD IN PROGRAM BYTE
EF06 : 09         dex           ;decr X - TO NEXT BYTE
EF07 : 8C F0 00   cpx #$F000    ;compare X with F000h - DONE YET?
EF0A : 26 F8      bne LEF04     ;branch Z=0 CKSUM1 - NOPE
EF0C : E7 00      stab $00,x    ;store B in addr X+00h - SAVE CHECKSUM AT BEGINNING
EF0E : 3E         wai           ;wait interrupt - TURN OFF LEDS
;
;*************************************;
;zero padding
;*************************************;
EF0F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF13 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF17 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF1B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF1F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF23 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF27 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF2B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF2F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF33 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF37 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF3B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF3F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF43 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF47 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF4B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF4F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF53 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF57 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF5B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF5F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF63 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF67 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF6B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF6F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF73 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF77 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF7B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF7F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF83 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF87 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF8B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF8F : 00 00 00 00 "    "  db $00, $00, $00, $00
EF93 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF97 : 00 00 00 00 "    "  db $00, $00, $00, $00
EF9B : 00 00 00 00 "    "  db $00, $00, $00, $00
EF9F : 00 00 00 00 "    "  db $00, $00, $00, $00
EFA3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFA7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFAB : 00 00 00 00 "    "  db $00, $00, $00, $00
EFAF : 00 00 00 00 "    "  db $00, $00, $00, $00
EFB3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFB7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFBB : 00 00 00 00 "    "  db $00, $00, $00, $00
EFBF : 00 00 00 00 "    "  db $00, $00, $00, $00
EFC3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFC7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFCB : 00 00 00 00 "    "  db $00, $00, $00, $00
EFCF : 00 00 00 00 "    "  db $00, $00, $00, $00
EFD3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFD7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFDB : 00 00 00 00 "    "  db $00, $00, $00, $00
EFDF : 00 00 00 00 "    "  db $00, $00, $00, $00
EFE3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFE7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFEB : 00 00 00 00 "    "  db $00, $00, $00, $00
EFEF : 00 00 00 00 "    "  db $00, $00, $00, $00
EFF3 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFF7 : 00 00 00 00 "    "  db $00, $00, $00, $00
EFFB : 00 00 00 00 "    "  db $00, $00, $00, $00
EFFF : 00         db $00
;*************************************;
;
;*************************************;
F000 : D2                             ;checksum
;*************************************;
; RESET org F001
;*************************************; 
F001 : 0F         sei                 ;set interrupt mask I=1  
F002 : 8E 00 FF   lds #$00FF          ;load stack pointer with 00FFh (ENDRAM)
F005 : CE 20 00   ldx #$2000          ;load X with 2000h PIA addr (2002 is DAC output SOUND)
F008 : 6F 01      clr $01,x           ;clear X+01h (2001) PIA CR port A
F00A : 6F 03      clr $03,x           ;clear X+03h (2003) PIA CR port B
F00C : 86 FF      ldaa #$FF           ;load A with FFh
F00E : A7 02      staa $02,x          ;store A in addr X+02h (2002) PIA port B out (DAC sound)
F010 : 6F 00      clr $00,x           ;clr (00) X+00h (2000) PIA port A in (sound select)
F012 : 86 37      ldaa #$37           ;load A with 37h
F014 : A7 01      staa $01,x          ;store A in addr X+01h (2001) PIA CR port A
F016 : 86 3C      ldaa #$3C           ;load A with 3Ch
F018 : A7 03      staa $03,x          ;store A in addr X+03h (2003) PIA CR port B
F01A : CE 00 FF   ldx #$00FF          ;load X with 00FFh
;RSTCLR
F01D : 6F 00      clr $00,x           ;clear addr X+00h
F01F : 09         dex                 ;decr X
F020 : 26 FB      bne LF01D           ;branch Z=0 RSTCLR
;
F022 : 7A 00 81   dec $0081           ;decr value in addr 0081
F025 : 7A 00 80   dec $0080           ;decr value in addr 0080
F028 : 7A 00 80   dec $0080           ;decr value in addr 0080
F02B : 0E         cli                 ;clear interrupt I=0
;
F02C : 20 09      bra LF037           ;branch always STDBY
;*************************************;
;IRQ init,  called by MOTVECT 
;*************************************; 
;IRQ
F02E : 8E 00 FF   lds #$00FF          ;load stack pointer with 00FFh (ENDRAM)
F031 : B6 20 00   ldaa $2000          ;load A with addr 2000
F034 : 0E         cli                 ;clear interrupt I=0
F035 : 8D 20      bsr LF057           ;branch sub IRQ1
;STDBY
F037 : 20 FE      bra LF037           ;branch always STDBY
;*************************************;
;Diagnostic Processing
;*************************************; 
;NMI
F039 : 0F         sei                 ;set interrupt mask I=1  
F03A : 8E 00 FF   lds #$00FF          ;load stack pointer with 00FFh (ENDRAM)
F03D : 4F         clra                ;clear A
;NMI1 
F03E : CE FF FF   ldx #$FFFF          ;load X with FFFFh
F041 : 5F         clrb                ;clear A
;NMI2 
F042 : E9 00      adcb $00,x          ;B = C+B + addr X+00h
F044 : 09         dex                 ;decr X
F045 : 8C F0 00   cpx #$F000          ;compare X with F000h (addr of upper ROM)
F048 : 26 F8      bne LF042           ;branch Z=0 NMI2
F04A : E1 00      cmpb $00,x          ;compare B with addr X+00h
F04C : 27 01      beq LF04F           ;branch Z=1 NMI3
F04E : 3E         wai                 ;wait interrupt, PC+1
;NMI3
F04F : 4C         inca                ;incr A
F050 : 36         psha                ;push A into stack then SP - 1
F051 : BD F0 57   jsr LF057           ;jump sub IRQ1
F054 : 32         pula                ;SP + 1 pull stack into A
F055 : 20 E7      bra LF03E           ;branch always NMI1
;*************************************;
;IRQ continued
;*************************************; 
;IRQ1 - entry point from IRQ init
F057 : 81 01      cmpa #$01           ;compare A with 01h
F059 : 25 4A      bcs LF0A5           ;branch C=1 IRQX
F05B : 22 03      bhi LF060           ;branch C+Z=0 IRQ2
F05D : 7E F0 EC   jmp LF0EC           ;jump IRQPRM
;IRQ2 
F060 : 81 19      cmpa #$19           ;compare A with 19h
F062 : 22 08      bhi LF06C           ;branch C+Z=0 IRQ3
F064 : 80 02      suba #$02           ;subtract A with 02h
F066 : BD F1 0A   jsr LF10A           ;jump sub GWLD
F069 : 7E F1 70   jmp LF170           ;jump GWAVE
;IRQ3 
F06C : 81 2F      cmpa #$2F           ;compare A with 2Fh
F06E : 22 05      bhi LF075           ;branch C+Z=0 IRQ4
F070 : 80 1A      suba #$1A           ;subtract A with 1Ah
F072 : 7E E3 DE   jmp LE3DE           ;jump GWJMP
;IRQ4
F075 : 81 52      cmpa #$52           ;compare A with 52h
F077 : 22 0D      bhi LF086           ;branch C+Z=0 IRQ5
F079 : 80 30      suba #$30           ;subtract A with 30h
F07B : CE F0 A6   ldx #$F0A6          ;load X with F0A6h (JMPTBL1)
F07E : 48         asla                ;arith shift left A 
F07F : BD E1 89   jsr LE189           ;jump sub ADDX
F082 : EE 00      ldx $00,x           ;load X with addr X+00h
F084 : 6E 00      jmp $00,x           ;jump addr X+00h
;IRQ5
F086 : 81 54      cmpa #$54           ;compare A with 54h
F088 : 22 1B      bhi LF0A5           ;branch C+Z=0 IRQX
F08A : CE 00 90   ldx #$0090          ;load X with 0090h
F08D : DF 8E      stx $8E             ;store X in addr 8E
F08F : 81 53      cmpa #$53           ;compare A with 53h
F091 : 26 05      bne LF098           ;branch Z=0 IRQ6
F093 : CE E3 88   ldx #$E388          ;load X with E388h (VVECT1)
F096 : 20 03      bra LF09B           ;branch always IRQ7
;IRQ6
F098 : CE E3 91   ldx #$E391          ;load X with E391h (VVECT1)
;IRQ7
F09B : C6 09      ldab #$09           ;load B with 09h
F09D : BD F2 3B   jsr LF23B           ;jump sub TRANS
F0A0 : BD E3 3B   jsr LE33B           ;jump sub VARI
;IRQW
F0A3 : 20 FE      bra LF0A3           ;branch always IRQW
;IRQX
F0A5 : 39         rts                 ;return subroutine
;*************************************;
;IRQ jump table to locations x35
;*************************************;
;JMPTBL
F0A6 : F5 4E                          ;CANNON
F0A8 : F5 59                          ;SMLCAN
F0AA : F5 F3                          ;CLRDAC 
F0AC : F6 B5                          ;THNDR
F0AE : F5 6C                          ;FNFRQ2
F0B0 : F5 70                          ;THRUST
F0B2 : F5 74                          ;FNFRQ4
F0B4 : F6 BD                          ;THNDR5
F0B6 : F6 C5                          ;THNDR4
F0B8 : F7 44                          ;WHISTL
F0BA : F7 BB                          ;KNOCK
F0BC : F8 26                          ;ORRRR
F0BE : F8 38                          ;SQRT
F0C0 : F8 CB                          ;LITE
F0C2 : F9 3F                          ;CDR
F0C4 : E1 98                          ;SYNTH12
F0C6 : F9 00                          ;WINGUP
F0C8 : F9 04                          ;CLIP
F0CA : F9 08                          ;CLOP
F0CC : F9 0C                          ;WINGDN
F0CE : FF 94                          ;ZIREN
F0D0 : E2 20                          ;HSTD
F0D2 : E2 35                          ;SIREN
F0D4 : E2 47                          ;APPEAR
F0D6 : E2 7E                          ;LITE
F0D8 : E1 6D                          ;TILT
F0DA : E1 B0                          ;SYNTH13
F0DC : E1 D4                          ;SYNTH14
F0DE : E1 FE                          ;ATARI
F0E0 : E2 0D                          ;PERK$$
F0E2 : E2 92                          ;SND1
F0E4 : E2 CB                          ;HYPER
F0E6 : E2 EA                          ;SCREAM
F0E8 : E3 9A                          ;TURBO
F0EA : E0 CD                          ;ORGNT1
;*************************************;
;IRQ processing and data
;*************************************;
;IRQPRM
F0EC : CE F1 02   ldx #$F102          ;load X with F102h (IRQDAT)
;IRQPRM1
F0EF : A6 00      ldaa $00,x          ;load A with addr X+00h
F0F1 : 26 01      bne LF0F4           ;branch Z=0 IRQPRM2
F0F3 : 39         rts                 ;return subroutine
;IRQPRM2
F0F4 : 81 01      cmpa #$01           ;compare A with 01h
F0F6 : 27 07      beq LF0FF           ;branch Z=1 IRQPRM3
F0F8 : DF 82      stx $82             ;store X in addr 82
F0FA : BD F0 57   jsr LF057           ;jump sub IRQ1
F0FD : DE 82      ldx $82             ;load X with addr 82
;IRQPRM3
F0FF : 08         inx                 ;incr X
F100 : 20 ED      bra LF0EF           ;branch always IRQPRM1
;
;IRQDAT - possible sound select values?
F102 : 03 06 0A 04 0E 05 09 00
;*************************************;
;GWAVE Loader #2
;*************************************;
;GWLD
F10A : 16         tab                 ;transfer A to B (A unchanged)(MULKT BY 7)
F10B : 58         aslb                ;arith shift left B (bit0 is 0)
F10C : 1B         aba                 ;A = A + B
F10D : 1B         aba                 ;A = A + B
F10E : 1B         aba                 ;A = A + B
F10F : CE F3 87   ldx #$F387          ;load X with F387h (SVTAB)(SOUND VECTOR TABLE)
F112 : BD E1 89   jsr LE189           ;jump sub ADDX
F115 : A6 00      ldaa $00,x          ;load A with at addr X+00h
F117 : 16         tab                 ;transfer A to B (A unchanged)
F118 : 84 0F      anda #$0F           ;and A with 0Fh
F11A : 97 92      staa $92            ;store A in addr 92 (GCCNT)(GET CYCLE COUNT)
F11C : 54         lsrb                ;logic shift right B (bit7=0)
F11D : 54         lsrb                ;logic shift right B (bit7=0)
F11E : 54         lsrb                ;logic shift right B (bit7=0)
F11F : 54         lsrb                ;logic shift right B (bit7=0)
F120 : D7 91      stab $91            ;store B in addr 91 (GECHO)(GET #ECHOS)
F122 : A6 01      ldaa $01,x          ;load A with at addr X+00h
F124 : 16         tab                 ;transfer A to B (A unchanged)
F125 : 54         lsrb                ;logic shift right B (bit7=0)
F126 : 54         lsrb                ;logic shift right B (bit7=0)
F127 : 54         lsrb                ;logic shift right B (bit7=0)
F128 : 54         lsrb                ;logic shift right B (bit7=0)
F129 : D7 93      stab $93            ;store B in addr 93 (GECDEC)
F12B : 84 0F      anda #$0F           ;and A with 0Fh (WAVE #)
F12D : 97 87      staa $87            ;store A in addr 87 (TEMPA)(SAVE)
F12F : DF 8A      stx $8A             ;store X in addr 8A (TEMPX)(SAVE INDEX)
F131 : CE F2 4F   ldx #$F24F          ;load X with F24Fh (GWVTAB)(CALC WAVEFORM ADDR)
;GWLD2:
F134 : 7A 00 87   dec $0087           ;decr value in addr 0087 (TEMPA)(WAVE FROM #)
F137 : 2B 08      bmi LF141           ;branch N=1 GWLD3(FINIS)
F139 : A6 00      ldaa $00,x          ;load A with at addr X+00h
F13B : 4C         inca                ;incr A
F13C : BD E1 89   jsr LE189           ;jump sub ADDX top mem
F13F : 20 F3      bra LF134           ;branch always GWLD2
;PGWLD3
F141 : DF 96      stx $96             ;store X in addr 96 (GWFRM)
F143 : BD F1 FA   jsr LF1FA           ;jump sub WVTRAN(XSFER WAVE TO RAM)
F146 : DE 8A      ldx $8A             ;load X with addr 8A (TEMPX)(RESTORE INDEX)
F148 : A6 02      ldaa $02,x          ;load A with addr X+02h (GET PREDECAY)
F14A : 97 98      staa $98            ;store A in addr 98 (PREDECA)
F14C : BD F2 0C   jsr LF20C           ;jump sub WVDECA (DECAY IT)
F14F : DE 8A      ldx $8A             ;load X with addr 8A (TEMPX)
F151 : A6 03      ldaa $03,x          ;load A with addr X+03h (GET FREQ INC)
F153 : 97 94      staa $94            ;store A in addr 94 (GDFINC)
F155 : A6 04      ldaa $04,x          ;load A with addr X+04h (GET DELTA FREQ COUNT)
F157 : 97 95      staa $95            ;store A in addr 95 (GDCNT)
F159 : A6 05      ldaa $05,x          ;load A with addr X+05h (GET PATTERN COUNT)
F15B : 16         tab                 ;transfer A to B (SAVE)
F15C : A6 06      ldaa $06,x          ;load A with addr X+06h (PATTERN OFFSET)
F15E : CE F4 2F   ldx #$F42F          ;load X with F42Fh (#GFRTAB)
F161 : BD E1 89   jsr LE189           ;jump sub ADDX
F164 : 17         tba                 ;transfer B to A (GET PATTERN LENGTH)
F165 : DF 99      stx $99             ;store X in addr 99 (GWFRQ)(FREQ TABLE ADDR)
F167 : 7F 00 A1   clr $00A1           ;clear addr 00A1 (FOFSET)
F16A : BD E1 89   jsr LE189           ;jump sub ADDX
F16D : DF 9B      stx $9B             ;store X in addr 9B (FRQEND)
F16F : 39         rts                 ;return subroutine
;*************************************;
;GWAVE ROUTINE 
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
F170 : 96 91      ldaa $91            ;load A with addr 91 (GECHO)
F172 : 97 A0      staa $A0            ;store A in addr A0 (GECNT)
;GWT4
F174 : DE 99      ldx $99             ;load X with addr 99 (GWFRQ)
F176 : DF 8C      stx $8C             ;store X in addr 8C (XPLAY)
;GPLAY:
F178 : DE 8C      ldx $8C             ;load X with addr 8C (XPLAY)(GET NEW PERIOD)
F17A : A6 00      ldaa $00,x          ;load A with addr X+00h 
F17C : 9B A1      adda $A1            ;add A with addr A1 (FOFSET)
F17E : 97 9F      staa $9F            ;store A in addr 9F (GPER)
F180 : 9C 9B      cpx $9B             ;compare X with addr 9B (FRQEND)
F182 : 27 26      beq LF1AA           ;branch Z=1 GEND (FINISH ON ZERO)
F184 : D6 92      ldab $92            ;load B with addr 92 (GCCNT)(CYCLE COUNT)
F186 : 08         inx                 ;incr X
F187 : DF 8C      stx $8C             ;store X in addr 8C (XPLAY)
;GOUT:
F189 : CE 00 A2   ldx #$00A2          ;load X with 00A2 (#GWTAB)(SETUP WAVEFORM POINTER)
;GOUTLP:
F18C : 96 9F      ldaa $9F            ;load A with addr 9F (GPER)
;GPRLP:
F18E : 4A         deca                ;decr A (WAIT FOR PERIOD)
F18F : 26 FD      bne LF18E           ;branch Z=0 GPRLP
F191 : A6 00      ldaa $00,x          ;load A with addr  X+00h (OUTPUT SOUND)
F193 : B7 20 02   staa $2002          ;store A in DAC output SOUND
;GPR1
F196 : 08         inx                 ;incr X
F197 : 9C 9D      cpx $9D             ;compare X with addr 9D (WVEND)(END OF WAVE?)
F199 : 26 F1      bne LF18C           ;branch Z=0 GOUTLP
F19B : 5A         decb                ;decr B
F19C : 27 DA      beq LF178           ;branch Z=1 GPLAY
F19E : 08         inx                 ;incr X
F19F : 09         dex                 ;decr X
F1A0 : 08         inx                 ;incr X
F1A1 : 09         dex                 ;decr X
F1A2 : 08         inx                 ;incr X
F1A3 : 09         dex                 ;decr X
F1A4 : 08         inx                 ;incr X
F1A5 : 09         dex                 ;decr X
F1A6 : 01         nop                 ;
F1A7 : 01         nop                 ;
F1A8 : 20 DF      bra LF189           ;branch always GOUT(SYNC 36)
;GEND 
F1AA : 96 93      ldaa $93            ;load A with at addr 93 (GECDEC)
F1AC : 8D 5E      bsr LF20C           ;branch sub WVDECA
;GEND40
F1AE : 7A 00 A0   dec $00A0           ;decr value in addr 00A0 (GECNT)(ECHO ON?)
F1B1 : 26 C1      bne LF174           ;branch Z=0 GWT4(YES)
;GEND50
F1B3 : 96 94      ldaa $94            ;load A with addr 94 (GDFINC)(CONTINUE FOR FREQ MOD SOUNDS)
F1B5 : 27 42      beq LF1F9           ;branch Z=1 GEND1(NO)
F1B7 : 7A 00 95   dec $0095           ;decr value in addr 0095 (GDCNT)(DELTA FREQ OVER?)
F1BA : 27 3D      beq LF1F9           ;branch Z=1 GEND1(YES...)
F1BC : 9B A1      adda $A1            ;add A with addr A1 (FOFSET)(UPDATE FREQ OFFSET)
;GEND60
F1BE : 97 A1      staa $A1            ;store A in addr A1 (FOFSET)
;GEND61
F1C0 : DE 99      ldx $99             ;load X with addr 99 (GWFRQ)(GET INDEX)
F1C2 : 5F         clrb                ;clear B (START FOUND FLAG INIT CLEAR)
;GW0:
F1C3 : 96 A1      ldaa $A1            ;load A with addr A1 (FOFSET)(INC OR DEC?)
F1C5 : 7D 00 94   tst $0094           ;test value in addr 0094 (GDFINC)
F1C8 : 2B 06      bmi LF1D0           ;branch N=1 GW1(DEC)
F1CA : AB 00      adda $00,x          ;add A with addr X+00h (INC)
F1CC : 25 08      bcs LF1D6           ;branch C=1 GW2(CARRY=OVERFLOW)
F1CE : 20 0B      bra LF1DB           ;branch always GW2A
;GW1:
F1D0 : AB 00      adda $00,x          ;add A with addr X+00h
F1D2 : 27 02      beq LF1D6           ;branch Z=1 GW2
F1D4 : 25 05      bcs LF1DB           ;branch C=1 GW2A
;GW2 :
F1D6 : 5D         tstb                ;test B (FOUND START YET?)
F1D7 : 27 08      beq LF1E1           ;branch Z=1 GW2B(NO)
F1D9 : 20 0F      bra LF1EA           ;branch always GW3(YES, THIS IS THE END)
;GW2A:
F1DB : 5D         tstb                ;test B
F1DC : 26 03      bne LF1E1           ;branch Z=0 GW2B(ALREADY FOUND START)
F1DE : DF 99      stx $99             ;store X in addr 99 (GWFRQ)(FOUND START)
F1E0 : 5C         incb                ;incr B
;GW2B:
F1E1 : 08         inx                 ;incr X
F1E2 : 9C 9B      cpx $9B             ;compare X with in 9B (FRQEND)
F1E4 : 26 DD      bne LF1C3           ;branch Z=0 GW0(NOT OVER YET)
F1E6 : 5D         tstb                ;test B (FOUND START?)
F1E7 : 26 01      bne LF1EA           ;branch Z=0 GW3(YES)
F1E9 : 39         rts                 ;return subroutine (ALL OVER)
;GW3
F1EA : DF 9B      stx $9B             ;store X in addr 9B (FRQEND)
F1EC : 96 93      ldaa $93            ;load A with addr 93 (GECDEC)(RE:XSFER WAVE?)
F1EE : 27 06      beq LF1F6           ;branch Z=1 GEND0(NO)
F1F0 : 8D 08      bsr LF1FA           ;branch sub WVTRAN(XSFER WAVE)
F1F2 : 96 98      ldaa $98            ;load A with addr 98 (PRDECA)
F1F4 : 8D 16      bsr LF20C           ;branch sub WVDECA
;GEND0:
F1F6 : 7E F1 70   jmp LF170           ;jump GWAVE
;GEND1:
F1F9 : 39         rts                 ;return subroutine (TERMINATE)
;*************************************;
;Wave Transfer Routine
;*************************************;
;WVTRAN:
F1FA : CE 00 A2   ldx #$00A2          ;load X with 00A2h (#GWTAB)
F1FD : DF 8E      stx $8E             ;store X in addr 8E (XPTR)
F1FF : DE 96      ldx $96             ;load X with addr 96 (GWFRM)
F201 : E6 00      ldab $00,x          ;load B with addr X+00h (GET WAVE LENGTH)
F203 : 08         inx                 ;incr X
F204 : BD F2 3B   jsr LF23B           ;jump sub TRANS
F207 : DE 8E      ldx $8E             ;load X with addr 8E (XPTR)
F209 : DF 9D      stx $9D             ;store X in addr 9D (WVEND)(GET END ADDR)
F20B : 39         rts                 ;return subroutine
;*************************************;
;Wave Decay Routine
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
F20C : 4D         tsta                ;test A
F20D : 27 2B      beq LF23A           ;branch Z=1 WVDCX(NODECAY)
F20F : DE 96      ldx $96             ;load X with addr 96 (GWFRM)(ROM WAVE INDEX)
F211 : DF 8C      stx $8C             ;store X in addr 8C (XPLAY) 
F213 : CE 00 A2   ldx #$00A2          ;load X with 00A2h (#GWTAB)
F216 : 97 88      staa $88            ;store A in addr 88 (TEMPB)(DECAY FACTOR)
;WVDLP:
F218 : DF 8E      stx $8E             ;store X in addr 8E (XPTR)
F21A : DE 8C      ldx $8C             ;load X with addr 8C (XPLAY)
F21C : D6 88      ldab $88            ;load B with addr 88 (TEMPB)
F21E : D7 87      stab $87            ;store B in addr 87 (TEMPA)(DECAY FACTOR TEMP)
F220 : E6 01      ldab $01,x          ;load B with addr X + 01h (OFFSET FOR WAVE LENGTH)
F222 : 54         lsrb                ;logic shift right B (bit7=0)
F223 : 54         lsrb                ;logic shift right B (bit7=0)
F224 : 54         lsrb                ;logic shift right B (bit7=0)
F225 : 54         lsrb                ;logic shift right B (bit7=0) (CALC 1/16TH)
F226 : 08         inx                 ;incr X
F227 : DF 8C      stx $8C             ;store X in addr 8C (XPLAY)
F229 : DE 8E      ldx $8E             ;load X with addr 8E (XPTR)
F22B : A6 00      ldaa $00,x          ;load A with addr X+00h
;WVDLP1:
F22D : 10         sba                 ;A = A - B (B unchanged) (DECAY)
F22E : 7A 00 87   dec $0087           ;decr value in addr 0087 (TEMPA)
F231 : 26 FA      bne LF22D           ;branch Z=0 WVDLP1
F233 : A7 00      staa $00,x          ;store A in addr X+00h 
F235 : 08         inx                 ;incr X
F236 : 9C 9D      cpx $9D             ;compare X with addr 9D (WVEND)(END OF WAVE?)
F238 : 26 DE      bne LF218           ;branch Z=0 WVDLP(NO)
;WVDCX:
F23A : 39         rts                 ;return subroutine
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
F23B : 36         psha                ;push A into stack then SP - 1
;TRANS1:
F23C : A6 00      ldaa $00,x          ;load A in addr X+00h
F23E : DF 8C      stx $8C             ;store X in addr 0C (XPLAY)
F240 : DE 8E      ldx $8E             ;load X from value in addr 8E (XPTR)
F242 : A7 00      staa $00,x          ;store A in addr X+00h
F244 : 08         inx                 ;incr X
F245 : DF 8E      stx $8E             ;store X in addr 8E (XPTR)
F247 : DE 8C      ldx $8C             ;load X from value in addr 8C (XPLAY)
F249 : 08         inx                 ;incr X
F24A : 5A         decb                ;decr B
F24B : 26 EF      bne LF23C           ;branch Z=0 TRANS1
F24D : 32         pula                ;SP + 1 pull stack into A
F24E : 39         rts                 ;return subroutine
;*************************************;
;GWave table, 1st byte wavelength 
;*************************************;
;GWVTAB
F24F : 08                             ;GS2
F250 : 7F D9 FF D9 7F 24 00 24        ;
;
F258 : 08                             ;GSSQR2
F259 : 00 40 80 00 FF 00 80 40        ;
;
F261 : 10                             ;GS1
F262 : 7F B0 D9 F5 FF F5 D9 B0        ;
F26B : 7F 4E 24 09 00 09 24 4E        ;
;
F272 : 10                             ;GS12
F273 : 7F C5 EC E7 BF 8D 6D 6A        ;
F27C : 7F 94 92 71 40 17 12 39        ;
;
F283 : 10                             ;GSQ22
F284 : FF FF FF FF 00 00 00 00        ;
F28C : FF FF FF FF 00 00 00 00        ;
;
F294 : 48                             ;GS72
F295 : 8A 95 A0 AB B5 BF C8 D1        ;
F29D : E1 E8 EE F3 F7 FB FD FE        ;
F2A6 : FF FE FD FB F7 F3 EE E8        ;
F2AE : E1 DA D1 C8 BF B5 AB A0        ;
F2B6 : 95 8A 7F 75 6A 5F 54 4A        ;
F2BE : 40 37 2E 25 1E 17 11 0C        ;
F2C6 : 08 04 02 01 00 01 02 04        ;
FC2E : 08 0C 11 17 1E 25 2E 37        ;
FCD6 : 40 4A 54 5F 6A 75 7F           ;
;
F2DD : 10                             ;GS1.7
F2DE : 59 7B 98 AC B3 AC 98 7B        ;
F2E6 : 59 37 19 06 00 06 19 37        ;
;
F2EE : 08                             ;GSQ2
F2EF : FF FF FF FF 00 00 00 00        ;
 ;
F2F7 : 10                             ;GS1234
F2F8 : 76 FF B8 D0 9D E6 6A 82        ;
F300 : 76 EA 81 86 4E 9C 32 63        ;
;
F308 : 10                             ;MW1
F309 : 00 F4 00 E8 00 DC 00 E2        ;
F311 : 00 DC 00 E8 00 F4 00 00        ;
;
F319 : 1C                             ;(28)
F31A : 80 40 29 1B 10 09 06 04        ;
F322 : 07 0C 12 1E 30 49 A4 C9        ;
F32A : DF EB F6 FB FF FF FB F5        ;
F332 : EA DD C7 9B                    ;

F336 : 0C                             ;(12)
F337 : 00 50 60 B0 20 20 F0 90        ;
F33F : 80 C0 50 70 10 3C              ;
;
F345 : 10                             ;(14/16)
F346 : 17 3F 70 92 95 7F 7C 7E        ;
F34E : 8A BE E7 EF C5 7F (08 00)      ; from next table
;
F354 : 08                             ;(8)
F355 : 00 20 40 60 80 A0 C0 E0        ;
;
F35D : 08                             ;(8)
F35E : FF DF BF 9F 7F 5F 3F 1F        ;
;
F366 : 20                             ;(32)
F367 : 4C 45 41 41 43 47 77 87        ;
F36F : 90 97 A1 A7 AE B5 B8 BC        ;
F377 : BE BF C1 C2 C2 C2 C1 BF        ;
F37F : BE BB B6 B1 AC A4 9E 93        ;
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
F387 : 03 15 11 FF 00 0D 26           ; =F455 : SPNSND
F38E : 14 0A 00 00 00 04 1E           ; =F44D : UNKN1
F395 : 14 0A 00 00 00 04 22           ; =F451 : UNKN2
F39C : 14 02 09 00 00 09 33           ; =F462 : UNKN3
F3A3 : 11 02 00 00 00 28 3C           ; =F46B : UNKN4
F3AA : 1F 0B 09 00 00 0F 64           ; =F493 : UNKN5
F3B1 : 18 00 05 02 01 20 73           ; =F4A2 : UNKN6 
F3B8 : 11 02 00 00 00 18 93           ; =F4C2 : UNKN7
F3BF : 15 02 05 00 00 16 AB           ; =F4DA : UNKN8
F3C6 : 81 02 00 00 00 04 C1           ; =F4F0 : UNKN9
F3CD : 81 24 00 00 00 16 E2           ; =F511 (HBDV)
F3D4 : 11 15 00 00 00 63 1E           ; =F44D : UNKN1 
F3DB : 81 29 00 00 00 16 E2           ; =F511 : HBDV
F3E2 : 11 11 00 00 00 63 1E           ; =F44D : UNKN1 
F3E9 : 16 02 00 00 00 7C 64           ; =F493 : UNKN5 
F3F0 : 6A 10 02 00 02 06 14           ; =F443 : ED13FP
F3F7 : F1 19 01 00 00 20 6A           ; =F4AD : UNKN10
F3FE : 52 36 00 00 00 10 E2           ; =F511 : HBDV
F405 : A3 19 05 01 01 10 F8           ; =F527 : GVA1
F40C : 16 82 03 0E 01 0E F8           ; =F527 : GVA1
F413 : 63 26 06 00 00 10 F8           ; =F527 : GVA1
F41A : 23 15 00 02 07 03 1E           ; =F44D : UNKN1
F421 : 11 05 11 01 0F 01 00           ; =F42F : DP1V
F428 : F1 19 00 00 00 0E 1E           ; =F44D : UNKN1
;*************************************;
;GWAVE FREQ PATTERN TABLE
;*************************************; 
;GFRTAB 
;BigBen Sounds
F42F : 08 40 08 40 08 40 08 40 08 40  ;BBSND
F439 : 08 40 08 40 08 40 08 40 08 40  ;
;Ed's Sound 13
F443 : 17 18 19 1A 1B 1C              ;ED13FP
F449 : 00 00 00 00                    ;FILLER (MATCH THE PROMS)
;
F44D : 20 18 20 01                    ;UNKN1
F451 : 01 30 28 30                    ;UNKN2
;Spinner Sound
F455 : 01 01 02 02 03 04 05 06        ;SPNSND
F45D : 07 08 09 0A 0C                 ;
;
F462 : 20 10 0C 0A 08 07 06 05 04     ;UNKN3
;
F46B : 60 45 28 21 5D 42 25 1E        ;UNKN4
F473 : 58 3D 20 19 60 38 28 14        ;
F47B : 4C 31 14 0D 40 25 08 01        ;
F483 : 4C 31 14 0D 40 25 08 01        ;
F48B : 4C 31 14 0D 40 25 08 01        ;
;
F493 : 0A 09 08 07 06 05 06 07        ;UNKN5
F49B : 08 09 0A 0A 0A 0A 0A           ;
;
F4A2 : 20 1F 1E 1D 1C 1B 1A 19        ; UNKN6
F4AA : 18 17 16                       ;
;
F4AD : 15 14 13 12 11 10 0F 0E        ;UNKN10
F4B5 : 0D 0C 0B 0A 09 08 07 06        ;
F4BD : 05 05 05 05 05                 ;
;
F4C2 : 60 45 28 21 58 3D 20 19        ;UNKN7
F4CA : 4C 31 14 0D 40 25 08 01        ;
F4D2 : 34 1C 08 01 28 15 08 01        ;
;
F4DA : 1E 02 1B 04 23 07 1D 01        ;UNKN8
F4E2 : 22 03 19 09 1F 06 1A 05        ;
F4EA : 1C 0B 21 08 20 0A              ;
;
F4F0 : 60 45 28 21                    ;UNKN9
;Ed's Sound 10
F4F4 : 07 08 09 0A 0C 08              ;ED10FP
;
F4FA : 01 40 02 42 03 43              ;
F500 : 04 44 05 45 06 46 07 47        ;
F508 : 08 48 09 49 0A 4A 0B 4B        ;
F510 : 00                             ;
;Heartbeat Distorto 
F511 : 01 01 02 02 04 04 08 08        ;HBDSND
F519 : 10 20 28 30 38 40 48 50        ;
F521 : 60 70 80 A0 B0 C0              ;
;
F527 : 14 18 20 30 40 50 40 30        ;GVA1
F52F : 20 10 0C 0A 08 07 06 05        ;
;
F537 : 0C 08 80 10 78 18 70 20        ;
F53F : 60 28 58 30 50 40 10 08        ;
F547 : 01                             ;
;*************************************;
;FNOISE Calling Routine
;*************************************;
;FCB CANNON
F548 : 01 01 01 FF 03 E8              ;FCBCAN
;CANNON
F54E : CE F5 48   ldx #$F548          ;load X with F548h (FCBCAN)
F551 : 20 09      bra LF55C           ;branch always FNOSLD
;*
;FCB SMALL CANNNON
F553 : 01 01 01 40 10 00              ;FCBSML
;SMLCAN
F559 : CE F5 53   ldx #$F553          ;load X with F553h (FCBSML)
;*
;Filtered Noise Loader
;FNOSLD
F55C : A6 00      ldaa $00,x          ;load A with at addr X+00h
F55E : 97 96      staa $96            ;store A in addr 96
F560 : A6 01      ldaa $01,x          ;load A with addr X + 01h
F562 : 97 97      staa $97            ;store A in addr 97
F564 : A6 02      ldaa $02,x          ;load A with addr X + 02h  
F566 : E6 03      ldab $03,x          ;load B with addr X + 03h
F568 : EE 04      ldx $04,x           ;load X with addr X + 04h
F56A : 20 0F      bra LF57B           ;branch always FNOISE
;*
;FNFRQ2
F56C : C6 02      ldab #$02           ;load B with 02h
F56E : 20 06      bra LF576           ;branch always FNRPRM
;*
;THRUST
F570 : C6 03      ldab #$03           ;load B with 03h
F572 : 20 02      bra LF576           ;branch always FNRPRM
;
;FNFRQ4
F574 : C6 04      ldab #$04           ;load B with 04h
;FNRPRM
F576 : 4F         clra                ;clear A
F577 : 97 97      staa $97            ;store A in addr 97
F579 : 97 96      staa $96            ;store A in addr 96
;*************************************;
;Filtered Noise Routine
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE:
F57B : 97 95      staa $95            ;store A in addr 95 (FDFLG)
F57D : D7 90      stab $90            ;store B in addr 90 (FMAX)
F57F : DF 93      stx $93             ;store X in addr 93 (SAMPC)
F581 : 7F 00 92   clr $0092           ;clear addr 0092 (FLO)
;FNOIS0:
F584 : DE 93      ldx $93             ;load X with addr 93 
F586 : B6 20 02   ldaa $2002          ;load A from DAC output SOUND (SAMPC)
;FNOIS1:
F589 : 16         tab                 ;transfer A to B (NEXT RANDOM NUMBER)
F58A : 54         lsrb                ;logic shift right B (bit7=0)
F58B : 54         lsrb                ;logic shift right B (bit7=0)
F58C : 54         lsrb                ;logic shift right B (bit7=0)
F58D : D8 81      eorb $81            ;exclusive OR with addr 81 (LO)
F58F : 54         lsrb                ;logic shift right B (bit7=0)
F590 : 76 00 80   ror $0080           ;rotate right in addr 0080 (HI)
F593 : 76 00 81   ror $0081           ;rotate right in addr 0081 (LO)
F596 : D6 90      ldab $90            ;load B with addr 90 (FMAX)(SET FREQ)
F598 : 7D 00 96   tst $0096           ;test value in addr 0096=00 (N=0(MSB), Z=1) (DSFLG)
F59B : 27 04      beq LF5A1           ;branch Z=1 FNOIS2
F59D : D4 80      andb $80            ;and B with addr 80 (HI)(DISTORT FREQ)
F59F : DB 97      addb $97            ;add B with addr 97 <- not in ROM15
;FNOIS2:
F5A1 : D7 91      stab $91            ;store B in addr 91 (FHI)
F5A3 : D6 92      ldab $92            ;load B with addr 92 (FLO)
F5A5 : 91 81      cmpa $81            ;compare A with addr 81 (LO)
F5A7 : 22 12      bhi LF5BB           ;branch C=0 and Z=0 FNOIS4
;FNOIS3:
F5A9 : 09         dex                 ;decr X (SLOPE UP)
F5AA : 27 26      beq LF5D2           ;branch Z=1 FNOIS6
F5AC : B7 20 02   staa $2002          ;store A in DAC output SOUND
F5AF : DB 92      addb $92            ;add B with addr 92 (FLO)
F5B1 : 99 91      adca $91            ;add C+A + addr 91 (FHI)
F5B3 : 25 16      bcs LF5CB           ;branch C=1 FNOIS5
F5B5 : 91 81      cmpa $81            ;compare A with addr 81 (LO)
F5B7 : 23 F0      bls LF5A9           ;branch C+Z=1 FNOIS3
F5B9 : 20 10      bra LF5CB           ;branch always FNOIS5
;FNOIS4:
F5BB : 09         dex                 ;decr X (SLOPE DOWN)
F5BC : 27 14      beq LF5D2           ;branch Z=1 FNOIS6
F5BE : B7 20 02   staa $2002          ;store A in DAC output SOUND
F5C1 : D0 92      subb $92            ;sub B - addr 92 (FLO)
F5C3 : 92 91      sbca $91            ;sub C-A - addr 91 (FHI)
F5C5 : 25 04      bcs LF5CB           ;branch C=1 FNOIS5
F5C7 : 91 81      cmpa $81            ;compare A with addr 81 (LO)
F5C9 : 22 F0      bhi LF5BB           ;branch C+Z=0 FNOIS4
;FNOIS5:
F5CB : 96 81      ldaa $81            ;load A with addr 81 (LO)
F5CD : B7 20 02   staa $2002          ;store A in DAC output SOUND
F5D0 : 20 B7      bra LF589           ;branch always FNOIS1
;FNOIS6:
F5D2 : D6 95      ldab $95            ;load B with addr 95 (FDFLG)
F5D4 : 27 B3      beq LF589           ;branch Z=1 FNOIS1
F5D6 : 96 90      ldaa $90            ;load A with addr 90 (FMAX)(DECAY MAX FREQ)
F5D8 : D6 92      ldab $92            ;load B with addr 92 (FLO)
F5DA : 44         lsra                ;logic shift right A (bit7=0)
F5DB : 56         rorb                ;rotate right B 
F5DC : 44         lsra                ;logic shift right A (bit7=0)
F5DD : 56         rorb                ;rotate right B 
F5DE : 44         lsra                ;logic shift right A (bit7=0)
F5DF : 56         rorb                ;rotate right B
F5E0 : 43         coma                ;complement 1s A
F5E1 : 50         negb                ;complement 2s B
F5E2 : 82 FF      sbca #$FF           ;A = A - C - value FFh (#-1)
F5E4 : DB 92      addb $92            ;add B with addr 92 (FLO)
F5E6 : 99 90      adca $90            ;A = A + C + value in addr 90 (FMAX)
F5E8 : D7 92      stab $92            ;store B in addr 92 (FLO)
F5EA : 97 90      staa $90            ;store A in addr 90 (FMAX)
F5EC : 26 96      bne LF584           ;branch Z=0 FNOIS0
F5EE : C1 07      cmpb #$07           ;compare B with 07h 
F5F0 : 26 92      bne LF584           ;branch Z=0 FNOIS0
F5F2 : 39         rts                 ;return subroutine
;*************************************;
;clear DAC and wait X=1000
;*************************************;
;CLRDAC
F5F3 : 7F 20 02   clr $2002           ;clear DAC output SOUND
F5F6 : CE 10 00   ldx #$1000          ;load X with 1000h
;CLRDAC1
F5F9 : 09         dex                 ;decr X
F5FA : 26 FD      bne LF5F9           ;branch Z=0 CLRDAC1
F5FC : 39         rts                 ;return subroutine
;*************************************;
;Three Oscillator Play Loader
;*************************************;
;PLAYLD
F5FD : CE F6 B1   ldx #$F6B1          ;load X with F6B1h (RDECAY)
F600 : DF 84      stx $84             ;store X in addr 84
F602 : CE 00 90   ldx #$0090          ;load X with 0090h
F605 : DF 8E      stx $8E             ;store X in addr 8E
F607 : C6 AF      ldab #$AF           ;load B with AFh
F609 : D7 89      stab $89            ;store B in addr 89
F60B : 39         rts                 ;return subroutine
;*************************************;
;Three Oscillator Sound Generator
;*************************************;
;PLAY
F60C : DF 8C      stx $8C             ;store X in addr 8C
F60E : CE F6 B1   ldx #$F6B1          ;load X with F6B1h (#DECAYZ) (SYN02)
F611 : DF 84      stx $84             ;store X in addr 84
F613 : 86 80      ldaa #$80           ;load A with 80h
;PLAY1
F615 : D6 93      ldab $93            ;load B with addr 93
F617 : 2A 09      bpl LF622           ;branch N=0 PLAY3
F619 : D6 81      ldab $81            ;load B with addr 81
F61B : 54         lsrb                ;logic shift right B (bit7=0)
F61C : 54         lsrb                ;logic shift right B (bit7=0)
F61D : 54         lsrb                ;logic shift right B (bit7=0)
F61E : 5C         incb                ;logic shift right B (bit7=0)
;PLAY2
F61F : 5A         decb                ;decr B
F620 : 26 FD      bne LF61F           ;branch Z=0 PLAY2
;PLAY3
F622 : 7A 00 98   dec $0098           ;decr value in addr 0098
F625 : 27 4C      beq LF673           ;branch Z=1 PLAY7
F627 : 7A 00 99   dec $0099           ;decr value in addr 0099
F62A : 27 4C      beq LF678           ;branch Z=1 PLAY8
F62C : 7A 00 9A   dec $009A           ;decr value in addr 009A
F62F : 27 4C      beq LF67D           ;branch Z=1 PLAY9
F631 : 7A 00 9B   dec $009B           ;decr value in addr 009B
F634 : 26 DF      bne LF615           ;branch Z=0 PLAY1
F636 : D6 93      ldab $93            ;load B with addr 93
F638 : 27 DB      beq LF615           ;branch Z=1 PLAY1
F63A : C4 7F      andb #$7F           ;and B with 7Fh
F63C : D7 9B      stab $9B            ;store B in addr 9B
F63E : D6 81      ldab $81            ;load B with addr 81
F640 : 58         aslb                ;arith shift left B (bit0 is 0)
F641 : DB 81      addb $81            ;add B with addr 81
F643 : CB 0B      addb #$0B           ;add B with 0Bh
F645 : D7 81      stab $81            ;store B in addr 81
F647 : 7A 00 AB   dec $00AB           ;decr addr 00AB
F64A : 26 0E      bne LF65A           ;branch Z=0 PLAY4
F64C : D6 9F      ldab $9F            ;load B with addr 9F
F64E : D7 AB      stab $AB            ;store B in addr AB
F650 : DE 84      ldx $84             ;load X with addr 84
F652 : 09         dex                 ;decr X
F653 : 8C F6 AA   cpx #$F6AA          ;compare X with F6AAh (SYN01)
F656 : 27 4E      beq LF6A6           ;branch Z=1 PLAYX
F658 : DF 84      stx $84             ;store X in addr 84
;PLAY6
F65A : D6 81      ldab $81            ;load B with addr 81
F65C : 2B 06      bmi LF664           ;branch N=1 PLAY6A
F65E : D4 97      andb $97            ;and B with addr 97
F660 : C4 7F      andb #$7F           ;and B with 7Fh
F662 : 20 05      bra LF669           ;branch always PLAYB
;PLAY6A
F664 : D4 97      andb $97            ;and B with addr 97
F666 : C4 7F      andb #$7F           ;and B with 7Fh
F668 : 50         negb                ;complement 2s B
;PLAY6B
F669 : 36         psha                ;push A into stack then SP - 1
F66A : 1B         aba                 ;A = A + B
F66B : 16         tab                 ;transfer A to B
F66C : 32         pula                ;SP + 1 pull stack into A
F66D : DE 84      ldx $84             ;load X with addr 84
F66F : AD 00      jsr $00,x           ;jump sub addr X+00h
F671 : 20 A2      bra LF615           ;branch always PLAY1
;PLAY7
F673 : CE 00 90   ldx #$0090          ;load X with 0090
F676 : 20 08      bra LF680           ;branch always PLAY10
;PLAY8 
F678 : CE 00 91   ldx #$0091          ;load X with 0091
F67B : 20 03      bra LF680           ;branch always PLAY10
;PLAY9 
F67D : CE 00 92   ldx #$0092          ;load X with 0092h
;PLAY10 
F680 : 6D 18      tst $18,x           ;test value in addr X + 18h
F682 : 27 12      beq LF696           ;branch Z=1 PLAY11
F684 : 6A 18      dec $18,x           ;decr addr X + 18h
F686 : 26 0E      bne LF696           ;branch Z=0 PLAY11
F688 : E6 0C      ldab $0C,x          ;load B with addr X + 0Ch
F68A : E7 18      stab $18,x          ;store B in addr X + 18h
F68C : E6 00      ldab $00,x          ;load B with addr X+00h
F68E : EB 10      addb $10,x          ;add B with addr X + 10h
F690 : E1 14      cmpb $14,x          ;compare B with addr X + 14h
F692 : 27 12      beq LF6A6           ;branch Z=1 PLAYX
F694 : E7 00      stab $00,x          ;store B in addr X+00h
;PLAY11
F696 : E6 00      ldab $00,x          ;load B with addr X+00h   
F698 : E7 08      stab $08,x          ;store B in addr X + 08h
F69A : AB 04      adda $04,x          ;add A with addr X + 04h
F69C : 60 04      neg $04,x           ;complement 2s in addr X + 04h
F69E : 16         tab                 ;transfer A to B
F69F : DE 84      ldx $84             ;load X with addr 84
F6A1 : AD 00      jsr $00,x           ;jump sub addr X+00h
F6A3 : 7E F6 15   jmp LF615           ;jump PLAY1
;PLAYX
F6A6 : DE 8C      ldx $8C             ;load X with addr 8C
F6A8 : 39         rts                 ;return subroutine
;*************************************;
; Echo And Decay Routine 
;*************************************;
;RDECAY
F6A9 : 54         lsrb                ;logical shift right B (/2)
;#RDECAY+1 
F6AA : 54         lsrb                ;logical shift right B 
F6AB : 54         lsrb                ;logical shift right B
F6AC : 54         lsrb                ;logical shift right B 
F6AD : 54         lsrb                ;logical shift right B 
F6AE : 54         lsrb                ;logical shift right B
F6AF : 54         lsrb                ;logical shift right B 
F6B0 : 54         lsrb                ;logical shift right B
;#DECAYZ 
F6B1 : F7 20 02   stab $2002          ;store B in DAC output SOUND 
F6B4 : 39         rts                 ;return subroutine
;*************************************;
;3 Oscillator Calling Routines
;*************************************;
;THNDR
F6B5 : BD F5 FD   jsr LF5FD           ;jump sub PLAYLD
F6B8 : CE F7 28   ldx #$F728          ;load X with F728h (VEC017)
F6BB : 20 0E      bra LF6CB           ;branch always THNDR1 
;THNDR5
F6BD : BD F5 FD   jsr LF5FD           ;jump sub PLAYLD
F6C0 : CE F7 0C   ldx #$F70C          ;load X with F70Ch (VEC05)
F6C3 : 20 06      bra LF6CB           ;branch always THNDR1
;THNDR4
F6C5 : BD F5 FD   jsr LF5FD           ;jump sub PLAYLD
F6C8 : CE F6 F0   ldx #$F6F0          ;load X with F6F0h (VEC04)
;THNDR1
F6CB : C6 1C      ldab #$1C           ;load B with 1Ch
F6CD : BD F2 3B   jsr LF23B           ;jump sub TRANS
F6D0 : 7E F6 0C   jmp LF60C           ;jump PLAY
F6D3 : 39         rts                 ;return subroutine
;*************************************;
;Three Oscillator Tables- 28 bytes
;
F6D4 : FFFF FF90 FFFF FFFF FFFF       ;VEC01
F6DE : FF90 FFFF FFFF FFFF FFFF       ;
F6E8 : 0000 0000 0000 0000            ;
;
F6F0 : 3000 0000 7F00 0000 3000       ;VEC04
F6FA : 0000 0100 0000 7F00 0000       ;
F704 : 0200 0000 0100 0000            ;
;
F70C : 0400 0004 7F00 007F 0400       ;VEC05
F716 : 0004 FF00 00A0 0000 0000       ;
F720 : 0000 0000 FF00 00A0            ;
;
F728 : 0280 0030 0A7F 007F 0280       ;VEC017
F732 : 0030 C080 0020 0110 0015       ;
F73C : C010 0000 C080 0000            ;
;*************************************;
;* THE BOMB OOOOOH NOOOOO!
;*************************************;
;WHISTL
F744 : BD F5 FD   jsr LF5FD           ;jump sub PLAYLD 
;WHIST
F747 : 86 80      ldaa #$80           ;load A with 80h
F749 : 97 9A      staa $9A            ;store A in addr 9A (FREQZ)
F74B : 86 F7      ldaa #$F7           ;load A with F7h (#SINTBL/$100)
F74D : 97 98      staa $98            ;store A in addr 98 (TABLE)
;SYN31 LF74F WHIST0:
F74F : 86 80      ldaa #$80           ;load A with 80h
F751 : 97 87      staa $87            ;store A in addr 87 (TEMPA)
;SYN32 LF753 WHIST1:
F753 : 86 12      ldaa #$12           ;load A with 12h 
;SYN33 LF755 WHIST2:
F755 : 4A         deca                ;decr A
F756 : 26 FD      bne LF755           ;branch Z=0 WHIST2
F758 : 96 97      ldaa $97            ;load A with addr 97 (TIME)
F75A : 9B 9A      adda $9A            ;add A with addr 9A (FREQZ)
F75C : 97 97      staa $97            ;store A in addr 97 (TIME)
F75E : 44         lsra                ;logic shift right A (bit7=0)
F75F : 44         lsra                ;logic shift right A (bit7=0)
F760 : 44         lsra                ;logic shift right A (bit7=0)
F761 : 8B 7B      adda #$7B           ;add A with 7Bh (#SINTBL!.$FF)
F763 : 97 99      staa $99            ;store A in addr 99 (TABLE+1)
F765 : DE 98      ldx $98             ;load X with addr 98 (TABLE)
F767 : A6 00      ldaa $00,x          ;load A with addr X+00h
F769 : B7 20 02   staa $2002          ;store A in DAC output SOUND
F76C : 7A 00 87   dec $0087           ;decr value in addr 0087 (TEMPA)
F76F : 26 E2      bne LF753           ;branch Z=0 WHIST1
F771 : 7A 00 9A   dec $009A           ;decr value in addr 009A (FREQZ)
F774 : 96 9A      ldaa $9A            ;load A with addr 9A (FREQZ)
F776 : 81 20      cmpa #$20           ;compare A with 20h
F778 : 26 D5      bne LF74F           ;branch Z=0 WHIST0
F77A : 39         rts                 ;return subroutine
;*
;Sine Table
;*
;SINTBL
F77B : 80 8C 98 A5 B0 BC C6 D0 
F783 : DA E2 EA F0 F5 FA FD FE 
F78B : FF FE FD FA F5 F0 EA E2
F793 : DA D0 C6 BC B0 A5 98 8C 
F79B : 80 73 67 5A 4F 43 39 2F 
F7A3 : 25 1D 15 0F 0A 05 02 01
F7AB : 00 01 02 05 0A 0F 15 1D
F7B3 : 25 2F 39 43 4F 5A 67 73
;*************************************;
;Knocker Routine
;*************************************;
;KNOCK
F7BB : 7F 20 02   clr $2002           ;clear DAC output SOUND (FULL BLAST)
F7BE : CE F8 02   ldx #$F802          ;load X with F802h (#KNKTAB)
F7C1 : DF 92      stx $92             ;store X in addr 92 (SNDTMP)
;SQLP:
F7C3 : DE 92      ldx $92             ;load X with addr 92 (SNDTMP)(RESTORE X REG)
F7C5 : A6 00      ldaa $00,x          ;load A with addr X+00h (GET PERIOD)
F7C7 : 27 33      beq LF7FC           ;branch Z=1 END(END ON ZERO)
F7C9 : E6 01      ldab $01,x          ;load B with addr X + 01h (GET AMP)
F7CB : C4 F0      andb #$F0           ;and B with F0h
F7CD : D7 91      stab $91            ;store B in addr 91 (AMP)
F7CF : E6 01      ldab $01,x          ;load B with addr X + 01h
F7D1 : 08         inx                 ;incr X
F7D2 : 08         inx                 ;incr X
F7D3 : DF 92      stx $92             ;store X in addr 92 (SNDTMP)(SAVE X)
F7D5 : 97 90      staa $90            ;store A in addr 90 (PERIOD)
F7D7 : C4 0F      andb #$0F           ;and B with 0Fh
;LP0:
F7D9 : 96 91      ldaa $91            ;load A with addr 91 (AMP)
F7DB : B7 20 00   staa $2000          ;store A in PIA sound select (SOUND) <-- error? should be $2002 DAC
F7DE : 96 90      ldaa $90            ;load A with addr 90 (PERIOD)
;LP1:
F7E0 : CE 00 05   ldx #$0005          ;load X with 0005h (DELAY)
;LP11:
F7E3 : 09         dex                 ;decr X
F7E4 : 26 FD      bne LF7E3           ;branch Z=0 LP11
F7E6 : 4A         deca                ;decr A
F7E7 : 26 F7      bne LF7E0           ;branch Z=0 LP1
F7E9 : 7F 20 00   clr $2000           ;clear PIA sound select (SOUND) <-- error? should be $2002 DAC
F7EC : 96 90      ldaa $90            ;load A with addr 90 (PERIOD)
;LP2:
F7EE : CE 00 05   ldx #$0005          ;load X with 0005h (DELAY)
;LP22:
F7F1 : 09         dex                 ;decr X
F7F2 : 26 FD      bne LF7F1           ;branch Z=0 LP22
F7F4 : 4A         deca                ;decr A
F7F5 : 26 F7      bne LF7EE           ;branch Z=0 LP2
F7F7 : 5A         decb                ;decr B
F7F8 : 26 DF      bne LF7D9           ;branch Z=0 LP0
F7FA : 20 C7      bra LF7C3           ;branch always SQLP
;END:
F7FC : 86 80      ldaa #$80           ;load A with 80h (OVERRIDE OFF)
F7FE : B7 20 02   staa $2002          ;store A in DAC output
F801 : 39         rts                 ;return subroutine
;*
;Knocker Pattern
;
F802 : 01FC 02FC 03F8 04F8 06F8 08F4  ;KNKTAB
F80E : 0CF4 10F4 20F2 40F1 60F1 80F1  ;
F81A : A0F1 C0F1 0000                 ;
;*************************************;
;ORRRR table
;
F820 : FE04 0204 FF00                 ;VEC05X 
;ORRRR
F826 : BD F5 FD   jsr LF5FD           ;jump sub PLAYLD
F829 : CE F8 20   ldx #$F820          ;load X with F820h (VEC05X) 
F82C : BD F8 57   jsr LF857           ;jump sub MOVE
F82F : 7E F8 70   jmp LF870           ;jump SING
;*************************************;
;
F832 : 50FF 0000 6080                 ;VEC09X
;Random Squirts 
;
;SQRT
F838 : BD F5 FD   jsr LF5FD           ;jump sub PLAYLD
F83B : C6 30      ldab #$30           ;load B with 30h
;SQRT1
F83D : CE F8 32   ldx #$F832          ;load X with F832h (VEC09X)
F840 : 8D 15      bsr LF857           ;branch sub MOVE
;SQRT2:
F842 : 96 81      ldaa $81            ;load A with addr 81
F844 : 48         asla                ;arith shift left A (bit0 is 0)
F845 : 9B 81      adda $81            ;add A with addr 81
F847 : 8B 0B      adda #$0B           ;add A with 0Bh
F849 : 97 81      staa $81            ;store A in addr 81
F84B : 44         lsra                ;logic shift right A (bit7=0)
F84C : 44         lsra                ;logic shift right A (bit7=0)
F84D : 8B 0C      adda #$0C           ;add A with 0Ch
F84F : 97 91      staa $91            ;store A in addr 91
F851 : 8D 1D      bsr LF870           ;branch sub SING
F853 : 5A         decb                ;decr B
F854 : 26 EC      bne LF842           ;branch Z=0 SQRT2
F856 : 39         rts                 ;return subroutine
;*************************************;
;Move Parameters
;*************************************;
;MOVE
F857 : A6 00      ldaa $00,x          ;load A with addr X+00h
F859 : 97 91      staa $91            ;store A in addr 91 (FREQ$)
F85B : A6 01      ldaa $01,x          ;load A with addr X + 01h
F85D : 97 92      staa $92            ;store A in addr 92 (C$FRQ)
F85F : A6 02      ldaa $02,x          ;load A with addr X + 02h
F861 : 97 93      staa $93            ;store A in addr 93 (D$FRQ)
F863 : A6 03      ldaa $03,x          ;load A with addr X + 03h
F865 : 97 94      staa $94            ;store A in addr 94 (E$FRQ)
F867 : A6 04      ldaa $04,x          ;load A with addr X + 04h
F869 : 97 95      staa $95            ;store A in addr 95 (C$AMP)
F86B : A6 05      ldaa $05,x          ;load A with addr X + 05h
F86D : 97 96      staa $96            ;store A in addr 96 (D$AMP)
F86F : 39         rts                 ;return subroutine
;*************************************;
;Delta F, Delta A Routine
;*************************************;
;SING
F870 : 96 89      ldaa $89            ;load A with addr 89  (AMP0)(GET STARTING AMPLITUDE)
;SING$
F872 : 37         pshb                ;push B into stack then SP - 1 (SAVE B)
F873 : D6 95      ldab $95            ;load B with addr 95 (C$AMP)(GET CYCLES AT AMPLITUDE)
F875 : D7 97      stab $97            ;store B in addr 97 (C$AMP$)(SAVE AS COUNTER)
F877 : D6 92      ldab $92            ;load B with addr 92 (C$FRQ)(GET CYCLES AT FREQUENCY)
F879 : D7 98      stab $98            ;store B in addr 98 (C$FRQ$)(SAVE AS COUNTER)
;SING1:
F87B : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F87C : D6 91      ldab $91            ;load B with addr 91 (FREQ$)(GET FREQUENCY COUNTER)
F87E : B7 20 02   staa $2002          ;store A in DAC output SOUND (OUTPUT TO D/A)
;SING2:
F881 : 5A         decb                ;decr B
F882 : 26 FD      bne LF881           ;branch Z=0 SING2
F884 : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F885 : D6 91      ldab $91            ;load B with addr 91 (FREQ$)(GET FRQUENCY COUNTER)
F887 : 20 00      bra LF889           ;branch always (*+2) (-I)
F889 : 08         inx                 ;incr X (-I)
F88A : 09         dex                 ;decr X (-I---)(SYNC, 20 CYCLES)
F88B : 08         inx                 ;incr X (-I)
F88C : 09         dex                 ;decr X (-I)
F88D : B7 20 02   staa $2002          ;store A in DAC output SOUND (OUTPUT TO D/A)
;SING3:
F890 : 5A         decb                ;decr B
F891 : 26 FD      bne LF890           ;branch Z=0 SING3
F893 : 7A 00 98   dec $0098           ;decr value in addr 0098 (C$FRQ$)(CHECK CYCLES AT FREQUENCY)
F896 : 27 16      beq LF8AE           ;branch Z=1 SING4(GO CHANGE FREQUENCY)
F898 : 7A 00 97   dec $0097           ;decr value in addr 0097 (C$AMP$)(CHECK CYCLES AT AMPLITUDE)
F89B : 26 DE      bne LF87B           ;branch Z=0 SING1(ALL OK, GO OUTPUT)
F89D : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F89E : D6 95      ldab $95            ;load B with addr 95 (C$AMP)(GET CYCLES AT AMPLITUDE)
F8A0 : B7 20 02   staa $2002          ;store A in DAC output SOUND (OUTPUT TO D/A)
F8A3 : D7 97      stab $97            ;store B in addr 97 (C$AMP$)(SAVE AS COUNTER)
F8A5 : D6 91      ldab $91            ;load B with addr 91 (FREQ$)(GET FREQUENCY COUNT)
F8A7 : 9B 96      adda $96            ;add A with addr 96 (D$AMP)(ADD AMPLITUDE DELTA)
F8A9 : 2B 1E      bmi LF8C9           ;branch N=1 SING6 (RETURN FROM SUBROUTINE)
F8AB : 01         nop                 ;(SYNC, 2 CYCLES)
F8AC : 20 15      bra LF8C3           ;branch always SING5
;SING4:
F8AE : 08         inx                 ;incr X (-I)
F8AF : 09         dex                 ;decr X (-I---)(SYNC, 10 CYCLES)
F8B0 : 01         nop                 ;(-I)
F8B1 : 43         coma                ;complement 1s A (INVERT AMPLITUDE)
F8B2 : D6 92      ldab $92            ;load B with addr 92 (C$FRQ)(GET CYCLES AT FREQUENCY)
F8B4 : B7 20 02   staa $2002          ;store A in DAC output SOUND (OUTPUT TO D/A)
F8B7 : D7 98      stab $98            ;store B in addr 98 (C$FRQ$)(SAVE AS COUNTER)
F8B9 : D6 91      ldab $91            ;load B with addr 91 (FREQ$)(GET FREQUENCY COUNT)
F8BB : D0 93      subb $93            ;subtract B with addr 93 (D$FRQ)(SUBTRACT FREQUENCY DELTA)
F8BD : D1 94      cmpb $94            ;compare B with addr 94 (E$FRQ)(COMPARE TO END FREQUENCY)
F8BF : D1 94      cmpb $94            ;compare B with addr 94 (E$FRQ)(SYNC, 3 CYCLES)
F8C1 : 27 06      beq LF8C9           ;branch Z=1 SING6 (RETURN FROM SUBROUTINE)
;SING5:
F8C3 : D7 91      stab $91            ;store B in addr 91 (FREQ$)(SAVE FREQUENCY COUNT)
F8C5 : C0 05      subb #$05           ;subtract B with 05h (SYNC TO FREQUENCY COUNTDOWN)
F8C7 : 20 B8      bra LF881           ;branch always SING2 (JUMP INTO COUNTDOWN LOOP)
;SING6:
F8C9 : 33         pulb                ;SP + 1 pull stack into B (RESTORE B)
F8CA : 39         rts                 ;return subroutine
;*************************************;
;Lightning
;*************************************;
;LITE
F8CB : 86 01      ldaa #$01           ;load A with 01h
F8CD : 97 97      staa $97            ;store A in addr 97 (DFREQ)
F8CF : C6 03      ldab #$03           ;load B with 03h
;*************************************;
;Lightning+Appear Noise Routine 
;*************************************;
;LITEN
F8D1 : 97 96      staa $96            ;store A in addr 96 (LFREQ)
F8D3 : 86 FF      ldaa #$FF           ;load A with FFh (HIGHEST AMP)
F8D5 : B7 20 02   staa $2002          ;store A in DAC output SOUND
F8D8 : D7 92      stab $92            ;store B in addr 92 (CYCNT)
;LITE0:
F8DA : D6 92      ldab $92            ;load B with addr 92 (CYCNT)
;LITE1:
F8DC : 96 81      ldaa $81            ;load A with addr 81 (LO) (GET RANDOM)
F8DE : 44         lsra                ;logic shift right A (bit7=0)
F8DF : 44         lsra                ;logic shift right A (bit7=0)
F8E0 : 44         lsra                ;logic shift right A (bit7=0)
F8E1 : 98 81      eora $81            ;exclusive OR with addr 81 (LO)
F8E3 : 44         lsra                ;logic shift right A (bit7=0)
F8E4 : 76 00 80   ror $0080           ;rotate right in addr 0080 (HI)
F8E7 : 76 00 81   ror $0081           ;rotate right in addr 0081 (LO)
F8EA : 24 03      bcc LF8EF           ;branch C=0 LITE2
F8EC : 73 20 02   com $2002           ;complement 1s in DAC output SOUND
;LITE2:
F8EF : 96 96      ldaa $96            ;load A with addr 96 (LFREQ)(COUNT FREQ)
;LITE3:
F8F1 : 4A         deca                ;decr 
F8F2 : 26 FD      bne LF8F1           ;branch Z=0 LITE3
F8F4 : 5A         decb                ;decr B (COUNT CYCLES)
F8F5 : 26 E5      bne LF8DC           ;branch Z=0 LITE1
F8F7 : 96 96      ldaa $96            ;load A with addr 96 (LFREQ)
F8F9 : 9B 97      adda $97            ;add A with addr 97 (DFREQ)
F8FB : 97 96      staa $96            ;store A in addr 96 (LFREQ)
F8FD : 26 DB      bne LF8DA           ;branch Z=0 LITE0
F8FF : 39         rts                 ;return subroutine
;*************************************;
;JNOISE loader (Joust)
;*************************************;
;WINGUP
F900 : 86 00      ldaa #$00           ;load A with 00h
F902 : 20 29      bra LF92D           ;branch always JKNOIS
;CLIP
F904 : 86 01      ldaa #$01           ;load A with 01h
F906 : 20 25      bra LF92D           ;branch always JKNOIS
;CLOP
F908 : 86 02      ldaa #$02           ;load A with 02h
F90A : 20 21      bra LF92D           ;branch always JKNOIS
;WINGDN
F90C : 86 03      ldaa #$03           ;load A with 03h
F90E : 8D 1D      bsr LF92D           ;branch sub JKNOIS
F910 : 86 04      ldaa #$04           ;load A with 04h
F912 : 20 19      bra LF92D           ;branch always JKNOIS
;*************************************;
;JNOIST 
;*************************************;
F914 : 0D 40 F0 FF 12                 ;$1F WING UP
F919 : 08 A8 18 01 08                 ; 20 CLIP
F91E : 04 A8 18 01 10                 ; 21 CLOP
F923 : 04 20 F8 FF 20                 ; 1E WING DOWN PART 1
F928 : 10 F0 10 01 01                 ;  "            "   2
;*************************************;
;JKNOIS
;*************************************;
F92D : CE D9 39   ldx #$D939          ;load X with D939h (GOOD SEED)
F930 : DF 80      stx $80             ;store X in addr 80(HI)
F932 : 16         tab                 ;transfer A to B
F933 : 48         asla                ;arith shift left A (bit0 is 0)
F934 : 48         asla                ;arith shift left A (bit0 is 0)
F935 : 1B         aba                 ;A = A + B
F936 : CE F9 14   ldx #$F914          ;load X with F914h (JNOIST)
F939 : BD E1 89   jsr LE189           ;jump sub ADDX
F93C : 7E F9 A6   jmp LF9A6           ;jump NOISLG
;*************************************;
;CROWD ROAR
;*************************************;
;CDR
F93F : CE F9 5E   ldx #$F95E          ;load X with F95Eh (#WS1)(1ST WHISTLE PARAMS)
F942 : DF A1      stx $A1             ;store X in addr A1 (PTRHI)
F944 : BD FA 88   jsr LFA88           ;jump sub WISLD
F947 : CE A5 00   ldx #$A500          ;load X with A500h (SEED)
F94A : DF 80      stx $80             ;store X in addr 80 (HI) 
F94C : CE F9 87   ldx #$F987          ;load X with F987h (#CR1)(1ST CROWD ROAR NOISE PARAMS)
F94F : BD F9 91   jsr LF991           ;jump sub NOISLD
F952 : BD FA 2C   jsr LFA2C           ;jump sub NINIT
F955 : CE F9 8C   ldx #$F98C          ;load X with F98Ch (#CR2)
F958 : BD F9 91   jsr LF991           ;jump sub NOISLD
F95B : 7E FA 39   jmp LFA39           ;jump NINIT2
;*************************************;
;WHISTLE tables
;*************************************;
F95E : 90 10 02 14 40                 ;WS1
F963 : B4 40 FF 14 30                 ;
F968 : D0 32 02 10 60                 ;
F96D : EE 20 02 08 54                 ;
F972 : E9 54 FF 20 28                 ;
F977 : C0 30 02 14 58                 ;
F97C : AC 20 02 08 58                 ;
F985 : A6 58 FF 18 22                 ;
F986 : 00                             ;
F987 : 30 10 FC 00 01                 ;CR1
F98C : 30 FC 01 00 01                 ;CR2
;*************************************;
;*WHITE NOISE ROUTINE
;*NFRQ=INIT PERIOD, NAMP=INIT AMP, DECAY AMPLITUDE RATE
;*CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;*NFFLG=0 NO FREQ CHANGE;=POS DECAY;=MINUS INC FREQ
;*NOISE LOAD PROG-ENTER WITH XREG POINTING TO DATA
;*************************************;
;NOISLD
F991 : A6 00      ldaa $00,x          ;load A with addr X+00h
F993 : 97 A8      staa $A8            ;store A in addr A8 (CY2)
F995 : A6 01      ldaa $01,x          ;load A with addr X + 01h
F997 : 97 91      staa $91            ;store A in addr 91 (NAMP)
F999 : A6 02      ldaa $02,x          ;load A with addr X + 02h
F99B : 97 90      staa $90            ;store A in addr 90 (DECAY)
F99D : A6 03      ldaa $03,x          ;load A with addr X + 03h
F99F : 97 95      staa $95            ;store A in addr 95 (NFFLG)
F9A1 : A6 04      ldaa $04,x          ;load A with addr X + 04h
F9A3 : 97 AD      staa $AD            ;store A in addr AD (NFRQ2)
;NEND
F9A5 : 39         rts                 ;return subroutine
;*
;*LOAD NOISE AND GO 
;*
;NOISLG
F9A6 : 8D E9      bsr LF991           ;branch sub NOISLD
;*
;*NOISE INIT
;*
;NOIN
F9A8 : 8D 30      bsr LF9DA           ;branch sub NSUB(CY2&NFRQ2 TO CYCNT&NFRQ)
;*
;*NOISE LOOP
;*
;NO1:
F9AA : 8D 58      bsr LFA04           ;branch sub RNT(FREQ CHECK)
F9AC : 96 AC      ldaa $AC            ;load A with addr AC (NFRQ)(FREQ REINITED)
F9AE : 91 AD      cmpa $AD            ;compare A with addr AD (NFRQ2)
F9B0 : 26 F8      bne LF9AA           ;branch Z=0 NO1 (IF NOT KEEEP DELAYING)
F9B2 : 59         rolb                ;rotate left B (RESTORE MAX AMPLITUDE TO NOISE)
F9B3 : F7 20 02   stab $2002          ;store B in DAC output SOUND
F9B6 : 8D 2D      bsr LF9E5           ;branch sub NOISE1(PREPARE NEXT RAND NO)
F9B8 : 8D 38      bsr LF9F2           ;branch sub NOISE2
F9BA : 8D 5C      bsr LFA18           ;branch sub RNA(AMPLITUDE &CYCL3 COUNT CECK)
F9BC : 7D 00 91   tst $0091           ;test value in addr 0091 (NAMP)(SEE IF DONE)
F9BF : 27 E4      beq LF9A5           ;branch Z=1 NEND(RTS IF FINISHED)
F9C1 : 7D 00 92   tst $0092           ;test value in addr 0092 (CYCNT)(SEE IF NEXT FREQ)
F9C4 : 26 E4      bne LF9AA           ;branch Z=0 NO1(IF NOT GO FREQ DELAY LOOP)
F9C6 : 7D 00 95   tst $0095           ;test value in addr 0095 (NFFLG)(SEE IF SWEEP MODE)
F9C9 : 27 DF      beq LF9AA           ;branch Z=1 NO1(IF NO SWEEP GO DELAY)
F9CB : 2B 05      bmi LF9D2           ;branch N=1 NO3(SWEEP DOWN)
F9CD : 7C 00 AD   inc $00AD           ;incr addr 00AD (NFRQ2)
F9D0 : 20 D8      bra LF9AA           ;branch always NO1
;NO3:
F9D2 : 7A 00 AD   dec $00AD           ;decr value in addr 00AD (NFRQ2)
F9D5 : 7A 00 AC   dec $00AC           ;decr value in addr 00AC (NFRQ)
F9D8 : 20 D0      bra LF9AA           ;branch always NO1
;NSUB
F9DA : 7F 00 92   clr $0092           ;clear addr 0092 (CYCNT)
F9DD : 96 AD      ldaa $AD            ;load A with addr AD (NFRQ2)
F9DF : 97 AC      staa $AC            ;store A in addr AC (NFRQ)(NOISE FREQ)
F9E1 : 7F 00 AB   clr $00AB           ;clear addr 00AB (NNOIS)
F9E4 : 39      rts                    ;return subroutine
;*23 CYCLES FOR EACH SUBROUTINE PLUS CALLING OVERHEAD
;*
;*
;NOISE1
F9E5 : 96 81      ldaa $81            ;load A with addr 18 (LO GET RANDOM BIT)
F9E7 : 44         lsra                ;logic shift right A (bit7=0)
F9E8 : 44         lsra                ;logic shift right A (bit7=0)
F9E9 : 44         lsra                ;logic shift right A (bit7=0)
F9EA : 98 81      eora $81            ;exclusive OR with addr 81 (LO)
F9EC : 97 A6      staa $A6            ;store A in addr A6 (ATP)(INTERMED RAND NO)
F9EE : 08         inx                 ;incr X
F9EF : 84 07      anda #$07           ;and A with 07h (FOR 3 BIT RANDOM NO)
;*
F9F1 : 39         rts                 ;return subroutine
;*
;NOISE2
F9F2 : 96 A6      ldaa $A6            ;load A with addr A6 (ATP)
F9F4 : 44         lsra                ;logic shift right A (bit7=0)
F9F5 : 76 00 80   ror $0080           ;rotate right in addr 0080 (bit7 = C then C = bit0) (HI)
F9F8 : 76 00 81   ror $0081           ;rotate right in addr 0081 (bit7 = C then C = bit0) (LO)
F9FB : 86 00      ldaa #$00           ;load A with 00h
F9FD : 24 02      bcc LFA01           ;branch C=0 NOISE3
F9FF : 96 91      ldaa $91            ;load A with addr 91 (NAMP)
;NOISE3:
FA01 : 97 AB      staa $AB            ;store A in addr AB (NNOIS)(NEXT NOISE VALUE)
;*
FA03 : 39         rts                 ;return subroutine
;*
;RNT
FA04 : 96 AD      ldaa $AD            ;load A with addr AD (NFRQ2)(NOISE FREQ)
FA06 : 7A 00 AC   dec $00AC           ;decr addr 00AC (NFREQ)
FA09 : 27 04      beq LFA0F           ;branch Z=1 NW0
FA0B : 08         inx                 ;incr X
FA0C : 09         dex                 ;decr X (TEQ)
FA0D : 20 08      bra LFA17           ;branch always NNW1
;NW0:
FA0F : 97 AC      staa $AC            ;store A in addr AC (NFRQ)(REINIT FREQ)
FA11 : D6 AB      ldab $AB            ;load B in addr AB (NNOIS)(SAVE NEXT NOISE VAL IN B REG)
FA13 : 54         lsrb                ;logic shift right B (bit7=0) (HALF AMPLITUDE)
FA14 : 7C 00 92   inc $0092           ;incr addr 0092 (CYCNT)(NOISE CYCLE COUNT AT NAMP)
;*
;NNW1:
FA17 : 39         rts                 ;return subroutine
;*
;RNA
FA18 : 96 A8      ldaa $A8            ;load A with addr A8 (CY2)(NOISE AMPL CHANGE)
FA1A : 91 92      cmpa $92            ;compare A wih value in addr 92 (CYCNT)
FA1C : 27 04      beq LFA22           ;branch Z=1 NW2
FA1E : 08         inx                 ;incr X
FA1F : 09         dex                 ;decr X
FA20 : 20 09      bra LFA2B           ;branch always NW3(TEQ)
;NW2:
FA22 : 7F 00 92   clr $0092           ;clear addr 0092 (CYCNT)
FA25 : 96 91      ldaa $91            ;load A with addr 91 (NAMP)
FA27 : 90 90      suba $90            ;subtract A with addr 90 (DECAY)
FA29 : 97 91      staa $91            ;store A in addr 91 (NAMP)
;NW3:
FA2B : 39         rts                 ;return subroutine
;*
;NOISE WITH WHISTLE MAIN LOOP
;*
;NINIT
FA2C : 7F 00 9F   clr $009F           ;clear addr 009F (WFRQ)
FA2F : 7F 00 A9   clr $00A9           ;clear addr 00A9 (DFRQ)
FA32 : 86 0E      ldaa #$0E           ;load A with 0Eh (CYCLE OFFSET FOR WHISTLE)
FA34 : 97 A0      staa $A0            ;store A in addr A0 (WCNT)
FA36 : 7F 00 A5   clr $00A5           ;clear addr 00A5 (CURVAL)(CLR WHISTLE VALUES)
;NINIT2
FA39 : 8D 9F      bsr LF9DA           ;branch sub NSUB(CLR CYCNT AND INIT FREQ)
;WIN:
FA3B : 8D A8      bsr LF9E5           ;branch sub NOISE1
FA3D : BD FA C2   jsr LFAC2           ;jump sub TRIDR
FA40 : 8D B0      bsr LF9F2           ;branch sub NOISE2
FA42 : BD FA C2   jsr LFAC2           ;jump sub TRIDR
FA45 : 8D BD      bsr LFA04           ;branch sub RNT
FA47 : 8D 79      bsr LFAC2           ;jump sub TRIDR
FA49 : 8D CD      bsr LFA18           ;branch sub RNA
FA4B : 8D 75      bsr LFAC2           ;jump sub TRIDR
FA4D : 8D 0A      bsr LFA59           ;branch sub TRICNT
FA4F : 8D 71      bsr LFAC2           ;jump sub TRIDR
FA51 : 8D 1D      bsr LFA70           ;branch sub TRIFRQ
FA53 : 8D 6D      bsr LFAC2           ;jump sub TRIDR
FA55 : 8D 52      bsr LFAA9           ;branch sub NNW
FA57 : 20 E2      bra LFA3B           ;branch always WIN
;*
;TRICNT
FA59 : 96 A4      ldaa $A4            ;load A with addr A4 (WCNT2)(#CYCLES AT WHISTLE FREQ)
FA5B : 7A 00 A0   dec $00A0           ;decr addr 00A0 (WCNT)
FA5E : 27 07      beq LFA67           ;branch Z=1 NW4
FA60 : B6 00 91   ldaa $0091          ;load A with addr 0091 (FCB $B6)(LDAA EXTENDED)
;                                     ;FDB NAMP
FA63 : 26 0A      bne LFA6F           ;branch Z=0 NW5(TEQ)
FA65 : 20 68      bra LFACF           ;branch always NSEND(END NOISE)
;NW4:
FA67 : 97 A0      staa $A0            ;store A in addr A0 (WCNT)
FA69 : 96 9F      ldaa $9F            ;load A with addr 9F (WFRQ)
FA6B : 9B A9      adda $A9            ;add A with addr A9 (DFRQ)
FA6D : 97 9F      staa $9F            ;store A in addr 9F (WFRQ)
;*
;NW5:
FA6F : 39         rts                 ;return subroutine
;*
;TRIFRQ
FA70 : 96 9F      ldaa $9F            ;load A with addr 9F (WFRQ)(WHISTLE END TEST)
FA72 : 91 A7      cmpa $A7            ;compare A with addr A7 (MINWIS)
FA74 : 27 07      beq LFA7D           ;branch Z=1 NW6
FA76 : 08         inx                 ;incr X (TEQ)
FA77 : 96 91      ldaa $91            ;load A with addr 91 (NAMP)(END TEST)
FA79 : 26 2A      bne LFAA5           ;branch Z=0 NW7(TEQ)
FA7B : 20 29      bra LFAA6           ;branch always PEND(END NOISE)
;NW6:
FA7D : 7F 00 9F   clr $009F           ;clear addr 009F (WFRQ)(TURN OFF WHISTLE)
FA80 : 7F 00 A9   clr $00A9           ;clear addr 00A9 (DFRQ)
FA83 : 7F 00 A5   clr $00A5           ;clear addr 00A5 (CURVAL)
FA86 : DE A1      ldx $A1             ;load X with addr A1 (PTRHI)(SET UP FOR NEXT WHISTLE)
;WISLD
FA88 : A6 00      ldaa $00,x          ;load A with addr X+00h
FA8A : 97 9E      staa $9E            ;store A in addr 9E (WHIS)
FA8C : 27 17      beq LFAA5           ;branch Z=1 NW7
FA8E : A6 01      ldaa $01,x          ;load A with addr X + 01h
FA90 : 97 A3      staa $A3            ;store A in addr A3 (WFRQ2)
FA92 : A6 02      ldaa $02,x          ;load A with addr X + 02h
FA94 : 97 AA      staa $AA            ;store A in addr AA (DFRQ2)
FA96 : A6 03      ldaa $03,x          ;load A with addr X + 03h
FA98 : 97 A4      staa $A4            ;store A in addr A4 (WCNT2)
FA9A : A6 04      ldaa $04,x          ;load A with addr X + 04h
FA9C : 97 A7      staa $A7            ;store A in addr A7 (MINWIS)
FA9E : 86 05      ldaa #$05           ;load A with 05h
FAA0 : BD E1 89   jsr LE189           ;jump sub ADDX
FAA3 : DF A1      stx $A1             ;store X in addr A1 (PTRHI)
;*
;NW7:
FAA5 : 39         rts                 ;return subroutine
;PEND
FAA6 : 32         pula                ;SP + 1 pull stack into A
FAA7 : 32         pula                ;SP + 1 pull stack into A (STACK ADJ)
FAA8 : 39         rts                 ;return subroutine
;*
;NNW
FAA9 : 96 9E      ldaa $9E            ;load A with addr 9E (WHIS)(WHISTLE INIT)
FAAB : 27 06      beq LFAB3           ;branch Z=1 NW8(ALREADY INITED)
FAAD : 91 91      cmpa $91            ;compare A with addr 91 (NAMP)
FAAF : 26 04      bne LFAB5           ;branch Z=0 NW9
FAB1 : 20 03      bra LFAB6           ;branch always WINIT(GO INIT WHISTLE)
;NW8:
FAB3 : 08         inx                 ;incr X
FAB4 : 09         dex                 ;decr X (TEQ)
;NW9:
FAB5 : 39         rts                 ;return subroutine
;WINIT
FAB6 : 7F 00 9E   clr $009E           ;clear addr 009E (WHIS)
FAB9 : 96 A3      ldaa $A3            ;load A with addr A3 (WFRQ2)
FABB : 97 9F      staa $9F            ;store A in addr 9F (WFRQ)
FABD : 96 AA      ldaa $AA            ;load A with addr AA (DFREQ2)
FABF : 97 A9      staa $A9            ;store A in addr A9 (DFRQ)
FAC1 : 39         rts                 ;return subroutine
;*************************************;
;TRIDR
FAC2 : 96 A5      ldaa $A5            ;load A with addr A5 (CURVAL)
FAC4 : 9B 9F      adda $9F            ;add A with addr 9F (WFRQ)
FAC6 : 97 A5      staa $A5            ;store A in addr A5 (CURVAL)
FAC8 : 2A 01      bpl LFACB           ;branch N=0 GO
FACA : 43         coma                ;complement 1s A
;GO:
FACB : 1B         aba                 ;A = A + B
FACC : B7 20 02   staa $2002          ;store A in DAC output SOUND
;NSEND:
FACF : 39         rts                 ;return subroutine
;*************************************;
;* NAM WALSH FUNCTION SOUND MACHINE V2
;*************************************;
;
; mem reserves LOCRAM, RMB etc will be out as 
; Joust version expects 007F ENDRAM (127d)
;  - so not included here.
;
ORG  WORG
;
;* T. MURPHY  11/10/81
;
;       SUBTTL WAVE PLAYER AND PITCH MODIFICATION
;
;* PLAY A SAMPLE, REMAINING DELAY IN B.  TOTAL DELAY = MIN (60,B*6) MICS.
;
;NTHRVC
FAD0 : C0 0D      subb #$0D           ;subtract B with 0Dh (#13) LOOP DELAY IS 78 CYCLES
FAD2 : 37         pshb                ;push B into stack then SP - 1
FAD3 : BD 00 AC   jsr $00AC           ;jump sub 00AC (FVECT 62)
FAD6 : 33         pulb                ;SP + 1 pull stack into B
;NXTSMP:
FAD7 : C1 14      cmpb #$14           ;compare B with 14h
FAD9 : 22 F5      bhi LFAD0           ;branch C+Z=0 NTHRVC
FADB : 01         nop                 ;
FADC : 96 A4      ldaa $A4            ;load A with addr A4
FADE : 9B A1      adda $A1            ;add A with addr A1
FAE0 : 97 A4      staa $A4            ;store A in addr A4
FAE2 : C9 F6      adcb #$F6           ;add C+B + F6h
;
FAE4 : 5A         decb                ;decr B (WASTE SMALL TIME)
FAE5 : 2A FD      bpl LFAE4           ;branch N=0 (*-1)
;
FAE7 : 96 A8      ldaa $A8            ;load A with addr A8
FAE9 : 4C         inca                ;incr A
FAEA : 84 0F      anda #$0F           ;and A with 0Fh
FAEC : 8A 90      oraa #$90           ;OR A with 90h (#WAVSRT) ! WAVSRT MUST BE DIVISIBLE BY 16 !
FAEE : 97 A8      staa $A8            ;store A with addr A8
;
FAF0 : DE A7      ldx $A7             ;load X with addr A7
FAF2 : E6 00      ldab $00,x          ;load B with addr X+00h
FAF4 : F7 20 02   stab $2002          ;store B in DAC output SOUND
;
FAF7 : 84 0F      anda #$0F           ;and A with 0Fh
FAF9 : 39         rts                 ;return subroutine
;
;* PLAYS WAVE AND ALTERS PITCH ACCORDING TO PITCH CMDS.
;* SMPPER IS INITIAL PITCH,  PCMDPT IS START PITCH PROGRAM,
;* FCMDPT IS START WAVE MODIFIER (FILTER) PROGRAM.
;
;WSM
FAFA : 4F         clra                ;clear A
FAFB : CE 00 90   ldx #$0090          ;load X with 0090h
FAFE : C6 61      ldab #$61           ;load B with 61h
;1$
FB00 : A7 00      staa $00,x          ;store A in addr X+00h
FB02 : 08         inx                 ;incr X
FB03 : 5A         decb                ;decr B
FB04 : 26 FA      bne LFB00           ;branch Z=0 PRM101
FB06 : C6 DF      ldab #$DF           ;load B with DFh
FB08 : D7 A6      stab $A6            ;store A in addr A6
FB0A : C6 B7      ldab #$B7           ;load B with B7h
FB0C : D7 B0      stab $B0            ;store B in addr B0
FB0E : C6 7E      ldab #$7E           ;load B with 7Eh
FB10 : D7 AC      stab $AC            ;store B in addr AC
FB12 : CE FC E5   ldx #$FCE5          ;load X with FCE5h (#NXTFCM)
FB15 : DF AD      stx $AD             ;store X in addr AD
FB17 : D6 8C      ldab $8C            ;load B with addr 8C
FB19 : D7 A3      stab $A3            ;store B in adr A3
;PPLPE1
FB1B : C0 03      subb #$03           ;subtract B with 03h
;PPLPE2
FB1D : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
FB20 : 08         inx                 ;incr X
;PPLP
FB21 : D6 A3      ldab $A3            ;load B with addr A3
FB23 : C0 02      subb #$02           ;subtract B with 02h
FB25 : BD FA D0   jsr LFAD0           ;jump sub NTHRVC
FB28 : 26 F7      bne LFB21           ;branch Z=0 (PPLP) ESCAPE ON WAVE BOUNDARY
;
FB2A : D6 A0      ldab $A0            ;load B with addr A0
FB2C : 96 A1      ldaa $A1            ;load A with addr A1
FB2E : 9B 8D      adda $8D            ;add A with addr 8D
FB30 : D9 8C      adcb $8C            ;B = Carry + B + value in addr 8C
FB32 : 97 8D      staa $8D            ;store A in addr 8D
FB34 : D7 8C      stab $8C            ;store B in addr 8C
;
FB36 : DB A2      addb $A2            ;add B with addr A2
FB38 : 86 19      ldaa #$19           ;load A with addr 19
FB3A : 11         cba                 ;compare A and B
FB3B : 24 01      bcc LFB3E           ;branch C=0 FB3E (*+3) CALL PER SAMPLE
;FB3D : 81 16      cmpa #$16           ;<- disasm error (FCB 81 TAB)
FB3D : 81                             ;FCB 129
FB3E : 16         tab                 ;
FB3F : D7 A3      stab $A3            ;store B in addr A3
FB41 : 01         nop                 ;
FB42 : C0 09      subb #$09           ;subtract B with 09h
FB44 : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
;
FB47 : 96 AF      ldaa $AF            ;load A with addr AF
FB49 : 16         tab                 ;transfer A to B
FB4A : 48         asla                ;arith shift left A (bit0 is 0)
FB4B : C9 00      adcb #$00           ;B = Carry + B + value 00h
FB4D : D7 AF      stab $AF            ;store B in addr AF
;
FB4F : D6 A3      ldab $A3            ;load B with addr A3
FB51 : C0 05      subb #$05           ;subtract B with 05h
FB53 : 96 A5      ldaa $A5            ;load A with addr A5
FB55 : 2A 06      bpl LFB5D           ;branch N=0 PAWAKE
FB57 : 7C 00 A5   inc $00A5           ;incr addr 00A5
FB5A : 01         nop                 ;
FB5B : 20 BE      bra LFB1B           ;branch always PPLPE1
;PAWAKE
FB5D : 5A         decb                ;decr B
FB5E : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
;
FB61 : DE 8A      ldx $8A             ;load X with addr 8A
FB63 : A6 00      ldaa $00,x          ;load A with addr X+00h
FB65 : 2A 12      bpl LFB79           ;branch N=0 PPLP1 (MOST CMDS ARE >0)
;
FB67 : 81 80      cmpa #$80           ;compare A with 80h
FB69 : 27 5F      beq LFBCA           ;branch Z=1 STOPR
;
FB6B : 4C         inca                ;incr A
FB6C : 97 A5      staa $A5            ;store A in addr A5
FB6E : 08         inx                 ;incr X
;FB6F : FF 00 8A   stx $008A           ;<- disasm error (FCB -1,0,PCMDPT)
FB6F : FF                             ;-1  BEFORE FETCHING THE NEXT COMMAND
FB70 : 00                             ;0
FB71 : 8A                             ;PCMDPT
;PPLP35
FB72 : D6 A3      ldab $A3            ;load B with addr A3
FB74 : C0 06      subb #$06           ;subtract B with 06h
FB76 : 7E FB 1B   jmp LFB1B           ;jump PPLPE1
;PPLP1
FB79 : 08         inx                 ;incr X
FB7A : E6 00      ldab $00,x          ;load B with addr X+00h
FB7C : 37         pshb                ;push B into stack then SP - 1
FB7D : 08         inx                 ;incr X
FB7E : DF 8A      stx $8A             ;store X in addr 8A
;
FB80 : 97 A9      staa $A9            ;store A in addr A9
FB82 : 84 70      anda #$70           ;and A with 70h
FB84 : 44         lsra                ;logic shift right A (bit7=0)
FB85 : 44         lsra                ;logic shift right A (bit7=0)
FB86 : 44         lsra                ;logic shift right A (bit7=0)
FB87 : 5F         clrb                ;clear B
;
FB88 : 8B 5E      adda #$5E           ;add A with 5Eh
FB8A : C9 FC      adcb #$FC           ;B = Carry + B + value FCh    
FB8C : 97 AB      staa $AB            ;store A in addr AB
FB8E : D7 AA      stab $AA            ;store B in addr AA
;
FB90 : D6 A3      ldab $A3            ;load B with addr A3
FB92 : D6 A3      ldab $A3            ;load B with addr A3
FB94 : C0 0D      subb #$0D           ;subtract B with 0Dh
FB96 : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
;
FB99 : 5F         clrb                ;clear B
FB9A : DE AA      ldx $AA             ;load X with addr AA
FB9C : EE 00      ldx $00,x           ;load X with addr X+00h
FB9E : 6E 00      jmp $00,x           ;jump addr X+00h (,X 16) JMPTBL
;
;* PITCH COMMAND ROUTINES.  UNLESS OTHERWISE STATED, N IS A SIGNED 8 BIT
;* NUMBER = BYTE FOLLOWING OPCODE.
;
;* LDP N  IS  SMPPER := N,  ADP N  IS SMPPER := SMPPER + N
;
;LDPR
FBA0 : 96 A9      ldaa $A9            ;load A with addr A9
FBA2 : 47         asra                ;arith shift left A
FBA3 : C2 00      sbcb #$00           ;
FBA5 : D4 8C      andb $8C            ;
FBA7 : 32         pula                ;
FBA8 : 10         sba                 ;
FBA9 : 9B 8C      adda $8C            ;
FBAB : 97 8C      staa $8C            ;
FBAD : 08         inx                 ;
;LDPRE
FBAE : D6 A3      ldab $A3            ;
FBB0 : C0 0A      subb #$0A           ;
FBB2 : 7E FB 1D   jmp LFB1D           ;jump PPLPE2
;
;* LDO N IS  GLBPRO := N,  ADO N IS  GLBPRO := GLBPRO + N
;
;LDOR
FBB5 : 96 A9      ldaa $A9            ;
FBB7 : 47         asra                ;
FBB8 : C2 00      sbcb #$00           ;
FBBA : D4 A2      andb $A2            ;
FBBC : 32         pula                ;
FBBD : 10         sba                 ;
FBBE : 9B A2      adda $A2            ;
FBC0 : 97 A2      staa $A2            ;
FBC2 : 20 EA      bra LFBAE           ;branch always LDPRE
;
;* ESC EXECUTES MACHINE LANGUAGE IMMEDIATELY FOLLOWING
;
;ESCR
FBC4 : 32         pula                ;
FBC5 : DE 8A      ldx $8A             ;
FBC7 : 09         dex                 ;
FBC8 : 6E 00      jmp $00,x           ;jump addr X (,X 32)
;
;* STOP EITHER REPEATS A CALL, RETURNS FROM A CALL, OR ENDS SOUND.
;
;STOPR
FBCA : 96 A6      ldaa $A6            ;load A with addr A6
FBCC : 81 DF      cmpa #$DF           ;compare A with DFh
FBCE : 2B 01      bmi LFBD1           ;branch N=1 (*+3)
FBD0 : 39         rts                 ;return subroutine
;
FBD1 : D6 A3      ldab $A3            ;
FBD3 : C0 07      subb #$07           ;
FBD5 : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
;
FBD8 : DE A5      ldx $A5             ;
FBDA : 6A 02      dec $02,x           ;
FBDC : 2B 12      bmi LFBF0           ;branch PRET
;
FBDE : EE 00      ldx $00,x           ;
FBE0 : A6 00      ldaa $00,x          ;
FBE2 : 36         psha                ;
FBE3 : 08         inx                 ;
FBE4 : DF 8A      stx $8A             ;

;FBE6 : F6 00 A3   ldab $00A3          ;<- disasm error (FCB -10,0,TMPPER)
F89A : F6                             ;-10
F89B : 00                             ;0
F89C : A3                             ;TMPPER

FBE9 : C0 09      subb #$09           ;
FBEB : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
FBEE : 20 55      bra LFC45           ;
;PRET
FBF0 : EE 00      ldx $00,x           ;
FBF2 : 08         inx                 ;
FBF3 : DF 8A      stx $8A             ;
;XFBF5:
FBF5 : 96 A6      ldaa $A6            ;
FBF7 : 8B 03      adda #$03           ;
FBF9 : 97 A6      staa $A6            ;
FBFB : D6 A3      ldab $A3            ;
;XFBFD:
FBFD : C0 07      subb #$07           ;
;XFBFF:
FBFF : 01         nop                 ;
FC00 : 7E FB 1B   jmp LFB1B           ;jump PPLPE1
;
;* LDV N IS  PERVEL := N,  ADV N IS  PERVEL := PERVEL + N
;* IN THIS CASE  N IS A 12 BIT NUMBER, THE UPPER 4 BITS OF WHICH
;* ARE LO 4 BITS OF THE OPCODE BYTE.
;
;ADVR
FC03 : 08         inx                 ;
FC04 : 20 04      bra LFC0A           ;branch always (*+6)
;PRM141 LFC06:
FC06 : D7 A0      stab $A0            ;
FC08 : D7 A1      stab $A1            ;
;PRM142 LFC0A:
FC0A : D6 A9      ldab $A9            ;
FC0C : C4 0F      andb #$0F           ;
FC0E : CB F8      addb #$F8           ;
FC10 : C8 F8      eorb #$F8           ;
FC12 : 32         pula                ;
FC13 : 9B A1      adda $A1            ;
FC15 : D9 A0      adcb $A0            ;
FC17 : 97 A1      staa $A1            ;
FC19 : D7 A0      stab $A0            ;
;FC1B : F6 00 A3   ldab  X00A3         ;<- disasm error (FCB -10,0,TMPPER)
FC1B : F6                             ;-10
FC1C : 00                             ;0
FC1D : A3                             ;TMPPER
FC1E : C0 09      subb #$09           ;
FC20 : 7E FB 1B   jmp LFB1B           ;jump PPLPE1
;
;* DO R,N  CALLS RTN AT *+N  R TIMES.
;
;PDOR
FC23 : 96 A6      ldaa $A6            ;
FC25 : 80 03      suba #$03           ;
FC27 : 97 A6      staa $A6            ;
;
FC29 : DE A5      ldx $A5             ;
FC2B : 96 8B      ldaa $8B            ;
FC2D : D6 8A      ldab $8A            ;
FC2F : 8B FF      adda #$FF           ;
FC31 : C9 FF      adcb #$FF           ;
FC33 : E7 00      stab $00,x          ;
FC35 : A7 01      staa $01,x          ;
FC37 : D6 A9      ldab $A9            ;
FC39 : C4 0F      andb #$0F           ;
FC3B : E7 02      stab $02,x          ;
;
FC3D : D6 A3      ldab $A3            ;
FC3F : C0 0C      subb #$0C           ;
FC41 : BD FA D7   jsr LFAD7           ;jump sub NXTSMP
;
FC44 : 08         inx                 ;
;PTORE1
FC45 : 08         inx                 ;
FC46 : 08         inx                 ;
FC47 : 5F         clrb                ;
FC48 : 01         nop                 ;
;
;* TO N  SETS LOC TO BE *+N.
;
;PTOR
FC49 : 32         pula                ;
FC4A : 47         asra                ;
FC4B : 49         rola                ;
FC4C : C2 00      sbcb #$00           ;
FC4E : 9B 8B      adda $8B            ;
FC50 : D9 8A      adcb $8A            ;
FC52 : 97 8B      staa $8B            ;
;FC54 : F7 00 8A   stab $008A          ;<- disasm error (FCB -9,0,PCMDPT 41)
FC54 : F7                             ;-9
FC09 : 00                             ;0
FC0A : 8A                             ;PCMDPT
;
FC57 : D6 A3      ldab $A3            ;
FC59 : C0 07      subb #$07           ;
FC5B : 7E FB 1B   jmp LFB1B           ;jump PPLPE1
;*************************************;
; JMPTBL1
;*************************************;
;PCMDJT	FDB	LDPR,LDOR,LDVR,ADVR,LDPR,ESCR,PDOR,PTOR
;*		   0    1    2    3    4    5  	 6    7
;FCMDJT	FDB	ADHR,LDTR,ETBR,HIDR,FINR,ZTBR,FDOR,FTOR
;
;PCMDJT (Pitch Command Jump Table)
FC5E : FB A0                          ;LDPR 0
FC60 : FB B5                          ;LDOR 1
FC62 : FC 06                          ;LDVR 2
FC64 : FC 03                          ;ADVR 3
FC66 : FB A0                          ;LDPR 4
FC68 : FB C4                          ;ESCR 5
FC6A : FC 23                          ;PDOR 6
FC6C : FC 49                          ;PTOR 7
;FCMDJT (Filter Command Jump Table)
FC6E : FD E2                          ;ADHR 0
FC70 : FE 6B                          ;LDTR 1
FC72 : FD 1A                          ;ETBR 2
FC74 : FE 13                          ;HIDR 3
FC76 : FC 95                          ;FINR 4
FC78 : FE 24                          ;ZTBR 5
FC7A : FC C0                          ;FDOR 6
FC7C : FD 57                          ;FTOR 7
;
;
;SUBTTL	WAVE MODIFICATION
;
;* FENDR OVERLAY GETS RETURN ADDR FROM STACK.
;
;FRTURN
FC7E : DE AF      ldx X00AF
FC80 : EE 03      ldx $03,x
FC82 : 08         inx
FC83 : DF 88      stx X0088
FC85 : BD FD 51   jsr LFD51           ;jump sub FCMDNX
FC88 : 08         inx
FC89 : 39         rts                 ;return subroutine
;
;* REPEAT CALL.
;
;FDOAGN
FC8A : EE 00      ldx $00,x
FC8C : DF 88      stx X0088
FC8E : CE FD 57   ldx #$FD57          ;load X with FD57h (#FTOR)
FC91 : DF AD      stx X00AD
FC93 : 01         nop
FC94 : 39         rts
;
;* FIN DOES  REPEAT CALL, RETURN TO CALLER, STOP RTN DEPENDING ON STACK.
;
;FINR
FC95 : 96 B0      ldaa X00B0
FC97 : 81 B7      cmpa #$B7
FC99 : 23 12      bls LFCAD          ;branch C+Z=1 ALLDON
;
FC9B : DE AF      ldx X00AF
FC9D : 6A 02      dec $02,x
FC9F : 2A E9      bpl LFC8A          ;branch N=0 FDOAGN
;
FCA1 : 80 03      suba #$03
FCA3 : 97 B0      staa X00B0
FCA5 : CE FC 7E   ldx #$FC7E         ;load X with FC7Eh (#FRTURN)
FCA8 : DF AD      stx X00AD
FCAA : 6D 00      tst $00,x
FCAC : 39         rts
;
;ALLDON
FCAD : CE FC B5   ldx #$FCB5         ;load X with FCB5h (#WAST50)
FCB0 : DF AD      stx X00AD
FCB2 : 01         nop
FCB3 : 20 05      bra LFCBA          ;branch always WAST27
;
;WAST50
FCB5 : 08         inx
FCB6 : 08         inx
FCB7 : 01         nop
;WAST40
FCB8 : 8D 05      bsr LFCBF          ;branch sub WAST5
;WAST27
FCBA : 8D 03      bsr LFCBF          ;branch sub WAST5
;WAST14
FCBC : 6D 00      tst $00,x
;WAST7
FCBE : 01         nop
;WAST5
FCBF : 39         rts
;
;* CALL WITH REPEAT. REPEAT CNT 0(=1) TO 15 (=16) IS LO 4 BITS OF OPCODE.
;* NEXT BYTE IS DISPLACEMENT AS IN GO INSTRUCTION.  THE CTR AND RETURN
;* ADDRESS ARE SAVED ON A STACK.
;
;FDOR
FCC0 : DE AF      ldx X00AF
FCC2 : 96 88      ldaa X0088
FCC4 : A7 03      staa $03,x
FCC6 : 96 89      ldaa X0089
FCC8 : A7 04      staa $04,x
FCCA : 96 B9      ldaa X00B9
FCCC : 84 0F      anda #$0F
FCCE : A7 05      staa $05,x
;
FCD0 : 08         inx
FCD1 : CE FC D7   ldx #$FCD7         ;load X with FCD7h (#1$)
FCD4 : DF AD      stx X00AD
FCD6 : 39         rts
;
;* OVERLAY FOR CALL RTN.
;
;1$
FCD7 : 96 B0      ldaa X00B0
FCD9 : 8B 03      adda #$03
FCDB : 97 B0      staa X00B0
FCDD : CE FD 57   ldx #$FD57         ;load X with FD57h
FCE0 : DF AD      stx X00AD
FCE2 : 01         nop
FCE3 : 20 D5      bra LFCBA          ;branch always WAST27
;
;* GET NEXT FILTER COMMAND
;
;NXTFCM
FCE5 : 7D 00 AF   tst X00AF
FCE8 : 26 CE      bne LFCB8          ;branch Z=0 WAST40
;
FCEA : DE 88      ldx X0088
FCEC : A6 00      ldaa $00,x
FCEE : 08         inx
FCEF : DF 88      stx X0088
FCF1 : 97 B9      staa X00B9
FCF3 : 2A 05      bpl LFCFA          ;branch N=0 1$
;
FCF5 : 97 AF      staa X00AF
FCF7 : A6 00      ldaa $00,x
FCF9 : 39         rts
;1$
FCFA : CE FD 01   ldx #$FD01         ;load X with FD01h (#EXFCMD)
;    : FF 00 2D    "  -"    stx  X002D   ;<- disasm error (FCB -1,0,FVECT+1)
FCFD : FF 00 AD   stx X00AD
FD00 : 39         rts
;
;EXFCMD
FD01 : 5F         clrb
FD02 : 96 B9      ldaa X00B9
FD04 : 84 70      anda #$70
FD06 : 44         lsra
FD07 : 44         lsra
FD08 : 44         lsra
FD09 : 8B 6E      adda #$6E          ;add A with 6Eh (#FCMDJT!.255)
FD0B : C9 FC      adcb #$FC          ;add C+A with FCh (#FCMDJT/256)
FD0D : D7 B7      stab X00B7
FD0F : 97 B8      staa X00B8
;
FD11 : DE B7      ldx X00B7
FD13 : EE 00      ldx $00,x
FD15 : DF AD      stx X00AD
FD17 : DF AD      stx X00AD
FD19 : 39         rts
;
;* SET UP FOR REPEATED TABLE ADD.
;
;ETBR
FD1A : 96 B9      ldaa X00B9
FD1C : 84 0F      anda #$0F
FD1E : 4C         inca
FD1F : 4C         inca
FD20 : 97 AF      staa X00AF
FD22 : 20 1D      bra LFD41          ;branch always FHA1
;
;* LOOK FOR A NONZERO HARMONIC CHANGE AND PERFORM IT.  IF ENTIRE TABLE
;* IS ZERO WE HAVE FINISHED THE LAST COMMAND AND PICK UP THE NEXT ONE.
;
;FINDHA
FD24 : 7C 00 B2   inc X00B2
FD27 : DE B1      ldx X00B1
FD29 : 8C 00 E8   cpx #$00E8
FD2C : 27 13      beq LFD41          ;branch Z=1 FHA1
;
FD2E : A6 00      ldaa $00,x
FD30 : CE FD 6B   ldx #$FD6B         ;load X with FD6Bh (#ADDINI)
FD33 : 97 B5      staa X00B5
FD35 : 27 03      beq LFD3A          ;branch Z=1 (*+5)
FD37 : 7E FD 3D   jmp LFD3D          ;jump (*+6)
FD3A : CE FD 24   ldx #$FD24         ;load X with FD24h (#FINDHA)
FD3D : DF AD      stx X00AD
FD3F : 08         inx
FD40 : 39         rts
;
;FHA1:
FD41 : 86 DE      ldaa #$DE
;FD43 : B7 00 B2   staa X00B2          ;<- disasm error (FCB $B7,0,HAPTR+1)
FD43 : B7                             ;$B7
FCF8 : 00                             ;0
FCF9 : B2                             ;HAPTR+1
FD46 : CE FD 24   ldx #$FD24          ;load X with FD24h (#FINDHA)
FD49 : 7A 00 AF   dec X00AF
FD4C : 27 03      beq LFD51           ;branch Z=1 (*+5)
FD4E : 7E FD 54   jmp LFD54           ;jump (*+6)
;FCMDNX:
FD51 : CE FC E5   ldx #$FCE5          ;load X with FCE5h (#NXTFCM)
FD54 : DF AD      stx X00AD
FD56 : 39         rts
;
;* RELATIVE JUMP.
;
;FTOR
FD57 : DE 88      ldx X0088
FD59 : 5F         clrb
FD5A : A6 00      ldaa $00,x
FD5C : 4C         inca
FD5D : 47         asra
FD5E : 49         rola
FD5F : C2 00      sbcb #$00
FD61 : 9B 89      adda X0089
FD63 : D9 88      adcb X0088
FD65 : 97 89      staa X0089
FD67 : D7 88      stab X0088
;
FD69 : 20 E6      bra LFD51           ;branch always FCMDNX
;
;* SET UP FOR ADD OF HAMP * HARMONIC TO WAVE.
;
;ADDINI
FD6B : 96 B2      ldaa X00B2
FD6D : 80 DF      suba #$DF
FD6F : 48         asla
FD70 : 5F         clrb
FD71 : 9B 8F      adda X008F
FD73 : D9 8E      adcb X008E
FD75 : D7 B7      stab X00B7
FD77 : 97 B8      staa X00B8
;
FD79 : 86 80      ldaa #$80
FD7B : 97 B6      staa X00B6
;
FD7D : CE FD 88   ldx #$FD88          ;load X with FD88h (#2$)
FD80 : DF AD      stx X00AD
FD82 : CE 00 90   ldx #$0090
FD85 : DF B3      stx X00B3
FD87 : 39         rts
;
FD88 : DE B7      ldx X00B7
FD8A : EE 00      ldx $00,x
FD8C : DF B7      stx X00B7
FD8E : CE FD 9D   ldx #$FD9D          ;load X with FD9Dh (#ADDLP)
FD91 : DF AD      stx X00AD
;
FD93 : DE B1      ldx X00B1
FD95 : A6 09      ldaa $09,x
FD97 : 9B B5      adda X00B5
FD99 : A7 09      staa $09,x
FD9B : 08         inx
FD9C : 39         rts
;
;* ADD HAMP * HARMONIC FN TO WAVEFORM.
;
;ADDLP
FD9D : 96 B6      ldaa X00B6
FD9F : 27 1D      beq LFDBE           ;branch Z=1 1$
;
FDA1 : 74 00 B6   lsr X00B6
FDA4 : DE B3      ldx X00B3
FDA6 : E6 00      ldab $00,x
FDA8 : 94 B7      anda X00B7
FDAA : 26 09      bne LFDB5           ;branch Z=0 2$
;FDAC : FB 00 B5   addb X00B5          ;<- disasm error (FCB -5,0,HAMP)
FDAC : FB                             ;-5
FDAD : 00                             ;0
FDAE : B5                             ;HAMP
FDAF : E7 00      stab $00,x
FDB1 : 7C 00 B4   inc X00B4
FDB4 : 39         rts
;2$:
;FDB5 : F0 00 B5   subb X00B5          ;<- disasm error (FCB -16,0,HAMP)
FDB5 : F0                             ;-16
FDB6 : 00                             ;0
FDB7 : 35                             ;HAMP
FDB8 : E7 00      stab $00,x
FDBA : 7C 00 B4   inc X00B4
FDBD : 39         rts
;1$
FDBE : D6 B4      ldab X00B4
FDC0 : C1 A0      cmpb #$A0
FDC2 : 27 0B      beq LFDCF           ;branch Z=1 3$
FDC4 : D6 B8      ldab X00B8
FDC6 : D7 B7      stab X00B7
FDC8 : C6 80      ldab #$80
;FDCA : F7 00 B6   stab X00B6          ;<- disasm error (FCB -9,0,FMSK)
FDCA : F7                             ;-9
FDCB : 00                             ;0
FDCC : B6                             ;FMSK
FDCD : 20 0F      bra LFDDE           ;branch always 16$
;3$:
FDCF : CE FC E5   ldx #$FCE5          ;load X with FCE5h (#NXTFCM)
FDD2 : D6 AF      ldab X00AF
FDD4 : 26 03      bne LFDD9           ;branch Z=0 (*+5) FCNT <>0 MEANS IN TABLE LOOP
FDD6 : 7E FD DC   jmp LFDDC           ;jump (*+6) FCNT =0 MEANS EXECUTING COMMANDS
FDD9 : CE FD 24   ldx #$FD24          ;load X with FD24h (#FINDHA)
FDDC : DF AD      stx X00AD
;16$:
FDDE : 6D 00      tst $00,x
FDE0 : 08         inx
FDE1 : 39         rts
;
;* ADH H,N  LDH H,N  USE SAME RTN
;
;ADHR
;LDHR
FDE2 : 96 B9      ldaa X00B9
FDE4 : 84 07      anda #$07
FDE6 : 8B E0      adda #$E0
FDE8 : 97 B2      staa X00B2
;
FDEA : DE 88      ldx X0088
FDEC : A6 00      ldaa $00,x
FDEE : 08         inx
FDEF : DF 88      stx X0088
FDF1 : 97 B5      staa X00B5
;
FDF3 : CE FD FA   ldx #$FDFA          ;load X with FDFAh (#1$)
FDF6 : DF AD      stx X00AD
FDF8 : 08         inx
FDF9 : 39         rts
;1$
FDFA : DE B1      ldx X00B1
FDFC : 5F         clrb
FDFD : 96 B9      ldaa X00B9
FDFF : 8B F8      adda #$F8
FE01 : C2 00      sbcb #$00
FE03 : E4 09      andb $09,x
FE05 : 50         negb
FE06 : DB B5      addb X00B5
;ADHRE:
FE08 : D7 B5      stab X00B5
FE0A : CE FD 6B   ldx #$FD6B          ;load X with FD6Bh (#ADDINI)
FE0D : DF AD      stx X00AD
FE0F : 08         inx
FE10 : 08         inx
FE11 : 01         nop
FE12 : 39         rts
;
;* HARMONIC INCREMENT OR DECREMENT
;
;HIDR
FE13 : D6 B9      ldab X00B9
FE15 : 54         lsrb
FE16 : C4 07      andb #$07
FE18 : CA E0      orab #$E0           ;or A with E0h (#ADD2HA) ! ADD2HA MUST BE DIVISIBLE BY 8 !
FE1A    XFE1A:
FE1A : D7 B2      stab X00B2
FE1C : C6 FF      ldab #$FF
FE1E : C9 00      adcb #$00
FE20 : C9 00      adcb #$00
FE22 : 20 E4      bra LFE08           ;branch always ADHRE
;
;* CLEAR ADD2HA OR ALTER 0TH AMPLITUDE.
;
;ZTBR
FE24 : 96 B9      ldaa X00B9
FE26 : 47         asra
FE27 : 25 13      bcs LFE3C           ;branch C=1 ADCR
;
FE29 : CE 00 00   ldx #$0000
FE2C : DF E0      stx $E0            ;(ADD2HA)
FE2E : DF E2      stx $E2            ;(ADD2HA+2)
FE30 : DF E4      stx $E4            ;(ADD2HA+4)
FE32 : DF E6      stx $E6            ;(ADD2HA+6)
FE34 : 08         inx
;ATBRE
FE35 : CE FC E5   ldx #$FCE5         ;load X with FCE5h (#NXTFCM)
;FE38 : FF 00 AD   stx X00AD           ;<- disasm error (FCB -1,0,FVECT+1)
FE38 : FF                             ;-1
FE39 : 00                             ;0
FE3A : AD                             ;FVECT+1
;ATBRE1
FE3B : 39         rts
;
;ADCR:
FE3C : 85 02      bita #$02
FE3E : 26 0C      bne LFE4C           ;branch Z=0 ESC1 (BIT 2 FCMD =1 FOR ESCAPE)
FE40 : C6 DF      ldab #$DF
FE42 : D7 B2      stab X00B2
FE44 : CE FE 51   ldx #$FE51          ;load X with FE51h (#ADCRO)
;ADCRE:
FE47 : DF AD      stx X00AD
FE49 : 7E FC BC   jmp LFCBC           ;jump WAST14
;
;ESC1:
;FE4C : FE 00 88   ldx X0088           ;<- disasm error (FCB -2,0,FCMDPT)
FE4C : FE                             ;-2
FE01 : 00                             ;0
FE02 : 88                             ;FCMDPT
FE4F : 20 F6      bra LFE47
;
;ADCRO
FE51 : 5F         clrb
FE52 : 96 B9      ldaa X00B9
FE54 : 8B AE      adda #$AE           ;(#-82) CARRY IF LDH
FE56 : C2 00      sbcb #$00
FE58 : D4 E8      andb X00E8
FE5A : DE 88      ldx X0088
FE5C : A6 00      ldaa $00,x
FE5E : 08         inx
FE5F : DF 88      stx X0088
FE61 : 10         sba
FE62 : 97 B5      staa X00B5
FE64 : CE FD 6B   ldx #$FD6B          ;load X with FD6Bh (#ADDINI)
;FE67 : FF 00 AD   stx X00AD           ;<- disasm error (FCB -1,0,FVECT+1)
FE67 : FF                             ;-1
FE1C : 00                             ;0
FE1D : AD                             ;FVECT+1
FE6A : 39         rts
;
;* CHANGE SOME ADD2HA ENTRIES.
;
;LDTR
FE6B : C6 E0      ldab #$E0
FE6D : D7 B2      stab X00B2
FE6F : DE 88      ldx X0088
FE71 : E6 00      ldab $00,x
FE73 : D7 B7      stab X00B7
FE75 : 08         inx
FE76 : DF 88      stx X0088
FE78 : D6 B9      ldab X00B9
FE7A : 54         lsrb
FE7B : 24 18      bcc LFE95           ;branch C=0 5$
FE7D : CE FE AF   ldx #$FEAF          ;load X with FEAFh (#6$)
FE80 : DF AD      stx X00AD
FE82 : 39         rts
;4$
FE83 : 5F         clrb
FE84 : 96 B8      ldaa X00B8
FE86 : 47         asra
FE87 : C2 00      sbcb #$00
FE89 : DE B1      ldx X00B1
FE8B : E4 00      andb $00,x
FE8D : 1B         aba
FE8E : A7 00      staa $00,x
FE90 : 7C 00 B2   inc X00B2
FE93 : A6 00      ldaa $00,x
;5$:
FE95 : CE FE 9B   ldx #$FE9B         ;load X with FE9Bh (#1$)
FE98 : DF AD      stx X00AD
FE9A : 39         rts
;1$
FE9B : 78 00 B7   asl X00B7
FE9E : 25 13      bcs LFEB3          ;branch C=1 2$
FEA0 : 27 06      beq LFEA8          ;branch Z=1 3$
FEA2 : 7C 00 B2   inc X00B2
FEA5 : 7E FC BA   jmp LFCBA          ;jump WAST27
;3$:
FEA8 : BD FD 51   jsr LFD51          ;jump sub FCMDNX
FEAB : 6D 00      tst $00,x
FEAD : 01         nop
FEAE : 39         rts
;6$:
FEAF : 7A 00 B2   dec X00B2
FEB2 : 08         inx
;2$:
FEB3 : A6 00      ldaa $00,x
FEB5 : DE 88      ldx X0088
FEB7 : A6 00      ldaa $00,x
FEB9 : 08         inx
FEBA : DF 88      stx X0088
FEBC : 97 B8      staa X00B8
FEBE : CE FE 83   ldx #$FE83         ;load X with FE83h (#4$)
FEC1 : DF AD      stx X00AD
FEC3 : 39         rts
;*************************************;
;
;SUBTTL SOUND PROGRAMS
;
;* OPCODES ( ! SEPERATES NYBBLES  SPACES SEPERATE BYTES)
;
;* COMMON
;* WAIT N -N  ( 1<= N<= 127)
;* DO R,RTN $6!(R-1)  RTN - NEXT LOC
;* TO RTN $70   RTN - NEXT LOC
;* ESC  $55
;
;* FREQUENCY CONTROL
;* STOP          $80
;* LDP N         $01 N
;* ADP N         $00 N
;* LDV N         $2!(N&$F00) N&255
;* ADV N         $3!(N&$F00) N&255
;* LDO N         $11 N
;* ADO N         $10 N

;* WAVE CONTROL
;* FIN           $40
;* ZT            $50
;* ADH 0,N       $51 N
;* LDH 0,N       $53 N
;*        ( IN WHAT FOLLOWS 1<=H<=8  HHH = 8-H, A 3 BIT NUMBER)
;* ADH H,N       $0!0HHH
;* LDH H,N       $0!1HHH
;* IH H          $3!HHH1
;* DH H          $3!HHH0
;* DT R          $2!(R-1)
;* LT A0,...,A8  $1!000C 8765!4321 B0,...,B8
;*               WHERE C=1 IF ENTRY 0 IS ALTERED
;*                     N=1 IF ENTRY N IS ALTERED (N=1,...,8)
;*               BN=AN+AN+P WHERE P=1 IF AN IS TO BE ADDED TO ENTRY N
;*                                P=0 IF AN REPLACES ENTRY N
;*               BN IS PRESENT ONLY IF ENTRY N IS TO BE ALTERED

;* HARMONIC FUNCTIONS.  EACH BIT POSITION CORRESPONDS TO A WAVEFORM
;* POSITION.  IF THE BIT = 0, THE VALUE IS +1  IF THE BIT = 1, THE
;* VALUE IS -1.
;
;* THE HARMONICS ARE TREATED IN ORDER OF DECREASING AVERAGE FREQUENCY.
;
;*************************************;
;ODDTBL - this is messy
;*************************************; 
FEC4 : 0000 
FEC6 : 5555
FEC8 : 3333 
FECA : 25DA 
FECC : DA25 
FECE : C731

FED0 : 00 00 FF FF 01 FE 53 00
FED8 : 66 16 66 1A 66 1E 66 21
FEE0 : 66 24 08 FF E2 66 

;(LBL60)
FFE6 : 1F 66 
FEE8 : 18 66 11 66 09 66 01 40
FEF0 : 08 5A 08 00 FF 40 08 96 
FEF8 : 08 00 FF 40 08 C8 08 00
FF00 : 40 08 E6 08 00 40 08 FF 
FF08 : 08 00 40 10 20 80 CC CC

FF10 : 2F                              ;(DT 16)
FF11 : 80 E2 
FF13 : 20 
FF14 : 80 EC 
FF16 : 2F                              ;(DT 16)
FF17 : 80 E2
FF19 : 20 
FF1A : 80 EC 
FF1C : 2F                              ;(DT 16)
FF1D : 80 E2 
FF1F : 80 
FF20 : 64 C4                          ;(DO 5,LBL60)(-60)

FF22 : 80 53 00 08 05 0E
FF28 : 00 0D 05 FD 0D 00 0E 05 
FF30 : FD 70 F4 28 20 40 CE 

FF37 : 20 00                          ;(LDV 0)
FF39 : 80                             ;STOP
;
;(LBL11)
FF3A : 10 07                          ;(LT 7)
FF3C : 02 02 02 02                    ;<6,1>,<5,1>,<4,1>,<3,1>,
FF40 : 02 02                          ;<2,1>,<1,1>
FF42 : 2F                             ;(DT 16)
FF43 : 50                             ;(ZT)
FF44 : 10 05 FE                       ;(LT 0,<8,-1>)
FF47 : 27                             ;(DT 8)
FF48 : 10 04 FE                       ;(LT 0,<7,-1>)
FF4B : 27                             ;(DT 8)
FF4C : 10 07 00 FE                    ;(LT 1,<6,0>,<6,-1>)
FF50 : 27                             ;(DT 8)
FF51 : 10 06 00 FE                    ;(LT 1,<5,0>,<5,-1>)
FF55 : 27                             ;(DT 8)
FF56 : 10 07 00 FE                    ;(LT 1,<4,0>,<4,-1>)
FF5A : 27                             ;(DT 8)
FF5B : 10 06 00 FE                    ;(LT 1,<3,0>,<3,-1>)
FF5F : 27                             ;(DT 8)
FF60 : 10 01 00                       ;(LT 0,<2,0>)
FF63 : 27                             ;(DT 8)
FF64 : 10 02 00                       ;(LT 0,<1,0>)
FF67 : 70 D1                          ;(-47)(TO LBL11)
;(LBL12)
FF69 : 3C                             ;(NOT 60)
FF6A : 20 78                          ;(LDV 120)
FF6C : 60 01                          ;(DO 1,PPLD)
FF6E : 80                             ;STOP
;LBL PPLD
FF6F : 00 01                          ;(ADP 1)
FF71 : 00 FF                          ;(ADP -1)
FF73 : 00 FF                          ;(ADP -1)
FF75 : 00 01                          ;(ADP 1)
FF77 : 80                             ;STOP
;LBL
FF78 : 53 00 0C 1E 0B 00 0A 1E
FF80 : FE 0A 00 0B 1E FE 70 F4
FF88 : 96 2F D0 D0 20 00 EC EC 
FF90 : EC 70 FB 
FF93 : 80                             ;STOP
;*************************************;
;Siren Air Raid 
;*************************************;
;ZIREN:
FF94 : 86 FF      ldaa #$FF           ;load A with FFh
FF96 : 97 90      staa $90            ;store A in addr 90 (TOP)
FF98 : CE FE C0   ldx #$FEC0          ;load X with FEC0h
FF9B : DF 92      stx $92             ;store X in addr 92 (SWEEP)
FF9D : 86 20      ldaa #$20           ;load A with 20h
FF9F : CE FF E0   ldx #$FFE0          ;load X with FFE0h
FFA2 : 8D 05      bsr LFFA9           ;branch sub ZIREN0
FFA4 : 86 01      ldaa #$01           ;load A with 01h
FFA6 : CE 00 44   ldx #$0044          ;load X with 0044h
;ZIREN0:
FFA9 : 97 94      staa $94            ;store A in addr 94 (SLOPE)
FFAB : DF 95      stx $95             ;store X in addr 95 (END)
;ZIREN1:
FFAD : CE 00 10   ldx #$0010          ;load X with 0010h
;ZIREN2:
FFB0 : 8D 21      bsr LFFD3           ;branch sub ZIRTRI
FFB2 : 96 91      ldaa $91            ;load A with addr 91 (TOP+1)
FFB4 : 9B 93      adda $93            ;and A with addr 93 (SWEEP+1)
FFB6 : 97 91      staa $91            ;store A in addr 91 (TOP+1)
FFB8 : 96 90      ldaa $90            ;load A with addr 90 (TOP)
FFBA : 99 92      adca $92            ;add C+A + value in addr 92 (SWEEP)
FFBC : 97 90      staa $90            ;store A in addr 90 (TOP)
FFBE : 09         dex                 ;decr X
FFBF : 26 EF      bne LFFB0           ;branch Z=0 ZIREN2
FFC1 : 96 93      ldaa $93            ;load A with addr 93 (SWEEP+1)
FFC3 : 9B 94      adda $94            ;add A with addr 94 (SLOPE)
FFC5 : 97 93      staa $93            ;store A in addr 93 (SWEEP+1)
FFC7 : 24 03      bcc LFFCC           ;branch C=0 ZIREN5
FFC9 : 7C 00 92   inc $0092           ;incr addr 0092 (SWEEP)
;ZIREN5:
FFCC : DE 92      ldx $92             ;load X with addr 92 (SWEEP)
FFCE : 9C 95      cpx $95             ;compare X with addr 95 (END2)
FFD0 : 26 DB      bne LFFAD           ;branch Z=0 ZIREN1
FFD2 : 39         rts                 ;return subroutine
;* Flat Triangle Loop 
;ZIRTRI
FFD3 : 4F         clra                ;clear A
;ZIRLP1:
FFD4 : B7 20 02   staa $2002          ;store A in DAC output SOUND
FFD7 : 8B 20      adda #$20           ;add A with 20h
FFD9 : 24 F9      bcc LFFD4           ;branch C=0 ZIRLP1
FFDB : 8D 09      bsr LFFE6           ;branch sub ZIRT
FFDD : 86 E0      ldaa #$E0           ;load A with E0h
;ZIRLP4:
FFDF : B7 20 02   staa $2002          ;store A in DAC output SOUND
FFE2 : 80 20      suba #$20           ;subtract A with 20h
FFE4 : 24 F9      bcc LFFDF           ;branch C=0 ZIRLP4
;ZIRT:
FFE6 : D6 90      ldab $90            ;load B with addr 90 (TOP)
;ZIRLP2:
FFE8 : 86 02      ldaa #$02           ;load A with 02h
;ZIRLP3:
FFEA : 4A         deca                ;decr A
FFEB : 26 FD      bne LFFEA           ;branch Z=0 ZIRLP3
FFED : 5A         decb                ;decr B
FFEE : 26 F8      bne LFFE8           ;branch Z=0  ZIRLP2
FFF0 : 39         rts                 ;return subroutine
;*************************************;
;zero padding
FFF1 : 00 00 00 00 00 00 00
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F0 2E                          ;IRQ
FFFA : F0 01                          ;RESET SWI (software) 
FFFC : F0 39                          ;NMI   
FFFE : F0 01                          ;RESET (hardware) 

;--------------------------------------------------------------
