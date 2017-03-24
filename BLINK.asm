                    

;Program to print AA55 on LED
MOV R0, #01H
LALA:	MOV R1, #02H
		SETB P3.3
		SETB P3.4
DISPA:	MOV P1, #136
		CALL DELAY
		MOV P1, #11111111B
		CALL SDELAY
		DJNZ R1,DISPA
		MOV R1, #02H
DISP5:	MOV P1, #146
		CALL DELAY
		MOV P1, #11111111B
		CALL SDELAY
		DJNZ R1, DISP5

	MOV P1, #10001000B	; put pattern for 1 on display
	CALL DELAY
	CLR P3.3		; enable display 2
	MOV P1, #10001000B	; put pattern for 2 on display
	CALL DELAY
	CLR P3.4		; |
	SETB P3.3		; | enable display 1
	MOV P1, #10010010B	; put pattern for 3 on display
	CALL DELAY
	CLR P3.3		; enable display 0
	MOV P1, #10010010B	; put pattern for 4 on display
	CALL DELAY
	CJNE R0,#02H,LALA

  LOP:	SJMP LOP

DELAY:	MOV R0, #200
		DJNZ R0, $
		RET
SDELAY:	MOV R0, #100
		DJNZ R0, $
		RET