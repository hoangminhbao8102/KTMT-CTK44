.MODEL SMALL
.STACK 100h

.DATA
    prompt1 DB 'Enter the first binary number: $'
    prompt2 DB 13,10,'Enter the second binary number: $'
    resultMsg DB 13,10,'Result: $'
    num1 DW 0
    num2 DW 0
    result DW 0
    inputBuffer DB 6, 0, 6 DUP(0)  ; Buffer for input (max 5 bits + null terminator)
    outputBuffer DB 17 DUP(0)      ; Buffer for output (16 bits + null terminator)

.CODE
.STARTUP

    ; Hien thi prompt va nhap so nhi phan thu nhat
    LEA DX, prompt1
    MOV AH, 09h
    INT 21h

    LEA DX, inputBuffer
    MOV AH, 0Ah
    INT 21h

    ; Chuyen doi chuoi nhi phan thanh so nguyen
    CALL BinaryStringToInteger
    MOV num1, AX

    ; Hien thi prompt va nhap so nhi phan thu hai
    LEA DX, prompt2
    MOV AH, 09h
    INT 21h

    LEA DX, inputBuffer
    MOV AH, 0Ah
    INT 21h

    ; Chuyen doi chuoi nhi phan thanh so nguyen
    CALL BinaryStringToInteger
    MOV num2, AX

    ; Thuc hien phep nhan
    MOV AX, num1    ; Load so thu nhat vao AX
    MOV BX, num2    ; Load so thu hai vao BX
    MOV CX, 0       ; Khoi tao CX bang 0 (su dung de luu ket qua phep nhan)

    ; Thuat toan nhan nhi phan
    MOV DX, 0       ; DX se chua phan tren cua ket qua (tam thoi khoi tao bang 0)
    MOV SI, 16      ; So bit can xu ly (16 bit cho moi so nguyen)

    MultiplyLoop:
        SHL AX, 1       ; Dich trai AX (giong nhu nhan AX voi 2)
        RCL DX, 1       ; Dich trai DX voi bit carry tu AX
        RCR BX, 1       ; Dich phai BX (giong nhu chia BX cho 2)
    
        ADD CX, DX      ; Cong DX vao CX (luu ket qua tam thoi)
        DEC SI          ; Giam SI (dem bit)
    
        JNZ MultiplyLoop ; Lap lai cho den khi xu ly het 16 bit
    
        ; Luu ket qua cuoi cung
        MOV result, CX  ; Luu ket qua vao bien result
    
        ; Hien thi ket qua
        LEA DX, resultMsg
        MOV AH, 09h
        INT 21h
    
        MOV AX, result
        CALL IntegerToBinaryString
        LEA DX, outputBuffer
        MOV AH, 09h
        INT 21h
    
        ; Ket thuc chuong trinh
        MOV AX, 4C00h
        INT 21h

    ; Chuyen doi chuoi nhi phan thanh so nguyen (ham con)
    BinaryStringToInteger PROC
        XOR CX, CX        ; CX = 0 (ket qua)
        LEA SI, inputBuffer + 2 ; Bo qua cac byte dau tien (do dai va null terminator)
    BinaryConvertLoop:
        MOV AL, [SI]
        CMP AL, 0Dh       ; Kiem tra ky tu ket thuc (Enter)
        JE BinaryConvertEnd
        SUB AL, '0'       ; Chuyen ky tu sang gia tri so
        SHL CX, 1         ; Dich trai ket qua
        OR CX, AX         ; OR ket qua voi gia tri bit moi
        INC SI
        JMP BinaryConvertLoop
    BinaryConvertEnd:
        MOV AX, CX
        RET
    BinaryStringToInteger ENDP

    ; Chuyen doi so nguyen thanh chuoi nhi phan (ham con)
    IntegerToBinaryString PROC
        MOV CX, 16        ; So bit can chuyen doi
        LEA DI, outputBuffer
        ADD DI, 16        ; Di chuyen con tro den cuoi buffer
        MOV BYTE PTR [DI], '$'
        DEC DI
    
    BinaryConvertLoop2:
        XOR DX, DX
        SHL AX, 1         ; Dich trai AX de lay bit cao nhat
        RCL DX, 1         ; Lay bit cao nhat vào DX
        ADD DL, '0'
        MOV [DI], DL
        DEC DI
        DEC CX
        JNZ BinaryConvertLoop2
    
        RET
    IntegerToBinaryString ENDP

END
