.MODEL SMALL
.STACK 100H

.DATA
    promptInput DB 'Enter a decimal number: $'
    promptOutput DB 13,10,'The number you entered is: $'
    numStr DB 6 DUP('$')
    newline DB 13, 10, '$'

.CODE
MAIN PROC
    ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display input prompt
    LEA DX, promptInput
    MOV AH, 9
    INT 21H

    ; Read decimal number as a string
    LEA DX, numStr
    MOV AH, 0Ah
    INT 21H

    ; Convert string to number
    LEA SI, numStr + 2   ; Skip first two bytes (length and unused byte)
    MOV CX, 0            ; Clear CX to store the result
    MOV BX, 0            ; Clear BX to store the result

    convert_loop:
        MOV AL, [SI]
        CMP AL, 0Dh          ; Check for carriage return (end of input)
        JE done_convert
        SUB AL, '0'          ; Convert ASCII to digit
        MOV AH, 0
        MOV DX, BX           ; Store current value of BX in DX
        SHL BX, 1            ; BX = BX * 2
        SHL BX, 1            ; BX = BX * 4
        ADD BX, DX           ; BX = BX * 5
        ADD BX, DX           ; BX = BX * 10
        ADD BX, AX           ; BX = BX + digit
        INC SI               ; Move to the next character
        JMP convert_loop

    done_convert:
    
        ; Display output prompt
        LEA DX, promptOutput
        MOV AH, 9
        INT 21H
    
        ; Convert number to string for output
        MOV CX, 0
        MOV SI, OFFSET numStr + 6

    convert_output:
        MOV AX, BX
        XOR DX, DX
        MOV CX, 10
        DIV CX
        ADD DL, '0'
        DEC SI
        MOV [SI], DL
        MOV BX, AX
        OR BX, BX
        JNZ convert_output

    ; Display the number
    LEA DX, SI
    MOV AH, 9
    INT 21H

    ; Newline
    LEA DX, newline
    MOV AH, 9
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
