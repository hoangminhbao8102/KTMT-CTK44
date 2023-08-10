.MODEL SMALL
.STACK
.DATA
    TB1 DB "Hay nhap so nhi phan:$"
    TB2 DB 13,10,"So nhi phan vua nhap:$"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    XOR BX,BX
    MOV AH,9
    LEA DX,TB1
    INT 21H
    MOV AH,1
    NHAPNHIPHAN:
        INT 21H
        CMP AL,13
        JE XUATNHIPHAN
        AND AL,0FH
        SHL BX,1
        OR BL,AL
        JMP NHAPNHIPHAN  
    XUATNHIPHAN:
        MOV CX,16
        MOV AH,9
        LEA DX,TB2
        INT 21H
        VONGLAP:
            ROL BX,1
            JC LAP
            MOV DL,'0'
            MOV AH,2
            INT 21H
            JMP THOAT
        LAP:
            MOV DL,'1'
            MOV AH,2
            INT 21H
        THOAT:
            DEC CX
            CMP CX,0
            JNE VONGLAP
    MOV AH,4CH
    INT 21H
END
             