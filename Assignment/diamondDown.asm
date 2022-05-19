.model small
.stack 100h
.code
main proc
    mov ah,2

;------------------------------------------------------------------------ DOWN Pry
mov bx,1
mov cx,6
loop2:  ; Loop 2 outer loop
    push cx ; you have to push the cx and pop it out before loop instruction to prevent the cx being over written by the inner loop cx 
  
    cmp cx,0    ; If cx is zero we have to display one *
    jne loop1
    inc cx      ; increment cx

    loop1:  ; inner loop
        mov ah,02h  ; Dos function 02h to Write character to STDOUT
        mov dl,'*'  ; character to write
        int 21h     ; dos interrupt 21h
        mov dl,0  ; character to write
        int 21h   
    loop loop1
                   
    dec dl
    dec dl 
   
; Code to print in next line    
    mov ah,02h
    mov dl,0ah      ; carriage return
    int 21h
    mov ah,02h
    mov dl,0dh      ; line feed
    int 21h

; Code for space from line number 2
    mov cx,bx
    space:
        mov ah,02h  ; Dos function 02h to Write character to STDOUT
        mov dl,' '  ; character to write
        int 21h     ; dos interrupt 21h
    loop space
    inc bx
 

pop cx
loop loop2

    mov ah,4ch 
    int 21h 

main endp
end main
           