

.model small
.stack 100h
.data
.code
main proc
    
    MOV CX,5
    MOV BX,5
    
    
    L1:
    PUSH CX
    MOV CX,5
       
    L2:
     MOV AH,2
     MOV DL,'*'
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
       
       
    
    EXIT:
    MOV AH,4CH
    INT 21H

main endp
end main
           