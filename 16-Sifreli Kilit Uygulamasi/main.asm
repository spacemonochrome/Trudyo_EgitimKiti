
_wait:

;function.c,1 :: 		void wait(unsigned int time){
;function.c,4 :: 		for(i=0;i<time;i++){
	CLRF        R1 
	CLRF        R2 
L_wait0:
	MOVF        FARG_wait_time+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__wait121
	MOVF        FARG_wait_time+0, 0 
	SUBWF       R1, 0 
L__wait121:
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
	GOTO        L__UpdateExternalPorts123
	BCF         _PORTI+0, 0 
	GOTO        L__UpdateExternalPorts124
L__UpdateExternalPorts123:
	BSF         _PORTI+0, 0 
L__UpdateExternalPorts124:
;function.c,86 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,87 :: 		case 0b00000010:
L_UpdateExternalPorts28:
;function.c,88 :: 		PORTI1_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts125
	BCF         _PORTI+0, 1 
	GOTO        L__UpdateExternalPorts126
L__UpdateExternalPorts125:
	BSF         _PORTI+0, 1 
L__UpdateExternalPorts126:
;function.c,89 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,90 :: 		case 0b00000100:
L_UpdateExternalPorts29:
;function.c,91 :: 		PORTI2_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts127
	BCF         _PORTI+0, 2 
	GOTO        L__UpdateExternalPorts128
L__UpdateExternalPorts127:
	BSF         _PORTI+0, 2 
L__UpdateExternalPorts128:
;function.c,92 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,93 :: 		case 0b00001000:
L_UpdateExternalPorts30:
;function.c,94 :: 		PORTI3_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts129
	BCF         _PORTI+0, 3 
	GOTO        L__UpdateExternalPorts130
L__UpdateExternalPorts129:
	BSF         _PORTI+0, 3 
L__UpdateExternalPorts130:
;function.c,95 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,96 :: 		case 0b00010000:
L_UpdateExternalPorts31:
;function.c,97 :: 		PORTI4_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts131
	BCF         _PORTI+0, 4 
	GOTO        L__UpdateExternalPorts132
L__UpdateExternalPorts131:
	BSF         _PORTI+0, 4 
L__UpdateExternalPorts132:
;function.c,98 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,99 :: 		case 0b00100000:
L_UpdateExternalPorts32:
;function.c,100 :: 		PORTI5_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts133
	BCF         _PORTI+0, 5 
	GOTO        L__UpdateExternalPorts134
L__UpdateExternalPorts133:
	BSF         _PORTI+0, 5 
L__UpdateExternalPorts134:
;function.c,101 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,102 :: 		case 0b01000000:
L_UpdateExternalPorts33:
;function.c,103 :: 		PORTI6_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts135
	BCF         _PORTI+0, 6 
	GOTO        L__UpdateExternalPorts136
L__UpdateExternalPorts135:
	BSF         _PORTI+0, 6 
L__UpdateExternalPorts136:
;function.c,104 :: 		break;
	GOTO        L_UpdateExternalPorts26
;function.c,105 :: 		case 0b10000000:
L_UpdateExternalPorts34:
;function.c,106 :: 		PORTI7_bit=DIPSW;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L__UpdateExternalPorts137
	BCF         _PORTI+0, 7 
	GOTO        L__UpdateExternalPorts138
L__UpdateExternalPorts137:
	BSF         _PORTI+0, 7 
L__UpdateExternalPorts138:
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

_InitTimer2:

;initialize.c,2 :: 		void InitTimer2(){
;initialize.c,3 :: 		T2CON	 = 0x76;
	MOVLW       118
	MOVWF       T2CON+0 
;initialize.c,4 :: 		TMR2IE_bit	 = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;initialize.c,5 :: 		PR2		 = 250;
	MOVLW       250
	MOVWF       PR2+0 
;initialize.c,6 :: 		INTCON	 = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;initialize.c,7 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitMCU:

;initialize.c,9 :: 		void InitMCU(){
;initialize.c,11 :: 		TRISA=0b00101010;// [][][DIPSW][LED][TRIMPOT2][BUZZER][TRIMPOT1][RELAY]
	MOVLW       42
	MOVWF       TRISA+0 
;initialize.c,12 :: 		TRISB=0b11100100;// [BUTTON_ESC][BUTTON_DOWN][BUTTON_UP][IN4][DS][BUTTON_MENU][][]
	MOVLW       228
	MOVWF       TRISB+0 
;initialize.c,13 :: 		TRISC=0b10000001;// [RXD][TXD][][][][LEDG-IN3][EXT_OUT][EXT_IN]
	MOVLW       129
	MOVWF       TRISC+0 
;initialize.c,14 :: 		TRISD=0b00000000;// [LCD_RS][LCD_EN][LCD_D4][LCD_D5][LCD_D6][LCD_D7][LEDB-IN1][LEDR-IN2]
	CLRF        TRISD+0 
;initialize.c,15 :: 		TRISE=0b00000000;// [][][][][][SH_CP][ST_CP][DS18B20]
	CLRF        TRISE+0 
;initialize.c,18 :: 		ANSELA=0b00001010;// [][][][][TRIMPOT2][][TRIMPOT1][]
	MOVLW       10
	MOVWF       ANSELA+0 
;initialize.c,19 :: 		ANSELB=0b00000000;// [][][][][][][][]
	CLRF        ANSELB+0 
;initialize.c,20 :: 		ANSELC=0b00000000;// [][][][][][][][]
	CLRF        ANSELC+0 
;initialize.c,21 :: 		ANSELD=0b00000000;// [][][][][][][][]
	CLRF        ANSELD+0 
;initialize.c,22 :: 		ANSELE=0b00000000;// [][][][][][][][]
	CLRF        ANSELE+0 
;initialize.c,25 :: 		LATA=0x00;
	CLRF        LATA+0 
;initialize.c,26 :: 		LATB=0x00;
	CLRF        LATB+0 
;initialize.c,27 :: 		LATC=0x00;
	CLRF        LATC+0 
;initialize.c,28 :: 		LATD=0x00;
	CLRF        LATD+0 
;initialize.c,29 :: 		LATE=0x00;
	CLRF        LATE+0 
;initialize.c,32 :: 		InitTimer2();
	CALL        _InitTimer2+0, 0
;initialize.c,35 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;initialize.c,38 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;initialize.c,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;initialize.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;initialize.c,41 :: 		}
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
;interrupt.c,8 :: 		}
L_end_Interrupt:
L__Interrupt145:
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
L_ReadDS18B2074:
	DECFSZ      R13, 1, 1
	BRA         L_ReadDS18B2074
	DECFSZ      R12, 1, 1
	BRA         L_ReadDS18B2074
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
	GOTO        L__ReadDS18B20147
	MOVF        R2, 0 
	SUBLW       0
L__ReadDS18B20147:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadDS18B2075
;ds18b20.c,31 :: 		tempData=~tempData+1;
	COMF        ReadDS18B20_tempData_L0+0, 1 
	COMF        ReadDS18B20_tempData_L0+1, 1 
	INFSNZ      ReadDS18B20_tempData_L0+0, 1 
	INCF        ReadDS18B20_tempData_L0+1, 1 
;ds18b20.c,32 :: 		sign=-1;
	MOVLW       255
	MOVWF       ReadDS18B20_sign_L0+0 
;ds18b20.c,33 :: 		}
L_ReadDS18B2075:
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

;main.c,15 :: 		void main() {
;main.c,16 :: 		InitMCU();
	CALL        _InitMCU+0, 0
;main.c,18 :: 		Lcd_Out(1,1,"14.Sifreli Kilit");         // Ekranda 1.satir 1.sütundan itibaren yaz
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,19 :: 		Lcd_Out(2,1,"Sifre:          ");         // Ekranda 2.satir 1.sütundan itibaren yaz
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,21 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);           // Imlec konumunda blink aktif
	MOVLW       15
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,24 :: 		Lcd_Chr(2,16,p3+48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p3+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,25 :: 		Lcd_Chr(2,15,p2+48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p2+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,26 :: 		Lcd_Chr(2,14,p1+48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p1+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,27 :: 		Lcd_Chr(2,13,p0+48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,29 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);           // Imlec konumunu bir sola kaydir
	MOVLW       16
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,31 :: 		while(1){
L_main76:
;main.c,37 :: 		if(!BUTTON_MENU || !BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN){
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__main119
	BTFSS       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__main119
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__main119
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__main119
	GOTO        L_main80
L__main119:
;main.c,39 :: 		BUZZER=1; wait(5); BUZZER=0;             // Tusa basma sesi
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       5
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
	BCF         LATA2_bit+0, BitPos(LATA2_bit+0) 
;main.c,41 :: 		if(!BUTTON_MENU){       // Menu butonuna basilirsa
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main81
;main.c,42 :: 		position++;           // Secili sifre hanesini bir arttir
	INFSNZ      _position+0, 1 
	INCF        _position+1, 1 
;main.c,44 :: 		if(position>3)        // Pozisyon 3'ten buyuk ise
	MOVLW       0
	MOVWF       R0 
	MOVF        _position+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main149
	MOVF        _position+0, 0 
	SUBLW       3
L__main149:
	BTFSC       STATUS+0, 0 
	GOTO        L_main82
;main.c,45 :: 		position=0;         // 0 yap
	CLRF        _position+0 
	CLRF        _position+1 
L_main82:
;main.c,46 :: 		}
L_main81:
;main.c,48 :: 		if(!BUTTON_OK){
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_main83
;main.c,51 :: 		if(password==(p0*1000+p1*100+p2*10+p3)){          // Sifre dogru mu?
	MOVF        _p0+0, 0 
	MOVWF       R0 
	MOVF        _p0+1, 0 
	MOVWF       R1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        _p1+0, 0 
	MOVWF       R0 
	MOVF        _p1+1, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 1 
	MOVF        R1, 0 
	ADDWFC      FLOC__main+1, 1 
	MOVF        _p2+0, 0 
	MOVWF       R0 
	MOVF        _p2+1, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        FLOC__main+0, 0 
	ADDWF       R0, 1 
	MOVF        FLOC__main+1, 0 
	ADDWFC      R1, 1 
	MOVF        _p3+0, 0 
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVF        _p3+1, 0 
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        _password+1, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main150
	MOVF        R2, 0 
	XORWF       _password+0, 0 
L__main150:
	BTFSS       STATUS+0, 2 
	GOTO        L_main84
;main.c,52 :: 		LED04=1;                                        // Yesil LED'i aktif et
	BSF         _LATH+0, 3 
;main.c,53 :: 		RELAY=1;                                        // Roleyi aktif et
	BSF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;main.c,54 :: 		}
	GOTO        L_main85
L_main84:
;main.c,56 :: 		LED08=1;                                        // Kirmizi LED'i aktif et
	BSF         _LATH+0, 7 
;main.c,59 :: 		BUZZER=1; wait(10); BUZZER=0; wait(100);
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       10
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
	BCF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       100
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
;main.c,60 :: 		BUZZER=1; wait(10); BUZZER=0; wait(100);
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       10
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
	BCF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       100
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
;main.c,61 :: 		BUZZER=1; wait(10); BUZZER=0; wait(100);
	BSF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       10
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
	BCF         LATA2_bit+0, BitPos(LATA2_bit+0) 
	MOVLW       100
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
;main.c,62 :: 		}
L_main85:
;main.c,65 :: 		wait(1000);                                       // 1 sn bekleme
	MOVLW       232
	MOVWF       FARG_wait_time+0 
	MOVLW       3
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
;main.c,66 :: 		LED04=0;                                          // Yesil LED'i pasif et
	BCF         _LATH+0, 3 
;main.c,67 :: 		LED08=0;                                          // Kirmizi LED'i pasif et
	BCF         _LATH+0, 7 
;main.c,68 :: 		RELAY=0;                                          // Roleyi pasif et
	BCF         LATA0_bit+0, BitPos(LATA0_bit+0) 
;main.c,69 :: 		p3=0; Lcd_Chr(2,16,p3+48);                        // p3 degerini 0 yap ve ekrana yaz
	CLRF        _p3+0 
	CLRF        _p3+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,70 :: 		p2=0; Lcd_Chr(2,15,p2+48);                        // p2 degerini 0 yap ve ekrana yaz
	CLRF        _p2+0 
	CLRF        _p2+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,71 :: 		p1=0; Lcd_Chr(2,14,p1+48);                        // p3 degerini 0 yap ve ekrana yaz
	CLRF        _p1+0 
	CLRF        _p1+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,72 :: 		p0=0; Lcd_Chr(2,13,p0+48);                        // p0 degerini 0 yap ve ekrana yaz
	CLRF        _p0+0 
	CLRF        _p0+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,73 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);                   // Imlec konumunu bir sola kaydir
	MOVLW       16
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,74 :: 		}
L_main83:
;main.c,76 :: 		if(!BUTTON_UP){
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_main86
;main.c,77 :: 		switch (position){                                // Eger position degeri
	GOTO        L_main87
;main.c,78 :: 		case 0: if(p0<9) p0++; break;                   // 0 ise ve p0 9'dan kucuk ise
L_main89:
	MOVLW       0
	SUBWF       _p0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main151
	MOVLW       9
	SUBWF       _p0+0, 0 
L__main151:
	BTFSC       STATUS+0, 0 
	GOTO        L_main90
	INFSNZ      _p0+0, 1 
	INCF        _p0+1, 1 
L_main90:
	GOTO        L_main88
;main.c,79 :: 		case 1: if(p1<9) p1++; break;                   // 1 ise ve p1 9'dan kucuk ise
L_main91:
	MOVLW       0
	SUBWF       _p1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main152
	MOVLW       9
	SUBWF       _p1+0, 0 
L__main152:
	BTFSC       STATUS+0, 0 
	GOTO        L_main92
	INFSNZ      _p1+0, 1 
	INCF        _p1+1, 1 
L_main92:
	GOTO        L_main88
;main.c,80 :: 		case 2: if(p2<9) p2++; break;                   // 2 ise ve p2 9'dan kucuk ise
L_main93:
	MOVLW       0
	SUBWF       _p2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main153
	MOVLW       9
	SUBWF       _p2+0, 0 
L__main153:
	BTFSC       STATUS+0, 0 
	GOTO        L_main94
	INFSNZ      _p2+0, 1 
	INCF        _p2+1, 1 
L_main94:
	GOTO        L_main88
;main.c,81 :: 		case 3: if(p3<9) p3++; break;                   // 3 ise ve p3 9'dan kucuk ise
L_main95:
	MOVLW       0
	SUBWF       _p3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main154
	MOVLW       9
	SUBWF       _p3+0, 0 
L__main154:
	BTFSC       STATUS+0, 0 
	GOTO        L_main96
	INFSNZ      _p3+0, 1 
	INCF        _p3+1, 1 
L_main96:
	GOTO        L_main88
;main.c,82 :: 		}
L_main87:
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main155
	MOVLW       0
	XORWF       _position+0, 0 
L__main155:
	BTFSC       STATUS+0, 2 
	GOTO        L_main89
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main156
	MOVLW       1
	XORWF       _position+0, 0 
L__main156:
	BTFSC       STATUS+0, 2 
	GOTO        L_main91
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main157
	MOVLW       2
	XORWF       _position+0, 0 
L__main157:
	BTFSC       STATUS+0, 2 
	GOTO        L_main93
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main158
	MOVLW       3
	XORWF       _position+0, 0 
L__main158:
	BTFSC       STATUS+0, 2 
	GOTO        L_main95
L_main88:
;main.c,83 :: 		}
L_main86:
;main.c,85 :: 		if(!BUTTON_DOWN){                                   // Eger position degeri
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main97
;main.c,86 :: 		switch(position){                                 // 0 ise ve p0 0'dan buyuk ise
	GOTO        L_main98
;main.c,87 :: 		case 0: if(p0>0) p0--; break;                   // 1 ise ve p0 0'dan buyuk ise
L_main100:
	MOVLW       0
	MOVWF       R0 
	MOVF        _p0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main159
	MOVF        _p0+0, 0 
	SUBLW       0
L__main159:
	BTFSC       STATUS+0, 0 
	GOTO        L_main101
	MOVLW       1
	SUBWF       _p0+0, 1 
	MOVLW       0
	SUBWFB      _p0+1, 1 
L_main101:
	GOTO        L_main99
;main.c,88 :: 		case 1: if(p1>0) p1--; break;                   // 2 ise ve p0 0'dan buyuk ise
L_main102:
	MOVLW       0
	MOVWF       R0 
	MOVF        _p1+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main160
	MOVF        _p1+0, 0 
	SUBLW       0
L__main160:
	BTFSC       STATUS+0, 0 
	GOTO        L_main103
	MOVLW       1
	SUBWF       _p1+0, 1 
	MOVLW       0
	SUBWFB      _p1+1, 1 
L_main103:
	GOTO        L_main99
;main.c,89 :: 		case 2: if(p2>0) p2--; break;                   // 3 ise ve p0 0'dan buyuk ise
L_main104:
	MOVLW       0
	MOVWF       R0 
	MOVF        _p2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main161
	MOVF        _p2+0, 0 
	SUBLW       0
L__main161:
	BTFSC       STATUS+0, 0 
	GOTO        L_main105
	MOVLW       1
	SUBWF       _p2+0, 1 
	MOVLW       0
	SUBWFB      _p2+1, 1 
L_main105:
	GOTO        L_main99
;main.c,90 :: 		case 3: if(p3>0) p3--; break;
L_main106:
	MOVLW       0
	MOVWF       R0 
	MOVF        _p3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main162
	MOVF        _p3+0, 0 
	SUBLW       0
L__main162:
	BTFSC       STATUS+0, 0 
	GOTO        L_main107
	MOVLW       1
	SUBWF       _p3+0, 1 
	MOVLW       0
	SUBWFB      _p3+1, 1 
L_main107:
	GOTO        L_main99
;main.c,91 :: 		}
L_main98:
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main163
	MOVLW       0
	XORWF       _position+0, 0 
L__main163:
	BTFSC       STATUS+0, 2 
	GOTO        L_main100
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main164
	MOVLW       1
	XORWF       _position+0, 0 
L__main164:
	BTFSC       STATUS+0, 2 
	GOTO        L_main102
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main165
	MOVLW       2
	XORWF       _position+0, 0 
L__main165:
	BTFSC       STATUS+0, 2 
	GOTO        L_main104
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main166
	MOVLW       3
	XORWF       _position+0, 0 
L__main166:
	BTFSC       STATUS+0, 2 
	GOTO        L_main106
L_main99:
;main.c,92 :: 		}
L_main97:
;main.c,94 :: 		switch(position){                                   // Eger position degeri
	GOTO        L_main108
;main.c,95 :: 		case 0: Lcd_Chr(2,13,p0+48); break;               // 0 ise, p0 0degerini ekrana yaz
L_main110:
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	GOTO        L_main109
;main.c,96 :: 		case 1: Lcd_Chr(2,14,p1+48); break;               // 1 ise, p0 0degerini ekrana yaz
L_main111:
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p1+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	GOTO        L_main109
;main.c,97 :: 		case 2: Lcd_Chr(2,15,p2+48); break;               // 2 ise, p0 0degerini ekrana yaz
L_main112:
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p2+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	GOTO        L_main109
;main.c,98 :: 		case 3: Lcd_Chr(2,16,p3+48); break;               // 3 ise, p0 0degerini ekrana yaz
L_main113:
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _p3+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	GOTO        L_main109
;main.c,99 :: 		}
L_main108:
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main167
	MOVLW       0
	XORWF       _position+0, 0 
L__main167:
	BTFSC       STATUS+0, 2 
	GOTO        L_main110
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main168
	MOVLW       1
	XORWF       _position+0, 0 
L__main168:
	BTFSC       STATUS+0, 2 
	GOTO        L_main111
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main169
	MOVLW       2
	XORWF       _position+0, 0 
L__main169:
	BTFSC       STATUS+0, 2 
	GOTO        L_main112
	MOVLW       0
	XORWF       _position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main170
	MOVLW       3
	XORWF       _position+0, 0 
L__main170:
	BTFSC       STATUS+0, 2 
	GOTO        L_main113
L_main109:
;main.c,101 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);                     // Imlec konumunu bir sola kaydir
	MOVLW       16
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,103 :: 		wait(100);                               // 100ms bekleme
	MOVLW       100
	MOVWF       FARG_wait_time+0 
	MOVLW       0
	MOVWF       FARG_wait_time+1 
	CALL        _wait+0, 0
;main.c,106 :: 		while(!BUTTON_MENU || !BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN);
L_main114:
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__main118
	BTFSS       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__main118
	BTFSS       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__main118
	BTFSS       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__main118
	GOTO        L_main115
L__main118:
	GOTO        L_main114
L_main115:
;main.c,107 :: 		}
L_main80:
;main.c,108 :: 		}
	GOTO        L_main76
;main.c,109 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
