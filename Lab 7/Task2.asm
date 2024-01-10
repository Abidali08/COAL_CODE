
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; 2) Program is to 
;take five times input form user using loop.

.model small
.stack 100h
.data
.code

main proc
    
    ;set counter register as 5
    mov cx,5
    
    ;label
    
    l1:
        mov ah,1
        int 21h
    loop l1 
    
    ;Thank you for watching 
    ;Do comment and subscribe
    
    
    main endp

ret




