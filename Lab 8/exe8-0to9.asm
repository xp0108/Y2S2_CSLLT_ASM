; print the number 0 - 9 in the orderly manner
.model small
.stack 100h
.code

main proc

      mov bl,0        ;you may use xor bl,bl
      mov ch,0
      mov cl,15         ;you may use mov cl,0Ah

L1:
;      mov dh,00h
      mov dl,bl
      add dl,30h
      
      mov ah,2
      int 21h
      inc bl
      loop L1

      mov ah,4ch
      int 21h
main endp
end main