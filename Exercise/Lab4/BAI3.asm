.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"HAY NHAP MOT CHU THUONG (a-z):$"
    TB2 DB 13,10,"CHU HOA TUONG UNG LA::$"
    KT DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    LAP:
        MOV AH,9
        LEA DX,TB1
        INT 21H
        MOV AH,1
        INT 21H
        CALL MAIN
        MOV AH,4CH
        INT 21H
        MAIN PROC
            CMP AL,'a'
            JB LAP
            CMP AL,'z'
            JA LAP
            SUB AL,32
            MOV KT,AL
            MOV AH,9
            LEA DX,TB2
            INT 21H
            MOV AH,2
            MOV DL,KT
            INT 21H
        MAIN ENDP
END