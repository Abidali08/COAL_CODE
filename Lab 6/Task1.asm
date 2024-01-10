
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Write a program to demostrate the following opcode.
;	* JZ
;	* JNE
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
msg db "Both are equal $"
msg1 db "Not equal $"
.code

main proc
    
    mov al,5    ;load 5 in al register
    mov bl,6    ;load 5 in bl register 
    
    ;JNZ => jump if not equal (Zf = 0)
    
    ;JZ => jump if zero it check zf register
    ; it jump on mentioned label if (zf = 1)
    
    cmp al,bl   ;as you all know cmp work on subtract principle
    ;here al = 5 and bl = 5 => al-bl=> 5-5=> 0
    ;if answer is zero then zf flag value will be 1
    ; if subtruction answer is not 0 then zf value will be 0 
    ; 5-6 => 1 here answer is not 0 so zf value will be 0
    
    JZ equal    ;Here equal is a label if zf = 1 it jump
    ; on "equal" label
    
    JNZ notequal    ;Here if al and bl value are not equal
    ;it jum on "notequal" label zf=0
    
    
    ;Here we declare label
    ;skip this part
    equal:
    mov dx,offset msg   ;msg address 
    ;load in dx register for print msg value
    mov ah,9    ;ah into 9 indicates that write(output value)
    ; from D(dx or dl) register
    int 21h ;this instruction call resource/service. 
    
    ;Here we declare that label
    
    notequal:
    mov dx,offset msg1 
    mov ah,9
    int 21h  
    
    ;thank for watching do comment and subscribe 
    
    
    main endp

ret




