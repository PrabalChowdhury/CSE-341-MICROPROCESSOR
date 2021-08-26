.MODEL SMALL
.STACK 100H
.DATA 
P DB "30$"  
Q DB "31$" 
R DB "28$"
.CODE
MAIN PROC       
    mov AX,@DATA
    mov DS,AX    
    ;CODE STARTS FROM HERE    
    mov AH,1
    int 21H 
    mov BL,AL
    sub BL,30H
    mov CL,BL                 
    mov AX,BX    
    mov BL,2       
    div BL    
    mov BL, AH    
    cmp CL,2
    je feb    
    cmp CL,6
    je nondiv     
    cmp BL,0
    je div    
    jne nondiv        
    nondiv:
    mov AH,2 
    mov DL,0DH 
    int 21H 
    mov DL,0AH 
    int 21H 
    lea DX, Q
    mov AH, 9
    int 21H    
    JMP Exit    
    div:
    mov AH,2 
    mov DL,0DH 
    int 21H 
    mov DL,0AH 
    int 21H 
    lea DX, P
    mov AH, 9
    int 21H 
    jmp Exit    
    feb:
    mov AH,2 
    mov DL,0DH 
    int 21H 
    mov DL,0AH 
    int 21H 
    LEA DX, R
    mov AH, 9
    int 21H        
    Exit:
    mov AX,4CH
    int 21H
    MAIN ENDP
         END MAIN
