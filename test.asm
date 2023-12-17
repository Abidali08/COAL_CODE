org 100h

.model small
.stack 100h
.data
arr db 1,2,3,4,5
result db ?
.code



main proc
    mov bx,5
    mov al,0
    mov si,offset arr
    call sum_arr
    AAA
    mov ch,ah
    mov cl,al

    mov dl,ch
    add dl,48
    mov ah,2
    int 21h

    mov dl,cl
    add dl,48
    mov ah,2
    int 21h

    main endp
    end main
ret

sum_arr proc

    cmp bx,0
    je back
    mov cl,[si]
    add al,cl
    dec bx
    inc si
    call sum_arr

    back: ret
    sum_arr endp