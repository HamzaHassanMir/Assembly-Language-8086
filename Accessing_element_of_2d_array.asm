.model small
.stack 0x100

.data
array1 db 1,2,3
       db 3,4,5
       db 6,9,8
var db ?       

.code
mov ax,@data
mov ds,ax

mov bx,offset array1

mov al,2 ;row index
mov dl,3 ;total cols
mov dh,1 ;col index

mul dl
add al,dh

mov si,ax

mov al,[bx+si]
mov var,al
     
hlt     
.exit