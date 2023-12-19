
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data 
a db 'Enter your first name range : $'
b db 'Enter your name : $'
.code 

print macro m
    mov dx,offset m
    mov ah,9
    int 21h
    print endm

main proc
    
    print a  
    mov ah,1
    int 21h
    
    sub al,48
    mov cl,al
    call newline 
    print b
    call rev
    main endp
ret          

rev proc
    cmp cl,0
    je back
    mov ah,1
    int 21h

    push ax
    dec cl
    call rev
    
    pop ax
    mov dx,ax
    mov ah,2
    int 21h
        
    back:
    ret
    rev endp 

newline proc 
    mov dl,10
    mov ah,2
    int 21h   
    
    mov dl,13
    mov ah,2
    int 21h
    ret
    newline endp




