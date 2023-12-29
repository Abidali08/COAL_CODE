.model small

.stack 100h

cls	macro			;start macro - (clear screen)
	push	ax
	push	bx
	push	cx
	push	dx
	mov	ah,7		;scroll down function
 	mov	al,0		;0 = entire window
  	mov	cx,0		;0,0 as upper left corner.
	mov	dx,184fh	;24,79 as lower right corner.
	mov	bh,7		;normal attribute
	int	10h		;call bios 
	pop	dx		;restore scratch registers
	pop	cx
	pop	bx
	pop	ax
endm


display macro msg
    
    lea dx, msg
    mov ah, 9
    int 21h 
endm


.data

   
   ;menuOptions dw 10,13,10,13, 'WELCOME TO FALANA LIBRARY',10,13,10,13,'Choose an Option',10,13,10,13,'Press 1 to Login as Admin.',10,13,'Press 2 to Select a book.',10,13,'Press 3 to Return a Book.',10,13,'Press 4 to Give a FeedBack.', 10,13, 'Press 5 to Exit.$'
   menuOptions dw 10,13,10,13, 'WELCOME TO BABU RAO LIBRARY',10,13,' YOUR LITERARY HEAVEN',10,13,10,13,'Choose an Option',10,13,10,13,'Press 1 to Login as Admin.',10,13,'Press 2 to Select a book.',10,13,'Press 3 to Return a Book.',10,13, 'Press 4 to Exit.$'
   
   
   
   booksCodeList dw 'r','t','q','d','z','j','s','a$'
   
   
   
   booksNameList dw 10,13,'1. To Kill a Mockingbird by Harper Lee',10,13,'2. Enders Game by Orsan Scott Card',10,13,'3. Pride and Prejudice by Jane Austen',10,13,'4. One Hundred Years of Solitude by Gabriel Garcia Marquez',10,13,'5. The Great Gatsby by F. Scott Fitzgerald',10,13,'6. War and Peace by Leo Tolstoy',10,13,'7. The Catcher in the Rye by J.D. Salinger',10,13,'8. The Lord of the Rings by J.R.R. Tolkien',10,13,'9. The Republic by Plato',0,'$'
   
   booksAuthorList dw 10,13,'1. Harper Lee',10,13,'2. Orsan Scott Card',10,13,'3. Jane Austen',10,13,'4. Gabriel Garcia Marquez',10,13,'5. F. Scott Fitzgerald',10,13,'6. Leo Tolstoy',10,13,'7. J.D. Salinger$',10,13,'8. J.R.R. Tolkien',10,13,'9.Plato$'    
   
   booksGenreList dw 10,13,'1. Fiction',10,13,'2. Science Fiction',10,13,'3. Romance',10,13,'4. Magical Realism',10,13,'5. Fiction',10,13,'6. Historical Fiction',10,13,'7. Fiction',10,13,'8. Fantasy',10,13,'9. Philosophy$'
   
   booksPriceList dw 10,5,9,14,15,6,17,3
   
   selectABookMenu dw ,10,13,'1. Select by Name.',10,13,'2. Select by Genre.',10,13,'3. Select by Author. $'
   
   optionSelectionMsg db 10,13,10,13, 'Choose an Option$'
   
   enterBooksSNumberMsg db 10,13,'Enter Serial Number of Your Favourite Book. $'
   
   recieptBorrowedBook dw 10,13,'The Code of Books You Borrowed Are: $' 

   input_again db 10,13, 'Please Press one of the above given keys$'
   wrong_input db 10,13, 'Wrong Input$'   
   
   noBooksMsg db 10,13,'Currenlty, no Books Borrowed uptill now!$'
   
   newLine db 10,13, '$'            
   
   msg_howManyBooks db 10,13, 'How many books do you want? $'  
   
   total_msg dw 'Total Bill= $'
   
   totalBooksCounter db 28                                 
    
   borrowedBooksCode dw 0
   

   numberOfBooksToBuy db 0 
   
 
   selectedBooksSNumberSourceIndex dw 0
   
   booksCodeListSI dw 0
   
   borrowedBookCodeSI dw 0
   
   totalBorrowedBookPrice db 0
   
   numberOfBooksToReturn db 10,13,'Enter the number of books you want to return: $'
   enterBookCodeMsg db 10,13,'Enter your book code: $'
   returnedBookCode db 0
   counter db 0
   billMsg db 10, 13, 'Your bill is : $'
   bookFoundMsg db 10, 13, 'Book found successfully!$'
   bookNotFoundMsg db 10, 13, 'Book not found, try again!$' 
   borrowedBookCode dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
   searchBookCodeCounter dw 0
   preservedIndex_1 db 0
   preservedIndex_2 db 0
   
   

   
   input_password db 'Please Enter Your Password: $'
   password db 'golib$'
    
   password1 db 30 dup("$") 
   
   incorrect_password db 10,13, 'Incorrect Password. Enter Password Again.$'
   correct_password_msg db 10,13, 'Correct Password. Access Granted.$'
    
   admin_menu_options dw 10,13,'ADMIN MENU',10,13,'1. Add a book.',10,13,'2. Delete a book.',10,13,'3. Exit.$' 
   
   enterBookNameMsg db 10,13,'1. Enter Book Name: $'
   enterBookAuthorMsg db 10,13,'2. Enter Author Name: $'
   enterBookCodeMsg_1 db 10,13,'3. Enter Book Code Number: $'
   enterBookGenreMsg db 10,13,'4. Enter Book Genre: $'
   
   MAX_BOOKS equ 100   ; Maximum number of books
   booksCount dw 0      ; Counter to keep track of the number of books
   booksArray db 30 dup ('$')
   authorArray db 30 dup ('$')
   genreArray db 30 dup ('$')
   bookName dw ?  
   msg_book_added db 10,13,'Book added successfully! $'
   userInputBuffer dw 20, 0  ; Buffer to store user input, assuming book name is up to 10 characters
   
   enterBookCodeToDeleteMsg db 10,13,'Enter Book Code to Delete: $'
   book_deleted_msg db 10,13,'Book deleted successfully: $'
   book_not_found_msg db 10,13,'Book not found.$'
   bookAddedmsg db 'Name: $'
   authorAddedmsg db 'Author: $'
   genreAddedmsg db 'Genre: $'
   newBooks dw 0 
   bookCodemsg db 'Which code do you want to delete: $'
   adminMenumsg db 10,13,'Please select one option: $'
   continueMsg db 10,13,'Press any key to continue. $'
   

   
   selectedBooksSNumber db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.code

