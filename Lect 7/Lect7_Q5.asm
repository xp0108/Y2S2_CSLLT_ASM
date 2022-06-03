;5 - display a menu 
.model small
.stack 100h
.data
    menu db "Main Menu", 13,10
        db "1) Student Info",13,10
        db "2) Subject Info",13,10
        db "3) Marks Info",13,10
        db "4) Quite Program",13,10
        db "Enter Choice : $",13,10,10
.code
MAIN proc
     mov ax, @data 
    mov ds, ax


    mov ah, 1
    int 21h 

    mov ah, 4ch
    int 21h
Main endp
END main