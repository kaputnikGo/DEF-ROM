        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Inferno.764
        ;
        ;  Size:    8192 bytes
        ;  Checksum:  E06E
        ;  CRC-32:    4E3123B8
        ;
        ;  Date:    Thu May 06 17:33:04 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ;Arcade Video game, 1984, upright.
        ;KLOV says similar hardware to Joust 2,Mystic Marathon and Turkey Shoot games
        ; PIA addr $2000, flipped ports, output SOUND $2002, Sound Select $2000
        ;
        ;include FNOISE, GWAVE routines and their loaders
        ;
        ;updated 6 May 2021
        ;
          org  $E000
        ;
E000 : AD                             ;checksum byte
;*************************************;
;RESET power on
;*************************************; 
E001 : 0F         sei                 ;set interrupt mask   
E002 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
E005 : 8D 02      bsr  LE009          ;branch sub
E007 : 20 FE      bra  LE007          ;branch always here, wait
;RESET1 LE009:
E009 : CE 20 00   ldx  #$2000         ;load X with 2000h (PIA addr)
E00C : 6F 01      clr  $01,x          ;clear addr X + 01h (2001 PIA1 CR port A)
E00E : 6F 03      clr  $03,x          ;clear addr X + 03h (2003 PIA1 CR port B)
E010 : 86 FF      ldaa  #$FF          ;load A with FFh
E012 : A7 02      staa  $02,x         ;store A in addr X + 02h (2002 PIA1 PR/DDR port B out)
E014 : C6 80      ldab  #$80          ;load B with 80h
E016 : E7 00      stab  $00,x         ;store B in addr X + 00h (2000 PIA1 PR/DDR port A in)
E018 : 86 37      ldaa  #$37          ;load A with value 37h (CBA low, IRQ allowed)
E01A : A7 01      staa  $01,x         ;store A in addr X + 01h (2001 PIA1 CR port A)
E01C : 86 3C      ldaa  #$3C          ;load A with 3Ch (CB2 set init high, no IRQs)
E01E : A7 03      staa  $03,x         ;store A in addr X + 03h (2003 PIA1 CR port B)
E020 : E7 00      stab  $00,x         ;store B in addr X + 00h (2000 PIA1 PR/DDR port A in)
E022 : 0E         cli                 ;clear interrupts
E023 : 86 C6      ldaa  #$C6          ;load A with C6h
E025 : 97 64      staa  $64           ;store A in addr 64
E027 : 39         rts                 ;return subroutine
;*************************************;
;LE028
E028 : 7F 00 59   clr  X0059
E02B : 7F 00 5A   clr  X005A
E02E : CE EE 89   ldx  #$EE89         ;FDB below
E031 : DF 6B      stx  X006B
E033 : CE EF 4B   ldx  #$EF4B         ;FDB below
E036 : DF 6D      stx  X006D
E038 : BD E7 F8   jsr  LE7F8          ;valid (FDB alphabet)
;LE03B:
E03B : 20 FE      bra  LE03B          ;branch always here
;*************************************;
;SYNTH LE03D 8 byte params
;*************************************;
E03D : BD E7 80   jsr  LE780          ;jump sub valid
E040 : BD E7 B7   jsr  LE7B7          ;jump sub valid
E043 : CE 00 00   ldx  #$0000
E046 : DF 5E      stx  X005E
E048 : 7F 00 60   clr  X0060
E04B : CE 00 20   ldx  #$0020
E04E : DF 5C      stx  X005C
;LE050:
E050 : 7A 00 41   dec  X0041
E053 : 27 03      beq  LE058          ;branch Z=1 
E055 : 7E E1 31   jmp  LE131          ;jump valid
;LE058:
E058 : 96 40      ldaa  X0040
E05A : 9B 59      adda  X0059
E05C : 9B 5A      adda  X005A
E05E : 97 41      staa  X0041
E060 : DE 5E      ldx  X005E
E062 : A6 00      ldaa  $00,x
E064 : D6 45      ldab  X0045
E066 : 27 10      beq  LE078          ;branch Z=1
E068 : D6 47      ldab  X0047
E06A : 26 0C      bne  LE078          ;branch Z=0
E06C : 16         tab
E06D : 54         lsrb
E06E : 27 03      beq  LE073          ;branch Z=1 
E070 : 54         lsrb
E071 : 26 02      bne  LE075          ;branch Z=0
;LE073:
E073 : C9 00      adcb  #$00
;LE075:
E075 : 10         sba
E076 : A7 00      staa  $00,x
;LE078:
E078 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
E07B : 96 48      ldaa  X0048
E07D : 27 14      beq  LE093          ;branch Z=1
E07F : DE 5C      ldx  X005C
E081 : A6 00      ldaa  $00,x
E083 : 16         tab
E084 : C4 0F      andb  #$0F
E086 : 44         lsra
E087 : 44         lsra
E088 : 44         lsra
E089 : 44         lsra
E08A : DB 60      addb  X0060
E08C : 24 03      bcc  LE091          ;branch C=0
E08E : 7C 00 5F   inc  X005F
;LE091:
E091 : D7 60      stab  X0060
;LE093:
E093 : 9B 5F      adda  X005F
E095 : 4C         inca
E096 : 94 72      anda  X0072
E098 : 97 5F      staa  X005F
E09A : 27 03      beq  LE09F          ;branch Z=1
E09C : 7E E1 31   jmp  LE131          ;jump valid
;LE09F:
E09F : DE 6D      ldx  X006D
E0A1 : A6 0E      ldaa  $0E,x
E0A3 : 27 0A      beq  LE0AF          ;branch Z=1
E0A5 : D6 65      ldab  X0065
E0A7 : 7C 00 65   inc  X0065
E0AA : 11         cba
E0AB : 27 02      beq  LE0AF          ;branch Z=1
E0AD : 20 39      bra  LE0E8          ;branch always
;LE0AF:
E0AF : 7F 00 65   clr  X0065
E0B2 : A6 0F      ldaa  $0F,x
E0B4 : 2B 11      bmi  LE0C7          ;branch N=1
E0B6 : 27 0A      beq  LE0C2          ;branch Z=1
E0B8 : D6 66      ldab  X0066
E0BA : 7C 00 66   inc  X0066
E0BD : 11         cba
E0BE : 27 02      beq  LE0C2          ;branch Z=1
E0C0 : 20 26      bra  LE0E8          ;branch always
;LE0C2:
E0C2 : 7F 00 66   clr  X0066
;LE0C5:
E0C5 : 20 FE      bra  LE0C5          ;branch always here
;LE0C7:
E0C7 : 84 7F      anda  #$7F
E0C9 : 27 0A      beq  LE0D5          ;branch Z=1
E0CB : D6 66      ldab  X0066
E0CD : 5C         incb
E0CE : 11         cba
E0CF : 27 04      beq  LE0D5          ;branch Z=1
E0D1 : D7 66      stab  X0066
E0D3 : 20 13      bra  LE0E8          ;branch always
;LE0D5:
E0D5 : EE 10      ldx  $10,x
E0D7 : DF 6D      stx  X006D
E0D9 : BD E7 F8   jsr  LE7F8          ;jump sub valid
E0DC : 7F 00 66   clr  X0066
E0DF : 7F 00 59   clr  X0059
E0E2 : 7F 00 5A   clr  X005A
E0E5 : 7E E0 3D   jmp  LE03D          ;jump valid above
;LE0E8:
E0E8 : 96 54      ldaa  X0054
E0EA : 27 05      beq  LE0F1          ;branch Z=1
E0EC : 7A 00 55   dec  X0055
E0EF : 26 2C      bne  LE11D          ;branch Z=0
;LE0F1:
E0F1 : DE 6B      ldx  X006B
E0F3 : A6 01      ldaa  $01,x
E0F5 : 97 54      staa  X0054
E0F7 : 97 55      staa  X0055 
E0F9 : 27 1A      beq  LE115          ;branch Z=1
E0FB : A6 00      ldaa  $00,x
E0FD : 97 40      staa  X0040
E0FF : 97 41      staa  X0041
E101 : A6 02      ldaa  $02,x
E103 : 97 42      staa  X0042
E105 : 97 43      staa  X0043
E107 : 08         inx
E108 : 08         inx
E109 : 08         inx
E10A : DF 6B      stx  X006B
E10C : 7F 00 59   clr  X0059
E10F : 7F 00 5A   clr  X005A
E112 : 7E E0 3D   jmp  LE03D          ;jump above valid
;LE115:
E115 : A6 00      ldaa  $00,x
;LE117:
E117 : 2C FE      bge  LE117          ;branch N+V=0 here
E119 : EE 03      ldx  $03,x
E11B : DF 6B      stx  X006B
;LE11D:
E11D : D6 45      ldab  X0045
E11F : 27 10      beq  LE131          ;branch Z=1
E121 : 96 47      ldaa  X0047
E123 : 26 09      bne  LE12E          ;branch Z=0
E125 : 96 46      ldaa  X0046
E127 : 97 47      staa  X0047
E129 : 5A         decb
E12A : D7 45      stab  X0045
E12C : 20 03      bra  LE131          ;branch always
;LE12E:
E12E : 4A         deca
E12F : 97 47      staa  X0047
;LE131:
E131 : 96 48      ldaa  X0048
E133 : 27 4B      beq  LE180          ;branch Z=1
E135 : 7A 00 49   dec  X0049
E138 : 26 46      bne  LE180          ;branch Z=0
E13A : 97 49      staa  X0049
E13C : D6 4D      ldab  X004D
E13E : 27 1D      beq  LE15D          ;branch Z=1
E140 : D6 4F      ldab  X004F
E142 : 26 19      bne  LE15D          ;branch Z=0
E144 : DE 5C      ldx  X005C
E146 : A6 00      ldaa  $00,x
E148 : 16         tab
E149 : 54         lsrb
E14A : 27 0C      beq  LE158          ;branch Z=1
E14C : 54         lsrb
E14D : 27 09      beq  LE158          ;branch Z=1
E14F : 54         lsrb
E150 : 27 06      beq  LE158          ;branch Z=1
E152 : 54         lsrb
E153 : 27 03      beq  LE158          ;branch Z=1
E155 : 54         lsrb
E156 : 26 02      bne  LE15A          ;branch Z=0
;LE158:
E158 : C9 00      adcb  #$00
;LE15A:
E15A : 10         sba
E15B : A7 00      staa  $00,x
;LE15D:
E15D : DE 5C      ldx  X005C
E15F : 96 5D      ldaa  X005D
E161 : 4C         inca
E162 : 97 5D      staa  X005D
E164 : 81 40      cmpa  #$40
E166 : 26 18      bne  LE180          ;branch Z=0
E168 : 80 20      suba  #$20
E16A : 97 5D      staa  X005D
E16C : D6 4D      ldab  X004D
E16E : 27 10      beq  LE180          ;branch Z=1
E170 : D6 4F      ldab  X004F
E172 : 27 05      beq  LE179          ;branch Z=1
E174 : 5A         decb
E175 : D7 4F      stab  X004F
E177 : 20 07      bra  LE180          ;branch always
;LE179:
E179 : D6 4E      ldab  X004E
E17B : D7 4F      stab  X004F
E17D : 7A 00 4D   dec  X004D
;LE180:
E180 : 96 58      ldaa  X0058
E182 : 85 01      bita  #$01
E184 : 27 2F      beq  LE1B5          ;branch Z=1
E186 : 7A 00 51   dec  X0051
E189 : 26 2D      bne  LE1B8          ;branch Z=0
E18B : 16         tab
E18C : CE 00 59   ldx  #$0059
E18F : C4 0C      andb  #$0C
E191 : 27 15      beq  LE1A8          ;branch Z=1
E193 : C1 04      cmpb  #$04
E195 : 26 05      bne  LE19C          ;branch Z=0
E197 : CE 00 44   ldx  #$0044
E19A : 20 0C      bra  LE1A8          ;branch always
;LE19C:
E19C : C1 08      cmpb  #$08
E19E : 26 05      bne  LE1A5          ;branch Z=0
E1A0 : CE 00 48   ldx  #$0048
E1A3 : 20 03      bra  LE1A8          ;branch always
;LE1A5:
E1A5 : CE 00 4C   ldx  #$004C
;LE1A8:
E1A8 : A6 00      ldaa  $00,x
E1AA : 94 57      anda  X0057
E1AC : 4C         inca
E1AD : A7 00      staa  $00,x
E1AF : D6 50      ldab  X0050
E1B1 : D7 51      stab  X0051
E1B3 : 20 03      bra  LE1B8          ;branch always
;LE1B5:
E1B5 : 7F 00 59   clr  X0059
;LE1B8:
E1B8 : 96 58      ldaa  X0058
E1BA : 85 02      bita  #$02
E1BC : 26 06      bne  LE1C4          ;branch Z=0
E1BE : 7F 00 5A   clr  X005A
E1C1 : 7E E0 50   jmp  LE050          ;jump above valid
;LE1C4:
E1C4 : 7A 00 53   dec  X0053
E1C7 : 26 44      bne  LE20D          ;branch Z=0 valid
E1C9 : D6 52      ldab  X0052
E1CB : D7 53      stab  X0053
E1CD : 4D         tsta
E1CE : 2B 08      bmi  LE1D8          ;branch N=1
E1D0 : CE 00 59   ldx  #$0059
E1D3 : 7F 00 5A   clr  X005A
E1D6 : 20 03      bra  LE1DB          ;branch always
;LE1D8:
E1D8 : CE 00 5A   ldx  #$005A
;LE1DB:
E1DB : 84 0C      anda  #$0C
E1DD : 27 15      beq  LE1F4          ;branch Z=1
E1DF : 81 04      cmpa  #$04
E1E1 : 26 05      bne  LE1E8          ;branch Z=0
E1E3 : CE 00 42   ldx  #$0042
E1E6 : 20 0C      bra  LE1F4          ;branch always
;LE1E8:
E1E8 : 81 08      cmpa  #$08
E1EA : 26 05      bne  LE1F1          ;branch Z=0
E1EC : CE 00 48   ldx  #$0048
E1EF : 20 03      bra  LE1F4          ;branch always
;LE1F1:
E1F1 : CE 00 4A   ldx  #$004A
;LE1F4:
E1F4 : A6 00      ldaa  $00,x
E1F6 : 81 01      cmpa  #$01
E1F8 : 22 03      bhi  LE1FD          ;branch C+Z=0
E1FA : 7F 00 5B   clr  X005B
;LE1FD:
E1FD : 91 56      cmpa  X0056
E1FF : 23 03      bls  LE204          ;branch C+Z=1
E201 : 7C 00 5B   inc  X005B
;LE204:
E204 : 4C         inca
E205 : D6 5B      ldab  X005B
E207 : 27 02      beq  LE20B          ;branch Z=1
E209 : 80 02      suba  #$02
;LE20B:
E20B : A7 00      staa  $00,x
;LE20D:
E20D : 7E E0 50   jmp  LE050          ;jump above valid
;*************************************;
;JUMP PARAMS LE210:
;*************************************;
E210 : 96 4E      ldaa  X004E
E212 : 84 0F      anda  #$0F
E214 : 27 1E      beq  LE234          ;branch Z=1
E216 : 81 01      cmpa  #$01
E218 : 26 03      bne  LE21D          ;branch Z=0
E21A : 7E E3 80   jmp  LE380          ;jump below valid
;LE21D:
E21D : 81 02      cmpa  #$02
E21F : 26 03      bne  LE224          ;branch Z=0
E221 : 7E E2 B8   jmp  LE2B8          ;jump valid
;LE224:
E224 : 81 03      cmpa  #$03
E226 : 26 03      bne  LE22B          ;branch Z=0
E228 : 7E E3 2D   jmp  LE32D          ;jump valid
;LE22B:
E22B : 81 04      cmpa  #$04
E22D : 26 03      bne  LE232          ;branch Z=0
E22F : 7E E2 7B   jmp  LE27B          ;jump valid
;LE232:
E232 : 20 FE      bra  LE232          ;branch always here
;*************************************;
;SYNTH LE234:
;*************************************;
E234 : BD E8 80   jsr  LE880          ;jump sub valid
;LE237:
E237 : 96 4A      ldaa  X004A
E239 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
;LE23C:
E23C : BD E9 47   jsr  LE947          ;jump sub valid
E23F : 96 40      ldaa  X0040
;LE241:
E241 : 4A         deca
E242 : 26 FD      bne  LE241          ;branch Z=0
E244 : B6 20 02   ldaa  $2002         ;load A with 2002h SOUND
E247 : 16         tab
E248 : 54         lsrb
E249 : 54         lsrb
E24A : 54         lsrb
;LE24B:
E24B : 10         sba
E24C : 7A 00 43   dec  X0043
E24F : 26 FA      bne  LE24B          ;branch Z=0
E251 : 9B 4B      adda  X004B
E253 : D6 42      ldab  X0042
E255 : D7 43      stab  X0043
E257 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
E25A : 7A 00 47   dec  X0047
E25D : 26 07      bne  LE266          ;branch Z=0
E25F : 7C 00 4B   inc  X004B
E262 : 96 46      ldaa  X0046
E264 : 97 47      staa  X0047
;LE266:
E266 : 7A 00 45   dec  X0045
E269 : 26 D1      bne  LE23C          ;branch Z=0
E26B : 7C 00 4A   inc  X004A
E26E : 96 44      ldaa  X0044
E270 : 97 45      staa  X0045
E272 : BD E8 D6   jsr  LE8D6          ;jump sub valid
E275 : 27 C0      beq  LE237          ;branch Z=1
E277 : 2A 97      bpl  LE210          ;branch N=0
;LE279:
E279 : 20 FE      bra  LE279          ;branch always here
;*************************************;
;LE27B:
E27B : 96 4A      ldaa  X004A
E27D : B7 20 02   staa  $2002         ;store A in DAC output SOUND
;LE280:
E280 : BD E9 47   jsr  LE947          ;jump sub valid
E283 : 96 40      ldaa  X0040
;LE285:
E285 : 4A         deca
E286 : 26 FD      bne  LE285          ;branch Z=0
E288 : B6 20 02   ldaa  $2002         ;load A with 2002h SOUND
E28B : 16         tab
E28C : 54         lsrb
E28D : 54         lsrb
E28E : 54         lsrb
;LE28F:
E28F : 10         sba
E290 : 7A 00 43   dec  X0043
E293 : 26 FA      bne  LE28F          ;branch Z=0
E295 : D6 42      ldab  X0042
E297 : D7 43      stab  X0043
E299 : 73 20 02   com  $2002          ;complement 1s in DAC output SOUND
E29C : 7A 00 45   dec  X0045
E29F : 26 0D      bne  LE2AE          ;branch Z=0
E2A1 : 96 44      ldaa  X0044
E2A3 : 97 45      staa  X0045
E2A5 : B6 20 02   ldaa  $2002         ;load A with 2002h SOUND
E2A8 : BD E8 68   jsr  LE868          ;jump sub valid
E2AB : B7 20 02   staa  $2002         ;store A in DAC output SOUND
;LE2AE:
E2AE : BD E8 D6   jsr  LE8D6          ;jump sub valid
E2B1 : 27 CD      beq  LE280          ;branch Z=1
;LE2B3:
E2B3 : 2B FE      bmi  LE2B3          ;branch N=1
E2B5 : 7E E2 10   jmp  LE210          ;jump valid
;*************************************;
;LE2B8:
E2B8 : CE 00 00   ldx  #$0000
E2BB : 7F 00 60   clr  X0060
E2BE : 86 A5      ldaa  #$A5
E2C0 : C6 5A      ldab  #$5A
E2C2 : 97 61      staa  X0061
E2C4 : D7 62      stab  X0062
E2C6 : 96 64      ldaa  X0064
E2C8 : 97 63      staa  X0063
;LE2CA:
E2CA : BD E7 48   jsr  LE748          ;jump sub valid
E2CD : A7 00      staa  $00,x
E2CF : A7 20      staa  $20,x
E2D1 : 08         inx
E2D2 : 8C 00 20   cpx  #$0020
E2D5 : 26 F3      bne  LE2CA          ;branch Z=0
E2D7 : CE 00 00   ldx  #$0000
E2DA : C6 0C      ldab  #$0C
E2DC : 86 80      ldaa  #$80
;LE2DE:
E2DE : A7 00      staa  $00,x
E2E0 : 08         inx
E2E1 : 5A         decb
E2E2 : 26 FA      bne  LE2DE          ;branch Z=0
E2E4 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
;LE2E7:
E2E7 : BD E9 47   jsr  LE947          ;jump sub valid
E2EA : CE 00 00   ldx  #$0000
;LE2ED:
E2ED : 96 40      ldaa  X0040
;LE2EF:
E2EF : 4A         deca
E2F0 : 26 FD      bne  LE2EF          ;branch Z=0
E2F2 : A6 01      ldaa  $01,x
E2F4 : AB 00      adda  $00,x
E2F6 : 44         lsra
E2F7 : A7 00      staa  $00,x
E2F9 : B6 20 02   ldaa  $2002         ;load A with 2002h SOUND
E2FC : 16         tab
E2FD : 54         lsrb
E2FE : 54         lsrb
E2FF : 54         lsrb
;LE300:
E300 : 10         sba
E301 : 7A 00 43   dec  X0043
E304 : 26 FA      bne  LE300          ;branch Z=0
E306 : E6 00      ldab  $00,x
E308 : 54         lsrb
E309 : 1B         aba
E30A : 84 FC      anda  #$FC
E30C : D6 42      ldab  X0042
E30E : D7 43      stab  X0043
E310 : B7 20 02   staa  X2002         ;store A in DAC output SOUND
E313 : 08         inx
E314 : 8C 00 3F   cpx  #$003F
E317 : 26 D4      bne  LE2ED          ;branch Z=0
E319 : A6 00      ldaa  $00,x
E31B : CE 00 00   ldx  #$0000
E31E : AB 00      adda  $00,x
E320 : 44         lsra
E321 : A7 3F      staa  $3F,x
E323 : BD E8 D6   jsr  LE8D6          ;jump sub valid
E326 : 27 BF      beq  LE2E7          ;branch Z=1
;LE328:
E328 : 2B FE      bmi  LE328          ;branch N=1 here
E32A : 7E E2 10   jmp  LE210          ;jump valid
;*************************************;
;LE32D:
E32D : CE 00 00   ldx  #$0000
E330 : 7F 00 60   clr  X0060
E333 : 86 A5      ldaa  #$A5
E335 : C6 5A      ldab  #$5A
E337 : 97 61      staa  X0061
E339 : D7 62      stab  X0062
E33B : 96 64      ldaa  X0064
E33D : 97 63      staa  X0063
;LE33F:
E33F : BD E7 48   jsr  LE748          ;jump sub valid
E342 : A7 00      staa  $00,x
E344 : 08         inx
E345 : 8C 00 40   cpx  #$0040
E348 : 26 F5      bne  LE33F          ;branch Z=0
E34A : 7F 20 02   clr  $2002          ;clear DAC output SOUND
;LE34D:
E34D : BD E9 47   jsr  LE947          ;jump sub valid
E350 : CE 00 00   ldx  #$0000
;LE353:
E353 : 96 40      ldaa  X0040
;LE355:
E355 : 4A         deca
E356 : 26 FD      bne  LE355          ;branch Z=0
E358 : B6 20 02   ldaa  $2002         ;load A with 2002h SOUND
E35B : 16         tab
E35C : 54         lsrb
E35D : 54         lsrb
E35E : 54         lsrb
;LE35F:
E35F : 10         sba
E360 : 7A 00 43   dec  X0043
E363 : 26 FA      bne  LE35F          ;branch Z=0
E365 : E6 00      ldab  $00,x
E367 : 54         lsrb
E368 : 1B         aba
E369 : D6 42      ldab  X0042
E36B : D7 43      stab  X0043
E36D : B7 20 02   staa  $2002         ;store A in DAC output SOUND
E370 : 08         inx
E371 : 8C 00 3F   cpx  #$003F
E374 : 26 DD      bne  LE353          ;branch Z=0
E376 : BD E8 D6   jsr  LE8D6          ;jump sub valid
E379 : 27 D2      beq  LE34D          ;branch Z=1
;LE37B:
E37B : 2B FE      bmi  LE37B          ;branch N=1
E37D : 7E E2 10   jmp  LE210          ;jump valid
;*************************************;
;LE380:
E380 : CE 00 00   ldx  #$0000
E383 : 86 FF      ldaa  #$FF
;LE385:
E385 : A7 00      staa  $00,x
E387 : 08         inx
E388 : 8C 00 07   cpx  #$0007
E38B : 26 F8      bne  LE385          ;branch Z=0
E38D : 7F 00 60   clr  X0060
E390 : 86 A5      ldaa  #$A5
E392 : C6 5A      ldab  #$5A
E394 : 97 61      staa  X0061
E396 : D7 62      stab  X0062
E398 : 96 64      ldaa  X0064
E39A : 97 63      staa  X0063
;LE39C:
E39C : 96 60      ldaa  X0060
E39E : D6 61      ldab  X0061
E3A0 : 53         comb
E3A1 : C5 09      bitb  #$09
E3A3 : 26 05      bne  LE3AA          ;branch Z=0
E3A5 : 53         comb
;LE3A6:
E3A6 : 46         rora
E3A7 : 56         rorb
E3A8 : 20 09      bra  LE3B3          ;branch always
;LE3AA:
E3AA : 53         comb
E3AB : C5 09      bitb  #$09
E3AD : 26 02      bne  LE3B1          ;branch Z=0
E3AF : 27 F5      beq  LE3A6          ;branch Z=1
;LE3B1:
E3B1 : 44         lsra
E3B2 : 56         rorb
;LE3B3:
E3B3 : 97 60      staa  X0060
E3B5 : D7 61      stab  X0061
E3B7 : A7 00      staa  $00,x
E3B9 : 08         inx
E3BA : 8C 00 3F   cpx  #$003F
E3BD : 26 DD      bne  LE39C          ;branch Z=0
;LE3BF:
E3BF : BD E9 47   jsr  LE947          ;jump sub valid
E3C2 : CE 00 00   ldx  #$0000
;LE3C5:
E3C5 : 96 40      ldaa  X0040
;LE3C7:
E3C7 : 4A         deca
E3C8 : 26 FD      bne  LE3C7          ;branch Z=0
E3CA : A6 01      ldaa  $01,x
E3CC : D6 63      ldab  X0063
E3CE : 58         aslb
E3CF : 24 02      bcc  LE3D3          ;branch C=0
E3D1 : D8 64      eorb  X0064
;LE3D3:
E3D3 : D7 63      stab  X0063
E3D5 : D4 4D      andb  X004D
E3D7 : 26 05      bne  LE3DE          ;branch Z=0
E3D9 : AB 00      adda  $00,x
E3DB : 44         lsra
E3DC : A7 00      staa  $00,x
;LE3DE:
E3DE : D6 63      ldab  X0063
E3E0 : 58         aslb
E3E1 : 24 02      bcc  LE3E5          ;branch C=0
E3E3 : D8 64      eorb  X0064
;LE3E5:
E3E5 : D7 63      stab  X0063
E3E7 : D4 4C      andb  X004C
E3E9 : 27 03      beq  LE3EE          ;branch Z=1
E3EB : 40         nega
E3EC : A7 00      staa  $00,x
;LE3EE:
E3EE : B6 20 02   ldaa  $2002         ;load A with 2002h SOUND
E3F1 : 16         tab
E3F2 : 54         lsrb
E3F3 : 54         lsrb
E3F4 : 54         lsrb
;LE3F5:
E3F5 : 10         sba
E3F6 : 7A 00 43   dec  X0043
E3F9 : 26 FA      bne  LE3F5          ;branch Z=0
E3FB : E6 00      ldab  $00,x
E3FD : 54         lsrb
E3FE : 1B         aba
E3FF : 84 FC      anda  #$FC
E401 : D6 42      ldab  X0042
E403 : D7 43      stab  X0043
E405 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
E408 : 08         inx
E409 : 8C 00 3F   cpx  #$003F
E40C : 26 B7      bne  LE3C5          ;branch Z=0
E40E : A6 00      ldaa  $00,x
E410 : CE 00 00   ldx  #$0000
E413 : D6 63      ldab  X0063
E415 : 58         aslb
E416 : 24 02      bcc  LE41A          ;branch C=0
E418 : D8 64      eorb  X0064
;LE41A:
E41A : D7 63      stab  X0063
E41C : D4 4D      andb  X004D
E41E : 26 05      bne  LE425          ;branch Z=0
E420 : AB 00      adda  $00,x
E422 : 44         lsra
E423 : A7 3F      staa  $3F,x
;LE425:
E425 : D6 63      ldab  X0063
E427 : 58         aslb
E428 : 24 02      bcc  LE42C          ;branch C=0
E42A : D8 64      eorb  X0064
;LE42C:
E42C : D7 63      stab  X0063
E42E : D4 4C      andb  X004C
E430 : 27 01      beq  LE433          ;branch Z=1
E432 : 40         nega
;LE433:
E433 : B7 20 02   staa  $2002         ;store A in DAC output SOUND
E436 : BD E8 D6   jsr  LE8D6          ;jump sub valid
E439 : 27 84      beq  LE3BF          ;branch Z=1
;LE43B:
E43B : 2B FE      bmi  LE43B          ;branch N=1 here
E43D : 7E E2 10   jmp  LE210          ;jump above valid
;*************************************;
;SYNTH LE440:
;*************************************;
E440 : BD E9 83   jsr  LE983          ;jump sub valid
E443 : CE 00 00   ldx  #$0000
E446 : DF 6F      stx  X006F
E448 : 86 60      ldaa  #$60
E44A : 97 42      staa  X0042
E44C : 97 43      staa  X0043
E44E : 86 09      ldaa  #$09
E450 : 97 49      staa  X0049
E452 : 97 4A      staa  X004A
E454 : 7F 00 44   clr  X0044
E457 : 86 FF      ldaa  #$FF
E459 : 97 47      staa  X0047
;LE45B:
E45B : 96 40      ldaa  X0040
;LE45D:
E45D : 4A         deca
E45E : 26 FD      bne  LE45D          ;branch Z=1
E460 : DE 6F      ldx  X006F
E462 : E6 00      ldab  $00,x
E464 : 96 44      ldaa  X0044
E466 : 84 1F      anda  #$1F
E468 : BD E7 64   jsr  LE764          ;jump sub ADDX
E46B : EB 10      addb  $10,x
E46D : D4 47      andb  X0047
E46F : F7 20 02   stab  $2002         ;store B in DAC output SOUND
E472 : 96 70      ldaa  X0070
E474 : 4C         inca
E475 : 97 70      staa  X0070
E477 : 81 40      cmpa  #$40
E479 : 26 E0      bne  LE45B          ;branch Z=0
E47B : CE 00 00   ldx  #$0000
E47E : DF 6F      stx  X006F
E480 : 96 48      ldaa  X0048
E482 : 27 1F      beq  LE4A3          ;branch Z=1
E484 : 7A 00 4A   dec  X004A
E487 : 26 1A      bne  LE4A3          ;branch Z=0
E489 : D6 49      ldab  X0049
E48B : D7 4A      stab  X004A
E48D : D6 40      ldab  X0040
E48F : C1 01      cmpb  #$01
E491 : 27 10      beq  LE4A3          ;branch Z=1
E493 : C1 25      cmpb  #$25
E495 : 27 0C      beq  LE4A3          ;branch Z=1
E497 : 44         lsra
E498 : 24 03      bcc  LE49D          ;branch C=0
E49A : 5A         decb
E49B : 20 04      bra  LE4A1          ;branch always
;LE49D:
E49D : 44         lsra
E49E : 24 03      bcc  LE4A3          ;branch C=0
E4A0 : 5C         incb
;LE4A1:
E4A1 : D7 40      stab  X0040
;LE4A3:
E4A3 : 7A 00 46   dec  X0046
E4A6 : 26 B3      bne  LE45B          ;branch Z=0
E4A8 : 7C 00 44   inc  X0044
E4AB : 96 45      ldaa  X0045
E4AD : 97 46      staa  X0046
E4AF : 20 AA      bra  LE45B          ;branch always
;*************************************;
;GWAVE Loader
;*************************************;
;GWLD:
;LE4B1:
E4B1 : 16         tab
E4B2 : 58         aslb
E4B3 : 1B         aba
E4B4 : 1B         aba
E4B5 : 1B         aba
E4B6 : CE FB B2   ldx  #$FBB2         ;load X with FBB2h (SVTAB)(SOUND VECTOR TABLE)
E4B9 : BD E7 64    "  d"    jsr  LE764
E4BC : A6 00    "  "    ldaa  $00,x
E4BE : 16    " "    tab
E4BF : 84 0F    "  "    anda  #$0F
E4C1 : 97 0C    "  "    staa  X000C
E4C3 : 54    "T"    lsrb
E4C4 : 54    "T"    lsrb
E4C5 : 54    "T"    lsrb
E4C6 : 54    "T"    lsrb
E4C7 : D7 0B    "  "    stab  X000B
E4C9 : A6 01    "  "    ldaa  $01,x
E4CB : 16    " "    tab
E4CC : 54    "T"    lsrb
E4CD : 54    "T"    lsrb
E4CE : 54    "T"    lsrb
E4CF : 54         lsrb
E4D0 : D7 0D    "  "    stab  X000D
E4D2 : 84 0F    "  "    anda  #$0F
E4D4 : 97 02    "  "    staa  X0002
E4D6 : DF 04      stx  $04            ;(TEMPX) SAVE INDEX
E4D8 : CE FA EF   ldx  #$FAEF         ;(#GWVTAB) CALC WAVEFORM ADDR
;LE4DB:
E4DB : 7A 00 02    "z  "    dec  X0002
E4DE : 2B 08    "+ "    bmi  LE4E8
E4E0 : A6 00    "  "    ldaa  $00,x
E4E2 : 4C    "L"    inca
E4E3 : BD E7 64    "  d"    jsr  LE764
E4E6 : 20 F3    "  "    bra  LE4DB
        ;
