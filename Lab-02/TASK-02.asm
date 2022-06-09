; 

.MODEL SMALL

.STACK 100H

.DATA

       
.CODE
MAIN PROC

;initizlize DS

; enter your code here
 
MOV AH,1 
INT 21H
MOV BL,AL
SUB BL,32

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 
MOV DL,BL
INT 21H


;exit to DOS



