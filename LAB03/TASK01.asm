.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    P DB "The Result Is : $"
.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX
        ; YOUR CODE STARTS HERE          
        MOV AH,1
        INT 21H 
        MOV CL, AL
        SUB CL,30H 
        
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21h        
     
        MOV AH,1
        INT 21H 
        SUB AL,30H
        MUL CL    
        ADD AL,30h
        MOV BL, AL        
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        LEA DX, P
        MOV AH,9
        INT 21h
        MOV DH,0
        MOV DL,0
        
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
         
        MOV DL, BL
        
        MOV AH,2
        INT 21H
            
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
