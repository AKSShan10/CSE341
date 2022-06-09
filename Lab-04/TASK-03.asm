;LAB-05 TASK-03
.MODEL SMALL

.STACK 100H

.DATA

X DB ?
Y DB ?

SUM DB ?
     
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here

MOV AH,1 
INT 21H
MOV X,AL           ;taking 1st input  in X
SUB X,30H  

MOV AH,1 
INT 21H
MOV Y,AL           ;taking 1st input  in X
SUB Y,30H  

MOV CH,0
MOV CL,X

MOV SUM,0
WHILE:
MOV BL,Y
ADD SUM,BL

loop WHILE

MOV Al, SUM
ADD AL,30H
MOV AH,2
MOV DL,AL
INT 21H


;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN