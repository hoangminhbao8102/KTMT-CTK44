.MODEL SMALL
.STACK 100h

.DATA
    promptLength DB 'Nhap chieu dai: $'
    promptWidth  DB 13,10,'Nhap chieu rong: $'
    msgPerimeter DB 13,10,'Chu vi hinh chu nhat la: $'
    msgArea      DB 13,10,'Dien tich hinh chu nhat la: $'
    inputBuffer  DB 6, ?, 5 DUP('$')  ; Bo dem de luu du lieu nhap vao
    length       DW ?
    width        DW ?
    area         DW ?
    perimeter    DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Nhap chieu dai
    LEA DX, promptLength
    MOV AH, 09h
    INT 21h          ; Hien thi thong bao

    LEA DX, inputBuffer
    MOV AH, 0Ah       ; Doc chuoi nhap vao
    INT 21h

    ; Chuyen doi chuoi so thanh so nguyen
    LEA SI, inputBuffer + 2
    CALL ConvertToNumber
    MOV length, AX

    ; Nhap chieu rong
    LEA DX, promptWidth
    MOV AH, 09h
    INT 21h          ; Hien thi thong bao

    LEA DX, inputBuffer
    MOV AH, 0Ah       ; Doc chuoi nhap vao
    INT 21h

    ; Chuyen doi chuoi so thanh so nguyen
    LEA SI, inputBuffer + 2
    CALL ConvertToNumber
    MOV width, AX

    ; Tinh dien tich: area = length * width
    MOV AX, length
    MUL width
    MOV area, AX

    ; Tinh chu vi: perimeter = 2 * (length + width)
    MOV AX, length
    ADD AX, width
    SHL AX, 1     ; Nhan doi ket qua (2 * (length + width))
    MOV perimeter, AX

    ; In ket qua chu vi
    LEA DX, msgPerimeter
    MOV AH, 09h
    INT 21h

    ; Chuyen chu vi sang chuoi de in
    MOV AX, perimeter
    CALL PrintNumber

    ; In ket qua dien tich
    LEA DX, msgArea
    MOV AH, 09h
    INT 21h

    ; Chuyen dien tich sang chuoi de in
    MOV AX, area
    CALL PrintNumber

    ; Ket thuc chuong trinh
    MOV AX, 4C00h
    INT 21h

; Ham chuyen doi chuoi so thanh so nguyen
ConvertToNumber PROC
    XOR AX, AX        ; Dat AX = 0
    MOV CX, 0         ; Dat CX = 0 (CX se luu so luong chu so)
    MOV BX, 10        ; He co so 10

    ConvertLoop:
        MOV DL, [SI]      ; Doc ky tu tu chuoi
        CMP DL, '0'       ; Kiem tra neu ky tu la so
        JB DoneConvert    ; Neu khong phai so, thoat vong lap
        CMP DL, '9'
        JA DoneConvert    ; Neu khong phai so, thoat vong lap
        SUB DL, '0'       ; Chuyen ky tu thanh so
        MOV AH, 0         ; Xoa thanh ghi AH
        MOV AL, DL        ; Dat gia tri so vao AL
        ADD AX, CX        ; AX = AX + CX
        MOV CX, AX        ; Luu gia tri hien tai cua AX vao CX
        INC SI            ; Di chuyen den ky tu tiep theo
        JMP ConvertLoop   ; Lap lai
    
    DoneConvert:
        MOV AX, CX        ; Dua gia tri cuoi cung tu CX vao AX
        RET
ConvertToNumber ENDP

; Ham dd in so ra man hinh
PrintNumber PROC
    MOV BX, 10         ; He co so 10
    XOR CX, CX         ; Dat so luong chu so da in = 0

    ; Xu ly so 0 dac biet
    CMP AX, 0
    JE PrintZero

    ; Chia AX cho 10 va luu du vao stack
    PrintLoop:
        XOR DX, DX         ; Xoa DX
        DIV BX             ; Chia AX cho 10
        ADD DL, '0'        ; Chuyen du sang ky tu
        PUSH DX            ; Luu ky tu vao stack
        INC CX             ; Tang so luong ky tu
        CMP AX, 0
        JNE PrintLoop
    
        ; In cac ky tu da luu
    PrintStackLoop:
        POP DX
        MOV AH, 02h
        INT 21h            ; In ky tu
        LOOP PrintStackLoop
        RET
    
    PrintZero:
        MOV DL, '0'
        MOV AH, 02h
        INT 21h            ; In ky tu 0
        RET
PrintNumber ENDP

END MAIN
