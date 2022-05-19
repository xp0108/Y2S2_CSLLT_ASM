; .model small
; .stack 100h
; .data
;         msg1 db 10,"ENTER A LOWERCASE LETTER : $"
;         msg2 db 10,"IN UPPER CASE IT IS      : $"

; .code
; main proc
;         mov ax,@data
;         mov ds,ax

;         mov ah,9
;         mov dx,offset msg1
;         int 21h
; ;accept input
;         mov ah,1
;         int 21h

; ;process
;         sub al,20h
;         mov bl,al
; ;
;         mov ah,9
;         mov dx,offset msg2
;         int 21h

;         mov ah,2  ;set output function
;         mov dl,bl ;dl - mov to next line ;bl - carry the var
;         int 21h ;display the var

;         mov ah,4ch
;         int 21h
; main endp
; end main

; Solution 1:

; ;TITLE PGM4_3: CASE CONVERSION PROGRAM

.MODEL SMALL
.STACK 100H
.DATA
MSG1    DB      'ENTER A LOWER CASE LETTER: $'
MSG2    DB      0DH, 0AH, 'IN UPPER CASE IT IS: '
CHAR    DB      ?,'$'
.CODE
MAIN PROC

;initialize DS
        MOV     AX,@DATA	;get data segment	
        MOV     DS,AX		;initialize DS

;print user prompt
        LEA     DX,MSG1		;get first message
        MOV     AH,9		;display string function
        INT     21H		;display first message

;input a character and convert to upper case
       MOV      AH,1		;read character function
       INT      21H		;read a small letter into AL
       SUB      AL,20H 		;convert it to upper case
       MOV      CHAR,AL		;and store it

;display on the next line
       LEA      DX,MSG2		;get second message
       MOV      AH,9		;display string function
       INT      21H		;display message and upper case	

;DOS exit			;letter in front
       MOV      AH,4CH
       INT      21H		;DOS exit

MAIN ENDP
        END MAIN


; Solution 2:
; Code for Program to read a letter in Lower case and print it after converting it in to Upper case letter.......... in Assembly Language



; .MODEL SMALL
; .STACK 100H

; .DATA
;     PROMPT_1  DB  'Enter the Lower Case Letter : $'
;     PROMPT_2  DB  0DH,0AH,'The Upper Case Letter is : $'

; .CODE
; MAIN PROC
;      MOV AX, @DATA                ; initialize DS
;      MOV DS, AX

;      LEA DX, PROMPT_1             ; load and print PROMPT_1
;      MOV AH, 9
;      INT 21H

;      MOV AH, 1                    ; read a letter
;      INT 21H

;      MOV BL, AL                   ; save the letter in BL 

;      LEA DX, PROMPT_2             ; load and print PROMPT_2
;      MOV AH, 9
;      INT 21H

;      AND BL, 0DFH                 ; convert a lower case letter to upper
;                                   ; case letter

;      MOV AH, 2                    ; print the Lower case letter
;      MOV DL, BL
;      INT 21H

;      MOV AH, 4CH                  ; return control to DOS
;      INT 21H
; MAIN ENDP 
; END MAIN
