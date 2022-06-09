 ; 

.MODEL SMALL

.STACK 100H

.DATA
MSG1 DB 'ENTER A HEX DIGIT: $'
MSG2 DB 'IN DECIMAL IT IS $'

       
.CODE
MAIN PROC

;initizlize DS

; enter your code here
 
MOV AX,@DATA
MOV DS,AX

LEA DX,MSG1
MOV AH,9
INT 21H 

MOV AH,1   ;taking the input of HEX digit
INT 21H
MOV BL,AL
SUB BL,17D  

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


MOV AH,2   ;Printing 1
MOV DL,49D 
INT 21H

MOV AH,2   ;printinh the seconf digit
MOV DL,BL 
INT 21H  


;exit to DOS