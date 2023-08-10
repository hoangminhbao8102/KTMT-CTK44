.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"NHAP SO THAP LUC PHAN (TOI DA 4 KY SO):$"
    TB2 DB 13,10,"SO THAP LUC PHAN DA NHAP: $"
    LOI DB 13,10,"BAN NHAP SAI"  
.CODE
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,TB1
    MOV AH,9
    INT 21H
    XOR BX,BX
    MOV AH,1
    MOV CL,4
    NHAP:
        INT 21H
        CMP AL,0DH
        JE KETTHUCNHAP
        CMP AL,30H
        JB NHAPSAI
        CMP AL,'9'
        JBE SO
        CMP AL,'A'
        JB NHAPSAI
        CMP AL,'F'
        JB CHU
        JMP NHAPSAI
        SO:
            SUB AL,48
            JMP THAYDOI
        CHU:
            SUB AL,37H
        THAYDOI:
            SHL BX,4
            OR BL,AL
            JMP LAP
        LAP:
            LOOP NHAP
            JMP KETTHUCNHAP
        NHAPSAI:
            MOV AH,9
            LEA DX,LOI
            INT 21H
            JMP KETTHUC
    KETTHUCNHAP:
        MOV AX,9
        LEA DX,TB2
        INT 21H
    INXUAT:
        MOV CX,4
        MOV AH,2
    XUAT:
        MOV DL,BH
        SHR DL,4
        CMP DL,10
        JB XUATSO
        JAE XUATCHU
        XUATSO:
            ADD DL,48
            INT 21H
            JMP KETTHUCXUAT
        XUATCHU:
            ADD DL,55
            INT 21H
        KETTHUCXUAT:
            ROL BX,4
    LOOP XUAT
    KETTHUC:
        MOV AH,4CH
        INT 21H
END