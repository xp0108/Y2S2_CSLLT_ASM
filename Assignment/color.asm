; .model small
; .stack 100h
; .data

; Jan   db  "         January           ",13
;       db  "Sun Mon Tue Wed Thu Fri Sat",13
;       db  "                 1   2   3 ",13
;       db  " 4   5   6   7   8   9  10 ",13
;       db  "11  12  13  14  15  16  17 ",13
;       db  "18  19  20  21  22  23  24 ",13
;       db  "25  26  27  28  29  30  31 ",0
; color db 181
; x     db 0     ;SCREEN COORDINATE (COL).
; y     db 0     ;SCREEN COORDINATE (ROW).

; .code    
; MAIN PROC       
; ;INITIALIZE DATA SEGMENT.
;   mov  ax,@data
;   mov  ds,ax 

; ;SWITCH SCREEN TO GRAPHICS MODE.
;   mov  ah,0
;   mov  al,13h  ;320x240x256.
;   int  10H

;   mov  di, offset Jan
; top:      
;   call gotoxy  ;SET CURSOR POSITION FOR CURRENT CHAR.
;   mov  al, [ di ]  ;CHAR TO DISPLAY.
;   cmp  al, 13    ;IF CHAR == 13
;   je   linebreak ;THEN JUMP TO LINEBREAK.
;   cmp  al, 0   ;IF CHAR == 0
;   je   finish  ;THEN JUMP TO FINISH.
;   call char_display  ;DISPLAY CHAR IN AL WITH "COLOR".
;   inc  x  ;NEXT CHARACTER GOES TO THE RIGHT.
;   jmp  next_char
; linebreak:  
;   inc  y  ;MOVE TO NEXT LINE.    
;   mov  x, 0  ;X GOES TO THE LEFT.
; next_char:
;   inc  di  ;NEXT CHAR IN "JAN".
;   jmp  top

; finish:

; ;WAIT FOR ANY KEY.
;   mov  ah,7
;   int  21h

; ;FINISH THE PROGRAM PROPERLY.
;   mov  ax,4c00h
;   int  21h        
; main endp
; ;-------------------------------------------------     
; ;DISPLAY ONE CHARACTER IN "AL" WITH "COLOR".

; char_display proc 
;   mov  ah, 9
;   mov  bh, 0
;   mov  bl, color  ;ANY COLOR.
;   mov  cx, 1  ;HOW MANY TIMES TO DISPLAY CHAR.
;   int  10h
;   ret
; char_display endp    

; ;-------------------------------------------------     
; gotoxy proc 
;   mov dl, x
;   mov dh, y
;   mov ah, 2 ;SERVICE TO SET CURSOR POSITION.
;   mov bh, 0 ;PAGE.
;   int 10h   ;BIOS SCREEN SERVICES.  
;   ret
; gotoxy endp

; end MAIN





.MODEL SMALL
.STACK 0100h
.DATA

.CODE
start:
MOV AX,@DATA
MOV DS,AX

MOV AH,02h
MOV DL,'f'
INT 21h

;-------------------

MOV AX,6 
; MOV BH,4fh      ;color
MOV CX,0        ;count cursor
MOV DX,6223D    ;dx - data register 
INT 10h

MOV AH,2   ;settin cursor position 
MOV BH,0   ;page number
    MOV DH,0Ch    ;row
    MOV DL,28h   ;column
INT 10h

MOV AH,02h
MOV DL,'x'
INT 21h
;-----------------------------
MOV AH,02h
MOV DL,10
INT 21h

MOV AH,2   ;settin cursor position 
MOV BH,0   ;page number
    MOV DH,0Ch    ;row
    MOV DL,27h   ;column
INT 10h

MOV AH,02h
MOV DL,'w'
INT 21h

MOV AH,02h
MOV DL,10
INT 21h

MOV AX,4C00h
INT 21h
END start