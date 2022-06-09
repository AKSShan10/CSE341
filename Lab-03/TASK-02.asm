; 

.MODEL SMALL

.STACK 100H

.DATA  
N1 DB ?
N2 DB ? 

MSG1 DB '1st input: $'
MSG2 DB '2nd input: $'
MSG3 DB 'Result is $'
MSG4 DB 'Divisible$'
MSG5 DB 'Not divisible$'
       
.CODE
MAIN PROC

;initizlize DS

; enter your code here  
MOV AX,@DATA
MOV DS,AX

LEA DX,MSG1     ;printing 1st input
MOV AH,9
INT 21H 

MOV AH,1 
INT 21H
MOV BL,AL           ;taking 1st input  in BL  
SUB BL,30H  
MOV N1,BL

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG2     ;printing 2ndt input
MOV AH,9
INT 21H 

MOV AH,1 
INT 21H   
SUB AL,30H
MOV N2,AL
MOV AL,N2
MOV BL,N1
                
MUL BL     ;Applying multiplication between two inputs 
 
MOV CX,AX    ;storing the multilication OUTPUT value in CX
MOV CX,AX  

MOV BL, 10

DIV BL      ; Division
ADD AL,30H
MOV N1,AL        ;quotient
ADD AH,30H
MOV N2,AH        ;remainder

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG3     ;printing 3rd input
MOV AH,9
INT 21H

MOV AH,2         
MOV DL,N1  ;PRINTING 1st digit of multiplication output
INT 21H 
MOV DL,N2  ;PRINTING 2nd digit of multiplication output
INT 21H

MOV AX,CX
MOV BL,10
DIV BL
MOV DH,AH
ADD AH,30H 


CMP AH,30H
JE Divisible 

MOV AH,2
MOV DL,0DH      ;For next line
INT 21H
MOV DL,0AH
INT 21H

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG5     ;printing  Not divisible
MOV AH,9
INT 21H 
jMP end



Divisible: 
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H 

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG4     ;printing  Divisible
MOV AH,9
INT 21H

end:


MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN


;exit to DOS



