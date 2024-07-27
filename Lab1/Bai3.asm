.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Hay nhap mot ky tu: $'
    BEFORE DB 0DH, 0AH, 'Ky tu dung truoc: $'
    AFTER DB 'Ky tu dung sau: $'
    INPUT DB ?
    OUTPUT_BEFORE DB ?, 0DH, 0AH, '$'
    OUTPUT_AFTER DB ?, 0DH, 0AH, '$'

.CODE
MAIN PROC
    ; Thiet lap doon du lieu
    MOV AX, @DATA
    MOV DS, AX

    ; Hien thi loi nhac
    LEA DX, PROMPT
    MOV AH, 09H
    INT 21H

    ; Nhap mot ky tu
    MOV AH, 01H
    INT 21H
    MOV INPUT, AL

    ; Tinh toan ky tu dung truoc va sau
    MOV AL, INPUT
    DEC AL
    MOV OUTPUT_BEFORE, AL

    MOV AL, INPUT
    INC AL
    MOV OUTPUT_AFTER, AL

    ; Hien thi ky tu dung truoc
    LEA DX, BEFORE
    MOV AH, 09H
    INT 21H

    LEA DX, OUTPUT_BEFORE
    MOV AH, 09H
    INT 21H

    ; Hien thi ky tu dung sau
    LEA DX, AFTER
    MOV AH, 09H
    INT 21H

    LEA DX, OUTPUT_AFTER
    MOV AH, 09H
    INT 21H

    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
