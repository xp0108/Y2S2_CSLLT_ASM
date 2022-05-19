;5 - display a menu 
.model small
.stack 100h
.data
    menu db 2,0,2,0,2,0,2,0,2,0, "Main Menu",0,2,0,2,0,2,0,2,0,2,0, 13,10
        db 14,0,14,0,"1) Student Info",13,10
        db 15,0,15,0,"2) Subject Info",13,10
        db 6,0,6,0,"3) Marks Info",13,10
        db 11,0,11,0,"4) Quite Program",13,10
        db "Enter Choice : $",13,10,10
.code
MAIN proc
     mov ax, @data 
    mov ds, ax

    mov ah,09h
    mov dx, offset menu
    int 21h 

    mov ah, 1
    int 21h 

    mov ah, 4ch
    int 21h
Main endp
END main