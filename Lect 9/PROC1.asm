;program using procedure
.model small
.stack 100h 
.data
    msg DB 'I Love Assembly Language!!$'
.code
MAIN proc
    mov ax,@Data        ;get the data segment address
    mov ds,ax           ;point DS to data segment 

    ; mov dx, offset msg  ;get address of message 
    call ShowMess       ;display message
    ;DOS exit fucntion
    mov ah,4ch 
    int 21h 
Main endp

;****** procedure to display a message
ShowMess Proc
    push ax     ;save AX register
    mov dx, offset msg
    mov ah,9h   ;function to display a string
    int 21h     ;call DOS
    pop ax      ;restore AX register
    ret         ;return to calling routine
ShowMess Endp


end main
