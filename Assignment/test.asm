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
    tempVar2 db ?
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

    mov ah, 2

    mov tempVar, 52 ;tempVar = n = 7

    mov ah, 1 ;int j = 1
    

        InnerLoop:

        cmp bl, ah
        jl FirstIFFF
        ;ELSE
        SecondIFF:
        sub tempVar, ah ;n - i
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h
        
        jmp InnerLoopExit
        ;IF
        FirstIFFF:
        sub tempVar, bl ;n - i
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h

        InnerLoopExit:
        inc ah
        cmp ah, 4
        jne InnerLoop
    


SquaEnd:
    mov ah,4ch 
    int 21h

main endp
end main