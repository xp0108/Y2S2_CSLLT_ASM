.model small
.stack 100h
.code
main proc
      mov ah,2
      mov bl,5
      mov cl,0
      mov ch,5

top:
      inc cl
      mov dl,'*'
      int 21h
      mov dl,0
      int 21h


      cmp cl,ch
      jne top

      mov dl,10
      int 21h

      mov cl,0
      dec ch
      dec bl
      cmp bl,0
      jne top

      mov ah,4ch
      int 21h
main endp
end main