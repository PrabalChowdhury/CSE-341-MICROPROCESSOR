.MODEL SMALL

.STACK 100H

.DATA
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX

        mov ah,1
        int 21h
        mov bl,al
        sub bl,30h 

        mov ah,1
        int 21h
        sub al,30h
        mov bh,0
        SRT:
        cmp bh,al
        je  AB
        add dl,bl 
        inc bh
        loop SRT
        AB:
        add dl,30h
        mov ah,2
        int 21h

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN