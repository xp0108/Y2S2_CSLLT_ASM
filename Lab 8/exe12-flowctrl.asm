;clear the entire screen and occupy highlight and print the message at the top line of the screen
.model small
.stack 100h
.data
        msg db "My University Name is APIIT$"
.code
main proc

        mov ah,6        ;clear screen
        mov al,0        ;Full Screen
        mov bh,71h      ;Attribute 7 for background and 1 for foreground (first - background, second - word)
        mov cx,0        ;Starting Coordinates
        mov dl,79       ;Coloum      
        mov dh,24       ;Row
        int 10h

        mov ah,2        ;Cursor being at 0,0
        mov bh,0
        mov dh,0       ;vertical
        mov dl,0      ;horizontal
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
