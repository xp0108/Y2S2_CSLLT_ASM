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
    pTest db "Test complete", 13, 10, "$" ;for testing only
    tempVar db ?
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
    jmp exit
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
    
    ;print message
    clearScreenDefineColor 74h
    printDesAndExit pDiamond

;=====================================================
; DNA SHAPE
;=====================================================
selectDNA:
    
    ;new line
    newLine
    
    ;print message
    clearScreenDefineColor 74h
    printDesAndExit pDNA

;=====================================================
; BOX SHAPE
;=====================================================
selectBox:
    
    ;new line
    newLine
    
    ;print message
    clearScreenDefineColor 74h
    printDesAndExit pBox
;=====================================================
; NESTED LOOP SHAPE
;=====================================================
selectNestedLoop:
    
    ;new line
    newLine
    
    ;print message
    clearScreenDefineColor 74h
    printDesAndExit pLoop
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

end main


