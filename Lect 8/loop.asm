.model small
.stack 100h 
.code
MAIN proc
    mov cx,2    ;cx - counter register 
    mov ah,2    ;DOS function to display, the service that only display 1 character

a:  mov dl,42   ;42-ASCII code for *
    int 21h
    mov dl,9    ;horizontal tab (9)     ;vertical tab (10)
    int 21h
    
    loop a

    mov ah,4ch 
    int 21h 
Main endp
end main

