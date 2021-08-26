.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC       
    mov AX,@DATA
    mov DS,AX 
    mov ah,1
    int 21H 
    mov cl,al
    SUB cl,30H
    mov ch,0  
        
    mov ah,2 
    mov dl,0DH 
    int 21H 
    mov dl,0ah 
    int 21H
    
    mov ah,1
    int 21H 
    mov bl,al  
    sub bl,30H
     
    mov ah,2 
    mov dl,0dh 
    int 21H 
    mov dl,0ah 
    int 21H                
      SRT:
      cmp cl,bl
      jg EXT
      mov ax,cx
      mov bh,2
      div bh                                                  
      cmp ah,0                  
      je AB                 
      add cl,1                       
      jmp SRT                                                          
     AB:    
     mov dl,cl
     add dl,30h
     mov ah,2
     int 21H
     add cl,1
     mov ch,0
     cmp cl,bl       
     jmp SRT            
    EXT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
         END MAIN