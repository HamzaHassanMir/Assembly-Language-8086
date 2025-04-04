.model small
.stack 0x100

.data
var dw 0x11

.code

main proc
    mov ax,@data
    mov ds,ax
    
    push var
    push var
    push var
       
       
main endp

.exit