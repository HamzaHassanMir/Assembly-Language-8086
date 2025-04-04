.model small
.stack 100h
.data
    msg1 db "Enter first number: $"
    msg2 db "Enter second number: $"
    msg3 db "Sum: $"
    newline db 0Dh,0Ah,"$"  ; Newline characters

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Hook INT 0x70
    cli  ; Disable interrupts
    mov ax, 0
    mov es, ax
    mov word ptr es:[0x70 * 4], offset isr70
    mov word ptr es:[0x70 * 4 + 2], cs
    sti  ; Enable interrupts

    ; Call INT 0x70, service 0x01 (input numbers)
    mov ah, 1
    int 0x70

    ; Call INT 0x70, service 0x02 (perform addition)
    mov ah, 2
    int 0x70

    ; End program
    mov ah, 4Ch
    int 21h

main endp
.exit
; Interrupt Service Routine for INT 0x70
isr70 proc
    cmp ah, 1
    je input_numbers
    cmp ah, 2
    je add_numbers
    iret

input_numbers:
    ; Get first number
    mov dx, offset msg1
    mov ah, 9
    int 21h
    call read_number
    mov ax, bx  ; Store first number in AX

    ; Get second number
    mov dx, offset msg2
    mov ah, 9
    int 21h
    call read_number
    mov bx, bx  ; Store second number in BX

    iret

add_numbers:
    add ax, bx  ; AX = AX + BX

    ; Print "Sum: "
    mov dx, offset msg3
    mov ah, 9
    int 21h

    ; Print sum
    call print_number

    ; Print newline
    mov dx, offset newline
    mov ah, 9
    int 21h

    iret

; Function to read a number from the user
read_number proc
    mov bx, 0  ; Clear BX
    mov ah, 1
next_digit:
    int 21h  ; Read character
    cmp al, 0Dh
    je done
    sub al, '0'
    mov ah, 0
    shl bx, 1
    add bx, bx
    add bx, ax
    jmp next_digit
done:
    ret
read_number endp

; Function to print a number in AX
print_number proc
    mov cx, 0
    mov dx, 0
print_loop:
    div word ptr ten
    push dx
    inc cx
    cmp ax, 0
    jne print_loop
print_digits:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop print_digits
    ret
print_number endp

ten dw 10

isr70 endp
