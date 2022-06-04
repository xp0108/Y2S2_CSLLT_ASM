.model small
.stack 100h

.data
    banner db "-----------------------------", 13,10
           db "RED week @ APU", 13,10
           db "Organizer: APU Student ARC", 13,10
           db "Date: 23/5/2022 - 25/5/2022", 13,10
           db "Time: 10:00 - 17:00 MYT", 13,10
           db "Venue: APU Atrium, Level 3", 13,10
           db "-----------------------------", 13,10,10
           db 15,32,15,32, 'SHAPE GENERATION SYSTEM ', 15,32,15,32,13,10,10, "$"

    menu db 'Main Menu' , 13,10
         db '=======================', 13,10
         db 254,15,32, '1. Number Patterns', 13,10
         db 254,15,32, '2. Design Patterns', 13,10
         db 254,15,32, '3. Box Type Patterns' , 13, 10
         db 254,15,32, '4. Nested Loop Patterns', 13,10,10
         db 'Select your choice : $'
    
    pDiamond db 10,"Numbers patterns is selected", 13, 10,10, "$"
    pDNA db 10,"Design pattern is selected", 13, 10,10, "$"
    pBox db 10,"Box type pattern is selected", 13, 10,10, "$"
    pLoop db 10,"Nested Loop pattern is selected", 13, 10,10, "$"
    pInvalid db 10,"Invalid Input", 13, 10,10, "$"

    tempVar db ?
    tempColor db ?
    diamondInput db "How many row you wanted to display [3~9]? $"
    dnaInput db "How many row you wanted to display [1~9]? $"
    loopInput db "How many row you wanted to display [3~9]? $"

    DNARow1&5 db "X   X$"
    DNARow2&4 db " X X $"
    DNARow3 db "  X  $"

    DNARow1&5End db "X",10,'$'
    DNARow2&4End db " X",10,'$'
    DNARow3End  db "  X",10,'$'

.code

newLine Macro
    mov dl, 10
    mov ah, 02h
    int 21h
EndM

clearScreenDefineColor Macro color
    mov ah,6        ;clear screen
    mov al,0        ;Full Screen
    mov bh,color    ;color
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

printDesAndExit Macro des
    mov dx, offset des
    mov ah, 09h
    int 21h
EndM

Main proc
    
    ;fetch data
    mov ax, @data
    mov ds, ax

    ;print banner
    clearScreenDefineColor 14h
    mov ah, 09h
    mov dx, offset banner
    int 21h
    jmp printMenu
    
printMenu:
    ;print menu
    mov ah, 09h
    mov dx, offset menu
    int 21h
    
    ;get user input
    mov ah, 01h
    int 21h
    mov bl,al
    
    ;compare input 
    cmp bl, '1'
    je selectDiamond
    
    cmp bl, '2'
    je selectDNA
    
    cmp bl, '3'
    je selectBox
    
    cmp bl, '4'
    je selectNestedLoop
    
    ;if user put other numbers than 1,2,3,4 show invalid message
    jmp selectInvalid
;=====================================================
; DIAMOND SHAPE
;=====================================================
selectDiamond:

    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp diamondP
;=====================================================
; DNA SHAPE
;=====================================================
selectDNA:

    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp dnaP

;=====================================================
; BOX SHAPE
;=====================================================
selectBox:

    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp boxP
;=====================================================
; NESTED LOOP SHAPE
;=====================================================
selectNestedLoop:

    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp loopP
;==================SHAPE CODE END======================

selectInvalid:
    
    ;print new line
    newLine
    
    ;print invalid
    mov ah, 09h
    mov dx, offset pInvalid
    int 21h
    jmp printMenu
    
exit:
    mov ah,4ch
    int 21h
    
Main endp

    ;call the function in Process
    diamondP: call Diamond
    dnaP: call DNA
    boxP: call Box
    loopP: call NLoop

;=====================================================
; PROCESS - PATTERN CODE
;=====================================================

