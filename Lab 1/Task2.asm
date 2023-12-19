
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Program is to take input with echo.

;Create Structure First

.model small
.stack 100h
.data
.code

main proc
    
    mov ah,1  
    ;Moves/store the value 1 in ah register. 
    ;In dos interrupt services,setting ah to 1 indicates that you want
    ; to read a character from standard input from user.
    
    int 21H ; Dos invoke various services. In this case it's used for
    ; reading charcter from keyboard.
               
               
               ;Note: input value will store in al register.
    mov dl,al ;moves the value in the al register into dl register  
    mov ah,2   ;ah,2 indicates that you want to write the character store
    ;in the dl register to the screen.
    int 21h ;call output service
    
    ;Thank you for watching...comment if you have any question.
    
    ;Task : Input your first Name
    main endp
ret




