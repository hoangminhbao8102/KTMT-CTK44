.MODEL SMALL
.STACK
.DATA 
    TB1 DB "NHAP KY TU THU NHAT: $"
    TB2 DB 13,10,"NHAP KY TU THU HAI: $"
    TB3 DB 13,10,"KY TU TONG: $" 
    C1 DB ?
    C2 DB ?
    CSUM DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,TB1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    MOV C1,AL
    INT 21H
    
    LEA DX,TB2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    MOV C2,AL
    INT 21H 
    
    MOV AL,C1
    MOV AL,C2 
    MOV CSUM,AL
    
    LEA DX,TB3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CSUM
    INT 21H
    
    MOV AH,4CH
    INT 21H
END