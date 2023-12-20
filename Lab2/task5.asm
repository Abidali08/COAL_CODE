
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Q5 => Input two numbers from user and add them.

.model small
.stack 100h
.data
.code

main proc
    mov ah,1   ;ah into 1 indicates that read character on DOS
    int 21h    ;servive/resource call
               ; as you all know input value always store in al register
    mov bl,al  ; input value store in bl.......
               ;because i want take one more input 
               ;5 is a character so we convert character into decimal
    sub bl,48  ; sub 5 means 53 - 48 = 5   
    
    ;mov dl,bl
    ;add dl,48   ;if you want to print that convert decimal into character
                ;for this you add 48 with output number
   ; mov ah,2
    ;int 21h       
    
    ;same as it is I take another input from user and add   
    
    
    mov ah,1   ;ah into 1 indicates that read character on DOS
    int 21h    ;servive/resource call
               ; as you all know input value always store in al register
    mov cl,al  ;5 is a character so we convert character into decimal 
                ;input value store in cl
    sub cl,48  ; sub 5 means 53 - 48 = 5   
    
    ;mov dl,cl
    ;add dl,48   ;if you want to print that convert decimal into character
                ;for this you add 48 with output number
    ;mov ah,2
    ;int 21h  
    
    ;Now I add both values using add instruction
    
    Add cl,bl ;cl = cl+bl result value store in al
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h 
    
    
    ;Thank you for watching....Do comment is you have any question
    ;Keep watching.....eduloge*
                        
    main endp
ret




