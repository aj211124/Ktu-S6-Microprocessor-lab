DATA SEGMENT
	LIST DB 05H,02H,90H,78H,01H
	COUNT EQU 05H
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
  START:MOV AX,DATA
	MOV DS,AX
	MOV BX,COUNT-1
     L3:MOV CX,BX
	LEA SI,LIST 
     L2:MOV AL,[SI]
	CMP AL,[SI+1]
	JBE L1
	XCHG AL,[SI+1]
	MOV [SI],AL
     L1:INC SI
	DEC CX
	JNZ L2
	DEC BX
	JNZ L3
	MOV AH,4CH
	INT 21H
 	CODE ENDS
  END START 
