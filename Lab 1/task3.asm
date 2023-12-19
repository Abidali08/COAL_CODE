
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q3) Program is to take input with echo.  

.model small
.stack 100h
.data
.code

main proc
    mov ah,7 ; setting ah to 7 indicates that read character 
    ;from user without echo 
    int 21h ; input service call
    
    ;if you want to show input value then store that value in dl register
    
    ;as you all know input value is store in al register
    
    mov dl,al ; mov input value in dl register
    mov ah,2  ; Ah to 2 indicates that you want to 
    ;write character on screen (ouput)
    int 21h                           
    
    ; thank for watching...
    main endp
ret




