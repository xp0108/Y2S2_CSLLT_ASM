; .model small
; .stack 100
; .code
; main proc
; 	mov ah,2h
; 	mov bl,255
; 	mov dl,0
	
; 	top:	int 21h
; 		dec bl
; 		inc dl
; 		cmp dl,0
; 		jne top
		
; 	mov ah,4ch
; 	int 21h
; main endp
; end main

; Solution 2:

; model small
; .stack 100h
; .code

; main proc

; 	mov ah,2
; 	mov bl,1
; 	int 21h
	
; start: 	mov ah,2
; 		mov dl,bl
; 		int 21h
		
; 		add bl,1
		
; 		cmp bl,255
; 		jne start
		
; 		mov ah,4ch
; 		int 21h
		
; main endp
; end main


; Display A-Z, a – z , 0 – 9 with space

.model small
.stack 100h
.code
main proc
      mov ah,2
      mov bl,26
      mov cl,65

top:
      mov dl,cl ;move cl to dl, dl =65
      int 21h
                   
      mov dl,32
      int 21h

      dec bl
      inc cl
      cmp bl,0
      jne top

      mov dl,10
      int 21h

      mov bl,26
      mov cl,97

top2:
      mov dl,cl
      int 21h

      mov dl,32
      int 21h

      dec bl
      inc cl
      cmp bl,0
      jne top2

      mov dl,10
      int 21h

      mov bl,10
      mov cl,48

top3:
      mov dl,cl
      int 21h

      mov dl,32
      int 21h

      dec bl
      inc cl
      cmp bl,0
      jne top3

      mov ah,4ch
      int 21h
main endp
end main


; Solution 3:
; .model small
; .stack 100h
; .code
; main proc
;         mov ah,2
;         mov bl,0
;         mov cl,-1
;    L:   inc cl
;         mov dl,cl
;         int 21h
;         mov dl,9
;         int 21h
;         inc bl
;         cmp bl,255
;         jne L

;         mov ah,4ch
;         int 21h
; main endp
; end main
