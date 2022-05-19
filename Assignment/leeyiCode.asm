.model small
.stack 100h
.data 
    number db ?
    colour db 9
    char db ?
    count db ?
.code   

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
    
; Newline Macro 
;     mov ah,2
;     mov dl, 10 
;     int 21h
;     Mov dl, 13 
;     int 21h
; EndM

main proc  

   
    MacroClearScreen 00h
    
    mov ah,2
    ; mov colour,10   ;first tri color
    ; mov cx,1 ;j=1
    ; mov bx,5 ;i=5
    ; mov dh,1 ;row
    ; mov dl,0 ;col
    ; jmp NP01start
    
    ; NP01L1:                    
    ;     dec bx ;bx=4
    ;     CMP bx,4
    ;     JE NP01L2
    ;     CALL Newline
    ;     inc dh
    ;     mov dl,0
        
    ; NP01L2:
    ;     push dx
    ;     push cx
    ;     push bx
        
    ;     mov bl,colour
    ;     mov al,"*"
    ;     mov cx,1
    ;     CALL DisplayColour
        
    ;     pop bx
    ;     pop cx
    ;     pop dx
    ;     inc dl
    
    ; NP01start:
    ;     loop NP01L2
        
    ;     mov cx,7
    ;     sub cx,bx
    ;     CMP bx,0
    ;     JE NestedLoopEnd ;jmp to end
    ; loop NP01L1 

    ; mov colour,12
    ; mov cx,6
    ; mov bx,5
    ; mov dh,1
    ; mov dl,9
    ; jmp NP02start
    
    ; NP02L1:
    ;     dec bx
    ;     CALL Newline
    ;     mov dl,9
    ;     inc dh
    
    
    ; NP02L2:
    ;     push dx
    ;     push cx
    ;     push bx
        
    ;     mov bl,colour
    ;     mov al,"*"
    ;     mov cx,1
    ;     CALL DisplayColour
        
    ;     pop bx
    ;     pop cx
    ;     pop dx
    ;     inc dl
    
    
    ; NP02start:
    ;     loop NP02L2
    ;     mov cx,bx
    ;     loop NP02L1

;--------------------------------------------------------------------------
    ; mov colour,206
    ; mov dh,7
    ; mov dl,0
    ; mov cx,1
    ; mov bx,5  
    ; mov al,49
    ; mov number,al
    ; jmp NP03start
    
    ; NP03L1: 
    ;     dec bx
    ;     CMP bx,4
    ;     JE NP03L2
    ;     CALL Newline
    ;     inc dh
    ;     mov dl,0
    
    ; NP03L2:
    ;     push dx
    ;     push cx
    ;     push bx
        
    ;     mov bl,colour
    ;     mov al,number
    ;     mov cx,1
    ;     CALL DisplayColour
        
    ;     pop bx
    ;     pop cx
    ;     pop dx
    ;     inc dl
    ;     inc number
    
    ; NP03start:
    ;     loop NP03L2
        
    ;     mov cx,7
    ;     sub cx,bx
    ;     CMP bx,0
    ;     JE NestedLoopEnd ;jmp to end
        
    ;     mov number,49
    ; loop NP03L1

;----------------------------------------------------
    mov colour,18
    mov cx,6
    mov bx,5
    mov dh,7
    mov dl,9
    mov al,49
    mov number,al
    jmp NP04start
    
    NP04L1:
        dec bx
        ; CALL Newline
        mov dl,9
        inc dh
    
    
    NP04L2:
        push dx
        push cx
        push bx
        
        mov bl,colour
        mov al,number
        mov cx,1
        CALL DisplayColour
        
        pop bx
        pop cx
        pop dx
        inc dl
        inc number
    
    
    NP04start:
        loop NP04L2
        mov cx,bx  
        mov number,49
        loop NP04L1
    

NestedLoopEnd:
    mov ah,4ch 
    int 21h 

main endp

