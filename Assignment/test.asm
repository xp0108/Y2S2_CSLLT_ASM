.model small
.stack 100h

.data
    Banner  db 10,13,"======================================================================="
            db 10,13,"          HAPPY INDEPENDENT DAY @ ASIA PACIFIC UNIVERSITY"
            db 10,13,"                     ORGANIZER: APU STUDENT ARC"
            db 10,13,"                        DATE: 31 AUGUEST 2022"
            db 10,13,"                     TIME: 4:00 p.m. - 9:00 p.m."
            db 10,13,"               VENUE: ASIA PACIFIC UNIVERSITY, LEVEL 3"
            db 10,13,"=======================================================================$"
    menu    db 10,10,13,6,0,6,0,6,0,6,0,"MAIN MENU",0,6,0,6,0,6,0,6,0,13,10,10
            db "1. Number Patterns",13,10
            db "2. Design Patterns",13,10
            db "3. Box Type Patterns",13,10
            db "4. Nested Loop Patterns",13,10
            db "5. Exit Program",13,10,10
            db "Select your choice: $"  
        
    invalidInputMsg db 10,10,"########## INVALID INPUT! ENTER AGAIN ##########",13,10,'$'

    msg1 db "Here Is Number Pattern",10,10,'$' 
    msg2 db "Here Is Design Pattern",10,10,'$' 
    msg3 db "Here Is Box Type Pattern",10,10,'$'
    msg4 db "Here Is Nested Loop Pattern",10,10,'$'
    
    wannaContinue db 10,10,13, "Do you wanted to continue the program [Y/N] ? " ,0, '$'

    tempVar db ?
    colour db ?

    displayNestedNoPttrn db "Row To Display [4 - 9]: $"
    displayNumberNoPttrn db "Row To Display [3 - 9]: $"
    displayDesignNoPttrn db "Diamond To Display [1 - 9]: $"

    DesignPatternRow15 db 35,0,0,0,35,"$"
    DesignPatternRow24 db 0,35,0,35,0,"$"
    DesignPatternRow3 db 0,0,35,0,0,"$"

    DesignPatternRow15End db 35,,10,'$'
    DesignPatternRow24End db 0,35,10,'$'
    DesignPatternRow3End  db 0,0,35,10,'$'
.code

;=======================================================
;                   MACRO FUNCTION
;=======================================================
MacroNewLine Macro 
    mov dl,10
    int 21h
endM

MacroDisMsg Macro msg
    lea dx, msg  
    mov ah, 09h 
    int 21h  
EndM

MacroAcceptChar Macro
    mov ah, 1       ;read a letter
    int 21h 
EndM

MacroClearScreen Macro colorVar
    mov ah,6        ;clear screen
    mov al,0        ;Full Screen
    mov bh,colorVar ;4fh color
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
;#######################################################
;                   PROGRAM START
;#######################################################
MAIN PROC 
    mov ax,@data
    mov ds,ax

    MacroClearScreen 04eh
    MacroDisMsg msg2
    
;==================================================
;                   Upper Cube Start
;==================================================
    mov bh, 1 ;bh = i = 1
    UpperCubeOutter:
;<<<<<<<<<<<<< Inner Left Cube >>>>>>>>>>>>>
    call InnerLoopCubeLeft

;<<<<<<<<<<<<< Inner Right Cube >>>>>>>>>>>>>
    call InnerLoopCubeRight

;-----------INNER LOOP END--------------
    ExitUpperCubeOutter:
    
    MacroNewLine

    inc bh
    cmp bh, 5
    jne UpperCubeOutter
;==================================================
;                   Lower Cube Start
;==================================================
    mov bh, 3 ;i=1, int i = 1
    LowerCubeOutter:
;<<<<<<<<<<<<< Inner Left Cube >>>>>>>>>>>>>
    call InnerLoopCubeLeft

;<<<<<<<<<<<<< Inner Right Cube >>>>>>>>>>>>>
    call InnerLoopCubeRight
    
    ExitLowerCubeOutter:

    MacroNewLine

    dec bh
    cmp bh, 0
    jne LowerCubeOutter
    
    mov   ah,4ch
    int   21h  

main endp

InnerLoopCubeLeft PROC
    mov ch, 1 ;int j = 1
    LoopCubeLeft:  
    mov tempVar, 52 ;tempVar = n = 4

    cmp bh, ch
    jl InnerLoopCubeLeft_IF
    ;ELSE
    InnerLoopCubeLeft_ELSE:
    sub tempVar, ch ;n - j
    inc tempVar ;+1
    mov ah, 2
    mov dl, tempVar
    int 21h
    mov dl, 0
    int 21h
    
    jmp LoopCubeLeftExit
    ;IF
    InnerLoopCubeLeft_IF:
    sub tempVar, bh ;n - i
    inc tempVar ;+1
    mov ah, 2
    mov dl, tempVar
    int 21h
    mov dl, 0
    int 21h

    LoopCubeLeftExit:
    inc ch
    cmp ch, 5
    jne LoopCubeLeft

    ret
InnerLoopCubeLeft endp

InnerLoopCubeRight PROC
    mov ch, 3 ;int j = 3 (n-1)
    LoopCubeRight:
    mov tempVar, 52 ;tempVar = n = 4

    ;IF ELSE START
    cmp bh, ch
    jl InnerLoopCubeRight_IF
    ;ELSE
    InnerLoopCubeRight_ELSE:
    sub tempVar, ch ;n - j
    inc tempVar ;+1
    mov ah, 2
    mov dl, tempVar
    int 21h
    mov dl, 0
    int 21h
    
    jmp LoopCubeRightExit
    ;IF
    InnerLoopCubeRight_IF:
    sub tempVar, bh ;n - i
    inc tempVar ;+1
    mov ah, 2
    mov dl, tempVar
    int 21h
    mov dl, 0
    int 21h

    LoopCubeRightExit:
    dec ch
    cmp ch, 0
    
    jne LoopCubeRight
    ret
InnerLoopCubeRight endp

end MAIN