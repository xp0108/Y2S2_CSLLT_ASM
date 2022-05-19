;NUMBER TRIANGLE
.model small
.stack 100h
.code
main proc
    ;------------------------------------------------------------------------Left Top
        mov ah,2    ;display character function/service
        mov bl,3    ;base value set to 5(5rows)   ;;display 5 line 
        ;this cl ch will add the row and column
        mov cl,0    ;cl register value is 0 (counter low bit reg always 0)  ;;coutner register always start with 0
        mov ch,1    ;ch register value is 1 (counter hight bit reg) cl-row,ch-column
        ; mov bh,1;;;;
    LeftTop: ;is a label, program will start from here 
        inc cl      ;increment cl (cl=cl+1) ;; incrementing the number of row
        mov dl,42   ;display char 42 / '*'. 42 is * in ASCII
        int 21h     ;call dos , print at the DOS interface
        ; mov bh,dl;;;;
        mov dl,0 ;replace dl with space
        int 21h
    ;;if cursor no equal to row
        cmp cl,ch   ;compare cl with ch ;;comprate the 2 register is equal or not
        jne LeftTop     ;jump if not equal, go to top ;;if not equal the jump function will take place. If it is equal the function will be ignore
        ;IF NOT EQUAL WILL LOOP BACK TO THE main proc's code

        mov dl,10   ;new line ;the cursor will move to the next line and the data will be inserted 
        int 21h     ;call DOS

        mov cl,0    ;cl value set to 0      ;set the cl reg back to 0, everytime when go to the new line will start from the beginning again 
        inc ch      ;increment ch (ch=ch+1) ;column
        dec bl      ;decrement bl (bl=bl-1) ;base register - b4 tis set at 5, here wanted to reduce to 0
        cmp bl,0    ;compare bl is 0
        jne LeftTop     ;jumo if not equal - go to top
    mov dl,10
        int 21h
    ;-----------------------------------------------------------------Right Top
        mov ah,2
        mov bl,5
        mov cl,0
        mov ch,5

    Righttop:
        inc cl
        mov dl,'*'
        int 21h
        mov dl,0
        int 21h


        cmp cl,ch
        jne Righttop

        mov dl,10
        int 21h

        mov cl,0
        dec ch
        dec bl
        cmp bl,0
        jne Righttop

    ;new line
    mov dl,10   ;new line ;the cursor will move to the next line and the data will be inserted 
        int 21h 
        mov dl,10   ;new line ;the cursor will move to the next line and the data will be inserted 
        int 21h 

    mov dl,10
        int 21h
    ;-------------------------------------------------------Left Bottom
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

    mov dl,10
        int 21h
    ;---------------------------------------------------- Right Bottom

    mov ah,2        ;display character function/service
    mov bl,5        ;display 5 rows
    mov cl,0        ;cursor strat from 0
    mov ch,5        ;carry dynamic column
    mov bh,1        ;carry temporary data
    ;column - ch,cl,bl
    ;row - bl

    RightFirstColumn:
        mov dl,53       ;ASCCI for character 1
        int 21h

    RightCheckColumn:
        inc cl
        mov bh,dl       ;now bh carry temp 65
        mov dl,0        ;replace dl with space
        int 21h
        cmp cl, ch 
        je RightAddRow       ;jump if equal
        
    RightAddColumn:
        mov dl,bh       ;now bl carry 65 again
        dec dl
        int 21h
        cmp cl,ch 
        jne RightCheckColumn

    RightAddRow:
        mov dl,10       ;move to next line
        int 21h

        mov cl,0    
        dec ch      
        dec bl      
        cmp bl,0    
        jne RightFirstColumn 


Exit:
  mov ah,4ch
  int 21h
main endp
end main
