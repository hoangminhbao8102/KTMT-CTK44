.MODEL SMALL
.STACK
.DATA
    TB1 DB 13,10,"NHAP MOT KY TU (HOAC ESC): $"
    TB2 DB 13,10,"KY TU NHAP LA CHU$"
    TB3 DB 13,10,"KY TU NHAP LA SO$" 
    TB4 DB 13,10,"KY TU NHAP KHAC CHU/SO$"                                   
.CODE                                           
   MOV AX,@DATA                                 
   MOV DS,AX
        
 VONGLAP:  
   MOV AH,9 
   LEA DX,TB1     
   INT 21H
                 
   MOV AH,1   
   INT 21H
   
   CMP AL,1BH
   JE KETTHUC
                 
   CMP AL,'0' 
   JB KHAC
   
   CMP AL,'9'
   JBE SO
            
   CMP AL,'A'
   JB KHAC
   
   CMP AL,'Z'
   JBE CHU
   
   CMP AL,'a'
   JB KHAC
   
   CMP AL,'z'
   JBE CHU         

   JMP KHAC  
   
   SO: 
        MOV AH,9
        LEA DX,TB3
        INT 21H    
        JMP VONGLAP
   CHU:             
        MOV AH,9
        LEA DX,TB2
        INT 21H    
        JMP VONGLAP   
   KHAC:             
        MOV AH,9
        LEA DX,TB4
        INT 21H
        JMP VONGLAP
   KETTHUC:          
        MOV AH,4CH
        INT 21H   
END