.model small
.stack 0x100
.data
arr db 0xA,0XB,0XB,0XA

.code
Main Proc
    
    mov ax,@data
    mov ds,ax
    
    mov cx,0    
    mov cx,4
    mov si,offset arr

Pushloop:
     
    mov ax,[si]
    mov ah,0
    push ax
    inc si
    
loop Pushloop    

    mov cx,0    
    mov cx,4
    mov si,offset arr     
     
compare:  
    pop ax
    cmp [si],al
    jne exit
    inc si
loop compare
    mov dl,1
    
return:        
Main Endp
.exit
exit:
    mov dl,0
    jmp return