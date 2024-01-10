
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Create a menu-driven program in EMU8086 assembly language 
;that allows the user to perform various arithmetic 
;operations, including addition, division, multiplication 
;and subtraction, on two numbers. Ensure that the program 
;gets input from the user. Use jump instructions to navigate 
;the menu and control the flow of the program. Additionally, 
;make sure that the program gracefully 
;handles invalid inputs, such as non-numeric values.

.model small
.stack 100h
.data
option db '1=> addition 2=> subtraction 3=> Division 4=> Multiply : $'
msga db 'Enter value for a : $'
msgb db 'Enter value for b : $'
a db ?  ;declare a variable
b db ?  ;declare b variable 
result db 'Result is : $' ;result store in this variale
r db ?

.code

main proc
    ;data segementation
    mov ax,@data
    mov ds,ax
    
    ;Print option first
    
    lea dx,option
    mov ah,9
    int 21h
    
    ;choice input
    
    mov ah,1
    int 21h
    
    mov cl,al   ;choice value load in cl register
    
    ;here we go to newline
    mov dl,10   ;10=>newline
    mov ah,2
    int 21h  
    
    mov dl,13   ;13=>Carry-return(remove space)
    mov ah,2
    int 21h
    
    ;take two number input from user 
    lea dx,msga
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,48
    
    mov a,al
    
    ;here we go to newline
    mov dl,10   ;10=>newline
    mov ah,2
    int 21h  
    
    mov dl,13   ;13=>Carry-return(remove space)
    mov ah,2
    int 21h
    
    lea dx,msgb
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mov b,al 
    
    cmp cl,'1'
    JZ addition ;if cl==1 then go to addition label 
    
    ;if above condition false check this one
    cmp cl,'2'
    JZ subtraction  ;cl==2 go to subtraction label
    
    ;if above condition false check this one
    cmp cl,'3'
    JZ Division ;cl==3 then go to label Division 
    
    ;if above condition false check this one
    cmp cl,'4'
    JZ Multiply ;cl==4 then go to label Multiply
    
    
    
    ;Here we declare addition lable
    addition:
    ;addition value store in a and b
    
    mov al,a  ;variable a value load in al register
    mov bl,b    ;variable b value load in bl register
    add al,bl   ;al = al+bl resultent value store in al 
    mov r,al    ;addition result store in r variable
    
    ;here we go to newline
    mov dl,10   ;10=>newline
    mov ah,2
    int 21h  
    
    mov dl,13   ;13=>Carry-return(remove space)
    mov ah,2
    int 21h
    
    ;print prompt
    
    lea dx,result 
    mov ah,9
    int 21h
    
    ;print result
    mov dl,r   ;load al value in dl
    add dl,48   ;convert dec to character
    mov ah,2    ;print character 
    int 21h     ;call function 
    
    ;after excute addition code return to window
    .exit 
    
    
    ;Here we declare subtraction label
    subtraction:
    mov al,a
    mov bl,b
    sub al,bl
    mov r,al    ;resultent value store in r variable
    
    ;go to newline
    mov dl,10   ;10=>newline
    mov ah,2
    int 21h  
    
    mov dl,13   ;13=>Carry-return(remove space)
    mov ah,2
    int 21h 
    
    ;print prompt
    
    lea dx,result 
    mov ah,9
    int 21h
    
    ;print result
    mov dl,r   ;load al value in dl
    add dl,48   ;convert dec to character
    mov ah,2    ;print character 
    int 21h     ;call function 
    ;after excute subtraction code return to window
    .exit 
    
    Division:
    mov al,a
    mov ah,0   ;new we access ax
    mov bl,b
    div bl
    
    mov cl,al
    mov ch,ah
    
    ;go to newline
    mov dl,10   ;10=>newline
    mov ah,2
    int 21h  
    
    mov dl,13   ;13=>Carry-return(remove space)
    mov ah,2
    int 21h 
    
    ;print prompt
    
    lea dx,result 
    mov ah,9
    int 21h
    
    ;print result
    ;qoutient
    mov dl,cl   ;load cl value in dl
    add dl,48   ;convert dec to character
    mov ah,2    ;print character 
    int 21h     ;call function
    
    ;remainder
    mov dl,ch   ;load ch value in dl
    add dl,48   ;convert dec to character
    mov ah,2    ;print character 
    int 21h     ;call function  
    ;after excute subtraction code return to window
    .exit 
    
     
     Multiply:
     mov al,a
     mov bl,b
     mul bl
     
     mov r,al
     
     ;go to newline
    mov dl,10   ;10=>newline
    mov ah,2
    int 21h  
    
    mov dl,13   ;13=>Carry-return(remove space)
    mov ah,2
    int 21h 
    
    ;print prompt
    
    lea dx,result 
    mov ah,9
    int 21h
    
    ;print result
    mov dl,r   ;load al value in dl
    add dl,48   ;convert dec to character
    mov ah,2    ;print character 
    int 21h     ;call function 
    ;after excute subtraction code return to window
    .exit 
    
    
    
    ;Thank you for watching...
    ;Do comment if you have any question
    
    
    main endp

ret