main proc
        
        
    mov ax,@data
    mov ds,ax 
    
    start:
    call menu

    mov dx,offset newLine
    mov ah,9
    int 21h    
    
    mov ah,1
    int 21h
    
    cmp al,'1'
    je loginAsAdmin  
    cmp al,'2'
    je selectABook
    cmp al,'3'
    je returnABook
    cmp al,'4'
;    je giveFeedBack
;    cmp al, '5'
    je exit
    
    mov dx,offset wrong_input
    mov ah,9
    int 21h
    mov dx,offset input_again
    mov ah,9
    int 21h    
    jmp start
     
     
        incorrect:
        
        mov dx,offset incorrect_password
        mov ah,9
        int 21h
        jmp exit
        
        exit:
        mov ah,4ch
        int 21h
            
main endp

   
    menu proc
 
        lea dx, menuOptions
        mov ah, 9
        int 21h
           
        ret
          
    menu endp

    
    

   
; Start of the loginAsAdmin procedure
loginAsAdmin:
    ; Display a new line
    lea dx, newline 
    mov ah, 9
    int 21h 

    ; Initialize variables for password input
    mov si, 0
    mov dx, offset input_password
    mov ah, 9
    int 21h
    
    ; Loop to get password input
l1:
    ; Display '*' for each character entered
    mov ah, 7
    int 21h
    
    ; Check if the entered character is 'Enter' (ASCII 13)
    cmp al, 13
    je check_pass
    
    ; Store the entered character in the password1 array
    mov password1[si], al
    
    ; Display '*' to mask the entered character
    mov dl, 42
    mov ah, 2
    int 21h
    
    ; Move to the next position in the password1 array
    inc si
    
    ; Repeat the loop for the next character
    jmp l1

