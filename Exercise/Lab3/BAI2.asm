.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"NHAP MOT KY TU: $"
    TB2 DB 13,10,"KY TU DA NHAP LA CHU $"
    TB3 DB 13,10,"KY TU DA NHAP LA SO $"
    TB4 DB 13,10,"KY TU DA NHAP KHAC CHU/SO $"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,TB1
    INT 21H
    MOV AH,1
    INT 21H
    CMP AL,'0'
    JB KHAC
    CMP AL,'9'
    JBE SO  
    CMP AL,'A'
    JB KHAC 
    CMP AL,'Z'
    JBE CHU
    JMP KHAC
    SO:
        MOV AH,9
        LEA DX,TB3
        INT 21H
        JMP KETTHUC
    CHU:
        MOV AH,9
        LEA DX,TB2
        INT 21H
        JMP KETTHUC
    KHAC:
        MOV AH,9
        LEA DX,TB4
        INT 21H
    KETTHUC:
        MOV AH,4CH
        INT 21H
END