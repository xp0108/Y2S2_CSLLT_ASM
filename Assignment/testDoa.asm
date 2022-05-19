.model small
.stack 100h

.data
    tempVar db ?
    tempVar2 db ?
.code

;MACRO FUNCTION 
MacroNewLine Macro 
    mov dl,10
    int 21h
endM

MacroDisMsg Macro msg
    lea dx, msg  
    mov ah, 09h 
    int 21h  
EndM

MacroAcceptChar Macro
    mov ah, 1           ;read a letter
    int 21h 
    mov bl,al           ;move al to bl  
EndM

MacroClearScreen Macro colorVar
    mov ah,6        ;clear screen
    mov al,0        ;Full Screen
    mov bh,colorVar ;4fh color
    mov cx,0        ;Starting Coordinates
    mov dl,79       ;Coloum      
    mov dh,24       ;Row
    int 10h

    mov ah,2        ;Cursor being at 0,0
    mov bh,0
    mov dh,0        ;vertical
    mov dl,0        ;horizontal
    int 10h
EndM

MAIN PROC 
    mov ax,@data
    mov ds,ax

    mov ah, 2

    mov cx,8 ;num=8
    mov bx, 1 ;j = column
    ;num = tempVar
    NumberBottomLeft:
        
        push cx

                NumberBottomRightPrint:   
                    mov dl, 0                 
                    int 21h
                    mov dl, 0   ;space
                    int 21h
                loop NumberBottomRightPrint
        
        ; inc bx ;bx+1=2
        
        pop cx  ;4
;-------------------------------------------------------
        push cx
        mov cx, bx ;cx=1
        
        mov dl,49   ;Ascii 1 ; num = 1

        mov tempVar,dl ;temp hold dl ;4949
        NumberBottomLeftPrint:         

            mov dl, tempVar         ;4949;5050
            int 21h
            inc dl                  ;50
            mov tempVar,dl          ;5050
            mov dl, 0   ;space      ;5000
            int 21h
        loop NumberBottomLeftPrint
        
        inc bx ;bx+1=2
        
        pop cx  ;4
;---------------------------------------------------------------

;---------------------------------------------------------------
        MacroNewLine
    loop NumberBottomLeft


    mov ah,4ch 
    int 21h 
main endp
end MAIN