; A=C-(A+B)

.MODEL SMALL

.STACK 100H

.DATA


       
.CODE
MAIN PROC

;initizlize DS

; enter your code here 
mov ax, 2 ;A
mov bx, 3 ;B
mov cx, 8 ;C

add ax, bx
sub cx, ax
mov ax, cx

;exit to DOS



