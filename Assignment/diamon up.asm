.MODEL SMALL
.STACK  50H

.CODE
MacroNewLine Macro 
    mov dl,10
    int 21h
endM

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 6
    MOV BX, 1

    FOR_1:
        PUSH CX
        MOV DL, 0
        MOV AH, 2

        FOR_2:
        INT 21H
        LOOP    FOR_2

        MOV CX, BX ;now bx carry previous cx
        FOR_3:
            MOV DL, 49
            MOV AH, 2
            INT     21H
            MOV DL, 0
            MOV AH, 2
            INT     21H

        LOOP    FOR_3

       MacroNewLine
        INC BX
        POP CX

    LOOP    FOR_1

    MOV AH, 4CH
    INT         21H
MAIN ENDP
    END MAIN