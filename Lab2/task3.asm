
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q3 => Write a program to multiply two numbers.   

.model small
.stack 100h
.data
.code

main proc
    mov al,2 ;2 store in al register
    mov bl,14 ;3 store in bl register
    mul bl   ;this statement mean's => al = al x bl
            ;al = 2 x 3 =>result=>6
    AAM        ;Note : Multiply result always store in AX register
            ;see 
            
    mov cl,al    ; store al value in cl =>according to above result '0'
    mov ch,ah     ;store ah value in ch  =>according to above result '2'
    
    mov dl,ch      ;store al value in dl = 2
    add dl,48      ;convert it into character for that add 48+6=54 
    mov ah,2       ; write(output)
    int 21h        ;service call  
    
    
    mov dl,cl      ;store al value in dl = 0
    add dl,48      ;convert it into character for that add 48+6=54 
    mov ah,2       ; write(output)
    int 21h        ;service call
    
    ;what happen if we multiply 2 x 10=>20, output will be in symbol 
    ; 0A is in hex and in dec 10; 14 hax in dec 20   
    ; if you want to print 20 you should use this instruction AAM
    ; AAM => ASCII Adjectment after multiplication   
    
    
    ;task : take 2 values input from user and multiply it.
    
    ;Thank you for watching...do comment if you have any question.
    main endp
ret




