
; PRINTING STRING MESSAGES MACRO
printmsg macro msg
    
mov dx,offset msg
mov ah,9
int 21h

  printmsg endm

printvalue macro value
    mov dl, value
    add dl, 48
    mov ah, 2
    int 21h
 printvalue endm
                
                
.model small
.stack 100h

; DATA SEGMENT

.data
   
  input_password     db 'Please enter your password: $'
  password           db 'coal123$'
  incorrect_password db 10,13, 'Incorrect Password! System shutting down$'
  wmsg1              db 10,13,10,13, '---------------------------------------$'
  welcome            db 10,13,10,13, ' WELCOME TO PHARMACY MANAGEMENT SYSTEM $'
  wmsg2              db 10,13,10,13, '---------------------------------------$'

                                                                                                  
  msg1               db 10,13,10,13, 'CHOOSE AN OPTION: $'
  msg2               db 10,13,10,13, 'What do you want to buy? $'

  msg_medicines      db 10,13,10,13, 'Press 1 to BUY ITEMS/MEDICINES$'
  medicines_sold     db 10,13, 'Press 2 to see Medicines Statistics$'
  amount_print       db 10,13,'Press 3 to show Amount Earned Today$'
  input_again        db 10,13, 'Please select the correct option from the given list.$'
  exit_program       db 10,13,'Press 4 to exit$'
  wrong_input        db 10,13, 'Wrong Input!$'
  
  opt1               db 10,13, '1. Panadol   --  Rs. 4 $'
  opt2               db 10,13, '2. Disprin   --  Rs. 3 $'
  opt3               db 10,13, '3. Cleritek  --  Rs. 2 $'
  opt4               db 10,13, '4. Aspirin   --  Rs. 2 $'
  opt5               db 10,13, '5. Brufen    --  Rs. 1 $'
  opt6               db 10,13, '6. Vicks     --  Rs. 5 $'
  opt7               db 10,13, '7. Arinac    --  Rs. 4 $'
  opt8               db 10,13, '8. Sinopharm --  Rs. 2 $'
  opt9               db 10,13, '9. Bandaid   --  Rs. 8 $'
  newLines           db 10,13, '$'
  msg_quantity       db 10,13,10,13, 'Enter Quantity: $'
  total_msg          dw 'Amount Earned = Rs. $'
  amount_earned      db 10,13,'Total Amount earned = Rs. $'

  price_Panadol      dw 4
  price_Disprin      dw 3
  price_Cleritek     dw 2
  price_Aspirin      dw 2
  price_Brufen       dw 1
  price_Vicks        dw 5
  price_Arinac       dw 4
  price_Sinopharm    dw 2
  price_Bandaid      dw 8

  amount             db 0
  Panadol_sold       db 0
  Disprin_sold       db 0
  Cleritek_sold      db 0
  Aspirin_sold       db 0
  Brufen_sold        db 0
  Vicks_sold         db 0
  Arinac_sold        db 0
  Sinopharm_sold     db 0
  Bandaid_sold       db 0
  digit1             db ?
  digit2             db ?
   
  Panadol_print      db 10,13, 'Panadol sold = $'
  Bandaid_print      db 10,13, 'Bandaid sold = $'
  Sinopharm_print    db 10,13, 'Sinopharm Vaccine sold = $'
  Arinac_print       db 10,13, 'Arinac sold = $'
  Vicks_print        db 10,13, 'Vicks sold = $'
  Aspirin_print      db 10,13, 'Aspirin sold = $'
  Brufen_print       db 10,13, 'Brufen sold = $'
  Cleritek_print     db 10,13, 'Cleritek sold = $'
  Disprin_print      db 10,13, 'Disprin sold = $'
  

; CODE SEGMENT  
               
.code

; MAIN FUNCTION

