.MODEL SMALL
.STACK 100h
.DATA
    msg1 DB 'Enter a binary number: $'
    msg2 DB 13, 10, 'The binary number in BX is: $'
    newline DB 13, 10, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV BX, 0          ; Clear BX

    ; Display message
    LEA DX, msg1
    MOV AH, 09h
    INT 21h

    INPUT_LOOP:
        MOV AH, 01h        ; Read a character
        INT 21h
        CMP AL, 13         ; Check if Enter key is pressed (ASCII 13)
        JE DISPLAY_RESULT  ; If Enter is pressed, jump to display result
    
        ; Convert ASCII '0' or '1' to binary 0 or 1
        SUB AL, '0'        ; '0' -> 0, '1' -> 1
    
        ; Shift BX left by 1 bit to make room for the new bit
        SHL BX, 1
    
        ; Put the new bit in the least significant bit of BX
        OR BL, AL
    
        JMP INPUT_LOOP     ; Repeat the process
    
    DISPLAY_RESULT:
        ; Display newline
        LEA DX, newline
        MOV AH, 09h
        INT 21h
    
        ; Display result message
        LEA DX, msg2
        MOV AH, 09h
        INT 21h
    
        ; Display BX value (in binary)
        MOV CX, 16         ; 16 bits to display
    DISPLAY_BIT:
        SHL BX, 1          ; Shift BX left by 1 bit
        MOV AL, '0'        ; Default character is '0'
        JNC SKIP_ONE       ; If carry flag is not set, skip
        MOV AL, '1'        ; If carry flag is set, set character to '1'
    SKIP_ONE:
        MOV AH, 0Eh        ; BIOS teletype function
        INT 10h            ; Print character in AL
        LOOP DISPLAY_BIT   ; Loop 16 times

    ; Wait for another key press before exiting
    MOV AH, 01h
    INT 21h

    ; Exit program
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
