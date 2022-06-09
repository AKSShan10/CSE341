.MODEL SMALL

.STACK 100H

.DATA

b db 5 dup <?> 

MSG1 DB "Enter array input: $"
MSG2 DB "Array: $" 
MSG3 DB "Array in ascending order: $"

       
.CODE
MAIN PROC

    ;initizlize DS
    
    MOV AX,@DATA
    MOV DS,AX
    
    ; enter your code here 
    
    ;MOV AX,@DATA
    ;MOV DS,AX
    LEA DX,MSG1     ;printing Enter array input:
    MOV AH,9
    INT 21H 
    
    MOV CX,5
    LEA SI,b
    
    while:
    
        MOV AH,1
        INT 21H
        
        MOV [SI],AL
        INC SI
        LOOP while
        
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        ;For next line    
    
    LEA DX,MSG2     ;printing  Array
    MOV AH,9
    INT 21H
     
   
    MOV CX,5
    LEA SI,b
    
    OUTPUT:
     
       MOV AH,2
       MOV DL,[SI]
       INT 21H
       INC SI
       LOOP OUTPUT

    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        ;For next line  
    
    
    ;MOV CX,5 
    MOV CL,5
            
    LEA SI,b
    
    MOV AL,0
    
    Loop1:
    
        CMP AL,5
        JGE ENDING
        
        MOV AH,0 
        SUB CL,AL
        SUB CL,1
        
        Loop2:
            CMP AH,CL
            JGE end    
            MOV BL,[SI]
            MOV BH,[SI+1]
            CMP BL,BH
            JG SWAP
            JMP INCREMENT
    
        
            SWAP:
                MOV DL,[SI]
                MOV DH,[SI+1];
                MOV [SI],DH   ;SWAPING
                MOV [SI+1],DL 
                JMP INCREMENT
                
            INCREMENT:
                INC AH
                INC SI
                JMP Loop2 
                
    
        end:
            JMP INCREMENT1
            
            
        INCREMENT1:
            INC AL
            MOV CL,5
            MOV SI,0
            JMP Loop1 
            
    
    ENDING:
    
    LEA DX,MSG3     ;printing Array in ascending order:
    MOV AH,9
    INT 21H
    
     
    
    MOV CX,5
    LEA SI,b
    
    Final_Output:
     
       MOV AH,2
       MOV DL,[SI]
       INT 21H
       INC SI 
       
       LOOP Final_Output


;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP