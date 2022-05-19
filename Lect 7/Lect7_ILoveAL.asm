;1 - write I Love AL 
.model small
.stack 100h 
.data
    msg DB "I Love Assembly Language$"
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9h
    mov dx,offset msg ;point ds to data segment
    int 21h
    
    mov ah,4ch 
    int 21h 
Main endp
end main

