.MODEL SMALL
.STACK 1000H
.DATA     
    TB1 DB "NHAP SO NHI PHAN: $"  
    TB2 DB 13,10,"XUAT SO NHI PHAN SAU KHI NHAP: $"
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
        AND AL,0FH
        SHL BX,1
        OR BL,AL
        JMP N2
    N8:
        MOV CX,16
        MOV AH,9
        LEA DX,TB2
        INT 21H
        VONGLAP:
            SHL BX,1
            JC LAP 
            MOV DL,'0'
            MOV AH,2
            INT 21H
            JMP XUAT
        LAP:
            MOV DL,'1'
            MOV AH,2
            INT 21H
        XUAT:
            DEC CX
            CMP CX,0
            JNE VONGLAP
    MOV AH,4CH
    INT 21H
END