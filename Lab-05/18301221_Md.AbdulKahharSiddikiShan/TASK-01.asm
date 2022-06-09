.MODEL SMALL

.STACK 100H

.DATA

b db 11 dup <?>
 

MSG1 DB "Enter Name: $"

       
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
    
    MOV CX,11
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
    
     
   
    ;MOV CX,11
    ;LEA SI,b
    
    ;OUTPUT:
     ;
      ;  MOV AH,2
       ; MOV DL,[SI]
        ;INT 21H
        ;INC SI
        ;LOOP OUTPUT

    MOV CX,11
    LEA SI,b
    
    CHARACTER_CONVERSION:
    
        MOV AL,[SI] 
        MOV DL,AL
        ;INT 21H
        CMP AL,65     
        JGE CAPITAL_TO_SMALL

        
        JMP INCREMENT
        
        
        CAPITAL_TO_SMALL:
            CMP AL,97 
            JGE Small_to_Capital
            ADD AL,32
            MOV [SI],AL
            JMP INCREMENT
        
        Small_to_Capital:
            SUB AL,32
            MOV [SI],AL
            JMP INCREMENT
        
        
        INCREMENT:
            INC SI
            LOOP CHARACTER_CONVERSION

         
         
     MOV CX,11
     LEA SI,b
    
    OUTPUT:
     
       MOV AH,2
       MOV DL,[SI]
       INT 21H
       INC SI
       LOOP OUTPUT



;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN