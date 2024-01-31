extern printf
SECTION .text

    add:
        push r8
        push r9
        add r8 ,r9
        pop r9
        push r8
        mov rbx, r8
        push rbx
    
    sub: 
        push r8
        push r9
        sub r8, r9
        pop r9
        push r8
        mov rbx, r8
        push rbx

    exit:
        mov rbx, 0
        mov rax, 1
        int 80h

