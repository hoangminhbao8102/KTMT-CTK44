.MODEL SMALL
.STACK 100H
.DATA
    TB1 DB "NHAP MOT KY TU: $"
    TB2 DB 13,10,"NAM KY TU DUNG TRUOC: $"
    TB3 DB 13,10,"NAM KY TU DUNG SAU: $"
    KT DB ?   ; Bien luu ky tu dau vao
    KT1 DB ?  ; Bien luu ky tu bat dau cho 5 ky tu dung truoc
    KT2 DB ?  ; Bien luu ky tu bat dau cho 5 ky tu dung sau
.CODE
    ; Khoi tao doan du lieu
    MOV AX, @DATA
    MOV DS, AX
    
    ; Hien thi TB1 da nhap ky tu
    MOV AH, 9
    LEA DX, TB1
    INT 21H
    
    ; Doc ky tu tu ban phim
    MOV AH, 1
    INT 21H
    MOV KT, AL
    
    ; Hien thi TB2 da thong bao 5 ky tu dung truoc
    MOV AH, 9
    LEA DX, TB2
    INT 21H
    
    ; Tinh toan va hien thi 5 ky tu dung truoc
    MOV AL, KT
    SUB AL, 5
    MOV KT1, AL
    
    MOV AH, 2
    MOV CX, 5
    MOV DL, KT1
    
    LAP1:
        INT 21H
        INC DL
        LOOP LAP1
        
        ; Hien thi TB3 da thong bao 5 ky tu dang sau
        MOV AH, 9
        LEA DX, TB3
        INT 21H
        
        ; Tinh toan va hien thi 5 ky tu dung sau
        MOV AL, KT
        INC AL
        MOV KT2, AL
        
        MOV AH, 2
        MOV CX, 5
        MOV DL, KT2
    
    LAP2:
        INT 21H
        INC DL
        LOOP LAP2    
    
    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
END
