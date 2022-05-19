;1 - display the string with using Lea (read the entire sentence)
.model small
.stack 100h
.data
    sms db 'Welcome to APU$' ;define byte
    sms1 db 10, 'Welcome to Malaysia$'
.code
MAIN proc
    mov ax,@data        ;data address to ac register
    mov ds,ax           ;ax register address to ds

    mov ah,09h          ;display string service 9/09/9h/09h
    lea dx, sms
    int 21h

    mov ah,09h          ;display string service 9/09/9h/09h
    lea dx, sms1
    int 21h

    mov ah,4ch
    int 21h
Main endp
END main