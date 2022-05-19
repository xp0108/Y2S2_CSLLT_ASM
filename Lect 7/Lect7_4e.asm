;4e)	Display character “*****” on Screen using BIOS interrupt 10h.
.model small
.stack 100h
.code
MAIN proc
    ;using a high bit register || USING BIOS

    mov dl, "*"
    mov ah, 02h
    int 10h

    mov ah, 4ch
    int 21h
Main endp
END main