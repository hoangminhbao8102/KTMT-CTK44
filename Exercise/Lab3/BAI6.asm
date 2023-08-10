.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"NHAP MOT KY TU: $"
    TB2 DB 13,10,"NAM KY TU DUNG TRUOC: $"
    TB3 DB 13,10,"NAM KY TU DUNG SAU: $"
    KT DB ?
    KT1 DB ?
    KT2 DB ?
.CODE                                     
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TB1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV KT,AL
    
    MOV AH,9
    LEA DX,TB2
    INT 21H
    
    MOV AL,KT
    SUB AL,5
    MOV KT1,AL
    
    MOV AH,2
    MOV CX,5
    MOV DL,KT1
    
    LAP1:
        INT 21H
        INC DL
        LOOP LAP1
    
    MOV AH,9
    LEA DX,TB3
    INT 21H
    
    MOV AL,KT
    INC AL
    MOV KT2,AL
    
    MOV AH,2
    MOV CX,5
    MOV DL,KT2
    
    LAP2:
        INT 21H
        INC DL
        LOOP LAP2    
    
    MOV AH,4CH
    INT 21H
END