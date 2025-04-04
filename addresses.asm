.model small
.stack 0x100

.data

.code

main proc
    mov ax,0x0750
    mov ds,ax
    
    mov [0x1000],0x11
    mov [0x1010+1],0x22
    mov [0x1020+2],0x33   
    mov [0x1030+3],0x44
    
    
main endp