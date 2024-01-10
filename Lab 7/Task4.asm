
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Program is to print capital letter A to Z using Loop.

.model small
.stack 100h
.data
.code

main proc
    
    ;capital letter start from 65. 65 store in any register
    ;you can replace 65 with 'A'
    mov bl,'A'
    
    ;how many upper letter alphabet are there => 26
    ;set 32 in counter register
    
    mov cl,26
    
    l:
        mov dl,bl
        mov ah,2
        int 21h
        inc bl
    loop l 
    main endp

ret




