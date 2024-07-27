.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 'Hay nhap mot ky tu: $'
    OUTPUTMSG DB 0DH, 0AH, 'Ky tu da nhap: $'
    INPUTCHAR DB ?

.CODE
MAIN PROC
    ; Khoi tao DS
    MOV AX, @DATA
    MOV DS, AX

    ; Hien thi thong bao yeu cau nhap ky tu
    LEA DX, PROMPT
    MOV AH, 09h
    INT 21H

    ; Nhap mot ky tu
    MOV AH, 01H
    INT 21H
    MOV INPUTCHAR, AL  ; Luu ky tu da nhap vao INPUTCHAR

    ; Hien thi thong bao ky tu da nhap
    LEA DX, OUTPUTMSG
    MOV AH, 09H
    INT 21H

    ; Hien thi ky tu da nhap
    MOV DL, INPUTCHAR
    MOV AH, 02H
    INT 21H

    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
