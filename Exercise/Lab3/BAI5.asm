.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"NHAP MOT KY TU: $"
    TB2 DB 13,10,"NAM KY TU KE TIEP: $"
    KT DB ?
    NL DB 13,10,'$'
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TB1    
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV KT,AL 
               
    MOV AL,KT
    SUB AL,6
    MOV KT,AL           
               
    MOV AH,9
    LEA DX,TB2    
    INT 21H
    
    MOV CX,5
    
  VONGLAP:
    MOV AH,2
    INC KT
    MOV DL,KT
    INT 21H
    DEC CX
    
    MOV AH,9
    LEA DX,NL
    INT 21H
  JNE VONGLAP
   
    MOV AH,4CH
    INT 21H
END