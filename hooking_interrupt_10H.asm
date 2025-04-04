.model small
.stack 0x100

.data
.code
mov ax,@data
mov ds,ax

mov ax,0
mov es,ax

mov word ptr es:[0x10*4+0],isr10
mov word ptr es:[0x10*4+2],cs

int 0x10

.exit

isr10 Proc
    jmp l@1
    msg db "Custom int 10H is invoked!"
    l@1:
    mov dx,offset msg
    mov ah,0x9
    int 21h
    
    iret
isr10 Endp