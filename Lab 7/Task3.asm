
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Program is to print the number (0 to 9) using loop.

.model small
.stack 100h
.data
.code  

main proc 
    ;0-9  => there are 10 number so set 10 to counter
    ;register
    
    mov cx,10
    
    ;set 48 to bl register because at 48 => 0
    mov bl,48
    
    ;label
    
    repeat:
        mov dl,bl
        mov ah,2
        int 21h  
        
        ;newline
        mov dl,10
        mov ah,2
        int 21h
        
        mov dl,13
        mov ah,2
        int 21h
        
        inc bl  ;bl = bl+1
    loop repeat 
    
    
    ;thank you for watching 
    ;do subscribe and comment
     
    main endp

ret




