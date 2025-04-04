.model small
.stack 0x100

.data
.code
Main Proc
   
   mov cx,0 
   mov bx,0x1F00
   mov [bx],ax
   add cx,ax
   
   mov ax,0xA0B1
   mov [bx+2],ax
   add cx,ax 
   
   mov ax,0x1254
   mov [bx+4],ax
   add cx,ax
   
   mov ax,0x34EF
   mov [bx+6],ax
   add cx,ax
   
   mov ax,0x8700
   mov [bx+8],ax
   add cx,ax
   
   mov ax,0xCD1F
   mov es,ax
   
   mov bx,0x0003
   
   mov Es:[bx],cx
   
   
    
Main Endp


.exit