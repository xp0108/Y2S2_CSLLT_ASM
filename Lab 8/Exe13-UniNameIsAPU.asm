; highlight the certain potion, in the box
.model small
.stack 100h
.data
        msg db "My University Name is APIIT$"
.code
main proc

        mov ah,6        ;clear screen
        mov al,0        ;Full Screen
        mov bh,71h      ;Attribute 7 for background and 1 for foreground
        mov cx,15       ;Starting Coordinates
        mov dl,59       ;Coloum      
        mov dh,14       ;Row
        int 10h

        mov ah,2        ;Cursor being at 0,0
        mov bh,0
        mov dl,25
        mov dh,7
        int 10h

        mov ax,@data
        mov ds,ax

        mov ah,9
        mov dx,offset msg
        int 21h

        mov ah,4ch
        int 21h
main endp
end main