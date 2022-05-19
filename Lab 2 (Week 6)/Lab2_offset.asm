;4 - using offset 
.model small
.stack 300h
.data
    msg db ''''
    msg1 db ''''
    msg2 db ''''
.code
MAIN proc 
    mov ax,@data
    mov ds, ax

    mov ah,0ah
    ;lea dx,msg
    mov dx,offset msg
    int 21h

    mov dx, offset msg1
    int 21h

    mov dx, offset msg2
    int 21h


    mov ah,4ch
    int 21h

Main endp
END main