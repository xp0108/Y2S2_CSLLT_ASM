;NESTED LOOOP
.model small
.stack 100h
.code
main proc

;RIGHT BOTTOM PATTERN
mov ah,2        ;display character function/service
mov bl,5        ;display 5 rows
mov cl,0        ;cursor strat from 0
mov ch,1        ;carry dynamic column
mov bh,1        ;carry temporary data
;column - ch,cl,bl
;row - bl

FirstColumn:
    mov dl,49       ;ASCCI for character 1
    int 21h

CheckColumn:
    inc cl
    mov bh,dl       ;now bh carry temp 65
    mov dl,0        ;replace dl with space
    int 21h
    cmp cl, ch 
    je AddRow       ;jump if equal
    
AddColumn:
    mov dl,bh       ;now bl carry 65 again
    inc dl
    int 21h
    cmp cl,ch 
    jne CheckColumn

AddRow:
    mov dl,10       ;move to next line
    int 21h

    mov cl,0    
    inc ch      
    dec bl      
    cmp bl,0    
    jne FirstColumn 

Exit:
  mov ah,4ch
  int 21h
main endp
end main
