                   .model small
.stack 0x100

.code
.data

main proc
    
    mov si,0x1000
    mov di,0x2000
    mov bx,0x3000
    
    mov [si] ,0x3
    mov [di] ,0x2
    
    mov ax,0
    mov es,ax
    
    mov ax,0x1
    
    cmp ax,1
    je service1
    
    cmp ax,2
    je service2
    
    cmp ax,3
    je service3
    
    
return:

    int 0x65
    mov dx,[bx]    
        
main endp
.exit

service1:
    
    mov word ptr es:[0x65*4+0],isr1
    mov word ptr es:[0x65+4+2],cs
    jmp return

service2:

    mov word ptr es:[0x65*4+4],isr2
    mov word ptr es:[0x65+4+2],cs
    jmp return

service3:
     
    mov word ptr es:[0x65*4+6],isr3
    mov word ptr es:[0x65+4+2],cs 
    jmp return 
    

isr1 proc
    
    mov ax,[si]    
    add ax,[di]
    mov [bx],ax
    iret 
isr1 endp  

isr2 proc
    push dx
    mov ax,[si]    
    mul [di]
    mov [bx],ax
    mov [bx+2],dx 
    pop dx
    
    iret 
isr2 endp  

isr3 proc
    push dx
    mov ax,[si]    
    div [di]
    
    pop dx
    
    iret 
isr3 endp  