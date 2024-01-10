
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;For better understanding watch pervious videos

;Declare and initialize a variable 
;with string data and print the data of variable.

;let start

.model small
.stack 100h
.data
first_name db 'Ali$' ;here we declare vairable with First_name
                    ;and initialized with string data 'Ali'
                    ;at end of string must writer $ it show 
                    ;that indicate that string is terminating.

msg db 'Enter any value : $'
.code

main proc
    
    ;Here we print the value of first_name variable
    ;for this we using ds register
    
    mov ax,@data  ;@data mean's data section 
                  ;store/loads the address of the data
                  ;segment into ax register
    mov ds,ax   ;Sets the data register to the value in
                ;the value int the AX register.
    
    ;Know store the first_name value in dl register
    
    mov dx,offset first_name
    mov ah,9        ;remember ah,2 print only one character
    int 21h                ;at a time so it print only A from 'Ali'
                    ;if we want to print string then 
                    ; we use 9 function it print string 
                    ;also we use 16 register  
                    
                    ;we use offset also  
                    ;we use lea in replace of offset register
    
    lea dx,msg 
    mov ah,9    ;9 function for string output
    int 21h
    
    mov ah,1    ; 1 function can use for input from user
    int 21h
    
    ;Thank you for watching...do commnet and subscribe                
    
    main endp

ret




