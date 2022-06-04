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

    varRandom db ?
    varColor db ?
    incNum db ?
    decNum db ?

    displayNestedNoPttrn db "Number of Row To Display [4 - 9]: $"
    displayNumberNoPttrn db "Number of Row To Display [3 - 9]: $"
    displayDesignNoPttrn db "Number of Diamond To Display [1 - 9]: $"
    displayBoxNoPttrn db "Number of Box To Display [2 - 9]: $"

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
    
    ClearScreen:
        MacroClearScreen 4fh ;4fh
    
    MacroDisMsg Banner     

    DisplayMenu:  
        MacroDisMsg menu     
        
    GetInput:        
        MacroAcceptChar    

        ;if bigger than 5 or smaller than 1 -> display invalid input
        cmp al, '5'
        jg InvalidInput 

        cmp al, '1'
        jl  InvalidInput
        
        ;if valid input, then direct to function
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
        MacroClearScreen 4fh
        MacroDisMsg invalidInputMsg 
        jmp DisplayMenu 

    ContinueProgramInvalidInput:
        MacroClearScreen 4fh
        MacroDisMsg invalidInputMsg 
        jmp ContinueProgram 

main endp
;#######################################################
;                    PROCEDURE FUNCTION              
;#######################################################

;#######################################################
;               NUMBER PATTERN - DIAMOND               
;#######################################################
NumberPattern PROC
    DiamondPatternStart:
    MacroClearScreen 1fh
    MacroDisMsg msg1 
;==================================================
;               Accept Input - Dynamic
;==================================================
    MacroDisMsg displayNumberNoPttrn
    MacroAcceptChar
    cbw             ;convert input into char ASCII
    mov si, ax
    
    ;input is invalid
    cmp si, '3'
    jl DiamondPatternStart

    cmp si, '9'
    jg DiamondPatternStart

    ;input is valid
    sub si, 48      ;move char ASCII to dec's ASCII

    mov ah, 2
    MacroNewLine
    MacroNewLine
;==================================================
;               Upper Diamond Start 
;==================================================
;<<<<<<<<<<<<< Outer Loop >>>>>>>>>>>>>
    mov cx,si ;si = user input
    mov bx, 1 ;bx = column
    OuterLoopUpperDiamond:
        
;<<<<<<<<<<<<< Inner Loop - Space Triangle >>>>>>>>>>>>>
        push cx ;initial = take outer cx value

        UpperSpaceTri:   
            mov dl, 0   ;print 2 times space             
            int 21h
            int 21h
        loop UpperSpaceTri
    pop cx
;<<<<<<<<<<<<< Inner Loop - Ascending Triangle >>>>>>>>>>>>>
    push cx
        mov cx, bx ;cx=1

        mov dl,49   ;Ascii 1 ; num = 1
        mov varRandom,dl
        UpperAscTri:
            mov dl, varRandom  ;move varRandom to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov varRandom,dl  ;backup the latest dl into varRandom (dl = varRandom)         
            mov dl, 0   ;dl use to print, Ascii 0 = null 
            int 21h     ;print 
        loop UpperAscTri
        inc bx  ;bx+1=2
    pop cx
;<<<<<<<<<<<<< Inner Loop - Descending Triangle >>>>>>>>>>>>>
    push cx  
    push bx 
    cmp bx, 2
    je UpperDiamondEnd
        dec bx  ;2-1
        mov cx, bx ;bx=1,cx=1
        dec cx 
        dec varRandom
        UpperDescTri:
            dec varRandom  ;move varRandom to dl 
            mov dl, varRandom
            int 21h          ;print
            
            mov varRandom,dl  ;backup the latest dl into varRandom (dl = varRandom)         
            mov dl, 0   ;dl use to print, Ascii 0 = null 
            int 21h     ;print 
        loop UpperDescTri
    pop bx
    pop cx

    UpperDiamondEnd:
        MacroNewLine
        loop OuterLoopUpperDiamond

;==================================================
;               Lower Diamond Start 
;==================================================
;<<<<<<<<<<<<< Outer Loop >>>>>>>>>>>>>
    mov ah, 2
    dec si ;do not loop 4, so decrease 1 = input - 1
    mov cx,si
    mov bx, 1 ;j = column
    OuterLoopLowerDiamond:
    mov dl,0            
    int 21h
    int 21h
