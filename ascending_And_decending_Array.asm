.model small
.stack 0x100

.data
arr1 dw 5, 3, 8, 6, 2, 10, 9, 7, 4, 1
size dw 10

.code
mov ax, @data
mov ds, ax

; Sort first 5 elements in ascending order
mov cx, 5
mov si, 0
outer_asc:
    mov di, si
    inner_asc:
        mov bx, [arr1+di]
        mov dx, [arr1+di+2]
        cmp bx, dx
        jbe no_swap_asc

        mov [arr1+di], dx
        mov [arr1+di+2], bx

    no_swap_asc:
        add di, 2
        loop inner_asc

    dec cx
    cmp cx, 1
    jg outer_asc

; Sort last 5 elements in descending order
mov cx, 5
mov si, 4
outer_desc:
    mov di, si
    inner_desc:
        mov bx, [arr1+di]
        mov dx, [arr1+di+2]
        cmp bx, dx
        jnb no_swap_desc

        mov [arr1+di], dx
        mov [arr1+di+2], bx

    no_swap_desc:
        add di, 2
        loop inner_desc

    dec cx
    cmp cx, 1
    jg outer_desc

.exit