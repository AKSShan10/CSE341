;LAB-05 TASK-04
.MODEL SMALL

.STACK 100H

.DATA
 
;SUM DW ?

POS DW ?
MSG1 DB 'ENTER A HEX VALUE: $'
MSG2 DB 'CORRESPONDING DECIMAL IS $'
MSG3 DB 'REPEAT? : $'
MSG4 DB 'ILLEGAL CHARACTER, INSERT AGAIN: $'

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here
WHILE:

    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG1     ;printing 1st input
    MOV AH,9
    INT 21H 
    
    MOV AH,1 
    INT 21H
    MOV BL,AL           ;taking 1st input  in BL
     
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        ;Next line
    
    CMP BL,40H
    JLE DECIMAL
    
    
    CMP BL,47H
    JG WRONG_INPUT 
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG4     ;printing for repeat? :
    MOV AH,9
    INT 21H


WRONG_INPUT:      ;ILLEGAL CHARACTER, INSERT AGAIN: 
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG4     ;printing for repeat? :
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV BL,AL           ;taking 1st input  in BL
    
    SUB BL,11H 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        ;Next line
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG2     ;printing DECIMAL OUTPUTt
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,31H   ; PRINTING 1
    INT 21H
     
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP Repeat





DECIMAL:
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG2     ;printing DECIMAL OUTPUTt
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP Repeat


Repeat:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        ;Next line
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG3     ;printing for repeat? :
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV BL,AL           ;taking repeat input  
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
     
    CMP BL,6Bh 
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        ;Next line

JE WHILE:
    CMP BL,53H
    JE end
    JMP end



end:

;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN