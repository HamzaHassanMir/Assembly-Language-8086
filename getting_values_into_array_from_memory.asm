.model
.stack 0x100
.data

arr dw 33 dup(0)
size dw 33
    
.code
Main Proc
    mov ax,@data
    mov ds,ax
    
    mov ax,0xA100
    mov es,ax
    
    mov bx,offset arr
    mov si,0x0Aff 
     
    mov cx,size
    
loop1:    
    mov ax ,es:[si]
    mov [bx],ax
    inc si
    inc bx
loop loop1    
    

Main Endp
.exit