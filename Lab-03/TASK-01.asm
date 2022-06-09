; 

.MODEL SMALL

.STACK 100H

.DATA

MSG1 DB '1st input: $'
MSG2 DB '2nd input: $'
MSG3 DB '3rd input: $'
       
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
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG2     ;printing 2nd input
    MOV AH,9
    INT 21H 
    
    MOV AH,1 
    INT 21H
    MOV CL,AL           ;taking 2nd input    CL
    
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
    
    MOV AH,1 
    INT 21H
    MOV DH,AL           ;taking 3rd input     DH
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H  
    
    CMP BL,CL
    JL MIN_CHECKER1         ;CHECKING 1st input<2nd input  
    
    CMP CL,DH 
    JL MIN_CHECKER3     ;CHECKING 2nd input<3rd  
    
    MOV AH,2     
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    MOV DL,DH  ;PRINTING 3RD INPUT AS MIN
    INT 21H   
    JMP end
    
    
    
    
    MIN_CHECKER1:
        CMP BL,DH          ;CHECKING 1ST INPUT<3RD INPUT 
        JL  MIN_CHECKER2 
    
    
    
    
    MIN_CHECKER2:
        MOV AH,2    
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        MOV DL,BL     ;printing 1st input as min
        INT 21H 
        JMP end
    
    MIN_CHECKER3: 
        MOV AH,2     
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        MOV DL,CL  ;PRINTING 2ND INPUT AS MIN
        INT 21H   
        JMP end
    
    
    
    end:


MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN


;exit to DOS



