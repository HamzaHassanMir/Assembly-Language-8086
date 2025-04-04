.model small
.stack 0x100

.data
msg db "Hello World",0
len equ $-msg
.code
mov ax,@data
mov ds,ax

mov ax,0xB800
mov es,ax
mov cx,len

mov di,0
mov si,0
mov bx,offset msg

display:
mov al,[bx+si]
mov es:[di],al
inc di
mov byte ptr es:[di],11100100b
inc di
inc si

loop display


.exit