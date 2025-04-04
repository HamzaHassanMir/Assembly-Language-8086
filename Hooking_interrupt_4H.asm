.model small
.stack 0x100

.data
.code
mov ax,@data
mov ds,ax

mov ax,0
mov es,ax

mov word ptr es:[4*4+0],isr4
mov word ptr es:[4*4+2],cs

mov al,127
mov bl,1
add al,bl

into
.exit

isr4 Proc
    jmp l1
    msg db "Overflow flag is set$"
    l1:
    mov dx,offset msg
    mov ah,9
    int 21h
    
    iret
isr4 Endp    