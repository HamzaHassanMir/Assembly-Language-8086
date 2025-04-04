.model small
.stack 0x100

.data

.code
mov ax,0xB800
mov es,ax
mov si,2000

mov es:[si],'H'
add si,2

mov es:[si],'E'
add si,2

mov es:[si],'L'
add si,2

mov es:[si],'L'
add si,2

mov es:[si],'O'


.exit