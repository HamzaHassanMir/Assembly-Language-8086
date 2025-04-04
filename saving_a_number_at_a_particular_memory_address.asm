.model small

.stack 0x100

.data
.code

    mov ax,0xF000
    mov ds,ax
    
    mov bx,0xEDC0
    mov si,0
    
    mov [bx+si+1],0xBD


.exit
