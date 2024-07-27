.MODEL SMALL
.STACK 100h

.DATA
    ; Khong can khai bao du lieu trong phan nay cho cac phep toan co ban nay.

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; a) ADD AX, BX ; AX = 512Ch, BX = 4185h
    MOV AX, 512Ch
    MOV BX, 4185h
    ADD AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; b) ADD AX, BX ; AX = FE12h, BX = 1ACBh
    MOV AX, FE12h
    MOV BX, 1ACBh
    ADD AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; c) ADD AX, BX ; AX = E1E4h, BX = DAB3h
    MOV AX, E1E4h
    MOV BX, DAB3h
    ADD AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; d) ADD AX, BX ; AX = 7132h, BX = 7000h
    MOV AX, 7132h
    MOV BX, 7000h
    ADD AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; e) ADD AX, BX ; AX = 6389h, BX = 1176h
    MOV AX, 6389h
    MOV BX, 1176h
    ADD AX, BX

    ; Debug tai day de kiem tra ket qua cua AX

    ; Ket thuc chuong trinh
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
