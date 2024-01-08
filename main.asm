; Simple calculator made in assembly by nx86
; TODO: addition, multiplication, etc. other calculation and algebra shit 

SECTION .data
    message: db  "calculator", 0Ah
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
    
    main:
        mov rax, message
        call printmsg

        mov rbx, 0
        mov rax, 1
        int 80h

    slen:
        
        push rbx
        mov rbx, rax
        call nextchar

    nextchar:
    
        cmp     byte[rax], 0
        jz      finished
        inc     rax
        jmp     nextchar
    
    finished:
        sub     rax, rbx
        mov     rdx, rax
        mov     rcx, message
        mov     rbx, 1
        mov     rax, 4
        int     80h
 
    printmsg:

        push    rdx
        push    rcx
        push    rbx
        push    rax
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
    

   
;  Todo:  addition:


 ;   TODO: subtraction:




