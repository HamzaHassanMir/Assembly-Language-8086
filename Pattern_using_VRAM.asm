.model small
.stack 0x100

.data

.code
mov ax,0xB800
mov es,ax

mov si,(79*2)
mov cx,5

l1:

mov es:[si],'A'
mov byte ptr es:[si+1],00100100b

add si,160-8

loop l1


.exit