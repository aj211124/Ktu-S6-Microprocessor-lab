DATA SEGMENT
	LIST DB 25H,23H,12H,0FFH,0FFH,86H
	COUNT EQU 06H
	SUM DB 2 DUP(0)
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
  START:MOV AX,DATA
	MOV DS,AX
	MOV CX,COUNT
	MOV AX,0000H
	LEA SI,LIST
     L2:ADD AL,[SI]
	JNC L1       		
	INC AH
     L1:INC SI
	LOOP L2
	MOV SUM,AL
	MOV SUM+1,AH
        MOV AH,4CH
	INT 21H
  CODE ENDS
 END START  	