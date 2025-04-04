.model small
.stack 0x100

.data
msg1 dw "Hello World$",0
msg2 dw 12 dup (?)

.code
mov ax,@data
mov ds,ax
mov es,ax

mov si,offset msg1
mov di,offset msg2

mov cx,12

copy_loop:
movsw

loop copy_loop

mov ah,0x9
int 21h

.exit