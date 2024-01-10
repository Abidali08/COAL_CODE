
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Write a program to demostrate the following opcode.
;	* JZ    Done
;	* JNE   Done
;	* JAE
;	* JBE
;	* JA
;	* JB
;	* JL
;	* JG
;	* JLE
;	* JGE 

.model small
.stack 100h
.data 
msg db "bl is greate then al $"
msg1 db "bl is not greate then al $"
.code

main proc
    
    mov al,7    ;load 5 in al register
    mov bl,6    ;load 5 in bl register 
    
    
    ;JA => jump if above (CF = 0 or zf = 0)
    ;JB => jump if Below (CF = 1) 
    
    cmp bl,al ;you all know cmp work on subtruct principle
    ; bl-al = 6-7=>-1 here zf = 0 then cf=1  know JA  on label above
    JA above ;it not jump on above it check (bl>al), for check this condition
    ;JA check the value of CF and zf value
    ;JA jump on label if zf = 0 OR cf = 0 
    JB below ; here it jump on below label
    ; because 6-7=>-1 if answer is in - then cf = 1
    
    ;Here we declare label
    above:
    mov dx,offset msg
    mov ah,9
    int 21h 
    
    
    ;Here we declare below label
    below: 
    mov dx,offset msg1
    mov ah,9
    int 21h   
    
    
    ;thank you for watching do subscribe and comment
    main endp 
    
    

ret