NewLine proc
    mov ah,2
    mov dl, 10 
    int 21h
    Mov dl, 13 
    int 21h
NewLine endp
DisplayColour proc   
    mov bh, 0 ;Display page
    mov ah, 02h ;SetCursorPosition
    int 10h
    mov ah, 09h
    int 10h
    ret
DisplayColour endp
    
topRightTriangle proc  
    
    ; mov colour,12
    ; mov cx,6
    ; mov bx,5
    ; mov dh,1
    ; mov dl,9
    ; jmp NP02start
    
    ; NP02L1:
    ;     dec bx
    ;     CALL Newline
    ;     mov dl,9
    ;     inc dh
    
    
    ; NP02L2:
    ;     push dx
    ;     push cx
    ;     push bx
        
    ;     mov bl,colour
    ;     mov al,"*"
    ;     mov cx,1
    ;     CALL DisplayColour
        
    ;     pop bx
    ;     pop cx
    ;     pop dx
    ;     inc dl
    
    
    ; NP02start:
    ;     loop NP02L2
    ;     mov cx,bx
    ;     loop NP02L1
    
    ret
topRightTriangle endp   

bottomLeftTriangle proc  
    ; mov colour,206
    ; mov dh,7
    ; mov dl,0
    ; mov cx,1
    ; mov bx,5  
    ; mov al,49
    ; mov number,al
    ; jmp NP03start
    
    ; NP03L1: 
    ;     dec bx
    ;     CMP bx,4
    ;     JE NP03L2
    ;     CALL Newline
    ;     inc dh
    ;     mov dl,0
    
    ; NP03L2:
    ;     push dx
    ;     push cx
    ;     push bx
        
    ;     mov bl,colour
    ;     mov al,number
    ;     mov cx,1
    ;     CALL DisplayColour
        
    ;     pop bx
    ;     pop cx
    ;     pop dx
    ;     inc dl
    ;     inc number
    
    ; NP03start:
    ;     loop NP03L2
        
    ;     mov cx,7
    ;     sub cx,bx
    ;     CMP bx,0
    ;     JE nestedLoopPattern03_end ;jmp to end
        
    ;     mov number,49
    ;     loop NP03L1
    ;     nestedLoopPattern03_end:
    
    ret
    
bottomLeftTriangle endp

bottomRightTriangle proc  
    ; mov colour,18
    ; mov cx,6
    ; mov bx,5
    ; mov dh,7
    ; mov dl,9
    ; mov al,49
    ; mov number,al
    ; jmp NP04start
    
    ; NP04L1:
    ;     dec bx
    ;     CALL Newline
    ;     mov dl,9
    ;     inc dh
    
    
    ; NP04L2:
    ;     push dx
    ;     push cx
    ;     push bx
        
    ;     mov bl,colour
    ;     mov al,number
    ;     mov cx,1
    ;     CALL DisplayColour
        
    ;     pop bx
    ;     pop cx
    ;     pop dx
    ;     inc dl
    ;     inc number
    
    
    ; NP04start:
    ;     loop NP04L2
    ;     mov cx,bx  
    ;     mov number,49
    ;     loop NP04L1
    
    ret
bottomRightTriangle endp

pattern3 proc near
    MacroClearScreen 00h 
    
    mov colour,10
    mov dh,1
    mov dl,0
    mov bx,1
    mov cx,0 
   
    mov al,64
    mov char,al   
    
    wloop1:
        CALL Newline
        inc char 
        mov dl,0
        inc dh
        inc bx 
        
        s2:
        inc colour
        
        
        cmp colour,16
        je s1
        
        cmp char,75
        je ended
        
    mov count,1    
    wloop2:
        mov bl,colour
        mov al,char 
        mov cx, 1 
        call DisplayColour  
              
        add dl,2
        inc count
        
        cmp count,11
        jne wloop2
        
        cmp bx,10
        jne wloop1 
        
    s1: 
        mov colour,10
        jmp s2

    ended:
    ret
         
pattern3 endp
end main