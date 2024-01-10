
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;Q8 =>Program is to convert upper case letter into lower case.

.model small
.stack 100h
.data
.code

main proc
    
    ;count the difference b/w upper case to lower case
    ; and add from that value 
    ; so difference is 32
    ;A+32 = 65+32 => 97
    ;B+32 = 66+32 => 98
    ;C+32 = 67+32 => 99
    ;so on
    
    
    ; let create the program
    
    ;Print Upper case letter
    mov al,'T'    ; 41 hex = A and 65 dec = A
    mov dl,al
    mov ah,2
    int 21h
    
    ;convert upper case to lower case 
    add al,32 
    
    ;print lower case letter
    mov dl,al
    mov ah,2
    int 21h
    main endp
ret




