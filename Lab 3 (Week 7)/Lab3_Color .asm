.model small
.stack 100h
.code
MAIN proc
    mov ah, 9h  ;char displaay
    mov al,"X"  ;char # is displayed
    mov bh,0    ;start value of char, start should be alwaus o
    mov dl, 11
    mov bl,255  ;color combination. upto 255
    mov cx,5    ;cx-counter reg to repeat the char display
    int 10h     ;call BIOS

;     MOV AH,2   ;settin cursor position 
; MOV BH,0   ;page number
;     MOV DH,0Ch    ;row
;     MOV DL,27h   ;column
; INT 10h

; MOV AH,02h
; MOV DL,'w'
; INT 21h

    mov ah, 4ch
    int 21h
Main endp
End main