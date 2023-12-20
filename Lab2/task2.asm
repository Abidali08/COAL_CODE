    
    
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q3 => Write a program to multiply two numbers.   

.model small
.stack 100h
.data
.code

main proc
   mov al,2 
    mov bl,5 
    
    sub bl,al
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    main endp
ret
