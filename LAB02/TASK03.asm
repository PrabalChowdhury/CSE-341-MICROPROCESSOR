.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    X db 8
    Y db 3
    Z db 6
.CODE
    MAIN PROC        
        MOV AX, @DATA
        MOV DS, AX        
        ; YOUR CODE STARTS HERE   
        MOV AL, X
        MOV BL, Y
        MOV DL, Z
        MUL BL
        DIV DL       
        ; YOUR CODE ENDS HERE     
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    END MAIN
