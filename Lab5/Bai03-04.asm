.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 'Nhap so thap luc phan (toi da 4 ky so): $'
    TB2 DB 10, 13, 'So thap luc phan da nhap: $'
    LOI db 10, 13, 'Ban da nhap sai!$'  
    INPUT db 5 DUP(?)

.CODE
MAIN PROC
    ; Load data segment vào DS
    MOV AX, @DATA
    MOV DS, AX
   
    ; Hien thi thong bao nhap chuoi thap phan
    CALL DISPLAY_TB1
   
    ; Nhap chuoi thap phan
    CALL NHAP
    CMP DX, 0
    JE MAIN  ; Neu loi, quay lai nhap

    ; Hien thi thong bao chuoi thap phan da nhap
    CALL DISPLAY_TB2

    ; Xuat chuoi thap phan da nhap
    CALL XUAT
   
    ; Tra quyen dieu khien lai cho he thong
    MOV AH, 4Ch
    INT 21h    

    ; Thu tuc hien thi thong bao nhap chuoi thap phan
    DISPLAY_TB1 PROC
       MOV AH, 9
       LEA DX, TB1
       INT 21h
       RET
    DISPLAY_TB1 ENDP

    ; Thu tuc hien thi thong bao chuoi thap phan da nhap
    DISPLAY_TB2 PROC
       MOV AH, 9
       LEA DX, TB2
       INT 21h
       RET
    DISPLAY_TB2 ENDP

    ; Thu tuc nhap chuoi thap phan
    NHAP PROC
        ; Reset
        MOV DX, 1
        XOR BX, BX
        XOR CX, CX
   
        INPUT_LOOP:
           ; Nhap vao mot ky tu
           MOV AH, 1
           INT 21h
           
           ; Xu ly loi thoat => Enter
           CMP AL, 0Dh
           JE INPUT_END 
           
           ; Xu ly nhap hexa
           CMP AL, '0'
           JB INPUT_ERR
           CMP AL, '9'
           JBE INPUT_SO
           
           CMP AL, 'A'
           JB INPUT_ERR
           CMP AL, 'F'
           JBE INPUT_CHU
           
        ; Cho dx ve 0 nhu la reset viec nhap neu nguoi dung nhap khong dung hexa
        INPUT_ERR:
           MOV DX, 0
           XOR BX, BX
           JMP INPUT_END
           
        INPUT_SO:
           AND AL, 0Fh
           JMP INPUT_PROCESS
           
        INPUT_CHU:
           SUB AL, 37h
           
        INPUT_PROCESS:
           SHL BX, 4
           OR BL, AL
           
           INC CX
           CMP CX, 4
           JB INPUT_LOOP
           
        INPUT_END:
           RET
    NHAP ENDP

    ; Thu tuc xuat chuoi thap phan da nhap
    XUAT PROC 
        MOV CX, 4
        MOV AH, 2
       
        PRINT_LOOP:
           MOV DL, BH
           SHR DL, 4
           CMP DL, 9
           JBE PRINT_SO
           JA PRINT_CHU
           
        PRINT_SO:
           OR DL, 30h
           INT 21h
           JMP PRINT_BACK
           
        PRINT_CHU:
           ADD DL, 37h
           INT 21h
           
        PRINT_BACK:
           ROL BX, 4
           LOOP PRINT_LOOP 
           RET
    XUAT ENDP

END MAIN
