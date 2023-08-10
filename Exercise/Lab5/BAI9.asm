.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"NHAP SO THAP LUC PHAN: $"
    TB2 DB 13,10,"GIA TRI DAU TIEN CUA SO LA: $"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,TB1
    INT 21H 
    XOR BX,BX          
    MOV AH, 1
    MOV CL,4         
    NHAP:
        INT 21H
        CMP AL, 0DH   
        JE  KETTHUCNHAP
        CMP AL, 30H
        JB NHAPSAI
        CMP AL,'9'
        JBE NHAPSO
        CMP AL,'A'
        JB NHAPSAI
        CMP AL,'F'
        JBE NHAPCHU
        JMP NHAPSAI               
        NHAPSO:
        SUB AL, 48    
        JMP LUU    
        NHAPCHU:
            SUB AL, 37H
        LUU:
            SHL BX, 4
            OR BL, AL
            JMP LAP          
        LAP:
            LOOP NHAP
            JMP KETTHUCNHAP 
        NHAPSAI:
            JMP KETTHUC
    KETTHUCNHAP:
    MOV AH,9
    LEA DX,TB2
    INT 21H
    MOV CX,1
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
            DEC CX
    JNZ XUAT
    KETTHUC:
        MOV AH,4CH
        INT 21H
END