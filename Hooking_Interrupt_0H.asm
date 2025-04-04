.model small
.data
.code

mov ax,@data
mov ds,ax
mov ax,0

mov es,ax

mov word ptr es:[0*4+0],isr0
mov word ptr es:[0*4+2],cs

mov ax,100
mov bx,0

div bx
.exit

ISR0 Proc
    jmp l1
    msg db "Divide by Zero Exception!$"
    l1:
    mov dx,offset msg
    mov ah,0x9
    int 21h

    IRET
ISR0 Endp        