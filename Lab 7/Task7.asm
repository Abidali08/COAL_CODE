
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; print right and left triangle using nested loops.

.model small
.stack 100h
.data
count dw 1
space dw 4
.code

main proc
    
    ;right
    mov cx,5
    
    r1:
        mov bx,cx
        mov cx,count
        
        r2:
            mov dl,'*'
            mov ah,2
            int 21h
        loop r2 
        
        mov cx,bx
        inc count
        
        ;newline
        
        mov dl,10   ;newline
        mov ah,2
        int 21h 
        
        mov dl,13   ;carry-return
        mov ah,2
        int 21h
          
    loop r1 
    
    
    ;left
    
    ;new line
    
    mov dl,10   ;newline
        mov ah,2
        int 21h 
        
        mov dl,13   ;carry-return
        mov ah,2
        int 21h
    
    mov cx,5
    mov count,1
    l1:
        mov bx,cx
        mov cx,space
        ;this loop print space
        l2:
            mov dl,32
            mov ah,2
            int 21h
        loop l2 
        
        mov cx,count
        l3:
            mov dl,'*'
            mov ah,2
            int 21h
        loop l3 
        
        mov cx,bx
        inc count
        dec space
        
        ;newline 
        
        mov dl,10   ;newline
        mov ah,2
        int 21h 
        
        mov dl,13   ;carry-return
        mov ah,2
        int 21h
    loop l1  
    
    ;thank you for watching
    ;Do comment if you have any question
    
    ;Complete this take and comment it
    
    
    ;Task =>EMU8086 assembly program prompts the user 
    ;for the height of a right triangle (1-9), validates 
    ;the input, and prints the left triangle and right 
    ;triangle using asterisks. It uses int 21h for input 
    ;and output, a loop to control 
    ;the asterisk count in each row, and 
    ;gracefully terminates after execution.
    
    main endp

ret




