.MODEL SMALL
.STACK 100h
.DATA
    timeMsg DB 'Gio hien tai: $'
    hourStr DB '00$'
    colon DB ':$'
    minStr DB '00$'
    secStr DB '00$'
    newline DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    ; Khoi tao trinh phan doan
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; In ra thong bao "Gio hien tai: "
    LEA DX, timeMsg
    MOV AH, 09h
    INT 21h

    ; Lay thoi gian he thong
    MOV AH, 2Ch
    INT 21h

    ; Chuyen doi gio thanh chuoi va in ra
    MOV AL, CH
    CALL ConvertAndPrintHour

    ; In dau hai cham
    LEA DX, colon
    MOV AH, 09h
    INT 21h

    ; Chuyen doi phut thanh chuoi va in ra
    MOV AL, CL
    CALL ConvertAndPrintMin

    ; In dau hai cham
    LEA DX, colon
    MOV AH, 09h
    INT 21h

    ; Chuyen doi giay thanh chuoi va in ra
    MOV AL, DH
    CALL ConvertAndPrintSec

    ; In xuong dong
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

; Chuyen doi gio thanh chuoi va in ra
ConvertAndPrintHour PROC
    PUSH AX
    MOV AH, 00h
    MOV BL, 10

    ; Chia gio cho 10 de lay so hàng chuc
    DIV BL
    ADD AL, '0'
    MOV [hourStr], AL

    ; Lay phan du (so hang don vi)
    MOV AL, AH
    ADD AL, '0'
    MOV [hourStr + 1], AL

    ; In chuoi gio
    LEA DX, hourStr
    MOV AH, 09h
    INT 21h

    POP AX
    RET
ConvertAndPrintHour ENDP

; Chuyen doi phut thanh chuoi va in ra
ConvertAndPrintMin PROC
    PUSH AX
    MOV AH, 00h
    MOV BL, 10

    ; Chia phut cho 10 de lay so hang chuc
    DIV BL
    ADD AL, '0'
    MOV [minStr], AL

    ; Lay phan du (so hang don vi)
    MOV AL, AH
    ADD AL, '0'
    MOV [minStr + 1], AL

    ; In chuoi phut
    LEA DX, minStr
    MOV AH, 09h
    INT 21h

    POP AX
    RET
ConvertAndPrintMin ENDP

; Chuyen doi giay thanh chuoi và in ra
ConvertAndPrintSec PROC
    PUSH AX
    MOV AH, 00h
    MOV BL, 10

    ; Chia giay cho 10 du lay so hang chuc
    DIV BL
    ADD AL, '0'
    MOV [secStr], AL

    ; Lay phan du (so hang don vi)
    MOV AL, AH
    ADD AL, '0'
    MOV [secStr + 1], AL

    ; In chuoi giay
    LEA DX, secStr
    MOV AH, 09h
    INT 21h

    POP AX
    RET
ConvertAndPrintSec ENDP

END MAIN
