;1 - system display the msg in more than one word
.model small
.stack 100h 
.data   ;data section
    msg db "Welcome to APU$"    ;msg is variable name, db - define byte
.code
MAIN proc
    mov ax, @data   ;@data - address of data, ,pointer concept
    mov ds, ax ;ds - data segment (hold/handle data addressses)

    mov ah,09h  ;09h/09/9h/9 - string display function (service)
    mov dx,offset msg   ;dx - data regoster (to handle data)
                        ;offest - (keyboard) read
                        ;char - by-character from the data address
    int 21h ;call dos to display 

    mov ah,4ch  ;exit function 
    int 21h ;dos exit
Main endp
end main
