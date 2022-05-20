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

main proc  
MacroClearScreen 0fh
    mov ah,2
    call pattern3

NestedLoopEnd:
    mov ah,4ch 
    int 21h 

main endp
DisplayColour proc   
    mov bh, 0 ;Display page
    mov ah, 02h ;SetCursorPosition
    int 10h
    mov ah, 09h
    int 10h
    ret
DisplayColour endp

pattern3 proc near
    ; call CLS   
    
    mov colour,10
    mov dh,1
    mov dl,0
    mov bx,1
    mov cx,0 
   
    mov al,64
    mov char,al   
    
    wloop1:
        ; call Newline
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