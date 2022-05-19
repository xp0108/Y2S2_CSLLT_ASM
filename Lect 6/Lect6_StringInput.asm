;6 - input a sentence (more that one char/ string)
.model small
.stack 100h
.data
    msg db ''''  ;define variable msg, db- define byte, this is empty
.code
MAIN proc
    mov ax,@data         ;@data - address of the data, passed to ax register 
    mov ds,ax            ;ax will pass the address of data to ds - data segmentation register

;here is where accept input
    mov ah, 0Ah         ;0Ah - services to receive str input
    mov dx,offset msg   ;offset will read str from msg character by character 
    int 21h             ;call DOS function

    mov ah,4ch  ;exit function 
    int 21h ;dos exit
Main endp
end main
