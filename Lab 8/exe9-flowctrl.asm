.model small
.stack 100h
.data
      msg1 db 10,"Enter the character : $"
      msg2 db 10,"The ASCII code of the given number in binary form is : $"
      msg3 db 10,"The number of 1 bits in ASCII code are : $"
.code
main proc
      mov ax,@data
      mov ds,ax

      mov ah,9
      mov dx,offset msg1
      int 21h

      mov ah,1
      int 21h
;-----------------
      xor bx,bx               ;clear bx
      mov bl,al               ;move al to bl

      mov ah,9
      mov dx,offset msg2
      int 21h

      xor bh,bh         ;clear bh
      mov cx,8          ;Initialize loop counter

      mov ah,2          ;set output function

out1:
      shl bl,1          ;shift left BX by 1 bit

      jnc zero          ;jump to label zero if cf=0  JNC=Jump if Carry Flag Not Set
      inc bh
      mov dl,31h        ;set dl=1
      jmp dis

zero:
      mov dl,30h        ;set dl=0

dis:
      int 21h
      loop out1

      mov ah,9
      mov dx,offset msg3
      int 21h

      or bh,30h         ;convert the decimal to ascii code

      mov ah,2          ;print the contents of bh
      mov dl,bh
      int 21h

      mov ah,4ch
      int 21h

main endp
end main