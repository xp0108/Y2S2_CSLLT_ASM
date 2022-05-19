; control can display value screen
.model small
.stack 100h
.data
    msg db "Welcome to CSLLT class$"
.code
Main proc
    mov ax, @data
    
    mov es, ax
    mov ah, 13h
    mov al,0
    mov bh,0
    mov bl,45
    mov cx,23   ;read the word count
    mov dh,20   ;vertical
    mov dl,20   ;horizontal
    mov bp, offset msg
    int 10h

    mov ah, 4ch
    int 21h
Main endp
End main