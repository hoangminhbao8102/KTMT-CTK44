.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,'Nhap kich co HCN: $'
    TB3 DB 13,10,'Ket qua '
        DB 13,10,'Tong cua 2 kich co la: '
    TONG DB ?
        DB 13,10,'Chu vi HCN la: '
    CHUVI DB ?
        DB 13,10,'Dien tich HCN la: '
    DIENTICH DB ?
        DB '$'
    KICHCO DB ?
.CODE      
    MOV AX,@DATA
    MOV DS,AX
    CALL NHAP
    MOV TONG,AL
    MOV CHUVI,AL
    MOV DIENTICH,AL
    CALL NHAP
    MOV KICHCO,AL
    ADD TONG,AL
    XOR BX,BX
    MOV BL,CHUVI
    ADD BL,TONG
    MOV CHUVI,BL
    MOV AL,DIENTICH
    MOV BL,KICHCO
    MUL BL
    MOV DIENTICH,AL
    OR TONG,30H  
    OR CHUVI,30H  
    OR DIENTICH,30H
    MOV AH,9
    LEA DX,TB3
    INT 21H
    MOV AH,4CH
    INT 21H
    NHAP PROC
        MOV AH,9
        LEA DX,TB1
        INT 21H
        MOV AH,1
        INT 21H
        CMP AL,'0'
        JB NHAP
        CMP AL,'9'
        JA NHAP
        AND AL,0FH   
        RET
    NHAP ENDP   
END