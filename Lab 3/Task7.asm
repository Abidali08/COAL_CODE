
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Program is to evaluate the following 
;mathematical expression in assembly language.
;aval = -bval+(cval-dval)

;we create 4 variables

.model small
.stack 100h
.data
;declare and initialize varible

aval db ?   ;only declare
bval db 3
cval db 9
dval db 2  

;aval = -bval+(cval-dval) 
;aval = -(3)+(9-2)
;aval = 4

.code

main proc
    
    mov al,cval
    mov bl,dval
    
    sub al,bl   ;cval-dval=> al = al-bl => al = 9-3 => al = 6
    
    ;bval is must be negative 
    neg bval     ;-2
    
    mov bl,bval  ;store -2 in bl register
    
    add bl,al   ;-bl= -bl+al => bl = -2+6 => bl = 4
    
    ;store resultent value in aval
    
    mov aval,bl  ;store 4 in variable aval
    
    ;print resultent value
    
    mov dl,aval ;store value of avel in bl which is 4
    add dl,48   ;convert dec to char
    mov ah,2    ; output function call
    int 21h     ;resource call
    
    ;Thank you for watching do comment and sunscribe
    ; Comment if you any question...
    main endp

ret




