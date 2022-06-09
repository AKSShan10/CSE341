;y*x/z
.MODEL SMALL

.STACK 100H

.DATA


       
.CODE
MAIN PROC

;initizlize DS

; enter your code here 
mov ax, 10 ;Y
mov bl, 5  ;z
mov cl, 3  ;x 

div bl  ;x/z

mov bl,cl 
mul bl    ;y*x/z

;exit to DOS


