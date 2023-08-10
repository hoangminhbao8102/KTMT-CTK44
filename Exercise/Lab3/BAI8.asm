.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"HAY NHAP MOT CHU THUONG (a-z): $"
    TB2 DB 13,10,"CHU HOA TUONG UNG LA: $"
    KT DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
  KIEMTRA:
    MOV AH,9
    LEA DX,TB1
    INT 21H
    
    MOV AH,8
    INT 21H
    CMP AL,'a'
    JL KIEMTRA
    CMP AL,'z'
    JG KIEMTRA   
    SUB AL,32
    MOV KT,AL
    
    MOV AH,9
    LEA DX,TB2
    INT 21H
       
    MOV AH,2
    MOV DL,KT
    INT 21H
    
    MOV AH,4CH
    INT 21H
END