;printing all the alphabart 
.model small
.stack 100h
.code

main proc
        mov ah,2
        mov cx, 5;26 ;sub minus (total no wanna display)
        mov dl,65 ;A
;display dl
loop1:
        int 21h
        mov bl ,dl ;bl 65
        mov dl," " ;0 ;dl=0
        int 21h
        mov dl,bl ;bl move dl so display (dl) will be 65 again
        inc dl ;dl+1
        dec cx ;minus the row of display
        jnz loop1 

        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h

;=====================
        mov ah,2
        mov cx,26
        mov dl,97


loop2: 
        int 21h
        inc dl
        dec cx
        jnz loop2

        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h

;=======================;number
        mov ah,2
        mov cx,10
        mov dl,48       ;48 ascii for 0


loop3:
        int 21h
        inc dl
        dec cx
        jnz loop3 ;jne - jump if not equal to

        mov ah,4ch
        int 21h

main endp
end main