; Check entered password
check_pass:
    ; Initialize loop counter and index for password comparison
    mov cx, 7
    mov si, 0
    
    ; Loop to compare each character of entered password with the correct password
    check:
    mov bh, password[si]      ; Load character from correct password
    mov bl, password1[si]     ; Load character from entered password
    cmp bl, bh                ; Compare characters
    jne incorrectPassword     ; Jump if characters do not match
    inc si                    ; Move to the next character
    jmp check1                ; Continue checking

; Continue checking password
check1:
    ; Check if all characters have been compared
    cmp cx, si
    je correct_password       ; Jump if all characters match
    
    ; Continue looping to check each character
    loop check

; Correct password routine
correct_password:
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display correct password message
    mov dx, offset correct_password_msg
    mov ah, 9
    int 21h
    
    ; Jump to the admin menu
    jmp adminMenu

; Incorrect password routine
incorrectPassword:
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display incorrect password message
    mov dx, offset incorrect_password
    mov ah, 9
    int 21h
    
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Jump back to get password input again
    jmp l1

; Exit login routine
exit_login:
    ; Exit the program
    mov ah,4ch
    int 21h
    ret


       

    ; adminMenu procedure
adminMenu proc
    ; Display admin menu options
    lea dx, admin_menu_options
    mov ah, 9
    int 21h
    
    ; Display admin menu message
    lea dx, adminMenumsg
    mov ah, 9
    int 21h

    ; Read user input (choice)
    mov ah, 1
    int 21h

    ; Compare user input to determine the chosen option
    cmp al, '1'
    je addBook
    cmp al, '2'
    je deleteBook
    cmp al, '3'
    je adminExit

    ; Display message for wrong input
    mov dx, offset wrong_input
    mov ah, 9
    int 21h
    
    ; Display message to input again
    mov dx, offset input_again
    mov ah, 9
    int 21h
    
    ; Return from adminMenu procedure
    ret


; addBook procedure
addBook:
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h

    ; Display prompt for entering book details
    lea dx, enterBookNameMsg
    mov ah, 9
    int 21h

    ; Initialize BX register to point to the booksArray
    mov bx, offset booksArray

    ; Loop to enter book name
enterBookName:
    ; Read a character from the user
    mov ah, 1
    int 21h

    ; Check if the entered character is 'Enter' (ASCII 13)
    cmp al, 13
    je addAuthor

    ; Store the entered character in the booksArray
    mov [bx], al

    ; Move to the next position in the booksArray
    inc bx

    ; Repeat the loop for the next character
    jmp enterBookName

    
; addAuthor procedure
addAuthor:
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display prompt for entering book author details
    lea dx, enterBookAuthorMsg
    mov ah, 9
    int 21h

    ; Initialize BX register to point to the authorArray
    mov bx, offset authorArray

    ; Loop to enter author name
enterAuthorName:
    ; Read a character from the user
    mov ah, 1
    int 21h

    ; Check if the entered character is 'Enter' (ASCII 13)
    cmp al, 13
    je addGenre

    ; Store the entered character in the authorArray
    mov [bx], al

    ; Move to the next position in the authorArray
    inc bx

    ; Repeat the loop for the next character
    jmp enterAuthorName

    
; addGenre procedure
addGenre:
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display prompt for entering book genre details
    lea dx, enterBookGenreMsg
    mov ah, 9
    int 21h

    ; Initialize BX register to point to the genreArray
    mov bx, offset genreArray

    ; Loop to enter genre name
enterGenreName:
    ; Read a character from the user
    mov ah, 1
    int 21h

    ; Check if the entered character is 'Enter' (ASCII 13)
    cmp al, 13
    je bookAdded

    ; Store the entered character in the genreArray
    mov [bx], al

    ; Move to the next position in the genreArray
    inc bx

    ; Repeat the loop for the next character
    jmp enterGenreName


    
   
    ; bookAdded procedure
