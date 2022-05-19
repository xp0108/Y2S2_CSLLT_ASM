;4a)	Display an ASCII character “#” on screen using DOS interrupt 21h.
.model small
.stack 100h
.code
MAIN PROC 
    mov ah,2
    mov dl, "#"
    int 21h
    mov ah,4Ch
    int 21h ;display DOS
MAIN endp
    end MAIN