extern printf
SECTION .text

    exit:
        mov rbx, 0
        mov rax, 1
        int 80h

