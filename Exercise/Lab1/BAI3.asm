.MODEL SMALL
.STACK
.DATA
    TB1 DB "HAY NHAP MOT KY TU: $"
    TB2 DB 0DH,0AH,"KY TU DUNG TRUOC: $"
    TB3 DB 0DH,0AH,"KY TU DUNG SAU: $"
    CHAR DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,TB1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CHAR,AL
    
    LEA DX,TB2
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,CHAR
    DEC DL
    INT 21H
    
    LEA DX,TB3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CHAR
    INC DL
    INT 21H
    
    MOV AH,4CH
    INT 21H
END