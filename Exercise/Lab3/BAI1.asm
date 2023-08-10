.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"Bay gio la (S)ang, (C)hieu hay (T)oi?$"
    TB2 DB 13,10,"CHAO BUOI SANG$"
    TB3 DB 13,10,"CHAO BUOI CHIEU$"
    TB4 DB 13,10,"CHAO BUOI TOI$"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    VONGLAP:
        LEA DX,TB1
        MOV AH,09H
        INT 21H
         
        MOV AH,1
        INT 21H 
        
        CMP AL,'S'
        JE SANG
        CMP AL,'s'
        JE SANG
        CMP AL,'C'
        JE CHIEU
        CMP AL,'c'
        JE CHIEU 
        CMP AL,'T'
        JE TOI
        CMP AL,'t'
        JE TOI
        JMP VONGLAP  
        
    SANG:
        LEA DX,TB2
        JMP LOICHAO
    CHIEU:
        LEA DX,TB3
        JMP LOICHAO
    TOI:
        LEA DX,TB4
        JMP LOICHAO
    LOICHAO:
        MOV AH,9
        INT 21H
END 