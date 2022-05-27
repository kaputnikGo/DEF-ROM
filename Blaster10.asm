        ;
        ;  Disassembled by:
        ;    DASMx object code disassembler
        ;    (c) Copyright 1996-2003   Conquest Consultants
        ;    Version 1.40 (Oct 18 2003)
        ;
        ;  File:    Blaster10.532
        ;
        ;  Size:    4096 bytes
        ;  Checksum:  D012
        ;  CRC-32:    C33A3145
        ;
        ;  Date:    Fri Apr 09 11:29:47 2021
        ;
        ;  CPU:    Motorola 6800 (6800/6802/6808 family)
        ;
        ; Video ROM 18 Blaster video game (assuming primary sound board)
        ; cockpit version has 2 boards for stereo (2x mono)
        ;
        ;org  $F000
        ;
;*************************************;
;Copyright notice
;*************************************;         
F000 : 89 28    " ("                  ;(C)
F002 : 43    "C"
F003 : 29 31    ")1"                  ;1983
F005 : 39    "9"
F006 : 38    "8"
F007 : 33    "3"                      ;
F008 : 20 57    " W"                  ;WILLIAMS
F00A : 49    "I"
F00B : 4C    "L"
F00C : 4C    "L"
F00D : 49    "I"
F00E : 41    "A"
F00F : 4D    "M"
F010 : 53    "S"                      ;
F011 : 20 45    " E"                  ;ELECTRONICS
F013 : 4C    "L"
F014 : 45    "E"
F015 : 43    "C"
F016 : 54    "T"
F017 : 52    "R"
F018 : 4F    "O"
F019 : 4E    "N"
F01A : 49    "I"
F01B : 43    "C"
F01C : 53    "S"                      ;
;*************************************;
; RESET org F01D
;*************************************;
F01D : 0F         sei                 ;set interrupt mask I=1  
F01E : 8E 00 7F   lds  #$007F         ;load stack pointer with 007Fh 
F021 : CE 04 00   ldx  #$0400         ;load X with 0400h  PIA addr
F024 : 6F 01      clr $01,x           ;clr   X+01h (0401) PIA CR port A
F026 : 6F 03      clr $03,x           ;clr   X + 03h (0403) PIA CR port B
F028 : 86 FF      ldaa  #$FF          ;load A with FFh 
F02A : A7 00      staa  $00,x         ;store A in addr X+00h (0400) PIA port A out (DAC sound)
F02C : 6F 02      clr $02,x           ;clr   X + 02h (0402) PIA port B in (sound select)
F02E : 86 37      ldaa  #$37          ;load A with 37h 
F030 : A7 03      staa  $03,x         ;store A in addr X + 03h (0403) PIA CR port B
F032 : 86 3C      ldaa  #$3C          ;load A with 3Ch
F034 : A7 01      staa  $01,x         ;store A in addr X+01h (0401) PIA1 CR port A
F036 : 97 05      staa  $05           ;store A in addr 05
F038 : 4F         clra                ;clear A
F039 : 97 03      staa  $03           ;store A in addr 03
F03B : 97 00      staa  $00           ;store A in addr 00
F03D : 97 01      staa  $01           ;store A in addr 01
F03F : 97 02      staa  $02           ;store A in addr 02
F041 : 97 04      staa  $04           ;store A in addr 04
F043 : 0E         cli                 ;clear interrupt I=0
;STDBY LF044:
F044 : 20 FE      bra  LF044          ;branch always STDBY
;*************************************;
;Diving Plane Sound
;*************************************;
;PLANE
F046 : CE 00 01   ldx  #$0001         ;load X with 0001h
F049 : DF 11      stx  $11            ;store X in addr 11
F04B : CE 03 80   ldx  #$0380         ;load X with 0380h
F04E : DF 13      stx  $13            ;store X in addr 13
;PLANE1
F050 : 7F 04 00   clr  $0400          ;clear DAC output SOUND
F053 : DE 11      ldx  $11            ;load X with addr 11
F055 : 08         inx                 ;incr X
F056 : DF 11      stx  $11            ;store X in addr 11
;PLANE2
F058 : 09         dex                 ;decr X
F059 : 26 FD      bne  LF058          ;branch Z=0 PLANE2
F05B : 73 04 00   com  $0400          ;comparelement 1s in DAC output SOUND
F05E : DE 13      ldx  $13            ;load X with addr 13
;PLANE3
F060 : 09         dex                 ;decr X
F061 : 26 FD      bne  LF060          ;branch Z=0 PLANE3
F063 : 20 EB      bra  LF050          ;branch always PLANE1
;*************************************;
;Knocker Routine
;*************************************;
;KNOCK:
F065 : 7F 04 02   clr  $0402          ;clear PIA sound select
F068 : CE F0 AC   ldx  #$F0AC         ;load X with F0ACh (KNKTAB)
F06B : DF 13      stx  $13            ;store X in addr 13
;SQLP
F06D : DE 13      ldx  $13            ;load X with addr 13
F06F : A6 00      ldaa  $00,x         ;load A with addr X+00h
F071 : 27 33      beq  LF0A6          ;branch Z=1 END
F073 : E6 01      ldab  $01,x         ;load B with addr X+01h
F075 : C4 F0      andb  #$F0          ;and B with F0h
F077 : D7 12      stab  $12           ;store B in addr 12
F079 : E6 01      ldab  $01,x         ;load B with addr X+01h
F07B : 08         inx                 ;incr X
F07C : 08         inx                 ;incr X
F07D : DF 13      stx  $13            ;store X in addr 13
F07F : 97 11      staa  $11           ;store A in addr 11
F081 : C4 0F      andb  #$0F          ;and B with 0Fh
;LP0
F083 : 96 12      ldaa  $12           ;load A with addr 12
F085 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F088 : 96 11      ldaa  $11           ;load A with addr 11
;LP1
F08A : CE 00 05   ldx  #$0005         ;load X with addr 0005
;LP11
F08D : 09         dex                 ;decr X
F08E : 26 FD      bne  LF08D          ;branch Z=0 LP11
F090 : 4A         deca                ;decr A
F091 : 26 F7      bne  LF08A          ;branch Z=0 LP1
F093 : 7F 04 00   clr  $0400          ;clear DAC output SOUND
F096 : 96 11      ldaa  $11           ;load A with addr 11
;LP2
F098 : CE 00 05   ldx  #$0005         ;load X with addr 0005
;LP22
F09B : 09         dex                 ;decr X
F09C : 26 FD      bne  LF09B          ;branch Z=0 LP22
F09E : 4A         deca                ;decr A
F09F : 26 F7      bne  LF098          ;branch Z=0 LP2
F0A1 : 5A         decb                ;decr B
F0A2 : 26 DF      bne  LF083          ;branch Z=0 LP0
F0A4 : 20 C7      bra  LF06D          ;branch always SQLP
;END
F0A6 : 86 80      ldaa  #$80          ;load A with 80h
F0A8 : B7 04 02   staa  $0402         ;store A in PIA sound select
F0AB : 39         rts                 ;return subroutine
;*************************************;
;Knocker Pattern
;*************************************;
F0AC : 01 FC 02 FC 03 F8 04 F8        ;KNKTAB
F0B4 : 06 F8 08 F4 0C F4 10 F4        ;
F0BC : 20 F2 40 F1 60 F1 80 F1        ;
F0C5 : A0 F1 C0 F1 00 00              ;
;*************************************;
;Vari Loader 
;*************************************;
;VARILD
F0CA : 16         tab                 ;transfer A to B
F0CB : 48         asla                ;arith shift left A 
F0CC : 48         asla                ;arith shift left A 
F0CD : 48         asla                ;arith shift left A 
F0CE : 1B         aba                 ;add B with A
F0CF : CE 00 11   ldx  #$0011         ;load X with 0011h
F0D2 : DF 0D      stx  $0D            ;store X in addr 0D
F0D4 : CE F6 23   ldx  #$F623         ;load X with F623h (VVECT)
F0D7 : BD F5 C3   jsr  LF5C3          ;jump sub ADDX
F0DA : C6 09      ldab  #$09          ;load B with addr 09
F0DC : 7E F3 A8   jmp  LF3A8          ;jump TRANS
;*************************************;
;Variable Duty Cycle Square Wave Routine 
;*************************************;
;VARI
F0DF : 96 19      ldaa  $19           ;load A with addr 19
F0E1 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
;VAR0:
F0E4 : 96 11      ldaa  $11           ;load A with addr 11
F0E6 : 97 1A      staa  $1A           ;store A in addr 1A
F0E8 : 96 12      ldaa  $12           ;load A with addr 12
F0EA : 97 1B      staa  $1B           ;store A in addr 1B
;V0:
F0EC : DE 16      ldx  $16            ;load X with addr 16
;V0LP:
F0EE : 96 1A      ldaa  $1A           ;load A with addr 1A
F0F0 : 73 04 00   com  $0400          ;comparelement 1s in DAC output SOUND
;V1:
F0F3 : 09         dex                 ;decr X
F0F4 : 27 10      beq  LF106          ;branch Z=1 VSWEEP
F0F6 : 4A         deca                ;decr A
F0F7 : 26 FA      bne  LF0F3          ;branch Z=0 V1
F0F9 : 73 04 00   com  $0400          ;comparelement 1s in DAC output SOUND
F0FC : 96 1B      ldaa  $1B           ;load A with addr 1B
;V2:
F0FE : 09         dex                 ;decr X
F0FF : 27 05      beq  LF106          ;branch Z=1 VSWEEP
F101 : 4A         deca                ;decr A
F102 : 26 FA      bne  LF0FE          ;branch Z=0 V2
F104 : 20 E8      bra  LF0EE          ;branch always V0LP
;VSWEEP:
F106 : B6 04 00   ldaa  $0400         ;load A with DAC output SOUND
F109 : 2B 01      bmi  LF10C          ;branch N=1 VS1
F10B : 43         coma                ;comparelement 1s in A
;VS1:
F10C : 8B 00      adda  #$00          ;add A with 00h
F10E : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F111 : 96 1A      ldaa  $1A           ;load A with addr 1A
F113 : 9B 13      adda  $13           ;add A with addr 13
F115 : 97 1A      staa  $1A           ;store A in addr 1A
F117 : 96 1B      ldaa  $1B           ;load A with addr 1B
F119 : 9B 14      adda  $14           ;add A with addr 14
F11B : 97 1B      staa  $1B           ;store A in addr 1B
F11D : 91 15      cmpa  $15           ;compare A with addr 15
F11F : 26 CB      bne  LF0EC          ;branch Z=0 V0
F121 : 96 18      ldaa  $18           ;load A with addr 18
F123 : 27 06      beq  LF12B          ;branch Z=1 VARX
F125 : 9B 11      adda  $11           ;add A with addr 11
F127 : 97 11      staa  $11           ;store A in addr 11
F129 : 26 B9      bne  LF0E4          ;branch Z=0 VAR0
;VARX:
F12B : 39         rts                 ;return subroutine
;*************************************;
;Appear #1
;*************************************;
;APPEAR1
F12C : 86 FF      ldaa  #$FF          ;load A with FFh
F12E : 97 18      staa  $18           ;store A in addr 18
F130 : 86 D0      ldaa  #$D0          ;load A with D0h
F132 : C6 0E      ldab  #$0E          ;load B with 0Eh
F134 : 20 10      bra  LF146          ;branch always LITEN
;*************************************;
;Lightning 
;*************************************;
;LITE
F136 : 86 01      ldaa  #$01          ;load A with 01h
F138 : 97 18      staa  $18           ;store A in addr 18
F13A : C6 03      ldab  #$03          ;load A with 03h
F13C : 20 08      bra  LF146          ;branch always LITEN
;*************************************;
;Appear #2 - need batter name(s)?
;*************************************;
;APPEAR2
F13E : 86 FF      ldaa  #$FF         ;load A with FFh
F140 : 97 18      staa  $18          ;store A in addr 18
F142 : 86 D0      ldaa  #$D0         ;load A with D0h
F144 : C6 15      ldab  #$15         ;load B with 15h
;*************************************;
;Lightning+Appear Noise Routine 
;*************************************;
;LITEN:
F146 : 97 17      staa  $17           ;store A in addr 17
F148 : 86 FF      ldaa  #$FF          ;load A with FFh
F14A : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F14D : D7 13      stab  $13           ;store B in addr 13
;LITE0:
F14F : D6 13      ldab  $13           ;load B with addr 13
;LITE1:
F151 : 96 06      ldaa  $06           ;load A with addr 06
F153 : 44         lsra                ;logic shift right A  
F154 : 44         lsra                ;logic shift right A  
F155 : 44         lsra                ;logic shift right A  
F156 : 98 06      eora  $06           ;exclusive OR with addr 06
F158 : 44         lsra                ;logic shift right A  
F159 : 76 00 05   ror  $0005          ;rotate right in addr 0005 
F15C : 76 00 06   ror  $0006          ;rotate right in addr 0006 
F15F : 24 03      bcc  LF164          ;branch if C=0 LITE2
F161 : 73 04 00   com  $0400          ;comparelement 1s in DAC output SOUND
;LITE2:     
F164 : 96 17      ldaa  $17           ;load A in addr 17
;LITE3
F166 : 4A         deca                ;decr A
F167 : 26 FD      bne  LF166          ;branch Z=0 LITE3
F169 : 5A         decb                ;decr B
F16A : 26 E5      bne  LF151          ;branch Z=0 LITE1
F16C : 96 17      ldaa  $17           ;load A with addr 17
F16E : 9B 18      adda  $18           ;add A with addr 18
F170 : 97 17      staa  $17           ;store A in addr 17
F172 : 26 DB      bne  LF14F          ;branch Z=0 LITE0
F174 : 39         rts                 ;return subroutine
;*************************************;
;Turbo
;*************************************;
;TURBO
F175 : 86 A0      ldaa  #$A0          ;load A with A0h
F177 : 20 02      bra  LF17B          ;branch always TRB11
;*************************************;
;Turbo #1
;*************************************;
;TURBO1
F179 : 86 20      ldaa  #$20          ;load A with 20h
;TRB11
F17B : 97 13      staa  $13           ;store A in addr 13
F17D : 97 16      staa  $16           ;store A in addr 16
F17F : 86 00      ldaa  #$00          ;load A with 00h
F181 : CE 00 01   ldx  #$0001         ;load X with 0001h
F184 : C6 FF      ldab  #$FF          ;load B with FFh
F186 : 20 0D      bra  LF195          ;branch always NOISE
;*************************************;
;Turbo #2 
;*************************************;
;TURBO2
F188 : 86 20      ldaa  #$20          ;load A with 20h
F18A : 97 13      staa  $13           ;store A in addr 13
F18C : 97 16      staa  $16           ;store A in addr 16
F18E : 86 01      ldaa  #$01          ;load A with 01h
F190 : CE 00 01   ldx  #$0001         ;load X with 0001h
F193 : C6 C8      ldab  #$C8          ;load B with C8h
;*************************************;
;White Noise Routine 
;*************************************;
;X=INIT PERIOD, ACCB=INIT AMP, ACCA DECAY RATE
;CYCNT=CYCLE COUNT, NFFLG= FREQ DECAY FLAG
;NOISE:
F195 : 97 11      staa  $11           ;store A in addr 11
;NOISE0:
F197 : DF 14      stx  $14            ;store X in addr 14
;NOIS00:
F199 : D7 12      stab  $12           ;store B in addr 12
F19B : D6 13      ldab  $13           ;load B with addr 13
;NOISE1:
F19D : 96 06      ldaa  $06           ;load A with addr 06
F19F : 44         lsra                ;logic shift right A 
F1A0 : 44         lsra                ;logic shift right A 
F1A1 : 44         lsra                ;logic shift right A 
F1A2 : 98 06      eora  $06           ;exclusive OR with addr 06
F1A4 : 44         lsra                ;logic shift right A  
F1A5 : 76 00 05   ror  $0005          ;rotate right in addr 0005 
F1A8 : 76 00 06   ror  $0006          ;rotate right in addr 0006 
F1AB : 86 00      ldaa  #$00          ;load A with 00h
F1AD : 24 02      bcc  LF1B1          ;branch C=0 NOISE2
F1AF : 96 12      ldaa  $12           ;load A with addr 12
;NOISE2:
F1B1 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F1B4 : DE 14      ldx  $14            ;load X with addr 14
;NOISE3:
F1B6 : 09         dex                 ;decr X
F1B7 : 26 FD      bne  LF1B6          ;branch Z=0 NOISE3
F1B9 : 5A         decb                ;decr B
F1BA : 26 E1      bne  LF19D          ;branch Z=0 NOISE1
F1BC : D6 12      ldab  $12           ;load B with addr 12
F1BE : D0 11      subb  $11           ;B = B - value in addr 11
F1C0 : 27 09      beq  LF1CB          ;branch Z=1 NSEND
F1C2 : DE 14      ldx  $14            ;load X with addr 14
F1C4 : 08         inx                 ;incr X
F1C5 : 96 16      ldaa  $16           ;load A with addr 16
F1C7 : 27 D0      beq  LF199          ;branch Z=1 NOIS00
F1C9 : 20 CC      bra  LF197          ;branch always NOISE0
;NSEND:
F1CB : 39         rts                 ;return subroutine
;*************************************;
;FNOISE Calling Routine
;*************************************;
;FNCALL
F1CC : C6 01      ldab  #$01          ;load B with 01h
F1CE : D7 00      stab  $00           ;store B in addr 00 (BG1FLG)
F1D0 : CE F1 F5   ldx  #$F1F5         ;load X with F1F5h FNTBL3 - BG1
F1D3 : 20 3B      bra  LF210          ;branch always FNOSLD
;FNCAL1
F1D5 : CE F1 FB   ldx  #$F1FB         ;load X with F1FBh FNTBL4
F1D8 : 20 36      bra  LF210          ;branch always FNOSLD
;FNCAL2
F1DA : CE F2 01   ldx  #$F201         ;load X with F201h FNTBL5 - CANNON
F1DD : 20 31      bra  LF210          ;branch always FNOSLD
;FNCAL3
F1DF : CE F1 E9   ldx  #$F1E9         ;load X with F1E9h FNTBL1
F1E2 : 20 2C      bra  LF210          ;branch always FNOSLD
;FNCAL4
F1E4 : CE F1 EF   ldx  #$F1EF         ;load X with F1EFh FNTBL2
F1E7 : 20 27      bra  LF210          ;branch always FNOSLD
;*************************************;
;FNoise tables
;*************************************;
;mem : 18 14 A  B  Xh Xl
F1E9 : 00 00 01 C0 00 80              ;FNTBL1 - also in Sinistar
F1EF : 01 00 01 FF 0C 00              ;FNTBL2
F1F5 : 00 00 00 01 00 00              ;FNTBL3 - BG1
F1FB : 00 00 00 05 00 00              ;FNTBL4
F201 : 01 00 01 FF 03 E8              ;FNTBL5 - CANNON
F207 : 01 01 01 40 10 00              ;FNTBL6
;*************************************;
;FNOISE Table Loader
;*************************************;
;FNLDIN
F20D : CE F2 07   ldx  #$F207         ;load X with F207h (FNTBL6)
;FNOSLD
F210 : A6 00      ldaa  $00,x         ;load A with addr X+00h
F212 : 97 18      staa  $18           ;store A in addr 18
F214 : A6 01      ldaa  $01,x         ;load A with addr X+01h
F216 : 97 14      staa  $14           ;store A in addr 14
F218 : A6 02      ldaa  $02,x         ;load A with addr X + 02h
F21A : E6 03      ldab  $03,x         ;load A with addr X + 03h
F21C : EE 04      ldx  $04,x          ;load X with addr X + 04h
;*************************************;
;Filtered Noise Routine 
;*************************************;
;*X=SAMPLE COUNT, ACCB=INITIAL MAX FREQ
;*ACCA=FREQ DECAY FLAG ,DSFLG=DISTORTION FLAG
;FNOISE
F21E : 97 17      staa  $17           ;store A in addr 17 (FDFLG)
F220 : D7 11      stab  $11           ;store B in addr 11 (FMAX)
F222 : DF 15      stx  $15            ;store X in addr 15 (SAMPC)
F224 : 7F 00 13   clr  $0013          ;clear addr 0013 (FLO)
;FNOIS0:
F227 : DE 15      ldx  $15            ;load X with addr 15 (SAMPC)
F229 : B6 04 00   ldaa  $0400         ;load A with DAC sound OUTPUT
;FNOIS1:
F22C : 16         tab                 ;transfer A to B
F22D : 54         lsrb                ;logic shift right B  
F22E : 54         lsrb                ;logic shift right B  
F22F : 54         lsrb                ;logic shift right B  
F230 : D8 06      eorb  $06           ;exclusive OR with addr 06 (LO)
F232 : 54         lsrb                ;logic shift right B  
F233 : 76 00 05   ror  $0005          ;rotate right in addr 0005 (HI)
F236 : 76 00 06   ror  $0006          ;rotate right in addr 0006 (LO)
F239 : D6 11      ldab  $11           ;load B with addr 11
F23B : 7D 00 18   tst  $0018          ;test value in addr=00 (N=0(MSB), Z=1)
F23E : 27 04      beq  LF244          ;branch Z=1 FNOIS2
F240 : D4 05      andb  $05           ;and B with addr 05
F242 : DB 14      addb  $14           ;add B with addr 14
;FNOIS2:
F244 : D7 12      stab  $12           ;store B in addr 12
F246 : D6 13      ldab  $13           ;load B with addr 13
F248 : 91 06      cmpa  $06           ;compare A with addr 06
F24A : 22 12      bhi  LF25E          ;branch C+Z=0 FNOIS4
;FNOIS3:
F24C : 09         dex                 ;decr X
F24D : 27 26      beq  LF275          ;branch Z=1 FNOIS6
F24F : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F252 : DB 13      addb  $13           ;add B with addr 13
F254 : 99 12      adca  $12           ;add C+A + addr 12
F256 : 25 16      bcs  LF26E          ;branch C=1 FNOIS5
F258 : 91 06      cmpa  $06           ;compare A with addr 06
F25A : 23 F0      bls  LF24C          ;branch C=1 and Z=1 SYN65
F25C : 20 10      bra  LF26E          ;branch always FNOIS5
;FNOIS4:
F25E : 09         dex                 ;decr X
F25F : 27 14      beq  LF275          ;branch if Z=1 FNOIS6
F261 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F264 : D0 13      subb  $13           ;B = B - value in addr 13
F266 : 92 12      sbca  $12           ;sub C+A + in addr 12
F268 : 25 04      bcs  LF26E          ;branch C=1 FNOIS5
F26A : 91 06      cmpa  $06           ;compare A with addr 06
F26C : 22 F0      bhi  LF25E          ;branch C+Z=0 FNOIS4
;FNOIS5:
F26E : 96 06      ldaa  $06           ;load A with addr 06
F270 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F273 : 20 B7      bra  LF22C          ;branch always FNOIS1
;FNOIS6:
F275 : D6 17      ldab  $17           ;load B with addr 17
F277 : 27 B3      beq  LF22C          ;branch Z=1 FNOIS1
F279 : 96 11      ldaa  $11           ;load A with addr 11
F27B : D6 13      ldab  $13           ;load B with addr 13
F27D : 44         lsra                ;logic shift right A  
F27E : 56         rorb                ;rotate right B  
F27F : 44         lsra                ;logic shift right A  
F280 : 56         rorb                ;rotate right B  
F281 : 44         lsra                ;logic shift right A  
F282 : 56         rorb                ;rotate right B  
F283 : 43         coma                ;comparelement 1s A
F284 : 50         negb                ;negate (comparelement 2s) B
F285 : 82 FF      sbca  #$FF          ;sub C+A + FFh
F287 : DB 13      addb  $13           ;add B with addr 13
F289 : 99 11      adca  $11           ;add C+A + addr 11
F28B : D7 13      stab  $13           ;store B in addr 13
F28D : 97 11      staa  $11           ;store A in addr 11
F28F : 26 96      bne  LF227          ;branch Z=0 FNOIS0
F291 : C1 07      cmpb  #$07          ;compare B with 07h
F293 : 26 92      bne  LF227          ;branch Z=0 FNOIS0
F295 : 39         rts                 ;return subroutine
;*************************************;
;Radio 
;*************************************;
;RADIO
F296 : 86 F6      ldaa  #$F6          ;load A with F6h (#RADSND/$100 SOUND TABLE)(1st byte of addr:F6)
F298 : 97 0D      staa  $0D           ;store B in addr 0D
F29A : CE 00 64   ldx  #$0064         ;load X with 0064h
F29D : DF 09      stx  $09            ;store X in addr 09
;RADIO1
F29F : DB 0A      addb  $0A           ;add B with addr 0A
F2A1 : 96 0F      ldaa  $0F           ;load A with addr 0F
F2A3 : 99 09      adca  $09           ;add C+A + addr 09
F2A5 : 97 0F      staa  $0F           ;store A in addr 0F
F2A7 : DE 09      ldx  $09            ;load X with addr 09
F2A9 : 25 04      bcs  LF2AF          ;branch C=1 RADIO2
F2AB : 20 00      bra  LF2AD          ;branch always (*+0)
F2AD : 20 03      bra  LF2B2          ;branch always RADIO3
;RADIO2
F2AF : 08         inx                 ;incr X
F2B0 : 27 11      beq  LF2C3          ;branch Z=1 RADIO4
;RADIO3
F2B2 : DF 09      stx  $09            ;store X in addr 09
F2B4 : 84 0F      anda  #$0F          ;and A with 0Fh
F2B6 : 8B 62      adda  #$62          ;add A with 62h (RADSND!.$FF)(2nd byte of addr:62)
F2B8 : 97 0E      staa  $0E           ;store A in addr 0E
F2BA : DE 0D      ldx  $0D            ;load X with addr 0D
F2BC : A6 00      ldaa  $00,x         ;load A with addr X+00h
F2BE : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F2C1 : 20 DC      bra  LF29F          ;branch always RADIO1
;RADIO4
F2C3 : 39         rts                 ;return subroutine
;*************************************;
;Hyper 
;*************************************;
;HYPER
F2C4 : 4F         clra                ;clear A 
F2C5 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F2C8 : 97 0F      staa  $0F           ;store A in addr 0F
;HYPER1
F2CA : 4F         clra                ;clear A 
;HYPER2
F2CB : 91 0F      cmpa  $0F           ;compare A with addr 0F
F2CD : 26 03      bne  LF2D2          ;branch Z=0 HYPER3
F2CF : 73 04 00   com  $0400          ;comparelement 1s in DAC output SOUND
;HYPER3
F2D2 : C6 12      ldab  #$12          ;load B with 12h
;HYPER4
F2D4 : 5A         decb                ;decr B
F2D5 : 26 FD      bne  LF2D4          ;branch Z=0 HYPER4
F2D7 : 4C         inca                ;incr A
F2D8 : 2A F1      bpl  LF2CB          ;branch N=0 HYPER2
F2DA : 73 04 00   com  $0400          ;comparelement 1s in DAC output SOUND
F2DD : 7C 00 0F   inc  $000F          ;incr value in addr 000F
F2E0 : 2A E8      bpl  LF2CA          ;branch if N=0 HYPER1
F2E2 : 39         rts                 ;return subroutine
;*************************************;
;Scream 
;*************************************;
;SCREAM
F2E3 : CE 00 11   ldx  #$0011         ;load X with 0011h
;SCREM1:
F2E6 : 6F 00      clr  $00,x          ;clear addr X+00h
F2E8 : 08         inx                 ;incr X
F2E9 : 8C 00 19   cpx  #$0019         ;compare X with 0019h
F2EC : 26 F8      bne  LF2E6          ;branch Z=0 SCREM1
F2EE : 86 40      ldaa  #$40          ;load A with 40h
F2F0 : 97 11      staa  $11           ;store A in addr 11
;SCREM2:
F2F2 : CE 00 11   ldx  #$0011         ;load X with 0011h
F2F5 : 86 80      ldaa  #$80          ;load A with 80h
F2F7 : 97 0F      staa  $0F           ;store A in addr 0F
F2F9 : 5F         clrb                ;clear B
;SCREM3:
F2FA : A6 01      ldaa  $01,x         ;load A with addr X+01h
F2FC : AB 00      adda  $00,x         ;add A with addr X +00h
F2FE : A7 01      staa  $01,x         ;store A in addr X+01h
F300 : 2A 02      bpl  LF304          ;branch N=0 SCREM4
F302 : DB 0F      addb  $0F           ;add B with addr 0F
;SCREM4:
F304 : 74 00 0F   lsr  $000F          ;logic shift right addr 000F
F307 : 08         inx                 ;incr X
F308 : 08         inx                 ;incr X
F309 : 8C 00 19   cpx  #$0019         ;compare X with 0019h
F30C : 26 EC      bne  LF2FA          ;branch Z=0 SCREM3
F30E : F7 04 00   stab  $0400         ;store B in DAC output SOUND
F311 : 7C 00 10   inc  $0010          ;incr value in addr 0010
F314 : 26 DC      bne  LF2F2          ;branch Z=0 SCREM2
F316 : CE 00 11   ldx  #$0011         ;load X with 0011h
F319 : 5F         clrb                ;clear B
;SCREM5:
F31A : A6 00      ldaa  $00,x         ;load A with addr X+00h
F31C : 27 0B      beq  LF329          ;branch Z=1 SCREM7
F31E : 81 37      cmpa  #$37          ;compare A with 37h
F320 : 26 04      bne  LF326          ;branch Z=0 SCREM6
F322 : C6 41      ldab  #$41          ;load B with 41h
F324 : E7 02      stab  $02,x         ;store B in addr X + 02h
;SCREM6:
F326 : 6A 00      dec  $00,x          ;decr value in addr X+00h
F328 : 5C         incb                ;incr B
;SCREM7:
F329 : 08         inx                 ;incr X
F32A : 08         inx                 ;incr X
F32B : 8C 00 19   cpx  #$0019         ;compare X with 0019h
F32E : 26 EA      bne  LF31A          ;branch Z=0 SCREM5
F330 : 5D         tstb                ;test B=0
F331 : 26 BF      bne  LF2F2          ;branch Z=0 SCREM2
F333 : 39         rts                 ;return subroutine
;*************************************;
;* THE BOMB OOOOOH NOOOOO!
;*************************************;
;WHIST
F334 : 86 80      ldaa  #$80          ;load A with 80h 
F336 : 97 1B      staa  $1B           ;store A in addr 1B
F338 : 86 F3      ldaa  #$F3          ;load A with F3h  (#SINTBL/$100)
F33A : 97 19      staa  $19           ;store A in addr 19
;WHIST0
F33C : 86 80      ldaa  #$80          ;load A with 80h
F33E : 97 0F      staa  $0F           ;store A in addr 0F
;WHIST1
F340 : 86 12      ldaa  #$12          ;load A with 12h
;WHIST2
F342 : 4A         deca                ;decr A
F343 : 26 FD      bne  LF342          ;branch Z=0 ;WHIST2
F345 : 96 18      ldaa  $18           ;load A with addr 18
F347 : 9B 1B      adda  $1B           ;add A with addr 1B
F349 : 97 18      staa  $18           ;store A in addr 18
F34B : 44         lsra                ;logic shift right A  
F34C : 44         lsra                ;logic shift right A  
F34D : 44         lsra                ;logic shift right A  
F34E : 8B 68      adda  #$68          ;add A with 68h (#SINTBL!.$FF)
F350 : 97 1A      staa  $1A           ;store A in addr 1A
F352 : DE 19      ldx  $19            ;load X with addr 19
F354 : A6 00      ldaa  $00,x         ;load A with addr X+00h
F356 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F359 : 7A 00 0F   dec  $000F          ;decr value in addr 000F
F35C : 26 E2      bne  LF340          ;branch Z=0 ;WHIST1
F35E : 7A 00 1B   dec  $001B          ;decr value in addr 001B
F361 : 96 1B      ldaa  $1B           ;load A with addr 1B
F363 : 81 20      cmpa  #$20          ;compare A with 20h
F365 : 26 D5      bne  LF33C          ;branch Z=0 ;WHIST0
F367 : 39         rts                 ;return subroutine
;*************************************;
;*SINE TABLE
;*************************************;
;SINTBL
F368 : 80 8C 98 A5 B0 BC C6 D0        ;
F370 : DA E2 EA F0 F5 FA FD FE        ;
F378 : FF FE FD FA F5 F0 EA E2        ;
F380 : DA D0 C6 BC B0 A5 98 8C        ;
F388 : 80 73 67 5A 4F 43 39 2F        ;
F390 : 25 1D 15 0F 0A 05 02 01        ;
F398 : 00 01 02 05 0A 0F 15 1D        ;
F3A0 : 25 2F 39 43 4F 5A 67 73        ;
;*************************************;
;Parameter Transfer 
;*************************************;
;TRANS
F3A8 : 36         psha                ;push A into stack then SP - 1
;TRANS1
F3A9 : A6 00      ldaa  $00,x         ;load A in addr X+00h
F3AB : DF 0B      stx  $0B            ;store X in addr 0B
F3AD : DE 0D      ldx  $0D            ;load X from value in addr 0D
F3AF : A7 00      staa  $00,x         ;store A in addr X+00h
F3B1 : 08         inx                 ;incr X
F3B2 : DF 0D      stx  $0D            ;store X in addr 0D
F3B4 : DE 0B      ldx  $0B            ;load X from value in addr 0B
F3B6 : 08         inx                 ;incr X
F3B7 : 5A         decb                ;decr B
F3B8 : 26 EF      bne  LF3A9          ;branch Z=0 TRANS1
F3BA : 32         pula                ;SP + 1 pull stack into A
F3BB : 39         rts                 ;return subroutine
;*************************************;
;Background End Routine 
;*************************************;
;BGEND
F3BC : 4F         clra                ;clear A
F3BD : 97 00      staa  $00           ;store A in addr 00
F3BF : 97 01      staa  $01           ;store A in addr 01
F3C1 : 97 04      staa  $04           ;store A in addr 04
F3C3 : 39         rts                 ;return subroutine
;*************************************;
;Background Sound #2 increment 
;*************************************;
;BG2INC
F3C4 : 7F 00 00   clr  $0000          ;clear addr 0000
F3C7 : 96 01      ldaa  $01           ;load A with addr 01
F3C9 : 84 7F      anda  #$7F          ;and A with 7Fh
F3CB : 81 7F      cmpa  #$7F          ;compare A with 7Fh
F3CD : 26 01      bne  LF3D0          ;branch Z=0 BG2IO
F3CF : 4F         clra                ;clear A
;BG2IO:
F3D0 : 4C         inca                ;incr A
F3D1 : 97 01      staa  $01           ;store A in addr 01
F3D3 : 39         rts                 ;return subroutine
;*************************************;
;Background 2 Routine 
;*************************************;
;BG2
F3D4 : 86 0E      ldaa  #$0E          ;load A with 0Eh (#(TRBV-SVTAB)/7) (GET SOUND)
F3D6 : BD F4 1F   jsr  LF41F          ;jump sub GWLD
F3D9 : 96 01      ldaa  $01           ;load A with addr 01
F3DB : 43         coma                ;comparelement 1s in A
F3DC : BD F4 D7   jsr  LF4D7          ;jump sub GEND60
;BG2LP:
F3DF : 7C 00 15   inc  $0015          ;incr value in addr 0015
F3E2 : BD F4 D9   jsr  LF4D9          ;jump sub GEND61
F3E5 : 20 F8      bra  LF3DF          ;branch always BG2LP
;*************************************;
;Spinner #1 Sound 
;*************************************;
;SP1
F3E7 : 86 03      ldaa  #$03          ;load A with 03h
F3E9 : BD F0 CA   jsr  LF0CA          ;jump sub VARILD
F3EC : D6 02      ldab  $02           ;load B with addr 02
F3EE : C1 1F      cmpb  #$1F          ;compare B with 01h
F3F0 : 26 01      bne  LF3F3          ;branch Z=0 SP1A
F3F2 : 5F         clrb                ;clear B
;SP1A:
F3F3 : 5C         incb                ;incr B
F3F4 : D7 02      stab  $02           ;store B in addr 02
F3F6 : 86 20      ldaa  #$20          ;load A with 20h
F3F8 : 10         sba                 ;sub B from A 
F3F9 : 5F         clrb                ;clear B
;SP11
F3FA : 81 14      cmpa  #$14          ;compare A with 14h
F3FC : 23 05      bls  LF403          ;branch C+Z=1 SP12
F3FE : CB 0E      addb  #$0E          ;add B with 0Eh
F400 : 4A         deca                ;decr A
F401 : 20 F7      bra  LF3FA          ;branch always SP11
;SP12
F403 : CB 05      addb  #$05          ;add B with 05h
F405 : 4A         deca                ;decr A
F406 : 26 FB      bne  LF403          ;branch Z=0 SP12
F408 : D7 11      stab  $11           ;store B in addr 11
;SP1LP:
F40A : BD F0 DF   jsr  LF0DF          ;jump sub VARI
F40D : 20 FB      bra  LF40A          ;branch always SP1LP
;*************************************;
;Laser Ball Bonus #2 
;*************************************;
;BON2
F40F : 96 03      ldaa  $03           ;load A with addr 03
F411 : 26 09      bne  LF41C          ;branch Z=0 BON21
F413 : 7C 00 03   inc  $0003          ;incr addr 0003
F416 : 86 0D      ldaa  #$0D          ;load A with 0Dh
F418 : 8D 05      bsr  LF41F          ;branch sub GWLD
F41A : 20 69      bra  LF485          ;branch always GWAVE
;BON21
F41C : 7E F4 CC   jmp  LF4CC          ;jump GEND50
;*************************************;
;GWAVE Loader 
;*************************************;
;GWLD:
F41F : 16         tab                 ;transfer A to B 
F420 : 58         aslb                ;arith shift left B 
F421 : 1B         aba                 ;add B with A
F422 : 1B         aba                 ;add B with A
F423 : 1B         aba                 ;add B with A
F424 : CE F7 BF   ldx  #$F7BF         ;load X with F7BFh (SVTAB)(SOUND VECTOR TABLE)
F427 : BD F5 C3   jsr  LF5C3          ;jump sub ADDX
F42A : A6 00      ldaa  $00,x         ;load A with addr X+00h
F42C : 16         tab                 ;transfer A to B 
F42D : 84 0F      anda  #$0F          ;and A with 0Fh
F42F : 97 12      staa  $12           ;store A in addr 12
F431 : 54         lsrb                ;logic shift right B  
F432 : 54         lsrb                ;logic shift right B  
F433 : 54         lsrb                ;logic shift right B  
F434 : 54         lsrb                ;logic shift right B  
F435 : D7 11      stab  $11           ;store B in addr 11
F437 : A6 01      ldaa  $01,x         ;load A with addr X+01h
F439 : 16         tab                 ;transfer A to B 
F43A : 54         lsrb                ;logic shift right B  
F43B : 54         lsrb                ;logic shift right B  
F43C : 54         lsrb                ;logic shift right B  
F43D : 54         lsrb                ;logic shift right B  
F43E : D7 13      stab  $13           ;store B in addr 13
F440 : 84 0F      anda  #$0F          ;and A with 0Fh
F442 : 97 0F      staa  $0F           ;store A in addr 0F
F444 : DF 09      stx  $09            ;store X in addr 09
F446 : CE F6 72   ldx  #$F672         ;load X with F672h (GWVTAB)(CALC WAVEFORM ADDR)
;GWLD2
F449 : 7A 00 0F   dec  $000F          ;decr value in addr 000F
F44C : 2B 08      bmi  LF456          ;branch N=1 GWLD3
F44E : A6 00      ldaa  $00,x         ;load A with addr X+00h
F450 : 4C         inca                ;incr A
F451 : BD F5 C3   jsr  LF5C3          ;jump sub ADDX
F454 : 20 F3      bra  LF449          ;branch always GWLD2
;GWLD3
F456 : DF 16      stx  $16            ;store X in addr 16
F458 : BD F5 13   jsr  LF513          ;jump sub WVTRAN
F45B : DE 09      ldx  $09            ;load X with addr 09
F45D : A6 02      ldaa  $02,x         ;load A with addr X +02h
F45F : 97 18      staa  $18           ;store A in addr 18
F461 : BD F5 25   jsr  LF525          ;jump sub WVTRAN
F464 : DE 09      ldx  $09            ;load X with addr 09
F466 : A6 03      ldaa  $03,x         ;load A with addr X +03h
F468 : 97 14      staa  $14           ;store A in addr 14
F46A : A6 04      ldaa  $04,x         ;load A with addr X +04h
F46C : 97 15      staa  $15           ;store A in addr 15
F46E : A6 05      ldaa  $05,x         ;load A with addr X +05h
F470 : 16         tab                 ;transfer A to B
F471 : A6 06      ldaa  $06,x         ;load A with addr X +06h
F473 : CE F8 7C   ldx  #$F87C         ;load X with F87Ch (#GFRTAB)
F476 : BD F5 C3   jsr  LF5C3          ;jump sub ADDX
F479 : 17         tba                 ;transfer B to A 
F47A : DF 19      stx  $19            ;store X in addr 19
F47C : 7F 00 21   clr  $0021          ;clear addr 21
F47F : BD F5 C3   jsr  LF5C3          ;jump sub ADDX
F482 : DF 1B      stx  $1B            ;store X in addr 1B
F484 : 39         rts                 ;return subroutine
;*************************************;
;GWAVE routine 
;*************************************;
;ACCA=Freq Pattern Length, X=Freq Pattern Addr
;GWAVE
F485 : 96 11      ldaa  $11           ;load A in addr 11
F487 : 97 20      staa  $20           ;store A in addr 20
;GWT4
F489 : DE 19      ldx  $19            ;load X with addr 19
F48B : DF 0B      stx  $0B            ;store X in addr 0B
;GPLAY
F48D : DE 0B      ldx  $0B            ;load X with addr 0B
F48F : A6 00      ldaa  $00,x         ;load A with addr X+00h
F491 : 9B 21      adda  $21           ;add A with addr 21
F493 : 97 1F      staa  $1F           ;store A in addr 1F
F495 : 9C 1B      cpx  $1B            ;compare X with addr 1B
F497 : 27 26      beq  LF4BF7         ;branch Z=1 WVTRAN
F499 : D6 12      ldab  $12           ;load B with addr 12
F49B : 08         inx                 ;incr X
F49C : DF 0B      stx  $0B            ;store X in addr 0B
;GOUT
F49E : CE 00 22   ldx  #$0022         ;load X with 0022h
;GOUTLP:
F4A1 : 96 1F      ldaa  $1F           ;load A with addr 1F
;GPRLP
F4A3 : 4A         deca                ;decr A
F4A4 : 26 FD      bne  LF4A3          ;branch Z=0 GPRLP
F4A6 : A6 00      ldaa  $00,x         ;load A with addr X+00h
F4A8 : B7 04 00   staa  $0400         ;store A in DAC output SOUND
F4AB : 08         inx                 ;incr X
F4AC : 9C 1D      cpx  $1D            ;compare X with addr 1D
F4AE : 26 F1      bne  LF4A1          ;branch Z=0 GOUTLP
F4B0 : 5A         decb                ;decr B
F4B1 : 27 DA      beq  LF48D          ;branch Z=1 GPLAY
F4B3 : 08         inx                 ;incr X 4 cycles
F4B4 : 09         dex                 ;decr X 4 cycles
F4B5 : 08         inx                 ;incr X 4 cycles
F4B6 : 09         dex                 ;decr X 4 cycles
F4B7 : 08         inx                 ;incr X 4 cycles
F4B8 : 09         dex                 ;decr X 4 cycles
F4B9 : 08         inx                 ;incr X 4 cycles
F4BA : 09         dex                 ;decr X 4 cycles
F4BB : 01         nop                 ;2 cycles
F4BC : 01         nop                 ;2 cycles (36 total)
F4BD : 20 DF      bra  LF49E          ;branch always GOUT (SYNC 36)
;GEND
F4BF : 96 13      ldaa  $13           ;load A with addr 13
F4C1 : 8D 62      bsr  LF525          ;branch sub WVTRAN
F4C3 : 7A 00 20   dec  $0020          ;decr addr 0020
F4C6 : 26 C1      bne  LF489          ;branch Z=0 GWT4
F4C8 : 96 03      ldaa  $03           ;load A with addr 03
F4CA : 26 46      bne  LF512          ;branch Z=0 WVTRAN
;GEND50:
F4CC : 96 14      ldaa  $14           ;load A with addr 14
F4CE : 27 42      beq  LF512          ;branch Z=1 WVTRAN
F4D0 : 7A 00 15   dec  $0015          ;decr addr 0015
F4D3 : 27 3D      beq  LF512          ;branch Z=1 WVTRAN
F4D5 : 9B 21      adda  $21           ;add A with addr 21
;GEND60:
F4D7 : 97 21      staa  $21           ;store A in addr 21
;GEND61:
F4D9 : DE 19      ldx  $19            ;load X with addr 19
F4DB : 5F         clrb                ;clear B  
;GW0:
F4DC : 96 21      ldaa  $21           ;load A with addr 21
F4DE : 7D 00 14   tst  $0014          ;test addr 0014
F4E1 : 2B 06      bmi  LF4E9          ;branch N=1 GW1
F4E3 : AB 00      adda  $00,x         ;add A with addr X+00h
F4E5 : 25 08      bcs  LF4EF          ;branch C=1 GW2
F4E7 : 20 0B      bra  LF4F4          ;branch always GW2A
;GW1
F4E9 : AB 00      adda  $00,x         ;add A with addr X+00h
F4EB : 27 02      beq  LF4EF          ;branch Z=1 GW2
F4ED : 25 05      bcs  LF4F4          ;branch C=1 GW2A
;GW2
F4EF : 5D         tstb                ;test B 
F4F0 : 27 08      beq  LF4FA          ;branch Z=1 GW2B
F4F2 : 20 0F      bra  LF503          ;branch always GW3
;GW2A
F4F4 : 5D         tstb                ;test B 
F4F5 : 26 03      bne  LF4FA          ;branch Z=0 GW2A
F4F7 : DF 19      stx  $19            ;store X in addr 19
F4F9 : 5C         incb                ;incr B
;GW2B
F4FA : 08         inx                 ;incr X
F4FB : 9C 1B      cpx  $1B            ;compare X with addr 1B
F4FD : 26 DD      bne  LF4DC          ;branch Z=0 GW0
F4FF : 5D         tstb                ;test B 
F500 : 26 01      bne  LF503          ;branch Z=0 GW3
F502 : 39         rts                 ;return subroutine
;GW3
F503 : DF 1B      stx  $1B            ;store X in addr 1B
F505 : 96 13      ldaa  $13           ;load A with addr 13
F507 : 27 06      beq  LF50F          ;branch Z=1 GEND0
F509 : 8D 08      bsr  LF513          ;branch sub WVTRAN
F50B : 96 18      ldaa  $18           ;load A with addr 18
F50D : 8D 16      bsr  LF525          ;branch sub WVDECA
;GEND0:
F50F : 7E F4 85   jmp  LF485          ;jump GWAVE
;GEND1
F512 : 39         rts                 ;return subroutine
;*************************************;
;Wave Transfer Routine 
;*************************************;
;WVTRAN
F513 : CE 00 22   ldx  #$0022         ;load X with 0022h
F516 : DF 0D      stx  $0D            ;store X in addr 0D
F518 : DE 16      ldx  $16            ;load X with addr 16
F51A : E6 00      ldab  $00,x         ;load B with addr X+00h
F51C : 08         inx                 ;incr X
F51D : BD F3 A8   jsr  LF3A8          ;jump sub TRANS
F520 : DE 0D      ldx  $0D            ;load X with addr 0B
F522 : DF 1D      stx  $1D            ;store X in addr 1D
F524 : 39         rts                 ;return subroutine
;*************************************;
;Wave Decay Routinue 
;*************************************;
;decay amount in ACCA 1/16 per decay
;WVDECA
F525 : 4D         tsta                ;test A 
F526 : 27 2B      beq  LF553          ;branch Z=1 WVDCX
F528 : DE 16      ldx  $16            ;load X with addr 16
F52A : DF 0B      stx  $0B            ;store X in addr 0B
F52C : CE 00 22   ldx  #$0022         ;load X with 0022h
F52F : 97 10      staa  $10           ;store A in addr 10
;WVDLP:
F531 : DF 0D      stx  $0D            ;store X in addr 0D
F533 : DE 0B      ldx  $0B            ;load X with addr 0B
F535 : D6 10      ldab  $10           ;load B with vlaue in addr 10
F537 : D7 0F      stab  $0F           ;store B in addr 0F
F539 : E6 01      ldab  $01,x         ;load B with addr X+01h
F53B : 54         lsrb                ;logic shift right B  
F53C : 54         lsrb                ;logic shift right B  
F53D : 54         lsrb                ;logic shift right B  
F53E : 54         lsrb                ;logic shift right B  
F53F : 08         inx                 ;incr X
F540 : DF 0B      stx  $0B            ;store X in addr 0B
F542 : DE 0D      ldx  $0D            ;load X with addr 0D
F544 : A6 00      ldaa  $00,x         ;load A with addr X+00h
;WVDLP1:
F546 : 10         sba                 ;sub B from A
F547 : 7A 00 0F   dec  $000F          ;decr value in addr 000F
F54A : 26 FA      bne  LF546          ;branch Z=0 WVDLP1
F54C : A7 00      staa  $00,x         ;store A in addr X+00h
F54E : 08         inx                 ;incr X
F54F : 9C 1D      cpx  $1D            ;compare X with addr 1D
F551 : 26 DE      bne  LF531          ;branch Z=0 WVDLP
;WVDCX:
F553 : 39         rts                 ;return subroutine
;*************************************;
;IRQ
;*************************************; 
F554 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh
F557 : B6 04 02   ldaa  $0402         ;load A with addr 0402 (PIA sound select)
F55A : 0E         cli                 ;clear interrupt I=0
F55B : 43         coma                ;complement 1s A
F55C : 84 3F      anda  #$3F          ;and A with 3Fh
F55E : 5F         clrb                ;clear B
F55F : 81 0E      cmpa  #$0E          ;compare A with 0Eh
F561 : 27 02      beq  LF565          ;branch Z=1 IRQ1
F563 : D7 02      stab  $02           ;store B in addr 02
;IRQ1
F565 : 81 12      cmpa  #$12          ;compare A with 12h
F567 : 27 02      beq  LF56B          ;branch Z=1 IRQ2 
F569 : D7 03      stab  $03           ;store B in addr 03
;IRQ2
F56B : 4D         tsta                ;test A
F56C : 27 42      beq  LF5B0          ;branch Z=1 IRQ10
F56E : 4A         deca                ;decr A
F56F : 81 1F      cmpa  #$1F          ;compare A with 1Fh
F571 : 2D 17      blt  LF58A          ;branch N+V=1 IRQ5
F573 : 81 2A      cmpa  #$2A          ;compare A with 2Ah
F575 : 22 04      bhi  LF57B          ;branch C+Z=0 IRQ3
F577 : 80 10      suba  #$10          ;sub A with 10h
F579 : 20 13      bra  LF58E          ;branch always IRQ6
;IRQ3
F57B : 81 31      cmpa  #$31          ;compare A with 31h
F57D : 22 07      bhi  LF586          ;branch C+Z=0 IRQ4
F57F : 80 2B      suba  #$2B          ;sub A with 2Bh
F581 : BD FD 8F   jsr  LFD8F          ;jump sub WALSH
F584 : 20 2A      bra  LF5B0          ;branch always IRQ10
;IRQ4
F586 : 80 23      suba  #$23          ;sub A with 23h   
F588 : 20 12      bra  LF59C          ;branch always IRQ8
;IRQ5 
F58A : 81 0C      cmpa  #$0C          ;compare A with 0Ch
F58C : 22 08      bhi  LF596          ;branch C+Z=0 IRQ7
;IRQ6
F58E : BD F4 1F   jsr  LF41F          ;jump sub GWLD
F591 : BD F4 85   jsr  LF485          ;jump sub GWAVE 
F594 : 20 1A      bra  LF5B0          ;branch always IRQ10
;IRQ7
F596 : 81 1B      cmpa  #$1B          ;compare A with 1Bh
F598 : 22 0E      bhi  LF5A8          ;branch C+Z=0 IRQ9
F59A : 80 0D      suba  #$0D          ;sub A with 0Dh
;IRQ8 
F59C : 48         asla                ;arith shift left A 
F59D : CE F5 EB   ldx  #$F5EB         ;load X with F5EBh (JMPTBL)
F5A0 : 8D 21      bsr  LF5C3          ;branch sub ADDX
F5A2 : EE 00      ldx  $00,x          ;load X with X +00h
F5A4 : AD 00      jsr  $00,x          ;jump sub addr X+00h 
F5A6 : 20 08      bra  LF5B0          ;branch always IRQ10
;IRQ9 
F5A8 : 80 1C      suba  #$1C          ;sub A with 1Ch
F5AA : BD F0 CA   jsr  LF0CA          ;jump sub VARILD
F5AD : BD F0 DF   jsr  LF0DF          ;jump sub VARI
;IRQ10 
F5B0 : 96 00      ldaa  $00           ;load A with addr 00
F5B2 : 9A 01      oraa  $01           ;OR A with addr 01
;IRQ11 
F5B4 : 27 FE      beq  LF5B4          ;branch Z=1 IRQ11
F5B6 : 4F         clra                ;clear A  
F5B7 : 97 03      staa  $03           ;store A in addr 03
F5B9 : 96 00      ldaa  $00           ;load A with addr 00
F5BB : 27 03      beq  LF5C0          ;branch Z=1 IRQ12
F5BD : 7E F1 CC   jmp  LF1CC          ;jump FNCALL
;IRQ12
F5C0 : 7E F3 D4   jmp  LF3D4          ;jump BG2
;*************************************;
;ADDX
;*************************************;
F5C3 : DF 0B      stx  $0B            ;store X in addr 0B
F5C5 : 9B 0C      adda  $0C           ;add A with addr 0C
F5C7 : 97 0C      staa  $0C           ;store A in addr 0C
F5C9 : 24 03      bcc  LF5CE          ;branch C=0 CAL1
F5CB : 7C 00 0B   inc  $000B          ;incr value in addr 000B
;CAL1 LF5CE:
F5CE : DE 0B      ldx  $0B            ;load X with 0B
F5D0 : 39         rts                 ;return subroutine
;*************************************;
;NMI
;*************************************; 
F5D1 : 0F         sei                 ;set interrupt mask I=1
F5D2 : 8E 00 7F   lds  #$007F         ;load SP with 007Fh
F5D5 : CE FF FF   ldx  #$FFFF         ;load X with FFFFh
F5D8 : 5F         clrb                ;clear B
;NMI1 LF5D9:
F5D9 : EB 00      addb  $00,x         ;add B with addr X = 00h
F5DB : 09         dex                 ;decr X
F5DC : 8C F0 00   cpx  #$F000         ;compare X with F000h (ROM start addr) 
F5DF : 26 F8      bne  LF5D9          ;branch if Z=0 NMI1
F5E1 : E1 00      cmpb  $00,x         ;compare B with addr X+00h
F5E3 : 27 01      beq  LF5E6          ;branch if Z=1 NMI2
F5E5 : 3E         wai                 ;wait interrupt, CCodes to Stack, PC+1 and halt
;NMI2 LF5E6:
F5E6 : BD F2 0D   jsr  LF20D          ;jump sub SYNTH above
F5E9 : 20 E6      bra  LF5D1          ;branch always NMI
;*************************************;
;Jump table
;*************************************;
;JMPTBL
F5EB : F3 E7                          ;SP1
F5ED : F1 CC                          ;FNCALL
F5EF : F3 C4                          ;BG2INC
F5F1 : F1 36                          ;LITE
F5F3 : F4 0F                          ;BON2
F5F5 : F3 BC                          ;BGEND
F5F7 : F1 79                          ;TURBO1
F5F9 : F1 3E                          ;APPEAR
F5FB : F1 D5                          ;FNCAL1
F5FD : F1 DA                          ;FNCAL2
F5FF : F2 96                          ;RADIO
F601 : F2 C4                          ;HYPER
F603 : F2 E3                          ;SCREAM
F605 : F1 75                          ;TURBO
F607 : FE 8A                          ;SYNTHZ1
F609 : FF 3B                          ;SNZ2LD2
F60B : FF 6A                          ;SNZ3LD3
F60D : FF 54                          ;SNZ3LD2
F60F : FF 80                          ;SNZ3LD4
F611 : FE FF                          ;SNZ2LD1
F613 : F1 88                          ;TURBO2
F615 : F0 46                          ;PLANE
F617 : F1 2C                          ;APPEAR1
F619 : F0 65                          ;KNOCK
F61B : F1 DF                          ;FNCAL3
F61D : F3 34                          ;WHIST
F61F : F2 0D                          ;FNLDIN
F621 : F1 E4                          ;FNCAL4
;*************************************;
;VARI VECTORS
;*************************************;
;VVECT EQU *
F623 : 40 01 00 10 E1 00 80 FF FF     ;SAW
F62C : 28 01 00 08 81 02 00 FF FF     ;FOSHIT
F635 : 28 81 00 FC 01 02 00 FC FF     ;QUASAR
F63E : FF 01 00 18 41 04 80 00 FF     ;CABSHK
F647 : 00 FF 08 FF 68 04 80 00 FF     ;CSCALE
F650 : 28 81 00 FC 01 02 00 FC FF     ;MOSQTO
F659 : 60 01 57 08 E1 02 00 FE 80     ;VARBG1
;*************************************;
;Radio Sound Waveform
;*************************************;
F662 : 8C 5B B6 40 BF 49 A4 73        ;RADSND
F66A : 73 A4 49 BF 40 B6 5B 8C        ;
;*************************************;
;GWave table, 1st byte wavelength
;*************************************;
;GWVTAB
F672 : 08                             ;GS2
F673 : 7F D9 FF D9 7F 24 00 24        ;
;
F67B : 08                             ;GSSQR2
F67C : 00 40 80 00 FF 00 80 40        ;
;
F684 : 10                             ;GS1
F685 : 7F B0 D9 F5 FF F5 D9 B0        ;
F68D : 7F 4E 24 09 00 09 24 4E        ;
;
F695 : 10                             ;GS12
F696 : 7F C5 EC E7 BF 8D 6D 6A        ;
F69E : 7F 94 92 71 40 17 12 39        ;
;
F6A6 : 10                             ;GSQ22
F6A7 : FF FF FF FF 00 00 00 00        ;
F6AF : FF FF FF FF 00 00 00 00        ;
;
F6B7 : 48                             ;GS72
F6B8 : 8A 95 A0 AB B5 BF C8 D1        ;
F6C0 : DA E1 E8 EE F3 F7 FB FD        ;
F6C8 : FE FF FE FD FB F7 F3 EE        ;
F6D0 : E8 E1 DA D1 C8 BF B5 AB        ;
F6D8 : A0 95 8A 7F 75 6A 5F 54        ;
F6E0 : 4A 40 37 2E 25 1E 17 11        ;
F6E8 : 0C 08 04 02 01 00 01 02        ;
F6F0 : 04 08 0C 11 17 1E 25 2E        ;
F6F8 : 37 40 4A 54 5F 6A 75 7F        ;
;
F700 : 10                             ;GS1.7
F701 : 59 7B 98 AC B3 AC 98 7B        ;
F709 : 59 37 19 06 00 06 19 37        ;
;
F711 : 08                             ;GSQ2
F712 : FF FF FF FF 00 00 00 00        ;
;
F71A : 10                             ;GS1234
F71B : 76 FF B8 D0 9D E6 6A 82        ;
F723 : 76 EA 81 86 4E 9C 32 63        ;
;
F72B : 10                             ;MW1
F72C : 00 F4 00 E8 00 DC 00 E2        ;
F734 : 00 DC 00 E8 00 F4 00 00        ;
;
F73C : 48                             ;HBPAT2
F73D : 45 4B 50 56 5B 60 64 69        ;
F745 : 6D 71 74 77 7A 7C 7E 7F        ;
F74D : 7F 80 7F 7F 7E 7C 7A 77        ;
F755 : 74 71 6D 69 64 60 5B 56        ;
F75D : 50 4B 45 40 3B 35 30 2A        ;
F765 : 25 20 1C 17 13 0F 0C 09        ;
F76D : 06 04 02 01 01 00 01 01        ;
F775 : 02 04 06 09 0C 0F 13 17        ;
F77D : 1C 20 25 2A 30 35 3B 40        ;
;
F785 : 0C                             ;(12)
F786 : 00 50 60 B0 20 20 F0 90        ;
F78E : 80 C0 50 70                    ;
;
F792 : 07                             ;(7)
F793 : 40 09 35 0C 29 0F 20           ;
;
F79A : 24                             ;(36)
F79B : 7F B0 D6 E8 E3 C9 A3 7B        ;
F7A3 : 5E 54 5E 7B A3 C9 E3 E8        ;
F7AB : D6 B0 7F 4C 26 14 19 33        ;
F7B3 : 5A 81 9E A8 9E 81 5A 33        ;
F7BB : 19 14 26 4C                    ;
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
;SVTAB  EQU  *
;HBDSND-GFRTAB 1
F7BF : 81 24 00 00 00 16 31           ;HBDV 
;STDSND-GFRTAB 2
F7C6 : 12 05 1A FF 00 27 6D           ;STDV 
;SWPAT-GFRTAB 3
F7CD : 11 05 11 01 0F 01 47           ;DP1V
;SPNSND-GFRTAB 4
F7D4 : 11 31 00 01 00 0D 1B           ;XBV
; ?? -GFRTAB 5
F7DB : F1 18 00 01 01 08 FB           ;?
;HBESND-GFRTAB 6
F7E2 : 41 45 00 00 00 0F 5B           ;HBEV
;SPNSND-GFRTAB 7
F7E9 : 21 35 11 FF 00 0D 1B           ;PROTV
; ?? -GFRTAB 8
F7F0 : 46 59 00 00 00 08 85           ;?
;COOLDN-GFRTAB 9
F7F7 : 31 11 00 01 00 03 6A           ;CLDWNV
; ?? -GFRTAB 10
F7FE : 63 25 00 03 0A 03 6A           ;?
; ?? -GFRTAB 11
F805 : 43 0D 00 04 02 0D 1B           ;?
; ?? -GFRTAB 12
F80C : 08 4C 0B 40 01 02 F3           ;?
;SPNR-GFRTAB 13
F813 : 1F 12 00 FF 10 04 69           ;ED17
;
F81A : F1 11 00 FF 00 0D 00           ;?
;
F821 : 12 06 00 FF 01 09 28           ;?
;
F828 : 14 17 00 00 00 0E 0D           ;?
;HBTSND-GFRTAB
F82F : F4 11 00 00 00 0E 0D           ;SPD
;SPNSND-GFRTAB
F836 : 21 30 00 01 00 0D 1B           ;SPNV
;
F83D : 11 0B 06 02 20 03 EF           ;?
;SP2SND-GFRTAB
F844 : F4 18 00 00 00 12 B3           ;SP1V
;
F84B : 52 32 12 00 00 10 DF           ;?
;
F852 : 1F 14 02 00 00 05 F6           ;?
;(same offset as hbtsnd-gfrtab)
F859 : 21 30 00 FF 00 1B 0D           ;WIRDV
;YUKSND-GFRTAB
F860 : F1 19 00 00 00 0E A4           ;GDYUKV
;COOLDN-GFRTAB
F867 : 31 19 00 01 00 03 6A           ;BK8
;STDSND-GFRTAB
F86E : 41 02 D0 00 00 27 6D           ;SF10
;SPNSND-GFRTAB
F875 : 03 15 11 FF 00 0D 1B           ;BIL30
;*************************************;
;GWAVE FREQ PATTERN TABLE
;*************************************; 
;GFRTAB
;*BONUS SOUND
F87C : A0 98 90 88 80 78 70 68        ;BONSND
F883 : 60 58 50 44 40                 ;
;*HUNDRED POINT SOUND
F889 : 01 01 02 02 04 04 08 08        ;HBTSND
F891 : 10 10 30 60 C0 E0              ;
;*SPINNER SOUND
F897 : 01 01 02 02 03 04 05 06        ;SPNSND
F89F : 07 08 09 0A 0C                 ;
;*TURBINE START UP
F8A4 : 80 7C 78 74 70 74 78 7C 80     ;TRBPAT
;*HEARTBEAT DISTORTO
F8AD : 01 01 02 02 04 04 08 08        ;HBDSND
F8B5 : 10 20 28 30 38 40 48 50        ;
F8BD : 60 70 80 A0 B0 C0              ;
;*SWEEP PATTERN
;SWPAT  EQU  *
;*BIGBEN SOUNDS
F8C2 : 08 40 08 40 08 40 08 40        ;BBSND
F8CB : 08 40 08 40 08 40 08 40        ;
F8D3 : 08 40 08 40                    ;
;*HEARTBEAT ECHO
F8D7 : 01 02 04 08 09 0A 0B 0C        ;HBESND
F8DF : 0E 0F 10 12 14 16              ;
;*SPINNER SOUND "DRIP"
F8E5 : 40                             ;SPNR
;*COOL DOWNER
F8E6 : 10 08 01                       ;COOLDN
;*START DISTORTO SOUND
F8E9 : 01 01 01 01 02 02 03 03        ;STDSND
F8F1 : 04 04 05 06 08 0A 0C 10        ;
F8F9 : 14 18 20 30 40 50 40 30        ;
F901 : 20 10 0C 0A 08 07 06 05        ;
F909 : 04 03 02 02 01 01 01           ;
;*ED'S SOUND 10
F910 : 07 08 09 0A 0C 08              ;ED10FP
;*ED'S SOUND 13
F916 : 17 18 19 1A 1B 1C              ;ED13FP
;FILLER
F91C : 00 00 00 00                    ;
;YUKSND
F920 : 08 80 10 78 18 70 20 60        ;YUKSND
F928 : 28 58 30 50 40 48 00           ;
;SP2SND
F92F : 01 08 10 01 08 10 01 08        ;SP2SND
F937 : 10 01 08 10 01 08 10 01        ;
F93F : 08 10 00                       ;
;SSPSND
F942 : 10 20 40 10 20 40 10 20 40     ;SSPSND
F94B : 10 20 40 10 20 40 10 20 40     ;
F954 : 10 20 40 10 20 40 00           ;
; ??
F95B : 01 02 02 03 03 03 06 06        ;?
F963 : 06 06 0F 1F 36 55 74 91        ;
F96A : 01 02 03 04 26 03 04 05        ;
F973 : 05 05 05 05 FF 01 00           ;
; ??
F97A : 18 41 04 80 00                 ;?
;*************************************;
;* NAM WALSH FUNCTION SOUND MACHINE V2
;*************************************;
;* T. MURPHY  11/10/81
;
;
;*************************************;
; SUBTTL WAVE PLAYER AND PITCH MODIFICATION
;*************************************;
;* PLAY A SAMPLE, REMAINING DELAY IN B.  TOTAL DELAY = MIN (60,B*6) MICS.
;
;NTHRVC
F97F : C0 0D      subb  #$0D          ;
F981 : 37         pshb                ;push B into stack then SP - 1
;LF982:
F982 : BD 00 2C   jsr  L002C
;LF985:
F985 : 33         pulb                ;SP + 1 pull stack into B
;SYN121 LF986:
F986 : C1 14      cmpb  #$14
;LF988:
F988 : 22 F5      bhi  LF97F
F98A : 01         nop
;LF98B:
F98B : 96 24      ldaa  X0024
F98D : 9B 21      adda  X0021
F98F : 97 24      staa  X0024
;LF991:
F991 : C9 F6      adcb  #$F6
;LF993:
F993 : 5A         decb
;LF994:
F994 : 2A FD      bpl  LF993
F996 : 96 28      ldaa  X0028
F998 : 4C         inca
F999 : 84 0F      anda  #$0F
F99B : 8A 10      oraa  #$10
F99D : 97 28      staa  X0028
F99F : DE 27      ldx  X0027
F9A1 : E6 00      ldab  $00,x
F9A3 : F7 04 00   stab  $0400         ;store B in DAC output SOUND
F9A6 : 84 0F      anda  #$0F
F9A8 : 39         rts                 ;return subroutine
;
;*************************************;
; Walsh Machine
;*************************************;
;* PLAYS WAVE AND ALTERS PITCH ACCORDING TO PITCH CMDS.
;* SMPPER IS INITIAL PITCH,  PCMDPT IS START PITCH PROGRAM,
;* FCMDPT IS START WAVE MODIFIER (FILTER) PROGRAM.
;
;WSM
F9A9 : 4F         clra
F9AA : CE 00 10   ldx  #$0010
F9AD : C6 61      ldab  #$61
;1$
F9AF : A7 00      staa  $00,x
F9B1 : 08         inx
F9B2 : 5A         decb
F9B3 : 26 FA      bne  LF9AF
F9B5 : C6 5F      ldab  #$5F
F9B7 : D7 26      stab  X0026
F9B9 : C6 37      ldab  #$37
F9BB : D7 30      stab  X0030
F9BD : C6 7E      ldab  #$7E
F9BF : D7 2C      stab  X002C
F9C1 : CE FB 94   ldx  #$FB94
F9C4 : DF 2D      stx  X002D
F9C6 : D6 0C      ldab  X000C
F9C8 : D7 23      stab  X0023
;PPLPE1
F9CA : C0 03      subb  #$03
;PPLPE2
F9CC : BD F9 86   jsr  LF986
F9CF : 08         inx
;PPLP
F9D0 : D6 23      ldab  X0023
F9D2 : C0 02      subb  #$02
F9D4 : BD F9 7F   jsr  LF97F
F9D7 : 26 F7      bne  LF9D0
;
F9D9 : D6 20      ldab  X0020
F9DB : 96 21      ldaa  X0021
F9DD : 9B 0D      adda  X000D
F9DF : D9 0C      adcb  X000C
F9E1 : 97 0D      staa  X000D
F9E3 : D7 0C      stab  X000C
;
F9E5 : DB 22      addb  X0022
F9E7 : 86 19      ldaa  #$19
F9E9 : 11         cba
F9EA : 24 01      bcc  LF9ED
;F9EC : 81 16      cmpa  #$16          ;<- disasm error (FCB 81 TAB)
F9EC : 81                             ;FCB 129
F9ED : 16         tab                 ;
F9EE : D7 23      stab  X0023
F9F0 : 01         nop
F9F1 : C0 09      subb  #$09
F9F3 : BD F9 86   jsr  LF986
;
F9F6 : 96 2F      ldaa  X002F
F9F8 : 16         tab
F9F9 : 48         asla
F9FA : C9 00      adcb  #$00
F9FC : D7 2F      stab  X002F
;
F9FE : D6 23      ldab  X0023
FA00 : C0 05      subb  #$05
FA02 : 96 25      ldaa  X0025
FA04 : 2A 06      bpl  LFA0C
;
FA06 : 7C 00 25   inc  X0025
FA09 : 01         nop
FA0A : 20 BE      bra  LF9CA
;
;PAWAKE
FA0C : 5A         decb
FA0D : BD F9 86   jsr  LF986
;
FA10 : DE 0A      ldx  X000A
FA12 : A6 00      ldaa  $00,x
FA14 : 2A 12      bpl  LFA28
;
FA16 : 81 80      cmpa  #$80
FA18 : 27 5F      beq  LFA79
;
FA1A : 4C         inca
FA1B : 97 25      staa  X0025
FA1D : 08         inx
;FB23 : FF 00 0A   stx  $000A          ;<- disasm error (FCB -1,0,PCMDPT)
FA1E : FF 00 0A   stx  X000A
;PPLP35
FA21 : D6 23      ldab  X0023
FA23 : C0 06      subb  #$06
FA25 : 7E F9 CA   jmp  LF9CA
;
;PPLP1
FA28 : 08         inx
FA29 : E6 00      ldab  $00,x
FA2B : 37         pshb
FA2C : 08         inx
FA2D : DF 0A      stx  X000A
;
FA2F : 97 29      staa  X0029
FA31 : 84 70      anda  #$70
FA33 : 44         lsra
FA34 : 44         lsra
FA35 : 44         lsra
FA36 : 5F         clrb
;
FA37 : 8B 0D      adda  #$0D
FA39 : C9 FB      adcb  #$FB
FA3B : 97 2B      staa  X002B
FA3D : D7 2A      stab  X002A
;
FA3F : D6 23      ldab  X0023
FA41 : D6 23      ldab  X0023
FA43 : C0 0D      subb  #$0D
FA45 : BD F9 86   jsr  LF986
;
FA48 : 5F         clrb
FA49 : DE 2A      ldx  X002A
FA4B : EE 00      ldx  $00,x
FA4D : 6E 00      jmp  $00,x          ;INFO: index jump
;*************************************;
;* PITCH COMMAND ROUTINES. 
;*************************************;
;  UNLESS OTHERWISE STATED, N IS A SIGNED 8 BIT
;* NUMBER = BYTE FOLLOWING OPCODE.
;
;* LDP N  IS  SMPPER := N,  ADP N  IS SMPPER := SMPPER + N
;
;LDPR
FA4F : 96 29      ldaa  X0029
FA51 : 47         asra
FA52 : C2 00      sbcb  #$00
FA54 : D4 0C      andb  X000C
FA56 : 32         pula
FA57 : 10         sba
FA58 : 9B 0C      adda  X000C
FA5A : 97 0C      staa  X000C
FA5C : 08         inx
;LDPRE
FA5D : D6 23      ldab  X0023
FA5F : C0 0A      subb  #$0A
FA61 : 7E F9 CC   jmp  LF9CC
;*************************************;
;* LDO N IS  GLBPRO := N,  ADO N IS  GLBPRO := GLBPRO + N
;
;LDOR
FA64 : 96 29      ldaa  X0029
FA66 : 47         asra
FA67 : C2 00      sbcb  #$00
FA69 : D4 22      andb  X0022
FA6B : 32         pula
FA6C : 10         sba
FA6D : 9B 22      adda  X0022
FA6F : 97 22      staa  X0022
FA71 : 20 EA      bra  LFA5D
;*************************************;
;* ESC EXECUTES MACHINE LANGUAGE IMMEDIATELY FOLLOWING
;
;ESCR
FA73 : 32         pula
FA74 : DE 0A      ldx  X000A
FA76 : 09         dex
FA77 : 6E 00      jmp  $00,x            ;INFO: index jump
;*************************************;
;* STOP EITHER REPEATS A CALL, RETURNS FROM A CALL, OR ENDS SOUND.
;
;STOPR
FA79 : 96 26      ldaa  X0026
FA7B : 81 5F      cmpa  #$5F
FA7D : 2B 01      bmi  LFA80
FA7F : 39         rts           ;return subroutine
;
FA80 : D6 23      ldab  X0023
FA82 : C0 07      subb  #$07
FA84 : BD F9 86   jsr  LF986
;
FA87 : DE 25      ldx  X0025
FA89 : 6A 02      dec  $02,x
FA8B : 2B 12      bmi  LFA9F
;
FA8D : EE 00      ldx  $00,x
FA8F : A6 00      ldaa  $00,x
FA91 : 36         psha
FA92 : 08         inx
FA93 : DF 0A      stx  X000A
;
;FB9A : F6 00 23   ldab  X0023         ;<- disasm error (FCB -10,0,TMPPER)
FA95 : F6 00 23    "  #"    ldab  X0023
FA98 : C0 09      subb  #$09
FA9A : BD F9 86   jsr  LF986
;
FA9D : 20 55      bra  LFAF4
;
;PRET
FA9F : EE 00      ldx  $00,x
FAA1 : 08         inx
FAA2 : DF 0A      stx  X000A
FAA4 : 96 26      ldaa  X0026
FAA6 : 8B 03      adda  #$03
FAA8 : 97 26      staa  X0026
;
FAAA : D6 23      ldab  X0023
FAAC : C0 07      subb  #$07
FAAE : 01         nop
FAAF : 7E F9 CA   jmp  LF9CA
;*************************************;
;* LDV N IS  PERVEL := N,  ADV N IS  PERVEL := PERVEL + N
;* IN THIS CASE  N IS A 12 BIT NUMBER, THE UPPER 4 BITS OF WHICH
;* ARE LO 4 BITS OF THE OPCODE BYTE.
;
;ADVR
FAB2 : 08         inx
FAB3 : 20 04      bra  LFAB9
;
;LDVR
FAB5 : D7 20      stab  X0020
FAB7 : D7 21      stab  X0021
;
FAB9 : D6 29      ldab  X0029
FABB : C4 0F      andb  #$0F
FABD : CB F8      addb  #$F8
FABF : C8 F8      eorb  #$F8
;
FAC1 : 32         pula
FAC2 : 9B 21      adda  X0021
FAC4 : D9 20      adcb  X0020
FAC6 : 97 21      staa  X0021
FAC8 : D7 20      stab  X0020
;
;FBCF : F6 00 23   ldab  X0023         ;<- disasm error (FCB -10,0,TMPPER)
FACA : F6 00 23    "  #"    ldab  X0023
FACD : C0 09      subb  #$09
FACF : 7E F9 CA   jmp  LF9CA
;*************************************;
;* DO R,N  CALLS RTN AT *+N  R TIMES.
;
;PDOR
FAD2 : 96 26      ldaa  X0026
FAD4 : 80 03      suba  #$03
FAD6 : 97 26      staa  X0026
;
FAD8 : DE 25      ldx  X0025
FADA : 96 0B      ldaa  X000B
FADC : D6 0A      ldab  X000A
FADE : 8B FF      adda  #$FF
FAE0 : C9 FF      adcb  #$FF
FAE2 : E7 00      stab  $00,x
FAE4 : A7 01      staa  $01,x
FAE6 : D6 29      ldab  X0029
FAE8 : C4 0F      andb  #$0F
FAEA : E7 02      stab  $02,x
;
FAEC : D6 23      ldab  X0023
FAEE : C0 0C      subb  #$0C
FAF0 : BD F9 86   jsr  LF986
FAF3 : 08         inx
;PTORE1
FAF4 : 08         inx
FAF5 : 08         inx
FAF6 : 5F         clrb
FAF7 : 01         nop
;
;* TO N  SETS LOC TO BE *+N.
;
;PTOR
FAF8 : 32         pula
FAF9 : 47         asra
FAFA : 49         rola
FAFB : C2 00      sbcb  #$00
FAFD : 9B 0B      adda  X000B
FAFF : D9 0A      adcb  X000A
FB01 : 97 0B      staa  X000B
;FC08 : F7 00 0A   stab  X000A         ;<- disasm error (FCB -9,0,PCMDPT 41)
FB03 : F7 00 0A    "   "    stab  X000A
;
FB06 : D6 23      ldab  X0023
FB08 : C0 07      subb  #$07
FB0A : 7E F9 CA   jmp  LF9CA
;*************************************;
;jump table
;*************************************;
;PCMDJT FDB
FB0D : FA 4F 
FB0F : FA 64 
FB11 : FA B5 
FB13 : FA B2 
FB15 : FA 4F 
FB17 : FA 73 
FB19 : FA D2 
FB1B : FA F8 
;FCMDJT FDB
FB1D : FC 91 
FB1F : FD 1A 
FB21 : FB C9 
FB22 : FC C2 
FB25 : FB 44 
FB27 : FC D3 
FB29 : FB 6F 
FB2B : FC 06 
;
;*************************************;
;SUBTTL	WAVE MODIFICATION
;*************************************;
;* FENDR OVERLAY GETS RETURN ADDR FROM STACK.
;
;FRTURN
FB2D : DE 2F      ldx  X002F
FB2F : EE 03      ldx  $03,x
FB31 : 08         inx
FB32 : DF 08      stx  X0008
FB34 : BD FC 00   jsr  LFC00
FB37 : 08         inx
FB38 : 39         rts                 ;return subroutine
;*************************************;
;* REPEAT CALL.
;
;FDOAGN
FB39 : EE 00      ldx  $00,x
FB3B : DF 08      stx  X0008
FB3D : CE FC 06   ldx  #$FC06
FB40 : DF 2D      stx  X002D
FB42 : 01         nop
FB43 : 39         rts
;*************************************;
;* FIN DOES  REPEAT CALL, RETURN TO CALLER, STOP RTN DEPENDING ON STACK.
;
;FINR
FB44 : 96 30      ldaa  X0030
FB46 : 81 37      cmpa  #$37
FB48 : 23 12      bls  LFB5C
;
FB4A : DE 2F      ldx  X002F
FB4C : 6A 02      dec  $02,x
FB4E : 2A E9      bpl  LFB39
;
FB50 : 80 03      suba  #$03
FB52 : 97 30      staa  X0030
FB54 : CE FB 2D   ldx  #$FB2D
FB57 : DF 2D      stx  X002D
FB59 : 6D 00      tst  $00,x
FB5B : 39         rts                 ;return subroutine
;*************************************;
;ALLDON
FB5C : CE FB 64    "  d"    ldx  #$FB64
FB5F : DF 2D    " -"    stx  X002D
FB61 : 01    " "    nop
FB62 : 20 05    "  "    bra  LFB69
;
;WAST50
FB64 : 08    " "    inx
FB65 : 08    " "    inx
FB66 : 01    " "    nop
;WAST40
FB67 : 8D 05    "  "    bsr  LFB6E
;WAST27
FB69 : 8D 03    "  "    bsr  LFB6E
;WAST14
FB6B : 6D 00    "m "    tst  $00,x
;WAST7
FB6D : 01    " "    nop
;WAST5
FB6E : 39          rts           ;return subroutine
;*************************************;
;* CALL WITH REPEAT. REPEAT CNT 0(=1) TO 15 (=16) IS LO 4 BITS OF OPCODE.
;* NEXT BYTE IS DISPLACEMENT AS IN GO INSTRUCTION.  THE CTR AND RETURN
;* ADDRESS ARE SAVED ON A STACK.
;
;FDOR
FB6F : DE 2F    " /"    ldx  X002F
FB71 : 96 08    "  "    ldaa  X0008
FB73 : A7 03    "  "    staa  $03,x
FB75 : 96 09    "  "    ldaa  X0009
FB77 : A7 04    "  "    staa  $04,x
FB79 : 96 39    " 9"    ldaa  X0039
FB7B : 84 0F    "  "    anda  #$0F
FB7D : A7 05    "  "    staa  $05,x
;
FB7F : 08    " "    inx
FB80 : CE FB 86    "   "    ldx  #$FB86
FB83 : DF 2D    " -"    stx  X002D
FB85 : 39          rts           ;return subroutine
;*************************************;
;* OVERLAY FOR CALL RTN.
;
;1$
FB86 : 96 30    " 0"    ldaa  X0030
FB88 : 8B 03    "  "    adda  #$03
FB8A : 97 30    " 0"    staa  X0030
FB8C : CE FC 06    "   "    ldx  #$FC06
FB8F : DF 2D    " -"    stx  X002D
FB91 : 01    " "    nop
FB92 : 20 D5    "  "    bra  LFB69
;*************************************;
;* GET NEXT FILTER COMMAND
;
;NXTFCM
FB94 : 7D 00 2F    "} /"    tst  X002F
FB97 : 26 CE    "& "    bne  LFB67
;
FB99 : DE 08    "  "    ldx  X0008
FB9B : A6 00    "  "    ldaa  $00,x
FB9D : 08    " "    inx
FB9E : DF 08    "  "    stx  X0008
FBA0 : 97 39    " 9"    staa  X0039
FBA2 : 2A 05    "* "    bpl  LFBA9
;
FBA4 : 97 2F    " /"    staa  X002F
FBA6 : A6 00    "  "    ldaa  $00,x
FBA8 : 39          rts           ;return subroutine
;1$:
FBA9 : CE FB B0    "   "    ldx  #$FBB0
;FCB1 : FF 00 2D   stx  X002D          ;<- disasm error (FCB -1,0,FVECT+1)
FBAC : FF 00 2D    "  -"    stx  X002D
FBAF : 39    "9"    rts
;*************************************;
;
;EXFCMD
FBB0 : 5F    "_"    clrb
FBB1 : 96 39    " 9"    ldaa  X0039
FBB3 : 84 70    " p"    anda  #$70
FBB5 : 44    "D"    lsra
FBB6 : 44    "D"    lsra
FBB7 : 44    "D"    lsra
FBB8 : 8B 1D    "  "    adda  #$1D
FBBA : C9 FB    "  "    adcb  #$FB
FBBC : D7 37    " 7"    stab  X0037
FBBE : 97 38    " 8"    staa  X0038
FBC0 : DE 37    " 7"    ldx  X0037
FBC2 : EE 00    "  "    ldx  $00,x
FBC4 : DF 2D    " -"    stx  X002D
FBC6 : DF 2D    " -"    stx  X002D
FBC8 : 39    "9"    rts
;*************************************;
;* SET UP FOR REPEATED TABLE ADD.
;
;ETBR
FBC9 : 96 39    " 9"    ldaa  X0039
FBCB : 84 0F    "  "    anda  #$0F
FBCD : 4C    "L"    inca
FBCE : 4C    "L"    inca
FBCF : 97 2F    " /"    staa  X002F
FBD1 : 20 1D    "  "    bra  LFBF0
;*************************************;
;* LOOK FOR A NONZERO HARMONIC CHANGE AND PERFORM IT.  IF ENTIRE TABLE
;* IS ZERO WE HAVE FINISHED THE LAST COMMAND AND PICK UP THE NEXT ONE.
;
;FINDHA
FBD3 : 7C 00 32    "| 2"    inc  X0032
FBD6 : DE 31    " 1"    ldx  X0031
FBD8 : 8C 00 68    "  h"    cpx  #$0068
FBDB : 27 13    "' "    beq  LFBF0
FBDD : A6 00    "  "    ldaa  $00,x
FBDF : CE FC 1A    "   "    ldx  #$FC1A
FBE2 : 97 35    " 5"    staa  X0035
FBE4 : 27 03    "' "    beq  LFBE9
FBE6 : 7E FB EC    "~  "    jmp  LFBEC
FBE9 : CE FB D3    "   "    ldx  #$FBD3
FBEC : DF 2D    " -"    stx  X002D
FBEE : 08    " "    inx
FBEF : 39          rts           ;return subroutine
;*************************************;
;FHA1:
FBF0 : 86 5E    " ^"    ldaa  #$5E
;FCF7 : B7 00 32   staa  X0032         ;<- disasm error (FCB $B7,0,HAPTR+1)
FBF2 : B7 00 32    "  2"    staa  X0032
FBF5 : CE FB D3    "   "    ldx  #$FBD3
FBF8 : 7A 00 2F    "z /"    dec  X002F
FBFB : 27 03    "' "    beq  LFC00
FBFD        XFBFD:
FBFD : 7E FC 03    "~  "    jmp  LFC03
;FCMDNX:
FC00 : CE FB 94    "   "    ldx  #$FB94
FC03        LFC03:
FC03 : DF 2D    " -"    stx  X002D
FC05 : 39          rts           ;return subroutine
;*************************************;
;* RELATIVE JUMP.
;
;FTOR
FC06 : DE 08    "  "    ldx  X0008
FC08 : 5F    "_"    clrb
FC09 : A6 00    "  "    ldaa  $00,x
FC0B : 4C    "L"    inca
FC0C : 47    "G"    asra
FC0D : 49    "I"    rola
FC0E : C2 00    "  "    sbcb  #$00
FC10 : 9B 09    "  "    adda  X0009
FC12 : D9 08    "  "    adcb  X0008
FC14 : 97 09    "  "    staa  X0009
FC16 : D7 08    "  "    stab  X0008
;
FC18 : 20 E6    "  "    bra  LFC00
;*************************************;
;* SET UP FOR ADD OF HAMP * HARMONIC TO WAVE.
;
;ADDINI
FC1A : 96 32    " 2"    ldaa  X0032
FC1C : 80 5F    " _"    suba  #$5F
FC1E : 48    "H"    asla
FC1F : 5F    "_"    clrb
FC20 : 9B 0F    "  "    adda  X000F
FC22 : D9 0E    "  "    adcb  X000E
FC24 : D7 37    " 7"    stab  X0037
FC26 : 97 38    " 8"    staa  X0038
;
FC28 : 86 80    "  "    ldaa  #$80
FC2A : 97 36    " 6"    staa  X0036
;
FC2C : CE FC 37    "  7"    ldx  #$FC37
FC2F : DF 2D    " -"    stx  X002D
FC31 : CE 00 10    "   "    ldx  #$0010
FC34 : DF 33    " 3"    stx  X0033
FC36 : 39          rts           ;return subroutine
;
;2$
FC37 : DE 37    " 7"    ldx  X0037
FC39 : EE 00    "  "    ldx  $00,x
FC3B : DF 37    " 7"    stx  X0037
FC3D : CE FC 4C    "  L"    ldx  #$FC4C
FC40 : DF 2D    " -"    stx  X002D
;
FC42 : DE 31    " 1"    ldx  X0031
FC44 : A6 09    "  "    ldaa  $09,x
FC46 : 9B 35    " 5"    adda  X0035
FC48 : A7 09    "  "    staa  $09,x
FC4A : 08    " "    inx
FC4B : 39          rts           ;return subroutine
;*************************************;
;* ADD HAMP * HARMONIC FN TO WAVEFORM.
;
;ADDLP
FC4C : 96 36    " 6"    ldaa  X0036
FC4E : 27 1D    "' "    beq  LFC6D
;
FC50 : 74 00 36    "t 6"    lsr  X0036
FC53 : DE 33    " 3"    ldx  X0033
FC55 : E6 00    "  "    ldab  $00,x
FC57 : 94 37    " 7"    anda  X0037
FC59 : 26 09    "& "    bne  LFC64
;FD60 : FB 00 35   addb  X0035         ;<- disasm error (FCB -5,0,HAMP)
FC5B : FB 00 35    "  5"    addb  X0035
FC5E : E7 00    "  "    stab  $00,x
FC60 : 7C 00 34    "| 4"    inc  X0034
FC63 : 39          rts           ;return subroutine
;2$:
;FD69 : F0 00 35   subb  X0035         ;<- disasm error (FCB -16,0,HAMP)
FC64 : F0 00 35    "  5"    subb  X0035
FC67 : E7 00    "  "    stab  $00,x
FC69 : 7C 00 34    "| 4"    inc  X0034
FC6C : 39          rts           ;return subroutine
;1$:
FC6D : D6 34    " 4"    ldab  X0034
FC6F : C1 20    "  "    cmpb  #$20
FC71 : 27 0B    "' "    beq  LFC7E
FC73 : D6 38    " 8"    ldab  X0038
FC75 : D7 37    " 7"    stab  X0037
FC77 : C6 80    "  "    ldab  #$80
;FD7E : F7 00 36   stab  X0036         ;<- disasm error (FCB -9,0,FMSK)
FC79 : F7 00 36    "  6"    stab  X0036
FC7C : 20 0F    "  "    bra  LFC8D
;3$:
FC7E : CE FB 94    "   "    ldx  #$FB94
FC81 : D6 2F    " /"    ldab  X002F
FC83 : 26 03    "& "    bne  LFC88
FC85 : 7E FC 8B    "~  "    jmp  LFC8B
FC88 : CE FB D3    "   "    ldx  #$FBD3
FC8B : DF 2D    " -"    stx  X002D
;16$:
FC8D : 6D 00    "m "    tst  $00,x
FC8F : 08    " "    inx
FC90 : 39          rts           ;return subroutine
;*************************************;
;* ADH H,N  LDH H,N  USE SAME RTN
;
;ADHR
;LDHR
FC91 : 96 39    " 9"    ldaa  X0039
FC93 : 84 07    "  "    anda  #$07
FC95 : 8B 60    " `"    adda  #$60
FC97 : 97 32    " 2"    staa  X0032
;
FC99 : DE 08    "  "    ldx  X0008
FC9B : A6 00    "  "    ldaa  $00,x
FC9D : 08    " "    inx
FC9E : DF 08    "  "    stx  X0008
FCA0 : 97 35    " 5"    staa  X0035
;
FCA2 : CE FC A9    "   "    ldx  #$FCA9
FCA5 : DF 2D    " -"    stx  X002D
FCA7 : 08    " "    inx
FCA8 : 39          rts           ;return subroutine
;1$
FCA9 : DE 31    " 1"    ldx  X0031
FCAB : 5F    "_"    clrb
FCAC : 96 39    " 9"    ldaa  X0039
FCAE : 8B F8    "  "    adda  #$F8
FCB0 : C2 00    "  "    sbcb  #$00
FCB2 : E4 09    "  "    andb  $09,x
FCB4 : 50    "P"    negb
FCB5 : DB 35    " 5"    addb  X0035
;ADHRE:
FCB7 : D7 35    " 5"    stab  X0035
FCB9 : CE FC 1A    "   "    ldx  #$FC1A
FCBC : DF 2D    " -"    stx  X002D
FCBE : 08    " "    inx
FCBF : 08    " "    inx
FCC0 : 01    " "    nop
FCC1 : 39          rts           ;return subroutine
;*************************************;
;* HARMONIC INCREMENT OR DECREMENT
;
;HIDR
FCC2 : D6 39    " 9"    ldab  X0039
FCC4 : 54    "T"    lsrb
FCC5 : C4 07    "  "    andb  #$07
FCC7 : CA 60    " `"    orab  #$60
FCC9 : D7 32    " 2"    stab  X0032
;
FCCB : C6 FF    "  "    ldab  #$FF
FCCD : C9 00    "  "    adcb  #$00
FCCF : C9 00    "  "    adcb  #$00
FCD1 : 20 E4    "  "    bra  LFCB7
;*************************************;
;* CLEAR ADD2HA OR ALTER 0TH AMPLITUDE.
;
;ZTBR
FCD3 : 96 39    " 9"    ldaa  X0039
FCD5 : 47    "G"    asra
FCD6 : 25 13    "% "    bcs  LFCEB
;
FCD8 : CE 00 00    "   "    ldx  #$0000
FCDB : DF 60    " `"    stx  X0060
FCDD : DF 62    " b"    stx  X0062
FCDF : DF 64    " d"    stx  X0064
FCE1 : DF 66    " f"    stx  X0066
FCE3 : 08    " "    inx
;ATBRE
FCE4 : CE FB 94    "   "    ldx  #$FB94
;FDEC : FF 00 2D   stx  X002D          ;<- disasm error (FCB -1,0,FVECT+1)
FCE7 : FF 00 2D    "  -"    stx  X002D
;ATBRE1
FCEA : 39          rts           ;return subroutine
;
;ADCR:
FCEB : 85 02    "  "    bita  #$02
FCED : 26 0C    "& "    bne  LFCFB
FCEF : C6 5F    " _"    ldab  #$5F
FCF1 : D7 32    " 2"    stab  X0032
FCF3 : CE FD 00    "   "    ldx  #$FD00
;ADCRE:
FCF6 : DF 2D    " -"    stx  X002D
FCF8 : 7E FB 6B    "~ k"    jmp  LFB6B
;
;ESC1:
;FE00 : FE 00 08   ldx  X0008          ;<- disasm error (FCB -2,0,FCMDPT)
FCFB : FE 00 08    "   "    ldx  X0008
FCFE : 20 F6    "  "    bra  LFCF6
;
;ADCRO;
FD00 : 5F    "_"    clrb
FD01 : 96 39    " 9"    ldaa  X0039
FD03 : 8B AE    "  "    adda  #$AE
FD05 : C2 00    "  "    sbcb  #$00
FD07 : D4 68    " h"    andb  X0068
FD09 : DE 08    "  "    ldx  X0008
FD0B : A6 00    "  "    ldaa  $00,x
FD0D : 08    " "    inx
FD0E : DF 08    "  "    stx  X0008
FD10 : 10    " "    sba
FD11 : 97 35    " 5"    staa  X0035
FD13 : CE FC 1A    "   "    ldx  #$FC1A
;FE1B : FF 00 2D   stx  $002D          ;<- disasm error (FCB -1,0,FVECT+1)
FD16 : FF 00 2D    "  -"    stx  X002D
FD19 : 39          rts           ;return subroutine
;*************************************;
;* CHANGE SOME ADD2HA ENTRIES.
;
;LDTR
FD1A : C6 60    " `"    ldab  #$60
FD1C : D7 32    " 2"    stab  X0032
FD1E : DE 08    "  "    ldx  X0008
FD20 : E6 00    "  "    ldab  $00,x
FD22 : D7 37    " 7"    stab  X0037
FD24 : 08    " "    inx
FD25 : DF 08    "  "    stx  X0008
FD27 : D6 39    " 9"    ldab  X0039
FD29 : 54    "T"    lsrb
FD2A : 24 18    "$ "    bcc  LFD44
FD2C : CE FD 5E    "  ^"    ldx  #$FD5E
FD2F : DF 2D    " -"    stx  X002D
FD31 : 39          rts           ;return subroutine
;4$
FD32 : 5F    "_"    clrb
FD33 : 96 38    " 8"    ldaa  X0038
FD35 : 47    "G"    asra
FD36 : C2 00    "  "    sbcb  #$00
FD38 : DE 31    " 1"    ldx  X0031
FD3A : E4 00    "  "    andb  $00,x
FD3C : 1B    " "    aba
FD3D : A7 00    "  "    staa  $00,x
FD3F : 7C 00 32    "| 2"    inc  X0032
FD42 : A6 00    "  "    ldaa  $00,x
;5$:
FD44 : CE FD 4A    "  J"    ldx  #$FD4A
FD47 : DF 2D    " -"    stx  X002D
FD49 : 39          rts           ;return subroutine
;1$
FD4A : 78 00 37    "x 7"    asl  X0037
FD4D : 25 13    "% "    bcs  LFD62
FD4F : 27 06    "' "    beq  LFD57
FD51 : 7C 00 32    "| 2"    inc  X0032
FD54 : 7E FB 69    "~ i"    jmp  LFB69
;3$:
FD57 : BD FC 00    "   "    jsr  LFC00
FD5A : 6D 00    "m "    tst  $00,x
FD5C : 01    " "    nop
FD5D : 39          rts           ;return subroutine
;6$:
FD5E : 7A 00 32    "z 2"    dec  X0032
FD61 : 08    " "    inx
;2$:
FD62 : A6 00    "  "    ldaa  $00,x
FD64 : DE 08    "  "    ldx  X0008
FD66 : A6 00    "  "    ldaa  $00,x
FD68 : 08    " "    inx
FD69 : DF 08    "  "    stx  X0008
FD6B : 97 38    " 8"    staa  X0038
FD6D : CE FD 32    "  2"    ldx  #$FD32
FD70 : DF 2D    " -"    stx  X002D
FD72 : 39          rts           ;return subroutine
;*************************************;
;WALSHT
;*************************************;
FD73 : FE 26                          ;LBL1
FD75 : FE 6A                          ;LBL2
FD77 : FD C7                          ;LBL3
FD79 : FE 58                          ;LBL4
FD7B : FD C7                          ;LBL3
FD7D : FE 70                          ;LBL5
FD7F : FE 01                          ;LBL6
FD81 : FE 70                          ;LBL5
FD83 : FE 0A                          ;LBL7
FD85 : FE 58                          ;LBL4
FD87 : FE 0A                          ;LBL7
FD89 : FE 5C                          ;LBL8
FD8B : FE 0A                          ;LBL7
FD8D : FE 70                          ;LBL5
;*************************************;
;WALSH
;*************************************;
FD8F : 5F         clrb                ;clear B
FD90 : D7 0D      stab  $0D           ;store B in addr 0D
FD92 : 48         asla                ;arith shift left A
FD93 : 48         asla                ;arith shift left A 
FD94 : 8B 73      adda  #$73          ;add A with 73h (#WALSHT!.255)
FD96 : C9 FD      adcb  #$FD          ;add C+B + FDh (#WALSH/256)
FD98 : D7 0A      stab  $0A           ;store B in addr 0A
FD9A : 97 0B      staa  $0B           ;store A in addr 0B
FD9C : DE 0A      ldx  $0A            ;load X with addr 0A
FD9E : EE 00      ldx  $00,x          ;load X with X+00h
FDA0 : DF 08      stx  $08            ;store X in addr 08
FDA2 : DE 0A      ldx  $0A            ;load X with addr 0A
FDA4 : EE 02      ldx  $02,x          ;load X with addr X+02h
FDA6 : E6 00      ldab  $00,x         ;load B with addr X+00h
FDA8 : D7 0C      stab  $0C           ;store B in addr 0C
FDAA : 08         inx                 ;incr X
FDAB : DF 0A      stx  $0A            ;store X in addr 0A
FDAD : CE FD B5   ldx  #$FDB5         ;load X with FDB5h (#ODDTBL)
FDB0 : DF 0E      stx  $0E            ;store X in addr 0E
FDB2 : 7E F9 A9   jmp  LF9A9          ;jump WSM
;*************************************;
;* HARMONIC FUNCTIONS.  EACH BIT POSITION CORRESPONDS TO A WAVEFORM
;* POSITION.  IF THE BIT = 0, THE VALUE IS +1  IF THE BIT = 1, THE
;* VALUE IS -1.
;
;* THE HARMONICS ARE TREATED IN ORDER OF DECREASING AVERAGE FREQUENCY.
;*************************************;
;ODDTBL
FDB5 : 0000                           ;FDB %0000000000000000  0  CONSTANT IS WEIRDO FOR NOW 
FDB7 : 5555                           ;FDB %0101010101010101  8
FDB9 : AA55                           ;FDB %1010101001010101  7
FDBB : 5A5A                           ;FDB %0101101001011010  6
FDBD : 9669                           ;FDB %1001011001101001  5
FDBF : 6666                           ;FDB %0110011001100110  4
FDC1 : CC33                           ;FDB %1100110000110011  3
FDC3 : 3C3C                           ;FDB %0011110000111100  2
FDC5 : 0FF0                           ;FDB %0000111111110000  1
;*************************************;
;* WAVE PROGRAMS
;*************************************;
;NLIST
;
;LBL3
FDC7 : 53 80    " S "    subb  X5380
FDC9 : 10    " "    sba
FDCA : 8B 08    "  "    adda  #$08
FDCC : 06    " "    tap
        ;
