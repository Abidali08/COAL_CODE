
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Write a program to demostrate the concept 
;of push and pop operations.  

.model small
.stack 100h
.data
.code

main proc
    mov ax,5    ;load 5 value in ax register
    push ax     ;store 5 value in stack 
    ;remamber stack work on LIFO=> (Last In, First out)
    
    mov ax,9
    push ax     ;another value push in stack 
    ;here now stack is empty in starting
    
    ;now pop and print
    
    pop dx  ;9 value pop and store in dx register
    ;9 is last value enter in stack so that why it pop
    ;first  
    add dx,48   ;convert 9 into char
    mov ah,2    ;print char
    int 21h
    
    pop dx  ;5 value pop and store in dx register
    ;9 is last value enter in stack so that why it pop
    ;first  
    add dx,48   ;convert 9 into char
    mov ah,2    ;print char
    int 21h
    
    
    
    ;thank you for watching do subscribe and comment
    main endp
ret




