.model small
.stack 100h

.data
msg db "Hello World",0
len equ $-msg
.code
mov ax,@data
mov ds,ax

mov cx,len

mov ax,0xB800
mov es,ax
mov di,0
lea bx,msg
mov si,0

display:
mov al,[bx+si]
mov es:[di],al

add di,2
inc si

loop display

.exit