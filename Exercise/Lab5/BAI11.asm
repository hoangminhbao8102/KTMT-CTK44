.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,'Nhap so: $' 
    TB2 DB 13,10,'Ket qua '      
          DB 13,10,'Thuong : '
    THUONG DB ?
          DB '$'
    SO DB ?
.CODE      
    MOV AX,@DATA
    MOV DS,AX
    
    CALL NHAP
    MOV THUONG,AL 
    
    CALL NHAP
    MOV SO,AL
    XOR BX,BX
    MOV AL,THUONG
    
    MOV BL,SO
    DIV BL
    MOV THUONG,AL  
    OR THUONG,30H
    MOV AH,9
    LEA DX,TB2
    INT 21H 
    
    MOV AH,4CH
    INT 21H

    NHAP PROC
    MOV AH,9
    LEA DX,TB1
    INT 21H
    MOV AH,1
    INT 21H  
    CMP AL,13
    JB NHAP
    CMP AL,13
    JA NHAP
    AND AL,0FH   
    RET
    NHAP ENDP
    
    
   
END