FDCD : 04 02    "  "    db  $04, $02
        ;
FDCF : 69 28    "i("    rol  $28,x
FDD1 : 10    " "    sba
FDD2 : 80 F8    "  "    suba  #$F8
        ;
FDD4 : 62    "b"    db  $62
        ;
FDD5 : 23 10    "# "    bls  LFDE7
FDD7 : 88 00    "  "    eora  #$00
FDD9 : FA 63 1D    " c "    orab  X631D
FDDC : 10    " "    sba
FDDD : 88 FC    "  "    eora  #$FC
        ;
FDDF : 00    " "    db  $00
        ;
FDE0 : 63 17    "c "    com  $17,x
FDE2 : 10    " "    sba
FDE3 : 0B    " "    sev
        ;
FDE4 : FC FC    "  "    db  $FC, $FC
        ;
FDE6 : FE 69 10    " i "    ldx  X6910
FDE9 : 10    " "    sba
FDEA : 8A 00    "  "    oraa  #$00
FDEC : FE FA 66    "  f"    ldx  XFA66
FDEF : 09    " "    dex
        ;
FDF0 : 3C    "<"    db  $3C
        ;
FDF1 : 07    " "    tpa
        ;
FDF2 : FC    " "    db  $FC
        ;
FDF3 : 70 2D FF    "p- "    neg  X2DFF
FDF6 : FF FF FF    "   "    stx  XFFFF
FDF9 : FF FF FF    "   "    stx  XFFFF
FDFC : FF FF FF    "   "    stx  XFFFF
FDFF : 20 40    " @"    bra  LFE41
;LBL6
FE01 : 10    " "    sba
FE02 : 0F    " "    sei
        ;
FE03 : 02    " "    db  $02
        ;
FE04 : FE 02 FE    "   "    ldx  X02FE
FE07 : 2F 70    "/p"    ble  LFE79
        ;
FE09 : FD    " "    db  $FD
;LBL7
FE0A : 0F    " "    sei
FE0B : 28 10    "( "    bvc  LFE1D
FE0D : 74 02 02    "t  "    lsr  X0202
        ;
FE10 : 02 02    "  "    db  $02, $02
        ;
FE12 : 2F 10    "/ "    ble  LFE24
FE14        LFE14:
FE14 : 24 FE    "$ "    bcc  LFE14
FE16 : FE 2F 10    " / "    ldx  X2F10
FE19 : 50    "P"    negb
FE1A : FE FE 2F    "  /"    ldx  XFE2F
FE1D        LFE1D:
FE1D : 10    " "    sba
FE1E : 24 02    "$ "    bcc  LFE22
        ;
FE20 : 02    " "    db  $02
        ;
FE21 : 2F 55    "/U"    ble  LFE78
FE23 : 7E F5 B0    "~  "    jmp  LF5B0
;LBL1
FE26 : 0F    " "    sei
FE27 : 08    " "    inx
FE28 : 6F 10    "o "    clr  $10,x
FE2A : 6F 1D    "o "    clr  $1D,x
FE2C : 0B    " "    sev
FE2D : 28 0D    "( "    bvc  LFE3C
        ;
