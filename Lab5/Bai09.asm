.MODEL SMALL
.STACK 100h
.DATA
    TBAO1 DB "NHAP SO THAP LUC PHAN: $"
    TBAO2 DB 13,10,"GIA TRI DAU TIEN CUA SO LA: $"

.CODE
main PROC
    ; Khoi dong chuong trinh
    MOV AX, @DATA
    MOV DS, AX
    
    ; Xuat thong bao nhap so
    MOV AH, 09h
    LEA DX, TBAO1
    INT 21h
    
    ; Khoi tao BX = 0
    XOR BX, BX
    
    ; Doc va xu ly tung ky tu nhap vao
    MOV CL, 4          ; Dem so ky tu nhap (toi da 4 ky tu)
FOR1:
    MOV AH, 01h        ; Doc mot ky tu tu ban phim
    INT 21h
    CMP AL, 0Dh        ; Kiem tra neu nhan Enter (CR)
    JE END_FOR
    
    CMP AL, '0'        ; Kiem tra ky tu co hop le khong (0-9, A-F)
    JB NHAPSAI
    CMP AL, '9'
    JBE NUM1
    
    CMP AL, 'A'
    JB NHAPSAI
    CMP AL, 'F'
    JBE LETTER1
    
    JMP NHAPSAI

NUM1:
    SUB AL, '0'        ; Chuyen ASCII '0'-'9' thanh so (0-9)
    JMP SHIFT
    
LETTER1:
    SUB AL, 'A' - 10   ; Chuyen ASCII 'A'-'F' thanh so (10-15)

SHIFT:
    SHL BX, 4          ; Dich trai BX de them so moi vao
    OR BL, AL          ; Luu so vao BL
    LOOP FOR1          ; Giam CL va lap lai neu chua nhap du 4 ky tu

END_FOR:
    ; Xuat thong bao gia tri dau tien
    MOV AH, 09h
    LEA DX, TBAO2
    INT 21h
    
    ; Lay nibble cao nhat cua BX (4 bit dau tien)
    MOV DL, BH
    SHR DL, 4          ; Lay 4 bit cao nhat

    ; Chuyen gia tri thanh ky tu ASCII
    CMP DL, 9
    JBE NUM2
    ADD DL, 'A' - 10   ; Chuyen thanh chu cai A-F
    JMP PRINT

NUM2:
    ADD DL, '0'        ; Chuyen thanh so 0-9

PRINT:
    MOV AH, 02h        ; In mot ky tu
    INT 21h

KETTHUC:
    MOV AH, 4Ch
    INT 21h

NHAPSAI:
    ; Neu nhap sai, ket thuc chuong trinh
    JMP KETTHUC

main ENDP
END main