E4E8        LE4E8:
E4E8 : DF 10    "  "    stx  X0010
E4EA : BD E5 BC    "   "    jsr  LE5BC
E4ED : DE 04    "  "    ldx  X0004
E4EF : A6 02    "  "    ldaa  $02,x
E4F1 : 97 12    "  "    staa  X0012
E4F3 : 9B 73    " s"    adda  X0073
E4F5 : BD E5 CE    "   "    jsr  LE5CE
E4F8 : 7F 00 73    "  s"    clr  X0073
E4FB : DE 04    "  "    ldx  X0004
E4FD : A6 03    "  "    ldaa  $03,x
E4FF : 97 0E    "  "    staa  X000E
E501 : A6 04    "  "    ldaa  $04,x
E503 : 97 0F    "  "    staa  X000F
E505 : A6 05    "  "    ldaa  $05,x
E507 : 16    " "    tab
E508 : A6 06    "  "    ldaa  $06,x
E50A : CE FC 06   ldx  #$FC06         ;(#GFRTAB)
E50D : BD E7 64   jsr  LE764          ;ADDX
E510 : 17         tba
E511 : DF 13      stx  X0013
E513 : 7F 00 1B   clr  X001B
E516 : BD E7 64   jsr  LE764          ;ADDX
E519 : DF 15      stx  X0015
E51B : 39         rts
;*************************************;
;GWAVE routine
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
;LE51C:
E51C : 96 0B    "  "    ldaa  X000B
E51E : 97 1A    "  "    staa  X001A
E520        LE520:
E520 : DE 13    "  "    ldx  X0013
E522 : DF 06    "  "    stx  X0006
E524        LE524:
E524 : DE 06    "  "    ldx  X0006
E526 : 96 76    " v"    ldaa  X0076
E528 : 27 12    "' "    beq  LE53C
E52A : 2B 10    "+ "    bmi  LE53C
E52C : DF 69    " i"    stx  X0069
E52E : 9B 6A    " j"    adda  X006A
E530 : 97 6A    " j"    staa  X006A
E532 : 5F    "_"    clrb
E533 : D9 69    " i"    adcb  X0069
E535 : D7 69    " i"    stab  X0069
E537 : 7F 00 76    "  v"    clr  X0076
E53A : DE 69    " i"    ldx  X0069
E53C        LE53C:
E53C : A6 00    "  "    ldaa  $00,x
E53E : 9B 1B    "  "    adda  X001B
E540 : 97 19    "  "    staa  X0019
E542 : 9C 15    "  "    cpx  X0015
E544 : 27 26    "'&"    beq  LE56C
E546 : D6 0C    "  "    ldab  X000C
E548 : 08    " "    inx
E549 : DF 06    "  "    stx  X0006
E54B        LE54B:
E54B : CE 00 1C    "   "    ldx  #$001C
E54E        LE54E:
E54E : 96 19    "  "    ldaa  X0019
E550        LE550:
E550 : 4A    "J"    deca
E551 : 26 FD    "& "    bne  LE550
E553 : A6 00    "  "    ldaa  $00,x
E555 : B7 20 02    "   "    staa  X2002   ;SOUND
E558 : 08    " "    inx
E559 : 9C 17    "  "    cpx  X0017
E55B : 26 F1    "& "    bne  LE54E
E55D : 5A    "Z"    decb
E55E : 27 C4    "' "    beq  LE524
E560 : 08    " "    inx
E561 : 09    " "    dex
E562 : 08    " "    inx
E563 : 09    " "    dex
E564 : 08    " "    inx
E565 : 09    " "    dex
E566 : 08    " "    inx
E567 : 09    " "    dex
E568 : 01    " "    nop
E569 : 01    " "    nop
E56A : 20 DF    "  "    bra  LE54B
        ;
E56C        LE56C:
E56C : 96 0D    "  "    ldaa  X000D
E56E : 8D 5E    " ^"    bsr  LE5CE
E570 : 7A 00 1A    "z  "    dec  X001A
E573 : 26 AB    "& "    bne  LE520
E575 : 96 0E    "  "    ldaa  X000E
E577 : 27 42    "'B"    beq  LE5BB
E579 : 7A 00 0F    "z  "    dec  X000F
E57C : 27 3D    "'="    beq  LE5BB
E57E : 9B 1B    "  "    adda  X001B
E580 : 97 1B    "  "    staa  X001B
E582 : DE 13    "  "    ldx  X0013
E584 : 5F    "_"    clrb
E585        LE585:
E585 : 96 1B    "  "    ldaa  X001B
E587 : 7D 00 0E    "}  "    tst  X000E
E58A : 2B 06    "+ "    bmi  LE592
E58C : AB 00    "  "    adda  $00,x
E58E : 25 08    "% "    bcs  LE598
E590 : 20 0B    "  "    bra  LE59D
        ;
E592        LE592:
E592 : AB 00    "  "    adda  $00,x
E594 : 27 02    "' "    beq  LE598
E596 : 25 05    "% "    bcs  LE59D
E598        LE598:
E598 : 5D    "]"    tstb
E599 : 27 08    "' "    beq  LE5A3
E59B : 20 0F    "  "    bra  LE5AC
        ;
E59D        LE59D:
E59D : 5D    "]"    tstb
E59E : 26 03    "& "    bne  LE5A3
E5A0 : DF 13    "  "    stx  X0013
E5A2 : 5C    "\"    incb
E5A3        LE5A3:
E5A3 : 08    " "    inx
E5A4 : 9C 15    "  "    cpx  X0015
E5A6 : 26 DD    "& "    bne  LE585
E5A8 : 5D    "]"    tstb
E5A9 : 26 01    "& "    bne  LE5AC
E5AB : 39    "9"    rts
        ;
E5AC        LE5AC:
E5AC : DF 15    "  "    stx  X0015
E5AE : 96 0D    "  "    ldaa  X000D
E5B0 : 27 06    "' "    beq  LE5B8
E5B2 : 8D 08    "  "    bsr  LE5BC
E5B4 : 96 12    "  "    ldaa  X0012
E5B6 : 8D 16    "  "    bsr  LE5CE
E5B8        LE5B8:
E5B8 : 7E E5 1C    "~  "    jmp  LE51C
E5BB        LE5BB:
E5BB : 39    "9"    rts
;*************************************;
;Wave Transfer Routine 
;*************************************;
;WVTRAN
;LE5BC:
E5BC : CE 00 1C    "   "    ldx  #$001C
E5BF : DF 08    "  "    stx  X0008
E5C1 : DE 10    "  "    ldx  X0010
E5C3 : E6 00    "  "    ldab  $00,x
E5C5 : 08    " "    inx
E5C6 : BD E6 00    "   "    jsr  LE600
E5C9 : DE 08    "  "    ldx  X0008
E5CB : DF 17    "  "    stx  X0017
E5CD : 39    "9"    rts
;*************************************;
;Wave Decay Routinue 
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
;LE5CE:
E5CE : 4D    "M"    tsta
E5CF : 27 2E    "'."    beq  LE5FF
E5D1 : DE 10    "  "    ldx  X0010
E5D3 : DF 06    "  "    stx  X0006
E5D5 : CE 00 1C    "   "    ldx  #$001C
E5D8 : 97 03    "  "    staa  X0003
E5DA        LE5DA:
E5DA : DF 08    "  "    stx  X0008
E5DC : DE 06    "  "    ldx  X0006
E5DE : D6 03    "  "    ldab  X0003
E5E0 : D7 02    "  "    stab  X0002
E5E2 : E6 01    "  "    ldab  $01,x
E5E4 : 54    "T"    lsrb
E5E5 : 54    "T"    lsrb
E5E6 : 54    "T"    lsrb
E5E7 : 54    "T"    lsrb
E5E8 : 08    " "    inx
E5E9 : DF 06    "  "    stx  X0006
E5EB : DE 08    "  "    ldx  X0008
E5ED : A6 00    "  "    ldaa  $00,x
E5EF        LE5EF:
E5EF : 10    " "    sba
E5F0 : 7A 00 02    "z  "    dec  X0002
E5F3 : 26 FA    "& "    bne  LE5EF
E5F5 : A7 00    "  "    staa  $00,x
E5F7 : 08    " "    inx
E5F8 : 9C 17    "  "    cpx  X0017
E5FA : 26 DE    "& "    bne  LE5DA
E5FC : 7C 00 73    "| s"    inc  X0073
E5FF        LE5FF:
E5FF : 39         rts                 ;return subroutine
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS LE600:
E600 : 36    "6"    psha
E601        LE601:
E601 : A6 00    "  "    ldaa  $00,x
E603 : DF 06    "  "    stx  X0006
E605 : DE 08    "  "    ldx  X0008
E607 : A7 00    "  "    staa  $00,x
E609 : 08    " "    inx
E60A : DF 08    "  "    stx  X0008
E60C : DE 06    "  "    ldx  X0006
E60E : 08    " "    inx
E60F : 5A    "Z"    decb
E610 : 26 EF    "& "    bne  LE601
E612 : 32    "2"    pula
E613 : 39         rts                 ;return subroutine
;*************************************;
;FNSTBL, FDB jump table
;*************************************;
E614 : E61E                           ;CANNON
E616 : E623                           ;THRUST
;*************************************;
;Cannon FCB table
;*************************************;
;mem   18 14 17 11 Xh Xl
E618 : 01 01 01 FF 03 E8              ;
;*************************************;
;CANNON
;*************************************;
E61E : CE E6 18   ldx  #$E618         ;load X with E618h
E621 : 20 07      bra  LE62A          ;branch always FNOSLD
;*************************************;
;Thrust
;*************************************;
;THRUST
E623 : 4F         clra
E624 : 97 10      staa  $10           ;store A with value in addr 10 (DSFLG)
E626 : C6 03      ldab  #$03
E628 : 20 10      bra  LE63A          ;branch always FNOISE
;*************************************;
;FNOISE loader
;*************************************;
;FNOSLD:
;LE62A:
E62A : A6 00      ldaa  $00,x
E62C : 97 10      staa  X0010
E62E : A6 01      ldaa  $01,x
E630 : 97 11      staa  X0011
E632 : A6 02      ldaa  $02,x
E634 : E6 03      ldab  $03,x
E636 : EE 04      ldx  $04,x
E638 : 20 00      bra  LE63A          ;branch always FNOISE
;*************************************;
;Filtered Noise Routine
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
;LE63A:
E63A : 97 0F    "  "    staa  X000F
E63C : D7 0A    "  "    stab  X000A
E63E : DF 0D    "  "    stx  X000D
E640 : 7F 00 0C    "   "    clr  X000C
E643 : 86 AF    "  "    ldaa  #$AF
E645 : B7 20 02    "   "    staa  X2002   ;SOUND
E648 : 97 00    "  "    staa  X0000
E64A : 97 01    "  "    staa  X0001
;FNOIS0 LE64C:
E64C : DE 0D    "  "    ldx  X000D
E64E : B6 20 02    "   "    ldaa  X2002   ;SOUND
;FNOIS1 LE651:
E651 : 16    " "    tab
E652 : 54    "T"    lsrb
E653 : 54    "T"    lsrb
E654 : 54    "T"    lsrb
E655 : D8 01    "  "    eorb  X0001
E657 : 54    "T"    lsrb
E658 : 76 00 00    "v  "    ror  X0000
E65B : 76 00 01    "v  "    ror  X0001
E65E : D6 0A    "  "    ldab  X000A
E660 : 7D 00 10    "}  "    tst  X0010
E663 : 27 04    "' "    beq  LE669
E665 : D4 00    "  "    andb  X0000
E667 : DB 11    "  "    addb  X0011
E669        LE669:
E669 : D7 0B    "  "    stab  X000B
E66B : D6 0C    "  "    ldab  X000C
E66D : 91 01    "  "    cmpa  X0001
E66F : 22 12    "" "    bhi  LE683
E671        LE671:
E671 : 09    " "    dex
E672 : 27 26    "'&"    beq  LE69A
E674 : B7 20 02    "   "    staa  X2002   ;SOUND
E677 : DB 0C    "  "    addb  X000C
E679 : 99 0B    "  "    adca  X000B
E67B : 25 16    "% "    bcs  LE693
E67D : 91 01    "  "    cmpa  X0001
E67F : 23 F0    "# "    bls  LE671
E681 : 20 10    "  "    bra  LE693
        ;
E683        LE683:
E683 : 09    " "    dex
E684 : 27 14    "' "    beq  LE69A
E686 : B7 20 02    "   "    staa  X2002   ;SOUND
E689 : D0 0C    "  "    subb  X000C
E68B : 92 0B    "  "    sbca  X000B
E68D : 25 04    "% "    bcs  LE693
E68F : 91 01    "  "    cmpa  X0001
E691 : 22 F0    "" "    bhi  LE683
E693        LE693:
E693 : 96 01    "  "    ldaa  X0001
E695 : B7 20 02    "   "    staa  X2002   ;SOUND
E698 : 20 B7    "  "    bra  LE651
        ;
E69A        LE69A:
E69A : D6 0F    "  "    ldab  X000F
E69C : 27 B3    "' "    beq  LE651
E69E : 96 0A    "  "    ldaa  X000A
E6A0 : D6 0C    "  "    ldab  X000C
E6A2 : 44    "D"    lsra
E6A3 : 56    "V"    rorb
E6A4 : 44    "D"    lsra
E6A5 : 56    "V"    rorb
E6A6 : 44    "D"    lsra
E6A7 : 56    "V"    rorb
E6A8 : 43    "C"    coma
E6A9 : 50    "P"    negb
E6AA : 82 FF    "  "    sbca  #$FF
E6AC : DB 0C    "  "    addb  X000C
E6AE : 99 0A    "  "    adca  X000A
E6B0 : D7 0C    "  "    stab  X000C
E6B2 : 97 0A    "  "    staa  X000A
E6B4 : 26 96    "& "    bne  LE64C
E6B6 : C1 07    "  "    cmpb  #$07
E6B8 : 26 92    "& "    bne  LE64C
E6BA : 39         rts                 ;return subroutine
;*************************************;
;SYNTH LE6BB:
;*************************************;
E6BB : DE 6D      ldx  X006D          ;
E6BD : 86 FF      ldaa  #$FF
E6BF : B7 20 02   staa  $2002         ;store A in DAC output SOUND
;LE6C2:
E6C2 : 08         inx
E6C3 : 08         inx
E6C4 : 08         inx
E6C5 : 08         inx
E6C6 : 08         inx
;LE6C7:
E6C7 : A6 03      ldaa  $03,x
E6C9 : 97 03      staa  X0003
E6CB : A6 04      ldaa  $04,x
E6CD : B7 20 02   staa  $2002         ;store A in DAC output SOUND
E6D0 : A6 01      ldaa  $01,x
E6D2 : 97 02      staa  X0002
E6D4 : E6 00      ldab  $00,x
E6D6 : 2A 0F      bpl  LE6E7          ;branch N=0
E6D8 : C5 7F      bitb  #$7F
;LE6DA:
E6DA : 27 FE      beq  LE6DA          ;branch Z=1 here
;LE6DC:
E6DC : 86 FF      ldaa  #$FF
;LE6DE:
E6DE : 4A         deca
E6DF : 26 FD      bne  LE6DE          ;branch Z=0
E6E1 : 5A         decb
E6E2 : 26 F8      bne  LE6DC          ;branch Z=0
E6E4 : 08         inx
E6E5 : 20 E0      bra  LE6C7          ;branch always
;LE6E7:
E6E7 : D7 01      stab  X0001
E6E9 : A6 02      ldaa  $02,x
E6EB : 97 00      staa  X0000
;LE6ED:
E6ED : 5A         decb
E6EE : 26 FD      bne  LE6ED          ;branch Z=0
E6F0 : 73 20 02   com  $2002          ;complement 1s in DAC output SOUND
E6F3 : D6 01      ldab  X0001
E6F5 : 4A         deca
E6F6 : 26 F5      bne  LE6ED          ;branch Z=0
E6F8 : 96 00      ldaa  X0000
E6FA : DB 03      addb  X0003
E6FC : D7 01      stab  X0001
E6FE : D1 02      cmpb  X0002
E700 : 26 EB      bne  LE6ED          ;branch Z=0
E702 : 20 BE      bra  LE6C2          ;branch always
;*************************************;
;E704 data? no link yet
E704 : 2A 1B      bpl  LE721
E706 : 32    "2"    pula
E707 : FF FF D8    "   "    stx  XFFD8
E70A : 2E 1D    ". "    bgt  LE729
E70C : 22 FF    "" "    bhi  LE70D
E70E : FF 23 49    " #I"    stx  X2349
E711 : 0F    " "    sei
E712 : 01    " "    nop
E713 : FF 80 2A    "  *"    stx  X802A
E716 : 1B    " "    aba
E717 : 32    "2"    pula
E718 : FF FF D8    "   "    stx  XFFD8
E71B : 2E 1D    ". "    bgt  LE73A
E71D : 22 FF    "" "    bhi  LE71E
E71F : FF 23 41    " #A"    stx  X2341
E722 : 0F    " "    sei
E723 : 01    " "    nop
E724 : FF 80 2D    "  -"    stx  X802D
E727 : 0D    " "    sec
E728 : 20 FF    "  "    bra  LE729
        ;
E72A : FF D8 30    "  0"    stx  XD830
E72D : 19    " "    daa
E72E : 22 FF    "" "    bhi  LE72F
E730 : FF 19 47    "  G"    stx  X1947
E733 : 0C    " "    clc
E734 : 01    " "    nop
E735 : FF 80 49    "  I"    stx  X8049
E738 : 31    "1"    ins
        ;
E739 : 12    " "    db  $12
        ;
E73A        LE73A:
E73A : FF FF D8    "   "    stx  XFFD8
E73D : 53    "S"    comb
        ;
E73E : 3A 15    ": "    db  $3A, $15
        ;
E740 : FF FF 38    "  8"    stx  XFF38
        ;
E743 : 61    "a"    db  $61
        ;
