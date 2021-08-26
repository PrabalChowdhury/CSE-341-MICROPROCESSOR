.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE   
    P DB 1
    Q DB 2
    R DB 3
    S DB 5
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        ; YOUR CODE STARTS HERE   
        MOV AL, P
        MOV BL, Q
        MUL BL  
        MOV CL,AL
        MOV DL, Q
        MOV AL, P
        ADD AL,DL
        MOV DL, P
        MOV BL, R
        SUB BL,DL
        MUL BL
        MOV DL, S
        DIV DL
        MOV Dl, Q 
        MOV BL, R
        ADD AL,BL
        ADD AL,DL
        SUB AL,CL 
        ; YOUR CODE ENDS HERE
        MOV AX, 4C00H
        INT 21H      
    MAIN ENDP
    END MAIN
