model small
.stack 100h
.code
MAIN PROC
    mov ah, 2
    mov dl,'A'
    int 21h
    mov ah, 2
    mov dl,10 ;Next line 
    int 21h
    mov ah, 2
    mov dl, 'P'
    int 21h
    mov ah, 2
    mov dl,10
    int 21h
    mov ah, 2
    mov dl, 'U'
    int 21h
    mov ah, 4Ch
    int 21h
MAIN endp
end MAIN