E744 : 10    " "    sba
E745 : 01         nop
E746 : FF 80 
;*************************************;
;LE748
;*************************************;
E748 : 96 60      ldaa $60            ;load A with addr 60
E74A : D6 61      ldab $61            ;load B with addr 61
E74C : 53         comb                ;complement 1s B
E74D : C5 09      bitb  #$09          ;bit test B with 09h
E74F : 26 05      bne  LE756          ;branch Z=0
E751 : 53         comb                ;complement 1s B
;LE752:
E752 : 46         rora                ;rotate right A
E753 : 56         rorb                ;rotate right B
E754 : 20 09      bra  LE75F          ;branch always
;LE756:
E756 : 53         comb                ;complement 1s B
E757 : C5 09      bitb  #$09          ;bit test B with 09h
E759 : 26 02      bne  LE75D          ;branch Z=0
E75B : 27 F5      beq  LE752          ;branch Z=1
;LE75D:
E75D : 44         lsra                ;logic shift right A
E75E : 56         rorb                ;rotate right B
;LE75F:
E75F : 97 60      staa  $60           ;store A in addr 60
E761 : D7 61      stab  $61           ;store B in addr 61
E763 : 39         rts                 ;return subroutine
;*************************************;
;* ADD A TO INDEX REGISTER
;*************************************;
;ADDX: LE764:
E764 : DF 69      stx  X0069
E766 : 9B 6A      adda  X006A
E768 : 97 6A      staa  X006A
E76A : 96 69      ldaa  X0069
E76C : 89 00      adca  #$00
E76E : 97 69      staa  X0069
E770 : DE 69      ldx  X0069
E772 : 39         rts
;*************************************;
;ADD AB TO INDEX REGISTER
;*************************************;
;ADDX2 LE773:
E773 : DF 69      stx  X0069
E775 : DB 6A      addb  X006A
E777 : D7 6A      stab  X006A
E779 : 99 69      adca  X0069
E77B : 97 69      staa  X0069
E77D : DE 69      ldx  X0069
E77F : 39         rts
;*************************************;
;PARAM LE780:
;*************************************;
E780 : CE 00 00   ldx  #$0000
E783 : DF 5E      stx  X005E
E785 : DE 6F      ldx  X006F
E787 : DF 69      stx  X0069
;LE789:
E789 : DE 69      ldx  X0069
E78B : A6 00      ldaa  $00,x
E78D : 08         inx
E78E : DF 69      stx  X0069
E790 : D6 42      ldab  X0042
E792 : 27 17      beq  LE7AB          ;branch Z=1
E794 : D7 67      stab  X0067
;LE796:
E796 : 16         tab
E797 : 54         lsrb
E798 : 27 09      beq  LE7A3          ;branch Z=1
E79A : 54         lsrb
E79B : 27 06      beq  LE7A3          ;branch Z=1
E79D : 54         lsrb
E79E : 27 03      beq  LE7A3
E7A0 : 54         lsrb
E7A1 : 26 02      bne  LE7A5          ;branch Z=0
;LE7A3:
E7A3 : C9 00      adcb  #$00
;LE7A5:
E7A5 : 10         sba
E7A6 : 7A 00 67   dec  X0067
E7A9 : 26 EB      bne  LE796          ;branch Z=0
;LE7AB:
E7AB : DE 5E      ldx  X005E
E7AD : A7 00      staa  $00,x
E7AF : 7C 00 5F   inc  X005F
E7B2 : 9C 71      cpx  X0071
E7B4 : 26 D3      bne  LE789          ;branch Z=0
E7B6 : 39         rts                 ;
;*************************************;
;PARAM loader LE7B7:
;*************************************;
E7B7 : CE 00 20   ldx  #$0020
E7BA : DF 5C      stx  X005C
E7BC : CE ED 2A   ldx  #$ED2A         ;load X with ED2Ah 
E7BF : DF 69      stx  X0069
;LE7C1:
E7C1 : DE 69      ldx  X0069
E7C3 : A6 00      ldaa  $00,x
E7C5 : 08         inx
E7C6 : 8C ED 4A   cpx  #$ED4A         ;compare X with ED4Ah
E7C9 : 26 03      bne  LE7CE          ;branch Z=0
E7CB : CE ED 2A   ldx  #$ED2A         ;load X with ED2Ah 
;LE7CE:
E7CE : DF 69      stx  X0069
E7D0 : D6 4A      ldab  X004A
E7D2 : 27 17      beq  LE7EB          ;branch Z=1
E7D4 : D7 4B      stab  X004B
;LE7D6:
E7D6 : 16         tab
E7D7 : 54         lsrb
E7D8 : 27 09      beq  LE7E3          ;branch Z=1
E7DA : 54         lsrb
E7DB : 27 06      beq  LE7E3          ;branch Z=1
E7DD : 54         lsrb
E7DE : 27 03      beq  LE7E3          ;branch Z=1
E7E0 : 54         lsrb
E7E1 : 26 02      bne  LE7E5          ;branch Z=0
;LE7E3:
E7E3 : C9 00      adcb  #$00
;LE7E5:
E7E5 : 10         sba
E7E6 : 7A 00 4B   dec  X004B
E7E9 : 26 EB      bne  LE7D6          ;branch Z=0
;LE7EB:
E7EB : DE 5C      ldx  X005C
E7ED : A7 00      staa  $00,x
E7EF : 7C 00 5D   inc  X005D
E7F2 : 8C 00 3F   cpx  #$003F
E7F5 : 26 CA      bne  LE7C1          ;branch Z=0
E7F7 : 39         rts                 ;return subroutine
;*************************************;
;LE7F8:
;*************************************;
E7F8 : 36         psha                ;push A into stack then SP - 1
E7F9 : DE 6D      ldx  $6D            ;load X with addr 6D
E7FB : A6 00      ldaa  $00,x         ;load A with X+00h
E7FD : 97 40    " @"    staa  X0040
E7FF : 97 41    " A"    staa  X0041
E801 : A6 01      ldaa  $01,x         ;load A with X+01h
E803 : 97 42    " B"    staa  X0042
E805 : 97 43    " C"    staa  X0043
E807 : A6 02    "  "    ldaa  $02,x
E809 : 97 44    " D"    staa  X0044
E80B : 97 45    " E"    staa  X0045
E80D : A6 03    "  "    ldaa  $03,x
E80F : 97 46    " F"    staa  X0046
E811 : 97 47    " G"    staa  X0047
E813 : A6 04    "  "    ldaa  $04,x
E815 : 97 48    " H"    staa  X0048
E817 : 97 49    " I"    staa  X0049
E819 : A6 05    "  "    ldaa  $05,x
E81B : 97 4A    " J"    staa  X004A
E81D : 97 4B    " K"    staa  X004B
E81F : A6 06    "  "    ldaa  $06,x
E821 : 97 4C    " L"    staa  X004C
E823 : 97 4D    " M"    staa  X004D
E825 : A6 07    "  "    ldaa  $07,x
E827 : 97 4E    " N"    staa  X004E
E829 : 97 4F    " O"    staa  X004F
E82B : A6 08    "  "    ldaa  $08,x
E82D : 97 50    " P"    staa  X0050
E82F : 97 51    " Q"    staa  X0051
E831 : A6 09    "  "    ldaa  $09,x
E833 : 97 52    " R"    staa  X0052
E835 : 97 53    " S"    staa  X0053
E837 : A6 0A    "  "    ldaa  $0A,x
E839 : 97 54    " T"    staa  X0054
E83B : 97 55    " U"    staa  X0055
E83D : A6 0B    "  "    ldaa  $0B,x
E83F : 97 56    " V"    staa  X0056
E841 : A6 0C    "  "    ldaa  $0C,x
E843 : 97 57    " W"    staa  X0057
E845 : A6 0D    "  "    ldaa  $0D,x
E847 : 97 58    " X"    staa  X0058
E849 : 85 10    "  "    bita  #$10
E84B : 26 19    "& "    bne  LE866
E84D : DE 6B    " k"    ldx  X006B
E84F : A6 00    "  "    ldaa  $00,x
E851 : 97 40    " @"    staa  X0040
E853 : 97 41    " A"    staa  X0041
E855 : A6 01    "  "    ldaa  $01,x
E857 : 97 54    " T"    staa  X0054
E859 : 97 55    " U"    staa  X0055
E85B : A6 02    "  "    ldaa  $02,x
E85D : 97 42    " B"    staa  X0042
E85F : 97 43    " C"    staa  X0043
E861 : 08         inx                 ;incr X
E862 : 08         inx                 ;incr X
E863 : 08         inx                 ;incr X
E864 : DF 6B      stx  X006B          ;store X in addr 6B
;LE866:
E866 : 32         pula                ;SP + 1 pull stack into A
E867 : 39         rts                 ;return subroutine
;*************************************;
;LE868:
E868 : 91 50      cmpa  X0050         ;compare A with addr 50
E86A : 22 03      bhi  LE86F          ;branch C+Z=0
E86C : 7F 00 52   clr  X0052
;LE86F:
E86F : 91 51      cmpa  X0051
E871 : 23 03      bls  LE876          ;branch C+Z=1
E873 : 7C 00 52   inc  X0052
;LE876:
E876 : 4C         inca
E877 : D6 52      ldab  X0052
E879 : 27 02      beq  LE87D          ;branch Z=1
E87B : 80 02      suba  #$02
;LE87D:
E87D : 97 53      staa  X0053
E87F : 39         rts                 ;return subroutine
;*************************************;
;LE880:
E880 : DE 6B    " k"    ldx  X006B
E882 : A6 00    "  "    ldaa  $00,x
E884 : 97 40    " @"    staa  X0040
E886 : 97 41    " A"    staa  X0041
E888 : A6 01    "  "    ldaa  $01,x
E88A : 97 48    " H"    staa  X0048
E88C : 97 49    " I"    staa  X0049
E88E : DE 6D    " m"    ldx  X006D
E890 : A6 01    "  "    ldaa  $01,x
E892 : 97 42    " B"    staa  X0042
E894 : 97 43    " C"    staa  X0043
E896 : A6 02    "  "    ldaa  $02,x
E898 : 97 44    " D"    staa  X0044
E89A : 97 45    " E"    staa  X0045
E89C : A6 03    "  "    ldaa  $03,x
E89E : 97 46    " F"    staa  X0046
E8A0 : 97 47    " G"    staa  X0047
E8A2 : A6 05    "  "    ldaa  $05,x
E8A4 : 97 4A    " J"    staa  X004A
E8A6 : A6 06    "  "    ldaa  $06,x
E8A8 : 97 4B    " K"    staa  X004B
E8AA : A6 07    "  "    ldaa  $07,x
E8AC : 97 4C    " L"    staa  X004C
E8AE : A6 08    "  "    ldaa  $08,x
E8B0 : 97 4D    " M"    staa  X004D
E8B2 : A6 0A    "  "    ldaa  $0A,x
E8B4 : 97 4F    " O"    staa  X004F
E8B6 : A6 09    "  "    ldaa  $09,x
E8B8 : 97 4E    " N"    staa  X004E
E8BA : 85 20      bita  #$20          ;bit test A with 20h
E8BC : 27 07      beq  LE8C5          ;branch Z=1
E8BE : BD E7 48   jsr  LE748          ;jump sub valid
E8C1 : 97 4A    " J"    staa  X004A
E8C3 : 96 4E    " N"    ldaa  X004E
;LE8C5:
E8C5 : 85 10      bita  #$10          ;bit test A with 10h
E8C7 : 27 0C      beq  LE8D5          ;branch Z=1
E8C9 : A6 00      ldaa  $00,x
E8CB : 97 40      staa  X0040
E8CD : 97 41      staa  X0041
E8CF : A6 04      ldaa  $04,x
E8D1 : 97 48      staa  X0048
E8D3 : 97 49      staa  X0049
;LE8D5:
E8D5 : 39         rts                 ;return subroutine
;*************************************;
;PARAM LE8D6:
;*************************************;
E8D6 : DE 6D      ldx  X006D
E8D8 : A6 0B      ldaa  $0B,x
E8DA : 27 0A      beq  LE8E6          ;branch Z=1
E8DC : D6 65      ldab  X0065
E8DE : 5C         incb
E8DF : 11         cba
E8E0 : 27 04      beq  LE8E6          ;branch Z=1
E8E2 : D7 65      stab  X0065
E8E4 : 20 32      bra  LE918          ;branch always
;LE8E6:
E8E6 : 7F 00 65   clr  X0065
E8E9 : A6 0C      ldaa  $0C,x
E8EB : 2B 11      bmi  LE8FE          ;branch N=1
E8ED : 27 0A      beq  LE8F9          ;branch Z=1
E8EF : D6 66      ldab  X0066
E8F1 : 7C 00 66   inc  X0066
E8F4 : 11         cba
E8F5 : 27 02      beq  LE8F9          ;branch Z=1
E8F7 : 20 1F      bra  LE918          ;branch always
;LE8F9:
E8F9 : 7F 00 66   clr  X0066
E8FC : 20 46      bra  LE944
;LE8FE:
E8FE : 84 7F      anda  #$7F
E900 : 27 0A      beq  LE90C          ;branch Z=1
E902 : D6 66      ldab  X0066
E904 : 5C         incb
E905 : 11         cba
E906 : 27 04      beq  LE90C          ;branch Z=1
E908 : D7 66      stab  X0066
E90A : 20 0C      bra  LE918          ;branch always
;LE90C:
E90C : EE 0D      ldx  $0D,x
E90E : DF 6D      stx  X006D
E910 : BD E8 80   jsr  LE880          ;jump sub valid above
E913 : 7F 00 66   clr  X0066
E916 : 20 29      bra  LE941          ;branch always valid
;LE918:
E918 : 96 48      ldaa  X0048
E91A : 27 05      beq  LE921          ;branch Z=1
E91C : 7A 00 49   dec  X0049
E91F : 26 1E      bne  LE93F          ;branch Z=0
;LE921:
E921 : DE 6B      ldx  X006B
E923 : A6 01      ldaa  $01,x
E925 : 97 48      staa  X0048
E927 : 97 49      staa  X0049
E929 : 27 0C      beq  LE937          ;branch Z=1
E92B : A6 00      ldaa  $00,x
E92D : 97 40      staa  X0040
E92F : 08         inx
E930 : 08         inx
E931 : DF 6B      stx  X006B
E933 : 20 0C      bra  LE941          ;branch always valid
E935 : 20 0D      bra  LE944          ;branch always valid
;LE937:
E937 : A6 00      ldaa  $00,x
;LE939:
E939 : 2C FE      bge  LE939          ;branch N+V=0 here
E93B : EE 02      ldx  $02,x
E93D : DF 6B      stx  X006B
;LE93F:
E93F : 4F         clra
E940 : 39         rts                 ;return subroutine
;LE941:
E941 : 86 01      ldaa  #$01
E943 : 39         rts                 ;return subroutine
;LE944:
E944 : 86 FF      ldaa  #$FF
E946 : 39         rts                 ;return subroutine
;*************************************;
;PARAM CASCADE LE947:
;*************************************;
E947 : 96 4F      ldaa  X004F
E949 : 44         lsra
E94A : 24 06      bcc  LE952          ;branch C=0
E94C : 7C 00 40   inc  X0040
E94F : 7C 00 41   inc  X0041
;LE952:
E952 : 44         lsra
E953 : 24 06      bcc  LE95B          ;branch C=0
E955 : 7C 00 42   inc  X0042
E958 : 7C 00 43   inc  X0043
;LE95B:
E95B : 44         lsra
E95C : 24 06      bcc  LE964          ;branch C=0
E95E : 7C 00 44   inc  X0044
E961 : 7C 00 45   inc  X0045
;LE964:
E964 : 44         lsra
E965 : 24 06      bcc  LE96D          ;branch C=0
E967 : 7C 00 46   inc  X0046
E96A : 7C 00 47   inc  X0047
;LE96D:
E96D : 44         lsra
E96E : 24 06      bcc  LE976          ;branch C=0
E970 : 7C 00 48   inc  X0048
E973 : 7C 00 49   inc  X0049
;LE976:
E976 : 44         lsra
E977 : 24 03      bcc  LE97C          ;branch C=0
E979 : 7C 00 4C   inc  X004C
;LE97C:
E97C : 44         lsra
E97D : 24 03      bcc  LE982          ;branch C=0
E97F : 7C 00 4D   inc  X004D
;LE982:
E982 : 39         rts                 ;return subroutine
;*************************************;
;LE983:
E983 : CE 00 00   ldx  #$0000
E986 : 7F 00 60   clr  X0060
E989 : 86 A5      ldaa  #$A5
E98B : C6 5A      ldab  #$5A
E98D : 97 61      staa  X0061
E98F : D7 62      stab  X0062
E991 : 96 64      ldaa  X0064
E993 : 97 63      staa  X0063
;LE995:
E995 : 96 60      ldaa  X0060
E997 : D6 61      ldab  X0061
E999 : 53         comb
E99A : C5 09      bitb  #$09
E99C : 26 05      bne  LE9A3          ;branch Z=0
E99E : 53         comb
;LE99F:
E99F : 46         rora
E9A0 : 56         rorb
E9A1 : 20 09      bra  LE9AC          ;branch always
;LE9A3:
E9A3 : 53         comb
E9A4 : C5 09      bitb  #$09
E9A6 : 26 02      bne  LE9AA          ;branch Z=0
E9A8 : 27 F5      beq  LE99F          ;branch Z=1
;LE9AA:
E9AA : 44         lsra
E9AB : 56         rorb
;LE9AC:
E9AC : 97 60      staa  X0060
E9AE : D7 61      stab  X0061
E9B0 : A7 00      staa  $00,x
E9B2 : 08         inx
E9B3 : 8C 00 3F   cpx  #$003F
E9B6 : 26 DD      bne  LE995          ;branch Z=0
E9B8 : 39         rts
;*************************************;
;IRQ 
;*************************************;
E9B9 : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
E9BC : B6 20 00   ldaa  $2000         ;load A with PIA sound select
E9BF : 0E         cli                 ;clear interrupts I=0
E9C0 : 81 6F      cmpa  #$6F          ;compare A with 6Fh
E9C2 : 26 07      bne  LE9CB          ;branch Z=0 IRQ1
E9C4 : 97 02      staa  X0002
E9C6 : BD E0 09   jsr  LE009          ;jump sub RESET1
E9C9 : 96 02      ldaa  X0002
;IRQ1 LE9CB:
E9CB : 81 AF      cmpa  #$AF
E9CD : 22 02      bhi  LE9D1          ;branch C+Z=0 IRQ2
E9CF : 8D 28      bsr  LE9F9          ;branch sub valid 
;IRQ2 LE9D1:
E9D1 : 86 3C      ldaa  #$3C
E9D3 : B7 20 03   staa  X2003
E9D6 : 86 37      ldaa  #$37
E9D8 : B7 20 01   staa  X2001
;IRQ3 LE9DB:
E9DB : 20 FE      bra  LE9DB          ;branch always here
;*************************************;
;NMI Diagnostic Processing
;*************************************;
;NMI LE9DD:
E9DD : 0F         sei                 ;set interrupt mask
E9DE : 8E 00 7F   lds  #$007F         ;load SP with 007Fh (#ENDRAM)
E9E1 : 4F         clra                ;clear A
E9E2 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
E9E5 : 5F         clrb                ;
;NMI1 LE9E6:
E9E6 : E9 00      adcb  $00,x
E9E8 : 09         dex
E9E9 : 8C E0 00   cpx  #$E000         ;compare X E000h
E9EC : 26 F8      bne  LE9E6          ;branch Z=0 NMI1
E9EE : E1 00      cmpb  $00,x         ;compare B with X+00h
;LE9F0:
E9F0 : 26 FE      bne  LE9F0          ;branch Z=0 here
E9F2 : 86 01      ldaa  #$01
E9F4 : 8D 03      bsr  LE9F9          ;branch sub 
E9F6 : 20 E5      bra  LE9DD          ;branch always NMI
;*************************************;
;LE9F8:
;*************************************;
E9F8 : 39         rts                 ;
;LE9F9:
E9F9 : C6 3C      ldab  #$3C          ;load B with 3Ch
E9FB : F7 20 01   stab  $2001         ;store B in addr 2001 (PIA1 CR port A)
E9FE : C6 3F      ldab  #$3F          ;load B with 3Fh
EA00 : F7 20 01   stab  $2001         ;store B in addr 2001 (PIA1 CR port A)
EA03 : 4D         tsta                ;test A
EA04 : 27 F2      beq  LE9F8          ;branch Z=1
EA06 : D6 76      ldab  X0076
EA08 : CA 80      orab  #$80
EA0A : D7 76      stab  X0076
EA0C : D6 75      ldab  X0075
EA0E : 81 A0      cmpa  #$A0
EA10 : 26 0B      bne  LEA1D          ;branch Z=0
EA12 : 7F 00 74   clr  X0074
EA15 : 7F 00 73   clr  X0073
EA18 : 7F 00 76   clr  X0076
EA1B : 20 55      bra  LEA72          ;branch always valid
;LEA1D:
EA1D : 81 A4      cmpa  #$A4
EA1F : 26 0E      bne  LEA2F          ;branch Z=0
EA21 : D6 74      ldab  X0074
EA23 : CB 05      addb  #$05
EA25 : D7 73      stab  X0073
EA27 : D6 76      ldab  X0076
EA29 : C4 7F      andb  #$7F
EA2B : D7 76      stab  X0076
EA2D : 20 43      bra  LEA72          ;branch always valid
;LEA2F:
EA2F : C1 A0      cmpb  #$A0
EA31 : 26 1B      bne  LEA4E          ;branch Z=0
EA33 : 97 75      staa  X0075
EA35 : D6 73      ldab  X0073
EA37 : D7 74      stab  X0074
EA39 : 96 07      ldaa  X0007
EA3B : 90 14      suba  X0014
EA3D : D6 06      ldab  X0006
EA3F : D0 13      subb  X0013
EA41 : 56         rorb
EA42 : 1B         aba
EA43 : 8A 80      oraa  #$80
EA45 : 97 76      staa  X0076
EA47 : 96 75      ldaa  X0075
EA49 : 7F 00 73   clr  X0073
EA4C : 20 26      bra  LEA74          ;branch always
;LEA4E:
EA4E : C1 A4      cmpb  #$A4
EA50 : 26 1D      bne  LEA6F          ;branch Z=0
EA52 : 97 75      staa  X0075
EA54 : D6 74      ldab  X0074
EA56 : DB 73      addb  X0073
EA58 : D7 74      stab  X0074
EA5A : 96 07      ldaa  X0007
EA5C : 90 14      suba  X0014
EA5E : D6 06      ldab  X0006
EA60 : D0 13      subb  X0013
EA62 : 56         rorb
EA63 : 1B         aba
EA64 : 8A 80      oraa  #$80
EA66 : 97 76      staa  X0076
EA68 : 96 75      ldaa  X0075
EA6A : 7F 00 73   clr  X0073
EA6D : 20 05      bra  LEA74          ;branch always
;LEA6F:
EA6F : 7F 00 73   clr  X0073
;
;LEA72:
EA72 : 97 75      staa  X0075
;LEA74:
EA74 : CE EB AC   ldx  #$EBAC         ;load X with EBACh data table below
EA77 : 4A         deca
EA78 : 16         tab
EA79 : 4F         clra
EA7A : 58         aslb
EA7B : 89 00      adca  #$00
EA7D : BD E7 73   jsr  LE773          ;jump sub ADDX2
EA80 : A6 00      ldaa  $00,x
EA82 : E6 01      ldab  $01,x
EA84 : 48         asla
EA85 : CE EB 96   ldx  #$EB96         ;load X with EB96h JMPTBL
EA88 : BD E7 64   jsr  LE764          ;jump sub ADDX
EA8B : EE 00      ldx  $00,x          ;
EA8D : 17         tba
EA8E : 6E 00      jmp  $00,x          ;jump sub X
;*************************************;
;GWJMP
;*************************************;
EA90 : BD E4 B1   jsr  LE4B1          ;jump sub GWLD
EA93 : 7E E5 1C   jmp  LE51C          ;jump GWAVE
;*************************************;
;FNSPRM PARAM fnoise load, jump
;*************************************;
EA96 : CE E6 14   ldx  #$E614         ;load X with E614h FNSTBL
EA99 : 48         asla
EA9A : BD E7 64   jsr  LE764          ;jump sub ADDX
EA9D : EE 00      ldx  $00,x          ;
EA9F : 6E 00      jmp  $00,x          ;jump sub X
;*************************************;
;PRMDL1 PARAM data load, jump to synth
;*************************************;
EAA1 : CE EA DA   ldx  #$EADA         ;load X with EADAh data
EAA4 : 48         asla
EAA5 : 1B         aba
EAA6 : BD E7 64   jsr  LE764          ;jump sub ADDX
EAA9 : A6 00      ldaa  $00,x
EAAB : 97 40      staa  X0040
EAAD : A6 01      ldaa  $01,x
EAAF : 97 45      staa  X0045
EAB1 : 97 46      staa  X0046
EAB3 : A6 02      ldaa  $02,x
EAB5 : 97 48      staa  X0048
EAB7 : 7E E4 40   jmp  LE440          ;jump SYNTH above
;*************************************;
;PRMDL2 PARAM data load, jump to synth
;*************************************;
EABA : CE EA D2   ldx  #$EAD2         ;loadX with EAD2h data
EABD : DF 69      stx  X0069
EABF : 48         asla
EAC0 : 9B 6A      adda  X006A
EAC2 : 24 03      bcc  LEAC7          ;branch C=0
EAC4 : 7C 00 69   inc  X0069
;LEAC7:
EAC7 : 97 6A      staa  X006A
EAC9 : DE 69      ldx  X0069
EACB : EE 00      ldx  $00,x
EACD : DF 6D      stx  X006D
EACF : 7E E6 BB   jmp  LE6BB          ;jump SYNTH above
;*************************************;
;ldx call data 
EAD2 : E6 FF
EAD4 : E7 10
EAD6 : E7 21
EAD8 : E7 32
;*************************************;
;ldx call data
EADA : 20 04 00 19 08 01              ;
EAE0 : 13 09 01 05 05 02              ;
;*************************************;
;PRMCAL1 8 byte param loader calls
;*
EAE6 : CE F3 BB   ldx  #$F3BB
EAE9 : 20 0D      bra  LEAF8
;PRMCAL2
EAEB : CE F2 5B   ldx  #$F25B
EAEE : 20 08      bra  LEAF8
;PRMCAL3
EAF0 : CE F2 7B   ldx  #$F27B
EAF3 : 20 03      bra  LEAF8
;PRMCAL4
EAF5 : CE F2 9B   ldx  #$F29B
;LEAF8:
EAF8 : BD E7 48   jsr  LE748
EAFB : C4 03      andb  #$03
EAFD : 20 06      bra  LEB05          ;branch always PRMLDR1
;*************************************;
;IRQJMP LEAFF:
EAFF : 7E E9 D1   jmp  LE9D1          ;jump IRQ2
;*************************************;
;PRMLDR1 8 byte params
;*************************************;
EB02 : CE F2 BB   ldx  #$F2BB         ;load X with F2BBh data 8 byte block table
;LEB05:
EB05 : 4F         clra
EB06 : 58         aslb
EB07 : 89 00      adca  #$00
EB09 : 48         asla
EB0A : 58         aslb
EB0B : 89 00      adca  #$00
EB0D : 48         asla
EB0E : 58         aslb
EB0F : 89 00      adca  #$00
EB11 : BD E7 73   jsr  LE773          ;jump sub ADDX2
EB14 : 8C F3 EB   cpx  #$F3EB         ;compare X with F3EBh, end of table
EB17 : 27 E6      beq  LEAFF          ;branch Z=1 IRQJMP
EB19 : A6 00      ldaa  $00,x
EB1B : 97 6B      staa  X006B
EB1D : A6 01      ldaa  $01,x
EB1F : 97 6C      staa  X006C
EB21 : A6 02      ldaa  $02,x
EB23 : 97 6D      staa  X006D
EB25 : A6 03      ldaa  $03,x
EB27 : 97 6E      staa  X006E
EB29 : A6 04      ldaa  $04,x
EB2B : 97 6F      staa  X006F
EB2D : A6 05      ldaa  $05,x
EB2F : 97 70      staa  X0070
EB31 : A6 06      ldaa  $06,x
EB33 : 97 71      staa  X0071
EB35 : A6 07      ldaa  $07,x
EB37 : 97 72      staa  X0072
EB39 : DE 6B      ldx  X006B
EB3B : BD E7 F8   jsr  LE7F8          ;branch Z=1
EB3E : 7F 00 66   clr  X0066
EB41 : 7F 00 65   clr  X0065
EB44 : 7F 00 59   clr  X0059
EB47 : 7F 00 5A   clr  X005A
EB4A : 7E E0 3D   jmp  LE03D          ;jump SYTNH (top of ROM)
;*************************************;
;PRMCAL5
;*************************************;
EB4D : BD E7 48   jsr  LE748          ;jump sub valid above
EB50 : 84 03      anda  #$03
EB52 : 48         asla
EB53 : CE EB 5D   ldx  #$EB5D         ;load X with EB5Dh data table
EB56 : BD E7 64   jsr  LE764          ;jump sub ADDX
EB59 : EE 00      ldx  $00,x          ;load X with X+00h
EB5B : 20 1B      bra  LEB78          ;branch always below
;
;data table
EB5D : FA DF FA E3                    ;FCB/FDB
EB61 : FA E7 FA EB                    ;
;*************************************;
;PRMLDR2 5 byte params
;*************************************;
EB65 : 4F         clra                ;
EB66 : 58         aslb
EB67 : 89 00      adca  #$00
EB69 : 48         asla
EB6A : 58         aslb
EB6B : 89 00      adca  #$00
EB6D : CE F9 B7   ldx  #$F9B7         ;load X with F9B7h data table
EB70 : BD E7 73   jsr  LE773          ;jump sub ADDX2
EB73 : 8C FA EF   cpx  #$FAEF         ;compare X with FAEFh end of table
EB76 : 27 87      beq  LEAFF          ;branch Z=1 IRQJMP
;LEB78:
EB78 : A6 00      ldaa  $00,x
EB7A : 97 6B      staa  X006B
EB7C : A6 01      ldaa  $01,x
EB7E : 97 6C      staa  X006C
EB80 : A6 02      ldaa  $02,x
EB82 : 97 6D      staa  X006D
EB84 : A6 03      ldaa  $03,x
EB86 : 97 6E      staa  X006E
EB88 : A6 04      ldaa  $04,x
EB8A : BD E8 80   jsr  LE880          ;jump sub valid above
EB8D : 7F 00 66   clr  X0066
EB90 : 7F 00 65   clr  X0065
EB93 : 7E E2 10   jmp  LE210          ;jump PARAMS JUMP above
;*************************************;
;JMPTBL
;*************************************;
EB96 : EA 90                          ;GWJMP
EB98 : EA 96                          ;FNSPRM
EB9A : EB 02                          ;PRMLDR1
EB9C : EB 65                          ;PRMLDR2
EB9E : EA A1                          ;PRMDL1
EBA0 : EA EB                          ;PRMCAL2
EBA2 : EA F0                          ;PRMCAL3
EBA4 : EA F5                          ;PRMCAL4
EBA6 : EB 4D                          ;PRMCAL5
EBA8 : EA E6                          ;PRMCAL1
EBAA : EA BA                          ;PRMDL2
;*************************************;
;ldx call 
EBAC : 00 00 00    "   "    db  $00, $00, $00
        ;
EBAF : 01    " "    nop
        ;
EBB0 : 00 02 00 03  "    "    db  $00, $02, $00, $03
EBB4 : 00 04    "  "    db  $00, $04
        ;
EBB6 : 01    " "    nop
        ;
EBB7 : 00 04 00 05  "    "    db  $00, $04, $00, $05
EBBB : 00    " "    db  $00
        ;
EBBC : 06    " "    tap
        ;
EBBD : 00    " "    db  $00
        ;
EBBE : 07    " "    tpa
        ;
EBBF : 00 02 00 02  "    "    db  $00, $02, $00, $02
        ;
EBC3 : 24 02    "$ "    bcc  LEBC7
EBC5 : 01    " "    nop
        ;
EBC6 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EBCA : 00 00 00 00  "    "    db  $00, $00, $00, $00
EBCE : 00 00 02 02  "    "    db  $00, $00, $02, $02
EBD2 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EBD6 : 00 00 02 03  "    "    db  $00, $00, $02, $03
EBDA : 00    " "    db  $00
EBDB        XEBDB:
EBDB : 00 00 00 02  "    "    db  $00, $00, $00, $02
EBDF : 04 00 00 00  "    "    db  $04, $00, $00, $00
EBE3 : 00 02 05 02  "    "    db  $00, $02, $05, $02
        ;
EBE7 : 06    " "    tap
        ;
EBE8 : 02    " "    db  $02
        ;
EBE9 : 07    " "    tpa
        ;
EBEA : 02    " "    db  $02
        ;
EBEB : 08    " "    inx
        ;
EBEC : 02    " "    db  $02
        ;
EBED        XEBED:
EBED : 09    " "    dex
        ;
EBEE : 00 00 00 00  "    "    db  $00, $00, $00, $00
EBF2 : 00 00 02    "   "    db  $00, $00, $02
        ;
EBF5 : 0A    " "    clv
        ;
EBF6 : 02    " "    db  $02
        ;
EBF7 : 0B    " "    sev
        ;
EBF8 : 00 00 02    "   "    db  $00, $00, $02
        ;
EBFB : 0C    " "    clc
        ;
EBFC : 02    " "    db  $02
        ;
EBFD : 0D    " "    sec
        ;
EBFE : 02    " "    db  $02
        ;
EBFF : 0E    " "    cli
        ;
EC00 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EC04 : 02    " "    db  $02
        ;
EC05 : 0E    " "    cli
        ;
EC06 : 02    " "    db  $02
        ;
EC07 : 0F    " "    sei
        ;
EC08 : 02    " "    db  $02
        ;
EC09 : 10    " "    sba
        ;
EC0A : 02    " "    db  $02
        ;
EC0B : 11    " "    cba
        ;
EC0C : 02 12 02    "   "    db  $02, $12, $02
        ;
EC0F : 11    " "    cba
        ;
