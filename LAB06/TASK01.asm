.MODEL SMALL
.STACK 100H
.DATA
array DB 15 dup[?]
   
.CODE
MAIN PROC
    ;INITIALIZING DS
    MOV AX,@DATA
    MOV DS,AX 
      
    mov cx,16
    
    lea si,array
    
    INPUT:
    mov ah,01h
    int 21h
    mov [si],al
    
    inc si
    loop INPUT 
        
    mov ah,2
    mov dl,0DH
    int 21H
    mov dl,0AH
    int 21H
      
    mov cx,15
    mov ah,02h
    lea si,array
    
    mov bh,0    
    OUTPUT:
 
    mov dl,[si]
    cmp dl,32
    je SPACE
    cmp dl,97
    jl UPPERCASE 
    jge LOWERCASE
     
     
    jmp OUTPUT
    jmp EXIT 
     
    UPPERCASE: 
    add dl,20h
    int 21h
    inc si
    inc bh
    cmp bh,15
    je EXIT
    jmp OUTPUT
             
             
    LOWERCASE: 
    sub dl,20h
    int 21h 
    inc si
    inc bh
    cmp bh,15
    je EXIT
    jmp OUTPUT
     
     SPACE:
     int 21h 
     inc si
     jmp OUTPUT

    EXIT:
    MOV AX, 4c00H
    INT 21H
    MAIN ENDP
END MAIN