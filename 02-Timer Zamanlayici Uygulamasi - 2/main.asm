
_wait:

;function.c,1 :: 		void wait(unsigned int time){
;function.c,4 :: 		for(i=0;i<time;i++){
	CLRF        R1 
	CLRF        R2 
L_wait0:
	MOVF        FARG_wait_time+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wait86
	MOVF        FARG_wait_time+0, 0 
	SUBWF       R1, 0 
L__wait86:
	BTFSC       STATUS+0, 0 
	GOTO        L_wait1
;function.c,5 :: 		delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_wait3:
	DECFSZ      R13, 1, 1
	BRA         L_wait3
	DECFSZ      R12, 1, 1
	BRA         L_wait3
	NOP
;function.c,6 :: 		asm clrwdt;
	CLRWDT
;function.c,4 :: 		for(i=0;i<time;i++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;function.c,7 :: 		}
	GOTO        L_wait0
L_wait1:
;function.c,8 :: 		}
L_end_wait:
	RETURN      0
; end of _wait

_UpdateExternalPorts:

;function.c,10 :: 		void UpdateExternalPorts(){
;function.c,13 :: 		if(LATI==0b00000000)
	MOVF        _LATI+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts4
;function.c,14 :: 		LATI=0b00000001;
	MOVLW       1
	MOVWF       _LATI+0 
L_UpdateExternalPorts4:
;function.c,16 :: 		ST_CP=0;
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;function.c,17 :: 		SH_CP=0;
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,18 :: 		DS=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;function.c,21 :: 		buffer=LATF;
	MOVF        _LATF+0, 0 
	MOVWF       R2 
;function.c,22 :: 		for(i=0;i<8;i++){
	CLRF        R1 
L_UpdateExternalPorts5:
	MOVLW       8
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UpdateExternalPorts6
;function.c,23 :: 		if(buffer.B7)
	BTFSS       R2, 7 
	GOTO        L_UpdateExternalPorts8
;function.c,24 :: 		DS=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
	GOTO        L_UpdateExternalPorts9
L_UpdateExternalPorts8:
;function.c,26 :: 		DS=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
L_UpdateExternalPorts9:
;function.c,28 :: 		SH_CP=1;
	BSF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,29 :: 		asm nop;
	NOP
;function.c,30 :: 		SH_CP=0;
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,32 :: 		buffer<<=1;
	RLCF        R2, 1 
	BCF         R2, 0 
;function.c,22 :: 		for(i=0;i<8;i++){
	INCF        R1, 1 
;function.c,33 :: 		}
	GOTO        L_UpdateExternalPorts5
L_UpdateExternalPorts6:
;function.c,36 :: 		buffer=LATG;
	MOVF        _LATG+0, 0 
	MOVWF       R2 
;function.c,37 :: 		for(i=0;i<8;i++){
	CLRF        R1 
L_UpdateExternalPorts10:
	MOVLW       8
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UpdateExternalPorts11
;function.c,38 :: 		if(buffer.B7)
	BTFSS       R2, 7 
	GOTO        L_UpdateExternalPorts13
;function.c,39 :: 		DS=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
	GOTO        L_UpdateExternalPorts14
L_UpdateExternalPorts13:
;function.c,41 :: 		DS=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
L_UpdateExternalPorts14:
;function.c,43 :: 		SH_CP=1;
	BSF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,44 :: 		asm nop;
	NOP
;function.c,45 :: 		SH_CP=0;
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,47 :: 		buffer<<=1;
	RLCF        R2, 1 
	BCF         R2, 0 
;function.c,37 :: 		for(i=0;i<8;i++){
	INCF        R1, 1 
;function.c,48 :: 		}
	GOTO        L_UpdateExternalPorts10
L_UpdateExternalPorts11:
;function.c,51 :: 		buffer=LATH;
	MOVF        _LATH+0, 0 
	MOVWF       R2 
;function.c,52 :: 		for(i=0;i<8;i++){
	CLRF        R1 
L_UpdateExternalPorts15:
	MOVLW       8
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UpdateExternalPorts16
;function.c,53 :: 		if(buffer.B7)
	BTFSS       R2, 7 
	GOTO        L_UpdateExternalPorts18
;function.c,54 :: 		DS=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
	GOTO        L_UpdateExternalPorts19
L_UpdateExternalPorts18:
;function.c,56 :: 		DS=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
L_UpdateExternalPorts19:
;function.c,58 :: 		SH_CP=1;
	BSF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,59 :: 		asm nop;
	NOP
;function.c,60 :: 		SH_CP=0;
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,62 :: 		buffer<<=1;
	RLCF        R2, 1 
	BCF         R2, 0 
;function.c,52 :: 		for(i=0;i<8;i++){
	INCF        R1, 1 
;function.c,63 :: 		}
	GOTO        L_UpdateExternalPorts15
L_UpdateExternalPorts16:
;function.c,66 :: 		buffer=LATI;
	MOVF        _LATI+0, 0 
	MOVWF       R2 
;function.c,67 :: 		for(i=0;i<8;i++){
	CLRF        R1 
L_UpdateExternalPorts20:
	MOVLW       8
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UpdateExternalPorts21
;function.c,68 :: 		if(buffer.B7)
	BTFSS       R2, 7 
	GOTO        L_UpdateExternalPorts23
;function.c,69 :: 		DS=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
	GOTO        L_UpdateExternalPorts24
L_UpdateExternalPorts23:
;function.c,71 :: 		DS=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
L_UpdateExternalPorts24:
;function.c,73 :: 		SH_CP=1;
	BSF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,74 :: 		asm nop;
	NOP
;function.c,75 :: 		SH_CP=0;
	BCF         LATE2_bit+0, BitPos(LATE2_bit+0) 
;function.c,77 :: 		buffer<<=1;
	RLCF        R2, 1 
	BCF         R2, 0 
;function.c,67 :: 		for(i=0;i<8;i++){
	INCF        R1, 1 
;function.c,78 :: 		}
	GOTO        L_UpdateExternalPorts20
L_UpdateExternalPorts21:
;function.c,79 :: 		ST_CP=1;
	BSF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;function.c,80 :: 		asm nop;
	NOP
;function.c,81 :: 		ST_CP=0;
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;function.c,83 :: 		switch(LATI){
	GOTO        L_UpdateExternalPorts25
;function.c,84 :: 		case 0b00000001:
L_UpdateExternalPorts27:
;function.c,85 :: 		PORTI0_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts88
	BCF         _PORTI+0, 0 
	GOTO        L__UpdateExternalPorts89
L__UpdateExternalPorts88:
	BSF         _PORTI+0, 0 
L__UpdateExternalPorts89:
;function.c,86 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,87 :: 		case 0b00000010:
L_UpdateExternalPorts28:
;function.c,88 :: 		PORTI1_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts90
	BCF         _PORTI+0, 1 
	GOTO        L__UpdateExternalPorts91
L__UpdateExternalPorts90:
	BSF         _PORTI+0, 1 
L__UpdateExternalPorts91:
;function.c,89 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,90 :: 		case 0b00000100:
L_UpdateExternalPorts29:
;function.c,91 :: 		PORTI2_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts92
	BCF         _PORTI+0, 2 
	GOTO        L__UpdateExternalPorts93
L__UpdateExternalPorts92:
	BSF         _PORTI+0, 2 
L__UpdateExternalPorts93:
;function.c,92 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,93 :: 		case 0b00001000:
L_UpdateExternalPorts30:
;function.c,94 :: 		PORTI3_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts94
	BCF         _PORTI+0, 3 
	GOTO        L__UpdateExternalPorts95
L__UpdateExternalPorts94:
	BSF         _PORTI+0, 3 
L__UpdateExternalPorts95:
;function.c,95 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,96 :: 		case 0b00010000:
L_UpdateExternalPorts31:
;function.c,97 :: 		PORTI4_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts96
	BCF         _PORTI+0, 4 
	GOTO        L__UpdateExternalPorts97
L__UpdateExternalPorts96:
	BSF         _PORTI+0, 4 
L__UpdateExternalPorts97:
;function.c,98 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,99 :: 		case 0b00100000:
L_UpdateExternalPorts32:
;function.c,100 :: 		PORTI5_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts98
	BCF         _PORTI+0, 5 
	GOTO        L__UpdateExternalPorts99
L__UpdateExternalPorts98:
	BSF         _PORTI+0, 5 
L__UpdateExternalPorts99:
;function.c,101 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,102 :: 		case 0b01000000:
L_UpdateExternalPorts33:
;function.c,103 :: 		PORTI6_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts100
	BCF         _PORTI+0, 6 
	GOTO        L__UpdateExternalPorts101
L__UpdateExternalPorts100:
	BSF         _PORTI+0, 6 
L__UpdateExternalPorts101:
;function.c,104 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,105 :: 		case 0b10000000:
L_UpdateExternalPorts34:
;function.c,106 :: 		PORTI7_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts102
	BCF         _PORTI+0, 7 
	GOTO        L__UpdateExternalPorts103
L__UpdateExternalPorts102:
	BSF         _PORTI+0, 7 
L__UpdateExternalPorts103:
;function.c,107 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,108 :: 		}
L_UpdateExternalPorts25:
	MOVF        _LATI+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts27
	MOVF        _LATI+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts28
	MOVF        _LATI+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts29
	MOVF        _LATI+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts30
	MOVF        _LATI+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts31
	MOVF        _LATI+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts32
	MOVF        _LATI+0, 0 
	XORLW       64
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts33
	MOVF        _LATI+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateExternalPorts34
L_UpdateExternalPorts26:
;function.c,109 :: 		LATI<<=1;
	RLCF        _LATI+0, 1 
	BCF         _LATI+0, 0 
;function.c,110 :: 		}
L_end_UpdateExternalPorts:
	RETURN      0
; end of _UpdateExternalPorts

_getChar:

;display.c,1 :: 		char getChar(char c){
;display.c,2 :: 		switch(c){
	GOTO        L_getChar35
;display.c,3 :: 		case 'A': return 0xDE;
L_getChar37:
	MOVLW       222
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,4 :: 		case 'B': return 0xF4;
L_getChar38:
	MOVLW       244
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,5 :: 		case 'C': return 0xB8;
L_getChar39:
	MOVLW       184
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,6 :: 		case 'D': return 0xE6;
L_getChar40:
	MOVLW       230
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,7 :: 		case 'E': return 0xF8;
L_getChar41:
	MOVLW       248
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,8 :: 		case 'F': return 0xD8;
L_getChar42:
	MOVLW       216
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,9 :: 		case 'G': return 0xBC;
L_getChar43:
	MOVLW       188
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,10 :: 		case 'H': return 0xD6;
L_getChar44:
	MOVLW       214
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,11 :: 		case 'I': return 0x06;
L_getChar45:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,12 :: 		case 'J': return 0xA6;
L_getChar46:
	MOVLW       166
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,13 :: 		case 'K': return 0xD4;
L_getChar47:
	MOVLW       212
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,14 :: 		case 'L': return 0xB0;
L_getChar48:
	MOVLW       176
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,15 :: 		case 'M': return 0xCC;
L_getChar49:
	MOVLW       204
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,16 :: 		case 'N': return 0xC4;
L_getChar50:
	MOVLW       196
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,17 :: 		case 'O': return 0xE4;
L_getChar51:
	MOVLW       228
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,18 :: 		case 'P': return 0xDA;
L_getChar52:
	MOVLW       218
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,19 :: 		case 'Q': return 0x5E;
L_getChar53:
	MOVLW       94
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,20 :: 		case 'R': return 0xC0;
L_getChar54:
	MOVLW       192
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,21 :: 		case 'S': return 0x7C;
L_getChar55:
	MOVLW       124
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,22 :: 		case 'T': return 0xF0;
L_getChar56:
	MOVLW       240
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,23 :: 		case 'U': return 0xB6;
L_getChar57:
	MOVLW       182
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,24 :: 		case 'V': return 0xA4;
L_getChar58:
	MOVLW       164
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,25 :: 		case 'Y': return 0x76;
L_getChar59:
	MOVLW       118
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,26 :: 		case 'Z': return 0xEA;
L_getChar60:
	MOVLW       234
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,27 :: 		case '0': return 0xBE;
L_getChar61:
	MOVLW       190
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,28 :: 		case '1': return 0x06;
L_getChar62:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,29 :: 		case '2': return 0xEA;
L_getChar63:
	MOVLW       234
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,30 :: 		case '3': return 0x6E;
L_getChar64:
	MOVLW       110
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,31 :: 		case '4': return 0x56;
L_getChar65:
	MOVLW       86
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,32 :: 		case '5': return 0x7C;
L_getChar66:
	MOVLW       124
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,33 :: 		case '6': return 0xFC;
L_getChar67:
	MOVLW       252
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,34 :: 		case '7': return 0x0E;
L_getChar68:
	MOVLW       14
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,35 :: 		case '8': return 0xFE;
L_getChar69:
	MOVLW       254
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,36 :: 		case '9': return 0x7E;
L_getChar70:
	MOVLW       126
	MOVWF       R0 
	GOTO        L_end_getChar
;display.c,37 :: 		case ' ': return 0x00;
L_getChar71:
	CLRF        R0 
	GOTO        L_end_getChar
;display.c,38 :: 		}
L_getChar35:
	MOVF        FARG_getChar_c+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar37
	MOVF        FARG_getChar_c+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar38
	MOVF        FARG_getChar_c+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar39
	MOVF        FARG_getChar_c+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar40
	MOVF        FARG_getChar_c+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar41
	MOVF        FARG_getChar_c+0, 0 
	XORLW       70
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar42
	MOVF        FARG_getChar_c+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar43
	MOVF        FARG_getChar_c+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar44
	MOVF        FARG_getChar_c+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar45
	MOVF        FARG_getChar_c+0, 0 
	XORLW       74
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar46
	MOVF        FARG_getChar_c+0, 0 
	XORLW       75
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar47
	MOVF        FARG_getChar_c+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar48
	MOVF        FARG_getChar_c+0, 0 
	XORLW       77
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar49
	MOVF        FARG_getChar_c+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar50
	MOVF        FARG_getChar_c+0, 0 
	XORLW       79
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar51
	MOVF        FARG_getChar_c+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar52
	MOVF        FARG_getChar_c+0, 0 
	XORLW       81
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar53
	MOVF        FARG_getChar_c+0, 0 
	XORLW       82
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar54
	MOVF        FARG_getChar_c+0, 0 
	XORLW       83
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar55
	MOVF        FARG_getChar_c+0, 0 
	XORLW       84
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar56
	MOVF        FARG_getChar_c+0, 0 
	XORLW       85
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar57
	MOVF        FARG_getChar_c+0, 0 
	XORLW       86
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar58
	MOVF        FARG_getChar_c+0, 0 
	XORLW       89
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar59
	MOVF        FARG_getChar_c+0, 0 
	XORLW       90
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar60
	MOVF        FARG_getChar_c+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar61
	MOVF        FARG_getChar_c+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar62
	MOVF        FARG_getChar_c+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar63
	MOVF        FARG_getChar_c+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar64
	MOVF        FARG_getChar_c+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar65
	MOVF        FARG_getChar_c+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar66
	MOVF        FARG_getChar_c+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar67
	MOVF        FARG_getChar_c+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar68
	MOVF        FARG_getChar_c+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar69
	MOVF        FARG_getChar_c+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar70
	MOVF        FARG_getChar_c+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_getChar71
;display.c,39 :: 		return 0;
	CLRF        R0 
;display.c,40 :: 		}
L_end_getChar:
	RETURN      0
; end of _getChar

_PrintText:

;display.c,42 :: 		void PrintText(char *str){
;display.c,43 :: 		LATF=getChar(str[0]);
	MOVFF       FARG_PrintText_str+0, FSR0L+0
	MOVFF       FARG_PrintText_str+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_getChar_c+0 
	CALL        _getChar+0, 0
	MOVF        R0, 0 
	MOVWF       _LATF+0 
;display.c,44 :: 		LATG=getChar(str[1]);
	MOVLW       1
	ADDWF       FARG_PrintText_str+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_PrintText_str+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_getChar_c+0 
	CALL        _getChar+0, 0
	MOVF        R0, 0 
	MOVWF       _LATG+0 
;display.c,45 :: 		}
L_end_PrintText:
	RETURN      0
; end of _PrintText

_PrintInt:

;display.c,46 :: 		void PrintInt(unsigned short number){
;display.c,48 :: 		if(number>99)
	MOVF        FARG_PrintInt_number+0, 0 
	SUBLW       99
	BTFSC       STATUS+0, 0 
	GOTO        L_PrintInt72
;display.c,49 :: 		number=number%100;
	MOVLW       100
	MOVWF       R4 
	MOVF        FARG_PrintInt_number+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_PrintInt_number+0 
L_PrintInt72:
;display.c,51 :: 		LATF=getChar(number/10+48);
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_PrintInt_number+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_getChar_c+0 
	CALL        _getChar+0, 0
	MOVF        R0, 0 
	MOVWF       _LATF+0 
;display.c,52 :: 		LATG=getChar(number%10+48);
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_PrintInt_number+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_getChar_c+0 
	CALL        _getChar+0, 0
	MOVF        R0, 0 
	MOVWF       _LATG+0 
;display.c,53 :: 		}
L_end_PrintInt:
	RETURN      0
; end of _PrintInt

_InitTimer0:

;initialize.c,2 :: 		void InitTimer0(){
;initialize.c,3 :: 		T0CON	 = 0x87;
	MOVLW       135
	MOVWF       T0CON+0 
;initialize.c,4 :: 		TMR0H	 = 0x48;
	MOVLW       72
	MOVWF       TMR0H+0 
;initialize.c,5 :: 		TMR0L	 = 0xE5;
	MOVLW       229
	MOVWF       TMR0L+0 
;initialize.c,6 :: 		GIE_bit	 = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;initialize.c,7 :: 		TMR0IE_bit	 = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;initialize.c,8 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer2:

;initialize.c,11 :: 		void InitTimer2(){
;initialize.c,12 :: 		T2CON	 = 0x76;
	MOVLW       118
	MOVWF       T2CON+0 
;initialize.c,13 :: 		TMR2IE_bit	 = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;initialize.c,14 :: 		PR2		 = 250;
	MOVLW       250
	MOVWF       PR2+0 
;initialize.c,15 :: 		INTCON	 = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;initialize.c,16 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitMCU:

;initialize.c,18 :: 		void InitMCU(){
;initialize.c,20 :: 		TRISA=0b00101010;// [][][DIPSW][LED][TRIMPOT2][BUZZER][TRIMPOT1][RELAY]
	MOVLW       42
	MOVWF       TRISA+0 
;initialize.c,21 :: 		TRISB=0b11100100;// [BUTTON_ESC][BUTTON_DOWN][BUTTON_UP][IN4][DS][BUTTON_MENU][][]
	MOVLW       228
	MOVWF       TRISB+0 
;initialize.c,22 :: 		TRISC=0b10000001;// [RXD][TXD][][][][LEDG-IN3][EXT_OUT][EXT_IN]
	MOVLW       129
	MOVWF       TRISC+0 
;initialize.c,23 :: 		TRISD=0b00000000;// [LCD_RS][LCD_EN][LCD_D4][LCD_D5][LCD_D6][LCD_D7][LEDB-IN1][LEDR-IN2]
	CLRF        TRISD+0 
;initialize.c,24 :: 		TRISE=0b00000000;// [][][][][][SH_CP][ST_CP][DS18B20]
	CLRF        TRISE+0 
;initialize.c,27 :: 		ANSELA=0b00001010;// [][][][][TRIMPOT2][][TRIMPOT1][]
	MOVLW       10
	MOVWF       ANSELA+0 
;initialize.c,28 :: 		ANSELB=0b00000000;// [][][][][][][][]
	CLRF        ANSELB+0 
;initialize.c,29 :: 		ANSELC=0b00000000;// [][][][][][][][]
	CLRF        ANSELC+0 
;initialize.c,30 :: 		ANSELD=0b00000000;// [][][][][][][][]
	CLRF        ANSELD+0 
;initialize.c,31 :: 		ANSELE=0b00000000;// [][][][][][][][]
	CLRF        ANSELE+0 
;initialize.c,34 :: 		LATA=0x00;
	CLRF        LATA+0 
;initialize.c,35 :: 		LATB=0x00;
	CLRF        LATB+0 
;initialize.c,36 :: 		LATC=0x00;
	CLRF        LATC+0 
;initialize.c,37 :: 		LATD=0x00;
	CLRF        LATD+0 
;initialize.c,38 :: 		LATE=0x00;
	CLRF        LATE+0 
;initialize.c,41 :: 		InitTimer2();
	CALL        _InitTimer2+0, 0
;initialize.c,42 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;initialize.c,45 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;initialize.c,48 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;initialize.c,49 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;initialize.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;initialize.c,51 :: 		}
L_end_InitMCU:
	RETURN      0
; end of _InitMCU

_Interrupt:

;interrupt.c,1 :: 		void Interrupt(){
;interrupt.c,3 :: 		if (TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_Interrupt73
;interrupt.c,4 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;interrupt.c,6 :: 		UpdateExternalPorts();
	CALL        _UpdateExternalPorts+0, 0
;interrupt.c,7 :: 		}
L_Interrupt73:
;interrupt.c,10 :: 		if (TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_Interrupt74
;interrupt.c,11 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;interrupt.c,12 :: 		TMR0H         = 0x48;
	MOVLW       72
	MOVWF       TMR0H+0 
;interrupt.c,13 :: 		TMR0L         = 0xE5;
	MOVLW       229
	MOVWF       TMR0L+0 
;interrupt.c,16 :: 		if(direction)     // Eger yön artan ise -> if(direction) ile if(direction==1) kullanimi aynidir.
	MOVF        _direction+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt75
;interrupt.c,17 :: 		number++;       // bir arttir
	INCF        _number+0, 1 
	GOTO        L_Interrupt76
L_Interrupt75:
;interrupt.c,19 :: 		number--;       // bir azalt
	DECF        _number+0, 1 
L_Interrupt76:
;interrupt.c,21 :: 		if(number==10)    // sayi 10 ise
	MOVF        _number+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt77
;interrupt.c,22 :: 		direction=0;    // Yonu azalan olarak degistir
	CLRF        _direction+0 
L_Interrupt77:
;interrupt.c,23 :: 		if(number==0)     // sayi 0 ise
	MOVF        _number+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt78
;interrupt.c,24 :: 		direction=1;    // Yonu artan olarak degistir
	MOVLW       1
	MOVWF       _direction+0 
L_Interrupt78:
;interrupt.c,25 :: 		}
L_Interrupt74:
;interrupt.c,26 :: 		}
L_end_Interrupt:
L__Interrupt111:
	RETFIE      1
; end of _Interrupt

_ReadDS18B20:

;ds18b20.c,7 :: 		float ReadDS18B20(){
;ds18b20.c,8 :: 		signed short sign=1;
	MOVLW       1
	MOVWF       ReadDS18B20_sign_L0+0 
;ds18b20.c,13 :: 		Ow_Reset(&PORTE,0);             // Reset
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Reset_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Reset_port+1 
	CLRF        FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;ds18b20.c,14 :: 		Ow_Write(&PORTE,0,0xCC);        // Skip ROM
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.c,15 :: 		Ow_Write(&PORTE,0,0x44);        // Convert Temperature
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       68
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.c,16 :: 		Delay_us(120);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_ReadDS18B2079:
	DECFSZ      R13, 1, 1
	BRA         L_ReadDS18B2079
	DECFSZ      R12, 1, 1
	BRA         L_ReadDS18B2079
	NOP
	NOP
;ds18b20.c,18 :: 		Ow_Reset(&PORTE,0);             // Reset
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Reset_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Reset_port+1 
	CLRF        FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;ds18b20.c,19 :: 		Ow_Write(&PORTE,0,0xCC);        // Skip ROM
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.c,20 :: 		Ow_Write(&PORTE,0,0xBE);        // Read Scratchpad
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       190
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;ds18b20.c,22 :: 		tempDataLSB=Ow_Read(&PORTE,0);    // Read LSB
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Read_port+1 
	CLRF        FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadDS18B20_tempDataLSB_L0+0 
;ds18b20.c,23 :: 		tempDataMSB=Ow_Read(&PORTE,0);    // Read MSB
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Read_port+1 
	CLRF        FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
;ds18b20.c,25 :: 		tempData=tempDataMSB;
	MOVF        R0, 0 
	MOVWF       ReadDS18B20_tempData_L0+0 
	MOVLW       0
	MOVWF       ReadDS18B20_tempData_L0+1 
;ds18b20.c,26 :: 		tempData<<=8;
	MOVF        ReadDS18B20_tempData_L0+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	MOVWF       ReadDS18B20_tempData_L0+0 
	MOVF        R1, 0 
	MOVWF       ReadDS18B20_tempData_L0+1 
;ds18b20.c,27 :: 		tempData+=tempDataLSB;
	MOVF        ReadDS18B20_tempDataLSB_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       ReadDS18B20_tempData_L0+0 
	MOVF        R3, 0 
	MOVWF       ReadDS18B20_tempData_L0+1 
;ds18b20.c,30 :: 		if(tempData>0xF800){
	MOVF        R3, 0 
	SUBLW       248
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadDS18B20113
	MOVF        R2, 0 
	SUBLW       0
L__ReadDS18B20113:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadDS18B2080
;ds18b20.c,31 :: 		tempData=~tempData+1;
	COMF        ReadDS18B20_tempData_L0+0, 1 
	COMF        ReadDS18B20_tempData_L0+1, 1 
	INFSNZ      ReadDS18B20_tempData_L0+0, 1 
	INCF        ReadDS18B20_tempData_L0+1, 1 
;ds18b20.c,32 :: 		sign=-1;
	MOVLW       255
	MOVWF       ReadDS18B20_sign_L0+0 
;ds18b20.c,33 :: 		}
L_ReadDS18B2080:
;ds18b20.c,35 :: 		temperature = (tempData>>4);
	MOVF        ReadDS18B20_tempData_L0+0, 0 
	MOVWF       R0 
	MOVF        ReadDS18B20_tempData_L0+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__ReadDS18B20+0 
	MOVF        R1, 0 
	MOVWF       FLOC__ReadDS18B20+1 
	MOVF        R2, 0 
	MOVWF       FLOC__ReadDS18B20+2 
	MOVF        R3, 0 
	MOVWF       FLOC__ReadDS18B20+3 
	MOVLW       15
	ANDWF       ReadDS18B20_tempData_L0+0, 0 
	MOVWF       R0 
	MOVF        ReadDS18B20_tempData_L0+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
;ds18b20.c,36 :: 		temperature+= 0.0625*(tempData&0x000F);
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__ReadDS18B20+0, 0 
	MOVWF       R4 
	MOVF        FLOC__ReadDS18B20+1, 0 
	MOVWF       R5 
	MOVF        FLOC__ReadDS18B20+2, 0 
	MOVWF       R6 
	MOVF        FLOC__ReadDS18B20+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__ReadDS18B20+0 
	MOVF        R1, 0 
	MOVWF       FLOC__ReadDS18B20+1 
	MOVF        R2, 0 
	MOVWF       FLOC__ReadDS18B20+2 
	MOVF        R3, 0 
	MOVWF       FLOC__ReadDS18B20+3 
	MOVF        ReadDS18B20_sign_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       ReadDS18B20_sign_L0+0, 7 
	MOVLW       255
	MOVWF       R1 
	CALL        _int2double+0, 0
;ds18b20.c,38 :: 		return (float)sign*temperature;
	MOVF        FLOC__ReadDS18B20+0, 0 
	MOVWF       R4 
	MOVF        FLOC__ReadDS18B20+1, 0 
	MOVWF       R5 
	MOVF        FLOC__ReadDS18B20+2, 0 
	MOVWF       R6 
	MOVF        FLOC__ReadDS18B20+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;ds18b20.c,39 :: 		}
L_end_ReadDS18B20:
	RETURN      0
; end of _ReadDS18B20

_main:

;main.c,14 :: 		void main() {
;main.c,15 :: 		InitMCU();
	CALL        _InitMCU+0, 0
;main.c,17 :: 		while(1){
L_main81:
;main.c,18 :: 		Lcd_Out(1,1,"2.TMR0 Zamanlayici");    // Ekranda 1.satir 1.sütundan itibaren yaz
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,20 :: 		if(!BUTTON_MENU)                     // Eger Menu butonuna basilirsa
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main83
;main.c,21 :: 		number=0;                          // sayiyi sifir yap
	CLRF        _number+0 
L_main83:
;main.c,23 :: 		PrintInt(number);                    // 7 Segment ekrana sayiyi yazdir
	MOVF        _number+0, 0 
	MOVWF       FARG_PrintInt_number+0 
	CALL        _PrintInt+0, 0
;main.c,24 :: 		delay_ms(50);                        // 50ms bekleme
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main84:
	DECFSZ      R13, 1, 1
	BRA         L_main84
	DECFSZ      R12, 1, 1
	BRA         L_main84
	DECFSZ      R11, 1, 1
	BRA         L_main84
	NOP
	NOP
;main.c,25 :: 		}
	GOTO        L_main81
;main.c,26 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
