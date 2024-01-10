
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; 5) program is to decrement the number.
;Program is to store negative number. 

.model small
.stack 100h
.data
a db 7
.code

main proc
    
    dec a   ; a = a-1 => a=7-1 => a=6
    
    mov dl,a    ;load value of a in dl for print 
    add dl,48    ;convert dec to characher =>6+48 => 54
    mov ah,2    ;print character
    int 21h     ;call service 
    
    ; Negative value start from 255=>-1
    ;254=>-2
    ;253=>-3
    ;252=>-4
    ;251=>-5
    ;250=>-6
    ;249=>-7
    ;so on
    
    neg a        ;-7
    
    mov dl,a    ;load value of a in dl for print  
    ;comment add statement
    ;add dl,48    ;convert dec to characher =>6+48 => 54
    mov ah,2    ;print character
    int 21h     ;call service
    
    ;Thank  for watching...do comment and subcribe if you 
    ;have any question.... 
    
    main endp

ret




