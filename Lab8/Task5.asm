
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;write a program that converts upper case string 
;into lower case using conditional loop.  

.model small
.stack 100h
.data
msg db 'HELLO EDULOGE$'   ;CONVERT THIS in lower case
;using conditional loop
.code                  

main proc
    ;data segmentation
    mov ax,@data
    mov ds,ax
    
    ;load msg in bx register
    mov bx,offset msg
    
    ;count how many char in string msg
    ;there are 14 char in msg string, set this value in
    ;counter register for loop
    
    mov cx,13
    
    ;label for loop
    
    l1:
        cmp [bx],32 ;32 in char (space)
        je  continue    ;check condition if it space no need
        ;to convert it into lower case 
        
        ;if it not space then convert that char=>lower case
        add [bx],32 ;add 32 with given char it will
        ;convert into=>lc 
        
        
        
        continue:
        ;if it space, or after conversion print char
        mov dx,[bx]
        mov ah,2
        int 21h
        
        inc bx  ;set next index address 
    loop l1
    main endp

;thank you for watching 
;do comment and subscribe



ret




