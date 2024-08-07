.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 13,10, 'Nhap so thu nhat: $'
    MSG2 DB 13,10, 'Nhap so thu hai: $'
    MSG3 DB 13,10, 'Phan thuong duoc luu tren BX la: $'
    MSG4 DB 13,10, 'Phan du duoc luu tren CX la: $'
    
    TONG DW ?
    NUM1 DW ?
    NUM2 DW ?
.CODE 
    MOV AX,@DATA
    MOV DS,AX
   
    LEA DX,MSG1
    CALL NHAP_CHUOI  
    MOV NUM1, BX
   
    LEA DX,MSG2
    CALL NHAP_CHUOI
    MOV NUM2,BX  
   
    MOV AH,9h
    LEA DX,MSG3
    INT 21h   
    XOR DX,DX
    MOV AX, NUM1
    MOV BX, NUM2
    DIV BX
    MOV BX,AX
    CALL XUAT_THAPPHAN
   
    MOV AH,9h
    LEA DX,MSG4
    INT 21h   
    XOR DX,DX
    MOV AX, NUM1
    MOV BX, NUM2
    DIV BX   
    MOV CX,DX   
    MOV AX, CX
    CALL XUAT_THAPPHAN
    
    MOV AH,4Ch
    INT 21h  
   
; THU TUC
NHAP_CHUOI PROC  
    
    MOV AH,9h
    INT 21h
   
    MOV BX,0
    INPUT:   
        MOV AH,7
        INT 21h  
       
        CMP AL,0Dh
        JE  BREAK 
       
        CMP AL,'0'
        JB INPUT
        CMP AL,'9'
        JBE SO 
       
        JMP INPUT
             
        SO:
        MOV CL,AL
       
        MOV AH, 2
        MOV DL, AL
        INT 21h
       
        AND CL, 0Fh
       
        MOV AX,BX
        MOV SI,10
        MUL SI   
       
        XOR CH,CH
        ADD AX,CX
        MOV BX, AX
       
        JMP INPUT
    BREAK:   
        RET
NHAP_CHUOI ENDP  


XUAT_THAPPHAN PROC 
    MOV BX,10
   
    XOR CX,CX
    CHIA:   
        XOR DX,DX
        DIV BX   ; AX=AX/BX DU LUU O DX
        PUSH DX 
        INC CX
       
        CMP AX,0
        JA CHIA    
       
    XULYSTACK:   
        POP DX
        ADD DX,30h
       
        MOV AH,2
        INT 21h
        LOOP XULYSTACK
            
        RET
XUAT_THAPPHAN ENDP

END