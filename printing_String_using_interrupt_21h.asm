.model small
.stack 100h

.data
msg dw "Hello World$"

.code

mov ax,@data
mov ds,ax

mov ax,0

mov dx,offset msg

mov ah,0x9
int 21h

.exit