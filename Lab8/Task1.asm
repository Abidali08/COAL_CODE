
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; declare and initialize an array and 
;print the elements of array using loop. 

.model small
.stack 100h
.data 
;here we declare and initialize our array

a db '7','9','3','9','8','5'
.code

main proc
    mov ax,@data    ;load data variable address in ax
    mov ds,ax       ;Data segementation
    
    ;we use si(source index) as an index or pointer to the 
    ;source data or index of array..
    
    mov si, offset a   ;si point starting index of array (a)
    
    ;;It print first index value
;    mov dx,[si] ;first index value(1) store in dx register
;    mov ah,2    ;print character 
;    int 21h     ;call resource/services 
;    
;    ;If you want to print the second value of array
;    ;then you need to increse the si 
;    
;    inc si  ;now it point second index of array
;    mov dx,[si] ;store second index value(2) in dx register
;    mov ah,2    ;print character 
;    int 21h
;    
;    ;for 3rd value again increase the value of si
;    
;    inc si  ;now it point the 3rd index of array (a)
;    
;    mov dx,[si] ;load 3rd index value(3) in dx register  
;    mov ah,2
;    int 21h  
;    
    ;if we have more then 3 value then we repeat this 
    ;above again and again
    ;Use loop to print array values  
    
    ;there are 6 elements in array so we set 6 value in
    ;counter register                                  
    
    mov cl,6
    
    li:
    
        mov dx,[si]
        mov ah,2
        int 21h
        
        inc si
    
    loop li  
    
    
    ;thank you for watching 
    ;do comment and subscribe...
    
    
    
    main endp

ret




