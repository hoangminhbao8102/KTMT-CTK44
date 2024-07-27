.MODEL SMALL
.STACK 100H
.DATA
    TB1 DB "Hay nhap mot ky tu: $"
    TB2 DB 0DH, 0AH, "Ky tu dung truoc: $"
    TB3 DB ", da nhap: $"
    TB4 DB ", dung sau: $"
    CHAR DB ?
.CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    
    ; Hien thi thong bao "Hay nhap mot ky tu: "
    LEA DX, TB1
    MOV AH, 9
    INT 21H
    
    ; Doc mot ky tu tu ban phim
    MOV AH, 1
    INT 21H
    MOV CHAR, AL
    
    ; Hien thi thong bao "Ky tu dung truoc: "
    LEA DX, TB2
    MOV AH, 9
    INT 21H
    
    ; Hien thi ky tu dung truoc ky tu da nhap
    MOV AH, 2
    MOV DL, CHAR
    DEC DL
    INT 21H
    
    ; Hien thi thong bao ", da nhap: "
    LEA DX, TB3
    MOV AH, 9
    INT 21H
    
    ; Hien thi ky tu da nhap
    MOV DL, CHAR
    MOV AH, 2
    INT 21H
    
    ; Hien thi thong bao ", dung sau: "
    LEA DX, TB4
    MOV AH, 9
    INT 21H
    
    ; Hien thi ky tu dung sau ky tu da nhap
    MOV DL, CHAR
    INC DL
    MOV AH, 2
    INT 21H
    
    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
END START
