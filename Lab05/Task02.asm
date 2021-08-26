.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC       
    MOV AX,@DATA
    MOV DS,AX 
    mov ah,2
    mov dl,41h
      SRT:
      cmp dl,5Bh
      jge EXT
      int 21H
      inc dl
      mov cl,dl
      
      mov ah,2        
      mov dl,0dh
      int 21h
      mov dl,0ah
      int 21h
      
      mov dl,cl
      jmp SRT
    EXT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
         END MAIN