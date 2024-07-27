.MODEL SMALL
.STACK 100H

.DATA
    MSG1 db 'Nhap ky tu thu nhat: $'
    MSG2 db 0DH, 0AH, 'Nhap ky tu thu hai: $'
    MSG3 db 0DH, 0AH, 'Ky tu tong: $'
    CHAR1 db ?
    CHAR2 db ?
    CHARSUM db ?

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Input first character
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    MOV AH, 01H
    INT 21H
    MOV CHAR1, AL

    ; Input second character
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    MOV AH, 01H
    INT 21H
    MOV CHAR2, AL

    ; Calculate the sum of ASCII values
    MOV AL, CHAR1
    ADD AL, CHAR2
    MOV CHARSUM, AL

    ; Display the result
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H
    MOV DL, CHARSUM
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN