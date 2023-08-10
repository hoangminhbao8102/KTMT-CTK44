.MODEL SMALL
.STACK
.DATA
    TB DB 13,10,"HAY NHAP MOT KY TU (HOAC ESC): $"
    LASO DB 13,10,"KY TU DA NHAP LA SO.$"
    LACHU DB 13,10,"KY TU DA NHAP LA CHU.$"
    LAKHAC DB 13,10,"KY TU DA NHAP LA KHAC CHU (SO).$"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    LAP:
        MOV AH,9
        LEA DX,TB
        INT 21H
        MOV AH,1
        INT 21H
        CMP AL,1BH
        JE THOAT
        CALL MAIN
    THOAT:
        MOV AH,4CH
        INT 21H
    MAIN PROC
        CMP AL,'0'
        JB KHAC
        CMP AL,'9'
        JBE SO
        CMP AL,'A'
        JB KHAC
        CMP AL,'Z'
        JBE CHU
        CMP AL,'a'
        JB KHAC
        CMP AL,'z'
        JBE CHU
        JMP KHAC
        SO:
            MOV AX,9
            LEA DX,LASO
            INT 21H
            JMP LAP
        CHU:
            MOV AH,9
            LEA DX,LAKHAC
            INT 21H
            JMP LAP
        KHAC:
            MOV AH,9
            LEA DX,LAKHAC
            INT 21H
            JMP LAP
        LUU:
            RET
END