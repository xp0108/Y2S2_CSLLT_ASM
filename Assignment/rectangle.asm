; test for squ 
;https://theencarta.com/generic-hollow-square-assembly-language-code/
.model small
.stack 100h

.data
    tempVar db ?
.code

;MACRO FUNCTION 
MacroNewLine Macro 
    mov dl,10
    int 21h
endM

MAIN PROC 
mov ax,@data
    mov ds,ax
    
;Saving in ‘a’
mov ah,2

mov tempVar,"6"
sub tempVar,48    ;start cursor with 0 
mov cl,tempVar
;For Next Line
MacroNewLine

;For Line of *
;mov cx,5
aa: ;first line 
mov dx,'A' ;'*'
int 21h
mov dx," "
int 21h
loop aa

;For * * Line
mov cl,tempVar
sub cl,2
label1:
mov bx,cx

;For Next Line
MacroNewLine

;First Left column 
mov dx,'A' ;'*'
int 21h

mov cl,tempVar
sub cl,2
label2:
mov dx,' '
int 21h
int 21h ;mody - space for column


loop label2
mov dx,' '  ;mody
int 21h

mov dx,'A' ;'*'
int 21h

mov cx,bx
loop label1

;For Next Line
MacroNewLine

mov cl,tempVar
label4:
mov dx,'A' ;'*'
int 21h
mov dx," "
int 21h
loop label4

    mov ah,4ch 
    int 21h 
main endp
end MAIN