
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;Q1=> Declare and initialize 
; a variable and print the data of variable. 

;There are following datatypes in EMU8086
;1=>DB (Define Byte) Size=>8bits/1byte
;2=>dw (Define Word) Size=>16bits/2bytes
;3=>dd (Define double-word) size=>32bits/4bytes
;4=>dq (Define Quad-word) size=>64bits/8bytes

;Always remember we declare variable in data section (.data)
;let start code   
; structure for declare and initialized variable
;=> variable_name datatype value

.model small
.stack 100h
;HERE We declare varible in data section
.data
num db 5   ;Here 5 decimal mean's a sign
           ;Remember in db we store decimal value upto 255 
           ;if we try to store more then 255 then it through 
           ;error
           ;so store decimal value must be less then 255
           ;if variable datatype is db  
.code

main proc 
    
    
    ;let print value of num variable
    
    ;for this we move num value to dl register
    ;everyone know if we want to print value then we store
    ;that value in dl/dx register, we choice dl register 
    ;because over num variable datetpye size is 8bit
    
    mov dl,num 
    add dl,48
    mov ah,2    ;ah into 2 indicates that displaying a char 
    int 21h     ;it call service/function according to 
                ;ah value ah value is to 
                ;so it call write function
    ; if you want to show num then add 48 with dl value
    ;5+48=53  53 in char is 5 
    
    
    ;thank you for watching...do subscribe and comment..
    
    main endp


ret




