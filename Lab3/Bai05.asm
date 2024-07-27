.MODEL SMALL
.STACK 100h
.DATA
    INPUT_CHAR DB ?
    MESSAGE1 DB 'Nhap mot ky tu: $'
    MESSAGE2 DB 13, 10, 'Nam ky tu truoc do: $'
    NEWLINE DB 13, 10, '$'

.CODE
START:
    ; Khoi tao DS segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Hien thi thong bao yeu cau nhap ky tu
    LEA DX, MESSAGE1
    MOV AH, 09h
    INT 21h

    ; Nhap ky tu tu ban phim
    MOV AH, 01h
    INT 21h
    MOV INPUT_CHAR, AL

    ; Hien thi thong bao ket qua
    LEA DX, MESSAGE2
    MOV AH, 09h
    INT 21h
    
    ; Tinh toan va hien the 5 ky tu truoc ky tu da nhap
    MOV CX, 5
    MOV BL, INPUT_CHAR

    DISPLAY_LOOP:
        DEC BL
        MOV AH, 02h
        MOV DL, BL
        INT 21h
        MOV AH, 02h
        MOV DL, ' ' ; Them khoang trang
        INT 21h
        LOOP DISPLAY_LOOP
    
    ; Them dong moi
    LEA DX, NEWLINE
    MOV AH, 09h
    INT 21h

    ; Ket thuc chuong trinh
    MOV AH, 4Ch
    INT 21h
END START