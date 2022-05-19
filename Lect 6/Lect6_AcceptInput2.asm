;3 - input a char by uisng the BIOS
.model small
.stack 100h
.code
MAIN proc
    ;using a high bit register || USING BIOS
    mov ah,00h
    int 16h ;takes input from keyboard this is BIOS function

    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 4ch
    int 21h
Main endp
END main

;THIS IS BIOS PROGRAM