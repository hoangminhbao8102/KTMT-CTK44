.MODEL SMALL
.STACK
.DATA 
    TB DB 13,10,"THOI GIAN HIEN TAI LA : $"
    TG DB '00:00:00$'
.CODE
    MOV AX,@DATA
    MOV DS,AX
    LEA BX,TG
    CALL XUATTHOIGIAN
    LEA DX,TB
    MOV AH,9
    INT 21H
    LEA DX,TG
    MOV AH,9
    INT 21H
    MOV AH,4CH
    INT 21H
    XUATTHOIGIAN PROC
        PUSH AX             
        PUSH CX
        MOV AH, 2CH                  
        INT 21H
        MOV AL, CH                   
        CALL DOI                 
        MOV [BX], AX
        MOV AL, CL           
        CALL DOI         
        MOV [BX+3], AX                                    
        MOV AL, DH           
        CALL DOI         
        MOV [BX+6], AX                                                
        POP CX               
        POP AX
        RET                  
    XUATTHOIGIAN ENDP
    DOI PROC 
        PUSH DX
        MOV AH, 0 
        MOV DL, 10
        DIV DL    
        OR AX, 3030H
        POP DX
        RET         
    DOI ENDP
END