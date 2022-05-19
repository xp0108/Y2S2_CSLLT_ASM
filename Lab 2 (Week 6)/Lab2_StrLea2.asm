;2 - display name/more than one line
.model small
.stack 200h
.data
    sms db 'Welcome to APU$' ;define byte
    sms1 db 10, 'Welcome to Malaysia$'
    sms2 db 10,'First Name: Teoh $'
    sms3 db 10,'Middle Name: Xin$'
    sms4 db 10,'Last Name: Pei $'
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

    mov ah,09h          ;display string service 9/09/9h/09h
    lea dx, sms2
    int 21h

    mov ah,09h          ;display string service 9/09/9h/09h
    lea dx, sms3
    int 21h
    
    mov ah,09h          ;display string service 9/09/9h/09h
    lea dx, sms4
    int 21h

    mov ah,4ch
    int 21h
Main endp
END main