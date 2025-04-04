.model small
.stack 0x100
.data
Arr dw 0x1,0x2,0x04,0x08,0x05,0x07,0x06

.code
Main Proc
mov ax,@data
mov ds,ax
	
    mov cx,6
outerloop:
    mov si,0
 
    mov bx,cx
innerloop:
    
    mov ax,[Arr+si]
    mov dx,[Arr+si+2]

    cmp ax,dx
    jbe noswap

    mov [Arr + si],dx
    mov [Arr + si + 2],ax 

noswap:
    add si,2
    dec bx
    jnz innerloop
    
    dec cx
    jnz outerloop       

Main Endp

.exit