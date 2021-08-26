.MODEL SMALL

.STACK 100H

.DATA

A DB 5 dup(?)
Y dw $-A

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

mov ax,data
mov ds,ax
mov si,0


INPUT:
cmp si,5
je CHECKIN
mov ah,1
int 21h      

sub al,30h
mov a[si],al 
add si,1
loop INPUT

CHECKIN:
mov si,0

mov dl,0ah
mov ah,2
int 21h 
mov dl,0dh
mov ah,2
int 21h

mov cx,Y-1
mov si,0

AA:
lea si,A
mov bx,0
AB:
add bx,1
mov al,a[si]
add si,1
cmp al,A[si]
jb AC
xchg al,A[si]
mov A[si-1],al
AC:
cmp bx,cx
jl  AB
loop AA 

mov si,0

print_:
cmp si,5h
je EXIT
mov dl,A[si] 
add dl,30h  
mov ah,2
int 21h
add si,1

loop print_

EXIT:

MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN



