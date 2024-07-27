.MODEL SMALL
.STACK 100h

.DATA
    ; Khong can khai bao du lieu trong phan nay cho cac phep toan co ban nay.

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

     ; a) SUB AX, BX ; AX = 2143h, BX = 1986h
    MOV AX, 2143h
    MOV BX, 1986h
    SUB AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; b) SUB AX, BX ; AX = 81FEh, BX = 1986h
    MOV AX, 81FEh
    MOV BX, 1986h
    SUB AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; c) SUB AX, BX ; AX = 19BCh, BX = 81FEh
    MOV AX, 19BCh
    MOV BX, 81FEh
    SUB AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; d) SUB AX, BX ; AX = 0002h, BX = FE0Fh
    MOV AX, 0002h
    MOV BX, FE0Fh
    SUB AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; e) SUB AX, BX ; AX = 8BCDh, BX = 71ABh
    MOV AX, 8BCDh
    MOV BX, 71ABh
    SUB AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; Ket thuc chuong trinh
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
