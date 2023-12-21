org 100h

;1) Program is to print single character on screen.
;create structure first


.model small
.stack 100h  ;100h memory declare for stack
.data        ;variable and array can be declare here
.code        ;It indicate that the code start from this line

main proc 
    mov bl,50  ;store H character in BL register  
    ;if you want to print number ten you give value above 
    ;then 48=>0,49=>1,50=>2 and so on 
    
    ;Now it print 2
    
    mov dl,bl   ;always remember, if you want to print/output
    ;value of any register,then that value must store in 
    ;DL/DX register .     
    
    mov ah,2    ;2 in ah indicates that write character from 
    ;dl register
    
    int 21h ;it is interrupt, it call service/resource
    ;for this it check the value of ah, if 2 is store in AH
    ;then it interrupt call write(output) service.
    
    ;HERE  
    
    ;Thank you for watching.......
    ;Subscribe and comment
    
    ;Task : Print your name.
    
    ;comment if you have any question regrading this video.
    main endp

ret




