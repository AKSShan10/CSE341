;5+8-(3+1)*(9-2)/4+(2*3)
.DATA


       
.CODE
MAIN PROC

;initizlize DS

; enter your code here 
mov al, 3 
mov ah, 1
add al, ah
mov cl, al ;(3+1)

mov bl, 9
mov bh, 2
sub bl, bh  ;(9-2)
mov ch, bl;

mov al, 2
mov bl, 3
mul bl ;(2*3)
mov dx,ax ;(2*3)

mov al, ch
mov bl, 4
div bl    ;((9-2)/4)) Stored in al
mov bl, al
mov al,cl
mul bl ; ax= 4

mov bx, 5
mov cx, 8
add bx,cx  ;5+8

add bx,dx ;(6+bx)

Sub bx,ax



;exit to DOS


