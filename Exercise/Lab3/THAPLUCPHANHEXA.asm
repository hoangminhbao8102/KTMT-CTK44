.MODEL SMALL
.STACK 100H
.DATA
    TB1 DB "NHAP SO THAP LUC PHAN HEXA: $"
    TB2 DB 13,10,"SO THAP PHAN HEXA VUA NHAP: $"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    XOR BX,BX
    MOV AH,9
    LEA DX,TB1
    INT 21H
    MOV AH,1
    N2:
        INT 21H
        CMP AL,13 
        JE N8
        CMP AL,39H
        JG CHUSO
        AND AL,0FH
        JMP THAYDOI
        CHUSO:
            SUB AL,37H
        THAYDOI:
            SHL BX,CL
            OR BL,AL
            JMP N2
    N8:  
        MOV AX,@DATA
        MOV DS,AX
        LEA DX,TB2
        MOV AH,9
        INT 21H
        MOV CX,4
        XUATHEX:
            MOV DL,BH
            SHR DL,4
            CMP DL,9
            JG XUATCHUSO
            OR DL,30H
            MOV AH,2
            INT 21H
            JMP XUAT
        XUATCHUSO:
            ADD DL,37H
            MOV AH,2
            INT 21H
        XUAT:
            SHL BX,4
            LOOP XUATHEX
            MOV AH,4CH
            INT 21H
END