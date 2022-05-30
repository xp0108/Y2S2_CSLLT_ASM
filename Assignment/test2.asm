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
    mov cl, 09h 
    int 21h  
EndM

MacroAcceptChar Macro
    mov cl, 1           ;read a letter
    int 21h 
    ; mov bl,al           ;move al to bl  
EndM
MacroClearScreen Macro colorVar
    mov cl,6        ;clear screen
    mov al,0        ;Full Screen
    mov bh,colorVar ;4fh color
    mov cx,0        ;Starting Coordinates
    mov dl,79       ;Coloum      
    mov dh,24       ;Row
    int 10h

    mov cl,2        ;Cursor being at 0,0
    mov bh,0
    mov dh,0        ;vertical
    mov dl,0        ;horizontal
    int 10h
EndM

main proc  

;UPPER SQUARE -------------------------------------------------------------
    mov bl, 1 ;i=1, int i = 1
    OutterLoopUpper:

    ;UPPER SQUARE _ INNER LEFT-------------------------------------
        
    ContinueProgramUpLeft:
    call UpperSquareInnerLeft
        ;UPPER SQUARE _ INNER RIGHT-------------------------------------
        ContinueProgramUpRight:
           call UpperSquareInnerRight

;-------------------------------------------------------------
    ExitOutterLoopUpeer:
    
    mov ah,2
    mov dl,10
    int 21h

    inc bl
    cmp bl, 5
    jne OutterLoopUpper
;-------------------------------------------------------------

;LOWWER SQUARE--------------------------------------------------------------
    mov bl, 3 ;i=1, int i = 1
    LowerLoopUpper:

    ;LOWWER SQUARE _ INNER LEFT-------------------------------------
        mov cl, 1 ;int j = 1
        InnerLoopLeftLow:
        mov tempVar, 52 ;tempVar = n = 4

        cmp bl, cl
        jl FirstInnerDownLeftIFFF
        ;ELSE
        SecondInnerDownLeftIFF:
        sub tempVar, cl ;n - j
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h
        
        jmp InnerLoopLeftLowExit
        ;IF
        FirstInnerDownLeftIFFF:
        sub tempVar, bl ;n - i
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h

        InnerLoopLeftLowExit:
        inc cl
        cmp cl, 5
        jne InnerLoopLeftLow
;-------------------------------------------------------------

        ;LOWWER SQUARE _ INNER RIGHT-------------------------------------
         ContinueProgramLowRight:
           call LowerSquareInnerRight
;-------------------------------------------------------------
    ExitLowerLoopUpeer:
    
    mov ah,2
    mov dl,10
    int 21h

    dec bl
    cmp bl, 0
    jne LowerLoopUpper
;-------------------------------------------------------------
SquaEnd:
    mov ah,4ch 
    int 21h

main endp

UpperSquareInnerLeft PROC
    mov cl, 1 ;int j = 1
    InnerLoopLeft:  
    mov tempVar, 52 ;tempVar = n = 4

    cmp bl, cl
    jl FirstIFFF
    ;ELSE
    SecondIFF:
    sub tempVar, cl ;n - j
    inc tempVar ;+1
    mov ah, 2
    mov dl, tempVar
    int 21h
    mov dl, 0
    int 21h
    
    jmp InnerLoopLeftExit
    ;IF
    FirstIFFF:
    sub tempVar, bl ;n - i
    inc tempVar ;+1
    mov ah, 2
    mov dl, tempVar
    int 21h
    mov dl, 0
    int 21h

    InnerLoopLeftExit:
    inc cl
    cmp cl, 5

    jne InnerLoopLeft
    jmp ContinueProgramUpLeft
    ret
UpperSquareInnerLeft endp

UpperSquareInnerRight PROC
     ;UPPER SQUARE _ INNER RIGHT-------------------------------------
        mov cl, 3 ;int j = 3 (n-1)
        InnerLoopRight:
        mov tempVar, 52 ;tempVar = n = 4

        ;IF ELSE START
        cmp bl, cl
        jl FirstInnerUpLeftIFFF
        ;ELSE
        SecondInnerUpLeftIFF:
        sub tempVar, cl ;n - j
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h
        
        jmp InnerLoopRightExit
        ;IF
        FirstInnerUpLeftIFFF:
        sub tempVar, bl ;n - i
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h

        InnerLoopRightExit:
        dec cl
        cmp cl, 0
       
        jne InnerLoopRight

    jmp ContinueProgramUpRight
    ret

UpperSquareInnerRight endp

LowerSquareInnerRight PROC
    ; LOWWER SQUARE _ INNER RIGHT-------------------------------------
        mov cl, 3 ;int j = 3 (n-1)
        InnerLoopRightLow:
        mov tempVar, 52 ;tempVar = n = 4

        cmp bl, cl
        jl FirstInnerDownRightIFFF
        ;ELSE
        SecondInnerDownRightIFF:
        sub tempVar, cl ;n - j
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h
        
        jmp InnerLoopRightLowExit
        ;IF
        FirstInnerDownRightIFFF:
        sub tempVar, bl ;n - i
        inc tempVar ;+1
        mov ah, 2
        mov dl, tempVar
        int 21h
        mov dl, 0
        int 21h

        InnerLoopRightLowExit:
        dec cl
        cmp cl, 0
       
        jne InnerLoopRightLow
        
        jmp ContinueProgramLowRight
    ret

LowerSquareInnerRight endp

end main