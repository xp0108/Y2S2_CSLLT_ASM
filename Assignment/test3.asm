.model small
.stack 100h
.data 
    tempVar db ?
    tempColor db 9
    char db ?
    count db ?
.code   

clearScreenDefineColor Macro colorVar
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

PrintColorChar Macro
mov bh, 0   ;Display page
    mov ah, 02h ;SetCursorPosition
    int 10h
    mov ah, 09h
    int 10h
EndM
main proc  

   
    mov ah,2
    call TopLeftAstTriangle
    mov ah,2
    call TopRightAstTriangle
    mov ah,2
    call BottomLeftNumTriangle
    mov ah,2
    call BottomRightNumTriangle


NLoopEnd:
    mov ah,4ch 
    int 21h 

main endp

TopLeftAstTriangle proc  

    clearScreenDefineColor 0fh
    
    mov tempColor, 4fh ;define color
    mov dh,1 ;row
    mov dl,0 ;col
    mov cx,1 ;j=1
    mov bx,5 ;i=5
    jmp TopLeftAstTriangleStart
    
    TopLeftAstTriangleElse:                    
        dec bx 
        CMP bx,4
        je TopLeftAstTriangleIf
        inc dh
        mov dl,0
        
    TopLeftAstTriangleIf:
        push dx
        push cx
        push bx
        
        mov bl,tempColor
        mov al,"*"
        mov cx,1
        PrintColorChar
        
        pop bx
        pop cx
        pop dx
        inc dl
    
    TopLeftAstTriangleStart:
        loop TopLeftAstTriangleIf
        
        mov cx,7
        sub cx,bx
        CMP bx,0
        je TopLeftAstTriangleEnd ;jmp to end
        
        loop TopLeftAstTriangleElse 
        
    TopLeftAstTriangleEnd:
    ret
    
TopLeftAstTriangle endp
    
TopRightAstTriangle proc  
    mov tempColor, 4ch ;define color
    mov cx,6
    mov bx,5
    mov dh,1
    mov dl,9
    jmp TopRightAstTriangleStart
    
    TopRightAstTriangleElse:
        dec bx
        mov dl,9
        inc dh
    
    
    TopRightAstTriangleIf:
        push dx
        push cx
        push bx
        
        mov bl,tempColor
        mov al,"*"
        mov cx,1
        PrintColorChar
        
        pop bx
        pop cx
        pop dx
        inc dl
    
    
    TopRightAstTriangleStart:
        loop TopRightAstTriangleIf
        mov cx,bx
        loop TopRightAstTriangleElse
    
    ret
TopRightAstTriangle endp   

BottomLeftNumTriangle proc  
    mov tempColor, 4ch ;define color
    mov dh,7
    mov dl,0
    mov cx,1
    mov bx,5  
    mov al,49
    mov tempVar,al  ;Number
    jmp BottomLeftNumTriangleStart
    
    BottomLeftNumTriangleElse: 
        dec bx
        CMP bx,4
        je BottomLeftNumTriangleIf
        inc dh
        mov dl,0
    
    BottomLeftNumTriangleIf:
        push dx
        push cx
        push bx
        
        mov bl,tempColor
        mov al,tempVar  ;Number
        mov cx,1
        PrintColorChar
        
        pop bx
        pop cx
        pop dx
        inc dl
        inc tempVar ;Number
    
    BottomLeftNumTriangleStart:
        loop BottomLeftNumTriangleIf
        
        mov cx,7
        sub cx,bx
        CMP bx,0
        je BottomLeftNumTriangleEnd ;jmp to end
        
        mov tempVar,49  ;Number
        loop BottomLeftNumTriangleElse
        BottomLeftNumTriangleEnd:
    
    ret
    
BottomLeftNumTriangle endp

BottomRightNumTriangle proc  
    mov tempColor, 4fh ;define color
    mov cx,6
    mov bx,5
    mov dh,7
    mov dl,9
    mov al,49
    mov tempVar,al  ;Number
    jmp BottomRightNumTriangleStart
    
    BottomRightNumTriangleElse:
        dec bx
        ; CALL Newline
        mov dl,9
        inc dh
    
    
    BottomRightNumTriangleIf:
        push dx
        push cx
        push bx
        
        mov bl,tempColor
        mov al,tempVar  ;Number
        mov cx,1
        PrintColorChar
        
        pop bx
        pop cx
        pop dx
        inc dl
        inc tempVar ;Number
    
    
    BottomRightNumTriangleStart:
        loop BottomRightNumTriangleIf
        mov cx,bx  
        mov tempVar,49 ;Number
        loop BottomRightNumTriangleElse
    
    ret
BottomRightNumTriangle endp
end main