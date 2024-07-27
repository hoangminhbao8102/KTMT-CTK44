.MODEL SMALL
.STACK 100h  ; Kich thuoc ngan xep
.DATA
    TB1 DB "Bay gio la (S)ang, (C)hieu hay (T)oi? $"
    TB2 DB 13,10,"CHAO BUOI SANG$"
    TB3 DB 13,10,"CHAO BUOI CHIEU$"
    TB4 DB 13,10,"CHAO BUOI TOI$"
    
.CODE
.STARTUP
    ; Thiet lap doan du lieu
    MOV AX, @DATA
    MOV DS, AX
    
    VONGLAP:
        ; Hien thi thong bao yeu cau nhap
        LEA DX, TB1
        MOV AH, 09H
        INT 21H
        
        ; Nhap mot ky tu
        MOV AH, 1
        INT 21H
        
        ; Kiem tra ky tu nhap vao
        CMP AL, 'S'
        JE SANG
        CMP AL, 's'
        JE SANG
        CMP AL, 'C'
        JE CHIEU
        CMP AL, 'c'
        JE CHIEU 
        CMP AL, 'T'
        JE TOI
        CMP AL, 't'
        JE TOI
        
        ; Neu ky tu khong hop le, quay lai vong lap
        JMP VONGLAP  
        
    SANG:
        ; Hien thi "CHAO BUOI SANG"
        LEA DX, TB2
        JMP LOICHAO
        
    CHIEU:
        ; Hien thi "CHAO BUOI CHIEU"
        LEA DX, TB3
        JMP LOICHAO
        
    TOI:
        ; Hien thi "CHAO BUOI TOI"
        LEA DX, TB4
        JMP LOICHAO
        
    LOICHAO:
        ; Hien thi thong bao loi chao va ket thuc chuong trinh
        MOV AH, 09H
        INT 21H
        MOV AH, 4CH
        INT 21H
    
END
