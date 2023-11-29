; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 

section .data
    message: db  "calculator\n", 0h
    frstnum: db "1st number: ", 0h
    action: db "action(*, /, +, -): ", 0h
    sndnum: db "2nd number: ", 0h
    resultm: db "result: ", 0h
    msglen: equ $-message
section .bss

input1: resb 10 ; reserve 10 bytes for first number
input2: resb 5 ; reserve 5 bytes for the action
input3: resb 10 ; reserve 10 bytes for the second number
    

section .text

    global main

    main:
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, msglen
        syscall


        mov rbx, 0
        mov rax, 1
        int 80h

    question:

                


