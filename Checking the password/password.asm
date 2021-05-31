DISP MACRO MSG
MOV AH,09H
MOV DX, OFFSET MSG
INT 21H
ENDM
DATA SEGMENT
PW DB 'PASSWORD'
PW_LEN EQU ($-PW)
INPUT DB 'PASSWORD'
INPUT_LEN EQU ($-INPUT)
CORRECT DB 'Password is Correct$'
INCORRECT DB 'Password iS Wrong$'
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA, ES:DATA
START: MOV AX, DATA
MOV DS, AX
MOV ES, AX
MOV AX, PW_LEN
CMP AX, INPUT_LEN
JNZ L1 
LEA SI, PW
LEA DI, INPUT
MOV CX, PW_LEN
CLD
REPE CMPSB
JNZ L1
DISP CORRECT
JMP L2
L1: DISP INCORRECT
L2: MOV AH,4CH
INT 21H
CODE ENDS
END START

	