.model small
.stack 100h 
.code
MAIN proc
    mov ah, 2   ;display character function/service
    mov bl, 6   ;base value set to 5 (5 rows)
    mov cl, 0   ;cl reg value is 0 (counter reg always 0)
    mov ch, 1   ;ch reg value is 1 (counter high bit reg) cl - row,ch - color

top: 
    inc cl      ;increment cl (cl=cl+1)
    mov dl, 42  ;displat char 42/'*'. 42 is * in ASCII
    int 21h     ;call DOS

    cmp cl, ch ;compare cl with ch 
    jne top     ;jump if not equal , go to top

    mov dl,10  ; new line 
    int 21h     ;call DOS

    mov cl, 0   ;cl value set to 0
    inc ch      ;increment ch (ch=ch+1)
    dec bl      ;decrement bl (bl-bl-1)
    cmp bl,0    ;compare bl is 0
    jne top     ;jump to the top labe


    mov ah,4ch 
    int 21h 
Main endp
end main

