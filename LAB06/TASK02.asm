   .MODEL SMALL
.STACK 100H
.DATA
P DB "Enter Three Numbers :$" 
Q DB "Largest Number :$"
       
        
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX, P            
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1                   
    INT 21H
    MOV BH, AL
    
    MOV AH, 1                   
    INT 21H
    MOV BL, AL
    
    MOV AH, 1                   
    INT 21H
    MOV CH, AL
    
    
    MOV AH, 2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
     
    LEA DX, Q            
    MOV AH, 9
    INT 21H 
     
    CMP BH,BL
    JG 1ST_COM 
    CMP BL,CH
    JG 3RD_COM 
     
    MOV AH,2 
    MOV DL,CH
    INT 21H
    JMP EXIT
      
    1ST_COM:
    CMP BH,CH
    JG 2ND_COM 
    JMP EXIT
            
    3RD_COM:
      MOV AH,2 
      MOV DL,BL
      INT 21H 
      jmp EXIT
                   
      2ND_COM:
      MOV AH,2 
      MOV DL,BH
      INT 21H
    
    EXIT:
    MOV AX, 4C00H
    INT 21H
    MAIN ENDP
END MAIN 