EC10 : 00 00 02 14  "    "    db  $00, $00, $02, $14
EC14 : 00 00 02 15  "    "    db  $00, $00, $02, $15
EC18 : 02    " "    db  $02
        ;
EC19 : 16    " "    tab
        ;
EC1A : 00 00 00 00  "    "    db  $00, $00, $00, $00
EC1E : 00 00 02    "   "    db  $00, $00, $02
        ;
EC21 : 17    " "    tba
        ;
EC22 : 02 18 02    "   "    db  $02, $18, $02
        ;
EC25 : 19    " "    daa
        ;
EC26 : 02 15 02    "   "    db  $02, $15, $02
        ;
EC29 : 16    " "    tab
        ;
EC2A : 03 00 03    "   "    db  $03, $00, $03
        ;
EC2D : 01    " "    nop
        ;
EC2E : 03 02 03 03  "    "    db  $03, $02, $03, $03
EC32 : 03 04 03 05  "    "    db  $03, $04, $03, $05
EC36 : 03    " "    db  $03
        ;
EC37 : 06    " "    tap
        ;
EC38 : 03    " "    db  $03
        ;
EC39 : 07    " "    tpa
        ;
EC3A : 03    " "    db  $03
        ;
EC3B : 08    " "    inx
        ;
EC3C : 03    " "    db  $03
        ;
EC3D : 09    " "    dex
        ;
EC3E : 03    " "    db  $03
        ;
EC3F : 0A    " "    clv
        ;
EC40 : 03    " "    db  $03
        ;
EC41 : 0B    " "    sev
        ;
EC42 : 03    " "    db  $03
        ;
EC43 : 0C    " "    clc
        ;
EC44 : 03    " "    db  $03
        ;
EC45 : 0D    " "    sec
        ;
EC46 : 03    " "    db  $03
        ;
EC47 : 0E    " "    cli
        ;
EC48 : 03    " "    db  $03
        ;
EC49 : 0F    " "    sei
        ;
EC4A : 03    " "    db  $03
        ;
EC4B : 10    " "    sba
        ;
EC4C : 03    " "    db  $03
        ;
EC4D : 11    " "    cba
        ;
EC4E : 03 12 03 13  "    "    db  $03, $12, $03, $13
EC52 : 03 14 03 15  "    "    db  $03, $14, $03, $15
EC56 : 03    " "    db  $03
        ;
EC57 : 16    " "    tab
        ;
EC58 : 03    " "    db  $03
        ;
EC59 : 17    " "    tba
        ;
EC5A : 03 18 03    "   "    db  $03, $18, $03
        ;
EC5D : 19    " "    daa
        ;
EC5E : 03 1A 03    "   "    db  $03, $1A, $03
        ;
EC61 : 1B    " "    aba
        ;
EC62 : 03 1C 03 1D  "    "    db  $03, $1C, $03, $1D
EC66 : 03 1E 03 1F  "    "    db  $03, $1E, $03, $1F
EC6A : 03    " "    db  $03
        ;
EC6B : 20 03    "  "    bra  LEC70
        ;
EC6D : 21 03    "! "    db  $21, $03
        ;
EC6F : 22 03    "" "    bhi  LEC74
EC71 : 23 03    "# "    bls  LEC76
EC73 : 24 03    "$ "    bcc  LEC78
EC75 : 26 03    "& "    bne  LEC7A
EC77 : 27 03    "' "    beq  LEC7C
EC79 : 28 03    "( "    bvc  LEC7E
EC7B : 2A 03    "* "    bpl  LEC80
EC7D : 2B 03    "+ "    bmi  LEC82
EC7F : 2F 03    "/ "    ble  LEC84
EC81 : 30    "0"    tsx
        ;
EC82        LEC82:
EC82 : 03    " "    db  $03
        ;
EC83 : 31    "1"    ins
        ;
EC84        LEC84:
EC84 : 03    " "    db  $03
        ;
EC85 : 32    "2"    pula
        ;
EC86 : 03    " "    db  $03
        ;
EC87 : 33    "3"    pulb
        ;
EC88 : 03    " "    db  $03
        ;
EC89 : 34    "4"    des
        ;
EC8A : 03    " "    db  $03
        ;
EC8B : 35    "5"    txs
        ;
EC8C : 03    " "    db  $03
        ;
EC8D : 36    "6"    psha
        ;
EC8E : 03    " "    db  $03
        ;
EC8F : 37    "7"    pshb
        ;
EC90 : 03 38 03    " 8 "    db  $03, $38, $03
        ;
EC93 : 39    "9"    rts
        ;
EC94 : 04    " "    db  $04
        ;
EC95 : 01    " "    nop
        ;
EC96 : 04 02 00 05  "    "    db  $04, $02, $00, $05
EC9A : 00    " "    db  $00
        ;
EC9B : 06    " "    tap
EC9C : 01    " "    nop
EC9D : 01    " "    nop
        ;
EC9E : 02    " "    db  $02
        ;
EC9F : 17    " "    tba
        ;
ECA0 : 03 3A 03    " : "    db  $03, $3A, $03
        ;
ECA3 : 3B    ";"    rti
        ;
ECA4        LECA4:
ECA4 : 03 3C 03 3D  " < ="    db  $03, $3C, $03, $3D
ECA8 : 03    " "    db  $03
        ;
ECA9 : 3E    ">"    wai
        ;
ECAA : 03    " "    db  $03
        ;
ECAB : 3F    "?"    swi
        ;
ECAC : 03    " "    db  $03
        ;
ECAD : 40    "@"    nega
        ;
ECAE : 03 41 03 42  " A B"    db  $03, $41, $03, $42
ECB2 : 03    " "    db  $03
        ;
ECB3 : 43    "C"    coma
        ;
ECB4 : 03    " "    db  $03
        ;
ECB5 : 44    "D"    lsra
        ;
ECB6 : 03 45 03    " E "    db  $03, $45, $03
        ;
ECB9 : 46    "F"    rora
        ;
ECBA : 03    " "    db  $03
        ;
ECBB : 47    "G"    asra
        ;
ECBC : 02 18 02 1F  "    "    db  $02, $18, $02, $1F
ECC0 : 02    " "    db  $02
        ;
ECC1 : 20 02    "  "    bra  LECC5
        ;
ECC3 : 1B    " "    aba
        ;
ECC4 : 02    " "    db  $02
        ;
ECC5        LECC5:
ECC5 : 22 02    "" "    bhi  LECC9
ECC7 : 23 00    "# "    bls  LECC9
        ;
ECC9        LECC9:
ECC9 : 00 00 00 00  "    "    db  $00, $00, $00, $00
ECCD : 00 00 00 00  "    "    db  $00, $00, $00, $00
ECD1 : 00 00 00 00  "    "    db  $00, $00, $00, $00
ECD5 : 00 00 00 03  "    "    db  $00, $00, $00, $03
        ;
ECD9 : 48    "H"    asla
        ;
ECDA : 03    " "    db  $03
        ;
ECDB : 49    "I"    rola
ECDC : 08    " "    inx
        ;
ECDD : 00 03    "  "    db  $00, $03
        ;
ECDF : 4A    "J"    deca
        ;
ECE0 : 03 4B 03    " K "    db  $03, $4B, $03
        ;
ECE3 : 4C    "L"    inca
        ;
ECE4 : 03    " "    db  $03
        ;
ECE5 : 4D    "M"    tsta
        ;
ECE6 : 02    " "    db  $02
        ;
ECE7 : 24 00    "$ "    bcc  LECE9
        ;
ECE9        LECE9:
ECE9 : 00 00    "  "    db  $00, $00
        ;
ECEB : 07    " "    tpa
        ;
ECEC : 00    " "    db  $00
        ;
ECED : 08    " "    inx
        ;
ECEE : 00    " "    db  $00
        ;
ECEF : 09    " "    dex
        ;
ECF0 : 00    " "    db  $00
        ;
ECF1 : 0A    " "    clv
        ;
ECF2 : 00    " "    db  $00
        ;
ECF3 : 0B    " "    sev
ECF4 : 09    " "    dex
        ;
ECF5 : 00 02    "  "    db  $00, $02
        ;
ECF7 : 20 02    "  "    bra  LECFB
        ;
ECF9 : 21 02    "! "    db  $21, $02
        ;
ECFB        LECFB:
ECFB : 22 02    "" "    bhi  LECFF
ECFD : 23 0A    "# "    bls  LED09
        ;
ECFF        LECFF:
ECFF : 00    " "    db  $00
        ;
ED00 : 0A    " "    clv
ED01 : 01    " "    nop
ED02 : 0A    " "    clv
        ;
ED03 : 02    " "    db  $02
        ;
ED04 : 0A    " "    clv
        ;
ED05 : 03 04 03 02  "    "    db  $03, $04, $03, $02
        ;
ED09        LED09:
ED09 : 25 99    "% "    bcs  LECA4
ED0B : B1 C8 DB    "   "    cmpa  XC8DB
ED0E : EB F7    "  "    addb  $F7,x
ED10 : FE FF FE    "   "    ldx  XFFFE
ED13 : F7 EB DB    "   "    stab  XEBDB
ED16 : C8 B1    "  "    eorb  #$B1
ED18 : 99 81    "  "    adca  X0081
ED1A : 68 50    "hP"    asl  $50,x
ED1C : 39    "9"    rts
        ;
ED1D : 26 16    "& "    bne  LED35
ED1F : 0A    " "    clv
        ;
ED20 : 03    " "    db  $03
        ;
ED21 : 01    " "    nop
        ;
ED22 : 03    " "    db  $03
        ;
ED23 : 0A    " "    clv
ED24 : 16    " "    tab
ED25 : 26 39    "&9"    bne  LED60
ED27 : 50    "P"    negb
ED28 : 68 81    "h "    asl  $81,x
;*************************************;
;ldx call
ED2A : 99 B1    "  "    adca  X00B1
ED2C : C8 DB    "  "    eorb  #$DB
ED2E : EB F7    "  "    addb  $F7,x
ED30 : FE FF FE    "   "    ldx  XFFFE
ED33 : F7 EB DB    "   "    stab  XEBDB
ED36 : C8 B1    "  "    eorb  #$B1
ED38 : 99 81    "  "    adca  X0081
ED3A : 68 50    "hP"    asl  $50,x
ED3C : 39    "9"    rts
        ;
ED3D : 26 16    "& "    bne  LED55
ED3F : 0A    " "    clv
        ;
ED40 : 03    " "    db  $03
        ;
ED41 : 01    " "    nop
        ;
ED42 : 03    " "    db  $03
        ;
ED43 : 0A    " "    clv
ED44 : 16    " "    tab
ED45 : 26 39    "&9"    bne  LED80
ED47 : 50    "P"    negb
ED48 : 68 81    "h "    asl  $81,x
;*************************************;
;cpx call
ED4A : B1 A8 B5    "   "    cmpa  XA8B5
ED4D : E7 F2    "  "    stab  $F2,x
        ;
ED4F : EC FD    "  "    db  $EC, $FD
        ;
ED51 : FE FF FE    "   "    ldx  XFFFE
ED54 : E2 CD    "  "    sbcb  $CD,x
ED56 : D8 BA    "  "    eorb  X00BA
ED58 : 81 81    "  "    cmpa  #$81
ED5A : 80 47    " G"    suba  #$47
ED5C : 29 34    ")4"    bvs  LED92
        ;
ED5E : 1F 03 02 03  "    "    db  $1F, $03, $02, $03
ED62 : 04 15    "  "    db  $04, $15
        ;
ED64 : 0F    " "    sei
        ;
ED65 : 1A    " "    db  $1A
        ;
ED66 : 4C    "L"    inca
ED67 : 59    "Y"    rolb
ED68 : 50    "P"    negb
ED69 : 81 DA    "  "    cmpa  #$DA
ED6B : FA FC F4    "   "    orab  XFCF4
        ;
ED6E : ED    " "    db  $ED
        ;
ED6F : F6 FF FC    "   "    ldab  XFFFC
ED72 : FB FF E0    "   "    addb  XFFE0
ED75 : AA 9A    "  "    oraa  $9A,x
ED77 : B8 DF F1    "   "    eora  XDFF1
ED7A : EE E0    "  "    ldx  $E0,x
ED7C : DB F4    "  "    addb  X00F4
        ;
ED7E : FD    " "    db  $FD
        ;
ED7F : BF 76 5E    " v^"    sts  X765E
ED82 : 6E 84    "n "    jmp  $84,x            ;INFO: index jump
        ;
ED84 : 7D 56 2D    "}V-"    tst  X562D
ED87 : 20 3B    " ;"    bra  LEDC4
        ;
ED89 : 81 C6    "  "    cmpa  #$C6
ED8B : E1 D4    "  "    cmpb  $D4,x
ED8D : AB 84    "  "    adda  $84,x
ED8F : 7D 93 A3    "}  "    tst  X93A3
ED92        LED92:
ED92 : 8B 42    " B"    adda  #$42
        ;
ED94 : 04    " "    db  $04
        ;
ED95 : 0D    " "    sec
ED96 : 26 21    "&!"    bne  LEDB9
        ;
ED98 : 13    " "    db  $13
        ;
ED99 : 10    " "    sba
ED9A : 22 49    ""I"    bhi  LEDE5
ED9C : 67 57    "gW"    asr  $57,x
        ;
ED9E : 21    "!"    db  $21
        ;
ED9F : 01    " "    nop
EDA0 : 06    " "    tap
        ;
EDA1 : 05    " "    db  $05
        ;
EDA2 : 01    " "    nop
EDA3 : 0B    " "    sev
        ;
EDA4 : 14    " "    db  $14
        ;
EDA5 : 0D    " "    sec
        ;
EDA6 : 05    " "    db  $05
        ;
EDA7 : 07    " "    tpa
EDA8 : 27 81    "' "    beq  LED2B
EDAA : FB FD C5    "   "    addb  XFDC5
EDAD : A5 DF    "  "    bita  $DF,x
        ;
EDAF : FD FC    "  "    db  $FD, $FC
        ;
EDB1 : FB FF EE    "   "    addb  XFFEE
EDB4 : F5 FB CA    "   "    bitb  XFBCA
EDB7 : 3F    "?"    swi
        ;
EDB8 : 1E    " "    db  $1E
        ;
EDB9        LEDB9:
EDB9 : 81 E3    "  "    cmpa  #$E3
EDBB : C2 37    " 7"    sbcb  #$37
EDBD : 06    " "    tap
EDBE : 0C    " "    clc
        ;
EDBF : 13 02    "  "    db  $13, $02
        ;
EDC1 : 06    " "    tap
        ;
EDC2 : 05 04    "  "    db  $05, $04
        ;
EDC4        LEDC4:
EDC4 : 22 5C    ""\"    bhi  LEE22
        ;
EDC6 : 3C 04    "< "    db  $3C, $04
        ;
EDC8 : 06    " "    tap
EDC9 : 81 B9    "  "    cmpa  #$B9
EDCB : B0 A4 94    "   "    suba  XA494
EDCE : 80 6C    " l"    suba  #$6C
EDD0 : 59    "Y"    rolb
EDD1 : 49    "I"    rola
EDD2 : 40    "@"    nega
        ;
EDD3 : 38 38 3A    "88:"    db  $38, $38, $3A
        ;
EDD6 : 3E    ">"    wai
EDD7 : 40    "@"    nega
        ;
EDD8 : 41    "A"    db  $41
        ;
EDD9 : 43    "C"    coma
        ;
EDDA : 45 4B    "EK"    db  $45, $4B
        ;
EDDC : 53    "S"    comb
EDDD : 5D    "]"    tstb
        ;
EDDE : 6B 7B 8F    "k{ "    db  $6B, $7B, $8F
        ;
EDE1 : 9F AF    "  "    sts  X00AF
EDE3 : B8 C5 CF    "   "    eora  XC5CF
EDE6 : DB E2    "  "    addb  X00E2
EDE8 : E2 DA    "  "    sbcb  $DA,x
EDEA : D0 C6    "  "    subb  X00C6
        ;
EDEC : 00 00    "  "    db  $00, $00
        ;
EDEE        XEDEE:
EDEE : FF 00 ED    "   "    stx  X00ED
EDF1 : EE 04    "  "    ldx  $04,x
        ;
EDF3 : 04 04 1E 00  "    "    db  $04, $04, $1E, $00
EDF7 : 00    " "    db  $00
        ;
EDF8 : 60 04    "` "    neg  $04,x
EDFA : 60 08    "` "    neg  $08,x
EDFC : 60 18    "` "    neg  $18,x
        ;
EDFE : 00 00    "  "    db  $00, $00
        ;
EE00 : 01    " "    nop
EE01 : 20 02    "  "    bra  LEE05
EE03 : 20 03    "  "    bra  LEE08
        ;
EE05        LEE05:
EE05 : 1D 02    "  "    db  $1D, $02
        ;
EE07 : 20 04    "  "    bra  LEE0D
        ;
EE09 : 10    " "    sba
        ;
EE0A : 03    " "    db  $03
        ;
EE0B : 20 05    "  "    bra  LEE12
        ;
EE0D        LEE0D:
EE0D : 0A    " "    clv
EE0E : 01    " "    nop
EE0F : 40    "@"    nega
        ;
EE10 : 00 00    "  "    db  $00, $00
        ;
EE12        LEE12:
EE12 : C0 07    "  "    subb  #$07
EE14 : C0 20    "  "    subb  #$20
EE16 : 80 20    "  "    suba  #$20
EE18 : 70 40 50    "p@P"    neg  X4050
EE1B : 60 40    "`@"    neg  $40,x
EE1D : 80 30    " 0"    suba  #$30
EE1F : A0 20    "  "    suba  $20,x
EE21 : C0 10    "  "    subb  #$10
EE23 : D0 FF    "  "    subb  X00FF
        ;
EE25 : 00    " "    db  $00
        ;
EE26 : EE 12    "  "    ldx  $12,x
EE28 : 09    " "    dex
EE29 : C0 0A    "  "    subb  #$0A
EE2B : BC 09 C0    "   "    cpx  X09C0
EE2E : 0A    " "    clv
EE2F : BC 09 C0    "   "    cpx  X09C0
        ;
EE32 : 00 00    "  "    db  $00, $00
        ;
EE34 : 01    " "    nop
EE35 : 10    " "    sba
        ;
EE36 : 02 03    "  "    db  $02, $03
        ;
EE38 : 01    " "    nop
        ;
EE39 : 72    "r"    db  $72
        ;
EE3A : 01    " "    nop
        ;
EE3B : 00    " "    db  $00
        ;
EE3C : 50    "P"    negb
EE3D : 60 40    "`@"    neg  $40,x
EE3F : 80 20    "  "    suba  #$20
EE41 : C0 10    "  "    subb  #$10
EE43 : D0 FF    "  "    subb  X00FF
        ;
EE45 : 00    " "    db  $00
        ;
EE46 : EE 3C    " <"    ldx  $3C,x
EE48 : 01    " "    nop
EE49 : 2E 02    ". "    bgt  LEE4D
EE4B : 37    "7"    pshb
        ;
EE4C : 03    " "    db  $03
        ;
EE4D        LEE4D:
EE4D : A1 04    "  "    cmpa  $04,x
EE4F : EF 07    "  "    stx  $07,x
EE51 : E6 00    "  "    ldab  $00,x
        ;
EE53 : 00 03    "  "    db  $00, $03
        ;
EE55 : 2E 01    ". "    bgt  LEE58
EE57 : 37    "7"    pshb
        ;
EE58        LEE58:
EE58 : 03    " "    db  $03
        ;
EE59 : 8B 04    "  "    adda  #$04
EE5B : 8C 0B 72    "  r"    cpx  #$0B72
EE5E : 10    " "    sba
EE5F : FF 00 00    "   "    stx  X0000
EE62 : 01    " "    nop
        ;
EE63 : 13 04    "  "    db  $13, $04
        ;
EE65 : 09    " "    dex
        ;
EE66 : 05    " "    db  $05
        ;
EE67 : 09    " "    dex
        ;
EE68 : 05    " "    db  $05
        ;
EE69 : 07    " "    tpa
        ;
EE6A : 04    " "    db  $04
        ;
EE6B : 09    " "    dex
EE6C : 09    " "    dex
EE6D : 0F    " "    sei
EE6E : 09    " "    dex
EE6F : 0F    " "    sei
EE70 : 09    " "    dex
EE71 : 0F    " "    sei
EE72 : 01    " "    nop
EE73 : 10    " "    sba
        ;
EE74 : 04    " "    db  $04
        ;
EE75 : 09    " "    dex
        ;
EE76 : 03    " "    db  $03
        ;
EE77 : 07    " "    tpa
        ;
EE78 : 05    " "    db  $05
        ;
EE79 : 09    " "    dex
        ;
EE7A : 04    " "    db  $04
        ;
EE7B : 09    " "    dex
EE7C : 09    " "    dex
EE7D : 0F    " "    sei
EE7E : 09    " "    dex
EE7F : 0F    " "    sei
EE80 : 09    " "    dex
EE81 : 0F    " "    sei
EE82 : 09    " "    dex
EE83 : 0F    " "    sei
        ;
EE84 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EE88 : 00    " "    db  $00
;*************************************;
;ldx call E028
EE89 : FF 00 00    "   "    stx  X0000
EE8C : EE 89    "  "    ldx  $89,x
        ;
EE8E : 02    " "    db  $02
        ;
EE8F : 20 00    "  "    bra  LEE91
        ;
EE91        LEE91:
EE91 : 04    " "    db  $04
        ;
EE92 : 20 03    "  "    bra  LEE97
        ;
EE94 : 07    " "    tpa
EE95 : 20 01    "  "    bra  LEE98
        ;
EE97        LEE97:
EE97 : 06    " "    tap
EE98        LEE98:
EE98 : 20 09    "  "    bra  LEEA3
        ;
EE9A : 05    " "    db  $05
        ;
EE9B : 20 05    "  "    bra  LEEA2
        ;
EE9D : 03    " "    db  $03
        ;
EE9E : 20 01    "  "    bra  LEEA1
        ;
EEA0 : 05    " "    db  $05
        ;
EEA1        LEEA1:
EEA1 : 20 09    "  "    bra  LEEAC
        ;
EEA3        LEEA3:
EEA3 : 04 02 03    "   "    db  $04, $02, $03
        ;
EEA6 : 01    " "    nop
EEA7 : 06    " "    tap
EEA8 : 09    " "    dex
        ;
EEA9 : 04 02 05    "   "    db  $04, $02, $05
        ;
EEAC        LEEAC:
EEAC : 01    " "    nop
EEAD : 06    " "    tap
        ;
EEAE : 00 04 02 00  "    "    db  $00, $04, $02, $00
        ;
EEB2 : 01    " "    nop
EEB3 : 06    " "    tap
        ;
EEB4 : 04 05    "  "    db  $04, $05
        ;
EEB6 : 20 05    "  "    bra  LEEBD
        ;
EEB8 : 01    " "    nop
EEB9 : 20 02    "  "    bra  LEEBD
        ;
EEBB : 04    " "    db  $04
        ;
EEBC : 20 02    "  "    bra  LEEC0
        ;
EEBE : 01    " "    nop
EEBF : 20 01    "  "    bra  LEEC2
        ;
EEC1 : 02    " "    db  $02
        ;
EEC2        LEEC2:
EEC2 : 20 09    "  "    bra  LEECD
        ;
EEC4 : 04    " "    db  $04
        ;
EEC5 : 20 09    "  "    bra  LEED0
        ;
EEC7 : 07    " "    tpa
EEC8 : 20 03    "  "    bra  LEECD
        ;
EECA : 05    " "    db  $05
        ;
EECB : 20 04    "  "    bra  LEED1
        ;
EECD        LEECD:
EECD : 09    " "    dex
EECE : 20 02    "  "    bra  LEED2
        ;
EED0        LEED0:
EED0 : 08    " "    inx
EED1        LEED1:
EED1 : 24 00    "$ "    bcc  LEED3
EED3        LEED3:
EED3 : 0A    " "    clv
EED4 : 09    " "    dex
EED5 : 01    " "    nop
EED6 : 0B    " "    sev
EED7 : F0 00 00    "   "    subb  X0000
        ;
EEDA : 00 00    "  "    db  $00, $00
        ;
EEDC : 06    " "    tap
EEDD : 07    " "    tpa
        ;
EEDE : 00    " "    db  $00
        ;
EEDF : 07    " "    tpa
EEE0 : 07    " "    tpa
        ;
EEE1 : 00    " "    db  $00
        ;
EEE2 : 08    " "    inx
        ;
EEE3 : 05 00 00 00  "    "    db  $05, $00, $00, $00
EEE7 : 00 00    "  "    db  $00, $00
        ;
EEE9 : 07    " "    tpa
        ;
EEEA : 02 00    "  "    db  $02, $00
        ;
EEEC : 06    " "    tap
        ;
EEED : 04 00 05 18  "    "    db  $04, $00, $05, $18
EEF1 : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
EEF5 : 08    " "    inx
        ;
EEF6 : 02 00    "  "    db  $02, $00
        ;
EEF8 : 07    " "    tpa
        ;
EEF9 : 04 00    "  "    db  $04, $00
        ;
EEFB : 06    " "    tap
EEFC : 0B    " "    sev
        ;
EEFD : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
EF01 : 06    " "    tap
EF02 : 0B    " "    sev
        ;
EF03 : 00    " "    db  $00
        ;
EF04 : 07    " "    tpa
        ;
EF05 : 04 00 04    "   "    db  $04, $00, $04
        ;
EF08 : 10    " "    sba
        ;
EF09 : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
EF0D : 01    " "    nop
        ;
EF0E : 03 00 04    "   "    db  $03, $00, $04
        ;
EF11 : 10    " "    sba
        ;
EF12 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF16 : 05    " "    db  $05
        ;
EF17 : 07    " "    tpa
        ;
EF18 : 02 03 1C 15  "    "    db  $02, $03, $1C, $15
EF1C : 00 00 00    "   "    db  $00, $00, $00
        ;
EF1F : 07    " "    tpa
        ;
EF20 : 18 00 00 00  "    "    db  $18, $00, $00, $00
EF24 : 00 04    "  "    db  $00, $04
        ;
EF26 : 2C 00    ", "    bge  LEF28
        ;
EF28        LEF28:
EF28 : 00 00 00    "   "    db  $00, $00, $00
        ;
EF2B : 01    " "    nop
EF2C : 28 00    "( "    bvc  LEF2E
        ;
EF2E        LEF2E:
EF2E : 02    " "    db  $02
        ;
EF2F : 27 00    "' "    beq  LEF31
        ;
EF31        LEF31:
EF31 : 03    " "    db  $03
        ;
EF32 : 26 00    "& "    bne  LEF34
EF34        LEF34:
EF34 : 06    " "    tap
        ;
EF35 : 1C 00    "  "    db  $1C, $00
        ;
EF37 : 09    " "    dex
EF38 : 40    "@"    nega
        ;
EF39 : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF3D : 04    " "    db  $04
        ;
EF3E : 20 00    "  "    bra  LEF40
        ;
EF40        LEF40:
EF40 : 05    " "    db  $05
        ;
EF41 : 20 00    "  "    bra  LEF43
        ;
EF43        LEF43:
EF43 : 04    " "    db  $04
        ;
EF44 : 20 00    "  "    bra  LEF46
        ;
EF46        LEF46:
EF46 : 03    " "    db  $03
        ;
EF47 : 20 00    "  "    bra  LEF49
        ;
EF49        LEF49:
EF49 : EF 3D    " ="    stx  $3D,x
;*************************************;
;ldx call E028
EF4B : 01    " "    nop
        ;
EF4C : 00 00 00 00  "    "    db  $00, $00, $00, $00
EF50 : 00 00 00    "   "    db  $00, $00, $00
        ;
EF53 : FF 01 FF    "   "    stx  X01FF
EF56 : 20 0F    "  "    bra  LEF67
        ;
EF58 : 10    " "    sba
EF59 : 7F FF EF    "   "    clr  XFFEF
        ;
EF5C : 4B 00    "K "    db  $4B, $00
        ;
EF5E : 08    " "    inx
        ;
EF5F : 00 00 1F 05  "    "    db  $00, $00, $1F, $05
EF63 : 00 00 15 05  "    "    db  $00, $00, $15, $05
        ;
EF67        LEF67:
EF67 : FF 20 0F    "   "    stx  X200F
EF6A : 11    " "    cba
EF6B : FF FF EF    "   "    stx  XFFEF
EF6E : 5D    "]"    tstb
        ;
EF6F : 00    " "    db  $00
        ;
EF70 : 08    " "    inx
        ;
EF71 : 00 00 1A 05  "    "    db  $00, $00, $1A, $05
EF75 : 00 00 15 05  "    "    db  $00, $00, $15, $05
        ;
