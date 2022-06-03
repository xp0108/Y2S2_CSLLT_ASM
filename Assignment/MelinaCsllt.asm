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
    diamondInput db "How many row you wanted to display [3~9]? $"
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
    
    ;new line
    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp diamondP
;=====================================================
; DNA SHAPE
;=====================================================
selectDNA:
    
    ;new line
    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp dnaP

;=====================================================
; BOX SHAPE
;=====================================================
selectBox:
    
    ;new line
    newLine
    
    ;jump to Process, run function
    clearScreenDefineColor 74h
    jmp boxP
;=====================================================
; NESTED LOOP SHAPE
;=====================================================
selectNestedLoop:
    
    ;new line
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

    diamondP: call Diamond
    dnaP: call DNA
    boxP: call Box
    loopP: call NLoop

;=====================================================
; PROCESS
;=====================================================

Diamond PROC
    printDesAndExit pDiamond
    printDesAndExit diamondInput
    DiamondStart:

    ;accept input
    mov ah, 1 
    int 21h 
    ;convert input into ASCII
    cbw
    mov  di, ax
    cmp di, '3'
    jl DiamondStart

    cmp di, '9'
    jg DiamondStart
    sub di, 48      ;move ASCII

;=======================Up Triangle======================

    mov ah, 2
    newLine

    mov cx,di ;8 ;num=8
    mov bx, 1 ;j = column
    ;num = tempVar
    OuterUpDiamonLoop:
        
        push cx ;initial = input ; inner loop

        UpSpaceTri:   
            mov dl, 0             
            int 21h
            int 21h
        loop UpSpaceTri
    pop cx
;-------------------------------------------------------
    push cx
        mov cx, bx ;bx= cx =1

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
        newLine
        loop OuterUpDiamonLoop
;=======================Down Triangle======================
    mov ah, 2
    dec di
    mov cx,di ;num=7 , have to dec 1
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
    jl ReturnBack
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
    newLine
    loop OuterDownDiamonLoop

ReturnBack:
    jmp exit
    ret
Diamond endp

Diamond PROC

DNA:
    printDesAndExit pDNA
    jmp exit
    ret
DNA endp

Box:
    printDesAndExit pBox
    jmp exit
    ret
Box endp

NLoop:
    printDesAndExit pLoop
    jmp exit
    ret
NLoop endp


end main