FE2F        XFE2F:
FE2F : 00    " "    db  $00
        ;
FE30 : 0C    " "    clc
FE31 : 28 0B    "( "    bvc  LFE3E
        ;
FE33 : 00    " "    db  $00
        ;
FE34 : 0D    " "    sec
FE35 : 28 0C    "( "    bvc  LFE43
        ;
FE37 : 00    " "    db  $00
        ;
FE38 : 70 F2 6F    "p o"    neg  XF26F
        ;
FE3B : 00    " "    db  $00
        ;
FE3C        LFE3C:
FE3C : 0B    " "    sev
        ;
FE3D : 05    " "    db  $05
        ;
FE3E        LFE3E:
FE3E : 0D    " "    sec
        ;
FE3F : 00    " "    db  $00
        ;
FE40 : 0C    " "    clc
        ;
FE41        LFE41:
FE41 : 05    " "    db  $05
        ;
FE42 : 0B    " "    sev
        ;
FE43        LFE43:
FE43 : 00    " "    db  $00
        ;
FE44 : 0D    " "    sec
        ;
FE45 : 05    " "    db  $05
        ;
FE46 : 0C    " "    clc
        ;
FE47 : 00    " "    db  $00
        ;
FE48 : 40    "@"    nega
FE49 : 6F 00    "o "    clr  $00,x
FE4B : 0B    " "    sev
FE4C : 0A    " "    clv
FE4D : 0D    " "    sec
        ;
