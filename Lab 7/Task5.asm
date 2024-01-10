
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;  Program is to print even number 
;between 0 to 10 using loop.

.model small
.stack 100h
.data
num dw 0    ;store 0 value in num variable
rem db ?    ;in this variable we store remainder
.code

main proc
    ;set 10 to counter register and to iterate loop 10 times
    mov cl,10 
    
    even:
        mov ax,num  ;set num value in dx
        mov bl,2    ;set 2 in bl register
        div bl      ;ax/bl
        ;remmber remainder store in ah register
        ; and qoutient store in al register after division
        
        mov rem,ah  ;store remainder in rem variable
        
        cmp rem,0
        jnz next_value  ;if rem is not zore check next_value
        
        ;if remainder is zero then print that value
        mov dx,num   ;ax value store dx
        add dx,48   ;convert dec to char
        mov ah,2    ;print char
        int 21h     ;function call
        
        next_value:
        inc num
    loop even
    
    
    ;Thank you for watching
    ;Do comment and subscribe if you have any question
    main endp

ret




