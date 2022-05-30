

; .model small
; .stack 100h
; .data
; .code
; main proc
    
;     MOV CX,5
;     MOV BX,5
    
    
;     L1:
;     PUSH CX
;     MOV CX,5
       
;     L2:
;      MOV AH,2
;      MOV DL,'*'
;      INT 21H
;      MOV DL,' '
;      INT 21H
       
;      LOOP L2
     
;      MOV AH,2
;      MOV DL,10
;      INT 21H
;      MOV DL,13
;      INT 21H
     
     
;     POP CX     
       
       
;     LOOP L1
       
       
    
;     EXIT:
;     MOV AH,4CH
;     INT 21H

; main endp
; end main


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

;------------------------------
    mov cx, 4 ;row ,i=5,
    mov bx, 4 ;j = column
    ;num = tempVar
    ;min = tempVar2/di
    OutterLoopUpper:
;-------------------------------
        push cx
        mov cx, bx ;cx=1
        
        ;loop row
        mov dl,52
        mov tempVar,dl
        InnerUpperLeft:   
        ;PRINT
            mov dl, tempVar ;ASCII                
            int 21h

            mov tempVar,dl
            mov dl, 0   ;space
            int 21h
            dec tempVar
        loop InnerUpperLeft
        pop cx  ;4
;---------------------------
        mov dl,10
        int 21h
    loop OutterLoopUpper
;-----------------------------
    int 21h

SquaEnd:
    mov ah,4ch 
    int 21h

main endp
end main