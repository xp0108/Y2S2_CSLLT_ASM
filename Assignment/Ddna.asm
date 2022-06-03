.model small
.stack 100h

.data
    menu    db 10,10,13,"!!!!! HAPPY INDEPENDENCE DAY, MALAYSIA !!!!!"
            db 10,10,13,6,0,6,0,6,0,6,0,"MAIN MENU",0,6,0,6,0,6,0,6,0,13,10,10
            db "1. Number Patterns",13,10
            db "2. Design Patterns",13,10
            db "3. Box Type Patterns",13,10
            db "4. Nested Loop Patterns",13,10
            db "5. Exit Program",13,10,10
            db "Select your choice: $"  
        
    invalidInputMsg db 10,10,"########## INVALID INPUT! ENTER AGAIN ##########",13,10,'$'

    msg1 db "here is number patterns",10,10,'$' 
    msg2 db "here is Design patterns",10,10,'$' 
    msg3 db "here is Box type patterns",10,10,'$'
    msg4 db "here is Nested loop patterns",10,10,'$'
    
    wannaContinue db 10,10,13, "Do you wanted to continue the program [Y/N] ? " ,0, '$'

    tempVar db ?

    displayNoPttrn db "How many row you wanted to display? $"

    DesignRow15 db "X   X$"
    DesignRow24 db " X X $"
    DesignRow3 db "  X  $"

    DesignRow15End db "X",10,'$'
    DesignRow24End db " X",10,'$'
    DesignRow3End  db "  X",10,'$'
.code

;MACRO FUNCTION 
MacroNewLine Macro 
    mov dl,13
    int 21h
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
    ; mov bl,al           ;move al to bl  
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

    ClearScreen:
        MacroClearScreen 4fh ;04eh ;;4fh
        
        MacroAcceptChar
        mov tempVar, al
        mov ah,2
        MacroNewLine
;-------------------------------------
        mov bl, 0
        Row1Start:
        MacroDisMsg DesignRow15

        inc bl
        cmp bl, tempVar
        jne Row1Start

        MacroDisMsg DesignRow15End
;-------------------------------------
        mov bl, 0
        Row2Start:
        MacroDisMsg DesignRow24
        inc bl
        cmp bl, 5
        jne Row2Start
        MacroDisMsg DesignRow24End
;-------------------------------------
        mov bl, 0
        Row3Start:
        MacroDisMsg DesignRow3
        inc bl
        cmp bl, 5
        jne Row3Start
        MacroDisMsg DesignRow3End

;-------------------------------------
        mov bl, 0
        Row4Start:
        MacroDisMsg DesignRow24
        inc bl
        cmp bl, 5
        jne Row4Start
        MacroDisMsg DesignRow24End
;-------------------------------------
        mov bl, 0
        Row5Start:
        MacroDisMsg DesignRow15

        inc bl
        cmp bl, 5
        jne Row5Start

        MacroDisMsg DesignRow15End


    mov ah,4ch 
    int 21h 
main endp
end MAIN