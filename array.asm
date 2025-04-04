.model medium
.stack 100h
.data
arr DW 1, 2, 3, 4, 5    
.code
ASSUME DS:DATA, CS:CODE
START:
    MOV AX, DATA    ; Load the data segment address into AX
    MOV DS, AX      ; Move it to DS register

    MOV SI, 0       
    MOV AX, arr[SI] 

    ADD SI, 2       
    MOV BX, arr[SI] 

    MOV AH, 4CH     
    INT 21H

END START
