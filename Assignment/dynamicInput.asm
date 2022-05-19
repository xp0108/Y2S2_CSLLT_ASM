; test for up diamon 1 
;https://theencarta.com/generic-hollow-square-assembly-language-code/
.model small
.stack 100h

.data
    tempVar db ?
    v2 db ?
    inputVar db ?
    displayNoPttrn db "How many row you wanted to display? $"
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

;1957
MAIN PROC 
    mov ax,@data
    mov ds,ax
    
   MacroDisMsg displayNoPttrn
   mov ah,01
   int 21h
    cbw               ; AH = 0 or 0xFF according to top bit of AL, convert input into word
    mov  si, ax
    
    sub si, 48

    ; MacroAcceptChar
    ; xor cx,cx
    ; mov cl,bl 
    ; sub cl, 48
    ; cmp si,"7"
    ; je Exit
    mov ah,2
    mov cx,si
    MacroNewLine
;----------------------------------
    ; mov dl,49
    ; mov tempVar,dl
    ; top3:
    ;     mov dl, tempVar

    ;     int 21h
    ;     inc tempVar

    ;     MacroNewLine
    ; loop top3
;---------------------------------------------------
    ; mov ah, 2

    ;   mov cx,8 ;row ,i=5
  mov bx, 1 ;j = column
    ;num = tempVar
    NumberBottomLeft:

        push cx
        mov cx, bx ;cx=1
        
        mov dl,49
    
                mov tempVar,dl

                NumberBottomLeftPrint:   
                    mov dl, tempVar                 
                    int 21h
                        inc tempVar
                    mov dl, 0   ;space
                    int 21h
                loop NumberBottomLeftPrint
        
        inc bx ;bx+1=2
        
        pop cx  ;4

         mov dl,10
        int 21h
    loop NumberBottomLeft

Exit:
    mov ah,4ch 
    int 21h 
main endp
end MAIN