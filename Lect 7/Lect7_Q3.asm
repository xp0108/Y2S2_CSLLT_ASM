;Lab question 3c)	Create a new line
.model small
.stack 100h 
.data   ;data section
    msg db "Here is line 1$"    ;msg is variable name, db - define byte
    msg2 db 10, "Here is line 2$"
.code
MAIN proc
    mov ax, @data   ;@data - address of data, ,pointer concept
    mov ds, ax ;ds - daat segment (hold/handle data addressses)

    mov ah,09h  ;09h/09/9h/9 - string display function (service)
    mov dx,offset msg   ;dx - data regoster (to handle data)
                        ;offest - (keyboard) read
                        ;char - by-character from the data address
    int 21h ;call dos to display 

    mov ah,09h
    mov dx,offset msg2
    int 21h

    mov ah,4ch  ;exit function 
    int 21h ;dos exit
Main endp
end main