EF79 : FF 20 0F    "   "    stx  X200F
EF7C : 11    " "    cba
EF7D : FF FF EF    "   "    stx  XFFEF
EF80 : 6F 00    "o "    clr  $00,x
EF82 : 08    " "    inx
        ;
EF83 : 00 00    "  "    db  $00, $00
        ;
EF85 : 2B 05    "+ "    bmi  LEF8C
        ;
EF87 : 00 00 15 05  "    "    db  $00, $00, $15, $05
        ;
EF8B : FF 20 0F    "   "    stx  X200F
EF8E : 11    " "    cba
EF8F : FF FF EF    "   "    stx  XFFEF
EF92 : 81 01    "  "    cmpa  #$01
        ;
EF94 : 00 05    "  "    db  $00, $05
        ;
EF96 : 19    " "    daa
EF97 : F4 00 00    "   "    andb  X0000
        ;
EF9A : 00    " "    db  $00
        ;
EF9B : 0B    " "    sev
EF9C : 01    " "    nop
EF9D : 1B    " "    aba
EF9E : 10    " "    sba
EF9F : 0F    " "    sei
        ;
EFA0 : 12    " "    db  $12
        ;
EFA1 : 19    " "    daa
        ;
EFA2 : 00 00 00 05  "    "    db  $00, $00, $00, $05
        ;
EFA6 : 19    " "    daa
EFA7 : F4 00 00    "   "    andb  X0000
        ;
EFAA : 00    " "    db  $00
        ;
EFAB : 0B    " "    sev
EFAC : 01    " "    nop
EFAD : 34    "4"    des
EFAE : 10    " "    sba
EFAF : 0F    " "    sei
        ;
EFB0 : 12    " "    db  $12
        ;
EFB1 : 31    "1"    ins
        ;
EFB2 : 00    " "    db  $00
EFB3        XEFB3:
EFB3 : FD 04 00 00  "    "    db  $FD, $04, $00, $00
        ;
EFB7 : 0D    " "    sec
        ;
EFB8 : 13 00 00    "   "    db  $13, $00, $00
        ;
EFBB : 0D    " "    sec
EFBC : FA FF 20    "   "    orab  XFF20
EFBF : 0F    " "    sei
EFC0 : 91 FF    "  "    cmpa  X00FF
EFC2 : FF EF B3    "   "    stx  XEFB3
EFC5 : FE 04 50    "  P"    ldx  X0450
EFC8 : 01    " "    nop
        ;
EFC9 : 14 00 00 00  "    "    db  $14, $00, $00, $00
        ;
EFCD : 0D    " "    sec
EFCE : FA 6E 20    " n "    orab  X6E20
EFD1 : 0F    " "    sei
EFD2 : 91 FF    "  "    cmpa  X00FF
        ;
EFD4 : 00 05 00 51  "   Q"    db  $00, $05, $00, $51
        ;
EFD8 : 19    " "    daa
        ;
EFD9 : DD 00 F3 00  "    "    db  $DD, $00, $F3, $00
        ;
EFDD : FF 01 00    "   "    stx  X0100
EFE0 : 10    " "    sba
EFE1 : 0F    " "    sei
        ;
EFE2 : 00    " "    db  $00
        ;
EFE3 : FF 00 02    "   "    stx  X0002
        ;
EFE6 : 00 00 00    "   "    db  $00, $00, $00
        ;
EFE9 : F4 00 0C    "   "    andb  X000C
EFEC : 06    " "    tap
EFED : 50    "P"    negb
        ;
EFEE : FC 00 21    "  !"    db  $FC, $00, $21
        ;
EFF1 : 0F    " "    sei
EFF2 : 91 12    "  "    cmpa  X0012
        ;
EFF4 : 00    " "    db  $00
        ;
EFF5 : 0A    " "    clv
EFF6 : 01    " "    nop
        ;
EFF7 : 00 00    "  "    db  $00, $00
        ;
EFF9 : 01    " "    nop
EFFA : 07    " "    tpa
        ;
EFFB : 00 00 03    "   "    db  $00, $00, $03
        ;
EFFE : 09    " "    dex
EFFF : FF 0F 0F    "   "    stx  X0F0F
        ;
F002 : 12    " "    db  $12
        ;
F003 : FF FF EF    "   "    stx  XFFEF
F006 : F5 F9 00    "   "    bitb  XF900
        ;
F009 : 1C 12    "  "    db  $1C, $12
        ;
F00B : FF 00 E6    "   "    stx  X00E6
F00E : 09    " "    dex
F00F : 0D    " "    sec
        ;
F010 : 1C 55    " U"    db  $1C, $55
        ;
F012 : 16    " "    tab
        ;
F013 : 15 F3    "  "    db  $15, $F3
        ;
F015 : 09    " "    dex
F016 : 80 F0    "  "    suba  #$F0
F018 : 19    " "    daa
F019 : 0A    " "    clv
F01A : 10    " "    sba
        ;
F01B : 00 00    "  "    db  $00, $00
        ;
F01D : 01    " "    nop
F01E : 07    " "    tpa
        ;
F01F : 00 00 03    "   "    db  $00, $00, $03
        ;
F022 : 09    " "    dex
F023 : FF 0F 0F    "   "    stx  X0F0F
        ;
F026 : 12    " "    db  $12
        ;
F027 : FF 7F 05    "   "    stx  X7F05
F02A : 01    " "    nop
        ;
F02B : 00 00    "  "    db  $00, $00
        ;
F02D : 01    " "    nop
        ;
F02E : 02 00 00    "   "    db  $02, $00, $00
        ;
F031 : 09    " "    dex
        ;
F032 : 1F    " "    db  $1F
        ;
F033 : FF 0F 0F    "   "    stx  X0F0F
        ;
F036 : 12    " "    db  $12
        ;
F037 : 7F 75 0A    " u "    clr  X750A
F03A : 01    " "    nop
        ;
F03B : 00 00    "  "    db  $00, $00
        ;
F03D : 01    " "    nop
F03E : 0F    " "    sei
        ;
F03F : 00 00    "  "    db  $00, $00
        ;
F041 : 09    " "    dex
        ;
F042 : 1F 03    "  "    db  $1F, $03
        ;
F044 : 0F    " "    sei
F045 : 0F    " "    sei
        ;
F046 : 12    " "    db  $12
        ;
F047 : 01    " "    nop
        ;
F048 : 75 00 00    "u  "    db  $75, $00, $00
        ;
F04B : 50    "P"    negb
F04C : 01    " "    nop
F04D : 17    " "    tba
F04E : 06    " "    tap
        ;
F04F : 00 00 00    "   "    db  $00, $00, $00
        ;
F052 : FF 09 20    "   "    stx  X0920
F055 : 0F    " "    sei
F056 : 91 03    "  "    cmpa  X0003
F058 : 10    " "    sba
        ;
F059 : 02 00 00 00  "    "    db  $02, $00, $00, $00
        ;
F05D : 01    " "    nop
F05E : 09    " "    dex
        ;
F05F : 00 00    "  "    db  $00, $00
        ;
F061 : 08    " "    inx
        ;
F062 : 00 00    "  "    db  $00, $00
        ;
F064 : 20 0F    "  "    bra  LF075
        ;
F066 : 00    " "    db  $00
        ;
F067 : 10    " "    sba
F068 : 81 02    "  "    cmpa  #$02
        ;
F06A : 00 00 00    "   "    db  $00, $00, $00
        ;
F06D : 01    " "    nop
        ;
F06E : 05 00 00    "   "    db  $05, $00, $00
        ;
F071 : 08    " "    inx
        ;
F072 : 00 00    "  "    db  $00, $00
        ;
F074 : 20 0F    "  "    bra  LF085
        ;
F076 : 00    " "    db  $00
        ;
F077 : 10    " "    sba
        ;
F078 : 00    " "    db  $00
        ;
F079 : 01    " "    nop
        ;
F07A : 00 00 00    "   "    db  $00, $00, $00
        ;
F07D : 01    " "    nop
        ;
F07E : 00 00 00 02  "    "    db  $00, $00, $00, $02
        ;
F082 : 01    " "    nop
        ;
F083 : 00    " "    db  $00
        ;
F084 : 0F    " "    sei
F085        LF085:
F085 : 0F    " "    sei
F086 : 11    " "    cba
F087 : FF 00 01    "   "    stx  X0001
        ;
F08A : 00    " "    db  $00
        ;
F08B : 80 09    "  "    suba  #$09
        ;
F08D : 00 00 00 00  "    "    db  $00, $00, $00, $00
F091 : 02    " "    db  $02
        ;
F092 : 01    " "    nop
        ;
F093 : 00    " "    db  $00
        ;
F094 : 0F    " "    sei
F095 : 0F    " "    sei
F096 : 10    " "    sba
F097 : FF FF F0    "   "    stx  XFFF0
F09A : 89 08    "  "    adca  #$08
F09C : 10    " "    sba
        ;
F09D : 00 00    "  "    db  $00, $00
        ;
F09F : 01    " "    nop
F0A0 : 07    " "    tpa
        ;
F0A1 : 00 00    "  "    db  $00, $00
        ;
F0A3 : 09    " "    dex
        ;
F0A4 : 1F    " "    db  $1F
        ;
F0A5 : FF 0F 00    "   "    stx  X0F00
        ;
F0A8 : 12    " "    db  $12
        ;
F0A9 : FF 7F 12    "   "    stx  X7F12
F0AC : 0C    " "    clc
        ;
F0AD : 00 00 02 04  "    "    db  $00, $00, $02, $04
F0B1 : 00 00    "  "    db  $00, $00
        ;
F0B3 : 09    " "    dex
        ;
F0B4 : 1F    " "    db  $1F
        ;
F0B5 : FF 0F 0F    "   "    stx  X0F0F
        ;
F0B8 : 14    " "    db  $14
        ;
F0B9 : FF 7F F9    "   "    stx  X7FF9
        ;
F0BC : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F0BF : FF 00 E6    "   "    stx  X00E6
F0C2 : 09    " "    dex
F0C3 : 0D    " "    sec
        ;
F0C4 : 1C 55    " U"    db  $1C, $55
        ;
F0C6 : 16    " "    tab
        ;
F0C7 : 15 F3 1C 00  "    "    db  $15, $F3, $1C, $00
        ;
F0CB : F9 00 1C    "   "    adcb  X001C
        ;
F0CE : 12    " "    db  $12
        ;
F0CF : FF 00 E6    "   "    stx  X00E6
F0D2 : 09    " "    dex
F0D3 : 0D    " "    sec
        ;
F0D4 : 1C 55    " U"    db  $1C, $55
        ;
F0D6 : 16    " "    tab
        ;
F0D7 : 15 F3 1A 00  "    "    db  $15, $F3, $1A, $00
        ;
F0DB : 01    " "    nop
        ;
F0DC : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F0DF : F2 00 E8    "   "    sbcb  X00E8
F0E2 : 08    " "    inx
F0E3 : 0D    " "    sec
        ;
F0E4 : 1C 55    " U"    db  $1C, $55
        ;
F0E6 : 16    " "    tab
        ;
F0E7 : 15 13    "  "    db  $15, $13
        ;
F0E9 : 32    "2"    pula
        ;
F0EA : 00    " "    db  $00
        ;
F0EB : 01    " "    nop
        ;
F0EC : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F0EF : F2 00 E8    "   "    sbcb  X00E8
F0F2 : 08    " "    inx
F0F3 : 0D    " "    sec
        ;
F0F4 : 1C 55    " U"    db  $1C, $55
        ;
F0F6 : 16    " "    tab
        ;
F0F7 : 15    " "    db  $15
        ;
F0F8 : 11    " "    cba
        ;
F0F9 : 38 00 00 00  "8   "    db  $38, $00, $00, $00
F0FD : 1C 12    "  "    db  $1C, $12
        ;
F0FF : F2 00 E8    "   "    sbcb  X00E8
F102 : 08    " "    inx
F103 : 0D    " "    sec
        ;
F104 : 1C 55    " U"    db  $1C, $55
        ;
F106 : 16    " "    tab
        ;
F107 : 15    " "    db  $15
        ;
F108 : 11    " "    cba
        ;
F109 : 38 00 02 00  "8   "    db  $38, $00, $02, $00
F10D : 00 00 02 02  "    "    db  $00, $00, $02, $02
        ;
F111 : 80 03    "  "    suba  #$03
F113 : 0D    " "    sec
F114 : 20 4A    " J"    bra  LF160
        ;
F116 : 13 13    "  "    db  $13, $13
        ;
F118 : 1B    " "    aba
F119 : A9 00    "  "    adca  $00,x
F11B : 01    " "    nop
        ;
F11C : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F11F : F2 00 E8    "   "    sbcb  X00E8
F122 : 08    " "    inx
F123 : 0D    " "    sec
        ;
F124 : 1C 55    " U"    db  $1C, $55
        ;
F126 : 16    " "    tab
        ;
F127 : 15 1C    "  "    db  $15, $1C
        ;
F129 : 4F    "O"    clra
        ;
F12A : 00    " "    db  $00
        ;
F12B : 01    " "    nop
        ;
F12C : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F12F : F2 00 E8    "   "    sbcb  X00E8
F132 : 08    " "    inx
F133 : 0D    " "    sec
        ;
F134 : 1C 55    " U"    db  $1C, $55
        ;
F136 : 16    " "    tab
        ;
F137 : 15 1A    "  "    db  $15, $1A
        ;
F139 : 63 00    "c "    com  $00,x
F13B : 01    " "    nop
        ;
F13C : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F13F : F2 00 E8    "   "    sbcb  X00E8
F142 : 08    " "    inx
F143 : 0D    " "    sec
        ;
F144 : 1C 55    " U"    db  $1C, $55
        ;
F146 : 16    " "    tab
        ;
F147 : 15 18    "  "    db  $15, $18
        ;
F149 : 73 00 01    "s  "    com  X0001
        ;
F14C : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F14F : F2 00 E8    "   "    sbcb  X00E8
F152 : 08    " "    inx
F153 : 0D    " "    sec
        ;
F154 : 1C 55    " U"    db  $1C, $55
        ;
F156 : 16    " "    tab
        ;
F157 : 15    " "    db  $15
        ;
F158 : 17    " "    tba
F159 : 4D    "M"    tsta
        ;
F15A        LF15A:
F15A : 00 00 02 1C  "    "    db  $00, $00, $02, $1C
F15E : 12 CD 13    "   "    db  $12, $CD, $13
        ;
F161 : DF F4    "  "    stx  X00F4
F163 : 35    "5"    txs
F164 : 0F    " "    sei
F165 : 48    "H"    asla
F166 : 11    " "    cba
F167 : 23 F1    "# "    bls  LF15A
F169 : 9B 00    "  "    adda  X0000
F16B : 01    " "    nop
        ;
F16C : 00 00 00    "   "    db  $00, $00, $00
        ;
F16F : FF 08 26    "  &"    stx  X0826
        ;
F172 : 13    " "    db  $13
        ;
F173 : 0D    " "    sec
        ;
F174 : 21    "!"    db  $21
        ;
F175 : 4A    "J"    deca
        ;
F176 : 14 15 13    "   "    db  $14, $15, $13
        ;
F179 : 2E 00    ". "    bgt  LF17B
F17B        LF17B:
F17B : 01    " "    nop
        ;
F17C : 00 00 00    "   "    db  $00, $00, $00
        ;
F17F : FF 06 26    "  &"    stx  X0626
        ;
F182 : 13    " "    db  $13
        ;
F183 : 0D    " "    sec
        ;
F184 : 21    "!"    db  $21
        ;
F185 : 4A    "J"    deca
        ;
F186 : 14    " "    db  $14
        ;
F187 : 0C    " "    clc
F188 : F1 3A 00    " : "    cmpb  X3A00
        ;
F18B : 00    " "    db  $00
        ;
F18C : 07    " "    tpa
        ;
F18D : 00 00    "  "    db  $00, $00
        ;
F18F : 07    " "    tpa
F190 : 16    " "    tab
F191 : DF F4    "  "    stx  X00F4
F193 : 35    "5"    txs
F194 : 0F    " "    sei
F195 : 48    "H"    asla
F196 : 11    " "    cba
F197 : 23 F1    "# "    bls  LF18A
F199 : 30    "0"    tsx
        ;
F19A        LF19A:
F19A : 00 00    "  "    db  $00, $00
        ;
F19C : 07    " "    tpa
        ;
F19D : 00 00    "  "    db  $00, $00
        ;
F19F : 06    " "    tap
F1A0 : 16    " "    tab
F1A1 : DF F4    "  "    stx  X00F4
F1A3 : 35    "5"    txs
F1A4 : 0F    " "    sei
F1A5 : 48    "H"    asla
F1A6 : 11    " "    cba
F1A7 : 23 F1    "# "    bls  LF19A
F1A9 : 2E 00    ". "    bgt  LF1AB
F1AB        LF1AB:
F1AB : 01    " "    nop
F1AC : 07    " "    tpa
        ;
F1AD : 00 00    "  "    db  $00, $00
        ;
F1AF : 3E    ">"    wai
        ;
F1B0 : 05    " "    db  $05
        ;
F1B1 : BA 10 34    "  4"    oraa  X1034
F1B4 : 0D    " "    sec
        ;
F1B5 : 45    "E"    db  $45
        ;
F1B6 : 0F    " "    sei
F1B7 : 19    " "    daa
F1B8 : F1 21 00    " ! "    cmpb  X2100
F1BB : 01    " "    nop
F1BC : 07    " "    tpa
        ;
F1BD : 00 00 3C    "  <"    db  $00, $00, $3C
        ;
F1C0 : 0E    " "    cli
F1C1 : BA F3 34    "  4"    oraa  XF334
F1C4 : 0D    " "    sec
        ;
F1C5 : 45    "E"    db  $45
        ;
F1C6 : 0F    " "    sei
F1C7 : 19    " "    daa
F1C8 : F1 1A 00    "   "    cmpb  X1A00
        ;
F1CB : 03 00 00 00  "    "    db  $03, $00, $00, $00
        ;
F1CF : 01    " "    nop
F1D0 : 0E    " "    cli
        ;
F1D1 : 00 00 04 1F  "    "    db  $00, $00, $04, $1F
        ;
F1D5 : FF 20 0F    "   "    stx  X200F
        ;
F1D8 : 12    " "    db  $12
        ;
F1D9 : 7F 7F 03    "   "    clr  X7F03
        ;
F1DC : 00 00 00    "   "    db  $00, $00, $00
        ;
F1DF : 01    " "    nop
        ;
F1E0 : 13 00 00 04  "    "    db  $13, $00, $00, $04
F1E4 : 1F    " "    db  $1F
        ;
F1E5 : FF 20 0F    "   "    stx  X200F
        ;
F1E8 : 12    " "    db  $12
        ;
F1E9 : 7F 7F 01    "   "    clr  X7F01
        ;
F1EC : 00    " "    db  $00
        ;
F1ED : 0A    " "    clv
        ;
F1EE : 1D 12    "  "    db  $1D, $12
        ;
F1F0 : 23 00    "# "    bls  LF1F2
        ;
F1F2        LF1F2:
F1F2 : 00    " "    db  $00
        ;
F1F3 : FF 01 FF    "   "    stx  X01FF
F1F6 : 20 0F    "  "    bra  LF207
        ;
F1F8 : 10    " "    sba
F1F9 : 88 01    "  "    eora  #$01
F1FB : 01    " "    nop
        ;
F1FC : 00    " "    db  $00
        ;
F1FD : 0A    " "    clv
        ;
F1FE : 1D FC    "  "    db  $1D, $FC
        ;
F200 : 23 00    "# "    bls  LF202
        ;
F202        LF202:
F202 : 00    " "    db  $00
        ;
F203 : FF 01 FF    "   "    stx  X01FF
F206 : 20 0F    "  "    bra  LF217
        ;
F208 : 10    " "    sba
F209 : 92 02    "  "    sbca  X0002
        ;
F20B : 00    " "    db  $00
        ;
F20C : 01    " "    nop
F20D : 0A    " "    clv
F20E : 0A    " "    clv
        ;
F20F : F3    " "    db  $F3
        ;
F210 : 08    " "    inx
F211 : 10    " "    sba
F212 : FB E5 31    "  1"    addb  XE531
        ;
F215 : 03    " "    db  $03
        ;
F216 : 20 0B    "  "    bra  LF223
        ;
F218 : 11    " "    cba
F219 : 78 00 01    "x  "    asl  X0001
        ;
F21C : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F21F : F2 03 E8    "   "    sbcb  X03E8
F222 : 08    " "    inx
F223        LF223:
F223 : 0D    " "    sec
        ;
F224 : 1C 55    " U"    db  $1C, $55
        ;
F226 : 16    " "    tab
        ;
F227 : 15 1C    "  "    db  $15, $1C
        ;
F229 : 4F    "O"    clra
        ;
F22A : 00    " "    db  $00
        ;
F22B : 01    " "    nop
        ;
F22C : 00 1C 12    "   "    db  $00, $1C, $12
        ;
F22F : F2 0C E8    "   "    sbcb  X0CE8
F232 : 08    " "    inx
F233 : 0D    " "    sec
        ;
F234 : 1C 55 21 15  " U! "    db  $1C, $55, $21, $15
F238 : 1A 4B 00 03  " K  "    db  $1A, $4B, $00, $03
F23C : 00 1C 12 F3  "    "    db  $00, $1C, $12, $F3
        ;
F240 : 01    " "    nop
F241 : E8 08    "  "    eorb  $08,x
F243 : 0D    " "    sec
        ;
F244 : 1C 55    " U"    db  $1C, $55
        ;
F246 : 16    " "    tab
        ;
F247 : 15 1C    "  "    db  $15, $1C
        ;
F249 : 32    "2"    pula
        ;
F24A : 00 02 00 00  "    "    db  $00, $02, $00, $00
F24E : 00    " "    db  $00
        ;
F24F        LF24F:
F24F : E0 06    "  "    subb  $06,x
F251 : 0C    " "    clc
F252 : 08    " "    inx
F253 : 57    "W"    asrb
F254 : 01    " "    nop
        ;
F255 : 03    " "    db  $03
        ;
F256 : 26 F7    "& "    bne  LF24F
F258 : 91 1B    "  "    cmpa  X001B
        ;
F25A : 00    " "    db  $00
        ;
F25B : EE 89    "  "    ldx  $89,x
F25D : EF 93    "  "    stx  $93,x
        ;
F25F : ED    " "    db  $ED
        ;
F260 : 6A 00    "j "    dec  $00,x
F262 : 3F    "?"    swi
F263 : EF 16    "  "    stx  $16,x
F265 : EF D5    "  "    stx  $D5,x
        ;
F267 : ED    " "    db  $ED
        ;
F268 : 0A    " "    clv
        ;
F269 : 00 1F    "  "    db  $00, $1F
        ;
F26B : EE 89    "  "    ldx  $89,x
F26D : EF A3    "  "    stx  $A3,x
        ;
F26F : ED    " "    db  $ED
        ;
F270 : 6A 00    "j "    dec  $00,x
F272 : 3F    "?"    swi
F273 : EE 89    "  "    ldx  $89,x
F275 : F0 FB ED    "   "    subb  XFBED
F278 : 4A    "J"    deca
        ;
F279 : 00 1F    "  "    db  $00, $1F
        ;
F27B : EE 89    "  "    ldx  $89,x
F27D : F1 2B ED    " + "    cmpb  X2BED
F280 : 4A    "J"    deca
        ;
F281 : 00 1F    "  "    db  $00, $1F
        ;
F283 : EE 89    "  "    ldx  $89,x
F285 : F1 4B ED    " K "    cmpb  X4BED
F288 : 4A    "J"    deca
        ;
F289 : 00 1F    "  "    db  $00, $1F
        ;
F28B : EE 89    "  "    ldx  $89,x
F28D : F2 2B ED    " + "    sbcb  X2BED
F290 : 4A    "J"    deca
        ;
F291 : 00 1F    "  "    db  $00, $1F
        ;
F293 : EE 89    "  "    ldx  $89,x
F295 : F2 3B ED    " ; "    sbcb  X3BED
F298 : 4A    "J"    deca
        ;
F299 : 00 1F    "  "    db  $00, $1F
        ;
F29B : EE 89    "  "    ldx  $89,x
F29D : F0 EB ED    "   "    subb  XEBED
F2A0 : 4A    "J"    deca
        ;
F2A1 : 00 1F    "  "    db  $00, $1F
        ;
F2A3 : EE 89    "  "    ldx  $89,x
F2A5 : F2 1B ED    "   "    sbcb  X1BED
F2A8 : 4A    "J"    deca
        ;
F2A9 : 00 1F    "  "    db  $00, $1F
        ;
F2AB : EE 89    "  "    ldx  $89,x
F2AD : F1 7B ED    " { "    cmpb  X7BED
F2B0 : 4A    "J"    deca
        ;
F2B1 : 00 1F    "  "    db  $00, $1F
        ;
F2B3 : EE 89    "  "    ldx  $89,x
F2B5 : F1 1B ED    "   "    cmpb  X1BED
F2B8 : 4A    "J"    deca
        ;
F2B9 : 00 1F    "  "    db  $00, $1F
;*************************************;
;ldx call data, 8 byte blocks
F2BB : EE 89 EF E5 ED 0A 00 1F        ;
;
F2C3 : EE 89 F0 49 ED AA 00 1F        ;
;
F2CB : EE 89 F1 5B ED 4A 00 1F        ;
;
F2D3 : EE 89 F1 EB ED CA 00 1F        ;
;
F2DB : EE 89 F1 FB ED CA 00 1F        ;
;
F2E3 : EE 89 F2 0B ED CA 00 1F        ;
;
F2EB : EE 89 EF 5D ED 0A 00 1F        ;
        ;
F2F3 : EE 89 EF 6F ED 0A 00 1F        ;
;
F2FB : EE 89 EF 81 ED 0A 00 1F        ;
;
F303 : EE 89 EF B3 ED 0A 00 1F        ;
;
F30B : EE 89 EF F5 ED 4A 00 1F        ;
;
F313 : EE 89 F0 9B ED 4A 00 1F        ;
;
F31B : EE 89 F0 29 ED 4A 00 1F        ;
;
F323 : EE 89 F0 AB ED 4A 00 1F        ;
;
F32B : EE 89 F0 39 ED 4A 00 1F        ;
;
F333 : EE 89 F1 CB ED CA 00 1F        ;
;
F33B : EE 89 F1 DB ED CA 00 1F        ;
;
F343 : EF 2B F0 89 ED 0A 00 1F        ;
;
F34B : EE 8E F0 89 ED 0A 00 1F        ;
;
F353 : EE 89 F0 BB ED 4A 00 1F        ;
;
F35B : EE 89 F0 CB ED 4A 00 1F        ;
;
F363 : EE 89 F0 07 ED 4A 00 1F        ;
;
F36B : EE 89 F0 DB ED 4A 00 1F        ;
;
F373 : EE 89 F2 4B ED 4A 00 1F        ;
;
F37B : EE F5 F0 79 ED 0A 00 1F        ;
;
F383 : EE 89 F1 3B ED 4A 00 1F        ;
;
F38B : EE 89 F1 1B ED 4A 00 1F        ;
;
F393 : EE 89 F1 6B ED 4A 00 1F        ;
;
F39B : EE 89 F1 2B ED 4A 00 1F        ;
;
F3A3 : EE 89 F1 4B ED 4A 00 1F        ;
;
F3AB : EF 01 F0 79 ED 0A 00 1F        ;
;
F3B3 : EF 0D F0 79 ED 0A 00 1F        ;
;
F3BB : EE 89 F1 8B ED 4A 00 1F        ;
;
F3C3 : EE 89 F1 9B ED 4A 00 1F        ;
;
F3CB : EE 89 F1 AB ED 4A 00 1F        ;
        ;
F3D3 : EE 89 F1 BB ED 4A 00 1F        ;
        ;
F3DB : EE 89 EF C5 ED 0A 00 1F        ;
        ;
F3E3 : EE 89 F1 0B ED 4A 00 1F        ;
;*************************************;
;end ldx call range
;
F3EB : 01    " "    nop
F3EC : 09    " "    dex
        ;
F3ED : 00 00    "  "    db  $00, $00
        ;
F3EF : FF 00 00    "   "    stx  X0000
        ;
F3F2 : 00 00 13 00  "    "    db  $00, $00, $13, $00
        ;
F3F6 : FF 7F 0D    "   "    stx  X7F0D
        ;
F3F9 : 1E 00 00    "   "    db  $1E, $00, $00
        ;
F3FC : FF 00 00    "   "    stx  X0000
        ;
F3FF : 04 02    "  "    db  $04, $02
        ;
F401 : 10    " "    sba
        ;
F402 : 00    " "    db  $00
        ;
