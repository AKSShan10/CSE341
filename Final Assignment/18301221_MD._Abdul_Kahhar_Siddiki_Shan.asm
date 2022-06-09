;1.	Take two numbers m (2 digit decimal) and n (2 digit decimal ) as input. Multiply 'm'
;and 'n' and show the product "p" is divisible by which of the following 
;numbers from 1 to "p".



;Input:
;10
;10  [ Here the product, p is 100 ]

;Output:
;Divisible by: 1 2 4 5 10 20 25 50

.MODEL SMALL

.STACK 100H

.DATA                  

MSG1 DB "Input: $"
MSG2 DB "Output: $" 
MSG3 DB "Divisible by: $"
MSG4 DB " $" 
X DB ?
Y DB ?
m DB ?
n DB ? 
p DW ?
COUNT DW ?
RESULT DW ? 
N1 DW ? 
REMAINDER DW ? 
RESULT3 DB ?
REMAINDER3 DB ?


       
.CODE
MAIN PROC

    ;initizlize DS
    
    MOV AX,@DATA
    MOV DS,AX
    
    ; enter your code here  
    LEA DX,MSG1     ;Input:
    MOV AH,9
    INT 21H    
    
    MOV AH,2
    MOV DL,0DH       ;For next line
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    MOV AH,1         ;Taking input
    INT 21H 
     
    SUB AL,30H
    MOV X,AL 
    
    MOV AH,1         ;Taking input
    INT 21H 
             
    SUB AL,30H   
    MOV Y,AL      
       
     
     
    MOV AL,X      ;DECIMAL INPUT
    
    MOV BL,10        ;Multiplying with 10
    MUL BL
    ;MOV X,AL   
    
    ADD AL,Y
    
    MOV m,AL  ;2 digit decimal number  10->0Ah
    
    MOV AH,2
    MOV DL,0DH       ;For next line
    INT 21H
    MOV DL,0AH
    INT 21H     
    
    
    MOV AH,1         ;Taking input
    INT 21H 
     
    SUB AL,30H
    MOV X,AL 
    
    MOV AH,1         ;Taking input
    INT 21H 
             
    SUB AL,30H   
    MOV Y,AL    
    
    MOV AH,2
    MOV DL,0DH       ;For next line
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    LEA DX,MSG2     ;Output:
    MOV AH,9
    INT 21H  
       
    MOV AH,2
    MOV DL,0DH       ;For next line
    INT 21H
    MOV DL,0AH
    INT 21H  
    
    LEA DX,MSG3     ;Divisible by
    MOV AH,9
    INT 21H 
       
     
     
    MOV AL,X      ;DECIMAL INPUT
    
    MOV BL,10     ;Multiplying with 10
    MUL BL
    MOV X,AL   
    
    ADD AL,Y
    
    MOV n,AL  ;2 digit decimal number       10->0Ah
    
    
    MOV AL,m
    MOV BL,n 
    MUL BL     
    
    
    ;MOV BL,2H
    MOV p,AX   ;storing the product value in p
    MOV AX,p 
    MOV DX,0H  
    
    
    
    MOV BX,2H
    DIV BX
    MOV N1,AX
    
    MOV COUNT,1H  
    
    ;MOV AH,2
;    MOV DX,PRODUCT
;    INT 21H 
     
    ;MOV DX,0H
    
    WHILE:  
        MOV CX,COUNT
        CMP CX,N1 
        JG END  
        
        MOV AX,p 
        MOV DX,0H
        MOV BX,COUNT 
        DIV BX 
        MOV RESULT,BX 
        
        CMP DX,0H     ;CHECKING THE REMAINDER
        JE Divisible 
        
        JMP INCREMENT
        
             
        Divisible: 
        CMP RESULT,9H
        JG Two_digit_output           ; Divisible value>9
        
       ; MOV AH,2
;        MOV DL,0DH       ;For next line
;        INT 21H
;        MOV DL,0AH
;        INT 21H 
           
        ADD RESULT,30H
        MOV AH,2
        MOV DX,RESULT
        INT 21H
        
        LEA DX,MSG4     ;Space
        MOV AH,9
        INT 21H 
          
        JMP INCREMENT
        
        
        Two_digit_output:
        ;MOV AH,2
;        MOV DL,0DH       ;For next line
;        INT 21H
;        MOV DL,0AH
;        INT 21H  
        CMP RESULT,063H 
        JG Three_digit_output
        
        MOV DX,0H
        
        MOV AH,0H
        MOV AX,RESULT
        MOV BX,0AH
        DIV BX
        
        ADD AX,30H
        MOV RESULT,AX 
        
        ADD DX,30H
        MOV REMAINDER,DX
        
        MOV AH,2
        MOV DX,RESULT
        INT 21H  
        
        
        MOV AH,2
        MOV DX,REMAINDER
        INT 21H  
        
        LEA DX,MSG4     ;Space
        MOV AH,9
        INT 21H 
        
        JMP INCREMENT 
        
        Three_digit_output:             ;Divisivle value>99
        MOV DX,0H
        
        MOV AH,0H
        MOV AX,RESULT
        MOV BX,0AH
        DIV BX   
        
        MOV BL,0AH              ;division whree dividend in AX,
        DIV BL
        
        ADD AL,30H
        MOV RESULT3,AL 
        
        ADD AH,30H
        MOV REMAINDER3,AH 
        
        ADD DX,30H
        MOV REMAINDER,DX
        
        MOV AH,2
        MOV DL,RESULT3
        INT 21H  
        
        MOV AH,2
        MOV DL,REMAINDER3
        INT 21H 
        
        
        MOV AH,2
        MOV DX,REMAINDER
        INT 21H  
        
        LEA DX,MSG4     ;Space
        MOV AH,9
        INT 21H  
        
        JMP INCREMENT
        
        INCREMENT:
        ADD CX,1H
        MOV COUNT,CX
        JMP WHILE
         

  
    
         


    END:

    ;exit to DOS
    MOV AX,4C00H
    INT 21H

MAIN ENDP
   END MAIN