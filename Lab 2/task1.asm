
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;Lab2 Q1) Program is to add two Numbers.

.model small
.stack 100h
.data
.code

main proc
    mov al,2 ;value 2 store in AL register
    mov bl,5 ;value 5 store in bl register
    
    add al,bl ;add is instruction to add two values
              ; above statement means => al = al+bl
              ; bl = bl+al both stetment are correct
              ; resultent value stored in al  
              
              ; al = 5+2
              ;al = 7 
              ;7=> is decimal convert it into character we add 48
              ;48+7=55
              
    mov dl,al  ;resultent value pass to dl register for output
    add dl,48    ;dl=dl+47   dl = 7+48=>55 on this we have 7
    mov ah,2    ;write(output) Character  
    int 21h  
    
    ; Thank you for watching......
    main endp
ret




