
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Program is to add three numbers 
;using variables and store the result is sum.   

.model small
.stack 100h
.data

a db 4     ;store 3 in variable a
b db 4     ;store 4 in variable b
c db 1     ;store 1 in variable c
sum db ?   ;declare sum variable

.code

main proc
    mov al,a    ;load variable a in al
    mov bl,b    ;load variable b in bl 
    Add al,bl   ;al = al+bl=> al = 3+4 => al=7
    
    mov bl,c    ;load variable c in bl
    Add al,bl   ;al = al+bl=> al = 7+1 => al=8
    
    ;store resultent value in sum
    mov sum,al
    
    ;display sum value on console
    mov dl,sum  ;load sum variable value in dl 
    add dl,48   ;dl=dl+48=> dl = 8+48 => dl = 56
    mov ah,2    ;ah,2 indicates that output a character
    int 21h     ;call service/resource  
    
    ;Full output will be 8 
    
    ;thank you for watching....do comment and subscribe
    
    main endp

ret




