;3 - using lea to accept input
.model small
.stack 200h 
.data  
    msg db ''''
    msg1 db ''''
    msg2 db ''''
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    mov ah,0ah
    lea dx, msg
    int 21h

    lea dx, msg1
    int 21h

    lea dx, msg2
    int 21h

    mov ah,4ch 
    int 21h 
Main endp
end main

