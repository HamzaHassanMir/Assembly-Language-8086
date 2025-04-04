.model small
.stack 0x100
.data
.code

mov ax,@data
mov ds,ax

mov ax,0
mov es,ax

mov word ptr es:[3*4+0],isr3
mov word ptr es:[3*4+2],cs

int 0x3

.exit

isr3 Proc
    jmp l1
    msg: db "Key Pressed!$"
    l1:
    mov dx,offset msg
    mov ax,0x9
    int 0x21    
    IRET    
isr3 Endp    