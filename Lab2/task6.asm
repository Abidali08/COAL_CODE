
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q5 => Input two numbers from user and Ssubtraction them.

.model small
.stack 100h
.data
.code

main proc
    mov ah,1    ;write(input)
    int 21h     ;resource/service call for above instruction
    
    mov bl,al   ;input value store in bl
                ; as you all know input value store in AL register
    
    sub bl,48   ;convert character into decimal
    
    neg bl      ; convert positive value into negative
    ;-bl
    
    ; Now I take next value input from user 
    
    mov ah,1    ;write(input)
    int 21h     ;resource/service call for above instruction
    
    mov cl,al   ;input value store in bl
                ; as you all know input value store in AL register  
    
    
    sub cl,48   ;convert character into decimal   
    neg cl         ;convert positive value into negative
    ;-cl
    ;Know subract both input
    
    sub bl,cl   ;bl = (-bl)-(-cl)=>-bl+cl
    mov dl,bl   ;result store in dl for print
    ;add dl,48   ;convert it into char  if value is in negative not need to add
    mov ah,2    ;write(output)
    int 21h     ; service/resource call for above function(ah,2)   
    
    ;Let's see the output
    
    ; what happen if we have following input -5 - 2 
    ; we make value negative using Neg instruction 
    ; Negative value start from   255 represent -1
    ; 254 => -2
    ; 253 => -3 so on to -9  
    
    
    ;Thank you for watching....Do comment and subscribe 
    ; Keep watching..........eduloge*
                      
    main endp
ret




