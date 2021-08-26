.MODEL SMALL
.STACK 100H
.DATA
X DB "N$"  
Y DB "Y$"
E db "1st side: $"
F db "2nd side: $"
G db "3rd side: $" 
.CODE
MAIN PROC       
    MOV AX,@DATA
    MOV DS,AX    
    ;CODE STARTS FROM HERE 
    lea dx, E
    mov ah, 9
    int 21H   
    mov ah,1
    int 21H 
    mov bl,al
    sub bl,30H
    mov bh,bl     
    mov ah,2 
    mov dl,0dh 
    int 21H 
    mov dl,0ah 
    int 21H
    lea dx, F
    mov ah, 9
    int 21H     
    mov ah,1
    int 21H 
    mov cl,al
    sub cl,30H
    mov CH,cl     
    mov ah,2 
    mov dl,0dh 
    int 21H 
    mov dl,0ah 
    int 21H
    lea dx, G
    mov ah, 9
    int 21H    
    mov ah,1                                
    int 21H                                 
    mov dl,al                               
    sub dl,30H
    mov al,dl     
    add bl,cl
    add cl,al 
    mov dl,al
    add dl,bh       
    CMP bl,al
    JG f_con
    jmp out_1:                
    s_con:  
    CMP dl,CH                          
    JG out_2                               
    jmp out_1:                                                                          
    f_con:
    CMP cl,bh
    JG s_con 
    jmp out_1:        
    out_1:      
    mov ah,2 
    mov dl,0dh 
    int 21H 
    mov dl,0ah 
    int 21H     
    LEA DX, X
    mov ah, 9
    int 21H    
    jmp EXIT
    out_2:        
    mov ah,2 
    mov dl,0dh 
    int 21H 
    mov dl,0ah 
    int 21H     
    LEA dx, Y
    mov ah, 9
    int 21H    
    jmp Exit                               
    
    Exit:
    mov AX,4CH
    int 21H
    MAIN ENDP
         END MAIN

