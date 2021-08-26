.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
.CODE
    MAIN PROC   
        MOV AX, @DATA
        MOV DS, AX       
      ; YOUR CODE STARTS HERE         
        MOV AH,1
        INT 21H  
        ADD AL,20H  
        MOV CH, AL
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21h
        
        MOV DL, CH
        MOV AH,2
        INT 21H
        
        ; YOUR CODE ENDS HERE   
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
