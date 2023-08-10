.MODEL SMALL
.STACK
.DATA
    TB DB "HOM NAY LA NGAY:$"
.CODE  
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,TB
    NGAY:
        MOV AH,2AH
        INT 21H
        MOV AL,DL
        AAM
        MOV BX,AX
        CALL XUAT
        MOV DL,'/'
        MOV AH,02H
        INT 21H
    THANG:
        MOV AH,2AH
        INT 21H
        MOV AL,DH
        AAM
        MOV BX,AX
        CALL XUAT
        MOV DL,'/'
        MOV AX,02H
        INT 21H
    NAM:
        MOV AH,2AH
        INT 21H
        ADD CX,0F830H
        MOV AX,CX
        AAM
        MOV BX,AX
        CALL XUAT
    MOV AH,4CH
    INT 21H
    XUAT PROC
        MOV DL,BH
        ADD DL,30H
        MOV AH,02H
        INT 21H
        MOV DL,BL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        RET
    XUAT ENDP
END