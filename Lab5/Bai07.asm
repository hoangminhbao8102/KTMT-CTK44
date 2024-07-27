.MODEL SMALL
.STACK 100h
.DATA
    msg db 'Ngay hien tai: $'  ; Message to display

.CODE
MAIN PROC
    ; Set up the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display the message
    MOV AH, 09h
    LEA DX, msg
    INT 21h

    ; Get the current date using DOS interrupt 21h, function 2Ah
    MOV AH, 2Ah
    INT 21h

    ; Extract and display the day
    MOV AL, DL
    AAM
    ADD AX, 3030h
    MOV BX, AX
    CALL DISP

    ; Display separator '/'
    MOV DL, '/'
    MOV AH, 02h
    INT 21h

    ; Extract and display the month
    MOV AL, DH
    AAM
    ADD AX, 3030h
    MOV BX, AX
    CALL DISP

    ; Display separator '/'
    MOV DL, '/'
    MOV AH, 02h
    INT 21h

    ; Extract and display the year
    MOV AH,2Ah
    INT 21h
    ADD CX,0F830h
    MOV AX,CX    
    AAM
    MOV BX,AX
    CALL DISP_FULL_YEAR

    ; Exit the program
    MOV AX, 4C00h
    INT 21h
MAIN ENDP

    DISP PROC
        ; Display the contents of BX
        MOV DL, BH
        MOV AH, 02h
        INT 21h
        MOV DL, BL
        MOV AH, 02h
        INT 21h
        RET
    DISP ENDP

    DISP_FULL_YEAR PROC
        ; Display the full year stored in AX
        ; Separate each digit and display
    
        ; Get tens digit
        MOV DL,BH
        ADD DL,30h
        MOV AH,02h
        INT 21h
    
        ; Get ones digit
        MOV DL, BL
        ADD DL, 30h  ; Convert to ASCII
        MOV AH, 02h
        INT 21h
    
        RET
    DISP_FULL_YEAR ENDP

END MAIN
