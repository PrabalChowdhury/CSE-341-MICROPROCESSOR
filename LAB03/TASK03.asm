.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    P DB "Enter First Initial: $"
    Q DB "Enter Second Initial: $"
    R DB "Enter Third Initial: $"
.CODE
    MAIN PROC        
        MOV AX, @DATA
        MOV DS, AX        
        ; YOUR CODE STARTS HERE         
        LEA DX,P
        MOV AH,9
        INT 21H        
        MOV AH,1
        INT 21H
        MOV CL,AL        
        MOV AH,2
        MOV DL,0DH
        INT 21H 
        MOV DL,0AH
        INT 21H        
        LEA DX,Q
        MOV AH,9
        INT 21H               
        MOV AH,1
        INT 21H
        MOV CH,AL        
        MOV AH,2
        MOV DL,0DH
        INT 21H  
        MOV DL,0AH
        INT 21H        
        LEA DX,R
        MOV AH,9
        INT 21H         
        MOV AH,1
        INT 21H
        MOV BL,AL        
        MOV AH,2
        MOV DL,0DH
        INT 21H     
        MOV DL,0AH
        INT 21H   
        MOV AH,2
        MOV DL,0DH
        INT 21H  
        MOV DL,0AH
        INT 21H           
        MOV DL,CL
        MOV AH,2
        INT 21H  
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        MOV DL,CH
        MOV AH,2
        INT 21H  
        MOV AH,2
        MOV DL,0DH
        INT 21H   
        MOV DL,0AH
        INT 21H        
        MOV DL,BL
        MOV AH,2
        INT 21H      
        ; YOUR CODE ENDS HERE        
        MOV AX, 4C00H
        INT 21H        
    MAIN ENDP
    END MAIN
