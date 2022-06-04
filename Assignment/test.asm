.model small
.stack 100h

.data
    Banner  db 10,13,"======================================================================="
            db 10,13,"          HAPPY INDEPENDENT DAY @ ASIA PACIFIC UNIVERSITY"
            db 10,13,"                     ORGANIZER: APU STUDENT ARC"
            db 10,13,"                        DATE: 31 AUGUEST 2022"
            db 10,13,"                     TIME: 4:00 p.m. - 9:00 p.m."
            db 10,13,"               VENUE: ASIA PACIFIC UNIVERSITY, LEVEL 3"
            db 10,13,"=======================================================================$"
    menu    db 10,10,13,6,0,6,0,6,0,6,0,"MAIN MENU",0,6,0,6,0,6,0,6,0,13,10,10
            db "1. Number Patterns",13,10
            db "2. Design Patterns",13,10
            db "3. Box Type Patterns",13,10
            db "4. Nested Loop Patterns",13,10
            db "5. Exit Program",13,10,10
            db "Select your choice: $"  
        
    invalidInputMsg db 10,10,"########## INVALID INPUT! ENTER AGAIN ##########",13,10,'$'

    msg1 db "Here Is Number Pattern",10,10,'$' 
    msg2 db "Here Is Design Pattern",10,10,'$' 
    msg3 db "Here Is Box Type Pattern",10,10,'$'
    msg4 db "Here Is Nested Loop Pattern",10,10,'$'
    
    wannaContinue db 10,10,13, "Do you wanted to continue the program [Y/N] ? " ,0, '$'

    tempVar db ?
    colour db ?

    displayNestedNoPttrn db "Row To Display [4 - 9]: $"
    displayNumberNoPttrn db "Row To Display [3 - 9]: $"
    displayDesignNoPttrn db "Diamond To Display [1 - 9]: $"

    DesignPatternRow15 db 35,0,0,0,35,"$"
    DesignPatternRow24 db 0,35,0,35,0,"$"
    DesignPatternRow3 db 0,0,35,0,0,"$"

    DesignPatternRow15End db 35,,10,'$'
    DesignPatternRow24End db 0,35,10,'$'
    DesignPatternRow3End  db 0,0,35,10,'$'
.code

;=======================================================
;                   MACRO FUNCTION
;=======================================================
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
    mov ah, 1       ;read a letter
    int 21h 
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
;#######################################################
;                   PROGRAM START
;#######################################################
MAIN PROC 
    mov ax,@data
    mov ds,ax

    NestedLoopStart: 
    MacroClearScreen 0fh
    MacroDisMsg msg4 

;==================================================
;               Accept Input - Dynamic
;==================================================
    MacroDisMsg displayNestedNoPttrn
    MacroAcceptChar
    cbw             ;convert input into char ASCII
    mov  di, ax     ;di carry user input
    cmp di, '4'
    jl NestedLoopStart

    cmp di, '9'
    jg NestedLoopStart
    sub di, 48      ;move char ASCII to dec's ASCII

    mov ah,2

;==================================================
;               Upper Left Triangle 
;==================================================
    MacroClearScreen 0fh
    mov dh,1 ;row
    mov dl,0 ;column
    mov cx,di ;move user input to the counter (row counter)
    UpperLeftTri:
        push cx
        UpperLeftTriPrinting:
            mov colour, 1eh
            mov bl,colour
            mov al, 42
            mov ah, 2     ;set cursor position at 0, use for point 
            int 10h       ;call BIOS
            mov ah, 9     ;display in horizontal line
            int 10h       ;call BIOS
        loop UpperLeftTriPrinting
        
        inc dh  ;BIOS new line = + row 
        pop cx
    loop UpperLeftTri

;==================================================
;               Upper Right Triangle 
;==================================================

    mov dh,1 ;row
    mov dl,18 ;column
    mov cx,di ;move user input to the counter (row counter)
    mov si,1
    UpperRightTri:
        push cx 
            mov cx, si ;cx=1
            UpperRightTriPrinting:
                mov colour, 1eh
                mov bl,colour
                mov al,42
                mov ah, 2     ;set cursor position at 0
                int 10h       ;call BIOS
                mov ah, 9     ;display in horizontal line
                int 10h       ;call BIOS
            loop UpperRightTriPrinting
        inc si ;bx+1=2
        
        inc dh  ;BIOS new line = + row
        pop cx  ;4
    loop UpperRightTri

;==================================================
;               Lower Left Triangle 
;==================================================

    mov dh,14    ;row
    mov dl,0    ;column

    mov cx,di ;row ,i=5
    mov si, 1 ;j = column
    ;num = tempVar
    LowerLeftTri:

        push cx
        mov cx, si ;loop column
        
        mov al,49
    

        LowerLeftTriPrinting:   
            mov colour, 1eh
            mov bl,colour    

            mov ah, 2   ;set cursor position at 0
            int 10h
            mov ah, 9   ;display in horizontal line
            int 10h   
            
            inc al
            mov tempVar,al
        loop LowerLeftTriPrinting

        inc si ;bx+1=2
        pop cx  ;4
        inc dh ;BIOS new line = + row
    loop LowerLeftTri

;==================================================
;               Lower Right Triangle 
;==================================================
    mov dh,14    ;row
    mov dl,18    ;column
    mov cx,di ;row count ,i=5
    LowerRightTri:

        push cx
        mov colour, 4
        mov bl,colour
        mov al,49
        LowerRightTriPrinting:   
            mov ah, 2 ;set cursor position
            int 10h
            mov ah, 09h ;display chara
            int 10h     ;call BIOS               
            mov bh, 0
            inc al
            mov tempVar,al
        loop LowerRightTriPrinting

        pop cx  
        inc dh  ;BIOS new line = + row
        loop LowerRightTri

    NestedLoopEnd:
    
    mov   ah,4ch
    int   21h  

main endp
end MAIN