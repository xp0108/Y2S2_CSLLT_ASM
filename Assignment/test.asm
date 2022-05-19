.model small
.stack 100h
.data 
    colour db ?
.code
MacroNewLine Macro 
    mov dl,10
    int 21h
endM
main proc
    mov colour,10
    mov dh,1
    mov dl,0    
    mov cx,1
    mov bx,5
    jmp NP01start
    
    NP01L1:
        dec bx
        CMP bx,4
        JE  NP01L2
        MacroNew Line
        inc dh
        mov dl,0
        
    
    NP01L2:
        
        push dx
        push cx
        push bx
        
        mov bl,colour    
        mov al,"*"
        mov cx,1
        ; CALL DisplayColour
      
        
        pop bx
        pop cx
        pop dx
        inc dl
        
        
    NP01start:
    
    loop NP01L2

    mov cx,7
    sub cx,bx
    CMP bx,0
    JE  nestedLoopPattern01_end ;jmp to end

    loop NP01L1
    nestedLoopPattern01_end: 

    mov ah,4ch 
    int 21h 

main endp
end main
           