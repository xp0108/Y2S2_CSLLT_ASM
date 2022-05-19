.model small
.stack 100h

.data
    menu    db 10,10,13,"!!!!! HAPPY INDEPENDENCE DAY, MALAYSIA !!!!!"
            db 10,10,13,6,0,6,0,6,0,6,0,"MAIN MENU",0,6,0,6,0,6,0,6,0,13,10,10
            db "1. Number Patterns",13,10
            db "2. Design Patterns",13,10
            db "3. Box Type Patterns",13,10
            db "4. Nested Loop Patterns",13,10
            db "5. Exit Program",13,10,10
            db "Select your choice: $"  
        
    invalidInputMsg db 10,10,"########## INVALID INPUT! ENTER AGAIN ##########",13,10,'$'

    msg1 db "here is number patterns",10,10,'$' 
    msg2 db "here is Design patterns",10,10,'$' 
    msg3 db "here is Box type patterns",10,10,'$'
    msg4 db "here is Nested loop patterns",10,10,'$'
    
    wannaContinue db 10,10,13, "Do you wanted to continue the program [Y/N] ? " ,0, '$'
.code

;MACRO FUNCTION 
MacroDisMsg Macro msg
    lea dx, msg  
    mov ah, 09h 
    int 21h  
EndM

MacroAcceptChar Macro
    mov ah, 1           ;read a letter
    int 21h 
    mov bl,al           ;move al to bl  
EndM

MacroClearScreen Macro
    mov ah,6        ;clear screen
    mov al,0        ;Full Screen
    mov bh,4fh      ;4fh
    mov cx,0        ;Starting Coordinates
    mov dl,79       ;Coloum      
    mov dh,24       ;Row
    int 10h

    mov ah,2        ;Cursor being at 0,0
    mov bh,0
    mov dh,0        ;vertical
    mov dl,0        ;horizontal
    int 10h
EndM

MAIN PROC 
    mov ax,@data
    mov ds,ax
    
    ClearScreen:
        MacroClearScreen
    
    DisplayMenu:  
        MacroDisMsg menu     
        
    GetInput:        
        MacroAcceptChar        

        ;if bigger than 5 or smaller than 1 -> display invalid input
        cmp al, '5'
        jg InvalidInput 

        cmp al, '1'
        jl  InvalidInput
        
        cmp al, "1"
        je  NPtrn
        cmp al, "2"
        je  DPtrn
        cmp al, "3"
        je  BTPtrn
        cmp al, "4"
        je  NLPtrn
        cmp al, "5"
        jmp Exit

    Exit: 
        mov   ah,4ch
        int   21h   

    NPtrn: call NumberPattern
    DPtrn: call DesignPattern
    BTPtrn: call BoxTypePattern
    NLPtrn: call NestedLoopPattern


    ContinueProgram:
        MacroDisMsg wannaContinue
        MacroAcceptChar
        cmp al, 'y'
        je  ClearScreen
        cmp al, 'Y'
        je  ClearScreen
        cmp al, 'n'
        je  Exit
        cmp al, 'N'
        je  Exit
        cmp al, '0'
        jge ContinueProgramInvalidInput

    InvalidInput:
        MacroClearScreen
        MacroDisMsg invalidInputMsg 
        jmp DisplayMenu 

    ContinueProgramInvalidInput:
        MacroClearScreen
        MacroDisMsg invalidInputMsg 
        jmp ContinueProgram 
        
main endp

;PROCEDURE FUNCTION
NumberPattern PROC
    MacroClearScreen
    MacroDisMsg msg1 
     mov dl,10
      mov ah,2	; display character function/service
  mov bl,10	; base value set to 10 ( 10 rows)
  mov cl,0	; cl register value set to 0 (counter register always 0)
  mov ch,5	; ch register value is 5 (counter high bit reg) cl - row, ch-colomn
  mov bh,1	; base reg value is 1

top1:
      inc cl	;increament cl (cl = cl+1)
      mov dl,42	; display char, 42 is * in ASCII
      int 21h	; call dos
      mov dl,0
      int 21h

     cmp cl,bh	; compare cl with ch
     jne top1	; if not equal go to top1 

     mov dl,10	; new line
     int 21h

     mov cl,0	; cl value is set to 0
     inc bh	; increament bh (bh = bh+1)
     dec bl	; decreament bl (bl = bl-1)
     cmp bl,5	; compare bl is = 0
     jne top1	; jump if not equal to top1

     
     mov cl,0	; cl value is set to 0
top: 
    inc cl	; increament cl (cl = cl+1)
    mov dl,42	; display char, 42 is * in ASCII
    int 21h	; call DOS
    mov dl,0
    int 21h

     cmp cl,ch	; compare cl with ch
     jne top	; if not equal go to top (here both are equal)
    

     mov dl,10	; new line
    int 21h
     

     mov cl,0	; cl value is set to 0
     dec ch	; decreament ch (ch = ch-1)
     dec bl	; decreament bl (bl = bl-1)
     cmp bl,0	; compare bl is = 5
     jne top	; jump if not equal to top
    
    jmp ContinueProgram
    ret
NumberPattern endp

DesignPattern PROC
    MacroClearScreen
    MacroDisMsg msg2
    jmp     ContinueProgram
    ret
DesignPattern endp

BoxTypePattern PROC
    MacroClearScreen
    MacroDisMsg msg3
    mov dl,10
    MOV CX, 10 ;heigh
    MOV BX, 10
    
    L1:
    PUSH CX
    MOV CX,10 ;weigh
       
    L2:
     MOV AH,2
     MOV DL,'a'
     INT 21H
     MOV DL,' '
     INT 21H
       
     LOOP L2
     
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     
    POP CX     
       LOOP L1
    jmp ContinueProgram
    ret
BoxTypePattern endp

NestedLoopPattern PROC
    MacroClearScreen
    MacroDisMsg msg4     
    
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

    jmp ContinueProgram
    ret
NestedLoopPattern endp

end MAIN