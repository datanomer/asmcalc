SECTION .text

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

SECTION .data
    message: db  "calculator", 0Ah
    frstnum: db "1st number: ", 0Ah
    action: db "action(*, /, +, -): ", 0Ah
    sndnum: db "2nd number: ", 0Ah
    resultm: db "result: ", 0Ah

