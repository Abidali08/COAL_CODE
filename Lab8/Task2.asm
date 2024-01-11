
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Write a program to take string 
;input from user and store in array. 


.model small
.stack 100h
.data

;declare an array with size 100
arr1 db 100 dup(?) ;dup=>duplicate
.code 

main proc
    
    ;Data segment
    mov ax,@data
    mov ds,ax
    
    ;initializes the si register with offset/lea
    ;address of the arr1 array 
    
    ;mov si,offset arr1  
    ;or
    lea si,arr1 ;both are correct 
    
    ;initializes the counter register with the value 100
    mov cx,100
    
    li:
        ;input from user
        mov ah,1
        int 21h
        
        ;if user press enter terminate loop
        cmp al,13   ;ASCII 13 carriage retuen
        je exit     ;if al and 13 are equal it jump on exit
                    ;label otherwise it store value in array
                    ;arr1
        mov [si],al
        inc si  ;set second index to store value
    loop li 
    
    exit:
    mov ah,4ch  ;4ch is for terminate 
    int 21h   
    
    ;thank you for watching
    ;do comment and subscribe 
    
    main endp

ret




