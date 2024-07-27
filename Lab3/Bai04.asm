.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB "NHAP MOT KY TU: $"
    TB2 DB 13,10,"NAM KY TU KE TIEP: $"
    KT DB ?  ; Variable to store the input character
    NL DB ' ', '$' ; Space between characters
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display the first prompt
    MOV AH, 9
    LEA DX, TB1    
    INT 21H
    
    ; Read a character from the keyboard
    MOV AH, 1
    INT 21H
    MOV KT, AL 
    
    ; Display the second prompt
    MOV AH, 9
    LEA DX, TB2    
    INT 21H
    
    MOV CX, 5  ; We need to display 5 characters
    
    VONGLAP:
        MOV AH, 2
        INC KT
        MOV DL, KT
        INT 21H
        
        ; Display a space
        MOV AH, 9
        LEA DX, NL
        INT 21H
        
        LOOP VONGLAP  ; Loop until all 5 characters are displayed
    
    ; Exit the program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
