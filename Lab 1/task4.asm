
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q6) Program is to print your name on screen. 

.model small
.stack 100h
.data
.code

main proc
    ;Name :  Ali
    
    ;This code is for only on character 
    ;mov ah,7  ;ah,1 indicates->read character without echo from user
    ;int 21h    ; provide input service
    
    mov dl,'A'   ;input value 'A' in dl for print
    mov ah,2    ; ah,2 indicates that->write(output)->characher
    int 21h     ; write service      
    
    ;For sceond char
    ;mov ah,7  ;ah,1 indicates->read character from user
    ;int 21h    ; provide input service
    
    mov dl,'L'   ;input value 'L' in dl for print
    mov ah,2    ; ah,2 indicates that->write(output)->characher
    int 21h     ; write service  
    
    ;for third char
    ;mov ah,7  ;ah,1 indicates->read character from user
    ;int 21h    ; provide input service
    
    mov dl,'I'   ;input value I in dl for print
    mov ah,2    ; ah,2 indicates that->write(output)->characher
    int 21h     ; write service 
    
    
    ;Thank you for watching.....Comment.... if you have any question
    
    
    
    
    
    main endp
ret




