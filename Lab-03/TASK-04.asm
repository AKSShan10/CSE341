; 

.MODEL SMALL

.STACK 100H

.DATA
  
A DB ?
B DB ?
C DB ?
 
MSG1 DB '1st side: $'
MSG2 DB '2nd side: $'
MSG3 DB '3rd side: $' 
MSG4 DB 'Y$'
MSG5 DB 'N$'
       
.CODE
MAIN PROC

;initizlize DS

; enter your code here
MOV AX,@DATA
MOV DS,AX

LEA DX,MSG1     ;printing   1st side:
MOV AH,9
INT 21H

MOV AH,1 
INT 21H
SUB AL,30H
MOV A,AL           ;taking 1st input  in A  

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH  ; FOR NEW LINE
INT 21H


MOV AX,@DATA
MOV DS,AX

LEA DX,MSG2     ;printing  2nd side:
MOV AH,9
INT 21H

MOV AH,1 
INT 21H
SUB AL,30H
MOV B,AL           ;taking 2nd input  in B   

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH  ; FOR NEW LINE
INT 21H
       
MOV AX,@DATA
MOV DS,AX

LEA DX,MSG3     ;printing  3rd side:
MOV AH,9
INT 21H

MOV AH,1 
INT 21H
SUB AL,30H
MOV C,AL           ;taking 3rd input  in C

MOV AL,A
ADD AL,B          ;A+B
MOV BL,C
CMP AL,BL
JG CHECK_BC  

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH  ; FOR NEW LINE
INT 21H

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG5     ;printing   1st side:
MOV AH,9
INT 21H
JMP end


CHECK_BC:
ADD BL,B       ;B+C
MOV AL,A
CMP BL,AL
JG CHECK_CA 

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH  ; FOR NEW LINE
INT 21H

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG5     ;printing   N
MOV AH,9
INT 21H
JMP end


CHECK_CA:
ADD AL,C      ;C+A
MOV BL,B
CMP AL,BL
JG TRUE 
MOV AX,@DATA
MOV DS,AX

LEA DX,MSG5     ;printing   1st side:
MOV AH,9
INT 21H
JMP end

TRUE:   

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH  ; FOR NEW LINE
INT 21H

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG4     ;printing   1st side:
MOV AH,9
INT 21H
JMP end




end:


MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN


;exit to DOS