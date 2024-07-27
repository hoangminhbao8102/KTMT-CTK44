.MODEL SMALL
.STACK 100h

.DATA
    ; Khong can khai bao du lieu trong phan nay cho cac phep toan co ban nay.

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; a) ADD AX, BX ; Voi AX = 7FFFh, BX = 1
    MOV AX, 7FFFh
    MOV BX, 1
    ADD AX, BX

    ; Debug tai day de kiem tra ket qua cua AX
    ; INT 3 ; Su dung INT 3 (breakpoint) de dung chuong trinh tai day neu can.

    ; b) SUB AL, BL ; Voi AL = 1, BL= FFh
    MOV AL, 1
    MOV BL, 0FFh
    SUB AL, BL

    ; Debug tai day de kiem tra ket qua cua AL

    ; c) DEC AL ; Voi AL = 0
    MOV AL, 0
    DEC AL

    ; Debug tai day de kiem tra ket qua cua AL

    ; d) NEG AL ; Voi AL = 7Fh
    MOV AL, 7Fh
    NEG AL

    ; Debug tai day de kiem tra ket qua cua AL

    ; e) XCHG AX, BX ; V?i AX = 1ABCh, BX = 712Ah
    MOV AX, 1ABCh
    MOV BX, 712Ah
    XCHG AX, BX

    ; Debug tai day de kiem tra ket qua cua AX và BX

    ; f) ADD AL, BL ; Voi AL = 80h, BL = FFh
    MOV AL, 80h
    MOV BL, 0FFh
    ADD AL, BL

    ; Debug tai day de kiem tra ket qua cua AL

    ; g) SUB AX, BX ; Voi AX = 0, BX = 8000h
    MOV AX, 0
    MOV BX, 8000h
    SUB AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; h) NEG AX ; Voi AX = 1
    MOV AX, 1
    NEG AX

    ; Debug tai day de kiem tra ket qua cua AX

    ; Ket thuc chuong trinh
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
