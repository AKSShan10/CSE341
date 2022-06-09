 ; 

.MODEL SMALL

.STACK 100H

.DATA
MSG1 DB 'Enter First Initial: $'
MSG2 DB 'Enter Second Initial: $'
MSG3 DB 'Enter Third Initial: $'

       
.CODE
MAIN PROC

;initizlize DS

; enter your code here
 
MOV AX,@DATA
MOV DS,AX
LEA DX,MSG1
MOV AH,9
INT 21H 

MOV AH,1   ;taking the input of 1st initial
INT 21H
MOV BL,AL  

MOV AH,2   ;For new line
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H
   

MOV AX,@DATA
MOV DS,AX
LEA DX,MSG2
MOV AH,9
INT 21H   

MOV AH,1     ;taking the input of 2nd initial
INT 21H
MOV CL,AL  

MOV AH,2     ;For new line
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 
           
           
MOV AX,@DATA
MOV DS,AX
LEA DX,MSG3
MOV AH,9
INT 21H

MOV AH,1     ;taking the input of 3rd initial
INT 21H
MOV CH,AL  

MOV AH,2   ;print the input of 3rd
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 
MOV DL,CH
INT 21H

MOV AH,2    ;print the input of second
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 
MOV DL,CL
INT 21H  

MOV AH,2    ;print the input of 1st
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 
MOV DL,BL
INT 21H

;exit to DOS