FE4E : 00    " "    db  $00
        ;
FE4F : 0C    " "    clc
FE50 : 0A    " "    clv
FE51 : 0B    " "    sev
        ;
FE52        LFE52:
FE52 : 00    " "    db  $00
        ;
FE53 : 0D    " "    sec
FE54 : 0A    " "    clv
FE55 : 0C    " "    clc
        ;
FE56 : 00    " "    db  $00
        ;
FE57 : 40    "@"    nega
;LBL4
FE58 : 3C    "<"    db  $3C
        ;
FE59 : 81 70    " p"    cmpa  #$70
        ;
FE5B : FD    " "    db  $FD
;LBL8
FE5C : 2A 21    "*!"    bpl  LFE7F
        ;
FE5E : 00    " "    db  $00
        ;
FE5F : 01    " "    nop
FE60 : 2A F0    "* "    bpl  LFE52
FE62 : 01    " "    nop
        ;
FE63 : 1F    " "    db  $1F
        ;
FE64 : EB 01    "  "    addb  $01,x
FE66 : 19    " "    daa
FE67 : F5 70 F3    " p "    bitb  X70F3
;LBL2
FE6A : 19    " "    daa
FE6B : 20 28    " ("    bra  LFE95
        ;
FE6D : 81 70    " p"    cmpa  #$70
        ;
