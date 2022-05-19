

.model small
.stack 100h
.data
tempVar db ?
.code
main proc
    mov ah,2

    mov cx,5
    StartTopLeft:
        push cx
        StartTopLeftPrint:
            mov dl,42
            int 21h
            mov dl,0
            int 21h
        loop StartTopLeftPrint

        mov dl,10
        int 21h

        pop cx
    loop StartTopLeft

    int 21h

;--------------------------------------------------

    mov cx,5 ;row
    mov bx, 1
    StartTopRight:
        push cx
            mov cx, bx ;cx=1
            StartTopRightPrint:
               mov dl,42 ; character to write
                int 21h     ; dos interrupt 21h
                mov dl, 0
                int 21h
            loop StartTopRightPrint
        inc bx ;bx+1=2
        pop cx  ;4
        
        mov dl,10
        int 21h
    loop StartTopRight

    int 21h
;--------------------------------------------------
  mov cx,5 ;row ,i=5
  mov bx, 1 ;j = column
    ;num = tempVar
    NumberBottomLeft:

        push cx
        mov cx, bx ;cx=1
        
        mov dl,49
    
                mov tempVar,dl

                NumberBottomLeftPrint:   
                    mov dl, tempVar                 
                    int 21h
                    inc dl
                    mov tempVar,dl
                    mov dl, 0   ;space
                    int 21h
                loop NumberBottomLeftPrint
        
        inc bx ;bx+1=2
        
        pop cx  ;4

         mov dl,10
        int 21h
    loop NumberBottomLeft

    int 21h

;--------------------------------------------------
  mov cx,5 ;row ,i=5
;   mov bx, 1 ;j = column
    ;num = tempVar
    NumberBottomRight:

        push cx
        ; mov cx, bx ;cx=1
        
        mov dl,49
    
                mov tempVar,dl

                NumberBottomRightPrint:   
                    mov dl, tempVar                 
                    int 21h
                    inc dl
                    mov tempVar,dl
                    mov dl, 0   ;space
                    int 21h
                loop NumberBottomRightPrint
        
        ; inc bx ;bx+1=2
        
        pop cx  ;4

         mov dl,10
        int 21h
    loop NumberBottomRight

;--------------------------------------------------
; https://www.youtube.com/watch?v=6Y7AaEDd1nI
    ; sub cx,cx
    ; mov cx, 5
    ; mov tempVar, 1
    ; mov v2,65

    ; L1:
    ; mov bx, cx
    ; mov cl, tempVar
    ; mov al, v2

    ; L2:
    ; mov ah,02
    ; mov dl, al
    ; int 21h 
    ; inc al
    ; loop L2

    ; mov ah,02
    ; mov dl, 10
    ; int 21h
    ; mov dl, 13
    ; int 21h

    ; mov cx,bx
    ; inc tempVar
    ; loop L1


    mov ah,4ch 
    int 21h 

main endp
end main
           