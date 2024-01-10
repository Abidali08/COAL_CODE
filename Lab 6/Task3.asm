
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; write a program to display 'Enter any character : ' take an input from user and display the message informing user what he/she entered.
;	* upper case
;	* lower case
;	* symbol
;	* Number 

;First off all open ascii codes  

.model small
.stack 100h
.data 
msg db 'Enter any character : $'
msgs db 'Special Character $' 
msgu db 'Capital Character $' 
msgl db 'Small Character $'
msgn db 'Number$'
.code

main proc
    ;Display prompt
    mov dx,offset msg
    mov ah,9
    int 21h
    
    ;Here we write input code 
    mov ah,1
    int 21h
    
    ;Apply condition on input value
    cmp al,48
    jb special  ;al<48 jump on special label 
    
    ;if above condition if fail then check this condition
    cmp al,58
    jb number  ;al<58 jump on number label 
    
    ;if al<58 condition is fail then check this condition
    cmp al,65
    jb special ;if al<65 then it jump on special label
    ;special label is already declare 
    ;no need to declare again 
    
    ;if above condition al<65 fail then check this condition
    cmp al,91
    jb capital  ;if al<91 go to capital label
    
    ;if above condition al<91 is false then check this one
    cmp al,97
    jb special  
    ;special label is already declare 
    ;no need to declare again 
    
    ;if above condition al<97 then check this one
    cmp al,122
    jb lower    ;if al<122 go to lower label 
    
    ;if above condition false then check this one
    cmp al,121
    jg special ;if al>121 then go to special label
    ;special label is already declare 
    ;no need to declare again
    
    
    special: 
    ;before print prompt go to newline
    mov dl,10   ;for newline
    mov ah,2
    int 21h   
    
    mov dl,13   ;for Carry-return=>remove space from newline
    mov ah,2
    int 21h  
    
    mov dx,offset msgs
    mov ah,9
    int 21h
    .exit   ;AFTER EXCUTE SPECIAL LABEL CODE RETURN TO WINDOW 
    
    
    number:
    ;before print prompt go to newline
    mov dl,10   ;for newline
    mov ah,2
    int 21h   
    
    mov dl,13   ;for Carry-return=>remove space from newline
    mov ah,2
    int 21h  
    
    mov dx,offset msgn
    mov ah,9
    int 21h 
    .exit   ;after excuting number label code 
    ;return to window 
    
    
    capital:
    ;before print prompt go to newline
    mov dl,10   ;for newline
    mov ah,2
    int 21h   
    
    mov dl,13   ;for Carry-return=>remove space from newline
    mov ah,2
    int 21h  
    
    mov dx,offset msgu
    mov ah,9
    int 21h 
    .exit   ;after excuting number label code 
    ;return to window 
    
    
    ;here we declare lower label
    lower:
    ;before print prompt go to newline
    mov dl,10   ;for newline
    mov ah,2
    int 21h   
    
    mov dl,13   ;for Carry-return=>remove space from newline
    mov ah,2
    int 21h  
    
    mov dx,offset msgl
    mov ah,9
    int 21h 
    .exit   ;after excuting number label code 
    ;return to window  
    
    
    ;Do subscribe and comment
    ;if you have any question do comment.
    ;Thank you for watching.....
    main endp

ret




