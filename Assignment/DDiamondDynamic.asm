.model small
.stack 100h

.data
    tempVar db ?
    tempVar2 db ?
    trueee db "TRUEEE$"
    displayNoPttrn db "How many row you wanted to display [4~9]? $"
.code

;MACRO FUNCTION 
MacroNewLine Macro 
    mov dl,10
    int 21h
    mov dl,13
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
EndM

MacroClearScreen Macro colorVar
    mov ah,6        ;clear screen
    mov al,0        ;Full Screen
    mov bh,colorVar ;4fh color
    mov cx,0        ;Starting Coordinates
    mov dl,79       ;Coloum      
    mov dh,24       ;Row
    int 10h

    mov ah,2        ;Cursor begin at 0,0
    mov bh,0
    mov dh,0        ;vertical
    mov dl,0        ;horizontal
    int 10h
EndM

MAIN PROC 
    mov ax,@data
    mov ds,ax

DiamondStart:
;dynamic---------------------------------------------
    MacroDisMsg displayNoPttrn
    MacroAcceptChar
    cbw               ; AH = 0 or 0xFF according to top bit of AL, convert input into word
    mov  si, ax
    cmp si, '4'
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
    jl Exit
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

Exit:
    mov ah,4ch 
    int 21h 

main endp
end MAIN