.model small
.stack 0x100

.data
    N db 5
    M db 8

.code
Main Proc
        
    mov ax,@data
    mov ds,ax
    
    mov al,N
    mov ah,M
    mov dx,0
    
Cal:

    add dl,al
    
    inc al
    cmp al,ah
    jle cal


    
Main Endp


.exit