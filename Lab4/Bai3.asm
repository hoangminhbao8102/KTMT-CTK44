.MODEL SMALL
.STACK 100h

.DATA
    prompt1 DB 'Hay nhap mot chu thuong (a-z): $'
    prompt2 DB 'Chu hoa tuong ung là: $'
    newLine DB 0Dh, 0Ah, '$'
    input DB ?
    output DB ?

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Print the first prompt
    LEA DX, prompt1
    MOV AH, 09h
    INT 21h

    ; Read a single character from keyboard
    MOV AH, 01h
    INT 21h
    MOV input, AL

    ; Print a new line
    LEA DX, newLine
    MOV AH, 09h
    INT 21h

    ; Convert lowercase to uppercase
    MOV AL, input
    SUB AL, 20h
    MOV output, AL

    ; Print the second prompt
    LEA DX, prompt2
    MOV AH, 09h
    INT 21h

    ; Print the uppercase letter
    MOV DL, output
    MOV AH, 02h
    INT 21h

    ; Print a new line
    LEA DX, newLine
    MOV AH, 09h
    INT 21h

    ; Exit the program
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
