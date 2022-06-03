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

    msg1 db "here is Number patterns",10,10,'$' 
    msg2 db "here is Design patterns",10,10,'$' 
    msg3 db "here is Box type patterns",10,10,'$'
    msg4 db "here is Nested loop patterns",10,10,'$'
    
    wannaContinue db 10,10,13, "Do you wanted to continue the program [Y/N] ? " ,0, '$'

    tempVar db ?
    colour db ?

    displayNestedNoPttrn db "Row To Display [4~9]: $"
    displayNumberNoPttrn db "Row To Display [3~9]: $"
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
    
    DisplayMenu:  
        MacroDisMsg menu     
        
    GetInput:        
        MacroAcceptChar  
        mov bl,al           ;move al to bl      

        ;if bigger than 5 or smaller than 1 -> display invalid input
        cmp al, '5'
        jg InvalidInput 

        cmp al, '1'
        jl  InvalidInput
        
        cmp al, "1"
        je  NPtrn
        cmp al, "2"
        je  DPtrn
        cmp al, "3"
        je  BTPtrn
        cmp al, "4"
        je  NLPtrn
        cmp al, "5"
        jmp Exit

    Exit: 
        mov   ah,4ch
        int   21h   

    NPtrn: call NumberPattern
    DPtrn: call DesignPattern
    BTPtrn: call BoxTypePattern
    NLPtrn: call NestedLoopPattern


    ContinueProgram:
        MacroDisMsg wannaContinue
        MacroAcceptChar
        mov bl,al           ;move al to bl
        cmp al, 'y'
        je  ClearScreen
        cmp al, 'Y'
        je  ClearScreen
        cmp al, 'n'
        je  Exit
        cmp al, 'N'
        je  Exit
        cmp al, '0'
        jge ContinueProgramInvalidInput

    InvalidInput:
        MacroClearScreen 04eh
        MacroDisMsg invalidInputMsg 
        jmp DisplayMenu 

    ContinueProgramInvalidInput:
        MacroClearScreen 04eh
        MacroDisMsg invalidInputMsg 
        jmp ContinueProgram 
        
main endp

;PROCEDURE FUNCTION
NumberPattern PROC
    DiamondStart:
    MacroClearScreen 1fh
    MacroDisMsg msg1 
;dynamic---------------------------------------------
    MacroDisMsg displayNumberNoPttrn
    MacroAcceptChar
    cbw               ; AH = 0 or 0xFF according to top bit of AL, convert input into word
    mov  si, ax
    cmp si, '3'
    jl DiamondStart

    cmp si, '9'
    jg DiamondStart
    sub si, 48      ;move ASCII

;-----------------------------------------start pattern 
    mov ah, 2
    MacroNewLine

    mov cx,si ;8 ;num=8
    mov bx, 1 ;j = column
    ;num = tempVar
    OuterUpDiamonLoop:
        
        push cx ;initial = 8 ; inner loop

        UpSpaceTri:   
            mov dl, 0             
            int 21h
            int 21h
        loop UpSpaceTri
    pop cx
;-------------------------------------------------------
    push cx
        mov cx, bx ;cx=1

        mov dl,49   ;Ascii 1 ; num = 1
        mov tempVar,dl
        UpAscTri:
            mov dl, tempVar  ;move tempVar to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop UpAscTri
        inc bx  ;bx+1=2
    pop cx
;--------------------------------------------------------------
    push cx     ;8
    push bx     ;2
    cmp bx, 2
    je DiamondUp
        dec bx  ;2-1
        mov cx, bx ;bx=1,cx=1
        dec cx 
        dec tempVar
        UpDecTri:
            dec tempVar  ;move tempVar to dl 
            mov dl, tempVar
            int 21h          ;print
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop UpDecTri
    pop bx
    pop cx

    DiamondUp:
        MacroNewLine
        loop OuterUpDiamonLoop
;=====================================================================
    mov ah, 2
    dec si
    mov cx,si ;num=7 , have to dec 1
    mov bx, 1 ;j = column
    OuterDownDiamonLoop:
    mov dl,0            
    int 21h
    int 21h
        push cx
        mov cx, bx ;cx=1

        DownSpaceTri:   
            mov dl,0            
            int 21h
            int 21h
        loop DownSpaceTri
        pop cx 
    
    inc bx 
;-------------------------------------------------------
    push cx
        mov dl,49   ;Ascii 1 ; num = 1
        mov tempVar,dl
        DownAscTri:
            mov dl, tempVar  ;move tempVar to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop DownAscTri
    pop cx
;--------------------------------------------------------------
    push cx     ;8
    dec cx
    cmp cx,1
    jl EndNumberPattern
        ; dec bx  ;2-1
        ; mov cx, bx ;bx=1,cx=1
        dec tempVar
        DownDecTri:
            dec tempVar  ;move tempVar to dl 
            mov dl, tempVar
            int 21h          ;print
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop DownDecTri
    pop cx


    DiamondDown:
    MacroNewLine
    loop OuterDownDiamonLoop
    
    EndNumberPattern:
    jmp ContinueProgram
    ret
NumberPattern endp

DesignPattern PROC
    MacroClearScreen 04eh
    MacroDisMsg msg2

    jmp     ContinueProgram
    ret
DesignPattern endp

BoxTypePattern PROC
    MacroClearScreen 04eh
    MacroDisMsg msg2

        mov ah, 3
;-------------------------
;UPPER SQUARE
    mov bl, 1 ;i=1, int i = 1
    UpperSquareOutter:
    ;UPPER SQUARE _ INNER LEFT
    USIL: call SquareInnerLeft

    ;UPPER SQUARE _ INNER RIGHT
    USIR: call SquareInnerRight

;-----------INNER LOOP END--------------
    ExitUpperSquareOutter:
    
    MacroNewLine

    inc bl
    cmp bl, 5
    jne UpperSquareOutter

;---------UPPER SQUARE END----------------

;-------------------------
;LOWER SQUARE
    mov bl, 3 ;i=1, int i = 1
    LowerSquareOutter:
    ;LOWER SQUARE _ INNER LEFT
    LSIL: call SquareInnerLeft

    ;LOWER SQUARE _ INNER RIGHT
    LSIR: call SquareInnerRight
    
    ExitLowerSquareOutter:

    MacroNewLine

    dec bl
    cmp bl, 0
    jne LowerSquareOutter
;-------------------------

    jmp     ContinueProgram
    ret
BoxTypePattern endp

SquareInnerLeft PROC
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

    ret
SquareInnerLeft endp

SquareInnerRight PROC
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
    ret
SquareInnerRight endp

NestedLoopPattern PROC
    NestedLoopStart: 
    MacroClearScreen 0fh
    MacroDisMsg msg4 
    MacroDisMsg displayNestedNoPttrn
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

    jmp ContinueProgram
    ret

NestedLoopPattern endp

end MAIN