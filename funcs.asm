SECTION .text
    
    slen:
        
        mov rbx, rax

    nextchar:
    
        cmp     byte[rbx], 0 
        jz      finished
        inc     rbx
        jmp     nextchar
    
    finished:
        sub     rax, rbx
        pop     rbx
        ret

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
        syscall
        int     80h
 
        pop     rbx
        pop     rcx
        pop     rdx
        ret

; todo:
    add:
        push r8
        push r9
        add r8 ,r9
        pop r9
        push r8
        mov rax, r8
        call printmsg


    exit:
        mov rbx, 0
        mov rax, 1
        int 80h
 

