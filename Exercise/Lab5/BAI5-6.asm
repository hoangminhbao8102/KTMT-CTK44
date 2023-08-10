.MODEL
.STACK
.DATA
    TB1 DB 13,10,"NHAP SO THAP PHAN: $"
    TB2 DB 13,10,"SO THAP PHAN VUA NHAP: $"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    CALL NHAP
    CALL XUAT
    MOV AH,4CH
    INT 21H
    NHAP PROC
        BATDAU:
            XOR CX,CX
            LEA DX,TB1
            MOV AH,9
            INT 21H
            MOV AH,1
            INT 21H
            CMP AL,'-'
            JE DAUTRU
            CMP AL,'+'
            JE DAUCONG
            JMP TIEPTUC
            DAUTRU:
                MOV CX,1
            DAUCONG:
                INT 21H
            TIEPTUC:
                CMP AL,'0'
                JNGE KHONGPHAISO
                CMP AL,'9'
                JNLE KHONGPHAISO
                AND AX,000FH
                PUSH AX
                MOV AX,10
                MUL BX
                MOV BX,AX
                POP AX
                ADD BX,AX
                MOV AH,1
                INT 21H
                CMP AL,13
                JNE TIEPTUC
                MOV AX,BX
                OR CX,CX
                JE LUU
                NEG AX
                LUU:
                    RET
                KHONGPHAISO:
                    JMP BATDAU
    NHAP ENDP
    XUAT PROC
        PUSH AX
        LEA DX,TB2
        MOV AH,9
        INT 21H
        POP AX
        CMP AX,0
        JGE DOIRATHAPPHAN
        PUSH AX
        MOV DL,'-'
        MOV AH,2
        INT 21H
        POP AX
        NEG AX
        DOIRATHAPPHAN:
            XOR CX,CX
            MOV BX,10
            CHIA:
                XOR DX,DX
                DIV BX
                PUSH DX
                INC CX
                CMP AX,0
                JNE CHIA
                MOV AH,2
            DOI:
                POP DX
                OR DL,30H
                INT 21H
                LOOP DOI
        RET
    XUAT ENDP
END