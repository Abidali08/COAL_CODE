
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; print #***#***#***#***# using nested loops.

;we using nested loop to complete this implimentation

.model small
.stack 100h
.data
.code

main proc
    
    ;outer loop will iterate 5 time
    mov cx,5
    
    l1:
     
        mov dl,'#'
        mov ah,2
        int 21h
        ;store outer loop value in bx
        mov bx,cx
        ;set counter for inner loop,inner loop
        ;will iterate 3 times 
        mov cx,3 
        
        l2:
            mov dl,'*'
            mov ah,2
            int 21h
         loop l2  
         
         ;return outer loop counter value to cx register
         mov cx,bx
        
    loop l1 
    
    ;Thank you for watching 
    ;Do subscribe and comment
    ;Comment if you have any question....
    main endp

ret




