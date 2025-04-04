.model small
.stack 100h
.data
array dw 1, 2, 3, 4, 5 ; Example array of 5 elements
array_size equ 5

.code
mov ax, @data
mov ds, ax

mov si, 0           ; SI will point to the start of the array
mov cx, array_size  ; Loop counter for the number of elements

loop_start: 
    mov ax, [array+si]
    add ax, 2                   ; Add 2 to the current array element
    add si, 2                       ; Move to the next array element
    loop loop_start              ; Repeat for all elements

mov ah, 4Ch
int 21h
end