F403 : FF 7F 0D    "   "    stx  X7F0D
F406 : 24 00    "$ "    bcc  LF408
        ;
F408        LF408:
F408 : 00    " "    db  $00
        ;
F409 : FF 00 00    "   "    stx  X0000
        ;
F40C : 04 02    "  "    db  $04, $02
        ;
F40E : 10    " "    sba
        ;
F40F : 00    " "    db  $00
        ;
F410 : FF 7F 0D    "   "    stx  X7F0D
F413 : 32    "2"    pula
        ;
F414 : 00 00    "  "    db  $00, $00
        ;
F416 : FF 00 00    "   "    stx  X0000
        ;
F419 : 04 02    "  "    db  $04, $02
        ;
F41B : 10    " "    sba
        ;
F41C : 00    " "    db  $00
        ;
F41D : FF 7F 0D    "   "    stx  X7F0D
        ;
F420 : 3C 00 00    "<  "    db  $3C, $00, $00
        ;
F423 : FF 00 00    "   "    stx  X0000
        ;
F426 : 04 02    "  "    db  $04, $02
        ;
F428 : 10    " "    sba
        ;
F429 : 00 1E 00    "   "    db  $00, $1E, $00
        ;
F42C : 0D    " "    sec
F42D : 76 00 00    "v  "    ror  X0000
F430 : FF 00 00    "   "    stx  X0000
        ;
F433 : 04 02    "  "    db  $04, $02
        ;
F435 : 10    " "    sba
        ;
F436 : 00    " "    db  $00
        ;
F437 : 07    " "    tpa
        ;
F438 : 00    " "    db  $00
F439        XF439:
F439 : 04    " "    db  $04
        ;
F43A : 7C 08 C9    "|  "    inc  X08C9
F43D : FF FE FC    "   "    stx  XFEFC
        ;
F440 : 04 02 00    "   "    db  $04, $02, $00
        ;
F443 : 20 1E    "  "    bra  LF463
        ;
F445 : 00    " "    db  $00
        ;
F446 : 0F    " "    sei
F447 : 06    " "    tap
        ;
F448 : 02    " "    db  $02
        ;
F449 : F7 09 66    "  f"    stab  X0966
F44C : 34    "4"    des
F44D : 01    " "    nop
        ;
F44E : 00 00 00    "   "    db  $00, $00, $00
        ;
F451 : F9 42 0F    " B "    adcb  X420F
F454 : 06    " "    tap
        ;
F455 : 02    " "    db  $02
        ;
F456 : F7 09 DF    "   "    stab  X09DF
F459 : D9 01    "  "    adcb  X0001
        ;
F45B : 00 00 00    "   "    db  $00, $00, $00
        ;
F45E : F9 42 14    " B "    adcb  X4214
F461 : 08    " "    inx
        ;
F462 : 02    " "    db  $02
        ;
F463        LF463:
F463 : F7 FF DF    "   "    stab  XFFDF
F466 : D9 00    "  "    adcb  X0000
        ;
F468 : 00 00 00    "   "    db  $00, $00, $00
        ;
F46B : FF 8F 15    "   "    stx  X8F15
F46E : 08    " "    inx
        ;
F46F : 02    " "    db  $02
        ;
F470 : F7 FF DF    "   "    stab  XFFDF
F473 : D9 00    "  "    adcb  X0000
        ;
F475 : 00    " "    db  $00
        ;
F476 : 10    " "    sba
        ;
F477 : 00    " "    db  $00
        ;
F478 : FF 8F F4    "   "    stx  X8FF4
F47B : 6D 14    "m "    tst  $14,x
F47D : 09    " "    dex
        ;
F47E : 02    " "    db  $02
        ;
F47F : F7 FF DF    "   "    stab  XFFDF
F482 : D9 00    "  "    adcb  X0000
        ;
F484 : 00    " "    db  $00
        ;
F485 : 10    " "    sba
        ;
F486 : 00    " "    db  $00
        ;
F487 : FF 8F F4    "   "    stx  X8FF4
F48A : 8B 14    "  "    adda  #$14
F48C : 0A    " "    clv
        ;
F48D : 02    " "    db  $02
        ;
F48E : F7 FF DF    "   "    stab  XFFDF
F491 : D9 00    "  "    adcb  X0000
        ;
F493 : 00    " "    db  $00
        ;
F494 : 10    " "    sba
        ;
F495 : 00    " "    db  $00
        ;
F496 : FF 8F F4    "   "    stx  X8FF4
F499 : 9A 14    "  "    oraa  X0014
F49B : 08    " "    inx
        ;
F49C : 02    " "    db  $02
        ;
F49D : F7 FF DF    "   "    stab  XFFDF
F4A0 : D9 00    "  "    adcb  X0000
        ;
F4A2 : 00    " "    db  $00
        ;
F4A3 : 10    " "    sba
        ;
F4A4 : 00    " "    db  $00
        ;
F4A5 : FF 8F F4    "   "    stx  X8FF4
F4A8 : 6D 08    "m "    tst  $08,x
F4AA : 08    " "    inx
        ;
F4AB : 02    " "    db  $02
        ;
F4AC : F7 FF DF    "   "    stab  XFFDF
F4AF : D9 00    "  "    adcb  X0000
        ;
F4B1 : 00 00 00    "   "    db  $00, $00, $00
        ;
F4B4 : 80 04    "  "    suba  #$04
        ;
F4B6 : 14    " "    db  $14
        ;
F4B7 : 09    " "    dex
        ;
F4B8 : 02    " "    db  $02
        ;
F4B9 : F7 FF DF    "   "    stab  XFFDF
F4BC : D9 00    "  "    adcb  X0000
        ;
F4BE : 00 00 00 FD  "    "    db  $00, $00, $00, $FD
F4C2 : 8F    " "    db  $8F
        ;
F4C3 : F4 C5 14    "   "    andb  XC514
F4C6 : 0A    " "    clv
        ;
F4C7 : 02    " "    db  $02
        ;
F4C8 : F7 FF DF    "   "    stab  XFFDF
F4CB : D9 00    "  "    adcb  X0000
        ;
F4CD : 00 00 00    "   "    db  $00, $00, $00
        ;
F4D0 : F8 88 F4    "   "    eorb  X88F4
F4D3 : D4 14    "  "    andb  X0014
F4D5 : 09    " "    dex
        ;
F4D6 : 02    " "    db  $02
        ;
F4D7 : F7 FF DF    "   "    stab  XFFDF
F4DA : D9 00    "  "    adcb  X0000
        ;
F4DC : 00 00 00 FD  "    "    db  $00, $00, $00, $FD
        ;
F4E0 : 88 F4    "  "    eora  #$F4
        ;
F4E2 : E3 14    "  "    db  $E3, $14
        ;
F4E4 : 08    " "    inx
        ;
F4E5 : 02    " "    db  $02
        ;
F4E6 : F7 FF DF    "   "    stab  XFFDF
F4E9 : D9 00    "  "    adcb  X0000
        ;
F4EB : 00 00 00    "   "    db  $00, $00, $00
        ;
F4EE : FF 8A F4    "   "    stx  X8AF4
F4F1 : A9 01    "  "    adca  $01,x
        ;
F4F3 : 02 04    "  "    db  $02, $04
        ;
F4F5 : FF 40 FF    " @ "    stx  X40FF
F4F8 : 3F    "?"    swi
        ;
F4F9 : 00 00    "  "    db  $00, $00
        ;
F4FB : 10    " "    sba
        ;
F4FC : 00    " "    db  $00
        ;
F4FD : FF FF F4    "   "    stx  XFFF4
F500 : F2 01 02    "   "    sbcb  X0102
        ;
F503 : 00 00    "  "    db  $00, $00
        ;
F505 : FF 00 00    "   "    stx  X0000
        ;
F508 : 00 02    "  "    db  $00, $02
        ;
F50A : 10    " "    sba
        ;
F50B : 00    " "    db  $00
        ;
F50C : FF FF F5    "   "    stx  XFFF5
F50F : 01    " "    nop
F510 : 01    " "    nop
        ;
F511 : 04 00 00 00  "    "    db  $04, $00, $00, $00
        ;
F515 : FF 00 01    "   "    stx  X0001
        ;
F518 : 03    " "    db  $03
        ;
F519 : 11    " "    cba
        ;
F51A : 00    " "    db  $00
        ;
F51B : FF FF F5    "   "    stx  XFFF5
F51E : 10    " "    sba
F51F : 08    " "    inx
        ;
F520 : 13 02    "  "    db  $13, $02
        ;
F522 : F9 FF E3    "   "    adcb  XFFE3
F525 : E0 05    "  "    subb  $05,x
F527 : 08    " "    inx
        ;
F528 : 14 00    "  "    db  $14, $00
        ;
F52A : C0 05    "  "    subb  #$05
F52C : 01    " "    nop
        ;
F52D : 00    " "    db  $00
        ;
F52E : 01    " "    nop
F52F : 01    " "    nop
F530 : FF D9 55    "  U"    stx  XD955
        ;
F533 : 00 00    "  "    db  $00, $00
        ;
F535 : 10    " "    sba
        ;
F536 : 00 00 00    "   "    db  $00, $00, $00
        ;
F539 : 01    " "    nop
        ;
F53A : 00    " "    db  $00
        ;
F53B : 01    " "    nop
F53C : 01    " "    nop
F53D : FF D9 55    "  U"    stx  XD955
        ;
F540 : 00 00    "  "    db  $00, $00
        ;
F542 : 11    " "    cba
        ;
F543 : 00 00 00    "   "    db  $00, $00, $00
        ;
F546 : 01    " "    nop
        ;
F547 : 00    " "    db  $00
        ;
F548 : 01    " "    nop
F549 : 01    " "    nop
F54A : FF D9 55    "  U"    stx  XD955
        ;
F54D : 00 00 12 00  "    "    db  $00, $00, $12, $00
F551 : 00 00    "  "    db  $00, $00
        ;
F553 : 01    " "    nop
        ;
F554 : 00    " "    db  $00
        ;
F555 : 01    " "    nop
F556 : 01    " "    nop
F557 : FF D9 55    "  U"    stx  XD955
        ;
F55A : 00 00 13 00  "    "    db  $00, $00, $13, $00
F55E : 00 00    "  "    db  $00, $00
        ;
F560 : 01    " "    nop
        ;
F561 : 00    " "    db  $00
        ;
F562 : 01    " "    nop
F563 : 01    " "    nop
F564 : FF D9 55    "  U"    stx  XD955
        ;
F567 : 00 00 14 00  "    "    db  $00, $00, $14, $00
F56B : 00 00 02    "   "    db  $00, $00, $02
        ;
F56E : 06    " "    tap
        ;
F56F : 04 02    "  "    db  $04, $02
        ;
F571 : FF 00 00    "   "    stx  X0000
        ;
F574 : 00 00    "  "    db  $00, $00
        ;
F576 : 10    " "    sba
        ;
F577 : 00    " "    db  $00
        ;
F578 : FF 7F 37    "  7"    stx  X7F37
F57B : 01    " "    nop
        ;
F57C : 00 00    "  "    db  $00, $00
        ;
F57E : FF 00 00    "   "    stx  X0000
        ;
F581 : 02    " "    db  $02
        ;
F582 : 01    " "    nop
F583 : 11    " "    cba
        ;
F584 : 00    " "    db  $00
        ;
F585 : FF 7F 0A    "   "    stx  X7F0A
        ;
F588 : 05 00    "  "    db  $05, $00
        ;
F58A : 09    " "    dex
F58B : FF 83 DE    "   "    stx  X83DE
        ;
F58E : 00 00    "  "    db  $00, $00
        ;
F590 : 10    " "    sba
        ;
F591 : 00    " "    db  $00
        ;
F592 : FF FF F5    "   "    stx  XFFF5
        ;
F595 : 87    " "    db  $87
        ;
F596 : 01    " "    nop
        ;
F597 : 04 02 13    "   "    db  $04, $02, $13
        ;
F59A : FF 1E 63    "  c"    stx  X1E63
        ;
F59D : 00 00    "  "    db  $00, $00
        ;
F59F : 10    " "    sba
        ;
F5A0 : 00    " "    db  $00
        ;
F5A1 : FF 03 F0    "   "    stx  X03F0
        ;
F5A4 : 05 02    "  "    db  $05, $02
        ;
F5A6 : 16    " "    tab
F5A7 : FF 82 94    "   "    stx  X8294
        ;
F5AA : 00 00    "  "    db  $00, $00
        ;
F5AC : 10    " "    sba
        ;
F5AD : 00    " "    db  $00
        ;
F5AE : FF 7F 02    "   "    stx  X7F02
F5B1 : 0F    " "    sei
        ;
F5B2 : 00 00    "  "    db  $00, $00
        ;
F5B4 : FF 00 00    "   "    stx  X0000
        ;
F5B7 : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
F5BB : FF 7F 02    "   "    stx  X7F02
        ;
F5BE : 18 00 00    "   "    db  $18, $00, $00
        ;
F5C1 : FF 00 00    "   "    stx  X0000
        ;
F5C4 : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
F5C8 : FF 7F 04    "   "    stx  X7F04
        ;
F5CB : 14 00 00    "   "    db  $14, $00, $00
        ;
F5CE : FF 00 00    "   "    stx  X0000
        ;
F5D1 : 00 00 00 00  "    "    db  $00, $00, $00, $00
        ;
F5D5 : FF 7F FB    "   "    stx  X7FFB
        ;
F5D8 : 00    " "    db  $00
        ;
F5D9 : 01    " "    nop
F5DA : 07    " "    tpa
F5DB : 06    " "    tap
F5DC : DF F2    "  "    stx  X00F2
        ;
F5DE : 05 03 14 00  "    "    db  $05, $03, $14, $00
        ;
F5E2 : FF 00 F5    "   "    stx  X00F5
F5E5 : E6 FB    "  "    ldab  $FB,x
        ;
F5E7 : 00    " "    db  $00
        ;
F5E8 : 01    " "    nop
F5E9 : 07    " "    tpa
F5EA : 06    " "    tap
F5EB : DF F2    "  "    stx  X00F2
        ;
F5ED : 05 03 14    "   "    db  $05, $03, $14
        ;
F5F0 : 01    " "    nop
F5F1 : FF 00 F5    "   "    stx  X00F5
F5F4 : F5 FB 00    "   "    bitb  XFB00
F5F7 : 01    " "    nop
F5F8 : 07    " "    tpa
F5F9 : 06    " "    tap
F5FA : DF F2    "  "    stx  X00F2
        ;
F5FC : 05 03 14 02  "    "    db  $05, $03, $14, $02
        ;
F600 : FF 00 F6    "   "    stx  X00F6
        ;
F603 : 04    " "    db  $04
        ;
F604 : FB 00 01    "   "    addb  X0001
F607 : 07    " "    tpa
F608 : 06    " "    tap
F609 : DF F2    "  "    stx  X00F2
        ;
F60B : 05 03 14 03  "    "    db  $05, $03, $14, $03
        ;
F60F : FF 00 F6    "   "    stx  X00F6
        ;
F612 : 13    " "    db  $13
        ;
F613 : FB 00 01    "   "    addb  X0001
F616 : 07    " "    tpa
F617 : 06    " "    tap
F618 : DF F2    "  "    stx  X00F2
        ;
F61A : 05 03 14 04  "    "    db  $05, $03, $14, $04
        ;
F61E : FF 00 F5    "   "    stx  X00F5
F621 : D7 01    "  "    stab  X0001
        ;
F623 : 02    " "    db  $02
        ;
F624 : 01    " "    nop
F625 : 01    " "    nop
F626 : FF D9 55    "  U"    stx  XD955
F629 : F7 01 11    "   "    stab  X0111
        ;
F62C : 00    " "    db  $00
        ;
F62D : FF 7F 21    "  !"    stx  X7F21
        ;
F630 : 02    " "    db  $02
        ;
F631 : FF 0E 00    "   "    stx  X0E00
F634 : 01    " "    nop
F635 : 01    " "    nop
        ;
F636 : 00 C7    "  "    db  $00, $C7
        ;
F638 : 11    " "    cba
        ;
F639 : 00    " "    db  $00
        ;
F63A : FF 7F 21    "  !"    stx  X7F21
        ;
F63D : 02    " "    db  $02
        ;
F63E : FF 0E 00    "   "    stx  X0E00
F641 : 01    " "    nop
F642 : 01    " "    nop
        ;
F643 : 00 D3    "  "    db  $00, $D3
        ;
F645 : 11    " "    cba
        ;
F646 : 00 93    "  "    db  $00, $93
        ;
F648 : 80 F6    "  "    suba  #$F6
        ;
F64A : 4B    "K"    db  $4B
        ;
F64B : 4A    "J"    deca
        ;
F64C : 03 00 00    "   "    db  $03, $00, $00
        ;
F64F : F0 00 00    "   "    subb  X0000
        ;
F652 : 00 00    "  "    db  $00, $00
        ;
F654 : 11    " "    cba
        ;
F655 : 00    " "    db  $00
        ;
F656 : 0F    " "    sei
F657 : 80 F6    "  "    suba  #$F6
        ;
F659 : 4B 02 02 00  "K   "    db  $4B, $02, $02, $00
F65D : 00    " "    db  $00
        ;
F65E : FF 00 00    "   "    stx  X0000
        ;
F661 : 00 15    "  "    db  $00, $15
        ;
F663 : 11    " "    cba
        ;
F664 : 00    " "    db  $00
        ;
F665 : FF 7F 04    "   "    stx  X7F04
F668 : 01    " "    nop
        ;
F669 : 00 00    "  "    db  $00, $00
        ;
F66B : FF 00 00    "   "    stx  X0000
F66E : 01    " "    nop
F66F : 01    " "    nop
F670 : 11    " "    cba
        ;
F671 : 00    " "    db  $00
        ;
F672 : FF 7F 01    "   "    stx  X7F01
F675 : 01    " "    nop
        ;
F676 : 00 00    "  "    db  $00, $00
        ;
F678 : FF 00 00    "   "    stx  X0000
        ;
F67B : 00 E3    "  "    db  $00, $E3
        ;
F67D : 11    " "    cba
        ;
F67E : 00    " "    db  $00
        ;
F67F : FF 7F 01    "   "    stx  X7F01
F682 : 06    " "    tap
        ;
F683 : 00 00    "  "    db  $00, $00
        ;
F685 : FF 00 00    "   "    stx  X0000
F688 : 01    " "    nop
F689 : 35    "5"    txs
F68A : 11    " "    cba
        ;
F68B : 00    " "    db  $00
        ;
F68C : FF 7F 01    "   "    stx  X7F01
F68F : 0B    " "    sev
        ;
F690 : 00 02 00 00  "    "    db  $00, $02, $00, $00
F694 : 00    " "    db  $00
        ;
F695 : 01    " "    nop
F696 : FA 01 00    "   "    orab  X0100
F699 : FF 7F 01    "   "    stx  X7F01
F69C : 0B    " "    sev
        ;
F69D : 00 02    "  "    db  $00, $02
        ;
F69F : FF 00 00    "   "    stx  X0000
F6A2 : 01    " "    nop
        ;
F6A3 : ED    " "    db  $ED
        ;
F6A4 : 11    " "    cba
        ;
F6A5 : 00    " "    db  $00
        ;
F6A6 : FF 7F 01    "   "    stx  X7F01
F6A9 : 0B    " "    sev
        ;
F6AA : 00 02    "  "    db  $00, $02
        ;
F6AC : FF 00 00    "   "    stx  X0000
F6AF : 01    " "    nop
F6B0 : EB 11    "  "    addb  $11,x
        ;
F6B2 : 00    " "    db  $00
        ;
F6B3 : FF 7F 01    "   "    stx  X7F01
F6B6 : 0B    " "    sev
        ;
F6B7 : 00 02    "  "    db  $00, $02
        ;
F6B9 : FF 00 00    "   "    stx  X0000
F6BC : 01    " "    nop
F6BD : DE 11    "  "    ldx  X0011
        ;
F6BF : 00    " "    db  $00
        ;
F6C0 : FF 7F 01    "   "    stx  X7F01
F6C3 : 0B    " "    sev
        ;
F6C4 : 00 02    "  "    db  $00, $02
        ;
F6C6 : FF 00 00    "   "    stx  X0000
F6C9 : 01    " "    nop
        ;
F6CA : C7    " "    db  $C7
        ;
F6CB : 11    " "    cba
        ;
F6CC : 00    " "    db  $00
        ;
F6CD : FF 7F 01    "   "    stx  X7F01
F6D0 : 0B    " "    sev
        ;
F6D1 : 00 02 00 00  "    "    db  $00, $02, $00, $00
F6D5 : 00 00    "  "    db  $00, $00
        ;
F6D7 : F0 11 00    "   "    subb  X1100
F6DA : 40    "@"    nega
        ;
F6DB : 00    " "    db  $00
        ;
F6DC : 01    " "    nop
F6DD : 0B    " "    sev
F6DE : 01    " "    nop
        ;
F6DF : 03    " "    db  $03
        ;
F6E0 : 01    " "    nop
F6E1 : 01    " "    nop
        ;
F6E2 : 02    " "    db  $02
        ;
F6E3 : 01    " "    nop
F6E4 : EE 11    "  "    ldx  $11,x
        ;
F6E6 : 00    " "    db  $00
        ;
F6E7 : 40    "@"    nega
        ;
F6E8 : 00 3C 02    " < "    db  $00, $3C, $02
        ;
F6EB : 01    " "    nop
        ;
F6EC : 03    " "    db  $03
        ;
F6ED : 01    " "    nop
F6EE : 01    " "    nop
        ;
F6EF : 02    " "    db  $02
        ;
F6F0 : 01    " "    nop
F6F1 : FF 12 DD    "   "    stx  X12DD
F6F4 : 40    "@"    nega
        ;
F6F5 : 00    " "    db  $00
        ;
F6F6 : 01    " "    nop
F6F7 : 0B    " "    sev
F6F8 : 01    " "    nop
        ;
F6F9 : 03    " "    db  $03
        ;
F6FA : 01    " "    nop
F6FB : 01    " "    nop
        ;
F6FC : 02    " "    db  $02
        ;
F6FD : 01    " "    nop
F6FE : EE 11    "  "    ldx  $11,x
        ;
F700 : 00    " "    db  $00
        ;
F701 : 10    " "    sba
F702 : 80 F7    "  "    suba  #$F7
        ;
F704 : 05    " "    db  $05
        ;
F705 : 01    " "    nop
F706 : 0B    " "    sev
        ;
F707 : 00 02 00 00  "    "    db  $00, $02, $00, $00
F70B : 00 00    "  "    db  $00, $00
        ;
F70D : F0 11 00    "   "    subb  X1100
F710 : 40    "@"    nega
        ;
F711 : 00    " "    db  $00
        ;
F712 : 01    " "    nop
F713 : 0B    " "    sev
F714 : 01    " "    nop
        ;
F715 : 03    " "    db  $03
        ;
F716 : 01    " "    nop
F717 : 01    " "    nop
        ;
F718 : 02    " "    db  $02
        ;
F719 : 01    " "    nop
F71A : EE 11    "  "    ldx  $11,x
        ;
F71C : 00    " "    db  $00
        ;
F71D : 10    " "    sba
F71E : 80 F7    "  "    suba  #$F7
        ;
F720 : 21    "!"    db  $21
        ;
F721 : 01    " "    nop
F722 : 0B    " "    sev
        ;
F723 : 00 02    "  "    db  $00, $02
        ;
F725 : FF 00 00    "   "    stx  X0000
F728 : 01    " "    nop
        ;
F729 : C7    " "    db  $C7
        ;
F72A : 11    " "    cba
        ;
F72B : 00    " "    db  $00
        ;
F72C : FF 7F 07    "   "    stx  X7F07
        ;
F72F : 04 00 02 00  "    "    db  $04, $00, $02, $00
F733 : 04    " "    db  $04
        ;
F734 : 07    " "    tpa
F735 : 7F FF 13    "   "    clr  XFF13
F738 : 01    " "    nop
        ;
F739 : 13 00    "  "    db  $13, $00
        ;
F73B : FF 7F 0C    "   "    stx  X7F0C
        ;
F73E : 02    " "    db  $02
        ;
F73F : 01    " "    nop
F740 : 0B    " "    sev
F741 : FF 00 00    "   "    stx  X0000
        ;
F744 : 00    " "    db  $00
        ;
F745 : BE 11 00    "   "    lds  X1100
F748 : FF 7F 0C    "   "    stx  X7F0C
        ;
F74B : 05    " "    db  $05
        ;
F74C : 01    " "    nop
F74D : 0B    " "    sev
F74E : FF 00 00    "   "    stx  X0000
        ;
F751 : 00    " "    db  $00
        ;
F752 : BE 01 00    "   "    lds  X0100
F755 : FF 7F 08    "   "    stx  X7F08
        ;
F758 : 02 00 00    "   "    db  $02, $00, $00
        ;
F75B : D4 00    "  "    andb  X0000
        ;
F75D : 00    " "    db  $00
        ;
F75E : 01    " "    nop
F75F : EF 11    "  "    stx  $11,x
        ;
F761 : 00    " "    db  $00
        ;
F762 : 81 00    "  "    cmpa  #$00
        ;
F764 : 02    " "    db  $02
        ;
F765 : 01    " "    nop
        ;
F766 : 00    " "    db  $00
        ;
F767 : 01    " "    nop
F768 : D7 01    "  "    stab  X0001
F76A : 01    " "    nop
F76B : 01    " "    nop
F76C : F4 13 03    "   "    andb  X1303
F76F : 2D 00    "- "    blt  LF771
F771        LF771:
F771 : 01    " "    nop
F772 : 09    " "    dex
        ;
F773 : 00 00    "  "    db  $00, $00
        ;
F775 : FF 00 00    "   "    stx  X0000
        ;
F778 : 00 00 03 00  "    "    db  $00, $00, $03, $00
        ;
F77C : FF 00 02    "   "    stx  X0002
F77F : 01    " "    nop
        ;
F780 : 00 00    "  "    db  $00, $00
        ;
F782 : 20 00    "  "    bra  LF784
        ;
F784        LF784:
F784 : 00 00    "  "    db  $00, $00
        ;
F786 : 35    "5"    txs
F787 : 01    " "    nop
        ;
F788 : 00    " "    db  $00
        ;
F789 : 81 01    "  "    cmpa  #$01
F78B : 01    " "    nop
        ;
F78C : 02 05 00    "   "    db  $02, $05, $00
        ;
F78F : FF 00 00    "   "    stx  X0000
F792 : F9 FA 11    "   "    adcb  XFA11
        ;
F795 : 00    " "    db  $00
        ;
F796 : FF FF F7    "   "    stx  XFFF7
F799 : 9A 02    "  "    oraa  X0002
        ;
F79B : 02 00 00    "   "    db  $02, $00, $00
        ;
F79E : FF 00 00    "   "    stx  X0000
F7A1 : 46    "F"    rora
F7A2 : 7D 11 00    "}  "    tst  X1100
F7A5 : FF FF F7    "   "    stx  XFFF7
F7A8 : 8B 03    "  "    adda  #$03
F7AA : 74 02 04    "t  "    lsr  X0204
        ;
F7AD : 04 DC    "  "    db  $04, $DC
        ;
F7AF : DB FB    "  "    addb  X00FB
F7B1 : 08    " "    inx
        ;
F7B2 : 14    " "    db  $14
        ;
F7B3 : FB FF 0F    "   "    addb  XFF0F
        ;
F7B6 : 03    " "    db  $03
        ;
F7B7 : 74 02 04    "t  "    lsr  X0204
        ;
F7BA : 04 DC    "  "    db  $04, $DC
        ;
F7BC : DB FB    "  "    addb  X00FB
F7BE : 08    " "    inx
        ;
F7BF : 14    " "    db  $14
        ;
F7C0 : F8 FF 0F    "   "    eorb  XFF0F
        ;
F7C3 : 03    " "    db  $03
        ;
F7C4 : 74 02 04    "t  "    lsr  X0204
        ;
F7C7 : 04 DC    "  "    db  $04, $DC
        ;
F7C9 : DB FB    "  "    addb  X00FB
F7CB : 08    " "    inx
        ;
F7CC : 14    " "    db  $14
        ;
F7CD : F9 FF 0F    "   "    adcb  XFF0F
        ;
F7D0 : 03    " "    db  $03
        ;
F7D1 : 74 02 04    "t  "    lsr  X0204
        ;
F7D4 : 04 DC    "  "    db  $04, $DC
        ;
F7D6 : DB FB    "  "    addb  X00FB
F7D8 : 08    " "    inx
        ;
F7D9 : 14    " "    db  $14
        ;
F7DA : FA FF 0F    "   "    orab  XFF0F
        ;
