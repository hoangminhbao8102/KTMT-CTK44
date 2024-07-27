.MODEL SMALL
.STACK 100h
.DATA
    ; Khong can khai bao du lieu o day
.CODE
    ; Khoi dau chuong trinh
    MOV AX, @DATA      ; Nap dia chi du lieu vao thanh ghi AX
    MOV DS, AX         ; Nap gia tri cua AX vao DS

    MOV AH, 02h        ; Chon chuc nang in ky tu
    MOV CX, 26         ; So luong chu cai hoa (A-Z)

    PRINT_LOOP:
        MOV DL, AL         ; Nap ky tu vao DL
        INT 21h            ; Goi interrupt DOS de in ky tu
        INC AL             ; Tang gia tri ky tu (chuyen sang ky tu tiep theo)
        LOOP PRINT_LOOP    ; Lap cho den khi CX giam xuong 0
    
    ; Ket thuc chuong trinh
    MOV AH, 4Ch        ; Chon chuc nang thoat chuong trinh
    INT 21h            ; Goi interrupt DOS de thoat

END
