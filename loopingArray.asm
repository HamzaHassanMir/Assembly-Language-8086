.model small
.stack 0x100

.data
arr1 dw 5,3,8,6,2
size dw 5

.code
mov ax,@data
mov ds,ax

outerloop:
    mov si, 0
    mov cx, size
    dec cx ; Adjust CX for the loop condition

innerloop:
    mov bx, [arr1+si]
    mov dx, [arr1+si+2]
    cmp bx, dx
    jbe noswap

    mov [arr1+si], dx
    mov [arr1+si+2], bx

noswap:
    add si, 2
    loop innerloop

    dec size ; Decrement size after each pass
    cmp size, 1 ; Check if the array is sorted
    jg outerloop ; Continue the outer loop if not sorted

endsort:
.exit