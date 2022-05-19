.model small
.stack 100h 
.code
MAIN proc
    ; if the bl set to 0 - will print many times. 
    ; this jump is taking place after the loop 
    mov bl,2  ;set register to 20
    mov ah,2    ;DOS function to display, the service that only display 1 character
    mov dl,'?'  ;character to display 

top:    int 21h ;call DOS interrupt, when calling this input it also calling the previous code
    dec bl      ;decrease BL by one
    cmp bl, 0   ;check if BL is zero
    jne top     ;repeat if not equal to zero 

    mov ah,4ch  ;DOS terminate
    int 21h     ;return to DOS

    mov ah,4ch 
    int 21h 
Main endp
end main