FE6F : FD    " "    db  $FD
;LBL5
FE70 : 37    "7"    pshb
FE71 : 2F 00    "/ "    ble  LFE73
FE73        LFE73:
FE73 : 01    " "    nop
FE74 : 37    "7"    pshb
FE75 : F5 01 2D    "  -"    bitb  X012D
FE78        LFE78:
FE78 : F5 01 46    "  F"    bitb  X0146
FE7B : FA 70 F5    " p "    orab  X70F5
;*************************************;
; synthZ-1 table 
FE7E : F6 F9 FC FF 3F C1              ;SZ1TAB
FE84 : 3F C1 FF FF FF FF              ;
;*************************************;
;
; last 3 synths of the system 3-7 boards ROMs
;
; synthZ-1
;*************************************;
;SYNTHZ1
FE8A : CE FE 7E   ldx  #$FE7E         ;load X with FE7Eh (SZ1TAB)
FE8D : C6 15      ldab  #$15          ;load B with 15h
FE8F : 4F         clra                ;clear A
FE90 : 97 0D      staa  $0D           ;store A in addr 0D
FE92 : D7 0E      stab  $0E           ;store B in addr 0E
FE94 : C6 0C      ldab  #$0C          ;load B with 0Ch
FE96 : BD F3 A8   jsr  LF3A8          ;jump sub TRANS
FE99 : 7C 00 04   inc  $0004          ;incr addr 0004
FE9C : D6 04      ldab  $04           ;load B with addr 04
;SZ1PRM - inc #1
FE9E : 96 15      ldaa  $15           ;load A with addr 15
FEA0 : 9B 1D      adda  $1D           ;add A with addr 1D
FEA2 : 97 15      staa  $15           ;store A in addr 15
;- inc #2
FEA4 : 96 16      ldaa  $16           ;load A with addr 16
FEA6 : 9B 1E      adda  $1E           ;add A with addr 1E
FEA8 : 97 16      staa  $16           ;store A in addr 16
;- inc #3
FEAA : 96 17      ldaa  $17           ;load A with addr 17
FEAC : 9B 1F      adda  $1F           ;add A with addr 1F
FEAE : 97 17      staa  $17           ;store A in addr 17
;- inc #4
FEB0 : 96 18      ldaa  $18           ;load A with addr 18
FEB2 : 9B 20      adda  $20           ;add A with addr 20
FEB4 : 97 18      staa  $18           ;store A in addr 18
;loop
FEB6 : 5A         decb                ;decr B
FEB7 : 26 E5      bne  LFE9E          ;branch Z=0 SZ1PRM
;SNZ1XLD - X load/store
FEB9 : DE 15      ldx  $15            ;load X with addr 15
FEBB : DF 11      stx  $11            ;store X in addr 11
FEBD : DE 17      ldx  $17            ;load X with addr 17
FEBF : DF 13      stx  $13            ;store X in addr 13
;SNZ1OUT
FEC1 : F7 04 00   stab  $0400         ;store B in DAC output SOUND
;Z1PROC1
FEC4 : 7A 00 11   dec  $0011          ;decr addr 11
FEC7 : 26 09      bne  LFED2          ;branch Z=0 Z1PROC2
FEC9 : 96 15      ldaa  $15           ;load A with addr 15
FECB : 97 11      staa  $11           ;store A in addr 11
FECD : 70 00 19   neg  $0019          ;negate addr 0019
FED0 : DB 19      addb  $19           ;add B with addr 19
;Z1PROC2
FED2 : 7A 00 12   dec  $0012          ;decr addr 12
FED5 : 26 09      bne  LFEE0          ;branch Z=0 Z1PROC3
FED7 : 96 16      ldaa  $16           ;load A with addr 16
FED9 : 97 12      staa  $12           ;store A in addr 12
FEDB : 70 00 1A   neg  $001A          ;negate addr 001A
FEDE : DB 1A      addb  $1A           ;add B with addr 1A
;Z1PROC3
FEE0 : 7A 00 13   dec  $0013          ;decr addr 13
FEE3 : 26 09      bne  LFEEE          ;branch Z=0 Z1PROC4
FEE5 : 96 17      ldaa  $17           ;load A with addr 17
FEE7 : 97 13      staa  $13           ;store A in addr 13
FEE9 : 70 00 1B   neg  $001B          ;negate addr 001B
FEEC : DB 1B      addb  $1B           ;add B with addr 1B
;Z1PROC4
FEEE : 7A 00 14   dec  $0014          ;decr addr 14
FEF1 : 26 CE      bne  LFEC1          ;branch Z=0 SNZ1OUT
FEF3 : 96 18      ldaa  $18           ;load A with addr 18
FEF5 : 97 14      staa  $14           ;store A in addr 14
FEF7 : 70 00 1C   neg  $001C          ;negate addr 001C
FEFA : DB 1C      addb  $1C           ;add B with addr 1C
;
FEFC : 7E FE C1   jmp  LFEC1          ;jump SNZ1OUT
;*************************************;
;synthZ-2 loader #1
;*************************************;
;7 bytes: A5 85 01 80 FF 0400
;SNZ2LD1
FEFF : 86 A5      ldaa  #$A5          ;load A with A5h
FF01 : 97 11      staa  $11           ;store A in addr 11
FF03 : 86 85      ldaa  #$85          ;load A with 85h
FF05 : 97 12      staa  $12           ;store A in addr 12
FF07 : 86 01      ldaa  #$01          ;load A with 01h
FF09 : 97 13      staa  $13           ;store A in addr 13
FF0B : 86 80      ldaa  #$80          ;load A with 80h
FF0D : 97 1D      staa  $1D           ;store A in addr 1D
FF0F : 86 FF      ldaa  #$FF          ;load A with FFh
FF11 : 97 14      staa  $14           ;store A in addr 14
FF13 : CE 04 00   ldx  #$0400         ;load X with 0400h
;*************************************;
;synthZ-2
;*************************************;
;SYNTHZ2
FF16 : DF 15      stx  $15            ;store X in addr 15
FF18 : 96 11      ldaa  $11           ;load A with addr 11
;Z2LP
FF1A : 48         asla                ;arith shift left A
FF1B : 24 02      bcc  LFF1F          ;branch C=0 SZ2OUT
FF1D : 98 12      eora  $12           ;exclusive or A with addr 12
;SZ2OUT
FF1F : B7 04 00   staa  $0400         ;store A in DAC output SOUND
FF22 : D6 13      ldab  $13           ;load B with addr 13
;SYNZ21
FF24 : 09         dex                 ;decr X
FF25 : 27 05      beq  LFF2C          ;branch Z=1 SYNZ22
FF27 : 5A         decb                ;decr B
FF28 : 26 FA      bne  LFF24          ;branch Z=0 SYNZ21
FF2A : 20 EE      bra  LFF1A          ;branch always Z2LP
;SYNZ22
FF2C : D6 13      ldab  $13           ;load B with addr 13
FF2E : D0 14      subb  $14           ;sub B with addr 14
FF30 : D7 13      stab  $13           ;store B in addr 13
FF32 : D1 1D      cmpb  $1D           ;compare B with 1D
FF34 : 27 04      beq  LFF3A          ;branch Z=1 SNZ2X
FF36 : DE 15      ldx  $15            ;load X with addr 15
FF38 : 20 E0      bra  LFF1A          ;branch always Z2LP
;SNZ2X
FF3A : 39         rts                 ;return subroutine
;*************************************;
;synthZ-2 loader #2
;*************************************;
;7 bytes: A5 85 03 80 FF 0300
;SNZ2LD2
FF3B : 86 A5      ldaa  #$A5          ;load A with A5h
FF3D : 97 11      staa  $11           ;store A in addr 11
FF3F : 86 85      ldaa  #$85          ;load A with 85h
FF41 : 97 12      staa  $12           ;store A in addr 12
FF43 : 86 03      ldaa  #$03          ;load A with 03h
FF45 : 97 13      staa  $13           ;store A in addr 13
FF47 : 86 80      ldaa  #$80          ;load A with 80h
FF49 : 97 1D      staa  $1D           ;store A in addr 1D
FF4B : 86 FF      ldaa  #$FF          ;load A with FFh
FF4D : 97 14      staa  $14           ;store A in addr 14
FF4F : CE 03 00   ldx  #$0300         ;load X with 0300h
FF52 : 20 C2      bra  LFF16
;*************************************;
;synthZ-3 loader #2
;*************************************;
;6 bytes: 01 01 6C FF 01 6C
;SNZ3LD2
FF54 : 86 01      ldaa  #$01          ;load A with 01h
FF56 : 97 19      staa  $19           ;store A in addr 19
FF58 : 86 01      ldaa  #$01          ;load A with 01h
FF5A : 97 1C      staa  $1C           ;store A in addr 1C
FF5C : 86 6C      ldaa  #$6C          ;load A with 6Ch
FF5E : 97 12      staa  $12           ;store A in addr 12
FF60 : 86 FF      ldaa  #$FF          ;load A with FFh
FF62 : 97 1B      staa  $1B           ;store A in addr 1B
FF64 : 86 01      ldaa  #$01          ;load A with 01h
FF66 : C6 6C      ldab  #$6C          ;load B with 6Ch
FF68 : 20 2A      bra  LFF94          ;branch always SYNTHZ3
;*************************************;
;synthZ-3 loader #3
;*************************************;
;6 bytes: 02 1D 01 C8 01 6C
;SNZ3LD3
FF6A : 86 02      ldaa  #$02          ;load A with 02h
FF6C : 97 19      staa  $19           ;store A in addr 19
FF6E : 86 1D      ldaa  #$1D          ;load A with 1Dh
FF70 : 97 12      staa  $12           ;store A in addr 12
FF72 : 86 01      ldaa  #$01          ;load A with 01h
FF74 : 97 1C      staa  $1C           ;store A in addr 1C
FF76 : 86 C8      ldaa  #$C8          ;load A with C8h
FF78 : 97 1B      staa  $1B           ;store A in addr 1B
FF7A : 86 01      ldaa  #$01          ;load A with 01h
FF7C : C6 6C      ldab  #$6C          ;load B with 6Ch
FF7E : 20 14      bra  LFF94          ;branch always SYNTHZ3
;*************************************;
;synthZ-3 loader #4
;*************************************;
;6 bytes: 01 1D 01 FF 01 6C
;SNZ3LD4
FF80 : 86 01      ldaa  #$01          ;load A with 01h
FF82 : 97 19      staa  $19           ;store A in addr 19
FF84 : 86 1D      ldaa  #$1D          ;load A with 1Dh
FF86 : 97 12      staa  $12           ;store A in addr 12
FF88 : 86 01      ldaa  #$01          ;load A with 01h
FF8A : 97 1C      staa  $1C           ;store A in addr 1C
FF8C : 86 FF      ldaa  #$FF          ;load A with FFh
FF8E : 97 1B      staa  $1B           ;store A in addr 1B
FF90 : 86 01      ldaa  #$01          ;load A with 01h
FF92 : C6 6C      ldab  #$6C          ;load B with 6Ch
;*************************************;
;synthZ-3
;*************************************;
;SYNTHZ3
FF94 : 97 18      staa  $18           ;store A in addr 18
FF96 : 7F 04 00   clr  $0400          ;clear DAC output SOUND
FF99 : 96 12      ldaa  $12           ;load A with addr 12
FF9B : D7 1A      stab  $1A           ;store B in addr 1A
;SZ3LP1
FF9D : D6 1A      ldab  $1A           ;load B with addr 1A
FF9F : D7 17      stab  $17           ;store B in addr 17
;SZ3LP2
FFA1 : 48         asla                ;arith shift left A
FFA2 : 24 0A      bcc  LFFAE          ;branch C=0 SZ3PRM
FFA4 : F6 04 00   ldab  $0400         ;load B with addr 0400 DAC
FFA7 : D8 1B      eorb  $1B           ;exclusive or B with addr 1B
FFA9 : F7 04 00   stab  $0400         ;store B in DAC output SOUND
FFAC : 98 12      eora  $12           ;exclusive or A with addr 12
;SZ3PRM
FFAE : D6 18      ldab  $18           ;load B with addr 18
;SZ3DEC
FFB0 : 5A         decb                ;decr B
FFB1 : 26 FD      bne  LFFB0          ;branch Z=0 SZ3DEC
;
FFB3 : 7A 00 17   dec  $0017          ;decr addr 0017
FFB6 : 26 E9      bne  LFFA1          ;branch Z=0 SZ3LP2
FFB8 : 7F 04 00   clr  $0400          ;clear DAC output SOUND
FFBB : D6 1B      ldab  $1B           ;load B with addr 1B
FFBD : D0 1C      subb  $1C           ;sub B with addr 1C
FFBF : D7 1B      stab  $1B           ;store B in addr 1B
FFC1 : 27 08      beq  LFFCB          ;branch Z=1 SYNZ3X
FFC3 : D6 18      ldab  $18           ;load B with addr 18
FFC5 : DB 19      addb  $19           ;add B with addr 19
FFC7 : D7 18      stab  $18           ;store B in addr 18
FFC9 : 26 D2      bne  LFF9D          ;branch Z=0 SZ3LP1
;SYNZ3X
FFCB : 39         rts                 ;return subroutine
;*************************************;
;zero padding
FFCC : 00 00 00 00 00 00 00 00 
FFD4 : 00 00 00 00 00 00 00 00 
FFDC : 00 00 00 00 00 00 00 00 
FFE4 : 00 00 00 00 00 00 00 00 
FFEC : 00 00 00 00 00 00 00 00 
FFF4 : 00 00 00 00 
;*************************************;
;Motorola vector table
;*************************************;
FFF8 : F5 54                          ;IRQ   
FFFA : F0 1D                          ;RESET SWI (software)   
FFFC : F5 D1                          ;NMI  
FFFE : F0 1D                          ;RESET (hardware) 

;--------------------------------------------------------------