;<<<<<<<<<<<<< Inner Loop - Space Triangle >>>>>>>>>>>>>
        push cx
        mov cx, bx ;cx=1

        LowerSpaceTri:   
            mov dl,0            
            int 21h
            int 21h
        loop LowerSpaceTri
        pop cx 
    
    inc bx 
;<<<<<<<<<<<<< Inner Loop - Ascending Triangle >>>>>>>>>>>>>
    push cx
        mov dl,49   ;Ascii 1 ; num = 1
        mov varRandom,dl
        LowerAscTri:
            mov dl, varRandom  ;move varRandom to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov varRandom,dl  ;backup the latest dl into varRandom (dl = varRandom)         
            mov dl, 0   ;dl use to print, Ascii 0 = null 
            int 21h     ;print 
        loop LowerAscTri
    pop cx
;<<<<<<<<<<<<< Inner Loop - Descending Triangle >>>>>>>>>>>>>
    push cx ;push outer cx
    dec cx
    cmp cx,1
    jl NumberPatternDone
        dec varRandom
        LowerDescTri:
            dec varRandom
            mov dl, varRandom
            int 21h
            
            mov varRandom,dl         
            mov dl, 0   
            int 21h  
        loop LowerDescTri
    pop cx

    DiamondDownEnd:
    MacroNewLine
    loop OuterLoopLowerDiamond
    
    NumberPatternDone:
    jmp ContinueProgram
    ret
NumberPattern endp

;#######################################################
;                   DESIGN PATTERN - X                
;#######################################################
DesignPattern PROC
    DesignPatternStart:
        MacroClearScreen 04eh
        MacroDisMsg msg2
    
;==================================================
;               Accept Input - Dynamic
;==================================================
    MacroDisMsg displayDesignNoPttrn
    MacroAcceptChar
    mov bl, al
    
    ;input is invalid
    cmp bl, '1'
    jl DesignPatternStart

    cmp bl, '9'
    jg DesignPatternStart

    ;input is valid
    sub bl, 48      ;move char ASCII to dec's ASCII

    mov ah, 2
    MacroNewLine
    MacroNewLine

;==================================================
;               Print Row 1 & 5
;==================================================
    mov varRandom, 1 ;initialize - for row 1,2,3
    
    LoopAgainForRow5:
        mov cl, 0
        Row15Start:
        MacroDisMsg DesignPatternRow15

        inc cl
        cmp cl, bl ;cl - as a counter, bl - user input
        jne Row15Start
        MacroDisMsg DesignPatternRow15End
    cmp varRandom, 2
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
    cmp varRandom, 2
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
    
    inc varRandom ;increase the varRandom for printing Row 4 & 5
    cmp varRandom, 2
    je LoopAgainForRow4

DesignPatternDone:
    jmp     ContinueProgram
    ret
DesignPattern endp

;###################################################################
;                   BOX PATTERN - SQUARE   
;Refer - // https://www.javatpoint.com/how-to-print-pattern-in-java           
;###################################################################
BoxTypePattern PROC
BoxTypePatternStart:
    MacroClearScreen 14h
    MacroDisMsg msg2

;==================================================
;               Accept Input - Dynamic
;==================================================
    MacroDisMsg displayBoxNoPttrn
    MacroAcceptChar
    mov bl, al
    mov cl, al  ;cl -> ASCII Char ("4")
    
    ;input is invalid
    cmp cl, '2'
    jl BoxTypePatternStart

    cmp cl, '9'
    jg BoxTypePatternStart

    ;input is valid
    sub bl, 48      ;move char ASCII to dec's ASCII || bl = n

    ;Predefine the Number
    mov incNum, bl
    inc incNum ;n+1

    mov decNum, bl
    dec decNum ;n+1

    mov ah, 2
    MacroNewLine
    MacroNewLine

;==================================================
;                   Upper Cube Start
;==================================================
    mov bh, 1 ;bh = i = 1
    UpperCubeOutter:
;<<<<<<<<<<<<< Inner Left Cube >>>>>>>>>>>>>
    call InnerLoopCubeLeft

;<<<<<<<<<<<<< Inner Right Cube >>>>>>>>>>>>>
    call InnerLoopCubeRight

;-----------INNER LOOP END--------------
    ExitUpperCubeOutter:
    MacroNewLine

    inc bh
    cmp bh, bl
    jne UpperCubeOutter
;==================================================
;                   Lower Cube Start
;==================================================
    mov bh, bl ;i = user input 
    LowerCubeOutter:
