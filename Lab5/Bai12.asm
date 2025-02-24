.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Nhap so thu nhat: $'
    MSG2 DB 0DH,0AH, 'Nhap so thu hai: $'
    MSG3 DB 0DH,0AH, 'Tong: $'
    MSG4 DB 0DH,0AH, 'Hieu: $'
    MSG5 DB 0DH,0AH, 'Tich: $'
    MSG6 DB 0DH,0AH, 'Thuong: $'
    NUM1 DW ?  ; Bien luu so thu nhat
    NUM2 DW ?  ; Bien luu so thu hai
    RESULT DW ? ; Bien luu ket qua
    BUFFER DB 6 DUP(0) ; Bo dem luu so nhap
    TEMP DW ? ; Bien tam

.CODE
MAIN PROC
    ; Khoi dong che do doan
    MOV AX, @DATA
    MOV DS, AX
    
    ; Hien thi "Nhap so thu nhat: "
    MOV DX, OFFSET MSG1
    MOV AH, 09H
    INT 21H

    ; Nhap so thu nhat
    CALL READ_NUMBER
    MOV NUM1, AX  ; Luu so nhap vao NUM1
    
    ; Hien thi "Nhap so thu hai: "
    MOV DX, OFFSET MSG2
    MOV AH, 09H
    INT 21H

    ; Nhap so thu hai
    CALL READ_NUMBER
    MOV NUM2, AX  ; Luu so nhap vao NUM2
    
    ; ---- Tinh Tong ----
    MOV AX, NUM1
    ADD AX, NUM2
    MOV RESULT, AX

    ; Hien thi "Tong: "
    MOV DX, OFFSET MSG3
    MOV AH, 09H
    INT 21H

    ; In ket qua tong
    CALL PRINT_NUMBER

    ; ---- Tinh Hieu ----
    MOV AX, NUM1
    SUB AX, NUM2
    MOV RESULT, AX

    ; Hien thi "Hieu: "
    MOV DX, OFFSET MSG4
    MOV AH, 09H
    INT 21H

    ; In ket qua hieu
    CALL PRINT_NUMBER

    ; ---- Tinh Tich ----
    MOV AX, NUM1
    MOV DX, 0
    IMUL NUM2
    MOV RESULT, AX

    ; Hien thi "Tich: "
    MOV DX, OFFSET MSG5
    MOV AH, 09H
    INT 21H

    ; In ket qua tich
    CALL PRINT_NUMBER

    ; ---- Tinh Thuong ----
    MOV AX, NUM1
    MOV DX, 0
    MOV CX, NUM2
    CMP CX, 0
    JE NO_DIVIDE  ; Neu mau so la 0 thi bo qua

    IDIV CX
    MOV RESULT, AX

    ; Hien thi "Thuong: "
    MOV DX, OFFSET MSG6
    MOV AH, 09H
    INT 21H

    ; In ket qua thuong
    CALL PRINT_NUMBER

NO_DIVIDE:
    ; Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; ============================================
; Ham nhap so nguyen tu ban phim
; ============================================
READ_NUMBER PROC
    MOV CX, 0  ; CX giu gia tri so
    MOV BX, 10  ; Dung de nhan voi 10 khi nhap so moi
    
NEXT_DIGIT:
    MOV AH, 01H  ; Doc ky tu tu ban phim
    INT 21H
    CMP AL, 13   ; Kiem tra neu la Enter (CR)
    JE END_READ

    SUB AL, '0'  ; Chuyen ky tu thanh so
    MOV AH, 0
    PUSH AX      ; Luu so da nhap vao stack

    MOV AX, CX   ; Lay so hien tai trong CX
    MUL BX       ; AX = CX * 10
    POP DX       ; Lay so vua nhap tu stack
    ADD AX, DX   ; Cong vao so moi
    MOV CX, AX   ; Cap nhat gia tri so

    JMP NEXT_DIGIT

END_READ:
    MOV AX, CX   ; Dua ket qua vao AX
    RET
READ_NUMBER ENDP

; ============================================
; Ham in so nguyen ra man hinh
; ============================================
PRINT_NUMBER PROC
    MOV CX, 0  ; Dem so chu so
    MOV DX, 0  ; Xoa DX
    MOV AX, RESULT
    CMP AX, 0
    JGE POSITIVE_NUMBER
    MOV DL, '-'
    MOV AH, 02H
    INT 21H
    NEG AX  ; Doi thành so duong de xu ly
POSITIVE_NUMBER:
    
    MOV BX, 10  ; Chia lay chu so
CONVERT_LOOP:
    MOV DX, 0
    DIV BX
    PUSH DX  ; Luu phan du (chu so) vao stack
    INC CX   ; Tang dem so chu so
    TEST AX, AX
    JNZ CONVERT_LOOP

PRINT_LOOP:
    POP DX
    ADD DL, '0'  ; Chuyen so thanh ky tu
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP

    RET
PRINT_NUMBER ENDP

END MAIN