bookAdded:
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display message indicating that the book has been added
    mov dx, offset msg_book_added
    mov ah, 9
    int 21h
    
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display additional book added message
    lea dx, bookAddedmsg
    mov ah, 9
    int 21h 
    
    ; Display the contents of the booksArray
    mov dx, offset booksArray
    mov ah, 9
    int 21h
    
    ; Display a new line
    lea dx, newline
    mov ah, 9
    int 21h
    
    ; Display additional author added message
    lea dx, authorAddedmsg
    mov ah, 9
    int 21h
    
    ; Display the contents of the authorArray
    lea dx, authorArray
    mov ah, 9
    int 21h
    
    ; Display a new line
    mov dx, offset newLine
    mov ah, 9
    int 21h
    
    ; Display additional genre added message
    lea dx, genreAddedmsg
    mov ah, 9
    int 21h
    
    ; Display the contents of the genreArray
    lea dx, genreArray  
    mov ah, 9
    int 21h

    ; Jump back to the adminMenu
    jmp adminMenu







   deleteBook:
   ;booksCodeList dw 'r','t','q','d','z','j','s','a$'
   ;resultMsg     db 'Array after deletion: $'


   ; Display input message
   lea dx, newline
   mov ah, 9
   int 21h
   mov ah, 09h
   lea dx, bookCodemsg
   int 21h
   mov bx, offset booksCodeList
   mov cx, 10
   printArray:
   mov dl, [bx]
   cmp dl, '$'
   je skipLoop
   mov ah, 2
   int 21h
   mov dl, ','
   mov ah, 2
   int 21h
   inc bx
   loop printArray
   skipLoop:
   
   lea dx, adminMenumsg
    mov ah, 9
    int 21h

   ; Read user input character
   mov ah, 01h
   int 21h
   mov bl, al   ; Store the character to delete

   ; Delete the character from the array
   lea si,  booksCodeList    ; Source index
   mov di, offset booksCodeList    ; Destination index

deleteLoop:
   cmp byte ptr [si], bl  ; Compare current character with the one to delete
   je  skipCharacter      ; Jump if they match
   mov al, [si]           ; Load the character to AL register
   mov byte ptr [di], al  ; Copy the character to the destination
   inc di                 ; Increment destination index

skipCharacter: 
   inc si                 ; Increment source index
   cmp byte ptr [si], '$' ; Check if end of array is reached
   jne deleteLoop         ; Jump to the next iteration if not
   mov al, [si]
   mov byte ptr [di], al

   ; Display result message
   mov ah, 09h
   lea dx, book_deleted_msg
   int 21h

   ; Display the array after deletion
   mov si, offset booksCodeList    ; Reset source index for the array
   mov cx, 10
