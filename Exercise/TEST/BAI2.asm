.MODEL SMALL
.STACK
.DATA
    TB1 DB "Hay nhap mot chu thuong thu 1(a-z):$"
    TB2 DB 13,10,"Hay nhap mot chu thuong thu 2(a-z):$"
    TB3 DB 13,10,"Ket qua: $"
    KT1 DB ?
    KT2 DB ?
    KQ DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
      
    LEA DX,TB1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    MOV KT1,AL
    INT 21H
    
    LEA DX,TB2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    MOV KT2,AL
    INT 21H
    
    MOV AL,KT1
    SUB AL,KT2
    MOV KQ,AL
    
    LEA DX,TB3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,KQ
    INT 21H
    
    MOV AH,4CH
    INT 21H
END