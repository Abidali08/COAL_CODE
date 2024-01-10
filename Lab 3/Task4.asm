
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; 5) increment the value of variable. 

.model small
.stack 100h
.data
a db 2
.code

main proc
    
    inc a   ; a = a+1 => a=2+1 => a=3
    
    mov dl,a    ;load value of a in dl for print 
    add dl,48    ;convert dec to characher =>3+48 => 51
    mov ah,2    ;print character
    int 21h     ;call service
    
    main endp

ret




