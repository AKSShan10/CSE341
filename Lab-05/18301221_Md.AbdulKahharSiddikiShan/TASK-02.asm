.MODEL SMALL

.STACK 100H

.DATA

b db 3 dup <?>
MAX DB ? 

MSG1 DB "Enter Three numbers: $"
MSG2 DB "Largest Number: $"

       
.CODE
MAIN PROC

    ;initizlize DS
    
    MOV AX,@DATA
    MOV DS,AX
    
    ; enter your code here 
    
    ;MOV AX,@DATA
    ;MOV DS,AX
    LEA DX,MSG1     ;printing Enter Three numbers:
    MOV AH,9
    INT 21H 
    
    MOV CX,3
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
        
    ;MOV AX,@DATA
    ;MOV DS,AX
    
    
    LEA DX,MSG2     ;printing Largest Number:
    MOV AH,9
    INT 21H 
    
    MOV AL,30H
    MOV MAX,AL
    
     
    
    ;LEA SI,b
    ;CMP CX,3
    
    ;OUTPUT:
    
     ;   MOV AH,2
      ;  MOV DL,[SI]
       ; INT 21H
        ;INC SI
       ; LOOP OUTPUT
       
    LEA SI,b
    MOV CX,3   
        
    Maximum_value: 
            
        MOV AL,[SI] 
        ;MOV DL,AL
        MOV BL,MAX      ;Keeping BL = MAX
        ;INT 21H
        CMP AL,BL
        JG Maximum:
        
        JMP INCREMENT
        
        
        Maximum:
            MOV MAX,AL
            JMP INCREMENT
        
        
        INCREMENT:
            INC SI
            LOOP Maximum_value


    MOV AH,2
    MOV DL,MAX     ;;printing Largest Number: 3
    INT 21H





;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN