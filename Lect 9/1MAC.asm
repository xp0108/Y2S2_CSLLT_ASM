; example of without MACRO
.model small
.stack 100h 
.data
    CRLF DB 12,10,"$"
    msg1 DB 'I Love Assembly Language!!$'
    msg2 DB 'I think I Love Assembly Language!!$'
.code
MAIN proc
;****** display a message 
    mov ax,@Data    ;get the data segment address
    mov ds,ax       ;point DS to data segment 

    lea dx,msg1     ;load message address
    mov ah,9h       ;functino to display string 
    int 21h         ; call DOS 
    lea dx,CRLF     ;load message address
    mov ah,9h       ;functino to display string 
    int 21h         ; call DOS 
    lea dx,msg2     ;load message address
    mov ah,9h       ;functino to display string 
    int 21h         ; call DOS 

    mov ah,4ch 
    int 21h 
Main endp
end main
