
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
.code

main proc
    ;now loop excute 5 time 
    mov bx,4    ;load 4 in bx register
    mov cx,5    ;set 5 in counter register
    
    ;label
    
    l1:
      mov dx,cx
      add dx,48 ;convert dec to char
      mov ah,2
      int 21h
      
      cmp bx,5  ;bx==4 => 5==4 => both are not equal so 
      ;zf=>0 now loop excute only once check it
    loopz l1 
    
    ;loope and loopz are same 
    
    
    ;Complete the task and comment...
    ;Thank you for watching
    main endp
ret




