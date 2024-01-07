; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 

SECTION .data
    message: db  "calculator\n", 0Ah
    frstnum: db "1st number: ", 0Ah
    action: db "action(*, /, +, -): ", 0Ah
    sndnum: db "2nd number: ", 0Ah
    resultm: db "result: ", 0Ah

SECTION .bss

input1: resb 10 ; reserve 10 bytes for first number
input2: resb 5 ; reserve 5 bytes for the action
input3: resb 10 ; reserve 10 bytes for the second number
    

SECTION .text

global main

    slen:
        push rbx
        mov rbx, rax
    


    printmsg:

        call    slen
 
        mov     rdx, rax
        pop     rax
 
        mov     rcx, rax
        mov     rbx, 1
        mov     rax, 4
        int     80h
 
        pop     rbx
        pop     rcx
        pop     rdx
    

    main:
        mov rax, message
        jmp printmsg

        mov rbx, 0
        mov rax, 1
        int 80h


;    addition:


 ;   substraction:




