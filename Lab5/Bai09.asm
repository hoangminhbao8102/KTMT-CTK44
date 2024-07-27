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
    
    ; Khoi tao BX = 0 (gia tri thap phan)
    XOR BX, BX
    
    ; Doc va xu ly tung ky tu
    MOV CL, 4          ; Dem so ky tu nhap (t?i da 4 ký t?)
FOR1:
    MOV AH, 01h        ; DOS function code de doc ky tu tu ban phim
    INT 21h
    CMP AL, 0Dh        ; Kiem tra ky tu Enter (CR)
    JE END_FOR
    
    CMP AL, 30h        ; Kiem tra xem ky tu co phai la so hay khong
    JB NHAPSAI
    CMP AL, 39h
    JBE NUM1
    
    CMP AL, 'A'        ; Kiem tra xem ky tu co phai la chu cai tu A-F khong
    JB NHAPSAI
    CMP AL, 'F'
    JBE LETTER1
    
    JMP NHAPSAI

NUM1:
    SUB AL, 48         ; Chuyen so ASCII thanh gia tri thap phan
    JMP SHIFT
    
LETTER1:
    SUB AL, 37h        ; Chuyen chu cai A-F thanh gia tri thap phan
SHIFT:
    SHL BX, 4          ; Dich trai BX de nhuong cho cho ky tu moi
    OR BL, AL          ; Luu ky tu moi vao BL
    JMP LAP
    
LAP:
    DEC CL
    JNZ FOR1          ; Lap lai neu con ky tu de nhap
    
END_FOR:
    ; Xuat thong bao gia tri
    MOV AH, 09h
    LEA DX, TBAO2
    INT 21h
    
    ; Xuat gia tri
    MOV CX, 1          ; So luong ky tu can xuat (1 ky t?u o day)
    MOV AH, 02h        ; DOS function code de in ky tu
    MOV DL, BH         ; Dua gia tri thap phan vao DL de xuat
FOR:
    SHR DL, 4          ; Lay nibble cao
    CMP DL, 9
    JBE NUM2
    ADD DL, 55         ; Chuyen doi gia tri A-F thanh ky tu ASCII
    JMP END_FOR1
    
NUM2:
    ADD DL, 48         ; Chuyen doi gia tri 0-9 thanh ky tu ASCII
    
END_FOR1:
    INT 21h            ; In ky tu
    ROL BX, 4          ; Dich vong BX de lay nibble tiep theo
    DEC CX
    JNZ FOR
    
KETTHUC:
    MOV AH, 4Ch
    INT 21h

NHAPSAI:
    ; Neu nhap sai, chuyen den ket thuc chuong trinh
    JMP KETTHUC

main ENDP
END main
