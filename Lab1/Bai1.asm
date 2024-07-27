.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'Hello, world!', 0DH, 0AH, '$'
    MSG2 DB 'Hello, solar system!', 0DH, 0AH, '$'
    MSG3 DB 'Hello, universe!', 0DH, 0AH, '$'

.CODE
MAIN PROC
    ; Khoi tao DS
    MOV AX, @DATA
    MOV DS, AX

    ; Hien thi "Hello, world!"
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Hien thi "Hello, solar system!"
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Hien thi "Hello, universe!"
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