F7DD : 03    " "    db  $03
        ;
F7DE : 74 02 04    "t  "    lsr  X0204
        ;
F7E1 : 04 DC    "  "    db  $04, $DC
        ;
F7E3 : DB FB    "  "    addb  X00FB
F7E5 : 08    " "    inx
        ;
F7E6 : 14 02    "  "    db  $14, $02
        ;
F7E8 : FF 0F 09    "   "    stx  X0F09
        ;
F7EB : 05    " "    db  $05
        ;
F7EC : 08    " "    inx
F7ED : F7 FF DF    "   "    stab  XFFDF
F7F0 : D9 00    "  "    adcb  X0000
        ;
F7F2 : 02    " "    db  $02
F7F3        XF7F3:
F7F3 : 00 00    "  "    db  $00, $00
        ;
F7F5 : 80 04    "  "    suba  #$04
F7F7 : 09    " "    dex
        ;
F7F8 : 05    " "    db  $05
        ;
F7F9 : 09    " "    dex
F7FA : F7 FF DF    "   "    stab  XFFDF
F7FD : D9 00    "  "    adcb  X0000
        ;
F7FF : 02 00 00    "   "    db  $02, $00, $00
        ;
F802 : 80 04    "  "    suba  #$04
F804 : 09    " "    dex
        ;
F805 : 05    " "    db  $05
        ;
F806 : 0A    " "    clv
F807 : F7 FF DF    "   "    stab  XFFDF
F80A : D9 00    "  "    adcb  X0000
        ;
F80C : 02 00 00    "   "    db  $02, $00, $00
        ;
F80F : 80 04    "  "    suba  #$04
F811 : 0A    " "    clv
        ;
F812 : 02    " "    db  $02
        ;
F813 : 01    " "    nop
F814 : 0B    " "    sev
F815 : FF 00 00    "   "    stx  X0000
        ;
F818 : 00    " "    db  $00
        ;
F819 : BE 12 00    "   "    lds  X1200
F81C : FF 7F 0A    "   "    stx  X7F0A
        ;
F81F : 02    " "    db  $02
        ;
F820 : 07    " "    tpa
F821 : 0E    " "    cli
        ;
F822 : 05 03 03 03  "    "    db  $05, $03, $03, $03
F826 : C3    " "    db  $C3
        ;
F827 : 10    " "    sba
        ;
F828 : 00    " "    db  $00
        ;
F829 : FF 03 04    "   "    stx  X0304
F82C : 3B    ";"    rti
        ;
F82D : 00 00    "  "    db  $00, $00
        ;
F82F : FF 00 00    "   "    stx  X0000
        ;
F832 : 04 02    "  "    db  $04, $02
        ;
F834 : 10    " "    sba
        ;
F835 : 00    " "    db  $00
        ;
F836 : FF 7F 06    "   "    stx  X7F06
F839 : 4C    "L"    inca
        ;
F83A : 00 00    "  "    db  $00, $00
        ;
F83C : FF 00 00    "   "    stx  X0000
        ;
F83F : 04 02    "  "    db  $04, $02
        ;
F841 : 10    " "    sba
        ;
F842 : 00 12 00    "   "    db  $00, $12, $00
        ;
F845 : 06    " "    tap
F846 : 86 00    "  "    ldaa  #$00
        ;
F848 : 00    " "    db  $00
        ;
F849 : FF 00 00    "   "    stx  X0000
        ;
F84C : 04 02    "  "    db  $04, $02
        ;
F84E : 10    " "    sba
        ;
F84F : 00    " "    db  $00
        ;
F850 : 08    " "    inx
        ;
F851 : 00    " "    db  $00
        ;
F852 : 06    " "    tap
F853 : 26 00    "& "    bne  LF855
        ;
F855        LF855:
F855 : 00    " "    db  $00
        ;
F856 : FF 00 00    "   "    stx  X0000
        ;
F859 : 04 02    "  "    db  $04, $02
        ;
F85B : 10    " "    sba
        ;
F85C : 00    " "    db  $00
        ;
F85D : 0A    " "    clv
        ;
F85E : 00    " "    db  $00
        ;
F85F : 06    " "    tap
        ;
F860 : 1F 00 00    "   "    db  $1F, $00, $00
        ;
F863 : FF 00 00    "   "    stx  X0000
        ;
F866 : 04 02    "  "    db  $04, $02
        ;
F868 : 10    " "    sba
        ;
F869 : 00    " "    db  $00
        ;
F86A : 08    " "    inx
        ;
F86B : 00    " "    db  $00
        ;
F86C : 06    " "    tap
        ;
F86D : 1E 00 00    "   "    db  $1E, $00, $00
        ;
F870 : FF 00 00    "   "    stx  X0000
        ;
F873 : 04 02    "  "    db  $04, $02
        ;
F875 : 10    " "    sba
        ;
F876 : 00    " "    db  $00
        ;
F877 : FF 7F 06    "   "    stx  X7F06
        ;
F87A : 1D 00 00    "   "    db  $1D, $00, $00
        ;
F87D : FF 00 00    "   "    stx  X0000
        ;
F880 : 04 02    "  "    db  $04, $02
        ;
F882 : 10    " "    sba
        ;
F883 : 00    " "    db  $00
        ;
F884 : 2F 00    "/ "    ble  LF886
F886        LF886:
F886 : 08    " "    inx
F887 : 19    " "    daa
        ;
F888 : 00 00    "  "    db  $00, $00
        ;
F88A : FF 00 00    "   "    stx  X0000
        ;
F88D : 04 02    "  "    db  $04, $02
        ;
F88F : 10    " "    sba
        ;
F890 : 00    " "    db  $00
        ;
F891 : 08    " "    inx
        ;
F892 : 00 21 02    " ! "    db  $00, $21, $02
        ;
F895 : FF 0E 00    "   "    stx  X0E00
F898 : 01    " "    nop
F899 : 01    " "    nop
        ;
F89A : 00 D3    "  "    db  $00, $D3
        ;
F89C : 11    " "    cba
        ;
F89D : 00    " "    db  $00
        ;
F89E : FF 8F F8    "   "    stx  X8FF8
F8A1 : A2 01    "  "    sbca  $01,x
F8A3 : 0B    " "    sev
        ;
F8A4 : 00 02 00 00  "    "    db  $00, $02, $00, $00
F8A8 : 00 00    "  "    db  $00, $00
        ;
F8AA : F0 11 00    "   "    subb  X1100
F8AD : 40    "@"    nega
F8AE : 80 F8    "  "    suba  #$F8
F8B0 : B1 21 02    " ! "    cmpa  X2102
F8B3 : FF 0E 00    "   "    stx  X0E00
F8B6 : 01    " "    nop
F8B7 : 01    " "    nop
        ;
F8B8 : 00 D3    "  "    db  $00, $D3
        ;
F8BA : 11    " "    cba
        ;
F8BB : 00    " "    db  $00
        ;
F8BC : FF 7F 0D    "   "    stx  X7F0D
        ;
F8BF : 1E 00 00    "   "    db  $1E, $00, $00
        ;
F8C2 : FF 00 00    "   "    stx  X0000
        ;
F8C5 : 04 02    "  "    db  $04, $02
        ;
F8C7 : 10    " "    sba
        ;
F8C8 : 00    " "    db  $00
        ;
F8C9 : 0C    " "    clc
        ;
F8CA : 00    " "    db  $00
        ;
F8CB : 0D    " "    sec
F8CC : 24 00    "$ "    bcc  LF8CE
        ;
F8CE        LF8CE:
F8CE : 00    " "    db  $00
        ;
F8CF : FF 00 00    "   "    stx  X0000
        ;
F8D2 : 04 02    "  "    db  $04, $02
        ;
F8D4 : 10    " "    sba
        ;
F8D5 : 00    " "    db  $00
        ;
F8D6 : FF 7F 0D    "   "    stx  X7F0D
F8D9 : 32    "2"    pula
        ;
F8DA : 00 00    "  "    db  $00, $00
        ;
F8DC : FF 00 00    "   "    stx  X0000
        ;
F8DF : 04 02    "  "    db  $04, $02
        ;
F8E1 : 10    " "    sba
        ;
F8E2 : 00    " "    db  $00
        ;
F8E3 : FF 7F 0D    "   "    stx  X7F0D
        ;
F8E6 : 3C 00 00    "<  "    db  $3C, $00, $00
        ;
F8E9 : FF 00 00    "   "    stx  X0000
        ;
F8EC : 04 02    "  "    db  $04, $02
        ;
F8EE : 10    " "    sba
        ;
F8EF : 00    " "    db  $00
        ;
F8F0 : FF 7F 04    "   "    stx  X7F04
F8F3 : 3B    ";"    rti
        ;
F8F4 : 00 00    "  "    db  $00, $00
        ;
F8F6 : FF 00 00    "   "    stx  X0000
        ;
F8F9 : 04 02    "  "    db  $04, $02
        ;
F8FB : 10    " "    sba
        ;
F8FC : 00    " "    db  $00
        ;
F8FD : FF 7F 06    "   "    stx  X7F06
        ;
F900        XF900:
F900 : 1C 00 00    "   "    db  $1C, $00, $00
        ;
F903 : FF 00 00    "   "    stx  X0000
        ;
F906 : 04 02    "  "    db  $04, $02
        ;
F908 : 10    " "    sba
        ;
F909 : 00    " "    db  $00
        ;
F90A : 19    " "    daa
        ;
F90B : 00    " "    db  $00
        ;
F90C : 09    " "    dex
F90D : 24 00    "$ "    bcc  LF90F
        ;
F90F        LF90F:
F90F : 00    " "    db  $00
        ;
F910 : 01    " "    nop
        ;
F911 : E3    " "    db  $E3
        ;
F912 : F5 04 02    "   "    bitb  X0402
F915 : 10    " "    sba
        ;
F916 : 00    " "    db  $00
        ;
F917 : 11    " "    cba
        ;
F918 : 00    " "    db  $00
        ;
F919 : 09    " "    dex
F91A : 24 00    "$ "    bcc  LF91C
        ;
F91C        LF91C:
F91C : 00    " "    db  $00
        ;
F91D : 01    " "    nop
        ;
F91E : E3    " "    db  $E3
        ;
F91F : 0E    " "    cli
        ;
F920 : 04 02    "  "    db  $04, $02
        ;
F922 : 10    " "    sba
        ;
F923 : 00    " "    db  $00
        ;
F924 : 0D    " "    sec
        ;
F925 : 00    " "    db  $00
        ;
F926 : 0B    " "    sev
F927 : 32    "2"    pula
        ;
F928 : 00 00    "  "    db  $00, $00
        ;
F92A : FF 6A 0F    " j "    stx  X6A0F
F92D : 06    " "    tap
        ;
F92E : 02    " "    db  $02
        ;
F92F : 10    " "    sba
        ;
F930 : 00    " "    db  $00
        ;
F931 : FF 7F 04    "   "    stx  X7F04
F934 : 3B    ";"    rti
        ;
F935 : 00 00    "  "    db  $00, $00
        ;
F937 : FF 00 00    "   "    stx  X0000
        ;
F93A : 04 02    "  "    db  $04, $02
        ;
F93C : 10    " "    sba
        ;
F93D : 00    " "    db  $00
        ;
F93E : 43    "C"    coma
        ;
F93F : 00 04    "  "    db  $00, $04
        ;
F941 : 3B    ";"    rti
        ;
F942 : 00 00    "  "    db  $00, $00
        ;
F944 : FF 00 00    "   "    stx  X0000
        ;
F947 : 04 02    "  "    db  $04, $02
        ;
F949 : 10    " "    sba
        ;
F94A : 00    " "    db  $00
        ;
F94B : 33    "3"    pulb
        ;
F94C : 00 04    "  "    db  $00, $04
        ;
F94E : 3B    ";"    rti
        ;
F94F : 00 00    "  "    db  $00, $00
        ;
F951 : FF 00 00    "   "    stx  X0000
        ;
F954 : 04 02    "  "    db  $04, $02
        ;
F956 : 10    " "    sba
        ;
F957 : 00    " "    db  $00
        ;
F958 : 08    " "    inx
        ;
F959 : 00 04    "  "    db  $00, $04
        ;
F95B : 3B    ";"    rti
        ;
F95C : 00 00    "  "    db  $00, $00
        ;
F95E : FF 00 00    "   "    stx  X0000
        ;
F961 : 04 02    "  "    db  $04, $02
        ;
F963 : 10    " "    sba
        ;
F964 : 00    " "    db  $00
        ;
F965 : 33    "3"    pulb
F966 : 80 F9    "  "    suba  #$F9
F968 : 4D    "M"    tsta
F969 : 09    " "    dex
F96A : 23 00    "# "    bls  LF96C
        ;
F96C        LF96C:
F96C : 00    " "    db  $00
        ;
F96D : 01    " "    nop
        ;
F96E : E3    " "    db  $E3
        ;
F96F : 0E    " "    cli
F970 : 06    " "    tap
        ;
F971 : 04    " "    db  $04
        ;
F972 : 10    " "    sba
        ;
F973 : 00    " "    db  $00
        ;
F974 : 0D    " "    sec
        ;
F975 : 00    " "    db  $00
        ;
F976 : 08    " "    inx
F977 : 26 00    "& "    bne  LF979
        ;
F979        LF979:
F979 : 00    " "    db  $00
        ;
F97A : 01    " "    nop
        ;
F97B : E3    " "    db  $E3
        ;
F97C : 0E    " "    cli
F97D : 06    " "    tap
        ;
F97E : 04    " "    db  $04
        ;
F97F : 10    " "    sba
        ;
F980 : 00    " "    db  $00
        ;
F981 : 0D    " "    sec
        ;
F982 : 00    " "    db  $00
        ;
F983 : 08    " "    inx
F984 : 26 00    "& "    bne  LF986
        ;
F986        LF986:
F986 : 00    " "    db  $00
        ;
F987 : 01    " "    nop
        ;
F988 : E3    " "    db  $E3
        ;
F989 : 0E    " "    cli
F98A : 06    " "    tap
        ;
F98B : 04    " "    db  $04
        ;
F98C : 30    "0"    tsx
        ;
F98D : 00    " "    db  $00
        ;
F98E : 0D    " "    sec
        ;
F98F : 00    " "    db  $00
        ;
F990 : 06    " "    tap
        ;
F991 : 1C 00 00    "   "    db  $1C, $00, $00
        ;
F994 : FF 00 00    "   "    stx  X0000
        ;
F997 : 04 02    "  "    db  $04, $02
        ;
F999 : 30    "0"    tsx
        ;
F99A : 00    " "    db  $00
        ;
F99B : 19    " "    daa
        ;
F99C : 00    " "    db  $00
        ;
F99D : 09    " "    dex
F99E : 24 00    "$ "    bcc  LF9A0
        ;
F9A0        LF9A0:
F9A0 : 00    " "    db  $00
        ;
F9A1 : 01    " "    nop
        ;
F9A2 : E3    " "    db  $E3
        ;
F9A3 : F5 04 02    "   "    bitb  X0402
F9A6 : 30    "0"    tsx
        ;
F9A7 : 00    " "    db  $00
        ;
F9A8 : 11    " "    cba
        ;
F9A9 : 00    " "    db  $00
        ;
F9AA : 09    " "    dex
F9AB : 24 00    "$ "    bcc  LF9AD
        ;
F9AD        LF9AD:
F9AD : 00    " "    db  $00
        ;
F9AE : 01    " "    nop
        ;
F9AF : E3    " "    db  $E3
        ;
F9B0 : 0E    " "    cli
        ;
F9B1 : 04 02    "  "    db  $04, $02
        ;
F9B3 : 30    "0"    tsx
        ;
F9B4 : 00    " "    db  $00
        ;
F9B5 : 0D    " "    sec
        ;
F9B6 : 00    " "    db  $00
;*************************************;
;ldx call data 5 byte blocks
;*************************************;
F9B7 : EE 28    " ("    ldx  $28,x
F9B9 : F4 60 ED    " ` "    andb  X60ED
F9BC : EE F6    "  "    ldx  $F6,x
        ;
F9BE : 4B ED    "K "    db  $4B, $ED
        ;
F9C0 : EE F7    "  "    ldx  $F7,x
F9C2 : 57    "W"    asrb
        ;
F9C3 : ED    " "    db  $ED
        ;
F9C4 : EE F7    "  "    ldx  $F7,x
F9C6 : 64 ED    "d "    lsr  $ED,x
F9C8 : EE F7    "  "    ldx  $F7,x
F9CA : 9A EE    "  "    oraa  X00EE
F9CC : 54    "T"    lsrb
F9CD : F7 4A EE    " J "    stab  X4AEE
        ;
F9D0 : 12    " "    db  $12
        ;
F9D1 : F4 6D EE    " m "    andb  X6DEE
        ;
F9D4 : 3C    "<"    db  $3C
        ;
F9D5 : F4 A9 EE    "   "    andb  XA9EE
        ;
F9D8 : 00    " "    db  $00
        ;
F9D9 : F5 10 ED    "   "    bitb  X10ED
F9DC : EE F7    "  "    ldx  $F7,x
        ;
F9DE : 3D ED    "= "    db  $3D, $ED
        ;
F9E0 : EE F6    "  "    ldx  $F6,x
F9E2 : 5A    "Z"    decb
        ;
F9E3 : ED    " "    db  $ED
        ;
F9E4 : EE F6    "  "    ldx  $F6,x
F9E6 : 74 ED EE    "t  "    lsr  XEDEE
F9E9 : F6 81 EE    "   "    ldab  X81EE
F9EC : 34    "4"    des
F9ED        LF9ED:
F9ED : F6 8E ED    "   "    ldab  X8EED
F9F0 : EE F6    "  "    ldx  $F6,x
        ;
F9F2 : CF ED    "  "    db  $CF, $ED
        ;
F9F4 : EE F6    "  "    ldx  $F6,x
        ;
F9F6 : DC ED    "  "    db  $DC, $ED
        ;
F9F8 : EE F6    "  "    ldx  $F6,x
F9FA : E9 ED    "  "    adcb  $ED,x
F9FC : EE F6    "  "    ldx  $F6,x
F9FE : 2F ED    "/ "    ble  LF9ED
FA00 : EE F6    "  "    ldx  $F6,x
        ;
FA02 : 3C ED    "< "    db  $3C, $ED
        ;
FA04 : EE F3    "  "    ldx  $F3,x
FA06 : EB ED    "  "    addb  $ED,x
FA08 : EE F3    "  "    ldx  $F3,x
FA0A : F8 ED EE    "   "    eorb  XEDEE
FA0D : F4 05 ED    "   "    andb  X05ED
FA10 : EE F4    "  "    ldx  $F4,x
        ;
FA12 : 12 ED    "  "    db  $12, $ED
        ;
FA14 : EE F4    "  "    ldx  $F4,x
        ;
FA16 : 1F ED    "  "    db  $1F, $ED
        ;
FA18 : EE F4    "  "    ldx  $F4,x
FA1A : 2C ED    ", "    bge  LFA09
FA1C : F2 F4 39    "  9"    sbcb  XF439
        ;
FA1F : ED    " "    db  $ED
        ;
FA20 : F8 F4 39    "  9"    eorb  XF439
        ;
FA23 : ED    " "    db  $ED
        ;
FA24 : EE F7    "  "    ldx  $F7,x
FA26 : 8B ED    "  "    adda  #$ED
FA28 : EE F6    "  "    ldx  $F6,x
FA2A : 67 EE    "g "    asr  $EE,x
FA2C : 48    "H"    asla
FA2D : F6 67 EE    " g "    ldab  X67EE
        ;
FA30 : 62    "b"    db  $62
        ;
FA31 : F7 4A EE    " J "    stab  X4AEE
        ;
FA34 : 12    " "    db  $12
        ;
FA35 : F5 1F EE    "   "    bitb  X1FEE
        ;
FA38 : 00    " "    db  $00
        ;
FA39 : F5 6D ED    " m "    bitb  X6DED
FA3C : EE F5    "  "    ldx  $F5,x
        ;
FA3E : 87    " "    db  $87
        ;
FA3F : EE 12    "  "    ldx  $12,x
FA41 : F4 A9 ED    "   "    andb  XA9ED
FA44 : EE F6    "  "    ldx  $F6,x
FA46 : 9B ED    "  "    adda  X00ED
FA48 : EE F6    "  "    ldx  $F6,x
FA4A : A8 ED    "  "    eora  $ED,x
FA4C : EE F6    "  "    ldx  $F6,x
FA4E : C2 ED    "  "    sbcb  #$ED
FA50 : EE F6    "  "    ldx  $F6,x
FA52 : F6 ED EE    "   "    ldab  XEDEE
FA55 : F7 12 ED    "   "    stab  X12ED
FA58 : EE F7    "  "    ldx  $F7,x
FA5A : A9 ED    "  "    adca  $ED,x
FA5C : EE F7    "  "    ldx  $F7,x
FA5E : B6 ED EE    "   "    ldaa  XEDEE
FA61 : F7 C3 ED    "   "    stab  XC3ED
FA64 : EE F7    "  "    ldx  $F7,x
FA66 : D0 ED    "  "    subb  X00ED
FA68 : EE F7    "  "    ldx  $F7,x
        ;
FA6A : DD ED    "  "    db  $DD, $ED
        ;
FA6C : EE F7    "  "    ldx  $F7,x
FA6E : EA ED    "  "    orab  $ED,x
FA70 : EE F7    "  "    ldx  $F7,x
FA72 : F7 ED EE    "   "    stab  XEDEE
FA75 : F8 04 ED    "   "    eorb  X04ED
FA78 : EE F8    "  "    ldx  $F8,x
FA7A : 11    " "    cba
        ;
FA7B : ED    " "    db  $ED
        ;
FA7C : EE F8    "  "    ldx  $F8,x
        ;
FA7E : 1E ED    "  "    db  $1E, $ED
        ;
FA80 : EE F8    "  "    ldx  $F8,x
FA82 : 2B ED    "+ "    bmi  LFA71
FA84 : EE F8    "  "    ldx  $F8,x
        ;
FA86 : 38 ED    "8 "    db  $38, $ED
        ;
FA88 : EE F8    "  "    ldx  $F8,x
        ;
FA8A : 45 ED    "E "    db  $45, $ED
        ;
FA8C : EE F8    "  "    ldx  $F8,x
        ;
FA8E : 52 ED    "R "    db  $52, $ED
        ;
FA90 : EE F8    "  "    ldx  $F8,x
FA92 : 5F    "_"    clrb
        ;
FA93 : ED    " "    db  $ED
        ;
FA94 : EE F8    "  "    ldx  $F8,x
FA96 : 6C ED    "l "    inc  $ED,x
FA98 : EE F8    "  "    ldx  $F8,x
FA9A : 79 ED EE    "y  "    rol  XEDEE
FA9D : F8 86 ED    "   "    eorb  X86ED
FAA0 : EE F8    "  "    ldx  $F8,x
        ;
FAA2 : 93 ED    "  "    db  $93, $ED
        ;
FAA4 : EE F8    "  "    ldx  $F8,x
FAA6 : BE ED EE    "   "    lds  XEDEE
FAA9 : F8 CB ED    "   "    eorb  XCBED
FAAC : EE F8    "  "    ldx  $F8,x
FAAE : D8 ED    "  "    eorb  X00ED
FAB0 : EE F8    "  "    ldx  $F8,x
FAB2 : E5 ED    "  "    bitb  $ED,x
FAB4 : EE F8    "  "    ldx  $F8,x
FAB6 : F2 ED EE    "   "    sbcb  XEDEE
FAB9 : F8 FF ED    "   "    eorb  XFFED
FABC : EE F9    "  "    ldx  $F9,x
FABE : 0C    " "    clc
        ;
FABF : ED    " "    db  $ED
        ;
FAC0 : EE F9    "  "    ldx  $F9,x
FAC2 : 19    " "    daa
        ;
FAC3 : ED    " "    db  $ED
        ;
FAC4 : EE F9    "  "    ldx  $F9,x
FAC6 : 26 ED    "& "    bne  LFAB5
FAC8 : EE F9    "  "    ldx  $F9,x
FACA : 33    "3"    pulb
        ;
FACB : ED    " "    db  $ED
        ;
FACC : EE F9    "  "    ldx  $F9,x
FACE : 40    "@"    nega
        ;
FACF : ED    " "    db  $ED
        ;
FAD0 : EE F9    "  "    ldx  $F9,x
FAD2 : 4D    "M"    tsta
        ;
FAD3 : ED    " "    db  $ED
        ;
FAD4 : EE F9    "  "    ldx  $F9,x
FAD6 : 5A    "Z"    decb
        ;
FAD7 : ED    " "    db  $ED
        ;
FAD8 : EE F9    "  "    ldx  $F9,x
FADA : 69 ED    "i "    rol  $ED,x
FADC : EE F9    "  "    ldx  $F9,x
FADE : 76 ED EE    "v  "    ror  XEDEE
FAE1 : F9 83 ED    "   "    adcb  X83ED
FAE4 : EE F9    "  "    ldx  $F9,x
FAE6 : 90 ED    "  "    suba  X00ED
FAE8 : EE F9    "  "    ldx  $F9,x
        ;
FAEA : 9D ED    "  "    db  $9D, $ED
        ;
FAEC : EE F9    "  "    ldx  $F9,x
FAEE : AA 
;*************************************;
;*WAVE TABLE
;*************************************;
;*1ST BYTE= WAVELENGTH
;GWVTAB  EQU  *
FAEF : 1C    "  "    oraa  $1C,x
FAF0 : 80 40    " @"    suba  #$40
FAF2 : 29 1B    ") "    bvs  LFB0F
FAF4 : 10    " "    sba
FAF5 : 09    " "    dex
FAF6 : 06    " "    tap
        ;
FAF7 : 04    " "    db  $04
        ;
FAF8 : 07    " "    tpa
FAF9 : 0C    " "    clc
        ;
FAFA : 12 1E    "  "    db  $12, $1E
        ;
FAFC : 30    "0"    tsx
FAFD : 49    "I"    rola
FAFE : A4 C9    "  "    anda  $C9,x
FB00        XFB00:
FB00 : DF EB    "  "    stx  X00EB
FB02 : F6 FB FF    "   "    ldab  XFBFF
FB05 : FF FB F5    "   "    stx  XFBF5
FB08 : EA DD    "  "    orab  $DD,x
        ;
FB0A : C7    " "    db  $C7
        ;
FB0B : 9B 10    "  "    adda  X0010
        ;
FB0D : 00    " "    db  $00
        ;
FB0E : F4 00 E8    "   "    andb  X00E8
        ;
FB11 : 00 DC 00    "   "    db  $00, $DC, $00
        ;
FB14 : E2 00    "  "    sbcb  $00,x
        ;
FB16 : DC 00    "  "    db  $DC, $00
        ;
FB18 : E8 00    "  "    eorb  $00,x
FB1A : F4 00 00    "   "    andb  X0000
FB1D : 20 4C    " L"    bra  LFB6B
        ;
FB1F : 45 41 41    "EAA"    db  $45, $41, $41
        ;
FB22 : 43    "C"    coma
FB23 : 47    "G"    asra
FB24 : 77 87 90    "w  "    asr  X8790
FB27 : 97 A1    "  "    staa  X00A1
FB29 : A7 AE    "  "    staa  $AE,x
FB2B : B5 B8 BC    "   "    bita  XB8BC
FB2E : BE BF C1    "   "    lds  XBFC1
FB31 : C2 C2    "  "    sbcb  #$C2
FB33 : C2 C1    "  "    sbcb  #$C1
FB35 : BF BE BB    "   "    sts  XBEBB
FB38 : B6 B1 AC    "   "    ldaa  XB1AC
FB3B : A4 9E    "  "    anda  $9E,x
        ;
FB3D : 93    " "    db  $93
        ;
FB3E : 10    " "    sba
        ;
FB3F : 3C    "<"    db  $3C
        ;
FB40 : 10    " "    sba
FB41 : 17    " "    tba
FB42 : 3F    "?"    swi
FB43 : 70 92 95    "p  "    neg  X9295
FB46 : 7F 7C 7E    " |~"    clr  X7C7E
FB49 : 8A BE    "  "    oraa  #$BE
FB4B : E7 EF    "  "    stab  $EF,x
FB4D : C5 7F    "  "    bitb  #$7F
FB4F : 08    " "    inx
FB50 : FF FF FF    "   "    stx  XFFFF
FB53 : FF 00 00    "   "    stx  X0000
        ;
FB56 : 00 00    "  "    db  $00, $00
        ;
FB58 : 10    " "    sba
FB59 : FF FF FF    "   "    stx  XFFFF
FB5C : FF 00 00    "   "    stx  X0000
        ;
FB5F : 00 00    "  "    db  $00, $00
        ;
