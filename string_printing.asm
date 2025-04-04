.model small
.stack 0x100

.data
msg db "Hello World",0

.code
mov ax,@data
mov ds,ax

mov ax,0xB800
mov es,ax

mov di,0
mov si,0
mov bx,offset msg


display:
mov al,[bx+si]
cmp al,0
je end

mov es:[di],al

add di,2
inc si
jmp display

end:
.exit