displayLoop:
   mov dl, [si] ; Load the character to display
   cmp dl, '$'  ; Check if end of array is reached
   je skipLoop2 ; Continue when end array is reached
   mov ah, 02h  ; Print new array
   int 21h
   inc si
   mov dl, ','
   mov ah, 2
   int 21h
   loop displayLoop
   skipLoop2:
   
   lea dx, continueMsg ;Prompt user to press a key to continue
   mov ah, 9
   int 21h
   mov ah, 1
   int 21h
   cls
   jmp adminMenu       ;Jump back to admin menu when user presses any key

    


    adminExit:
    cls
    jmp start

    ret 
    
    selectABook proc
        
        cls
        
        lea dx, selectABookMenu
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        
        cmp al,'1'
        je booksNameListCall  
        cmp al,'2'
        je booksGenreListCall
        cmp al,'3'
        je booksAuthorListCall
        
        
        lea dx, wrong_input
        mov ah,9
        int 21h
        call selectABook
        
        booksNameListCall:
        lea dx, booksNameList
        mov ah, 9
        int 21h
        lea dx, newline
        mov ah, 9
        int 21h
        lea dx, booksArray
        mov ah, 9
        int 21h
        jmp nowBookSelection
        
        booksGenreListCall:
        lea dx, booksGenreList
        mov ah, 9
        int 21h
        lea dx, newline
        mov ah, 9
        int 21h
        lea dx, genreArray
        mov ah, 9
        int 21h
        jmp nowBookSelection  
        
                           
        booksAuthorListCall:
        lea dx, booksAuthorList
        mov ah, 9
        int 21h
        lea dx, newline
        mov ah, 9
        int 21h
        lea dx, authorArray
        mov ah, 9
        int 21h
        jmp nowBookSelection
        
        
        nowBookSelection:
        lea dx, optionSelectionMsg
        mov ah, 9
        int 21h
        
        lea dx, msg_howManyBooks
        mov ah, 9
        int 21h

        
        mov ah, 1
        int 21h
         
        cmp al, 57
        jg wrongInput
        cmp al, 48
        jle wrongInput
        jmp ifRightOption
        
        wrongInput:
        lea dx, wrong_input
        mov ah,9
        int 21h
        jmp nowBookSelection
        
        ifRightOption:
        
        sub al, 48        
        
        mov numberOfBooksToBuy, al
        
        lea si, selectedBooksSNumber
        
                
        lea dx, enterBooksSNumberMsg 
        mov ah, 9
        int 21h
        
        lea si, selectedBooksSNumber
        
        ;Loop to add books in selectedBooksSNumber
        mov bh, 0
        mov bl, numberOfBooksToBuy 
        mov cx, bx
        books_selection:
        
        mov ah, 1
        int 21h
        
        sub al, '0'
        mov [si], al
        inc si

        
        dec bl
        
        loop books_selection 
        
        ;loop to add code of borrowed books in an array
        
        
        lea si, booksCodeList
        
        mov bh, 0
        mov bl, numberOfBooksToBuy
        mov cx, bx
        addBorrowedBookInArray:
        
            mov si, 0
            lea si, selectedBooksSNumber
            mov dh, 0
             
            add si, searchBookCodeCounter          ;1+0 =1     ;si =1
            
            mov dx, [si]
            mov dh, 0
            
            mov selectedBooksSNumberSourceIndex, dx
            
            mov si, 0
            lea si, booksCodeList
            
            add si, searchBookCodeCounter
            add si, selectedBooksSNumberSourceIndex
            
            mov bx, [si]
            
            cmp bl, 0
            je again
            mov booksCodeListSI, bx
            
            mov si, 0
            lea si, borrowedBookCode
            add si, searchBookCodeCounter
            mov [si], bx
            
            
            mov borrowedBookCodeSI, bx           
            
            inc searchBookCodeCounter
        
          loop addBorrowedBookInArray 
          
          display recieptBorrowedBook 

          lea si, borrowedBookCode
          
          mov cx, searchBookCodeCounter
          showBorrwedBookCode:
          
          mov dx, [si]
          mov dx, dx
          mov ah, 2
          int 21h
          
          mov dx, ','
          mov ah, 2
          int 21h
          
          inc si
          loop showBorrwedBookCode
          
          jmp start
          
          again:
          inc searchBookCodeCounter
          jmp addBorrowedBookInArray
          
        ret 
          
  selectABook endp     
    
     
returnABook proc  
        display numberOfBooksToReturn
        
        mov ah,1
        int 21h
        
        mov ah,0
        sub al,48
        mov counter, al
        
        jmp firstIteration
         
        ifBookNotFound:
        mov cl, counter
        
        firstIteration: 
        
        mov dh, 0
        mov dl, counter
        mov cx, dx
        mov counter, cl
        mov dl,0 
        numberOfReturnedBooksLoop: 
         
        lea si,returnedBookCode
                 
        display enterBookCodeMsg
        
        mov ah,1
        int 21h
        
        lea si, borrowedBookCode
        mov cx,searchBookCodeCounter    
        cmp cx, 0
        je noBooksCurrently
        mov dl,0
        
        loopToSearchIfBookExist: 
       
        mov ah, 0
        mov bh, 0
        mov bx, [si] 
        cmp bx, ax  
        je returned
      
        back: 
        inc si
        
        loop loopToSearchIfBookExist
        
        notReturned:
        display bookNotFoundMsg
        jmp ifBookNotFound
        
        bookfound: 
        mov cl, counter
        dec counter
        loop numberOfReturnedBooksLoop 
        jmp start
        .exit
        
        returned:
        mov [si], 0
        display bookFoundMsg
        ;display billMsg 
        jmp bookfound
         
        noBooksCurrently:
        display noBooksMsg
        jmp start
        
         ret
                        
  returnABook  endp


end main