
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q4 => Write a program to divide two numbers and 
;       print its quotient and remainder.   

.model small
.stack 100h
.data
.code

main proc
    
    mov ax,11   ;11 store in ax register
    mov bl,2    ;2 store in bl register
    div bl       ; ax/bl = > quotient store in al and 
                 ;remainder store in ah 
                 ;print the value of quotient and remainder
    mov ch,ah    ; remainder value store in ch
    mov cl,al    ;quotient value store in cl
    
    mov dl,cl     ;cl value store in dl
    add dl,48     ; convert it into char
    mov ah,2      ; write(output)
    int 21h       ;service/resource call
    
    mov dl,ch     ;cl value store in dl
    add dl,48     ; convert it into char
    mov ah,2      ; write(output)
    int 21h       ;service/resource call 
    
    
    ;thank you for watching...Do comment if you have any question.
    
    ;task => Input 2 values from user and divide.
    
    main endp
ret




