.model small
.stack 0x100

.data
a db 1,2,3
b db 2,3,1

result db 3 dup(?)

.code

Main Proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset a
    push si
    
    mov si,offset b
    push si
    
    mov si,offset result
    push si
    
call Sum
 
 pop si
 pop si
 pop si
;add sp,6
.exit
Main Endp

Sum Proc
  
    mov bp,sp
    
    mov bx,[bp+6] ;array a
    mov si,[bp+4] ;array b   
    mov di,[bp+2] ;array result
    
    mov cx,3

Addition:    
    
    mov al,[bx]
    add al,[si]
    mov [di],al
    
    inc bx
    inc si
    inc di
        
loop Addition   

Ret 
Sum Endp