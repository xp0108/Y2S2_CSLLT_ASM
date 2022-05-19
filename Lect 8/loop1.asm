.model small
.stack 100h 
.code
MAIN proc
    mov cx,4   ;count *  
    mov ah,2 

a:  mov dl,42   ;ascii *
    int 21h

    mov dl,9    ;horizontal tab
    int 21h
    
    loop a

;two enter
    mov dl,10   ;line feed
    int 21h
    int 21h

    mov cx,2   ;here is another counter, for the ASCII 200

b:  mov dl, 36 ;&Egrave character
    int 21h
    mov dl,9
    int 21h

    loop b

    mov ah,4ch 
    int 21h 
Main endp
end main