;<<<<<<<<<<<<< Inner Left Cube >>>>>>>>>>>>>
    call InnerLoopCubeLeft

;<<<<<<<<<<<<< Inner Right Cube >>>>>>>>>>>>>
    call InnerLoopCubeRight
    
    ExitLowerCubeOutter:

    MacroNewLine

    dec bh
    cmp bh, 0
    jne LowerCubeOutter

    jmp     ContinueProgram
    ret
BoxTypePattern endp

InnerLoopCubeLeft PROC
    mov ch, 1 ;j = 1 -> inner cube 
    LoopCubeLeft:  
    mov varRandom, cl ;varRandom = n = user input (ASCII char)

    cmp bh, ch
    jl InnerLoopCubeLeft_IF
    ;else - System.out.print(n - j + 1 + " ")
    InnerLoopCubeLeft_ELSE:
    sub varRandom, ch ;n - j
    inc varRandom ;n - i + 1
    mov ah, 2
    mov dl, varRandom
    int 21h
    mov dl, 0
    int 21h
    
    jmp LoopCubeLeftExit
    ;if - System.out.print(n - i + 1 + " ")
    InnerLoopCubeLeft_IF:
    sub varRandom, bh ;n - i
    inc varRandom ;n - i + 1
    mov ah, 2
    mov dl, varRandom
    int 21h
    mov dl, 0
    int 21h

    LoopCubeLeftExit:
    inc ch
    cmp ch, incNum
    jne LoopCubeLeft

    ret
InnerLoopCubeLeft endp

InnerLoopCubeRight PROC
    mov ch, decNum ;j = user input - 1
    LoopCubeRight:
    mov varRandom, cl ;varRandom = n = 4

    ;Start if else statement
    cmp bh, ch
    jl InnerLoopCubeRight_IF
    ;else - System.out.print(n - j + 1 + " ")
    InnerLoopCubeRight_ELSE:
    sub varRandom, ch ;n - j
    inc varRandom ;n - i + 1
    mov ah, 2
    mov dl, varRandom
    int 21h
    mov dl, 0
    int 21h
    
    jmp LoopCubeRightExit
    ;if - System.out.print(n - i + 1 + " ")
    InnerLoopCubeRight_IF:
    sub varRandom, bh ;n - i
    inc varRandom ;n - i + 1
    mov ah, 2
    mov dl, varRandom
    int 21h
    mov dl, 0
    int 21h

    LoopCubeRightExit:
    dec ch
    cmp ch, 0
    
    jne LoopCubeRight
    ret
InnerLoopCubeRight endp

;#######################################################
;           NESTED LOOP PATTERN - 4 TRIANGLE               
;#######################################################
NestedLoopPattern PROC
NestedLoopStart: 
    MacroClearScreen 09h
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
    MacroClearScreen 09h
    mov dh,1 ;row
    mov dl,0 ;column
    mov cx,di ;move user input to the counter (row counter)
    UpperLeftTri:
        push cx
        UpperLeftTriPrinting:
            mov varColor, 4
            mov bl,varColor
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
                mov varColor, 11
                mov bl,varColor
                mov al,42
                mov ah, 2     ;set cursor position at 0
                int 10h       ;call BIOS
                mov ah, 9     ;display in horizontal line
                int 10h       ;call BIOS
            loop UpperRightTriPrinting
        inc si ;si+1=2
        
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
    ;num = varRandom
    LowerLeftTri:

        push cx
        mov cx, si ;loop column
        
        mov al,49
    

        LowerLeftTriPrinting:   
            mov varColor, 14
            mov bl,varColor    

            mov ah, 2   ;set cursor position at 0
            int 10h
            mov ah, 9   ;display in horizontal line
            int 10h   
            
            inc al
            mov varRandom,al
        loop LowerLeftTriPrinting

        inc si ;si+1=2
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
        mov varColor, 15
        mov bl,varColor
        mov al,49
        LowerRightTriPrinting:   
            mov ah, 2 ;set cursor position
            int 10h
            mov ah, 09h ;display chara
            int 10h     ;call BIOS               
            mov bh, 0
            inc al
            mov varRandom,al
        loop LowerRightTriPrinting

        pop cx  
        inc dh  ;BIOS new line = + row
        loop LowerRightTri

    NestedLoopEnd:
        jmp ContinueProgram
        ret

NestedLoopPattern endp

end MAIN