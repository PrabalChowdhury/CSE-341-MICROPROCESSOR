.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    x db "Divisible by : $"
    a db 100 
    b db 10
    c dw 1000 
    m dw ?
    n dw ?
    p dw ?
    q dw ?
    r dw ?
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE   
  ;--------------1st 2 digit------------------  
        mov ah,1
        int 21h
        sub al,30h  
        mul b
        mov bl,al           
        mov ah,1
        int 21h
        sub al,30h
        add bl,al
        mov m,bx ;1st Number Stored in m
                
  ;-------new line------------     
        mov ah,2
        mov dl, 0DH
        int 21h
        mov dl, 0ah
        int 21h
   
  ;-------2nd 2 digit-----------------        
        mov ah,1
        int 21h
        sub al,30h  
        mul b
        mov cl,al           
        mov ah,1
        int 21h
        sub al,30h
        add cl,al
        mov ch,0
        mov n,cx ;2nd Number Stored in n
                 
  ;------Multiplication Product---------     
        mov ah,0
        mov ax,m
        mov bh,0
        mov bl,0
        mov bx,n
        mul bl
        mov bx,ax ;Product stored in BX 
        mov p,ax
  ;---------------------------------------     
            
        mov ch,0
        mov cl,1 ;staring value of divide
        mov ah,2
        mov dl, 0DH
        int 21h
        mov dl,0ah
        int 21h
        
        lea dx,x
        mov ah,9
        int 21h
  ;-----------------check remainder & Print--------------    
        check:
        mov dx,0     
        mov ax,p
        div cx
        cmp dx,0
        jne divis
        jmp print
        
        print:
        mov dx,cx
        cmp dx,9h
        jg chk              
        add dx,30h
        mov ah,02
        int 21h
        mov dl,20h
        mov ah,02
        int 21h 
        inc cx
        cmp cx,p
        jl check
        jmp exit
        
  ;-----------------check 2 digit print-------------------    
        chk:
        cmp dx,3E7h
        jg chk2
        cmp dx,63h
        jg chk1
        mov ax,cx 
        div b
        mov bx,ax
        mov dx,ax
        add dl,30h
        mov ah,02
        int 21h
        
        mov dl,bh
        add dl,30h
        mov ah,02
        int 21h
        mov dl,20h
        mov ah,02
        int 21h
        jmp divis
  ;-----------------------check 3 digit------------------  
        chk1:
        mov q,cx
        mov ax,cx
        div a
        mov bh,0
        mov bl,ah
        mov dl,al
        add dl,30h
        mov ah,02
        int 21h
        cmp bx,9h
        jle chk4        
        mov ax,bx
        div b
        mov bh,ah
        mov dl,al
        add dl,30h
        mov ah,02
        int 21h
        mov dl,bh
        add dl,30h
        mov ah,02
        int 21h
        mov dl,20h
        mov ah,02
        int 21h
        mov cx,q
        jmp divis 
                       
  ;------------------------check 4 digit-------------       
        chk2:
        mov q,cx
        mov ax,q
        div c
        mov r,dx
        mov bx,0
        mov dx,ax
        mov dh,0
        add dl,30h
        mov ah,02
        int 21h
        cmp r,63h
        jle chk3
        mov ax,q
        div a
        mov bh,0
        mov bl,ah
        mov dl,al
        add dl,30h
        mov ah,02
        int 21h        
        mov ax,bx
        div b
        mov bh,ah
        mov dl,al
        add dl,30h
        mov ah,02
        int 21h
        mov dl,bh
        add dl,30h
        mov ah,02
        int 21h
        mov dl,20h
        mov ah,02
        int 21h
        mov cx,q
        jmp divis 
        
  ;------------------check 4 digit middle 0-------------------    
        chk3:
        mov dl,30h
        mov ah,02
        int 21h
        mov ax,r
        div b
        mov bh,ah
        mov dx,ax
        add dl,30h
        mov ah,02
        int 21h
        mov dl,ah
        add dl,30h
        mov ah,02
        int 21h
        mov dl,20h
        mov ah,02
        int 21h
        mov cx,q
        jmp divis 
  ;------------------Check 3 digit middle 0----------------------      
        chk4:
        mov dl,30h
        mov ah,02
        int 21h
        mov dl,bl
        add dl,30h
        mov ah,02
        int 21h
        mov dl,20h
        mov ah,02
        int 21h
        mov cx,q
        jmp divis
  ;----------------------loop(1 to Product)----------------------     
        divis:
        inc cx 
        cmp cx,p 
        jl check
        jmp exit
        
        
        ; YOUR CODE ENDS HERE
        exit:
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN