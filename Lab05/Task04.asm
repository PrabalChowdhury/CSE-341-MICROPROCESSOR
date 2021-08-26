.MODEL SMalL

.STACK 100H

.DATA

X DB "ENTER A HEX DIGIT: $"
Y DB "IN DECIMAL IT IS 1$"
Z DB "IN DECIMAL IT IS $" 
P DB "DO YOU WANT TO DO IT AGAIN? :$"
Q DB "ILLEGAL CHARACTER, $"
R DB "INSERT AGAIN: $" 

.CODE
MAIN PROC
       
    MOV AX,@DATA
    MOV DS,AX    
    SRT:
    lea dx,X
    mov ah,9
    int 21H
    mov ah,1
    int 21H                
    mov cl,al             
                               
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0ah
    int 21H 
    
    cmp cl,41H
    je AB
    cmp cl,42H    
    je AB
    cmp cl,43H
    je AB
    cmp cl,44H
    je AB
    cmp cl,45H
    je AB
    cmp cl,46H
    je AB 
    cmp cl,30H
    je AD
    cmp cl,31H    
    je AD
    cmp cl,32H
    je AD
    cmp cl,33H
    je AD
    cmp cl,34H
    je AD
    cmp cl,35H
    je AD
    cmp cl,36H
    je AD
    cmp cl,37H
    je AD
    cmp cl,38H
    je AD
    cmp cl,39H
    je AD        
    JMP AC
    AB:
    sub cl,11H
    lea DX, Y
    mov ah,9
    int 21H
    mov dl, cl  
    mov ah,2
    int 21H 
    
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0ah
    int 21H 
    
    lea DX,P
    mov ah,9
    int 21H   
    mov ah,1
    int 21H                
    mov cl,al
    
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0ah
    int 21H 
    
    cmp cl,59H
    je SRT
    cmp cl,79H
    je SRT
    cmp cl,4EH
    je EXT
    cmp cl,6EH
    je EXT   
    AD:   
    lea DX,Z
    mov ah,9
    int 21H
    mov dl, cl  
    mov ah,2
    int 21H 
    
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0ah
    int 21H 
    
    lea DX,P
    mov ah,9
    int 21H
        
    mov ah,1
    int 21H                
    mov cl,al
    
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0ah
    int 21H 
    
    cmp cl,59H
    je SRT
    cmp cl,79H
    je SRT
    cmp cl,4Eh
    je EXT
    cmp cl,6Eh
    je EXT
         
    AC:
    lea DX,Q
    mov ah,9
    int 21H
    
    JMP SRT2
        
    SRT2:
    lea DX,R
    mov ah,9
    int 21H
    
    mov ah,1
    int 21H                
    mov cl,al             
                               
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0ah
    int 21H 
    
    cmp cl,41H
    je AB
    cmp cl,42H    
    je AB
    cmp cl,43H
    je AB
    cmp cl,44H
    je AB
    cmp cl,45H
    je AB
    cmp cl,46H
    je AB
    
    cmp cl,30H
    je AD
    cmp cl,31H    
    je AD
    cmp cl,32H
    je AD
    cmp cl,33H
    je AD
    cmp cl,34H
    je AD
    cmp cl,35H
    je AD
    cmp cl,36H
    je AD
    cmp cl,37H
    je AD
    cmp cl,38H
    je AD
    cmp cl,39H
    je AD       
    JMP AC    
    EXT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
         END MAIN