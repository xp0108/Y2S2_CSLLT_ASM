.model small
.stack 100h
.code
MAIN proc
    mov ah ,01h ;01/1/1h/01h takes a character input from keyboard
    mov dl,al
    int 21h ;call DOS

    mov ah, 4ch
    int 21h
Main endp
END main

;THIS IS DOS PROGRAM