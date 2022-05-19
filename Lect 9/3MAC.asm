; example of MACRO
.model small
.stack 100h 
.data
    CRLF DB 13, 10,"$"
    msg1 DB 'I Love Assembly Language!!$'
    msg2 DB 'I think I Love Assembly Language!!$'
.code

;macro to display the message on the screen
ShowMess Macro Mess
    lea dx,Mess     ;load message address
    mov ah,9h       ;functino to display string 
    int 21h         ; call DOS 
EndM

MAIN proc
;****** display a message 
    mov ax,@Data    ;get the data segment address
    mov ds,ax       ;point DS to data segment 

    ShowMess msg1   ;show th efirst message
    ShowMess CRLF   ;carriage return and line feed
    ShowMess msg2   ;show the second message

    mov ah,4ch 
    int 21h 
Main endp
end main
