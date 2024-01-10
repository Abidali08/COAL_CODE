
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Write a program to divide two numbers and 
;store its quotient and remainder in variable. 

.model
.data
rem db ? ; for store remainder
qu  db ? ; for store quotient
msgr db 'Remainder is : $' ;prompt for remainder
msgq db 'Quotient is : $'  ;ptompt for quotient
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ax,11   ;store 11 in register ax 
    mov cl,2    ;store 2 in cl register
    div cl      ;ax is divident and cl is divisor  
                ;ax/cl => remainder store in ah register
                ;and quotient store in al register always 
                ;remember!....
   ;as per question store remainder and quotient in variable
   
   ;so
   
   mov rem,ah  ;remainder store in rem variable
   mov qu, al  ;quotient store in qu variable 
   
   lea dx,msgq  ;load quotient prompt
   mov ah,9
   int 21h
   
   mov dl,qu    ;load quotient value in dl
   add dl,48     ;convert dec to character
   mov ah,2      ;output function load in ah
   int 21h       ;call service 
   
   ;print in newline
   
   mov dl,10    ;10 is for newline
   mov ah,2
   int 21h
   
   ;remove space from second line
    
   mov dl,13    ;13 is for carry-return
   mov ah,2
   int 21h
                
    
   ;now print remainder
   lea dx,msgr  ;load remainder prompt
   mov ah,9
   int 21h
   
   mov dl,rem    ;load quotient value in dl
   add dl,48     ;convert dec to character
   mov ah,2      ;output function load in ah
   int 21h       ;call service
   
   
   ;Thank you for watching...do comment and subscribe
    
    main endp

ret




