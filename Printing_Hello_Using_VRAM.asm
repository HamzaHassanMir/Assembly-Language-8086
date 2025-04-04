.model small
.stack 0x100
.data

.code

mov ax,0xB800
mov es,ax
mov si,0

mov es:[si],'H'
inc si
mov byte ptr es:[si],11100100b
inc si

mov es:[si],'E'
inc si
mov byte ptr es:[si],11100100b
inc si

mov es:[si],'L'
inc si
mov byte ptr es:[si],11100100b
inc si

mov es:[si],'L'
inc si
mov byte ptr es:[si],11100100b
inc si

mov es:[si],'O'
inc si
mov byte ptr es:[si],11100100b
inc si

.exit