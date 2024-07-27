.MODEL SMALL
.STACK 100h

.DATA
    prompt db 'Nhap mot ky tu (hoac ESC): $'
    result_letter db 13,10,'Ky tu nhap la chu$'
    result_digit db 13,10,'Ky tu nhap la so$'
    result_non_letter_non_digit db 13,10,'Ky tu nhap khac chu/so$'
    new_line db 0Dh, 0Ah, '$'
    esc_key db 1Bh ; ESC key ASCII code

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Program loop
    START:
        ; Print prompt message
        LEA DX, prompt
        MOV AH, 09h
        INT 21h

        ; Read a character
        MOV AH, 01h
        INT 21h
        CMP AL, esc_key
        JE EXIT_PROGRAM ; If ESC, exit the program

        ; Check if the character is a letter
        MOV AH, 0
        CMP AL, 'A'
        JL CHECK_DIGIT
        CMP AL, 'Z'
        JLE IS_LETTER
        CMP AL, 'a'
        JL CHECK_DIGIT
        CMP AL, 'z'
        JLE IS_LETTER

        ; Check if the character is a digit
        CHECK_DIGIT:
            CMP AL, '0'
            JL NOT_LETTER_NOT_DIGIT
            CMP AL, '9'
            JLE IS_DIGIT

        NOT_LETTER_NOT_DIGIT:
            ; Print non-letter and non-digit message
            LEA DX, result_non_letter_non_digit
            MOV AH, 09h
            INT 21h
            JMP PRINT_NEW_LINE
        
        IS_LETTER:
            ; Print letter message
            LEA DX, result_letter
            MOV AH, 09h
            INT 21h
            JMP PRINT_NEW_LINE

        IS_DIGIT:
            ; Print digit message
            LEA DX, result_digit
            MOV AH, 09h
            INT 21h

        PRINT_NEW_LINE:
            ; Print new line
            LEA DX, new_line
            MOV AH, 09h
            INT 21h

        ; Loop back to start
        JMP START

    EXIT_PROGRAM:
        ; Terminate program
        MOV AH, 4Ch
        INT 21h

MAIN ENDP
END MAIN
