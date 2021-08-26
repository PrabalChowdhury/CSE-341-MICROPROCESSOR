.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    P DB "ENTER A HEX DIGIT: $"
    Q DB "IN DECIMAL IT IS 1$"
.CODE
MAIN PROC       
    MOV AX,@DATA
    MOV DS,AX    
    ;CODE STARTS FROM HERE    
    LEA DX,P
    MOV AH,9
    INT 21H    
    MOV AH,1
    INT 21H
    MOV CH,AL
    SUB CH,11H    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H      
    LEA DX, Q
    MOV AH,9
    INT 21H      
    MOV DL,CH   
    MOV AH,2
    INT 21H 
       
    ;EXIT TO DOS
    MOV AX,4c00H
    INT 21H
    MAIN ENDP
    END MAIN
