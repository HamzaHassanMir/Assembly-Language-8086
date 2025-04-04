.model small
.stack 0x100

.data

arr db 5,10,15,20,25
num db 5
count db ?

.code

Main Proc
        
    mov ax,@data
    mov ds,ax
    
    mov di,offset arr
    
    mov cx,5
loop1:
    
    mov ax,0
    mov al,[di]    
    div num
    
    shr ah,1
    adc ah,0
    
    shr ah,1
    adc ah,0
    
    xor ah,1
    
    add count,ah
    
    inc di
loop loop1
    
    mov al,count
    mov byte ptr Ds:[0x0600],al
         
Main Endp
.exit