main proc
        
        
                  mov     ax,@data
                  mov     ds,ax

                  printmsg input_password
                  call newline
                  mov     bx,offset password
                  mov     cx,7
    
  l1:             
                  mov     ah,7
                  int     21h
                  cmp     al,[bx]
                  jne     incorrect
                  inc     bx
                  call star
                  loop    l1
                  
                  call CLEAR_SCREEN
    
  start:          
                  
                  
                  call    menu
                  call newline
    
                  mov     ah,1
                  int     21h
    
                  cmp     al,'1'
                  je      menu2
                  cmp     al,'2'
                  je      medicines_stats
                  cmp     al,'3'
                  je      show_amount
                  cmp     al,'4'
                  je      exit
    
                  printmsg wrong_input
                  printmsg input_again
                  jmp     start
     
     
     
  Panadol:        
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h       
                  sub     al,48
        
                  add     Panadol_sold,al
                  mul     price_Panadol
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
                  
                            
                  jmp     start
    
  Disprin:        
    
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Disprin_sold,al
                  mul     price_Disprin
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  jmp     start
        
                              
    
  Cleritek:       
        
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Cleritek_sold,al
                  mul     price_Cleritek
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  jmp     start
        
  Aspirin:        
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Aspirin_sold,al
                  mul     price_Aspirin
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
         
                
                  jmp     start
           
  Brufen:         
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Brufen_sold,al
                  mul     price_Brufen
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
                          
                  jmp     start
        
  Vicks:          
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Vicks_sold,al
                  mul     price_Vicks
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
                            
                  jmp     start
     
  Arinac:         
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Arinac_sold,al
                  mul     price_Arinac
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
                
                  jmp     start
        
  Sinopharm:      
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Sinopharm_sold,al
                  mul     price_Sinopharm
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
                
                  jmp     start
     
  Bandaid:        
         
                  printmsg msg_quantity
            
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  sub     al,48
        
                  add     Bandaid_sold,al
                  mul     price_Bandaid
        
                  add     amount,al
                  mov     cl,al
                  call newline
                  
                  printmsg total_msg
                    
                  mov     ax,0
                  mov     al,cl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
                
                  jmp     start
     
  show_amount:    
        
                  printmsg amount_earned
                  mov     ax,0
                  mov     al,amount
                   
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  jmp     start
        
  incorrect:      
        
                  printmsg incorrect_password
                  jmp     exit
        
  exit:           
                  mov     ah,4ch
                  int     21h
            
main endp

; PROCEDURES SEGMENT


; PROC FOR NEWLINE
newline proc
          mov dl,10
          mov ah,2
          int 21h
    
          mov dl,13
          mov ah,2
          int 21h
          
          ret
newline endp


; MENU PROC TO PRINT THE MENU    
menu proc
                  
                  printmsg wmsg1
                  
                  printmsg welcome
                  
                  printmsg wmsg2
        
                  printmsg msg1
        
                  printmsg msg_medicines
        
                  printmsg medicines_sold
                  
                  printmsg amount_print
                  
                  printmsg exit_program
                  
                  call newline
        
                 
                    
                  ret
          
menu endp


; MENU2 PROC FOR BUYING ITEMS/MEDICINES LIST    
menu2 proc       
                  
                  call CLEAR_SCREEN
        
                  printmsg msg2
                  
                  printmsg opt1
                  
                  printmsg opt2
                  
                  printmsg opt3
                  
                  printmsg opt4
                  
                  printmsg opt5
                  
                  printmsg opt6
                  
                  printmsg opt7
                  
                  printmsg opt8
                  
                  printmsg opt9
                  
        
                  call newline
        
                  mov     ah,1
                  int     21h
        
                  cmp     al,'1'
                  je      Panadol
                  cmp     al,'2'
                  je      Disprin
                  cmp     al,'3'
                  je      Cleritek
                  cmp     al,'4'
                  je      Aspirin
                  cmp     al,'5'
                  je      Brufen
                  cmp     al,'6'
                  je      Vicks
                  cmp     al,'7'
                  je      Arinac
                  cmp     al,'8'
                  je      Sinopharm
                  cmp     al,'9'
                  je      Bandaid
        
                  ret
            
            
menu2 endp


; PROC FOR MEDICINES STATS     
medicines_stats proc
          
                  printmsg Panadol_print
                                            
                  mov     dl,Panadol_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  printmsg Disprin_print
                                 
                  mov     dl,Disprin_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
        
                  printmsg Cleritek_print
                            
                  mov     dl,Cleritek_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  printmsg Aspirin_print
                                
                  mov     dl,Aspirin_sold
                    
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
               
                  printmsg Brufen_print
                              
                  mov     dl,Brufen_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  printmsg Arinac_print
                              
                  mov     dl,Arinac_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  printmsg Bandaid_print
                                  
                  mov     dl,Bandaid_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  printmsg Sinopharm_print
                                  
                  mov     dl,Sinopharm_sold
                  mov     ax,0
                  mov     al,dl
                  AAM
                  mov     digit1,ah
                  mov     digit2,al
                    
                  printvalue digit1
                  printvalue digit2
        
                  jmp     start
        
                  ret
          
medicines_stats endp

               
               
; HELPER PROCS 

; STAR PROC TO HIDE PASSWORD WHILE TYPING
star proc
    mov dl,'*'
    mov ah,2
    int 21h
    ret
    star endp

; CLEAR SCREEN PROC from the emu8086 library              
DEFINE_CLEAR_SCREEN 



; END OF PROJECT


