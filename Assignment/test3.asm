

.model small
.stack 100h
.data
tempVar db ?
.code
main proc

    mov cx,5
    StartTopLeft:
        push cx
        StartTopLeftPrint:
        mov dl,1   ;row
        mov dh,1   ;col
        mov bl,1fh  ;color combination. upto 255
            ; mov dl,42
            ; int 21h
            ; mov dl,0
            ; int 21h
            mov ah, 9h  ;char display
            mov al,42  
            mov cx, 1
            int 10h     ;call BIOS
            inc dh
        loop StartTopLeftPrint
           
        ; mov ah,2
        mov ah, 9h
        mov al,10
        int 10h
        pop cx
    loop StartTopLeft

    ; int 21h

;--------------------------------------------------

    ; mov cx,5 ;row
    ; mov bx, 1
    ; StartTopRight:
    ;     push cx
    ;         mov cx, bx ;cx=1
    ;         StartTopRightPrint:
    ;            mov dl,42 ; character to write
    ;             int 21h     ; dos interrupt 21h
    ;             mov dl, 0
    ;             int 21h
    ;         loop StartTopRightPrint
    ;     inc bx ;bx+1=2
    ;     pop cx  ;4
        
    ;     mov dl,10
    ;     int 21h
    ; loop StartTopRight

    ; int 21h
;--------------------------------------------------
;   mov cx,5 ;row ,i=5
;   mov bx, 1 ;j = column
;     ;num = tempVar
;     NumberBottomLeft:

;         push cx
;         mov cx, bx ;cx=1
        
;         mov dl,49
    
;                 mov tempVar,dl

;                 NumberBottomLeftPrint:   
;                     mov dl, tempVar                 
;                     int 21h
;                     inc dl
;                     mov tempVar,dl
;                     mov dl, 0   ;space
;                     int 21h
;                 loop NumberBottomLeftPrint
        
;         inc bx ;bx+1=2
        
;         pop cx  ;4

;          mov dl,10
;         int 21h
;     loop NumberBottomLeft

;     int 21h

;--------------------------------------------------
;   mov cx,5 ;row ,i=5
; ;   mov bx, 1 ;j = column
;     ;num = tempVar
;     NumberBottomRight:

;         push cx
;         ; mov cx, bx ;cx=1
        
;         mov dl,49
    
;                 mov tempVar,dl

;                 NumberBottomRightPrint:   
;                     mov dl, tempVar                 
;                     int 21h
;                     inc dl
;                     mov tempVar,dl
;                     mov dl, 0   ;space
;                     int 21h
;                 loop NumberBottomRightPrint
        
;         ; inc bx ;bx+1=2
        
;         pop cx  ;4

;          mov dl,10
;         int 21h
;     loop NumberBottomRight

;--------------------------------------------------

Exit:
    mov ah,4ch 
    int 21h 

main endp
end main
           