Diamond PROC
    ;if invalid input 
    jmp DiamondStart ;skip invalid input first
    DiamondInvalid:
    
    ;print new line
    newLine
    
    ;print invalid
    mov ah, 09h
    mov dx, offset pInvalid
    int 21h
    jmp DiamondStart

    printDesAndExit pDiamond
    DiamondStart:
    printDesAndExit diamondInput

    ;accept input
    mov ah, 1 
    int 21h 
    ;convert input into ASCII
    cbw
    mov  di, ax
    cmp di, '3'
    jl DiamondInvalid

    cmp di, '9'
    jg DiamondInvalid
    sub di, 48      ;move ASCII

;=======================Up Triangle======================

    mov ah, 2
    newLine

    mov cx,di 
    mov bx, 1 ;j = column
    ;num = tempVar
    UpTriangleLoop1:
        
        push cx ;initial = input ; inner loop

        UpTriangleSpace:   
            mov dl, " "             
            int 21h
            int 21h
        loop UpTriangleSpace
    pop cx
;-------------------------------------------------------
    push cx
        mov cx, bx ;bx= cx =1

        mov dl,"1" 
        mov tempVar,dl
        UpTriangleLeft:
            mov dl, tempVar  ;move tempVar to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, " "        
            int 21h     ;print 
        loop UpTriangleLeft
        inc bx  ;bx+1=2
    pop cx
;--------------------------------------------------------------
    push cx     
    push bx     ;2
    cmp bx, 2
    je UpTriangleEnd
        dec bx  ;2-1
        mov cx, bx ;bx=1,cx=1
        dec cx 
        dec tempVar
        UpTriangleRight:
            dec tempVar  ;move tempVar to dl 
            mov dl, tempVar
            int 21h          ;print
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, " "   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop UpTriangleRight
    pop bx
    pop cx

    UpTriangleEnd:
        newLine
        loop UpTriangleLoop1
;=======================Down Triangle======================
    mov ah, 2
    dec di
    mov cx,di ;have to dec 1
    mov bx, 1 ;j = column
    DownTriangleLoop1:
    mov dl," "            
    int 21h
    int 21h
        push cx
        mov cx, bx ;cx=1

        DownTriangleSpace:   
            mov dl," "            
            int 21h
            int 21h
        loop DownTriangleSpace
        pop cx 
    
    inc bx 
;-------------------------------------------------------
    push cx
        mov dl,"1"   ;Ascii 1 ; num = 1
        mov tempVar,dl
        DownTriangleLeft:
            mov dl, tempVar  ;move tempVar to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, " "   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop DownTriangleLeft
    pop cx
;--------------------------------------------------------------
    push cx     ;8
    dec cx
    cmp cx,1
    jl ReturnBack
        ; dec bx  ;2-1
        ; mov cx, bx ;bx=1,cx=1
        dec tempVar
        DownTriangleRight:
            dec tempVar  ;move tempVar to dl 
            mov dl, tempVar
            int 21h          ;print
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, " "   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop DownTriangleRight
    pop cx


    DownTriangleEnd:
    newLine
    loop DownTriangleLoop1
    
ReturnBack:
    jmp exit
    ret
Diamond endp

DNA PROC
    ;if invalid input 
    jmp DNAStart ;skip invalid input first
    DNAInvalid:
    
    ;print new line
    newLine
    
    ;print invalid
    mov ah, 09h
    mov dx, offset pInvalid
    int 21h
    jmp DNAStart

    printDesAndExit pDNA
    DNAStart:
    printDesAndExit dnaInput
    ;accept input
    mov ah, 1   
    int 21h
    mov bl, al

    cmp bl, '1'
    jl DNAInvalid

    cmp bl, '9'
    jg DNAInvalid
    ;convert input into ASCII
    sub bl, 48
    
    mov ah,2
    newLine
        
