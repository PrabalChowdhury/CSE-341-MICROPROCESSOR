.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        ; YOUR CODE STARTS HERE  
        MOV  AX, 28
        MOV  BX, 19
        ADD CX,AX
        ADD AX,BX
        SUB AX,CX
        ADD BX,CX
        SUB BX,AX
        SUB CX,BX
        ; YOUR CODE ENDS HERE
        MOV AX, 4C00H
        INT 21H      
    MAIN ENDP
    END MAIN
