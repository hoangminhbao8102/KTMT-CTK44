.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Hay nhap mot chu thuong (a-z): $'
    MSG2 DB 0AH, 0DH, 'Chu hoa tuong ung la: $'
    INPUT DB ?
.CODE
.STARTUP
    ; Hien thi thong bao yeu cau nhap chu thuong
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ; Doc ky tu tu ban phim ma khong hien thi
    MOV AH, 08H
    INT 21H
    MOV INPUT, AL

    ; Chuyen doi chu thuong thanh chu hoa
    SUB INPUT, 20H

    ; Hien thi ket qua
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    ; Hien thi chu hoa
    MOV DL, INPUT
    MOV AH, 02H
    INT 21H

    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
END
