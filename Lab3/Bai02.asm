.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB "NHAP MOT KY TU: $"
    TB2 DB 13,10,"KY TU DA NHAP LA CHU $"
    TB3 DB 13,10,"KY TU DA NHAP LA SO $"
    TB4 DB 13,10,"KY TU DA NHAP KHAC CHU/SO $"
    
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    ; Hien thi thong bao nhap ky tu
    MOV AH,09h
    LEA DX,TB1
    INT 21h
    
    ; Nhan ky tu tu ban phim
    MOV AH,01h
    INT 21h
    
    ; Kiem tra ky tu
    CMP AL,'0'
    JB KHAC        ; Neu ky tu < '0', nhay den KHAC
    CMP AL,'9'
    JBE SO         ; Neu ky tu <= '9', nhay den SO

    CMP AL,'A'
    JB KHAC        ; Neu ky tu < 'A', nhay den KHAC
    CMP AL,'Z'
    JBE CHU        ; Neu ky tu <= 'Z', nhay den CHU

    CMP AL,'a'
    JB KHAC        ; Neu ky tu < 'a', nhay den KHAC
    CMP AL,'z'
    JBE CHU        ; Neu ky tu <= 'z', nhay den CHU

    ; Ky tu khac chu cai va so
    JMP KHAC

    SO:
        MOV AH,09h
        LEA DX,TB3
        INT 21h
        JMP KETTHUC

    CHU:
        MOV AH,09h
        LEA DX,TB2
        INT 21h
        JMP KETTHUC

    KHAC:
        MOV AH,09h
        LEA DX,TB4
        INT 21h

    KETTHUC:
        MOV AH,4Ch
        INT 21h
END
