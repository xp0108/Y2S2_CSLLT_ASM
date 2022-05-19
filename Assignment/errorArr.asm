.MODEL SMALL
.STACK 0100h
.DATA

.CODE
start:

; MOV AX,6 
; ; MOV BH,4fh      ;color
; ; MOV CX,0        ;count cursor
; ; MOV DX,6223D    ;dx - data register 
; INT 10h

 mov  ah, 0
  mov  al, 3
  int  10h

  mov  ah, 0
  mov  al, 3
  int  10h

;-----------------
MOV AH,2   ;settin cursor position 
    MOV DH,5    ;row
    MOV DL,11   ;column
    MOV DL,5   ;column
INT 10h
;--------------------
    mov cx,5
    TopRight1:
        push cx

        TopRightPrint:
            mov dl,42
            int 21h
            mov dl,0
            int 21h
        loop TopRightPrint

        mov dl,10
        int 21h

        pop cx
    loop TopRight1
    int 21h
;-----------------
MOV AH,02h
MOV DL,10
INT 21h
;-----------------
MOV DH,5    ;row
MOV DL,11   ;column
MOV DL,20   ;column
INT 10h

MOV AH,02h
MOV DL,'w'
INT 21h

MOV AX,4C00h
INT 21h
END start