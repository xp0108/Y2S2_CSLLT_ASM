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

    displayNoPttrn db "How many row you wanted to display [4~9]? $"
    colour db ?
    tempVar db ?

    coutnCol db 1
.code 
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

main proc  
    mov ax,@data
    mov ds,ax

    NestedLoopStart: 
    MacroClearScreen 0fh
    MacroDisMsg msg4 
    MacroDisMsg displayNoPttrn
    MacroAcceptChar
    cbw               ; AH = 0 or 0xFF according to top bit of AL/convert byte to word/ascii
    mov  di, ax
    cmp di, '4'
    jl NestedLoopStart

    cmp di, '9'
    jg NestedLoopStart
    sub di, 48

    mov ah,2
    mov cx,di

;TOP LEFT------------------------------------------------------------
    MacroClearScreen 0fh
    mov dh,1 ;row
    mov dl,0 ;col
    mov cx,di
    StartTopLeft:
        push cx
        StartTopLeftPrint:
            mov colour, 1eh
            mov bl,colour
            mov al,42
            mov ah, 2     ;cursor start at 0
            int 10h
            mov ah, 9     ; print horizontal
            int 10h
        loop StartTopLeftPrint

        inc dh
        pop cx
    loop StartTopLeft

;TOP RIGHT------------------------------------------------------------

    mov dh,1 ;row
    mov dl,18 ;col
    mov cx,di ;row count
    mov si,1
    StartTopRight:
        push cx 
            mov cx, si ;cx=1
            StartTopRightPrint:
                mov colour, 1eh
                mov bl,colour
                mov al,42
                mov ah, 2     ;cursor start at 0
                int 10h
                mov ah, 9     ; print horizontal
                int 10h
            loop StartTopRightPrint
        inc si ;bx+1=2
        
        inc dh  ;nextline
        pop cx  ;4
    loop StartTopRight

;BOTTOM LEFT-------------------------------------------------------

    mov dh,14    ;row
    mov dl,0    ;column
    mov cx,di ;row ,i=5
    mov si, 1 ;j = column
    ;num = tempVar
    NumberBottomLeft:

        push cx
        mov cx, si ;cx=1
        
        mov al,49
    
        mov tempVar,al

        NumberBottomLeftPrint:   
            mov al, tempVar                 
            mov bh, 0
            mov ah, 2 ;set cursor position
            int 10h
            mov ah, 09h ;display chara
            int 10h     ;call BIOS
            inc al
            mov tempVar,al
        loop NumberBottomLeftPrint
        
        inc si ;bx+1=2
        
        pop cx  ;4

        inc dh ;inc row
    loop NumberBottomLeft

;BOTTOM RIGHT-----------------------------------------
    mov dh,14    ;row
    mov dl,18    ;column
    mov cx,di ;row count ,i=5
    NumberBottomRight:

        push cx
        mov colour, 4  ;
        mov bl,colour
        mov al,49
        mov tempVar,al
        NumberBottomRightPrint:   
            mov al, tempVar                 
            mov bh, 0
            mov ah, 2 ;set cursor position
            int 10h
            mov ah, 09h ;display chara
            int 10h     ;call BIOS
            inc al
            mov tempVar,al
        loop NumberBottomRightPrint
        pop cx  ;4

        inc dh  ;new row/newline
    loop NumberBottomRight

NestedLoopEnd:
    mov ah,4ch 
    int 21h 

main endp
end main