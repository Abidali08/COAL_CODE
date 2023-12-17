org 100h
.model small
.stack 100h
.data
.code

main proc
    mov dl,5
    add dl,48
    mov ah,2
    int 21h
main endp
end main