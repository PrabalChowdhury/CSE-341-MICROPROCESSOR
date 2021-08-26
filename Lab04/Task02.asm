.MODEL SMALL
.STACK 100H
.DATA
     E DB "1st Input $"
     F DB "2nd Input $"
     G DB "divisable $"
     H DB "not divisable $" 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX     
    lea dx, E
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h        
    mov bh, al
    
    mov ah, 2        
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, F
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h        
    mov bl, al
    mov ah, 2        
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    sub bh, 030h
    mov ah, 00h
    mov al, bh
    sub bl, 030h
    mul bl
    mov dl,bl
    mov cx, ax
    mov bl, 02h
    div bl
    cmp ah, 0
    JE K
    JMP L          
    K: 
    mov ax, cx
    mov bl, 03h
    div bl    
    cmp ah, 0
    JE J 
    JMP L    
    J:
    lea dx, G
    mov ah, 9
    int 21h        
    JMP exit   
    L: 
    lea dx, H
    mov ah, 9
    int 21h    
    JMP Exit 
    Exit:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN
