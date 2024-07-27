.MODEL SMALL
.STACK 100h
.DATA
    prompt db 'Nhap so nhi phan (toi da 16 bit): $'
    resultPrompt db 13,10,'So nhi phan da nhap: $'
    binString db 17 dup(?) ; To store binary string
    crLf db 0Dh, 0Ah, '$' ; Carriage return and line feed

.CODE
START:
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Print the prompt
    LEA DX, prompt
    MOV AH, 09h
    INT 21h

    ; Initialize variables
    XOR CX, CX    ; Bit counter
    XOR BX, BX    ; Clear BX
    XOR SI, SI    ; Clear SI, index for binString

    ; Read binary input
READ_LOOP:
    MOV AH, 01h    ; Function 01h: Read character from stdin
    INT 21h
    CMP AL, 0Dh    ; Check if Enter key is pressed
    JE END_INPUT
    CMP CX, 16     ; Check if we have read 16 bits
    JE END_INPUT
    CMP AL, '0'    ; Check if input is '0'
    JE VALID_INPUT
    CMP AL, '1'    ; Check if input is '1'
    JE VALID_INPUT
    JMP READ_LOOP  ; If input is not '0' or '1', read next character

VALID_INPUT:
    ; Store the bit in binString
    MOV binString[SI], AL
    ; Shift BX left by 1 and add the new bit
    SHL BX, 1
    SUB AL, '0'
    ADD BX, AX
    ; Increment bit counter
    INC CX
    ; Increment SI for the next character
    INC SI
    JMP READ_LOOP

END_INPUT:
    ; Null terminate the binString
    MOV binString[SI], '$'

    ; Print the result prompt
    LEA DX, resultPrompt
    MOV AH, 09h
    INT 21h
    
    ; Print the binary string
    LEA DX, binString
    MOV AH, 09h
    INT 21h
    
    ; Print newline
    LEA DX, crLf
    MOV AH, 09h
    INT 21h

    ; Terminate the program
    MOV AH, 4Ch
    INT 21h

END START
