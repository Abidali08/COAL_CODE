
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data 
a db '2','2','3','7','9','8' 
max db '0'
.code
main proc
    mov si,offset a 
    mov cl,6
    repeat: 
    mov al,max
    mov bl,[si]
    cmp al,bl
    jg next
    mov max,bl
    next:
    inc si
    loop repeat 
    
    mov dl,max
    mov ah,2
    int 21h
    main endp
ret          







