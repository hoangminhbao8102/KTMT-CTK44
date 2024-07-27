.MODEL SMALL
.STACK 100h

.DATA
    TB DB "HAY NHAP MOT KY TU (HOAC ESC): $"
    LASO DB 13, 10, "KY TU DA NHAP LA SO.$"
    LACHU DB 13, 10, "KY TU DA NHAP LA CHU.$"
    LAKHAC DB 13, 10, "KY TU DA NHAP LA KHAC CHU (SO).$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ; Bat dau vong lap
    LAP:
        ; Hien thi thong bao nhap ky tu
        MOV AH, 09h
        LEA DX, TB
        INT 21h
    
        ; Doc mot ky tu tu ban phim
        MOV AH, 01h
        INT 21h
        CMP AL, 1Bh  ; Kiem tra phim ESC (ma ASCII là 27)
        JE THOAT     ; Neu la phim ESC thi thoat
    
        ; Goi thu tuc kiem tra ky tu
        CALL CHECK_CHAR
        JMP LAP      ; Quay lai vong lap
    
    THOAT:
        ; Ket thuc chuong trinh
        MOV AH, 4Ch
        INT 21h

MAIN ENDP

CHECK_CHAR PROC
    ; Kiem tra ky tu co phai la so khong
    CMP AL, '0'
    JB KHAC
    CMP AL, '9'
    JBE SO

    ; Kiem tra ky tu co phai la chu cai khong
    CMP AL, 'A'
    JB KHAC
    CMP AL, 'Z'
    JBE CHU
    CMP AL, 'a'
    JB KHAC
    CMP AL, 'z'
    JBE CHU

    ; Neu khong phai la so hay chu cai
    JMP KHAC

    SO:
        ; Ky tu la so
        MOV AH, 09h
        LEA DX, LASO
        INT 21h
        JMP RETURN_CHECK
    
    CHU:
        ; Ky tu la chu
        MOV AH, 09h
        LEA DX, LACHU
        INT 21h
        JMP RETURN_CHECK
    
    KHAC:
        ; Ky tu khac chu/so
        MOV AH, 09h
        LEA DX, LAKHAC
        INT 21h
    
    RETURN_CHECK:
        RET
    CHECK_CHAR ENDP

END MAIN
