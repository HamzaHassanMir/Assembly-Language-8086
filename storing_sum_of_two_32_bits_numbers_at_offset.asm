.model small
.stack 0x100

.data
.code

    mov ax,0x0398
    mov bx,0x1F54
    
    mov cx,0xF02E
    mov dx,0xC0A1

    mov [0x1000],ax
    mov [0x1000 +2],bx
    
    mov [0x1008],cx
    mov [0x1008 + 2],dx
               
    add ax,cx
    adc bx,dx
    
    mov [0x1010],ax
    mov [0x1010 + 2],bx 

.exit