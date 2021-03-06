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

    DesignPatternRow15 db 35,0,0,0,35,"$"
    DesignPatternRow24 db 0,35,0,35,0,"$"
    DesignPatternRow3 db 0,0,35,0,0,"$"

    DesignPatternRow15End db 35,,10,'$'
    DesignPatternRow24End db 0,35,10,'$'
    DesignPatternRow3End  db 0,0,35,10,'$'
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

            mov bl, al
            sub bl, 48 ;convert "3" to 3
            mov ah,2
        MacroNewLine
        MacroNewLine
           
;==================================================
;               Print Row 1 & 5
;==================================================
    mov tempVar, 1 ;initialize - for row 1,2,3
    
    LoopAgainForRow5:
        mov cl, 0
        Row15Start:
        MacroDisMsg DesignPatternRow15

        inc cl
        cmp cl, bl ;cl - as a counter, bl - user input
        jne Row15Start
        MacroDisMsg DesignPatternRow15End
    cmp tempVar, 2
    je DesignPatternDone ;Skip Row 3

;==================================================
;               Print Row 2 & 4 
;==================================================
    LoopAgainForRow4:
        mov cl, 0
        Row24Start:
        MacroDisMsg DesignPatternRow24
        inc cl
        cmp cl, bl
        jne Row24Start
        MacroDisMsg DesignPatternRow24End
    cmp tempVar, 2
    je LoopAgainForRow5
;==================================================
;               Print Row 3
;==================================================
        mov cl, 0
        Row3Start:
        MacroDisMsg DesignPatternRow3
        inc cl
        cmp cl, bl
        jne Row3Start
        MacroDisMsg DesignPatternRow3End
    
    inc tempVar ;increase the tempVar for printing Row 4 & 5
    cmp tempVar, 2
    je LoopAgainForRow4

DesignPatternDone:
    mov ah,4ch 
    int 21h 
main endp
end MAIN