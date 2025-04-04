.model samll
.stack 0x100

.code

var db ?

.data

mov ax,@data
mov ds,ax

mov ax,0

mov ah,0x1
int 21h

sub al,30
mov var,al

hlt
.exit