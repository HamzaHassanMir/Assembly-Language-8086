.MODEL SMALL
.STACK 0x100
.DATA

B DB 0FFh, 0FFh, 0FFh, 0FFh
Q DB 78h, 56h, 34h, 12h            
A DB 0, 0, 0, 0, 0, 0, 0, 0        
N DB 32                             

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV BX, OFFSET B                     
    MOV SI, OFFSET Q                     
    MOV DI, OFFSET A                   

CORELOOP:

    MOV AL, [SI]                 
    AND AL, 1                     
    CMP AL, 1
    JE ADDIT                      

SHIFT:
    CLC                           
    RCR [SI+3], 1                 
    RCR [SI+2], 1
    RCR [SI+1], 1
    RCR [SI], 1                  

    CLC                           
    RCL [BX], 1                   
    RCL [BX+1], 1
    RCL [BX+2], 1
    RCL [BX+3], 1                 

    DEC N
    CMP N, 0
    JNE CORELOOP                 

    JMP DONE                  

ADDIT:
    MOV CX, 4                     
    PUSH SI                      
    PUSH DI                      
    LEA SI, B                     
    LEA DI, A                     
    CLC                          
ADD_LOOP:
    MOV AL, [SI]                  
    ADC [DI], AL                 
    INC SI                        
    INC DI                        
    LOOP ADD_LOOP
    POP DI                        
    POP SI                       
    JMP SHIFT                    

DONE:
   
   .exit

MAIN ENDP
