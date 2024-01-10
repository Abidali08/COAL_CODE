
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Demostrate Loop in emu8086.
;for loop count we using counter register(cx or cl)
;if we use cl register, then we iterate 255 time max

.model small
.stack 100h
.data
.code

main proc
    
    mov bl,9 ;load 9 in bl register
    
    ;I want to iterate bl value 5 time
    ;for that we use counter register(cx or cl)
    
    mov cl,5    ;5 into cl indicate that loop iterate 5 times
    
    ;Here declare label, you can take any word as label
    ;here I named "repeat" as label
    
    ;if you want to print every 9 in newline
    ;add this code in loop body
    
    repeat:
    
    mov dl,bl
    add dl,48   ;convert dec to character
    mov ah,2
    int 21h 
    
    mov dl,10   ;newline
    mov ah,2
    int 21h 
    mov dl,13   ;Carry-return
    mov ah,2
    int 21h
    
    loop repeat ;here loop check the flag register
    
    ;thank you for watching do subscribe 
    ;comment if you have any question
    main endp

ret




