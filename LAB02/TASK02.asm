.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    A DB 12 
    B DB 7
    C DB 4
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        ; YOUR CODE STARTS HERE  
        MOV AL, A
        MOV BL, B
        MOV BL, C
        SUB AL,CL
        ADD AL,CL
        MOV P,AL
        ; YOUR CODE ENDS HERE
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    END MAIN
