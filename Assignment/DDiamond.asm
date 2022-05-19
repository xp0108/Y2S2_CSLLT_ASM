.model small
.stack 100h

.data
    tempVar db ?
    tempVar2 db ?
    trueee db "TRUEEE$"
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
    mov bl,al           ;move al to bl  
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

    mov ah, 2

    mov cx,8 ;num=8
    mov bx, 1 ;j = column
    ;num = tempVar
    NumberBottomLeft:
        
        push cx ;initial = 8 ; inner loop

        NumberBottomRightPrint:   
            mov dl, 0             
            int 21h
            int 21h
        loop NumberBottomRightPrint
    pop cx
;-------------------------------------------------------
    push cx
        mov cx, bx ;cx=1

        mov dl,49   ;Ascii 1 ; num = 1
        mov tempVar,dl
        L2:
            mov dl, tempVar  ;move tempVar to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop L2
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
        L3:
            dec tempVar  ;move tempVar to dl 
            mov dl, tempVar
            int 21h          ;print
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop L3
    pop bx
    pop cx

    DiamondUp:
        MacroNewLine
        loop NumberBottomLeft
;=====================================================================
    mov ah, 2
    mov cx,7 ;num=7 , have to dec 1
    mov bx, 1 ;j = column
    NumberBottom:
    mov dl,0            
    int 21h
    int 21h
        push cx
        mov cx, bx ;cx=1

        NumberBottomLeftPrint:   
            mov dl,0            
            int 21h
            int 21h
        loop NumberBottomLeftPrint
        pop cx 
    
    inc bx 
;-------------------------------------------------------
    push cx
        mov dl,49   ;Ascii 1 ; num = 1
        mov tempVar,dl
        L4:
            mov dl, tempVar  ;move tempVar to dl 
            int 21h          ;print
            inc dl           ;dl+1
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop L4
    pop cx
;--------------------------------------------------------------
    push cx     ;8
    dec cx
    cmp cx,1
    jl Exit
        ; dec bx  ;2-1
        ; mov cx, bx ;bx=1,cx=1
        dec tempVar
        L5:
            dec tempVar  ;move tempVar to dl 
            mov dl, tempVar
            int 21h          ;print
            
            mov tempVar,dl  ;move dl to tempVar (dl = tempVar)         
            mov dl, 0   ;dl use to print, Ascii 0 = space      
            int 21h     ;print 
        loop L5
    pop cx


    DiamondDown:
    MacroNewLine
    loop NumberBottom

Exit:
    mov ah,4ch 
    int 21h 

main endp
end MAIN