FB61 : FF FF FF    "   "    stx  XFFFF
FB64 : FF 00 00    "   "    stx  X0000
        ;
FB67 : 00 00    "  "    db  $00, $00
        ;
FB69 : 48    "H"    asla
FB6A : 8A 95    "  "    oraa  #$95
FB6C : A0 AB    "  "    suba  $AB,x
FB6E : B5 BF C8    "   "    bita  XBFC8
FB71 : D1 DA    "  "    cmpb  X00DA
FB73 : E1 E8    "  "    cmpb  $E8,x
FB75 : EE F3    "  "    ldx  $F3,x
FB77 : F7 FB FD    "   "    stab  XFBFD
FB7A : FE FF FE    "   "    ldx  XFFFE
        ;
FB7D : FD    " "    db  $FD
        ;
FB7E : FB F7 F3    "   "    addb  XF7F3
FB81 : EE E8    "  "    ldx  $E8,x
FB83 : E1 DA    "  "    cmpb  $DA,x
FB85 : D1 C8    "  "    cmpb  X00C8
FB87 : BF B5 AB    "   "    sts  XB5AB
FB8A : A0 95    "  "    suba  $95,x
FB8C : 8A 7F    "  "    oraa  #$7F
        ;
FB8E : 75    "u"    db  $75
        ;
FB8F : 6A 5F    "j_"    dec  $5F,x
FB91 : 54    "T"    lsrb
FB92 : 4A    "J"    deca
FB93 : 40    "@"    nega
FB94 : 37    "7"    pshb
FB95 : 2E 25    ".%"    bgt  LFBBC
        ;
FB97 : 1E    " "    db  $1E
        ;
FB98 : 17    " "    tba
FB99 : 11    " "    cba
FB9A : 0C    " "    clc
FB9B : 08    " "    inx
        ;
FB9C : 04 02    "  "    db  $04, $02
        ;
FB9E : 01    " "    nop
        ;
FB9F : 00    " "    db  $00
        ;
FBA0 : 01    " "    nop
        ;
FBA1 : 02 04    "  "    db  $02, $04
        ;
FBA3 : 08    " "    inx
FBA4 : 0C    " "    clc
FBA5 : 11    " "    cba
FBA6 : 17    " "    tba
        ;
FBA7 : 1E    " "    db  $1E
        ;
FBA8 : 25 2E    "%."    bcs  LFBD8
FBAA : 37    "7"    pshb
FBAB : 40    "@"    nega
FBAC : 4A    "J"    deca
FBAD : 54    "T"    lsrb
FBAE : 5F    "_"    clrb
FBAF : 6A 75    "ju"    dec  $75,x
FBB1 : 7F
;*************************************;
;*GWAVE SOUND VECTOR TABLE
;*************************************;
;*VECTOR FORMAT
;*BYTE 0: GECHO,GCCNT
;*BYTE 1: GECDEC,WAVE#
;*BYTE 2: PREDECAY FACTOR
;*BYTE 3: GDFINC
;*BYTE 4: VARIABLE FREQ COUNT
;*BYTE 5: FREQ PATTERN LENGTH
;*BYTE 6: FREQ PATTERN OFFSET
;*
;SVTAB   EQU  *
FBB2 : 73 20    " s "    clr  X7320
        ;
FBB4 : 00 00 00 04  "    "    db  $00, $00, $00, $04
FBB8 : 00 A3    "  "    db  $00, $A3
        ;
FBBA : 11    " "    cba
        ;
FBBB : 00    " "    db  $00
        ;
FBBC        LFBBC:
FBBC : 01    " "    nop
FBBD : 01    " "    nop
FBBE : 10    " "    sba
        ;
FBBF : 04    " "    db  $04
        ;
FBC0 : FF 12 14    "   "    stx  X1214
FBC3 : 01    " "    nop
FBC4 : 01    " "    nop
        ;
FBC5 : 04 14 3D    "  ="    db  $04, $14, $3D
        ;
FBC8 : 53    "S"    comb
FBC9 : 01    " "    nop
FBCA        XFBCA:
FBCA : 01    " "    nop
FBCB : 01    " "    nop
        ;
FBCC : 02 18    "  "    db  $02, $18
        ;
FBCE : 01    " "    nop
        ;
FBCF : 14 00 00 00  "    "    db  $14, $00, $00, $00
        ;
FBD3 : 08    " "    inx
        ;
FBD4 : 1A    " "    db  $1A
        ;
FBD5 : 81 25    " %"    cmpa  #$25
        ;
FBD7 : 00 00 00    "   "    db  $00, $00, $00
        ;
FBDA : 16    " "    tab
FBDB : 22 01    "" "    bhi  LFBDE
FBDD : 16    " "    tab
FBDE        LFBDE:
FBDE : 01    " "    nop
FBDF : 01    " "    nop
FBE0 : 01    " "    nop
FBE1 : 01    " "    nop
        ;
FBE2 : 38    "8"    db  $38
        ;
FBE3 : FE 10 00    "   "    ldx  X1000
        ;
FBE6 : 00 00    "  "    db  $00, $00
        ;
FBE8 : 20 4C    " L"    bra  LFC36
        ;
FBEA : F1 10 00    "   "    cmpb  X1000
        ;
FBED        XFBED:
FBED : 00 00    "  "    db  $00, $00
        ;
FBEF : 4D    "M"    tsta
FBF0 : 4C    "L"    inca
FBF1 : F1 15 00    "   "    cmpb  X1500
        ;
FBF4 : 00    " "    db  $00
FBF5        XFBF5:
FBF5 : 00    " "    db  $00
        ;
FBF6 : 4D    "M"    tsta
FBF7 : 4C    "L"    inca
FBF8 : F1 16 00    "   "    cmpb  X1600
        ;
FBFB : 00 00    "  "    db  $00, $00
        ;
FBFD        XFBFD:
FBFD : 4D    "M"    tsta
FBFE : 4C    "L"    inca
FBFF        XFBFF:
FBFF : FE 10 00    "   "    ldx  X1000
        ;
FC02 : 00 00    "  "    db  $00, $00
        ;
FC04 : 20 4C    " L"    bra  LFC52
;*************************************;
;*GWAVE FREQ PATTERN TABLE
;*************************************;
;GFRTAB  EQU  *
FC06 : 08    " "    inx
FC07 : 10    " "    sba
FC08 : 20 30    " 0"    bra  LFC3A
        ;
FC0A : 14 18    "  "    db  $14, $18
        ;
FC0C : 20 30    " 0"    bra  LFC3E
        ;
FC0E : 40    "@"    nega
FC0F : 50    "P"    negb
FC10 : 40    "@"    nega
FC11 : 30    "0"    tsx
FC12 : 20 10    "  "    bra  LFC24
        ;
FC14 : 0C    " "    clc
FC15 : 0A    " "    clv
FC16 : 08    " "    inx
FC17 : 07    " "    tpa
FC18 : 06    " "    tap
        ;
FC19 : 05    " "    db  $05
        ;
FC1A : 01    " "    nop
        ;
FC1B : 02 02 03    "   "    db  $02, $02, $03
        ;
FC1E : 98 90    "  "    eora  X0090
        ;
FC20 : 02 03 04 05  "    "    db  $02, $03, $04, $05
        ;
FC24        LFC24:
FC24 : 06    " "    tap
FC25 : 07    " "    tpa
FC26 : 08    " "    inx
FC27 : 09    " "    dex
FC28 : 01    " "    nop
FC29 : 01    " "    nop
        ;
FC2A : 02 02 04 04  "    "    db  $02, $02, $04, $04
        ;
FC2E : 08    " "    inx
FC2F : 08    " "    inx
FC30 : 10    " "    sba
FC31 : 20 28    " ("    bra  LFC5B
        ;
FC33 : 30    "0"    tsx
        ;
FC34 : 38    "8"    db  $38
        ;
FC35 : 40    "@"    nega
FC36        LFC36:
FC36 : 48    "H"    asla
FC37 : 50    "P"    negb
FC38 : 60 70    "`p"    neg  $70,x
FC3A        LFC3A:
FC3A : 80 A0    "  "    suba  #$A0
FC3C : B0 C0 08    "   "    suba  XC008
FC3F : 40    "@"    nega
FC40 : 08    " "    inx
FC41 : 40    "@"    nega
FC42 : 08    " "    inx
FC43 : 40    "@"    nega
FC44 : 08    " "    inx
FC45 : 40    "@"    nega
FC46 : 08    " "    inx
FC47 : 40    "@"    nega
FC48 : 08    " "    inx
FC49 : 40    "@"    nega
FC4A : 08    " "    inx
FC4B : 40    "@"    nega
FC4C : 08    " "    inx
FC4D : 40    "@"    nega
FC4E : 08    " "    inx
FC4F : 40    "@"    nega
FC50 : 08    " "    inx
FC51 : 40    "@"    nega
FC52        LFC52:
FC52 : 01    " "    nop
FC53 : 01    " "    nop
FC54 : 01    " "    nop
        ;
FC55 : 02 02 03 03  "    "    db  $02, $02, $03, $03
FC59 : 04 02 02 03  "    "    db  $04, $02, $02, $03
FC5D : 03 04 04 05  "    "    db  $03, $04, $04, $05
FC61 : 03 03 03 04  "    "    db  $03, $03, $03, $04
FC65 : 04 05 05    "   "    db  $04, $05, $05
        ;
FC68 : 06    " "    tap
        ;
FC69 : 02 02 02 03  "    "    db  $02, $02, $02, $03
FC6D : 03 04 04 05  "    "    db  $03, $04, $04, $05
FC71 : 03 03 03 04  "    "    db  $03, $03, $03, $04
FC75 : 04 05 05    "   "    db  $04, $05, $05
        ;
FC78 : 06    " "    tap
        ;
FC79 : 04 04 04 05  "    "    db  $04, $04, $04, $05
FC7D : 05    " "    db  $05
        ;
FC7E : 06    " "    tap
FC7F : 06    " "    tap
FC80 : 07    " "    tpa
FC81 : 07    " "    tpa
FC82 : 07    " "    tpa
FC83 : 07    " "    tpa
FC84 : 08    " "    inx
FC85 : 08    " "    inx
FC86 : 09    " "    dex
FC87 : 09    " "    dex
FC88 : 0A    " "    clv
FC89 : 0C    " "    clc
FC8A : 0C    " "    clc
FC8B : 0C    " "    clc
FC8C : 0D    " "    sec
FC8D : 0D    " "    sec
FC8E : 0E    " "    cli
FC8F : 0E    " "    cli
FC90 : 0F    " "    sei
FC91 : 06    " "    tap
FC92 : 06    " "    tap
FC93 : 06    " "    tap
FC94 : 07    " "    tpa
FC95 : 07    " "    tpa
FC96 : 08    " "    inx
FC97 : 08    " "    inx
FC98 : 09    " "    dex
        ;
FC99 : 02 02 02 03  "    "    db  $02, $02, $02, $03
FC9D : 03 04 04 05  "    "    db  $03, $04, $04, $05
;
;
;zero padding (FF)
FCA1 : FF FF FF    "   "    stx  XFFFF
FCA4 : FF FF FF    "   "    stx  XFFFF
FCA7 : FF FF FF    "   "    stx  XFFFF
FCAA : FF FF FF    "   "    stx  XFFFF
FCAD : FF FF FF    "   "    stx  XFFFF
FCB0 : FF FF FF    "   "    stx  XFFFF
FCB3 : FF FF FF    "   "    stx  XFFFF
FCB6 : FF FF FF    "   "    stx  XFFFF
FCB9 : FF FF FF    "   "    stx  XFFFF
FCBC : FF FF FF    "   "    stx  XFFFF
FCBF : FF FF FF    "   "    stx  XFFFF
FCC2 : FF FF FF    "   "    stx  XFFFF
FCC5 : FF FF FF    "   "    stx  XFFFF
FCC8 : FF FF FF    "   "    stx  XFFFF
FCCB : FF FF FF    "   "    stx  XFFFF
FCCE : FF FF FF    "   "    stx  XFFFF
FCD1 : FF FF FF    "   "    stx  XFFFF
FCD4 : FF FF FF    "   "    stx  XFFFF
FCD7 : FF FF FF    "   "    stx  XFFFF
FCDA : FF FF FF    "   "    stx  XFFFF
FCDD : FF FF FF    "   "    stx  XFFFF
FCE0 : FF FF FF    "   "    stx  XFFFF
FCE3 : FF FF FF    "   "    stx  XFFFF
FCE6 : FF FF FF    "   "    stx  XFFFF
FCE9 : FF FF FF    "   "    stx  XFFFF
FCEC : FF FF FF    "   "    stx  XFFFF
FCEF : FF FF FF    "   "    stx  XFFFF
FCF2 : FF FF FF    "   "    stx  XFFFF
FCF5 : FF FF FF    "   "    stx  XFFFF
FCF8 : FF FF FF    "   "    stx  XFFFF
FCFB : FF FF FF    "   "    stx  XFFFF
FCFE : FF FF FF    "   "    stx  XFFFF
FD01 : FF FF FF    "   "    stx  XFFFF
FD04 : FF FF FF    "   "    stx  XFFFF
FD07 : FF FF FF    "   "    stx  XFFFF
FD0A : FF FF FF    "   "    stx  XFFFF
FD0D : FF FF FF    "   "    stx  XFFFF
FD10 : FF FF FF    "   "    stx  XFFFF
FD13 : FF FF FF    "   "    stx  XFFFF
FD16 : FF FF FF    "   "    stx  XFFFF
FD19 : FF FF FF    "   "    stx  XFFFF
FD1C : FF FF FF    "   "    stx  XFFFF
FD1F : FF FF FF    "   "    stx  XFFFF
FD22 : FF FF FF    "   "    stx  XFFFF
FD25 : FF FF FF    "   "    stx  XFFFF
FD28 : FF FF FF    "   "    stx  XFFFF
FD2B : FF FF FF    "   "    stx  XFFFF
FD2E : FF FF FF    "   "    stx  XFFFF
FD31 : FF FF FF    "   "    stx  XFFFF
FD34 : FF FF FF    "   "    stx  XFFFF
FD37 : FF FF FF    "   "    stx  XFFFF
FD3A : FF FF FF    "   "    stx  XFFFF
FD3D : FF FF FF    "   "    stx  XFFFF
FD40 : FF FF FF    "   "    stx  XFFFF
FD43 : FF FF FF    "   "    stx  XFFFF
FD46 : FF FF FF    "   "    stx  XFFFF
FD49 : FF FF FF    "   "    stx  XFFFF
FD4C : FF FF FF    "   "    stx  XFFFF
FD4F : FF FF FF    "   "    stx  XFFFF
FD52 : FF FF FF    "   "    stx  XFFFF
FD55 : FF FF FF    "   "    stx  XFFFF
FD58 : FF FF FF    "   "    stx  XFFFF
FD5B : FF FF FF    "   "    stx  XFFFF
FD5E : FF FF FF    "   "    stx  XFFFF
FD61 : FF FF FF    "   "    stx  XFFFF
FD64 : FF FF FF    "   "    stx  XFFFF
FD67 : FF FF FF    "   "    stx  XFFFF
FD6A : FF FF FF    "   "    stx  XFFFF
FD6D : FF FF FF    "   "    stx  XFFFF
FD70 : FF FF FF    "   "    stx  XFFFF
FD73 : FF FF FF    "   "    stx  XFFFF
FD76 : FF FF FF    "   "    stx  XFFFF
FD79 : FF FF FF    "   "    stx  XFFFF
FD7C : FF FF FF    "   "    stx  XFFFF
FD7F : FF FF FF    "   "    stx  XFFFF
FD82 : FF FF FF    "   "    stx  XFFFF
FD85 : FF FF FF    "   "    stx  XFFFF
FD88 : FF FF FF    "   "    stx  XFFFF
FD8B : FF FF FF    "   "    stx  XFFFF
FD8E : FF FF FF    "   "    stx  XFFFF
FD91 : FF FF FF    "   "    stx  XFFFF
FD94 : FF FF FF    "   "    stx  XFFFF
FD97 : FF FF FF    "   "    stx  XFFFF
FD9A : FF FF FF    "   "    stx  XFFFF
FD9D : FF FF FF    "   "    stx  XFFFF
FDA0 : FF FF FF    "   "    stx  XFFFF
FDA3 : FF FF FF    "   "    stx  XFFFF
FDA6 : FF FF FF    "   "    stx  XFFFF
FDA9 : FF FF FF    "   "    stx  XFFFF
FDAC : FF FF FF    "   "    stx  XFFFF
FDAF : FF FF FF    "   "    stx  XFFFF
FDB2 : FF FF FF    "   "    stx  XFFFF
FDB5 : FF FF FF    "   "    stx  XFFFF
FDB8 : FF FF FF    "   "    stx  XFFFF
FDBB : FF FF FF    "   "    stx  XFFFF
FDBE : FF FF FF    "   "    stx  XFFFF
FDC1 : FF FF FF    "   "    stx  XFFFF
FDC4 : FF FF FF    "   "    stx  XFFFF
FDC7 : FF FF FF    "   "    stx  XFFFF
FDCA : FF FF FF    "   "    stx  XFFFF
FDCD : FF FF FF    "   "    stx  XFFFF
FDD0 : FF FF FF    "   "    stx  XFFFF
FDD3 : FF FF FF    "   "    stx  XFFFF
FDD6 : FF FF FF    "   "    stx  XFFFF
FDD9 : FF FF FF    "   "    stx  XFFFF
FDDC : FF FF FF    "   "    stx  XFFFF
FDDF : FF FF FF    "   "    stx  XFFFF
FDE2 : FF FF FF    "   "    stx  XFFFF
FDE5 : FF FF FF    "   "    stx  XFFFF
FDE8 : FF FF FF    "   "    stx  XFFFF
FDEB : FF FF FF    "   "    stx  XFFFF
FDEE : FF FF FF    "   "    stx  XFFFF
FDF1 : FF FF FF    "   "    stx  XFFFF
FDF4 : FF FF FF    "   "    stx  XFFFF
FDF7 : FF FF FF    "   "    stx  XFFFF
FDFA : FF FF FF    "   "    stx  XFFFF
FDFD : FF FF FF    "   "    stx  XFFFF
FE00 : FF FF FF    "   "    stx  XFFFF
FE03 : FF FF FF    "   "    stx  XFFFF
FE06 : FF FF FF    "   "    stx  XFFFF
FE09 : FF FF FF    "   "    stx  XFFFF
FE0C : FF FF FF    "   "    stx  XFFFF
FE0F : FF FF FF    "   "    stx  XFFFF
FE12 : FF FF FF    "   "    stx  XFFFF
FE15 : FF FF FF    "   "    stx  XFFFF
FE18 : FF FF FF    "   "    stx  XFFFF
FE1B : FF FF FF    "   "    stx  XFFFF
FE1E : FF FF FF    "   "    stx  XFFFF
FE21 : FF FF FF    "   "    stx  XFFFF
FE24 : FF FF FF    "   "    stx  XFFFF
FE27 : FF FF FF    "   "    stx  XFFFF
FE2A : FF FF FF    "   "    stx  XFFFF
FE2D : FF FF FF    "   "    stx  XFFFF
FE30 : FF FF FF    "   "    stx  XFFFF
FE33 : FF FF FF    "   "    stx  XFFFF
FE36 : FF FF FF    "   "    stx  XFFFF
FE39 : FF FF FF    "   "    stx  XFFFF
FE3C : FF FF FF    "   "    stx  XFFFF
FE3F : FF FF FF    "   "    stx  XFFFF
FE42 : FF FF FF    "   "    stx  XFFFF
FE45 : FF FF FF    "   "    stx  XFFFF
FE48 : FF FF FF    "   "    stx  XFFFF
FE4B : FF FF FF    "   "    stx  XFFFF
FE4E : FF FF FF    "   "    stx  XFFFF
FE51 : FF FF FF    "   "    stx  XFFFF
FE54 : FF FF FF    "   "    stx  XFFFF
FE57 : FF FF FF    "   "    stx  XFFFF
FE5A : FF FF FF    "   "    stx  XFFFF
FE5D : FF FF FF    "   "    stx  XFFFF
FE60 : FF FF FF    "   "    stx  XFFFF
FE63 : FF FF FF    "   "    stx  XFFFF
FE66 : FF FF FF    "   "    stx  XFFFF
FE69 : FF FF FF    "   "    stx  XFFFF
FE6C : FF FF FF    "   "    stx  XFFFF
FE6F : FF FF FF    "   "    stx  XFFFF
FE72 : FF FF FF    "   "    stx  XFFFF
FE75 : FF FF FF    "   "    stx  XFFFF
FE78 : FF FF FF    "   "    stx  XFFFF
FE7B : FF FF FF    "   "    stx  XFFFF
FE7E : FF FF FF    "   "    stx  XFFFF
FE81 : FF FF FF    "   "    stx  XFFFF
FE84 : FF FF FF    "   "    stx  XFFFF
FE87 : FF FF FF    "   "    stx  XFFFF
FE8A : FF FF FF    "   "    stx  XFFFF
FE8D : FF FF FF    "   "    stx  XFFFF
FE90 : FF FF FF    "   "    stx  XFFFF
FE93 : FF FF FF    "   "    stx  XFFFF
FE96 : FF FF FF    "   "    stx  XFFFF
FE99 : FF FF FF    "   "    stx  XFFFF
FE9C : FF FF FF    "   "    stx  XFFFF
FE9F : FF FF FF    "   "    stx  XFFFF
FEA2 : FF FF FF    "   "    stx  XFFFF
FEA5 : FF FF FF    "   "    stx  XFFFF
FEA8 : FF FF FF    "   "    stx  XFFFF
FEAB : FF FF FF    "   "    stx  XFFFF
FEAE : FF FF FF    "   "    stx  XFFFF
FEB1 : FF FF FF    "   "    stx  XFFFF
FEB4 : FF FF FF    "   "    stx  XFFFF
FEB7 : FF FF FF    "   "    stx  XFFFF
FEBA : FF FF FF    "   "    stx  XFFFF
FEBD : FF FF FF    "   "    stx  XFFFF
FEC0 : FF FF FF    "   "    stx  XFFFF
FEC3 : FF FF FF    "   "    stx  XFFFF
FEC6 : FF FF FF    "   "    stx  XFFFF
FEC9 : FF FF FF    "   "    stx  XFFFF
FECC : FF FF FF    "   "    stx  XFFFF
FECF : FF FF FF    "   "    stx  XFFFF
FED2 : FF FF FF    "   "    stx  XFFFF
FED5 : FF FF FF    "   "    stx  XFFFF
FED8 : FF FF FF    "   "    stx  XFFFF
FEDB : FF FF FF    "   "    stx  XFFFF
FEDE : FF FF FF    "   "    stx  XFFFF
FEE1 : FF FF FF    "   "    stx  XFFFF
FEE4 : FF FF FF    "   "    stx  XFFFF
FEE7 : FF FF FF    "   "    stx  XFFFF
FEEA : FF FF FF    "   "    stx  XFFFF
FEED : FF FF FF    "   "    stx  XFFFF
FEF0 : FF FF FF    "   "    stx  XFFFF
FEF3 : FF FF FF    "   "    stx  XFFFF
FEF6 : FF FF FF    "   "    stx  XFFFF
FEF9 : FF FF FF    "   "    stx  XFFFF
FEFC : FF FF FF    "   "    stx  XFFFF
FEFF : FF FF FF    "   "    stx  XFFFF
FF02 : FF FF FF    "   "    stx  XFFFF
FF05 : FF FF FF    "   "    stx  XFFFF
FF08 : FF FF FF    "   "    stx  XFFFF
FF0B : FF FF FF    "   "    stx  XFFFF
FF0E : FF FF FF    "   "    stx  XFFFF
FF11 : FF FF FF    "   "    stx  XFFFF
FF14 : FF FF FF    "   "    stx  XFFFF
FF17 : FF FF FF    "   "    stx  XFFFF
FF1A : FF FF FF    "   "    stx  XFFFF
FF1D : FF FF FF    "   "    stx  XFFFF
FF20 : FF FF FF    "   "    stx  XFFFF
FF23 : FF FF FF    "   "    stx  XFFFF
FF26 : FF FF FF    "   "    stx  XFFFF
FF29 : FF FF FF    "   "    stx  XFFFF
FF2C : FF FF FF    "   "    stx  XFFFF
FF2F : FF FF FF    "   "    stx  XFFFF
FF32 : FF FF FF    "   "    stx  XFFFF
FF35 : FF FF FF    "   "    stx  XFFFF
FF38 : FF FF FF    "   "    stx  XFFFF
FF3B : FF FF FF    "   "    stx  XFFFF
FF3E : FF FF FF    "   "    stx  XFFFF
FF41 : FF FF FF    "   "    stx  XFFFF
FF44 : FF FF FF    "   "    stx  XFFFF
FF47 : FF FF FF    "   "    stx  XFFFF
FF4A : FF FF FF    "   "    stx  XFFFF
FF4D : FF FF FF    "   "    stx  XFFFF
FF50 : FF FF FF    "   "    stx  XFFFF
FF53 : FF FF FF    "   "    stx  XFFFF
FF56 : FF FF FF    "   "    stx  XFFFF
FF59 : FF FF FF    "   "    stx  XFFFF
FF5C : FF FF FF    "   "    stx  XFFFF
FF5F : FF FF FF    "   "    stx  XFFFF
FF62 : FF FF FF    "   "    stx  XFFFF
FF65 : FF FF FF    "   "    stx  XFFFF
FF68 : FF FF FF    "   "    stx  XFFFF
FF6B : FF FF FF    "   "    stx  XFFFF
FF6E : FF FF FF    "   "    stx  XFFFF
FF71 : FF FF FF    "   "    stx  XFFFF
FF74 : FF FF FF    "   "    stx  XFFFF
FF77 : FF FF FF    "   "    stx  XFFFF
FF7A : FF FF FF    "   "    stx  XFFFF
FF7D : FF FF FF    "   "    stx  XFFFF
FF80 : FF FF FF    "   "    stx  XFFFF
FF83 : FF FF FF    "   "    stx  XFFFF
FF86 : FF FF FF    "   "    stx  XFFFF
FF89 : FF FF FF    "   "    stx  XFFFF
FF8C : FF FF FF    "   "    stx  XFFFF
FF8F : FF FF FF    "   "    stx  XFFFF
FF92 : FF FF FF    "   "    stx  XFFFF
FF95 : FF FF FF    "   "    stx  XFFFF
FF98 : FF FF FF    "   "    stx  XFFFF
FF9B : FF FF FF    "   "    stx  XFFFF
FF9E : FF FF FF    "   "    stx  XFFFF
FFA1 : FF FF FF    "   "    stx  XFFFF
FFA4 : FF FF FF    "   "    stx  XFFFF
FFA7 : FF FF FF    "   "    stx  XFFFF
FFAA : FF FF FF    "   "    stx  XFFFF
FFAD : FF FF FF    "   "    stx  XFFFF
FFB0 : FF FF FF    "   "    stx  XFFFF
FFB3 : FF FF FF    "   "    stx  XFFFF
FFB6 : FF FF FF    "   "    stx  XFFFF
FFB9 : FF FF FF    "   "    stx  XFFFF
FFBC : FF FF FF    "   "    stx  XFFFF
FFBF : FF FF FF    "   "    stx  XFFFF
FFC2 : FF FF FF    "   "    stx  XFFFF
FFC5 : FF FF FF    "   "    stx  XFFFF
FFC8 : FF FF FF    "   "    stx  XFFFF
FFCB : FF FF FF    "   "    stx  XFFFF
FFCE : FF FF FF    "   "    stx  XFFFF
FFD1 : FF FF FF    "   "    stx  XFFFF
FFD4 : FF FF FF    "   "    stx  XFFFF
FFD7 : FF FF FF    "   "    stx  XFFFF
FFDA : FF FF FF    "   "    stx  XFFFF
FFDD : FF FF FF    "   "    stx  XFFFF
FFE0 : FF FF FF    "   "    stx  XFFFF
FFE3 : FF FF FF    "   "    stx  XFFFF
FFE6 : FF FF FF    "   "    stx  XFFFF
FFE9 : FF FF FF    "   "    stx  XFFFF
FFEC : FF FF FF    "   "    stx  XFFFF
FFEF : FF FF FF    "   "    stx  XFFFF
FFF2 : FF FF FF    "   "    stx  XFFFF
FFF5 : FF FF FF    "   "    stx  XFFFF
;*************************************;
;Motorola vector table
;*************************************; 
FFF8 : E9 B9                  ;IRQ 
FFFA : E0 01                  ;RESET SWI (software)  
FFFC : E9 DD                  ;NMI  
FFFE : E0 01                  ;RESET (hardware)

;--------------------------------------------------------------





