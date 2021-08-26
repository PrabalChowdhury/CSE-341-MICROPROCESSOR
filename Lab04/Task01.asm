.MODEL SMALL
.STACK 100H 
.DATA
    P DB "1st Input: $"
    Q DB "2nd Input: $"
    R DB "3rd Input: $"
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX 
    
    lea DX,P
    mov AH,9
    int 21H  
    mov AH,1    
    int 21H    
    mov BL,AL
    mov AH,2
    mov DL,0DH
    int 21H 
    mov DL,0AH
    int 21H          
    lea DX,Q
    mov AH,9
    int 21H
    mov AH,1    
    int 21H    
    mov BH,AL 
    mov AH,2
    mov DL,0DH
    int 21H 
    mov DL,0AH
    int 21H       
    lea DX,R
    mov AH,9
    int 21H
    mov AH,1     
    int 21H
    mov CL,AL
    CMP BL,BH 
    JGE D 
    A:  
    CMP BH,CL    
    JGE B
    mov AH,2
    mov DL,0DH
    int 21H   
    mov DL,0AH
    int 21H        
    mov DL,CL
    mov AH,2
    int 21H    
    JMP EXIT   
    B: 
    mov AH,2
    mov DL,0DH
    int 21H   
    mov DL,0AH
    int 21H
    mov DL,BH
    mov AH,2
    int 21H     
    JMP EXIT         
    D:    
    CMP BL,CL    
    JGE C
    mov AH,2
    mov DL,0DH
    int 21H   
    mov DL,0AH
    int 21H
    mov DL,CL
    mov AH,2
    int 21H    
    JMP EXIT    
    C:
    mov AH,2
    mov DL,0DH
    int 21H   
    mov DL,0AH
    int 21H
    mov DL,BL
    mov AH,2
    int 21H    
    EXIT:  
    mov AH,4CH
    int 21H
    MAIN ENDP
END MAIN