;-------------------------------------
    mov cl, 0
    Row1Start:
    printDesAndExit DNARow1&5

    inc cl
    cmp cl, bl
    jne Row1Start

    printDesAndExit DNARow1&5End
;-------------------------------------
    mov cl, 0
    Row2Start:
    printDesAndExit DNARow2&4
    inc cl
    cmp cl, bl
    jne Row2Start
    printDesAndExit DNARow2&4End
;-------------------------------------
    mov cl, 0
    Row3Start:
    printDesAndExit DNARow3
    inc cl
    cmp cl, bl
    jne Row3Start
    printDesAndExit DNARow3End

;-------------------------------------
    mov cl, 0
    Row4Start:
    printDesAndExit DNARow2&4
    inc cl
    cmp cl, bl
    jne Row4Start
    printDesAndExit DNARow2&4End
;-------------------------------------
    mov cl, 0
    Row5Start:
    printDesAndExit DNARow1&5

    inc cl
    cmp cl, bl
    jne Row5Start

    printDesAndExit DNARow1&5End

    jmp exit
    ret
DNA endp

Box PROC
    printDesAndExit pBox

    ;UPPER BOX
    mov bl, 1 ;i=1, int i = 1
    UpperBoxOutter:
    ;UPPER BOX _ INNER LEFT
    USIL: call BoxInnerLeft

    ;UPPER BOX _ INNER RIGHT
    USIR: call BoxInnerRight

;-----------INNER LOOP END--------------
    ExitUpperBoxOutter:
    
    mov ah,2
    mov dl,10
    int 21h

    inc bl
    cmp bl, 6;5
    jne UpperBoxOutter

;---------UPPER BOX END----------------

;-------------------------
;LOWER BOX
    mov bl, 4;3 ;i=1, int i = 1
    LowerBoxOutter:
    ;LOWER BOX _ INNER LEFT
    LSIL: call BoxInnerLeft

    ;LOWER BOX _ INNER RIGHT
    LSIR: call BoxInnerRight
    
    ExitLowerBoxOutter:
    mov ah,2
    mov dl,10
    int 21h

    dec bl
    cmp bl, 0
    jne LowerBoxOutter
;-------------------------

    jmp exit
    ret
Box endp
BoxInnerLeft PROC
    mov cl, 1 ;int j = 1
    InnerLoopLeft:  
    mov tempVar, "E" ;tempVar = n = 4

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
    cmp cl, 6 ;n+1
    jne InnerLoopLeft

    ret
BoxInnerLeft endp
BoxInnerRight PROC
    mov cl, 4 ;int j = 3 (n-1)
    InnerLoopRight:
    mov tempVar, "E" ;tempVar = n = 4

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
BoxInnerRight endp

NLoop PROC

    ;if invalid input 
    jmp LoopStart ;skip invalid input first
    LoopInvalid:
    
    ;print new line
    newLine
    
    ;print invalid
    mov ah, 09h
    mov dx, offset pInvalid
    int 21h
    jmp LoopStart

    printDesAndExit pLoop
    LoopStart:
    printDesAndExit loopInput

    ;accept input
    mov ah, 1 
    int 21h 
    ;convert input into ASCII
    cbw
    mov  di, ax
    cmp di, '3'
    jl LoopInvalid

    cmp di, '9'
    jg LoopInvalid
    sub di, 48      ;move ASCII

    clearScreenDefineColor 74h

;TOP LEFT------------------------------------------------------------
    mov dh,1 ;row
    mov dl,0 ;col
    mov cx,di
    StartTopLeft:
        push cx
        StartTopLeftPrint:
            mov tempColor, 4fh ;define color
            mov bl,tempColor
            mov al, '*'
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
                mov tempColor, 4ch ;define color
                mov bl,tempColor
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
        mov tempColor, 4ch ;define color
        mov bl,tempColor
        mov al, "1"
    
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
        mov tempColor, 4fh ;define color
        mov bl,tempColor
        mov al,"1"
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
    
    jmp exit
    ret
NLoop endp


end main

