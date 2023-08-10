.MODEL SMALL
.STACK
.DATA
    MSG1 DB 'NHAP SO NHI PHAN (TOI DA 16 BIT):$'
    MSG2 DB 13,10,'SO NHI PHAN DA NHAP:$'
    KT DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    MOV CX,16
    XOR BX,BX
    TIEPTHEO:
        MOV AH,1
        INT 21H
        CMP AL,13
        JE XUAT
        AND AL,0FH
        SHL BX,1
        OR BL,AL
        LOOP TIEPTHEO
    XUAT:
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        MOV CX,16
        MOV AH,2
    DAULAP:
        SHL BX,1
        JC XUATNP
        MOV DL,'0'
        JMP SAU
    XUATNP:
        MOV DL,'1'
    SAU:
        INT 21H
        LOOP DAULAP
    THOAT:
        MOV AH,4CH
        INT 21H
END