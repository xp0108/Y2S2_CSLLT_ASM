;Lab question 3a) Display a "?" on the screen
.model small
.stack 100h
.code
MAIN PROC 
    mov ah,2
    mov dl, "?"
    int 21h
    mov ah,4Ch
    int 21h ;display DOS
MAIN endp
    end MAIN

; .model small
; .stack 100h 
; .data
;     msg DB "?$"
; .code
; MAIN proc
;     mov ax,@data
;     mov ds,ax
    
;     mov ah,9h
;     mov dx,offset msg ;point ds to data segment
;     int 21h
    
;     mov ah,4ch 
;     int 21h 
; Main endp
; end main