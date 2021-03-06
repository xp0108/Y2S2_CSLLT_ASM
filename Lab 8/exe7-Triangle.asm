.model small
.stack 100h
.code
main proc

  mov ah,2	; display character function/service
  mov bl,10	; base value set to 10 ( 10 rows)
  mov cl,0	; cl register value set to 0 (counter register always 0)
  mov ch,5	; ch register value is 5 (counter high bit reg) cl - row, ch-colomn
  mov bh,1	; base reg value is 1

top: 
     inc cl	; increament cl (cl = cl+1)
     mov dl,42	; display char, 42 is * in ASCII
     int 21h	; call DOS

     cmp cl,ch	; compare cl with ch
     jne top	; if not equal go to top (here both are equal)
    

     mov dl,10	; new line
     int 21h

     mov cl,0	; cl value is set to 0
     dec ch	; decreament ch (ch = ch-1)
     dec bl	; decreament bl (bl = bl-1)
     cmp bl,5	; compare bl is = 5
     jne top	; jump if not equal to top

     mov cl,0	; cl value is set to 0

top1:
      inc cl	;increament cl (cl = cl+1)
      mov dl,42	; display char, 42 is * in ASCII
      int 21h	; call dos

     cmp cl,bh	; compare cl with ch
     jne top1	; if not equal go to top1 

     mov dl,10	; new line
     int 21h

     mov cl,0	; cl value is set to 0
     inc bh	; increament bh (bh = bh+1)
     dec bl	; decreament bl (bl = bl-1)
     cmp bl,0	; compare bl is = 0
     jne top1	; jump if not equal to top1

     mov ah,4ch
     int 21h
main endp
end main
